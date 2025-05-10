output "instance_id" {
  description = "ID of the EC2 instance"
  value       = module.application_ec2.instance_id
}

output "private_ip" {
  description = "Private IP address"
  value       = module.application_ec2.private_ip
}

output "public_ip" {
  description = "Public IP address"
  value       = module.application_ec2.public_ip
}
