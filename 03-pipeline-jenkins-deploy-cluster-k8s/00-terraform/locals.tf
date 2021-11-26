locals {
  number_of_azs = length(var.az_list)

  number_of_private_subnets = length(aws_subnet.k8s_subnets_private)

  private_subnet_ids_list = flatten([
    for subnet in aws_subnet.k8s_subnets_private : subnet.id
  ])

  public_subnet_id_list = flatten([
    for subnet in data.aws_subnet.public_subnet_id_list: subnet
  ])

}
