locals {
  number_of_azs = length(var.az_list)

  number_of_public_subnets = length(aws_subnet.subnets_public)

  public_subnet_ids_list = flatten([
    for subnet in aws_subnet.subnets_public : subnet.id
  ])

  nat_eip_ids_list = flatten([
    for eip in aws_eip.nat_gtw_public_ips : eip.id
  ])

  association_eip_nat_gtw = zipmap(local.public_subnet_ids_list, local.nat_eip_ids_list)
}
