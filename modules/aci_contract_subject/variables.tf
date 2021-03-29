variable "name" {
  type = string
  description = "Subject Name"
}

variable "contract" {
  type = string
  description = "Parent Contract Name"
}

variable "filter" {
  type = string
  description = "Filter Name"
}

variable "global" {
  type = map
  description = "Cisco ACI Global Variables"
}

output "name" {
  value       = aci_contract_subject.default.name
  description = "Subject Name"
}

output "tenant-id" {
  value       = trimprefix(regex(".*/(.*)",regex("(.*)/.*",aci_contract_subject.default.contract_dn)[0])[0],"tn-")
  description = "Parent Tenant Name"
}

output "contract" {
  value       = trimprefix(regex(".*/(.*)",aci_contract_subject.default.contract_dn)[0], "brc-")
  description = "Parent Contract Name"
}
