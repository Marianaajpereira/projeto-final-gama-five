resource "aws_security_group" "sg_private_db" {
  name        = var.sg_private_db_object.name
  description = var.sg_private_db_object.description
  vpc_id      = var.vpc_data.vpc_id

  tags = {
    "Name" = "sgPrivateDbGamaFive"
  }
} 