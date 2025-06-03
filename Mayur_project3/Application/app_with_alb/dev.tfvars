# EC2 values
ami                    = "ami-0554aa6767e249943"
instance_type          = "t2.micro"
vpc_security_group_ids = ["sg-0c7eb9f00f0d010bc"]
key_name               = "Key-Pair-Punam"
subnet_id              = "subnet-0240a86a8ee3c206d"
iam_instance_profile   = "fqts-proj3-iam-role-profile"
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

# ALB
alb_name     = "FQTS-alb"
alb_internal = false
alb_type     = "application"
alb_tags = {
  Environment = "dev"
}
security_groups = ["sg-0c7eb9f00f0d010bc"]

# Target Group
tg_name     = "FQTS-tg"
tg_port     = 8080
tg_protocol = "HTTP"
tg_tags = {
  Service = "FQTS"
}

# Listener
listener_port        = 80
listener_protocol    = "HTTP"
listener_action_type = "forward"

# Health Check
health_check_path     = "/health.html"
health_check_interval = 30
health_check_timeout  = 5
healthy_threshold     = 2
unhealthy_threshold   = 2

vpc_id     = "vpc-0b5257a147240a7c2"
subnet_ids = ["subnet-0240a86a8ee3c206d", "subnet-0eae2211a022cebd2"] # List of ALB subnets
