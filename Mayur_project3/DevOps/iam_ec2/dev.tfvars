role_name          = "shared-ec2-role"
service_principals = ["ec2.amazonaws.com"]

tags = {
  Environment = "dev"
  CreatedBy   = "Terraform"
}
