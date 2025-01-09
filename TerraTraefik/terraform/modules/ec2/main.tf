variable "ami" {}
variable "instance_type" {}
variable "key_name" {}

resource "aws_instance" "ec2" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name

  vpc_security_group_ids = [var.sg_id]
  subnet_id = var.subnet_id



  user_data = "${file("./modules/ec2/install_docker.sh")}"

  tags = {
    Name = "traefik-demo"
  }
}

