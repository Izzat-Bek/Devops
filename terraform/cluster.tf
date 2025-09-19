data "vsphere_compute_cluster" "clusters" {
  for_each      = toset([for vm in var.vms : vm.resource_pool])
  name          = each.key
  datacenter_id = data.vsphere_datacenter.datacenter.id
}
