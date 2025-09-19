terraform {
  required_providers {
    vsphere = {
        source = "hashicorp/vsphere"
        version = "2.10.0"
    }
  }
}


provider "vsphere" {
  user = "user"
  password = "pwd"
  vsphere_server = "vcenter"
  allow_unverified_ssl = true
  api_timeout = 10
}
