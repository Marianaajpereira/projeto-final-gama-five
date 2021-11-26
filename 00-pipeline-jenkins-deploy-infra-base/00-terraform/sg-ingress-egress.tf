# ----------------------------------------------------------------------------
# Public subnets security group ingress and egress configuration.

resource "aws_security_group_rule" "public_ingress_admin" {
  type              = "ingress"
  description       = "SG rule allowing all access to Public SG from Admin SG."
  from_port         = 0
  to_port           = 0
  protocol          = "all"
  source_security_group_id = var.admin_sg_id
  security_group_id = aws_security_group.sg_public.id
}

resource "aws_security_group_rule" "public_ingress_http" {
  type              = "ingress"
  description       = "SG rule allowing HTTP access to Public SG from anywhere."
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = ["::/0"]
  security_group_id = aws_security_group.sg_public.id
}

resource "aws_security_group_rule" "public_ingress_https" {
  type              = "ingress"
  description       = "SG rule allowing HTTPS access to Public SG from anywhere."
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = ["::/0"]
  security_group_id = aws_security_group.sg_public.id
}


resource "aws_security_group_rule" "public_egress_all" {
  type              = "egress"
  description       = "SG rule allowing all access to external networks and Internet from Public SG."
  from_port         = 0
  to_port           = 0
  protocol          = "all"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = ["::/0"]
  security_group_id = aws_security_group.sg_public.id
}
