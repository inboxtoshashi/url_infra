variable "ssh_key" {
  type    = string
  default = "url_app"
}

variable "type" {
  type    = string
  default = "t2.micro"
}

variable "public_subnet_id" {
  type = string
}

variable "vpc_security_group_ids" {
  type = list(string)
}

variable "ami_id" {
  type = string
}

variable "iam_instance_profile" {
  type        = string
  description = "IAM instance profile name for EC2"
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "name" {
  description = "Name tag for the EC2 instance"
  type        = string
}