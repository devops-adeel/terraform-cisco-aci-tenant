variable "name" {
  type = string
}

variable "global" {
  type = map
}

output "id" {
  value       = aci_vmm_domain.default.id
}
