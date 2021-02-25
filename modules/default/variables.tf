variable "global" {
  type = map
}

output "tenant-id" {
  value = module.aci_tenant.tenant-id
}
