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
-- Table structure for table `stations`
--

DROP TABLE IF EXISTS `stations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stations` (
  `station_id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '站点id（本数据库，自动生成）',
  `station_name` varchar(120) NOT NULL COMMENT '站点名称',
  `website_url` varchar(250) DEFAULT NULL COMMENT '站点网址',
  `download_url` varchar(250) DEFAULT NULL COMMENT '站点网址',
  `app_name` varchar(120) DEFAULT NULL COMMENT '站点app名称',
  `description` varchar(500) DEFAULT NULL COMMENT '描述',
  `status` varchar(100) NOT NULL DEFAULT '0',
  `deleted` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '删除标记：0未删除，1删除',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`station_id`,`station_name`),
  UNIQUE KEY `id_UNIQUE` (`station_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stations`
--

LOCK TABLES `stations` WRITE;
/*!40000 ALTER TABLE `stations` DISABLE KEYS */;
INSERT INTO `stations` VALUES (1,'微信','https://wx.qq.com/','https://weixin.qq.com/','微信','微信haha','0',0,'2021-07-02 04:58:55','2021-07-03 05:08:06'),(11,'1','1','1','1','1','0',1,'2021-07-03 02:49:49','2021-07-03 03:08:57'),(12,'微信','weiw','afsdf','asdt','asdf','0',1,'2021-07-03 02:52:40','2021-07-03 03:08:57'),(13,'1','','','','','0',1,'2021-07-03 03:12:13','2021-07-03 08:21:04'),(14,'22','','','','','0',1,'2021-07-03 07:16:24','2021-07-03 08:21:04'),(15,'3','','','','','0',1,'2021-07-03 07:22:48','2021-07-03 08:21:04'),(16,'4','','','','','0',1,'2021-07-03 07:25:53','2021-07-03 08:21:04'),(17,'5','','','','','0',1,'2021-07-03 07:28:54','2021-07-03 08:21:04'),(18,'5','','','','','0',1,'2021-07-03 07:34:26','2021-07-03 08:21:04'),(19,'赛af','','','','','0',1,'2021-07-03 07:45:23','2021-07-03 08:21:04'),(20,'8','','','','','0',1,'2021-07-03 07:50:07','2021-07-03 08:21:04'),(21,'123154','','','','','1',1,'2021-07-03 07:56:36','2021-07-03 08:20:58'),(22,'QQ','','','','','1',0,'2021-07-03 08:21:31','2021-07-03 08:21:31'),(23,'手机182','','','','18258439675','0',0,'2021-07-03 10:46:45','2021-07-03 10:55:39'),(24,'手机130','','','','13095865737','0',0,'2021-07-03 10:55:26','2021-07-03 10:55:26'),(25,'outlook邮箱','https://outlook.live.com/owa/','','outlook','','0',0,'2021-07-03 10:57:53','2021-07-04 02:36:23');
/*!40000 ALTER TABLE `stations` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-06 10:24:02
