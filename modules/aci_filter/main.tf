resource "aci_filter" "default" {
	tenant_dn = var.tenant-id
	name      = "${var.name}-${var.global.env}"
}
