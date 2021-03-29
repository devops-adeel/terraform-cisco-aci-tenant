variable "name" {
  type = string
  description = "Bridge Domain Name"
}

variable "vrf" {
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
  value       = aci_bridge_domain.default.id
  description = "Bridge Domain ID"
}

output "name" {
  value       = aci_bridge_domain.default.name
  description = "Bridge Domain Name"
}

output "tenant-id" {
  value       = substr(aci_bridge_domain.default.tenant_dn,7,100)
  description = "Parent Tenant Name"
}
