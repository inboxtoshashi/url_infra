region = "us-east-1"
env = "prod"
ami_ssm_path = "/labs/prod/base/ami"
vpc_cidr = "10.0.0.0/16"
availability_zone = "us-east-1a"
vpc_name = "urlshortener-prod-vpc"
name = "prod-ec2-instance"
type = "t3.medium"
tags = {
  Project     = "url_infra"
  App         = "URL_Shortner"
  Environment = "prod"
  ManagedBy   = "terraform"
}