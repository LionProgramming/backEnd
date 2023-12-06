-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: lyondb
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.28-MariaDB

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
-- Table structure for table `grados`
--

DROP TABLE IF EXISTS `grados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grados` (
  `numero` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador en forma de presentación numérica o alfanumérica que muestra el nivel en el que está clasificado el Estudiante (Este campo es obligatorio).',
  `salonAsignado` int(11) NOT NULL COMMENT 'Espacio designado para la instrucción de Profesor a Estudiante (Este campo es obligatorio).',
  `nombre` int(5) NOT NULL,
  `anio` varchar(4) DEFAULT NULL,
  `director` int(11) DEFAULT NULL,
  PRIMARY KEY (`numero`),
  KEY `fk_Grado_Usuario1_idx` (`director`),
  CONSTRAINT `fk_Grado_Usuario1` FOREIGN KEY (`director`) REFERENCES `usuarios` (`documento`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grados`
--

LOCK TABLES `grados` WRITE;
/*!40000 ALTER TABLE `grados` DISABLE KEYS */;
INSERT INTO `grados` VALUES (1,601,601,'2023',10270880),(2,602,602,'2023',10375882),(3,603,603,'2023',13606910),(4,701,701,'2023',15039538),(5,702,702,'2023',15993251),(6,703,703,'2023',18417786),(7,801,801,'2023',18718078),(8,802,802,'2023',21510850),(9,803,803,'2023',23248937),(10,901,901,'2023',23293738),(11,902,902,'2023',30381482),(12,903,903,'2023',30382152),(13,1003,1003,'2023',34449927),(14,1004,1004,'2023',36392754),(15,1101,1101,'2023',82178031),(16,1102,1102,'2023',88938333),(17,1103,1103,'2023',91702232);
/*!40000 ALTER TABLE `grados` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-06 16:35:57
