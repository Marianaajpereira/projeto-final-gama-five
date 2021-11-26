variable "project" {
  description = "Project details."
  type = object({
    name = string
  })
}

variable "custom_ami" {
  description = "AMI builded in K8s pipeline."
  type = string
}

variable "container_orchestration" {
  description = "Container orchestration engine details."
  type = object({
    engine           = string
    cluster_name     = string
    network_template = string
  })
}

variable "container_engine" {
  description = "Container engine details."
  type = object({
    name = string
  })
}

variable "vpc_data" {
  description = "VPC details."
  type = object({
    vpc_id              = string
    route_table_private = string
    route_table_public  = string
  })
}

variable "az_list" {
  description = "Availability zone names list."
  type        = list(string)
}

variable "admin_sg_id" {
  description = "Security group ID of administration/development environment."
  type        = string
}

variable "private_subnet_object" {
  description = "Private subnet template for Kubernetes environment."
  type = object({
    name              = string
    cidr_first_block  = number
    cidr_second_block = number
    cidr_third_block  = number
  })
}

variable "nlb_lb_proxy_object" {
  description = "Network Load Balancer proxy for Kubernetes API Server."
  type = object({
    name        = string
    is_internal = bool
  })
}


variable "sg_master_object" {
  description = "Security group data for Master nodes in Kubernetes environment."
  type = object({
    name        = string
    description = string
  })
}

variable "sg_worker_object" {
  description = "Security group data for Worker nodes in Kubernetes environment."
  type = object({
    name        = string
    description = string
  })
}

variable "instance_k8s_master_object" {
  description = "Instance template data for Master nodes in Kubernetes environment."
  type = object({
    type            = string
    key_pair        = string
    iam_profile     = string
    number_of_nodes = number
    public_ip       = bool
    root_ebs_size   = number
    tags = object({
      name               = string
      instance_group     = string
      instance_sub_group = list(string)
    })
  })
}

variable "instance_k8s_worker_object" {
  description = "Instance template data for Worker nodes in Kubernetes environment."
  type = object({
    type            = string
    key_pair        = string
    iam_profile     = string
    number_of_nodes = number
    public_ip       = bool
    root_ebs_size   = number
    tags = object({
      name               = string
      instance_group     = string
      instance_sub_group = string
    })
  })
}

variable "sg_public_id" {
  description = "Public security group ID."
  type = string
}
