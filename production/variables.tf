variable "profile" {}
variable "region" {}
variable "domain_name" {}
variable "vpc_cidr_block" {}
variable "env" {}
variable "enable_dns_hostnames" {}

variable "azs" {
  description = "Run the EC2 Instances in these Availability Zones"
  type = "list"
  default = ["us-east-1a", "us-east-1c", "us-east-1d"]
}

variable "private_cdir_blocks" {
  type = "list"
  description = ""
  default = [
    "10.1.1.0/24",
    "10.1.2.0/24",
    "10.1.16.0/24"
  ]
}


variable "public_cdir_blocks" {
  type = "list"
  description = ""
  default = [
    "10.1.15.0/24",
    "10.1.7.0/24",
    "10.1.8.0/24"
  ]
}

variable "database_cdir_blocks" {
  type = "list"
  description = ""
  default = [
    "10.1.10.0/24",
    "10.1.17.0/24",
    "10.1.18.0/24"
  ]
}


