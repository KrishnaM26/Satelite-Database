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
-- Table structure for table `launch_site`
--

DROP TABLE IF EXISTS `launch_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `launch_site` (
  `launch_site_name` varchar(300) NOT NULL,
  `country_name` varchar(300) NOT NULL,
  PRIMARY KEY (`launch_site_name`),
  UNIQUE KEY `launch_site_name_UNIQUE` (`launch_site_name`),
  KEY `country_name` (`country_name`),
  CONSTRAINT `launch_site_ibfk_1` FOREIGN KEY (`country_name`) REFERENCES `country` (`country_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `launch_site`
--

LOCK TABLES `launch_site` WRITE;
/*!40000 ALTER TABLE `launch_site` DISABLE KEYS */;
INSERT INTO `launch_site` VALUES ('Taiyuan Launch Center','China'),('Wenchang Satellite Launch Center','China'),('Wenchang Space Center','China'),('Xichang Satellite Launch Center','China'),('Yellow Sea Launch Platform','China'),('Guiana Space Center','French Guiana'),('Satish Dhawan','India'),('Satish Dhawan Space Centre','India'),('Shahroud Missile Range','Iran'),('Tanegashima Space Center','Japan'),('Uchinoura Space Center','Japan'),('Kwajalein Island','Marshall Islands'),('Dombarovsky Air Base','Russia'),('Plesetsk Cosmodrome','Russia'),('Svobodny Cosmodrome','Russia'),('Vostochny Cosmodrome','Russia'),('Naro Space Center','South Korea'),('Antares','USA'),('Cape Canaveral','USA'),('Cygnus','USA'),('Dragon CRS-17','USA'),('FANTM-RAiL (Xtenti)','USA'),('FANTM-RAiL [Xtenti]','USA'),('International Space Station','USA'),('International Space Station - Antares','USA'),('International Space Station - Cygnus','USA'),('Kodiak Island','USA'),('Kodiak Launch Complex','USA'),('Orbital ATK L-1011','USA'),('Sea Launch Odyssey','USA'),('Stargazer L-1011','USA'),('Vandenberg AFB','USA'),('Virgin Orbit','USA'),('Wallops Island Flight Facility','USA');
/*!40000 ALTER TABLE `launch_site` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-01 17:02:14
