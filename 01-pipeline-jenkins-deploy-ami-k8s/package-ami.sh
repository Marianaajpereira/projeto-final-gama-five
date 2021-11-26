#!/bin/bash

# VERSAO=$(git describe --tags $(git rev-list --tags --max-count=1))
VERSAO="0.0.1"

cd 01-pipeline-jenkins-deploy-ami-k8s/00-terraform
RESOURCE_ID=$(terraform output | grep resource_id | awk '{print $2;exit}' | sed -e "s/\",//g")

cd ../02-terraform-ami
terraform init
TF_VAR_versao=$VERSAO TF_VAR_resource_id=$RESOURCE_ID terraform apply -auto-approve