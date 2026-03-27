# Production environment — placeholder configuration.
# This file will define production infrastructure resources once the environment
# is ready for provisioning. Configure the backend in backend.tf first.
#
# Example module call (do not apply until backend is configured):
#
# module "example_vm" {
#   source = "../../modules/libvirt-vm"
#
#   vm_name        = "prod-node-01"
#   vcpus          = 4
#   memory_mib     = 8192
#   disk_size_gib  = 50
#   base_image     = var.base_image
#   network_name   = var.network_name
#   ssh_public_key = var.ssh_public_key
# }

terraform {
  required_version = ">= 1.6"

  required_providers {
    libvirt = {
      source  = "dmacvicar/libvirt"
      version = "~> 0.8"
    }
  }
}

provider "libvirt" {
  uri = var.libvirt_uri
}
