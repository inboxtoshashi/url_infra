variable "ingressrules" {
  description = "List of allowed ingress TCP ports"
  default     = [22, 80, 443, 5001, 8080]
}

variable "egressrules" {
  description = "List of allowed egress TCP ports"
  default = [22, 80, 443, 5001, 8080]
}

variable "vpc_id" {}