# ----------------------------------------------------------------------------
# Master nodes environment security group ingress and egress configuration.

resource "aws_security_group_rule" "master_k8s_ingress_admin" {
  type                     = "ingress"
  description              = "SG rule allowing all access to Master SG from Admin SG."
  from_port                = 0
  to_port                  = 0
  protocol                 = "all"
  source_security_group_id = var.admin_sg_id
  security_group_id        = aws_security_group.sg_k8s_master.id
}

resource "aws_security_group_rule" "master_k8s_ingress_public" {
  type                     = "ingress"
  description              = "SG rule allowing all access from Public SG to Master SG."
  from_port                = 0
  to_port                  = 0
  protocol                 = "all"
  source_security_group_id = var.sg_public_id
  security_group_id        = aws_security_group.sg_k8s_master.id
}

resource "aws_security_group_rule" "master_k8s_ingress_k8s_api" {
  type              = "ingress"
  description       = "SG rule allowing TCP access to port 6443 (K8s API Server) to Master SG."
  from_port         = 6443
  to_port           = 6443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = ["::/0"]
  security_group_id = aws_security_group.sg_k8s_master.id
}

resource "aws_security_group_rule" "master_k8s_egress_all" {
  type              = "egress"
  description       = "SG rule allowing all access to external networks and Internet from Master SG."
  from_port         = 0
  to_port           = 0
  protocol          = "all"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = ["::/0"]
  security_group_id = aws_security_group.sg_k8s_master.id
}


# ----------------------------------------------------------------------------
# Worker nodes environment security group ingress and egress configuration.

resource "aws_security_group_rule" "worker_k8s_ingress_admin" {
  type                     = "ingress"
  description              = "SG rule allowing all access to Worker SG from Admin SG."
  from_port                = 0
  to_port                  = 0
  protocol                 = "all"
  source_security_group_id = var.admin_sg_id
  security_group_id        = aws_security_group.sg_k8s_worker.id
}

resource "aws_security_group_rule" "worker_k8s_ingress_masters" {
  type                     = "ingress"
  description              = "SG rule allowing all access to Worker SG from Master SG."
  from_port                = 0
  to_port                  = 0
  protocol                 = "all"
  source_security_group_id = aws_security_group.sg_k8s_master.id
  security_group_id        = aws_security_group.sg_k8s_worker.id
}

resource "aws_security_group_rule" "worker_k8s_egress_all" {
  type              = "egress"
  description       = "SG rule allowing all access to external networks and Internet from Worker SG."
  from_port         = 0
  to_port           = 0
  protocol          = "all"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = ["::/0"]
  security_group_id = aws_security_group.sg_k8s_worker.id
}
