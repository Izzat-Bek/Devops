resource "vsphere_virtual_machine" "vm" {
  for_each = { for vm in var.vms : vm.name => vm }

  name             = each.value.name
  resource_pool_id = data.vsphere_compute_cluster.clusters[each.value.resource_pool].resource_pool_id
  datastore_id     = data.vsphere_datastore.datastores[each.value.datastore_id].id

  num_cpus = each.value.cpu
  memory   = each.value.ram
  guest_id = each.value.guest_id

  network_interface {
    network_id   = data.vsphere_network.networks[each.value.network_name].id
    adapter_type = data.vsphere_virtual_machine.templates[each.value.template_name].network_interface_types[0]
  }

  disk {
    label            = each.value.label
    size             = each.value.disk_size
    thin_provisioned = each.value.disk_type == "thin" ? true : false
    eagerly_scrub    = each.value.disk_type == "eagerZeroedThick" ? true : false
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.templates[each.value.template_name].id

    customize {
      linux_options {
        host_name = each.value.hostname
        # domain    = data.vsphere_virtual_machine.template_ubuntu.domain
      }

      network_interface {
        ipv4_address = each.value.ip_addr
        ipv4_netmask = each.value.mask
      }

      ipv4_gateway    = each.value.gateway
      dns_server_list = each.value.dns
    }
  }
}