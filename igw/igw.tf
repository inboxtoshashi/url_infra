resource "aws_internet_gateway" "gw" {
  name   = "url_igw"
  tags = {
    Name = "url_igw"
  }
  vpc_id = var.vpc_id
}