variable "name" {
  type = string
  description = "VLAN Pool Name"
}

variable "global" {
  type = map
  description = "Cisco ACI Global Variables"
}

output "id" {
  value       = aci_vlan_pool.default.id
  description = "VLAN Pool ID"
}
