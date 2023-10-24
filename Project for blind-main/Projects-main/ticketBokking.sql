-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: mp2
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `stat_code`
--

DROP TABLE IF EXISTS `stat_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stat_code` (
  `station_name` varchar(30) NOT NULL,
  `station_code` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stat_code`
--

LOCK TABLES `stat_code` WRITE;
/*!40000 ALTER TABLE `stat_code` DISABLE KEYS */;
INSERT INTO `stat_code` VALUES ('BHOPAL','BPL'),('REWA','REWA'),('CST MUMBAI','CSMT'),('JHANSI JN','JHS'),('GWALIOR JN','GWL'),('AMRITSAR JN','ASR'),('HOWRAH JN','HWH');
/*!40000 ALTER TABLE `stat_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_11057`
--

DROP TABLE IF EXISTS `t_11057`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_11057` (
  `seat_no` int NOT NULL,
  `cell_type` varchar(12) NOT NULL,
  `p_name` varchar(30) DEFAULT NULL,
  `p_date` date DEFAULT NULL,
  `p_board_stat` varchar(15) DEFAULT NULL,
  `p_departure_time` time DEFAULT NULL,
  `p_desti_stat` varchar(15) DEFAULT NULL,
  `p_arrival_time` time DEFAULT NULL,
  `p_fare` int DEFAULT NULL,
  `p_distance` int DEFAULT NULL,
  `gender` varchar(2) DEFAULT NULL,
  `train_no` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_11057`
--

LOCK TABLES `t_11057` WRITE;
/*!40000 ALTER TABLE `t_11057` DISABLE KEYS */;
INSERT INTO `t_11057` VALUES (1,'GN',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11057),(2,'GN',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11057),(3,'GN',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11057),(1,'SL',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11057),(2,'SL',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11057),(3,'SL',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11057),(1,'AC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11057),(2,'AC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11057),(3,'AC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11057);
/*!40000 ALTER TABLE `t_11057` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_12175`
--

DROP TABLE IF EXISTS `t_12175`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_12175` (
  `seat_no` int NOT NULL,
  `cell_type` varchar(12) NOT NULL,
  `p_name` varchar(30) DEFAULT NULL,
  `p_date` date DEFAULT NULL,
  `p_board_stat` varchar(15) DEFAULT NULL,
  `p_departure_time` time DEFAULT NULL,
  `p_desti_stat` varchar(15) DEFAULT NULL,
  `p_arrival_time` time DEFAULT NULL,
  `p_fare` int DEFAULT NULL,
  `p_distance` int DEFAULT NULL,
  `gender` varchar(2) DEFAULT NULL,
  `train_no` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_12175`
--

LOCK TABLES `t_12175` WRITE;
/*!40000 ALTER TABLE `t_12175` DISABLE KEYS */;
INSERT INTO `t_12175` VALUES (1,'GN',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12175),(2,'GN',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12175),(3,'GN',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12175),(1,'SL',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12175),(2,'SL',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12175),(3,'SL',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12175),(1,'AC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12175),(2,'AC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12175),(3,'AC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12175);
/*!40000 ALTER TABLE `t_12175` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_12176`
--

DROP TABLE IF EXISTS `t_12176`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_12176` (
  `seat_no` int NOT NULL,
  `cell_type` varchar(12) NOT NULL,
  `p_name` varchar(30) DEFAULT NULL,
  `p_date` date DEFAULT NULL,
  `p_board_stat` varchar(15) DEFAULT NULL,
  `p_departure_time` time DEFAULT NULL,
  `p_desti_stat` varchar(15) DEFAULT NULL,
  `p_arrival_time` time DEFAULT NULL,
  `p_fare` int DEFAULT NULL,
  `p_distance` int DEFAULT NULL,
  `gender` varchar(2) DEFAULT NULL,
  `train_no` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_12176`
--

LOCK TABLES `t_12176` WRITE;
/*!40000 ALTER TABLE `t_12176` DISABLE KEYS */;
INSERT INTO `t_12176` VALUES (1,'GN',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12176),(2,'GN',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12176),(3,'GN',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12176),(1,'SL',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12176),(2,'SL',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12176),(3,'SL',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12176),(1,'AC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12176),(2,'AC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12176),(3,'AC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12176);
/*!40000 ALTER TABLE `t_12176` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_2195`
--

DROP TABLE IF EXISTS `t_2195`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_2195` (
  `seat_no` int DEFAULT NULL,
  `cell_type` varchar(12) DEFAULT NULL,
  `p_name` varchar(30) DEFAULT NULL,
  `p_date` date DEFAULT NULL,
  `p_board_stat` varchar(15) DEFAULT NULL,
  `p_departure_time` time DEFAULT NULL,
  `p_desti_stat` varchar(15) DEFAULT NULL,
  `p_arrival_time` time DEFAULT NULL,
  `p_fare` int DEFAULT NULL,
  `p_distance` int DEFAULT NULL,
  `gender` varchar(2) DEFAULT NULL,
  `train_no` int NOT NULL DEFAULT '2195'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_2195`
--

LOCK TABLES `t_2195` WRITE;
/*!40000 ALTER TABLE `t_2195` DISABLE KEYS */;
INSERT INTO `t_2195` VALUES (1,'GN',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2195),(2,'GN',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2195),(3,'GN',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2195),(1,'SL',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2195),(2,'SL',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2195),(3,'SL',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2195),(1,'AC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2195),(2,'AC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2195),(3,'AC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2195);
/*!40000 ALTER TABLE `t_2195` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_2196`
--

DROP TABLE IF EXISTS `t_2196`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_2196` (
  `seat_no` int NOT NULL,
  `cell_type` varchar(12) NOT NULL,
  `p_name` varchar(30) DEFAULT NULL,
  `p_date` date DEFAULT NULL,
  `p_board_stat` varchar(15) DEFAULT NULL,
  `p_departure_time` time DEFAULT NULL,
  `p_desti_stat` varchar(15) DEFAULT NULL,
  `p_arrival_time` time DEFAULT NULL,
  `p_fare` int DEFAULT NULL,
  `p_distance` int DEFAULT NULL,
  `gender` varchar(2) DEFAULT NULL,
  `train_no` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_2196`
--

LOCK TABLES `t_2196` WRITE;
/*!40000 ALTER TABLE `t_2196` DISABLE KEYS */;
INSERT INTO `t_2196` VALUES (1,'GN',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2196),(2,'GN',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2196),(3,'GN',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2196),(1,'SL',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2196),(2,'SL',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2196),(3,'SL',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2196),(1,'AC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2196),(2,'AC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2196),(3,'AC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2196);
/*!40000 ALTER TABLE `t_2196` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `train_info`
--

DROP TABLE IF EXISTS `train_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `train_info` (
  `train_no` int DEFAULT NULL,
  `train_name` text,
  `SEQ` int DEFAULT NULL,
  `station_code` text,
  `station_name` text,
  `arrival_time` time DEFAULT NULL,
  `departure_time` time DEFAULT NULL,
  `distance` int DEFAULT NULL,
  `source_station` text,
  `source_station_name` text,
  `destination_station` text,
  `destination_station_name` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `train_info`
--

LOCK TABLES `train_info` WRITE;
/*!40000 ALTER TABLE `train_info` DISABLE KEYS */;
INSERT INTO `train_info` VALUES (2195,'REWA-BPL SF',10,'BPL','BHOPAL','23:00:00','23:00:00',551,'REWA','REWA','BPL','BHOPAL'),(2196,'BPL-REWA SF',10,'REWA','REWA','09:45:00','09:45:00',549,'BPL','BHOPAL','REWA','REWA'),(11057,'AMRITSAR EXP',1,'CSMT','CST-MUMBAI','23:30:00','23:30:00',0,'CSMT','CST-MUMBAI','ASR','AMRITSAR JN.'),(11057,'AMRITSAR EXP',32,'BPL','BHOPAL','14:55:00','15:05:00',842,'CSMT','CST-MUMBAI','ASR','AMRITSAR JN.'),(11057,'AMRITSAR EXP',45,'JHS','JHANSI JN','20:30:00','20:40:00',1132,'CSMT','CST-MUMBAI','ASR','AMRITSAR JN.'),(11057,'AMRITSAR EXP',49,'GWL','GWALIOR JN','22:10:00','22:18:00',1229,'CSMT','CST-MUMBAI','ASR','AMRITSAR JN.'),(11057,'AMRITSAR EXP',90,'ASR','AMRITSAR JN.','16:30:00','16:30:00',2026,'CSMT','CST-MUMBAI','ASR','AMRITSAR JN.'),(12175,'CHAMBAL EXP',31,'GWL','GWALIOR JN','17:15:00','17:15:00',1291,'HWH','HOWRAH JN.','GWL','GWALIOR JN'),(12176,'CHAMBAL EXP',31,'HWH','HOWRAH JN.','06:45:00','06:45:00',1292,'GWL','GWALIOR JN','HWH','HOWRAH JN.'),(2195,'REWA-BPL SF',1,'REWA','REWA','13:20:00','13:20:00',0,'REWA','REWA','BPL','BHOPAL'),(2196,'BPL-REWA SF',1,'BPL','BHOPAL','23:45:00','23:45:00',0,'BPL','BHOPAL','REWA','REWA'),(12175,'CHAMBAL EXP',1,'HWH','HOWRAH JN.','17:45:00','17:45:00',0,'HWH','HOWRAH JN.','GWL','GWALIOR JN'),(12176,'CHAMBAL EXP',1,'GWL','GWALIOR JN','07:15:00','07:15:00',0,'GWL','GWALIOR JN','HWH','HOWRAH JN.');
/*!40000 ALTER TABLE `train_info` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-19  9:28:58
