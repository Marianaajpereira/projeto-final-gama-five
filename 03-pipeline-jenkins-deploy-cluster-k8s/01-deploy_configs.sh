#!/bin/bash

mkdir -p 03-pipeline-jenkins-deploy-cluster-k8s/01-ansible/tmp

cp -p 03-pipeline-jenkins-deploy-cluster-k8s/00-terraform/k8s_lb_dns_name 03-pipeline-jenkins-deploy-cluster-k8s/01-ansible/tmp/

cd 03-pipeline-jenkins-deploy-cluster-k8s/01-ansible/

ansible-playbook 00-ansible-prepare-all-nodes.yml