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
-- Table structure for table `sys_dict_data`
--

DROP TABLE IF EXISTS `sys_dict_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8mb3 COMMENT='字典数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_data`
--

LOCK TABLES `sys_dict_data` WRITE;
/*!40000 ALTER TABLE `sys_dict_data` DISABLE KEYS */;
INSERT INTO `sys_dict_data` VALUES (1,1,'男','0','sys_user_sex','','','Y','0','admin','2021-07-01 11:27:36','',NULL,'性别男'),(2,2,'女','1','sys_user_sex','','','N','0','admin','2021-07-01 11:27:36','',NULL,'性别女'),(3,3,'未知','2','sys_user_sex','','','N','0','admin','2021-07-01 11:27:36','',NULL,'性别未知'),(4,1,'显示','0','sys_show_hide','','primary','Y','0','admin','2021-07-01 11:27:36','',NULL,'显示菜单'),(5,2,'隐藏','1','sys_show_hide','','danger','N','0','admin','2021-07-01 11:27:36','',NULL,'隐藏菜单'),(6,1,'正常','0','sys_normal_disable','','primary','Y','0','admin','2021-07-01 11:27:36','',NULL,'正常状态'),(7,2,'停用','1','sys_normal_disable','','danger','N','0','admin','2021-07-01 11:27:36','',NULL,'停用状态'),(8,1,'正常','0','sys_job_status','','primary','Y','0','admin','2021-07-01 11:27:36','',NULL,'正常状态'),(9,2,'暂停','1','sys_job_status','','danger','N','0','admin','2021-07-01 11:27:36','',NULL,'停用状态'),(10,1,'默认','DEFAULT','sys_job_group','','','Y','0','admin','2021-07-01 11:27:36','',NULL,'默认分组'),(11,2,'系统','SYSTEM','sys_job_group','','','N','0','admin','2021-07-01 11:27:36','',NULL,'系统分组'),(12,1,'是','Y','sys_yes_no','','primary','Y','0','admin','2021-07-01 11:27:36','',NULL,'系统默认是'),(13,2,'否','N','sys_yes_no','','danger','N','0','admin','2021-07-01 11:27:36','',NULL,'系统默认否'),(14,1,'通知','1','sys_notice_type','','warning','Y','0','admin','2021-07-01 11:27:36','',NULL,'通知'),(15,2,'公告','2','sys_notice_type','','success','N','0','admin','2021-07-01 11:27:36','',NULL,'公告'),(16,1,'正常','0','sys_notice_status','','primary','Y','0','admin','2021-07-01 11:27:36','',NULL,'正常状态'),(17,2,'关闭','1','sys_notice_status','','danger','N','0','admin','2021-07-01 11:27:36','',NULL,'关闭状态'),(18,99,'其他','0','sys_oper_type','','info','N','0','admin','2021-07-01 11:27:36','',NULL,'其他操作'),(19,1,'新增','1','sys_oper_type','','info','N','0','admin','2021-07-01 11:27:36','',NULL,'新增操作'),(20,2,'修改','2','sys_oper_type','','info','N','0','admin','2021-07-01 11:27:36','',NULL,'修改操作'),(21,3,'删除','3','sys_oper_type','','danger','N','0','admin','2021-07-01 11:27:36','',NULL,'删除操作'),(22,4,'授权','4','sys_oper_type','','primary','N','0','admin','2021-07-01 11:27:36','',NULL,'授权操作'),(23,5,'导出','5','sys_oper_type','','warning','N','0','admin','2021-07-01 11:27:36','',NULL,'导出操作'),(24,6,'导入','6','sys_oper_type','','warning','N','0','admin','2021-07-01 11:27:37','',NULL,'导入操作'),(25,7,'强退','7','sys_oper_type','','danger','N','0','admin','2021-07-01 11:27:37','',NULL,'强退操作'),(26,8,'生成代码','8','sys_oper_type','','warning','N','0','admin','2021-07-01 11:27:37','',NULL,'生成操作'),(27,9,'清空数据','9','sys_oper_type','','danger','N','0','admin','2021-07-01 11:27:37','',NULL,'清空操作'),(28,1,'成功','0','sys_common_status','','primary','N','0','admin','2021-07-01 11:27:37','',NULL,'正常状态'),(29,2,'失败','1','sys_common_status','','danger','N','0','admin','2021-07-01 11:27:37','',NULL,'停用状态'),(100,1,'运营','0','user_account_manage_station_status','','primary','Y','0','admin','2021-07-03 07:02:39','admin','2021-07-03 07:03:07','运营状态'),(101,1,'下线','1','user_account_manage_station_status','','danger','N','0','admin','2021-07-03 07:04:27','admin','2021-07-03 10:29:27','下线状态'),(102,1,'正常','0','user_account_manage_account_status',NULL,'primary','Y','0','admin','2021-07-03 07:05:27','',NULL,'账户正常'),(103,2,'封禁','1','user_account_manage_account_status',NULL,'warning','N','0','admin','2021-07-03 07:06:13','',NULL,'账户被封禁'),(104,3,'注销','2','user_account_manage_account_status',NULL,'danger','N','0','admin','2021-07-03 07:06:47','',NULL,'账户已注销'),(105,0,'outlook邮箱1','25','user_account_manage_station_name','','','N','0','','2021-07-03 10:58:23','admin','2021-07-03 11:08:53',''),(106,1,'正常','0','user_account_manage_password_status','','primary','Y','0','admin','2021-07-04 07:06:13','admin','2021-07-04 07:07:41','正常'),(107,2,'过期','1','user_account_manage_password_status','','danger','Y','0','admin','2021-07-04 07:07:33','admin','2021-07-04 07:07:48','已过期');
/*!40000 ALTER TABLE `sys_dict_data` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-06 10:23:59
