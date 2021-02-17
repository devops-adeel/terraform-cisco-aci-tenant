locals {
  name = format("%s-%s", var.env, var.application_name)
}

resource "aci_tenant" "default" {
  name        = local.name
  name_alias  = local.name
  description = "This tenant is created ${local.name}"
}

resource "aci_vrf" "default" {
  tenant_dn  = aci_tenant.default.id
  name       = local.name
  name_alias = local.name
}

resource "aci_bridge_domain" "default" {
  tenant_dn          = aci_tenant.default.id
  name               = local.name
  description        = "This bridge-domain is created for ${local.name}"
  relation_fv_rs_ctx = aci_vrf.default.name
}

resource "aci_subnet" "default" {
  bridge_domain_dn = aci_bridge_domain.default.id
  ip               = var.aci_subnet
  scope            = "private"
  description      = "This subject is created for ${local.name}"
}

resource "aci_application_profile" "default" {
  tenant_dn  = aci_tenant.default.id
  name       = local.name
  name_alias = local.name
  prio       = "level1"
}
