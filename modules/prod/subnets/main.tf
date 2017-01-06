# Launcpad production subnets
# contains 3 public , 3 private and 3 database subnets

variable "azs" {
  type = "list"
}
variable "public_cdir_blocks" {
  type = "list"
}
variable "private_cdir_blocks" {
  type = "list"
}
variable "database_cdir_blocks" {
  type = "list"
}
variable "vpc_name" {}
variable "vpc_id" {}
variable "env" {}
variable "number_of_subnets" {}


resource "aws_subnet" "public-subnet" {
  count = "${ var.number_of_subnets }"
  availability_zone = "${element(var.azs, count.index)}"
  map_public_ip_on_launch = "true"
  cidr_block = "${element(var.public_cdir_blocks, count.index)}"
  vpc_id = "${ var.vpc_id }"
  tags {
    Name = "${ var.vpc_name }-public-subnet-${count.index + 1}"
    Environment = "${ var.env }"
  }

}

resource "aws_subnet" "private-subnet" {
  count = "${ var.number_of_subnets }"
  availability_zone = "${element(var.azs, count.index)}"
  cidr_block = "${element(var.private_cdir_blocks, count.index)}"
  vpc_id = "${var.vpc_id}"
  tags {
    Name = "${ var.vpc_name }-private-subnet-${count.index + 1}"
    Environment = "${ var.env }"
  }

}

resource "aws_subnet" "database-private-subnet" {
  count = 3
  availability_zone = "${element(var.azs, count.index)}"
  cidr_block = "${element(var.database_cdir_blocks, count.index)}"
  vpc_id = "${var.vpc_id}"
  tags {
    Name = "${ var.vpc_name}-db-private-subnet-${count.index + 1}"
    Environment = "${ var.env }"
  }

}

