
output "public_subnet_1" {
  value = "${aws_subnet.public-subnet.0.id}"
}

output "public_subnet_2" {
  value = "${ aws_subnet.public-subnet.1.id }"
}

output "public_subnet_3" {
  value = "${ aws_subnet.public-subnet.2.id }"
}
