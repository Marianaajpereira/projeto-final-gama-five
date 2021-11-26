# ----------------------------------------------------------------------------
# Security group for resources inside public subnets

resource "aws_security_group" "sg_public" {
  name        = var.sg_public_object.name
  description = var.sg_public_object.description
  vpc_id      = var.vpc_data.vpc_id

  tags = {
    "Name" = "${var.sg_public_object.name}"
    "project" = "${var.project.name}"
  }
} 
