resource "aci_epg_to_static_path" "default" {
  application_epg_dn  = var.epg
  tdn  = var.tdn
  encap  = var.encap
  # mode  = "regular"
}
