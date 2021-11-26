resource "aws_subnet" "subnets_privadas_db" {
  for_each = toset(var.lista_ambientes_e_azs)
  vpc_id = var.vpc_data.vpc_id
  availability_zone = var.lista_ambientes_e_azs.value
  cidr_block = "${var.public_subnet_object.cidr_first_block}.${var.public_subnet_object.cidr_second_block}.${var.public_subnet_object.cidr_third_block + index(var.az_list, each.key)}.0/24"

  tags = {
    "Name" = "${var.public_subnet_object.name}-${each.key}"
    "az" = "${each.key}"
    "project" = "${var.project.name}"
  }
}

resource "aws_route_table" "route_table_privada"{
  vpc_id = var.vpc_data.vpc_id

  route {
    cidr_block = "0.0.0.0/24"
    gateway_id = var.nat_gtw_id
  }
}

resource "aws_route_table_association" "associação_subnets_a_route_table_privada" {
  for_each = aws_subnet.subnets_privadas_db
  subnet_id      = each.subnet_id
  route_table_id = aws_route_table.route_table_privada.id
}

resource "aws_instance" "ec2-privada-db" {
  for_each = aws_subnet.subnets_privadas_db
  subnet_id = aws_subnet.subnets_privadas_db.subnet_id
  ami= "ami-0e66f5495b4efdd0f"
  instance_type = "t3.large" 
  root_block_device {
    encrypted = true
    volume_size = 30
  }
  tags = {
    Name = "private-db-instance-${aws_subnet.subnets_privadas_db}"
  }
  vpc_security_group_ids = [aws_security_group.sg_private_db.id]
}
output "private-db-instances" {
  value = [
    for key, item in aws_subnet.subnets_privadas_db :
    "IDs: ${item.id}"
  ]
}

# output "private-db-instanc" {
#   value = [
#     for key, item in aws_subnet.subnets_privadas_db :
#     "IDs: ${item.id}"
#   ]
# }