resource "vsphere_virtual_machine" "vm" {
  name             = "ubuntu-test01"
  resource_pool_id = data.vsphere_compute_cluster.Oracle.resource_pool_id
  datastore_id     = data.vsphere_datastore.DB1.id

  num_cpus = 4
  memory   = 4096
  guest_id = data.vsphere_virtual_machine.template_ubuntu.guest_id

  network_interface {
    network_id   = data.vsphere_network.vlan-116.id
    adapter_type = data.vsphere_virtual_machine.template.network_interface_types[0]
  }

  disk {
    label            = "disk0"
    size             = 200
    eagerly_scrub    = true
    thin_provisioned = false #data.vsphere_virtual_machine.template_ubuntu.disks[0].thin_provisioned
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.template.id

    customize {
      linux_options {
        host_name = "ubuntu-test01"
        domain    = "hamkor.local"
      }

      network_interface {
        ipv4_address = "172.25.227.50"
        ipv4_netmask = 24
      }

      ipv4_gateway = "172.25.227.1"
    }
  }
}
