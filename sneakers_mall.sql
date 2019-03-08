-- MySQL dump 10.16  Distrib 10.2.14-MariaDB, for Win32 (AMD64)
--
-- Host: localhost    Database: makeorder
-- ------------------------------------------------------
-- Server version	10.2.14-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(250) NOT NULL,
  `tag_weight` bigint(20) NOT NULL,
  `class_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Nike',1000,'品牌'),(2,'红色',1000,'颜色'),(3,'38',1000,'尺寸'),(4,'adidas',998,'品牌'),(5,'蓝色',998,'颜色'),(6,'39',998,'尺寸'),(7,'李宁2',900,'品牌');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_list`
--

DROP TABLE IF EXISTS `class_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class_list` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `class_weight` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_list`
--

LOCK TABLES `class_list` WRITE;
/*!40000 ALTER TABLE `class_list` DISABLE KEYS */;
INSERT INTO `class_list` VALUES (1,'品牌',1000),(2,'颜色',998),(3,'尺寸',996),(4,'销量',995);
/*!40000 ALTER TABLE `class_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_detail` (
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(30) NOT NULL,
  `product_price` decimal(10,0) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `order_amount` decimal(10,0) NOT NULL,
  `product_icon` varchar(200) NOT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`order_id`,`product_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
INSERT INTO `order_detail` VALUES (496,18,'李宁',644,2,7643,'../upload/pro_image/CFR.jpg','2019-03-07 23:08:41'),(487,16,'adidas',322,1,322,'../upload/pro_image/下载 (3).jpg','2019-03-05 17:34:15'),(488,16,'adidas',322,1,322,'../upload/pro_image/下载 (3).jpg','2019-03-05 17:34:16'),(489,16,'adidas',322,1,322,'../upload/pro_image/下载 (3).jpg','2019-03-05 17:34:26'),(490,16,'adidas',322,1,322,'../upload/pro_image/下载 (3).jpg','2019-03-05 17:34:32'),(491,16,'adidas',322,1,322,'../upload/pro_image/下载 (3).jpg','2019-03-05 17:36:10'),(492,16,'adidas',322,1,322,'../upload/pro_image/下载 (3).jpg','2019-03-05 17:38:12'),(493,16,'adidas',644,2,644,'../upload/pro_image/下载 (3).jpg','2019-03-05 17:38:33'),(494,16,'adidas',322,1,322,'../upload/pro_image/下载 (3).jpg','2019-03-05 17:38:43'),(495,16,'adidas',322,1,322,'../upload/pro_image/下载 (3).jpg','2019-03-07 22:56:09'),(496,17,'adidas3',6666,1,7643,'../upload/pro_image/20140818105550448.jpg','2019-03-07 23:08:41'),(496,15,'nike2',333,1,7643,'../upload/pro_image/images (8).jpg','2019-03-07 23:08:41'),(497,17,'adidas3',6666,1,6666,'../upload/pro_image/20140818105550448.jpg','2019-03-07 23:21:12'),(498,16,'adidas',322,1,322,'../upload/pro_image/下载 (3).jpg','2019-03-07 23:22:54');
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderlist`
--

DROP TABLE IF EXISTS `orderlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderlist` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(30) NOT NULL,
  `user_phone` varchar(20) NOT NULL,
  `user_address` varchar(80) NOT NULL,
  `order_amount` decimal(10,0) NOT NULL,
  `order_status` varchar(10) NOT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=499 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderlist`
--

LOCK TABLES `orderlist` WRITE;
/*!40000 ALTER TABLE `orderlist` DISABLE KEYS */;
INSERT INTO `orderlist` VALUES (496,1,'admin','139','China',7643,'0','2019-03-07 23:08:41'),(487,2,'jokey','18706735516','China',322,'0','2019-03-05 17:34:15'),(488,2,'jokey','18706735516','China',322,'0','2019-03-05 17:34:16'),(489,2,'jokey','18706735516','China',322,'0','2019-03-05 17:34:26'),(490,2,'jokey','18706735516','China',322,'0','2019-03-05 17:34:32'),(491,2,'jokey','18706735516','China',322,'0','2019-03-05 17:36:10'),(492,2,'jokey','18706735516','China',322,'0','2019-03-05 17:38:12'),(493,2,'jokey','18706735516','China',644,'0','2019-03-05 17:38:33'),(494,2,'jokey','18706735516','China',322,'0','2019-03-05 17:38:43'),(495,2,'jokey','18706735516','China',322,'0','2019-03-07 22:56:09'),(497,1,'admin','130','shanxi',6666,'0','2019-03-07 23:21:12'),(498,1,'admin','130','shanxi',322,'0','2019-03-07 23:22:54');
/*!40000 ALTER TABLE `orderlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `description` varchar(200) NOT NULL,
  `icon` varchar(200) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (15,'nike2',333,'nike2','../upload/pro_image/images (8).jpg'),(16,'adidas',322,'adidas','../upload/pro_image/下载 (3).jpg');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_tag`
--

DROP TABLE IF EXISTS `product_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_tag` (
  `product_id` int(11) NOT NULL,
  `class_name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `tag_name` varchar(255) CHARACTER SET utf8 NOT NULL,
  KEY `product_id` (`product_id`) USING BTREE,
  KEY `class_name` (`class_name`) USING BTREE,
  KEY `tag_name` (`tag_name`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_tag`
--

LOCK TABLES `product_tag` WRITE;
/*!40000 ALTER TABLE `product_tag` DISABLE KEYS */;
INSERT INTO `product_tag` VALUES (15,'品牌','Nike'),(15,'颜色','红色'),(15,'尺寸','38'),(16,'品牌','adidas'),(16,'颜色','蓝色'),(16,'尺寸','39'),(17,'品牌','adidas'),(17,'颜色','蓝色'),(17,'尺寸','39'),(18,'品牌','李宁2'),(18,'颜色','红色'),(18,'尺寸','39'),(18,'销量','?');
/*!40000 ALTER TABLE `product_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(80) DEFAULT NULL,
  `sex` varchar(3) DEFAULT NULL,
  `passwd` varchar(20) NOT NULL,
  `user_grant` varchar(5) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','130','shanxi','男','admin','管理员'),(2,'jokey','18706735516','China','男','jokey','用户');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-08 20:55:30
