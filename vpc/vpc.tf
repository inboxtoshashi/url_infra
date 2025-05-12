resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
  name   = "url_vpc"
  tags = {
    Name = "urlshortener"    
  }
}