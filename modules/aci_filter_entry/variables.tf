variable "name" {
  type = string
  description = "Entry Name"
}

variable "filter" {
  type = string
  description = "Parent Filter Name"
}

variable "type" {
  type = string
  description = "Ethernet Type"
}

variable "protocol" {
  type = string
  description = "IP Protocol Type"
}

variable "stateful" {
  type = string
  description = "Stateful entry"
}

variable "global" {
  type = map
  description = "Cisco ACI Global Variables"
}

output "name" {
  value       = aci_filter_entry.default.name
  description = "Entry Name"
}

output "tenant-id" {
  value       = regex("(.*)/.*",substr(aci_filter_entry.default.filter_dn,7,100))[0]
  description = "Parent Tenant Name"
}

output "filter-name" {
  value       = trimprefix(regex(".*/(.*)",aci_filter_entry.default.filter_dn)[0], "flt-")
  description = "Parent Filter Name"
}
