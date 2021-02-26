variable "name" {
  type = string
}

output "id" {
  value       = aci_tenant.default.id
}
