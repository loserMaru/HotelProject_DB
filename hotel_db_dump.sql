-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: hotel_db
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `idAccount` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`idAccount`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,'Marlen','12345678'),(4,'Ayder','12345678'),(5,'Egor','1234');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guest`
--

DROP TABLE IF EXISTS `guest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guest` (
  `idGuest` int NOT NULL AUTO_INCREMENT,
  `fname` varchar(45) DEFAULT NULL,
  `lname` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `checkIn` varchar(45) DEFAULT NULL,
  `checkOut` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idGuest`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guest`
--

LOCK TABLES `guest` WRITE;
/*!40000 ALTER TABLE `guest` DISABLE KEYS */;
INSERT INTO `guest` VALUES (32,'Marlen','Osmanov','+79786656745','osmanov.m.i.20@gmail.com','2023-07-28','2023-07-30'),(33,'Ayder','Muzafarov','+2189412489','ayder@gmail.com','2023-07-25','2023-07-28'),(34,'Elwira','Seydalieva','+2189412489','elseydal@gmail.com','2023-08-28','2023-08-30');
/*!40000 ALTER TABLE `guest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `idReservation` int NOT NULL,
  `reservationDate` date DEFAULT NULL,
  `checkIn` date DEFAULT NULL,
  `checkOut` date DEFAULT NULL,
  `Guest_idGuest` int NOT NULL,
  `Room_idRoom` int NOT NULL,
  PRIMARY KEY (`idReservation`),
  KEY `fk_Reservation_Guest1_idx` (`Guest_idGuest`),
  KEY `fk_Reservation_Room1_idx` (`Room_idRoom`),
  CONSTRAINT `fk_Reservation_Guest1` FOREIGN KEY (`Guest_idGuest`) REFERENCES `guest` (`idGuest`),
  CONSTRAINT `fk_Reservation_Room1` FOREIGN KEY (`Room_idRoom`) REFERENCES `room` (`idRoom`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES (1,'2017-06-05','2017-06-05','2017-06-05',1,1);
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `idRoom` int NOT NULL,
  `roomNumber` int DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `RoomType_idRoomType` int NOT NULL,
  PRIMARY KEY (`idRoom`),
  KEY `fk_Room_RoomType_idx` (`RoomType_idRoomType`),
  CONSTRAINT `fk_Room_RoomType` FOREIGN KEY (`RoomType_idRoomType`) REFERENCES `roomtype` (`idRoomType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (1,120,'busy',1),(2,119,'free',3),(3,215,'free',2),(4,320,'free',1),(5,325,'free',2),(6,115,'free',1),(7,221,'free',3),(8,103,'free',1),(9,301,'free',3),(10,210,'free',2);
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roomtype`
--

DROP TABLE IF EXISTS `roomtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roomtype` (
  `idRoomType` int NOT NULL,
  `roomType` varchar(45) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `price` varchar(45) DEFAULT NULL,
  `img` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`idRoomType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roomtype`
--

LOCK TABLES `roomtype` WRITE;
/*!40000 ALTER TABLE `roomtype` DISABLE KEYS */;
INSERT INTO `roomtype` VALUES (1,'Classic','2 ppls','4500','https://4.bp.blogspot.com/-M5rinkC65Xs/WqlvywDIl3I/AAAAAAAADpM/PLSPiB1cddwea-C0CYHMQEfzfjYLM7CHQCLcBGAs/s1600/cq5dam.web.1280.1280%2B%25282%2529.jpeg'),(2,'Luxe','4 ppls','9000','https://i.ytimg.com/vi/3syyXBxD0Fc/maxresdefault.jpg'),(3,'Deluxe','3','13500','https://i.pinimg.com/originals/22/88/c6/2288c6f4582ccc793dbd4bef10f24f0b.jpg');
/*!40000 ALTER TABLE `roomtype` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-22 15:29:22
