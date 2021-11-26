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

data "aws_subnets" "public_subnet_list" {
  filter {
    name = "vpc-id"
    values = [var.vpc_data.vpc_id]
  }
  tags = {
    "Name" = "subnet-public-gama-five*"
  }
}

# data "aws_subnet" "public_subnet_id_list" {
#   for_each = toset(data.aws_subnets.public_subnet_list.ids)
#   id       = each.value
# }