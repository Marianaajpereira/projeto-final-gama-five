<h1 align="center">
  Criação de EC2 para utilização do Jenkins
</h1>

## Objetivos

- <p> Nesta etapa o objetivo é a criação de uma EC2 com todas as configurações necessárias para execução do servidor Jenkins que será utilizado para criação das pipelines no decorrer do projeto.</p>

## Ferramentas

- <p> Foram utilizados as ferramentas Terraform para provisionamento da EC2 e o Ansible para instalação e aplicação de pacotes e configurações necessárias para execução do Jenkins.</p>

## Instruções

- A seguir encontram-se as etapas para prosseguir com o deploy da máquina com Jenkins.

### Clone o projeto e acesse a pasta "99-pipeline-shell-deploy-jenkins"

```bash
$ git clone https://github.com/Marianaajpereira/projeto-final-gama-five.git && cd 99-pipeline-shell-deploy-jenkins
```
### Edição do arquivo "main" da pasta terraform

Edite o arquivo "main" com as configurações da sua máquina de desenvolvimento:

```bash
region    = "sua_region"
subnet_id = "sua_subnet"
ami       = "sua subnet"
key_name  = "sua_chave_privada"
vpc_id    = "sua_vpc" 
```
### Execução do arquivo "deploy.sh"

Executar o arquivo "deploy.sh", contendo o script que irá aplicar tanto os camandos do Terraform quanto do Ansible, realizando o provisionameto da máquina com Jenkins.

```bash
./deploy.sh
```
### Término da configuração do Jenkins"

Tudo pronto! Agora, basta acessar o link que estará disponível no terminal após término do processamento do Ansible e seguir com a configuração incial do Jenkins, que pode ser resumida nas seguintes etapas:

1. Informar a senha inicial de administrador, disponível no terminal;
2. Instalar os plugins sugeridos;
3. Criar o primeiro usuário admin ao preencher o formulário com seus dados.