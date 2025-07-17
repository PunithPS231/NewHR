CREATE DATABASE  IF NOT EXISTS `newhr` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `newhr`;
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: newhr
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `apply`
--

DROP TABLE IF EXISTS `apply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `apply` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `EID` int NOT NULL,
  `TYPE` enum('Casual Leave','Sick Leave','Resign') NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `reason` varchar(200) NOT NULL,
  `status` varchar(45) NOT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apply`
--

LOCK TABLES `apply` WRITE;
/*!40000 ALTER TABLE `apply` DISABLE KEYS */;
INSERT INTO `apply` VALUES (1,1007,'Sick Leave','2025-05-13','2025-05-13','Headache','Approved','2025-05-12 22:04:36'),(2,1007,'Casual Leave','2025-05-15','2025-05-15','Fever','Approved','2025-05-14 11:35:40'),(3,1007,'Sick Leave','2025-05-19','2025-05-19','Cold fever','Rejected','2025-05-17 12:16:50'),(4,1007,'Sick Leave','2025-05-19','2025-05-19','Cold fever','Rejected','2025-05-17 12:19:31'),(5,1011,'Casual Leave','2025-06-02','2025-06-02','Apply','Approved','2025-06-01 20:32:51'),(6,1023,'Casual Leave','2025-06-07','2025-06-08','Personal Reason','Approved','2025-06-06 15:01:43'),(7,1024,'Sick Leave','2025-06-21','2025-06-22','Fever','Approved','2025-06-20 11:54:30'),(8,1025,'Casual Leave','2025-07-11','2025-07-12','Personal Reason','Approved','2025-07-10 09:52:26');
/*!40000 ALTER TABLE `apply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(45) NOT NULL,
  `PHONE` bigint NOT NULL,
  `MAIL` varchar(45) NOT NULL,
  `JOB` varchar(45) NOT NULL,
  `DOB` date NOT NULL,
  `SAL` decimal(12,2) unsigned NOT NULL,
  `DOJ` date NOT NULL,
  `PASSWORD` varchar(45) NOT NULL,
  `STATUS` enum('active','inactive') NOT NULL,
  `DATE` datetime DEFAULT NULL,
  `sl` int DEFAULT NULL,
  `cl` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `PHONE_UNIQUE` (`PHONE`),
  UNIQUE KEY `MAIL_UNIQUE` (`MAIL`)
) ENGINE=InnoDB AUTO_INCREMENT=1026 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1001,'Kishore',1234512345,'kishore123@gmail.com','CEO','2003-05-08',120000.00,'2022-01-15','1234','active','2025-05-14 13:01:00',2,2),(1002,'Karan',6767676767,'karan67@gmail.com','Salesman','1995-09-25',30000.00,'2024-02-29','1234','active','2025-04-14 14:18:06',2,2),(1003,'Sushanth',2345623456,'sushanth@gmail.com','Accountant','2000-08-11',45000.00,'2025-01-16','1234','active','2025-04-14 14:20:36',2,2),(1004,'Deepak.B',1231231231,'deepak@gmail.com','Developer','2000-08-13',50000.00,'2025-01-01','deep','active','2025-04-14 14:22:59',2,2),(1005,'Chandan',5678956789,'chandan@gmail.com','Salesman','1995-12-04',30000.00,'2024-10-24','1234','active','2025-04-14 15:09:21',2,2),(1006,'Kushal',9876543211,'kushal@gmail.com','Developer','2000-03-03',50000.00,'2023-11-11','1234','active','2025-04-14 15:12:03',2,2),(1007,'Raju',7654327654,'raju@gmail.com','Operation Analyst','1997-05-06',25000.00,'2024-06-05','1234','active','2025-05-17 12:19:31',-1,0),(1008,'Deepak.B',6786786781,'d@gmail.com','Manager','1999-01-01',75000.00,'2023-01-01','6789','active','2025-04-26 13:28:58',2,2),(1010,'Chethan',7654456798,'chethan123@gmail.com','Developer','2002-01-01',50000.00,'2025-01-18','1234','active','2025-05-02 16:20:09',2,2),(1011,'Punith',1234123451,'punith@gmail.com','Accountant','1999-01-16',45000.00,'2024-05-09','1234','active','2025-06-01 20:32:51',2,1),(1012,'Prajwal',3456543456,'prajwall@gmail.com','Business Analyst','2003-06-11',90000.00,'2025-02-20','1234','active','2025-05-06 18:09:24',2,2),(1014,'Vishwas',4543346654,'vish@gmail.com','Developer','1995-06-15',50000.00,'2025-04-09','1234','active','2025-05-06 18:11:18',2,2),(1015,'Awez',9876567898,'awez@gmail.com','Developer','2002-02-13',50000.00,'2024-11-13','1234','active','2025-05-07 17:13:22',2,2),(1016,'Yashwanth',7654456789,'yashwant@gmail.com','Business Analyst','1993-06-22',90000.00,'2025-05-01','1234','active','2025-05-07 17:17:57',2,2),(1017,'Ambinayaka',7654543542,'ambi@gmail.com','Developer','2000-06-07',50000.00,'2024-06-05','1234','active','2025-05-14 12:56:16',2,2),(1018,'Abhi',7654567654,'abhi123@gmail.com','Developer','1999-09-09',50000.00,'2022-02-02','1234','active','2025-05-15 12:33:09',2,2),(1020,'Abhi',7878765434,'abhi122@gmail.com','Salesman','2000-02-02',30000.00,'2023-03-03','1234','active','2025-05-15 12:34:42',2,2),(1023,'Darshan',3453423433,'darshan12345@gmail.com','Manager','1990-03-20',0.00,'2024-01-01','1234','active','2025-06-06 15:00:52',0,0),(1024,'Abhijna',8767665654,'abhijna@gmail.com','Manager','2003-01-01',0.00,'2025-03-03','1234','active','2025-06-20 11:53:31',0,0),(1025,'Chandana',3456324512,'chandana@gmail.com','Developer','2000-01-01',0.00,'2025-02-02','1234','active','2025-07-10 09:51:25',0,0);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salary`
--

DROP TABLE IF EXISTS `salary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salary` (
  `ID` bigint NOT NULL,
  `EID` int NOT NULL,
  `MONTH_YEAR` varchar(45) NOT NULL,
  `SAL` decimal(12,2) NOT NULL,
  `NET` decimal(12,2) NOT NULL,
  `url` text,
  `DATE` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary`
--

LOCK TABLES `salary` WRITE;
/*!40000 ALTER TABLE `salary` DISABLE KEYS */;
INSERT INTO `salary` VALUES (15599187642475,1007,'2025-05',120000.00,108000.00,'D:\\J2EE\\Employee\\Salary_Slip\\1007_2025-05.pdf','2025-05-17 19:43:07'),(179681354243243,1024,'JUN_2025',40000.00,36000.00,'D:\\J2EE\\Employee\\Salary_Slip\\1024_JUN_2025.pdf','2025-06-20 11:57:33'),(234018381444136,1025,'JUN_2025',40000.00,36000.00,'D:\\J2EE\\Employee\\Salary_Slip\\1025_JUN_2025.pdf','2025-07-10 09:55:49'),(253004058771176,1023,'MAY_2025',70000.00,63000.00,'D:\\J2EE\\Employee\\Salary_Slip\\1023_MAY_2025.pdf','2025-06-06 15:04:32'),(428173969947225,1006,'2025-05',120000.00,108000.00,'D:\\J2EE\\Employee\\Salary_Slip\\1006_2025-05.pdf','2025-05-18 11:32:34'),(452574105677816,1025,'2025-06',0.00,108000.00,'D:\\J2EE\\Employee\\Salary_Slip\\1025_2025-06.pdf','2025-07-11 10:59:59'),(593187325657859,1005,'2025-05',30000.00,108000.00,'D:\\J2EE\\Employee\\Salary_Slip\\1005_2025-05.pdf','2025-05-18 12:47:49');
/*!40000 ALTER TABLE `salary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket` (
  `ID` bigint NOT NULL,
  `EID` int NOT NULL,
  `SUBJECT` varchar(100) NOT NULL,
  `ABOUT` text NOT NULL,
  `status` enum('Open','In progress','Resolved','Closed') NOT NULL,
  `resolved_date` datetime DEFAULT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (233830490124387,1025,'Charger Issue','sadfghsadfg','Open','2025-07-11 11:02:04','2025-07-11 11:02:04'),(309803353612100,1023,'Charager Issue','I need a new charger','Resolved','2025-06-06 15:04:11','2025-06-06 15:02:31'),(470809978202878,1007,'Charger Issue','There is a issue with my charger. I want replacement','Open','2025-05-14 11:36:14','2025-05-14 11:36:14'),(761677865010395,1024,'Salary Issue','Salary has not deposited to mu account','In progress','2025-06-20 11:57:10','2025-06-20 11:55:40'),(966177555580034,1025,'Salary not came','dfdggdwe','Resolved','2025-07-10 09:55:23','2025-07-10 09:53:19');
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-17 13:36:36
