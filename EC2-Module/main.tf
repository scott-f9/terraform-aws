provider "aws"{
  region = element(var.region, 0)
}

variable "public_subnet_id" {} 
variable "private_subnet_id" {}
variable "vpc_id" {}
variable "sg_id" {}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"]
}

  resource "aws_instance" "public_web" {
  count                  = var.ec2count
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t2.micro"
  key_name               = var.keyname
  subnet_id              = var.public_subnet_id
  vpc_security_group_ids = [var.sg_id]
    user_data         = <<-EOF
        #!/bin/bash
        sudo apt-get update
        sudo apt-get install apache2 -y
        cd /var/www/html
        sudo  echo "hello $(hostname -f)" > index.html
        systemctl restart httpd
        systemctl enable httpd
        EOF
}

  resource "aws_instance" "private_web" {
  count                  = var.ec2count
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t2.micro"
  key_name               = var.keyname
  subnet_id              = var.private_subnet_id
  user_data         = <<-EOF
        #!/bin/bash
        sudo apt-get update
        sudo apt-get install apache2 -y
        cd /var/www/html
        sudo  echo "hello $(hostname -f)" > index.html
        systemctl restart httpd
        systemctl enable httpd
        EOF
}
