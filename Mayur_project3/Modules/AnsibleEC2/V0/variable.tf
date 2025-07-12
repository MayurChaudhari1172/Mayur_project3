variable "ami_id" {
  type = string
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "key_name" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "security_group_id" {
  type = string
}

variable "instance_name" {
  type = string
}

variable "bootstrap_script_content" {
  type = string
}
variable "iam_instance_profile" {
  description = "IAM instance profile name"
  type        = string
}
