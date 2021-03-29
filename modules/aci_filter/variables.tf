variable "name" {
  type = string
  description = "Filter name"
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
  value       = aci_filter.default.id
  description = "Filter ID"
}

output "name" {
  value       = aci_filter.default.name
  description = "Filter Name"
}

output "tenant-id" {
  value       = substr(aci_filter.default.tenant_dn,7,100)
  description = "Parent Tenant Name"
}
