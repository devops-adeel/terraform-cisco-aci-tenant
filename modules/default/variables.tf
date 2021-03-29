variable "global" {
  type = map
  description = "Cisco ACI Global Variables"
}

output "id" {
  value = module.aci_tenant.id
  description = "Parent Tenant ID"
}
