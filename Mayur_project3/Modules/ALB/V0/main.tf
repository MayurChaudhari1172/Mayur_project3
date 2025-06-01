resource "aws_lb" "this" {
  name               = var.alb_name
  internal           = var.alb_internal
  load_balancer_type = var.alb_type
  subnets            = var.subnet_ids
  security_groups    = var.security_groups
  tags               = var.alb_tags
}

resource "aws_lb_target_group" "this" {
  name     = var.tg_name
  port     = var.tg_port
  protocol = var.tg_protocol
  vpc_id   = var.vpc_id
  health_check {
    port                = var.tg_port
    path                = var.health_check_path
    interval            = var.health_check_interval
    timeout             = var.health_check_timeout
    healthy_threshold   = var.healthy_threshold
    unhealthy_threshold = var.unhealthy_threshold
  }
  tags = var.tg_tags
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.this.arn
  port              = var.listener_port
  protocol          = var.listener_protocol
  default_action {
    type             = var.listener_action_type
    target_group_arn = aws_lb_target_group.this.arn
  }
}
