resource "aci_vmm_domain" "default" {
	provider_profile_dn = "uni/vmmp-VMware"
	name                = var.name
}
