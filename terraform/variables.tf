variable "vms" {
  description = "Test VMS"
  type = list(object({
    template_name = string
    name          = string
    ip_addr       = string
    dns           = list(string)
    hostname      = string
    mask          = number
    gateway       = string
    disk_size     = number
    disk_type     = string  # thin, eagerZeroedThick, thick
    label         = string
    cpu           = number
    ram           = number
    guest_id      = string
    resource_pool = string
    datastore_name  = string
    network_name  = string
  }))
}
