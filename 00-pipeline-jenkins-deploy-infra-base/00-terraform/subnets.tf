# ----------------------------------------------------------------------------
# Public subnets for Kubernetes environment and public route table 
# association

resource "aws_subnet" "subnets_public" {
  for_each = toset(var.az_list)
  vpc_id = var.vpc_data.vpc_id
  availability_zone = each.key
  cidr_block = "${var.public_subnet_object.cidr_first_block}.${var.public_subnet_object.cidr_second_block}.${var.public_subnet_object.cidr_third_block + index(var.az_list, each.key)}.0/24"

  tags = {
    "Name" = "${var.public_subnet_object.name}-${each.key}"
    "az" = "${each.key}"
    "project" = "${var.project.name}"
  }
}

resource "aws_route_table_association" "rtb_public_subnet_association" {
  for_each = aws_subnet.subnets_public
  route_table_id = var.vpc_data.route_table_public
  subnet_id = each.value.id
}

# ----------------------------------------------------------------------------
# Elastic IPs for NAT gateways in public subnets

resource "aws_eip" "nat_gtw_public_ips" {
  for_each = aws_subnet.subnets_public
  vpc = true

  tags = {
    "az" = "${each.value.availability_zone}"
    "subnet" = "${each.value.tags.Name}"
    "subnet-id" = "${each.value.id}"
    "project" = "${var.project.name}"
  }
}


# ----------------------------------------------------------------------------
# NAT gateways for private subnets external (internet) access

resource "aws_nat_gateway" "private_subnet_nat_gtw" {
  for_each = local.association_eip_nat_gtw
  subnet_id = each.key
  connectivity_type = "public"
  allocation_id = each.value

  tags = {
    "Name" = "private_subnet_nat_gtw_${each.key}"
    "eip-id" = "${each.value}"
    "subnet-id" = "${each.key}"
    "project" = "${var.project.name}"
  }
}


# ----------------------------------------------------------------------------
# NAT gateways for private subnets external (internet) access association

resource "aws_route" "rtb_nat_gtw_routes" {
  for_each = aws_nat_gateway.private_subnet_nat_gtw
  route_table_id = var.vpc_data.route_table_private
  nat_gateway_id = each.value.id
  destination_cidr_block    = "10.60.0.0/16"
}