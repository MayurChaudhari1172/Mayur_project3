# # Security Group
# sg_name                = "alb-sg"
# sg_description         = "Security Group for ALB"
# sg_ingress_from_port   = 80
# sg_ingress_to_port     = 80
# sg_ingress_protocol    = "tcp"
# sg_ingress_cidr_blocks = ["0.0.0.0/0"]
# sg_egress_from_port    = 0
# sg_egress_to_port      = 0
# sg_egress_protocol     = "-1"
# sg_egress_cidr_blocks  = ["0.0.0.0/0"]
# sg_tags = {
#   Name = "alb-sg"
# }

# ALB
alb_name     = "FQTS-alb"
alb_internal = false
alb_type     = "application"
alb_tags = {
  Environment = "dev"
}

# Target Group
tg_name     = "FQTS-tg"
tg_port     = 80
tg_protocol = "HTTP"
tg_tags = {
  Service = "FQTS"
}

# Listener
listener_port        = 80
listener_protocol    = "HTTP"
listener_action_type = "forward"

# Health Check
health_check_path     = "/"
health_check_interval = 30
health_check_timeout  = 5
healthy_threshold     = 2
unhealthy_threshold   = 2
vpc_id                = "vpc-0b5257a147240a7c2"
subnet_ids            = ["subnet-0240a86a8ee3c206d"] # List of ALB subnets
security_groups       = ["sg-0c7eb9f00f0d010bc"]
