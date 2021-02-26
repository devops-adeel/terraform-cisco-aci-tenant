resource "aci_subnet" "default" {
  parent_dn = var.bd
  ip               = var.subnet
  scope            = ["shared"]
}
