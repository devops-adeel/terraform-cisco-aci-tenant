variable "name" {
  type = string
}

output "tenant-id" {
  value       = aci_tenant.showcase_dc.id
}
