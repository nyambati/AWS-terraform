output "vpc_id" {
  value = "${aws_vpc.vpc.id}"
}

output "igw_id" {
  value = "${ aws_internet_gateway.igw.id }"
}

output "route_table_id" {
  value = "${ aws_route_table.public_route_table.id }"
}
