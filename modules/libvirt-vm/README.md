# libvirt-vm Module

Provisions a KVM/libvirt virtual machine using the [`dmacvicar/libvirt`](https://registry.terraform.io/providers/dmacvicar/libvirt/latest/docs) provider. Supports cloud-init user-data injection, optional additional data disks, and configurable CPU, memory, and disk resources.

## Requirements

- A running libvirt/KVM host accessible via the provider's `uri`
- A cloud-init compatible base image (e.g., Ubuntu 24.04 cloud image)
- An existing libvirt network

## Usage

```hcl
module "k3s_server" {
  source = "../../modules/libvirt-vm"

  vm_name        = "k3s-server-01"
  vcpus          = 2
  memory_mib     = 4096
  disk_size_gib  = 30
  base_image     = var.base_image_path
  network_name   = "default"
  ssh_public_key = var.ssh_public_key
}
```

## Inputs

| Name | Type | Default | Description |
|------|------|---------|-------------|
| `vm_name` | `string` | — | VM hostname |
| `vcpus` | `number` | `2` | Number of virtual CPUs |
| `memory_mib` | `number` | `2048` | Memory in MiB |
| `disk_size_gib` | `number` | `20` | Root disk size in GiB |
| `base_image` | `string` | — | Path or URL to cloud-init compatible base image |
| `network_name` | `string` | `"default"` | Libvirt network name |
| `ssh_public_key` | `string` | — | SSH public key for cloud-init injection (sensitive) |
| `additional_disks` | `list(object({name, size_gib}))` | `[]` | Optional additional data disks |
| `autostart` | `bool` | `true` | Start VM on host boot |

## Outputs

| Name | Description |
|------|-------------|
| `vm_id` | Libvirt domain ID |
| `ip_address` | VM IP address (from DHCP lease) |
| `mac_address` | VM MAC address |

## Cloud-Init

The module injects a `cloud_init.cfg` template that:
- Sets the VM hostname
- Adds the provided SSH public key for the `ubuntu` user
- Disables password authentication (`ssh_pwauth: false`)
- Runs `package_update` on first boot
- Installs and enables `qemu-guest-agent`

## Notes

- The base image is cloned as a backing volume; the root disk is a thin-provisioned overlay
- Additional disks are created as separate volumes and attached in order
- `wait_for_lease = true` on the network interface ensures `ip_address` output is populated
