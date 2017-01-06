# creates VPC for aws
variable "vpc_cidr_block" {}
variable "vpc_env" {}
variable "vpc_name" {}
variable "enable_dns_hostnames" {}

resource "aws_vpc" "vpc" {
  cidr_block = "${ var.vpc_cidr_block }"
  enable_dns_hostnames = "${ var.enable_dns_hostnames }"

  tags {
    Name = "${ var.vpc_name }-vpc"
    Environment = "${ var.vpc_env }"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = "${ aws_vpc.vpc.id }"
  tags {
      Name = "${ var.vpc_name }-igw"
      Environment = "${ var.vpc_env }"
  }
}

resource "aws_route_table" "public_route_table" {
  vpc_id = "${ aws_vpc.vpc.id }"
  tags {
    Name = "${ var.vpc_name}-route-table"
    Environment = "${ var.vpc_env }"
  }
}

