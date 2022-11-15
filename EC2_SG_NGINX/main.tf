terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.38.0"
    }
  }
}


provider "aws" {
  region = "ap-northeast-1"
}



resource "aws_security_group" "instance_firewall" {
  name        = "allow_ALL_TCP_80_SSH_TERRAFROM"
  description = "Allow all tcp 80 and ssh , terrafrom demo"
  # default vpc
  # vpc_id

  ingress {
    description      = "all ssh access"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = var.input_ipv4
  }

  ingress {
    description      = "HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = var.input_ipv4
  }

  // allow all
   egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

}

resource "aws_instance" "app_server" {
  # free tier, check region and ami install 
  ami = "ami-0de5311b2a443fb89"

  instance_type = "t2.micro"

  tags = {
    Name = "Instance have been created by terraform"
  }
  user_data = <<EOF
    #!/bin/bash
    sudo yum update -y
    sudo amazon-linux-extras install nginx1 -y 
    sudo systemctl enable nginx
    sudo systemctl start nginx
  EOF


# name not id
  security_groups = [aws_security_group.instance_firewall.name]   # ref

}
