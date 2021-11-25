<h1 align="center">
  Criação de AMI padrão com Docker e Kubernetes
</h1>

## Objetivos

- <p> Nesta etapa o objetivo é a obtenção de uma imagem AMI com todos os pacotes e configurações relacionados a Docker e Kubernetes já instalados, para futura utilização no decorrer do projeto.</p>

## Ferramentas

- <p> Foram utilizados as ferramentas Terraform para provisionamento da EC2, criação da imagem AMI e destruição da instância, Ansible para instalação e aplicação de pacotes e configurações necessárias para uso do Docker e Kubernetes, e Jenkins para execução da pipeline.</p>

## Instruções

- A seguir encontram-se as etapas para prosseguir com a criação da imagem AMI com Docker e Kubernetes.

### Clone o projeto e acesse a pasta "01-pipeline-jenkins-deploy-ami-k8s"

```bash
$ git clone https://github.com/Marianaajpereira/projeto-final-gama-five.git && cd 01-pipeline-jenkins-deploy-ami-k8s
```
### Edição dos arquivos "main" da pasta "00-terraform" e "02-terraform-ami"

Edite os arquivos "main" com as configurações da sua máquina de desenvolvimento:

```bash
region    = "sua_region"
subnet_id = "sua_subnet"
ami       = "sua subnet"
key_name  = "sua_chave_privada"
vpc_id    = "sua_vpc" 
```
### Execução do script do arquivo "jenkinsfile"

Copiar o script presente no arquivo "jenkinsfile" e executá-lo em um job do tipo pipeline no Jenkins, script estes que percorrerão as seguintes etapas:

1. Clone do repositório Git;
2. Criação da EC2;
3. Instação dos pacote e configurações necessárias para uso do Docker e Kubernetes;
4. Teste das instalações e configurações;
5. Criação da imagem AMI;
6. Destruição da instância EC2.

### Obtenção da imagem AMI

Tudo pronto! Agora, basta acessar a execução da etapa 5 no Jenkins que será possível obter o id da AMI criada.