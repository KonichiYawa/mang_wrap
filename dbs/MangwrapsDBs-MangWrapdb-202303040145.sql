-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: MangWrapdb
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
-- Table structure for table `customerpayment`
--

DROP TABLE IF EXISTS `customerpayment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customerpayment` (
  `PaymentNo` int(11) NOT NULL AUTO_INCREMENT,
  `CustomerId` int(11) NOT NULL,
  `PayMethod` varchar(100) NOT NULL,
  `AccNo` varchar(100) DEFAULT NULL,
  `PaymentVal` date NOT NULL,
  PRIMARY KEY (`PaymentNo`),
  KEY `customerpayment_FK` (`CustomerId`),
  CONSTRAINT `customerpayment_FK` FOREIGN KEY (`CustomerId`) REFERENCES `tbl_customer` (`customerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customerpayment`
--

LOCK TABLES `customerpayment` WRITE;
/*!40000 ALTER TABLE `customerpayment` DISABLE KEYS */;
/*!40000 ALTER TABLE `customerpayment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbiinventory`
--

DROP TABLE IF EXISTS `tbiinventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbiinventory` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Quantity` int(11) NOT NULL,
  `QuantityLog` datetime NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbiinventory`
--

LOCK TABLES `tbiinventory` WRITE;
/*!40000 ALTER TABLE `tbiinventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbiinventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_customer`
--

DROP TABLE IF EXISTS `tbl_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_customer` (
  `CustomerID` int(11) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(100) NOT NULL,
  `UserPass` varchar(100) NOT NULL,
  `FullName` varchar(100) NOT NULL,
  PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_customer`
--

LOCK TABLES `tbl_customer` WRITE;
/*!40000 ALTER TABLE `tbl_customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblorder`
--

DROP TABLE IF EXISTS `tblorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblorder` (
  `OrderNo` int(11) NOT NULL AUTO_INCREMENT,
  `ProdNo` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `OrderDetailsNo` int(11) NOT NULL,
  PRIMARY KEY (`OrderNo`),
  KEY `ProdId` (`ProdNo`),
  KEY `OrderrDetailsNo` (`OrderDetailsNo`),
  CONSTRAINT `OrderrDetailsNo` FOREIGN KEY (`OrderDetailsNo`) REFERENCES `tblorderdetails` (`id`),
  CONSTRAINT `ProdId` FOREIGN KEY (`ProdNo`) REFERENCES `tblwrapprod` (`ProductNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblorder`
--

LOCK TABLES `tblorder` WRITE;
/*!40000 ALTER TABLE `tblorder` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblorderdetails`
--

DROP TABLE IF EXISTS `tblorderdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblorderdetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CustomerID` int(11) NOT NULL,
  `PaymentID` int(11) NOT NULL,
  `Total` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `CustomerID` (`CustomerID`),
  KEY `CutomerPaymentNo` (`PaymentID`),
  CONSTRAINT `CustomerID` FOREIGN KEY (`CustomerID`) REFERENCES `tbl_customer` (`customerID`),
  CONSTRAINT `CutomerPaymentNo` FOREIGN KEY (`PaymentID`) REFERENCES `customerpayment` (`PaymentNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblorderdetails`
--

LOCK TABLES `tblorderdetails` WRITE;
/*!40000 ALTER TABLE `tblorderdetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblorderdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblsystemuser`
--

DROP TABLE IF EXISTS `tblsystemuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblsystemuser` (
  `userNo` int(11) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(100) NOT NULL,
  `SystemPassword` varchar(100) NOT NULL,
  `Userlevel` varchar(100) NOT NULL,
  `FullName` varchar(100) NOT NULL,
  `Userlog` datetime NOT NULL,
  PRIMARY KEY (`userNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblsystemuser`
--

LOCK TABLES `tblsystemuser` WRITE;
/*!40000 ALTER TABLE `tblsystemuser` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblsystemuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbluseraddress`
--

DROP TABLE IF EXISTS `tbluseraddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbluseraddress` (
  `AddressNo` int(11) NOT NULL AUTO_INCREMENT,
  `CostumerId` int(11) NOT NULL,
  `Address1` varchar(100) NOT NULL,
  `Address2` varchar(100) DEFAULT NULL,
  `city` varchar(100) NOT NULL,
  `Country` varchar(100) NOT NULL,
  `postalCode` varchar(100) NOT NULL,
  `ContactNo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`AddressNo`),
  KEY `tblUserAddress_FK` (`CostumerId`),
  CONSTRAINT `tblUserAddress_FK` FOREIGN KEY (`CostumerId`) REFERENCES `tbl_customer` (`customerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbluseraddress`
--

LOCK TABLES `tbluseraddress` WRITE;
/*!40000 ALTER TABLE `tbluseraddress` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbluseraddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblwrapcat`
--

DROP TABLE IF EXISTS `tblwrapcat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblwrapcat` (
  `CategoryId` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Description` varchar(100) NOT NULL,
  `ImageDesc` blob DEFAULT NULL,
  PRIMARY KEY (`CategoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblwrapcat`
--

LOCK TABLES `tblwrapcat` WRITE;
/*!40000 ALTER TABLE `tblwrapcat` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblwrapcat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblwrapprod`
--

DROP TABLE IF EXISTS `tblwrapprod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblwrapprod` (
  `ProductNo` int(11) NOT NULL AUTO_INCREMENT,
  `WrapColor` varchar(100) NOT NULL,
  `WrapDescription` varchar(100) DEFAULT NULL,
  `CategoryId` int(11) NOT NULL,
  `Prize` varchar(100) NOT NULL,
  `Prodlog` datetime NOT NULL,
  `InvID` int(11) NOT NULL,
  PRIMARY KEY (`ProductNo`),
  KEY `tblwrapprod_FK` (`CategoryId`),
  KEY `tblwrapprod_FK_1` (`InvID`),
  CONSTRAINT `tblwrapprod_FK` FOREIGN KEY (`CategoryId`) REFERENCES `tblwrapcat` (`CategoryId`),
  CONSTRAINT `tblwrapprod_FK_1` FOREIGN KEY (`InvID`) REFERENCES `tbiinventory` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblwrapprod`
--

LOCK TABLES `tblwrapprod` WRITE;
/*!40000 ALTER TABLE `tblwrapprod` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblwrapprod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'MangWrapdb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-04  1:45:44
