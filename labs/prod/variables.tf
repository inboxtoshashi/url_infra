variable "region" {
  description = "AWS region to deploy resources into"
  type        = string
}

variable "env" {
  description = "Environment / lab name"
  type        = string
}

variable "ami_ssm_path" {
  description = "SSM parameter path which stores the AMI id"
  type        = string
}

variable "tags" {
  description = "Common tags applied to resources"
  type        = map(string)
}

variable "availability_zone" {
  description = "Default availability zone for subnets (e.g. us-east-1a)"
  type        = string
}

variable "vpc_name" {
  description = "Explicit VPC name for this environment"
  type        = string
}
