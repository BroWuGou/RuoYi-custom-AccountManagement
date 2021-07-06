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
-- Table structure for table `gen_table_column`
--

DROP TABLE IF EXISTS `gen_table_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gen_table_column` (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) DEFAULT '' COMMENT '字典类型',
  `sort` int DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb3 COMMENT='代码生成业务表字段';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table_column`
--

LOCK TABLES `gen_table_column` WRITE;
/*!40000 ALTER TABLE `gen_table_column` DISABLE KEYS */;
INSERT INTO `gen_table_column` VALUES (28,'4','relevance_id','关联item id，本数据库','bigint unsigned','String','relevanceId','1','0',NULL,'1',NULL,NULL,NULL,'EQ',NULL,'',1,'admin','2021-07-02 03:44:11','',NULL),(29,'4','to_account_id','关联到的账户：accounts->id','bigint unsigned','String','toAccountId','0','0','1','1','1','1','1','EQ',NULL,'',2,'admin','2021-07-02 03:44:11','',NULL),(30,'4','relevance_account_id','关联账户，指向accounts表中的数据，可以为空','bigint unsigned','String','relevanceAccountId','0','0',NULL,'1','1','1','1','EQ',NULL,'',3,'admin','2021-07-02 03:44:11','',NULL),(31,'4','type','关联类型：如微信、QQ、手机、邮箱...','varchar(45)','String','type','0','0','1','1','1','1','1','EQ','select','',4,'admin','2021-07-02 03:44:11','',NULL),(32,'4','name','关联账户的id，对应accounts->account_id','varchar(120)','String','name','0','0','1','1','1','1','1','LIKE','input','',5,'admin','2021-07-02 03:44:11','',NULL),(33,'4','gmt_create','创建时间','datetime','Date','gmtCreate','0','0','1','1','1','1','1','EQ','datetime','',6,'admin','2021-07-02 03:44:11','',NULL),(34,'4','gmt_modified','修改时间','datetime','Date','gmtModified','0','0','1','1','1','1','1','EQ','datetime','',7,'admin','2021-07-02 03:44:11','',NULL),(35,'4','deleted','是否删除：0未删除，1已删除','tinyint','Long','deleted','0','0','1','1','1','1','1','EQ','input','',8,'admin','2021-07-02 03:44:11','',NULL),(36,'5','station_id','id','bigint unsigned','Long','stationId','1','0',NULL,NULL,NULL,NULL,NULL,'EQ','input','',1,'admin','2021-07-02 03:44:11',NULL,'2021-07-03 07:40:14'),(37,'5','station_name','站点名称','varchar(120)','String','stationName','0','0','1','1','1','1','1','LIKE','input','',2,'admin','2021-07-02 03:44:11',NULL,'2021-07-03 07:40:14'),(38,'5','website_url','站点网址','varchar(250)','String','websiteUrl','0','0',NULL,'1','1','1','1','LIKE','input','',3,'admin','2021-07-02 03:44:11',NULL,'2021-07-03 07:40:14'),(39,'5','app_name','客户端名','varchar(120)','String','appName','0','0',NULL,'1','1','1','1','LIKE','input','',4,'admin','2021-07-02 03:44:11',NULL,'2021-07-03 07:40:14'),(40,'5','description','备注','varchar(500)','String','description','0','0',NULL,'1','1',NULL,NULL,'LIKE','textarea','',5,'admin','2021-07-02 03:44:11',NULL,'2021-07-03 07:40:14'),(42,'5','deleted','已删除','tinyint unsigned','Integer','deleted','0','0',NULL,NULL,NULL,NULL,NULL,'EQ','select','',7,'admin','2021-07-02 03:44:11',NULL,'2021-07-03 07:40:14'),(43,'5','gmt_create','创建时间','datetime','Date','gmtCreate','0','0',NULL,NULL,NULL,'1','1','EQ','datetime','',8,'admin','2021-07-02 03:44:11',NULL,'2021-07-03 07:40:14'),(44,'5','gmt_modified','修改时间','datetime','Date','gmtModified','0','0',NULL,NULL,NULL,'1','1','EQ','datetime','',9,'admin','2021-07-02 03:44:11',NULL,'2021-07-03 07:40:14'),(45,'5','download_url','客户端下载','varchar(250)','String','downloadUrl','0','0',NULL,'1','1','1','1','LIKE','input','',4,'','2021-07-02 04:49:49',NULL,'2021-07-03 07:40:14'),(46,'6','id','id','bigint unsigned','Long','id','1','1',NULL,NULL,NULL,NULL,NULL,'EQ','input','',1,'admin','2021-07-03 05:19:02',NULL,'2021-07-03 09:07:05'),(47,'6','user_id','归属','bigint','Long','userId','0','0','1','1','1','1','1','EQ','select','sys_user_name',2,'admin','2021-07-03 05:19:02',NULL,'2021-07-03 09:07:05'),(48,'6','station_id','站点','bigint unsigned','Long','stationId','0','0','1','1','1','1','1','LIKE','select','user_account_manage_station_name',3,'admin','2021-07-03 05:19:02',NULL,'2021-07-03 09:07:05'),(49,'6','account_id','账户名','varchar(120)','String','accountId','0','0','1','1','1','1','1','LIKE','input','',4,'admin','2021-07-03 05:19:02',NULL,'2021-07-03 09:07:05'),(50,'6','nick_name','账户昵称','varchar(120)','String','nickName','0','0',NULL,'1','1','1','1','LIKE','input','',5,'admin','2021-07-03 05:19:02',NULL,'2021-07-03 09:07:05'),(51,'6','description','备注','varchar(500)','String','description','0','0',NULL,'1','1','1','1','EQ','textarea','',6,'admin','2021-07-03 05:19:02',NULL,'2021-07-03 09:07:05'),(52,'6','gmt_create','创建时间','datetime','Date','gmtCreate','0','0','1',NULL,NULL,'1','1','EQ','datetime','',8,'admin','2021-07-03 05:19:02',NULL,'2021-07-03 09:07:05'),(53,'6','gmt_modified','修改时间','datetime','Date','gmtModified','0','0','1',NULL,NULL,'1','1','EQ','datetime','',9,'admin','2021-07-03 05:19:02',NULL,'2021-07-03 09:07:05'),(55,'6','deleted','删除标记','tinyint unsigned','Integer','deleted','0','0',NULL,NULL,NULL,NULL,NULL,'EQ','input','',10,'','2021-07-03 05:34:42',NULL,'2021-07-03 09:07:05'),(56,'5','status','状态','varchar(100)','String','status','0','0','1','1','1','1','1','EQ','select','user_account_manage_station_status',7,'','2021-07-03 07:35:54',NULL,'2021-07-03 07:40:14'),(57,'6','status','状态','varchar(100)','String','status','0','0','1','1','1','1','1','EQ','select','user_account_manage_account_status',7,'','2021-07-03 08:40:11',NULL,'2021-07-03 09:07:05'),(58,'7','password_id','id','bigint unsigned','Long','passwordId','1','1',NULL,NULL,NULL,NULL,NULL,'EQ','input','',1,'admin','2021-07-05 09:59:48',NULL,'2021-07-06 01:46:48'),(59,'7','account_id','账号','bigint unsigned','Long','accountId','0','0',NULL,NULL,NULL,NULL,NULL,'EQ','input','',2,'admin','2021-07-05 09:59:48',NULL,'2021-07-06 01:46:48'),(60,'7','password','密码','varchar(200)','String','password','0','0','1','1','1','1','1','EQ','input','',3,'admin','2021-07-05 09:59:48',NULL,'2021-07-06 01:46:48'),(61,'7','status','状态','varchar(100)','String','status','0','0','1','1','1','1','1','EQ','select','user_account_manage_password_status',4,'admin','2021-07-05 09:59:48',NULL,'2021-07-06 01:46:48'),(62,'7','deleted','逻辑删除','tinyint unsigned','Integer','deleted','0','0',NULL,NULL,NULL,NULL,NULL,'EQ','input','',5,'admin','2021-07-05 09:59:48',NULL,'2021-07-06 01:46:48'),(63,'7','gmt_create','创建时间','datetime','Date','gmtCreate','0','0',NULL,NULL,NULL,'1','1','EQ','datetime','',6,'admin','2021-07-05 09:59:48',NULL,'2021-07-06 01:46:48'),(64,'7','gmt_modified','修改时间','datetime','Date','gmtModified','0','0',NULL,NULL,NULL,'1','1','EQ','datetime','',7,'admin','2021-07-05 09:59:48',NULL,'2021-07-06 01:46:48');
/*!40000 ALTER TABLE `gen_table_column` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-06 10:23:58
