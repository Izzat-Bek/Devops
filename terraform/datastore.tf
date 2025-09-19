data "vsphere_datastore" "datastores" {
  for_each      = toset([for vm in var.vms : vm.datastore_name])
  name          = each.key
  datacenter_id = data.vsphere_datacenter.datacenter.id
}