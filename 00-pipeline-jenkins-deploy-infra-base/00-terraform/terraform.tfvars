project = {
  name = "projeto-final-gama-five"
}

vpc_data = {
  route_table_private = "rtb-026cbd51b94f903c0"
  route_table_public  = "rtb-06387ff70ca3eb24c"
  vpc_id              = "vpc-0482dd2ef3995ba71"
}

az_list = ["sa-east-1a", "sa-east-1b", "sa-east-1c"]

admin_sg_id = "sg-0cfc617f0fcf3a5a4"

public_subnet_object = {
  cidr_first_block  = 10
  cidr_second_block = 60
  cidr_third_block  = 0
  name              = "subnet-public-gama-five"
}


sg_public_object = {
  name        = "sgPublicGamaFive"
  description = "Security group for public subnets."
}