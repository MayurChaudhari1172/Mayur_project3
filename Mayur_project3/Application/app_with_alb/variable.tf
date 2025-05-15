//application ec2 variable.tf
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


//ALB variable.terraform 
variable "ec2_subnet_id" {
  type        = string
  description = "Subnet ID used to derive VPC and subnet list"
}
# Security Group
variable "sg_name" {
  type = string
}
variable "sg_description" {
  type = string
}
variable "sg_ingress_from_port" {
  type = number
}
variable "sg_ingress_to_port" {
  type = number
}
variable "sg_ingress_protocol" {
  type = string
}
variable "sg_ingress_cidr_blocks" {
  type = list(string)
}
variable "sg_egress_from_port" {
  type = number
}
variable "sg_egress_to_port" {
  type = number
}
variable "sg_egress_protocol" {
  type = string
}
variable "sg_egress_cidr_blocks" {
  type = list(string)
}
variable "sg_tags" {
  type = map(string)
}

# ALB
variable "alb_name" {
  type = string
}
variable "alb_internal" {
  type = bool
}
variable "alb_type" {
  type = string
}
variable "alb_tags" {
  type = map(string)
}

# Target Group
variable "tg_name" {
  type = string
}
variable "tg_port" {
  type = number
}
variable "tg_protocol" {
  type = string
}
variable "tg_tags" {
  type = map(string)
}

# Listener
variable "listener_port" {
  type = number
}
variable "listener_protocol" {
  type = string
}
variable "listener_action_type" {
  type = string
}

# Health Check
variable "health_check_path" {
  type = string
}
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
