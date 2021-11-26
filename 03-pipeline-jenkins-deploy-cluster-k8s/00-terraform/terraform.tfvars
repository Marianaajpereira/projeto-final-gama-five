project = {
  name = "projeto-final-gama-five"
}

custom_ami = "ami-05cae7d81b1a005ac"

nlb_lb_proxy_object = {
  is_internal = false
  name        = "nlb-k8s-proxy"
}

container_orchestration = {
  cluster_name     = "k8s-gama-five"
  engine           = "kubernetes"
  network_template = "weave"
}

container_engine = {
  name = "docker"
}

vpc_data = {
  route_table_private = "rtb-026cbd51b94f903c0"
  route_table_public  = "rtb-06387ff70ca3eb24c"
  vpc_id              = "vpc-0482dd2ef3995ba71"
}

az_list = ["sa-east-1a", "sa-east-1b", "sa-east-1c"]

admin_sg_id = "sg-0cfc617f0fcf3a5a4"

private_subnet_object = {
  cidr_first_block  = 10
  cidr_second_block = 60
  cidr_third_block  = 210
  name              = "subnet-k8s-private-gama-five"
}

sg_master_object = {
  name        = "sgk8sMaster"
  description = "Security group for Kubernetes master nodes."
}

sg_worker_object = {
  name        = "sgk8sWorker"
  description = "Security group for Kubernetes worker nodes."
}

instance_k8s_master_object = {
  type            = "c5.2xlarge"
  key_pair        = "kp-gamafive"
  iam_profile     = "aws-cli-ec2"
  number_of_nodes = 1
  public_ip       = false
  root_ebs_size   = 32
  tags = {
    name               = "gf-k8s-master-node"
    instance_group     = "control-plane"
    instance_sub_group = ["masters-primary", "masters-replica"]
  }
}

instance_k8s_worker_object = {
  type            = "t3.large"
  key_pair        = "kp-gamafive"
  iam_profile     = "aws-cli-ec2"
  number_of_nodes = 3
  public_ip       = false
  root_ebs_size   = 32
  tags = {
    name               = "gf-k8s-worker-node"
    instance_group     = "workers"
    instance_sub_group = "regular"
  }
}