provider "aws" {
  profile = "${var.profile}"
  region = "${var.region}"
}

module "vpc" {
  source = "../modules/vpc"
  vpc-name = "${ var.domain-name }-${ var.vpc-env }-VPC"
  cidr-block = "${ var.cidr-block }"
  vpc-env = "${ var.vpc-env }"
}

