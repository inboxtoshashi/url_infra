resource "aws_subnet" "public_subnet" {
  vpc_id            = var.vpc_id
  cidr_block        = var.public_subnet_cidr
  availability_zone = var.availability_zone
  //to make the subnet public and attache public_ipv4_ip to ec2
  map_public_ip_on_launch = true
  tags = merge(var.tags, { Name = var.name, Environment = var.env })
}