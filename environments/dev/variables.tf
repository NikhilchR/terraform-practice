variable "region" {
  type = string
}

variable "ami_id" {
  type    = string
  default = "ami-0c55b159cbfafe1f0" # replace with appropriate AMI per region
}
