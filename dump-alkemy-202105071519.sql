-- MySQL dump 10.13  Distrib 8.0.23, for macos10.15 (x86_64)
--
-- Host: localhost    Database: alkemy
-- ------------------------------------------------------
-- Server version	8.0.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `operation`
--

DROP TABLE IF EXISTS `operation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `operation` (
  `concept` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `amount` int NOT NULL,
  `date` date NOT NULL,
  `id_operation` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `id_tipo` int NOT NULL,
  PRIMARY KEY (`id_operation`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_tipo` (`id_tipo`),
  CONSTRAINT `operation_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  CONSTRAINT `operation_ibfk_2` FOREIGN KEY (`id_tipo`) REFERENCES `tipo` (`id_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation`
--

LOCK TABLES `operation` WRITE;
/*!40000 ALTER TABLE `operation` DISABLE KEYS */;
INSERT INTO `operation` VALUES ('Pago Nutri',200,'2021-09-12',5,1,2),('Pago Nutri',200,'2210-10-10',6,1,1),('Papi',1000,'2222-02-12',7,1,1);
/*!40000 ALTER TABLE `operation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo`
--

DROP TABLE IF EXISTS `tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo` (
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_tipo` int NOT NULL,
  PRIMARY KEY (`id_tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo`
--

LOCK TABLES `tipo` WRITE;
/*!40000 ALTER TABLE `tipo` DISABLE KEYS */;
INSERT INTO `tipo` VALUES ('Ingreso',1),('Egreso',2);
/*!40000 ALTER TABLE `tipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `name` varchar(100) NOT NULL,
  `surname` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES ('Marcos','Aguilo','marcosaguilo@hotmail.com',1,'$2b$10$nESiko93PZyIsO8erlaCg.BepE9mlHQZ0HRYcx1DyVlC2jT5dwXiW'),('Roberto','Perez','raulcito@hotmail.com',3,'$2b$10$8ewIkjZ8olQyzSWgpAJUcOM0PueIIDI3VcaVdd0412jVALHLfPRte'),('Cacho','Salva','salva@hotmail.com',4,'$2b$10$IHiBo8NehIXYqCmcPUvkpO8Erew2q3aab/EZxsDCgthHNTC2ssnhu'),('Juan','Perez','asdas@jkjk.com',5,'$2b$10$DPOT8caTsYkjQJ8KUs9cb.9H1ZGIJjutu2wBc2IOQl2/ZnA8nlvK.'),('Marcos','Aguilo','marcosaguilo@hotmail.com',6,'$2b$10$yl7cIktCKOj5xdcWYwJTdusH43WpJfyvbAIocz3HNd3YNY5R5UA72'),('Marcos','Aguilo','marcosaguilo@hotmail.com',7,'$2b$10$oAUpeKUOSSbd5bOlx6rlZe8OGXmRJuAB98FojhuZvSJLMwLUgLPNq'),('Marcos','Aguilo','marcosaguilo@hotmail.com',8,'$2b$10$Qh/ivTX2aEMUkD6Ze3hW0eCSqx6ytd3QhVPaFRpH4l/1ea0uEvmMO'),('Marcos','Aguilo','marcosaguilo@hotmail.com',9,'$2b$10$oL842lrQ9TSvNJseQOBJjet4766RyLzrUr/z3tm64iXPuUi451Fa2'),('asasas','asassasaasas','marcos.aguilo@nyfa.edu',10,'$2b$10$LMbpmpHSLduFlSVZ.i2HUuAC4QH8yhzrTx.6J4Qfkxa0yuKBPohPK'),('asasas','asassasaasas','marcos.aguilo@nyfa.edu',11,'$2b$10$FS8yA1LleiJKTb0PRel8r.c5A9n9morVjxv4sbA6KmZprrw3b8MdS'),('juancuto','mabmo','mansd@hotmail.com',12,'$2b$10$zpE7OEKuKv73cI8o/QgMFOk62cuZm9XTDFl7ZZU2kZJG.vdYa3GdW');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'alkemy'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-07 15:19:47
