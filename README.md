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

| Name            | Description                                                 | Type     | Default   | Required   |
| ------          | -------------                                               | ------   | --------- | :--------: |
| `example_input` | example description                                         | `string` | n/a       | yes        |
| `env`           | The environment name the identity principal will operate in | `string` | `"dev"`   | no         |

## Outputs

| Name             | Description         |
| ------           | -------------       |
| `example_output` | example description |


# Logical Requirement

The intent of this TF module is to produce a tenant scoped per customer, the
customer will then have multiple applications and environments in the form of
EPG.

It assumes that the foundational objects are in place and this module is to
scale onboarding of application services.  Ideally triggered by a creation of a
service definition (i.e. service-mesh registered in service-registry e.g. consul)

To understand which resources are per customer and which are per application,
resources will be listed here with `type` column to indicate whether it's `customer`
or `application` or `service`.

| Name                      | Description                                          | Type          |
| ------                    | -------------                                        | ----          |
| `aci_tenant`              | Description of function & why it's required per svc. | `customer`    |
| `aci_vrf`                 | Description of function & why it's required per svc. | `customer`    |
| `aci_bridge_domain`       | Description of function & why it's required per svc. | `customer`    |
| `aci_subnet`              | Description of function & why it's required per svc. | `customer`    |
| `aci_application_profile` | Description of function & why it's required per svc. | `application` |
| `aci_application_epg`     | Description of function & why it's required per svc. | `service`     |
| `aci_contract`            | Description of function & why it's required per svc. | `service`     |
