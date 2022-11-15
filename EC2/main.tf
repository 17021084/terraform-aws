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




  security_groups = ["default"] # name not id

}
