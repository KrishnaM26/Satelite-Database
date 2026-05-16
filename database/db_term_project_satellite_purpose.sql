-- MySQL dump 10.13  Distrib 8.0.32, for macos13 (x86_64)
--
-- Host: dbtermproject2.mysql.database.azure.com    Database: db_term_project
-- ------------------------------------------------------
-- Server version	5.7.41-log

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
-- Table structure for table `satellite_purpose`
--

DROP TABLE IF EXISTS `satellite_purpose`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `satellite_purpose` (
  `purpose_id` int(11) NOT NULL,
  `purpose` varchar(50) NOT NULL,
  PRIMARY KEY (`purpose_id`),
  UNIQUE KEY `purpose_id_UNIQUE` (`purpose_id`),
  UNIQUE KEY `purpose_UNIQUE` (`purpose`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `satellite_purpose`
--

LOCK TABLES `satellite_purpose` WRITE;
/*!40000 ALTER TABLE `satellite_purpose` DISABLE KEYS */;
INSERT INTO `satellite_purpose` VALUES (0,''),(1,'Amateur Radio'),(2,'Communications'),(3,'Earth Observation'),(4,'Earth Science'),(5,'Educational'),(6,'Global Positioning'),(7,'Maritime Tracking'),(8,'Mission Extension Technology'),(9,'Navigation'),(10,'Platform'),(11,'Regional Positioning'),(12,'Satellite Positioning'),(13,'Signals Intelligence'),(14,'Space Observation'),(15,'Space Science'),(16,'Surveillance'),(17,'Technology Demonstration'),(18,'Technology Development'),(19,'Unknown');
/*!40000 ALTER TABLE `satellite_purpose` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-01 17:02:11
