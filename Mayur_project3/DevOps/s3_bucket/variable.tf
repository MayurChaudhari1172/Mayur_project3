variable "region" {
  description = "AWS region"
  type        = string
}

variable "bucket_name" {
  description = "S3 bucket name"
  type        = string
}

variable "enable_versioning" {
  description = "Enable versioning for the bucket"
  type        = bool
  default     = true
}

variable "enable_encryption" {
  description = "Enable encryption for the bucket"
  type        = bool
  default     = true
}

variable "force_destroy" {
  description = "Force destroy the bucket and contents"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default = {
    Project = "DevOps"
    Owner   = "Mayur"
  }
}
