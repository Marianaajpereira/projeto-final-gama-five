resource "aws_security_group" "sg_private_db" {
  name        = var.sg_private_db_object.name
  description = var.sg_private_db_object.description
  vpc_id      = var.vpc_data.vpc_id


   ingress = [    {
      description      = "mysql access"
      from_port        = 3306
      to_port          = 3306
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids = null,
      security_groups = null,
      self            = null
    }]

     egress = [
    {
      from_port        = 0
      to_port          = 0
      protocol         = "all"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"],
      prefix_list_ids  = null,
      security_groups  = null,
      self             = null,
      description      = "Libera dados da rede interna"
    }
  ]

  tags = {
    "Name" = "sgPrivateDbGamaFive"
  }
} 