provider "aws" {
  region = "sa-east-1"
}

resource "aws_subnet" "subnet-gamafive-db-dev" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.80.12.0/16"
  availability_zone = "sa-east-1a"

  tags = {
    Name = "subnet-gamafive-db-dev"
  }
}

resource "aws_subnet" "subnet-gamafive-db-stage" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.80.24.0/16"
  availability_zone = "sa-east-1b"

  tags = {
    Name = "subnet-gamafive-db-stage"
  }
}

resource "aws_subnet" "subnet-gamafive-db-prod" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.80.36.0/16"
  availability_zone = "sa-east-1c"

  tags = {
    Name = "subnet-gamafive-db-prod"
  }
}

resource "aws_nat_gateway" "nat-gw-db-gamafive" {
  allocation_id = aws_eip.example.id
  subnet_id     = aws_subnet.example.id

  tags = {
    Name = "gw NAT"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.example]
}








resource "aws_instance" "dev_img_deploy_jenkins" {
  subnet_id = "subnet-03b5a698df15b26ee"
  ami= "ami-0e66f5495b4efdd0f"
  instance_type = "t2.medium" 
  key_name = "kp-gamafive"
  associate_public_ip_address = true
  root_block_device {
    encrypted = true
    volume_size = 30
  }
  tags = {
    Name = "dev_img_deploy_jenkins-gamafive"
  }
  vpc_security_group_ids = [aws_security_group.acesso_jenkins_dev_img.id]
}

resource "aws_security_group" "acesso_jenkins_dev_img" {
  name        = "acesso_jenkins_dev_img_gamafive"
  description = "acesso_jenkins_dev_img inbound traffic"
  vpc_id      = "vpc-0482dd2ef3995ba71"

  ingress = [
    {
      description      = "SSH from VPC"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids  = null,
      security_groups : null,
      self : null
    },
    {
      description      = "SSH from VPC"
      from_port        = 80
      to_port          = 80
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids  = null,
      security_groups : null,
      self : null
    },
  ]

  egress = [
    {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"],
      prefix_list_ids  = null,
      security_groups : null,
      self : null,
      description : "Libera dados da rede interna"
    }
  ]

  tags = {
    Name = "jenkins-dev-img-lab-gamafive"
  }
}

# terraform refresh para mostrar o ssh
output "dev_img_deploy_jenkins" {
  value = [
    "resource_id: ${aws_instance.dev_img_deploy_jenkins.id}",
    "public_ip: ${aws_instance.dev_img_deploy_jenkins.public_ip}",
    "public_dns: ${aws_instance.dev_img_deploy_jenkins.public_dns}",
    "ssh -i /var/lib/jenkins/.ssh/kp-gamafive.pem ubuntu@${aws_instance.dev_img_deploy_jenkins.public_dns}"
  ]
}
