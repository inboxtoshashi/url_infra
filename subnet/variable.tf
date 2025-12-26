variable "public_subnet_cidr" {
  default = "198.168.1.0/24"
}

variable "availability_zone" {
  description = "Availability zone for this subnet (e.g. us-east-1a)"
  type        = string
}

variable "vpc_id" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "name" {
  type    = string
  default = "url_public_subnet"
}

variable "env" {
  description = "Environment name (e.g., dev, prod)"
  type        = string
}