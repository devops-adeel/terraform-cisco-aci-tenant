resource "aci_contract_subject" "default" {
	contract_dn                  = var.contract
	name                         = "${var.name}-${var.global.env}"
	relation_vz_rs_subj_filt_att = [var.filter]
}
