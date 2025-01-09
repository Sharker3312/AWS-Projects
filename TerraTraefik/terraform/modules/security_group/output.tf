output "subnet_id" {
  value = aws_subnet.traefik_subnet.id
}

output "sg_id" {
  value = aws_security_group.traefik_sg.id
}