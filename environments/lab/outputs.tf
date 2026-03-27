output "k3s_server_01_ip" {
  description = "IP address of the k3s server node."
  value       = module.k3s_server_01.ip_address
}

output "k3s_agent_01_ip" {
  description = "IP address of k3s agent node 01."
  value       = module.k3s_agent_01.ip_address
}

output "k3s_agent_02_ip" {
  description = "IP address of k3s agent node 02."
  value       = module.k3s_agent_02.ip_address
}
