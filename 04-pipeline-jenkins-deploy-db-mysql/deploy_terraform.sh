#!/bin/bash

cd 01-pipeline-jenkins-deploy-ami-k8s/00-terraform
terraform init
terraform apply -auto-approve

echo "Aguardando criação de maquinas ..."
sleep 10 # 10 segundos