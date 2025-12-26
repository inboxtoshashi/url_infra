variable "ingressrules" {
  description = "List of allowed ingress TCP ports"
  default     = [22, 80, 443, 5001, 8080, 9090, 3000, 9091]
}

variable "egressrules" {
  description = "List of allowed egress TCP ports"
  default = [22, 80, 443, 5001, 8080, 9090, 3000, 9091]
}

variable "vpc_id" {}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "name" {
  type    = string
  default = "url_sg"
}

variable "env" {
  description = "Environment name (e.g., dev, prod)"
  type        = string
}
