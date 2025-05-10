output "role_name" {
  description = "The name of the IAM role"
  value       = aws_iam_role.FQTS-EC2-role.name
}

output "role_arn" {
  description = "The ARN of the IAM role"
  value       = aws_iam_role.FQTS-EC2-role.arn
}
output "instance_profile_name" {
  description = "IAM Instance Profile name"
  value       = aws_iam_instance_profile.this.name
}

