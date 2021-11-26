#!/bin/bash

cd 00-terraform
terraform init
terraform fmt
terraform apply -auto-approve

echo "Aguardando criação de maquinas ..."
sleep 10 # 10 segundos

echo "[ec2-jenkins]" > ../01-ansible/hosts # cria arquivo
echo "$(terraform output | grep public_dns | awk '{print $2;exit}')" | sed -e "s/\",//g" >> ../01-ansible/hosts

echo "Aguardando criação de maquinas ..."
sleep 20 # 20 segundos

cd ../01-ansible
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i hosts provisionar.yml -u ubuntu --private-key /home/ubuntu/.ssh/kp-gamafive.pem

cd ../00-terraform
terraform output

echo "Agora somente abrir a URL: http://$(terraform output | grep public | awk '{print $2;exit}'):8080" | sed -e "s/\",//g"

ID_MAQUINA=$(terraform output | grep id | awk '{print $2;exit}')
echo ${ID_MAQUINA/\",/}
