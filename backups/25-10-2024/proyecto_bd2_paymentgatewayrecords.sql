-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: proyecto_bd2
-- ------------------------------------------------------
-- Server version	8.3.0

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
-- Table structure for table `paymentgatewayrecords`
--

DROP TABLE IF EXISTS `paymentgatewayrecords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paymentgatewayrecords` (
  `id` int NOT NULL AUTO_INCREMENT,
  `reference` varchar(255) NOT NULL,
  `idPayment` int DEFAULT NULL,
  `dataRespons` text,
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idPayment` (`idPayment`),
  CONSTRAINT `paymentgatewayrecords_ibfk_1` FOREIGN KEY (`idPayment`) REFERENCES `payment` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paymentgatewayrecords`
--

LOCK TABLES `paymentgatewayrecords` WRITE;
/*!40000 ALTER TABLE `paymentgatewayrecords` DISABLE KEYS */;
INSERT INTO `paymentgatewayrecords` VALUES (1,'REF-001-JOHNDOE',1,'Factura para John Doe, cliente regular','2024-10-23 10:01:23','2024-10-23 10:01:23'),(2,'REF-002-JANESMITH',2,'Factura generada por compra con descuento','2024-10-23 10:01:23','2024-10-23 10:01:23'),(3,'REF-003-MARIAGARCIA',3,'Pago realizado en efectivo, cliente satisfecho','2024-10-23 10:01:23','2024-10-23 10:01:23'),(4,'REF-004-PETERJOHNSON',4,'Factura urgente, se necesita entrega inmediata','2024-10-23 10:01:23','2024-10-23 10:01:23'),(5,'REF-005-LINDABROWN',5,'Factura procesada con PayPal','2024-10-23 10:01:23','2024-10-23 10:01:23');
/*!40000 ALTER TABLE `paymentgatewayrecords` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-25  8:55:15
