data "vsphere_network" "networks" {
  for_each = toset([for vm in var.vms : vm.network_name])
  name     = each.key
  datacenter_id = data.vsphere_datacenter.datacenter.id
}