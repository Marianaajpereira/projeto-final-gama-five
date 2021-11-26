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