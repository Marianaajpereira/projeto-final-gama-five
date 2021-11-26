# ----------------------------------------------------------------------------
# Public subnets security group ingress and egress configuration.

resource "aws_security_group_rule" "sg-subnet-privada-db" {
  type              = "ingress"
  description       = "SG rule mysql access."
  from_port         = 3306
  to_port           = 3306
  protocol          = "all"
  source_security_group_id = var.admin_sg_id
  security_group_id = aws_security_group.sg_private_db.id
}


resource "aws_security_group_rule" "public_egress_all" {
  type              = "egress"
  description       = "SG rule allowing all access to external networks and Internet from Public SG."
  from_port         = 0
  to_port           = 0
  protocol          = "all"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = ["::/0"]
  security_group_id = aws_security_group.sg_private_db.id
}
