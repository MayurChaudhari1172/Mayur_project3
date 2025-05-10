aws_region = "us-east-1"

role_name = "my-ec2-role"

managed_policy_arns = [
  "arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess",
  "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
]

tags = {
  Environment = "dev"
  Project     = "example"
}
