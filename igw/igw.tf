resource "aws_internet_gateway" "gw" {
  tags = {
    Name = "url_igw"
  }
  vpc_id = var.vpc_id
}