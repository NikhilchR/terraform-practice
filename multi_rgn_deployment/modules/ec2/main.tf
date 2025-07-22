terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
    }
  }
}

resource "aws_instance" "regions_deploymt" {
  ami = var.ami
  instance_type = var.instance_type
  tags = {
    Name = var.instance_name
  }
}