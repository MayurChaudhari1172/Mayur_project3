module "application_ec2" {
  source = "../application-ec2"

  ami                    = var.ami
  instance_type          = var.instance_type
  vpc_security_group_ids = var.vpc_security_group_ids
  key_name               = var.key_name
  subnet_id              = var.subnet_id
  iam_instance_profile   = var.iam_instance_profile
  name                   = var.name
  project_name           = var.project_name
  env                    = var.env
  user_data              = var.user_data
  tags                   = var.tags
  root_size              = var.root_size
  ebs_size               = var.ebs_size
  ebs_size_extra         = var.ebs_size_extra
  ebs_volume_type        = var.ebs_volume_type
}

module "alb" {
  source = "../ALB"

  ec2_subnet_id          = var.ec2_subnet_id
  sg_name                = var.sg_name
  sg_description         = var.sg_description
  sg_ingress_from_port   = var.sg_ingress_from_port
  sg_ingress_to_port     = var.sg_ingress_to_port
  sg_ingress_protocol    = var.sg_ingress_protocol
  sg_ingress_cidr_blocks = var.sg_ingress_cidr_blocks
  sg_egress_from_port    = var.sg_egress_from_port
  sg_egress_to_port      = var.sg_egress_to_port
  sg_egress_protocol     = var.sg_egress_protocol
  sg_egress_cidr_blocks  = var.sg_egress_cidr_blocks
  sg_tags                = var.sg_tags

  alb_name     = var.alb_name
  alb_internal = var.alb_internal
  alb_type     = var.alb_type
  alb_tags     = var.alb_tags

  tg_name     = var.tg_name
  tg_port     = var.tg_port
  tg_protocol = var.tg_protocol
  tg_tags     = var.tg_tags

  listener_port        = var.listener_port
  listener_protocol    = var.listener_protocol
  listener_action_type = var.listener_action_type

  health_check_path     = var.health_check_path
  health_check_interval = var.health_check_interval
  health_check_timeout  = var.health_check_timeout
  healthy_threshold     = var.healthy_threshold
  unhealthy_threshold   = var.unhealthy_threshold
}

resource "aws_lb_target_group_attachment" "app_tg_attachment" {
  target_group_arn = module.alb.alb_target_group_arn
  target_id        = module.application_ec2.instance_id
  port             = 80
}
