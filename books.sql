-- MySQL dump 10.13  Distrib 5.7.27, for Linux (x86_64)
--
-- Host: localhost    Database: books
-- ------------------------------------------------------
-- Server version	5.7.27-0ubuntu0.18.04.1

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
-- Table structure for table `作家`
--

DROP TABLE IF EXISTS `作家`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `作家` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `姓名` varchar(32) DEFAULT NULL,
  `性别` enum('f','m') DEFAULT NULL,
  `风格` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `作家`
--

LOCK TABLES `作家` WRITE;
/*!40000 ALTER TABLE `作家` DISABLE KEYS */;
/*!40000 ALTER TABLE `作家` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `出版社`
--

DROP TABLE IF EXISTS `出版社`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `出版社` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `名称` varchar(64) DEFAULT NULL,
  `创刊日期` date DEFAULT NULL,
  `地址` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `出版社`
--

LOCK TABLES `出版社` WRITE;
/*!40000 ALTER TABLE `出版社` DISABLE KEYS */;
/*!40000 ALTER TABLE `出版社` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `图书`
--

DROP TABLE IF EXISTS `图书`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `图书` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `书名` varchar(32) DEFAULT NULL,
  `价格` float DEFAULT NULL,
  `出版日期` date DEFAULT NULL,
  `p_id` int(11) DEFAULT NULL,
  `a_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `p_fk` (`p_id`),
  KEY `a_fk` (`a_id`),
  CONSTRAINT `a_fk` FOREIGN KEY (`a_id`) REFERENCES `作家` (`id`),
  CONSTRAINT `p_fk` FOREIGN KEY (`p_id`) REFERENCES `出版社` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `图书`
--

LOCK TABLES `图书` WRITE;
/*!40000 ALTER TABLE `图书` DISABLE KEYS */;
/*!40000 ALTER TABLE `图书` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pyq`
--

DROP TABLE IF EXISTS `pyq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pyq` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` mediumblob,
  `comment` text,
  `site` varchar(50) DEFAULT NULL,
  `tm` datetime DEFAULT NULL,
  `u_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_fk` (`u_id`),
  CONSTRAINT `user_fk` FOREIGN KEY (`u_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pyq`
--

LOCK TABLES `pyq` WRITE;
/*!40000 ALTER TABLE `pyq` DISABLE KEYS */;
/*!40000 ALTER TABLE `pyq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `passwd` char(128) DEFAULT NULL,
  `phone` char(18) DEFAULT NULL,
  `r_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_pyq`
--

DROP TABLE IF EXISTS `user_pyq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_pyq` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `u_id` int(11) DEFAULT NULL,
  `p_id` int(11) DEFAULT NULL,
  `comment` text,
  `mlike` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_fk1` (`u_id`),
  KEY `pyq_fk` (`p_id`),
  CONSTRAINT `pyq_fk` FOREIGN KEY (`p_id`) REFERENCES `pyq` (`id`),
  CONSTRAINT `user_fk1` FOREIGN KEY (`u_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_pyq`
--

LOCK TABLES `user_pyq` WRITE;
/*!40000 ALTER TABLE `user_pyq` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_pyq` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-18 10:19:08
