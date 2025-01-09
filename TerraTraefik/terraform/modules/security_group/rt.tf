resource "aws_route_table" "traefik_route_table" {
  vpc_id = aws_vpc.traefik_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.traefik_igw.id
  }

  tags = {
    Name = "route_table"
  }
}
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.traefik_subnet.id
  route_table_id = aws_route_table.traefik_route_table.id
}