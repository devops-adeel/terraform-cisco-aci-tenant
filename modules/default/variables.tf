variable "global" {
  type = map
}

output "id" {
  value = module.aci_tenant.id
}
