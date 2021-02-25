resource "aci_vrf" "aci_vrf" {
  tenant_dn = var.tenant-id
  name = "${var.name}-${var.global.env}"
}
