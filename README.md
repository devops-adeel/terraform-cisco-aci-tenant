## Terraform Cisco ACI Tenant

This terraform module creates....

## Status

## Requirements

<! ADD PRE-REQUISITES HERE>

## Providers

| Name | Version |
|------|---------|
| `provider` | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| `example_input` | example description | `string` | n/a | yes |
| `env` | The environment name the identity principal will operate in | `string` | `"dev"` | no |

## Outputs

| Name | Description |
|------|-------------|
| `example_output` | example description |


# Logical Requirement

The intent of this TF module is to produce a tenant scoped per service, per
application, per environment.

It assumes that the foundational objects are in place and this module is to
scale onboarding of application services.  Ideally triggered by a creation of a
service definition (i.e. service-mesh registered in service-registry e.g. consul)

Each service-definition will produce the following resources:

| Name                      | Description                                          |
| ------                    | -------------                                        |
| `aci_tenant`              | Description of function & why it's required per svc. |
| `aci_vrf`                 | Description of function & why it's required per svc. |
| `aci_bridge_domain`       | Description of function & why it's required per svc. |
| `aci_subnet`              | Description of function & why it's required per svc. |
| `aci_application_profile` | Description of function & why it's required per svc. |
