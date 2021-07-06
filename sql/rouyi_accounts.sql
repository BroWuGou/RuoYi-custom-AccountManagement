-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: 10.10.1.1    Database: rouyi
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '账户id(自动生成)',
  `user_id` bigint NOT NULL COMMENT '数据从属',
  `station_id` bigint unsigned NOT NULL COMMENT '站点id（本数据库，自动生成）',
  `account_id` varchar(120) NOT NULL COMMENT '账户id',
  `nick_name` varchar(120) DEFAULT NULL COMMENT '账户昵称',
  `description` varchar(500) DEFAULT NULL COMMENT '描述',
  `status` varchar(100) NOT NULL DEFAULT '0',
  `deleted` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '删除标记',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `user_id_idx` (`user_id`),
  KEY `station_id_idx` (`station_id`),
  CONSTRAINT `station_id` FOREIGN KEY (`station_id`) REFERENCES `stations` (`station_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (1,1,1,'wcq','wcq','xx','0',0,'2021-07-03 11:51:10','2021-07-04 02:26:30'),(2,1,25,'a924673816@outlook.com','','','0',0,'2021-07-03 11:58:49','2021-07-04 02:36:16'),(3,2,24,'zXC','','','0',0,'2021-07-03 11:59:22','2021-07-03 11:59:22'),(4,1,22,'924673816','staps','','0',0,'2021-07-04 02:35:21','2021-07-04 02:35:21'),(5,1,23,'18258439675','','','0',0,'2021-07-04 02:54:14','2021-07-04 02:54:14'),(11,1,1,'瓦尔','','','0',1,'2021-07-04 06:55:19','2021-07-04 12:57:20'),(12,1,1,'啊啊啊啊啊啊','','','0',1,'2021-07-04 06:57:29','2021-07-04 12:57:18'),(13,1,1,'sad','','','0',1,'2021-07-04 12:08:48','2021-07-04 12:57:17'),(14,1,1,'123','','','0',1,'2021-07-04 12:10:56','2021-07-04 12:57:14'),(15,1,1,'ghfrd','','','0',1,'2021-07-04 12:56:54','2021-07-04 12:57:12'),(16,1,1,'领asduflkdsjah','','','0',1,'2021-07-05 08:32:37','2021-07-05 09:40:33'),(17,1,1,'威威威威威威威威','','','0',1,'2021-07-05 08:34:01','2021-07-05 12:29:51'),(18,1,1,'keyi','','','0,2',1,'2021-07-05 11:17:10','2021-07-05 11:52:35'),(19,1,1,'sdfsadfasd','','','0,0,1,2',1,'2021-07-05 11:17:53','2021-07-05 11:52:36'),(20,1,1,'werqwerwq','','','1,0,1,2,0',1,'2021-07-05 11:33:56','2021-07-05 11:52:38'),(21,1,1,'a','','','0',0,'2021-07-05 11:51:07','2021-07-05 11:51:07'),(22,1,1,'2222','','','0',0,'2021-07-05 12:01:54','2021-07-05 12:01:54');
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-06 10:24:00
