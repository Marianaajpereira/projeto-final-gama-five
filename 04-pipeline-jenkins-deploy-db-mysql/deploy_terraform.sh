#!/bin/bash

# cd 02-pipeline-jenkins-deploy-ami-db-mysql/02-terraform-ami
# ami=$(terraform output | grep AMI | awk '{print $2;exit}' | sed -e "s/\",//g")


cd 04-pipeline-jenkins-deploy-db-mysql/00-terraform
terraform init
terraform apply -auto-approve

echo "Aguardando criação de maquinas ..."
sleep 20 # 10 segundos