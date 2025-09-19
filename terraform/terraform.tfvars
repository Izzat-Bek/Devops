vms = [
  {
    template_name = "ubuntu-22.04"
    name          = "ubuntu-test01"
    ip_addr       = "172.25.227.50"
    dns           = ["8.8.8.8", "1.1.1.1"]
    hostname      = "ubuntu-test01"
    mask          = 24
    gateway       = "172.25.227.1"
    disk_size     = 100
    disk_type     = "eagerZeroedThick"
    label         = "disk0"
    cpu           = 4
    ram           = 4096
    guest_id      = "ubuntu64Guest"
    resource_pool = "ORACLE-X6"
    datastore_name  = "DB1"
    network_name  = "VLAN-611"
  },
  {
    name          = "oracle-8.10"
    ip_addr       = "172.25.227.51"
    dns           = ["8.8.4.4"]
    hostname      = "ubuntu-test02"
    mask          = 24
    gateway       = "172.25.227.1"
    disk_size     = 80
    disk_type     = "thin"
    label         = "disk0"
    cpu           = 8
    ram           = 4096
    guest_id      = "ubuntu64Guest"
    resource_pool = "ORACLE-X6"
    datastore_name  = "DB2"
    network_name  = "VLAN-804"
  }
]
