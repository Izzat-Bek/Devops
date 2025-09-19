data "vsphere_virtual_machine" "templates" {
  for_each = toset([for vm in var.vms : vm.template_name])
  name     = each.key
  datacenter_id = data.vsphere_datacenter.datacenter.id
}
