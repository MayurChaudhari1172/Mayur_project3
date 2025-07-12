alb_name     = "FQTS-alb-app"
alb_internal = false
alb_type     = "application"
alb_tags = {
  Environment = "dev"
  Component   = "alb-with-asg"
}

security_groups = ["sg-0c7eb9f00f0d010bc"]

listener_port     = 80
listener_protocol = "HTTP"

health_check_path     = "/api/student"
health_check_interval = 30
health_check_timeout  = 5
healthy_threshold     = 2
unhealthy_threshold   = 2

vpc_id     = "vpc-0b5257a147240a7c2"
subnet_ids = ["subnet-0240a86a8ee3c206d", "subnet-0eae2211a022cebd2"]

name_prefix = "app-alb-asg"
# ami_id               = "ami-00eca88dfe714c8b6"
ami_id               = "ami-0552680315c5ea3d3"
instance_type        = "t2.medium"
key_name             = "Key-Pair-Punam"
iam_instance_profile = "fqts-proj3-iam-role-profile"

desired_capacity = 0
min_size         = 0
max_size         = 3

tags = {
  Name      = "app_alb_asg"
  Owner     = "DevOps"
  Team      = "AppTeam"
  Component = "alb-with-asg"
}

target_cpu_utilization = 50
