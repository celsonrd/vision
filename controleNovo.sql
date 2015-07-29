-- MySQL dump 10.13  Distrib 5.5.43, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: controleNovo
-- ------------------------------------------------------
-- Server version	5.5.43-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alteracao`
--

DROP TABLE IF EXISTS `alteracao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alteracao` (
  `id_alteracao` int(2) NOT NULL AUTO_INCREMENT,
  `id_militar` int(5) DEFAULT NULL,
  `id_situacao` int(3) DEFAULT NULL,
  `id_om` int(3) DEFAULT NULL,
  `id_eis` int(3) NOT NULL,
  `data_inicio` decimal(10,0) DEFAULT NULL,
  `data_fim` decimal(10,0) DEFAULT NULL,
  `documento` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_alteracao`),
  KEY `id_militar` (`id_militar`),
  KEY `id_situacao` (`id_situacao`),
  KEY `id_om` (`id_om`),
  KEY `id_militar_2` (`id_militar`),
  KEY `id_eis` (`id_eis`),
  CONSTRAINT `contraint1` FOREIGN KEY (`id_militar`) REFERENCES `militar` (`id_militar`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `contraint2` FOREIGN KEY (`id_situacao`) REFERENCES `situacao` (`id_situacao`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `contraint3` FOREIGN KEY (`id_om`) REFERENCES `om` (`id_om`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `contraint4` FOREIGN KEY (`id_eis`) REFERENCES `eis` (`id_eis`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alteracao`
--

LOCK TABLES `alteracao` WRITE;
/*!40000 ALTER TABLE `alteracao` DISABLE KEYS */;
INSERT INTO `alteracao` VALUES (2,10,1,15,1,1259373600,1290931200,'Adit 01 Bol Reg 022, de 02 Fev 15'),(3,12,1,13,1,1296581757,1328031357,'Adit 01 Bol Reg 022, de 02 Fev 15'),(4,12,3,15,2,1328117757,1359653757,'Adit 01 Bol Reg 022, de 02 Fev 15'),(5,12,3,18,3,1359740157,1391189757,'Adit 01 Bol Reg 022, de 02 Fev 15'),(6,12,3,34,4,1391276157,1422725757,'Adit 01 Bol Reg 022, de 02 Fev 15'),(7,13,1,2,1,1422756000,1454227200,'Adit 01 Bol Reg 022, de 02 Fev 15'),(11,17,1,15,1,1259373600,1290844800,'????'),(12,29,1,2,1,28,31471228,'Adit 01 Bol Reg 023, de 03 Fev 14');
/*!40000 ALTER TABLE `alteracao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `arma_quadro_servico`
--

DROP TABLE IF EXISTS `arma_quadro_servico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `arma_quadro_servico` (
  `id_arma` int(3) NOT NULL AUTO_INCREMENT,
  `cod` varchar(10) NOT NULL,
  `descricao` varchar(40) NOT NULL,
  PRIMARY KEY (`id_arma`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arma_quadro_servico`
--

LOCK TABLES `arma_quadro_servico` WRITE;
/*!40000 ALTER TABLE `arma_quadro_servico` DISABLE KEYS */;
INSERT INTO `arma_quadro_servico` VALUES (1,'Inf','Infantaria'),(2,'Art','Artilharia'),(3,'Cav','Cavalaria'),(4,'Com','Comunicações'),(5,'Eng','Engenharia'),(6,'Int','Intendência'),(7,'QQ AQS','Qualquer arma, quadro ou serviço'),(8,'Mat Bel','Material Bélico');
/*!40000 ALTER TABLE `arma_quadro_servico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ci_sessions`
--

DROP TABLE IF EXISTS `ci_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ci_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ci_sessions`
--

LOCK TABLES `ci_sessions` WRITE;
/*!40000 ALTER TABLE `ci_sessions` DISABLE KEYS */;
INSERT INTO `ci_sessions` VALUES ('062941351f8f5903eb5da77dd92cca82','127.0.0.1','Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36',1436363258,'a:4:{s:9:\"user_data\";s:0:\"\";s:12:\"nome_usuario\";s:5:\"admin\";s:10:\"id_usuario\";s:1:\"4\";s:5:\"secao\";s:4:\"SSMR\";}'),('1c84649937b1d935e9cda5d9cbf3be85','127.0.0.1','Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36',1436293277,'a:4:{s:9:\"user_data\";s:0:\"\";s:12:\"nome_usuario\";s:5:\"admin\";s:10:\"id_usuario\";s:1:\"4\";s:5:\"secao\";s:4:\"SSMR\";}'),('698cea45917eb9f83b32b2dfaa5232c4','127.0.0.1','Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36',1436280803,'a:4:{s:9:\"user_data\";s:0:\"\";s:12:\"nome_usuario\";s:5:\"admin\";s:10:\"id_usuario\";s:1:\"4\";s:5:\"secao\";s:4:\"SSMR\";}'),('81105e3694f07da710a085d7bdf70fa8','127.0.0.1','Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36',1436277049,'a:4:{s:9:\"user_data\";s:0:\"\";s:12:\"nome_usuario\";s:5:\"admin\";s:10:\"id_usuario\";s:1:\"4\";s:5:\"secao\";s:4:\"SSMR\";}'),('cb87e464a89ee50c225471ef9196a65e','127.0.0.1','Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36',1436363258,''),('da95099b0f83fe50a7b7f9a81e08be75','127.0.0.1','Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36',1436276240,'');
/*!40000 ALTER TABLE `ci_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eis`
--

DROP TABLE IF EXISTS `eis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eis` (
  `id_eis` int(3) NOT NULL AUTO_INCREMENT,
  `descricao_eis` varchar(25) NOT NULL,
  PRIMARY KEY (`id_eis`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eis`
--

LOCK TABLES `eis` WRITE;
/*!40000 ALTER TABLE `eis` DISABLE KEYS */;
INSERT INTO `eis` VALUES (1,'EIS-01'),(2,'EIS-02'),(3,'EIS-03'),(4,'EIS-04'),(5,'EIS-05'),(6,'EIS-06'),(7,'EIS-07'),(8,'EIS-08');
/*!40000 ALTER TABLE `eis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `especialidade`
--

DROP TABLE IF EXISTS `especialidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `especialidade` (
  `id_especialidade` int(2) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) DEFAULT NULL,
  `tipo_de_militar` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_especialidade`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especialidade`
--

LOCK TABLES `especialidade` WRITE;
/*!40000 ALTER TABLE `especialidade` DISABLE KEYS */;
INSERT INTO `especialidade` VALUES (1,'OMT - Oficial Médico Temporário','Militar Temporário'),(2,'ODT - Oficial Dentista Temporário','Militar Temporário'),(3,'OVT - Oficial Veterinário Temporário','Militar Temporário'),(4,'OFT - Oficial Farmacêutico Temporário','Militar Temporário'),(5,'OCT - Oficial Combatente Temporário','Militar Temporário'),(6,'OIT - Ofical Intendente Temporário ','Militar Temporário'),(7,'OMC - Oficial Médico de Carreira','Militar de Carreira'),(8,'ODC - Oficial Dentista de Carreira','Militar de Carreira'),(9,'OVC - Oficial Veterinário de Carreira','Militar de Carreira'),(10,'OFC - Oficial Farmacêutico de Carreira','Militar de Carreira'),(11,'OCC - Oficial Combatente de Carreira','Militar de Carreira'),(12,'OIC - Ofiical Itendente de Carreira','Militar de Carreira'),(13,'STT - Sargento Técnico Temporário','Militar Temporário');
/*!40000 ALTER TABLE `especialidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hierarquia`
--

DROP TABLE IF EXISTS `hierarquia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hierarquia` (
  `id_hierarquia` int(3) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_hierarquia`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hierarquia`
--

LOCK TABLES `hierarquia` WRITE;
/*!40000 ALTER TABLE `hierarquia` DISABLE KEYS */;
INSERT INTO `hierarquia` VALUES (1,'General de Exército Inativo'),(2,'General de Exército'),(3,'General de Divisão'),(4,'General de Brigada'),(5,'Coronel'),(6,'Tenente Coronel'),(7,'Major'),(8,'Capitão'),(9,'1º Tenente'),(10,'2º Tenente'),(11,'Aspirante'),(18,'Sub Tenente'),(19,'1º Sargento'),(20,'2º Sargento'),(21,'3º Sargento'),(22,'Cabo Engajado'),(27,'Soldado do Exército'),(28,'Soldado Recruta'),(30,'Taifeiro 1ª Classe');
/*!40000 ALTER TABLE `hierarquia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `militar`
--

DROP TABLE IF EXISTS `militar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `militar` (
  `id_militar` int(5) NOT NULL AUTO_INCREMENT,
  `id_hierarquia` int(3) DEFAULT NULL,
  `id_especialidade` int(3) DEFAULT NULL,
  `id_usuario` int(5) DEFAULT NULL,
  `id_om` int(3) NOT NULL,
  `id_referenciacao` int(3) NOT NULL,
  `id_aqs` int(3) NOT NULL,
  `foto` varchar(100) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `nome_de_guerra` varchar(20) NOT NULL,
  `data_nascimento` decimal(10,0) DEFAULT NULL,
  `identidade` varchar(20) DEFAULT NULL,
  `orgao_expeditor` varchar(10) NOT NULL,
  `cpf` varchar(20) DEFAULT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `sv_anterior_dia` int(2) NOT NULL,
  `sv_anterior_mes` int(2) NOT NULL,
  `sv_anterior_ano` int(2) NOT NULL,
  `observacao` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_militar`),
  KEY `id_hierarquia` (`id_hierarquia`),
  KEY `id_especialidade` (`id_especialidade`),
  KEY `id_usuário` (`id_usuario`),
  KEY `id_om` (`id_om`),
  KEY `id_usuário_2` (`id_usuario`),
  KEY `id_referenciacao` (`id_referenciacao`),
  KEY `id_aqs` (`id_aqs`),
  CONSTRAINT `militar_ibfk_1` FOREIGN KEY (`id_hierarquia`) REFERENCES `hierarquia` (`id_hierarquia`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `militar_ibfk_2` FOREIGN KEY (`id_especialidade`) REFERENCES `especialidade` (`id_especialidade`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `militar_ibfk_3` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `militar_ibfk_4` FOREIGN KEY (`id_om`) REFERENCES `om` (`id_om`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `militar_ibfk_5` FOREIGN KEY (`id_referenciacao`) REFERENCES `referenciacao` (`id_referenciacao`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `militar_ibfk_6` FOREIGN KEY (`id_aqs`) REFERENCES `arma_quadro_servico` (`id_arma`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `militar`
--

LOCK TABLES `militar` WRITE;
/*!40000 ALTER TABLE `militar` DISABLE KEYS */;
INSERT INTO `militar` VALUES (10,9,5,1,15,5,1,'default.png','VICTOR HUGO PADILHA DE LIMA','PADILHA',645937200,'0701921355','MD-EB','088.742.784-70','????','teste@teste.com',0,0,0,'Claro Prorroga'),(12,10,11,4,13,5,2,'12.jpg','MICHEL SILVA BARROS','BARROS',645937200,'0','MD-EB','0','0','teste@teste.com',0,0,0,'Militar de Carreira'),(13,11,1,NULL,2,28,4,'b1.jpg','JOSÉ AUGUSTO CALAFELL ROIG TIBÚRCIO DE MELO','TIBÚRCIO',548650800,'123456','MD-EB','12345678912','123456789','teste@teste.com',0,0,0,'EAS'),(17,9,5,NULL,15,14,1,'default.png','TIAGO RODRIGUES RIBEIRO ROMA','ROMA',596512800,'0701921355','MD-EB','05208634457','????','roma@eb.mil.br',0,0,0,'Sistema legado'),(29,2,11,NULL,2,18,3,'default.png','JOAO JOSE ALVARO','CAAA',645937200,'fasfs','fsdafs','sdfasf','fsafsa','fsfasfs',0,0,0,'fdas');
/*!40000 ALTER TABLE `militar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `om`
--

DROP TABLE IF EXISTS `om`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `om` (
  `id_om` int(3) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) DEFAULT NULL,
  `cidade` varchar(100) DEFAULT NULL,
  `uf` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_om`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `om`
--

LOCK TABLES `om` WRITE;
/*!40000 ALTER TABLE `om` DISABLE KEYS */;
INSERT INTO `om` VALUES (1,'10ª Cia E Cmb','São Bento do Una','PE'),(2,'10º Esqd C Mec','Recife','PE'),(3,'14ª Bia AAAe','Olinda','PE'),(4,'14º B Log','Recife','PE'),(5,'14º BI Mtz','Jaboatão dos Guararapes','PE'),(6,'3ª DL','Olinda','PE'),(7,'4º B Com','Recife','PE'),(8,'4º BPE','Recife','PE'),(9,'71º BI Mtz','Garanhuns','PE'),(10,'72º BI Mtz','Petrolina','PE'),(11,'7ª Cia Com','Recife','PE'),(12,'7º D Sup','Recife','PE'),(13,'7º GAC','Olinda','PE'),(14,'Cia C/10ª Bda Inf Mtz','Recife','PE'),(15,'Cia C/7ª RM','Recife','PE'),(16,'Cia C/CMNE','Recife','PE'),(17,'CIMNC','Pau d´Alho','PE'),(18,'Cmdo CMNE','Recife','PE'),(19,'CMR','Recife','PE'),(20,'CPOR/R','Recife','PE'),(21,'HMAR','Recife','PE'),(23,'Pq R Mnt/7','Recife','PE'),(24,'15º BI Mtz','João Pessoa','PB'),(25,'16º R C Mec','Bayeux','PB'),(26,'31º BI Mtz','Campina Grande','PB'),(27,'Cia C/1º Gpt E','João Pessoa','PB'),(28,'Cmdo 1º Gpt E','João Pessoa','PB'),(29,'H Gu JP','João Pessoa','PB'),(30,'H Gu N','Natal','RN'),(32,'16º BI Mtz','Natal','RN'),(33,'17º GAC','Natal','RN'),(34,'1º BEC','Caicó','RN'),(35,'7º BE Cmb','Natal','RN'),(36,'Cia C/7ª Bda Inf Mtz','Natal','RN'),(37,'20ª CSM','Maceió','AL'),(38,'59º BI Mtz','Maceió','AL');
/*!40000 ALTER TABLE `om` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `referenciacao`
--

DROP TABLE IF EXISTS `referenciacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `referenciacao` (
  `id_referenciacao` int(3) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(20) NOT NULL,
  `descricao` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_referenciacao`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `referenciacao`
--

LOCK TABLES `referenciacao` WRITE;
/*!40000 ALTER TABLE `referenciacao` DISABLE KEYS */;
INSERT INTO `referenciacao` VALUES (1,'16 7600 000 000','Veterinária'),(2,'16 8800 000 000','Dentista, Farmacêutico ou Médico'),(3,'16 8801 000 000','Dentista – Qualquer Especialidade'),(4,'16 8802 000 000','Dentista – Cirurgia e Traumatologia Buco–Maxilo–Fa'),(5,'16 8803 000 000','Dentista – Dentística'),(6,'16 8804 000 000','Dentista – Endodontia'),(7,'16 8805 000 000','Dentista – Odontologia Legal'),(8,'16 8806 000 000','Dentista – Odontologia Preventiva e Social'),(9,'16 8807 000 000','Dentista – Odontopediatria'),(10,'16 8808 000 000','Dentista – Ortodontia'),(11,'16 8809 000 000','Dentista – Patologia Bucal'),(12,'16 8810 000 000','Dentista – Periodontia'),(13,'16 8811 000 000','Dentista – Prótese Buco–Maxilo–Facial'),(14,'16 8812 000 000','Dentista – Prótese Dentária'),(15,'16 8813 000 000','Dentista – Imaginologia Dento-Maxilo-Facial'),(16,'16 8815 000 000','Farmacêutico – Qualquer Especialidade'),(17,'16 8816 000 000','Farmacêutico – Bacteriologia'),(18,'16 8817 000 000','Farmacêutico – Bioquímica'),(19,'16 8818 000 000','Farmacêutico – Bromatologia (Análise de Alimentos)'),(20,'16 8820 000 000','Farmacêutico – Farmacotécnica'),(21,'16 8821 000 000','Farmacêutico – Hematologia'),(22,'16 8822 000 000','Farmacêutico – Imunologia'),(23,'16 8824 000 000','Farmacêutico – Parasitologia'),(24,'16 8825 000 000','Farmacêutico – Pesquisas Clínicas'),(25,'16 8827 000 000','Farmacêutico – Química Industrial e Farmacêutica'),(26,'16 8829 000 000','Farmacêutico – Toxicologia'),(27,'16 8835 000 000','Médico – Qualquer Especialidade'),(28,'16 8837 000 000','Médico – Alergia e Imunologia'),(29,'16 8838 000 000','Médico – Anestesiologia'),(30,'16 8839 000 000','Médico – Angiologia'),(31,'16 8841 000 000','Médico – Cancerologia'),(32,'16 8842 000 000','Médico – Cardiologia'),(33,'16 8843 000 000','Médico – Cirurgia Cardiovascular'),(34,'16 8844 000 000','Médico – Cirurgia de Cabeça e Pescoço'),(35,'16 8845 000 000','Médico – Cirurgia de Mão'),(36,'16 8846 000 000','Médico – Cirurgia Geral'),(37,'16 8847 000 000','Médico – Cirurgia Pediátrica'),(38,'16 8848 000 000','Médico – Cirurgia Plástica'),(39,'16 8849 000 000','Médico – Cirurgia Torácica'),(40,'16 8850 000 000','Médico – Cirurgia Vascular'),(41,'16 8851 000 000','Médico – Patologia Clínica / Medicina Laboratorial'),(42,'16 8852 000 000','Médico – Dermatologia'),(43,'16 8854 000 000','Médico – Endocrinologia'),(44,'16 8855 000 000','Médico – Endocospia'),(45,'16 8856 000 000','Médico – Medicina Física e Reabilitação'),(46,'16 8858 000 000','Médico – Gastroenterologia'),(47,'16 8859 000 000','Médico – Genética Médica'),(48,'16 8860 000 000','Médico – Geriatria e Gerontologia'),(49,'16 8863 000 000','Médico – Hematologia e Hemoterapia'),(50,'16 8865 000 000','Médico – Homeopatia'),(51,'16 8866 000 000','Médico – Infectologia'),(52,'16 8869 000 000','Médico – Medicina Legal'),(53,'16 8870 000 000','Médico – Medicina Nuclear'),(54,'16 8871 000 000','Médico – Medicina de Família e Comunidade'),(55,'16 8872 000 000','Médico – Medicina do Trabalho'),(56,'16 8873 000 000','Médico – Nefrologia'),(57,'16 8874 000 000','Médico – Neurocirurgia'),(58,'16 8876 000 000','Médico – Neurologia'),(59,'16 8879 000 000','Médico – Nutrologia'),(60,'16 8881 000 000','Médico – Oftalmologia'),(61,'16 8882 000 000','Médico – Ortopedia e Traumatologia'),(62,'16 8883 000 000','Médico – Otorrinolaringologia'),(63,'16 8884 000 000','Médico – Patologia'),(64,'16 8886 000 000','Médico – Pediatria'),(65,'16 8887 000 000','Médico – Pneumologia'),(66,'16 8888 000 000','Médico – Coloproctologia'),(67,'16 8889 000 000','Médico – Psiquiatria'),(68,'16 8890 000 000','Médico – Radiologia e Diagnóstico por Imagem'),(69,'16 8891 000 000','Médico – Radioterapia'),(70,'16 8892 000 000','Médico – Reumatologia'),(71,'16 8895 000 000','Médico – Urologia'),(72,'16 8897 000 000','Médico – Ginecologia e Obstetrícia'),(73,'16 8898 000 000','Médico – Medicina Intensiva'),(74,'16 8899 000 000','Médico – Mastologia'),(75,'16 8905 000 000','Médico – Clínica Médica'),(76,'16 8909 000 000','Médico – Acupuntura');
/*!40000 ALTER TABLE `referenciacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `referenciacao_especialidade`
--

DROP TABLE IF EXISTS `referenciacao_especialidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `referenciacao_especialidade` (
  `id_referenciacao` int(3) NOT NULL,
  `id_especialidade` int(3) NOT NULL,
  KEY `id_referenciacao` (`id_referenciacao`),
  KEY `id_especialidade` (`id_especialidade`),
  CONSTRAINT `referenciacao_especialidade_ibfk_1` FOREIGN KEY (`id_referenciacao`) REFERENCES `referenciacao` (`id_referenciacao`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `referenciacao_especialidade_ibfk_2` FOREIGN KEY (`id_especialidade`) REFERENCES `especialidade` (`id_especialidade`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `referenciacao_especialidade`
--

LOCK TABLES `referenciacao_especialidade` WRITE;
/*!40000 ALTER TABLE `referenciacao_especialidade` DISABLE KEYS */;
/*!40000 ALTER TABLE `referenciacao_especialidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `situacao`
--

DROP TABLE IF EXISTS `situacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `situacao` (
  `id_situacao` int(3) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_situacao`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `situacao`
--

LOCK TABLES `situacao` WRITE;
/*!40000 ALTER TABLE `situacao` DISABLE KEYS */;
INSERT INTO `situacao` VALUES (1,'Incorporado'),(2,'Convocado'),(3,'Prorrogado'),(4,'Adido');
/*!40000 ALTER TABLE `situacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id_usuario` int(5) NOT NULL AUTO_INCREMENT,
  `id_hierarquia` int(3) NOT NULL,
  `id_om` int(3) NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `login` varchar(50) DEFAULT NULL,
  `senha` varchar(200) DEFAULT NULL,
  `secao` varchar(15) DEFAULT NULL,
  `cpf` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `id_hierarquia` (`id_hierarquia`),
  KEY `id_om` (`id_om`),
  CONSTRAINT `hierarquia_ibfk_2` FOREIGN KEY (`id_hierarquia`) REFERENCES `hierarquia` (`id_hierarquia`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `hierarquia_ibfk_3` FOREIGN KEY (`id_om`) REFERENCES `om` (`id_om`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,1,1,'teste','teste@teste.com','teste','698dc19d489c4e4db73e28a713eab07b','teste','teste'),(2,1,1,'Celson da Silva Rodrigues','teste@teste.com','celsonrd','202cb962ac59075b964b07152d234b70','SesMil','01433949407'),(3,22,1,'Celson Da Silva Rodrigues','teste@teste.com','rodrigues','202cb962ac59075b964b07152d234b70','SesMil','01433949407'),(4,1,1,'admin','teste@teste.com','admin','21232f297a57a5a743894a0e4a801fc3','SSMR','12345678911');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-07-08 14:37:01
