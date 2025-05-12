variable "ssh_key" {
  default = "url_app"
}

variable "type" {
  default = "t2.micro"
}

//declared to define in main.tf to get the subnet id from output of subnet resource
variable "public_subnet_id" {}
//declared to define in main.tf to get the security_group id from output of security_group_resource
variable "vpc_security_group_ids" {}

variable "ami" {}