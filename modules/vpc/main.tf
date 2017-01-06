# creates VPC for aws
variable "cidr-block" {}
variable "vpc-env" {}
variable "vpc-name" {}

resource "aws_vpc" "launchpad-vpc" {
  cidr_block = "${ var.cidr-block}"
  tags {
    Name = "${ var.vpc-name }"
    Environment = "${ var.vpc-env }"
  }
}
