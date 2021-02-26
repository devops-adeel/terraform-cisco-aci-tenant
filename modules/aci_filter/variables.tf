variable "name" {
  type = string
}

variable "tenant-id" {
  type = string
}

variable "global" {
  type = map
}

output "id" {
  value       = aci_filter.default.id
}
