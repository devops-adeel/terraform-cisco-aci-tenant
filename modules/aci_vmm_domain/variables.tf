variable "name" {
  type = string
  description = "VMM Domain Name"
}

variable "global" {
  type = map
  description = "Cisco ACI Global Variables"
}

output "id" {
  value       = aci_vmm_domain.default.id
  description = "VMM Domain ID"
}
