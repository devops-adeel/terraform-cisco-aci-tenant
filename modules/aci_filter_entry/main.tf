resource "aci_filter_entry" "default" {
  name        = "${var.name}-${var.global.env}"
  filter_dn   = var.filter
  ether_t     = var.type
  prot        = var.protocol
  stateful    = var.stateful
}
