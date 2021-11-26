#!/bin/bash

cd 00-pipeline-jenkins-deploy-infra-base/00-terraform/

# cd 00-terraform/

terraform init
terraform fmt
terraform apply -target='aws_subnet.subnets_public' -auto-approve
terraform apply -auto-approve
terraform output > tf-output.txt