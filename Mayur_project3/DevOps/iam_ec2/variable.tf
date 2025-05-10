variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
}

variable "role_name" {
  description = "IAM Role name"
  type        = string
}

variable "managed_policy_arns" {
  description = "List of managed policy ARNs to attach to IAM role"
  type        = list(string)
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
}
