#!/bin/bash

cd 01-pipeline-jenkins-deploy-infra-base/00-terraform/

# cd 00-terraform/

terraform init
terraform fmt
terraform apply -target='aws_subnet.k8s_subnets_private' -auto-approve
terraform apply -auto-approve
terraform output > tf-output.txt