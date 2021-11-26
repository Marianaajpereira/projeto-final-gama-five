<h1 align="center">
<img src="https://pm1.narvii.com/6431/655f04ecda7b85b3241f11accfa920eb489dc8f0_hq.jpg" title="Gama Five" />
</h1>

<h3 align="center">
  Gama Five Web
</h3>

<p align="center">
  <a href="#sobre o projeto">Sobre o projeto</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#tecnologias">Tecnologias</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#iniciando">Iniciando</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#funcionalidades">Funcionalidades</a>
</p>

## 👨🏻‍💻 Sobre o projeto

- <p style="color: red;">Este projeto tem como objetivo demonstrar a aplicação dos conceitos vistos durante o curso Itaú Doti 2.0, através da construção de pipelines para o provisionamento de infra-estrutura resiliente e com alta disponibilidade para uma aplicação Springboot.</p>


### 💻 Desenvolvedores
- Leandro Volpini Bernardes
- Lucas Silva Gomes de Brito
- Lucas Vieira dos Santos Souza
- Luis Felipe Dall Agnol Barbosa
- Mariana Aparecida de Jesus Pereira

### 👊 Agradecimentos especiais
- [Danilo Aparecido](https://github.com/didox) por todo o conhecimento e apoio
- DOTI e todos os nossos colegas que seguraram as pontas durante este curso
- Pessoal da Gama Academy pelo apoio e organização do curso

## 🚀 Tecnologias

As tecnologias que utilizamos para o desenvolvimento deste projeto foram:

- [Jenkins](https://www.jenkins.io/)
- [Terraform](https://www.terraform.io/)
- [Ansible](https://www.ansible.com/)
- [Docker](https://www.docker.com/)
- [Kubernets](https://kubernetes.io/pt-br/)
- [Springboot](https://spring.io/projects/spring-boot)
- [MySql](https://www.mysql.com/)


## 💻 Iniciando

- As instruções a seguir irão te guiar para que você possa criar as pipelines. Neste projeto, utilizamos os recursos da AWS para a criação de todos os componentes de infra-estrutura necessários.

### Pré-requisitos

- Crie uma conta na [AWS](https://aws.amazon.com/pt/free/?s_kwcid=AL!4422!3!561843094929!e!!g!!aws&trk=2ee11bb2-bc40-4546-9852-2c4ad8e8f646&sc_channel=ps&sc_campaign=acquisition&sc_medium=ACQ-P|PS-GO|Brand|Desktop|SU|Core-Main|Core|BR|PT|Text&ef_id=Cj0KCQiAhf2MBhDNARIsAKXU5GQYv2fzYNmavVdti7i9PeccndJPoYOaZAfk1GN7D_wF1MaisBp_t7EaAt9uEALw_wcB:G:s&s_kwcid=AL!4422!3!561843094929!e!!g!!aws&all-free-tier.sort-by=item.additionalFields.SortRank&all-free-tier.sort-order=asc&awsf.Free%20Tier%20Types=*all&awsf.Free%20Tier%20Categories=*all) e faça o login na mesma;
- Na região sa-east-1, crie uma VPC (não é necessário IPV6 CIDR block);
- Após criar esta VPC, habilite a opção de hostnames DNS;
- Para esta VPC, crie 3 subnets, uma em cada AZ da região sa-east-1;
- Crie um Internet Gateway e use a opção "Attach VPC" para ligar este Internet Gateway à VPC criada;
- Crie uma Route Table associada à sua VPC, e adicione uma nova rota nela, com destino 0.0.0.0 e target para o seu Internet gateway;
- Após essa Route Table, associe-a também às três subnets criadas;
- Verifique se o Access COntrol List (ACL) desta VPC está com o tráfego liberado para todos os protocolos e sources;
- Crie uma EC2 em uma das subnets, de preferência com as seguintes configurações:
    - Sistema Operacional Ubuntu 20.04 ou superior;
    - Tamamho t2.large
    - Habilitar criação de IP público
    - Disco de pelo menos 30GB
    - Crie um novo Security Group e habilite o acesso SSH (Porta 22) para qualquer IPv4
    - Crie uma nova chave ssh para a máquina, faça o download da chave privada e guarde-a com muito cuidado
- Crie um novo IAM Role, utilizando a role "aws-cli-ec2" e adicione esta Role à sua EC2;
- Tente acessar remotamente a máquina via ssh com o comando ssh -i "path_da_sua_chave_privada" ubuntu@dns_publico_da_ec2
- Caso consiga logar corretamente na máquina, siga para o próximo passo, caso contrário, revise os passos anteriores.


**Clone este projeto em sua ec2**

```bash
$ git clone https://github.com/Marianaajpereira/projeto-final-gama-five && cd projeto-final-gama-five/
```

**Execute o arquivo de atualização da instância**

```bash
sh user-data.sh
```

**Crie a máquina do Jenkins para a execução das pipelines**

```bash
cd 00-pipeline-shell-deploy-jenkins/ && sh deploy.sh
```

Para mais detalhes desta etapa, [clique aqui](https://github.com/Marianaajpereira/projeto-final-gama-five/tree/master/99-pipeline-shell-deploy-jenkins).



**Pipeline de criação da imagem do K8s**

Para mais detalhes desta etapa, [clique aqui](https://github.com/Marianaajpereira/projeto-final-gama-five/tree/master/01-pipeline-jenkins-deploy-ami-k8s).



**Pipeline de criação da imagem do Banco de dados MySQL**

Para mais detalhes desta etapa, [clique aqui](https://github.com/Marianaajpereira/projeto-final-gama-five/tree/master/02-pipeline-jenkins-deploy-ami-db-mysql).



**Pipeline de criação do Cluster Single-Master**

Para mais detalhes desta etapa, [clique aqui](https://github.com/Marianaajpereira/projeto-final-gama-five/tree/master/03-pipeline-jenkins-deploy-cluster-k8s).



**Pipeline de criação das instâncias de Dev, Stage e Prod do Banco de Dados**

Para mais detalhes desta etapa, [clique aqui](https://github.com/Marianaajpereira/projeto-final-gama-five/tree/master/04-pipeline-jenkins-deploy-db-mysql).



**Pipeline de criação das instâncias de Dev, Stage e Prod da aplicação Spring**

Para mais detalhes desta etapa, [clique aqui](https://github.com/Marianaajpereira/projeto-final-gama-five/tree/master/05-pipeline-jenkins-deploy-app-java-springboot).



---------------------------------------------------------------------------------
---------- DAQUI PRA BAIXO MEXEMOS DEPOIS DE SUBIR A APLICAÇÂO SPRING------------
---------------------------------------------------------------------------------

Tudo pronto! Agora, basta acessar a aplicação, disponível em:
localhost:3000

Documentação dos endpoints disponível na rota:
localhost:3000/api-docs

Para acessar a API diretamente no seu browser, acesse https://clinica-pomarola-api.herokuapp.com/

## ⚙️ Funcionalidades
Funcionalidades que o sistema oferece:
- Cadastro e Login de Usuários
- Cadastro de Clientes e Especialistas
- Cadastro de Atendimentos e de Históricos de Prontuários
- Pesquisa
	- Busca de atendimentos por Status, Paciente, Especialista, Data de agendamento ou de atendimento
- Criação de Agendamentos
- Criptografia de senhas
- Sistema de autenticação de usuário
- Validação de requisições
- Mensagens de erro customizadas *user friendly*
- Documentação dos endpoints

## 📄 Licença

Este projeto está sob a licença de (GamaFive).