variable "name" {
  type = string
}

variable "vrf" {
  type = string
}

variable "tenant-id" {
  type = string
}

variable "global" {
  type = map
}

output "id" {
  value       = aci_bridge_domain.default.id
}
