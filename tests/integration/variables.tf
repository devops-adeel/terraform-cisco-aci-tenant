variable contracts {
  description = "Contracts"
  type     = map
  default  = {
    contract1 = {
      name  = "Contract1",
      tenant = "uni/tn-integration-test"
    },
    contract3 = {
      name    = "Contract3",
      tenant = "uni/tn-integration-test"
    }
  }
}

variable vrf {
  description = "VRFs"
  type     = map
  default  = {
    VRF1 = {
      name  = "VRF1",
      tenant = "uni/tn-integration-test"
    },
    VRF2 = {
      name    = "VRF2",
      tenant = "uni/tn-integration-test"
    }
  }
}

variable bd {
  description = "Bridge Domain"
  type     = map
  default  = {
    BD1 = {
      name  = "BD1",
      tenant = "uni/tn-integration-test"
    },
    BD2 = {
      name    = "BD2",
      tenant = "uni/tn-integration-test"
    },
    BD3 = {
      name    = "BD3",
      tenant = "uni/tn-integration-test"
    }
  }
}

variable subnet {
  description = "Subnets"
  type     = map
  default  = {
    Subnet1 = {
      subnet  = "10.2.16.129/26",
      bd = "BD1"
    },
    Subnet2 = {
      subnet    = "10.2.17.129/26",
      bd = "BD2"
    }
  }
}

variable ap {
  description = "Application profiles"
  type     = map
  default  = {
    AP1 = {
      name  = "AP1",
      tenant = "uni/tn-integration-test"
    },
    AP2 = {
      name    = "AP2",
      tenant = "uni/tn-integration-test"
    }
  }
}

variable epg {
  description = "EPGs"
  type     = map
  default  = {
    EPG1 = {
      name  = "EPG1",
      ap = "AP1",
      bd = "BD1"
    },
    EPG2 = {
      name  = "EPG2",
      ap = "AP2",
      bd = "BD2"
    }
  }
}

variable vmm {
  description = "VMMs"
  type     = map
  default  = {
    tf-vds = {
      name  = "tf-vds",
    }
  }
}

variable aci_epg_to_domain {
  description = "EPG to VMM"
  type     = map
  default  = {
    epg2dom1 = {
      epg = "EPG1",
      vmm = "tf-vds"
    }
  }
}


variable aci_epg_to_static-path {
  description = "EPG Static Path"
  type     = map
  default  = {
    epg2static1 = {
      epg = "EPG1",
      tdn = "topology/pod-1/paths-101/pathep-[eth1/3]",
      encap = "vlan-2000"
    }
  }
}

variable vlan_pool {
  description = "VLAN Pools"
  type     = map
  default  = {
    vlan_pool = {
      name  = "vlan_pool1",
    }
  }
}

variable filter {
  description = "Contract Filters"
  type     = map
  default  = {
    Filter1 = {
      name  = "Filter1",
      tenant = "uni/tn-integration-test"
    },
    Filter2 = {
      name    = "Filter2",
      tenant = "uni/tn-integration-test"
    }
  }
}

variable aci_contract_subject {
  description = "Contract Subjects"
  type     = map
  default  = {
    subject1 = {
      name  = "tf-contract-subject1",
      contract = "contract1",
      filter = "Filter1"
    }
  }
}

variable aci_filter_entry {
  description = "Contract Filter Entry"
  type     = map
  default  = {
    entry1 = {
      name  = "entry1",
      type = "ip",
      protocol = "icmp",
      stateful = "yes",
      filter = "Filter1"
    },
    entry2 = {
      name  = "entry2",
      type = "ip",
      protocol = "icmp",
      stateful = "yes",
      filter = "Filter1"
    }
  }
}
