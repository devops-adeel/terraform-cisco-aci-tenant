variable "name" {
  type = string
  description = "Application EPG name"
}

variable "global" {
  type = map
  description = "Cisco ACI Global Variables"
}

variable "ap" {
  type = string
  description = "Parent Application Profile Name"
}

variable "bd" {
  type = string
  description = "Parent Bridge Domain Name"
}

output "id" {
  value       = aci_application_epg.default.id
  description = "Application EPG ID"
}

output "name" {
  value       = aci_application_epg.default.name
  description = "Application EPG Name"
}

output "ap" {
  value       = trimprefix(regex(".*/(.*)",aci_application_epg.default.application_profile_dn)[0], "ap-")
  description = "Parent Application Profile Name"
}

output "tenant-id" {
  value       = regex("(.*)/.*",substr(aci_application_epg.default.application_profile_dn,7,100))[0]
  description = "Parent Tenant Name"    
}
