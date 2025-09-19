terraform {
  required_providers {
    vsphere = {
        source = "hashicorp/vsphere"
        version = "2.10.0"
    }
  }
}


provider "vsphere" {
  user = "i.erkinov@HAMKOR.LOCAL"
  password = "pwd"
  vsphere_server = "prvcenter.hamkor.local"
  allow_unverified_ssl = true
  api_timeout = 10
}
