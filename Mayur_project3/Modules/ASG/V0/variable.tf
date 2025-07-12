variable "name_prefix" {}
variable "ami_id" {}
variable "instance_type" {}
variable "key_name" {}
variable "iam_instance_profile" {}
variable "security_group_ids" {
  type = list(string)
}
variable "subnet_ids" {
  type = list(string)
}
variable "target_group_arns" {
  type    = list(string)
  default = []
}
variable "desired_capacity" {
  type    = number
  default = 1
}
variable "min_size" {
  type    = number
  default = 1
}
variable "max_size" {
  type    = number
  default = 2
}
variable "tags" {
  type    = map(string)
  default = {}
}

# #cpu up
# variable "scale_up_cpu_threshold" {
#   description = "CPU threshold to trigger scale out"
#   type        = number
#   default     = 70
# }

# #cpu down
# variable "scale_down_cpu_threshold" {
#   description = "CPU threshold to trigger scale in"
#   type        = number
#   default     = 20
# }

# variable "scale_up_adjustment" {
#   description = "Number of instances to add on scale out"
#   type        = number
#   default     = 1
# }

# variable "tomcat_version" {
#   description = "Tomcat version to install"
#   type        = string
#   default     = "10.1.24"
# }

# variable "tomcat_file" {
#   description = "Tomcat tar.gz file name"
#   type        = string
#   default     = ""
# }
# variable "mysql_root_password" {
#   description = "MySQL root password"
#   type        = string
#   sensitive   = true
# }

# variable "war_name" {
#   description = "WAR file name"
#   type        = string
# }

# variable "war_url" {
#   description = "WAR file download URL"
#   type        = string
# }
variable "target_cpu_utilization" {
  description = "Target average CPU utilization for ASG"
  type        = number
  default     = 50
}
# variable "ansadmin_public_key" {
#   description = "Public SSH key for ansadmin from Ansible control node"
#   type        = string
# }
# variable "setup_script_content" {
#   description = "Fully rendered and base64-encoded user data script"
#   type        = string
#   default     = ""
# }
# variable "target_group_arns" {
#   type = list(string)
# }
