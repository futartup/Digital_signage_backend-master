-- MySQL dump 10.13  Distrib 8.0.21, for osx10.14 (x86_64)
--
-- Host: localhost    Database: digital_signage
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add Token',6,'add_token'),(22,'Can change Token',6,'change_token'),(23,'Can delete Token',6,'delete_token'),(24,'Can view Token',6,'view_token'),(25,'Can add user',7,'add_admin'),(26,'Can change user',7,'change_admin'),(27,'Can delete user',7,'delete_admin'),(28,'Can view user',7,'view_admin'),(29,'Can add device',8,'add_device'),(30,'Can change device',8,'change_device'),(31,'Can delete device',8,'delete_device'),(32,'Can view device',8,'view_device'),(33,'Can add play list',9,'add_playlist'),(34,'Can change play list',9,'change_playlist'),(35,'Can delete play list',9,'delete_playlist'),(36,'Can view play list',9,'view_playlist'),(37,'Can add video',10,'add_video'),(38,'Can change video',10,'change_video'),(39,'Can delete video',10,'delete_video'),(40,'Can view video',10,'view_video'),(41,'Can add play time schedule',11,'add_playtimeschedule'),(42,'Can change play time schedule',11,'change_playtimeschedule'),(43,'Can delete play time schedule',11,'delete_playtimeschedule'),(44,'Can view play time schedule',11,'view_playtimeschedule');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authtoken_token`
--

DROP TABLE IF EXISTS `authtoken_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_device_management_admin_id` FOREIGN KEY (`user_id`) REFERENCES `device_management_admin` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authtoken_token`
--

LOCK TABLES `authtoken_token` WRITE;
/*!40000 ALTER TABLE `authtoken_token` DISABLE KEYS */;
INSERT INTO `authtoken_token` VALUES ('1fdba3ff4d545f74399ca5e36a612f15b0c73da7','2020-09-22 07:48:43.422430',5),('437ca91c3df0fd74f6944cbabed246ca1c87e147','2020-09-22 08:08:22.386306',7),('4b7e22c14ee2c747ffbb0b32a74eaa07aeeeb797','2020-09-22 06:56:26.866995',3),('8778843c0055bd7d2473a38bab501f438dd52a14','2020-09-22 09:13:49.312546',8),('8be18c419918a34d172d1bc263cd0d04cdd965d5','2020-09-21 16:26:22.744858',1),('9572265778b5c9bcd518dd7a9fc98c374d43f260','2020-09-22 06:56:57.018253',4),('9b0e5c1cb1c20ad191ed807c0a30c4e1e63f9768','2020-09-21 16:29:10.625545',2),('f66d347a466f538380eea4a93dff7a08e27a623e','2020-09-22 07:49:54.792700',6);
/*!40000 ALTER TABLE `authtoken_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_management_admin`
--

DROP TABLE IF EXISTS `device_management_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `device_management_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `uuid` char(32) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `archived_on` datetime(6) DEFAULT NULL,
  `restored_on` datetime(6) DEFAULT NULL,
  `organization_name` varchar(100) DEFAULT NULL,
  `topic` varchar(100) DEFAULT NULL,
  `added_by_id` int(11) DEFAULT NULL,
  `organization_uuid` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `device_management_ad_added_by_id_0550d9e1_fk_device_ma` (`added_by_id`),
  CONSTRAINT `device_management_ad_added_by_id_0550d9e1_fk_device_ma` FOREIGN KEY (`added_by_id`) REFERENCES `device_management_admin` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_management_admin`
--

