region = "us-east-1"
env = "dev"
ami_ssm_path = "/labs/dev/base/ami"
vpc_cidr = "198.168.0.0/16"
availability_zone = "us-east-1a"
vpc_name = "urlshortener-dev-vpc"
name = "dev-ec2-instance"
type = "t3.medium"

tags = {
  Project     = "url_infra"
  App         = "URL_Shortner"
  Environment = "dev"
  ManagedBy   = "terraform"
}