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
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country` (
  `country_name` varchar(20) NOT NULL,
  `population` int(11) DEFAULT NULL,
  `gdp` int(11) DEFAULT NULL,
  `education_index` float DEFAULT NULL,
  `literacy_rate` decimal(3,1) DEFAULT NULL,
  PRIMARY KEY (`country_name`),
  UNIQUE KEY `country_name_UNIQUE` (`country_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES ('',0,0,0,0.0),('Algeria',44,163,0.664,80.2),('Argentina',45,487,0.816,98.0),('Australia',25,1707,0.929,99.0),('Austria',8,480,0.852,99.0),('Azerbaijan',10,54,0.709,99.8),('Bangladesh',169,416,0.508,74.4),('Belarus',9,68,0.838,99.8),('Belgium',11,594,0.893,99.0),('Bolivia',12,40,0.687,96.7),('Brazil',214,1608,0.686,93.2),('Bulgaria',6,84,0.805,98.4),('Canada',38,1988,0.899,99.0),('Chile',19,317,0.8,98.6),('China ',1455,17734,0.644,96.8),('Colombia',51,314,0.676,94.7),('Czech Republic',10,281,0.893,99.0),('Denmark',5,398,0.92,99.0),('EADS CASA Espacio',0,0,0,0.0),('Ecuador',17,106,0.697,93.8),('Egypt',109,404,0.604,74.9),('ESA',0,0,0,0.0),('Estonia',1,37,0.869,99.8),('Ethiopia',120,111,0.327,48.5),('Finland',5,297,0.905,99.9),('France',67,2937,0.84,99.0),('French Guiana',294,1,0,88.9),('Germany',83,4223,0.94,99.0),('Greece',10,214,0.838,97.7),('Hungary',9,181,0.815,99.1),('India',1419,3173,0.556,77.7),('Indonesia',273,1186,0.622,96.4),('Iran',87,359,0.741,86.8),('Iraq',43,207,0.534,82.5),('Israel',9,488,0.874,97.1),('Italy',59,2107,0.791,99.0),('Japan',125,4937,0.848,99.0),('Jordan',11,45,0.711,95.3),('Kazakhstan',19,197,0.814,99.8),('Kuwait',4,186,0.62,96.3),('Laos',7,19,0.484,73.2),('Lithuania',2,66,0.874,99.8),('Luxembourg',1,85,0.791,99.9),('Malaysia',33,373,0.719,96.6),('Marshall Islands',42,1,0,98.3),('Mexico',126,1293,0.678,94.5),('Monaco',36,8,0,0.0),('Morocco ',37,142,0.529,73.8),('Multinational',0,0,0,0.0),('Nepal',30,36,0.502,68.6),('Netherlands',17,1018,0.906,99.0),('New Zeland',5,249,0.917,99.0),('Nigeria',213,440,0.483,64.2),('Norway',5,482,0.915,99.9),('Pakistan',231,348,0.411,59.4),('Paraguay',6,39,0.631,94.4),('Peru',33,223,0.689,94.5),('Poland',37,679,0.866,99.7),('Qatar',2,179,0.698,96.3),('Russia',143,1775,0.832,99.7),('Saudi Arabia',35,833,0.787,94.7),('Singapore',5,397,0.832,97.7),('Slovenia',2,61,0.886,99.7),('South Africa',59,419,0.708,87.2),('South Korea',51,1798,0.862,97.9),('Space',0,0,0,0.0),('Spain',47,1425,0.824,98.1),('Sri Lanka',22,88,0.749,93.4),('Sudan',45,34,0.328,60.9),('Sweden',10,635,0.904,99.9),('Switzerland',8,800,0.897,99.0),('Taiwan',23,774,0,98.7),('Thailand',71,505,0.661,96.7),('Thales Alenia Space',0,0,0,NULL),('Tunisia',12,46,0.659,81.8),('Turkey',84,819,0.689,96.3),('Turkmenistan',6,109,0.626,99.6),('Ukraine',43,200,0.794,99.8),('United Arab Emirates',9,415,0.738,93.8),('United Kingdom',67,3186,0.914,99.0),('USA',331,22996,0.903,99.0),('Venezuela',28,59,0.741,96.9),('Vietnam',97,366,0.626,96.4);
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-01 17:02:10
