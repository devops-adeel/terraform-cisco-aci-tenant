resource "aci_bridge_domain" "default" {
  tenant_dn = var.tenant-id
  name = "${var.name}-${var.global.env}"
  relation_fv_rs_ctx = var.vrf
}
