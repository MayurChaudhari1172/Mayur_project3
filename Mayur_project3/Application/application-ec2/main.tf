module "application_ec2" {
  source = "../../Modules/EC2/V0"

  ami                    = var.ami
  instance_type          = var.instance_type
  vpc_security_group_ids = var.vpc_security_group_ids
  key_name               = var.key_name
  subnet_id              = var.subnet_id
  name                   = var.name
  iam_instance_profile   = var.iam_instance_profile
  project_name           = var.project_name
  env                    = var.env
  user_data              = var.user_data
  tags                   = var.tags

  root_size       = var.root_size
  ebs_size        = var.ebs_size
  ebs_size_extra  = var.ebs_size_extra
  ebs_volume_type = var.ebs_volume_type
}
