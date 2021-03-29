variable "name" {
  type = string
  description = "Contract Name"
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
  value       = aci_contract.default.id
  description = "Contract ID"
}

output "name" {
  value       = aci_contract.default.name
  description = "Contract Name"
}

output "tenant-id" {
  value       = substr(aci_contract.default.tenant_dn,7,100)
  description = "Parent Tenant Name"
}
