resource "aws_security_group" "traefik_sg" {
  name        = "traefik-security-group"
  vpc_id = aws_vpc.traefik_vpc.id
  description = "Allow HTTP and HTTPS traffic"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
   ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Permitir tráfico SSH desde cualquier IP
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # Allow all traffic
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "traefik_sg"
  }
}
