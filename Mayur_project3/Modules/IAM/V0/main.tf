resource "aws_iam_role" "this" {
  name = var.role_name
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Principal = {
        Service = var.service_principals
      },
      Action = "sts:AssumeRole"
    }]
  })

  tags = var.tags
}
resource "aws_iam_instance_profile" "this" {
  name = var.role_name
  role = aws_iam_role.this.name
}
