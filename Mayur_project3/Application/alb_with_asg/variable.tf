variable "alb_name" {}
variable "alb_internal" {}
variable "alb_type" {}
variable "alb_tags" {
  type = map(string)
}

variable "vpc_id" {}
variable "subnet_ids" {
  type = list(string)
}

variable "security_groups" {
  type = list(string)
}

variable "listener_port" {}
variable "listener_protocol" {}

variable "health_check_path" {}
variable "health_check_interval" {}
variable "health_check_timeout" {}
variable "healthy_threshold" {}
variable "unhealthy_threshold" {}

variable "name_prefix" {}
variable "ami_id" {}
variable "instance_type" {}
variable "key_name" {}
variable "iam_instance_profile" {}
variable "desired_capacity" {}
variable "min_size" {}
variable "max_size" {}

variable "tags" {
  type = map(string)
}

variable "target_cpu_utilization" {}
