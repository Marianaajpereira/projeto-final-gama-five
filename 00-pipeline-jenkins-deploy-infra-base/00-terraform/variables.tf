variable "project" {
  description = "Project details."
  type = object({
    name = string
  })
}



variable "vpc_data" {
  description = "VPC details."
  type = object({
    vpc_id              = string
    route_table_private = string
    route_table_public  = string
  })
}

variable "az_list" {
  description = "Availability zone names list."
  type        = list(string)
}

variable "admin_sg_id" {
  description = "Security group ID of administration/development environment."
  type        = string
}

variable "public_subnet_object" {
  description = "Public subnet template for Kubernetes environment."
  type = object({
    name              = string
    cidr_first_block  = number
    cidr_second_block = number
    cidr_third_block  = number
  })
}



variable "sg_public_object" {
  description = "Security group data for Public subnets in Kubernetes environment."
  type = object({
    name        = string
    description = string
  })
}



