variable "role_name" {
  type = string
}

variable "service_principals" {
  type = list(string)
}

variable "tags" {
  type    = map(string)
  default = {}
}
