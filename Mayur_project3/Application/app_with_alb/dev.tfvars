# EC2 values
ami                    = "ami-04681163a08179f28"
instance_type          = "t2.micro"
vpc_security_group_ids = ["sg-0a2b79b94d4b38288"]
subnet_id              = "subnet-0034c59563dfabecd"
iam_instance_profile   = "fqts-proj3-iam-role-profile"
key_name               = "Mayur_Key_Pair"
name                   = "app-ec2"
project_name           = "application"
env                    = "NonProd::DEV"
user_data              = " "
root_size              = 30
ebs_size               = 50
ebs_size_extra         = 0
ebs_volume_type        = "gp3"
tags = {
  Owner       = "DevOps"
  Environment = "development"
  Team        = "AppTeam"
}

# ALB Security Group
sg_name                = "alb-sg"
sg_description         = "Security Group for ALB"
sg_ingress_from_port   = 80
sg_ingress_to_port     = 80
sg_ingress_protocol    = "tcp"
sg_ingress_cidr_blocks = ["0.0.0.0/0"]
sg_egress_from_port    = 0
sg_egress_to_port      = 0
sg_egress_protocol     = "-1"
sg_egress_cidr_blocks  = ["0.0.0.0/0"]
sg_tags = {
  Name = "alb-sg"
}

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

ec2_subnet_id = "subnet-0034c59563dfabecd"
