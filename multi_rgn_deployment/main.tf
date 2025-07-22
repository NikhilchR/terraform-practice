terraform {
  required_providers {
    aws = {
        version = "~>6.2.0"
    }
  }
}

provider "aws" {
  region = var.region
}


resource "aws_instance" "regionsd" {
  for_each =  toset(var.region)
  ami = var.ami
  instance_type = var.instance_type
}