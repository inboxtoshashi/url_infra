variable "vpc_id" {}

variable "tags" {
	type    = map(string)
	default = {}
}

variable "name" {
	type    = string
	default = "url_igw"
}