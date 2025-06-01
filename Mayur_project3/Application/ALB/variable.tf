variable "vpc_id" {
  type = string
}
variable "subnet_ids" {
  type = list(string)
}
variable "security_groups" {
  type = list(string)
}
# Security Group
# variable "sg_name" {
#   type = string
# }
# variable "sg_description" {
#   type = string
# }
# variable "sg_ingress_from_port" {
#   type = number
# }
# variable "sg_ingress_to_port" {
#   type = number
# }
# variable "sg_ingress_protocol" {
#   type = string
# }
# variable "sg_ingress_cidr_blocks" {
#   type = list(string)
# }
# variable "sg_egress_from_port" {
#   type = number
# }
# variable "sg_egress_to_port" {
#   type = number
# }
# variable "sg_egress_protocol" {
#   type = string
# }
# variable "sg_egress_cidr_blocks" {
#   type = list(string)
# }
# variable "sg_tags" {
#   type = map(string)
# }

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
