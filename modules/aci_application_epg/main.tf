resource "aci_application_epg" "default" {
  application_profile_dn  = var.ap
  name = "${var.name}-${var.global.env}"
  relation_fv_rs_bd = var.bd
  #relation_fv_rs_cons = [data.aci_contract.inet.id,aci_contract.asav-int-to-showcase-cn.id]
}
