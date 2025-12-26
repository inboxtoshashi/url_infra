region = "us-east-1"
env = "dev"
ami_ssm_path = "/labs/dev/base/ami"
vpc_cidr = "198.168.0.0/16"
availability_zone = "us-east-1a"
vpc_name = "urlshortener-dev-vpc"
name = "dev-ec2-instance"

tags = {
  Project     = "url_infra"
  Environment = "dev"
  ManagedBy   = "terraform"
}