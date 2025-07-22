provider "aws" {
  region = "us-east-1"
}

/*import {
  id = "i-030ec5cc4299bd1e7"
  to = aws_instance.amznmch
}*/
#terraform plan -generate-config-out=generated_resources.tf
resource "aws_instance" "amznmch" {
  ami                                  = "ami-05ffe3c48a9991133"
  associate_public_ip_address          = true
  instance_type                        = "t2.micro"
  count = var.deploy_instance_count ? 1:0
  availability_zone                    = "us-east-1d"
  security_groups                      = ["default"]
  source_dest_check                    = true
  subnet_id                            = "subnet-010e73db9d10af8b7"
  tags = {
    Name = "practce-terraform"
  }
  root_block_device {
    volume_size = lookup(var.instance_type, var.environment, 10)
  }
}
#terraform import aws_instance.wnmch "i-030ec5cc4299bd1e7"

#If we change instance type to t3.medium manually in aws console
#run terraform refresh
#terraform plan
# aws_instance.amznmch will be updated in-place
  ~ resource "aws_instance" "amznmch" {
        id                                   = "i-030ec5cc4299bd1e7"
      ~ instance_type                        = "t3.medium" -> "t2.micro"
      ~ public_dns                           = "ec2-174-129-57-121.compute-1.amazonaws.com" -> (known after apply)
      ~ public_ip                            = "174.129.57.121" -> (known after apply)
        tags                                 = {
            "Name" = "practce-terraform"
        }
      + user_data_replace_on_change          = false
        # (34 unchanged attributes hidden)

        # (8 unchanged blocks hidden)
    }