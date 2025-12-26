variable "route" {
  default = "0.0.0.0/0"
}
variable "gateway_id" {}
variable "vpc_id" {}
variable "public_subnet_id" {}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "name" {
  type    = string
  default = "url_public_route_table"
}

variable "env" {
  description = "Environment name (e.g., dev, prod)"
  type        = string
}