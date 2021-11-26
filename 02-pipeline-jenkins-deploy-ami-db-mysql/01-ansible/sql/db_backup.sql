DROP TABLE IF EXISTS `administradores`;
CREATE TABLE `administradores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(180) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `observacao` longtext,
  `senha` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;

LOCK TABLES `administradores` WRITE;

INSERT INTO `administradores` VALUES (1,'mariana@treinamento.com.br','Mariana','Criador do projeto','123456'),(4,'teste@danilo.com.br','Teste Danilo','teste observação danilo teste mais 1','teste123'),(5,'aluno@gmail.com','Aluno Silva','teste aluno','aluno'),(6,'aluno@m4u.com.br','Aluno M4U','aluno feito na live','aluno');

UNLOCK TABLES;