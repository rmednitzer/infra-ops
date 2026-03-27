# Production environment variable declarations.
# This environment is a placeholder for future production infrastructure.
# All variables must have description and type defined before use.

variable "libvirt_uri" {
  description = "Libvirt connection URI for the production KVM host."
  type        = string
}

# Uncomment these variables when adding module calls to main.tf:
#
# variable "base_image" {
#   description = "Path or URL to the cloud-init compatible base image."
#   type        = string
# }
#
# variable "ssh_public_key" {
#   description = "SSH public key injected into all VMs via cloud-init."
#   type        = string
#   sensitive   = true
# }
#
# variable "network_name" {
#   description = "Libvirt network name to attach VMs to."
#   type        = string
#   default     = "default"
# }
