variable "ACI_USERNAME" {}
variable "ACI_PASSWORD" {}
variable "ACI_URL" {}

locals {
  config = {
    client = "integration-test"
    env = "prod"
  }
}


provider "aci" {
   # cisco-aci user name
   username = var.ACI_USERNAME
   # cisco-aci password
   password = var.ACI_PASSWORD
   # cisco-aci url
   url = var.ACI_URL
   insecure = true
}

module "default" {
  source = "../../modules/default"
  global = local.config
}

module "aci_vmm" {
  source = "../../modules/aci_vmm_domain"
  global = local.config
  for_each =  var.vmm
  name = each.value.name
  depends_on = [module.default]
}

module "aci_ap" {
  source = "../../modules/aci_application_profile"
  global = local.config
  for_each =  var.ap
  name = each.value.name
  tenant-id = each.value.tenant
  depends_on = [module.default]
}

module "aci_vrf" {
  source = "../../modules/aci_vrf"
  global = local.config
  for_each =  var.vrf
  name = each.value.name
  tenant-id = each.value.tenant
  depends_on = [module.aci_ap]
}

module "aci_bd" {
  source = "../../modules/aci_bridge_domain"
  global = local.config
  for_each =  var.bd
  name = each.value.name
  tenant-id = each.value.tenant
  vrf = module.aci_vrf["VRF1"].id
  depends_on = [module.aci_vrf,module.aci_ap]
}

module "aci_subnet" {
  source = "../../modules/aci_subnet"
  global = local.config
  for_each =  var.subnet
  subnet = each.value.subnet
  bd = module.aci_bd[each.value.bd].id
  depends_on = [module.aci_bd,module.aci_ap]
}

module "aci_epg" {
  source = "../../modules/aci_application_epg"
  global = local.config
  for_each =  var.epg
  name = each.value.name
  ap = module.aci_ap[each.value.ap].id
  bd = module.aci_bd[each.value.bd].id
  depends_on = [module.aci_bd, module.aci_ap]
}

module "aci_contract" {
  source = "../../modules/aci_contract"
  global = local.config
  for_each =  var.contracts
  name = each.value.name
  tenant-id = each.value.tenant
  depends_on = [module.aci_bd, module.aci_ap]
}

module "aci_vlan_pool" {
  source = "../../modules/aci_vlan_pool"
  global = local.config
  for_each =  var.vlan_pool
  name = each.value.name
  depends_on = [module.default]
}

module "aci_filter" {
  source = "../../modules/aci_filter"
  global = local.config
  for_each =  var.filter
  name = each.value.name
  tenant-id = each.value.tenant
  depends_on = [module.default]
}

module "aci_contract_subject" {
  source = "../../modules/aci_contract_subject"
  global = local.config
  for_each =  var.aci_contract_subject
  name = each.value.name
  contract = module.aci_contract[each.value.contract].id
  filter = module.aci_filter[each.value.filter].id
  depends_on = [module.aci_filter, module.aci_contract,module.aci_ap]
}

module "aci_filter_entry" {
  source = "../../modules/aci_filter_entry"
  global = local.config
  for_each =  var.aci_filter_entry
  name = each.value.name
  type = each.value.type
  protocol = each.value.protocol
  stateful = each.value.stateful
  filter = module.aci_filter[each.value.filter].id
  depends_on = [module.aci_filter, module.aci_contract,module.aci_ap]
}

module "aci_epg_to_domain" {
  source = "../../modules/aci_epg_to_domain"
  global = local.config
  for_each =  var.aci_epg_to_domain
  epg = module.aci_epg[each.value.epg].id
  vmm = module.aci_vmm[each.value.vmm].id
  depends_on = [module.aci_epg, module.aci_vmm]
}

module "aci_epg_to_static-path" {
  source = "../../modules/aci_epg_to_static_path"
  global = local.config
  for_each =  var.aci_epg_to_static-path
  epg = module.aci_epg[each.value.epg].id
  tdn  = each.value.tdn
  encap  = each.value.encap
  depends_on = [module.aci_epg]

}

output "aci_contract-names" {
    value = tomap({for k, contract in module.aci_contract : k => contract.name})
}
output "aci_contract-tenants" {
    value = tomap({for k, contract in module.aci_contract : k => contract.tenant-id})
}

output "aci_vrf-names" {
    value = tomap({for k, vrf in module.aci_vrf : k => vrf.name})
}
output "aci_vrf-tenants" {
    value = tomap({for k, vrf in module.aci_vrf : k => vrf.tenant-id})
}

output "aci_bd-names" {
    value = tomap({for k, bd in module.aci_bd : k => bd.name})
}
output "aci_bd-tenants" {
    value = tomap({for k, bd in module.aci_bd : k => bd.tenant-id})
}

output "aci_epg-names" {
    value = tomap({for k, epg in module.aci_epg : k => epg.name})
}
output "aci_epg-ap" {
    value = tomap({for k, epg in module.aci_epg : k => epg.ap})
}
output "aci_epg-tenant" {
    value = tomap({for k, epg in module.aci_epg : k => epg.tenant-id})
}

output "aci_filter_entry-names" {
    value = tomap({for k, filter_entry in module.aci_filter_entry : k => filter_entry.name})
}
output "aci_filter_entry-tenants" {
    value = tomap({for k, filter_entry in module.aci_filter_entry : k => filter_entry.tenant-id})
}
output "aci_filter_entry-filter" {
    value = tomap({for k, filter_entry in module.aci_filter_entry : k => filter_entry.filter-name})
}

output "aci_filter-names" {
    value = tomap({for k, filter in module.aci_filter : k => filter.name})
}
output "aci_filter-tenants" {
    value = tomap({for k, filter in module.aci_filter : k => filter.tenant-id})
}

output "aci_contract_subject-names" {
    value = tomap({for k, subject in module.aci_contract_subject : k => subject.name})
}
output "aci_contract_subject-tenants" {
    value = tomap({for k, subject in module.aci_contract_subject : k => subject.tenant-id})
}
output "aci_contract_subject-contract" {
    value = tomap({for k, subject in module.aci_contract_subject : k => subject.contract})
}
