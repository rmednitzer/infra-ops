variable "vm_name" {
  description = "VM hostname. Used as the libvirt domain name and cloud-init hostname."
  type        = string
}

variable "vcpus" {
  description = "Number of virtual CPUs to allocate to the VM."
  type        = number
  default     = 2
}

variable "memory_mib" {
  description = "Memory allocated to the VM in MiB."
  type        = number
  default     = 2048
}

variable "disk_size_gib" {
  description = "Root disk size in GiB."
  type        = number
  default     = 20
}

variable "base_image" {
  description = "Path or URL to a cloud-init compatible base image (e.g., Ubuntu 24.04 cloud image)."
  type        = string
}

variable "network_name" {
  description = "Libvirt network name to attach the VM to."
  type        = string
  default     = "default"
}

variable "ssh_public_key" {
  description = "SSH public key injected via cloud-init for the default user."
  type        = string
  sensitive   = true
}

variable "additional_disks" {
  description = "Optional list of additional data disks to attach to the VM."
  type = list(object({
    name     = string
    size_gib = number
  }))
  default = []
}

variable "autostart" {
  description = "Whether the VM should start automatically when the libvirt host boots."
  type        = bool
  default     = true
}
