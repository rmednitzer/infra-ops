output "vm_id" {
  description = "Libvirt domain ID of the provisioned VM."
  value       = libvirt_domain.vm.id
}

output "ip_address" {
  description = "VM IP address assigned via DHCP."
  value       = libvirt_domain.vm.network_interface[0].addresses[0]
}

output "mac_address" {
  description = "VM MAC address on the primary network interface."
  value       = libvirt_domain.vm.network_interface[0].mac
}
