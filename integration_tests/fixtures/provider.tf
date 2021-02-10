terraform {
  required_providers {
    vault = {
      source = "hashicorp/vault"
    }
  }
  backend "remote" {
    organization = "hc-implementation-services"

    workspaces {
      name = "terraform-cisco-aci-tenant"
    }
  }
}

variable "approle_id" {}
variable "approle_secret" {}

variable "password" {
  sensitive = true
}

provider "vault" {
  auth_login {
    namespace = "admin/terraform-cisco-aci-tenant"
    path      = "auth/approle/login"

    parameters = {
      role_id   = var.approle_id
      secret_id = var.approle_secret
    }
  }
}

provider "aci" {
  username = "admin"
  password = var.password
  url      = "https://my-cisco-aci.com"
}
