variable "name" {
  description = "Name of the IAM role"
  type        = string
}

variable "assume_role_policy" {
  description = "Assume role policy document (JSON)"
  type        = string
}

variable "description" {
  description = "Description of the IAM role"
  type        = string
  default     = ""
}

variable "path" {
  description = "Path of the IAM role"
  type        = string
  default     = "/"
}

variable "managed_policy_arns" {
  description = "List of IAM managed policy ARNs to attach to the role"
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "Tags to apply to the IAM role"
  type        = map(string)
  default     = {}
}
