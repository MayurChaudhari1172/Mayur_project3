# EC2 variables
variable "ami" {}
variable "instance_type" {}
variable "vpc_security_group_ids" {
  type = list(string)
}
variable "key_name" {}
variable "subnet_id" {}
variable "iam_instance_profile" {}
variable "name" {}
variable "project_name" {}
variable "env" {}
variable "user_data" {}
variable "tags" {
  type = map(string)
}
variable "root_size" {}
variable "ebs_size" {}
variable "ebs_size_extra" {}
variable "ebs_volume_type" {}

# ALB networking
variable "vpc_id" {
  type = string
}
variable "subnet_ids" {
  type = list(string)
}
variable "security_groups" {
  type = list(string)
}

# ALB details
variable "alb_name" {}
variable "alb_internal" {
  type = bool
}
variable "alb_type" {}
variable "alb_tags" {
  type = map(string)
}

# Target Group
variable "tg_name" {}
variable "tg_port" {
  type = number
}
variable "tg_protocol" {}
variable "tg_tags" {
  type = map(string)
}

# Listener
variable "listener_port" {
  type = number
}
variable "listener_protocol" {}
variable "listener_action_type" {}

# Health Check
variable "health_check_path" {}
variable "health_check_interval" {
  type = number
}
variable "health_check_timeout" {
  type = number
}
variable "healthy_threshold" {
  type = number
}
variable "unhealthy_threshold" {
  type = number
}
