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
-- Table structure for table `passwords`
--

DROP TABLE IF EXISTS `passwords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passwords` (
  `password_id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '密码id：在本数据库中的id',
  `account_id` bigint unsigned NOT NULL COMMENT '账户id:table accounts->id',
  `password` varchar(200) NOT NULL COMMENT '账户密码',
  `status` varchar(100) NOT NULL DEFAULT '0',
  `deleted` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '是否被删除：0未删除，1已删除',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`password_id`),
  UNIQUE KEY `password_id_UNIQUE` (`password_id`),
  KEY `account_id_idx` (`account_id`),
  CONSTRAINT `account_id` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passwords`
--

LOCK TABLES `passwords` WRITE;
/*!40000 ALTER TABLE `passwords` DISABLE KEYS */;
INSERT INTO `passwords` VALUES (1,11,'awser','0',1,'2021-07-04 06:55:19','2021-07-06 02:16:17'),(2,12,'adsfa','0',0,'2021-07-04 06:57:29','2021-07-04 06:57:29'),(3,12,'五二a','0',0,'2021-07-04 06:57:29','2021-07-04 06:57:29'),(4,13,'123','0',0,'2021-07-04 12:08:48','2021-07-04 12:08:48'),(5,13,'','0',0,'2021-07-04 12:08:48','2021-07-04 12:08:48'),(6,14,'123','0',0,'2021-07-04 12:10:56','2021-07-04 12:10:56'),(7,16,'威威威威威威威威','0',1,'2021-07-05 08:32:37','2021-07-06 02:17:36'),(8,17,'走走走走走走走走','走走走走',1,'2021-07-05 08:34:01','2021-07-06 02:17:34'),(9,18,'123132131','0',1,'2021-07-05 11:17:10','2021-07-06 02:17:33'),(10,19,'werwqaer','0',1,'2021-07-05 11:17:53','2021-07-06 02:16:01'),(11,19,'aweraserwqer','0',1,'2021-07-05 11:17:53','2021-07-06 02:16:38'),(12,19,'sadfase','0',1,'2021-07-05 11:17:53','2021-07-06 02:17:31'),(13,20,'qwerqwer','0',1,'2021-07-05 11:33:56','2021-07-06 02:16:57'),(14,20,'234qw34','0',1,'2021-07-05 11:33:56','2021-07-06 02:17:30'),(15,20,'21342134','0',1,'2021-07-05 11:33:56','2021-07-06 02:17:28'),(16,20,'2134','0',1,'2021-07-05 11:33:56','2021-07-06 02:17:25'),(17,21,'1','0',1,'2021-07-05 11:51:07','2021-07-06 02:17:23'),(18,21,'2','1',1,'2021-07-05 11:51:07','2021-07-06 02:17:22'),(19,21,'3','2',1,'2021-07-05 11:51:07','2021-07-06 02:17:21'),(20,22,'111','0',1,'2021-07-05 12:01:54','2021-07-06 02:17:19'),(21,22,'222','1',1,'2021-07-05 12:01:54','2021-07-06 02:17:17'),(22,22,'333','2',1,'2021-07-05 12:01:54','2021-07-06 02:17:15');
/*!40000 ALTER TABLE `passwords` ENABLE KEYS */;
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
