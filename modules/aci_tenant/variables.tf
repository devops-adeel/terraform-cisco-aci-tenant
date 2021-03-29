variable "name" {
  type = string
  description = "Tenant Name"
}

output "id" {
  value       = aci_tenant.default.id
  description = "Tenant ID"
}
