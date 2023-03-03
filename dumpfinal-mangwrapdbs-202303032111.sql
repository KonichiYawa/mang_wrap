-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: mangwrapdbs
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.27-MariaDB

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
-- Table structure for table `tbl_order`
--

DROP TABLE IF EXISTS `tbl_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_order` (
  `orderNo` int(11) NOT NULL AUTO_INCREMENT,
  `OrderDate` varchar(100) NOT NULL,
  `wrapID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `ShipNo` int(11) NOT NULL,
  PRIMARY KEY (`orderNo`),
  KEY `tbl_order_FK` (`wrapID`),
  KEY `tbl_order_FK_1` (`CustomerID`),
  KEY `tbl_order_FK_2` (`ShipNo`),
  CONSTRAINT `tbl_order_FK` FOREIGN KEY (`wrapID`) REFERENCES `tblwrap` (`wrapID`),
  CONSTRAINT `tbl_order_FK_1` FOREIGN KEY (`CustomerID`) REFERENCES `tblcustomer` (`customerID`),
  CONSTRAINT `tbl_order_FK_2` FOREIGN KEY (`ShipNo`) REFERENCES `tbl_ship` (`ShipNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_order`
--

LOCK TABLES `tbl_order` WRITE;
/*!40000 ALTER TABLE `tbl_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_ship`
--

DROP TABLE IF EXISTS `tbl_ship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_ship` (
  `ShipNo` int(11) NOT NULL AUTO_INCREMENT,
  `shipName` varchar(100) NOT NULL,
  `ShipArrive` varchar(100) NOT NULL,
  `Location` varchar(100) NOT NULL,
  PRIMARY KEY (`ShipNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_ship`
--

LOCK TABLES `tbl_ship` WRITE;
/*!40000 ALTER TABLE `tbl_ship` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_ship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblcity`
--

DROP TABLE IF EXISTS `tblcity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblcity` (
  `CityID` int(11) NOT NULL AUTO_INCREMENT,
  `regionID` int(11) NOT NULL,
  PRIMARY KEY (`CityID`),
  KEY `tblcity_FK` (`regionID`),
  CONSTRAINT `tblcity_FK` FOREIGN KEY (`regionID`) REFERENCES `tblregion` (`regionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblcity`
--

LOCK TABLES `tblcity` WRITE;
/*!40000 ALTER TABLE `tblcity` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblcity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblcustomer`
--

DROP TABLE IF EXISTS `tblcustomer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblcustomer` (
  `customerID` int(11) NOT NULL AUTO_INCREMENT,
  `Username` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `ContactNo` int(11) NOT NULL,
  `FullName` varchar(100) NOT NULL,
  `birthdate:` varchar(100) NOT NULL,
  `gender` varchar(100) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `regionID` int(11) NOT NULL,
  `CityID` int(11) NOT NULL,
  PRIMARY KEY (`customerID`),
  KEY `tblcustomer_FK` (`CityID`),
  KEY `tblcustomer_FK_1` (`regionID`),
  CONSTRAINT `tblcustomer_FK` FOREIGN KEY (`CityID`) REFERENCES `tblcity` (`CityID`),
  CONSTRAINT `tblcustomer_FK_1` FOREIGN KEY (`regionID`) REFERENCES `tblregion` (`regionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblcustomer`
--

LOCK TABLES `tblcustomer` WRITE;
/*!40000 ALTER TABLE `tblcustomer` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblcustomer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblregion`
--

DROP TABLE IF EXISTS `tblregion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblregion` (
  `regionID` int(11) NOT NULL AUTO_INCREMENT,
  `RgName` varchar(100) NOT NULL,
  PRIMARY KEY (`regionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblregion`
--

LOCK TABLES `tblregion` WRITE;
/*!40000 ALTER TABLE `tblregion` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblregion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbluser`
--

DROP TABLE IF EXISTS `tbluser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbluser` (
  `UserID` int(11) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(100) NOT NULL,
  `UserPassword` varchar(100) NOT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbluser`
--

LOCK TABLES `tbluser` WRITE;
/*!40000 ALTER TABLE `tbluser` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbluser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblwrap`
--

DROP TABLE IF EXISTS `tblwrap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblwrap` (
  `wrapID` int(11) NOT NULL AUTO_INCREMENT,
  `WrapColor` varchar(100) DEFAULT NULL,
  `WrapType` varchar(100) DEFAULT NULL,
  `WrapPrice` int(11) DEFAULT NULL,
  `Size` varchar(100) DEFAULT NULL,
  `WrapImageSample` blob NOT NULL,
  PRIMARY KEY (`wrapID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblwrap`
--

LOCK TABLES `tblwrap` WRITE;
/*!40000 ALTER TABLE `tblwrap` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblwrap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'mangwrapdbs'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-03 21:11:23
