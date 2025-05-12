resource "aws_subnet" "public_subnet" {
  vpc_id            = var.vpc_id
  name              = "url_subnet"
  cidr_block        = var.public_subnet_cidr
  availability_zone = var.region
  //to make the subnet public and attache public_ipv4_ip to ec2
  map_public_ip_on_launch = true
  tags = {
    Name = "public_subnet"
  }
}