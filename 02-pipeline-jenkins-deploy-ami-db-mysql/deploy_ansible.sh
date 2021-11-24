cd 02-pipeline-jenkins-deploy-ami-db-mysql/00-terraform
echo "[dev_img_db_jenkins]" > ../01-ansible/hosts # cria arquivo
echo "$(terraform output | grep public_dns | awk '{print $2;exit}')" | sed -e "s/\",//g" >> ../01-ansible/hosts # captura output faz split de espaco e replace de ",

echo "Aguardando criação de maquinas ..."
sleep 30 # 10 segundos

cd ../01-ansible

echo "Executando ansible ::::: [ ansible-playbook -i hosts provisionar.yml -u ubuntu --private-key /var/lib/jenkins/.ssh/kp-gamafive.pem ]"
ANSIBLE_HOST_KEY_CHECKING=False USER=root PASSWORD=root  DATABASE=SpringWebYoutube ansible-playbook -i hosts provisionar.yml -u ubuntu --private-key /var/lib/jenkins/.ssh/kp-gamafive.pem