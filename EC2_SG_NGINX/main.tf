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



resource "aws_security_group" "instance_file" {
  name        = "allow_ALL_TCP_80_SSH_TERRAFROM"
  description = "Allow all tcp 80 and ssh , terrafrom demo"
  # default vpc
  # vpc_id

  ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
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

}