LOCK TABLES `device_management_admin` WRITE;
/*!40000 ALTER TABLE `device_management_admin` DISABLE KEYS */;
INSERT INTO `device_management_admin` VALUES (1,'md5$KUS7FZHLIrEl$da91bcb9e3d9739ec9e135121cb6909a',1,'anup','','','anup25111986@gmail.com',0,1,'2020-09-22 08:25:38.910171','d446fe6ae6ae48f1805b489312351e55',NULL,NULL,NULL,'Dudu pvt ltd','Dudu pvt ltd/2020-09-22 08:25:38.910403/7413be3c-b1cf-44d6-8ea4-9767b9f849d4',NULL,'61cd55e981ad42f49a7469cb1b6a9c90'),(2,'md5$NtAqN2lPRAuF$fa336ee2742911fa3ef75a6078e5e378',1,'vrquin','','','anup25111986@gmail.com',0,1,'2020-09-22 08:26:50.404077','4ec30e20c26741edb13a42e34fedeea1',NULL,NULL,NULL,'VRQuin pvt ltd','VRQuin pvt ltd/2020-09-22 08:26:50.404347/2fb0182f-b255-4d80-b10b-238ddfd6df9e',1,'00914cf04dc04fada23a0385d6045715'),(3,'md5$fjk1biG38ZfZ$7ef9472561f885558f95f91531d589bf',0,'shikha','Anup','Gogoi','anup25111986@gmail.com',1,1,'2020-09-22 08:33:23.704731','3cc6ca7867fb471ebe4b482a6e1657a7',NULL,NULL,NULL,'Volvo pvt ltd','Volvo pvt ltd/2020-09-22 08:33:23.704940/75e6893c-ed0a-4b95-974f-dd9e1443d2e1',1,'39e26b5658854f24bd8cd3a72cd5cf9d'),(4,'md5$exc1aAuP5QBH$f721020a3b3a52f014a91365a5ed7681',0,'s-emp1','Dudu','Gogoi','anup25111986@gmail.com',1,1,'2020-09-22 08:37:59.521230','c3c631123c31421e9de541ac3d1649a9',NULL,NULL,NULL,'Volvo pvt ltd','Volvo pvt ltd/2020-09-22 08:37:59.521477/5c1fe0a0-8cb2-466f-8663-7d5ab82178db',3,'39e26b5658854f24bd8cd3a72cd5cf9d'),(5,'md5$uhinbHypS2po$56c53531a19e2b6e19f7ad8a1b2e1089',0,'s-emp2','Anup','Gogoi','anup25111986@gmail.com',1,1,'2020-09-22 08:41:40.373412','6d83a6d1c0274398b61421cc451572b3',NULL,NULL,NULL,'Volvo pvt ltd','Volvo pvt ltd/2020-09-22 08:41:40.373630/3205dbef-7547-41b5-bb26-660f6d07ff97',3,'39e26b5658854f24bd8cd3a72cd5cf9d'),(6,'md5$AJYaXK8hbnzI$bf3750f96783d7a868dd7da9147e36a6',0,'s-emp3','Mohan','Das','anup25111986@gmail.com',0,1,'2020-09-22 08:42:32.229973','8699247de37f442daa4f36573bdafcea',NULL,NULL,NULL,'Volvo pvt ltd','Volvo pvt ltd/2020-09-22 08:42:32.230143/91aa9064-aeaf-44af-b181-fe959c29c999',3,'39e26b5658854f24bd8cd3a72cd5cf9d'),(7,'md5$iuuKuHzIlqSf$9dbab9abf021662bd92b41fd896a53bc',0,'s-emp4','Kiran','Khanna','anup25111986@gmail.com',0,1,'2020-09-22 09:13:12.443463','31813558c73449ebbfc10cb966872d89',NULL,NULL,NULL,'Volvo pvt ltd','Volvo pvt ltd/39e26b56-5885-4f24-bd8c-d3a72cd5cf9d',3,'39e26b5658854f24bd8cd3a72cd5cf9d'),(8,'md5$qZXaO2spnVdB$5ff76d42afac5437287b566edfb1c8e0',0,'s-emp5','Manju','Kumari','anup25111986@gmail.com',0,1,'2020-09-22 09:13:49.309131','96844e061121432c8616a16e9a3d7858',NULL,NULL,NULL,'Volvo pvt ltd','Volvo pvt ltd/39e26b56-5885-4f24-bd8c-d3a72cd5cf9d',3,'39e26b5658854f24bd8cd3a72cd5cf9d');
/*!40000 ALTER TABLE `device_management_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_management_admin_groups`
--

DROP TABLE IF EXISTS `device_management_admin_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `device_management_admin_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `device_management_admin_groups_admin_id_group_id_fd445858_uniq` (`admin_id`,`group_id`),
  KEY `device_management_ad_group_id_5881cb30_fk_auth_grou` (`group_id`),
  CONSTRAINT `device_management_ad_admin_id_cc8394de_fk_device_ma` FOREIGN KEY (`admin_id`) REFERENCES `device_management_admin` (`id`),
  CONSTRAINT `device_management_ad_group_id_5881cb30_fk_auth_grou` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_management_admin_groups`
--

LOCK TABLES `device_management_admin_groups` WRITE;
/*!40000 ALTER TABLE `device_management_admin_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `device_management_admin_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_management_admin_user_permissions`
--

DROP TABLE IF EXISTS `device_management_admin_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `device_management_admin_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `device_management_admin__admin_id_permission_id_07dd49d4_uniq` (`admin_id`,`permission_id`),
  KEY `device_management_ad_permission_id_0a2d24de_fk_auth_perm` (`permission_id`),
  CONSTRAINT `device_management_ad_admin_id_c7ba2bad_fk_device_ma` FOREIGN KEY (`admin_id`) REFERENCES `device_management_admin` (`id`),
  CONSTRAINT `device_management_ad_permission_id_0a2d24de_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_management_admin_user_permissions`
--

LOCK TABLES `device_management_admin_user_permissions` WRITE;
/*!40000 ALTER TABLE `device_management_admin_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `device_management_admin_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_management_device`
--

DROP TABLE IF EXISTS `device_management_device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `device_management_device` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(32) NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `added_on` datetime(6) DEFAULT NULL,
  `removed_on` datetime(6) DEFAULT NULL,
  `modified_on` datetime(6) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `callback_message` varchar(50) DEFAULT NULL,
  `belongs_to_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `device_management_de_belongs_to_id_f1beea26_fk_device_ma` (`belongs_to_id`),
  CONSTRAINT `device_management_de_belongs_to_id_f1beea26_fk_device_ma` FOREIGN KEY (`belongs_to_id`) REFERENCES `device_management_admin` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_management_device`
--

LOCK TABLES `device_management_device` WRITE;
/*!40000 ALTER TABLE `device_management_device` DISABLE KEYS */;
INSERT INTO `device_management_device` VALUES (1,'96682e4722fb483d8c1656b9204b823d',0,'2020-09-22 09:55:08.125045','2020-09-22 09:55:08.125059','2020-09-22 09:55:08.125066',NULL,NULL,8),(2,'bc15aa9e22ed41f39f64ab1054ce1ccc',0,'2020-09-22 12:12:52.586698','2020-09-22 12:12:52.586707','2020-09-22 12:12:52.586712','device 2',NULL,8),(3,'6a956c7ba892449bbf6785ca42315376',0,'2020-09-22 12:13:27.970993','2020-09-22 12:13:27.971000','2020-09-22 12:13:27.971003','device 3',NULL,8),(4,'608a73980bac46f2a58024af25144093',0,'2020-09-22 12:13:37.032308','2020-09-22 12:13:37.032315','2020-09-22 12:13:37.032318','device 4',NULL,8),(5,'9cd67e5f077e4097bb22bec5ceafad88',0,'2020-09-22 12:14:02.387971','2020-09-22 12:14:02.387978','2020-09-22 12:14:02.387980','device 5',NULL,8),(6,'237ee533ca864cb8bddfbe177f6536fd',0,'2020-09-22 12:14:08.806665','2020-09-22 12:14:08.806673','2020-09-22 12:14:08.806675','device 6',NULL,8),(7,'8b1bd94e181d48a6b4098f06de597d94',0,'2020-09-26 08:22:47.136321','2020-09-26 08:22:47.136329','2020-09-26 08:22:47.136334','device 7',NULL,8);
/*!40000 ALTER TABLE `device_management_device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_management_device_playtime`
--

DROP TABLE IF EXISTS `device_management_device_playtime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `device_management_device_playtime` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device_id` int(11) NOT NULL,
  `playtimeschedule_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `device_management_device_device_id_playtimeschedu_15208936_uniq` (`device_id`,`playtimeschedule_id`),
  KEY `device_management_de_playtimeschedule_id_b8306c94_fk_device_ma` (`playtimeschedule_id`),
  CONSTRAINT `device_management_de_device_id_5e1c4ac3_fk_device_ma` FOREIGN KEY (`device_id`) REFERENCES `device_management_device` (`id`),
  CONSTRAINT `device_management_de_playtimeschedule_id_b8306c94_fk_device_ma` FOREIGN KEY (`playtimeschedule_id`) REFERENCES `device_management_playtimeschedule` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_management_device_playtime`
--

LOCK TABLES `device_management_device_playtime` WRITE;
/*!40000 ALTER TABLE `device_management_device_playtime` DISABLE KEYS */;
INSERT INTO `device_management_device_playtime` VALUES (21,4,30),(19,5,28),(20,6,29);
/*!40000 ALTER TABLE `device_management_device_playtime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_management_device_video`
--

DROP TABLE IF EXISTS `device_management_device_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `device_management_device_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device_id` int(11) NOT NULL,
  `video_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `device_management_device_video_device_id_video_id_53720218_uniq` (`device_id`,`video_id`),
  KEY `device_management_de_video_id_e002cc65_fk_device_ma` (`video_id`),
  CONSTRAINT `device_management_de_device_id_430c052f_fk_device_ma` FOREIGN KEY (`device_id`) REFERENCES `device_management_device` (`id`),
  CONSTRAINT `device_management_de_video_id_e002cc65_fk_device_ma` FOREIGN KEY (`video_id`) REFERENCES `device_management_video` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_management_device_video`
--

LOCK TABLES `device_management_device_video` WRITE;
/*!40000 ALTER TABLE `device_management_device_video` DISABLE KEYS */;
INSERT INTO `device_management_device_video` VALUES (15,4,1),(13,5,1),(14,6,1);
/*!40000 ALTER TABLE `device_management_device_video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_management_playlist`
--

DROP TABLE IF EXISTS `device_management_playlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `device_management_playlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(32) NOT NULL,
  `name` varchar(100) NOT NULL,
  `added_on` datetime(6) DEFAULT NULL,
  `modified_on` datetime(6) DEFAULT NULL,
  `belongs_to_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  UNIQUE KEY `name` (`name`),
  KEY `device_management_pl_belongs_to_id_5de38126_fk_device_ma` (`belongs_to_id`),
  CONSTRAINT `device_management_pl_belongs_to_id_5de38126_fk_device_ma` FOREIGN KEY (`belongs_to_id`) REFERENCES `device_management_admin` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_management_playlist`
--

LOCK TABLES `device_management_playlist` WRITE;
/*!40000 ALTER TABLE `device_management_playlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `device_management_playlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_management_playlist_device`
--

DROP TABLE IF EXISTS `device_management_playlist_device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `device_management_playlist_device` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playlist_id` int(11) NOT NULL,
  `device_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `device_management_playli_playlist_id_device_id_f60e9b19_uniq` (`playlist_id`,`device_id`),
  KEY `device_management_pl_device_id_68eb2dab_fk_device_ma` (`device_id`),
  CONSTRAINT `device_management_pl_device_id_68eb2dab_fk_device_ma` FOREIGN KEY (`device_id`) REFERENCES `device_management_device` (`id`),
  CONSTRAINT `device_management_pl_playlist_id_c9a4759b_fk_device_ma` FOREIGN KEY (`playlist_id`) REFERENCES `device_management_playlist` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_management_playlist_device`
--

LOCK TABLES `device_management_playlist_device` WRITE;
/*!40000 ALTER TABLE `device_management_playlist_device` DISABLE KEYS */;
/*!40000 ALTER TABLE `device_management_playlist_device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_management_playlist_video`
--

DROP TABLE IF EXISTS `device_management_playlist_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `device_management_playlist_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playlist_id` int(11) NOT NULL,
  `video_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `device_management_playli_playlist_id_video_id_5d851fc4_uniq` (`playlist_id`,`video_id`),
  KEY `device_management_pl_video_id_1e1ac301_fk_device_ma` (`video_id`),
  CONSTRAINT `device_management_pl_playlist_id_5b983294_fk_device_ma` FOREIGN KEY (`playlist_id`) REFERENCES `device_management_playlist` (`id`),
  CONSTRAINT `device_management_pl_video_id_1e1ac301_fk_device_ma` FOREIGN KEY (`video_id`) REFERENCES `device_management_video` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_management_playlist_video`
--

LOCK TABLES `device_management_playlist_video` WRITE;
/*!40000 ALTER TABLE `device_management_playlist_video` DISABLE KEYS */;
/*!40000 ALTER TABLE `device_management_playlist_video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_management_playtimeschedule`
--

DROP TABLE IF EXISTS `device_management_playtimeschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `device_management_playtimeschedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(32) NOT NULL,
  `inaday_play_from` time(6) DEFAULT NULL,
  `inaday_play_to` time(6) DEFAULT NULL,
  `inaday_gap_required` time(6) DEFAULT NULL,
  `repeat` tinyint(1) NOT NULL,
  `play_on` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_management_playtimeschedule`
--

LOCK TABLES `device_management_playtimeschedule` WRITE;
/*!40000 ALTER TABLE `device_management_playtimeschedule` DISABLE KEYS */;
INSERT INTO `device_management_playtimeschedule` VALUES (1,'5860d6561f3f4f6d9f8a4180aa73690c','00:00:00.000000','00:00:00.000000',NULL,1,'[\'everyday\']'),(2,'670555322d9f43d580984a3c75bd8a9c','11:00:00.260524','05:00:00.260524',NULL,1,'[\'monday\', \'wednesday\', \'friday\', \'saturday\', \'sunday\']'),(3,'179c0e6de37e40f49f6d31ee97bba9f0','11:00:00.260524','09:00:00.260524',NULL,1,'[\'everyday\']'),(16,'5b7253e6812042878bbd6a802f430b8d','00:00:00.000000','00:00:00.000000',NULL,1,'[\'everyday\']'),(17,'01b679ce0d534222b099c96e60558625','11:00:00.260524','05:00:00.260524',NULL,1,'[\'monday\', \'wednesday\', \'friday\', \'saturday\', \'sunday\']'),(18,'87a5a49f7b5b45b0a1a6ace55de8324b','11:00:00.260524','09:00:00.260524',NULL,1,'[\'everyday\']'),(19,'b48c901992ed49128aefea14f8fc8901','00:00:00.000000','00:00:00.000000',NULL,1,'[\'everyday\']'),(20,'47ab90e959d047c68facce5a6a26080a','11:00:00.260524','05:00:00.260524',NULL,1,'[\'monday\', \'wednesday\', \'friday\', \'saturday\', \'sunday\']'),(21,'b968ca8930724808be3909c74bd63619','11:00:00.260524','09:00:00.260524',NULL,1,'[\'everyday\']'),(22,'baa0d44e05c64c5aa39223a64cab92fd','00:00:00.000000','00:00:00.000000',NULL,1,'[\'everyday\']'),(23,'3da8f6e664474325bc252574932a4af2','11:00:00.260524','05:00:00.260524',NULL,1,'[\'monday\', \'wednesday\', \'friday\', \'saturday\', \'sunday\']'),(24,'9f10c73deaec4674b0af4332ea5edb5c','11:00:00.260524','09:00:00.260524',NULL,1,'[\'everyday\']'),(25,'096392a964d64b8b98da1f5a12e94c39','00:00:00.000000','00:00:00.000000',NULL,1,'[\'everyday\']'),(26,'bec90273526745598315a42a0f08919e','11:00:00.260524','05:00:00.260524',NULL,1,'[\'monday\', \'wednesday\', \'friday\', \'saturday\', \'sunday\']'),(27,'8c5c185e57c749549004ddef48f81677','11:00:00.260524','09:00:00.260524',NULL,1,'[\'everyday\']'),(28,'f7bc357687f94b6394d8679f555c3917','00:00:00.000000','00:00:00.000000',NULL,1,'[\'everyday\']'),(29,'78430d66c52e4a5b8191418b05b649b5','11:00:00.260524','05:00:00.260524',NULL,1,'[\'monday\', \'wednesday\', \'friday\', \'saturday\', \'sunday\']'),(30,'150982d8c27948e6a100d5a06812b362','11:00:00.260524','09:00:00.260524',NULL,1,'[\'everyday\']');
/*!40000 ALTER TABLE `device_management_playtimeschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_management_video`
--

DROP TABLE IF EXISTS `device_management_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `device_management_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(32) NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `added_on` datetime(6) DEFAULT NULL,
  `removed_on` datetime(6) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `video` varchar(100) NOT NULL,
  `thumbnail` varchar(100) NOT NULL,
  `uploaded_at` datetime(6) NOT NULL,
  `belongs_to_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `device_management_vi_belongs_to_id_845626b6_fk_device_ma` (`belongs_to_id`),
  CONSTRAINT `device_management_vi_belongs_to_id_845626b6_fk_device_ma` FOREIGN KEY (`belongs_to_id`) REFERENCES `device_management_admin` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_management_video`
--

LOCK TABLES `device_management_video` WRITE;
/*!40000 ALTER TABLE `device_management_video` DISABLE KEYS */;
INSERT INTO `device_management_video` VALUES (1,'73c1c57d424644d6878f20ed9bc32000',0,'2020-09-22 10:34:21.154658','2020-09-22 10:34:21.154668','','user_3cc6ca78-67fb-471e-be4b-482a6e1657a7/3_Second_Video.mp4','thumbnails/user_3cc6ca78-67fb-471e-be4b-482a6e1657a7/3_Second_Video.mp4','2020-09-22 10:34:21.157436',3);
/*!40000 ALTER TABLE `device_management_video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_management_video_playtime`
--

DROP TABLE IF EXISTS `device_management_video_playtime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `device_management_video_playtime` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `video_id` int(11) NOT NULL,
  `playtimeschedule_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `device_management_video__video_id_playtimeschedul_d9e7bad9_uniq` (`video_id`,`playtimeschedule_id`),
  KEY `device_management_vi_playtimeschedule_id_d1531af4_fk_device_ma` (`playtimeschedule_id`),
  CONSTRAINT `device_management_vi_playtimeschedule_id_d1531af4_fk_device_ma` FOREIGN KEY (`playtimeschedule_id`) REFERENCES `device_management_playtimeschedule` (`id`),
  CONSTRAINT `device_management_vi_video_id_7feb8700_fk_device_ma` FOREIGN KEY (`video_id`) REFERENCES `device_management_video` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_management_video_playtime`
--

LOCK TABLES `device_management_video_playtime` WRITE;
/*!40000 ALTER TABLE `device_management_video_playtime` DISABLE KEYS */;
INSERT INTO `device_management_video_playtime` VALUES (25,1,28),(26,1,29),(27,1,30);
/*!40000 ALTER TABLE `device_management_video_playtime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_device_management_admin_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_device_management_admin_id` FOREIGN KEY (`user_id`) REFERENCES `device_management_admin` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(6,'authtoken','token'),(4,'contenttypes','contenttype'),(7,'device_management','admin'),(8,'device_management','device'),(9,'device_management','playlist'),(11,'device_management','playtimeschedule'),(10,'device_management','video'),(5,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2020-09-21 16:23:58.711730'),(2,'contenttypes','0002_remove_content_type_name','2020-09-21 16:23:58.749973'),(3,'auth','0001_initial','2020-09-21 16:23:58.871976'),(4,'auth','0002_alter_permission_name_max_length','2020-09-21 16:23:58.900426'),(5,'auth','0003_alter_user_email_max_length','2020-09-21 16:23:58.908168'),(6,'auth','0004_alter_user_username_opts','2020-09-21 16:23:58.915875'),(7,'auth','0005_alter_user_last_login_null','2020-09-21 16:23:58.923806'),(8,'auth','0006_require_contenttypes_0002','2020-09-21 16:23:58.926931'),(9,'auth','0007_alter_validators_add_error_messages','2020-09-21 16:23:58.935466'),(10,'auth','0008_alter_user_username_max_length','2020-09-21 16:23:58.944214'),(11,'auth','0009_alter_user_last_name_max_length','2020-09-21 16:23:58.952803'),(12,'device_management','0001_initial','2020-09-21 16:23:59.432054'),(13,'admin','0001_initial','2020-09-21 16:23:59.511303'),(14,'admin','0002_logentry_remove_auto_add','2020-09-21 16:23:59.531907'),(15,'admin','0003_logentry_add_action_flag_choices','2020-09-21 16:23:59.548069'),(16,'authtoken','0001_initial','2020-09-21 16:23:59.599112'),(17,'authtoken','0002_auto_20160226_1747','2020-09-21 16:23:59.710996'),(18,'device_management','0002_admin_added_by','2020-09-22 08:04:26.755618'),(19,'device_management','0003_admin_organization_uuid','2020-09-22 08:24:02.236547'),(20,'device_management','0004_auto_20200922_0829','2020-09-22 08:29:32.490604'),(21,'device_management','0005_auto_20200922_1112','2020-09-22 11:12:44.426057'),(22,'device_management','0006_auto_20200922_1134','2020-09-22 11:34:57.757210'),(23,'device_management','0007_auto_20200922_1207','2020-09-22 12:07:51.800133'),(24,'device_management','0008_auto_20200922_1232','2020-09-22 12:33:02.817295'),(25,'device_management','0009_auto_20200922_1245','2020-09-22 12:45:38.264839'),(26,'device_management','0010_auto_20200923_0754','2020-09-23 07:54:42.684543'),(27,'device_management','0011_device_playtime','2020-09-23 11:17:13.558726'),(28,'sessions','0001_initial','2020-09-26 06:52:50.567763');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_mqtt_acl`
--

DROP TABLE IF EXISTS `django_mqtt_acl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_mqtt_acl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `allow` tinyint(1) NOT NULL,
  `acc` int(11) NOT NULL,
  `password` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_mqtt_acl`
--

LOCK TABLES `django_mqtt_acl` WRITE;
/*!40000 ALTER TABLE `django_mqtt_acl` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_mqtt_acl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_mqtt_acl_groups`
--

DROP TABLE IF EXISTS `django_mqtt_acl_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_mqtt_acl_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acl_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_mqtt_acl_groups`
--

LOCK TABLES `django_mqtt_acl_groups` WRITE;
/*!40000 ALTER TABLE `django_mqtt_acl_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_mqtt_acl_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_mqtt_clientid`
--

DROP TABLE IF EXISTS `django_mqtt_clientid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_mqtt_clientid` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(23) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_mqtt_clientid`
--

LOCK TABLES `django_mqtt_clientid` WRITE;
/*!40000 ALTER TABLE `django_mqtt_clientid` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_mqtt_clientid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_mqtt_clientid_groups`
--

DROP TABLE IF EXISTS `django_mqtt_clientid_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_mqtt_clientid_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clientid_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_mqtt_clientid_groups`
--

LOCK TABLES `django_mqtt_clientid_groups` WRITE;
/*!40000 ALTER TABLE `django_mqtt_clientid_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_mqtt_clientid_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_mqtt_clientid_users`
--

DROP TABLE IF EXISTS `django_mqtt_clientid_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_mqtt_clientid_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clientid_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_mqtt_clientid_users`
--

LOCK TABLES `django_mqtt_clientid_users` WRITE;
/*!40000 ALTER TABLE `django_mqtt_clientid_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_mqtt_clientid_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('1cgkafmj380ndvoyumpbftwoqnrt9jsd','ZTkyNTUyMmVmOWVlYjUxMjUyNDA5Mjk5NjYwNTA3OTk4NGQwY2ZiODp7InZycXVpbiI6eyJyZWZyZXNoIjoiZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6STFOaUo5LmV5SjBiMnRsYmw5MGVYQmxJam9pY21WbWNtVnphQ0lzSW1WNGNDSTZNVFl3TVRFNU5UY3hOQ3dpYW5ScElqb2lPV0kxTmpWbVltRmxZbUUyTkRRMk5EbGtZV1ExT1dFMk1qVXdNakEyWldFaUxDSjFjMlZ5WDJsa0lqb3lMQ0oxYzJWeUlqb2lkbkp4ZFdsdUlpd2ljM1Z3WlhKMWMyVnlJanAwY25WbExDSmhaRzFwYmlJNlptRnNjMlVzSW05eVoyRnVhWHBoZEdsdmJsOTFkV2xrSWpvaU1EQTVNVFJqWmpBdE5HUmpNQzAwWm1Ga0xXRXlNMkV0TURNNE5XUTJNRFExTnpFMUluMC43OE9EclYtTlU2Y01FSUhQSkpCZ29fMXpoZVJPV1puZ2MtNWlFRllHOUlBIiwiYWNjZXNzIjoiZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6STFOaUo5LmV5SjBiMnRsYmw5MGVYQmxJam9pWVdOalpYTnpJaXdpWlhod0lqb3hOakF4TnpFME1URTBMQ0pxZEdraU9pSmlZMkptWlRWbU9UTmtabVkwTVRJME9HRmtPVFExTnpjME16aGpabVptWVNJc0luVnpaWEpmYVdRaU9qSXNJblZ6WlhJaU9pSjJjbkYxYVc0aUxDSnpkWEJsY25WelpYSWlPblJ5ZFdVc0ltRmtiV2x1SWpwbVlXeHpaU3dpYjNKbllXNXBlbUYwYVc5dVgzVjFhV1FpT2lJd01Ea3hOR05tTUMwMFpHTXdMVFJtWVdRdFlUSXpZUzB3TXpnMVpEWXdORFUzTVRVaWZRLm54TnJHMmN4VlIyR1dwUjdzVWJVQXp1S014eEVVZTI3VVNKOGNhWU9CZjAiLCJ1c2VyIjoidnJxdWluIiwidG9waWMiOiJWUlF1aW4gcHZ0IGx0ZC8yMDIwLTA5LTIyIDA4OjI2OjUwLjQwNDM0Ny8yZmIwMTgyZi1iMjU1LTRkODAtYjEwYi0yMzhkZGZkNmRmOWUiLCJlbWFpbCI6ImFudXAyNTExMTk4NkBnbWFpbC5jb20iLCJzdXBlcnVzZXIiOnRydWUsImFkbWluIjpmYWxzZSwiaWQiOjIsImFkZGVkX2J5IjoiIiwib3JnYW5pemF0aW9uX3V1aWQiOiIwMDkxNGNmMC00ZGMwLTRmYWQtYTIzYS0wMzg1ZDYwNDU3MTUiLCJvcmdhbml6YXRpb25fbmFtZSI6IlZSUXVpbiBwdnQgbHRkIiwidG90YWxfYWRtaW5zIjozLCJ0b3RhbF9kZXZpY2VzIjo3LCJ2aWRlb3NfYXNzaWduZWRfZGV2aWNlcyI6MX19','2020-10-10 08:35:14.367062'),('1qzwu6kb6j72u0nvazl7lj7t1daa142g','N2ZhMTAxNjlmMzE4NjJmNzY1YTYzZmIyZmY0NGViMDY2YmE4ZWMwODp7InZycXVpbiI6eyJyZWZyZXNoIjoiZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6STFOaUo5LmV5SjBiMnRsYmw5MGVYQmxJam9pY21WbWNtVnphQ0lzSW1WNGNDSTZNVFl3TVRFNU56TTNNeXdpYW5ScElqb2laREUxTlRCaE1HUmtaalUzTkRBeE5UZ3lZVFZpWXpNeU1EVmpNV05sT0RJaUxDSjFjMlZ5WDJsa0lqb3lMQ0oxYzJWeUlqb2lkbkp4ZFdsdUlpd2ljM1Z3WlhKMWMyVnlJanAwY25WbExDSmhaRzFwYmlJNlptRnNjMlVzSW05eVoyRnVhWHBoZEdsdmJsOTFkV2xrSWpvaU1EQTVNVFJqWmpBdE5HUmpNQzAwWm1Ga0xXRXlNMkV0TURNNE5XUTJNRFExTnpFMUluMC40WG5TNUN0bEwwS0N6V0hsOGVvT1Q0Rk1VdjM0SjhPbjZ0N1pyMFg0RldrIiwiYWNjZXNzIjoiZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6STFOaUo5LmV5SjBiMnRsYmw5MGVYQmxJam9pWVdOalpYTnpJaXdpWlhod0lqb3hOakF4TnpFMU56Y3pMQ0pxZEdraU9pSmlaVE13TXprd1pHSTNZbUUwWkRobVlUYzBOemswTVRJeE1tUmtZbVE1TkNJc0luVnpaWEpmYVdRaU9qSXNJblZ6WlhJaU9pSjJjbkYxYVc0aUxDSnpkWEJsY25WelpYSWlPblJ5ZFdVc0ltRmtiV2x1SWpwbVlXeHpaU3dpYjNKbllXNXBlbUYwYVc5dVgzVjFhV1FpT2lJd01Ea3hOR05tTUMwMFpHTXdMVFJtWVdRdFlUSXpZUzB3TXpnMVpEWXdORFUzTVRVaWZRLlo2LVZQYWpJdkdNQl9TWFVkdFJ4RjVoMnJNTGF1cWM0bHJERTNIZ3VRRUEiLCJ1c2VyIjoidnJxdWluIiwidG9waWMiOiJWUlF1aW4gcHZ0IGx0ZC8yMDIwLTA5LTIyIDA4OjI2OjUwLjQwNDM0Ny8yZmIwMTgyZi1iMjU1LTRkODAtYjEwYi0yMzhkZGZkNmRmOWUiLCJlbWFpbCI6ImFudXAyNTExMTk4NkBnbWFpbC5jb20iLCJzdXBlcnVzZXIiOnRydWUsImFkbWluIjpmYWxzZSwiaWQiOjIsImFkZGVkX2J5IjoiIiwib3JnYW5pemF0aW9uX3V1aWQiOiIwMDkxNGNmMC00ZGMwLTRmYWQtYTIzYS0wMzg1ZDYwNDU3MTUiLCJvcmdhbml6YXRpb25fbmFtZSI6IlZSUXVpbiBwdnQgbHRkIiwidG90YWxfYWRtaW5zIjozLCJ0b3RhbF9kZXZpY2VzIjo3LCJ2aWRlb3NfYXNzaWduZWRfZGV2aWNlcyI6MCwidG90YWxfdmlkZW9zIjoxfX0=','2020-10-10 09:02:53.474277'),('21qunyrzbf1p5gn62hiwjrpgf5k7ae23','ZTZhNWUwZjU1MjhjMDdhNGMxZmFmNzBmOWNhYmFjOGQ5NzE2Y2Q3ZDp7InZycXVpbiI6eyJyZWZyZXNoIjoiZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6STFOaUo5LmV5SjBiMnRsYmw5MGVYQmxJam9pY21WbWNtVnphQ0lzSW1WNGNDSTZNVFl3TVRFNU16UXlOQ3dpYW5ScElqb2lZbU0xTlRaalpqa3laRFZpTkRrMU16aGhNalZpT1dRM1pqbGpabVZtTnpBaUxDSjFjMlZ5WDJsa0lqb3lMQ0oxYzJWeUlqb2lkbkp4ZFdsdUlpd2ljM1Z3WlhKMWMyVnlJanAwY25WbExDSmhaRzFwYmlJNlptRnNjMlVzSW05eVoyRnVhWHBoZEdsdmJsOTFkV2xrSWpvaU1EQTVNVFJqWmpBdE5HUmpNQzAwWm1Ga0xXRXlNMkV0TURNNE5XUTJNRFExTnpFMUluMC5oSnZPRWFVaE90anJKYng5WFBWX2doWlR3a3pBWE1DQy14Q1NPN3JWNlhVIiwiYWNjZXNzIjoiZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6STFOaUo5LmV5SjBiMnRsYmw5MGVYQmxJam9pWVdOalpYTnpJaXdpWlhod0lqb3hOakF4TnpFeE9ESTBMQ0pxZEdraU9pSTJaak15TnpJd1ltTTNZakEwTURKbE9ESTVOekF5WkRGaU5UZzNaamcyWXlJc0luVnpaWEpmYVdRaU9qSXNJblZ6WlhJaU9pSjJjbkYxYVc0aUxDSnpkWEJsY25WelpYSWlPblJ5ZFdVc0ltRmtiV2x1SWpwbVlXeHpaU3dpYjNKbllXNXBlbUYwYVc5dVgzVjFhV1FpT2lJd01Ea3hOR05tTUMwMFpHTXdMVFJtWVdRdFlUSXpZUzB3TXpnMVpEWXdORFUzTVRVaWZRLmdYak00ZzVFZnMwUS1OQUFSSGxwRnlsblBOLVNqUHJJN0hoSEtqRGhScXMiLCJ1c2VyIjoidnJxdWluIiwidG9waWMiOiJWUlF1aW4gcHZ0IGx0ZC8yMDIwLTA5LTIyIDA4OjI2OjUwLjQwNDM0Ny8yZmIwMTgyZi1iMjU1LTRkODAtYjEwYi0yMzhkZGZkNmRmOWUiLCJlbWFpbCI6ImFudXAyNTExMTk4NkBnbWFpbC5jb20iLCJzdXBlcnVzZXIiOnRydWUsImFkbWluIjpmYWxzZSwiaWQiOjIsImFkZGVkX2J5IjoiIiwib3JnYW5pemF0aW9uX3V1aWQiOiIwMDkxNGNmMC00ZGMwLTRmYWQtYTIzYS0wMzg1ZDYwNDU3MTUiLCJvcmdhbml6YXRpb25fbmFtZSI6IlZSUXVpbiBwdnQgbHRkIn19','2020-10-10 07:57:04.116943'),('3ffkivudrgnhoqum7nfy5m33zdes9fxx','Y2U0YmM1MTc1ZDYxYmQ0NDNiN2VkZWYyYjU3ZWI2YTQyYjlkZDU0NTp7InZycXVpbiI6eyJyZWZyZXNoIjoiZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6STFOaUo5LmV5SjBiMnRsYmw5MGVYQmxJam9pY21WbWNtVnphQ0lzSW1WNGNDSTZNVFl3TVRFNU5UZzBOU3dpYW5ScElqb2lZVFEyTmpVMU9EWTVNbVJtTkRNME9UaG1NVEl5TURVeE4yVmpaRGc1WWpraUxDSjFjMlZ5WDJsa0lqb3lMQ0oxYzJWeUlqb2lkbkp4ZFdsdUlpd2ljM1Z3WlhKMWMyVnlJanAwY25WbExDSmhaRzFwYmlJNlptRnNjMlVzSW05eVoyRnVhWHBoZEdsdmJsOTFkV2xrSWpvaU1EQTVNVFJqWmpBdE5HUmpNQzAwWm1Ga0xXRXlNMkV0TURNNE5XUTJNRFExTnpFMUluMC43d3doNjZTbkk0bnNhNmJkdzYtSDlhc211aXJKQnZmNGRJRENZSXNkVGRvIiwiYWNjZXNzIjoiZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6STFOaUo5LmV5SjBiMnRsYmw5MGVYQmxJam9pWVdOalpYTnpJaXdpWlhod0lqb3hOakF4TnpFME1qUTFMQ0pxZEdraU9pSXpOMlZoTjJVMFpEQmpaR00wT0RZNU9USmxOR0UyTmpoa05UWmxZbU16WmlJc0luVnpaWEpmYVdRaU9qSXNJblZ6WlhJaU9pSjJjbkYxYVc0aUxDSnpkWEJsY25WelpYSWlPblJ5ZFdVc0ltRmtiV2x1SWpwbVlXeHpaU3dpYjNKbllXNXBlbUYwYVc5dVgzVjFhV1FpT2lJd01Ea3hOR05tTUMwMFpHTXdMVFJtWVdRdFlUSXpZUzB3TXpnMVpEWXdORFUzTVRVaWZRLjJJcWloUTc2VTUzQUJXVUw5NW9aSGpyTGtQYVdQdk1WaWVkWVJlS0p6R00iLCJ1c2VyIjoidnJxdWluIiwidG9waWMiOiJWUlF1aW4gcHZ0IGx0ZC8yMDIwLTA5LTIyIDA4OjI2OjUwLjQwNDM0Ny8yZmIwMTgyZi1iMjU1LTRkODAtYjEwYi0yMzhkZGZkNmRmOWUiLCJlbWFpbCI6ImFudXAyNTExMTk4NkBnbWFpbC5jb20iLCJzdXBlcnVzZXIiOnRydWUsImFkbWluIjpmYWxzZSwiaWQiOjIsImFkZGVkX2J5IjoiIiwib3JnYW5pemF0aW9uX3V1aWQiOiIwMDkxNGNmMC00ZGMwLTRmYWQtYTIzYS0wMzg1ZDYwNDU3MTUiLCJvcmdhbml6YXRpb25fbmFtZSI6IlZSUXVpbiBwdnQgbHRkIiwidG90YWxfYWRtaW5zIjozLCJ0b3RhbF9kZXZpY2VzIjo3LCJ2aWRlb3NfYXNzaWduZWRfZGV2aWNlcyI6MH19','2020-10-10 08:37:25.978753'),('403w34l4swxfeuk2tvsuwnxa2tn0wf33','ZmYxYWViM2MxY2U2MzU3ZGEzOGQ2Yzc2YzM2NGFiNzM2MTVhMDJlMDp7InZycXVpbiI6eyJyZWZyZXNoIjoiZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6STFOaUo5LmV5SjBiMnRsYmw5MGVYQmxJam9pY21WbWNtVnphQ0lzSW1WNGNDSTZNVFl3TVRFNU5UUXdNeXdpYW5ScElqb2lZbVV4TUdNNE1HTTFZVEUzTkRJMU5qZzVaakJqT1Rkak5URTVOems1TldFaUxDSjFjMlZ5WDJsa0lqb3lMQ0oxYzJWeUlqb2lkbkp4ZFdsdUlpd2ljM1Z3WlhKMWMyVnlJanAwY25WbExDSmhaRzFwYmlJNlptRnNjMlVzSW05eVoyRnVhWHBoZEdsdmJsOTFkV2xrSWpvaU1EQTVNVFJqWmpBdE5HUmpNQzAwWm1Ga0xXRXlNMkV0TURNNE5XUTJNRFExTnpFMUluMC4zeU5UUW05YUozVV9oR3VrODRncWJZMk5yejJKQm9rSXRWbnRBaGhVV0ZZIiwiYWNjZXNzIjoiZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6STFOaUo5LmV5SjBiMnRsYmw5MGVYQmxJam9pWVdOalpYTnpJaXdpWlhod0lqb3hOakF4TnpFek9EQXpMQ0pxZEdraU9pSmlaVEJoTkRObE9XUmtNVFEwWmpKaFlqRTRNREUzT0RZMU9HRTBNVE0xWWlJc0luVnpaWEpmYVdRaU9qSXNJblZ6WlhJaU9pSjJjbkYxYVc0aUxDSnpkWEJsY25WelpYSWlPblJ5ZFdVc0ltRmtiV2x1SWpwbVlXeHpaU3dpYjNKbllXNXBlbUYwYVc5dVgzVjFhV1FpT2lJd01Ea3hOR05tTUMwMFpHTXdMVFJtWVdRdFlUSXpZUzB3TXpnMVpEWXdORFUzTVRVaWZRLjJSQWRKMjI5UTMyRDJWM282M3N2Vm9zOUxiVW04T2ltUktlUGxLOFF1cWsiLCJ1c2VyIjoidnJxdWluIiwidG9waWMiOiJWUlF1aW4gcHZ0IGx0ZC8yMDIwLTA5LTIyIDA4OjI2OjUwLjQwNDM0Ny8yZmIwMTgyZi1iMjU1LTRkODAtYjEwYi0yMzhkZGZkNmRmOWUiLCJlbWFpbCI6ImFudXAyNTExMTk4NkBnbWFpbC5jb20iLCJzdXBlcnVzZXIiOnRydWUsImFkbWluIjpmYWxzZSwiaWQiOjIsImFkZGVkX2J5IjoiIiwib3JnYW5pemF0aW9uX3V1aWQiOiIwMDkxNGNmMC00ZGMwLTRmYWQtYTIzYS0wMzg1ZDYwNDU3MTUiLCJvcmdhbml6YXRpb25fbmFtZSI6IlZSUXVpbiBwdnQgbHRkIiwidG90YWxfYWRtaW5zIjozLCJ0b3RhbF9kZXZpY2VzIjo3fX0=','2020-10-10 08:30:03.074842'),('824z37ny4q2n2249tv3xn10u6k2t06uo','MzZkYWJiYmYwYTc2OWU3NGI4NWQ5YzdjZWUyMGVmM2MxODVhMjM5NTp7InZycXVpbiI6eyJyZWZyZXNoIjoiZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6STFOaUo5LmV5SjBiMnRsYmw5MGVYQmxJam9pY21WbWNtVnphQ0lzSW1WNGNDSTZNVFl3TVRFNU5UTXpOQ3dpYW5ScElqb2laVFpsWWpZeE0yVmhORGMzTkRBME5tRXpNREF5TUdSbVpqWmtZamRrWkRBaUxDSjFjMlZ5WDJsa0lqb3lMQ0oxYzJWeUlqb2lkbkp4ZFdsdUlpd2ljM1Z3WlhKMWMyVnlJanAwY25WbExDSmhaRzFwYmlJNlptRnNjMlVzSW05eVoyRnVhWHBoZEdsdmJsOTFkV2xrSWpvaU1EQTVNVFJqWmpBdE5HUmpNQzAwWm1Ga0xXRXlNMkV0TURNNE5XUTJNRFExTnpFMUluMC5uT1B3Y1Z3cUUza3FVdktxY1NWdzRFNHBVRnA5VFpzRFl2ZVBnc3djUHlnIiwiYWNjZXNzIjoiZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6STFOaUo5LmV5SjBiMnRsYmw5MGVYQmxJam9pWVdOalpYTnpJaXdpWlhod0lqb3hOakF4TnpFek56TTBMQ0pxZEdraU9pSm1ZalF4T0RReU5tTmtOekEwWlRaallUZGlZV1kyWVRWaE5HRmtORGN3TWlJc0luVnpaWEpmYVdRaU9qSXNJblZ6WlhJaU9pSjJjbkYxYVc0aUxDSnpkWEJsY25WelpYSWlPblJ5ZFdVc0ltRmtiV2x1SWpwbVlXeHpaU3dpYjNKbllXNXBlbUYwYVc5dVgzVjFhV1FpT2lJd01Ea3hOR05tTUMwMFpHTXdMVFJtWVdRdFlUSXpZUzB3TXpnMVpEWXdORFUzTVRVaWZRLllhbjMyOFk3cDFySTUyOFVWbDdLdFV1TVhDZmoyTFU2QWQteEpBOC00MDAiLCJ1c2VyIjoidnJxdWluIiwidG9waWMiOiJWUlF1aW4gcHZ0IGx0ZC8yMDIwLTA5LTIyIDA4OjI2OjUwLjQwNDM0Ny8yZmIwMTgyZi1iMjU1LTRkODAtYjEwYi0yMzhkZGZkNmRmOWUiLCJlbWFpbCI6ImFudXAyNTExMTk4NkBnbWFpbC5jb20iLCJzdXBlcnVzZXIiOnRydWUsImFkbWluIjpmYWxzZSwiaWQiOjIsImFkZGVkX2J5IjoiIiwib3JnYW5pemF0aW9uX3V1aWQiOiIwMDkxNGNmMC00ZGMwLTRmYWQtYTIzYS0wMzg1ZDYwNDU3MTUiLCJvcmdhbml6YXRpb25fbmFtZSI6IlZSUXVpbiBwdnQgbHRkIiwidG90YWxfYWRtaW5zIjozLCJ0b3RhbF9kZXZpY2VzIjo3fX0=','2020-10-10 08:28:54.440927'),('97yrrzmc0d6036hy6b7omyzjuh5287s7','MDBiMWI1ZTBmNDBiN2JkOWEwZGQ4M2ZkZGQ2Y2JmMDBhNWRjOWY0ODp7InZycXVpbiI6eyJyZWZyZXNoIjoiZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6STFOaUo5LmV5SjBiMnRsYmw5MGVYQmxJam9pY21WbWNtVnphQ0lzSW1WNGNDSTZNVFl3TVRFNU5UZzJOeXdpYW5ScElqb2lORGRsTkRSbU5USTJZbVU1TkRKaFpXSmxOREpoWVRWaE1tTmhPV013WVRraUxDSjFjMlZ5WDJsa0lqb3lMQ0oxYzJWeUlqb2lkbkp4ZFdsdUlpd2ljM1Z3WlhKMWMyVnlJanAwY25WbExDSmhaRzFwYmlJNlptRnNjMlVzSW05eVoyRnVhWHBoZEdsdmJsOTFkV2xrSWpvaU1EQTVNVFJqWmpBdE5HUmpNQzAwWm1Ga0xXRXlNMkV0TURNNE5XUTJNRFExTnpFMUluMC5mdnBhN3VzUVd2SG1HOEhwV1J1Y1BLMEdyWVNlYmJaY2xjN0pYelNXUEZVIiwiYWNjZXNzIjoiZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6STFOaUo5LmV5SjBiMnRsYmw5MGVYQmxJam9pWVdOalpYTnpJaXdpWlhod0lqb3hOakF4TnpFME1qWTNMQ0pxZEdraU9pSXhNV0ppTldFM01HWXlOakEwT0RBMVlqVTBPRFE1TlRjNVptTTJabVppWmlJc0luVnpaWEpmYVdRaU9qSXNJblZ6WlhJaU9pSjJjbkYxYVc0aUxDSnpkWEJsY25WelpYSWlPblJ5ZFdVc0ltRmtiV2x1SWpwbVlXeHpaU3dpYjNKbllXNXBlbUYwYVc5dVgzVjFhV1FpT2lJd01Ea3hOR05tTUMwMFpHTXdMVFJtWVdRdFlUSXpZUzB3TXpnMVpEWXdORFUzTVRVaWZRLlE3RkJ4VjZ1Tnh4QWtFQXZtMVJ6QThBVTA3RUJFWmVyT1VWMjJxSExEQkUiLCJ1c2VyIjoidnJxdWluIiwidG9waWMiOiJWUlF1aW4gcHZ0IGx0ZC8yMDIwLTA5LTIyIDA4OjI2OjUwLjQwNDM0Ny8yZmIwMTgyZi1iMjU1LTRkODAtYjEwYi0yMzhkZGZkNmRmOWUiLCJlbWFpbCI6ImFudXAyNTExMTk4NkBnbWFpbC5jb20iLCJzdXBlcnVzZXIiOnRydWUsImFkbWluIjpmYWxzZSwiaWQiOjIsImFkZGVkX2J5IjoiIiwib3JnYW5pemF0aW9uX3V1aWQiOiIwMDkxNGNmMC00ZGMwLTRmYWQtYTIzYS0wMzg1ZDYwNDU3MTUiLCJvcmdhbml6YXRpb25fbmFtZSI6IlZSUXVpbiBwdnQgbHRkIiwidG90YWxfYWRtaW5zIjozLCJ0b3RhbF9kZXZpY2VzIjo3LCJ2aWRlb3NfYXNzaWduZWRfZGV2aWNlcyI6MH19','2020-10-10 08:37:47.522478'),('9rgs0ol41couz2io6guw053d07sr6fp2','NzQyMjQxMmM3ZDNhZGI1OGRiOWY1ODZmODM3NmEwNjBjNDU2MmY5Njp7InZycXVpbiI6eyJyZWZyZXNoIjoiZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6STFOaUo5LmV5SjBiMnRsYmw5MGVYQmxJam9pY21WbWNtVnphQ0lzSW1WNGNDSTZNVFl3TVRFNU5UWTVOQ3dpYW5ScElqb2lNVEkyWXpNMk9EWTFZbVppTkdKaU5tRmhZV1JsWTJFelltTm1ORGMxTm1FaUxDSjFjMlZ5WDJsa0lqb3lMQ0oxYzJWeUlqb2lkbkp4ZFdsdUlpd2ljM1Z3WlhKMWMyVnlJanAwY25WbExDSmhaRzFwYmlJNlptRnNjMlVzSW05eVoyRnVhWHBoZEdsdmJsOTFkV2xrSWpvaU1EQTVNVFJqWmpBdE5HUmpNQzAwWm1Ga0xXRXlNMkV0TURNNE5XUTJNRFExTnpFMUluMC5TVkd0ZFhVeXBGY3hLS0JmLVowZWN3QzFGTV9ybXI1OGFZdFN6RlJhQnNRIiwiYWNjZXNzIjoiZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6STFOaUo5LmV5SjBiMnRsYmw5MGVYQmxJam9pWVdOalpYTnpJaXdpWlhod0lqb3hOakF4TnpFME1EazBMQ0pxZEdraU9pSTFNbVF3TjJWbVpERTFObVkwTTJRMFlqQmpNelZrWXpFek1UTTVNRFkzTWlJc0luVnpaWEpmYVdRaU9qSXNJblZ6WlhJaU9pSjJjbkYxYVc0aUxDSnpkWEJsY25WelpYSWlPblJ5ZFdVc0ltRmtiV2x1SWpwbVlXeHpaU3dpYjNKbllXNXBlbUYwYVc5dVgzVjFhV1FpT2lJd01Ea3hOR05tTUMwMFpHTXdMVFJtWVdRdFlUSXpZUzB3TXpnMVpEWXdORFUzTVRVaWZRLl9HeUlxM0tWQThnNjFGSlh5cng0eUQ0TlNHbkNzeHJkMmRhUnpBc0pDaEkiLCJ1c2VyIjoidnJxdWluIiwidG9waWMiOiJWUlF1aW4gcHZ0IGx0ZC8yMDIwLTA5LTIyIDA4OjI2OjUwLjQwNDM0Ny8yZmIwMTgyZi1iMjU1LTRkODAtYjEwYi0yMzhkZGZkNmRmOWUiLCJlbWFpbCI6ImFudXAyNTExMTk4NkBnbWFpbC5jb20iLCJzdXBlcnVzZXIiOnRydWUsImFkbWluIjpmYWxzZSwiaWQiOjIsImFkZGVkX2J5IjoiIiwib3JnYW5pemF0aW9uX3V1aWQiOiIwMDkxNGNmMC00ZGMwLTRmYWQtYTIzYS0wMzg1ZDYwNDU3MTUiLCJvcmdhbml6YXRpb25fbmFtZSI6IlZSUXVpbiBwdnQgbHRkIiwidG90YWxfYWRtaW5zIjozLCJ0b3RhbF9kZXZpY2VzIjo3LCJ2aWRlb3NfYXNzaWduZWRfZGV2aWNlcyI6MH19','2020-10-10 08:34:54.140361'),('a5pr1rszi8f6u6yyxxsn2o2i6ujgm7ae','ZmRmMDgxNzhkMjgyYjRjZWU4NzAxMTk4NmZiMmIzMTUyNTY0YjUyYTp7InZycXVpbiI6eyJyZWZyZXNoIjoiZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6STFOaUo5LmV5SjBiMnRsYmw5MGVYQmxJam9pY21WbWNtVnphQ0lzSW1WNGNDSTZNVFl3TVRFNU5qVTVOU3dpYW5ScElqb2labVV5T1RrMllqaGxNVGxoTkRBM09EazRPR0k0WlRjek9Ea3dPVEU1TlRraUxDSjFjMlZ5WDJsa0lqb3lMQ0oxYzJWeUlqb2lkbkp4ZFdsdUlpd2ljM1Z3WlhKMWMyVnlJanAwY25WbExDSmhaRzFwYmlJNlptRnNjMlVzSW05eVoyRnVhWHBoZEdsdmJsOTFkV2xrSWpvaU1EQTVNVFJqWmpBdE5HUmpNQzAwWm1Ga0xXRXlNMkV0TURNNE5XUTJNRFExTnpFMUluMC5MZzFOUUJVZnlkSXRnMWtWTFBpZVZqSDlNclE4SEtIMVNVblNXMHdwMkd3IiwiYWNjZXNzIjoiZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6STFOaUo5LmV5SjBiMnRsYmw5MGVYQmxJam9pWVdOalpYTnpJaXdpWlhod0lqb3hOakF4TnpFME9UazFMQ0pxZEdraU9pSTNNakE1TWpCa01Ea3dZelkwTmpNNE9HVXhObVkxTnpRNVpHVTRNRGt5WWlJc0luVnpaWEpmYVdRaU9qSXNJblZ6WlhJaU9pSjJjbkYxYVc0aUxDSnpkWEJsY25WelpYSWlPblJ5ZFdVc0ltRmtiV2x1SWpwbVlXeHpaU3dpYjNKbllXNXBlbUYwYVc5dVgzVjFhV1FpT2lJd01Ea3hOR05tTUMwMFpHTXdMVFJtWVdRdFlUSXpZUzB3TXpnMVpEWXdORFUzTVRVaWZRLnhWcEZmMU5oTzN0SFFrS0NHM1c5a2xvUFlCZV9CMVNKc28wa2c2NzFCc00iLCJ1c2VyIjoidnJxdWluIiwidG9waWMiOiJWUlF1aW4gcHZ0IGx0ZC8yMDIwLTA5LTIyIDA4OjI2OjUwLjQwNDM0Ny8yZmIwMTgyZi1iMjU1LTRkODAtYjEwYi0yMzhkZGZkNmRmOWUiLCJlbWFpbCI6ImFudXAyNTExMTk4NkBnbWFpbC5jb20iLCJzdXBlcnVzZXIiOnRydWUsImFkbWluIjpmYWxzZSwiaWQiOjIsImFkZGVkX2J5IjoiIiwib3JnYW5pemF0aW9uX3V1aWQiOiIwMDkxNGNmMC00ZGMwLTRmYWQtYTIzYS0wMzg1ZDYwNDU3MTUiLCJvcmdhbml6YXRpb25fbmFtZSI6IlZSUXVpbiBwdnQgbHRkIiwidG90YWxfYWRtaW5zIjozLCJ0b3RhbF9kZXZpY2VzIjo3LCJ2aWRlb3NfYXNzaWduZWRfZGV2aWNlcyI6MCwidG90YWxfdmlkZW9zIjoxfX0=','2020-10-10 08:49:55.762254'),('d9ct6qvxi8bblwuqmu3jtzw3ams3ak89','YzQzZTQwZDI3ODdiNzQ5NTlkN2FkMzM0ZDU5NTU0NThlM2FjNzlmYjp7InZycXVpbiI6eyJyZWZyZXNoIjoiZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6STFOaUo5LmV5SjBiMnRsYmw5MGVYQmxJam9pY21WbWNtVnphQ0lzSW1WNGNDSTZNVFl3TVRFNU5UZzVPQ3dpYW5ScElqb2lNamM0WVdFNVlqVmlaRGsxTkRSallqbGlaRFZrWVRSaFlUZzRPR00xT1RjaUxDSjFjMlZ5WDJsa0lqb3lMQ0oxYzJWeUlqb2lkbkp4ZFdsdUlpd2ljM1Z3WlhKMWMyVnlJanAwY25WbExDSmhaRzFwYmlJNlptRnNjMlVzSW05eVoyRnVhWHBoZEdsdmJsOTFkV2xrSWpvaU1EQTVNVFJqWmpBdE5HUmpNQzAwWm1Ga0xXRXlNMkV0TURNNE5XUTJNRFExTnpFMUluMC41THUteG90UkItUjlwa2w5aURGanlSamU3RjU2SkFHQUhxR2prMTZXU2FjIiwiYWNjZXNzIjoiZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6STFOaUo5LmV5SjBiMnRsYmw5MGVYQmxJam9pWVdOalpYTnpJaXdpWlhod0lqb3hOakF4TnpFME1qazRMQ0pxZEdraU9pSTVPR1l5TVRrNU16SmlNbVEwTkRZMVlUTXpabUl4T1dKaE4ySXhNemd5WXlJc0luVnpaWEpmYVdRaU9qSXNJblZ6WlhJaU9pSjJjbkYxYVc0aUxDSnpkWEJsY25WelpYSWlPblJ5ZFdVc0ltRmtiV2x1SWpwbVlXeHpaU3dpYjNKbllXNXBlbUYwYVc5dVgzVjFhV1FpT2lJd01Ea3hOR05tTUMwMFpHTXdMVFJtWVdRdFlUSXpZUzB3TXpnMVpEWXdORFUzTVRVaWZRLm45Z3VETFlGcXJjZ1RrTE5jZUNoNHFrZTBuS05MX1YtS3JId3lNUWxOdFkiLCJ1c2VyIjoidnJxdWluIiwidG9waWMiOiJWUlF1aW4gcHZ0IGx0ZC8yMDIwLTA5LTIyIDA4OjI2OjUwLjQwNDM0Ny8yZmIwMTgyZi1iMjU1LTRkODAtYjEwYi0yMzhkZGZkNmRmOWUiLCJlbWFpbCI6ImFudXAyNTExMTk4NkBnbWFpbC5jb20iLCJzdXBlcnVzZXIiOnRydWUsImFkbWluIjpmYWxzZSwiaWQiOjIsImFkZGVkX2J5IjoiIiwib3JnYW5pemF0aW9uX3V1aWQiOiIwMDkxNGNmMC00ZGMwLTRmYWQtYTIzYS0wMzg1ZDYwNDU3MTUiLCJvcmdhbml6YXRpb25fbmFtZSI6IlZSUXVpbiBwdnQgbHRkIiwidG90YWxfYWRtaW5zIjozLCJ0b3RhbF9kZXZpY2VzIjo3LCJ2aWRlb3NfYXNzaWduZWRfZGV2aWNlcyI6MH19','2020-10-10 08:38:18.678532'),('dl2lrbukxlytjp46o3a4uamk287wxaj6','MTlmYzMwMjhhZjEzMzc3YThhODAzNjExODExNzExMzI5YjczMjgwYzp7InZycXVpbiI6eyJyZWZyZXNoIjoiZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6STFOaUo5LmV5SjBiMnRsYmw5MGVYQmxJam9pY21WbWNtVnphQ0lzSW1WNGNDSTZNVFl3TVRFNU5UY3lPQ3dpYW5ScElqb2lOekUzTVRrNFpqbGtaR1ExTkRsaE16aGtaREUyT1RBNE1qWXhNak00T0RnaUxDSjFjMlZ5WDJsa0lqb3lMQ0oxYzJWeUlqb2lkbkp4ZFdsdUlpd2ljM1Z3WlhKMWMyVnlJanAwY25WbExDSmhaRzFwYmlJNlptRnNjMlVzSW05eVoyRnVhWHBoZEdsdmJsOTFkV2xrSWpvaU1EQTVNVFJqWmpBdE5HUmpNQzAwWm1Ga0xXRXlNMkV0TURNNE5XUTJNRFExTnpFMUluMC5lWU1YbjBpUDFfblFlc3BMRExHVTA4RkE1Y0lPdzlmR1U3eDZ6VVRiZTZvIiwiYWNjZXNzIjoiZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6STFOaUo5LmV5SjBiMnRsYmw5MGVYQmxJam9pWVdOalpYTnpJaXdpWlhod0lqb3hOakF4TnpFME1USTRMQ0pxZEdraU9pSTFabVJtTWpkaU1UTmpNVE0wT1RFNU9EVTFaV1JtWm1FeU9HVTFZalZpTnlJc0luVnpaWEpmYVdRaU9qSXNJblZ6WlhJaU9pSjJjbkYxYVc0aUxDSnpkWEJsY25WelpYSWlPblJ5ZFdVc0ltRmtiV2x1SWpwbVlXeHpaU3dpYjNKbllXNXBlbUYwYVc5dVgzVjFhV1FpT2lJd01Ea3hOR05tTUMwMFpHTXdMVFJtWVdRdFlUSXpZUzB3TXpnMVpEWXdORFUzTVRVaWZRLkF1WXlHR19TYk5pcHo3Q2JUZUJ5QjZCOVhzemdHWkF5c3U1bjZsYjRwODQiLCJ1c2VyIjoidnJxdWluIiwidG9waWMiOiJWUlF1aW4gcHZ0IGx0ZC8yMDIwLTA5LTIyIDA4OjI2OjUwLjQwNDM0Ny8yZmIwMTgyZi1iMjU1LTRkODAtYjEwYi0yMzhkZGZkNmRmOWUiLCJlbWFpbCI6ImFudXAyNTExMTk4NkBnbWFpbC5jb20iLCJzdXBlcnVzZXIiOnRydWUsImFkbWluIjpmYWxzZSwiaWQiOjIsImFkZGVkX2J5IjoiIiwib3JnYW5pemF0aW9uX3V1aWQiOiIwMDkxNGNmMC00ZGMwLTRmYWQtYTIzYS0wMzg1ZDYwNDU3MTUiLCJvcmdhbml6YXRpb25fbmFtZSI6IlZSUXVpbiBwdnQgbHRkIiwidG90YWxfYWRtaW5zIjozLCJ0b3RhbF9kZXZpY2VzIjo3LCJ2aWRlb3NfYXNzaWduZWRfZGV2aWNlcyI6MTAwfX0=','2020-10-10 08:35:28.466879'),('i20403l9xoxbbuyfz6ql947ci7v2vk30','YWM0NTg2MTFhMjQ2NTQ2YmZlMTRiNmM5MmY2YjNjMDM1MjYxY2Q2OTp7InZycXVpbiI6InZycXVpbiJ9','2020-10-10 07:43:31.551265'),('ihnf6fq4n8pupqazck3kie8iqf2n3zf2','MGY4MmZhNjMwZTlhMGY1MjQ3OTAyMjM2ODRjN2NmMTcwNTJjNmQ3Njp7InZycXVpbiI6eyJyZWZyZXNoIjoiZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6STFOaUo5LmV5SjBiMnRsYmw5MGVYQmxJam9pY21WbWNtVnphQ0lzSW1WNGNDSTZNVFl3TVRFNU5UZ3dNQ3dpYW5ScElqb2lPVFk0Tmpsak1UTTBNR001TkRJd1ltRmtOR0V4WTJVek1UVTFNV1kzWmpRaUxDSjFjMlZ5WDJsa0lqb3lMQ0oxYzJWeUlqb2lkbkp4ZFdsdUlpd2ljM1Z3WlhKMWMyVnlJanAwY25WbExDSmhaRzFwYmlJNlptRnNjMlVzSW05eVoyRnVhWHBoZEdsdmJsOTFkV2xrSWpvaU1EQTVNVFJqWmpBdE5HUmpNQzAwWm1Ga0xXRXlNMkV0TURNNE5XUTJNRFExTnpFMUluMC5pcmY1RWlsaWp6dHBlaEl4Wk9hdWE1S3ZXbk1BREtJalBPQ3F4N05aVzFzIiwiYWNjZXNzIjoiZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6STFOaUo5LmV5SjBiMnRsYmw5MGVYQmxJam9pWVdOalpYTnpJaXdpWlhod0lqb3hOakF4TnpFME1qQXdMQ0pxZEdraU9pSXdZelJoTURBeVpqWTFOV0UwTXpaa1lqTXpNVGRoTVdVNVlqSmpNemszWXlJc0luVnpaWEpmYVdRaU9qSXNJblZ6WlhJaU9pSjJjbkYxYVc0aUxDSnpkWEJsY25WelpYSWlPblJ5ZFdVc0ltRmtiV2x1SWpwbVlXeHpaU3dpYjNKbllXNXBlbUYwYVc5dVgzVjFhV1FpT2lJd01Ea3hOR05tTUMwMFpHTXdMVFJtWVdRdFlUSXpZUzB3TXpnMVpEWXdORFUzTVRVaWZRLmJGNi0yRUVCd3Y4WnNJSXF6NkEyNmkyRlFpdzk1R2VscXBITVR0Y1Z1ak0iLCJ1c2VyIjoidnJxdWluIiwidG9waWMiOiJWUlF1aW4gcHZ0IGx0ZC8yMDIwLTA5LTIyIDA4OjI2OjUwLjQwNDM0Ny8yZmIwMTgyZi1iMjU1LTRkODAtYjEwYi0yMzhkZGZkNmRmOWUiLCJlbWFpbCI6ImFudXAyNTExMTk4NkBnbWFpbC5jb20iLCJzdXBlcnVzZXIiOnRydWUsImFkbWluIjpmYWxzZSwiaWQiOjIsImFkZGVkX2J5IjoiIiwib3JnYW5pemF0aW9uX3V1aWQiOiIwMDkxNGNmMC00ZGMwLTRmYWQtYTIzYS0wMzg1ZDYwNDU3MTUiLCJvcmdhbml6YXRpb25fbmFtZSI6IlZSUXVpbiBwdnQgbHRkIiwidG90YWxfYWRtaW5zIjozLCJ0b3RhbF9kZXZpY2VzIjo3LCJ2aWRlb3NfYXNzaWduZWRfZGV2aWNlcyI6MH19','2020-10-10 08:36:40.290681'),('ju6bab5te4aszi5vwsyqy9v0jdtk8deg','ZGYwYTcxYWY4NzI5ZWE5ZGNiZDZkMjYxZmI2NzExODU1MDg4ZDg3Mzp7InZycXVpbiI6eyJyZWZyZXNoIjoiZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6STFOaUo5LmV5SjBiMnRsYmw5MGVYQmxJam9pY21WbWNtVnphQ0lzSW1WNGNDSTZNVFl3TVRFNU1qWTNNQ3dpYW5ScElqb2laREpoWWpKaFkyVm1Zek5rTkRKbE9UazRaakkwTXpJMFpXRXhOMlU0WW1FaUxDSjFjMlZ5WDJsa0lqb3lMQ0oxYzJWeUlqb2lkbkp4ZFdsdUlpd2ljM1Z3WlhKMWMyVnlJanAwY25WbExDSmhaRzFwYmlJNlptRnNjMlVzSW05eVoyRnVhWHBoZEdsdmJsOTFkV2xrSWpvaU1EQTVNVFJqWmpBdE5HUmpNQzAwWm1Ga0xXRXlNMkV0TURNNE5XUTJNRFExTnpFMUluMC41N3BTbjhUSGlteWlzZEE4UGgzeTJQSVdsUXVnYWFrSlFjdERoMGtTRXdnIiwiYWNjZXNzIjoiZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6STFOaUo5LmV5SjBiMnRsYmw5MGVYQmxJam9pWVdOalpYTnpJaXdpWlhod0lqb3hOakF4TnpFeE1EY3dMQ0pxZEdraU9pSTBNMlZtTW1Fd1kyUTNNRGswTUdZeVlUUTNNakEwT0RFM01XWmpZalJtWVNJc0luVnpaWEpmYVdRaU9qSXNJblZ6WlhJaU9pSjJjbkYxYVc0aUxDSnpkWEJsY25WelpYSWlPblJ5ZFdVc0ltRmtiV2x1SWpwbVlXeHpaU3dpYjNKbllXNXBlbUYwYVc5dVgzVjFhV1FpT2lJd01Ea3hOR05tTUMwMFpHTXdMVFJtWVdRdFlUSXpZUzB3TXpnMVpEWXdORFUzTVRVaWZRLk55QXVvMTlCRUVQMlU1MEF5NVNzajJ5Tm9ycGVTdHA1T1JVeS1Cb0E1cHMiLCJ1c2VyIjoidnJxdWluIiwidG9waWMiOiJWUlF1aW4gcHZ0IGx0ZC8yMDIwLTA5LTIyIDA4OjI2OjUwLjQwNDM0Ny8yZmIwMTgyZi1iMjU1LTRkODAtYjEwYi0yMzhkZGZkNmRmOWUiLCJlbWFpbCI6ImFudXAyNTExMTk4NkBnbWFpbC5jb20iLCJzdXBlcnVzZXIiOnRydWUsImFkbWluIjpmYWxzZSwiaWQiOjIsImFkZGVkX2J5IjoiIiwib3JnYW5pemF0aW9uX3V1aWQiOiIwMDkxNGNmMC00ZGMwLTRmYWQtYTIzYS0wMzg1ZDYwNDU3MTUiLCJvcmdhbml6YXRpb25fbmFtZSI6IlZSUXVpbiBwdnQgbHRkIn19','2020-10-10 07:44:30.740484'),('jv3vfih0qqg6iocq9k5g1u213clfjj8r','ODhjMTQxM2QxMGI5MDcyNjYzNzEzYWQ1MjU2ZjE3YzI3ZjQyMGMwYTp7InZycXVpbiI6eyJyZWZyZXNoIjoiZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6STFOaUo5LmV5SjBiMnRsYmw5MGVYQmxJam9pY21WbWNtVnphQ0lzSW1WNGNDSTZNVFl3TVRFNU5ERTBOU3dpYW5ScElqb2lOemsyWmpKbVlUUmhabVkxTkRZNU9XRmpNV00xTmprNVpEZ3lOemMxT0dZaUxDSjFjMlZ5WDJsa0lqb3lMQ0oxYzJWeUlqb2lkbkp4ZFdsdUlpd2ljM1Z3WlhKMWMyVnlJanAwY25WbExDSmhaRzFwYmlJNlptRnNjMlVzSW05eVoyRnVhWHBoZEdsdmJsOTFkV2xrSWpvaU1EQTVNVFJqWmpBdE5HUmpNQzAwWm1Ga0xXRXlNMkV0TURNNE5XUTJNRFExTnpFMUluMC42UVRFWlgydW9HM01KTUdDQkVfOWFabExXMHdRLWREUnFaVEtWMXowbmRjIiwiYWNjZXNzIjoiZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6STFOaUo5LmV5SjBiMnRsYmw5MGVYQmxJam9pWVdOalpYTnpJaXdpWlhod0lqb3hOakF4TnpFeU5UUTFMQ0pxZEdraU9pSXhNak0xWXpoak0yTm1NVEUwTm1JM09EUTJZV1EwWldVMU1XTTFOakppWkNJc0luVnpaWEpmYVdRaU9qSXNJblZ6WlhJaU9pSjJjbkYxYVc0aUxDSnpkWEJsY25WelpYSWlPblJ5ZFdVc0ltRmtiV2x1SWpwbVlXeHpaU3dpYjNKbllXNXBlbUYwYVc5dVgzVjFhV1FpT2lJd01Ea3hOR05tTUMwMFpHTXdMVFJtWVdRdFlUSXpZUzB3TXpnMVpEWXdORFUzTVRVaWZRLllsT2NOQnBjUnFzUVFxd2RwbGtGTGRWVHRVUnFYcXc4YmRpMU14WnVMdzQiLCJ1c2VyIjoidnJxdWluIiwidG9waWMiOiJWUlF1aW4gcHZ0IGx0ZC8yMDIwLTA5LTIyIDA4OjI2OjUwLjQwNDM0Ny8yZmIwMTgyZi1iMjU1LTRkODAtYjEwYi0yMzhkZGZkNmRmOWUiLCJlbWFpbCI6ImFudXAyNTExMTk4NkBnbWFpbC5jb20iLCJzdXBlcnVzZXIiOnRydWUsImFkbWluIjpmYWxzZSwiaWQiOjIsImFkZGVkX2J5IjoiIiwib3JnYW5pemF0aW9uX3V1aWQiOiIwMDkxNGNmMC00ZGMwLTRmYWQtYTIzYS0wMzg1ZDYwNDU3MTUiLCJvcmdhbml6YXRpb25fbmFtZSI6IlZSUXVpbiBwdnQgbHRkIn19','2020-10-10 08:09:05.388350'),('m2x2d6bqwbd4305e0r92pcqs07qzxa5b','MDIxMjc4ZmQ3NGJlMWJhOGM5NjI5NWQ5MjhkMWU2OTFlMmI1NmQzMzp7InZycXVpbiI6eyJyZWZyZXNoIjoiZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6STFOaUo5LmV5SjBiMnRsYmw5MGVYQmxJam9pY21WbWNtVnphQ0lzSW1WNGNDSTZNVFl3TVRFNU16TXlOaXdpYW5ScElqb2lObVppWldFd016QmxaR1poTkRCak0yRXlabUkzTkRRM1pUSmhNVGcyT0RVaUxDSjFjMlZ5WDJsa0lqb3lMQ0oxYzJWeUlqb2lkbkp4ZFdsdUlpd2ljM1Z3WlhKMWMyVnlJanAwY25WbExDSmhaRzFwYmlJNlptRnNjMlVzSW05eVoyRnVhWHBoZEdsdmJsOTFkV2xrSWpvaU1EQTVNVFJqWmpBdE5HUmpNQzAwWm1Ga0xXRXlNMkV0TURNNE5XUTJNRFExTnpFMUluMC5OU1RUSTNSeWRmVjlrV3NxZ3FJaDVpZ296a29zRlk0clBiWnFVbUpJQ2JFIiwiYWNjZXNzIjoiZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6STFOaUo5LmV5SjBiMnRsYmw5MGVYQmxJam9pWVdOalpYTnpJaXdpWlhod0lqb3hOakF4TnpFeE56STJMQ0pxZEdraU9pSTBZalJtWXpCa1lqRTFNRFEwWVRZMVlqZ3lPREJqTlRFek1HVmxNV0l6WlNJc0luVnpaWEpmYVdRaU9qSXNJblZ6WlhJaU9pSjJjbkYxYVc0aUxDSnpkWEJsY25WelpYSWlPblJ5ZFdVc0ltRmtiV2x1SWpwbVlXeHpaU3dpYjNKbllXNXBlbUYwYVc5dVgzVjFhV1FpT2lJd01Ea3hOR05tTUMwMFpHTXdMVFJtWVdRdFlUSXpZUzB3TXpnMVpEWXdORFUzTVRVaWZRLnhPc2UwY0pibFFpMzExRWlmS1B5bzBqaDFFMnB1cUJTMHNJYXBOVjJ0MmMiLCJ1c2VyIjoidnJxdWluIiwidG9waWMiOiJWUlF1aW4gcHZ0IGx0ZC8yMDIwLTA5LTIyIDA4OjI2OjUwLjQwNDM0Ny8yZmIwMTgyZi1iMjU1LTRkODAtYjEwYi0yMzhkZGZkNmRmOWUiLCJlbWFpbCI6ImFudXAyNTExMTk4NkBnbWFpbC5jb20iLCJzdXBlcnVzZXIiOnRydWUsImFkbWluIjpmYWxzZSwiaWQiOjIsImFkZGVkX2J5IjoiIiwib3JnYW5pemF0aW9uX3V1aWQiOiIwMDkxNGNmMC00ZGMwLTRmYWQtYTIzYS0wMzg1ZDYwNDU3MTUiLCJvcmdhbml6YXRpb25fbmFtZSI6IlZSUXVpbiBwdnQgbHRkIn19','2020-10-10 07:55:26.674623'),('m8sce6z2s0k2k9wn33x6rlhiablalggw','NjgyYjE5OWZjNmQwOWViZGM4M2MzYjdlZTI0Y2E4MGFlYmZhYjVhYjp7InZycXVpbiI6eyJyZWZyZXNoIjoiZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6STFOaUo5LmV5SjBiMnRsYmw5MGVYQmxJam9pY21WbWNtVnphQ0lzSW1WNGNDSTZNVFl3TVRFNU5UYzJNaXdpYW5ScElqb2lOMll6WTJJM01HSTFPV0kwTkdSaFpUazBOMk0wTVdFeU16Wm1NalEzTVdFaUxDSjFjMlZ5WDJsa0lqb3lMQ0oxYzJWeUlqb2lkbkp4ZFdsdUlpd2ljM1Z3WlhKMWMyVnlJanAwY25WbExDSmhaRzFwYmlJNlptRnNjMlVzSW05eVoyRnVhWHBoZEdsdmJsOTFkV2xrSWpvaU1EQTVNVFJqWmpBdE5HUmpNQzAwWm1Ga0xXRXlNMkV0TURNNE5XUTJNRFExTnpFMUluMC5qeXk0S3ZicFN5b2Y1Z1ZqVFM5TGJvVnN6LWFWSmVXX2FCV19wWEwyaWt3IiwiYWNjZXNzIjoiZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6STFOaUo5LmV5SjBiMnRsYmw5MGVYQmxJam9pWVdOalpYTnpJaXdpWlhod0lqb3hOakF4TnpFME1UWXlMQ0pxZEdraU9pSXhOems0WmpaaVlqQTBaRGswTWprd1lUVmpPVGhqWkRJME5ESmtaalE0TUNJc0luVnpaWEpmYVdRaU9qSXNJblZ6WlhJaU9pSjJjbkYxYVc0aUxDSnpkWEJsY25WelpYSWlPblJ5ZFdVc0ltRmtiV2x1SWpwbVlXeHpaU3dpYjNKbllXNXBlbUYwYVc5dVgzVjFhV1FpT2lJd01Ea3hOR05tTUMwMFpHTXdMVFJtWVdRdFlUSXpZUzB3TXpnMVpEWXdORFUzTVRVaWZRLnRwaXhaV3lTaWdZTWN3bFJvaFNiYmc3Nms4Q0ttY3dQVkhHRmNHcC0yMjQiLCJ1c2VyIjoidnJxdWluIiwidG9waWMiOiJWUlF1aW4gcHZ0IGx0ZC8yMDIwLTA5LTIyIDA4OjI2OjUwLjQwNDM0Ny8yZmIwMTgyZi1iMjU1LTRkODAtYjEwYi0yMzhkZGZkNmRmOWUiLCJlbWFpbCI6ImFudXAyNTExMTk4NkBnbWFpbC5jb20iLCJzdXBlcnVzZXIiOnRydWUsImFkbWluIjpmYWxzZSwiaWQiOjIsImFkZGVkX2J5IjoiIiwib3JnYW5pemF0aW9uX3V1aWQiOiIwMDkxNGNmMC00ZGMwLTRmYWQtYTIzYS0wMzg1ZDYwNDU3MTUiLCJvcmdhbml6YXRpb25fbmFtZSI6IlZSUXVpbiBwdnQgbHRkIiwidG90YWxfYWRtaW5zIjozLCJ0b3RhbF9kZXZpY2VzIjo3LCJ2aWRlb3NfYXNzaWduZWRfZGV2aWNlcyI6MH19','2020-10-10 08:36:02.205344'),('n73w5zn9ksstm1ydgxmlaxe8280uyjwc','NjEyNzViODFlMDU4MGM5MDZkN2FlNjc0NmVkODUwYzg4MWFmYjFlNDp7InZycXVpbiI6eyJyZWZyZXNoIjoiZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6STFOaUo5LmV5SjBiMnRsYmw5MGVYQmxJam9pY21WbWNtVnphQ0lzSW1WNGNDSTZNVFl3TVRFNU5qRTRPQ3dpYW5ScElqb2lPV1JtTmpVeE5qaGpPV1ExTkRGa05HRXhNMlZrT0Rrek0yRTFOR0ZpTURJaUxDSjFjMlZ5WDJsa0lqb3lMQ0oxYzJWeUlqb2lkbkp4ZFdsdUlpd2ljM1Z3WlhKMWMyVnlJanAwY25WbExDSmhaRzFwYmlJNlptRnNjMlVzSW05eVoyRnVhWHBoZEdsdmJsOTFkV2xrSWpvaU1EQTVNVFJqWmpBdE5HUmpNQzAwWm1Ga0xXRXlNMkV0TURNNE5XUTJNRFExTnpFMUluMC5kOEFsZGh2YmR1Q1FuUWhDWXNNbUxFZ25FYkxMNXRPR0Fkc19MWl95WXFzIiwiYWNjZXNzIjoiZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6STFOaUo5LmV5SjBiMnRsYmw5MGVYQmxJam9pWVdOalpYTnpJaXdpWlhod0lqb3hOakF4TnpFME5UZzRMQ0pxZEdraU9pSXlNMll4WWpjek9ETmpOR1EwT1RabVlUSTNPR00zTkdVeVltSTNaalJpWkNJc0luVnpaWEpmYVdRaU9qSXNJblZ6WlhJaU9pSjJjbkYxYVc0aUxDSnpkWEJsY25WelpYSWlPblJ5ZFdVc0ltRmtiV2x1SWpwbVlXeHpaU3dpYjNKbllXNXBlbUYwYVc5dVgzVjFhV1FpT2lJd01Ea3hOR05tTUMwMFpHTXdMVFJtWVdRdFlUSXpZUzB3TXpnMVpEWXdORFUzTVRVaWZRLkw1ZFYyOTM2d0pST1c4a1ZuTXQ4NTlOOWFicllqdFJuQWxwOEpfVkMzelUiLCJ1c2VyIjoidnJxdWluIiwidG9waWMiOiJWUlF1aW4gcHZ0IGx0ZC8yMDIwLTA5LTIyIDA4OjI2OjUwLjQwNDM0Ny8yZmIwMTgyZi1iMjU1LTRkODAtYjEwYi0yMzhkZGZkNmRmOWUiLCJlbWFpbCI6ImFudXAyNTExMTk4NkBnbWFpbC5jb20iLCJzdXBlcnVzZXIiOnRydWUsImFkbWluIjpmYWxzZSwiaWQiOjIsImFkZGVkX2J5IjoiIiwib3JnYW5pemF0aW9uX3V1aWQiOiIwMDkxNGNmMC00ZGMwLTRmYWQtYTIzYS0wMzg1ZDYwNDU3MTUiLCJvcmdhbml6YXRpb25fbmFtZSI6IlZSUXVpbiBwdnQgbHRkIiwidG90YWxfYWRtaW5zIjozLCJ0b3RhbF9kZXZpY2VzIjo3LCJ2aWRlb3NfYXNzaWduZWRfZGV2aWNlcyI6MCwidG90YWxfdmlkZW9zIjoxfX0=','2020-10-10 08:43:08.963031'),('n79qqmmxy8kes538icg2fz471rdhah9o','Mjk2MWIwYTI5OTk1YzJlNzVjZDI5ZGUzN2U2YTAyNzY5YjFkYTMwZjp7InZycXVpbiI6eyJyZWZyZXNoIjoiZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6STFOaUo5LmV5SjBiMnRsYmw5MGVYQmxJam9pY21WbWNtVnphQ0lzSW1WNGNDSTZNVFl3TVRFNU56VTVNQ3dpYW5ScElqb2lOakJpTWpZM05XVmpOR1E0TkRZNU16aGlZMlUyT0dZMlltVmxaV00wTjJNaUxDSjFjMlZ5WDJsa0lqb3lMQ0oxYzJWeUlqb2lkbkp4ZFdsdUlpd2ljM1Z3WlhKMWMyVnlJanAwY25WbExDSmhaRzFwYmlJNlptRnNjMlVzSW05eVoyRnVhWHBoZEdsdmJsOTFkV2xrSWpvaU1EQTVNVFJqWmpBdE5HUmpNQzAwWm1Ga0xXRXlNMkV0TURNNE5XUTJNRFExTnpFMUluMC42VjBRUDBBZ013blZXeUtVZmkzemhEUTkzbDZwMjdkUFFpV3BhWFp6TnFnIiwiYWNjZXNzIjoiZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6STFOaUo5LmV5SjBiMnRsYmw5MGVYQmxJam9pWVdOalpYTnpJaXdpWlhod0lqb3hOakF4TnpFMU9Ua3dMQ0pxZEdraU9pSmxNamxpTjJKbE0yTXdPR1kwT1RkbE9UZzNaV0kyWkdFNE1XUTRZMk5oWkNJc0luVnpaWEpmYVdRaU9qSXNJblZ6WlhJaU9pSjJjbkYxYVc0aUxDSnpkWEJsY25WelpYSWlPblJ5ZFdVc0ltRmtiV2x1SWpwbVlXeHpaU3dpYjNKbllXNXBlbUYwYVc5dVgzVjFhV1FpT2lJd01Ea3hOR05tTUMwMFpHTXdMVFJtWVdRdFlUSXpZUzB3TXpnMVpEWXdORFUzTVRVaWZRLmdUby1ETlVjRHRZS09SNFlKRU9uNy03Mmd5RVpNOE5RdlJJTTd5S0JyWW8iLCJ1c2VyIjoidnJxdWluIiwidG9waWMiOiJWUlF1aW4gcHZ0IGx0ZC8yMDIwLTA5LTIyIDA4OjI2OjUwLjQwNDM0Ny8yZmIwMTgyZi1iMjU1LTRkODAtYjEwYi0yMzhkZGZkNmRmOWUiLCJlbWFpbCI6ImFudXAyNTExMTk4NkBnbWFpbC5jb20iLCJzdXBlcnVzZXIiOnRydWUsImFkbWluIjpmYWxzZSwiaWQiOjIsImFkZGVkX2J5IjoiIiwib3JnYW5pemF0aW9uX3V1aWQiOiIwMDkxNGNmMC00ZGMwLTRmYWQtYTIzYS0wMzg1ZDYwNDU3MTUiLCJvcmdhbml6YXRpb25fbmFtZSI6IlZSUXVpbiBwdnQgbHRkIiwidG90YWxfYWRtaW5zIjozLCJ0b3RhbF9kZXZpY2VzIjo3LCJ2aWRlb3NfYXNzaWduZWRfZGV2aWNlcyI6MCwidG90YWxfdmlkZW9zIjoxfX0=','2020-10-10 09:06:30.375744'),('obizh2pghqdh47lgerm2vgh9f82gposd','OTczZDIyODBlM2U2YWJlOWEzMzA1ZjI0ZmFiNDM1ZWE4NGZmMzA2Mjp7InZycXVpbiI6eyJyZWZyZXNoIjoiZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6STFOaUo5LmV5SjBiMnRsYmw5MGVYQmxJam9pY21WbWNtVnphQ0lzSW1WNGNDSTZNVFl3TVRFNU5UUXlNU3dpYW5ScElqb2lPREE0TkdVME5ESmtOalpsTkRWak1qazROakZqT1dNNVlqbG1PREl4TmpnaUxDSjFjMlZ5WDJsa0lqb3lMQ0oxYzJWeUlqb2lkbkp4ZFdsdUlpd2ljM1Z3WlhKMWMyVnlJanAwY25WbExDSmhaRzFwYmlJNlptRnNjMlVzSW05eVoyRnVhWHBoZEdsdmJsOTFkV2xrSWpvaU1EQTVNVFJqWmpBdE5HUmpNQzAwWm1Ga0xXRXlNMkV0TURNNE5XUTJNRFExTnpFMUluMC5uOUdIMGFPTjh2LW54ME83WkFVMllxUXJuX0ltMWFVSEc3MEw2RGE2MzFBIiwiYWNjZXNzIjoiZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6STFOaUo5LmV5SjBiMnRsYmw5MGVYQmxJam9pWVdOalpYTnpJaXdpWlhod0lqb3hOakF4TnpFek9ESXhMQ0pxZEdraU9pSmlNMk5qT0RBd1lURmhZMlUwTWpreE9XTTROems1TlRRMk1HUXhNalk1TmlJc0luVnpaWEpmYVdRaU9qSXNJblZ6WlhJaU9pSjJjbkYxYVc0aUxDSnpkWEJsY25WelpYSWlPblJ5ZFdVc0ltRmtiV2x1SWpwbVlXeHpaU3dpYjNKbllXNXBlbUYwYVc5dVgzVjFhV1FpT2lJd01Ea3hOR05tTUMwMFpHTXdMVFJtWVdRdFlUSXpZUzB3TXpnMVpEWXdORFUzTVRVaWZRLkNfbVR5N0NtaEpFaEJTNEZLcXFuRzVzdHJCYVdBdVlXZUVvNDJZclNlRmsiLCJ1c2VyIjoidnJxdWluIiwidG9waWMiOiJWUlF1aW4gcHZ0IGx0ZC8yMDIwLTA5LTIyIDA4OjI2OjUwLjQwNDM0Ny8yZmIwMTgyZi1iMjU1LTRkODAtYjEwYi0yMzhkZGZkNmRmOWUiLCJlbWFpbCI6ImFudXAyNTExMTk4NkBnbWFpbC5jb20iLCJzdXBlcnVzZXIiOnRydWUsImFkbWluIjpmYWxzZSwiaWQiOjIsImFkZGVkX2J5IjoiIiwib3JnYW5pemF0aW9uX3V1aWQiOiIwMDkxNGNmMC00ZGMwLTRmYWQtYTIzYS0wMzg1ZDYwNDU3MTUiLCJvcmdhbml6YXRpb25fbmFtZSI6IlZSUXVpbiBwdnQgbHRkIiwidG90YWxfYWRtaW5zIjozLCJ0b3RhbF9kZXZpY2VzIjo3fX0=','2020-10-10 08:30:21.944423'),('q8gmi35z05tlx6yovkpi8hrn7ttljhwb','NDU4YWI5ZWM3ZjE4OTg5NGIxOTliNGQ1NTBjNjYxOTgyMTUyNmVlODp7InZycXVpbiI6eyJyZWZyZXNoIjoiZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6STFOaUo5LmV5SjBiMnRsYmw5MGVYQmxJam9pY21WbWNtVnphQ0lzSW1WNGNDSTZNVFl3TVRFNU16Y3lNU3dpYW5ScElqb2lZMlEyTXpsak1EbGpPRGN6TkRBM05XRmxZVFV6T1dVME9EWTJObVprWkRBaUxDSjFjMlZ5WDJsa0lqb3lMQ0oxYzJWeUlqb2lkbkp4ZFdsdUlpd2ljM1Z3WlhKMWMyVnlJanAwY25WbExDSmhaRzFwYmlJNlptRnNjMlVzSW05eVoyRnVhWHBoZEdsdmJsOTFkV2xrSWpvaU1EQTVNVFJqWmpBdE5HUmpNQzAwWm1Ga0xXRXlNMkV0TURNNE5XUTJNRFExTnpFMUluMC51Yy0yRnZvQy1JMm1xYkRKRW1xUkIyYmNUY2Vld21YTzlSUkpPcGQ5SWw0IiwiYWNjZXNzIjoiZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6STFOaUo5LmV5SjBiMnRsYmw5MGVYQmxJam9pWVdOalpYTnpJaXdpWlhod0lqb3hOakF4TnpFeU1USXhMQ0pxZEdraU9pSXhOVFl5TmpNNE5qazFPRGswTmpKbU9XTXhOVGd4T0RNeFlXUTNPRGsyTlNJc0luVnpaWEpmYVdRaU9qSXNJblZ6WlhJaU9pSjJjbkYxYVc0aUxDSnpkWEJsY25WelpYSWlPblJ5ZFdVc0ltRmtiV2x1SWpwbVlXeHpaU3dpYjNKbllXNXBlbUYwYVc5dVgzVjFhV1FpT2lJd01Ea3hOR05tTUMwMFpHTXdMVFJtWVdRdFlUSXpZUzB3TXpnMVpEWXdORFUzTVRVaWZRLm9qOEN3dFdPTjZPUDNsdFBLZ0ZrWm0tWmJidS1OeWVNSVBZUlR6ZndPY0kiLCJ1c2VyIjoidnJxdWluIiwidG9waWMiOiJWUlF1aW4gcHZ0IGx0ZC8yMDIwLTA5LTIyIDA4OjI2OjUwLjQwNDM0Ny8yZmIwMTgyZi1iMjU1LTRkODAtYjEwYi0yMzhkZGZkNmRmOWUiLCJlbWFpbCI6ImFudXAyNTExMTk4NkBnbWFpbC5jb20iLCJzdXBlcnVzZXIiOnRydWUsImFkbWluIjpmYWxzZSwiaWQiOjIsImFkZGVkX2J5IjoiIiwib3JnYW5pemF0aW9uX3V1aWQiOiIwMDkxNGNmMC00ZGMwLTRmYWQtYTIzYS0wMzg1ZDYwNDU3MTUiLCJvcmdhbml6YXRpb25fbmFtZSI6IlZSUXVpbiBwdnQgbHRkIn19','2020-10-10 08:02:01.164306'),('t3hd2fw1q9cuppd215z1ecyt65gnf04r','YjE2YTAwNTgyY2NmMTc5NzhkOWQxMDk0MjAyMTY2ZmM3MDJmYWZiMDp7InZycXVpbiI6eyJyZWZyZXNoIjoiZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6STFOaUo5LmV5SjBiMnRsYmw5MGVYQmxJam9pY21WbWNtVnphQ0lzSW1WNGNDSTZNVFl3TVRFNU56VXhNeXdpYW5ScElqb2lNelV6TjJReVpHSXlOelEzTkRWaU9HSmxOekkxTWpSbE9UazBZMkkxTkRNaUxDSjFjMlZ5WDJsa0lqb3lMQ0oxYzJWeUlqb2lkbkp4ZFdsdUlpd2ljM1Z3WlhKMWMyVnlJanAwY25WbExDSmhaRzFwYmlJNlptRnNjMlVzSW05eVoyRnVhWHBoZEdsdmJsOTFkV2xrSWpvaU1EQTVNVFJqWmpBdE5HUmpNQzAwWm1Ga0xXRXlNMkV0TURNNE5XUTJNRFExTnpFMUluMC5rZm41anZXMmxHUERQY2xkLTczYnNtcTVJMFNzdnZBOEwwelJHaUhRcTYwIiwiYWNjZXNzIjoiZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6STFOaUo5LmV5SjBiMnRsYmw5MGVYQmxJam9pWVdOalpYTnpJaXdpWlhod0lqb3hOakF4TnpFMU9URXpMQ0pxZEdraU9pSmlaakE0WXpWa01EQmhZalEwTXpobVlqRmtOV05qTmpoalkyTTNaamxoWmlJc0luVnpaWEpmYVdRaU9qSXNJblZ6WlhJaU9pSjJjbkYxYVc0aUxDSnpkWEJsY25WelpYSWlPblJ5ZFdVc0ltRmtiV2x1SWpwbVlXeHpaU3dpYjNKbllXNXBlbUYwYVc5dVgzVjFhV1FpT2lJd01Ea3hOR05tTUMwMFpHTXdMVFJtWVdRdFlUSXpZUzB3TXpnMVpEWXdORFUzTVRVaWZRLlo2T1VyZkRreks4cy1jRWxKSUdNd3BYclRJbVFXY3UtWnZrakJVWW5tNkUiLCJ1c2VyIjoidnJxdWluIiwidG9waWMiOiJWUlF1aW4gcHZ0IGx0ZC8yMDIwLTA5LTIyIDA4OjI2OjUwLjQwNDM0Ny8yZmIwMTgyZi1iMjU1LTRkODAtYjEwYi0yMzhkZGZkNmRmOWUiLCJlbWFpbCI6ImFudXAyNTExMTk4NkBnbWFpbC5jb20iLCJzdXBlcnVzZXIiOnRydWUsImFkbWluIjpmYWxzZSwiaWQiOjIsImFkZGVkX2J5IjoiIiwib3JnYW5pemF0aW9uX3V1aWQiOiIwMDkxNGNmMC00ZGMwLTRmYWQtYTIzYS0wMzg1ZDYwNDU3MTUiLCJvcmdhbml6YXRpb25fbmFtZSI6IlZSUXVpbiBwdnQgbHRkIiwidG90YWxfYWRtaW5zIjozLCJ0b3RhbF9kZXZpY2VzIjo3LCJ2aWRlb3NfYXNzaWduZWRfZGV2aWNlcyI6MCwidG90YWxfdmlkZW9zIjoxfX0=','2020-10-10 09:05:13.388252'),('td3ch8jur05l8b5x5272bz4imq66jkug','OTJmNDgxZTI4ZjJkNzE0ODk0MjBjMzBkYTI4MjIzNjEwNmI3YWM5Yjp7InZycXVpbiI6eyJyZWZyZXNoIjoiZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6STFOaUo5LmV5SjBiMnRsYmw5MGVYQmxJam9pY21WbWNtVnphQ0lzSW1WNGNDSTZNVFl3TVRFNU5UUTVPU3dpYW5ScElqb2lObVkyTldNek1EUTVNV1ppTkdSak9HRTROelF6WVdFek1qUmtNRGt4WVRRaUxDSjFjMlZ5WDJsa0lqb3lMQ0oxYzJWeUlqb2lkbkp4ZFdsdUlpd2ljM1Z3WlhKMWMyVnlJanAwY25WbExDSmhaRzFwYmlJNlptRnNjMlVzSW05eVoyRnVhWHBoZEdsdmJsOTFkV2xrSWpvaU1EQTVNVFJqWmpBdE5HUmpNQzAwWm1Ga0xXRXlNMkV0TURNNE5XUTJNRFExTnpFMUluMC5lWVpaY1M1dkJVVU0xR2dwRnVKdkVjUU93TnNLQTZZQkRYU1h3UHpVUnpBIiwiYWNjZXNzIjoiZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6STFOaUo5LmV5SjBiMnRsYmw5MGVYQmxJam9pWVdOalpYTnpJaXdpWlhod0lqb3hOakF4TnpFek9EazVMQ0pxZEdraU9pSXpORFJrWWpGa1pqZG1aREkwTVRBNU9UWmxNR05tTmpWaE56WmtaVEJoWmlJc0luVnpaWEpmYVdRaU9qSXNJblZ6WlhJaU9pSjJjbkYxYVc0aUxDSnpkWEJsY25WelpYSWlPblJ5ZFdVc0ltRmtiV2x1SWpwbVlXeHpaU3dpYjNKbllXNXBlbUYwYVc5dVgzVjFhV1FpT2lJd01Ea3hOR05tTUMwMFpHTXdMVFJtWVdRdFlUSXpZUzB3TXpnMVpEWXdORFUzTVRVaWZRLkFEVlh1T0YwNWphMXdUbTdmRjM0c2VpMUVWU2FWQ3BuZE9NMHgwWlRmcjQiLCJ1c2VyIjoidnJxdWluIiwidG9waWMiOiJWUlF1aW4gcHZ0IGx0ZC8yMDIwLTA5LTIyIDA4OjI2OjUwLjQwNDM0Ny8yZmIwMTgyZi1iMjU1LTRkODAtYjEwYi0yMzhkZGZkNmRmOWUiLCJlbWFpbCI6ImFudXAyNTExMTk4NkBnbWFpbC5jb20iLCJzdXBlcnVzZXIiOnRydWUsImFkbWluIjpmYWxzZSwiaWQiOjIsImFkZGVkX2J5IjoiIiwib3JnYW5pemF0aW9uX3V1aWQiOiIwMDkxNGNmMC00ZGMwLTRmYWQtYTIzYS0wMzg1ZDYwNDU3MTUiLCJvcmdhbml6YXRpb25fbmFtZSI6IlZSUXVpbiBwdnQgbHRkIiwidG90YWxfYWRtaW5zIjozLCJ0b3RhbF9kZXZpY2VzIjo3fX0=','2020-10-10 08:31:39.873828'),('tixrw3nas1xxz79phkltrxt26xfew124','MzI1YjBkOTRhZWVjYzA5ZjdkZTM4M2ZmMWM3N2VlMjYxNTRhMWRlODp7InZycXVpbiI6eyJyZWZyZXNoIjoiZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6STFOaUo5LmV5SjBiMnRsYmw5MGVYQmxJam9pY21WbWNtVnphQ0lzSW1WNGNDSTZNVFl3TVRFNU9EY3lPU3dpYW5ScElqb2lNV0UxTTJaak5qTTBZek15TkdGbE16aGxaRGRpWm1NNE5EQTJOVEZrT0dVaUxDSjFjMlZ5WDJsa0lqb3lMQ0oxYzJWeUlqb2lkbkp4ZFdsdUlpd2ljM1Z3WlhKMWMyVnlJanAwY25WbExDSmhaRzFwYmlJNlptRnNjMlVzSW05eVoyRnVhWHBoZEdsdmJsOTFkV2xrSWpvaU1EQTVNVFJqWmpBdE5HUmpNQzAwWm1Ga0xXRXlNMkV0TURNNE5XUTJNRFExTnpFMUluMC5KeVRqc3VXWk9TV3Zoek5MNGp6UkNjZUFwREhZckdRUEduZTVDMFl4MW1ZIiwiYWNjZXNzIjoiZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6STFOaUo5LmV5SjBiMnRsYmw5MGVYQmxJam9pWVdOalpYTnpJaXdpWlhod0lqb3hOakF4TnpFM01USTVMQ0pxZEdraU9pSXdZVGRpTW1Rek1ERTRORE0wT0RrNVlUVTBaRFF6TXpGa01qY3dPR0poTmlJc0luVnpaWEpmYVdRaU9qSXNJblZ6WlhJaU9pSjJjbkYxYVc0aUxDSnpkWEJsY25WelpYSWlPblJ5ZFdVc0ltRmtiV2x1SWpwbVlXeHpaU3dpYjNKbllXNXBlbUYwYVc5dVgzVjFhV1FpT2lJd01Ea3hOR05tTUMwMFpHTXdMVFJtWVdRdFlUSXpZUzB3TXpnMVpEWXdORFUzTVRVaWZRLnNOdmNSUnpTQ1FVMHVpeExKN3ZHYUpldHEyLW1WRGhQRXFlUkZwc3RETE0iLCJ1c2VyIjoidnJxdWluIiwidG9waWMiOiJWUlF1aW4gcHZ0IGx0ZC8yMDIwLTA5LTIyIDA4OjI2OjUwLjQwNDM0Ny8yZmIwMTgyZi1iMjU1LTRkODAtYjEwYi0yMzhkZGZkNmRmOWUiLCJlbWFpbCI6ImFudXAyNTExMTk4NkBnbWFpbC5jb20iLCJzdXBlcnVzZXIiOnRydWUsImFkbWluIjpmYWxzZSwiaWQiOjIsImFkZGVkX2J5IjoiIiwib3JnYW5pemF0aW9uX3V1aWQiOiIwMDkxNGNmMC00ZGMwLTRmYWQtYTIzYS0wMzg1ZDYwNDU3MTUiLCJvcmdhbml6YXRpb25fbmFtZSI6IlZSUXVpbiBwdnQgbHRkIiwidG90YWxfYWRtaW5zIjozLCJ0b3RhbF9kZXZpY2VzIjo3LCJ2aWRlb3NfYXNzaWduZWRfZGV2aWNlcyI6MCwidG90YWxfdmlkZW9zIjoxfX0=','2020-10-10 09:25:29.735247'),('u2wfxklz8h8xp0nynfix4qqcu4o6j210','YjM3MjdiNDU1OGVmNWQxODZlZGQ4OWI2ODNiNTM2YmE0ZDJlZTY0ZTp7InZycXVpbiI6eyJyZWZyZXNoIjoiZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6STFOaUo5LmV5SjBiMnRsYmw5MGVYQmxJam9pY21WbWNtVnphQ0lzSW1WNGNDSTZNVFl3TVRFNU5UZzFPQ3dpYW5ScElqb2lObVV5TnpNMU1tVTROVFl4TkRjd09EbG1Zak14WlRBMFlqRXpaRFJrTldJaUxDSjFjMlZ5WDJsa0lqb3lMQ0oxYzJWeUlqb2lkbkp4ZFdsdUlpd2ljM1Z3WlhKMWMyVnlJanAwY25WbExDSmhaRzFwYmlJNlptRnNjMlVzSW05eVoyRnVhWHBoZEdsdmJsOTFkV2xrSWpvaU1EQTVNVFJqWmpBdE5HUmpNQzAwWm1Ga0xXRXlNMkV0TURNNE5XUTJNRFExTnpFMUluMC5vbEx0RjhGX0psN3k1azZMeUlFT0lSOW14U1VrVENHZS1ENmlfQjBWc1dZIiwiYWNjZXNzIjoiZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6STFOaUo5LmV5SjBiMnRsYmw5MGVYQmxJam9pWVdOalpYTnpJaXdpWlhod0lqb3hOakF4TnpFME1qVTRMQ0pxZEdraU9pSTVaalUwTTJVeU5tSXpOVEEwWmpReU9HUTNOVGRrWXpVd01XVTVOekV3TmlJc0luVnpaWEpmYVdRaU9qSXNJblZ6WlhJaU9pSjJjbkYxYVc0aUxDSnpkWEJsY25WelpYSWlPblJ5ZFdVc0ltRmtiV2x1SWpwbVlXeHpaU3dpYjNKbllXNXBlbUYwYVc5dVgzVjFhV1FpT2lJd01Ea3hOR05tTUMwMFpHTXdMVFJtWVdRdFlUSXpZUzB3TXpnMVpEWXdORFUzTVRVaWZRLnNsZGFUUnNneHhpVWlReTFMelRfbHBoT1dtQ2t6RjdvakljR2NLUVRTRXciLCJ1c2VyIjoidnJxdWluIiwidG9waWMiOiJWUlF1aW4gcHZ0IGx0ZC8yMDIwLTA5LTIyIDA4OjI2OjUwLjQwNDM0Ny8yZmIwMTgyZi1iMjU1LTRkODAtYjEwYi0yMzhkZGZkNmRmOWUiLCJlbWFpbCI6ImFudXAyNTExMTk4NkBnbWFpbC5jb20iLCJzdXBlcnVzZXIiOnRydWUsImFkbWluIjpmYWxzZSwiaWQiOjIsImFkZGVkX2J5IjoiIiwib3JnYW5pemF0aW9uX3V1aWQiOiIwMDkxNGNmMC00ZGMwLTRmYWQtYTIzYS0wMzg1ZDYwNDU3MTUiLCJvcmdhbml6YXRpb25fbmFtZSI6IlZSUXVpbiBwdnQgbHRkIiwidG90YWxfYWRtaW5zIjozLCJ0b3RhbF9kZXZpY2VzIjo3LCJ2aWRlb3NfYXNzaWduZWRfZGV2aWNlcyI6MjR9fQ==','2020-10-10 08:37:38.959537'),('w0cwb8uujpzcxhqlti4m16z0szbx8ei2','MGU1MmYzMzg4ZmI4ZmQxYzAzODk2ZjZkYmU1M2E1NDJlNWI2ODM4NTp7InZycXVpbiI6eyJyZWZyZXNoIjoiZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6STFOaUo5LmV5SjBiMnRsYmw5MGVYQmxJam9pY21WbWNtVnphQ0lzSW1WNGNDSTZNVFl3TVRFNU16YzJOeXdpYW5ScElqb2lZVFEyWkRFeE9HTmhZbUUzTkRCbU9XRmpNelF4T0dVd05qRXhOVFU1WldJaUxDSjFjMlZ5WDJsa0lqb3lMQ0oxYzJWeUlqb2lkbkp4ZFdsdUlpd2ljM1Z3WlhKMWMyVnlJanAwY25WbExDSmhaRzFwYmlJNlptRnNjMlVzSW05eVoyRnVhWHBoZEdsdmJsOTFkV2xrSWpvaU1EQTVNVFJqWmpBdE5HUmpNQzAwWm1Ga0xXRXlNMkV0TURNNE5XUTJNRFExTnpFMUluMC5hZk01cWtGTUhDelBBaFV3NGw4TVJUUjJ2U0JrQ3hqUUZ4ZjZ2a1VraEpFIiwiYWNjZXNzIjoiZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6STFOaUo5LmV5SjBiMnRsYmw5MGVYQmxJam9pWVdOalpYTnpJaXdpWlhod0lqb3hOakF4TnpFeU1UWTNMQ0pxZEdraU9pSmpNalF5TnpJelpXTm1ZV1UwT1RoaE9UYzROV1EwTVRnNFpHWmhZamRtTXlJc0luVnpaWEpmYVdRaU9qSXNJblZ6WlhJaU9pSjJjbkYxYVc0aUxDSnpkWEJsY25WelpYSWlPblJ5ZFdVc0ltRmtiV2x1SWpwbVlXeHpaU3dpYjNKbllXNXBlbUYwYVc5dVgzVjFhV1FpT2lJd01Ea3hOR05tTUMwMFpHTXdMVFJtWVdRdFlUSXpZUzB3TXpnMVpEWXdORFUzTVRVaWZRLkwyVEx1YThGdVNuVzJISzR3MklwNlBZRU5jd3lvVW5lY1B0SjdMMWllRlkiLCJ1c2VyIjoidnJxdWluIiwidG9waWMiOiJWUlF1aW4gcHZ0IGx0ZC8yMDIwLTA5LTIyIDA4OjI2OjUwLjQwNDM0Ny8yZmIwMTgyZi1iMjU1LTRkODAtYjEwYi0yMzhkZGZkNmRmOWUiLCJlbWFpbCI6ImFudXAyNTExMTk4NkBnbWFpbC5jb20iLCJzdXBlcnVzZXIiOnRydWUsImFkbWluIjpmYWxzZSwiaWQiOjIsImFkZGVkX2J5IjoiIiwib3JnYW5pemF0aW9uX3V1aWQiOiIwMDkxNGNmMC00ZGMwLTRmYWQtYTIzYS0wMzg1ZDYwNDU3MTUiLCJvcmdhbml6YXRpb25fbmFtZSI6IlZSUXVpbiBwdnQgbHRkIn19','2020-10-10 08:02:47.131197'),('xf6txff7u480pxikfy59wbmd8bbm70h0','NmMxYzc4NTg3ZjQzOGI0Y2VlMTA3YzBjZmMxMTAxN2ExMjRiZDQxNTp7InZycXVpbiI6eyJyZWZyZXNoIjoiZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6STFOaUo5LmV5SjBiMnRsYmw5MGVYQmxJam9pY21WbWNtVnphQ0lzSW1WNGNDSTZNVFl3TVRFNU16STVPU3dpYW5ScElqb2lNbUppTlRoa1pUVTFaREUxTkRnM1l6bGhOV0pqWldVMU5ESTVZakJqTVdVaUxDSjFjMlZ5WDJsa0lqb3lMQ0oxYzJWeUlqb2lkbkp4ZFdsdUlpd2ljM1Z3WlhKMWMyVnlJanAwY25WbExDSmhaRzFwYmlJNlptRnNjMlVzSW05eVoyRnVhWHBoZEdsdmJsOTFkV2xrSWpvaU1EQTVNVFJqWmpBdE5HUmpNQzAwWm1Ga0xXRXlNMkV0TURNNE5XUTJNRFExTnpFMUluMC5sc1J1WndrcXZPYWIxS3YzdjNSQ0dUR1ZuTVV5SWRXandlY3U2MDFuZmpNIiwiYWNjZXNzIjoiZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6STFOaUo5LmV5SjBiMnRsYmw5MGVYQmxJam9pWVdOalpYTnpJaXdpWlhod0lqb3hOakF4TnpFeE5qazVMQ0pxZEdraU9pSTBZelprTldVeU56Z3dZbVUwWkdJM09EUmtaR1ZsWW1FMFl6RmtNVGRoTlNJc0luVnpaWEpmYVdRaU9qSXNJblZ6WlhJaU9pSjJjbkYxYVc0aUxDSnpkWEJsY25WelpYSWlPblJ5ZFdVc0ltRmtiV2x1SWpwbVlXeHpaU3dpYjNKbllXNXBlbUYwYVc5dVgzVjFhV1FpT2lJd01Ea3hOR05tTUMwMFpHTXdMVFJtWVdRdFlUSXpZUzB3TXpnMVpEWXdORFUzTVRVaWZRLjFkYjZBNzg2N0s2ajhHZHNtcUlHdDVFX3R4blJnNTRRZjBjTEdDQXluWXciLCJ1c2VyIjoidnJxdWluIiwidG9waWMiOiJWUlF1aW4gcHZ0IGx0ZC8yMDIwLTA5LTIyIDA4OjI2OjUwLjQwNDM0Ny8yZmIwMTgyZi1iMjU1LTRkODAtYjEwYi0yMzhkZGZkNmRmOWUiLCJlbWFpbCI6ImFudXAyNTExMTk4NkBnbWFpbC5jb20iLCJzdXBlcnVzZXIiOnRydWUsImFkbWluIjpmYWxzZSwiaWQiOjIsImFkZGVkX2J5IjoiIiwib3JnYW5pemF0aW9uX3V1aWQiOiIwMDkxNGNmMC00ZGMwLTRmYWQtYTIzYS0wMzg1ZDYwNDU3MTUiLCJvcmdhbml6YXRpb25fbmFtZSI6IlZSUXVpbiBwdnQgbHRkIn19','2020-10-10 07:54:59.107443'),('xljifutnxw3htbtue4yjjt2x0sorswqr','ZjA3Njc3NmE2MWIxZWU4MzE3OTZiZjYwY2E0ZDU5ZWZjMzU4MTE3YTp7InZycXVpbiI6eyJyZWZyZXNoIjoiZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6STFOaUo5LmV5SjBiMnRsYmw5MGVYQmxJam9pY21WbWNtVnphQ0lzSW1WNGNDSTZNVFl3TVRFNU5UWTBNQ3dpYW5ScElqb2laamcwWmpObU1XTm1NakJsTkRNMllUbGhNRFEyT0RsbE1UbGlNREE0WWpNaUxDSjFjMlZ5WDJsa0lqb3lMQ0oxYzJWeUlqb2lkbkp4ZFdsdUlpd2ljM1Z3WlhKMWMyVnlJanAwY25WbExDSmhaRzFwYmlJNlptRnNjMlVzSW05eVoyRnVhWHBoZEdsdmJsOTFkV2xrSWpvaU1EQTVNVFJqWmpBdE5HUmpNQzAwWm1Ga0xXRXlNMkV0TURNNE5XUTJNRFExTnpFMUluMC5peUNRUnc0S2dncHlCaTIyQ3dtQ19FOEJEZHhJRVhWalk3RS1JZ3F4NmZFIiwiYWNjZXNzIjoiZXlKMGVYQWlPaUpLVjFRaUxDSmhiR2NpT2lKSVV6STFOaUo5LmV5SjBiMnRsYmw5MGVYQmxJam9pWVdOalpYTnpJaXdpWlhod0lqb3hOakF4TnpFME1EUXdMQ0pxZEdraU9pSTROMkl6TmpFNVpESXlZamMwWkRBMVltUXdNVFV4TlRWak0yUm1OR0l5TnlJc0luVnpaWEpmYVdRaU9qSXNJblZ6WlhJaU9pSjJjbkYxYVc0aUxDSnpkWEJsY25WelpYSWlPblJ5ZFdVc0ltRmtiV2x1SWpwbVlXeHpaU3dpYjNKbllXNXBlbUYwYVc5dVgzVjFhV1FpT2lJd01Ea3hOR05tTUMwMFpHTXdMVFJtWVdRdFlUSXpZUzB3TXpnMVpEWXdORFUzTVRVaWZRLnVEaHZaVVE4bDlENWFoSW1lOFNqWGRZQUl1UlQwdHZWSFYtQkQ2TU82d0kiLCJ1c2VyIjoidnJxdWluIiwidG9waWMiOiJWUlF1aW4gcHZ0IGx0ZC8yMDIwLTA5LTIyIDA4OjI2OjUwLjQwNDM0Ny8yZmIwMTgyZi1iMjU1LTRkODAtYjEwYi0yMzhkZGZkNmRmOWUiLCJlbWFpbCI6ImFudXAyNTExMTk4NkBnbWFpbC5jb20iLCJzdXBlcnVzZXIiOnRydWUsImFkbWluIjpmYWxzZSwiaWQiOjIsImFkZGVkX2J5IjoiIiwib3JnYW5pemF0aW9uX3V1aWQiOiIwMDkxNGNmMC00ZGMwLTRmYWQtYTIzYS0wMzg1ZDYwNDU3MTUiLCJvcmdhbml6YXRpb25fbmFtZSI6IlZSUXVpbiBwdnQgbHRkIiwidG90YWxfYWRtaW5zIjozLCJ0b3RhbF9kZXZpY2VzIjo3LCJ2aWRlb3NfYXNzaWduZWRfZGV2aWNlcyI6MH19','2020-10-10 08:34:00.353983');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-27 16:16:44
