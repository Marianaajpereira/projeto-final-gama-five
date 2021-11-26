# resource "aws_subnet" "subnets_privadas_db" {
#   for_each = toset(var.lista_ambientes_e_azs)
#   vpc_id = var.vpc_data.vpc_id
#   availability_zone = var.lista_ambientes_e_azs.az
#   cidr_block = "${var.private_subnet_db_object.cidr_first_block}.${var.private_subnet_db_object.cidr_second_block}.${var.private_subnet_db_object.cidr_third_block}.0/24"

#   tags = {
#     "Name" = "${var.private_subnet_db_object.name}-${var.lista_ambientes_e_azs}"
#     "az" = "${each.key}"
#     "project" = "${var.project.name}"
#   }
# }

resource "aws_subnet" "subnets_privadas_db-dev" {
  vpc_id = var.vpc_data.vpc_id
  availability_zone = "sa-east-1a"
  cidr_block = "10.60.20.0/24"
  tags = {
    "Name" = "subnet-privada-db-dev"
  }
}

resource "aws_subnet" "subnets_privadas_db-stage" {
  vpc_id = var.vpc_data.vpc_id
  availability_zone = "sa-east-1b"
  cidr_block = "10.60.30.0/24"
  tags = {
    "Name" = "subnet-privada-db-stage"
  }
}

resource "aws_subnet" "subnets_privadas_db-prod" {
  vpc_id = var.vpc_data.vpc_id
  availability_zone = "sa-east-1a"
  cidr_block = "10.60.40.0/24"
  tags = {
    "Name" = "subnet-privada-db-prod"
  }
}

resource "aws_route_table" "route_table_privada"{
  vpc_id = var.vpc_data.vpc_id

  route {
    cidr_block = "0.0.0.0/24"
    gateway_id = var.nat_gtw_id
  }
}

resource "aws_route_table_association" "associação_subnets_a_route_table_privada-dev" {
  subnet_id      = aws_subnet.subnets_privadas_db-dev.id
  route_table_id = aws_route_table.route_table_privada.id
}

resource "aws_route_table_association" "associação_subnets_a_route_table_privada-stage" {
  subnet_id      = aws_subnet.subnets_privadas_db-stage.id
  route_table_id = aws_route_table.route_table_privada.id
}

resource "aws_route_table_association" "associação_subnets_a_route_table_privada-prod" {
  subnet_id      = aws_subnet.subnets_privadas_db-prod.id
  route_table_id = aws_route_table.route_table_privada.id
}

# resource "aws_instance" "ec2-privada-db" {
#   for_each = aws_subnet.subnets_privadas_db
#   subnet_id = aws_subnet.subnets_privadas_db.subnet_id
#   ami= "ami-0e66f5495b4efdd0f"
#   instance_type = "t3.large" 
#   root_block_device {
#     encrypted = true
#     volume_size = 30
#   }
#   tags = {
#     Name = "private-db-instance-${aws_subnet.subnets_privadas_db}"
#   }
#   vpc_security_group_ids = [aws_security_group.sg_private_db.id]
# }


resource "aws_instance" "ec2-privada-db-dev" {
  subnet_id = aws_subnet.subnets_privadas_db-dev.id
  ami= "ami-0e66f5495b4efdd0f"
  instance_type = "t3.large" 
  root_block_device {
    encrypted = true
    volume_size = 30
  }
  tags = {
    Name = "private-db-instance-dev"
  }
  vpc_security_group_ids = [aws_security_group.sg_private_db.id]
}

resource "aws_instance" "ec2-privada-db-stage" {
  subnet_id = aws_subnet.subnets_privadas_db-stage.id
  ami= "ami-0e66f5495b4efdd0f"
  instance_type = "t3.large" 
  root_block_device {
    encrypted = true
    volume_size = 30
  }
  tags = {
    Name = "private-db-instance-stage"
  }
  vpc_security_group_ids = [aws_security_group.sg_private_db.id]
}


resource "aws_instance" "ec2-privada-db-prod" {
  subnet_id = aws_subnet.subnets_privadas_db-prod.id
  ami= "ami-0e66f5495b4efdd0f"
  instance_type = "t3.large" 
  root_block_device {
    encrypted = true
    volume_size = 30
  }
  tags = {
    Name = "private-db-instance-prod"
  }
  vpc_security_group_ids = [aws_security_group.sg_private_db.id]
}



output "private-db-subnets" {
  value = [aws_subnet.subnets_privadas_db-dev.id, aws_subnet.subnets_privadas_db-stage.id, aws_subnet.subnets_privadas_db-prod.id]
  
}

# output "private-db-instanc" {
#   value = [
#     for key, item in aws_subnet.subnets_privadas_db :
#     "IDs: ${item.id}"
#   ]
# }