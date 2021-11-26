data "aws_ami" "k8s-gamafive" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

data "aws_subnet_ids" "public_subnet_id_list" {
  vpc_id = var.vpc_data.vpc_id

  tags = {
    "Name" = "subnet-public-gama-five*"
  }
}