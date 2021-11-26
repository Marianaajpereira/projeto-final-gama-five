lista_ambientes_e_azs = [
    {
    ambiente="dev",
    az="sa-east-1a"
    },
    {
    ambiente="stage",
    az="sa-east-1b"
    },
    {
    ambiente="prod",
    az="sa-east-1c"
    }]

vpc_data = {
  route_table_private = "rtb-026cbd51b94f903c0"
  route_table_public  = "rtb-06387ff70ca3eb24c"
  vpc_id              = "vpc-0482dd2ef3995ba71"
}

private_subnet_db_object = {
  cidr_first_block  = 10
  cidr_second_block = 60
  cidr_third_block  = 10
  name              = "subnet-private-db-gama-five"
}

sg_private_db_object = {
  name        = "sgPrivateDbGamaFive"
  description = "Security group for db subnets."
}

admin_sg_id = "sg-0cfc617f0fcf3a5a4"

project = {
  name = "projeto-final-gama-five"
}

nat_gtw_id = "nat-065a770ec8dbb71a5"