resource "aws_iam_role" "FQTS-EC2-role" {
  name               = var.name
  assume_role_policy = var.assume_role_policy

  description = var.description
  path        = var.path

  tags = var.tags
}

resource "aws_iam_role_policy_attachment" "this" {
  count = length(var.managed_policy_arns)

  role       = aws_iam_role.FQTS-EC2-role.name
  policy_arn = var.managed_policy_arns[count.index]
}

resource "aws_iam_instance_profile" "this" {
  name = var.name
  role = aws_iam_role.FQTS-EC2-role.name
}
