variable "ami" {
    description = "ami"
    default = "ami-05ffe3c48a9991133"
}
variable "instance_type" {
    description = "instance_type"
    default = "t2.medium"
}

variable "region" {
  default = ["us-east-1", "us-west-1"]
}