variable "vpc_cidr" {
  description = "CIDR block for the VPC (provided by root tfvars)"
  type        = string
}

variable "vpc_name" {
  description = "Name tag for the VPC"
  type        = string
}

variable "tags" {
  description = "Additional tags to apply to the VPC"
  type        = map(string)
  default     = {}
}

variable "env" {
  description = "Environment name (e.g., dev, prod)"
  type        = string
}