# Data block to create assume role policy for EC2
data "aws_iam_policy_document" "ec2_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

# Calling the reusable IAM Role module
module "ec2_iam_role" {
  source = "../../Modules/IAM/V0"

  name               = var.role_name
  assume_role_policy = data.aws_iam_policy_document.ec2_assume_role.json

  managed_policy_arns = var.managed_policy_arns
  tags                = var.tags
}
