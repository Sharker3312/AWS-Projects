
variable "ami" {}
variable "instance_type" {}
variable "key_name" {}
#variable "security_groups" {}
#variable "user_data" {}

#Replace the resource with a module
module "ec2_instance" {
  #References file location of new module
  source = "./modules/ec2"

  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name

  subnet_id = module.security_group.subnet_id # Call the name of variable output 

  sg_id = module.security_group.sg_id


}

# Specify the name for the security group
module "security_group" {
  source = "./modules/security_group"



}
