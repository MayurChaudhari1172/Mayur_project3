variable "ami_id" {
  description = "AMI ID"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "SSH key name"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID"
  type        = string
}

variable "security_group_id" {
  description = "Security Group ID"
  type        = string
}

variable "bootstrap_script_path" {
  description = "Path to bootstrap.sh"
  type        = string
}
variable "iam_instance_profile" {
  description = "IAM instance profile name to attach to EC2"
  type        = string
}
