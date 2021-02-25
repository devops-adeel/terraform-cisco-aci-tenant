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
  tenant-id = module.default.tenant-id
}

module "aci_vrf-2" {
  source = "../../modules/aci_vrf"
  global = local.config
  name = "aci_vrf-2"
  tenant-id = module.default.tenant-id
}

# resource "aci_bridge_domain" "default" {
#   tenant_dn          = aci_tenant.default.id
#   name               = local.name
#   description        = "This bridge-domain is created for ${local.name}"
#   relation_fv_rs_ctx = aci_vrf.default.name
# }
#
# resource "aci_subnet" "default" {
#   bridge_domain_dn = aci_bridge_domain.default.id
#   ip               = var.aci_subnet
#   scope            = "private"
#   description      = "This subject is created for ${local.name}"
# }
#
# resource "aci_application_profile" "default" {
#   tenant_dn  = aci_tenant.default.id
#   name       = local.name
#   name_alias = local.name
#   prio       = "level1"
# }
