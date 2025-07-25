resource "aws_instance" "this" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  key_name               = var.key_name
  vpc_security_group_ids = [var.security_group_id]
  user_data              = var.bootstrap_script_content
  iam_instance_profile   = var.iam_instance_profile
  tags = {
    Name = var.instance_name
  }
}
