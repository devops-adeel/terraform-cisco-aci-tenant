variable "name" {
  type = string
}

variable "global" {
  type = map
}

output "id" {
  value       = aci_vlan_pool.default.id
}
