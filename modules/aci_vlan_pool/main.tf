resource "aci_vlan_pool" "default" {
  name  = "${var.name}-${var.global.env}"
  alloc_mode  = "dynamic"
}
