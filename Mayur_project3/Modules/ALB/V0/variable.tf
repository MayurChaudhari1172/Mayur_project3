variable "alb_name" {
  description = "Name for the ALB"
  type        = string
}

variable "tg_name" {
  description = "Name for the Target Group"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "subnet_ids" {
  description = "List of Subnet IDs for the ALB"
  type        = list(string)
}

variable "security_groups" {
  description = "List of Security Group IDs for the ALB"
  type        = list(string)
}

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
