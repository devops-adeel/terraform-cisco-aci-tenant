resource "aci_tenant" "default" {
  name = var.name
}
output "tenant_name" {
    description = "Public IP addresses of created redirectors"
    value = aci_tenant.default.name
}
