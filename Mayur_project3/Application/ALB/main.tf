

# resource "aws_security_group" "alb_sg" {
#   name        = var.sg_name
#   description = var.sg_description
#   vpc_id      = data.aws_subnet.ec2_subnet.vpc_id

#   ingress {
#     from_port   = var.sg_ingress_from_port
#     to_port     = var.sg_ingress_to_port
#     protocol    = var.sg_ingress_protocol
#     cidr_blocks = var.sg_ingress_cidr_blocks
#   }

#   egress {
#     from_port   = var.sg_egress_from_port
#     to_port     = var.sg_egress_to_port
#     protocol    = var.sg_egress_protocol
#     cidr_blocks = var.sg_egress_cidr_blocks
#   }

#   tags = var.sg_tags
# }

module "alb" {
  source = "../../Modules/ALB/V0"

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

  vpc_id          = var.vpc_id
  subnet_ids      = var.subnet_ids
  security_groups = var.security_groups


  health_check_path     = var.health_check_path
  health_check_interval = var.health_check_interval
  health_check_timeout  = var.health_check_timeout
  healthy_threshold     = var.healthy_threshold
  unhealthy_threshold   = var.unhealthy_threshold
}
