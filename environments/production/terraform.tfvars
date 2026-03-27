# Production environment variable defaults.
# Non-secret values only — do not add credentials to this file.
# Set ssh_public_key via: export TF_VAR_ssh_public_key="$(cat ~/.ssh/id_ed25519.pub)"
#
# Configure actual values before deploying production infrastructure.

network_name = "default"

# Set base_image to the production image path:
# base_image = "/var/lib/libvirt/images/noble-server-cloudimg-amd64.img"

# Set libvirt_uri to the production host:
# libvirt_uri = "qemu+ssh://user@prod-kvm-host/system"
