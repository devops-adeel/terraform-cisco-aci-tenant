locals {
  application_name = "terraform-modules-development-aci"
  env              = "prod"
}

module "default" {
  source           = "./module"
  application_name = local.application_name
  env              = local.env
}
