provider "libvirt" {
  uri = var.libvirt_uri
}

module "k3s_server_01" {
  source = "../../modules/libvirt-vm"

  vm_name        = "k3s-server-01"
  vcpus          = 2
  memory_mib     = 4096
  disk_size_gib  = 30
  base_image     = var.base_image
  network_name   = var.network_name
  ssh_public_key = var.ssh_public_key
}

module "k3s_agent_01" {
  source = "../../modules/libvirt-vm"

  vm_name        = "k3s-agent-01"
  vcpus          = 2
  memory_mib     = 2048
  disk_size_gib  = 20
  base_image     = var.base_image
  network_name   = var.network_name
  ssh_public_key = var.ssh_public_key
}

module "k3s_agent_02" {
  source = "../../modules/libvirt-vm"

  vm_name        = "k3s-agent-02"
  vcpus          = 2
  memory_mib     = 2048
  disk_size_gib  = 20
  base_image     = var.base_image
  network_name   = var.network_name
  ssh_public_key = var.ssh_public_key
}
