-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: vacinacao
-- ------------------------------------------------------
-- Server version	8.0.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `agendamento`
--
CREATE DATABASE vacinacao;

DROP TABLE IF EXISTS `agendamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agendamento` (
  `id_agendamento` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_posto` bigint unsigned NOT NULL,
  `id_usuario` bigint unsigned NOT NULL,
  `data_hora` datetime NOT NULL,
  PRIMARY KEY (`id_agendamento`),
  UNIQUE KEY `id_agendamento` (`id_agendamento`),
  KEY `id_posto` (`id_posto`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `agendamento_ibfk_1` FOREIGN KEY (`id_posto`) REFERENCES `posto` (`id_posto`),
  CONSTRAINT `agendamento_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agendamento`
--

LOCK TABLES `agendamento` WRITE;
/*!40000 ALTER TABLE `agendamento` DISABLE KEYS */;
INSERT INTO `agendamento` VALUES (1,1,2,'2018-06-23 17:58:33'),(2,1,2,'2021-05-02 21:00:00'),(10,1,2,'2021-05-02 22:00:00'),(11,1,2,'2021-05-03 14:00:00');
/*!40000 ALTER TABLE `agendamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `markers`
--

DROP TABLE IF EXISTS `markers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `markers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `address` varchar(80) NOT NULL,
  `lat` float(10,6) NOT NULL,
  `lng` float(10,6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `markers`
--

LOCK TABLES `markers` WRITE;
/*!40000 ALTER TABLE `markers` DISABLE KEYS */;
INSERT INTO `markers` VALUES (1,'Frankie Johnnie & Luigo Too','939 W El Camino Real, Mountain View, CA',37.386337,-122.085823),(2,'Amici\'s East Coast Pizzeria','790 Castro St, Mountain View, CA',37.387138,-122.083237),(3,'Kapp\'s Pizza Bar & Grill','191 Castro St, Mountain View, CA',37.393887,-122.078918),(4,'Round Table Pizza: Mountain View','570 N Shoreline Blvd, Mountain View, CA',37.402653,-122.079353),(5,'Tony & Alba\'s Pizza & Pasta','619 Escuela Ave, Mountain View, CA',37.394012,-122.095528),(6,'Oregano\'s Wood-Fired Pizza','4546 El Camino Real, Los Altos, CA',37.401726,-122.114647);
/*!40000 ALTER TABLE `markers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posto`
--

DROP TABLE IF EXISTS `posto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posto` (
  `id_posto` bigint unsigned NOT NULL AUTO_INCREMENT,
  `lat` float NOT NULL,
  `lng` float NOT NULL,
  `descricao` varchar(200) DEFAULT NULL,
  `inicio_atendimento` varchar(10) DEFAULT NULL,
  `fim_atendimento` varchar(10) DEFAULT NULL,
  `id_usuario` bigint unsigned NOT NULL,
  PRIMARY KEY (`id_posto`),
  UNIQUE KEY `id_posto` (`id_posto`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `posto_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posto`
--

LOCK TABLES `posto` WRITE;
/*!40000 ALTER TABLE `posto` DISABLE KEYS */;
INSERT INTO `posto` VALUES (1,-16.0073,-47.9924,'Posto Academia Corporação - Santa Maria','10:00','18:00',2),(3,37.3863,-122.086,'939 W El Camino Real, Mountain View, CA','10h','18h',2),(4,-16.1022,-47.9467,'Ocidental','10h','18h',2),(5,-16.008,-48.0073,'Mercado','10h','18h',2),(6,-16.0192,-47.9874,'Teste',NULL,NULL,3),(7,-16.0295,-47.9924,'Outro posto',NULL,NULL,3),(8,-16.0257,-47.98,'Teste',NULL,NULL,3);
/*!40000 ALTER TABLE `posto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `login` varchar(30) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `agente` tinyint(1) NOT NULL DEFAULT '0',
  `registro` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (2,'emanoel','emanoel','e10adc3949ba59abbe56e057f20f883e',0,''),(3,'Agente','agente','e10adc3949ba59abbe56e057f20f883e',1,'123456');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-03 11:07:13


-- CREATE DATABASE vacinacao;

-- CREATE TABLE usuarios (
-- 	id serial PRIMARY KEY,
--     nome VARCHAR(100) NOT NULL,
--     login VARCHAR(30) NOT NULL,
--     senha VARCHAR(255) NOT NULL,
--     agente BOOLEAN DEFAULT false NOT NULL,
--     registro VARCHAR(10)
-- );

-- CREATE TABLE posto (
-- 	id_posto serial PRIMARY KEY,
--     lat FLOAT NOT NULL,
--     lng FLOAT NOT NULL,
--     descricao VARCHAR(200),
--     inicio_atendimento VARCHAR(10),
--     fim_atendimento VARCHAR(10),
--     id_usuario BIGINT unsigned not null,
--     FOREIGN KEY(id_usuario) REFERENCES usuarios(id)
-- );

-- CREATE TABLE agendamento (
--     id_agendamento serial PRIMARY KEY,
-- 	id_posto BIGINT unsigned not null,
--     id_usuario BIGINT unsigned not null,
--     data_hora DATETIME not null default CURRENT_TIMESTAMP,
--     FOREIGN KEY(id_posto) REFERENCES posto(id_posto),
--     FOREIGN KEY(id_usuario) REFERENCES usuarios(id)
-- );

