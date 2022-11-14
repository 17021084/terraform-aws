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
    Name = "Instance_have_been_created_by terraform"
  }
}