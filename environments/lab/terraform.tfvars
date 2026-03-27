# Lab environment variable defaults.
# Non-secret values only — do not add credentials to this file.
# Set ssh_public_key via: export TF_VAR_ssh_public_key="$(cat ~/.ssh/id_ed25519.pub)"

libvirt_uri  = "qemu:///system"
network_name = "default"

# Ubuntu 24.04 LTS cloud image
# Download from: https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img
base_image = "/var/lib/libvirt/images/noble-server-cloudimg-amd64.img"
