output "control_node_public_ip" {
  description = "Public IP of the Ansible control node"
  value       = module.ansible_control_node.instance_public_ip
}

output "control_node_instance_id" {
  description = "Instance ID of the Ansible control node"
  value       = module.ansible_control_node.instance_id
}
