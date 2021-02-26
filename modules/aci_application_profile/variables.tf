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
  value       = aci_application_profile.default.id
}
