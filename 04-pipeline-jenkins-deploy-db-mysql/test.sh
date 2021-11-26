#!/bin/bash
# cd  04-pipeline-jenkins-deploy-db-mysql/00-terraform
# uri=$(terraform output | grep IP)

# echo $uri

# ssh -i /var/lib/jenkins/.ssh/kp-gamafive.pem ubuntu@$uri -oStrictHostKeyChecking=no << EOF
# echo \$(pwd)
# version=\$(kubectl version)
# echo "\$version"
# if [[ ! -z "\$version" ]];
# then 
#     echo "::::: Kubernets instalado :::::"
#     exit 0
# else
#     echo "::::: Kubernets não instalado :::::"
#     exit 1
# fi
# EOF

ping1=$(telnet 10.60.20.11 3306)
if [[ ! -z "$ping1" ]];
then 
    echo "::::: Porta 3306 liberada :::::"
    exit 0
else
    echo "::::: Porta 3306 não liberada :::::"
    exit 1
fi