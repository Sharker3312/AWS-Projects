resource "aws_internet_gateway" "traefik_igw" {
  vpc_id = aws_vpc.traefik_vpc.id
  
  tags = {
    Name = "traefik_IGW"
  }
}