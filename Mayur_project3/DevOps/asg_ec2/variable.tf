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
  type = number
}

variable "min_size" {
  type = number
}

variable "max_size" {
  type = number
}

variable "tags" {
  type = map(string)
}

# No default values for CPU alarm scaling
variable "scale_up_cpu_threshold" {
  description = "CPU threshold to trigger scale out"
  type        = number
}

variable "scale_down_cpu_threshold" {
  description = "CPU threshold to trigger scale in"
  type        = number
}

variable "scale_up_adjustment" {
  description = "Number of instances to add on scale out"
  type        = number
}

variable "tomcat_version" {
  description = "Tomcat version to install"
  type        = string
}

variable "mysql_root_password" {
  description = "MySQL root password"
  type        = string
  sensitive   = true
}

variable "war_name" {
  description = "WAR file name"
  type        = string
}

variable "war_url" {
  description = "WAR file download URL"
  type        = string
}
