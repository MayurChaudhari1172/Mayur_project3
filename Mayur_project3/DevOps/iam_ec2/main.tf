module "iam_role" {
  source             = "../../Modules/IAM/V0"
  role_name          = var.role_name
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
  tags               = var.tags
}

# EC2 trust policy
data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
    actions = ["sts:AssumeRole"]
  }
}

# Basic EC2 permissions
data "aws_iam_policy_document" "ec2_creation_policy" {
  statement {
    effect = "Allow"
    actions = [
      "ec2:RunInstances",
      "ec2:TerminateInstances",
      "ec2:DescribeInstances",
      "ec2:StartInstances",
      "ec2:StopInstances",
      "ec2:DescribeSecurityGroups",
      "ec2:DescribeSubnets",
      "ec2:DescribeVpcs",
      "ec2:CreateTags",
      "iam:PassRole"
    ]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "ec2_policy" {
  name   = "${var.role_name}-ec2-policy"
  policy = data.aws_iam_policy_document.ec2_creation_policy.json
}

resource "aws_iam_role_policy_attachment" "ec2_policy_attachment" {
  role       = module.iam_role.role_name
  policy_arn = aws_iam_policy.ec2_policy.arn
}

# Extended permissions
data "aws_iam_policy_document" "extended_ec2_policy" {
  statement {
    effect    = "Allow"
    actions   = ["ec2:*"]
    resources = ["*"]
  }

  statement {
    effect    = "Allow"
    actions   = ["elasticloadbalancing:*"]
    resources = ["*"]
  }

  statement {
    effect    = "Allow"
    actions   = ["cloudwatch:*"]
    resources = ["*"]
  }

  statement {
    effect    = "Allow"
    actions   = ["autoscaling:*"]
    resources = ["*"]
  }

  statement {
    effect    = "Allow"
    actions   = ["iam:CreateServiceLinkedRole"]
    resources = ["*"]
    condition {
      test     = "StringEquals"
      variable = "iam:AWSServiceName"
      values = [
        "autoscaling.amazonaws.com",
        "ec2scheduled.amazonaws.com",
        "elasticloadbalancing.amazonaws.com",
        "spot.amazonaws.com",
        "spotfleet.amazonaws.com",
        "transitgateway.amazonaws.com"
      ]
    }
  }

  # S3 Permissions for Terraform state access
  statement {
    effect  = "Allow"
    actions = ["s3:GetObject", "s3:PutObject", "s3:ListBucket", "s3:DeleteObject"]
    resources = [
      "arn:aws:s3:::mayur-devops-bucket-fqts",
      "arn:aws:s3:::mayur-devops-bucket-fqts/env/dev/terraform.tfstate",
      "arn:aws:s3:::mayur-devops-bucket-fqts/env/dev/terraform.tfstate.tflock" # Lock file permission added
    ]
  }
}

resource "aws_iam_policy" "extended_ec2_policy" {
  name   = "${var.role_name}-extended"
  policy = data.aws_iam_policy_document.extended_ec2_policy.json
}

resource "aws_iam_role_policy_attachment" "extended_attachment" {
  role       = module.iam_role.role_name
  policy_arn = aws_iam_policy.extended_ec2_policy.arn
}
