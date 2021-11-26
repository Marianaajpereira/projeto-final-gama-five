# ----------------------------------------------------------------------------
# Private subnets for Kubernetes environment nd private route table 
# association

resource "aws_subnet" "k8s_subnets_private" {
  for_each          = toset(var.az_list)
  vpc_id            = var.vpc_data.vpc_id
  availability_zone = each.key
  cidr_block        = "${var.private_subnet_object.cidr_first_block}.${var.private_subnet_object.cidr_second_block}.${var.private_subnet_object.cidr_third_block + index(var.az_list, each.key)}.0/24"

  tags = {
    "Name"    = "${var.private_subnet_object.name}-${each.key}"
    "az"      = "${each.key}"
    "project" = "${var.project.name}"
  }
}

resource "aws_route_table_association" "rtb_private_subnet_k8s_association" {
  for_each       = aws_subnet.k8s_subnets_private
  route_table_id = var.vpc_data.route_table_private
  subnet_id      = each.value.id
}
