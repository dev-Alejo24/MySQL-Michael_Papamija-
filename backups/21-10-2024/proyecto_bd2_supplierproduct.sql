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
-- Table structure for table `supplierproduct`
--

DROP TABLE IF EXISTS `supplierproduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplierproduct` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idSupplier` int DEFAULT NULL,
  `idProduct` int DEFAULT NULL,
  `quantity` int NOT NULL,
  `purchasePrice` decimal(10,2) NOT NULL,
  `salePrice` decimal(10,2) NOT NULL,
  `expirationDate` date DEFAULT NULL,
  `createdAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idSupplier` (`idSupplier`),
  KEY `idProduct` (`idProduct`),
  CONSTRAINT `supplierproduct_ibfk_1` FOREIGN KEY (`idSupplier`) REFERENCES `users` (`id`),
  CONSTRAINT `supplierproduct_ibfk_2` FOREIGN KEY (`idProduct`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplierproduct`
--

LOCK TABLES `supplierproduct` WRITE;
/*!40000 ALTER TABLE `supplierproduct` DISABLE KEYS */;
INSERT INTO `supplierproduct` VALUES (1,3,1,5,800.00,999.99,'2025-01-01','2024-10-21 21:11:25','2024-10-21 21:11:25'),(2,3,2,50,10.00,19.99,'2025-02-01','2024-10-21 21:11:25','2024-10-21 21:11:25'),(3,4,3,200,0.80,1.50,'2024-10-15','2024-10-21 21:11:25','2024-10-21 21:11:25'),(4,5,4,25,8.00,12.99,'2025-03-01','2024-10-21 21:11:25','2024-10-21 21:11:25'),(5,4,5,10,100.00,199.99,'2024-12-31','2024-10-21 21:11:25','2024-10-21 21:11:25');
/*!40000 ALTER TABLE `supplierproduct` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-21 21:35:16
