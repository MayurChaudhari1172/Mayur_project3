variable "ec2_subnet_id" {
  description = "Subnet for EC2 — used to derive VPC ID"
  type        = string
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
