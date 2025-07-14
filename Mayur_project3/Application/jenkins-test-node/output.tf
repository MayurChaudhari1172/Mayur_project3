output "instance_public_ip" {
  value = aws_instance.jenkins_test_ec2.public_ip
}

output "instance_id" {
  value = aws_instance.jenkins_test_ec2.id
}

output "instance_name" {
  value = aws_instance.jenkins_test_ec2.tags["Name"]
}
