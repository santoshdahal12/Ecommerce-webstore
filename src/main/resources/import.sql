CREATE DATABASE  IF NOT EXISTS `ecommercestore` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `ecommercestore`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: ecommercestore
-- ------------------------------------------------------
-- Server version	5.7.16-log

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `city` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `street` varchar(255) NOT NULL,
  `zip_code` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'Fairfield','United States','IA','1000N 4th Street, fairfield, Iowa','52557'),(2,'Fairfield','United States','IA','1000N 4th Street, fairfield, Iowa','52557'),(3,'Fairfield','United States','IA','1000N 4th Street, fairfield, Iowa','52557'),(4,'Fairfield','United States','IA','1000N 4th Street, fairfield, Iowa','52557'),(5,'Fairfield','United States','IA','1000N 4th Street, fairfield, Iowa','52557'),(6,'Fairfield','United States','IA','1000N 4th Street, fairfield, Iowa','52557'),(7,'Fairfield','United States','IA','1000N 4th Street, fairfield, Iowa','52557'),(8,'Fairfield','United States','IA','1000N 4th Street, fairfield, Iowa','52557'),(9,'Fairfield','United States','IA','1000N 4th Street, fairfield, Iowa','52557'),(10,'Fairfield','United States','IA','1000N 4th Street, fairfield, Iowa','52557');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authorities`
--

DROP TABLE IF EXISTS `authorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authorities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `authority` varchar(255) NOT NULL,
  `member_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKke6m8fjuf7oi664ekyeu2maw0` (`member_name`),
  CONSTRAINT `FKke6m8fjuf7oi664ekyeu2maw0` FOREIGN KEY (`member_name`) REFERENCES `users` (`member_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authorities`
--

LOCK TABLES `authorities` WRITE;
/*!40000 ALTER TABLE `authorities` DISABLE KEYS */;
INSERT INTO `authorities` VALUES (1,'user','bunu'),(2,'farmer','123'),(3,'admin','admin');
/*!40000 ALTER TABLE `authorities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date_of_membership` datetime DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKjmifk4o18dly2usbpwsxwg6w3` (`username`),
  KEY `FKeep6rhx9ldetwmt1otwmd5rh4` (`order_id`),
  CONSTRAINT `FKeep6rhx9ldetwmt1otwmd5rh4` FOREIGN KEY (`order_id`) REFERENCES `order_1` (`id`),
  CONSTRAINT `FKjmifk4o18dly2usbpwsxwg6w3` FOREIGN KEY (`username`) REFERENCES `users` (`member_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (1,'2017-01-12 16:20:41','santoshdahal2072@gmail.com','Santosh','Dahal','','6419194206','Mr.','bunu',NULL),(2,'2017-01-12 16:22:15','santoshdahal2072@gmail.com','abhi','Dahal','','6419194206','Mr.','123',2);
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_1`
--

DROP TABLE IF EXISTS `order_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_1` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `total_price` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_1`
--

LOCK TABLES `order_1` WRITE;
/*!40000 ALTER TABLE `order_1` DISABLE KEYS */;
INSERT INTO `order_1` VALUES (1,3),(2,0),(3,12);
/*!40000 ALTER TABLE `order_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_1_order_line_list`
--

DROP TABLE IF EXISTS `order_1_order_line_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_1_order_line_list` (
  `order_id` bigint(20) NOT NULL,
  `order_line_list_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_9la3h0kitfmx88ask4s85itf9` (`order_line_list_id`),
  KEY `FK1jasjn2mc2sujthrfx4yeyqmi` (`order_id`),
  CONSTRAINT `FK1jasjn2mc2sujthrfx4yeyqmi` FOREIGN KEY (`order_id`) REFERENCES `order_1` (`id`),
  CONSTRAINT `FKjffa2ujqwg9ouy9c0b6j1vc47` FOREIGN KEY (`order_line_list_id`) REFERENCES `order_line` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_1_order_line_list`
--

LOCK TABLES `order_1_order_line_list` WRITE;
/*!40000 ALTER TABLE `order_1_order_line_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_1_order_line_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_line`
--

DROP TABLE IF EXISTS `order_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_line` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `price` double NOT NULL,
  `quantity` int(11) NOT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKpf904tci8garypkvm32cqupye` (`product_id`),
  CONSTRAINT `FKpf904tci8garypkvm32cqupye` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_line`
--

LOCK TABLES `order_line` WRITE;
/*!40000 ALTER TABLE `order_line` DISABLE KEYS */;
INSERT INTO `order_line` VALUES (1,0,1,4),(2,0,1,3),(3,0,5,2),(4,0,2,1),(5,0,1,5),(6,0,1,3),(7,0,1,2),(8,0,1,1);
/*!40000 ALTER TABLE `order_line` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `processed_order_details`
--

DROP TABLE IF EXISTS `processed_order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `processed_order_details` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `credit_card_number` varchar(255) DEFAULT NULL,
  `order_status` varchar(255) DEFAULT NULL,
  `ordereddate` date DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `shipping_date` datetime DEFAULT NULL,
  `billing_details_id` bigint(20) DEFAULT NULL,
  `shipping_address_id` bigint(20) DEFAULT NULL,
  `member_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKq6u0w31smxkbqrlxuw6l2ay4w` (`billing_details_id`),
  KEY `FK3dp2ihwgrkqyh3f8wwbsuuv13` (`shipping_address_id`),
  KEY `FKbgybqivg1p0m0s7rjishkh2tt` (`member_id`),
  CONSTRAINT `FK3dp2ihwgrkqyh3f8wwbsuuv13` FOREIGN KEY (`shipping_address_id`) REFERENCES `address` (`id`),
  CONSTRAINT `FKbgybqivg1p0m0s7rjishkh2tt` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`),
  CONSTRAINT `FKq6u0w31smxkbqrlxuw6l2ay4w` FOREIGN KEY (`billing_details_id`) REFERENCES `address` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `processed_order_details`
--

LOCK TABLES `processed_order_details` WRITE;
/*!40000 ALTER TABLE `processed_order_details` DISABLE KEYS */;
INSERT INTO `processed_order_details` VALUES (1,'11234567890','PENDING','2017-01-12','6419194206',NULL,3,4,NULL),(2,'12345678','PENDING','2017-01-12','6419194206',NULL,5,6,NULL),(3,'1234567890','PENDING','2017-01-12','6419194206',NULL,7,8,1),(4,'1234567','PENDING','2017-01-12','6419194206',NULL,9,10,1);
/*!40000 ALTER TABLE `processed_order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `processed_order_details_order_line_list`
--

DROP TABLE IF EXISTS `processed_order_details_order_line_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `processed_order_details_order_line_list` (
  `processed_order_details_id` bigint(20) NOT NULL,
  `order_line_list_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_owm6w2n5p469f2uw9p5kp91vd` (`order_line_list_id`),
  KEY `FKhdis3g8f6p56qh3q2ncwirfvt` (`processed_order_details_id`),
  CONSTRAINT `FKf912soxl93sj90kr0fsmfgknt` FOREIGN KEY (`order_line_list_id`) REFERENCES `order_line` (`id`),
  CONSTRAINT `FKhdis3g8f6p56qh3q2ncwirfvt` FOREIGN KEY (`processed_order_details_id`) REFERENCES `processed_order_details` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `processed_order_details_order_line_list`
--

LOCK TABLES `processed_order_details_order_line_list` WRITE;
/*!40000 ALTER TABLE `processed_order_details_order_line_list` DISABLE KEYS */;
INSERT INTO `processed_order_details_order_line_list` VALUES (1,1),(1,2),(2,3),(2,4),(2,5),(3,6),(3,7),(4,8);
/*!40000 ALTER TABLE `processed_order_details_order_line_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `product_availability` varchar(255) DEFAULT NULL,
  `farmer_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKbayqrvuf45sj8abt0u51tf53p` (`farmer_id`),
  CONSTRAINT `FKbayqrvuf45sj8abt0u51tf53p` FOREIGN KEY (`farmer_id`) REFERENCES `member` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,1,'Green Apple',12,'Available',NULL),(2,1,'Potato',1,'Available',NULL),(3,1,'Chinese Apple',2,'Available',NULL),(4,1,'Indian Apple',9,'Available',NULL),(5,1,'Packet Onion',6,'Available',NULL);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `member_name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`member_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('123','123'),('admin','a'),('bunu','bunu');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-01-12 20:41:14
