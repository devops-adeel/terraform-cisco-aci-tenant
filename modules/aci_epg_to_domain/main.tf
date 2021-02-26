resource "aci_epg_to_domain" "default" {
  application_epg_dn    = var.epg
  tdn                   = var.vmm
}
