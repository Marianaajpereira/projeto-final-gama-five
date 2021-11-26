variable "lista_ambientes_e_azs" {
  description = "Lista de ambientes (dev, stage, prod) e AZs"
  type        = list(object({
      ambiente = string
      az = string
  }))
}

variable "vpc_data" {
  description = "VPC details."
  type = object({
    vpc_id              = string
    route_table_private = string
    route_table_public  = string
  })
}

variable "private_subnet_db_object" {
  description = "subnet privada da instância de mysql"
  type = object({
    name              = string
    cidr_first_block  = number
    cidr_second_block = number
    cidr_third_block  = number
  })
}

variable "sg_private_db_object" {
  description = "Security group data for private db subnets."
  type = object({
    name        = string
    description = string
  })
}

variable "admin_sg_id" {
  description = "Security group ID of administration/development environment."
  type        = string
}

variable "project" {
  description = "Project details."
  type = object({
    name = string
  })
}

variable "nat_gtw_id"{
    description = "Id do Nat Gateway"
    type = string
}