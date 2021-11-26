#!/bin/bash

# Update OS packages
apt update -y
apt upgrade -y

# Base packages
apt install -y \
jq `# json processor for terminal` \
unzip `# unarchiver` \
net-tools `# network tools for troubleshooting` \
ca-certificates `# certificates package` \
gnupg `# signed key checker` \
software-properties-common `# commom packages for other applications` \
htop `# process monitor for cli` \
lsb-release \
apt-transport-https \

# install AWS CLI
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
./aws/install
rm -r awscliv2 awscliv2.zip

# Configure AWS CLI
aws configure set region {YOUR-REGIO} --profile default
aws configure set format json --profile default

# Install Ansible
apt install -y \
ansible `# Configuration management, deployment, and task execution system` \
ansible-doc `# Ansible documentation and examples` \
ansible-lint `# lint tool for Ansible playbooks`

# Install Terrafom
curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -
apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
apt update && apt install -y terraform

# Configure Terraform autocompĺete
terraform -install-autocomplete

# Install MySql Client
apt install -y mysql-client

# Install Java and Maven
apt install -y \
openjdk-11-jdk `# Java JDK 11` \
maven `# Maven`

# Install Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update && apt-get install -y docker-ce docker-ce-cli containerd.io

# Install Kubernetes CLI
curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | tee /etc/apt/sources.list.d/kubernetes.list
apt update && apt install -y kubectl

# Enable kubectl autocompletion
echo 'source <(kubectl completion bash)' >>~/.bashrc

# Install Minikube
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
dpkg -i minikube_latest_amd64.deb