module "asg" {
  source               = "../../Modules/ASG/V0"
  name_prefix          = var.name_prefix
  ami_id               = var.ami_id
  instance_type        = var.instance_type
  key_name             = var.key_name
  iam_instance_profile = var.iam_instance_profile
  security_group_ids   = var.security_group_ids
  subnet_ids           = var.subnet_ids
  target_group_arns    = var.target_group_arns
  desired_capacity     = var.desired_capacity
  min_size             = var.min_size
  max_size             = var.max_size
  tags                 = var.tags

  #to pass scale-up threshold
  # scale_up_cpu_threshold = var.scale_up_cpu_threshold
  # scale_up_adjustment    = var.scale_up_adjustment

  # #to pass scale-down threshold
  # scale_down_cpu_threshold = var.scale_down_cpu_threshold

  # to set tomcat version from dev.tfvars
  # tomcat_version = var.tomcat_version

  # mysql_root_password = var.mysql_root_password

  # war_name = var.war_name
  # war_url  = var.war_url
}
