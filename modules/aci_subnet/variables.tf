variable "bd" {
  type = string
  description = "Parent Bridge Domain Name"
}

variable "subnet" {
  type = string
  description = "Subnet in format x.x.x.x/y"
}

variable "global" {
  type = map
  description = "Cisco ACI Global Variables"
}
