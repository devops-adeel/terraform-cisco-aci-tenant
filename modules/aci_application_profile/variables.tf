variable "name" {
  type = string
  description = "Application Profile name"
}

variable "tenant-id" {
  type = string
  description = "Parent Tenant ID"
}

variable "global" {
  type = map
  description = "Cisco ACI Global Variables"
}

output "id" {
  value       = aci_application_profile.default.id
  description = "Application Profile ID"
}

output "name" {
  value       = aci_application_profile.default.name
  description = "Application Profile Name"
}

output "tenant-id" {
  value       = substr(aci_application_profile.default.tenant_dn,7,100)
  description = "Parent Tenant Name"  
}
