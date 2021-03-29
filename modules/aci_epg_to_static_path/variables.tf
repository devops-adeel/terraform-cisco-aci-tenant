variable "epg" {
  type = string
  description = "Application EPG name"
}

variable "tdn" {
  type = string
  description = "Topology DN"
}

variable "encap" {
  type = string
  description = "Encapsulation"
}

variable "global" {
  type = map
  description = "Cisco ACI Global Variables"
}
