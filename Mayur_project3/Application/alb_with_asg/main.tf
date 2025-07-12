module "alb" {
  source = "../../Modules/ALB/V0"

  alb_name     = var.alb_name
  alb_internal = var.alb_internal
  alb_type     = var.alb_type
  alb_tags     = var.alb_tags

  vpc_id          = var.vpc_id
  subnet_ids      = var.subnet_ids
  security_groups = var.security_groups

  listener_port     = var.listener_port
  listener_protocol = var.listener_protocol

  health_check_path     = var.health_check_path
  health_check_interval = var.health_check_interval
  health_check_timeout  = var.health_check_timeout
  healthy_threshold     = var.healthy_threshold
  unhealthy_threshold   = var.unhealthy_threshold
}

module "asg" {
  source = "../../Modules/ASG/V0"

  name_prefix          = var.name_prefix
  ami_id               = var.ami_id
  instance_type        = var.instance_type
  key_name             = var.key_name
  iam_instance_profile = var.iam_instance_profile
  security_group_ids   = var.security_groups
  subnet_ids           = var.subnet_ids

  # ✅ Attach both target groups (frontend + backend)
  target_group_arns = [
    module.alb.frontend_target_group_arn,
    module.alb.backend_target_group_arn
  ]

  desired_capacity       = var.desired_capacity
  min_size               = var.min_size
  max_size               = var.max_size
  tags                   = var.tags
  target_cpu_utilization = var.target_cpu_utilization
}
