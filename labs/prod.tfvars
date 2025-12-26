region = "us-east-1"
env = "prod"
ami_ssm_path = "/labs/prod/base/ami"
vpc_cidr = "10.0.0.0/16"
availability_zone = "us-east-1a"
vpc_name = "urlshortener-prod-vpc"
name = "prod-ec2-instance"

tags = {
  Project     = "url_infra"
  Environment = "prod"
  ManagedBy   = "terraform"
}