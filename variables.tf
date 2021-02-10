variable "application_name" {
  description = "Name of the application/customer"
  type        = string
}

variable "env" {
  description = "The environment name the identity principal will operate in"
  type        = string
  default     = "dev"
}
