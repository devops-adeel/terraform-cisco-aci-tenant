variable "name" {
  type = string
  description = "VRF Name"
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
  value       = aci_vrf.default.id
  description = "VRF ID"
}

output "name" {
  value       = aci_vrf.default.name
  description = "VRF Name"
}

output "tenant-id" {
  value       = substr(aci_vrf.default.tenant_dn,7,100)
  description = "Parent Tenant Name"
}
