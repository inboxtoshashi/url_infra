resource "aws_route_table" "public_route_table" {
  vpc_id = var.vpc_id
  route {
    cidr_block = var.route
    gateway_id = var.gateway_id
  }
  tags = {
    Name = "url_public_route_table"
  }
}

resource "aws_route_table_association" "public-rt" {
  subnet_id      = var.public_subnet_id
  route_table_id = aws_route_table.public_route_table.id
}