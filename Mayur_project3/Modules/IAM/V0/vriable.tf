variable "role_name" {
  description = "Name of the IAM Role"
  type        = string
}

variable "assume_role_policy" {
  description = "The policy that grants an entity permission to assume the role"
  type        = string
}

variable "tags" {
  description = "Tags to apply to the role"
  type        = map(string)
  default     = {}
}
