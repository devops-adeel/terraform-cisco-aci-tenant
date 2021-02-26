variable "USERNAME" {}
variable "PASSWORD" {}
variable "URL" {}

locals {
  config = {
    client = "tf-test-client"
    env = "prod"
  }
}


provider "aci" {
   # cisco-aci user name
   username = var.USERNAME
   # cisco-aci password
   password = var.PASSWORD
   # cisco-aci url
   url = var.URL
   insecure = true
}

module "default" {
  source = "../../modules/default"
  global = local.config
}

module "aci_vrf-1" {
  source = "../../modules/aci_vrf"
  global = local.config
  name = "aci_vrf-1"
  tenant-id = module.default.id
}

module "aci_vrf-2" {
  source = "../../modules/aci_vrf"
  global = local.config
  name = "aci_vrf-2"
  tenant-id = module.default.id
}

module "aci_bd-1" {
  source = "../../modules/aci_bridge_domain"
  global = local.config
  name = "aci_bd-1"
  tenant-id = module.default.id
  vrf = module.aci_vrf-1.id
}

module "aci_bd-2" {
  source = "../../modules/aci_bridge_domain"
  global = local.config
  name = "aci_bd-2"
  tenant-id = module.default.id
  vrf = module.aci_vrf-2.id
}

module "aci_subnet-1" {
  source = "../../modules/aci_subnet"
  global = local.config
  subnet = "10.2.16.129/26"
  bd = module.aci_bd-1.id
}

module "aci_subnet-2" {
  source = "../../modules/aci_subnet"
  global = local.config
  subnet = "10.2.17.129/26"
  bd = module.aci_bd-2.id
}

module "aci_ap-1" {
  source = "../../modules/aci_application_profile"
  global = local.config
  name = "aci_ap-1"
  tenant-id = module.default.id
}

module "aci_ap-2" {
  source = "../../modules/aci_application_profile"
  global = local.config
  name = "aci_ap-2"
  tenant-id = module.default.id
}

module "aci_epg-1" {
  source = "../../modules/aci_application_epg"
  global = local.config
  name = "aci_epg-1"
  ap = module.aci_ap-1.id
  bd = module.aci_bd-1.id
}

module "aci_vmm-1" {
  source = "../../modules/aci_vmm_domain"
  global = local.config
  name = "tf-vds"
}

module "aci_epg_to_domain-1" {
  source = "../../modules/aci_epg_to_domain"
  global = local.config
  epg = module.aci_epg-1.id
  vmm = module.aci_vmm-1.id
}

module "aci_epg_to_static-path-1" {
  source = "../../modules/aci_epg_to_static_path"
  global = local.config
  epg = module.aci_epg-1.id
  tdn  = "topology/pod-1/paths-101/pathep-[eth1/3]"
  encap  = "vlan-2000"
}

module "aci_vlan_pool-1" {
  source = "../../modules/aci_vlan_pool"
  global = local.config
  name = "tf-vlan-pool"
}

module "aci_filter-1" {
  source = "../../modules/aci_filter"
  global = local.config
  name = "tf-filter-1"
  tenant-id = module.default.id
}

module "aci_contract-1" {
  source = "../../modules/aci_contract"
  global = local.config
  name = "aci_contract-1"
  tenant-id = module.default.id
}

module "aci_contract_subject-1" {
  source = "../../modules/aci_contract_subject"
  global = local.config
  name = "tf-contract-subject"
  contract = module.aci_contract-1.id
  filter = module.aci_filter-1.id
}

module "aci_filter_entry-1" {
  source = "../../modules/aci_filter_entry"
  global = local.config
  name = "tf-entry-1"
  type = "ip"
  protocol = "icmp"
  stateful = "yes"
  filter = module.aci_filter-1.id
}
