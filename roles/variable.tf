variable "region" {
  description = "AWS region to scope the SSM parameter access"
  type        = string
  default     = "us-east-1"
}

variable "ssm_parameter_name" {
  description = "The name of the SSM parameter to allow access to"
  type        = string
  default     = "/jenkins/secret"
}

variable "iam_role_name" {
  description = "The name of the IAM role to create"
  type        = string
  default     = "ec2_ssm_access_role"
}

variable "iam_instance_profile_name" {
  description = "The name of the IAM instance profile to associate with EC2"
  type        = string
  default     = "ec2_ssm_instance_profile"
}
