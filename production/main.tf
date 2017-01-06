provider "aws" {
  profile = "${var.profile}"
  region = "${var.region}"
}

module "vpc" {
  source = "../modules/shared/vpc"
  vpc_cidr_block = "${ var.vpc_cidr_block }"
  vpc_env = "${ var.env }"
  enable_dns_hostnames = "${ var.enable_dns_hostnames }"
  vpc_name = "${ var.domain_name }-${ var.env }"
}

module "subnets" {
  source = "../modules/prod/subnets"
  vpc_id = "${ module.vpc.vpc_id }"
  azs = "${ var.azs }"
  env = "${ var.env }"
  public_cdir_blocks = "${ var.public_cdir_blocks }"
  private_cdir_blocks = "${ var.private_cdir_blocks }"
  database_cdir_blocks = "${ var.database_cdir_blocks }"
  vpc_name = "${ var.domain_name }-${ var.env }"
  number_of_subnets = 3
}

resource "aws_route" "public-route" {
  route_table_id = "${ module.vpc.route_table_id }"
  gateway_id = "${ module.vpc.igw_id }"
  destination_cidr_block = "0.0.0.0/0"
  depends_on = ["module.vpc"]
}

resource "aws_route_table_association" "subnet-1" {
  subnet_id = "${ module.subnets.public_subnet_1 }"
  route_table_id = "${ module.vpc.route_table_id }"
  depends_on = ["module.vpc"]
}

resource "aws_route_table_association" "subnet-2" {
  subnet_id = "${ module.subnets.public_subnet_2}"
  route_table_id = "${ module.vpc.route_table_id }"
  depends_on = ["module.vpc"]
}

resource "aws_route_table_association" "subnet-3" {
  subnet_id = "${ module.subnets.public_subnet_3}"
  route_table_id = "${ module.vpc.route_table_id }"
  depends_on = ["module.vpc"]
}




