variable "epg" {
  type = string
  description = "Application EPG name"
}

variable "vmm" {
  type = string
  description = "Parent VMM name"
}

variable "global" {
  type = map
  description = "Cisco ACI Global Variables"
}
