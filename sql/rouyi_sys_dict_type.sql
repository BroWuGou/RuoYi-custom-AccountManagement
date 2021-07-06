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
-- Table structure for table `sys_dict_type`
--

DROP TABLE IF EXISTS `sys_dict_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb3 COMMENT='字典类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_type`
--

LOCK TABLES `sys_dict_type` WRITE;
/*!40000 ALTER TABLE `sys_dict_type` DISABLE KEYS */;
INSERT INTO `sys_dict_type` VALUES (1,'用户性别','sys_user_sex','0','admin','2021-07-01 11:27:36','',NULL,'用户性别列表'),(2,'菜单状态','sys_show_hide','0','admin','2021-07-01 11:27:36','',NULL,'菜单状态列表'),(3,'系统开关','sys_normal_disable','0','admin','2021-07-01 11:27:36','',NULL,'系统开关列表'),(4,'任务状态','sys_job_status','0','admin','2021-07-01 11:27:36','',NULL,'任务状态列表'),(5,'任务分组','sys_job_group','0','admin','2021-07-01 11:27:36','',NULL,'任务分组列表'),(6,'系统是否','sys_yes_no','0','admin','2021-07-01 11:27:36','',NULL,'系统是否列表'),(7,'通知类型','sys_notice_type','0','admin','2021-07-01 11:27:36','',NULL,'通知类型列表'),(8,'通知状态','sys_notice_status','0','admin','2021-07-01 11:27:36','',NULL,'通知状态列表'),(9,'操作类型','sys_oper_type','0','admin','2021-07-01 11:27:36','',NULL,'操作类型列表'),(10,'系统状态','sys_common_status','0','admin','2021-07-01 11:27:36','',NULL,'登录状态列表'),(100,'用户名','sys_user_name','0','admin','2021-07-03 05:22:09','',NULL,'用户名列表'),(101,'站点名','user_account_manage_station_name','0','admin','2021-07-03 05:23:04','admin','2021-07-03 05:24:40','站点名列表'),(102,'账户状态','user_account_manage_account_status','0','admin','2021-07-03 05:36:22','admin','2021-07-03 05:36:41','账户状态列表'),(103,'站点状态','user_account_manage_station_status','0','admin','2021-07-03 06:59:57','admin','2021-07-04 07:05:35','站点状态列表'),(104,'密码状态','user_account_manage_password_status','0','admin','2021-07-04 07:05:21','admin','2021-07-04 07:05:29','密码状态列表');
/*!40000 ALTER TABLE `sys_dict_type` ENABLE KEYS */;
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
