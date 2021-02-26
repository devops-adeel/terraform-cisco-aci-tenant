## Cisco ACI - Managing the current and new tenants

This terraform module creates the new tenant or modify the current one. The module will automatically build the tenant including objects like EPG and contracts. Only basic attributes like name, id, location and type of service will be provided and module will build the environment.

## Status

## Requirements

<! ADD PRE-REQUISITES HERE>

## Providers

| Name | Version |
|------|---------|
| `ciscodevnet/aci` | 0.5.3 |

## Inputs

| Name            | Description                                                 | Type     | Default   | Required   |
| ------          | -------------                                               | ------   | --------- | :--------: |
| `client_name` | Client's name                                         | `string` | n/a       | yes        |
| `client_id` | Client's ID                                         | `integer` | n/a       | yes        |
| `location` | Deployment location - UK, US, APAC                                         | `string` | n/a       | yes        |
| `service` | Service requested                                         | `string` | n/a       | yes        |


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
| `aci_tenant`              | Create/Modify tenant object                        | `customer`    |
| `aci_vrf`                 | Create/Modify VRF object | `customer`    |
| `aci_bridge_domain`       | Create/Modify BD object | `customer`    |
| `aci_subnet`              | Create/Modify subnet object | `customer`    |
| `aci_application_profile` | Create/Modify Application Profile object | `application` |
| `aci_application_epg`     | Create/Modify EPG object | `application` |
| `aci_contract`            | Create/Modify Contract object | `application`     |
| `aci_epg_to_domain`       | Create/Modify EPG to domain object | `application`     |
| `aci_filter`              | Create/Modify filter object for contracts | `application`     |
| `aci_contract_subject`    | Create/Modify contract subjects | `application`     |
| `aci_epg_to_static_path`  | Add/Modify EPG to the path | `application`     |
| `aci_vlan_pool`           | Create/Modify VLAN Pool for BD | `application`     |
| `aci_vmm_domain`           | Create/Modify VMM Domains | `application`     |
| `aci_filter_entry`           | Create/Modify Contract Filter Entry | `application`     |
