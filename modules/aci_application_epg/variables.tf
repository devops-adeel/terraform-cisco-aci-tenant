variable "name" {
  type = string
}

variable "global" {
  type = map
}

variable "ap" {
  type = string
}

variable "bd" {
  type = string
}

output "id" {
  value       = aci_application_epg.default.id
}
