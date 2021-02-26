resource "aci_application_profile" "default" {
  tenant_dn  = var.tenant-id
  name = "${var.name}-${var.global.env}"
  prio       = "level1"
}
