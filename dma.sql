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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_management_admin`
--

LOCK TABLES `device_management_admin` WRITE;
/*!40000 ALTER TABLE `device_management_admin` DISABLE KEYS */;
INSERT INTO `device_management_admin` VALUES (1,'md5$KUS7FZHLIrEl$da91bcb9e3d9739ec9e135121cb6909a',1,'anup','','','anup25111986@gmail.com',0,1,'2020-09-22 08:25:38.910171','d446fe6ae6ae48f1805b489312351e55',NULL,NULL,NULL,'Dudu pvt ltd','Dudu pvt ltd/2020-09-22 08:25:38.910403/7413be3c-b1cf-44d6-8ea4-9767b9f849d4',NULL,'61cd55e981ad42f49a7469cb1b6a9c90'),(2,'md5$NtAqN2lPRAuF$fa336ee2742911fa3ef75a6078e5e378',1,'vrquin','','','anup25111986@gmail.com',0,1,'2020-09-22 08:26:50.404077','4ec30e20c26741edb13a42e34fedeea1',NULL,NULL,NULL,'VRQuin pvt ltd','VRQuin pvt ltd/2020-09-22 08:26:50.404347/2fb0182f-b255-4d80-b10b-238ddfd6df9e',1,'00914cf04dc04fada23a0385d6045715'),(3,'md5$fjk1biG38ZfZ$7ef9472561f885558f95f91531d589bf',0,'shikha','Anup','Gogoi','anup25111986@gmail.com',1,1,'2020-09-22 08:33:23.704731','3cc6ca7867fb471ebe4b482a6e1657a7',NULL,NULL,NULL,'Volvo pvt ltd','Volvo pvt ltd/2020-09-22 08:33:23.704940/75e6893c-ed0a-4b95-974f-dd9e1443d2e1',1,'39e26b5658854f24bd8cd3a72cd5cf9d'),(4,'md5$exc1aAuP5QBH$f721020a3b3a52f014a91365a5ed7681',0,'s-emp1','Dudu','Gogoi','anup25111986@gmail.com',1,1,'2020-09-22 08:37:59.521230','c3c631123c31421e9de541ac3d1649a9',NULL,NULL,NULL,'Volvo pvt ltd','Volvo pvt ltd/2020-09-22 08:37:59.521477/5c1fe0a0-8cb2-466f-8663-7d5ab82178db',3,'39e26b5658854f24bd8cd3a72cd5cf9d'),(5,'md5$uhinbHypS2po$56c53531a19e2b6e19f7ad8a1b2e1089',0,'s-emp2','Anup','Gogoi','anup25111986@gmail.com',1,1,'2020-09-22 08:41:40.373412','6d83a6d1c0274398b61421cc451572b3',NULL,NULL,NULL,'Volvo pvt ltd','Volvo pvt ltd/2020-09-22 08:41:40.373630/3205dbef-7547-41b5-bb26-660f6d07ff97',3,'39e26b5658854f24bd8cd3a72cd5cf9d'),(6,'md5$AJYaXK8hbnzI$bf3750f96783d7a868dd7da9147e36a6',0,'s-emp3','Mohan','Das','anup25111986@gmail.com',0,1,'2020-09-22 08:42:32.229973','8699247de37f442daa4f36573bdafcea',NULL,NULL,NULL,'Volvo pvt ltd','Volvo pvt ltd/2020-09-22 08:42:32.230143/91aa9064-aeaf-44af-b181-fe959c29c999',3,'39e26b5658854f24bd8cd3a72cd5cf9d'),(7,'md5$iuuKuHzIlqSf$9dbab9abf021662bd92b41fd896a53bc',0,'s-emp4','Kiran','Khanna','anup25111986@gmail.com',0,1,'2020-09-22 09:13:12.443463','31813558c73449ebbfc10cb966872d89',NULL,NULL,NULL,'Volvo pvt ltd','Volvo pvt ltd/39e26b56-5885-4f24-bd8c-d3a72cd5cf9d',3,'39e26b5658854f24bd8cd3a72cd5cf9d'),(8,'md5$qZXaO2spnVdB$5ff76d42afac5437287b566edfb1c8e0',0,'s-emp5','Manju','Kumari','anup25111986@gmail.com',0,1,'2020-09-22 09:13:49.309131','96844e061121432c8616a16e9a3d7858',NULL,NULL,NULL,'Volvo pvt ltd','Volvo pvt ltd/39e26b56-5885-4f24-bd8c-d3a72cd5cf9d',3,'39e26b5658854f24bd8cd3a72cd5cf9d'),(9,'md5$Wa7k6DMk909c$daa6a070da56aec004807f3ddb161f4a',1,'admin','','','anup@gmail.com',1,1,'2020-09-27 11:01:33.162095','bede556069594f74a9ddb7d5d1242bc4',NULL,NULL,NULL,NULL,'None/None',NULL,NULL),(10,'md5$GXaSUvpWqH2H$f76f3b081aa1e53518fb0e629a93f49b',0,'vrquin-1','Birinchi Narayan','Panda','anup25111986@gmail.com',1,1,'2020-09-28 09:30:31.967641','6775a2d70cae4d5a8fc572363c13451f',NULL,NULL,NULL,'asdfsdfsdfsfsaf ltd','asdfsdfsdfsfsaf ltd/f0567190-2648-490d-9704-2bf330a8aea4',1,'f05671902648490d97042bf330a8aea4'),(11,'md5$imEf58DBEYJt$32b3e3a34f053fc06e2da8768694f3a9',0,'vrquin-d','Birinchi Narayan','Panda','anup25111986@gmail.com',1,1,'2020-09-28 09:30:58.203980','b1fff4a6a1014469bb65c5e0f52f5cc8',NULL,NULL,NULL,'asdfsdfsdfsfsaf ltd','asdfsdfsdfsfsaf ltd/f0567190-2648-490d-9704-2bf330a8aea4',1,'f05671902648490d97042bf330a8aea4'),(12,'md5$MgWWQ8Rdt1AR$860bab498ad3a7a7850f2d19edcc7855',0,'vrquin-dd','Birinchi Narayan','Panda','anup25111986@gmail.com',1,1,'2020-09-28 09:31:40.700342','433082c7a0aa48ae85c4bfb2c2513fa1',NULL,NULL,NULL,'asdfsdfsdfsfsaf ltd','asdfsdfsdfsfsaf ltd/f0567190-2648-490d-9704-2bf330a8aea4',1,'f05671902648490d97042bf330a8aea4'),(13,'md5$xtF6a0N9thkd$bae2ae1f61409473b62344e1c161b306',0,'vrquin-ddd','Birinchi Narayan','Panda','anup25111986@gmail.com',1,1,'2020-09-28 09:31:56.910339','175eb480a0e945a5900227b5942332da',NULL,NULL,NULL,'asdfsdfsdfsfsaf ltd','asdfsdfsdfsfsaf ltd/f0567190-2648-490d-9704-2bf330a8aea4',1,'f05671902648490d97042bf330a8aea4'),(14,'md5$JSZoOkyXhiIK$3c342cc5709af3dfe065b4f6ca381e25',0,'maluma','Maluma','Didi','maluma@gmail.com',1,1,'2020-09-28 10:30:49.306974','49904d2dce44447bbece2ec91772e67b',NULL,NULL,NULL,NULL,'None/9ae3ab41-fc0a-47cd-b53b-256e0636a720',2,'9ae3ab41fc0a47cdb53b256e0636a720'),(15,'md5$4gtPNCw05kUu$d9c9e3cb77bd135eaa9d3e9db622fb0c',0,'kaku','Kaku','Gogoi','kaku@gmail.com',1,1,'2020-09-28 10:45:21.786845','8b82eda4ef1c4fee8a254fe50eef6a7e',NULL,NULL,NULL,NULL,'None/d82376bb-9874-44e3-9124-4372772b68a1',2,'d82376bb987444e391244372772b68a1'),(16,'md5$tJRDjEU8Zk33$4f098a206ea632fa36fb197b2bba5173',0,'eric','Eric','Menendez','eric@gmail.com',1,1,'2020-09-28 10:48:04.686314','e3305d5caf364ea783d8016bb5d4a25d',NULL,NULL,NULL,NULL,'None/8d6d52fe-1de4-47e8-820a-d58e71247a00',2,'8d6d52fe1de447e8820ad58e71247a00'),(17,'md5$Qh7R1E9W4Jqu$b6929a56b89163090af7f40d6220f69c',0,'zalim','Zalim','Singh','zalim@gmail.com',1,1,'2020-09-28 10:51:04.552272','1d5fa102f34d4b66af64b990e60bf8ad',NULL,NULL,NULL,NULL,'None/b8ac1643-c217-4ef8-8a87-82fc633666ca',2,'b8ac1643c2174ef88a8782fc633666ca'),(18,'md5$lL9JVl4XJZpm$86623545a83b409d6dbbd2892c02cfda',0,'vrquasdfin-ddd','Birinchi Narayan','Panda','anup25111986@gmail.com',1,1,'2020-09-28 10:52:17.875680','d9aae12b82fa4d4d96ba8d8748f6cfee',NULL,NULL,NULL,'asdfsdfsdfsfsaf ltd','asdfsdfsdfsfsaf ltd/f0567190-2648-490d-9704-2bf330a8aea4',1,'f05671902648490d97042bf330a8aea4'),(19,'md5$PIqWqD2yS8OS$f205dcf44e6d62e745d3c55d00835b2a',0,'wingo','Wingo','Gogoi','wingo@gmail.com',1,1,'2020-09-28 10:56:59.310123','1d2f3f8a601b41d29a48aeadc2bc5b14',NULL,NULL,NULL,NULL,'None/afc9d9f3-0d22-4af2-886c-c58a9e3f0dd5',2,'afc9d9f30d224af2886cc58a9e3f0dd5'),(20,'md5$tmtjNuG8cD4A$b8e72518f238050d279fd0d803ccd9a3',0,'kela','Kela','Gogoi','kela@gmail.com',1,1,'2020-09-28 10:58:30.930757','796f3544970e46349f70e6f356e86e8f',NULL,NULL,NULL,'Kela Pvt Ltd','Kela Pvt Ltd/ccab2b39-0a7c-4c26-a7b4-bba5caf623b7',2,'ccab2b390a7c4c26a7b4bba5caf623b7'),(21,'md5$qxPSq68GUPZw$fc63ec1500108890bed545e7a2977c95',0,'lokie','Lokie','Gogoi','lokie@gmail.com',1,1,'2020-09-28 11:03:06.979995','dd1f25a5addf4297a81905ef114dfabb',NULL,NULL,NULL,'Lokie Pvt Ltd.','Lokie Pvt Ltd./9094db48-3b63-4856-95b2-70d281c77d9f',2,'9094db483b63485695b270d281c77d9f'),(22,'md5$wL3Gok8ayxXv$9661869f59338900feb386579ff6a60b',0,'tiger','Tiger','Gogoi','tiger@gmail.com',1,1,'2020-09-28 11:07:21.866742','6d2df30fd24b4c078d3568fa8ec58d88',NULL,NULL,NULL,'Tiger Pvt Ltd','Tiger Pvt Ltd/30a450d3-ae62-453c-aea7-d4303defb234',2,'30a450d3ae62453caea7d4303defb234'),(23,'md5$EQ5HFjnwUmEd$9ff4a869fa491200c1358d92d3064bbe',0,'haiken','Haiken','Gogoi','haiken@gmail.com',1,1,'2020-09-28 11:13:07.172982','f51ee54413a344de8f7f1af93a9b60dd',NULL,NULL,NULL,'Haiken Pvt Ltd','Haiken Pvt Ltd/506b9ad3-6e32-4801-bfcb-03c3b20f4eab',2,'506b9ad36e324801bfcb03c3b20f4eab'),(24,'md5$XxZ1GQqP2iPZ$585088cb6852285e12a0e601112c61a8',0,'kamal','Kamal','Kalita','kamal@gmail.com',0,1,'2020-09-28 11:51:51.601996','a15ec9fc5fb24ded9d489358e3131c6a',NULL,NULL,NULL,'Volvo Pvt Ltd','Volvo Pvt Ltd/39e26b56-5885-4f24-bd8c-d3a72cd5cf9d',3,'39e26b5658854f24bd8cd3a72cd5cf9d'),(25,'md5$Mmx3GedLPPq9$6a96aae2ba938981d4f03ec28efbbb97',0,'titi','Titi','Padun','titi@gmail.com',1,1,'2020-09-28 11:52:32.735113','77bb0c02b07647b484ade3f71bd1d6d6',NULL,NULL,NULL,'Volvo Pvt Ltd','Volvo Pvt Ltd/39e26b56-5885-4f24-bd8c-d3a72cd5cf9d',3,'39e26b5658854f24bd8cd3a72cd5cf9d'),(26,'md5$kwaJGrVEHAW2$6f89616b996f0219761585aba2a05b6c',0,'insignia','Insignia','Nakul','insignia@gmail.com',1,1,'2020-10-03 06:54:29.608502','279cc4f0393641c2b24a7bbc80ce0aea',NULL,NULL,NULL,'Insignia Technologies Pvt Ltd','Insignia Technologies Pvt Ltd/5f69901b-8605-4bad-8bc4-c515ea3cc194',2,'5f69901b86054bad8bc4c515ea3cc194'),(27,'md5$MBOL12hapDsc$2e333a5407e4abaa78c27d4276fce821',0,'anupam','Anup','Gogoi','anup@gmail.com',1,1,'2020-10-03 07:05:32.938919','0b915e67384e4435a152018d7cb69997',NULL,NULL,NULL,'Insignia Technologies Pvt Ltd','Insignia Technologies Pvt Ltd/5f69901b-8605-4bad-8bc4-c515ea3cc194',26,'5f69901b86054bad8bc4c515ea3cc194'),(28,'md5$cXaKgc0Rrurv$ab34baacba9ee114be75f6a09d2a79be',0,'nupur','Test','Data','test@gmail.com',1,1,'2020-10-03 10:15:39.300854','225837cc12ee4f9aadb34467428a204e',NULL,NULL,NULL,'Nupur Clothes Pvt Ltd.','Nupur Clothes Pvt Ltd./336030c5-4d6e-4edd-9f3f-4aaa46b74dfb',2,'336030c54d6e4edd9f3f4aaa46b74dfb'),(29,'md5$2j2i5KTvMg3c$aef8568efc7a6e0cce46702627e82c29',0,'krish','Krish','Gogoi','krish@gmail.com',1,1,'2020-10-10 07:04:01.724583','2840362f5e1444c2867343121fc212db',NULL,NULL,NULL,'Krish Technology Pvt Ltd','Krish Technology Pvt Ltd/65f48623-d377-4c65-9ed2-b8646b870d75',2,'65f48623d3774c659ed2b8646b870d75'),(30,'md5$gcvCtfmnmFZW$5faa7ce356f29f4d2bc4b63c2a02536f',0,'krish1','Krish 1','Gogoi','krish1@gmail.com',1,1,'2020-10-10 07:10:10.843780','83ce136c9d9d42b783a7be23edbb5437',NULL,NULL,NULL,'Krish tech','Krish tech/65f48623-d377-4c65-9ed2-b8646b870d75',29,'65f48623d3774c659ed2b8646b870d75'),(31,'md5$6OcVuZPblKt4$275d34b9cad61e6d54deca9b1af5f916',0,'mannat','Mannat','Singh','mannat@gmail.com',1,1,'2020-10-10 07:15:44.427957','79ff9ccddbd14877a86cc08d161e6e01',NULL,NULL,NULL,'Krish tech','Krish Technology Pvt Ltd/65f48623-d377-4c65-9ed2-b8646b870d75',29,'65f48623d3774c659ed2b8646b870d75'),(32,'md5$dfyELP4KbK0i$569040b0342cea744e31ebeafb67d524',0,'bulu','Bulu','Das','bulu@gmail.com',1,1,'2020-10-10 07:17:14.615946','4104928ae4494e91af0d33a99fdd714e',NULL,NULL,NULL,'Krish Tech','Krish Technology Pvt Ltd/65f48623-d377-4c65-9ed2-b8646b870d75',29,'65f48623d3774c659ed2b8646b870d75'),(33,'md5$uFEuLNggvwMZ$52bc269e7eb4ad2cfa49541148e159f5',0,'erick','Eric','Kamiec','eric@gmail.com',1,1,'2020-10-19 05:32:23.308654','95e3e340cb284127be654a2108fbae16',NULL,NULL,NULL,'GoEducate','GoEducate/858c4cfd-d685-4745-8bd6-64308ff17030',2,'858c4cfdd68547458bd664308ff17030'),(34,'md5$ohTGBmgDvyzO$036c4bf1e0874df5e5ec273c775b745b',0,'erickk','Eric','Kamiec','eric@gmail.com',1,1,'2020-10-19 05:33:05.964691','858f7b33874e417196479d54b81dfae0',NULL,NULL,NULL,'GoEducate','GoEducate/20ac1083-3940-4fd1-95cc-46709d704995',2,'20ac108339404fd195cc46709d704995');
/*!40000 ALTER TABLE `device_management_admin` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-25 20:22:37
