-- MySQL dump 10.13  Distrib 6.0.11-alpha, for Win32 (ia32)
--
-- Host: localhost    Database: busticketing
-- ------------------------------------------------------
-- Server version	6.0.11-alpha-community

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `A_id` int(4) NOT NULL,
  `Username` varchar(20) DEFAULT NULL,
  `Password` varchar(30) DEFAULT NULL,
  `Active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`A_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'userone','abcd',1),(2,'usertwo','efgh',1);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `booking` (
  `b_id` int(4) NOT NULL,
  `b_date` datetime DEFAULT NULL,
  `bus_no` int(4) DEFAULT NULL,
  `seat_no` varchar(30) DEFAULT NULL,
  `pnr` int(4) DEFAULT NULL,
  PRIMARY KEY (`b_id`),
  KEY `bus_no` (`bus_no`),
  KEY `pnr` (`pnr`),
  CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`bus_no`) REFERENCES `bus` (`busno`),
  CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`pnr`) REFERENCES `passenger` (`P_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bus`
--

DROP TABLE IF EXISTS `bus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bus` (
  `busno` int(4) NOT NULL,
  `routeno` int(4) DEFAULT NULL,
  `busname` varchar(40) DEFAULT NULL,
  `bustype` varchar(20) DEFAULT NULL,
  `fare` int(4) DEFAULT NULL,
  `totalseats` int(4) DEFAULT '32',
  PRIMARY KEY (`busno`),
  KEY `routeno` (`routeno`),
  CONSTRAINT `bus_ibfk_1` FOREIGN KEY (`routeno`) REFERENCES `route` (`R_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bus`
--

LOCK TABLES `bus` WRITE;
/*!40000 ALTER TABLE `bus` DISABLE KEYS */;
INSERT INTO `bus` VALUES (1111,8,'Pashupatinagar Travels','Normal Bus',1600,42),(1234,3,'Miteri Yatayat','Deluxe Bus',1230,32),(2222,6,'Yeti Travels','Deluxe Bus',1400,32),(3333,7,'Yeti Travels','Deluxe Bus',1350,32),(4444,7,'Makalu','AC Bus',1600,32),(6653,4,'Mero Bus','AC Bus',1600,32);
/*!40000 ALTER TABLE `bus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passenger`
--

DROP TABLE IF EXISTS `passenger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `passenger` (
  `P_id` int(5) NOT NULL,
  `FName` varchar(20) DEFAULT NULL,
  `LName` varchar(20) DEFAULT NULL,
  `Address` varchar(30) DEFAULT NULL,
  `Phone` bigint(10) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`P_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passenger`
--

LOCK TABLES `passenger` WRITE;
/*!40000 ALTER TABLE `passenger` DISABLE KEYS */;
/*!40000 ALTER TABLE `passenger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `route`
--

DROP TABLE IF EXISTS `route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `route` (
  `R_id` int(4) NOT NULL AUTO_INCREMENT,
  `bata` varchar(30) DEFAULT NULL,
  `samma` varchar(30) DEFAULT NULL,
  `dep_time` varchar(20) DEFAULT NULL,
  `arrv_time` varchar(50) DEFAULT NULL,
  `distance` int(4) DEFAULT NULL,
  PRIMARY KEY (`R_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `route`
--

LOCK TABLES `route` WRITE;
/*!40000 ALTER TABLE `route` DISABLE KEYS */;
INSERT INTO `route` VALUES (3,'Kathmandu','Itahari','4:30 pm','5:30 am (next day)',700),(4,'Kathmandu','Dharan','4:00 pm','5:30 am (next day)',775),(5,'Kathmandu','Biratnagar','4:00 pm','6:00 am (next day)',760),(6,'Kathmandu','Urlabari','3:45 pm','6:30 am (next day)',850),(7,'Kathmandu','Budhabare','3:30 pm','6:30 am (next day)',870),(8,'Kathmandu','Ilam','2:00 pm','8:00 am (next day)',900),(10,'Kathmandu','Pokhara','5:00 am','12:30 pm',300),(11,'Pokhara','Kathmandu','4:00 am','12:30 pm',350);
/*!40000 ALTER TABLE `route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedule` (
  `scid` int(4) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `route` int(4) DEFAULT NULL,
  `bus` int(4) DEFAULT NULL,
  PRIMARY KEY (`scid`),
  KEY `route` (`route`),
  KEY `bus` (`bus`),
  CONSTRAINT `schedule_ibfk_1` FOREIGN KEY (`route`) REFERENCES `route` (`R_id`),
  CONSTRAINT `schedule_ibfk_2` FOREIGN KEY (`bus`) REFERENCES `bus` (`busno`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
INSERT INTO `schedule` VALUES (1,'2013-12-24',3,6653),(2,'2013-12-24',3,1234),(3,'2013-12-24',6,3333),(4,'2013-12-24',5,6653),(5,'2013-12-24',7,1234),(6,'2013-12-24',8,1111),(7,'2013-12-24',10,6653),(8,'2013-12-24',7,1234),(9,'2013-12-24',7,2222);
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-12-27 10:55:34
