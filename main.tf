/* Copyright (C) Hashicorp, Inc - All Rights Reserved */
/* Unauthorized copying of this file, via any medium is strictly prohibited */
/* Proprietary and confidential */
/* Written by Adeel Ahmad adeel@hashicorp.com, January 2021 */

terraform {
  required_providers {
    aci = {
      source = "ciscodevnet/aci"
      version = "~> 0.5.4"
    }
  }
  required_version = ">= 0.13"
}


data "aci_tenant" "showcase_dc" {
  name = "showcase_dc"
}

data "aci_tenant" "common" {
  name = "common"
}

data "aci_vmm_domain" "vds" {
	provider_profile_dn = "uni/vmmp-VMware"
	name                = "vds_1"
}

data "aci_contract" "inet" {
  tenant_dn  =  data.aci_tenant.common.id
  name       = "inet"
}

resource "aci_vrf" "aci_vrf" {
	tenant_dn = data.aci_tenant.showcase_dc.id
	name      = var.workspace
}

resource "aci_application_profile" "uk-vmware-sc1" {
  tenant_dn = data.aci_tenant.showcase_dc.id
  name = "uk-vmware-${var.workspace}-ap"
  description = "Natilik UK VMware ${var.workspace} SC1 environment"
}

resource "aci_bridge_domain" "uk-dc-showcase-sc1" {
  tenant_dn = data.aci_tenant.showcase_dc.id
  description = "Natilik VMware ${var.workspace} Bridge Domain"
  name = "uk-dc-showcase-${var.workspace}-bd"
  relation_fv_rs_ctx = aci_vrf.aci_vrf.id
  arp_flood = "yes"
  unk_mac_ucast_act = "flood"
}

resource "aci_application_epg" "showcase-epg" {
  application_profile_dn  = aci_application_profile.uk-vmware-sc1.id
  name = "showcase-epg"
  description = "Showcase Scenario 1 ${var.workspace} EPG"
  relation_fv_rs_bd = aci_bridge_domain.uk-dc-showcase-sc1.id
}

resource "aci_epg_to_domain" "showcase-epg" {
  application_epg_dn    = aci_application_epg.showcase-epg.id
  tdn                   = data.aci_vmm_domain.vds.id
}

resource "aci_subnet" "uk-dc-showcase-sc1" {
  parent_dn = aci_bridge_domain.uk-dc-showcase-sc1.id
  description      = "Showcase ${var.workspace} Subnet"
  ip               = terraform.workspace == "staging" ? "10.10.1.1/24" : "10.20.1.1/24"
  annotation       = "tag_subnet"
  preferred        = "no"
  scope            = ["shared"]
  virtual          = "no"
}
