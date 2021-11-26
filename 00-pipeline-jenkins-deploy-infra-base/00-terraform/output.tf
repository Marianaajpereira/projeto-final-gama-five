output "public_subnets_ids" {
  value = "${local.public_subnet_ids_list}"
}

output "public_sg_id" {
  value = "${aws_security_group.sg_public.id}"
}

output "nat-gtw-ids" {
  value = [
    for key, item in aws_nat_gateway.private_subnet_nat_gtw :
    "IDs: ${item.id}"
  ]
}

