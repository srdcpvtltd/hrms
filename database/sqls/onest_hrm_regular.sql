-- MariaDB dump 10.19-11.2.2-MariaDB, for osx10.19 (arm64)
--
-- Host: localhost    Database: hrm_regular
-- ------------------------------------------------------
-- Server version	11.2.2-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `ac_name` varchar(200) DEFAULT NULL,
  `ac_number` varchar(100) DEFAULT NULL,
  `code` varchar(200) DEFAULT NULL,
  `branch` varchar(200) DEFAULT NULL,
  `amount` double(16,2) NOT NULL DEFAULT 0.00,
  `status_id` bigint(20) unsigned NOT NULL DEFAULT 1,
  `created_by` bigint(20) unsigned NOT NULL DEFAULT 1,
  `updated_by` bigint(20) unsigned NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `accounts_status_id_company_id_branch_id_index` (`status_id`,`company_id`,`branch_id`),
  KEY `status_id` (`status_id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  CONSTRAINT `accounts_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `accounts_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `accounts_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES
(1,'Account 1','John Doe','123456789','123456789','California',160000.00,1,2,2,'2024-02-06 05:41:56','2024-02-06 05:41:56',NULL,2,1);
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activity_log`
--

DROP TABLE IF EXISTS `activity_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `log_name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `subject_type` varchar(255) DEFAULT NULL,
  `subject_id` bigint(20) unsigned DEFAULT NULL,
  `causer_type` varchar(255) DEFAULT NULL,
  `causer_id` bigint(20) unsigned DEFAULT NULL,
  `event` varchar(255) DEFAULT NULL,
  `properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`properties`)),
  `batch_uuid` char(36) DEFAULT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `subject` (`subject_type`,`subject_id`),
  KEY `causer` (`causer_type`,`causer_id`),
  KEY `activity_log_log_name_index` (`log_name`),
  KEY `activity_log_batch_uuid_index` (`batch_uuid`),
  KEY `activity_log_company_id_branch_id_index` (`company_id`,`branch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_log`
--

LOCK TABLES `activity_log` WRITE;
/*!40000 ALTER TABLE `activity_log` DISABLE KEYS */;
INSERT INTO `activity_log` VALUES
(1,'default','created','App\\Models\\Company\\Company',1,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55',1,1),
(2,'default','created','App\\Models\\Company\\Company',2,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55',1,1),
(3,'default','created','App\\Models\\Hrm\\Shift\\Shift',1,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55',1,1),
(4,'default','created','App\\Models\\Hrm\\Shift\\Shift',2,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55',1,1),
(5,'default','created','App\\Models\\Hrm\\Shift\\Shift',3,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55',1,1),
(6,'default','created','App\\Models\\Role\\Role',1,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55',1,1),
(7,'default','created','App\\Models\\Role\\Role',2,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55',1,1),
(8,'default','created','App\\Models\\Role\\Role',3,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55',1,1),
(9,'default','created','App\\Models\\Role\\Role',4,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55',1,1),
(10,'default','created','App\\Models\\Role\\Role',5,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55',1,1),
(11,'default','created','App\\Models\\Role\\Role',6,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55',1,1),
(12,'default','created','App\\Models\\Role\\Role',7,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55',1,1),
(13,'default','created','App\\Models\\Role\\Role',8,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55',1,1),
(14,'default','created','App\\Models\\User',1,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55',1,1),
(15,'default','created','App\\Models\\User',2,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55',1,1),
(16,'default','created','App\\Models\\User',3,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55',1,1),
(17,'default','created','App\\Models\\User',4,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55',1,1),
(18,'default','created','App\\Models\\User',5,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55',1,1),
(19,'default','created','App\\Models\\User',6,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55',1,1),
(20,'default','created','App\\Models\\User',7,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55',1,1),
(21,'default','created','App\\Models\\User',8,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55',1,1),
(22,'default','created','App\\Models\\User',9,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55',1,1),
(23,'default','created','App\\Models\\User',10,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55',1,1),
(24,'default','created','App\\Models\\User',11,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55',1,1),
(25,'default','created','App\\Models\\User',12,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55',1,1),
(26,'default','created','App\\Models\\User',13,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(27,'default','created','App\\Models\\coreApp\\Setting\\Setting',1,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(28,'default','created','App\\Models\\coreApp\\Setting\\Setting',2,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(29,'default','created','App\\Models\\coreApp\\Setting\\Setting',3,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(30,'default','created','App\\Models\\coreApp\\Setting\\Setting',4,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(31,'default','created','App\\Models\\coreApp\\Setting\\Setting',5,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(32,'default','created','App\\Models\\coreApp\\Setting\\Setting',6,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(33,'default','created','App\\Models\\coreApp\\Setting\\Setting',7,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(34,'default','created','App\\Models\\coreApp\\Setting\\Setting',8,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(35,'default','created','App\\Models\\coreApp\\Setting\\Setting',9,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(36,'default','created','App\\Models\\coreApp\\Setting\\Setting',10,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(37,'default','created','App\\Models\\coreApp\\Setting\\Setting',11,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(38,'default','created','App\\Models\\coreApp\\Setting\\Setting',12,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(39,'default','created','App\\Models\\coreApp\\Setting\\Setting',13,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(40,'default','created','App\\Models\\coreApp\\Setting\\Setting',14,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(41,'default','created','App\\Models\\coreApp\\Setting\\Setting',15,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(42,'default','created','App\\Models\\coreApp\\Setting\\Setting',16,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(43,'default','created','App\\Models\\coreApp\\Setting\\Setting',17,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(44,'default','created','App\\Models\\coreApp\\Setting\\Setting',18,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(45,'default','created','App\\Models\\coreApp\\Setting\\Setting',19,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(46,'default','created','App\\Models\\coreApp\\Setting\\Setting',20,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(47,'default','created','App\\Models\\coreApp\\Setting\\Setting',21,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(48,'default','created','App\\Models\\coreApp\\Setting\\Setting',22,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(49,'default','created','App\\Models\\coreApp\\Setting\\Setting',23,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(50,'default','created','App\\Models\\coreApp\\Setting\\Setting',24,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(51,'default','created','App\\Models\\coreApp\\Setting\\Setting',25,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(52,'default','created','App\\Models\\coreApp\\Setting\\Setting',26,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(53,'default','created','App\\Models\\coreApp\\Setting\\Setting',27,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(54,'default','created','App\\Models\\coreApp\\Setting\\Setting',28,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(55,'default','created','App\\Models\\coreApp\\Setting\\Setting',29,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(56,'default','created','App\\Models\\coreApp\\Setting\\Setting',30,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(57,'default','created','App\\Models\\coreApp\\Setting\\Setting',31,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(58,'default','created','App\\Models\\coreApp\\Setting\\Setting',32,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(59,'default','created','App\\Models\\coreApp\\Setting\\Setting',33,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(60,'default','created','App\\Models\\coreApp\\Setting\\Setting',34,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(61,'default','created','App\\Models\\coreApp\\Setting\\Setting',35,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(62,'default','created','App\\Models\\coreApp\\Setting\\Setting',36,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(63,'default','created','App\\Models\\coreApp\\Setting\\Setting',37,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(64,'default','created','App\\Models\\coreApp\\Setting\\Setting',38,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(65,'default','created','App\\Models\\coreApp\\Setting\\Setting',39,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(66,'default','created','App\\Models\\coreApp\\Setting\\Setting',40,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(67,'default','created','App\\Models\\coreApp\\Setting\\Setting',41,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(68,'default','created','App\\Models\\coreApp\\Setting\\Setting',42,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(69,'default','created','App\\Models\\coreApp\\Setting\\Setting',43,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(70,'default','created','App\\Models\\coreApp\\Setting\\Setting',44,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(71,'default','created','App\\Models\\coreApp\\Setting\\Setting',45,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(72,'default','created','App\\Models\\coreApp\\Setting\\Setting',46,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(73,'default','created','App\\Models\\coreApp\\Setting\\Setting',47,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(74,'default','created','App\\Models\\coreApp\\Setting\\Setting',48,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(75,'default','created','App\\Models\\coreApp\\Setting\\Setting',49,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(76,'default','created','App\\Models\\coreApp\\Setting\\Setting',50,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(77,'default','created','App\\Models\\coreApp\\Setting\\Setting',51,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(78,'default','created','App\\Models\\coreApp\\Setting\\Setting',52,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(79,'default','created','App\\Models\\coreApp\\Setting\\Setting',53,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(80,'default','created','App\\Models\\coreApp\\Setting\\Setting',54,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(81,'default','created','App\\Models\\coreApp\\Setting\\Setting',55,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(82,'default','created','App\\Models\\coreApp\\Setting\\Setting',56,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(83,'default','created','App\\Models\\coreApp\\Setting\\Setting',57,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(84,'default','created','App\\Models\\coreApp\\Setting\\Setting',58,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(85,'default','created','App\\Models\\coreApp\\Setting\\Setting',59,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(86,'default','created','App\\Models\\coreApp\\Setting\\Setting',60,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(87,'default','created','App\\Models\\coreApp\\Setting\\Setting',61,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(88,'default','created','App\\Models\\coreApp\\Setting\\Setting',62,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(89,'default','created','App\\Models\\coreApp\\Setting\\Setting',63,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(90,'default','created','App\\Models\\coreApp\\Setting\\Setting',64,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(91,'default','created','App\\Models\\coreApp\\Setting\\Setting',65,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(92,'default','created','App\\Models\\coreApp\\Setting\\Setting',66,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(93,'default','created','App\\Models\\coreApp\\Setting\\Setting',67,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(94,'default','created','App\\Models\\coreApp\\Setting\\Setting',68,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(95,'default','created','App\\Models\\coreApp\\Setting\\Setting',69,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(96,'default','created','App\\Models\\coreApp\\Setting\\Setting',70,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(97,'default','created','App\\Models\\coreApp\\Setting\\Setting',71,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(98,'default','created','App\\Models\\coreApp\\Setting\\Setting',72,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(99,'default','created','App\\Models\\coreApp\\Setting\\Setting',73,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(100,'default','created','App\\Models\\coreApp\\Setting\\Setting',74,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(101,'default','created','App\\Models\\coreApp\\Setting\\Setting',75,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(102,'default','created','App\\Models\\coreApp\\Setting\\Setting',76,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(103,'default','created','App\\Models\\coreApp\\Setting\\Setting',77,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(104,'default','created','App\\Models\\coreApp\\Setting\\Setting',78,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(105,'default','created','App\\Models\\coreApp\\Setting\\Setting',79,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(106,'default','created','App\\Models\\coreApp\\Setting\\Setting',80,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(107,'default','created','App\\Models\\coreApp\\Setting\\Setting',81,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(108,'default','created','App\\Models\\coreApp\\Setting\\Setting',82,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(109,'default','created','App\\Models\\coreApp\\Setting\\Setting',83,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(110,'default','created','App\\Models\\coreApp\\Setting\\Setting',84,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(111,'default','created','App\\Models\\coreApp\\Setting\\Setting',85,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(112,'default','created','App\\Models\\coreApp\\Setting\\Setting',86,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(113,'default','created','App\\Models\\coreApp\\Setting\\Setting',87,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(114,'default','created','App\\Models\\coreApp\\Setting\\Setting',88,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(115,'default','created','App\\Models\\coreApp\\Setting\\Setting',89,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(116,'default','created','App\\Models\\coreApp\\Setting\\Setting',90,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(117,'default','created','App\\Models\\coreApp\\Setting\\Setting',91,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(118,'default','created','App\\Models\\coreApp\\Setting\\Setting',92,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(119,'default','created','App\\Models\\coreApp\\Setting\\Setting',93,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(120,'default','created','App\\Models\\coreApp\\Setting\\Setting',94,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(121,'default','created','App\\Models\\Hrm\\Attendance\\DutySchedule',1,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(122,'default','created','App\\Models\\Hrm\\Attendance\\DutySchedule',2,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(123,'default','created','App\\Models\\Hrm\\Attendance\\DutySchedule',3,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(124,'default','created','App\\Models\\Hrm\\Attendance\\Weekend',1,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(125,'default','created','App\\Models\\Hrm\\Attendance\\Weekend',2,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(126,'default','created','App\\Models\\Hrm\\Attendance\\Weekend',3,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(127,'default','created','App\\Models\\Hrm\\Attendance\\Weekend',4,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(128,'default','created','App\\Models\\Hrm\\Attendance\\Weekend',5,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(129,'default','created','App\\Models\\Hrm\\Attendance\\Weekend',6,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(130,'default','created','App\\Models\\Hrm\\Attendance\\Weekend',7,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(131,'default','created','App\\Models\\Hrm\\Attendance\\Holiday',1,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(132,'default','created','App\\Models\\Hrm\\Attendance\\Holiday',2,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(133,'default','created','App\\Models\\Hrm\\Attendance\\Holiday',3,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(134,'default','created','App\\Models\\Hrm\\Attendance\\Holiday',4,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(135,'default','created','App\\Models\\Hrm\\Attendance\\Holiday',5,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(136,'default','created','App\\Models\\Hrm\\Attendance\\Holiday',6,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(137,'default','created','App\\Models\\Hrm\\Attendance\\Holiday',7,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(138,'default','created','App\\Models\\Hrm\\Attendance\\Holiday',8,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(139,'default','created','App\\Models\\Hrm\\Attendance\\Holiday',9,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(140,'default','created','App\\Models\\Hrm\\Attendance\\Holiday',10,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(141,'default','created','App\\Models\\Hrm\\Attendance\\Holiday',11,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(142,'default','created','App\\Models\\Hrm\\Attendance\\Holiday',12,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(143,'default','created','App\\Models\\Hrm\\Attendance\\Holiday',13,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(144,'default','created','App\\Models\\Hrm\\Attendance\\Holiday',14,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(145,'default','created','App\\Models\\Hrm\\Attendance\\Holiday',15,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(146,'default','created','App\\Models\\Hrm\\Attendance\\Holiday',16,NULL,NULL,'created','[]',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1);
/*!40000 ALTER TABLE `activity_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `advance_salaries`
--

DROP TABLE IF EXISTS `advance_salaries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `advance_salaries` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `advance_type_id` bigint(20) unsigned NOT NULL DEFAULT 1,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT 1,
  `date` date NOT NULL,
  `amount` double(16,2) DEFAULT NULL,
  `request_amount` double(16,2) NOT NULL DEFAULT 0.00,
  `paid_amount` double(16,2) NOT NULL DEFAULT 0.00,
  `due_amount` double(16,2) NOT NULL DEFAULT 0.00,
  `recovery_mode` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1=Installment, 2=One Time',
  `recovery_cycle` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1=Monthly, 2=Yearly',
  `installment_amount` double(16,2) NOT NULL DEFAULT 0.00,
  `recover_from` date NOT NULL,
  `pay` bigint(20) unsigned NOT NULL DEFAULT 9,
  `status_id` bigint(20) unsigned NOT NULL DEFAULT 2,
  `approver_id` bigint(20) unsigned DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `return_status` bigint(20) unsigned NOT NULL DEFAULT 22,
  `created_by` bigint(20) unsigned NOT NULL DEFAULT 1,
  `updated_by` bigint(20) unsigned NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `advance_salaries_amount_date_index` (`amount`,`date`),
  KEY `advance_salaries_company_id_branch_id_index` (`company_id`,`branch_id`),
  KEY `advance_type_id` (`advance_type_id`),
  KEY `user_id` (`user_id`),
  KEY `pay` (`pay`),
  KEY `status_id` (`status_id`),
  KEY `approver_id` (`approver_id`),
  KEY `return_status` (`return_status`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  CONSTRAINT `advance_salaries_advance_type_id_foreign` FOREIGN KEY (`advance_type_id`) REFERENCES `advance_types` (`id`),
  CONSTRAINT `advance_salaries_approver_id_foreign` FOREIGN KEY (`approver_id`) REFERENCES `users` (`id`),
  CONSTRAINT `advance_salaries_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `advance_salaries_pay_foreign` FOREIGN KEY (`pay`) REFERENCES `statuses` (`id`),
  CONSTRAINT `advance_salaries_return_status_foreign` FOREIGN KEY (`return_status`) REFERENCES `statuses` (`id`),
  CONSTRAINT `advance_salaries_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `advance_salaries_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`),
  CONSTRAINT `advance_salaries_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advance_salaries`
--

LOCK TABLES `advance_salaries` WRITE;
/*!40000 ALTER TABLE `advance_salaries` DISABLE KEYS */;
/*!40000 ALTER TABLE `advance_salaries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `advance_salary_logs`
--

DROP TABLE IF EXISTS `advance_salary_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `advance_salary_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `amount` double(16,2) NOT NULL,
  `due_amount` double(16,2) DEFAULT NULL,
  `is_pay` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=Company Pay, 1= Staff Pay',
  `advance_salary_id` bigint(20) unsigned NOT NULL DEFAULT 1,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT 1,
  `created_by` bigint(20) unsigned NOT NULL DEFAULT 1,
  `updated_by` bigint(20) unsigned NOT NULL DEFAULT 1,
  `payment_note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `advance_salary_logs_amount_index` (`amount`),
  KEY `advance_salary_logs_company_id_branch_id_index` (`company_id`,`branch_id`),
  KEY `advance_salary_id` (`advance_salary_id`),
  KEY `user_id` (`user_id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  CONSTRAINT `advance_salary_logs_advance_salary_id_foreign` FOREIGN KEY (`advance_salary_id`) REFERENCES `advance_salaries` (`id`),
  CONSTRAINT `advance_salary_logs_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `advance_salary_logs_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`),
  CONSTRAINT `advance_salary_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advance_salary_logs`
--

LOCK TABLES `advance_salary_logs` WRITE;
/*!40000 ALTER TABLE `advance_salary_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `advance_salary_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `advance_types`
--

DROP TABLE IF EXISTS `advance_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `advance_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `status_id` bigint(20) unsigned NOT NULL DEFAULT 1,
  `created_by` bigint(20) unsigned DEFAULT 1,
  `updated_by` bigint(20) unsigned DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `advance_types_id_index` (`id`),
  KEY `advance_types_company_id_branch_id_index` (`company_id`,`branch_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `advance_types_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advance_types`
--

LOCK TABLES `advance_types` WRITE;
/*!40000 ALTER TABLE `advance_types` DISABLE KEYS */;
INSERT INTO `advance_types` VALUES
(1,'Salary Advance',1,1,1,'2024-02-06 05:41:56','2024-02-06 05:41:56',2,1),
(2,'Loan',1,1,1,'2024-02-06 05:41:56','2024-02-06 05:41:56',2,1);
/*!40000 ALTER TABLE `advance_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `all_contents`
--

DROP TABLE IF EXISTS `all_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `all_contents` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT 1,
  `type` varchar(50) NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `meta_title` text NOT NULL,
  `meta_description` varchar(1000) DEFAULT NULL,
  `keywords` varchar(1000) DEFAULT NULL,
  `meta_image` varchar(255) DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT 1,
  `updated_by` bigint(20) unsigned DEFAULT 1,
  `status_id` bigint(20) unsigned NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `all_contents_user_id_foreign` (`user_id`),
  KEY `all_contents_status_id_foreign` (`status_id`),
  KEY `all_contents_type_title_slug_index` (`type`,`title`,`slug`),
  KEY `all_contents_company_id_branch_id_index` (`company_id`,`branch_id`),
  CONSTRAINT `all_contents_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `all_contents_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `all_contents`
--

LOCK TABLES `all_contents` WRITE;
/*!40000 ALTER TABLE `all_contents` DISABLE KEYS */;
INSERT INTO `all_contents` VALUES
(1,1,'page','About Us','about-us','<p>Welcome to ONEST HRM! We are a dynamic and forward-thinking company dedicated to Serve best services. Established in 2013, we have been at the forefront of Software for 10+ years, serving all over the world</p>','About Us',NULL,'about, us, about us',NULL,1,1,1,NULL,NULL,1,1),
(2,1,'page','Contact Us','contact-us','<p>We are here to assist you and provide the information you need. Please feel free to reach out to us using the following contact </p>','Contact Us',NULL,'contact, us, contact us',NULL,1,1,1,NULL,NULL,1,1),
(3,1,'page','Privacy Policy','privacy-policy','\n                <section>\n                <h2>Information We Collect</h2>\n                <p>We may collect personal information, usage data, and device details for various purposes.</p>\n            </section>\n\n            <section>\n                <h2>How We Use Your Information</h2>\n                <p>We use the collected information for providing and improving our services, communicating with you, analyzing user trends, and ensuring legal compliance and safety.</p>\n            </section>\n\n            <section>\n                <h2>Sharing Your Information</h2>\n                <p>We may share your data with service providers and for legal compliance.</p>\n            </section>\n\n            <section>\n                <h2>Your Choices</h2>\n                <p>You can opt-out of promotional communications and manage cookies through your browser settings.</p>\n            </section>\n\n            <section>\n                <h2>Security</h2>\n                <p>We take measures to protect your data, but no method is 100% secure.</p>\n            </section>\n\n            <section>\n                <h2>Changes to this Privacy Policy</h2>\n                <p>We may update this policy, and changes will be posted on this page.</p>\n            </section>\n                ','Privacy Policy',NULL,'privacy, policy, privacy policy',NULL,1,1,1,NULL,NULL,1,1),
(4,1,'page','Support 24/7','support-24-7','\n                <section>\n    <h2>Support 24/7</h2>\n    <p>We are here to assist you around the clock. If you have any questions, concerns, or need help with our products or services, please don\'t hesitate to reach out to our support team.</p>\n</section>\n                ','Terms of Use',NULL,'supports, 24, 7, support 24/7',NULL,1,1,1,NULL,NULL,1,1),
(5,1,'page','Terms of Use','terms-of-use','\n                <section>\n                <h2>1. Acceptance of Terms</h2>\n                <p>By using our services, you agree to be bound by these terms.</p>\n            </section>\n\n            <section>\n                <h2>2. Use of Services</h2>\n                <p>You may use our services only in accordance with these terms.</p>\n            </section>\n\n            <section>\n                <h2>3. Intellectual Property</h2>\n                <p>Our content and trademarks are protected by intellectual property laws.</p>\n            </section>\n\n            <section>\n                <h2>4. Privacy Policy</h2>\n                <p>Use of our services is also governed by our Privacy Policy.</p>\n            </section>\n\n            <section>\n                <h2>5. Termination</h2>\n                <p>We reserve the right to terminate or suspend your access to our services for violations of these terms.</p>\n            </section>\n\n            <section>\n                <h2>6. Changes to Terms</h2>\n                <p>We may update these terms, and changes will be posted on this page.</p>\n            </section>\n                ','Terms of Use','Terms of Use','terms, of, use, terms of use',NULL,1,1,1,NULL,NULL,1,1),
(6,1,'page','company Policies','company-policies','\n                <section>\n                <h2>1. Equal Opportunity Policy</h2>\n                <p>Our company is an equal opportunity employer.</p>\n            </section>\n\n            <section>\n                <h2>2. Code of Conduct</h2>\n                <p>We expect all employees to adhere to our code of conduct.</p>\n            </section>\n\n            <section>\n                <h2>3. Anti-Harassment Policy</h2>\n                <p>We have a strict anti-harassment policy in place.</p>\n            </section>\n\n            <section>\n                <h2>4. Data Privacy Policy</h2>\n                <p>Protecting your data is a top priority for us.</p>\n            </section>\n\n            <section>\n                <h2>5. Use of Company Resources</h2>\n                <p>Guidelines for using company resources responsibly.</p>\n            </section>\n\n            <section>\n                <h2>6. Termination and Resignation</h2>\n                <p>Details about the process for termination and resignation.</p>\n            </section>\n                ','company-policies','Terms of Use','company-policies',NULL,1,1,1,NULL,NULL,1,1),
(7,1,'page','Refund Policy','refund-policy','\n\n    <section>\n    <h2>1. Refund Eligibility</h2>\n    <p>We offer refunds under certain conditions. Please review our refund eligibility criteria.</p>\n</section>\n\n<section>\n    <h2>2. Requesting a Refund</h2>\n    <p>Details on how to request a refund, including contact information and required documentation.</p>\n</section>\n\n<section>\n    <h2>3. Refund Processing</h2>\n    <p>Information on the refund processing timeline and method of payment.</p>\n</section>\n\n<section>\n    <h2>4. Non-Refundable Items</h2>\n    <p>A list of items or services that are non-refundable.</p>\n</section>\n\n<section>\n    <h2>5. Contact Us</h2>\n    <p>If you have questions or need assistance with our refund policy, please don\'t hesitate to contact our support team.</p>\n</section>\n                ','refund-policy','Terms of Use','refund-policy',NULL,1,1,1,NULL,NULL,1,1);
/*!40000 ALTER TABLE `all_contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_setups`
--

DROP TABLE IF EXISTS `api_setups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_setups` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `key` varchar(255) DEFAULT NULL,
  `secret` varchar(255) DEFAULT NULL,
  `endpoint` varchar(255) DEFAULT NULL,
  `docs_url` varchar(255) DEFAULT NULL,
  `status_id` bigint(20) unsigned NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `api_setups_company_id_branch_id_index` (`company_id`,`branch_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `api_setups_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_setups`
--

LOCK TABLES `api_setups` WRITE;
/*!40000 ALTER TABLE `api_setups` DISABLE KEYS */;
INSERT INTO `api_setups` VALUES
(1,'google',NULL,NULL,NULL,NULL,1,NULL,NULL,1,1),
(2,'barikoi',NULL,NULL,NULL,NULL,4,NULL,NULL,1,1);
/*!40000 ALTER TABLE `api_setups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_screens`
--

DROP TABLE IF EXISTS `app_screens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_screens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `status_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `app_screens_status_id_foreign` (`status_id`),
  KEY `app_screens_company_id_branch_id_index` (`company_id`,`branch_id`),
  CONSTRAINT `app_screens_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_screens`
--

LOCK TABLES `app_screens` WRITE;
/*!40000 ALTER TABLE `app_screens` DISABLE KEYS */;
INSERT INTO `app_screens` VALUES
(1,'Support','support',1,'assets/appScreenIcons/support.png',1,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(2,'Attendance','attendance',2,'assets/appScreenIcons/attendance.png',1,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(3,'Task','task',3,'assets/appScreenIcons/task.png',1,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(4,'Notice','notice',4,'assets/appScreenIcons/notice.png',1,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(5,'Expense','expense',5,'assets/appScreenIcons/expense.png',1,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(6,'Leave','leave',6,'assets/appScreenIcons/leave.png',1,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(7,'Approval','approval',7,'assets/appScreenIcons/approval.png',1,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(8,'Phonebook','phonebook',8,'assets/appScreenIcons/phonebook.png',1,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(9,'Visit','visit',9,'assets/appScreenIcons/visit.png',1,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(10,'Appointments','appointments',10,'assets/appScreenIcons/appointments.png',1,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(11,'Break','break',11,'assets/appScreenIcons/break.png',1,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(12,'Report','report',12,'assets/appScreenIcons/report.png',1,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(13,'Payroll','payroll',13,'assets/appScreenIcons/payroll.png',1,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(14,'Daily Leave','daily_leave',14,'assets/appScreenIcons/daily_leave.png',1,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(15,'Meeting','meeting',15,'assets/appScreenIcons/meeting.png',1,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1);
/*!40000 ALTER TABLE `app_screens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appoinment_participants`
--

DROP TABLE IF EXISTS `appoinment_participants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appoinment_participants` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `participant_id` bigint(20) unsigned NOT NULL,
  `appoinment_id` bigint(20) unsigned NOT NULL,
  `is_agree` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0: Not agree, 1: Agree',
  `is_present` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0: Absent, 1: Present',
  `present_at` datetime DEFAULT NULL,
  `appoinment_started_at` datetime DEFAULT NULL,
  `appoinment_ended_at` datetime DEFAULT NULL,
  `appoinment_duration` varchar(255) DEFAULT NULL COMMENT 'appoinment duration in minutes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `appoinment_participants_participant_id_foreign` (`participant_id`),
  KEY `appoinment_participants_appoinment_id_foreign` (`appoinment_id`),
  KEY `appoinment_participants_company_id_branch_id_index` (`company_id`,`branch_id`),
  CONSTRAINT `appoinment_participants_appoinment_id_foreign` FOREIGN KEY (`appoinment_id`) REFERENCES `appoinments` (`id`),
  CONSTRAINT `appoinment_participants_participant_id_foreign` FOREIGN KEY (`participant_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appoinment_participants`
--

LOCK TABLES `appoinment_participants` WRITE;
/*!40000 ALTER TABLE `appoinment_participants` DISABLE KEYS */;
/*!40000 ALTER TABLE `appoinment_participants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appoinments`
--

DROP TABLE IF EXISTS `appoinments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appoinments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_by` bigint(20) unsigned NOT NULL,
  `appoinment_with` bigint(20) unsigned NOT NULL,
  `appoinment_start_at` varchar(255) DEFAULT NULL,
  `appoinment_end_at` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `date` date DEFAULT NULL,
  `attachment_file_id` bigint(20) unsigned DEFAULT NULL,
  `status_id` bigint(20) unsigned NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `appoinments_created_by_foreign` (`created_by`),
  KEY `appoinments_appoinment_with_foreign` (`appoinment_with`),
  KEY `appoinments_attachment_file_id_foreign` (`attachment_file_id`),
  KEY `appoinments_company_id_branch_id_index` (`company_id`,`branch_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `appoinments_appoinment_with_foreign` FOREIGN KEY (`appoinment_with`) REFERENCES `users` (`id`),
  CONSTRAINT `appoinments_attachment_file_id_foreign` FOREIGN KEY (`attachment_file_id`) REFERENCES `uploads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `appoinments_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `appoinments_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appoinments`
--

LOCK TABLES `appoinments` WRITE;
/*!40000 ALTER TABLE `appoinments` DISABLE KEYS */;
/*!40000 ALTER TABLE `appoinments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appraisals`
--

DROP TABLE IF EXISTS `appraisals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appraisals` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `rates` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`rates`)),
  `rating` double(8,2) DEFAULT 0.00,
  `user_id` bigint(20) unsigned NOT NULL,
  `added_by` bigint(20) unsigned NOT NULL,
  `date` date DEFAULT NULL,
  `remarks` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `appraisals_user_id_foreign` (`user_id`),
  KEY `appraisals_added_by_foreign` (`added_by`),
  KEY `appraisals_company_id_branch_id_index` (`company_id`,`branch_id`),
  CONSTRAINT `appraisals_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `appraisals_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appraisals`
--

LOCK TABLES `appraisals` WRITE;
/*!40000 ALTER TABLE `appraisals` DISABLE KEYS */;
/*!40000 ALTER TABLE `appraisals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appreciates`
--

DROP TABLE IF EXISTS `appreciates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appreciates` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `appreciate_by` bigint(20) unsigned NOT NULL,
  `message` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `appreciates_user_id_foreign` (`user_id`),
  KEY `appreciates_appreciate_by_foreign` (`appreciate_by`),
  KEY `appreciates_company_id_branch_id_index` (`company_id`,`branch_id`),
  CONSTRAINT `appreciates_appreciate_by_foreign` FOREIGN KEY (`appreciate_by`) REFERENCES `users` (`id`),
  CONSTRAINT `appreciates_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appreciates`
--

LOCK TABLES `appreciates` WRITE;
/*!40000 ALTER TABLE `appreciates` DISABLE KEYS */;
/*!40000 ALTER TABLE `appreciates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assign_leaves`
--

DROP TABLE IF EXISTS `assign_leaves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assign_leaves` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type_id` bigint(20) unsigned NOT NULL,
  `days` int(11) NOT NULL,
  `status_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `department_id` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `assign_leaves_status_id_foreign` (`status_id`),
  KEY `assign_leaves_type_id_status_id_index` (`type_id`,`status_id`),
  KEY `assign_leaves_company_id_branch_id_index` (`company_id`,`branch_id`),
  CONSTRAINT `assign_leaves_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `assign_leaves_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `leave_types` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assign_leaves`
--

LOCK TABLES `assign_leaves` WRITE;
/*!40000 ALTER TABLE `assign_leaves` DISABLE KEYS */;
/*!40000 ALTER TABLE `assign_leaves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendances`
--

DROP TABLE IF EXISTS `attendances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attendances` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `date` date DEFAULT NULL,
  `check_in` timestamp NULL DEFAULT NULL,
  `check_out` timestamp NULL DEFAULT NULL,
  `stay_time` varchar(255) DEFAULT NULL,
  `late_reason` varchar(255) DEFAULT NULL,
  `late_time` int(11) NOT NULL DEFAULT 0,
  `in_status` enum('OT','L','A') DEFAULT 'OT' COMMENT 'OT=On Time, L=Late, A=Absent',
  `out_status` enum('LT','LE','LL') DEFAULT NULL COMMENT 'LT=Left Timely, LE=Left Early, LL = Left Later',
  `checkin_ip` varchar(255) DEFAULT NULL,
  `checkout_ip` varchar(255) DEFAULT NULL,
  `remote_mode_in` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 = home , 1 = office',
  `remote_mode_out` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 = home , 1 = office',
  `check_in_location` varchar(255) DEFAULT NULL,
  `check_out_location` varchar(255) DEFAULT NULL,
  `check_in_latitude` double DEFAULT NULL COMMENT 'check in latitude',
  `check_in_longitude` double DEFAULT NULL COMMENT 'check in longitude',
  `check_out_latitude` double DEFAULT NULL COMMENT 'check out latitude',
  `check_out_longitude` double DEFAULT NULL COMMENT 'check out longitude',
  `check_in_city` varchar(255) DEFAULT NULL COMMENT 'city',
  `check_in_country_code` varchar(255) DEFAULT NULL COMMENT 'countryCode',
  `check_in_country` varchar(255) DEFAULT 'Bangladesh' COMMENT 'country',
  `check_out_city` varchar(255) DEFAULT NULL COMMENT 'city',
  `check_out_country_code` varchar(255) DEFAULT NULL COMMENT 'countryCode',
  `check_out_country` varchar(255) DEFAULT 'Bangladesh' COMMENT 'country',
  `status_id` bigint(20) unsigned NOT NULL DEFAULT 1,
  `face_image` bigint(20) unsigned DEFAULT NULL,
  `in_status_approve` enum('OT') DEFAULT NULL COMMENT 'OT=On Time',
  `in_status_approve_by` bigint(20) unsigned DEFAULT NULL,
  `out_status_approve` enum('LT') DEFAULT NULL COMMENT 'LT=Left Timely',
  `out_status_approve_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `attendances_user_id_foreign` (`user_id`),
  KEY `attendances_status_id_foreign` (`status_id`),
  KEY `attendances_face_image_foreign` (`face_image`),
  KEY `attendances_in_status_approve_by_foreign` (`in_status_approve_by`),
  KEY `attendances_out_status_approve_by_foreign` (`out_status_approve_by`),
  KEY `attendances_company_id_branch_id_index` (`company_id`,`branch_id`),
  CONSTRAINT `attendances_face_image_foreign` FOREIGN KEY (`face_image`) REFERENCES `uploads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `attendances_in_status_approve_by_foreign` FOREIGN KEY (`in_status_approve_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `attendances_out_status_approve_by_foreign` FOREIGN KEY (`out_status_approve_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `attendances_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `attendances_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendances`
--

LOCK TABLES `attendances` WRITE;
/*!40000 ALTER TABLE `attendances` DISABLE KEYS */;
/*!40000 ALTER TABLE `attendances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `author_infos`
--

DROP TABLE IF EXISTS `author_infos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `author_infos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `authorable_type` varchar(255) NOT NULL,
  `authorable_id` bigint(20) unsigned NOT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `approved_by` bigint(20) unsigned DEFAULT NULL,
  `approved_at` timestamp NULL DEFAULT NULL,
  `rejected_by` bigint(20) unsigned DEFAULT NULL,
  `rejected_at` timestamp NULL DEFAULT NULL,
  `cancelled_by` bigint(20) unsigned DEFAULT NULL,
  `cancelled_at` timestamp NULL DEFAULT NULL,
  `published_by` bigint(20) unsigned DEFAULT NULL,
  `published_at` timestamp NULL DEFAULT NULL,
  `unpublished_by` bigint(20) unsigned DEFAULT NULL,
  `unpublished_at` timestamp NULL DEFAULT NULL,
  `deleted_by` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `archived_by` bigint(20) unsigned DEFAULT NULL,
  `archived_at` timestamp NULL DEFAULT NULL,
  `restored_by` bigint(20) unsigned DEFAULT NULL,
  `restored_at` timestamp NULL DEFAULT NULL,
  `referred_by` bigint(20) unsigned DEFAULT NULL,
  `referred_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `author_infos_authorable_type_authorable_id_index` (`authorable_type`,`authorable_id`),
  KEY `author_infos_created_by_foreign` (`created_by`),
  KEY `author_infos_updated_by_foreign` (`updated_by`),
  KEY `author_infos_approved_by_foreign` (`approved_by`),
  KEY `author_infos_rejected_by_foreign` (`rejected_by`),
  KEY `author_infos_cancelled_by_foreign` (`cancelled_by`),
  KEY `author_infos_published_by_foreign` (`published_by`),
  KEY `author_infos_unpublished_by_foreign` (`unpublished_by`),
  KEY `author_infos_deleted_by_foreign` (`deleted_by`),
  KEY `author_infos_archived_by_foreign` (`archived_by`),
  KEY `author_infos_restored_by_foreign` (`restored_by`),
  KEY `author_infos_referred_by_foreign` (`referred_by`),
  KEY `author_infos_company_id_branch_id_index` (`company_id`,`branch_id`),
  CONSTRAINT `author_infos_approved_by_foreign` FOREIGN KEY (`approved_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `author_infos_archived_by_foreign` FOREIGN KEY (`archived_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `author_infos_cancelled_by_foreign` FOREIGN KEY (`cancelled_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `author_infos_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `author_infos_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `author_infos_published_by_foreign` FOREIGN KEY (`published_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `author_infos_referred_by_foreign` FOREIGN KEY (`referred_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `author_infos_rejected_by_foreign` FOREIGN KEY (`rejected_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `author_infos_restored_by_foreign` FOREIGN KEY (`restored_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `author_infos_unpublished_by_foreign` FOREIGN KEY (`unpublished_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `author_infos_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author_infos`
--

LOCK TABLES `author_infos` WRITE;
/*!40000 ALTER TABLE `author_infos` DISABLE KEYS */;
/*!40000 ALTER TABLE `author_infos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `award_types`
--

DROP TABLE IF EXISTS `award_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `award_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `status_id` bigint(20) unsigned NOT NULL DEFAULT 1,
  `created_by` bigint(20) unsigned DEFAULT 1,
  `updated_by` bigint(20) unsigned DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `award_types_id_index` (`id`),
  KEY `award_types_company_id_branch_id_index` (`company_id`,`branch_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `award_types_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `award_types`
--

LOCK TABLES `award_types` WRITE;
/*!40000 ALTER TABLE `award_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `award_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `awards`
--

DROP TABLE IF EXISTS `awards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `awards` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_by` bigint(20) unsigned NOT NULL,
  `award_type_id` bigint(20) unsigned NOT NULL,
  `date` date DEFAULT NULL,
  `gift` varchar(255) DEFAULT NULL,
  `amount` double(16,2) DEFAULT NULL,
  `gift_info` varchar(255) DEFAULT NULL,
  `description` longtext NOT NULL,
  `status_id` bigint(20) unsigned NOT NULL DEFAULT 1,
  `attachment` bigint(20) unsigned DEFAULT NULL,
  `goal_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `awards_user_id_foreign` (`user_id`),
  KEY `awards_created_by_foreign` (`created_by`),
  KEY `awards_attachment_foreign` (`attachment`),
  KEY `awards_goal_id_foreign` (`goal_id`),
  KEY `awards_award_type_id_status_id_user_id_index` (`award_type_id`,`status_id`,`user_id`),
  KEY `awards_company_id_branch_id_index` (`company_id`,`branch_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `awards_attachment_foreign` FOREIGN KEY (`attachment`) REFERENCES `uploads` (`id`),
  CONSTRAINT `awards_award_type_id_foreign` FOREIGN KEY (`award_type_id`) REFERENCES `award_types` (`id`) ON DELETE CASCADE,
  CONSTRAINT `awards_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `awards_goal_id_foreign` FOREIGN KEY (`goal_id`) REFERENCES `goals` (`id`) ON DELETE CASCADE,
  CONSTRAINT `awards_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `awards_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `awards`
--

LOCK TABLES `awards` WRITE;
/*!40000 ALTER TABLE `awards` DISABLE KEYS */;
/*!40000 ALTER TABLE `awards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bank_accounts`
--

DROP TABLE IF EXISTS `bank_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bank_accounts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `name` varchar(191) NOT NULL,
  `account_number` varchar(255) NOT NULL COMMENT 'Account Number',
  `bank_name` varchar(255) NOT NULL COMMENT 'Bank Name',
  `branch_name` varchar(255) NOT NULL COMMENT 'Bank branch name',
  `ifsc_code` varchar(255) DEFAULT NULL COMMENT 'IFSC Code',
  `account_type` enum('savings','current') NOT NULL DEFAULT 'savings',
  `account_holder_name` varchar(191) DEFAULT NULL,
  `account_holder_mobile` varchar(191) DEFAULT NULL,
  `account_holder_email` varchar(191) DEFAULT NULL,
  `status_id` bigint(20) unsigned DEFAULT NULL,
  `author_info_id` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bank_accounts_account_number_unique` (`account_number`),
  KEY `bank_accounts_company_id_branch_id_index` (`company_id`,`branch_id`),
  KEY `bank_accounts_user_id_index` (`user_id`),
  KEY `bank_accounts_status_id_index` (`status_id`),
  KEY `bank_accounts_author_info_id_index` (`author_info_id`),
  CONSTRAINT `bank_accounts_author_info_id_foreign` FOREIGN KEY (`author_info_id`) REFERENCES `author_infos` (`id`) ON DELETE CASCADE,
  CONSTRAINT `bank_accounts_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `bank_accounts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank_accounts`
--

LOCK TABLES `bank_accounts` WRITE;
/*!40000 ALTER TABLE `bank_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `bank_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branches`
--

DROP TABLE IF EXISTS `branches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branches` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  `company_id` bigint(20) NOT NULL,
  `status_id` bigint(20) NOT NULL DEFAULT 1 COMMENT '1=active,4=inactive',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branches`
--

LOCK TABLES `branches` WRITE;
/*!40000 ALTER TABLE `branches` DISABLE KEYS */;
INSERT INTO `branches` VALUES
(1,'Head Office','Texas, USA','1707198115','admin@gmail.com',1,1,1,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55');
/*!40000 ALTER TABLE `branches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT 'name',
  `type` tinyint(4) NOT NULL COMMENT '1=income 2=expense',
  `serial` varchar(255) NOT NULL COMMENT 'serial',
  `description` varchar(255) DEFAULT NULL COMMENT 'description',
  `status_id` bigint(20) unsigned DEFAULT NULL,
  `author_info_id` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categories_name_type_serial_index` (`name`,`type`,`serial`),
  KEY `categories_status_id_index` (`status_id`),
  KEY `categories_author_info_id_index` (`author_info_id`),
  CONSTRAINT `categories_author_info_id_foreign` FOREIGN KEY (`author_info_id`) REFERENCES `author_infos` (`id`) ON DELETE CASCADE,
  CONSTRAINT `categories_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `status_id` bigint(20) unsigned NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `clients_email_unique` (`email`),
  KEY `clients_company_id_branch_id_index` (`company_id`,`branch_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `clients_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commissions`
--

DROP TABLE IF EXISTS `commissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `type` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1: addition, 2: deduction',
  `mode` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1: percentage, 2: fixed',
  `amount` double NOT NULL DEFAULT 0,
  `status_id` bigint(20) unsigned NOT NULL DEFAULT 1,
  `created_by` bigint(20) unsigned DEFAULT 1,
  `updated_by` bigint(20) unsigned DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `commissions_id_index` (`id`),
  KEY `commissions_company_id_branch_id_index` (`company_id`,`branch_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `commissions_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commissions`
--

LOCK TABLES `commissions` WRITE;
/*!40000 ALTER TABLE `commissions` DISABLE KEYS */;
INSERT INTO `commissions` VALUES
(1,'Basic',1,2,50,1,1,1,'2024-02-06 05:41:56','2024-02-06 05:41:56',2,1),
(2,'HRA',1,2,40,1,1,1,'2024-02-06 05:41:56','2024-02-06 05:41:56',2,1),
(3,'Medical',1,2,10,1,1,1,'2024-02-06 05:41:56','2024-02-06 05:41:56',2,1);
/*!40000 ALTER TABLE `commissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `country_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `total_employee` int(11) DEFAULT NULL,
  `business_type` varchar(255) DEFAULT NULL,
  `trade_licence_number` varchar(255) DEFAULT NULL,
  `subdomain` varchar(255) DEFAULT NULL,
  `trade_licence_id` bigint(20) unsigned DEFAULT NULL,
  `status_id` bigint(20) unsigned NOT NULL DEFAULT 1,
  `is_main_company` enum('yes','no') NOT NULL DEFAULT 'no',
  `is_subscription` tinyint(4) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `companies_email_unique` (`email`),
  UNIQUE KEY `companies_phone_unique` (`phone`),
  KEY `companies_country_id_foreign` (`country_id`),
  KEY `trade_licence_id` (`trade_licence_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `companies_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`),
  CONSTRAINT `companies_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `companies_trade_licence_id_foreign` FOREIGN KEY (`trade_licence_id`) REFERENCES `uploads` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES
(1,223,'Admin','Company 1','admin@onesttech.com','+8801959335555',400,'Service',NULL,NULL,NULL,1,'yes',0,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(2,223,'Branch Admin','Branch 1','admin2@onesttech.com','+8801959335556',400,'Service',NULL,NULL,NULL,1,'yes',0,'2024-02-06 05:41:55','2024-02-06 05:41:55');
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_configs`
--

DROP TABLE IF EXISTS `company_configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_configs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `company_configs_company_id_branch_id_index` (`company_id`,`branch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_configs`
--

LOCK TABLES `company_configs` WRITE;
/*!40000 ALTER TABLE `company_configs` DISABLE KEYS */;
INSERT INTO `company_configs` VALUES
(1,'date_format','d-m-Y','2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(2,'time_format','h','2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(3,'ip_check','0','2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(4,'leave_assign','0','2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(5,'currency_symbol','$','2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(6,'location_service','0','2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(7,'app_sync_time','','2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(8,'live_data_store_time','','2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(9,'lang','en','2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(10,'multi_checkin','0','2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(11,'currency','2','2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(12,'timezone','Asia/Dhaka','2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(13,'currency_code','USD','2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(14,'location_check','0','2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(15,'attendance_method','N','2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(16,'google','AIzaSyBVF8ZCdPLYBEC2-PCRww1_Q0Abe5GYP1c','2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(17,'is_employee_passport_required','0','2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(18,'is_employee_eid_required','0','2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(19,'min_phone_no_digit','11','2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(20,'max_phone_no_digit','11','2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(21,'leave_carryover','0','2024-02-06 05:41:56','2024-02-06 05:41:56',1,1);
/*!40000 ALTER TABLE `company_configs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `competence_types`
--

DROP TABLE IF EXISTS `competence_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `competence_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `status_id` bigint(20) unsigned NOT NULL DEFAULT 1,
  `created_by` bigint(20) unsigned DEFAULT 1,
  `updated_by` bigint(20) unsigned DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `competence_types_status_id_index` (`status_id`),
  KEY `competence_types_company_id_branch_id_index` (`company_id`,`branch_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `competence_types_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `competence_types`
--

LOCK TABLES `competence_types` WRITE;
/*!40000 ALTER TABLE `competence_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `competence_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `competences`
--

DROP TABLE IF EXISTS `competences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `competences` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `competence_type_id` bigint(20) unsigned DEFAULT NULL,
  `status_id` bigint(20) unsigned NOT NULL DEFAULT 1,
  `created_by` bigint(20) unsigned DEFAULT 1,
  `updated_by` bigint(20) unsigned DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `competences_competence_type_id_foreign` (`competence_type_id`),
  KEY `competences_status_id_index` (`status_id`),
  KEY `competences_company_id_branch_id_index` (`company_id`,`branch_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `competences_competence_type_id_foreign` FOREIGN KEY (`competence_type_id`) REFERENCES `competence_types` (`id`) ON DELETE CASCADE,
  CONSTRAINT `competences_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `competences`
--

LOCK TABLES `competences` WRITE;
/*!40000 ALTER TABLE `competences` DISABLE KEYS */;
/*!40000 ALTER TABLE `competences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `contact_for` int(11) NOT NULL DEFAULT 0 COMMENT '1 for support,0 for query',
  `phone` varchar(255) DEFAULT NULL,
  `message` longtext NOT NULL,
  `contact_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 for unread,1 for read',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `contacts_company_id_branch_id_index` (`company_id`,`branch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conversations`
--

DROP TABLE IF EXISTS `conversations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conversations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` bigint(20) unsigned NOT NULL,
  `receiver_id` bigint(20) unsigned NOT NULL,
  `type` enum('notification','message') NOT NULL DEFAULT 'notification' COMMENT 'notification: notification, message: message',
  `title` varchar(255) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `image_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `conversations_sender_id_foreign` (`sender_id`),
  KEY `conversations_receiver_id_foreign` (`receiver_id`),
  KEY `conversations_image_id_foreign` (`image_id`),
  KEY `conversations_company_id_branch_id_index` (`company_id`,`branch_id`),
  CONSTRAINT `conversations_image_id_foreign` FOREIGN KEY (`image_id`) REFERENCES `uploads` (`id`),
  CONSTRAINT `conversations_receiver_id_foreign` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `conversations_sender_id_foreign` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conversations`
--

LOCK TABLES `conversations` WRITE;
/*!40000 ALTER TABLE `conversations` DISABLE KEYS */;
/*!40000 ALTER TABLE `conversations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `country_code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `time_zone` varchar(191) DEFAULT NULL,
  `currency_code` varchar(191) DEFAULT NULL,
  `currency_symbol` varchar(191) DEFAULT NULL,
  `currency_name` varchar(191) DEFAULT NULL,
  `currency_symbol_placement` enum('before','after') DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `countries_country_code_unique` (`country_code`),
  UNIQUE KEY `countries_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=239 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES
(1,'AF','Afghanistan','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:54','2024-02-06 05:41:55'),
(2,'AL','Albania','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:54','2024-02-06 05:41:55'),
(3,'DZ','Algeria','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:54','2024-02-06 05:41:55'),
(4,'AD','Andorra','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:54','2024-02-06 05:41:55'),
(5,'AO','Angola','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:54','2024-02-06 05:41:55'),
(6,'AI','Anguilla','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:54','2024-02-06 05:41:55'),
(7,'AQ','Antarctica','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:54','2024-02-06 05:41:55'),
(8,'AG','Antigua and Barbuda','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(9,'AR','Argentina','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(10,'AM','Armenia','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(11,'AW','Aruba','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(12,'AU','Australia','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(13,'AT','Austria','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(14,'AZ','Azerbaijan','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(15,'BS','Bahamas','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(16,'BH','Bahrain','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(17,'BD','Bangladesh','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(18,'BB','Barbados','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(19,'BY','Belarus','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(20,'BE','Belgium','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(21,'BZ','Belize','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(22,'BJ','Benin','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(23,'BM','Bermuda','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(24,'BT','Bhutan','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(25,'BO','Bolivia','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(26,'BA','Bosnia and Herzegovina','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(27,'BW','Botswana','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(28,'BR','Brazil','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(29,'IO','British Indian Ocean Territory','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(30,'BN','Brunei Darussalam','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(31,'BG','Bulgaria','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(32,'BF','Burkina Faso','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(33,'BI','Burundi','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(34,'KH','Cambodia','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(35,'CM','Cameroon','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(36,'CA','Canada','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(37,'CV','Cape Verde','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(38,'KY','Cayman Islands','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(39,'CF','Central African Republic','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(40,'TD','Chad','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(41,'CL','Chile','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(42,'CN','China','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(43,'CX','Christmas Island','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(44,'CC','Cocos (Keeling) Islands','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(45,'CO','Colombia','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(46,'KM','Comoros','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(47,'CD','Democratic Republic of the Congo','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(48,'CG','Republic of Congo','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(49,'CK','Cook Islands','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(50,'CR','Costa Rica','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(51,'HR','Croatia (Hrvatska)','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(52,'CU','Cuba','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(53,'CY','Cyprus','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(54,'CZ','Czech Republic','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(55,'DK','Denmark','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(56,'DJ','Djibouti','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(57,'DM','Dominica','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(58,'DO','Dominican Republic','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(59,'EC','Ecuador','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(60,'EG','Egypt','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(61,'SV','El Salvador','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(62,'GQ','Equatorial Guinea','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(63,'ER','Eritrea','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(64,'EE','Estonia','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(65,'ET','Ethiopia','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(66,'FK','Falkland Islands (Malvinas)','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(67,'FO','Faroe Islands','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(68,'FJ','Fiji','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(69,'FI','Finland','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(70,'FR','France','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(71,'GF','French Guiana','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(72,'PF','French Polynesia','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(73,'TF','French Southern Territories','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(74,'GA','Gabon','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(75,'GM','Gambia','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(76,'GE','Georgia','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(77,'DE','Germany','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(78,'GH','Ghana','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(79,'GI','Gibraltar','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(80,'GR','Greece','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(81,'GL','Greenland','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(82,'GD','Grenada','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(83,'GP','Guadeloupe','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(84,'GU','Guam','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(85,'GT','Guatemala','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(86,'GN','Guinea','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(87,'GW','Guinea-Bissau','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(88,'GY','Guyana','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(89,'HT','Haiti','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(90,'HN','Honduras','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(91,'HK','Hong Kong','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(92,'HU','Hungary','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(93,'IS','Iceland','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(94,'IN','India','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(95,'IM','Isle of Man','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(96,'ID','Indonesia','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(97,'IR','Iran (Islamic Republic of)','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(98,'IQ','Iraq','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(99,'IE','Ireland','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(100,'IL','Israel','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(101,'IT','Italy','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(102,'CI','Ivory Coast','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(103,'JE','Jersey','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(104,'JM','Jamaica','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(105,'JP','Japan','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(106,'JO','Jordan','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(107,'KZ','Kazakhstan','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(108,'KE','Kenya','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(109,'KI','Kiribati','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(110,'KP','Korea, Democratic People\'s Republic of','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(111,'KR','Korea, Republic of','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(112,'XK','Kosovo','',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(113,'KW','Kuwait','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(114,'KG','Kyrgyzstan','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(115,'LA','Lao People\'s Democratic Republic','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(116,'LV','Latvia','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(117,'LB','Lebanon','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(118,'LS','Lesotho','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(119,'LR','Liberia','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(120,'LY','Libyan Arab Jamahiriya','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(121,'LI','Liechtenstein','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(122,'LT','Lithuania','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(123,'LU','Luxembourg','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(124,'MO','Macau','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(125,'MK','North Macedonia','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(126,'MG','Madagascar','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(127,'MW','Malawi','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(128,'MY','Malaysia','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(129,'MV','Maldives','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(130,'ML','Mali','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(131,'MT','Malta','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(132,'MH','Marshall Islands','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(133,'MQ','Martinique','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(134,'MR','Mauritania','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(135,'MU','Mauritius','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(136,'MX','Mexico','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(137,'FM','Micronesia, Federated States of','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(138,'MD','Moldova, Republic of','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(139,'MC','Monaco','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(140,'MN','Mongolia','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(141,'ME','Montenegro','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(142,'MS','Montserrat','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(143,'MA','Morocco','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(144,'MZ','Mozambique','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(145,'MM','Myanmar','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(146,'NA','Namibia','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(147,'NR','Nauru','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(148,'NP','Nepal','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(149,'NL','Netherlands','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(150,'NC','New Caledonia','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(151,'NZ','New Zealand','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(152,'NI','Nicaragua','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(153,'NE','Niger','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(154,'NG','Nigeria','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(155,'NU','Niue','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(156,'NF','Norfolk Island','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(157,'MP','Northern Mariana Islands','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(158,'NO','Norway','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(159,'OM','Oman','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(160,'PK','Pakistan','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(161,'PW','Palau','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(162,'PS','Palestine','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(163,'PA','Panama','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(164,'PG','Papua New Guinea','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(165,'PY','Paraguay','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(166,'PE','Peru','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(167,'PH','Philippines','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(168,'PN','Pitcairn','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(169,'PL','Poland','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(170,'PT','Portugal','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(171,'PR','Puerto Rico','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(172,'QA','Qatar','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(173,'RE','Reunion','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(174,'RO','Romania','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(175,'RU','Russian Federation','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(176,'RW','Rwanda','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(177,'KN','Saint Kitts and Nevis','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(178,'LC','Saint Lucia','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(179,'VC','Saint Vincent and the Grenadines','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(180,'WS','Samoa','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(181,'SM','San Marino','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(182,'ST','Sao Tome and Principe','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(183,'SA','Saudi Arabia','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(184,'SN','Senegal','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(185,'RS','Serbia','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(186,'SC','Seychelles','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(187,'SL','Sierra Leone','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(188,'SG','Singapore','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(189,'SK','Slovakia','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(190,'SI','Slovenia','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(191,'SB','Solomon Islands','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(192,'SO','Somalia','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(193,'ZA','South Africa','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(194,'SS','South Sudan','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(195,'GS','South Georgia South Sandwich Islands','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(196,'ES','Spain','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(197,'LK','Sri Lanka','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(198,'SH','St. Helena','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(199,'PM','St. Pierre and Miquelon','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(200,'SD','Sudan','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(201,'SR','Suriname','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(202,'SJ','Svalbard and Jan Mayen Islands','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(203,'SZ','Swaziland','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(204,'SE','Sweden','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(205,'CH','Switzerland','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(206,'SY','Syrian Arab Republic','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(207,'TW','Taiwan','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(208,'TJ','Tajikistan','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(209,'TZ','Tanzania, United Republic of','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(210,'TH','Thailand','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(211,'TG','Togo','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(212,'TK','Tokelau','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(213,'TO','Tonga','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(214,'TT','Trinidad and Tobago','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(215,'TN','Tunisia','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(216,'TR','Turkey','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(217,'TM','Turkmenistan','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(218,'TC','Turks and Caicos Islands','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(219,'TV','Tuvalu','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(220,'UG','Uganda','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(221,'UA','Ukraine','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(222,'AE','United Arab Emirates','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(223,'GB','United Kingdom','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(224,'US','United States','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(225,'UM','United States minor outlying islands','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(226,'UY','Uruguay','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(227,'UZ','Uzbekistan','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(228,'VU','Vanuatu','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(229,'VA','Vatican City State','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(230,'VE','Venezuela','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(231,'VN','Vietnam','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(232,'VG','Virgin Islands (British)','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(233,'VI','Virgin Islands (U.S.)','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(234,'WF','Wallis and Futuna Islands','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(235,'EH','Western Sahara','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(236,'YE','Yemen','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(237,'ZM','Zambia','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55'),
(238,'ZW','Zimbabwe','Europe/Tirane',NULL,NULL,NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currencies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `symbol` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `currencies_company_id_branch_id_index` (`company_id`,`branch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencies`
--

LOCK TABLES `currencies` WRITE;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
INSERT INTO `currencies` VALUES
(1,'Leke','ALL','Lek','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(2,'Dollars','USD','$','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(3,'Afghanis','AFN','؋','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(4,'Pesos','ARS','$','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(5,'Guilders','AWG','ƒ','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(6,'Dollars','AUD','$','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(7,'New Manats','AZN','ман','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(8,'Dollars','BSD','$','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(9,'Dollars','BBD','$','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(10,'Rubles','BYR','p.','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(11,'Euro','EUR','€','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(12,'Dollars','BZD','BZ$','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(13,'Dollars','BMD','$','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(14,'Bolivianos','BOB','$b','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(15,'Convertible Marka','BAM','KM','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(16,'Pula','BWP','P','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(17,'Leva','BGN','лв','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(18,'Reais','BRL','R$','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(19,'Pounds','GBP','£','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(20,'Dollars','BND','$','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(21,'Riels','KHR','៛','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(22,'Dollars','CAD','$','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(23,'Dollars','KYD','$','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(24,'Pesos','CLP','$','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(25,'Yuan Renminbi','CNY','¥','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(26,'Pesos','COP','$','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(27,'Colón','CRC','₡','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(28,'Kuna','HRK','kn','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(29,'Pesos','CUP','₱','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(30,'Koruny','CZK','Kč','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(31,'Kroner','DKK','kr','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(32,'Pesos','DOP ','RD$','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(33,'Dollars','XCD','$','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(34,'Pounds','EGP','£','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(35,'Colones','SVC','$','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(36,'Pounds','FKP','£','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(37,'Dollars','FJD','$','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(38,'Cedis','GHC','¢','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(39,'Pounds','GIP','£','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(40,'Quetzales','GTQ','Q','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(41,'Pounds','GGP','£','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(42,'Dollars','GYD','$','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(43,'Lempiras','HNL','L','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(44,'Dollars','HKD','$','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(45,'Forint','HUF','Ft','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(46,'Kronur','ISK','kr','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(47,'Rupees','INR','₹','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(48,'Rupiahs','IDR','Rp','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(49,'Rials','IRR','﷼','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(50,'Pounds','IMP','£','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(51,'New Shekels','ILS','₪','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(52,'Dollars','JMD','J$','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(53,'Yen','JPY','¥','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(54,'Pounds','JEP','£','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(55,'Tenge','KZT','лв','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(56,'Won','KPW','₩','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(57,'Won','KRW','₩','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(58,'Soms','KGS','лв','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(59,'Kips','LAK','₭','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(60,'Lati','LVL','Ls','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(61,'Pounds','LBP','£','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(62,'Dollars','LRD','$','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(63,'Switzerland Francs','CHF','CHF','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(64,'Litai','LTL','Lt','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(65,'Denars','MKD','ден','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(66,'Ringgits','MYR','RM','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(67,'Rupees','MUR','₨','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(68,'Pesos','MXN','$','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(69,'Tugriks','MNT','₮','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(70,'Meticais','MZN','MT','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(71,'Dollars','NAD','$','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(72,'Rupees','NPR','₨','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(73,'Guilders','ANG','ƒ','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(74,'Dollars','NZD','$','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(75,'Cordobas','NIO','C$','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(76,'Nairas','NGN','₦','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(77,'Krone','NOK','kr','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(78,'Rials','OMR','﷼','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(79,'Rupees','PKR','₨','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(80,'Balboa','PAB','B/.','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(81,'Guarani','PYG','Gs','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(82,'Nuevos Soles','PEN','S/.','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(83,'Pesos','PHP','Php','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(84,'Zlotych','PLN','zł','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(85,'Rials','QAR','﷼','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(86,'New Lei','RON','lei','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(87,'Rubles','RUB','руб','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(88,'Pounds','SHP','£','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(89,'Riyals','SAR','﷼','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(90,'Dinars','RSD','Дин.','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(91,'Rupees','SCR','₨','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(92,'Dollars','SGD','$','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(93,'Dollars','SBD','$','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(94,'Shillings','SOS','S','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(95,'Rand','ZAR','R','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(96,'Rupees','LKR','₨','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(97,'Kronor','SEK','kr','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(98,'Dollars','SRD','$','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(99,'Pounds','SYP','£','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(100,'New Dollars','TWD','NT$','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(101,'Baht','THB','฿','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(102,'Dollars','TTD','TT$','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(103,'Lira','TRY','TL','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(104,'Liras','TRL','£','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(105,'Dollars','TVD','$','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(106,'Hryvnia','UAH','₴','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(107,'Pesos','UYU','$U','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(108,'Sums','UZS','лв','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(109,'Bolivares Fuertes','VEF','Bs','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(110,'Dong','VND','₫','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(111,'Rials','YER','﷼','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(112,'Taka','BDT','৳','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(113,'Zimbabwe Dollars','ZWD','Z$','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(114,'Kenya','KES','KSh','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(115,'Nigeria','naira','₦','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(116,'Ghana','GHS','GH₵','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(117,'Ethiopian','ETB','Br','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(118,'Tanzania','TZS','TSh','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(119,'Uganda','UGX','USh','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(120,'Rwandan','FRW','FRw','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(121,'UAE Dirham','AED','د.إ','2024-02-06 05:41:37','2024-02-06 05:41:37',1,1);
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `daily_leaves`
--

DROP TABLE IF EXISTS `daily_leaves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `daily_leaves` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `approved_by_tl` bigint(20) unsigned DEFAULT NULL,
  `approved_at_tl` timestamp NULL DEFAULT NULL,
  `approved_by_hr` bigint(20) unsigned DEFAULT NULL,
  `approved_at_hr` timestamp NULL DEFAULT NULL,
  `rejected_by_tl` bigint(20) unsigned DEFAULT NULL,
  `rejected_at_tl` timestamp NULL DEFAULT NULL,
  `rejected_by_hr` bigint(20) unsigned DEFAULT NULL,
  `rejected_at_hr` timestamp NULL DEFAULT NULL,
  `leave_type` enum('early_leave','late_arrive') DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `status_id` bigint(20) unsigned NOT NULL DEFAULT 1,
  `author_info_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `daily_leaves_user_id_foreign` (`user_id`),
  KEY `daily_leaves_approved_by_tl_foreign` (`approved_by_tl`),
  KEY `daily_leaves_approved_by_hr_foreign` (`approved_by_hr`),
  KEY `daily_leaves_rejected_by_tl_foreign` (`rejected_by_tl`),
  KEY `daily_leaves_rejected_by_hr_foreign` (`rejected_by_hr`),
  KEY `daily_leaves_author_info_id_foreign` (`author_info_id`),
  KEY `daily_leaves_company_id_branch_id_index` (`company_id`,`branch_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `daily_leaves_approved_by_hr_foreign` FOREIGN KEY (`approved_by_hr`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `daily_leaves_approved_by_tl_foreign` FOREIGN KEY (`approved_by_tl`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `daily_leaves_author_info_id_foreign` FOREIGN KEY (`author_info_id`) REFERENCES `author_infos` (`id`),
  CONSTRAINT `daily_leaves_rejected_by_hr_foreign` FOREIGN KEY (`rejected_by_hr`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `daily_leaves_rejected_by_tl_foreign` FOREIGN KEY (`rejected_by_tl`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `daily_leaves_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `daily_leaves_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daily_leaves`
--

LOCK TABLES `daily_leaves` WRITE;
/*!40000 ALTER TABLE `daily_leaves` DISABLE KEYS */;
/*!40000 ALTER TABLE `daily_leaves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `database_backups`
--

DROP TABLE IF EXISTS `database_backups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `database_backups` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `path` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `database_backups_company_id_branch_id_index` (`company_id`,`branch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `database_backups`
--

LOCK TABLES `database_backups` WRITE;
/*!40000 ALTER TABLE `database_backups` DISABLE KEYS */;
/*!40000 ALTER TABLE `database_backups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `date_formats`
--

DROP TABLE IF EXISTS `date_formats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `date_formats` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `format` varchar(255) DEFAULT NULL,
  `normal_view` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_by` int(11) DEFAULT 1,
  `updated_by` int(11) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `date_formats_company_id_branch_id_index` (`company_id`,`branch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `date_formats`
--

LOCK TABLES `date_formats` WRITE;
/*!40000 ALTER TABLE `date_formats` DISABLE KEYS */;
INSERT INTO `date_formats` VALUES
(1,'jS M, Y','17th May, 2019',1,1,1,'2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(2,'Y-m-d','2019-05-17',1,1,1,'2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(3,'Y-d-m','2019-17-05',1,1,1,'2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(4,'d-m-Y','17-05-2019',1,1,1,'2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(5,'m-d-Y','05-17-2019',1,1,1,'2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(6,'Y/m/d','2019/05/17',1,1,1,'2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(7,'Y/d/m','2019/17/05',1,1,1,'2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(8,'d/m/Y','17/05/2019',1,1,1,'2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(9,'m/d/Y','05/17/2019',1,1,1,'2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(10,'l jS \\of F Y','Monday 17th of May 2019',1,1,1,'2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(11,'jS \\of F Y','17th of May 2019',1,1,1,'2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(12,'g:ia \\o\\n l jS F Y','12:00am on Monday 17th May 2019',1,1,1,'2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(13,'F j, Y, g:i a','May 7, 2019, 6:20 pm',1,1,1,'2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(14,'F j, Y','May 17, 2019',1,1,1,'2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(15,'\\i\\t \\i\\s \\t\\h\\e jS \\d\\a\\y','it is the 17th day',1,1,1,'2024-02-06 05:41:37','2024-02-06 05:41:37',1,1);
/*!40000 ALTER TABLE `date_formats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `status_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `departments_status_id_foreign` (`status_id`),
  KEY `departments_company_id_branch_id_index` (`company_id`,`branch_id`),
  CONSTRAINT `departments_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES
(1,'Management',1,NULL,NULL,NULL,1,1),
(2,'IT',1,NULL,NULL,NULL,1,1),
(3,'Sales',1,NULL,NULL,NULL,1,1);
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deposits`
--

DROP TABLE IF EXISTS `deposits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deposits` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT 1,
  `income_expense_category_id` bigint(20) unsigned NOT NULL,
  `date` date NOT NULL,
  `amount` double(16,2) DEFAULT NULL,
  `request_amount` double(16,2) NOT NULL DEFAULT 0.00,
  `ref` varchar(200) DEFAULT NULL,
  `payment_method_id` bigint(20) unsigned DEFAULT NULL,
  `transaction_id` bigint(20) unsigned DEFAULT NULL,
  `pay` bigint(20) unsigned NOT NULL DEFAULT 9,
  `status_id` bigint(20) unsigned NOT NULL DEFAULT 2,
  `approver_id` bigint(20) unsigned DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `created_by` bigint(20) unsigned NOT NULL DEFAULT 1,
  `updated_by` bigint(20) unsigned NOT NULL DEFAULT 1,
  `attachment` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `deposits_income_expense_category_id_foreign` (`income_expense_category_id`),
  KEY `deposits_attachment_foreign` (`attachment`),
  KEY `deposits_amount_date_index` (`amount`,`date`),
  KEY `deposits_company_id_branch_id_index` (`company_id`,`branch_id`),
  KEY `user_id` (`user_id`),
  KEY `payment_method_id` (`payment_method_id`),
  KEY `transaction_id` (`transaction_id`),
  KEY `pay` (`pay`),
  KEY `status_id` (`status_id`),
  KEY `approver_id` (`approver_id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  CONSTRAINT `deposits_approver_id_foreign` FOREIGN KEY (`approver_id`) REFERENCES `users` (`id`),
  CONSTRAINT `deposits_attachment_foreign` FOREIGN KEY (`attachment`) REFERENCES `uploads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `deposits_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `deposits_income_expense_category_id_foreign` FOREIGN KEY (`income_expense_category_id`) REFERENCES `income_expense_categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `deposits_pay_foreign` FOREIGN KEY (`pay`) REFERENCES `statuses` (`id`),
  CONSTRAINT `deposits_payment_method_id_foreign` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`),
  CONSTRAINT `deposits_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `deposits_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`),
  CONSTRAINT `deposits_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`),
  CONSTRAINT `deposits_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deposits`
--

LOCK TABLES `deposits` WRITE;
/*!40000 ALTER TABLE `deposits` DISABLE KEYS */;
/*!40000 ALTER TABLE `deposits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `designations`
--

DROP TABLE IF EXISTS `designations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `designations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `status_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `designations_status_id_foreign` (`status_id`),
  KEY `designations_company_id_branch_id_index` (`company_id`,`branch_id`),
  CONSTRAINT `designations_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `designations`
--

LOCK TABLES `designations` WRITE;
/*!40000 ALTER TABLE `designations` DISABLE KEYS */;
INSERT INTO `designations` VALUES
(1,'Admin',1,NULL,NULL,NULL,1,1),
(2,'HR',1,NULL,NULL,NULL,1,1),
(3,'Staff',1,NULL,NULL,NULL,1,1);
/*!40000 ALTER TABLE `designations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discussion_comments`
--

DROP TABLE IF EXISTS `discussion_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discussion_comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned DEFAULT NULL,
  `description` longtext NOT NULL,
  `show_to_customer` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0=no,1=yes',
  `discussion_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `attachment` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `discussion_comments_user_id_foreign` (`user_id`),
  KEY `discussion_comments_attachment_foreign` (`attachment`),
  KEY `discussion_comments_discussion_id_user_id_index` (`discussion_id`,`user_id`),
  KEY `discussion_comments_company_id_branch_id_index` (`company_id`,`branch_id`),
  CONSTRAINT `discussion_comments_attachment_foreign` FOREIGN KEY (`attachment`) REFERENCES `uploads` (`id`),
  CONSTRAINT `discussion_comments_discussion_id_foreign` FOREIGN KEY (`discussion_id`) REFERENCES `discussions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `discussion_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discussion_comments`
--

LOCK TABLES `discussion_comments` WRITE;
/*!40000 ALTER TABLE `discussion_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `discussion_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discussion_likes`
--

DROP TABLE IF EXISTS `discussion_likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discussion_likes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `discussion_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `like` int(11) DEFAULT 0,
  `dislike` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `discussion_likes_discussion_id_foreign` (`discussion_id`),
  KEY `discussion_likes_user_id_foreign` (`user_id`),
  KEY `discussion_likes_company_id_branch_id_index` (`company_id`,`branch_id`),
  CONSTRAINT `discussion_likes_discussion_id_foreign` FOREIGN KEY (`discussion_id`) REFERENCES `discussions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `discussion_likes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discussion_likes`
--

LOCK TABLES `discussion_likes` WRITE;
/*!40000 ALTER TABLE `discussion_likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `discussion_likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discussions`
--

DROP TABLE IF EXISTS `discussions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discussions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `project_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `show_to_customer` bigint(20) unsigned NOT NULL DEFAULT 22,
  `status_id` bigint(20) unsigned NOT NULL DEFAULT 1,
  `last_activity` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `discussions_user_id_foreign` (`user_id`),
  KEY `discussions_project_id_status_id_user_id_index` (`project_id`,`status_id`,`user_id`),
  KEY `discussions_company_id_branch_id_index` (`company_id`,`branch_id`),
  KEY `show_to_customer` (`show_to_customer`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `discussions_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `discussions_show_to_customer_foreign` FOREIGN KEY (`show_to_customer`) REFERENCES `statuses` (`id`),
  CONSTRAINT `discussions_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `discussions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discussions`
--

LOCK TABLES `discussions` WRITE;
/*!40000 ALTER TABLE `discussions` DISABLE KEYS */;
/*!40000 ALTER TABLE `discussions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `domains`
--

DROP TABLE IF EXISTS `domains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `domains` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `domain` varchar(255) NOT NULL,
  `tenant_id` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `domains_domain_unique` (`domain`),
  KEY `domains_tenant_id_foreign` (`tenant_id`),
  KEY `domains_company_id_branch_id_index` (`company_id`,`branch_id`),
  CONSTRAINT `domains_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `tenants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `domains`
--

LOCK TABLES `domains` WRITE;
/*!40000 ALTER TABLE `domains` DISABLE KEYS */;
/*!40000 ALTER TABLE `domains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `duty_schedules`
--

DROP TABLE IF EXISTS `duty_schedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `duty_schedules` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `shift_id` bigint(20) unsigned NOT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `consider_time` varchar(255) DEFAULT '0',
  `hour` int(11) NOT NULL DEFAULT 0,
  `status_id` bigint(20) unsigned NOT NULL,
  `end_on_same_date` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `duty_schedules_shift_id_foreign` (`shift_id`),
  KEY `duty_schedules_status_id_foreign` (`status_id`),
  KEY `duty_schedules_id_index` (`id`),
  KEY `duty_schedules_company_id_branch_id_index` (`company_id`,`branch_id`),
  CONSTRAINT `duty_schedules_shift_id_foreign` FOREIGN KEY (`shift_id`) REFERENCES `shifts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `duty_schedules_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `duty_schedules`
--

LOCK TABLES `duty_schedules` WRITE;
/*!40000 ALTER TABLE `duty_schedules` DISABLE KEYS */;
INSERT INTO `duty_schedules` VALUES
(1,1,'10:00:00','18:00:00','15',8,1,1,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(2,2,'15:00:00','23:00:00','15',8,1,1,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(3,3,'23:00:00','07:00:00','15',8,1,1,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1);
/*!40000 ALTER TABLE `duty_schedules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_breaks`
--

DROP TABLE IF EXISTS `employee_breaks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_breaks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `date` date NOT NULL,
  `break_time` time DEFAULT NULL,
  `back_time` time DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `employee_breaks_user_id_foreign` (`user_id`),
  KEY `employee_breaks_company_id_branch_id_index` (`company_id`,`branch_id`),
  CONSTRAINT `employee_breaks_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_breaks`
--

LOCK TABLES `employee_breaks` WRITE;
/*!40000 ALTER TABLE `employee_breaks` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_breaks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_tasks`
--

DROP TABLE IF EXISTS `employee_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_tasks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `assigned_id` bigint(20) unsigned NOT NULL,
  `created_by` bigint(20) unsigned NOT NULL,
  `due_date` date DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `attachment_file_id` bigint(20) unsigned DEFAULT NULL,
  `status_id` bigint(20) unsigned NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `employee_tasks_assigned_id_foreign` (`assigned_id`),
  KEY `employee_tasks_created_by_foreign` (`created_by`),
  KEY `employee_tasks_attachment_file_id_foreign` (`attachment_file_id`),
  KEY `employee_tasks_company_id_branch_id_index` (`company_id`,`branch_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `employee_tasks_assigned_id_foreign` FOREIGN KEY (`assigned_id`) REFERENCES `users` (`id`),
  CONSTRAINT `employee_tasks_attachment_file_id_foreign` FOREIGN KEY (`attachment_file_id`) REFERENCES `uploads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `employee_tasks_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `employee_tasks_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_tasks`
--

LOCK TABLES `employee_tasks` WRITE;
/*!40000 ALTER TABLE `employee_tasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expense_claim_details`
--

DROP TABLE IF EXISTS `expense_claim_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expense_claim_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `hrm_expense_id` bigint(20) unsigned NOT NULL,
  `expense_claim_id` bigint(20) unsigned NOT NULL,
  `amount` double(15,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `expense_claim_details_user_id_foreign` (`user_id`),
  KEY `expense_claim_details_hrm_expense_id_foreign` (`hrm_expense_id`),
  KEY `expense_claim_details_expense_claim_id_foreign` (`expense_claim_id`),
  KEY `expense_claim_details_company_id_branch_id_index` (`company_id`,`branch_id`),
  CONSTRAINT `expense_claim_details_expense_claim_id_foreign` FOREIGN KEY (`expense_claim_id`) REFERENCES `expense_claims` (`id`) ON DELETE CASCADE,
  CONSTRAINT `expense_claim_details_hrm_expense_id_foreign` FOREIGN KEY (`hrm_expense_id`) REFERENCES `hrm_expenses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `expense_claim_details_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expense_claim_details`
--

LOCK TABLES `expense_claim_details` WRITE;
/*!40000 ALTER TABLE `expense_claim_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `expense_claim_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expense_claims`
--

DROP TABLE IF EXISTS `expense_claims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expense_claims` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `invoice_number` varchar(191) DEFAULT NULL COMMENT 'invoice number',
  `claim_date` date DEFAULT NULL COMMENT 'date of claim',
  `remarks` varchar(191) DEFAULT NULL COMMENT 'remarks of payment',
  `payable_amount` double(10,2) DEFAULT NULL COMMENT 'amount of payment',
  `due_amount` double(10,2) DEFAULT NULL COMMENT 'due amount of payment',
  `attachment_file_id` bigint(20) unsigned DEFAULT NULL,
  `status_id` bigint(20) unsigned NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `expense_claims_invoice_number_unique` (`invoice_number`),
  KEY `expense_claims_user_id_foreign` (`user_id`),
  KEY `expense_claims_attachment_file_id_foreign` (`attachment_file_id`),
  KEY `expense_claims_company_id_branch_id_index` (`company_id`,`branch_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `expense_claims_attachment_file_id_foreign` FOREIGN KEY (`attachment_file_id`) REFERENCES `uploads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `expense_claims_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `expense_claims_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expense_claims`
--

LOCK TABLES `expense_claims` WRITE;
/*!40000 ALTER TABLE `expense_claims` DISABLE KEYS */;
/*!40000 ALTER TABLE `expense_claims` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expenses`
--

DROP TABLE IF EXISTS `expenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expenses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT 1,
  `income_expense_category_id` bigint(20) unsigned NOT NULL,
  `date` date NOT NULL,
  `amount` double(16,2) DEFAULT NULL,
  `request_amount` double(16,2) NOT NULL DEFAULT 0.00,
  `pay` bigint(20) unsigned NOT NULL DEFAULT 9,
  `status_id` bigint(20) unsigned NOT NULL DEFAULT 2,
  `ref` varchar(200) DEFAULT NULL,
  `transaction_id` bigint(20) unsigned DEFAULT NULL,
  `payment_method_id` bigint(20) unsigned DEFAULT NULL,
  `approver_id` bigint(20) unsigned DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `created_by` bigint(20) unsigned NOT NULL DEFAULT 1,
  `updated_by` bigint(20) unsigned NOT NULL DEFAULT 1,
  `attachment` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `expenses_income_expense_category_id_foreign` (`income_expense_category_id`),
  KEY `expenses_attachment_foreign` (`attachment`),
  KEY `expenses_amount_date_index` (`amount`,`date`),
  KEY `expenses_company_id_branch_id_index` (`company_id`,`branch_id`),
  KEY `user_id` (`user_id`),
  KEY `pay` (`pay`),
  KEY `status_id` (`status_id`),
  KEY `transaction_id` (`transaction_id`),
  KEY `payment_method_id` (`payment_method_id`),
  KEY `approver_id` (`approver_id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  CONSTRAINT `expenses_approver_id_foreign` FOREIGN KEY (`approver_id`) REFERENCES `users` (`id`),
  CONSTRAINT `expenses_attachment_foreign` FOREIGN KEY (`attachment`) REFERENCES `uploads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `expenses_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `expenses_income_expense_category_id_foreign` FOREIGN KEY (`income_expense_category_id`) REFERENCES `income_expense_categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `expenses_pay_foreign` FOREIGN KEY (`pay`) REFERENCES `statuses` (`id`),
  CONSTRAINT `expenses_payment_method_id_foreign` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`),
  CONSTRAINT `expenses_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `expenses_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`),
  CONSTRAINT `expenses_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`),
  CONSTRAINT `expenses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expenses`
--

LOCK TABLES `expenses` WRITE;
/*!40000 ALTER TABLE `expenses` DISABLE KEYS */;
/*!40000 ALTER TABLE `expenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expire_notifications`
--

DROP TABLE IF EXISTS `expire_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expire_notifications` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `receiver_id` bigint(20) unsigned NOT NULL COMMENT 'it will come from user table',
  `employee_id` bigint(20) unsigned NOT NULL COMMENT 'it will come from user table',
  `branch_id` bigint(20) unsigned NOT NULL DEFAULT 1,
  `company_id` bigint(20) unsigned NOT NULL DEFAULT 1,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `is_read` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expire_notifications`
--

LOCK TABLES `expire_notifications` WRITE;
/*!40000 ALTER TABLE `expire_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `expire_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`),
  KEY `failed_jobs_company_id_branch_id_index` (`company_id`,`branch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `features`
--

DROP TABLE IF EXISTS `features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `features` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('company_growth','advance_features','awesome_features') DEFAULT NULL,
  `attachment_file_id` bigint(20) unsigned DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `short_description` varchar(255) DEFAULT NULL,
  `long_description` longtext DEFAULT NULL,
  `status_id` bigint(20) unsigned NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `features_attachment_file_id_foreign` (`attachment_file_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `features_attachment_file_id_foreign` FOREIGN KEY (`attachment_file_id`) REFERENCES `uploads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `features_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `features`
--

LOCK TABLES `features` WRITE;
/*!40000 ALTER TABLE `features` DISABLE KEYS */;
INSERT INTO `features` VALUES
(1,'company_growth',NULL,'Employee-Centric','Make the lives of your employees less problematic. Try to create an atmosphere where your employees feel like giving their best every day. You can only expect more work efficiency if you are able to keep your employees happier.','Make the lives of your employees less problematic. Try to create an atmosphere where your employees feel like giving their best every day. You can only expect more work efficiency if you are able to keep your employees happier.',1,'2024-02-06 05:41:56','2024-02-06 05:41:56'),
(2,'company_growth',NULL,'Development-Centric','To meet your business demands, it is very crucial to meet current and future growth requirements. For fulfilling them, employees’ development is a must. Through your agile strategies and planning it out beforehand can be helpful to reach your goals.','To meet your business demands, it is very crucial to meet current and future growth requirements. For fulfilling them, employees’ development is a must. Through your agile strategies and planning it out beforehand can be helpful to reach your goals.',1,'2024-02-06 05:41:56','2024-02-06 05:41:56'),
(3,'company_growth',NULL,'Individual Progress','Having the ability to develop individual relationships with the employees can be beneficial for any company. You can easily get to know their general behavior, social aspects of life, emotional well- being and act upon it to improve employee experience.','Having the ability to develop individual relationships with the employees can be beneficial for any company. You can easily get to know their general behavior, social aspects of life, emotional well- being and act upon it to improve employee experience.',1,'2024-02-06 05:41:56','2024-02-06 05:41:56'),
(4,'company_growth',NULL,'Decision Making','It is very essential to know how to use data rather than just collecting them. Crunching data after getting helpful information can make an impact on decision-making. Easily dive into future possibilities, also analyze potential outcomes beforehand.','It is very essential to know how to use data rather than just collecting them. Crunching data after getting helpful information can make an impact on decision-making. Easily dive into future possibilities, also analyze potential outcomes beforehand.',1,'2024-02-06 05:41:56','2024-02-06 05:41:56'),
(5,'company_growth',NULL,'Continuity','It may occur to anybody, even the HR management people can get sick. Keeping constant workflow and overcome such disruptions, it is vital to get notified earlier or get to know employees’ health condition, effectiveness, feelings towards their job.','It may occur to anybody, even the HR management people can get sick. Keeping constant workflow and overcome such disruptions, it is vital to get notified earlier or get to know employees’ health condition, effectiveness, feelings towards their job.',1,'2024-02-06 05:41:56','2024-02-06 05:41:56'),
(6,'company_growth',NULL,'Universal','Universality is the most vital feature for HRM software. It really doesn’t matter if you are running only a two-person job or a company of 500+ employees, this software is applicable for any. It is truly reliable for any type of organization.','Universality is the most vital feature for HRM software. It really doesn’t matter if you are running only a two-person job or a company of 500+ employees, this software is applicable for any. It is truly reliable for any type of organization.',1,'2024-02-06 05:41:56','2024-02-06 05:41:56'),
(7,'advance_features',NULL,'Leave','Employees can express their Leave Type, Find Assigned Leaves and get Leave Request approval. They can also submit necessary documents to ensure the validity of their leave.','Employees can express their Leave Type, Find Assigned Leaves and get Leave Request approval. They can also submit necessary documents to ensure the validity of their leave.',1,'2024-02-06 05:41:56','2024-02-06 05:41:56'),
(8,'advance_features',NULL,'Attendance','Records employees’ In /Out time, Working hours, Overtime automatically in its system. Whether they are working from home or office, their activities can be easily traceable to authority.','Records employees’ In /Out time, Working hours, Overtime automatically in its system. Whether they are working from home or office, their activities can be easily traceable to authority.',1,'2024-02-06 05:41:56','2024-02-06 05:41:56'),
(9,'advance_features',NULL,'Expense','For any additional expenses, managing legal claims or keeping track on payment history can be easily done in few clicks. You can also Keep an updated routine for any additional disbursement.','For any additional expenses, managing legal claims or keeping track on payment history can be easily done in few clicks. You can also Keep an updated routine for any additional disbursement.',1,'2024-02-06 05:41:56','2024-02-06 05:41:56'),
(10,'advance_features',NULL,'Visit','For outdoor visits or participating in crucial meetings, employees can input their check in/out timings too. Also such visits can be monitored by the officials anytime of the day.','For outdoor visits or participating in crucial meetings, employees can input their check in/out timings too. Also such visits can be monitored by the officials anytime of the day.',1,'2024-02-06 05:41:56','2024-02-06 05:41:56'),
(11,'advance_features',NULL,'Notice','Let everyone aware of any upcoming events, disciplinary, holidays at once. You can also update any notice for individuals, departmental wise or even for all without any effort.','Let everyone aware of any upcoming events, disciplinary, holidays at once. You can also update any notice for individuals, departmental wise or even for all without any effort.',1,'2024-02-06 05:41:56','2024-02-06 05:41:56'),
(12,'advance_features',NULL,'Report','Collects data of individuals -Working days/On time/Late Comings/Early Leave/Overtime and creates monthly/half-yearly, annual report based on their regular performance.','Collects data of individuals -Working days/On time/Late Comings/Early Leave/Overtime and creates monthly/half-yearly, annual report based on their regular performance.',1,'2024-02-06 05:41:56','2024-02-06 05:41:56'),
(13,'awesome_features',NULL,'Employee Data','Records everything that indicates all necessary information for any of the employees.','Records everything that indicates all necessary information for any of the employees.',1,'2024-02-06 05:41:56','2024-02-06 05:41:56'),
(14,'awesome_features',NULL,'Custom Permission','Provide accessibility to the designated personnel for further analysis of any individual.','Provide accessibility to the designated personnel for further analysis of any individual.',1,'2024-02-06 05:41:56','2024-02-06 05:41:56'),
(15,'awesome_features',NULL,'Employee Onboarding','Onboard employees online and make a remarkable first impression during the process.','Onboard employees online and make a remarkable first impression during the process.',1,'2024-02-06 05:41:56','2024-02-06 05:41:56'),
(16,'awesome_features',NULL,'Announcement','Celebrate special moments with everyone in the company with a few words.','Celebrate special moments with everyone in the company with a few words.',1,'2024-02-06 05:41:56','2024-02-06 05:41:56'),
(17,'awesome_features',NULL,'Custom Profile','You can also get to customize your own profile as you may seem right for the company.','You can also get to customize your own profile as you may seem right for the company.',1,'2024-02-06 05:41:56','2024-02-06 05:41:56'),
(18,'awesome_features',NULL,'Project & Tasks','Allows transparent access to overview employee’s assigned tasks for daily reports.','Allows transparent access to overview employee’s assigned tasks for daily reports.',1,'2024-02-06 05:41:56','2024-02-06 05:41:56');
/*!40000 ALTER TABLE `features` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goal_types`
--

DROP TABLE IF EXISTS `goal_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goal_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `status_id` bigint(20) unsigned NOT NULL DEFAULT 1,
  `created_by` bigint(20) unsigned DEFAULT 1,
  `updated_by` bigint(20) unsigned DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `goal_types_status_id_company_id_branch_id_index` (`status_id`,`company_id`,`branch_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `goal_types_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goal_types`
--

LOCK TABLES `goal_types` WRITE;
/*!40000 ALTER TABLE `goal_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `goal_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goals`
--

DROP TABLE IF EXISTS `goals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goals` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) DEFAULT NULL,
  `target` varchar(255) DEFAULT NULL,
  `goal_type_id` bigint(20) unsigned DEFAULT NULL,
  `progress` int(11) DEFAULT 0,
  `status_id` bigint(20) unsigned NOT NULL DEFAULT 24,
  `description` longtext DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `rating` int(11) DEFAULT 0,
  `created_by` bigint(20) unsigned NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `goals_goal_type_id_foreign` (`goal_type_id`),
  KEY `goals_status_id_company_id_branch_id_index` (`status_id`,`company_id`,`branch_id`),
  KEY `status_id` (`status_id`),
  KEY `created_by` (`created_by`),
  CONSTRAINT `goals_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `goals_goal_type_id_foreign` FOREIGN KEY (`goal_type_id`) REFERENCES `goal_types` (`id`) ON DELETE CASCADE,
  CONSTRAINT `goals_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goals`
--

LOCK TABLES `goals` WRITE;
/*!40000 ALTER TABLE `goals` DISABLE KEYS */;
/*!40000 ALTER TABLE `goals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `holidays`
--

DROP TABLE IF EXISTS `holidays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `holidays` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `type` varchar(191) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `attachment_id` bigint(20) unsigned DEFAULT NULL,
  `status_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `holidays_attachment_id_foreign` (`attachment_id`),
  KEY `holidays_status_id_company_id_branch_id_index` (`status_id`,`company_id`,`branch_id`),
  CONSTRAINT `holidays_attachment_id_foreign` FOREIGN KEY (`attachment_id`) REFERENCES `uploads` (`id`),
  CONSTRAINT `holidays_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `holidays`
--

LOCK TABLES `holidays` WRITE;
/*!40000 ALTER TABLE `holidays` DISABLE KEYS */;
INSERT INTO `holidays` VALUES
(1,'New Year','Public Holiday','','2023-01-01','2023-01-01',NULL,1,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(2,'Sheikh Mujib\'s Birthday','Public Holiday','','2023-03-17','2023-03-17',NULL,1,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(3,'Independence Day','Public Holiday','','2023-03-26','2023-03-26',NULL,1,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(4,'Bengali New Year','Public Holiday','','2023-04-14','2023-04-14',NULL,1,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(5,'Good Friday','Public Holiday','','2023-04-21','2023-04-21',NULL,1,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(6,'May Day','Public Holiday','','2023-05-01','2023-05-01',NULL,1,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(7,'Buddha Purnima','Public Holiday','','2023-05-07','2023-05-07',NULL,1,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(8,'Jumatul Bidah','Public Holiday','','2023-05-17','2023-05-17',NULL,1,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(9,'Eid ul-Fitr','Public Holiday','','2023-05-21','2023-05-21',NULL,1,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(10,'National Mourning Day','Public Holiday','','2023-06-07','2023-06-07',NULL,1,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(11,'National Mourning Day','Public Holiday','','2023-08-15','2023-08-15',NULL,1,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(12,'Durga Puja','Public Holiday','','2023-10-02','2023-10-02',NULL,1,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(13,'Eid ul-Adha','Public Holiday','','2023-10-19','2023-10-19',NULL,1,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(14,'Muharram','Public Holiday','','2023-11-10','2023-11-10',NULL,1,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(15,'Victory Day','Public Holiday','','2023-12-16','2023-12-16',NULL,1,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(16,'Christmas Day','Public Holiday','','2023-12-25','2023-12-25',NULL,1,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1);
/*!40000 ALTER TABLE `holidays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_pages`
--

DROP TABLE IF EXISTS `home_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `home_pages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `contents` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`contents`)),
  `status_id` bigint(20) unsigned NOT NULL DEFAULT 1,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `home_pages_status_id_company_id_branch_id_index` (`status_id`,`company_id`,`branch_id`),
  KEY `status_id` (`status_id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  CONSTRAINT `home_pages_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `home_pages_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `home_pages_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_pages`
--

LOCK TABLES `home_pages` WRITE;
/*!40000 ALTER TABLE `home_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `home_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hrm_expenses`
--

DROP TABLE IF EXISTS `hrm_expenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hrm_expenses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `income_expense_category_id` bigint(20) unsigned NOT NULL,
  `date` date DEFAULT NULL COMMENT 'date of expense',
  `remarks` varchar(191) DEFAULT NULL COMMENT 'remarks of expense',
  `amount` double(10,2) DEFAULT NULL COMMENT 'amount of expense',
  `attachment_file_id` bigint(20) unsigned DEFAULT NULL,
  `status_id` bigint(20) unsigned NOT NULL DEFAULT 1,
  `is_claimed_status_id` bigint(20) unsigned NOT NULL,
  `claimed_approved_status_id` bigint(20) unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `hrm_expenses_user_id_foreign` (`user_id`),
  KEY `hrm_expenses_income_expense_category_id_foreign` (`income_expense_category_id`),
  KEY `hrm_expenses_attachment_file_id_foreign` (`attachment_file_id`),
  KEY `hrm_expenses_status_id_company_id_branch_id_index` (`status_id`,`company_id`,`branch_id`),
  KEY `status_id` (`status_id`),
  KEY `claimed_status_id` (`is_claimed_status_id`),
  KEY `claimed_approved_status_id` (`claimed_approved_status_id`),
  CONSTRAINT `hrm_expenses_attachment_file_id_foreign` FOREIGN KEY (`attachment_file_id`) REFERENCES `uploads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `hrm_expenses_claimed_approved_status_id_foreign` FOREIGN KEY (`claimed_approved_status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `hrm_expenses_income_expense_category_id_foreign` FOREIGN KEY (`income_expense_category_id`) REFERENCES `income_expense_categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `hrm_expenses_is_claimed_status_id_foreign` FOREIGN KEY (`is_claimed_status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `hrm_expenses_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `hrm_expenses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hrm_expenses`
--

LOCK TABLES `hrm_expenses` WRITE;
/*!40000 ALTER TABLE `hrm_expenses` DISABLE KEYS */;
/*!40000 ALTER TABLE `hrm_expenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hrm_languages`
--

DROP TABLE IF EXISTS `hrm_languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hrm_languages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `is_default` int(11) NOT NULL DEFAULT 0,
  `status_id` bigint(20) unsigned NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `hrm_languages_status_id_company_id_branch_id_index` (`status_id`,`company_id`,`branch_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `hrm_languages_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hrm_languages`
--

LOCK TABLES `hrm_languages` WRITE;
/*!40000 ALTER TABLE `hrm_languages` DISABLE KEYS */;
INSERT INTO `hrm_languages` VALUES
(1,19,1,1,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1);
/*!40000 ALTER TABLE `hrm_languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `income_expense_categories`
--

DROP TABLE IF EXISTS `income_expense_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `income_expense_categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `is_income` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=Expense, 1=Income',
  `attachment_file_id` bigint(20) unsigned DEFAULT NULL,
  `status_id` bigint(20) unsigned NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `income_expense_categories_attachment_file_id_foreign` (`attachment_file_id`),
  KEY `income_expense_categories_company_id_branch_id_index` (`company_id`,`branch_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `income_expense_categories_attachment_file_id_foreign` FOREIGN KEY (`attachment_file_id`) REFERENCES `uploads` (`id`),
  CONSTRAINT `income_expense_categories_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `income_expense_categories`
--

LOCK TABLES `income_expense_categories` WRITE;
/*!40000 ALTER TABLE `income_expense_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `income_expense_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `indicators`
--

DROP TABLE IF EXISTS `indicators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `indicators` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `department_id` bigint(20) unsigned DEFAULT NULL,
  `shift_id` bigint(20) unsigned DEFAULT NULL,
  `designation_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `rates` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`rates`)),
  `rating` double(8,2) DEFAULT NULL,
  `added_by` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  `status_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `indicators_department_id_foreign` (`department_id`),
  KEY `indicators_shift_id_foreign` (`shift_id`),
  KEY `indicators_designation_id_foreign` (`designation_id`),
  KEY `indicators_added_by_foreign` (`added_by`),
  KEY `indicators_status_id_company_id_branch_id_index` (`status_id`,`company_id`,`branch_id`),
  CONSTRAINT `indicators_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `indicators_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `indicators_designation_id_foreign` FOREIGN KEY (`designation_id`) REFERENCES `designations` (`id`) ON DELETE CASCADE,
  CONSTRAINT `indicators_shift_id_foreign` FOREIGN KEY (`shift_id`) REFERENCES `shifts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `indicators_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `indicators`
--

LOCK TABLES `indicators` WRITE;
/*!40000 ALTER TABLE `indicators` DISABLE KEYS */;
/*!40000 ALTER TABLE `indicators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip_setups`
--

DROP TABLE IF EXISTS `ip_setups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ip_setups` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `location` varchar(255) NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `status_id` bigint(20) unsigned NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `ip_setups_status_id_company_id_branch_id_index` (`status_id`,`company_id`,`branch_id`),
  CONSTRAINT `ip_setups_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip_setups`
--

LOCK TABLES `ip_setups` WRITE;
/*!40000 ALTER TABLE `ip_setups` DISABLE KEYS */;
/*!40000 ALTER TABLE `ip_setups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jitsi_meetings`
--

DROP TABLE IF EXISTS `jitsi_meetings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jitsi_meetings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `meeting_id` text DEFAULT NULL,
  `time_start_before` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  `status_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `jitsi_meetings_status_id_company_id_branch_id_index` (`status_id`,`company_id`,`branch_id`),
  CONSTRAINT `jitsi_meetings_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jitsi_meetings`
--

LOCK TABLES `jitsi_meetings` WRITE;
/*!40000 ALTER TABLE `jitsi_meetings` DISABLE KEYS */;
/*!40000 ALTER TABLE `jitsi_meetings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `jobs_company_id_branch_id_index` (`company_id`,`branch_id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `languages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `native` varchar(255) DEFAULT NULL,
  `rtl` tinyint(4) DEFAULT 0,
  `status` tinyint(4) DEFAULT 1 COMMENT '1=active, 0=inactive',
  `json_exist` tinyint(4) DEFAULT 0,
  `is_default` tinyint(4) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `languages_status_company_id_branch_id_index` (`status`,`company_id`,`branch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES
(1,'af','Afrikaans','Afrikaans',0,0,0,0,NULL,NULL,1,1),
(2,'am','Amharic','አማርኛ',0,0,0,0,NULL,NULL,1,1),
(3,'ar','Arabic','العربية',1,1,0,0,NULL,NULL,1,1),
(4,'ay','Aymara','Aymar',0,0,0,0,NULL,NULL,1,1),
(5,'az','Azerbaijani','Azərbaycanca / آذربايجان',0,0,0,0,NULL,NULL,1,1),
(6,'be','Belarusian','Беларуская',0,0,0,0,NULL,NULL,1,1),
(7,'bg','Bulgarian','Български',0,0,0,0,NULL,NULL,1,1),
(8,'bi','Bislama','Bislama',0,0,0,0,NULL,NULL,1,1),
(9,'bn','Bengali','বাংলা',0,1,0,0,NULL,NULL,1,1),
(10,'bs','Bosnian','Bosanski',0,0,0,0,NULL,NULL,1,1),
(11,'ca','Catalan','Català',0,0,0,0,NULL,NULL,1,1),
(12,'ch','Chamorro','Chamoru',0,0,0,0,NULL,NULL,1,1),
(13,'cs','Czech','Česky',0,0,0,0,NULL,NULL,1,1),
(14,'da','Danish','Dansk',0,0,0,0,NULL,NULL,1,1),
(15,'de','German','Deutsch',0,0,0,0,NULL,NULL,1,1),
(16,'dv','Divehi','ދިވެހިބަސް',1,0,0,0,NULL,NULL,1,1),
(17,'dz','Dzongkha','ཇོང་ཁ',0,0,0,0,NULL,NULL,1,1),
(18,'el','Greek','Ελληνικά',0,0,0,0,NULL,NULL,1,1),
(19,'en','English','English',0,1,0,1,NULL,'2024-02-06 05:41:41',1,1),
(20,'es','Spanish','Español',0,1,0,0,NULL,NULL,1,1),
(21,'et','Estonian','Eesti',0,0,0,0,NULL,NULL,1,1),
(22,'eu','Basque','Euskara',0,0,0,0,NULL,NULL,1,1),
(23,'fa','Persian','فارسی',1,0,0,0,NULL,NULL,1,1),
(24,'ff','Peul','Fulfulde',0,0,0,0,NULL,NULL,1,1),
(25,'fi','Finnish','Suomi',0,0,0,0,NULL,NULL,1,1),
(26,'fj','Fijian','Na Vosa Vakaviti',0,0,0,0,NULL,NULL,1,1),
(27,'fo','Faroese','Føroyskt',0,0,0,0,NULL,NULL,1,1),
(28,'fr','French','Français',0,0,0,0,NULL,NULL,1,1),
(29,'ga','Irish','Gaeilge',0,0,0,0,NULL,NULL,1,1),
(30,'gl','Galician','Galego',0,0,0,0,NULL,NULL,1,1),
(31,'gn','Guarani','Avañe\'ẽ',0,0,0,0,NULL,NULL,1,1),
(32,'gv','Manx','Gaelg',0,0,0,0,NULL,NULL,1,1),
(33,'he','Hebrew','עברית',1,0,0,0,NULL,NULL,1,1),
(34,'hi','Hindi','हिन्दी',0,0,0,0,NULL,NULL,1,1),
(35,'hr','Croatian','Hrvatski',0,0,0,0,NULL,NULL,1,1),
(36,'ht','Haitian','Krèyol ayisyen',0,0,0,0,NULL,NULL,1,1),
(37,'hu','Hungarian','Magyar',0,0,0,0,NULL,NULL,1,1),
(38,'hy','Armenian','Հայերեն',0,0,0,0,NULL,NULL,1,1),
(39,'indo','Indonesian','Bahasa Indonesia',0,0,0,0,NULL,NULL,1,1),
(40,'is','Icelandic','Íslenska',0,0,0,0,NULL,NULL,1,1),
(41,'it','Italian','Italiano',0,0,0,0,NULL,NULL,1,1),
(42,'ja','Japanese','日本語',0,0,0,0,NULL,NULL,1,1),
(43,'ka','Georgian','ქართული',0,0,0,0,NULL,NULL,1,1),
(44,'kg','Kongo','KiKongo',0,0,0,0,NULL,NULL,1,1),
(45,'kk','Kazakh','Қазақша',0,0,0,0,NULL,NULL,1,1),
(46,'kl','Greenlandic','Kalaallisut',0,0,0,0,NULL,NULL,1,1),
(47,'km','Cambodian','ភាសាខ្មែរ',0,0,0,0,NULL,NULL,1,1),
(48,'ko','Korean','한국어',0,0,0,0,NULL,NULL,1,1),
(49,'ku','Kurdish','Kurdî / كوردی',1,0,0,0,NULL,NULL,1,1),
(50,'ky','Kirghiz','Kırgızca / Кыргызча',0,0,0,0,NULL,NULL,1,1),
(51,'la','Latin','Latina',0,0,0,0,NULL,NULL,1,1),
(52,'lb','Luxembourgish','Lëtzebuergesch',0,0,0,0,NULL,NULL,1,1),
(53,'ln','Lingala','Lingála',0,0,0,0,NULL,NULL,1,1),
(54,'lo','Laotian','ລາວ / Pha xa lao',0,0,0,0,NULL,NULL,1,1),
(55,'lt','Lithuanian','Lietuvių',0,0,0,0,NULL,NULL,1,1),
(56,'lu','Luxembourg','Luxembourg',0,0,0,0,NULL,NULL,1,1),
(57,'lv','Latvian','Latviešu',0,0,0,0,NULL,NULL,1,1),
(58,'mg','Malagasy','Malagasy',0,0,0,0,NULL,NULL,1,1),
(59,'mh','Marshallese','Kajin Majel / Ebon',0,0,0,0,NULL,NULL,1,1),
(60,'mi','Maori','Māori',0,0,0,0,NULL,NULL,1,1),
(61,'mk','Macedonian','Македонски',0,0,0,0,NULL,NULL,1,1),
(62,'mn','Mongolian','Монгол',0,0,0,0,NULL,NULL,1,1),
(63,'ms','Malay','Bahasa Melayu',0,0,0,0,NULL,NULL,1,1),
(64,'mt','Maltese','bil-Malti',0,0,0,0,NULL,NULL,1,1),
(65,'my','Burmese','မြန်မာစာ',0,0,0,0,NULL,NULL,1,1),
(66,'na','Nauruan','Dorerin Naoero',0,0,0,0,NULL,NULL,1,1),
(67,'nb','Bokmål','Bokmål',0,0,0,0,NULL,NULL,1,1),
(68,'nd','North Ndebele','Sindebele',0,0,0,0,NULL,NULL,1,1),
(69,'ne','Nepali','नेपाली',0,0,0,0,NULL,NULL,1,1),
(70,'nl','Dutch','Nederlands',0,0,0,0,NULL,NULL,1,1),
(71,'nn','Norwegian Nynorsk','Norsk (nynorsk)',0,0,0,0,NULL,NULL,1,1),
(72,'no','Norwegian','Norsk (bokmål / riksmål)',0,0,0,0,NULL,NULL,1,1),
(73,'nr','South Ndebele','isiNdebele',0,0,0,0,NULL,NULL,1,1),
(74,'ny','Chichewa','Chi-Chewa',0,0,0,0,NULL,NULL,1,1),
(75,'oc','Occitan','Occitan',0,0,0,0,NULL,NULL,1,1),
(76,'pa','Panjabi / Punjabi','ਪੰਜਾਬੀ / पंजाबी / پنجابي',0,0,0,0,NULL,NULL,1,1),
(77,'pl','Polish','Polski',0,0,0,0,NULL,NULL,1,1),
(78,'ps','Pashto','پښتو',1,0,0,0,NULL,NULL,1,1),
(79,'pt','Portuguese','Português',0,0,0,0,NULL,NULL,1,1),
(80,'qu','Quechua','Runa Simi',0,0,0,0,NULL,NULL,1,1),
(81,'rn','Kirundi','Kirundi',0,0,0,0,NULL,NULL,1,1),
(82,'ro','Romanian','Română',0,0,0,0,NULL,NULL,1,1),
(83,'ru','Russian','Русский',0,0,0,0,NULL,NULL,1,1),
(84,'rw','Rwandi','Kinyarwandi',0,0,0,0,NULL,NULL,1,1),
(85,'sg','Sango','Sängö',0,0,0,0,NULL,NULL,1,1),
(86,'si','Sinhalese','සිංහල',0,0,0,0,NULL,NULL,1,1),
(87,'sk','Slovak','Slovenčina',0,0,0,0,NULL,NULL,1,1),
(88,'sl','Slovenian','Slovenščina',0,0,0,0,NULL,NULL,1,1),
(89,'sm','Samoan','Gagana Samoa',0,0,0,0,NULL,NULL,1,1),
(90,'sn','Shona','chiShona',0,0,0,0,NULL,NULL,1,1),
(91,'so','Somalia','Soomaaliga',0,0,0,0,NULL,NULL,1,1),
(92,'sq','Albanian','Shqip',0,0,0,0,NULL,NULL,1,1),
(93,'sr','Serbian','Српски',0,0,0,0,NULL,NULL,1,1),
(94,'ss','Swati','SiSwati',0,0,0,0,NULL,NULL,1,1),
(95,'st','Southern Sotho','Sesotho',0,0,0,0,NULL,NULL,1,1),
(96,'sv','Swedish','Svenska',0,0,0,0,NULL,NULL,1,1),
(97,'sw','Swahili','Kiswahili',0,0,0,0,NULL,NULL,1,1),
(98,'ta','Tamil','தமிழ்',0,0,0,0,NULL,NULL,1,1),
(99,'tg','Tajik','Тоҷикӣ',0,0,0,0,NULL,NULL,1,1),
(100,'th','Thai','ไทย / Phasa Thai',0,0,0,0,NULL,NULL,1,1),
(101,'ti','Tigrinya','ትግርኛ',0,0,0,0,NULL,NULL,1,1),
(102,'tk','Turkmen','Туркмен /تركمن ',0,0,0,0,NULL,NULL,1,1),
(103,'tn','Tswana','Setswana',0,0,0,0,NULL,NULL,1,1),
(104,'to','Tonga','Lea Faka-Tonga',0,0,0,0,NULL,NULL,1,1),
(105,'tr','Turkish','Türkçe',0,0,0,0,NULL,NULL,1,1),
(106,'ts','Tsonga','Xitsonga',0,0,0,0,NULL,NULL,1,1),
(107,'uk','Ukrainian','Українська',0,0,0,0,NULL,NULL,1,1),
(108,'ur','Urdu','اردو',1,0,0,0,NULL,NULL,1,1),
(109,'uz','Uzbek','Ўзбек',0,0,0,0,NULL,NULL,1,1),
(110,'ve','Venda','Tshivenḓa',0,0,0,0,NULL,NULL,1,1),
(111,'vi','Vietnamese','Tiếng Việt',0,0,0,0,NULL,NULL,1,1),
(112,'xh','Xhosa','isiXhosa',0,0,0,0,NULL,NULL,1,1),
(113,'zh','Chinese','中文',0,0,0,0,NULL,NULL,1,1),
(114,'zu','Zulu','isiZulu',0,0,0,0,NULL,NULL,1,1);
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `late_in_out_reasons`
--

DROP TABLE IF EXISTS `late_in_out_reasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `late_in_out_reasons` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `attendance_id` bigint(20) unsigned NOT NULL,
  `type` enum('in','out') NOT NULL DEFAULT 'in' COMMENT 'in = late in reason out = late out reason',
  `reason` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `late_in_out_reasons_attendance_id_foreign` (`attendance_id`),
  KEY `late_in_out_reasons_company_id_branch_id_index` (`company_id`,`branch_id`),
  CONSTRAINT `late_in_out_reasons_attendance_id_foreign` FOREIGN KEY (`attendance_id`) REFERENCES `attendances` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `late_in_out_reasons`
--

LOCK TABLES `late_in_out_reasons` WRITE;
/*!40000 ALTER TABLE `late_in_out_reasons` DISABLE KEYS */;
/*!40000 ALTER TABLE `late_in_out_reasons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leave_requests`
--

DROP TABLE IF EXISTS `leave_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leave_requests` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `assign_leave_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `apply_date` date NOT NULL,
  `leave_from` date NOT NULL,
  `leave_to` date NOT NULL,
  `days` int(11) NOT NULL,
  `reason` longtext DEFAULT NULL,
  `substitute_id` bigint(20) unsigned DEFAULT NULL,
  `attachment_file_id` bigint(20) unsigned DEFAULT NULL,
  `image_url` text DEFAULT NULL,
  `status_id` bigint(20) unsigned NOT NULL,
  `author_info_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `leave_requests_assign_leave_id_foreign` (`assign_leave_id`),
  KEY `leave_requests_user_id_foreign` (`user_id`),
  KEY `leave_requests_substitute_id_foreign` (`substitute_id`),
  KEY `leave_requests_attachment_file_id_foreign` (`attachment_file_id`),
  KEY `leave_requests_author_info_id_foreign` (`author_info_id`),
  KEY `leave_requests_status_id_company_id_branch_id_index` (`status_id`,`company_id`,`branch_id`),
  CONSTRAINT `leave_requests_assign_leave_id_foreign` FOREIGN KEY (`assign_leave_id`) REFERENCES `assign_leaves` (`id`) ON DELETE CASCADE,
  CONSTRAINT `leave_requests_attachment_file_id_foreign` FOREIGN KEY (`attachment_file_id`) REFERENCES `uploads` (`id`),
  CONSTRAINT `leave_requests_author_info_id_foreign` FOREIGN KEY (`author_info_id`) REFERENCES `author_infos` (`id`),
  CONSTRAINT `leave_requests_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `leave_requests_substitute_id_foreign` FOREIGN KEY (`substitute_id`) REFERENCES `users` (`id`),
  CONSTRAINT `leave_requests_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_requests`
--

LOCK TABLES `leave_requests` WRITE;
/*!40000 ALTER TABLE `leave_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `leave_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leave_settings`
--

DROP TABLE IF EXISTS `leave_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leave_settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sandwich_leave` tinyint(1) NOT NULL DEFAULT 0,
  `month` varchar(255) NOT NULL DEFAULT '1',
  `prorate_leave` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  `status_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `leave_settings_status_id_company_id_branch_id_index` (`status_id`,`company_id`,`branch_id`),
  CONSTRAINT `leave_settings_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_settings`
--

LOCK TABLES `leave_settings` WRITE;
/*!40000 ALTER TABLE `leave_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `leave_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leave_types`
--

DROP TABLE IF EXISTS `leave_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leave_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `status_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `leave_types_status_id_foreign` (`status_id`),
  KEY `leave_types_name_status_id_company_id_branch_id_index` (`name`,`status_id`,`company_id`,`branch_id`),
  CONSTRAINT `leave_types_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_types`
--

LOCK TABLES `leave_types` WRITE;
/*!40000 ALTER TABLE `leave_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `leave_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leave_years`
--

DROP TABLE IF EXISTS `leave_years`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leave_years` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `department_id` bigint(20) unsigned DEFAULT NULL,
  `leave_days` int(11) NOT NULL,
  `leave_available` int(11) NOT NULL,
  `leave_used` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `status_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `leave_years_type_id_foreign` (`type_id`),
  KEY `leave_years_status_id_foreign` (`status_id`),
  KEY `leave_years_company_id_branch_id_index` (`company_id`,`branch_id`),
  CONSTRAINT `leave_years_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `leave_years_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `leave_types` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_years`
--

LOCK TABLES `leave_years` WRITE;
/*!40000 ALTER TABLE `leave_years` DISABLE KEYS */;
/*!40000 ALTER TABLE `leave_years` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location_binds`
--

DROP TABLE IF EXISTS `location_binds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location_binds` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `latitude` double DEFAULT NULL COMMENT 'latitude',
  `longitude` double DEFAULT NULL COMMENT 'longitude',
  `address` varchar(255) DEFAULT NULL COMMENT 'address',
  `distance` varchar(255) DEFAULT NULL,
  `status_id` bigint(20) unsigned NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `location_binds_user_id_foreign` (`user_id`),
  KEY `location_binds_status_id_company_id_branch_id_index` (`status_id`,`company_id`,`branch_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `location_binds_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `location_binds_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location_binds`
--

LOCK TABLES `location_binds` WRITE;
/*!40000 ALTER TABLE `location_binds` DISABLE KEYS */;
/*!40000 ALTER TABLE `location_binds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location_logs`
--

DROP TABLE IF EXISTS `location_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `distance` double(10,2) DEFAULT NULL COMMENT 'in km',
  `latitude` double DEFAULT NULL COMMENT 'latitude',
  `longitude` double DEFAULT NULL COMMENT 'longitude',
  `speed` double DEFAULT NULL COMMENT 'speed',
  `heading` varchar(255) DEFAULT NULL COMMENT 'heading',
  `city` varchar(255) DEFAULT NULL COMMENT 'city',
  `address` varchar(255) DEFAULT NULL COMMENT 'address',
  `countryCode` varchar(255) DEFAULT NULL COMMENT 'countryCode',
  `country` varchar(255) DEFAULT 'Bangladesh' COMMENT 'country',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `location_logs_user_id_company_id_branch_id_date_index` (`user_id`,`company_id`,`branch_id`,`date`),
  CONSTRAINT `location_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location_logs`
--

LOCK TABLES `location_logs` WRITE;
/*!40000 ALTER TABLE `location_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `location_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meeting_members`
--

DROP TABLE IF EXISTS `meeting_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meeting_members` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `meeting_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `is_present` tinyint(4) NOT NULL DEFAULT 0,
  `status_id` bigint(20) unsigned NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `meeting_members_status_id_company_id_branch_id_index` (`status_id`,`company_id`,`branch_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `meeting_members_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meeting_members`
--

LOCK TABLES `meeting_members` WRITE;
/*!40000 ALTER TABLE `meeting_members` DISABLE KEYS */;
/*!40000 ALTER TABLE `meeting_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meeting_participants`
--

DROP TABLE IF EXISTS `meeting_participants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meeting_participants` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `participant_id` bigint(20) unsigned NOT NULL,
  `meeting_id` bigint(20) unsigned NOT NULL,
  `is_going` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0: Not going, 1: Going',
  `is_present` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0: Absent, 1: Present',
  `present_at` datetime DEFAULT NULL,
  `meeting_started_at` datetime DEFAULT NULL,
  `meeting_ended_at` datetime DEFAULT NULL,
  `meeting_duration` time DEFAULT NULL COMMENT 'Meeting duration in minutes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `meeting_participants_participant_id_foreign` (`participant_id`),
  KEY `meeting_participants_meeting_id_foreign` (`meeting_id`),
  KEY `meeting_participants_company_id_branch_id_index` (`company_id`,`branch_id`),
  CONSTRAINT `meeting_participants_meeting_id_foreign` FOREIGN KEY (`meeting_id`) REFERENCES `meetings` (`id`) ON DELETE CASCADE,
  CONSTRAINT `meeting_participants_participant_id_foreign` FOREIGN KEY (`participant_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meeting_participants`
--

LOCK TABLES `meeting_participants` WRITE;
/*!40000 ALTER TABLE `meeting_participants` DISABLE KEYS */;
/*!40000 ALTER TABLE `meeting_participants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meeting_setups`
--

DROP TABLE IF EXISTS `meeting_setups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meeting_setups` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `host_name` varchar(255) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `status_id` bigint(20) unsigned NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `meeting_setups_status_id_company_id_branch_id_index` (`status_id`,`company_id`,`branch_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `meeting_setups_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meeting_setups`
--

LOCK TABLES `meeting_setups` WRITE;
/*!40000 ALTER TABLE `meeting_setups` DISABLE KEYS */;
/*!40000 ALTER TABLE `meeting_setups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meetings`
--

DROP TABLE IF EXISTS `meetings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meetings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `location` text DEFAULT NULL,
  `duration` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `start_at` time DEFAULT NULL,
  `end_at` time DEFAULT NULL,
  `attachment_file_id` bigint(20) unsigned DEFAULT NULL,
  `image_url` text DEFAULT NULL,
  `status_id` bigint(20) unsigned NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `meetings_user_id_foreign` (`user_id`),
  KEY `meetings_attachment_file_id_foreign` (`attachment_file_id`),
  KEY `meetings_status_id_company_id_branch_id_index` (`status_id`,`company_id`,`branch_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `meetings_attachment_file_id_foreign` FOREIGN KEY (`attachment_file_id`) REFERENCES `uploads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `meetings_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `meetings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meetings`
--

LOCK TABLES `meetings` WRITE;
/*!40000 ALTER TABLE `meetings` DISABLE KEYS */;
/*!40000 ALTER TABLE `meetings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menus` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `position` int(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `all_content_id` int(11) DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT 1 COMMENT '1=menu,2=footer',
  `status_id` bigint(20) unsigned NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `menus_status_id_company_id_branch_id_index` (`status_id`,`company_id`,`branch_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `menus_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meta_information`
--

DROP TABLE IF EXISTS `meta_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meta_information` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('all_shop','all_brand','all_search','login','registration','student_registration','affiliate_registration','be_a_seller','compare_list','add_to_cart','about_us','faqs','contact_us','careers','return_refund','support_policy','privacy_policy','terms_condition') DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `meta_image` varchar(255) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `meta_information_created_by_foreign` (`created_by`),
  KEY `meta_information_updated_by_foreign` (`updated_by`),
  KEY `meta_information_type_company_id_branch_id_index` (`type`,`company_id`,`branch_id`),
  CONSTRAINT `meta_information_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `meta_information_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meta_information`
--

LOCK TABLES `meta_information` WRITE;
/*!40000 ALTER TABLE `meta_information` DISABLE KEYS */;
INSERT INTO `meta_information` VALUES
(1,'all_shop','all_shop-title','all_shop-description','all_shop-image','all_shop-keywors',NULL,NULL,'2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(2,'all_brand','all_brand-title','all_brand-description','all_brand-image','all_brand-keywors',NULL,NULL,'2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(3,'all_search','all_search-title','all_search-description','all_search-image','all_search-keywors',NULL,NULL,'2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(4,'login','login-title','login-description','login-image','login-keywors',NULL,NULL,'2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(5,'registration','registration-title','registration-description','registration-image','registration-keywors',NULL,NULL,'2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(6,'student_registration','student_registration-title','student_registration-description','student_registration-image','student_registration-keywors',NULL,NULL,'2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(7,'affiliate_registration','affiliate_registration-title','affiliate_registration-description','affiliate_registration-image','affiliate_registration-keywors',NULL,NULL,'2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(8,'be_a_seller','be_a_seller-title','be_a_seller-description','be_a_seller-image','be_a_seller-keywors',NULL,NULL,'2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(9,'compare_list','compare_list-title','compare_list-description','compare_list-image','compare_list-keywors',NULL,NULL,'2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(10,'add_to_cart','add_to_cart-title','add_to_cart-description','add_to_cart-image','add_to_cart-keywors',NULL,NULL,'2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(11,'about_us','about_us-title','about_us-description','about_us-image','about_us-keywors',NULL,NULL,'2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(12,'faqs','faqs-title','faqs-description','faqs-image','faqs-keywors',NULL,NULL,'2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(13,'contact_us','contact_us-title','contact_us-description','contact_us-image','contact_us-keywors',NULL,NULL,'2024-02-06 05:41:37','2024-02-06 05:41:37',1,1),
(14,'careers','careers-title','careers-description','careers-image','careers-keywors',NULL,NULL,'2024-02-06 05:41:37','2024-02-06 05:41:37',1,1);
/*!40000 ALTER TABLE `meta_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES
(1,'2013_10_11_000000_create_countries_table',1),
(2,'2014_01_11_000000_create_statuses_table',1),
(3,'2014_10_11_000001_create_activity_log_table',1),
(4,'2014_10_11_000001_create_branches_table',1),
(5,'2014_10_11_000002_create_uploads_table',1),
(6,'2014_10_11_000003_create_companies_table',1),
(7,'2014_10_11_000004_create_roles_table',1),
(8,'2014_10_11_000004_create_shifts_table',1),
(9,'2014_10_11_000005_create_departments_table',1),
(10,'2014_10_11_000005_create_designations_table',1),
(11,'2014_10_12_000000_create_users_table',1),
(12,'2014_10_12_000001_create_author_infos_table',1),
(13,'2014_10_12_100000_create_password_resets_table',1),
(14,'2019_08_19_000000_create_failed_jobs_table',1),
(15,'2019_09_15_000010_create_tenants_table',1),
(16,'2019_09_15_000020_create_domains_table',1),
(17,'2019_12_14_000001_create_personal_access_tokens_table',1),
(18,'2020_05_15_000010_create_tenant_user_impersonation_tokens_table',1),
(19,'2020_06_01_130821_create_settings_table',1),
(20,'2020_06_01_130822_create_permissions_table',1),
(21,'2020_06_01_130824_create_role_users_table',1),
(22,'2021_09_24_050720_create_bank_accounts_table',1),
(23,'2021_09_25_070000_create_payment_types_table',1),
(24,'2021_09_25_080345_create_categories_table',1),
(25,'2021_10_31_121218_create_translations_table',1),
(26,'2021_11_03_044301_create_social_identities_table',1),
(27,'2021_11_14_070513_create_notifications_old_table',1),
(28,'2021_11_14_070607_create_conversations_table',1),
(29,'2022_01_05_105820_create_leave_types_table',1),
(30,'2022_01_05_111318_create_assign_leaves_table',1),
(31,'2022_01_05_112116_create_leave_requests_table',1),
(32,'2022_01_23_165353_create_weekends_table',1),
(33,'2022_01_23_165357_create_holidays_table',1),
(34,'2022_01_26_104953_create_duty_schedules_table',1),
(35,'2022_02_07_144952_create_attendances_table',1),
(36,'2022_02_07_175133_create_leave_settings_table',1),
(37,'2022_02_10_151245_create_late_in_out_reasons_table',1),
(38,'2022_03_01_174425_create_company_configs_table',1),
(39,'2022_03_02_170908_create_ip_setups_table',1),
(40,'2022_03_05_000002_create_expense_categories_table',1),
(41,'2022_03_05_050001_create_payment_methods_table',1),
(42,'2022_03_05_060051_create_accounts_table',1),
(43,'2022_03_05_060052_create_transactions_table',1),
(44,'2022_03_05_061025_create_expenses_table',1),
(45,'2022_03_05_061055_create_deposits_table',1),
(46,'2022_03_05_100003_create_hrm_expenses_table',1),
(47,'2022_03_05_100004_create_expense_claims_table',1),
(48,'2022_03_05_100006_create_expense_claim_details_table',1),
(49,'2022_03_05_100007_create_payment_histories_table',1),
(50,'2022_03_05_100008_create_payment_history_details_table',1),
(51,'2022_03_05_100009_create_payment_history_logs_table',1),
(52,'2022_03_06_101527_create_visits_table',1),
(53,'2022_03_06_103136_create_visit_images_table',1),
(54,'2022_03_06_104118_create_visit_notes_table',1),
(55,'2022_03_06_104139_create_visit_schedules_table',1),
(56,'2022_03_09_174416_create_subscription_plans_table',1),
(57,'2022_03_10_110216_create_app_screens_table',1),
(58,'2022_03_10_114654_create_support_tickets_table',1),
(59,'2022_03_10_131726_create_notices_table',1),
(60,'2022_03_10_132017_create_notice_view_logs_table',1),
(61,'2022_03_12_114157_create_appreciates_table',1),
(62,'2022_03_13_104916_create_meetings_table',1),
(63,'2022_03_13_112149_create_meeting_participants_table',1),
(64,'2022_03_13_112853_create_appoinments_table',1),
(65,'2022_03_13_112914_create_appoinment_participants_table',1),
(66,'2022_03_13_113319_create_employee_tasks_table',1),
(67,'2022_03_13_123151_create_employee_breaks_table',1),
(68,'2022_03_15_131235_create_all_contents_table',1),
(69,'2022_03_16_104248_create_contacts_table',1),
(70,'2022_03_30_061715_create_features_table',1),
(71,'2022_03_30_113900_create_testimonials_table',1),
(72,'2022_03_31_140233_create_teams_table',1),
(73,'2022_03_31_140552_create_team_members_table',1),
(74,'2022_04_06_042459_create_sms_logs_table',1),
(75,'2022_04_07_035721_create_user_devices_table',1),
(76,'2022_04_07_044946_create_notification_types_table',1),
(77,'2022_04_12_065957_create_ticket_replies_table',1),
(78,'2022_05_16_071031_create_notifications_table',1),
(79,'2022_05_17_062749_create_daily_leaves_table',1),
(80,'2022_05_19_055538_create_notice_departments_table',1),
(81,'2022_06_05_101104_create_meta_information_table',1),
(82,'2022_06_09_093509_create_time_zones_table',1),
(83,'2022_06_11_075042_create_date_formats_table',1),
(84,'2022_06_12_080741_create_api_setups_table',1),
(85,'2022_06_12_100839_create_currencies_table',1),
(86,'2022_06_15_090457_create_advance_types_table',1),
(87,'2022_06_15_130017_create_advance_salaries_table',1),
(88,'2022_06_15_131620_create_advance_salary_logs_table',1),
(89,'2022_06_16_115529_create_commissions_table',1),
(90,'2022_06_16_122623_create_salary_setups_table',1),
(91,'2022_06_16_122641_create_salary_setup_details_table',1),
(92,'2022_06_16_122709_create_salary_generates_table',1),
(93,'2022_06_16_122750_create_salary_payment_logs_table',1),
(94,'2022_06_18_154114_create_languages_table',1),
(95,'2022_06_18_155339_create_hrm_languages_table',1),
(96,'2022_06_23_030258_create_location_logs_table',1),
(97,'2022_06_25_080155_create_database_backups_table',1),
(98,'2022_06_27_115744_create_meeting_setups_table',1),
(99,'2022_06_27_121222_create_virtual_meetings_table',1),
(100,'2022_06_27_121626_create_meeting_members_table',1),
(101,'2022_06_27_123238_create_jitsi_meetings_table',1),
(102,'2022_07_21_132450_create_location_binds_table',1),
(103,'2022_07_25_160849_create_clients_table',1),
(104,'2022_07_25_160850_create_goal_types_table',1),
(105,'2022_07_25_160851_create_goals_table',1),
(106,'2022_07_26_160617_create_projects_table',1),
(107,'2022_07_26_160618_create_project_membars_table',1),
(108,'2022_07_26_165806_create_discussions_table',1),
(109,'2022_07_26_165807_create_discussion_comments_table',1),
(110,'2022_07_26_165908_create_notes_table',1),
(111,'2022_07_26_170007_create_project_files_table',1),
(112,'2022_07_26_170008_create_project_file_comments_table',1),
(113,'2022_07_26_170031_create_project_activities_table',1),
(114,'2022_07_26_170205_create_project_payments_table',1),
(115,'2022_08_01_140657_create_tasks_table',1),
(116,'2022_08_01_140658_create_task_followers_table',1),
(117,'2022_08_01_140658_create_task_members_table',1),
(118,'2022_08_01_141239_create_task_discussions_table',1),
(119,'2022_08_01_141255_create_task_discussion_comments_table',1),
(120,'2022_08_01_141323_create_task_notes_table',1),
(121,'2022_08_01_141341_create_task_files_table',1),
(122,'2022_08_01_141401_create_task_file_comments_table',1),
(123,'2022_08_01_142250_create_task_activities_table',1),
(124,'2022_08_03_130453_create_award_types_table',1),
(125,'2022_08_03_130519_create_awards_table',1),
(126,'2022_08_04_101142_create_travel_types_table',1),
(127,'2022_08_04_101522_create_travel_table',1),
(128,'2022_08_04_161248_create_competence_types_table',1),
(129,'2022_08_04_161249_create_competences_table',1),
(130,'2022_08_04_161325_create_indicators_table',1),
(131,'2022_08_04_161344_create_appraisals_table',1),
(132,'2022_09_19_104223_create_services_table',1),
(133,'2022_09_19_104344_create_portfolios_table',1),
(134,'2022_09_19_112019_create_menus_table',1),
(135,'2022_09_19_112527_create_home_pages_table',1),
(136,'2023_02_23_133359_add_department_id_table_to_salary_generates',1),
(137,'2023_02_23_181308_create_salary_sheet_reports_table',1),
(138,'2023_06_06_134120_create_tenant_subscriptions_table',1),
(139,'2023_06_15_105713_create_discussion_likes_table',1),
(140,'2023_09_19_111522_create_user_document_requests_table',1),
(141,'2023_09_20_114428_create_expire_notifications_table',1),
(142,'2023_09_21_155520_create_jobs_table',1),
(143,'2024_01_16_173817_create_leave_years_table',1),
(144,'2019_05_03_000001_create_customer_columns',2),
(145,'2019_05_03_000002_create_subscriptions_table',2),
(146,'2019_05_03_000003_create_subscription_items_table',2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `description` longtext NOT NULL,
  `show_to_customer` bigint(20) unsigned NOT NULL DEFAULT 22,
  `project_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `status_id` bigint(20) unsigned NOT NULL DEFAULT 1,
  `last_activity` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `notes_user_id_foreign` (`user_id`),
  KEY `notes_project_id_company_id_status_id_user_id_branch_id_index` (`project_id`,`company_id`,`status_id`,`user_id`,`branch_id`),
  KEY `show_to_customer` (`show_to_customer`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `notes_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `notes_show_to_customer_foreign` FOREIGN KEY (`show_to_customer`) REFERENCES `statuses` (`id`),
  CONSTRAINT `notes_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `notes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice_departments`
--

DROP TABLE IF EXISTS `notice_departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notice_departments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `department_id` bigint(20) unsigned DEFAULT 1,
  `noticeable_id` bigint(20) unsigned NOT NULL,
  `noticeable_type` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `notice_departments_company_id_branch_id_index` (`company_id`,`branch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice_departments`
--

LOCK TABLES `notice_departments` WRITE;
/*!40000 ALTER TABLE `notice_departments` DISABLE KEYS */;
/*!40000 ALTER TABLE `notice_departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice_view_logs`
--

DROP TABLE IF EXISTS `notice_view_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notice_view_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `notice_id` bigint(20) unsigned NOT NULL,
  `is_view` tinyint(4) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `notice_view_logs_user_id_foreign` (`user_id`),
  KEY `notice_view_logs_notice_id_foreign` (`notice_id`),
  KEY `notice_view_logs_company_id_branch_id_index` (`company_id`,`branch_id`),
  CONSTRAINT `notice_view_logs_notice_id_foreign` FOREIGN KEY (`notice_id`) REFERENCES `notices` (`id`),
  CONSTRAINT `notice_view_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice_view_logs`
--

LOCK TABLES `notice_view_logs` WRITE;
/*!40000 ALTER TABLE `notice_view_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `notice_view_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notices`
--

DROP TABLE IF EXISTS `notices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notices` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_by` bigint(20) unsigned NOT NULL,
  `department_id` bigint(20) unsigned DEFAULT NULL,
  `attachment_file_id` bigint(20) unsigned DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `status_id` bigint(20) unsigned NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `notices_created_by_foreign` (`created_by`),
  KEY `notices_department_id_foreign` (`department_id`),
  KEY `notices_attachment_file_id_foreign` (`attachment_file_id`),
  KEY `notices_status_id_company_id_branch_id_index` (`status_id`,`company_id`,`branch_id`),
  CONSTRAINT `notices_attachment_file_id_foreign` FOREIGN KEY (`attachment_file_id`) REFERENCES `uploads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `notices_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `notices_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  CONSTRAINT `notices_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notices`
--

LOCK TABLES `notices` WRITE;
/*!40000 ALTER TABLE `notices` DISABLE KEYS */;
/*!40000 ALTER TABLE `notices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_types`
--

DROP TABLE IF EXISTS `notification_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `status_id` bigint(20) unsigned NOT NULL DEFAULT 1,
  `icon` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `notification_types_type_unique` (`type`),
  KEY `notification_types_icon_foreign` (`icon`),
  KEY `notification_types_status_id_company_id_branch_id_index` (`status_id`,`company_id`,`branch_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `notification_types_icon_foreign` FOREIGN KEY (`icon`) REFERENCES `uploads` (`id`),
  CONSTRAINT `notification_types_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_types`
--

LOCK TABLES `notification_types` WRITE;
/*!40000 ALTER TABLE `notification_types` DISABLE KEYS */;
INSERT INTO `notification_types` VALUES
(1,'leave_request','Leave Request','Your Leave Request has been sent',1,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(2,'leave_approved','Leave Approved','Your Leave Application has been approved',1,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(3,'leave_rejected','Leave Rejected','Your Leave Application has been Rejected',1,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(4,'leave_cancelled','Leave Cancelled','Your Leave Application has been Cancelled',1,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(5,'leave_referred','Leave Referred','Your Leave Application has been Referred ',1,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(6,'notice','Notice','Notice ',1,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1);
/*!40000 ALTER TABLE `notification_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` bigint(20) unsigned DEFAULT NULL,
  `receiver_id` bigint(20) unsigned DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `image_id` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `notifiable_type` varchar(255) NOT NULL,
  `notifiable_id` bigint(20) unsigned NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `notification_for` varchar(255) DEFAULT NULL,
  `id_for` bigint(20) DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`),
  KEY `notifications_company_id_branch_id_index` (`company_id`,`branch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications_old`
--

DROP TABLE IF EXISTS `notifications_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications_old` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` bigint(20) unsigned NOT NULL,
  `receiver_id` bigint(20) unsigned DEFAULT NULL,
  `type` enum('notification','message') NOT NULL DEFAULT 'notification' COMMENT 'notification: notification, message: message',
  `title` varchar(255) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `image_id` bigint(20) unsigned DEFAULT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `notifications_old_sender_id_foreign` (`sender_id`),
  KEY `notifications_old_receiver_id_foreign` (`receiver_id`),
  KEY `notifications_old_image_id_foreign` (`image_id`),
  KEY `notifications_old_company_id_branch_id_index` (`company_id`,`branch_id`),
  CONSTRAINT `notifications_old_image_id_foreign` FOREIGN KEY (`image_id`) REFERENCES `uploads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `notifications_old_receiver_id_foreign` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `notifications_old_sender_id_foreign` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications_old`
--

LOCK TABLES `notifications_old` WRITE;
/*!40000 ALTER TABLE `notifications_old` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications_old` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_histories`
--

DROP TABLE IF EXISTS `payment_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_histories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `expense_claim_id` bigint(20) unsigned NOT NULL,
  `code` varchar(191) DEFAULT NULL COMMENT 'invoice number',
  `payment_date` date DEFAULT NULL COMMENT 'date of payment',
  `remarks` varchar(191) DEFAULT NULL COMMENT 'remarks of payment',
  `payable_amount` double(10,2) DEFAULT NULL COMMENT 'amount of payment',
  `paid_amount` double(10,2) DEFAULT NULL COMMENT 'paid amount of payment',
  `due_amount` double(10,2) DEFAULT NULL COMMENT 'due amount of payment',
  `attachment_file_id` bigint(20) unsigned DEFAULT NULL,
  `payment_status_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `payment_histories_code_unique` (`code`),
  KEY `payment_histories_user_id_foreign` (`user_id`),
  KEY `payment_histories_expense_claim_id_foreign` (`expense_claim_id`),
  KEY `payment_histories_attachment_file_id_foreign` (`attachment_file_id`),
  KEY `payment_histories_index` (`payment_date`,`payment_status_id`,`company_id`,`branch_id`),
  KEY `status_id` (`payment_status_id`),
  CONSTRAINT `payment_histories_attachment_file_id_foreign` FOREIGN KEY (`attachment_file_id`) REFERENCES `uploads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `payment_histories_expense_claim_id_foreign` FOREIGN KEY (`expense_claim_id`) REFERENCES `expense_claims` (`id`) ON DELETE CASCADE,
  CONSTRAINT `payment_histories_payment_status_id_foreign` FOREIGN KEY (`payment_status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `payment_histories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_histories`
--

LOCK TABLES `payment_histories` WRITE;
/*!40000 ALTER TABLE `payment_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_history_details`
--

DROP TABLE IF EXISTS `payment_history_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_history_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `payment_history_id` bigint(20) unsigned NOT NULL,
  `payment_method_id` bigint(20) unsigned NOT NULL,
  `payment_details` longtext DEFAULT NULL COMMENT 'remarks of payment',
  `payment_status_id` bigint(20) unsigned NOT NULL,
  `payment_date` date DEFAULT NULL COMMENT 'date of payment',
  `paid_by_id` bigint(20) unsigned DEFAULT NULL,
  `bank_name` varchar(191) DEFAULT NULL COMMENT 'bank name',
  `bank_branch` varchar(191) DEFAULT NULL COMMENT 'bank branch',
  `bank_account_number` varchar(191) DEFAULT NULL COMMENT 'bank account number',
  `bank_account_name` varchar(191) DEFAULT NULL COMMENT 'bank account name',
  `bank_transaction_number` varchar(191) DEFAULT NULL COMMENT 'bank transaction number',
  `bank_transaction_date` date DEFAULT NULL COMMENT 'bank transaction date',
  `bank_transaction_ref` varchar(191) DEFAULT NULL COMMENT 'bank transaction ref',
  `cheque_number` varchar(191) DEFAULT NULL COMMENT 'cheque number',
  `cheque_date` date DEFAULT NULL COMMENT 'cheque date',
  `cheque_bank_name` varchar(191) DEFAULT NULL COMMENT 'cheque bank name',
  `cheque_branch` varchar(191) DEFAULT NULL COMMENT 'cheque branch',
  `cheque_ref` varchar(191) DEFAULT NULL COMMENT 'cheque ref',
  `cash_number` varchar(191) DEFAULT NULL COMMENT 'cash number',
  `cash_date` date DEFAULT NULL COMMENT 'cash date',
  `cash_ref` varchar(191) DEFAULT NULL COMMENT 'cash ref',
  `paid_amount` double(15,2) NOT NULL DEFAULT 0.00,
  `due_amount` double(15,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `payment_history_details_payment_history_id_foreign` (`payment_history_id`),
  KEY `payment_history_details_payment_method_id_foreign` (`payment_method_id`),
  KEY `payment_history_details_paid_by_id_foreign` (`paid_by_id`),
  KEY `payment_history_details_index` (`user_id`,`payment_status_id`,`company_id`,`branch_id`),
  KEY `payment_status_id` (`payment_status_id`),
  CONSTRAINT `payment_history_details_paid_by_id_foreign` FOREIGN KEY (`paid_by_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `payment_history_details_payment_history_id_foreign` FOREIGN KEY (`payment_history_id`) REFERENCES `payment_histories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `payment_history_details_payment_method_id_foreign` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`) ON DELETE CASCADE,
  CONSTRAINT `payment_history_details_payment_status_id_foreign` FOREIGN KEY (`payment_status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `payment_history_details_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_history_details`
--

LOCK TABLES `payment_history_details` WRITE;
/*!40000 ALTER TABLE `payment_history_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_history_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_history_logs`
--

DROP TABLE IF EXISTS `payment_history_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_history_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `payment_history_id` bigint(20) unsigned NOT NULL,
  `expense_claim_id` bigint(20) unsigned NOT NULL,
  `payable_amount` double(10,2) DEFAULT NULL COMMENT 'amount of payment',
  `paid_amount` double(10,2) DEFAULT NULL COMMENT 'paid amount of payment',
  `due_amount` double(10,2) DEFAULT NULL COMMENT 'due amount of payment',
  `date` date DEFAULT NULL,
  `paid_by_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `payment_history_logs_user_id_foreign` (`user_id`),
  KEY `payment_history_logs_payment_history_id_foreign` (`payment_history_id`),
  KEY `payment_history_logs_expense_claim_id_foreign` (`expense_claim_id`),
  KEY `payment_history_logs_paid_by_id_foreign` (`paid_by_id`),
  KEY `payment_history_logs_date_paid_by_id_company_id_branch_id_index` (`date`,`paid_by_id`,`company_id`,`branch_id`),
  CONSTRAINT `payment_history_logs_expense_claim_id_foreign` FOREIGN KEY (`expense_claim_id`) REFERENCES `expense_claims` (`id`) ON DELETE CASCADE,
  CONSTRAINT `payment_history_logs_paid_by_id_foreign` FOREIGN KEY (`paid_by_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `payment_history_logs_payment_history_id_foreign` FOREIGN KEY (`payment_history_id`) REFERENCES `payment_histories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `payment_history_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_history_logs`
--

LOCK TABLES `payment_history_logs` WRITE;
/*!40000 ALTER TABLE `payment_history_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_history_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_methods`
--

DROP TABLE IF EXISTS `payment_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_methods` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `attachment_file_id` bigint(20) unsigned DEFAULT NULL,
  `status_id` bigint(20) unsigned NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `payment_methods_attachment_file_id_foreign` (`attachment_file_id`),
  KEY `payment_methods_status_id_company_id_branch_id_index` (`status_id`,`company_id`,`branch_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `payment_methods_attachment_file_id_foreign` FOREIGN KEY (`attachment_file_id`) REFERENCES `uploads` (`id`),
  CONSTRAINT `payment_methods_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_methods`
--

LOCK TABLES `payment_methods` WRITE;
/*!40000 ALTER TABLE `payment_methods` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_methods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_types`
--

DROP TABLE IF EXISTS `payment_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type` int(11) NOT NULL DEFAULT 1 COMMENT '1 - cash, 2 - credit card, 3 - debit card, 4 - bank',
  `status_id` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `payment_types_status_id_type_company_id_branch_id_index` (`status_id`,`type`,`company_id`,`branch_id`),
  KEY `payment_types_status_id_index` (`status_id`),
  CONSTRAINT `payment_types_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_types`
--

LOCK TABLES `payment_types` WRITE;
/*!40000 ALTER TABLE `payment_types` DISABLE KEYS */;
INSERT INTO `payment_types` VALUES
(1,'Cash',1,1,NULL,NULL,NULL,1,1),
(2,'Credit Card',2,1,NULL,NULL,NULL,1,1),
(3,'Debit Card',3,1,NULL,NULL,NULL,1,1),
(4,'Bank',4,1,NULL,NULL,NULL,1,1);
/*!40000 ALTER TABLE `payment_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `attribute` varchar(255) DEFAULT NULL,
  `keywords` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES
(1,'hr_menu','\"{\\\"menu\\\":\\\"hr_menu\\\"}\"','2024-02-06 05:41:55','2024-02-06 05:41:55'),
(2,'designations','\"{\\\"read\\\":\\\"designation_read\\\",\\\"create\\\":\\\"designation_create\\\",\\\"update\\\":\\\"designation_update\\\",\\\"delete\\\":\\\"designation_delete\\\"}\"','2024-02-06 05:41:55','2024-02-06 05:41:55'),
(3,'departments','\"{\\\"read\\\":\\\"department_read\\\",\\\"create\\\":\\\"department_create\\\",\\\"update\\\":\\\"department_update\\\",\\\"delete\\\":\\\"department_delete\\\"}\"','2024-02-06 05:41:55','2024-02-06 05:41:55'),
(4,'users','\"{\\\"read\\\":\\\"user_read\\\",\\\"profile\\\":\\\"profile_view\\\",\\\"create\\\":\\\"user_create\\\",\\\"edit\\\":\\\"user_edit\\\",\\\"user_permission\\\":\\\"user_permission\\\",\\\"update\\\":\\\"user_update\\\",\\\"delete\\\":\\\"user_delete\\\",\\\"menu\\\":\\\"user_menu\\\",\\\"make_hr\\\":\\\"make_hr\\\",\\\"profile_image_view\\\":\\\"profile_image_view\\\"}\"','2024-02-06 05:41:55','2024-02-06 05:41:55'),
(5,'user_device','\"{\\\"list\\\":\\\"user_device_list\\\",\\\"reset\\\":\\\"reset_device\\\"}\"','2024-02-06 05:41:55','2024-02-06 05:41:55'),
(6,'profile','\"{\\\"attendance_profile\\\":\\\"attendance_profile\\\",\\\"contract_profile\\\":\\\"contract_profile\\\",\\\"phonebook_profile\\\":\\\"phonebook_profile\\\",\\\"support_ticket_profile\\\":\\\"support_ticket_profile\\\",\\\"advance_profile\\\":\\\"advance_profile\\\",\\\"commission_profile\\\":\\\"commission_profile\\\",\\\"appointment_profile\\\":\\\"appointment_profile\\\",\\\"visit_profile\\\":\\\"visit_profile\\\",\\\"leave_request_profile\\\":\\\"leave_request_profile\\\",\\\"notice_profile\\\":\\\"notice_profile\\\",\\\"salary_profile\\\":\\\"salary_profile\\\",\\\"project_profile\\\":\\\"project_profile\\\",\\\"task_profile\\\":\\\"task_profile\\\",\\\"award_profile\\\":\\\"award_profile\\\",\\\"travel_profile\\\":\\\"travel_profile\\\"}\"','2024-02-06 05:41:55','2024-02-06 05:41:55'),
(7,'roles','\"{\\\"read\\\":\\\"role_read\\\",\\\"create\\\":\\\"role_create\\\",\\\"update\\\":\\\"role_update\\\",\\\"delete\\\":\\\"role_delete\\\"}\"','2024-02-06 05:41:55','2024-02-06 05:41:55'),
(8,'branch','\"{\\\"read\\\":\\\"branch_read\\\",\\\"create\\\":\\\"branch_create\\\",\\\"update\\\":\\\"branch_update\\\",\\\"delete\\\":\\\"branch_delete\\\"}\"','2024-02-06 05:41:55','2024-02-06 05:41:55'),
(9,'leave_type','\"{\\\"read\\\":\\\"leave_type_read\\\",\\\"create\\\":\\\"leave_type_create\\\",\\\"update\\\":\\\"leave_type_update\\\",\\\"delete\\\":\\\"leave_type_delete\\\",\\\"menu\\\":\\\"leave_menu\\\"}\"','2024-02-06 05:41:55','2024-02-06 05:41:55'),
(10,'leave_assign','\"{\\\"read\\\":\\\"leave_assign_read\\\",\\\"create\\\":\\\"leave_assign_create\\\",\\\"update\\\":\\\"leave_assign_update\\\",\\\"delete\\\":\\\"leave_assign_delete\\\"}\"','2024-02-06 05:41:55','2024-02-06 05:41:55'),
(11,'daily_leave','\"{\\\"read\\\":\\\"daily_leave_read\\\"}\"','2024-02-06 05:41:55','2024-02-06 05:41:55'),
(12,'leave_request','\"{\\\"read\\\":\\\"leave_request_read\\\",\\\"update\\\":\\\"leave_request_update\\\",\\\"store\\\":\\\"leave_request_store\\\",\\\"create\\\":\\\"leave_request_create\\\",\\\"approve\\\":\\\"leave_request_approve\\\",\\\"reject\\\":\\\"leave_request_reject\\\",\\\"delete\\\":\\\"leave_request_delete\\\"}\"','2024-02-06 05:41:55','2024-02-06 05:41:55'),
(13,'weekend','\"{\\\"read\\\":\\\"weekend_read\\\",\\\"update\\\":\\\"weekend_update\\\"}\"','2024-02-06 05:41:55','2024-02-06 05:41:55'),
(14,'holiday','\"{\\\"read\\\":\\\"holiday_read\\\",\\\"create\\\":\\\"holiday_create\\\",\\\"update\\\":\\\"holiday_update\\\",\\\"delete\\\":\\\"holiday_delete\\\"}\"','2024-02-06 05:41:55','2024-02-06 05:41:55'),
(15,'schedule','\"{\\\"read\\\":\\\"schedule_read\\\",\\\"create\\\":\\\"schedule_create\\\",\\\"update\\\":\\\"schedule_update\\\",\\\"delete\\\":\\\"schedule_delete\\\"}\"','2024-02-06 05:41:55','2024-02-06 05:41:55'),
(16,'attendance','\"{\\\"read\\\":\\\"attendance_read\\\",\\\"create\\\":\\\"attendance_create\\\",\\\"update\\\":\\\"attendance_update\\\",\\\"delete\\\":\\\"attendance_delete\\\",\\\"menu\\\":\\\"attendance_menu\\\"}\"','2024-02-06 05:41:55','2024-02-06 05:41:55'),
(17,'shift','\"{\\\"read\\\":\\\"shift_read\\\",\\\"create\\\":\\\"shift_create\\\",\\\"update\\\":\\\"shift_update\\\",\\\"delete\\\":\\\"shift_delete\\\",\\\"menu\\\":\\\"shift_menu\\\"}\"','2024-02-06 05:41:55','2024-02-06 05:41:55'),
(18,'payroll','\"{\\\"menu\\\":\\\"payroll_menu\\\",\\\"payroll_item read\\\":\\\"list_payroll_item\\\",\\\"payroll_item create\\\":\\\"create_payroll_item\\\",\\\"payroll_item store\\\":\\\"store_payroll_item\\\",\\\"payroll_item edit\\\":\\\"edit_payroll_item\\\",\\\"payroll_item update\\\":\\\"update_payroll_item\\\",\\\"payroll_item delete\\\":\\\"delete_payroll_item\\\",\\\"payroll_item view\\\":\\\"view_payroll_item\\\",\\\"payroll_item menu\\\":\\\"payroll_item_menu\\\",\\\"list_payroll_set \\\":\\\"list_payroll_set\\\",\\\"create_payroll_set\\\":\\\"create_payroll_set\\\",\\\"store_payroll_set\\\":\\\"store_payroll_set\\\",\\\"edit_payroll_set\\\":\\\"edit_payroll_set\\\",\\\"update_payroll_set\\\":\\\"update_payroll_set\\\",\\\"delete_payroll_set\\\":\\\"delete_payroll_set\\\",\\\"view_payroll_set\\\":\\\"view_payroll_set\\\",\\\"payroll_set_menu\\\":\\\"payroll_set_menu\\\"}\"','2024-02-06 05:41:55','2024-02-06 05:41:55'),
(19,'payslip','\"{\\\"menu\\\":\\\"payslip_menu\\\",\\\"salary_generate\\\":\\\"salary_generate\\\",\\\"salary_view\\\":\\\"salary_view\\\",\\\"salary_delete\\\":\\\"salary_delete\\\",\\\"salary_edit\\\":\\\"salary_edit\\\",\\\"salary_update\\\":\\\"salary_update\\\",\\\"salary_payment\\\":\\\"salary_payment\\\",\\\"payslip_list\\\":\\\"payslip_list\\\"}\"','2024-02-06 05:41:55','2024-02-06 05:41:55'),
(20,'announcement','\"{\\\"menu\\\":\\\"announcement_menu\\\",\\\"notice_menu\\\":\\\"notice_menu\\\",\\\"notice_list\\\":\\\"notice_list\\\",\\\"notice_edit\\\":\\\"notice_edit\\\",\\\"notice_update\\\":\\\"notice_update\\\",\\\"notice_create\\\":\\\"notice_create\\\",\\\"notice_delete\\\":\\\"notice_delete\\\"}\"','2024-02-06 05:41:55','2024-02-06 05:41:55'),
(21,'advance_type','\"{\\\"menu\\\":\\\"advance_type_menu\\\",\\\"advance_type_create\\\":\\\"advance_type_create\\\",\\\"advance_type_store\\\":\\\"advance_type_store\\\",\\\"advance_type_edit\\\":\\\"advance_type_edit\\\",\\\"advance_type_update\\\":\\\"advance_type_update\\\",\\\"advance_type_delete\\\":\\\"advance_type_delete\\\",\\\"advance_type_view\\\":\\\"advance_type_view\\\",\\\"advance_type_list\\\":\\\"advance_type_list\\\"}\"','2024-02-06 05:41:55','2024-02-06 05:41:55'),
(22,'advance_pay','\"{\\\"menu\\\":\\\"advance_salaries_menu\\\",\\\"advance_salaries_create\\\":\\\"advance_salaries_create\\\",\\\"advance_salaries_store\\\":\\\"advance_salaries_store\\\",\\\"advance_salaries_edit\\\":\\\"advance_salaries_edit\\\",\\\"advance_salaries_update\\\":\\\"advance_salaries_update\\\",\\\"advance_salaries_delete\\\":\\\"advance_salaries_delete\\\",\\\"advance_salaries_view\\\":\\\"advance_salaries_view\\\",\\\"advance_salaries_approve\\\":\\\"advance_salaries_approve\\\",\\\"advance_salaries_list\\\":\\\"advance_salaries_list\\\",\\\"advance_salaries_pay\\\":\\\"advance_salaries_pay\\\",\\\"advance_salaries_invoice\\\":\\\"advance_salaries_invoice\\\",\\\"advance_salaries_search\\\":\\\"advance_salaries_search\\\"}\"','2024-02-06 05:41:55','2024-02-06 05:41:55'),
(23,'salary','\"{\\\"menu\\\":\\\"salary_menu\\\",\\\"salary_store\\\":\\\"salary_store\\\",\\\"salary_edit\\\":\\\"salary_edit\\\",\\\"salary_update\\\":\\\"salary_update\\\",\\\"salary_delete\\\":\\\"salary_delete\\\",\\\"salary_view\\\":\\\"salary_view\\\",\\\"salary_list\\\":\\\"salary_list\\\",\\\"salary_pay\\\":\\\"salary_pay\\\",\\\"salary_invoice\\\":\\\"salary_invoice\\\",\\\"salary_approve\\\":\\\"salary_approve\\\",\\\"salary_generate\\\":\\\"salary_generate\\\",\\\"salary_calculate\\\":\\\"salary_calculate\\\",\\\"salary_search\\\":\\\"salary_search\\\"}\"','2024-02-06 05:41:55','2024-02-06 05:41:55'),
(24,'account','\"{\\\"menu\\\":\\\"account_menu\\\",\\\"account_create\\\":\\\"account_create\\\",\\\"account_store\\\":\\\"account_store\\\",\\\"account_edit\\\":\\\"account_edit\\\",\\\"account_update\\\":\\\"account_update\\\",\\\"account_delete\\\":\\\"account_delete\\\",\\\"account_view\\\":\\\"account_view\\\",\\\"account_list\\\":\\\"account_list\\\",\\\"account_search\\\":\\\"account_search\\\"}\"','2024-02-06 05:41:55','2024-02-06 05:41:55'),
(25,'deposit','\"{\\\"menu\\\":\\\"deposit_menu\\\",\\\"deposit_create\\\":\\\"deposit_create\\\",\\\"deposit_store\\\":\\\"deposit_store\\\",\\\"deposit_edit\\\":\\\"deposit_edit\\\",\\\"deposit_update\\\":\\\"deposit_update\\\",\\\"deposit_delete\\\":\\\"deposit_delete\\\",\\\"deposit_list\\\":\\\"deposit_list\\\"}\"','2024-02-06 05:41:55','2024-02-06 05:41:55'),
(26,'expense','\"{\\\"menu\\\":\\\"expense_menu\\\",\\\"expense_create\\\":\\\"expense_create\\\",\\\"expense_store\\\":\\\"expense_store\\\",\\\"expense_edit\\\":\\\"expense_edit\\\",\\\"expense_update\\\":\\\"expense_update\\\",\\\"expense_delete\\\":\\\"expense_delete\\\",\\\"expense_list\\\":\\\"expense_list\\\",\\\"expense_approve\\\":\\\"expense_approve\\\",\\\"expense_invoice\\\":\\\"expense_invoice\\\",\\\"expense_pay\\\":\\\"expense_pay\\\",\\\"expense_view\\\":\\\"expense_view\\\"}\"','2024-02-06 05:41:55','2024-02-06 05:41:55'),
(27,'deposit_category','\"{\\\"menu\\\":\\\"deposit_category_menu\\\",\\\"deposit_category_create\\\":\\\"deposit_category_create\\\",\\\"deposit_category_store\\\":\\\"deposit_category_store\\\",\\\"deposit_category_edit\\\":\\\"deposit_category_edit\\\",\\\"deposit_category_update\\\":\\\"deposit_category_update\\\",\\\"deposit_category_delete\\\":\\\"deposit_category_delete\\\",\\\"deposit_category_list\\\":\\\"deposit_category_list\\\"}\"','2024-02-06 05:41:55','2024-02-06 05:41:55'),
(28,'payment_method','\"{\\\"menu\\\":\\\"payment_method_menu\\\",\\\"payment_method_create\\\":\\\"payment_method_create\\\",\\\"payment_method_store\\\":\\\"payment_method_store\\\",\\\"payment_method_edit\\\":\\\"payment_method_edit\\\",\\\"payment_method_update\\\":\\\"payment_method_update\\\",\\\"payment_method_delete\\\":\\\"payment_method_delete\\\",\\\"payment_method_list\\\":\\\"payment_method_list\\\"}\"','2024-02-06 05:41:55','2024-02-06 05:41:55'),
(29,'transaction','\"{\\\"menu\\\":\\\"transaction_menu\\\",\\\"transaction_create\\\":\\\"transaction_create\\\",\\\"transaction_store\\\":\\\"transaction_store\\\",\\\"transaction_edit\\\":\\\"transaction_edit\\\",\\\"transaction_update\\\":\\\"transaction_update\\\",\\\"transaction_delete\\\":\\\"transaction_delete\\\",\\\"transaction_view\\\":\\\"transaction_view\\\",\\\"transaction_list\\\":\\\"transaction_list\\\"}\"','2024-02-06 05:41:55','2024-02-06 05:41:55'),
(30,'project','\"{\\\"menu\\\":\\\"project_menu\\\",\\\"project_create\\\":\\\"project_create\\\",\\\"project_store\\\":\\\"project_store\\\",\\\"project_edit\\\":\\\"project_edit\\\",\\\"project_update\\\":\\\"project_update\\\",\\\"project_delete\\\":\\\"project_delete\\\",\\\"project_view\\\":\\\"project_view\\\",\\\"project_list\\\":\\\"project_list\\\",\\\"project_activity_view\\\":\\\"project_activity_view\\\",\\\"project_member_view\\\":\\\"project_member_view\\\",\\\"project_member_delete\\\":\\\"project_member_delete\\\",\\\"project_complete\\\":\\\"project_complete\\\",\\\"project_payment\\\":\\\"project_payment\\\",\\\"project_invoice_view\\\":\\\"project_invoice_view\\\"}\"','2024-02-06 05:41:55','2024-02-06 05:41:55'),
(31,'project_discussion','\"{\\\"project_discussion_create\\\":\\\"project_discussion_create\\\",\\\"project_discussion_store\\\":\\\"project_discussion_store\\\",\\\"project_discussion_edit\\\":\\\"project_discussion_edit\\\",\\\"project_discussion_update\\\":\\\"project_discussion_update\\\",\\\"project_discussion_delete\\\":\\\"project_discussion_delete\\\",\\\"project_discussion_view\\\":\\\"project_discussion_view\\\",\\\"project_discussion_list\\\":\\\"project_discussion_list\\\",\\\"project_discussion_comment\\\":\\\"project_discussion_comment\\\",\\\"project_discussion_reply\\\":\\\"project_discussion_reply\\\"}\"','2024-02-06 05:41:55','2024-02-06 05:41:55'),
(32,'project_file','\"{\\\"project_file_create\\\":\\\"project_file_create\\\",\\\"project_file_store\\\":\\\"project_file_store\\\",\\\"project_file_edit\\\":\\\"project_file_edit\\\",\\\"project_file_update\\\":\\\"project_file_update\\\",\\\"project_file_delete\\\":\\\"project_file_delete\\\",\\\"project_file_view\\\":\\\"project_file_view\\\",\\\"project_file_list\\\":\\\"project_file_list\\\",\\\"project_file_download\\\":\\\"project_file_download\\\",\\\"project_file_comment\\\":\\\"project_file_comment\\\",\\\"project_file_reply\\\":\\\"project_file_reply\\\"}\"','2024-02-06 05:41:55','2024-02-06 05:41:55'),
(33,'project_notes','\"{\\\"project_notes_create\\\":\\\"project_notes_create\\\",\\\"project_notes_store\\\":\\\"project_notes_store\\\",\\\"project_notes_edit\\\":\\\"project_notes_edit\\\",\\\"project_notes_update\\\":\\\"project_notes_update\\\",\\\"project_notes_delete\\\":\\\"project_notes_delete\\\",\\\"project_notes_list\\\":\\\"project_notes_list\\\",\\\"project_files_comment\\\":\\\"project_files_comment\\\"}\"','2024-02-06 05:41:55','2024-02-06 05:41:55'),
(34,'general_settings','\"{\\\"general_settings_read\\\":\\\"general_settings_read\\\",\\\"general_settings_update\\\":\\\"general_settings_update\\\",\\\"email_settings_update\\\":\\\"email_settings_update\\\",\\\"storage_settings_update\\\":\\\"storage_settings_update\\\"}\"','2024-02-06 05:41:55','2024-02-06 05:41:55'),
(35,'task','\"{\\\"menu\\\":\\\"task_menu\\\",\\\"task_create\\\":\\\"task_create\\\",\\\"task_store\\\":\\\"task_store\\\",\\\"task_edit\\\":\\\"task_edit\\\",\\\"task_update\\\":\\\"task_update\\\",\\\"task_delete\\\":\\\"task_delete\\\",\\\"task_view\\\":\\\"task_view\\\",\\\"task_list\\\":\\\"task_list\\\",\\\"task_activity_view\\\":\\\"task_activity_view\\\",\\\"task_assign_view\\\":\\\"task_assign_view\\\",\\\"task_assign_delete\\\":\\\"task_assign_delete\\\",\\\"task_complete\\\":\\\"task_complete\\\"}\"','2024-02-06 05:41:55','2024-02-06 05:41:55'),
(36,'client','\"{\\\"menu\\\":\\\"client_menu\\\",\\\"client_create\\\":\\\"client_create\\\",\\\"client_store\\\":\\\"client_store\\\",\\\"client_edit\\\":\\\"client_edit\\\",\\\"client_update\\\":\\\"client_update\\\",\\\"client_delete\\\":\\\"client_delete\\\",\\\"client_view\\\":\\\"client_view\\\",\\\"client_list\\\":\\\"client_list\\\"}\"','2024-02-06 05:41:55','2024-02-06 05:41:55'),
(37,'task_discussion','\"{\\\"task_discussion_create\\\":\\\"task_discussion_create\\\",\\\"task_discussion_store\\\":\\\"task_discussion_store\\\",\\\"task_discussion_edit\\\":\\\"task_discussion_edit\\\",\\\"task_discussion_update\\\":\\\"task_discussion_update\\\",\\\"task_discussion_delete\\\":\\\"task_discussion_delete\\\",\\\"task_discussion_view\\\":\\\"task_discussion_view\\\",\\\"task_discussion_list\\\":\\\"task_discussion_list\\\",\\\"task_discussion_comment\\\":\\\"task_discussion_comment\\\",\\\"task_discussion_reply\\\":\\\"task_discussion_reply\\\"}\"','2024-02-06 05:41:55','2024-02-06 05:41:55'),
(38,'task_file','\"{\\\"task_file_create\\\":\\\"task_file_create\\\",\\\"task_file_store\\\":\\\"task_file_store\\\",\\\"task_file_edit\\\":\\\"task_file_edit\\\",\\\"task_file_update\\\":\\\"task_file_update\\\",\\\"task_file_delete\\\":\\\"task_file_delete\\\",\\\"task_file_view\\\":\\\"task_file_view\\\",\\\"task_file_list\\\":\\\"task_file_list\\\",\\\"task_file_download\\\":\\\"task_file_download\\\",\\\"task_file_comment\\\":\\\"task_file_comment\\\",\\\"task_file_reply\\\":\\\"task_file_reply\\\"}\"','2024-02-06 05:41:55','2024-02-06 05:41:55'),
(39,'task_notes','\"{\\\"task_notes_create\\\":\\\"task_notes_create\\\",\\\"task_notes_store\\\":\\\"task_notes_store\\\",\\\"task_notes_edit\\\":\\\"task_notes_edit\\\",\\\"task_notes_update\\\":\\\"task_notes_update\\\",\\\"task_notes_delete\\\":\\\"task_notes_delete\\\",\\\"task_notes_list\\\":\\\"task_notes_list\\\",\\\"task_files_comment\\\":\\\"task_files_comment\\\"}\"','2024-02-06 05:41:55','2024-02-06 05:41:55'),
(40,'award_type','\"{\\\"menu\\\":\\\"award_type_menu\\\",\\\"award_type_create\\\":\\\"award_type_create\\\",\\\"award_type_store\\\":\\\"award_type_store\\\",\\\"award_type_edit\\\":\\\"award_type_edit\\\",\\\"award_type_update\\\":\\\"award_type_update\\\",\\\"award_type_delete\\\":\\\"award_type_delete\\\",\\\"award_type_list\\\":\\\"award_type_list\\\"}\"','2024-02-06 05:41:55','2024-02-06 05:41:55'),
(41,'award','\"{\\\"menu\\\":\\\"award_menu\\\",\\\"award_create\\\":\\\"award_create\\\",\\\"award_store\\\":\\\"award_store\\\",\\\"award_edit\\\":\\\"award_edit\\\",\\\"award_update\\\":\\\"award_update\\\",\\\"award_delete\\\":\\\"award_delete\\\",\\\"award_view\\\":\\\"award_view\\\",\\\"award_list\\\":\\\"award_list\\\"}\"','2024-02-06 05:41:55','2024-02-06 05:41:55'),
(42,'travel_type','\"{\\\"menu\\\":\\\"travel_type_menu\\\",\\\"travel_type_create\\\":\\\"travel_type_create\\\",\\\"travel_type_store\\\":\\\"travel_type_store\\\",\\\"travel_type_edit\\\":\\\"travel_type_edit\\\",\\\"travel_type_update\\\":\\\"travel_type_update\\\",\\\"travel_type_delete\\\":\\\"travel_type_delete\\\",\\\"travel_type_list\\\":\\\"travel_type_list\\\"}\"','2024-02-06 05:41:55','2024-02-06 05:41:55'),
(43,'travel','\"{\\\"menu\\\":\\\"travel_menu\\\",\\\"travel_create\\\":\\\"travel_create\\\",\\\"travel_store\\\":\\\"travel_store\\\",\\\"travel_edit\\\":\\\"travel_edit\\\",\\\"travel_update\\\":\\\"travel_update\\\",\\\"travel_delete\\\":\\\"travel_delete\\\",\\\"travel_view\\\":\\\"travel_view\\\",\\\"travel_list\\\":\\\"travel_list\\\",\\\"travel_approve\\\":\\\"travel_approve\\\",\\\"travel_payment\\\":\\\"travel_payment\\\"}\"','2024-02-06 05:41:55','2024-02-06 05:41:55'),
(44,'meeting','\"{\\\"menu\\\":\\\"meeting_menu\\\",\\\"meeting_create\\\":\\\"meeting_create\\\",\\\"meeting_store\\\":\\\"meeting_store\\\",\\\"meeting_edit\\\":\\\"meeting_edit\\\",\\\"meeting_update\\\":\\\"meeting_update\\\",\\\"meeting_delete\\\":\\\"meeting_delete\\\",\\\"meeting_view\\\":\\\"meeting_view\\\",\\\"meeting_list\\\":\\\"meeting_list\\\"}\"','2024-02-06 05:41:55','2024-02-06 05:41:55'),
(45,'appointment','\"{\\\"appointment_menu\\\":\\\"appointment_menu\\\",\\\"appointment_read\\\":\\\"appointment_read\\\",\\\"appointment_create\\\":\\\"appointment_create\\\",\\\"appointment_approve\\\":\\\"appointment_approve\\\",\\\"appointment_reject\\\":\\\"appointment_reject\\\",\\\"appointment_delete\\\":\\\"appointment_delete\\\"}\"','2024-02-06 05:41:55','2024-02-06 05:41:55'),
(46,'performance','\"{\\\"menu\\\":\\\"performance_menu\\\",\\\"settings\\\":\\\"performance_settings\\\"}\"','2024-02-06 05:41:55','2024-02-06 05:41:55'),
(47,'performance_indicator','\"{\\\"menu\\\":\\\"performance_indicator_menu\\\",\\\"performance_indicator_create\\\":\\\"performance_indicator_create\\\",\\\"performance_indicator_store\\\":\\\"performance_indicator_store\\\",\\\"performance_indicator_edit\\\":\\\"performance_indicator_edit\\\",\\\"performance_indicator_update\\\":\\\"performance_indicator_update\\\",\\\"performance_indicator_delete\\\":\\\"performance_indicator_delete\\\",\\\"performance_indicator_list\\\":\\\"performance_indicator_list\\\",\\\"performance_indicator_view\\\":\\\"performance_indicator_view\\\"}\"','2024-02-06 05:41:55','2024-02-06 05:41:55'),
(48,'performance_appraisal','\"{\\\"menu\\\":\\\"performance_appraisal_menu\\\",\\\"performance_appraisal_create\\\":\\\"performance_appraisal_create\\\",\\\"performance_appraisal_store\\\":\\\"performance_appraisal_store\\\",\\\"performance_appraisal_edit\\\":\\\"performance_appraisal_edit\\\",\\\"performance_appraisal_update\\\":\\\"performance_appraisal_update\\\",\\\"performance_appraisal_delete\\\":\\\"performance_appraisal_delete\\\",\\\"performance_appraisal_list\\\":\\\"performance_appraisal_list\\\",\\\"performance_appraisal_view\\\":\\\"performance_appraisal_view\\\"}\"','2024-02-06 05:41:55','2024-02-06 05:41:55'),
(49,'performance_goal_type','\"{\\\"menu\\\":\\\"performance_goal_type_menu\\\",\\\"performance_goal_type_create\\\":\\\"performance_goal_type_create\\\",\\\"performance_goal_type_store\\\":\\\"performance_goal_type_store\\\",\\\"performance_goal_type_edit\\\":\\\"performance_goal_type_edit\\\",\\\"performance_goal_type_update\\\":\\\"performance_goal_type_update\\\",\\\"performance_goal_type_delete\\\":\\\"performance_goal_type_delete\\\",\\\"performance_goal_type_list\\\":\\\"performance_goal_type_list\\\"}\"','2024-02-06 05:41:55','2024-02-06 05:41:55'),
(50,'performance_goal','\"{\\\"menu\\\":\\\"performance_goal_menu\\\",\\\"performance_goal_create\\\":\\\"performance_goal_create\\\",\\\"performance_goal_store\\\":\\\"performance_goal_store\\\",\\\"performance_goal_edit\\\":\\\"performance_goal_edit\\\",\\\"performance_goal_update\\\":\\\"performance_goal_update\\\",\\\"performance_goal_delete\\\":\\\"performance_goal_delete\\\",\\\"performance_goal_view\\\":\\\"performance_goal_view\\\",\\\"performance_goal_list\\\":\\\"performance_goal_list\\\"}\"','2024-02-06 05:41:55','2024-02-06 05:41:55'),
(51,'performance_competence_type','\"{\\\"menu\\\":\\\"performance_competence_type_menu\\\",\\\"performance_competence_type_create\\\":\\\"performance_competence_type_create\\\",\\\"performance_competence_type_store\\\":\\\"performance_competence_type_store\\\",\\\"performance_competence_type_edit\\\":\\\"performance_competence_type_edit\\\",\\\"performance_competence_type_update\\\":\\\"performance_competence_type_update\\\",\\\"performance_competence_type_delete\\\":\\\"performance_competence_type_delete\\\",\\\"performance_competence_type_list\\\":\\\"performance_competence_type_list\\\"}\"','2024-02-06 05:41:55','2024-02-06 05:41:55'),
(52,'performance_competence','\"{\\\"menu\\\":\\\"performance_competence_menu\\\",\\\"performance_competence_create\\\":\\\"performance_competence_create\\\",\\\"performance_competence_store\\\":\\\"performance_competence_store\\\",\\\"performance_competence_edit\\\":\\\"performance_competence_edit\\\",\\\"performance_competence_update\\\":\\\"performance_competence_update\\\",\\\"performance_competence_delete\\\":\\\"performance_competence_delete\\\",\\\"performance_competence_list\\\":\\\"performance_competence_list\\\"}\"','2024-02-06 05:41:55','2024-02-06 05:41:55'),
(53,'report','\"{\\\"attendance_report\\\":\\\"attendance_report_read\\\",\\\"live_tracking_read\\\":\\\"live_tracking_read\\\",\\\"menu\\\":\\\"report_menu\\\"}\"','2024-02-06 05:41:55','2024-02-06 05:41:55'),
(54,'leave_settings','\"{\\\"read\\\":\\\"leave_settings_read\\\",\\\"update\\\":\\\"leave_settings_update\\\"}\"','2024-02-06 05:41:55','2024-02-06 05:41:55'),
(55,'ip','\"{\\\"read\\\":\\\"ip_read\\\",\\\"create\\\":\\\"ip_create\\\",\\\"update\\\":\\\"ip_update\\\",\\\"delete\\\":\\\"ip_delete\\\"}\"','2024-02-06 05:41:55','2024-02-06 05:41:55'),
(56,'company_setup','\"{\\\"menu\\\":\\\"company_setup_menu\\\",\\\"activation_read\\\":\\\"company_setup_activation\\\",\\\"activation_update\\\":\\\"company_setup_activation_update\\\",\\\"configuration_read\\\":\\\"company_setup_configuration\\\",\\\"configuration_update\\\":\\\"company_setup_configuration_update\\\",\\\"location_read\\\":\\\"company_setup_location\\\",\\\"company_update\\\":\\\"company_settings_update\\\"}\"','2024-02-06 05:41:55','2024-02-06 05:41:55'),
(57,'location','\"{\\\"location_create\\\":\\\"location_create\\\",\\\"location_store\\\":\\\"location_store\\\",\\\"location_edit\\\":\\\"location_edit\\\",\\\"location_update\\\":\\\"location_update\\\",\\\"location_delete\\\":\\\"location_delete\\\"}\"','2024-02-06 05:41:55','2024-02-06 05:41:55'),
(58,'api_setup','\"{\\\"read\\\":\\\"locationApi\\\"}\"','2024-02-06 05:41:55','2024-02-06 05:41:55'),
(59,'claim','\"{\\\"read\\\":\\\"claim_read\\\",\\\"create\\\":\\\"claim_create\\\",\\\"update\\\":\\\"claim_update\\\",\\\"delete\\\":\\\"claim_delete\\\"}\"','2024-02-06 05:41:55','2024-02-06 05:41:55'),
(60,'payment','\"{\\\"read\\\":\\\"payment_read\\\",\\\"create\\\":\\\"payment_create\\\",\\\"update\\\":\\\"payment_update\\\",\\\"delete\\\":\\\"payment_delete\\\"}\"','2024-02-06 05:41:55','2024-02-06 05:41:55'),
(61,'visit','\"{\\\"menu\\\":\\\"visit_menu\\\",\\\"read\\\":\\\"visit_read\\\",\\\"update\\\":\\\"visit_update\\\",\\\"view\\\":\\\"visit_view\\\"}\"','2024-02-06 05:41:55','2024-02-06 05:41:55'),
(62,'app_settings','\"{\\\"menu\\\":\\\"app_settings_menu\\\",\\\"update\\\":\\\"app_settings_update\\\"}\"','2024-02-06 05:41:55','2024-02-06 05:41:55'),
(63,'web_setup','\"{\\\"menu\\\":\\\"web_setup_menu\\\"}\"','2024-02-06 05:41:55','2024-02-06 05:41:55'),
(64,'content','\"{\\\"menu\\\":\\\"content_menu\\\",\\\"read\\\":\\\"content_read\\\",\\\"update\\\":\\\"content_update\\\",\\\"delete\\\":\\\"content_delete\\\"}\"','2024-02-06 05:41:55','2024-02-06 05:41:55'),
(65,'menu','\"{\\\"menu\\\":\\\"menu\\\",\\\"create\\\":\\\"menu_create\\\",\\\"menu_store\\\":\\\"menu_store\\\",\\\"menu_edit\\\":\\\"menu_edit\\\",\\\"update\\\":\\\"menu_update\\\",\\\"delete\\\":\\\"menu_delete\\\"}\"','2024-02-06 05:41:55','2024-02-06 05:41:55'),
(66,'service','\"{\\\"menu\\\":\\\"service_menu\\\",\\\"read\\\":\\\"service_read\\\",\\\"create\\\":\\\"service_create\\\",\\\"update\\\":\\\"service_update\\\",\\\"delete\\\":\\\"service_delete\\\"}\"','2024-02-06 05:41:55','2024-02-06 05:41:55'),
(67,'portfolio','\"{\\\"menu\\\":\\\"portfolio_menu\\\",\\\"create\\\":\\\"portfolio_create\\\",\\\"portfolio_store\\\":\\\"portfolio_store\\\",\\\"edit\\\":\\\"portfolio_edit\\\",\\\"update\\\":\\\"portfolio_update\\\",\\\"delete\\\":\\\"portfolio_delete\\\"}\"','2024-02-06 05:41:55','2024-02-06 05:41:55'),
(68,'contact','\"{\\\"menu\\\":\\\"contact_menu\\\",\\\"read\\\":\\\"contact_read\\\",\\\"create\\\":\\\"contact_create\\\",\\\"update\\\":\\\"contact_update\\\",\\\"delete\\\":\\\"contact_delete\\\"}\"','2024-02-06 05:41:55','2024-02-06 05:41:55'),
(69,'language','\"{\\\"menu\\\":\\\"language_menu\\\",\\\"create\\\":\\\"language_create\\\",\\\"edit\\\":\\\"language_edit\\\",\\\"update\\\":\\\"language_update\\\",\\\"delete\\\":\\\"language_delete\\\",\\\"make_default\\\":\\\"make_default\\\",\\\"setup_language\\\":\\\"setup_language\\\"}\"','2024-02-06 05:41:55','2024-02-06 05:41:55'),
(70,'team_member','\"{\\\"menu\\\":\\\"team_member_menu\\\",\\\"read\\\":\\\"team_member_read\\\",\\\"create\\\":\\\"team_member_create\\\",\\\"team_member_store\\\":\\\"team_member_store\\\",\\\"team_member_edit\\\":\\\"team_member_edit\\\",\\\"update\\\":\\\"team_member_update\\\",\\\"delete\\\":\\\"team_member_delete\\\"}\"','2024-02-06 05:41:55','2024-02-06 05:41:55'),
(71,'support','\"{\\\"support_menu\\\":\\\"support_menu\\\",\\\"support_read\\\":\\\"support_read\\\",\\\"support_create\\\":\\\"support_create\\\",\\\"support_reply\\\":\\\"support_reply\\\",\\\"support_delete\\\":\\\"support_delete\\\"}\"','2024-02-06 05:41:55','2024-02-06 05:41:55'),
(72,'model','\"{\\\"read\\\":\\\"model_read\\\",\\\"create\\\":\\\"model_create\\\",\\\"update\\\":\\\"model_update\\\",\\\"delete\\\":\\\"model_delete\\\"}\"','2024-02-06 05:41:55','2024-02-06 05:41:55'),
(73,'brand','\"{\\\"read\\\":\\\"brand_read\\\",\\\"create\\\":\\\"brand_create\\\",\\\"update\\\":\\\"brand_update\\\",\\\"delete\\\":\\\"brand_delete\\\"}\"','2024-02-06 05:41:55','2024-02-06 05:41:55'),
(74,'machine','\"{\\\"read\\\":\\\"machine_read\\\",\\\"create\\\":\\\"machine_create\\\",\\\"update\\\":\\\"machine_update\\\",\\\"delete\\\":\\\"machine_delete\\\"}\"','2024-02-06 05:41:55','2024-02-06 05:41:55'),
(75,'package','\"{\\\"read\\\":\\\"package_read\\\",\\\"create\\\":\\\"package_create\\\",\\\"update\\\":\\\"package_update\\\",\\\"delete\\\":\\\"package_delete\\\"}\"','2024-02-06 05:41:55','2024-02-06 05:41:55'),
(76,'institution','\"{\\\"read\\\":\\\"institution_read\\\",\\\"create\\\":\\\"institution_create\\\",\\\"update\\\":\\\"institution_update\\\",\\\"delete\\\":\\\"institution_delete\\\"}\"','2024-02-06 05:41:55','2024-02-06 05:41:55'),
(77,'addons_menu','\"{\\\"menu\\\":\\\"addons_menu\\\"}\"','2024-02-06 05:41:55','2024-02-06 05:41:55'),
(78,'employee_document_type','\"{\\\"read\\\":\\\"employee_document_type_read\\\",\\\"create\\\":\\\"employee_document_type_create\\\",\\\"update\\\":\\\"employee_document_type_update\\\",\\\"delete\\\":\\\"employee_document_type_delete\\\"}\"','2024-02-06 05:41:55','2024-02-06 05:41:55'),
(79,'employee_document','\"{\\\"read\\\":\\\"employee_document_read\\\",\\\"create\\\":\\\"employee_document_create\\\",\\\"download\\\":\\\"employee_document_download\\\"}\"','2024-02-06 05:41:55','2024-02-06 05:41:55'),
(80,'subscription','\"{\\\"read\\\":\\\"subscription_read\\\",\\\"upgrade\\\":\\\"subscription_upgrade\\\",\\\"invoice\\\":\\\"subscription_invoice\\\"}\"','2024-02-06 05:41:55','2024-02-06 05:41:55');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portfolios`
--

DROP TABLE IF EXISTS `portfolios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portfolios` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `attachment` bigint(20) unsigned DEFAULT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `status_id` bigint(20) unsigned NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `portfolios_attachment_foreign` (`attachment`),
  KEY `portfolios_user_id_foreign` (`user_id`),
  KEY `portfolios_status_id_company_id_branch_id_index` (`status_id`,`company_id`,`branch_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `portfolios_attachment_foreign` FOREIGN KEY (`attachment`) REFERENCES `uploads` (`id`),
  CONSTRAINT `portfolios_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `portfolios_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portfolios`
--

LOCK TABLES `portfolios` WRITE;
/*!40000 ALTER TABLE `portfolios` DISABLE KEYS */;
/*!40000 ALTER TABLE `portfolios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_activities`
--

DROP TABLE IF EXISTS `project_activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_activities` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `description` longtext NOT NULL,
  `project_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `last_activity` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `project_activities_user_id_foreign` (`user_id`),
  KEY `project_activities_project_id_user_id_company_id_branch_id_index` (`project_id`,`user_id`,`company_id`,`branch_id`),
  CONSTRAINT `project_activities_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `project_activities_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_activities`
--

LOCK TABLES `project_activities` WRITE;
/*!40000 ALTER TABLE `project_activities` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_activities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_file_comments`
--

DROP TABLE IF EXISTS `project_file_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_file_comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned DEFAULT NULL,
  `description` longtext NOT NULL,
  `show_to_customer` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0=no,1=yes',
  `project_file_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `attachment` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `project_file_comments_user_id_foreign` (`user_id`),
  KEY `project_file_comments_attachment_foreign` (`attachment`),
  KEY `project_file_comments_index` (`project_file_id`,`user_id`,`company_id`,`branch_id`),
  CONSTRAINT `project_file_comments_attachment_foreign` FOREIGN KEY (`attachment`) REFERENCES `uploads` (`id`),
  CONSTRAINT `project_file_comments_project_file_id_foreign` FOREIGN KEY (`project_file_id`) REFERENCES `project_files` (`id`) ON DELETE CASCADE,
  CONSTRAINT `project_file_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_file_comments`
--

LOCK TABLES `project_file_comments` WRITE;
/*!40000 ALTER TABLE `project_file_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_file_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_files`
--

DROP TABLE IF EXISTS `project_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_files` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) NOT NULL,
  `show_to_customer` bigint(20) unsigned NOT NULL DEFAULT 22,
  `project_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `attachment` bigint(20) unsigned DEFAULT NULL,
  `status_id` bigint(20) unsigned NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `last_activity` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `project_files_user_id_foreign` (`user_id`),
  KEY `project_files_attachment_foreign` (`attachment`),
  KEY `project_files_index` (`project_id`,`user_id`,`status_id`,`company_id`,`branch_id`),
  KEY `show_to_customer` (`show_to_customer`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `project_files_attachment_foreign` FOREIGN KEY (`attachment`) REFERENCES `uploads` (`id`),
  CONSTRAINT `project_files_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `project_files_show_to_customer_foreign` FOREIGN KEY (`show_to_customer`) REFERENCES `statuses` (`id`),
  CONSTRAINT `project_files_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `project_files_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_files`
--

LOCK TABLES `project_files` WRITE;
/*!40000 ALTER TABLE `project_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_membars`
--

DROP TABLE IF EXISTS `project_membars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_membars` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `project_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `added_by` bigint(20) unsigned NOT NULL,
  `status_id` bigint(20) unsigned NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `project_membars_user_id_foreign` (`user_id`),
  KEY `project_membars_added_by_foreign` (`added_by`),
  KEY `project_membars_index` (`project_id`,`company_id`,`branch_id`,`status_id`,`user_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `project_membars_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `project_membars_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `project_membars_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `project_membars_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_membars`
--

LOCK TABLES `project_membars` WRITE;
/*!40000 ALTER TABLE `project_membars` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_membars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_payments`
--

DROP TABLE IF EXISTS `project_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_payments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `amount` double(16,2) NOT NULL,
  `due_amount` double(16,2) DEFAULT NULL,
  `project_id` bigint(20) unsigned NOT NULL,
  `transaction_id` bigint(20) unsigned DEFAULT NULL,
  `payment_method_id` bigint(20) unsigned DEFAULT NULL,
  `paid_by` bigint(20) unsigned NOT NULL DEFAULT 1,
  `created_by` bigint(20) unsigned NOT NULL DEFAULT 1,
  `updated_by` bigint(20) unsigned NOT NULL DEFAULT 1,
  `payment_note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `project_payments_project_id_company_id_branch_id_amount_index` (`project_id`,`company_id`,`branch_id`,`amount`),
  KEY `transaction_id` (`transaction_id`),
  KEY `payment_method_id` (`payment_method_id`),
  KEY `paid_by` (`paid_by`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  CONSTRAINT `project_payments_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `project_payments_paid_by_foreign` FOREIGN KEY (`paid_by`) REFERENCES `clients` (`id`),
  CONSTRAINT `project_payments_payment_method_id_foreign` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`),
  CONSTRAINT `project_payments_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `project_payments_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`),
  CONSTRAINT `project_payments_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_payments`
--

LOCK TABLES `project_payments` WRITE;
/*!40000 ALTER TABLE `project_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `invoice` varchar(255) DEFAULT NULL,
  `client_id` bigint(20) unsigned NOT NULL,
  `date` date DEFAULT NULL,
  `progress_from_tasks` int(11) DEFAULT 1,
  `progress` int(11) DEFAULT 0,
  `billing_type` enum('hourly','fixed') DEFAULT NULL,
  `per_rate` double(16,2) DEFAULT NULL,
  `total_rate` double(16,2) DEFAULT NULL,
  `estimated_hour` double(16,2) DEFAULT NULL,
  `status_id` bigint(20) unsigned NOT NULL DEFAULT 24,
  `priority` bigint(20) unsigned NOT NULL DEFAULT 24,
  `description` longtext NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `payment` bigint(20) unsigned NOT NULL DEFAULT 9,
  `amount` double(16,2) DEFAULT NULL,
  `paid` double(16,2) NOT NULL DEFAULT 0.00,
  `due` double(16,2) NOT NULL DEFAULT 0.00,
  `created_by` bigint(20) unsigned NOT NULL DEFAULT 1,
  `notify_all_users` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=no,1=yes',
  `notify_all_users_email` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=no,1=yes',
  `goal_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `projects_goal_id_foreign` (`goal_id`),
  KEY `projects_index` (`client_id`,`status_id`,`priority`,`start_date`,`end_date`,`company_id`,`branch_id`),
  KEY `status_id` (`status_id`),
  KEY `priority` (`priority`),
  KEY `payment` (`payment`),
  KEY `created_by` (`created_by`),
  CONSTRAINT `projects_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE,
  CONSTRAINT `projects_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `projects_goal_id_foreign` FOREIGN KEY (`goal_id`) REFERENCES `goals` (`id`) ON DELETE CASCADE,
  CONSTRAINT `projects_payment_foreign` FOREIGN KEY (`payment`) REFERENCES `statuses` (`id`),
  CONSTRAINT `projects_priority_foreign` FOREIGN KEY (`priority`) REFERENCES `statuses` (`id`),
  CONSTRAINT `projects_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_users`
--

DROP TABLE IF EXISTS `role_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `role_users_user_id_foreign` (`user_id`),
  KEY `role_users_role_id_foreign` (`role_id`),
  KEY `role_users_company_id_branch_id_index` (`company_id`,`branch_id`),
  CONSTRAINT `role_users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_users`
--

LOCK TABLES `role_users` WRITE;
/*!40000 ALTER TABLE `role_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `permissions` longtext DEFAULT NULL,
  `upper_roles` varchar(255) DEFAULT NULL,
  `status_id` bigint(20) unsigned NOT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  `app_login` tinyint(1) DEFAULT 1,
  `web_login` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `roles_status_id_company_id_branch_id_index` (`status_id`,`company_id`,`branch_id`),
  CONSTRAINT `roles_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES
(1,'superadmin','superadmin','\"[\\\"team_menu\\\",\\\"team_list\\\",\\\"team_create\\\",\\\"team_update\\\",\\\"team_edit\\\",\\\"team_delete\\\",\\\"team_member_view\\\",\\\"team_member_create\\\",\\\"team_member_edit\\\",\\\"team_member_delete\\\",\\\"team_member_assign\\\",\\\"team_member_unassign\\\",\\\"dashboard\\\",\\\"hr_menu\\\",\\\"designation_read\\\",\\\"designation_create\\\",\\\"designation_update\\\",\\\"designation_delete\\\",\\\"shift_read\\\",\\\"shift_create\\\",\\\"shift_update\\\",\\\"shift_delete\\\",\\\"department_read\\\",\\\"department_create\\\",\\\"department_update\\\",\\\"department_delete\\\",\\\"user_menu\\\",\\\"user_read\\\",\\\"profile_view\\\",\\\"user_create\\\",\\\"user_edit\\\",\\\"user_update\\\",\\\"user_delete\\\",\\\"user_banned\\\",\\\"user_unbanned\\\",\\\"make_hr\\\",\\\"user_permission\\\",\\\"profile_image_view\\\",\\\"user_device_list\\\",\\\"reset_device\\\",\\\"phonebook_profile\\\",\\\"support_ticket_profile\\\",\\\"advance_profile\\\",\\\"commission_profile\\\",\\\"salary_profile\\\",\\\"project_profile\\\",\\\"task_profile\\\",\\\"award_profile\\\",\\\"travel_profile\\\",\\\"attendance_profile\\\",\\\"appointment_profile\\\",\\\"visit_profile\\\",\\\"leave_request_profile\\\",\\\"notice_profile\\\",\\\"role_read\\\",\\\"role_create\\\",\\\"role_update\\\",\\\"role_delete\\\",\\\"branch_read\\\",\\\"branch_create\\\",\\\"branch_update\\\",\\\"branch_delete\\\",\\\"leave_menu\\\",\\\"leave_type_read\\\",\\\"leave_type_create\\\",\\\"leave_type_update\\\",\\\"leave_type_delete\\\",\\\"leave_assign_read\\\",\\\"leave_assign_create\\\",\\\"leave_assign_update\\\",\\\"leave_assign_delete\\\",\\\"leave_request_read\\\",\\\"leave_request_create\\\",\\\"leave_request_store\\\",\\\"leave_request_update\\\",\\\"leave_request_approve\\\",\\\"leave_request_reject\\\",\\\"leave_request_delete\\\",\\\"daily_leave_read\\\",\\\"appointment_read\\\",\\\"appointment_menu\\\",\\\"appointment_create\\\",\\\"appointment_approve\\\",\\\"appointment_reject\\\",\\\"appointment_delete\\\",\\\"weekend_read\\\",\\\"weekend_update\\\",\\\"attendance_update\\\",\\\"holiday_read\\\",\\\"holiday_create\\\",\\\"holiday_update\\\",\\\"holiday_delete\\\",\\\"schedule_read\\\",\\\"schedule_create\\\",\\\"schedule_update\\\",\\\"schedule_delete\\\",\\\"attendance_menu\\\",\\\"attendance_read\\\",\\\"attendance_create\\\",\\\"attendance_update\\\",\\\"attendance_delete\\\",\\\"generate_qr_code\\\",\\\"leave_settings_read\\\",\\\"leave_settings_update\\\",\\\"company_settings_read\\\",\\\"company_settings_update\\\",\\\"locationApi\\\",\\\"company_setup_menu\\\",\\\"company_setup_activation\\\",\\\"company_setup_configuration\\\",\\\"company_setup_ip_whitelist\\\",\\\"company_setup_location\\\",\\\"location_create\\\",\\\"location_store\\\",\\\"location_edit\\\",\\\"location_update\\\",\\\"location_delete\\\",\\\"ip_read\\\",\\\"ip_create\\\",\\\"ip_update\\\",\\\"ip_delete\\\",\\\"attendance_report_read\\\",\\\"live_tracking_read\\\",\\\"report_menu\\\",\\\"report\\\",\\\"claim_read\\\",\\\"claim_create\\\",\\\"claim_update\\\",\\\"claim_delete\\\",\\\"payment_read\\\",\\\"payment_create\\\",\\\"payment_update\\\",\\\"payment_delete\\\",\\\"visit_menu\\\",\\\"visit_read\\\",\\\"visit_view\\\",\\\"visit_update\\\",\\\"payroll_menu\\\",\\\"list_payroll_item\\\",\\\"create_payroll_item\\\",\\\"store_payroll_item\\\",\\\"update_payroll_item\\\",\\\"delete_payroll_item\\\",\\\"view_payroll_item\\\",\\\"payroll_item_menu\\\",\\\"list_payroll_set\\\",\\\"create_payroll_set\\\",\\\"store_payroll_set\\\",\\\"update_payroll_set\\\",\\\"delete_payroll_set\\\",\\\"view_payroll_set\\\",\\\"edit_payroll_set\\\",\\\"payroll_set_menu\\\",\\\"advance_salaries_menu\\\",\\\"advance_salaries_create\\\",\\\"advance_salaries_store\\\",\\\"advance_salaries_edit\\\",\\\"advance_salaries_update\\\",\\\"advance_salaries_delete\\\",\\\"advance_salaries_view\\\",\\\"advance_salaries_approve\\\",\\\"advance_salaries_list\\\",\\\"advance_salaries_pay\\\",\\\"advance_salaries_invoice\\\",\\\"advance_salaries_search\\\",\\\"payslip_menu\\\",\\\"salary_generate\\\",\\\"salary_view\\\",\\\"salary_delete\\\",\\\"salary_edit\\\",\\\"salary_update\\\",\\\"salary_payment\\\",\\\"payslip_list\\\",\\\"advance_type_menu\\\",\\\"advance_type_create\\\",\\\"advance_type_store\\\",\\\"advance_type_edit\\\",\\\"advance_type_update\\\",\\\"advance_type_delete\\\",\\\"advance_type_view\\\",\\\"advance_type_list\\\",\\\"salary_menu\\\",\\\"salary_store\\\",\\\"salary_edit\\\",\\\"salary_update\\\",\\\"salary_delete\\\",\\\"salary_view\\\",\\\"salary_list\\\",\\\"salary_search\\\",\\\"salary_pay\\\",\\\"salary_invoice\\\",\\\"salary_approve\\\",\\\"salary_generate\\\",\\\"salary_calculate\\\",\\\"account_menu\\\",\\\"account_create\\\",\\\"account_store\\\",\\\"account_edit\\\",\\\"account_update\\\",\\\"account_delete\\\",\\\"account_view\\\",\\\"account_list\\\",\\\"account_search\\\",\\\"deposit_menu\\\",\\\"deposit_create\\\",\\\"deposit_store\\\",\\\"deposit_edit\\\",\\\"deposit_update\\\",\\\"deposit_delete\\\",\\\"deposit_list\\\",\\\"expense_menu\\\",\\\"expense_create\\\",\\\"expense_store\\\",\\\"expense_edit\\\",\\\"expense_update\\\",\\\"expense_delete\\\",\\\"expense_list\\\",\\\"expense_view\\\",\\\"expense_approve\\\",\\\"expense_invoice\\\",\\\"expense_pay\\\",\\\"transaction_menu\\\",\\\"transaction_create\\\",\\\"transaction_store\\\",\\\"transaction_edit\\\",\\\"transaction_update\\\",\\\"transaction_delete\\\",\\\"transaction_view\\\",\\\"transaction_list\\\",\\\"deposit_category_menu\\\",\\\"deposit_category_create\\\",\\\"deposit_category_store\\\",\\\"deposit_category_edit\\\",\\\"deposit_category_update\\\",\\\"deposit_category_delete\\\",\\\"deposit_category_list\\\",\\\"payment_method_menu\\\",\\\"payment_method_create\\\",\\\"payment_method_store\\\",\\\"payment_method_edit\\\",\\\"payment_method_update\\\",\\\"payment_method_delete\\\",\\\"payment_method_list\\\",\\\"project_menu\\\",\\\"project_create\\\",\\\"project_store\\\",\\\"project_edit\\\",\\\"project_update\\\",\\\"project_delete\\\",\\\"project_view\\\",\\\"project_list\\\",\\\"project_activity_view\\\",\\\"project_member_view\\\",\\\"project_member_delete\\\",\\\"project_complete\\\",\\\"project_payment\\\",\\\"project_invoice_view\\\",\\\"project_discussion_create\\\",\\\"project_discussion_store\\\",\\\"project_discussion_edit\\\",\\\"project_discussion_update\\\",\\\"project_discussion_delete\\\",\\\"project_discussion_view\\\",\\\"project_discussion_list\\\",\\\"project_discussion_comment\\\",\\\"project_discussion_reply\\\",\\\"project_file_create\\\",\\\"project_file_store\\\",\\\"project_file_edit\\\",\\\"project_file_update\\\",\\\"project_file_delete\\\",\\\"project_file_view\\\",\\\"project_file_list\\\",\\\"project_file_download\\\",\\\"project_file_comment\\\",\\\"project_file_reply\\\",\\\"project_notes_create\\\",\\\"project_notes_store\\\",\\\"project_notes_edit\\\",\\\"project_notes_update\\\",\\\"project_notes_delete\\\",\\\"project_notes_list\\\",\\\"client_menu\\\",\\\"client_create\\\",\\\"client_store\\\",\\\"client_edit\\\",\\\"client_update\\\",\\\"client_delete\\\",\\\"client_view\\\",\\\"client_list\\\",\\\"task_menu\\\",\\\"task_create\\\",\\\"task_store\\\",\\\"task_edit\\\",\\\"task_update\\\",\\\"task_delete\\\",\\\"task_view\\\",\\\"task_list\\\",\\\"task_activity_view\\\",\\\"task_assign_view\\\",\\\"task_assign_delete\\\",\\\"task_complete\\\",\\\"task_discussion_create\\\",\\\"task_discussion_store\\\",\\\"task_discussion_edit\\\",\\\"task_discussion_update\\\",\\\"task_discussion_delete\\\",\\\"task_discussion_view\\\",\\\"task_discussion_list\\\",\\\"task_discussion_comment\\\",\\\"task_discussion_reply\\\",\\\"task_file_create\\\",\\\"task_file_store\\\",\\\"task_file_edit\\\",\\\"task_file_update\\\",\\\"task_file_delete\\\",\\\"task_file_view\\\",\\\"task_file_list\\\",\\\"task_file_download\\\",\\\"task_file_comment\\\",\\\"task_file_reply\\\",\\\"task_notes_create\\\",\\\"task_notes_store\\\",\\\"task_notes_edit\\\",\\\"task_notes_update\\\",\\\"task_notes_delete\\\",\\\"task_notes_list\\\",\\\"task_files_comment\\\",\\\"award_type_menu\\\",\\\"award_type_create\\\",\\\"award_type_store\\\",\\\"award_type_edit\\\",\\\"award_type_update\\\",\\\"award_type_delete\\\",\\\"award_type_view\\\",\\\"award_type_list\\\",\\\"award_menu\\\",\\\"award_create\\\",\\\"award_store\\\",\\\"award_edit\\\",\\\"award_update\\\",\\\"award_delete\\\",\\\"award_list\\\",\\\"travel_type_menu\\\",\\\"travel_type_create\\\",\\\"travel_type_store\\\",\\\"travel_type_edit\\\",\\\"travel_type_update\\\",\\\"travel_type_delete\\\",\\\"travel_type_view\\\",\\\"travel_type_list\\\",\\\"travel_menu\\\",\\\"travel_create\\\",\\\"travel_store\\\",\\\"travel_edit\\\",\\\"travel_update\\\",\\\"travel_delete\\\",\\\"travel_list\\\",\\\"travel_approve\\\",\\\"travel_payment\\\",\\\"meeting_menu\\\",\\\"meeting_create\\\",\\\"meeting_store\\\",\\\"meeting_edit\\\",\\\"meeting_update\\\",\\\"meeting_delete\\\",\\\"meeting_list\\\",\\\"performance_menu\\\",\\\"performance_settings\\\",\\\"performance_indicator_menu\\\",\\\"performance_indicator_list\\\",\\\"performance_indicator_create\\\",\\\"performance_indicator_store\\\",\\\"performance_indicator_edit\\\",\\\"performance_indicator_update\\\",\\\"performance_indicator_delete\\\",\\\"performance_appraisal_menu\\\",\\\"performance_appraisal_create\\\",\\\"performance_appraisal_store\\\",\\\"performance_appraisal_edit\\\",\\\"performance_appraisal_update\\\",\\\"performance_appraisal_delete\\\",\\\"performance_appraisal_list\\\",\\\"performance_appraisal_view\\\",\\\"performance_goal_type_menu\\\",\\\"performance_goal_type_create\\\",\\\"performance_goal_type_store\\\",\\\"performance_goal_type_edit\\\",\\\"performance_goal_type_update\\\",\\\"performance_goal_type_delete\\\",\\\"performance_goal_type_list\\\",\\\"performance_goal_menu\\\",\\\"performance_goal_create\\\",\\\"performance_goal_store\\\",\\\"performance_goal_edit\\\",\\\"performance_goal_update\\\",\\\"performance_goal_delete\\\",\\\"performance_goal_view\\\",\\\"performance_goal_list\\\",\\\"performance_competence_type_list\\\",\\\"performance_competence_type_menu\\\",\\\"performance_competence_type_create\\\",\\\"performance_competence_type_store\\\",\\\"performance_competence_type_edit\\\",\\\"performance_competence_type_update\\\",\\\"performance_competence_type_delete\\\",\\\"performance_competence_type_view\\\",\\\"performance_competence_menu\\\",\\\"performance_competence_create\\\",\\\"performance_competence_store\\\",\\\"performance_competence_edit\\\",\\\"performance_competence_update\\\",\\\"performance_competence_delete\\\",\\\"performance_competence_view\\\",\\\"performance_competence_list\\\",\\\"app_settings_menu\\\",\\\"app_settings_update\\\",\\\"language_menu\\\",\\\"make_default\\\",\\\"conference_read\\\",\\\"general_settings_read\\\",\\\"general_settings_update\\\",\\\"email_settings_update\\\",\\\"storage_settings_update\\\",\\\"language_create\\\",\\\"language_store\\\",\\\"language_edit\\\",\\\"language_update\\\",\\\"language_delete\\\",\\\"setup_language\\\",\\\"content_menu\\\",\\\"content_create\\\",\\\"content_store\\\",\\\"content_edit\\\",\\\"content_update\\\",\\\"content_delete\\\",\\\"contact_menu\\\",\\\"contact_create\\\",\\\"contact_store\\\",\\\"contact_edit\\\",\\\"contact_update\\\",\\\"contact_delete\\\",\\\"conference_create\\\",\\\"conference_read\\\",\\\"conference_store\\\",\\\"conference_update\\\",\\\"conference_delete\\\",\\\"conference_join\\\",\\\"model_read\\\",\\\"model_create\\\",\\\"model_update\\\",\\\"model_delete\\\",\\\"brand_read\\\",\\\"brand_create\\\",\\\"brand_update\\\",\\\"brand_delete\\\",\\\"machine_read\\\",\\\"machine_create\\\",\\\"machine_update\\\",\\\"machine_delete\\\",\\\"package_read\\\",\\\"package_create\\\",\\\"package_update\\\",\\\"package_delete\\\",\\\"institution_read\\\",\\\"institution_create\\\",\\\"institution_update\\\",\\\"institution_delete\\\",\\\"addons_menu\\\",\\\"employee_document_type_read\\\",\\\"employee_document_type_create\\\",\\\"employee_document_type_update\\\",\\\"employee_document_type_delete\\\",\\\"employee_document_read\\\",\\\"employee_document_create\\\",\\\"employee_document_download\\\",\\\"announcement_menu\\\",\\\"notice_menu\\\",\\\"notice_list\\\",\\\"notice_create\\\",\\\"notice_update\\\",\\\"notice_edit\\\",\\\"notice_delete\\\",\\\"send_sms_menu\\\",\\\"send_sms_list\\\",\\\"send_sms_create\\\",\\\"send_sms_update\\\",\\\"send_sms_edit\\\",\\\"send_sms_delete\\\",\\\"send_email_menu\\\",\\\"send_email_list\\\",\\\"send_email_create\\\",\\\"send_email_update\\\",\\\"send_email_edit\\\",\\\"send_email_delete\\\",\\\"send_notification_menu\\\",\\\"send_notification_list\\\",\\\"send_notification_create\\\",\\\"send_notification_update\\\",\\\"send_notification_edit\\\",\\\"send_notification_delete\\\",\\\"announcement_menu\\\",\\\"notice_menu\\\",\\\"notice_list\\\",\\\"notice_create\\\",\\\"notice_update\\\",\\\"notice_edit\\\",\\\"notice_delete\\\",\\\"send_sms_menu\\\",\\\"send_sms_list\\\",\\\"send_sms_create\\\",\\\"send_sms_update\\\",\\\"send_sms_edit\\\",\\\"send_sms_delete\\\",\\\"send_email_menu\\\",\\\"send_email_list\\\",\\\"send_email_create\\\",\\\"send_email_update\\\",\\\"send_email_edit\\\",\\\"send_email_delete\\\",\\\"send_notification_menu\\\",\\\"send_notification_list\\\",\\\"send_notification_create\\\",\\\"send_notification_update\\\",\\\"send_notification_edit\\\",\\\"send_notification_delete\\\",\\\"support_menu\\\",\\\"support_read\\\",\\\"support_create\\\",\\\"support_reply\\\",\\\"support_delete\\\"]\"',NULL,1,1,1,1,1,'2024-02-06 05:41:55','2024-02-06 05:41:55',NULL),
(2,'admin','admin','\"[\\\"team_menu\\\",\\\"team_list\\\",\\\"team_create\\\",\\\"team_update\\\",\\\"team_edit\\\",\\\"team_delete\\\",\\\"team_member_view\\\",\\\"team_member_create\\\",\\\"team_member_edit\\\",\\\"team_member_delete\\\",\\\"team_member_assign\\\",\\\"team_member_unassign\\\",\\\"dashboard\\\",\\\"hr_menu\\\",\\\"designation_read\\\",\\\"designation_create\\\",\\\"designation_update\\\",\\\"designation_delete\\\",\\\"shift_read\\\",\\\"shift_create\\\",\\\"shift_update\\\",\\\"shift_delete\\\",\\\"department_read\\\",\\\"department_create\\\",\\\"department_update\\\",\\\"department_delete\\\",\\\"user_menu\\\",\\\"user_read\\\",\\\"profile_view\\\",\\\"user_create\\\",\\\"user_edit\\\",\\\"user_update\\\",\\\"user_delete\\\",\\\"user_banned\\\",\\\"user_unbanned\\\",\\\"make_hr\\\",\\\"user_permission\\\",\\\"profile_image_view\\\",\\\"user_device_list\\\",\\\"reset_device\\\",\\\"phonebook_profile\\\",\\\"support_ticket_profile\\\",\\\"advance_profile\\\",\\\"commission_profile\\\",\\\"salary_profile\\\",\\\"project_profile\\\",\\\"task_profile\\\",\\\"award_profile\\\",\\\"travel_profile\\\",\\\"attendance_profile\\\",\\\"appointment_profile\\\",\\\"visit_profile\\\",\\\"leave_request_profile\\\",\\\"notice_profile\\\",\\\"role_read\\\",\\\"role_create\\\",\\\"role_update\\\",\\\"role_delete\\\",\\\"branch_read\\\",\\\"branch_create\\\",\\\"branch_update\\\",\\\"branch_delete\\\",\\\"leave_menu\\\",\\\"leave_type_read\\\",\\\"leave_type_create\\\",\\\"leave_type_update\\\",\\\"leave_type_delete\\\",\\\"leave_assign_read\\\",\\\"leave_assign_create\\\",\\\"leave_assign_update\\\",\\\"leave_assign_delete\\\",\\\"leave_request_read\\\",\\\"leave_request_create\\\",\\\"leave_request_store\\\",\\\"leave_request_update\\\",\\\"leave_request_approve\\\",\\\"leave_request_reject\\\",\\\"leave_request_delete\\\",\\\"daily_leave_read\\\",\\\"appointment_read\\\",\\\"appointment_menu\\\",\\\"appointment_create\\\",\\\"appointment_approve\\\",\\\"appointment_reject\\\",\\\"appointment_delete\\\",\\\"weekend_read\\\",\\\"weekend_update\\\",\\\"attendance_update\\\",\\\"holiday_read\\\",\\\"holiday_create\\\",\\\"holiday_update\\\",\\\"holiday_delete\\\",\\\"schedule_read\\\",\\\"schedule_create\\\",\\\"schedule_update\\\",\\\"schedule_delete\\\",\\\"attendance_menu\\\",\\\"attendance_read\\\",\\\"attendance_create\\\",\\\"attendance_update\\\",\\\"attendance_delete\\\",\\\"generate_qr_code\\\",\\\"leave_settings_read\\\",\\\"leave_settings_update\\\",\\\"company_settings_read\\\",\\\"company_settings_update\\\",\\\"locationApi\\\",\\\"company_setup_menu\\\",\\\"company_setup_activation\\\",\\\"company_setup_configuration\\\",\\\"company_setup_ip_whitelist\\\",\\\"company_setup_location\\\",\\\"location_create\\\",\\\"location_store\\\",\\\"location_edit\\\",\\\"location_update\\\",\\\"location_delete\\\",\\\"ip_read\\\",\\\"ip_create\\\",\\\"ip_update\\\",\\\"ip_delete\\\",\\\"attendance_report_read\\\",\\\"live_tracking_read\\\",\\\"report_menu\\\",\\\"report\\\",\\\"claim_read\\\",\\\"claim_create\\\",\\\"claim_update\\\",\\\"claim_delete\\\",\\\"payment_read\\\",\\\"payment_create\\\",\\\"payment_update\\\",\\\"payment_delete\\\",\\\"visit_menu\\\",\\\"visit_read\\\",\\\"visit_view\\\",\\\"visit_update\\\",\\\"payroll_menu\\\",\\\"list_payroll_item\\\",\\\"create_payroll_item\\\",\\\"store_payroll_item\\\",\\\"update_payroll_item\\\",\\\"delete_payroll_item\\\",\\\"view_payroll_item\\\",\\\"payroll_item_menu\\\",\\\"list_payroll_set\\\",\\\"create_payroll_set\\\",\\\"store_payroll_set\\\",\\\"update_payroll_set\\\",\\\"delete_payroll_set\\\",\\\"view_payroll_set\\\",\\\"edit_payroll_set\\\",\\\"payroll_set_menu\\\",\\\"advance_salaries_menu\\\",\\\"advance_salaries_create\\\",\\\"advance_salaries_store\\\",\\\"advance_salaries_edit\\\",\\\"advance_salaries_update\\\",\\\"advance_salaries_delete\\\",\\\"advance_salaries_view\\\",\\\"advance_salaries_approve\\\",\\\"advance_salaries_list\\\",\\\"advance_salaries_pay\\\",\\\"advance_salaries_invoice\\\",\\\"advance_salaries_search\\\",\\\"payslip_menu\\\",\\\"salary_generate\\\",\\\"salary_view\\\",\\\"salary_delete\\\",\\\"salary_edit\\\",\\\"salary_update\\\",\\\"salary_payment\\\",\\\"payslip_list\\\",\\\"advance_type_menu\\\",\\\"advance_type_create\\\",\\\"advance_type_store\\\",\\\"advance_type_edit\\\",\\\"advance_type_update\\\",\\\"advance_type_delete\\\",\\\"advance_type_view\\\",\\\"advance_type_list\\\",\\\"salary_menu\\\",\\\"salary_store\\\",\\\"salary_edit\\\",\\\"salary_update\\\",\\\"salary_delete\\\",\\\"salary_view\\\",\\\"salary_list\\\",\\\"salary_search\\\",\\\"salary_pay\\\",\\\"salary_invoice\\\",\\\"salary_approve\\\",\\\"salary_generate\\\",\\\"salary_calculate\\\",\\\"account_menu\\\",\\\"account_create\\\",\\\"account_store\\\",\\\"account_edit\\\",\\\"account_update\\\",\\\"account_delete\\\",\\\"account_view\\\",\\\"account_list\\\",\\\"account_search\\\",\\\"deposit_menu\\\",\\\"deposit_create\\\",\\\"deposit_store\\\",\\\"deposit_edit\\\",\\\"deposit_update\\\",\\\"deposit_delete\\\",\\\"deposit_list\\\",\\\"expense_menu\\\",\\\"expense_create\\\",\\\"expense_store\\\",\\\"expense_edit\\\",\\\"expense_update\\\",\\\"expense_delete\\\",\\\"expense_list\\\",\\\"expense_view\\\",\\\"expense_approve\\\",\\\"expense_invoice\\\",\\\"expense_pay\\\",\\\"transaction_menu\\\",\\\"transaction_create\\\",\\\"transaction_store\\\",\\\"transaction_edit\\\",\\\"transaction_update\\\",\\\"transaction_delete\\\",\\\"transaction_view\\\",\\\"transaction_list\\\",\\\"deposit_category_menu\\\",\\\"deposit_category_create\\\",\\\"deposit_category_store\\\",\\\"deposit_category_edit\\\",\\\"deposit_category_update\\\",\\\"deposit_category_delete\\\",\\\"deposit_category_list\\\",\\\"payment_method_menu\\\",\\\"payment_method_create\\\",\\\"payment_method_store\\\",\\\"payment_method_edit\\\",\\\"payment_method_update\\\",\\\"payment_method_delete\\\",\\\"payment_method_list\\\",\\\"project_menu\\\",\\\"project_create\\\",\\\"project_store\\\",\\\"project_edit\\\",\\\"project_update\\\",\\\"project_delete\\\",\\\"project_view\\\",\\\"project_list\\\",\\\"project_activity_view\\\",\\\"project_member_view\\\",\\\"project_member_delete\\\",\\\"project_complete\\\",\\\"project_payment\\\",\\\"project_invoice_view\\\",\\\"project_discussion_create\\\",\\\"project_discussion_store\\\",\\\"project_discussion_edit\\\",\\\"project_discussion_update\\\",\\\"project_discussion_delete\\\",\\\"project_discussion_view\\\",\\\"project_discussion_list\\\",\\\"project_discussion_comment\\\",\\\"project_discussion_reply\\\",\\\"project_file_create\\\",\\\"project_file_store\\\",\\\"project_file_edit\\\",\\\"project_file_update\\\",\\\"project_file_delete\\\",\\\"project_file_view\\\",\\\"project_file_list\\\",\\\"project_file_download\\\",\\\"project_file_comment\\\",\\\"project_file_reply\\\",\\\"project_notes_create\\\",\\\"project_notes_store\\\",\\\"project_notes_edit\\\",\\\"project_notes_update\\\",\\\"project_notes_delete\\\",\\\"project_notes_list\\\",\\\"client_menu\\\",\\\"client_create\\\",\\\"client_store\\\",\\\"client_edit\\\",\\\"client_update\\\",\\\"client_delete\\\",\\\"client_view\\\",\\\"client_list\\\",\\\"task_menu\\\",\\\"task_create\\\",\\\"task_store\\\",\\\"task_edit\\\",\\\"task_update\\\",\\\"task_delete\\\",\\\"task_view\\\",\\\"task_list\\\",\\\"task_activity_view\\\",\\\"task_assign_view\\\",\\\"task_assign_delete\\\",\\\"task_complete\\\",\\\"task_discussion_create\\\",\\\"task_discussion_store\\\",\\\"task_discussion_edit\\\",\\\"task_discussion_update\\\",\\\"task_discussion_delete\\\",\\\"task_discussion_view\\\",\\\"task_discussion_list\\\",\\\"task_discussion_comment\\\",\\\"task_discussion_reply\\\",\\\"task_file_create\\\",\\\"task_file_store\\\",\\\"task_file_edit\\\",\\\"task_file_update\\\",\\\"task_file_delete\\\",\\\"task_file_view\\\",\\\"task_file_list\\\",\\\"task_file_download\\\",\\\"task_file_comment\\\",\\\"task_file_reply\\\",\\\"task_notes_create\\\",\\\"task_notes_store\\\",\\\"task_notes_edit\\\",\\\"task_notes_update\\\",\\\"task_notes_delete\\\",\\\"task_notes_list\\\",\\\"task_files_comment\\\",\\\"award_type_menu\\\",\\\"award_type_create\\\",\\\"award_type_store\\\",\\\"award_type_edit\\\",\\\"award_type_update\\\",\\\"award_type_delete\\\",\\\"award_type_view\\\",\\\"award_type_list\\\",\\\"award_menu\\\",\\\"award_create\\\",\\\"award_store\\\",\\\"award_edit\\\",\\\"award_update\\\",\\\"award_delete\\\",\\\"award_list\\\",\\\"travel_type_menu\\\",\\\"travel_type_create\\\",\\\"travel_type_store\\\",\\\"travel_type_edit\\\",\\\"travel_type_update\\\",\\\"travel_type_delete\\\",\\\"travel_type_view\\\",\\\"travel_type_list\\\",\\\"travel_menu\\\",\\\"travel_create\\\",\\\"travel_store\\\",\\\"travel_edit\\\",\\\"travel_update\\\",\\\"travel_delete\\\",\\\"travel_list\\\",\\\"travel_approve\\\",\\\"travel_payment\\\",\\\"meeting_menu\\\",\\\"meeting_create\\\",\\\"meeting_store\\\",\\\"meeting_edit\\\",\\\"meeting_update\\\",\\\"meeting_delete\\\",\\\"meeting_list\\\",\\\"performance_menu\\\",\\\"performance_settings\\\",\\\"performance_indicator_menu\\\",\\\"performance_indicator_list\\\",\\\"performance_indicator_create\\\",\\\"performance_indicator_store\\\",\\\"performance_indicator_edit\\\",\\\"performance_indicator_update\\\",\\\"performance_indicator_delete\\\",\\\"performance_appraisal_menu\\\",\\\"performance_appraisal_create\\\",\\\"performance_appraisal_store\\\",\\\"performance_appraisal_edit\\\",\\\"performance_appraisal_update\\\",\\\"performance_appraisal_delete\\\",\\\"performance_appraisal_list\\\",\\\"performance_appraisal_view\\\",\\\"performance_goal_type_menu\\\",\\\"performance_goal_type_create\\\",\\\"performance_goal_type_store\\\",\\\"performance_goal_type_edit\\\",\\\"performance_goal_type_update\\\",\\\"performance_goal_type_delete\\\",\\\"performance_goal_type_list\\\",\\\"performance_goal_menu\\\",\\\"performance_goal_create\\\",\\\"performance_goal_store\\\",\\\"performance_goal_edit\\\",\\\"performance_goal_update\\\",\\\"performance_goal_delete\\\",\\\"performance_goal_view\\\",\\\"performance_goal_list\\\",\\\"performance_competence_type_list\\\",\\\"performance_competence_type_menu\\\",\\\"performance_competence_type_create\\\",\\\"performance_competence_type_store\\\",\\\"performance_competence_type_edit\\\",\\\"performance_competence_type_update\\\",\\\"performance_competence_type_delete\\\",\\\"performance_competence_type_view\\\",\\\"performance_competence_menu\\\",\\\"performance_competence_create\\\",\\\"performance_competence_store\\\",\\\"performance_competence_edit\\\",\\\"performance_competence_update\\\",\\\"performance_competence_delete\\\",\\\"performance_competence_view\\\",\\\"performance_competence_list\\\",\\\"app_settings_menu\\\",\\\"app_settings_update\\\",\\\"language_menu\\\",\\\"make_default\\\",\\\"conference_read\\\",\\\"general_settings_read\\\",\\\"general_settings_update\\\",\\\"email_settings_update\\\",\\\"storage_settings_update\\\",\\\"language_create\\\",\\\"language_store\\\",\\\"language_edit\\\",\\\"language_update\\\",\\\"language_delete\\\",\\\"setup_language\\\",\\\"content_menu\\\",\\\"content_create\\\",\\\"content_store\\\",\\\"content_edit\\\",\\\"content_update\\\",\\\"content_delete\\\",\\\"contact_menu\\\",\\\"contact_create\\\",\\\"contact_store\\\",\\\"contact_edit\\\",\\\"contact_update\\\",\\\"contact_delete\\\",\\\"conference_create\\\",\\\"conference_read\\\",\\\"conference_store\\\",\\\"conference_update\\\",\\\"conference_delete\\\",\\\"conference_join\\\",\\\"model_read\\\",\\\"model_create\\\",\\\"model_update\\\",\\\"model_delete\\\",\\\"brand_read\\\",\\\"brand_create\\\",\\\"brand_update\\\",\\\"brand_delete\\\",\\\"machine_read\\\",\\\"machine_create\\\",\\\"machine_update\\\",\\\"machine_delete\\\",\\\"package_read\\\",\\\"package_create\\\",\\\"package_update\\\",\\\"package_delete\\\",\\\"institution_read\\\",\\\"institution_create\\\",\\\"institution_update\\\",\\\"institution_delete\\\",\\\"addons_menu\\\",\\\"employee_document_type_read\\\",\\\"employee_document_type_create\\\",\\\"employee_document_type_update\\\",\\\"employee_document_type_delete\\\",\\\"employee_document_read\\\",\\\"employee_document_create\\\",\\\"employee_document_download\\\",\\\"announcement_menu\\\",\\\"notice_menu\\\",\\\"notice_list\\\",\\\"notice_create\\\",\\\"notice_update\\\",\\\"notice_edit\\\",\\\"notice_delete\\\",\\\"send_sms_menu\\\",\\\"send_sms_list\\\",\\\"send_sms_create\\\",\\\"send_sms_update\\\",\\\"send_sms_edit\\\",\\\"send_sms_delete\\\",\\\"send_email_menu\\\",\\\"send_email_list\\\",\\\"send_email_create\\\",\\\"send_email_update\\\",\\\"send_email_edit\\\",\\\"send_email_delete\\\",\\\"send_notification_menu\\\",\\\"send_notification_list\\\",\\\"send_notification_create\\\",\\\"send_notification_update\\\",\\\"send_notification_edit\\\",\\\"send_notification_delete\\\",\\\"announcement_menu\\\",\\\"notice_menu\\\",\\\"notice_list\\\",\\\"notice_create\\\",\\\"notice_update\\\",\\\"notice_edit\\\",\\\"notice_delete\\\",\\\"send_sms_menu\\\",\\\"send_sms_list\\\",\\\"send_sms_create\\\",\\\"send_sms_update\\\",\\\"send_sms_edit\\\",\\\"send_sms_delete\\\",\\\"send_email_menu\\\",\\\"send_email_list\\\",\\\"send_email_create\\\",\\\"send_email_update\\\",\\\"send_email_edit\\\",\\\"send_email_delete\\\",\\\"send_notification_menu\\\",\\\"send_notification_list\\\",\\\"send_notification_create\\\",\\\"send_notification_update\\\",\\\"send_notification_edit\\\",\\\"send_notification_delete\\\",\\\"support_menu\\\",\\\"support_read\\\",\\\"support_create\\\",\\\"support_reply\\\",\\\"support_delete\\\"]\"',NULL,1,1,1,1,1,'2024-02-06 05:41:55','2024-02-06 05:41:55',NULL),
(3,'hr','hr','\"[\\\"team_menu\\\",\\\"team_list\\\",\\\"team_create\\\",\\\"team_update\\\",\\\"team_edit\\\",\\\"team_delete\\\",\\\"team_member_view\\\",\\\"team_member_create\\\",\\\"team_member_edit\\\",\\\"team_member_delete\\\",\\\"team_member_assign\\\",\\\"team_member_unassign\\\",\\\"dashboard\\\",\\\"designation_read\\\",\\\"designation_create\\\",\\\"designation_update\\\",\\\"designation_delete\\\",\\\"shift_read\\\",\\\"shift_create\\\",\\\"shift_update\\\",\\\"shift_delete\\\",\\\"department_read\\\",\\\"department_create\\\",\\\"department_update\\\",\\\"department_delete\\\",\\\"user_menu\\\",\\\"user_read\\\",\\\"profile_view\\\",\\\"user_create\\\",\\\"user_edit\\\",\\\"user_update\\\",\\\"user_delete\\\",\\\"user_banned\\\",\\\"user_unbanned\\\",\\\"make_hr\\\",\\\"user_permission\\\",\\\"profile_image_view\\\",\\\"user_device_list\\\",\\\"reset_device\\\",\\\"role_read\\\",\\\"role_create\\\",\\\"role_update\\\",\\\"role_delete\\\",\\\"branch_read\\\",\\\"branch_create\\\",\\\"branch_update\\\",\\\"branch_delete\\\",\\\"leave_menu\\\",\\\"leave_type_read\\\",\\\"leave_type_create\\\",\\\"leave_type_update\\\",\\\"leave_type_delete\\\",\\\"leave_assign_read\\\",\\\"leave_assign_create\\\",\\\"leave_assign_update\\\",\\\"leave_assign_delete\\\",\\\"leave_request_read\\\",\\\"leave_request_create\\\",\\\"leave_request_approve\\\",\\\"leave_request_reject\\\",\\\"leave_request_delete\\\",\\\"appointment_read\\\",\\\"appointment_menu\\\",\\\"appointment_create\\\",\\\"appointment_approve\\\",\\\"appointment_reject\\\",\\\"appointment_delete\\\",\\\"weekend_read\\\",\\\"weekend_update\\\",\\\"attendance_update\\\",\\\"holiday_read\\\",\\\"holiday_create\\\",\\\"holiday_update\\\",\\\"holiday_delete\\\",\\\"schedule_read\\\",\\\"schedule_create\\\",\\\"schedule_update\\\",\\\"schedule_delete\\\",\\\"attendance_menu\\\",\\\"attendance_read\\\",\\\"attendance_create\\\",\\\"attendance_update\\\",\\\"attendance_delete\\\",\\\"leave_settings_read\\\",\\\"leave_settings_update\\\",\\\"company_settings_read\\\",\\\"company_settings_update\\\",\\\"locationApi\\\",\\\"company_setup_menu\\\",\\\"company_setup_activation\\\",\\\"company_setup_configuration\\\",\\\"company_setup_ip_whitelist\\\",\\\"company_setup_location\\\",\\\"ip_read\\\",\\\"ip_create\\\",\\\"ip_update\\\",\\\"ip_delete\\\",\\\"attendance_report_read\\\",\\\"live_tracking_read\\\",\\\"report_menu\\\",\\\"report\\\",\\\"claim_read\\\",\\\"claim_create\\\",\\\"claim_update\\\",\\\"claim_delete\\\",\\\"payment_read\\\",\\\"payment_create\\\",\\\"payment_update\\\",\\\"payment_delete\\\",\\\"visit_menu\\\",\\\"visit_read\\\",\\\"visit_view\\\",\\\"visit_update\\\",\\\"payroll_menu\\\",\\\"list_payroll_item\\\",\\\"create_payroll_item\\\",\\\"store_payroll_item\\\",\\\"update_payroll_item\\\",\\\"delete_payroll_item\\\",\\\"view_payroll_item\\\",\\\"payroll_item_menu\\\",\\\"list_payroll_set\\\",\\\"create_payroll_set\\\",\\\"store_payroll_set\\\",\\\"update_payroll_set\\\",\\\"delete_payroll_set\\\",\\\"view_payroll_set\\\",\\\"edit_payroll_set\\\",\\\"payroll_set_menu\\\",\\\"advance_salaries_menu\\\",\\\"advance_salaries_create\\\",\\\"advance_salaries_store\\\",\\\"advance_salaries_edit\\\",\\\"advance_salaries_update\\\",\\\"advance_salaries_delete\\\",\\\"advance_salaries_view\\\",\\\"advance_salaries_approve\\\",\\\"advance_salaries_list\\\",\\\"advance_salaries_pay\\\",\\\"advance_salaries_invoice\\\",\\\"advance_salaries_search\\\",\\\"payslip_menu\\\",\\\"salary_generate\\\",\\\"salary_view\\\",\\\"salary_delete\\\",\\\"salary_edit\\\",\\\"salary_update\\\",\\\"salary_payment\\\",\\\"payslip_list\\\",\\\"advance_type_menu\\\",\\\"advance_type_create\\\",\\\"advance_type_store\\\",\\\"advance_type_edit\\\",\\\"advance_type_update\\\",\\\"advance_type_delete\\\",\\\"advance_type_view\\\",\\\"advance_type_list\\\",\\\"salary_menu\\\",\\\"salary_store\\\",\\\"salary_edit\\\",\\\"salary_update\\\",\\\"salary_delete\\\",\\\"salary_view\\\",\\\"salary_list\\\",\\\"salary_search\\\",\\\"salary_pay\\\",\\\"salary_invoice\\\",\\\"salary_approve\\\",\\\"salary_generate\\\",\\\"salary_calculate\\\",\\\"account_menu\\\",\\\"account_create\\\",\\\"account_store\\\",\\\"account_edit\\\",\\\"account_update\\\",\\\"account_delete\\\",\\\"account_view\\\",\\\"account_list\\\",\\\"account_search\\\",\\\"deposit_menu\\\",\\\"deposit_create\\\",\\\"deposit_store\\\",\\\"deposit_edit\\\",\\\"deposit_update\\\",\\\"deposit_delete\\\",\\\"deposit_list\\\",\\\"expense_menu\\\",\\\"expense_create\\\",\\\"expense_store\\\",\\\"expense_edit\\\",\\\"expense_update\\\",\\\"expense_delete\\\",\\\"expense_list\\\",\\\"expense_view\\\",\\\"expense_approve\\\",\\\"expense_invoice\\\",\\\"expense_pay\\\",\\\"transaction_menu\\\",\\\"transaction_create\\\",\\\"transaction_store\\\",\\\"transaction_edit\\\",\\\"transaction_update\\\",\\\"transaction_delete\\\",\\\"transaction_view\\\",\\\"transaction_list\\\",\\\"deposit_category_menu\\\",\\\"deposit_category_create\\\",\\\"deposit_category_store\\\",\\\"deposit_category_edit\\\",\\\"deposit_category_update\\\",\\\"deposit_category_delete\\\",\\\"deposit_category_list\\\",\\\"payment_method_menu\\\",\\\"payment_method_create\\\",\\\"payment_method_store\\\",\\\"payment_method_edit\\\",\\\"payment_method_update\\\",\\\"payment_method_delete\\\",\\\"payment_method_list\\\",\\\"travel_menu\\\",\\\"travel_create\\\",\\\"travel_store\\\",\\\"travel_edit\\\",\\\"travel_update\\\",\\\"travel_delete\\\",\\\"travel_list\\\",\\\"travel_view\\\",\\\"travel_approve\\\",\\\"travel_invoice\\\",\\\"travel_pay\\\",\\\"meeting_menu\\\",\\\"meeting_create\\\",\\\"meeting_store\\\",\\\"meeting_edit\\\",\\\"meeting_update\\\",\\\"meeting_delete\\\",\\\"meeting_list\\\",\\\"meeting_view\\\",\\\"task_menu\\\",\\\"task.create\\\",\\\"task.index\\\",\\\"task.view\\\",\\\"task.edit\\\",\\\"conference_create\\\",\\\"conference_read\\\",\\\"conference_store\\\",\\\"conference_update\\\",\\\"conference_delete\\\",\\\"conference_join\\\",\\\"announcement_menu\\\",\\\"notice_menu\\\",\\\"notice_list\\\",\\\"notice_create\\\",\\\"notice_update\\\",\\\"notice_edit\\\",\\\"notice_delete\\\",\\\"send_sms_menu\\\",\\\"send_sms_list\\\",\\\"send_sms_create\\\",\\\"send_sms_update\\\",\\\"send_sms_edit\\\",\\\"send_sms_delete\\\",\\\"send_email_menu\\\",\\\"send_email_list\\\",\\\"send_email_create\\\",\\\"send_email_update\\\",\\\"send_email_edit\\\",\\\"send_email_delete\\\",\\\"send_notification_menu\\\",\\\"send_notification_list\\\",\\\"send_notification_create\\\",\\\"send_notification_update\\\",\\\"send_notification_edit\\\",\\\"send_notification_delete\\\",\\\"announcement_menu\\\",\\\"notice_menu\\\",\\\"notice_list\\\",\\\"notice_create\\\",\\\"notice_update\\\",\\\"notice_edit\\\",\\\"notice_delete\\\",\\\"send_sms_menu\\\",\\\"send_sms_list\\\",\\\"send_sms_create\\\",\\\"send_sms_update\\\",\\\"send_sms_edit\\\",\\\"send_sms_delete\\\",\\\"send_email_menu\\\",\\\"send_email_list\\\",\\\"send_email_create\\\",\\\"send_email_update\\\",\\\"send_email_edit\\\",\\\"send_email_delete\\\",\\\"send_notification_menu\\\",\\\"send_notification_list\\\",\\\"send_notification_create\\\",\\\"send_notification_update\\\",\\\"send_notification_edit\\\",\\\"send_notification_delete\\\",\\\"support_menu\\\",\\\"support_read\\\",\\\"support_create\\\",\\\"support_reply\\\",\\\"support_delete\\\"]\"',NULL,1,1,1,1,1,'2024-02-06 05:41:55','2024-02-06 05:41:55',NULL),
(4,'staff','staff','\"[\\\"dashboard\\\",\\\"designation_read\\\",\\\"designation_create\\\",\\\"designation_update\\\",\\\"shift_read\\\",\\\"shift_create\\\",\\\"shift_update\\\",\\\"department_read\\\",\\\"department_create\\\",\\\"department_update\\\",\\\"user_menu\\\",\\\"user_read\\\",\\\"profile_view\\\",\\\"user_create\\\",\\\"user_edit\\\",\\\"user_update\\\",\\\"user_permission\\\",\\\"profile_image_view\\\",\\\"user_device_list\\\",\\\"role_read\\\",\\\"role_create\\\",\\\"role_update\\\",\\\"branch_read\\\",\\\"branch_create\\\",\\\"branch_update\\\",\\\"leave_menu\\\",\\\"leave_type_read\\\",\\\"leave_type_create\\\",\\\"leave_type_update\\\",\\\"leave_assign_read\\\",\\\"leave_assign_create\\\",\\\"leave_assign_update\\\",\\\"leave_request_read\\\",\\\"leave_request_create\\\",\\\"appointment_read\\\",\\\"appointment_menu\\\",\\\"appointment_create\\\",\\\"weekend_read\\\",\\\"attendance_update\\\",\\\"holiday_read\\\",\\\"holiday_create\\\",\\\"schedule_read\\\",\\\"schedule_create\\\",\\\"attendance_menu\\\",\\\"attendance_read\\\",\\\"attendance_create\\\",\\\"attendance_update\\\",\\\"leave_settings_read\\\",\\\"company_settings_read\\\",\\\"locationApi\\\",\\\"ip_read\\\",\\\"ip_create\\\",\\\"attendance_report_read\\\",\\\"live_tracking_read\\\",\\\"report_menu\\\",\\\"report\\\",\\\"claim_read\\\",\\\"claim_create\\\",\\\"payment_read\\\",\\\"payment_create\\\",\\\"visit_menu\\\",\\\"visit_read\\\",\\\"visit_view\\\",\\\"payroll_menu\\\",\\\"list_payroll_item\\\",\\\"view_payroll_item\\\",\\\"payroll_item_menu\\\",\\\"list_payroll_set\\\",\\\"view_payroll_set\\\",\\\"payroll_set_menu\\\",\\\"payslip_menu\\\",\\\"salary_generate\\\",\\\"salary_view\\\",\\\"salary_payment\\\",\\\"payslip_list\\\",\\\"salary_menu\\\",\\\"salary_view\\\",\\\"salary_list\\\",\\\"salary_search\\\",\\\"salary_pay\\\",\\\"salary_invoice\\\",\\\"salary_approve\\\",\\\"salary_generate\\\",\\\"salary_calculate\\\",\\\"account_menu\\\",\\\"account_view\\\",\\\"account_list\\\",\\\"account_search\\\",\\\"deposit_menu\\\",\\\"deposit_list\\\",\\\"expense_menu\\\",\\\"expense_list\\\",\\\"expense_view\\\",\\\"expense_approve\\\",\\\"expense_invoice\\\",\\\"expense_pay\\\",\\\"transaction_menu\\\",\\\"transaction_view\\\",\\\"transaction_list\\\",\\\"deposit_category_menu\\\",\\\"deposit_category_list\\\",\\\"payment_method_menu\\\",\\\"payment_method_list\\\",\\\"travel_menu\\\",\\\"travel_create\\\",\\\"travel_store\\\",\\\"travel_edit\\\",\\\"travel_update\\\",\\\"travel_list\\\",\\\"travel_view\\\",\\\"travel_approve\\\",\\\"travel_invoice\\\",\\\"travel_pay\\\",\\\"meeting_menu\\\",\\\"meeting_create\\\",\\\"meeting_store\\\",\\\"meeting_edit\\\",\\\"meeting_update\\\",\\\"meeting_list\\\",\\\"meeting_view\\\",\\\"task_menu\\\",\\\"task.create\\\",\\\"task.index\\\",\\\"task.view\\\",\\\"task.edit\\\"]\"',NULL,1,1,1,1,1,'2024-02-06 05:41:55','2024-02-06 05:41:55',NULL),
(5,'superadmin','superadmin','\"[\\\"team_menu\\\",\\\"team_list\\\",\\\"team_create\\\",\\\"team_update\\\",\\\"team_edit\\\",\\\"team_delete\\\",\\\"team_member_view\\\",\\\"team_member_create\\\",\\\"team_member_edit\\\",\\\"team_member_delete\\\",\\\"team_member_assign\\\",\\\"team_member_unassign\\\",\\\"dashboard\\\",\\\"hr_menu\\\",\\\"designation_read\\\",\\\"designation_create\\\",\\\"designation_update\\\",\\\"designation_delete\\\",\\\"shift_read\\\",\\\"shift_create\\\",\\\"shift_update\\\",\\\"shift_delete\\\",\\\"department_read\\\",\\\"department_create\\\",\\\"department_update\\\",\\\"department_delete\\\",\\\"user_menu\\\",\\\"user_read\\\",\\\"profile_view\\\",\\\"user_create\\\",\\\"user_edit\\\",\\\"user_update\\\",\\\"user_delete\\\",\\\"user_banned\\\",\\\"user_unbanned\\\",\\\"make_hr\\\",\\\"user_permission\\\",\\\"profile_image_view\\\",\\\"user_device_list\\\",\\\"reset_device\\\",\\\"phonebook_profile\\\",\\\"support_ticket_profile\\\",\\\"advance_profile\\\",\\\"commission_profile\\\",\\\"salary_profile\\\",\\\"project_profile\\\",\\\"task_profile\\\",\\\"award_profile\\\",\\\"travel_profile\\\",\\\"attendance_profile\\\",\\\"appointment_profile\\\",\\\"visit_profile\\\",\\\"leave_request_profile\\\",\\\"notice_profile\\\",\\\"role_read\\\",\\\"role_create\\\",\\\"role_update\\\",\\\"role_delete\\\",\\\"branch_read\\\",\\\"branch_create\\\",\\\"branch_update\\\",\\\"branch_delete\\\",\\\"leave_menu\\\",\\\"leave_type_read\\\",\\\"leave_type_create\\\",\\\"leave_type_update\\\",\\\"leave_type_delete\\\",\\\"leave_assign_read\\\",\\\"leave_assign_create\\\",\\\"leave_assign_update\\\",\\\"leave_assign_delete\\\",\\\"leave_request_read\\\",\\\"leave_request_create\\\",\\\"leave_request_store\\\",\\\"leave_request_update\\\",\\\"leave_request_approve\\\",\\\"leave_request_reject\\\",\\\"leave_request_delete\\\",\\\"daily_leave_read\\\",\\\"appointment_read\\\",\\\"appointment_menu\\\",\\\"appointment_create\\\",\\\"appointment_approve\\\",\\\"appointment_reject\\\",\\\"appointment_delete\\\",\\\"weekend_read\\\",\\\"weekend_update\\\",\\\"attendance_update\\\",\\\"holiday_read\\\",\\\"holiday_create\\\",\\\"holiday_update\\\",\\\"holiday_delete\\\",\\\"schedule_read\\\",\\\"schedule_create\\\",\\\"schedule_update\\\",\\\"schedule_delete\\\",\\\"attendance_menu\\\",\\\"attendance_read\\\",\\\"attendance_create\\\",\\\"attendance_update\\\",\\\"attendance_delete\\\",\\\"generate_qr_code\\\",\\\"leave_settings_read\\\",\\\"leave_settings_update\\\",\\\"company_settings_read\\\",\\\"company_settings_update\\\",\\\"locationApi\\\",\\\"company_setup_menu\\\",\\\"company_setup_activation\\\",\\\"company_setup_configuration\\\",\\\"company_setup_ip_whitelist\\\",\\\"company_setup_location\\\",\\\"location_create\\\",\\\"location_store\\\",\\\"location_edit\\\",\\\"location_update\\\",\\\"location_delete\\\",\\\"ip_read\\\",\\\"ip_create\\\",\\\"ip_update\\\",\\\"ip_delete\\\",\\\"attendance_report_read\\\",\\\"live_tracking_read\\\",\\\"report_menu\\\",\\\"report\\\",\\\"claim_read\\\",\\\"claim_create\\\",\\\"claim_update\\\",\\\"claim_delete\\\",\\\"payment_read\\\",\\\"payment_create\\\",\\\"payment_update\\\",\\\"payment_delete\\\",\\\"visit_menu\\\",\\\"visit_read\\\",\\\"visit_view\\\",\\\"visit_update\\\",\\\"payroll_menu\\\",\\\"list_payroll_item\\\",\\\"create_payroll_item\\\",\\\"store_payroll_item\\\",\\\"update_payroll_item\\\",\\\"delete_payroll_item\\\",\\\"view_payroll_item\\\",\\\"payroll_item_menu\\\",\\\"list_payroll_set\\\",\\\"create_payroll_set\\\",\\\"store_payroll_set\\\",\\\"update_payroll_set\\\",\\\"delete_payroll_set\\\",\\\"view_payroll_set\\\",\\\"edit_payroll_set\\\",\\\"payroll_set_menu\\\",\\\"advance_salaries_menu\\\",\\\"advance_salaries_create\\\",\\\"advance_salaries_store\\\",\\\"advance_salaries_edit\\\",\\\"advance_salaries_update\\\",\\\"advance_salaries_delete\\\",\\\"advance_salaries_view\\\",\\\"advance_salaries_approve\\\",\\\"advance_salaries_list\\\",\\\"advance_salaries_pay\\\",\\\"advance_salaries_invoice\\\",\\\"advance_salaries_search\\\",\\\"payslip_menu\\\",\\\"salary_generate\\\",\\\"salary_view\\\",\\\"salary_delete\\\",\\\"salary_edit\\\",\\\"salary_update\\\",\\\"salary_payment\\\",\\\"payslip_list\\\",\\\"advance_type_menu\\\",\\\"advance_type_create\\\",\\\"advance_type_store\\\",\\\"advance_type_edit\\\",\\\"advance_type_update\\\",\\\"advance_type_delete\\\",\\\"advance_type_view\\\",\\\"advance_type_list\\\",\\\"salary_menu\\\",\\\"salary_store\\\",\\\"salary_edit\\\",\\\"salary_update\\\",\\\"salary_delete\\\",\\\"salary_view\\\",\\\"salary_list\\\",\\\"salary_search\\\",\\\"salary_pay\\\",\\\"salary_invoice\\\",\\\"salary_approve\\\",\\\"salary_generate\\\",\\\"salary_calculate\\\",\\\"account_menu\\\",\\\"account_create\\\",\\\"account_store\\\",\\\"account_edit\\\",\\\"account_update\\\",\\\"account_delete\\\",\\\"account_view\\\",\\\"account_list\\\",\\\"account_search\\\",\\\"deposit_menu\\\",\\\"deposit_create\\\",\\\"deposit_store\\\",\\\"deposit_edit\\\",\\\"deposit_update\\\",\\\"deposit_delete\\\",\\\"deposit_list\\\",\\\"expense_menu\\\",\\\"expense_create\\\",\\\"expense_store\\\",\\\"expense_edit\\\",\\\"expense_update\\\",\\\"expense_delete\\\",\\\"expense_list\\\",\\\"expense_view\\\",\\\"expense_approve\\\",\\\"expense_invoice\\\",\\\"expense_pay\\\",\\\"transaction_menu\\\",\\\"transaction_create\\\",\\\"transaction_store\\\",\\\"transaction_edit\\\",\\\"transaction_update\\\",\\\"transaction_delete\\\",\\\"transaction_view\\\",\\\"transaction_list\\\",\\\"deposit_category_menu\\\",\\\"deposit_category_create\\\",\\\"deposit_category_store\\\",\\\"deposit_category_edit\\\",\\\"deposit_category_update\\\",\\\"deposit_category_delete\\\",\\\"deposit_category_list\\\",\\\"payment_method_menu\\\",\\\"payment_method_create\\\",\\\"payment_method_store\\\",\\\"payment_method_edit\\\",\\\"payment_method_update\\\",\\\"payment_method_delete\\\",\\\"payment_method_list\\\",\\\"project_menu\\\",\\\"project_create\\\",\\\"project_store\\\",\\\"project_edit\\\",\\\"project_update\\\",\\\"project_delete\\\",\\\"project_view\\\",\\\"project_list\\\",\\\"project_activity_view\\\",\\\"project_member_view\\\",\\\"project_member_delete\\\",\\\"project_complete\\\",\\\"project_payment\\\",\\\"project_invoice_view\\\",\\\"project_discussion_create\\\",\\\"project_discussion_store\\\",\\\"project_discussion_edit\\\",\\\"project_discussion_update\\\",\\\"project_discussion_delete\\\",\\\"project_discussion_view\\\",\\\"project_discussion_list\\\",\\\"project_discussion_comment\\\",\\\"project_discussion_reply\\\",\\\"project_file_create\\\",\\\"project_file_store\\\",\\\"project_file_edit\\\",\\\"project_file_update\\\",\\\"project_file_delete\\\",\\\"project_file_view\\\",\\\"project_file_list\\\",\\\"project_file_download\\\",\\\"project_file_comment\\\",\\\"project_file_reply\\\",\\\"project_notes_create\\\",\\\"project_notes_store\\\",\\\"project_notes_edit\\\",\\\"project_notes_update\\\",\\\"project_notes_delete\\\",\\\"project_notes_list\\\",\\\"client_menu\\\",\\\"client_create\\\",\\\"client_store\\\",\\\"client_edit\\\",\\\"client_update\\\",\\\"client_delete\\\",\\\"client_view\\\",\\\"client_list\\\",\\\"task_menu\\\",\\\"task_create\\\",\\\"task_store\\\",\\\"task_edit\\\",\\\"task_update\\\",\\\"task_delete\\\",\\\"task_view\\\",\\\"task_list\\\",\\\"task_activity_view\\\",\\\"task_assign_view\\\",\\\"task_assign_delete\\\",\\\"task_complete\\\",\\\"task_discussion_create\\\",\\\"task_discussion_store\\\",\\\"task_discussion_edit\\\",\\\"task_discussion_update\\\",\\\"task_discussion_delete\\\",\\\"task_discussion_view\\\",\\\"task_discussion_list\\\",\\\"task_discussion_comment\\\",\\\"task_discussion_reply\\\",\\\"task_file_create\\\",\\\"task_file_store\\\",\\\"task_file_edit\\\",\\\"task_file_update\\\",\\\"task_file_delete\\\",\\\"task_file_view\\\",\\\"task_file_list\\\",\\\"task_file_download\\\",\\\"task_file_comment\\\",\\\"task_file_reply\\\",\\\"task_notes_create\\\",\\\"task_notes_store\\\",\\\"task_notes_edit\\\",\\\"task_notes_update\\\",\\\"task_notes_delete\\\",\\\"task_notes_list\\\",\\\"task_files_comment\\\",\\\"award_type_menu\\\",\\\"award_type_create\\\",\\\"award_type_store\\\",\\\"award_type_edit\\\",\\\"award_type_update\\\",\\\"award_type_delete\\\",\\\"award_type_view\\\",\\\"award_type_list\\\",\\\"award_menu\\\",\\\"award_create\\\",\\\"award_store\\\",\\\"award_edit\\\",\\\"award_update\\\",\\\"award_delete\\\",\\\"award_list\\\",\\\"travel_type_menu\\\",\\\"travel_type_create\\\",\\\"travel_type_store\\\",\\\"travel_type_edit\\\",\\\"travel_type_update\\\",\\\"travel_type_delete\\\",\\\"travel_type_view\\\",\\\"travel_type_list\\\",\\\"travel_menu\\\",\\\"travel_create\\\",\\\"travel_store\\\",\\\"travel_edit\\\",\\\"travel_update\\\",\\\"travel_delete\\\",\\\"travel_list\\\",\\\"travel_approve\\\",\\\"travel_payment\\\",\\\"meeting_menu\\\",\\\"meeting_create\\\",\\\"meeting_store\\\",\\\"meeting_edit\\\",\\\"meeting_update\\\",\\\"meeting_delete\\\",\\\"meeting_list\\\",\\\"performance_menu\\\",\\\"performance_settings\\\",\\\"performance_indicator_menu\\\",\\\"performance_indicator_list\\\",\\\"performance_indicator_create\\\",\\\"performance_indicator_store\\\",\\\"performance_indicator_edit\\\",\\\"performance_indicator_update\\\",\\\"performance_indicator_delete\\\",\\\"performance_appraisal_menu\\\",\\\"performance_appraisal_create\\\",\\\"performance_appraisal_store\\\",\\\"performance_appraisal_edit\\\",\\\"performance_appraisal_update\\\",\\\"performance_appraisal_delete\\\",\\\"performance_appraisal_list\\\",\\\"performance_appraisal_view\\\",\\\"performance_goal_type_menu\\\",\\\"performance_goal_type_create\\\",\\\"performance_goal_type_store\\\",\\\"performance_goal_type_edit\\\",\\\"performance_goal_type_update\\\",\\\"performance_goal_type_delete\\\",\\\"performance_goal_type_list\\\",\\\"performance_goal_menu\\\",\\\"performance_goal_create\\\",\\\"performance_goal_store\\\",\\\"performance_goal_edit\\\",\\\"performance_goal_update\\\",\\\"performance_goal_delete\\\",\\\"performance_goal_view\\\",\\\"performance_goal_list\\\",\\\"performance_competence_type_list\\\",\\\"performance_competence_type_menu\\\",\\\"performance_competence_type_create\\\",\\\"performance_competence_type_store\\\",\\\"performance_competence_type_edit\\\",\\\"performance_competence_type_update\\\",\\\"performance_competence_type_delete\\\",\\\"performance_competence_type_view\\\",\\\"performance_competence_menu\\\",\\\"performance_competence_create\\\",\\\"performance_competence_store\\\",\\\"performance_competence_edit\\\",\\\"performance_competence_update\\\",\\\"performance_competence_delete\\\",\\\"performance_competence_view\\\",\\\"performance_competence_list\\\",\\\"app_settings_menu\\\",\\\"app_settings_update\\\",\\\"language_menu\\\",\\\"make_default\\\",\\\"conference_read\\\",\\\"general_settings_read\\\",\\\"general_settings_update\\\",\\\"email_settings_update\\\",\\\"storage_settings_update\\\",\\\"language_create\\\",\\\"language_store\\\",\\\"language_edit\\\",\\\"language_update\\\",\\\"language_delete\\\",\\\"setup_language\\\",\\\"content_menu\\\",\\\"content_create\\\",\\\"content_store\\\",\\\"content_edit\\\",\\\"content_update\\\",\\\"content_delete\\\",\\\"contact_menu\\\",\\\"contact_create\\\",\\\"contact_store\\\",\\\"contact_edit\\\",\\\"contact_update\\\",\\\"contact_delete\\\",\\\"conference_create\\\",\\\"conference_read\\\",\\\"conference_store\\\",\\\"conference_update\\\",\\\"conference_delete\\\",\\\"conference_join\\\",\\\"model_read\\\",\\\"model_create\\\",\\\"model_update\\\",\\\"model_delete\\\",\\\"brand_read\\\",\\\"brand_create\\\",\\\"brand_update\\\",\\\"brand_delete\\\",\\\"machine_read\\\",\\\"machine_create\\\",\\\"machine_update\\\",\\\"machine_delete\\\",\\\"package_read\\\",\\\"package_create\\\",\\\"package_update\\\",\\\"package_delete\\\",\\\"institution_read\\\",\\\"institution_create\\\",\\\"institution_update\\\",\\\"institution_delete\\\",\\\"addons_menu\\\",\\\"employee_document_type_read\\\",\\\"employee_document_type_create\\\",\\\"employee_document_type_update\\\",\\\"employee_document_type_delete\\\",\\\"employee_document_read\\\",\\\"employee_document_create\\\",\\\"employee_document_download\\\",\\\"announcement_menu\\\",\\\"notice_menu\\\",\\\"notice_list\\\",\\\"notice_create\\\",\\\"notice_update\\\",\\\"notice_edit\\\",\\\"notice_delete\\\",\\\"send_sms_menu\\\",\\\"send_sms_list\\\",\\\"send_sms_create\\\",\\\"send_sms_update\\\",\\\"send_sms_edit\\\",\\\"send_sms_delete\\\",\\\"send_email_menu\\\",\\\"send_email_list\\\",\\\"send_email_create\\\",\\\"send_email_update\\\",\\\"send_email_edit\\\",\\\"send_email_delete\\\",\\\"send_notification_menu\\\",\\\"send_notification_list\\\",\\\"send_notification_create\\\",\\\"send_notification_update\\\",\\\"send_notification_edit\\\",\\\"send_notification_delete\\\",\\\"announcement_menu\\\",\\\"notice_menu\\\",\\\"notice_list\\\",\\\"notice_create\\\",\\\"notice_update\\\",\\\"notice_edit\\\",\\\"notice_delete\\\",\\\"send_sms_menu\\\",\\\"send_sms_list\\\",\\\"send_sms_create\\\",\\\"send_sms_update\\\",\\\"send_sms_edit\\\",\\\"send_sms_delete\\\",\\\"send_email_menu\\\",\\\"send_email_list\\\",\\\"send_email_create\\\",\\\"send_email_update\\\",\\\"send_email_edit\\\",\\\"send_email_delete\\\",\\\"send_notification_menu\\\",\\\"send_notification_list\\\",\\\"send_notification_create\\\",\\\"send_notification_update\\\",\\\"send_notification_edit\\\",\\\"send_notification_delete\\\",\\\"support_menu\\\",\\\"support_read\\\",\\\"support_create\\\",\\\"support_reply\\\",\\\"support_delete\\\"]\"',NULL,1,2,1,1,1,'2024-02-06 05:41:55','2024-02-06 05:41:55',NULL),
(6,'admin','admin','\"[\\\"team_menu\\\",\\\"team_list\\\",\\\"team_create\\\",\\\"team_update\\\",\\\"team_edit\\\",\\\"team_delete\\\",\\\"team_member_view\\\",\\\"team_member_create\\\",\\\"team_member_edit\\\",\\\"team_member_delete\\\",\\\"team_member_assign\\\",\\\"team_member_unassign\\\",\\\"dashboard\\\",\\\"hr_menu\\\",\\\"designation_read\\\",\\\"designation_create\\\",\\\"designation_update\\\",\\\"designation_delete\\\",\\\"shift_read\\\",\\\"shift_create\\\",\\\"shift_update\\\",\\\"shift_delete\\\",\\\"department_read\\\",\\\"department_create\\\",\\\"department_update\\\",\\\"department_delete\\\",\\\"user_menu\\\",\\\"user_read\\\",\\\"profile_view\\\",\\\"user_create\\\",\\\"user_edit\\\",\\\"user_update\\\",\\\"user_delete\\\",\\\"user_banned\\\",\\\"user_unbanned\\\",\\\"make_hr\\\",\\\"user_permission\\\",\\\"profile_image_view\\\",\\\"user_device_list\\\",\\\"reset_device\\\",\\\"phonebook_profile\\\",\\\"support_ticket_profile\\\",\\\"advance_profile\\\",\\\"commission_profile\\\",\\\"salary_profile\\\",\\\"project_profile\\\",\\\"task_profile\\\",\\\"award_profile\\\",\\\"travel_profile\\\",\\\"attendance_profile\\\",\\\"appointment_profile\\\",\\\"visit_profile\\\",\\\"leave_request_profile\\\",\\\"notice_profile\\\",\\\"role_read\\\",\\\"role_create\\\",\\\"role_update\\\",\\\"role_delete\\\",\\\"branch_read\\\",\\\"branch_create\\\",\\\"branch_update\\\",\\\"branch_delete\\\",\\\"leave_menu\\\",\\\"leave_type_read\\\",\\\"leave_type_create\\\",\\\"leave_type_update\\\",\\\"leave_type_delete\\\",\\\"leave_assign_read\\\",\\\"leave_assign_create\\\",\\\"leave_assign_update\\\",\\\"leave_assign_delete\\\",\\\"leave_request_read\\\",\\\"leave_request_create\\\",\\\"leave_request_store\\\",\\\"leave_request_update\\\",\\\"leave_request_approve\\\",\\\"leave_request_reject\\\",\\\"leave_request_delete\\\",\\\"daily_leave_read\\\",\\\"appointment_read\\\",\\\"appointment_menu\\\",\\\"appointment_create\\\",\\\"appointment_approve\\\",\\\"appointment_reject\\\",\\\"appointment_delete\\\",\\\"weekend_read\\\",\\\"weekend_update\\\",\\\"attendance_update\\\",\\\"holiday_read\\\",\\\"holiday_create\\\",\\\"holiday_update\\\",\\\"holiday_delete\\\",\\\"schedule_read\\\",\\\"schedule_create\\\",\\\"schedule_update\\\",\\\"schedule_delete\\\",\\\"attendance_menu\\\",\\\"attendance_read\\\",\\\"attendance_create\\\",\\\"attendance_update\\\",\\\"attendance_delete\\\",\\\"generate_qr_code\\\",\\\"leave_settings_read\\\",\\\"leave_settings_update\\\",\\\"company_settings_read\\\",\\\"company_settings_update\\\",\\\"locationApi\\\",\\\"company_setup_menu\\\",\\\"company_setup_activation\\\",\\\"company_setup_configuration\\\",\\\"company_setup_ip_whitelist\\\",\\\"company_setup_location\\\",\\\"location_create\\\",\\\"location_store\\\",\\\"location_edit\\\",\\\"location_update\\\",\\\"location_delete\\\",\\\"ip_read\\\",\\\"ip_create\\\",\\\"ip_update\\\",\\\"ip_delete\\\",\\\"attendance_report_read\\\",\\\"live_tracking_read\\\",\\\"report_menu\\\",\\\"report\\\",\\\"claim_read\\\",\\\"claim_create\\\",\\\"claim_update\\\",\\\"claim_delete\\\",\\\"payment_read\\\",\\\"payment_create\\\",\\\"payment_update\\\",\\\"payment_delete\\\",\\\"visit_menu\\\",\\\"visit_read\\\",\\\"visit_view\\\",\\\"visit_update\\\",\\\"payroll_menu\\\",\\\"list_payroll_item\\\",\\\"create_payroll_item\\\",\\\"store_payroll_item\\\",\\\"update_payroll_item\\\",\\\"delete_payroll_item\\\",\\\"view_payroll_item\\\",\\\"payroll_item_menu\\\",\\\"list_payroll_set\\\",\\\"create_payroll_set\\\",\\\"store_payroll_set\\\",\\\"update_payroll_set\\\",\\\"delete_payroll_set\\\",\\\"view_payroll_set\\\",\\\"edit_payroll_set\\\",\\\"payroll_set_menu\\\",\\\"advance_salaries_menu\\\",\\\"advance_salaries_create\\\",\\\"advance_salaries_store\\\",\\\"advance_salaries_edit\\\",\\\"advance_salaries_update\\\",\\\"advance_salaries_delete\\\",\\\"advance_salaries_view\\\",\\\"advance_salaries_approve\\\",\\\"advance_salaries_list\\\",\\\"advance_salaries_pay\\\",\\\"advance_salaries_invoice\\\",\\\"advance_salaries_search\\\",\\\"payslip_menu\\\",\\\"salary_generate\\\",\\\"salary_view\\\",\\\"salary_delete\\\",\\\"salary_edit\\\",\\\"salary_update\\\",\\\"salary_payment\\\",\\\"payslip_list\\\",\\\"advance_type_menu\\\",\\\"advance_type_create\\\",\\\"advance_type_store\\\",\\\"advance_type_edit\\\",\\\"advance_type_update\\\",\\\"advance_type_delete\\\",\\\"advance_type_view\\\",\\\"advance_type_list\\\",\\\"salary_menu\\\",\\\"salary_store\\\",\\\"salary_edit\\\",\\\"salary_update\\\",\\\"salary_delete\\\",\\\"salary_view\\\",\\\"salary_list\\\",\\\"salary_search\\\",\\\"salary_pay\\\",\\\"salary_invoice\\\",\\\"salary_approve\\\",\\\"salary_generate\\\",\\\"salary_calculate\\\",\\\"account_menu\\\",\\\"account_create\\\",\\\"account_store\\\",\\\"account_edit\\\",\\\"account_update\\\",\\\"account_delete\\\",\\\"account_view\\\",\\\"account_list\\\",\\\"account_search\\\",\\\"deposit_menu\\\",\\\"deposit_create\\\",\\\"deposit_store\\\",\\\"deposit_edit\\\",\\\"deposit_update\\\",\\\"deposit_delete\\\",\\\"deposit_list\\\",\\\"expense_menu\\\",\\\"expense_create\\\",\\\"expense_store\\\",\\\"expense_edit\\\",\\\"expense_update\\\",\\\"expense_delete\\\",\\\"expense_list\\\",\\\"expense_view\\\",\\\"expense_approve\\\",\\\"expense_invoice\\\",\\\"expense_pay\\\",\\\"transaction_menu\\\",\\\"transaction_create\\\",\\\"transaction_store\\\",\\\"transaction_edit\\\",\\\"transaction_update\\\",\\\"transaction_delete\\\",\\\"transaction_view\\\",\\\"transaction_list\\\",\\\"deposit_category_menu\\\",\\\"deposit_category_create\\\",\\\"deposit_category_store\\\",\\\"deposit_category_edit\\\",\\\"deposit_category_update\\\",\\\"deposit_category_delete\\\",\\\"deposit_category_list\\\",\\\"payment_method_menu\\\",\\\"payment_method_create\\\",\\\"payment_method_store\\\",\\\"payment_method_edit\\\",\\\"payment_method_update\\\",\\\"payment_method_delete\\\",\\\"payment_method_list\\\",\\\"project_menu\\\",\\\"project_create\\\",\\\"project_store\\\",\\\"project_edit\\\",\\\"project_update\\\",\\\"project_delete\\\",\\\"project_view\\\",\\\"project_list\\\",\\\"project_activity_view\\\",\\\"project_member_view\\\",\\\"project_member_delete\\\",\\\"project_complete\\\",\\\"project_payment\\\",\\\"project_invoice_view\\\",\\\"project_discussion_create\\\",\\\"project_discussion_store\\\",\\\"project_discussion_edit\\\",\\\"project_discussion_update\\\",\\\"project_discussion_delete\\\",\\\"project_discussion_view\\\",\\\"project_discussion_list\\\",\\\"project_discussion_comment\\\",\\\"project_discussion_reply\\\",\\\"project_file_create\\\",\\\"project_file_store\\\",\\\"project_file_edit\\\",\\\"project_file_update\\\",\\\"project_file_delete\\\",\\\"project_file_view\\\",\\\"project_file_list\\\",\\\"project_file_download\\\",\\\"project_file_comment\\\",\\\"project_file_reply\\\",\\\"project_notes_create\\\",\\\"project_notes_store\\\",\\\"project_notes_edit\\\",\\\"project_notes_update\\\",\\\"project_notes_delete\\\",\\\"project_notes_list\\\",\\\"client_menu\\\",\\\"client_create\\\",\\\"client_store\\\",\\\"client_edit\\\",\\\"client_update\\\",\\\"client_delete\\\",\\\"client_view\\\",\\\"client_list\\\",\\\"task_menu\\\",\\\"task_create\\\",\\\"task_store\\\",\\\"task_edit\\\",\\\"task_update\\\",\\\"task_delete\\\",\\\"task_view\\\",\\\"task_list\\\",\\\"task_activity_view\\\",\\\"task_assign_view\\\",\\\"task_assign_delete\\\",\\\"task_complete\\\",\\\"task_discussion_create\\\",\\\"task_discussion_store\\\",\\\"task_discussion_edit\\\",\\\"task_discussion_update\\\",\\\"task_discussion_delete\\\",\\\"task_discussion_view\\\",\\\"task_discussion_list\\\",\\\"task_discussion_comment\\\",\\\"task_discussion_reply\\\",\\\"task_file_create\\\",\\\"task_file_store\\\",\\\"task_file_edit\\\",\\\"task_file_update\\\",\\\"task_file_delete\\\",\\\"task_file_view\\\",\\\"task_file_list\\\",\\\"task_file_download\\\",\\\"task_file_comment\\\",\\\"task_file_reply\\\",\\\"task_notes_create\\\",\\\"task_notes_store\\\",\\\"task_notes_edit\\\",\\\"task_notes_update\\\",\\\"task_notes_delete\\\",\\\"task_notes_list\\\",\\\"task_files_comment\\\",\\\"award_type_menu\\\",\\\"award_type_create\\\",\\\"award_type_store\\\",\\\"award_type_edit\\\",\\\"award_type_update\\\",\\\"award_type_delete\\\",\\\"award_type_view\\\",\\\"award_type_list\\\",\\\"award_menu\\\",\\\"award_create\\\",\\\"award_store\\\",\\\"award_edit\\\",\\\"award_update\\\",\\\"award_delete\\\",\\\"award_list\\\",\\\"travel_type_menu\\\",\\\"travel_type_create\\\",\\\"travel_type_store\\\",\\\"travel_type_edit\\\",\\\"travel_type_update\\\",\\\"travel_type_delete\\\",\\\"travel_type_view\\\",\\\"travel_type_list\\\",\\\"travel_menu\\\",\\\"travel_create\\\",\\\"travel_store\\\",\\\"travel_edit\\\",\\\"travel_update\\\",\\\"travel_delete\\\",\\\"travel_list\\\",\\\"travel_approve\\\",\\\"travel_payment\\\",\\\"meeting_menu\\\",\\\"meeting_create\\\",\\\"meeting_store\\\",\\\"meeting_edit\\\",\\\"meeting_update\\\",\\\"meeting_delete\\\",\\\"meeting_list\\\",\\\"performance_menu\\\",\\\"performance_settings\\\",\\\"performance_indicator_menu\\\",\\\"performance_indicator_list\\\",\\\"performance_indicator_create\\\",\\\"performance_indicator_store\\\",\\\"performance_indicator_edit\\\",\\\"performance_indicator_update\\\",\\\"performance_indicator_delete\\\",\\\"performance_appraisal_menu\\\",\\\"performance_appraisal_create\\\",\\\"performance_appraisal_store\\\",\\\"performance_appraisal_edit\\\",\\\"performance_appraisal_update\\\",\\\"performance_appraisal_delete\\\",\\\"performance_appraisal_list\\\",\\\"performance_appraisal_view\\\",\\\"performance_goal_type_menu\\\",\\\"performance_goal_type_create\\\",\\\"performance_goal_type_store\\\",\\\"performance_goal_type_edit\\\",\\\"performance_goal_type_update\\\",\\\"performance_goal_type_delete\\\",\\\"performance_goal_type_list\\\",\\\"performance_goal_menu\\\",\\\"performance_goal_create\\\",\\\"performance_goal_store\\\",\\\"performance_goal_edit\\\",\\\"performance_goal_update\\\",\\\"performance_goal_delete\\\",\\\"performance_goal_view\\\",\\\"performance_goal_list\\\",\\\"performance_competence_type_list\\\",\\\"performance_competence_type_menu\\\",\\\"performance_competence_type_create\\\",\\\"performance_competence_type_store\\\",\\\"performance_competence_type_edit\\\",\\\"performance_competence_type_update\\\",\\\"performance_competence_type_delete\\\",\\\"performance_competence_type_view\\\",\\\"performance_competence_menu\\\",\\\"performance_competence_create\\\",\\\"performance_competence_store\\\",\\\"performance_competence_edit\\\",\\\"performance_competence_update\\\",\\\"performance_competence_delete\\\",\\\"performance_competence_view\\\",\\\"performance_competence_list\\\",\\\"app_settings_menu\\\",\\\"app_settings_update\\\",\\\"language_menu\\\",\\\"make_default\\\",\\\"conference_read\\\",\\\"general_settings_read\\\",\\\"general_settings_update\\\",\\\"email_settings_update\\\",\\\"storage_settings_update\\\",\\\"language_create\\\",\\\"language_store\\\",\\\"language_edit\\\",\\\"language_update\\\",\\\"language_delete\\\",\\\"setup_language\\\",\\\"content_menu\\\",\\\"content_create\\\",\\\"content_store\\\",\\\"content_edit\\\",\\\"content_update\\\",\\\"content_delete\\\",\\\"contact_menu\\\",\\\"contact_create\\\",\\\"contact_store\\\",\\\"contact_edit\\\",\\\"contact_update\\\",\\\"contact_delete\\\",\\\"conference_create\\\",\\\"conference_read\\\",\\\"conference_store\\\",\\\"conference_update\\\",\\\"conference_delete\\\",\\\"conference_join\\\",\\\"model_read\\\",\\\"model_create\\\",\\\"model_update\\\",\\\"model_delete\\\",\\\"brand_read\\\",\\\"brand_create\\\",\\\"brand_update\\\",\\\"brand_delete\\\",\\\"machine_read\\\",\\\"machine_create\\\",\\\"machine_update\\\",\\\"machine_delete\\\",\\\"package_read\\\",\\\"package_create\\\",\\\"package_update\\\",\\\"package_delete\\\",\\\"institution_read\\\",\\\"institution_create\\\",\\\"institution_update\\\",\\\"institution_delete\\\",\\\"addons_menu\\\",\\\"employee_document_type_read\\\",\\\"employee_document_type_create\\\",\\\"employee_document_type_update\\\",\\\"employee_document_type_delete\\\",\\\"employee_document_read\\\",\\\"employee_document_create\\\",\\\"employee_document_download\\\",\\\"announcement_menu\\\",\\\"notice_menu\\\",\\\"notice_list\\\",\\\"notice_create\\\",\\\"notice_update\\\",\\\"notice_edit\\\",\\\"notice_delete\\\",\\\"send_sms_menu\\\",\\\"send_sms_list\\\",\\\"send_sms_create\\\",\\\"send_sms_update\\\",\\\"send_sms_edit\\\",\\\"send_sms_delete\\\",\\\"send_email_menu\\\",\\\"send_email_list\\\",\\\"send_email_create\\\",\\\"send_email_update\\\",\\\"send_email_edit\\\",\\\"send_email_delete\\\",\\\"send_notification_menu\\\",\\\"send_notification_list\\\",\\\"send_notification_create\\\",\\\"send_notification_update\\\",\\\"send_notification_edit\\\",\\\"send_notification_delete\\\",\\\"announcement_menu\\\",\\\"notice_menu\\\",\\\"notice_list\\\",\\\"notice_create\\\",\\\"notice_update\\\",\\\"notice_edit\\\",\\\"notice_delete\\\",\\\"send_sms_menu\\\",\\\"send_sms_list\\\",\\\"send_sms_create\\\",\\\"send_sms_update\\\",\\\"send_sms_edit\\\",\\\"send_sms_delete\\\",\\\"send_email_menu\\\",\\\"send_email_list\\\",\\\"send_email_create\\\",\\\"send_email_update\\\",\\\"send_email_edit\\\",\\\"send_email_delete\\\",\\\"send_notification_menu\\\",\\\"send_notification_list\\\",\\\"send_notification_create\\\",\\\"send_notification_update\\\",\\\"send_notification_edit\\\",\\\"send_notification_delete\\\",\\\"support_menu\\\",\\\"support_read\\\",\\\"support_create\\\",\\\"support_reply\\\",\\\"support_delete\\\"]\"',NULL,1,2,1,1,1,'2024-02-06 05:41:55','2024-02-06 05:41:55',NULL),
(7,'hr','hr','\"[\\\"team_menu\\\",\\\"team_list\\\",\\\"team_create\\\",\\\"team_update\\\",\\\"team_edit\\\",\\\"team_delete\\\",\\\"team_member_view\\\",\\\"team_member_create\\\",\\\"team_member_edit\\\",\\\"team_member_delete\\\",\\\"team_member_assign\\\",\\\"team_member_unassign\\\",\\\"dashboard\\\",\\\"designation_read\\\",\\\"designation_create\\\",\\\"designation_update\\\",\\\"designation_delete\\\",\\\"shift_read\\\",\\\"shift_create\\\",\\\"shift_update\\\",\\\"shift_delete\\\",\\\"department_read\\\",\\\"department_create\\\",\\\"department_update\\\",\\\"department_delete\\\",\\\"user_menu\\\",\\\"user_read\\\",\\\"profile_view\\\",\\\"user_create\\\",\\\"user_edit\\\",\\\"user_update\\\",\\\"user_delete\\\",\\\"user_banned\\\",\\\"user_unbanned\\\",\\\"make_hr\\\",\\\"user_permission\\\",\\\"profile_image_view\\\",\\\"user_device_list\\\",\\\"reset_device\\\",\\\"role_read\\\",\\\"role_create\\\",\\\"role_update\\\",\\\"role_delete\\\",\\\"branch_read\\\",\\\"branch_create\\\",\\\"branch_update\\\",\\\"branch_delete\\\",\\\"leave_menu\\\",\\\"leave_type_read\\\",\\\"leave_type_create\\\",\\\"leave_type_update\\\",\\\"leave_type_delete\\\",\\\"leave_assign_read\\\",\\\"leave_assign_create\\\",\\\"leave_assign_update\\\",\\\"leave_assign_delete\\\",\\\"leave_request_read\\\",\\\"leave_request_create\\\",\\\"leave_request_approve\\\",\\\"leave_request_reject\\\",\\\"leave_request_delete\\\",\\\"appointment_read\\\",\\\"appointment_menu\\\",\\\"appointment_create\\\",\\\"appointment_approve\\\",\\\"appointment_reject\\\",\\\"appointment_delete\\\",\\\"weekend_read\\\",\\\"weekend_update\\\",\\\"attendance_update\\\",\\\"holiday_read\\\",\\\"holiday_create\\\",\\\"holiday_update\\\",\\\"holiday_delete\\\",\\\"schedule_read\\\",\\\"schedule_create\\\",\\\"schedule_update\\\",\\\"schedule_delete\\\",\\\"attendance_menu\\\",\\\"attendance_read\\\",\\\"attendance_create\\\",\\\"attendance_update\\\",\\\"attendance_delete\\\",\\\"leave_settings_read\\\",\\\"leave_settings_update\\\",\\\"company_settings_read\\\",\\\"company_settings_update\\\",\\\"locationApi\\\",\\\"company_setup_menu\\\",\\\"company_setup_activation\\\",\\\"company_setup_configuration\\\",\\\"company_setup_ip_whitelist\\\",\\\"company_setup_location\\\",\\\"ip_read\\\",\\\"ip_create\\\",\\\"ip_update\\\",\\\"ip_delete\\\",\\\"attendance_report_read\\\",\\\"live_tracking_read\\\",\\\"report_menu\\\",\\\"report\\\",\\\"claim_read\\\",\\\"claim_create\\\",\\\"claim_update\\\",\\\"claim_delete\\\",\\\"payment_read\\\",\\\"payment_create\\\",\\\"payment_update\\\",\\\"payment_delete\\\",\\\"visit_menu\\\",\\\"visit_read\\\",\\\"visit_view\\\",\\\"visit_update\\\",\\\"payroll_menu\\\",\\\"list_payroll_item\\\",\\\"create_payroll_item\\\",\\\"store_payroll_item\\\",\\\"update_payroll_item\\\",\\\"delete_payroll_item\\\",\\\"view_payroll_item\\\",\\\"payroll_item_menu\\\",\\\"list_payroll_set\\\",\\\"create_payroll_set\\\",\\\"store_payroll_set\\\",\\\"update_payroll_set\\\",\\\"delete_payroll_set\\\",\\\"view_payroll_set\\\",\\\"edit_payroll_set\\\",\\\"payroll_set_menu\\\",\\\"advance_salaries_menu\\\",\\\"advance_salaries_create\\\",\\\"advance_salaries_store\\\",\\\"advance_salaries_edit\\\",\\\"advance_salaries_update\\\",\\\"advance_salaries_delete\\\",\\\"advance_salaries_view\\\",\\\"advance_salaries_approve\\\",\\\"advance_salaries_list\\\",\\\"advance_salaries_pay\\\",\\\"advance_salaries_invoice\\\",\\\"advance_salaries_search\\\",\\\"payslip_menu\\\",\\\"salary_generate\\\",\\\"salary_view\\\",\\\"salary_delete\\\",\\\"salary_edit\\\",\\\"salary_update\\\",\\\"salary_payment\\\",\\\"payslip_list\\\",\\\"advance_type_menu\\\",\\\"advance_type_create\\\",\\\"advance_type_store\\\",\\\"advance_type_edit\\\",\\\"advance_type_update\\\",\\\"advance_type_delete\\\",\\\"advance_type_view\\\",\\\"advance_type_list\\\",\\\"salary_menu\\\",\\\"salary_store\\\",\\\"salary_edit\\\",\\\"salary_update\\\",\\\"salary_delete\\\",\\\"salary_view\\\",\\\"salary_list\\\",\\\"salary_search\\\",\\\"salary_pay\\\",\\\"salary_invoice\\\",\\\"salary_approve\\\",\\\"salary_generate\\\",\\\"salary_calculate\\\",\\\"account_menu\\\",\\\"account_create\\\",\\\"account_store\\\",\\\"account_edit\\\",\\\"account_update\\\",\\\"account_delete\\\",\\\"account_view\\\",\\\"account_list\\\",\\\"account_search\\\",\\\"deposit_menu\\\",\\\"deposit_create\\\",\\\"deposit_store\\\",\\\"deposit_edit\\\",\\\"deposit_update\\\",\\\"deposit_delete\\\",\\\"deposit_list\\\",\\\"expense_menu\\\",\\\"expense_create\\\",\\\"expense_store\\\",\\\"expense_edit\\\",\\\"expense_update\\\",\\\"expense_delete\\\",\\\"expense_list\\\",\\\"expense_view\\\",\\\"expense_approve\\\",\\\"expense_invoice\\\",\\\"expense_pay\\\",\\\"transaction_menu\\\",\\\"transaction_create\\\",\\\"transaction_store\\\",\\\"transaction_edit\\\",\\\"transaction_update\\\",\\\"transaction_delete\\\",\\\"transaction_view\\\",\\\"transaction_list\\\",\\\"deposit_category_menu\\\",\\\"deposit_category_create\\\",\\\"deposit_category_store\\\",\\\"deposit_category_edit\\\",\\\"deposit_category_update\\\",\\\"deposit_category_delete\\\",\\\"deposit_category_list\\\",\\\"payment_method_menu\\\",\\\"payment_method_create\\\",\\\"payment_method_store\\\",\\\"payment_method_edit\\\",\\\"payment_method_update\\\",\\\"payment_method_delete\\\",\\\"payment_method_list\\\",\\\"travel_menu\\\",\\\"travel_create\\\",\\\"travel_store\\\",\\\"travel_edit\\\",\\\"travel_update\\\",\\\"travel_delete\\\",\\\"travel_list\\\",\\\"travel_view\\\",\\\"travel_approve\\\",\\\"travel_invoice\\\",\\\"travel_pay\\\",\\\"meeting_menu\\\",\\\"meeting_create\\\",\\\"meeting_store\\\",\\\"meeting_edit\\\",\\\"meeting_update\\\",\\\"meeting_delete\\\",\\\"meeting_list\\\",\\\"meeting_view\\\",\\\"task_menu\\\",\\\"task.create\\\",\\\"task.index\\\",\\\"task.view\\\",\\\"task.edit\\\",\\\"conference_create\\\",\\\"conference_read\\\",\\\"conference_store\\\",\\\"conference_update\\\",\\\"conference_delete\\\",\\\"conference_join\\\",\\\"announcement_menu\\\",\\\"notice_menu\\\",\\\"notice_list\\\",\\\"notice_create\\\",\\\"notice_update\\\",\\\"notice_edit\\\",\\\"notice_delete\\\",\\\"send_sms_menu\\\",\\\"send_sms_list\\\",\\\"send_sms_create\\\",\\\"send_sms_update\\\",\\\"send_sms_edit\\\",\\\"send_sms_delete\\\",\\\"send_email_menu\\\",\\\"send_email_list\\\",\\\"send_email_create\\\",\\\"send_email_update\\\",\\\"send_email_edit\\\",\\\"send_email_delete\\\",\\\"send_notification_menu\\\",\\\"send_notification_list\\\",\\\"send_notification_create\\\",\\\"send_notification_update\\\",\\\"send_notification_edit\\\",\\\"send_notification_delete\\\",\\\"announcement_menu\\\",\\\"notice_menu\\\",\\\"notice_list\\\",\\\"notice_create\\\",\\\"notice_update\\\",\\\"notice_edit\\\",\\\"notice_delete\\\",\\\"send_sms_menu\\\",\\\"send_sms_list\\\",\\\"send_sms_create\\\",\\\"send_sms_update\\\",\\\"send_sms_edit\\\",\\\"send_sms_delete\\\",\\\"send_email_menu\\\",\\\"send_email_list\\\",\\\"send_email_create\\\",\\\"send_email_update\\\",\\\"send_email_edit\\\",\\\"send_email_delete\\\",\\\"send_notification_menu\\\",\\\"send_notification_list\\\",\\\"send_notification_create\\\",\\\"send_notification_update\\\",\\\"send_notification_edit\\\",\\\"send_notification_delete\\\",\\\"support_menu\\\",\\\"support_read\\\",\\\"support_create\\\",\\\"support_reply\\\",\\\"support_delete\\\"]\"',NULL,1,2,1,1,1,'2024-02-06 05:41:55','2024-02-06 05:41:55',NULL),
(8,'staff','staff','\"[\\\"dashboard\\\",\\\"designation_read\\\",\\\"designation_create\\\",\\\"designation_update\\\",\\\"shift_read\\\",\\\"shift_create\\\",\\\"shift_update\\\",\\\"department_read\\\",\\\"department_create\\\",\\\"department_update\\\",\\\"user_menu\\\",\\\"user_read\\\",\\\"profile_view\\\",\\\"user_create\\\",\\\"user_edit\\\",\\\"user_update\\\",\\\"user_permission\\\",\\\"profile_image_view\\\",\\\"user_device_list\\\",\\\"role_read\\\",\\\"role_create\\\",\\\"role_update\\\",\\\"branch_read\\\",\\\"branch_create\\\",\\\"branch_update\\\",\\\"leave_menu\\\",\\\"leave_type_read\\\",\\\"leave_type_create\\\",\\\"leave_type_update\\\",\\\"leave_assign_read\\\",\\\"leave_assign_create\\\",\\\"leave_assign_update\\\",\\\"leave_request_read\\\",\\\"leave_request_create\\\",\\\"appointment_read\\\",\\\"appointment_menu\\\",\\\"appointment_create\\\",\\\"weekend_read\\\",\\\"attendance_update\\\",\\\"holiday_read\\\",\\\"holiday_create\\\",\\\"schedule_read\\\",\\\"schedule_create\\\",\\\"attendance_menu\\\",\\\"attendance_read\\\",\\\"attendance_create\\\",\\\"attendance_update\\\",\\\"leave_settings_read\\\",\\\"company_settings_read\\\",\\\"locationApi\\\",\\\"ip_read\\\",\\\"ip_create\\\",\\\"attendance_report_read\\\",\\\"live_tracking_read\\\",\\\"report_menu\\\",\\\"report\\\",\\\"claim_read\\\",\\\"claim_create\\\",\\\"payment_read\\\",\\\"payment_create\\\",\\\"visit_menu\\\",\\\"visit_read\\\",\\\"visit_view\\\",\\\"payroll_menu\\\",\\\"list_payroll_item\\\",\\\"view_payroll_item\\\",\\\"payroll_item_menu\\\",\\\"list_payroll_set\\\",\\\"view_payroll_set\\\",\\\"payroll_set_menu\\\",\\\"payslip_menu\\\",\\\"salary_generate\\\",\\\"salary_view\\\",\\\"salary_payment\\\",\\\"payslip_list\\\",\\\"salary_menu\\\",\\\"salary_view\\\",\\\"salary_list\\\",\\\"salary_search\\\",\\\"salary_pay\\\",\\\"salary_invoice\\\",\\\"salary_approve\\\",\\\"salary_generate\\\",\\\"salary_calculate\\\",\\\"account_menu\\\",\\\"account_view\\\",\\\"account_list\\\",\\\"account_search\\\",\\\"deposit_menu\\\",\\\"deposit_list\\\",\\\"expense_menu\\\",\\\"expense_list\\\",\\\"expense_view\\\",\\\"expense_approve\\\",\\\"expense_invoice\\\",\\\"expense_pay\\\",\\\"transaction_menu\\\",\\\"transaction_view\\\",\\\"transaction_list\\\",\\\"deposit_category_menu\\\",\\\"deposit_category_list\\\",\\\"payment_method_menu\\\",\\\"payment_method_list\\\",\\\"travel_menu\\\",\\\"travel_create\\\",\\\"travel_store\\\",\\\"travel_edit\\\",\\\"travel_update\\\",\\\"travel_list\\\",\\\"travel_view\\\",\\\"travel_approve\\\",\\\"travel_invoice\\\",\\\"travel_pay\\\",\\\"meeting_menu\\\",\\\"meeting_create\\\",\\\"meeting_store\\\",\\\"meeting_edit\\\",\\\"meeting_update\\\",\\\"meeting_list\\\",\\\"meeting_view\\\",\\\"task_menu\\\",\\\"task.create\\\",\\\"task.index\\\",\\\"task.view\\\",\\\"task.edit\\\"]\"',NULL,1,2,1,1,1,'2024-02-06 05:41:55','2024-02-06 05:41:55',NULL);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salary_generates`
--

DROP TABLE IF EXISTS `salary_generates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salary_generates` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT 1,
  `date` date NOT NULL,
  `amount` double(16,2) NOT NULL,
  `due_amount` double(16,2) DEFAULT NULL,
  `gross_salary` double(16,2) NOT NULL,
  `status_id` bigint(20) unsigned NOT NULL DEFAULT 9,
  `created_by` bigint(20) unsigned NOT NULL DEFAULT 1,
  `updated_by` bigint(20) unsigned NOT NULL DEFAULT 1,
  `total_working_day` int(11) DEFAULT NULL,
  `present` int(11) DEFAULT NULL,
  `absent` int(11) DEFAULT NULL,
  `late` int(11) DEFAULT NULL,
  `left_early` int(11) DEFAULT NULL,
  `is_calculated` tinyint(4) NOT NULL DEFAULT 0,
  `adjust` double(16,2) DEFAULT NULL,
  `absent_amount` double(16,2) DEFAULT NULL,
  `advance_amount` double(16,2) DEFAULT NULL,
  `advance_details` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`advance_details`)),
  `allowance_amount` double(16,2) DEFAULT NULL,
  `allowance_details` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`allowance_details`)),
  `deduction_amount` double(16,2) DEFAULT NULL,
  `deduction_details` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`deduction_details`)),
  `net_salary` double(16,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  `department_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `salary_generates_index` (`amount`,`date`,`status_id`,`company_id`,`branch_id`),
  KEY `user_id` (`user_id`),
  KEY `status_id` (`status_id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  CONSTRAINT `salary_generates_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `salary_generates_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `salary_generates_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`),
  CONSTRAINT `salary_generates_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary_generates`
--

LOCK TABLES `salary_generates` WRITE;
/*!40000 ALTER TABLE `salary_generates` DISABLE KEYS */;
/*!40000 ALTER TABLE `salary_generates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salary_payment_logs`
--

DROP TABLE IF EXISTS `salary_payment_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salary_payment_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `amount` double(16,2) NOT NULL,
  `due_amount` double(16,2) DEFAULT NULL,
  `salary_generate_id` bigint(20) unsigned DEFAULT NULL,
  `transaction_id` bigint(20) unsigned DEFAULT NULL,
  `payment_method_id` bigint(20) unsigned DEFAULT NULL,
  `paid_by` bigint(20) unsigned NOT NULL DEFAULT 1,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `created_by` bigint(20) unsigned NOT NULL DEFAULT 1,
  `updated_by` bigint(20) unsigned NOT NULL DEFAULT 1,
  `payment_note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `salary_payment_logs_salary_generate_id_foreign` (`salary_generate_id`),
  KEY `salary_payment_logs_amount_company_id_branch_id_user_id_index` (`amount`,`company_id`,`branch_id`,`user_id`),
  KEY `transaction_id` (`transaction_id`),
  KEY `payment_method_id` (`payment_method_id`),
  KEY `paid_by` (`paid_by`),
  KEY `user_id` (`user_id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  CONSTRAINT `salary_payment_logs_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `salary_payment_logs_paid_by_foreign` FOREIGN KEY (`paid_by`) REFERENCES `users` (`id`),
  CONSTRAINT `salary_payment_logs_payment_method_id_foreign` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`),
  CONSTRAINT `salary_payment_logs_salary_generate_id_foreign` FOREIGN KEY (`salary_generate_id`) REFERENCES `salary_generates` (`id`) ON DELETE CASCADE,
  CONSTRAINT `salary_payment_logs_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`),
  CONSTRAINT `salary_payment_logs_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`),
  CONSTRAINT `salary_payment_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary_payment_logs`
--

LOCK TABLES `salary_payment_logs` WRITE;
/*!40000 ALTER TABLE `salary_payment_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `salary_payment_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salary_setup_details`
--

DROP TABLE IF EXISTS `salary_setup_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salary_setup_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT 1,
  `salary_setup_id` bigint(20) unsigned NOT NULL DEFAULT 1,
  `commission_id` bigint(20) unsigned NOT NULL DEFAULT 1,
  `amount` double(16,2) NOT NULL,
  `amount_type` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1=fixed, 2=percentage',
  `status_id` bigint(20) unsigned NOT NULL DEFAULT 1,
  `created_by` bigint(20) unsigned NOT NULL DEFAULT 1,
  `updated_by` bigint(20) unsigned NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `salary_setup_details_amount_status_id_company_id_branch_id_index` (`amount`,`status_id`,`company_id`,`branch_id`),
  KEY `user_id` (`user_id`),
  KEY `salary_setup_id` (`salary_setup_id`),
  KEY `commission_id` (`commission_id`),
  KEY `status_id` (`status_id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  CONSTRAINT `salary_setup_details_commission_id_foreign` FOREIGN KEY (`commission_id`) REFERENCES `commissions` (`id`),
  CONSTRAINT `salary_setup_details_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `salary_setup_details_salary_setup_id_foreign` FOREIGN KEY (`salary_setup_id`) REFERENCES `salary_setups` (`id`),
  CONSTRAINT `salary_setup_details_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `salary_setup_details_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`),
  CONSTRAINT `salary_setup_details_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary_setup_details`
--

LOCK TABLES `salary_setup_details` WRITE;
/*!40000 ALTER TABLE `salary_setup_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `salary_setup_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salary_setups`
--

DROP TABLE IF EXISTS `salary_setups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salary_setups` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT 1,
  `gross_salary` double(16,2) NOT NULL,
  `status_id` bigint(20) unsigned NOT NULL DEFAULT 1,
  `created_by` bigint(20) unsigned NOT NULL DEFAULT 1,
  `updated_by` bigint(20) unsigned NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `salary_setups_gross_salary_index` (`gross_salary`),
  KEY `salary_setups_status_id_company_id_branch_id_index` (`status_id`,`company_id`,`branch_id`),
  KEY `user_id` (`user_id`),
  KEY `status_id` (`status_id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  CONSTRAINT `salary_setups_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `salary_setups_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `salary_setups_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`),
  CONSTRAINT `salary_setups_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary_setups`
--

LOCK TABLES `salary_setups` WRITE;
/*!40000 ALTER TABLE `salary_setups` DISABLE KEYS */;
/*!40000 ALTER TABLE `salary_setups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salary_sheet_reports`
--

DROP TABLE IF EXISTS `salary_sheet_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salary_sheet_reports` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sl_no` int(11) NOT NULL,
  `name_of_the_employee` varchar(255) NOT NULL,
  `employee_id` varchar(255) NOT NULL,
  `designation` varchar(255) NOT NULL,
  `w_days` int(11) NOT NULL,
  `present` int(11) NOT NULL,
  `absent` int(11) NOT NULL,
  `tardy` int(11) NOT NULL,
  `tardy_days` varchar(255) NOT NULL,
  `gross_salary` double NOT NULL,
  `basic_50` double NOT NULL,
  `hra_40` double NOT NULL,
  `medical_10` double NOT NULL,
  `performance_incentive` double NOT NULL,
  `absent_amount` double NOT NULL,
  `advance` double NOT NULL,
  `tardy_amount` double NOT NULL,
  `incentive` double NOT NULL,
  `net_salary` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `salary_sheet_reports_company_id_branch_id_index` (`company_id`,`branch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary_sheet_reports`
--

LOCK TABLES `salary_sheet_reports` WRITE;
/*!40000 ALTER TABLE `salary_sheet_reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `salary_sheet_reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `services` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `attachment` bigint(20) unsigned DEFAULT NULL,
  `status_id` bigint(20) unsigned NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `services_user_id_foreign` (`user_id`),
  KEY `services_attachment_foreign` (`attachment`),
  KEY `services_id_status_id_company_id_branch_id_index` (`id`,`status_id`,`company_id`,`branch_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `services_attachment_foreign` FOREIGN KEY (`attachment`) REFERENCES `uploads` (`id`),
  CONSTRAINT `services_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `services_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `value` longtext NOT NULL,
  `image_id` bigint(20) DEFAULT NULL,
  `context` varchar(191) DEFAULT 'app',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  `status_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `settings_status_id_foreign` (`status_id`),
  KEY `settings_name_context_status_id_company_id_branch_id_index` (`name`,`context`,`status_id`,`company_id`,`branch_id`),
  CONSTRAINT `settings_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES
(1,'company_name','HRM',NULL,'app','2024-02-06 05:41:56','2024-02-06 05:41:56',1,1,1),
(2,'company_name','HRM',NULL,'app','2024-02-06 05:41:56','2024-02-06 05:41:56',2,1,1),
(3,'company_logo_backend','uploads/settings/logo/logo-white.png',NULL,'app','2024-02-06 05:41:56','2024-02-06 05:41:56',1,1,1),
(4,'company_logo_backend','uploads/settings/logo/logo-white.png',NULL,'app','2024-02-06 05:41:56','2024-02-06 05:41:56',2,1,1),
(5,'company_logo_frontend','uploads/settings/logo/logo-black.png',NULL,'app','2024-02-06 05:41:56','2024-02-06 05:41:56',1,1,1),
(6,'company_logo_frontend','uploads/settings/logo/logo-black.png',NULL,'app','2024-02-06 05:41:56','2024-02-06 05:41:56',2,1,1),
(7,'company_icon','uploads/settings/logo/favicon.png',NULL,'app','2024-02-06 05:41:56','2024-02-06 05:41:56',1,1,1),
(8,'company_icon','uploads/settings/logo/favicon.png',NULL,'app','2024-02-06 05:41:56','2024-02-06 05:41:56',2,1,1),
(9,'android_url','https://play.google.com/store/apps/details?id=com.worx24hour.hrm',NULL,'app','2024-02-06 05:41:56','2024-02-06 05:41:56',1,1,1),
(10,'android_url','https://play.google.com/store/apps/details?id=com.worx24hour.hrm',NULL,'app','2024-02-06 05:41:56','2024-02-06 05:41:56',2,1,1),
(11,'android_icon','assets/favicon.png',NULL,'app','2024-02-06 05:41:56','2024-02-06 05:41:56',1,1,1),
(12,'android_icon','assets/favicon.png',NULL,'app','2024-02-06 05:41:56','2024-02-06 05:41:56',2,1,1),
(13,'ios_url','https://apps.apple.com/us/app/24hourworx/id1620313188',NULL,'app','2024-02-06 05:41:56','2024-02-06 05:41:56',1,1,1),
(14,'ios_url','https://apps.apple.com/us/app/24hourworx/id1620313188',NULL,'app','2024-02-06 05:41:56','2024-02-06 05:41:56',2,1,1),
(15,'ios_icon','assets/favicon.png',NULL,'app','2024-02-06 05:41:56','2024-02-06 05:41:56',1,1,1),
(16,'ios_icon','assets/favicon.png',NULL,'app','2024-02-06 05:41:56','2024-02-06 05:41:56',2,1,1),
(17,'language','en',NULL,'app','2024-02-06 05:41:56','2024-02-06 05:41:56',1,1,1),
(18,'language','en',NULL,'app','2024-02-06 05:41:56','2024-02-06 05:41:56',2,1,1),
(19,'emailSettingsProvider','smtp',NULL,'app','2024-02-06 05:41:56','2024-02-06 05:41:56',1,1,1),
(20,'emailSettingsProvider','smtp',NULL,'app','2024-02-06 05:41:56','2024-02-06 05:41:56',2,1,1),
(21,'emailSettings_from_name','hrm@onest.com',NULL,'app','2024-02-06 05:41:56','2024-02-06 05:41:56',1,1,1),
(22,'emailSettings_from_name','hrm@onest.com',NULL,'app','2024-02-06 05:41:56','2024-02-06 05:41:56',2,1,1),
(23,'emailSettings_from_email','hrm@onest.com',NULL,'app','2024-02-06 05:41:56','2024-02-06 05:41:56',1,1,1),
(24,'emailSettings_from_email','hrm@onest.com',NULL,'app','2024-02-06 05:41:56','2024-02-06 05:41:56',2,1,1),
(25,'site_under_maintenance','0',NULL,'app','2024-02-06 05:41:56','2024-02-06 05:41:56',1,1,1),
(26,'site_under_maintenance','0',NULL,'app','2024-02-06 05:41:56','2024-02-06 05:41:56',2,1,1),
(27,'company_description','Onest Tech believes in painting the perfect picture of your idea while maintaining industry standards.',NULL,'app','2024-02-06 05:41:56','2024-02-06 05:41:56',1,1,1),
(28,'company_description','Onest Tech believes in painting the perfect picture of your idea while maintaining industry standards.',NULL,'app','2024-02-06 05:41:56','2024-02-06 05:41:56',2,1,1),
(29,'default_theme','app_theme_1',NULL,'app','2024-02-06 05:41:56','2024-02-06 05:41:56',1,1,1),
(30,'default_theme','app_theme_1',NULL,'app','2024-02-06 05:41:56','2024-02-06 05:41:56',2,1,1),
(31,'app_theme_1','static/app-screen/screen-1.png',NULL,'app','2024-02-06 05:41:56','2024-02-06 05:41:56',1,1,1),
(32,'app_theme_1','static/app-screen/screen-1.png',NULL,'app','2024-02-06 05:41:56','2024-02-06 05:41:56',2,1,1),
(33,'app_theme_2','static/app-screen/screen-2.png',NULL,'app','2024-02-06 05:41:56','2024-02-06 05:41:56',1,1,1),
(34,'app_theme_2','static/app-screen/screen-2.png',NULL,'app','2024-02-06 05:41:56','2024-02-06 05:41:56',2,1,1),
(35,'app_theme_3','static/app-screen/screen-3.png',NULL,'app','2024-02-06 05:41:56','2024-02-06 05:41:56',1,1,1),
(36,'app_theme_3','static/app-screen/screen-3.png',NULL,'app','2024-02-06 05:41:56','2024-02-06 05:41:56',2,1,1),
(37,'email','info@onesttech.com',NULL,'app','2024-02-06 05:41:56','2024-02-06 05:41:56',1,1,1),
(38,'email','info@onesttech.com',NULL,'app','2024-02-06 05:41:56','2024-02-06 05:41:56',2,1,1),
(39,'phone','+62 (0) 000 0000 00',NULL,'app','2024-02-06 05:41:56','2024-02-06 05:41:56',1,1,1),
(40,'phone','+62 (0) 000 0000 00',NULL,'app','2024-02-06 05:41:56','2024-02-06 05:41:56',2,1,1),
(41,'address','House #148, Road #13/B, Block-E, Banani, Dhaka, Bangladesh',NULL,'app','2024-02-06 05:41:56','2024-02-06 05:41:56',1,1,1),
(42,'address','House #148, Road #13/B, Block-E, Banani, Dhaka, Bangladesh',NULL,'app','2024-02-06 05:41:56','2024-02-06 05:41:56',2,1,1),
(43,'twitter_link','https://twitter.com',NULL,'app','2024-02-06 05:41:56','2024-02-06 05:41:56',1,1,1),
(44,'twitter_link','https://twitter.com',NULL,'app','2024-02-06 05:41:56','2024-02-06 05:41:56',2,1,1),
(45,'linkedin_link','https://linkedin.com',NULL,'app','2024-02-06 05:41:56','2024-02-06 05:41:56',1,1,1),
(46,'linkedin_link','https://linkedin.com',NULL,'app','2024-02-06 05:41:56','2024-02-06 05:41:56',2,1,1),
(47,'facebook_link','https://facebook.com',NULL,'app','2024-02-06 05:41:56','2024-02-06 05:41:56',1,1,1),
(48,'facebook_link','https://facebook.com',NULL,'app','2024-02-06 05:41:56','2024-02-06 05:41:56',2,1,1),
(49,'instagram_link','https://instagram.com',NULL,'app','2024-02-06 05:41:56','2024-02-06 05:41:56',1,1,1),
(50,'instagram_link','https://instagram.com',NULL,'app','2024-02-06 05:41:56','2024-02-06 05:41:56',2,1,1),
(51,'dribbble_link','https://dribbble.com',NULL,'app','2024-02-06 05:41:56','2024-02-06 05:41:56',1,1,1),
(52,'dribbble_link','https://dribbble.com',NULL,'app','2024-02-06 05:41:56','2024-02-06 05:41:56',2,1,1),
(53,'behance_link','https://behance.com',NULL,'app','2024-02-06 05:41:56','2024-02-06 05:41:56',1,1,1),
(54,'behance_link','https://behance.com',NULL,'app','2024-02-06 05:41:56','2024-02-06 05:41:56',2,1,1),
(55,'pinterest_link','https://pinterest.com',NULL,'app','2024-02-06 05:41:56','2024-02-06 05:41:56',1,1,1),
(56,'pinterest_link','https://pinterest.com',NULL,'app','2024-02-06 05:41:56','2024-02-06 05:41:56',2,1,1),
(57,'contact_title','Send A Message To Get Your Free Quote',NULL,'app','2024-02-06 05:41:56','2024-02-06 05:41:56',1,1,1),
(58,'contact_title','Send A Message To Get Your Free Quote',NULL,'app','2024-02-06 05:41:56','2024-02-06 05:41:56',2,1,1),
(59,'contact_short_description','Lorem Ipsum Dolor Sit Amet Consectetur. Est Commodo Pharetra Ac Netus Enim A Eget. Tristique Malesuada Donec Condimentum Mi Quis Porttitor Non Vitae Ultrices.',NULL,'app','2024-02-06 05:41:56','2024-02-06 05:41:56',1,1,1),
(60,'contact_short_description','Lorem Ipsum Dolor Sit Amet Consectetur. Est Commodo Pharetra Ac Netus Enim A Eget. Tristique Malesuada Donec Condimentum Mi Quis Porttitor Non Vitae Ultrices.',NULL,'app','2024-02-06 05:41:56','2024-02-06 05:41:56',2,1,1),
(61,'stripe_key','pk_test_51NaH9CAEFWsTKUlUhOrl8P1yBT5Yx8bOmFFRwRWz7JzmLnk1LxvfWmD49bl31KvRCL9jxLKeKexNCxIzEV0kPl4n00lvX1LLaS',NULL,'app','2024-02-06 05:41:56','2024-02-06 05:41:56',1,1,1),
(62,'stripe_key','pk_test_51NaH9CAEFWsTKUlUhOrl8P1yBT5Yx8bOmFFRwRWz7JzmLnk1LxvfWmD49bl31KvRCL9jxLKeKexNCxIzEV0kPl4n00lvX1LLaS',NULL,'app','2024-02-06 05:41:56','2024-02-06 05:41:56',2,1,1),
(63,'stripe_secret','sk_test_51NaH9CAEFWsTKUlUAKFJVBaYapJZr9pHwS8X8eaXcqFDcZbqrUaoQQqKM3iSYuy8Rb6zdm5aXYNpKkuuR6298IrH00697HeaHt',NULL,'app','2024-02-06 05:41:56','2024-02-06 05:41:56',1,1,1),
(64,'stripe_secret','sk_test_51NaH9CAEFWsTKUlUAKFJVBaYapJZr9pHwS8X8eaXcqFDcZbqrUaoQQqKM3iSYuy8Rb6zdm5aXYNpKkuuR6298IrH00697HeaHt',NULL,'app','2024-02-06 05:41:56','2024-02-06 05:41:56',2,1,1),
(65,'is_recaptcha_enable','0',NULL,'app','2024-02-06 05:41:56','2024-02-06 05:41:56',1,1,1),
(66,'is_recaptcha_enable','0',NULL,'app','2024-02-06 05:41:56','2024-02-06 05:41:56',2,1,1),
(67,'recaptcha_sitekey','6Lc9bg0pAAAAAKoWkSe7B-rNdpvVgpJVTsR9JekP',NULL,'app','2024-02-06 05:41:56','2024-02-06 05:41:56',1,1,1),
(68,'recaptcha_sitekey','6Lc9bg0pAAAAAKoWkSe7B-rNdpvVgpJVTsR9JekP',NULL,'app','2024-02-06 05:41:56','2024-02-06 05:41:56',2,1,1),
(69,'recaptcha_secret','6Lc9bg0pAAAAABd90JQSSjznnCaHAt5X2ca35IzQ',NULL,'app','2024-02-06 05:41:56','2024-02-06 05:41:56',1,1,1),
(70,'recaptcha_secret','6Lc9bg0pAAAAABd90JQSSjznnCaHAt5X2ca35IzQ',NULL,'app','2024-02-06 05:41:56','2024-02-06 05:41:56',2,1,1),
(71,'is_whatsapp_chat_enable','1',NULL,'app','2024-02-06 05:41:56','2024-02-06 05:41:56',1,1,1),
(72,'is_whatsapp_chat_enable','1',NULL,'app','2024-02-06 05:41:56','2024-02-06 05:41:56',2,1,1),
(73,'whatsapp_chat_number','01234567890',NULL,'app','2024-02-06 05:41:56','2024-02-06 05:41:56',1,1,1),
(74,'whatsapp_chat_number','01234567890',NULL,'app','2024-02-06 05:41:56','2024-02-06 05:41:56',2,1,1),
(75,'is_tawk_enable','1',NULL,'app','2024-02-06 05:41:56','2024-02-06 05:41:56',1,1,1),
(76,'is_tawk_enable','1',NULL,'app','2024-02-06 05:41:56','2024-02-06 05:41:56',2,1,1),
(77,'tawk_chat_widget_script','<script type=\"text/javascript\">\n            var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();\n            (function(){\n            var s1=document.createElement(\"script\"),s0=document.getElementsByTagName(\"script\")[0];\n            s1.async=true;\n            s1.src=\"https://embed.tawk.to/6551ee59958be55aeaaf15d9/1hf40m3te\";\n            s1.charset=\"UTF-8\";\n            s1.setAttribute(\"crossorigin\",\"*\");\n            s0.parentNode.insertBefore(s1,s0);\n            })();\n            </script>',NULL,'app','2024-02-06 05:41:56','2024-02-06 05:41:56',1,1,1),
(78,'tawk_chat_widget_script','<script type=\"text/javascript\">\n            var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();\n            (function(){\n            var s1=document.createElement(\"script\"),s0=document.getElementsByTagName(\"script\")[0];\n            s1.async=true;\n            s1.src=\"https://embed.tawk.to/6551ee59958be55aeaaf15d9/1hf40m3te\";\n            s1.charset=\"UTF-8\";\n            s1.setAttribute(\"crossorigin\",\"*\");\n            s0.parentNode.insertBefore(s1,s0);\n            })();\n            </script>',NULL,'app','2024-02-06 05:41:56','2024-02-06 05:41:56',2,1,1),
(79,'meta_title','Onest HRM',NULL,'app','2024-02-06 05:41:56','2024-02-06 05:41:56',1,1,1),
(80,'meta_title','Onest HRM',NULL,'app','2024-02-06 05:41:56','2024-02-06 05:41:56',2,1,1),
(81,'meta_description','Onest HRM revolutionizes human resource management, offering a comprehensive solution for businesses. Streamline your HR processes, from recruitment to employee management, with advanced features and intuitive tools. Optimize workforce efficiency, enhance employee engagement, and stay compliant effortlessly. Explore the power of Onest HRM for a seamless and strategic approach to HR.',NULL,'app','2024-02-06 05:41:56','2024-02-06 05:41:56',1,1,1),
(82,'meta_description','Onest HRM revolutionizes human resource management, offering a comprehensive solution for businesses. Streamline your HR processes, from recruitment to employee management, with advanced features and intuitive tools. Optimize workforce efficiency, enhance employee engagement, and stay compliant effortlessly. Explore the power of Onest HRM for a seamless and strategic approach to HR.',NULL,'app','2024-02-06 05:41:56','2024-02-06 05:41:56',2,1,1),
(83,'meta_keywords','HR management software, Human resource solution, Employee management tool, Workforce optimization, Employee engagement platform, Compliance management, HR software solution, Talent management system.',NULL,'app','2024-02-06 05:41:56','2024-02-06 05:41:56',1,1,1),
(84,'meta_keywords','HR management software, Human resource solution, Employee management tool, Workforce optimization, Employee engagement platform, Compliance management, HR software solution, Talent management system.',NULL,'app','2024-02-06 05:41:56','2024-02-06 05:41:56',2,1,1),
(85,'meta_image','',NULL,'app','2024-02-06 05:41:56','2024-02-06 05:41:56',1,1,1),
(86,'meta_image','',NULL,'app','2024-02-06 05:41:56','2024-02-06 05:41:56',2,1,1),
(87,'is_demo_checkout','1',NULL,'app','2024-02-06 05:41:56','2024-02-06 05:41:56',1,1,1),
(88,'is_demo_checkout','1',NULL,'app','2024-02-06 05:41:56','2024-02-06 05:41:56',2,1,1),
(89,'is_payment_type_cash','1',NULL,'app','2024-02-06 05:41:56','2024-02-06 05:41:56',1,1,1),
(90,'is_payment_type_cash','1',NULL,'app','2024-02-06 05:41:56','2024-02-06 05:41:56',2,1,1),
(91,'is_payment_type_cheque','1',NULL,'app','2024-02-06 05:41:56','2024-02-06 05:41:56',1,1,1),
(92,'is_payment_type_cheque','1',NULL,'app','2024-02-06 05:41:56','2024-02-06 05:41:56',2,1,1),
(93,'is_payment_type_bank_transfer','1',NULL,'app','2024-02-06 05:41:56','2024-02-06 05:41:56',1,1,1),
(94,'is_payment_type_bank_transfer','1',NULL,'app','2024-02-06 05:41:56','2024-02-06 05:41:56',2,1,1);
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shifts`
--

DROP TABLE IF EXISTS `shifts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shifts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `status_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `shifts_status_id_company_id_branch_id_index` (`status_id`,`company_id`,`branch_id`),
  CONSTRAINT `shifts_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shifts`
--

LOCK TABLES `shifts` WRITE;
/*!40000 ALTER TABLE `shifts` DISABLE KEYS */;
INSERT INTO `shifts` VALUES
(1,'Morning',1,'2024-02-06 05:41:55','2024-02-06 05:41:55',1,1),
(2,'Evening',1,'2024-02-06 05:41:55','2024-02-06 05:41:55',1,1),
(3,'Night',1,'2024-02-06 05:41:55','2024-02-06 05:41:55',1,1);
/*!40000 ALTER TABLE `shifts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_logs`
--

DROP TABLE IF EXISTS `sms_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `receiver_number` varchar(255) DEFAULT NULL,
  `message` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `sms_logs_company_id_branch_id_index` (`company_id`,`branch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_logs`
--

LOCK TABLES `sms_logs` WRITE;
/*!40000 ALTER TABLE `sms_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_identities`
--

DROP TABLE IF EXISTS `social_identities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_identities` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `provider_name` varchar(255) DEFAULT NULL,
  `provider_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_identities_provider_id_unique` (`provider_id`),
  KEY `social_identities_user_id_foreign` (`user_id`),
  KEY `social_identities_company_id_branch_id_index` (`company_id`,`branch_id`),
  CONSTRAINT `social_identities_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_identities`
--

LOCK TABLES `social_identities` WRITE;
/*!40000 ALTER TABLE `social_identities` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_identities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statuses`
--

DROP TABLE IF EXISTS `statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statuses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL COMMENT 'hare name=status situation',
  `class` varchar(50) DEFAULT NULL COMMENT 'hare class=what type of class name property like success,danger,info,purple',
  `color_code` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `statuses_name_class_index` (`name`,`class`),
  KEY `statuses_name_index` (`name`),
  KEY `statuses_class_index` (`class`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statuses`
--

LOCK TABLES `statuses` WRITE;
/*!40000 ALTER TABLE `statuses` DISABLE KEYS */;
INSERT INTO `statuses` VALUES
(1,'Active','success','449d44',NULL,NULL),
(2,'Pending','warning','ec971f',NULL,NULL),
(3,'Suspended','danger','c9302c',NULL,NULL),
(4,'Inactive','danger','c9302c',NULL,NULL),
(5,'Approve','success','449d44',NULL,NULL),
(6,'Reject','danger','c9302c',NULL,NULL),
(7,'Cancel','danger','c9302c',NULL,NULL),
(8,'Paid','success','449d44',NULL,NULL),
(9,'Unpaid','danger','c9302c',NULL,NULL),
(10,'Claimed','primary','337ab7',NULL,NULL),
(11,'Not Claimed','danger','c9302c',NULL,NULL),
(12,'Open','danger','ffFD815B',NULL,NULL),
(13,'Close','success','449d44',NULL,NULL),
(14,'High','danger','c9302c',NULL,NULL),
(15,'Medium','primary','337ab7',NULL,NULL),
(16,'Low','warning','ec971f',NULL,NULL),
(17,'Referred','warning','ec971f',NULL,NULL),
(18,'Debit','danger','ffFD815B',NULL,NULL),
(19,'Credit','success','449d44',NULL,NULL),
(20,'Partially Paid','info','9DBBCE',NULL,NULL),
(21,'Partially Returned','warning','ec971f',NULL,NULL),
(22,'No','danger','c9302c',NULL,NULL),
(23,'Returned','success','449d44',NULL,NULL),
(24,'Not Started','warning','ec971f',NULL,NULL),
(25,'On Hold','info','9DBBCE',NULL,NULL),
(26,'In Progress','main','7F58FE',NULL,NULL),
(27,'Completed','success','449d44',NULL,NULL),
(28,'Cancelled','danger','c9302c',NULL,NULL),
(29,'Urgent','danger','c9302c',NULL,NULL),
(30,'High','danger','c9302c',NULL,NULL),
(31,'Medium','primary','337ab7',NULL,NULL),
(32,'Low','warning','ec971f',NULL,NULL),
(33,'Yes','primary','337ab7',NULL,NULL),
(34,'Terminated','danger','c9302c',NULL,NULL),
(35,'Resign','danger','c9302c',NULL,NULL);
/*!40000 ALTER TABLE `statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscription_items`
--

DROP TABLE IF EXISTS `subscription_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscription_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `subscription_id` bigint(20) unsigned NOT NULL,
  `stripe_id` varchar(255) NOT NULL,
  `stripe_product` varchar(255) NOT NULL,
  `stripe_price` varchar(255) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `subscription_items_subscription_id_stripe_price_unique` (`subscription_id`,`stripe_price`),
  UNIQUE KEY `subscription_items_stripe_id_unique` (`stripe_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscription_items`
--

LOCK TABLES `subscription_items` WRITE;
/*!40000 ALTER TABLE `subscription_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscription_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscription_plans`
--

DROP TABLE IF EXISTS `subscription_plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscription_plans` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `identifier` varchar(191) NOT NULL,
  `stripe_id` varchar(191) NOT NULL,
  `status_id` bigint(20) unsigned NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `subscription_plans_identifier_unique` (`identifier`),
  UNIQUE KEY `subscription_plans_stripe_id_unique` (`stripe_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `subscription_plans_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscription_plans`
--

LOCK TABLES `subscription_plans` WRITE;
/*!40000 ALTER TABLE `subscription_plans` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscription_plans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriptions`
--

DROP TABLE IF EXISTS `subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscriptions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `stripe_id` varchar(255) NOT NULL,
  `stripe_status` varchar(255) NOT NULL,
  `stripe_price` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `ends_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `subscriptions_stripe_id_unique` (`stripe_id`),
  KEY `subscriptions_user_id_stripe_status_index` (`user_id`,`stripe_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriptions`
--

LOCK TABLES `subscriptions` WRITE;
/*!40000 ALTER TABLE `subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `support_tickets`
--

DROP TABLE IF EXISTS `support_tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `support_tickets` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `code` varchar(191) NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `assigned_id` bigint(20) unsigned DEFAULT NULL,
  `attachment_file_id` bigint(20) unsigned DEFAULT NULL,
  `image_url` text DEFAULT NULL,
  `subject` varchar(191) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `status_id` bigint(20) unsigned NOT NULL DEFAULT 1,
  `type_id` bigint(20) unsigned NOT NULL DEFAULT 12 COMMENT '12 = open , 13 = close',
  `priority_id` bigint(20) unsigned NOT NULL DEFAULT 14 COMMENT '14 = high , 15 = medium , 16 = low',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `support_tickets_user_id_foreign` (`user_id`),
  KEY `support_tickets_assigned_id_foreign` (`assigned_id`),
  KEY `support_tickets_attachment_file_id_foreign` (`attachment_file_id`),
  KEY `support_tickets_type_id_foreign` (`type_id`),
  KEY `support_tickets_priority_id_foreign` (`priority_id`),
  KEY `support_tickets_index` (`status_id`,`assigned_id`,`type_id`,`priority_id`,`company_id`,`branch_id`),
  CONSTRAINT `support_tickets_assigned_id_foreign` FOREIGN KEY (`assigned_id`) REFERENCES `users` (`id`),
  CONSTRAINT `support_tickets_attachment_file_id_foreign` FOREIGN KEY (`attachment_file_id`) REFERENCES `uploads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `support_tickets_priority_id_foreign` FOREIGN KEY (`priority_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `support_tickets_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `support_tickets_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `support_tickets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `support_tickets`
--

LOCK TABLES `support_tickets` WRITE;
/*!40000 ALTER TABLE `support_tickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `support_tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_activities`
--

DROP TABLE IF EXISTS `task_activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_activities` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `description` longtext NOT NULL,
  `task_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `last_activity` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `task_activities_user_id_foreign` (`user_id`),
  KEY `task_activities_task_id_user_id_company_id_branch_id_index` (`task_id`,`user_id`,`company_id`,`branch_id`),
  CONSTRAINT `task_activities_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE,
  CONSTRAINT `task_activities_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_activities`
--

LOCK TABLES `task_activities` WRITE;
/*!40000 ALTER TABLE `task_activities` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_activities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_discussion_comments`
--

DROP TABLE IF EXISTS `task_discussion_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_discussion_comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned DEFAULT NULL,
  `description` longtext NOT NULL,
  `show_to_customer` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0=no,1=yes',
  `task_discussion_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `attachment` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `task_discussion_comments_user_id_foreign` (`user_id`),
  KEY `task_discussion_comments_attachment_foreign` (`attachment`),
  KEY `task_discussion_comments_index` (`task_discussion_id`,`company_id`,`branch_id`,`comment_id`,`user_id`),
  CONSTRAINT `task_discussion_comments_attachment_foreign` FOREIGN KEY (`attachment`) REFERENCES `uploads` (`id`),
  CONSTRAINT `task_discussion_comments_task_discussion_id_foreign` FOREIGN KEY (`task_discussion_id`) REFERENCES `task_discussions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `task_discussion_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_discussion_comments`
--

LOCK TABLES `task_discussion_comments` WRITE;
/*!40000 ALTER TABLE `task_discussion_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_discussion_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_discussions`
--

DROP TABLE IF EXISTS `task_discussions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_discussions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `task_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `show_to_customer` bigint(20) unsigned NOT NULL DEFAULT 22,
  `status_id` bigint(20) unsigned NOT NULL DEFAULT 1,
  `file_id` bigint(20) unsigned DEFAULT NULL COMMENT 'this will be attachment file',
  `last_activity` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `task_discussions_task_id_foreign` (`task_id`),
  KEY `task_discussions_user_id_foreign` (`user_id`),
  KEY `task_discussions_file_id_foreign` (`file_id`),
  KEY `task_discussions_index` (`status_id`,`company_id`,`branch_id`,`user_id`,`task_id`),
  KEY `show_to_customer` (`show_to_customer`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `task_discussions_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `uploads` (`id`),
  CONSTRAINT `task_discussions_show_to_customer_foreign` FOREIGN KEY (`show_to_customer`) REFERENCES `statuses` (`id`),
  CONSTRAINT `task_discussions_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `task_discussions_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE,
  CONSTRAINT `task_discussions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_discussions`
--

LOCK TABLES `task_discussions` WRITE;
/*!40000 ALTER TABLE `task_discussions` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_discussions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_file_comments`
--

DROP TABLE IF EXISTS `task_file_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_file_comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned DEFAULT NULL,
  `description` longtext NOT NULL,
  `show_to_customer` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0=no,1=yes',
  `task_file_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `attachment` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `task_file_comments_user_id_foreign` (`user_id`),
  KEY `task_file_comments_attachment_foreign` (`attachment`),
  KEY `task_file_comments_index` (`task_file_id`,`user_id`,`company_id`,`branch_id`),
  CONSTRAINT `task_file_comments_attachment_foreign` FOREIGN KEY (`attachment`) REFERENCES `uploads` (`id`),
  CONSTRAINT `task_file_comments_task_file_id_foreign` FOREIGN KEY (`task_file_id`) REFERENCES `task_files` (`id`) ON DELETE CASCADE,
  CONSTRAINT `task_file_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_file_comments`
--

LOCK TABLES `task_file_comments` WRITE;
/*!40000 ALTER TABLE `task_file_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_file_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_files`
--

DROP TABLE IF EXISTS `task_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_files` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) NOT NULL,
  `show_to_customer` bigint(20) unsigned NOT NULL DEFAULT 22,
  `task_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `attachment` bigint(20) unsigned DEFAULT NULL,
  `status_id` bigint(20) unsigned NOT NULL DEFAULT 1,
  `last_activity` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `task_files_user_id_foreign` (`user_id`),
  KEY `task_files_attachment_foreign` (`attachment`),
  KEY `task_files_task_id_user_id_status_id_company_id_branch_id_index` (`task_id`,`user_id`,`status_id`,`company_id`,`branch_id`),
  KEY `show_to_customer` (`show_to_customer`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `task_files_attachment_foreign` FOREIGN KEY (`attachment`) REFERENCES `uploads` (`id`),
  CONSTRAINT `task_files_show_to_customer_foreign` FOREIGN KEY (`show_to_customer`) REFERENCES `statuses` (`id`),
  CONSTRAINT `task_files_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `task_files_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE,
  CONSTRAINT `task_files_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_files`
--

LOCK TABLES `task_files` WRITE;
/*!40000 ALTER TABLE `task_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_followers`
--

DROP TABLE IF EXISTS `task_followers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_followers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `task_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `added_by` bigint(20) unsigned NOT NULL,
  `status_id` bigint(20) unsigned NOT NULL DEFAULT 1,
  `is_creator` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `task_followers_user_id_foreign` (`user_id`),
  KEY `task_followers_added_by_foreign` (`added_by`),
  KEY `task_followers_is_creator_foreign` (`is_creator`),
  KEY `task_followers_index` (`task_id`,`user_id`,`status_id`,`company_id`,`branch_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `task_followers_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `task_followers_is_creator_foreign` FOREIGN KEY (`is_creator`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `task_followers_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `task_followers_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE,
  CONSTRAINT `task_followers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_followers`
--

LOCK TABLES `task_followers` WRITE;
/*!40000 ALTER TABLE `task_followers` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_followers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_members`
--

DROP TABLE IF EXISTS `task_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_members` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `task_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `added_by` bigint(20) unsigned NOT NULL,
  `status_id` bigint(20) unsigned NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `task_members_user_id_foreign` (`user_id`),
  KEY `task_members_added_by_foreign` (`added_by`),
  KEY `task_members_index` (`task_id`,`company_id`,`status_id`,`user_id`,`branch_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `task_members_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `task_members_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `task_members_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE,
  CONSTRAINT `task_members_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_members`
--

LOCK TABLES `task_members` WRITE;
/*!40000 ALTER TABLE `task_members` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_notes`
--

DROP TABLE IF EXISTS `task_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_notes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `description` longtext NOT NULL,
  `show_to_customer` bigint(20) unsigned NOT NULL DEFAULT 22,
  `task_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `status_id` bigint(20) unsigned NOT NULL DEFAULT 1,
  `last_activity` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `task_notes_user_id_foreign` (`user_id`),
  KEY `task_notes_task_id_company_id_status_id_user_id_branch_id_index` (`task_id`,`company_id`,`status_id`,`user_id`,`branch_id`),
  KEY `show_to_customer` (`show_to_customer`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `task_notes_show_to_customer_foreign` FOREIGN KEY (`show_to_customer`) REFERENCES `statuses` (`id`),
  CONSTRAINT `task_notes_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `task_notes_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE,
  CONSTRAINT `task_notes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_notes`
--

LOCK TABLES `task_notes` WRITE;
/*!40000 ALTER TABLE `task_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tasks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `date` date DEFAULT NULL,
  `progress` int(11) DEFAULT 0,
  `status_id` bigint(20) unsigned NOT NULL DEFAULT 24,
  `priority` bigint(20) unsigned NOT NULL DEFAULT 24,
  `description` longtext NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `created_by` bigint(20) unsigned NOT NULL DEFAULT 1,
  `notify_all_users` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=no,1=yes',
  `notify_all_users_email` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=no,1=yes',
  `type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=Regular , 1= Project',
  `project_id` bigint(20) unsigned DEFAULT NULL,
  `reminder` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=no,1=yes',
  `goal_id` bigint(20) unsigned DEFAULT NULL,
  `service_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `tasks_goal_id_foreign` (`goal_id`),
  KEY `tasks_company_id_branch_id_priority_status_id_index` (`company_id`,`branch_id`,`priority`,`status_id`),
  KEY `status_id` (`status_id`),
  KEY `priority` (`priority`),
  KEY `created_by` (`created_by`),
  KEY `project_id` (`project_id`),
  CONSTRAINT `tasks_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `tasks_goal_id_foreign` FOREIGN KEY (`goal_id`) REFERENCES `goals` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tasks_priority_foreign` FOREIGN KEY (`priority`) REFERENCES `statuses` (`id`),
  CONSTRAINT `tasks_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tasks_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_members`
--

DROP TABLE IF EXISTS `team_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team_members` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `team_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `expire_date` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `team_members_user_id_foreign` (`user_id`),
  KEY `team_members_team_id_company_id_branch_id_index` (`team_id`,`company_id`,`branch_id`),
  CONSTRAINT `team_members_team_id_foreign` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE,
  CONSTRAINT `team_members_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_members`
--

LOCK TABLES `team_members` WRITE;
/*!40000 ALTER TABLE `team_members` DISABLE KEYS */;
INSERT INTO `team_members` VALUES
(1,1,1,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(2,1,2,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(3,1,3,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(4,1,4,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(5,1,5,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(6,1,6,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(7,1,7,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(8,1,8,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(9,1,9,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(10,1,10,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(11,1,11,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(12,1,12,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(13,1,13,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1);
/*!40000 ALTER TABLE `team_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teams` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) DEFAULT NULL,
  `attachment_file_id` bigint(20) unsigned DEFAULT NULL,
  `status_id` bigint(20) unsigned NOT NULL DEFAULT 1,
  `user_id` bigint(20) unsigned NOT NULL,
  `team_lead_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `teams_attachment_file_id_foreign` (`attachment_file_id`),
  KEY `teams_user_id_foreign` (`user_id`),
  KEY `teams_team_lead_id_foreign` (`team_lead_id`),
  KEY `teams_status_id_company_id_branch_id_index` (`status_id`,`company_id`,`branch_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `teams_attachment_file_id_foreign` FOREIGN KEY (`attachment_file_id`) REFERENCES `uploads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `teams_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `teams_team_lead_id_foreign` FOREIGN KEY (`team_lead_id`) REFERENCES `users` (`id`),
  CONSTRAINT `teams_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
INSERT INTO `teams` VALUES
(1,'Management',NULL,1,1,1,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(2,'IT',NULL,1,1,1,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(3,'Sales',NULL,1,1,1,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1);
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tenant_subscriptions`
--

DROP TABLE IF EXISTS `tenant_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tenant_subscriptions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `subscription_id_in_main_company` bigint(20) unsigned DEFAULT NULL,
  `invoice_no` varchar(255) NOT NULL,
  `plan_name` varchar(255) DEFAULT NULL,
  `price` decimal(8,2) DEFAULT 0.00,
  `payment_gateway` varchar(255) DEFAULT NULL,
  `trx_id` varchar(255) DEFAULT NULL,
  `offline_payment` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`offline_payment`)),
  `employee_limit` bigint(20) unsigned DEFAULT 0,
  `is_employee_limit` tinyint(4) NOT NULL DEFAULT 1 COMMENT 'if 1 then employee create have some limit which is define in employee_limit column. If 0 then employee create have no limit.',
  `expiry_date` date DEFAULT NULL,
  `features` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`features`)),
  `features_key` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`features_key`)),
  `is_demo_checkout` tinyint(4) NOT NULL DEFAULT 0,
  `source` enum('Website','Admin') DEFAULT 'Website',
  `status_id` bigint(20) unsigned NOT NULL DEFAULT 1 COMMENT '1=Active,2=Pending,4=inactive,5=Approve,6=Reject',
  `payment_status_id` bigint(20) unsigned NOT NULL COMMENT '8=Paid,9=Unpaid',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tenant_subscriptions_status_id_foreign` (`status_id`),
  KEY `tenant_subscriptions_payment_status_id_foreign` (`payment_status_id`),
  CONSTRAINT `tenant_subscriptions_payment_status_id_foreign` FOREIGN KEY (`payment_status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `tenant_subscriptions_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tenant_subscriptions`
--

LOCK TABLES `tenant_subscriptions` WRITE;
/*!40000 ALTER TABLE `tenant_subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `tenant_subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tenant_user_impersonation_tokens`
--

DROP TABLE IF EXISTS `tenant_user_impersonation_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tenant_user_impersonation_tokens` (
  `token` varchar(128) NOT NULL,
  `tenant_id` varchar(255) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `auth_guard` varchar(255) NOT NULL,
  `redirect_url` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`token`),
  KEY `tenant_user_impersonation_tokens_tenant_id_foreign` (`tenant_id`),
  KEY `tenant_user_impersonation_tokens_company_id_branch_id_index` (`company_id`,`branch_id`),
  CONSTRAINT `tenant_user_impersonation_tokens_tenant_id_foreign` FOREIGN KEY (`tenant_id`) REFERENCES `tenants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tenant_user_impersonation_tokens`
--

LOCK TABLES `tenant_user_impersonation_tokens` WRITE;
/*!40000 ALTER TABLE `tenant_user_impersonation_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `tenant_user_impersonation_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tenants`
--

DROP TABLE IF EXISTS `tenants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tenants` (
  `id` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`data`)),
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `tenants_company_id_branch_id_index` (`company_id`,`branch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tenants`
--

LOCK TABLES `tenants` WRITE;
/*!40000 ALTER TABLE `tenants` DISABLE KEYS */;
/*!40000 ALTER TABLE `tenants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testimonials`
--

DROP TABLE IF EXISTS `testimonials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testimonials` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `message` varchar(255) DEFAULT NULL,
  `status_id` bigint(20) unsigned NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `testimonials_status_id_company_id_branch_id_index` (`status_id`,`company_id`,`branch_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `testimonials_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testimonials`
--

LOCK TABLES `testimonials` WRITE;
/*!40000 ALTER TABLE `testimonials` DISABLE KEYS */;
INSERT INTO `testimonials` VALUES
(1,' Never felt this much relaxed in last couple of years It’s quiet comprehensible and helped me manage things very easily. A great software indeed!',1,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1);
/*!40000 ALTER TABLE `testimonials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_replies`
--

DROP TABLE IF EXISTS `ticket_replies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket_replies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `support_ticket_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `message` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `ticket_replies_support_ticket_id_foreign` (`support_ticket_id`),
  KEY `ticket_replies_user_id_foreign` (`user_id`),
  KEY `ticket_replies_company_id_branch_id_index` (`company_id`,`branch_id`),
  CONSTRAINT `ticket_replies_support_ticket_id_foreign` FOREIGN KEY (`support_ticket_id`) REFERENCES `support_tickets` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ticket_replies_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_replies`
--

LOCK TABLES `ticket_replies` WRITE;
/*!40000 ALTER TABLE `ticket_replies` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticket_replies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_zones`
--

DROP TABLE IF EXISTS `time_zones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `time_zones` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `time_zone` varchar(255) DEFAULT NULL,
  `active_status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=425 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_zones`
--

LOCK TABLES `time_zones` WRITE;
/*!40000 ALTER TABLE `time_zones` DISABLE KEYS */;
INSERT INTO `time_zones` VALUES
(1,'AD','Europe/Andorra',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(2,'AE','Asia/Dubai',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(3,'AF','Asia/Kabul',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(4,'AG','America/Antigua',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(5,'AI','America/Anguilla',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(6,'AL','Europe/Tirane',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(7,'AM','Asia/Yerevan',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(8,'AO','Africa/Luanda',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(9,'AQ','Antarctica/McMurdo',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(10,'AQ','Antarctica/Casey',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(11,'AQ','Antarctica/Davis',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(12,'AQ','Antarctica/DumontDUrville',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(13,'AQ','Antarctica/Mawson',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(14,'AQ','Antarctica/Palmer',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(15,'AQ','Antarctica/Rothera',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(16,'AQ','Antarctica/Syowa',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(17,'AQ','Antarctica/Troll',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(18,'AQ','Antarctica/Vostok',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(19,'AR','America/Argentina/Buenos_Aires',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(20,'AR','America/Argentina/Cordoba',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(21,'AR','America/Argentina/Salta',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(22,'AR','America/Argentina/Jujuy',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(23,'AR','America/Argentina/Tucuman',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(24,'AR','America/Argentina/Catamarca',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(25,'AR','America/Argentina/La_Rioja',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(26,'AR','America/Argentina/San_Juan',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(27,'AR','America/Argentina/Mendoza',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(28,'AR','America/Argentina/San_Luis',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(29,'AR','America/Argentina/Rio_Gallegos',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(30,'AR','America/Argentina/Ushuaia',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(31,'AS','Pacific/Pago_Pago',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(32,'AT','Europe/Vienna',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(33,'AU','Australia/Lord_Howe',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(34,'AU','Antarctica/Macquarie',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(35,'AU','Australia/Hobart',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(36,'AU','Australia/Currie',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(37,'AU','Australia/Melbourne',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(38,'AU','Australia/Sydney',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(39,'AU','Australia/Broken_Hill',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(40,'AU','Australia/Brisbane',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(41,'AU','Australia/Lindeman',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(42,'AU','Australia/Adelaide',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(43,'AU','Australia/Darwin',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(44,'AU','Australia/Perth',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(45,'AU','Australia/Eucla',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(46,'AW','America/Aruba',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(47,'AX','Europe/Mariehamn',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(48,'AZ','Asia/Baku',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(49,'BA','Europe/Sarajevo',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(50,'BB','America/Barbados',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(51,'BD','Asia/Dhaka',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(52,'BE','Europe/Brussels',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(53,'BF','Africa/Ouagadougou',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(54,'BG','Europe/Sofia',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(55,'BH','Asia/Bahrain',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(56,'BI','Africa/Bujumbura',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(57,'BJ','Africa/Porto-Novo',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(58,'BL','America/St_Barthelemy',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(59,'BM','Atlantic/Bermuda',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(60,'BN','Asia/Brunei',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(61,'BO','America/La_Paz',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(62,'BQ','America/Kralendijk',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(63,'BR','America/Noronha',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(64,'BR','America/Belem',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(65,'BR','America/Fortaleza',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(66,'BR','America/Recife',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(67,'BR','America/Araguaina',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(68,'BR','America/Maceio',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(69,'BR','America/Bahia',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(70,'BR','America/Sao_Paulo',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(71,'BR','America/Campo_Grande',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(72,'BR','America/Cuiaba',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(73,'BR','America/Santarem',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(74,'BR','America/Porto_Velho',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(75,'BR','America/Boa_Vista',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(76,'BR','America/Manaus',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(77,'BR','America/Eirunepe',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(78,'BR','America/Rio_Branco',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(79,'BS','America/Nassau',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(80,'BT','Asia/Thimphu',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(81,'BW','Africa/Gaborone',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(82,'BY','Europe/Minsk',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(83,'BZ','America/Belize',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(84,'CA','America/St_Johns',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(85,'CA','America/Halifax',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(86,'CA','America/Glace_Bay',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(87,'CA','America/Moncton',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(88,'CA','America/Goose_Bay',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(89,'CA','America/Blanc-Sablon',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(90,'CA','America/Toronto',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(91,'CA','America/Nipigon',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(92,'CA','America/Thunder_Bay',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(93,'CA','America/Iqaluit',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(94,'CA','America/Pangnirtung',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(95,'CA','America/Atikokan',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(96,'CA','America/Winnipeg',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(97,'CA','America/Rainy_River',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(98,'CA','America/Resolute',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(99,'CA','America/Rankin_Inlet',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(100,'CA','America/Regina',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(101,'CA','America/Swift_Current',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(102,'CA','America/Edmonton',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(103,'CA','America/Cambridge_Bay',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(104,'CA','America/Yellowknife',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(105,'CA','America/Inuvik',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(106,'CA','America/Creston',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(107,'CA','America/Dawson_Creek',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(108,'CA','America/Fort_Nelson',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(109,'CA','America/Vancouver',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(110,'CA','America/Whitehorse',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(111,'CA','America/Dawson',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(112,'CC','Indian/Cocos',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(113,'CD','Africa/Kinshasa',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(114,'CD','Africa/Lubumbashi',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(115,'CF','Africa/Bangui',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(116,'CG','Africa/Brazzaville',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(117,'CH','Europe/Zurich',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(118,'CI','Africa/Abidjan',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(119,'CK','Pacific/Rarotonga',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(120,'CL','America/Santiago',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(121,'CL','America/Punta_Arenas',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(122,'CL','Pacific/Easter',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(123,'CM','Africa/Douala',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(124,'CN','Asia/Shanghai',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(125,'CN','Asia/Urumqi',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(126,'CO','America/Bogota',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(127,'CR','America/Costa_Rica',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(128,'CU','America/Havana',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(129,'CV','Atlantic/Cape_Verde',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(130,'CW','America/Curacao',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(131,'CX','Indian/Christmas',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(132,'CY','Asia/Nicosia',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(133,'CY','Asia/Famagusta',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(134,'CZ','Europe/Prague',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(135,'DE','Europe/Berlin',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(136,'DE','Europe/Busingen',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(137,'DJ','Africa/Djibouti',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(138,'DK','Europe/Copenhagen',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(139,'DM','America/Dominica',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(140,'DO','America/Santo_Domingo',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(141,'DZ','Africa/Algiers',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(142,'EC','America/Guayaquil',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(143,'EC','Pacific/Galapagos',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(144,'EE','Europe/Tallinn',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(145,'EG','Africa/Cairo',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(146,'EH','Africa/El_Aaiun',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(147,'ER','Africa/Asmara',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(148,'ES','Europe/Madrid',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(149,'ES','Africa/Ceuta',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(150,'ES','Atlantic/Canary',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(151,'ET','Africa/Addis_Ababa',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(152,'FI','Europe/Helsinki',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(153,'FJ','Pacific/Fiji',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(154,'FK','Atlantic/Stanley',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(155,'FM','Pacific/Chuuk',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(156,'FM','Pacific/Pohnpei',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(157,'FM','Pacific/Kosrae',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(158,'FO','Atlantic/Faroe',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(159,'FR','Europe/Paris',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(160,'GA','Africa/Libreville',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(161,'GB','Europe/London',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(162,'GD','America/Grenada',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(163,'GE','Asia/Tbilisi',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(164,'GF','America/Cayenne',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(165,'GG','Europe/Guernsey',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(166,'GH','Africa/Accra',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(167,'GI','Europe/Gibraltar',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(168,'GL','America/Godthab',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(169,'GL','America/Danmarkshavn',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(170,'GL','America/Scoresbysund',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(171,'GL','America/Thule',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(172,'GM','Africa/Banjul',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(173,'GN','Africa/Conakry',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(174,'GP','America/Guadeloupe',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(175,'GQ','Africa/Malabo',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(176,'GR','Europe/Athens',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(177,'GS','Atlantic/South_Georgia',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(178,'GT','America/Guatemala',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(179,'GU','Pacific/Guam',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(180,'GW','Africa/Bissau',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(181,'GY','America/Guyana',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(182,'HK','Asia/Hong_Kong',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(183,'HN','America/Tegucigalpa',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(184,'HR','Europe/Zagreb',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(185,'HT','America/Port-au-Prince',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(186,'HU','Europe/Budapest',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(187,'ID','Asia/Jakarta',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(188,'ID','Asia/Pontianak',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(189,'ID','Asia/Makassar',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(190,'ID','Asia/Jayapura',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(191,'IE','Europe/Dublin',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(192,'IL','Asia/Jerusalem',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(193,'IM','Europe/Isle_of_Man',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(194,'IN','Asia/Kolkata',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(195,'IO','Indian/Chagos',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(196,'IQ','Asia/Baghdad',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(197,'IR','Asia/Tehran',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(198,'IS','Atlantic/Reykjavik',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(199,'IT','Europe/Rome',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(200,'JE','Europe/Jersey',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(201,'JM','America/Jamaica',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(202,'JO','Asia/Amman',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(203,'JP','Asia/Tokyo',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(204,'KE','Africa/Nairobi',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(205,'KG','Asia/Bishkek',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(206,'KH','Asia/Phnom_Penh',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(207,'KI','Pacific/Tarawa',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(208,'KI','Pacific/Enderbury',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(209,'KI','Pacific/Kiritimati',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(210,'KM','Indian/Comoro',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(211,'KN','America/St_Kitts',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(212,'KP','Asia/Pyongyang',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(213,'KR','Asia/Seoul',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(214,'KW','Asia/Kuwait',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(215,'KY','America/Cayman',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(216,'KZ','Asia/Almaty',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(217,'KZ','Asia/Qyzylorda',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(218,'KZ','Asia/Aqtobe',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(219,'KZ','Asia/Aqtau',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(220,'KZ','Asia/Atyrau',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(221,'KZ','Asia/Oral',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(222,'LA','Asia/Vientiane',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(223,'LB','Asia/Beirut',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(224,'LC','America/St_Lucia',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(225,'LI','Europe/Vaduz',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(226,'LK','Asia/Colombo',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(227,'LR','Africa/Monrovia',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(228,'LS','Africa/Maseru',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(229,'LT','Europe/Vilnius',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(230,'LU','Europe/Luxembourg',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(231,'LV','Europe/Riga',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(232,'LY','Africa/Tripoli',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(233,'MA','Africa/Casablanca',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(234,'MC','Europe/Monaco',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(235,'MD','Europe/Chisinau',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(236,'ME','Europe/Podgorica',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(237,'MF','America/Marigot',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(238,'MG','Indian/Antananarivo',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(239,'MH','Pacific/Majuro',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(240,'MH','Pacific/Kwajalein',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(241,'MK','Europe/Skopje',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(242,'ML','Africa/Bamako',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(243,'MM','Asia/Yangon',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(244,'MN','Asia/Ulaanbaatar',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(245,'MN','Asia/Hovd',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(246,'MN','Asia/Choibalsan',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(247,'MO','Asia/Macau',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(248,'MP','Pacific/Saipan',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(249,'MQ','America/Martinique',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(250,'MR','Africa/Nouakchott',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(251,'MS','America/Montserrat',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(252,'MT','Europe/Malta',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(253,'MU','Indian/Mauritius',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(254,'MV','Indian/Maldives',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(255,'MW','Africa/Blantyre',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(256,'MX','America/Mexico_City',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(257,'MX','America/Cancun',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(258,'MX','America/Merida',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(259,'MX','America/Monterrey',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(260,'MX','America/Matamoros',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(261,'MX','America/Mazatlan',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(262,'MX','America/Chihuahua',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(263,'MX','America/Ojinaga',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(264,'MX','America/Hermosillo',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(265,'MX','America/Tijuana',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(266,'MX','America/Bahia_Banderas',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(267,'MY','Asia/Kuala_Lumpur',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(268,'MY','Asia/Kuching',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(269,'MZ','Africa/Maputo',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(270,'NA','Africa/Windhoek',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(271,'NC','Pacific/Noumea',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(272,'NE','Africa/Niamey',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(273,'NF','Pacific/Norfolk',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(274,'NG','Africa/Lagos',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(275,'NI','America/Managua',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(276,'NL','Europe/Amsterdam',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(277,'NO','Europe/Oslo',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(278,'NP','Asia/Kathmandu',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(279,'NR','Pacific/Nauru',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(280,'NU','Pacific/Niue',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(281,'NZ','Pacific/Auckland',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(282,'NZ','Pacific/Chatham',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(283,'OM','Asia/Muscat',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(284,'PA','America/Panama',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(285,'PE','America/Lima',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(286,'PF','Pacific/Tahiti',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(287,'PF','Pacific/Marquesas',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(288,'PF','Pacific/Gambier',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(289,'PG','Pacific/Port_Moresby',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(290,'PG','Pacific/Bougainville',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(291,'PH','Asia/Manila',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(292,'PK','Asia/Karachi',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(293,'PL','Europe/Warsaw',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(294,'PM','America/Miquelon',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(295,'PN','Pacific/Pitcairn',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(296,'PR','America/Puerto_Rico',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(297,'PS','Asia/Gaza',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(298,'PS','Asia/Hebron',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(299,'PT','Europe/Lisbon',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(300,'PT','Atlantic/Madeira',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(301,'PT','Atlantic/Azores',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(302,'PW','Pacific/Palau',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(303,'PY','America/Asuncion',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(304,'QA','Asia/Qatar',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(305,'RE','Indian/Reunion',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(306,'RO','Europe/Bucharest',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(307,'RS','Europe/Belgrade',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(308,'RU','Europe/Kaliningrad',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(309,'RU','Europe/Moscow',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(310,'RU','Europe/Simferopol',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(311,'RU','Europe/Volgograd',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(312,'RU','Europe/Kirov',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(313,'RU','Europe/Astrakhan',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(314,'RU','Europe/Saratov',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(315,'RU','Europe/Ulyanovsk',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(316,'RU','Europe/Samara',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(317,'RU','Asia/Yekaterinburg',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(318,'RU','Asia/Omsk',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(319,'RU','Asia/Novosibirsk',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(320,'RU','Asia/Barnaul',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(321,'RU','Asia/Tomsk',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(322,'RU','Asia/Novokuznetsk',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(323,'RU','Asia/Krasnoyarsk',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(324,'RU','Asia/Irkutsk',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(325,'RU','Asia/Chita',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(326,'RU','Asia/Yakutsk',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(327,'RU','Asia/Khandyga',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(328,'RU','Asia/Vladivostok',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(329,'RU','Asia/Ust-Nera',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(330,'RU','Asia/Magadan',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(331,'RU','Asia/Sakhalin',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(332,'RU','Asia/Srednekolymsk',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(333,'RU','Asia/Kamchatka',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(334,'RU','Asia/Anadyr',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(335,'RW','Africa/Kigali',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(336,'SA','Asia/Riyadh',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(337,'SB','Pacific/Guadalcanal',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(338,'SC','Indian/Mahe',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(339,'SD','Africa/Khartoum',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(340,'SE','Europe/Stockholm',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(341,'SG','Asia/Singapore',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(342,'SH','Atlantic/St_Helena',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(343,'SI','Europe/Ljubljana',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(344,'SJ','Arctic/Longyearbyen',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(345,'SK','Europe/Bratislava',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(346,'SL','Africa/Freetown',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(347,'SM','Europe/San_Marino',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(348,'SN','Africa/Dakar',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(349,'SO','Africa/Mogadishu',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(350,'SR','America/Paramaribo',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(351,'SS','Africa/Juba',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(352,'ST','Africa/Sao_Tome',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(353,'SV','America/El_Salvador',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(354,'SX','America/Lower_Princes',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(355,'SY','Asia/Damascus',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(356,'SZ','Africa/Mbabane',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(357,'TC','America/Grand_Turk',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(358,'TD','Africa/Ndjamena',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(359,'TF','Indian/Kerguelen',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(360,'TG','Africa/Lome',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(361,'TH','Asia/Bangkok',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(362,'TJ','Asia/Dushanbe',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(363,'TK','Pacific/Fakaofo',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(364,'TL','Asia/Dili',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(365,'TM','Asia/Ashgabat',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(366,'TN','Africa/Tunis',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(367,'TO','Pacific/Tongatapu',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(368,'TR','Europe/Istanbul',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(369,'TT','America/Port_of_Spain',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(370,'TV','Pacific/Funafuti',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(371,'TW','Asia/Taipei',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(372,'TZ','Africa/Dar_es_Salaam',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(373,'UA','Europe/Kiev',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(374,'UA','Europe/Uzhgorod',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(375,'UA','Europe/Zaporozhye',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(376,'UG','Africa/Kampala',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(377,'UM','Pacific/Midway',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(378,'UM','Pacific/Wake',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(379,'US','America/New_York',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(380,'US','America/Detroit',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(381,'US','America/Kentucky/Louisville',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(382,'US','America/Kentucky/Monticello',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(383,'US','America/Indiana/Indianapolis',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(384,'US','America/Indiana/Vincennes',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(385,'US','America/Indiana/Winamac',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(386,'US','America/Indiana/Marengo',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(387,'US','America/Indiana/Petersburg',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(388,'US','America/Indiana/Vevay',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(389,'US','America/Chicago',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(390,'US','America/Indiana/Tell_City',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(391,'US','America/Indiana/Knox',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(392,'US','America/Menominee',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(393,'US','America/North_Dakota/Center',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(394,'US','America/North_Dakota/New_Salem',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(395,'US','America/North_Dakota/Beulah',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(396,'US','America/Denver',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(397,'US','America/Boise',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(398,'US','America/Phoenix',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(399,'US','America/Los_Angeles',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(400,'US','America/Anchorage',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(401,'US','America/Juneau',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(402,'US','America/Sitka',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(403,'US','America/Metlakatla',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(404,'US','America/Yakutat',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(405,'US','America/Nome',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(406,'US','America/Adak',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(407,'US','Pacific/Honolulu',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(408,'UY','America/Montevideo',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(409,'UZ','Asia/Samarkand',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(410,'UZ','Asia/Tashkent',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(411,'VA','Europe/Vatican',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(412,'VC','America/St_Vincent',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(413,'VE','America/Caracas',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(414,'VG','America/Tortola',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(415,'VI','America/St_Thomas',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(416,'VN','Asia/Ho_Chi_Minh',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(417,'VU','Pacific/Efate',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(418,'WF','Pacific/Wallis',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(419,'WS','Pacific/Apia',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(420,'YE','Asia/Aden',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(421,'YT','Indian/Mayotte',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(422,'ZA','Africa/Johannesburg',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(423,'ZM','Africa/Lusaka',1,'2024-02-06 05:41:37','2024-02-06 05:41:37'),
(424,'ZW','Africa/Harare',1,'2024-02-06 05:41:37','2024-02-06 05:41:37');
/*!40000 ALTER TABLE `time_zones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transactions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `account_id` bigint(20) unsigned NOT NULL,
  `date` date DEFAULT NULL,
  `description` varchar(400) DEFAULT NULL,
  `amount` double(16,2) NOT NULL DEFAULT 0.00,
  `transaction_type` bigint(20) unsigned NOT NULL DEFAULT 18,
  `status_id` bigint(20) unsigned NOT NULL DEFAULT 9,
  `created_by` bigint(20) unsigned NOT NULL DEFAULT 1,
  `updated_by` bigint(20) unsigned NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `transactions_account_id_foreign` (`account_id`),
  KEY `transactions_status_id_company_id_branch_id_index` (`status_id`,`company_id`,`branch_id`),
  KEY `transaction_type` (`transaction_type`),
  KEY `status_id` (`status_id`),
  KEY `created_by` (`created_by`),
  KEY `updated_by` (`updated_by`),
  CONSTRAINT `transactions_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `transactions_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `transactions_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `transactions_transaction_type_foreign` FOREIGN KEY (`transaction_type`) REFERENCES `statuses` (`id`),
  CONSTRAINT `transactions_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translations`
--

DROP TABLE IF EXISTS `translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `default` varchar(191) NOT NULL,
  `en` longtext DEFAULT NULL,
  `bn` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `translations_company_id_branch_id_index` (`company_id`,`branch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translations`
--

LOCK TABLES `translations` WRITE;
/*!40000 ALTER TABLE `translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `travel`
--

DROP TABLE IF EXISTS `travel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `travel` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_by` bigint(20) unsigned NOT NULL,
  `travel_type_id` bigint(20) unsigned NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status_id` bigint(20) unsigned NOT NULL DEFAULT 1,
  `expect_amount` double(16,2) DEFAULT NULL,
  `amount` double(16,2) DEFAULT NULL,
  `description` longtext NOT NULL,
  `attachment` bigint(20) unsigned DEFAULT NULL,
  `purpose` varchar(255) DEFAULT NULL,
  `place` varchar(255) DEFAULT NULL,
  `mode` enum('bus','train','plane') DEFAULT NULL,
  `goal_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `travel_user_id_foreign` (`user_id`),
  KEY `travel_created_by_foreign` (`created_by`),
  KEY `travel_attachment_foreign` (`attachment`),
  KEY `travel_goal_id_foreign` (`goal_id`),
  KEY `travel_index` (`travel_type_id`,`company_id`,`status_id`,`user_id`,`branch_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `travel_attachment_foreign` FOREIGN KEY (`attachment`) REFERENCES `uploads` (`id`),
  CONSTRAINT `travel_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `travel_goal_id_foreign` FOREIGN KEY (`goal_id`) REFERENCES `goals` (`id`) ON DELETE CASCADE,
  CONSTRAINT `travel_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `travel_travel_type_id_foreign` FOREIGN KEY (`travel_type_id`) REFERENCES `travel_types` (`id`) ON DELETE CASCADE,
  CONSTRAINT `travel_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travel`
--

LOCK TABLES `travel` WRITE;
/*!40000 ALTER TABLE `travel` DISABLE KEYS */;
/*!40000 ALTER TABLE `travel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `travel_types`
--

DROP TABLE IF EXISTS `travel_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `travel_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `status_id` bigint(20) unsigned NOT NULL DEFAULT 1,
  `created_by` bigint(20) unsigned DEFAULT 1,
  `updated_by` bigint(20) unsigned DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `travel_types_status_id_company_id_branch_id_index` (`status_id`,`company_id`,`branch_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `travel_types_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travel_types`
--

LOCK TABLES `travel_types` WRITE;
/*!40000 ALTER TABLE `travel_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `travel_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uploads`
--

DROP TABLE IF EXISTS `uploads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uploads` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `file_original_name` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `img_path` varchar(255) DEFAULT NULL,
  `big_path` varchar(255) DEFAULT NULL COMMENT '1920 x 1080',
  `small_path` varchar(255) DEFAULT NULL COMMENT '300 x 300',
  `thumbnail_path` varchar(255) DEFAULT NULL COMMENT '500 x 400',
  `extension` varchar(10) DEFAULT NULL,
  `type` varchar(15) DEFAULT NULL,
  `file_size` int(11) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `status_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `uploads_status_id_company_id_branch_id_index` (`status_id`,`company_id`,`branch_id`),
  KEY `uploads_status_id_index` (`status_id`),
  CONSTRAINT `uploads_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uploads`
--

LOCK TABLES `uploads` WRITE;
/*!40000 ALTER TABLE `uploads` DISABLE KEYS */;
INSERT INTO `uploads` VALUES
(1,1,'dark_logo','dark_logo.png','static/dark_logo.png','static/dark_logo.png','static/dark_logo.png','static/dark_logo.png','.png','png',0,100,100,1,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(2,1,'white_logo','white_logo.png','static/white_logo.png','static/white_logo.png','static/white_logo.png','static/white_logo.png','.png','png',0,100,100,1,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(3,1,'fav','fav.png','static/fav.png','static/fav.png','static/fav.png','static/fav.png','.png','png',0,100,100,1,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(4,1,'background_image','background_image.png','static/background_image.png','static/background_image.png','static/background_image.png','static/background_image.png','.png','png',0,100,100,1,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(5,1,'android_icon','android_icon.png','static/android_icon.png','static/android_icon.png','static/android_icon.png','static/android_icon.png','.png','png',0,100,100,1,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(6,1,'iso_icon','iso_icon.png','static/iso_icon.png','static/iso_icon.png','static/iso_icon.png','static/iso_icon.png','.png','png',0,100,100,1,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(7,1,'support','support.png','static/support.png','static/support.png','static/support.png','static/support.png','.png','png',0,100,100,1,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(8,1,'attendance','attendance.png','static/attendance.png','static/attendance.png','static/attendance.png','static/attendance.png','.png','png',0,100,100,1,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(9,1,'notice','notice.png','static/notice.png','static/notice.png','static/notice.png','static/notice.png','.png','png',0,100,100,1,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(10,1,'expense','expense.png','static/expense.png','static/expense.png','static/expense.png','static/expense.png','.png','png',0,100,100,1,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(11,1,'leave','leave.png','static/leave.png','static/leave.png','static/leave.png','static/leave.png','.png','png',0,100,100,1,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(12,1,'approval','approval.png','static/approval.png','static/approval.png','static/approval.png','static/approval.png','.png','png',0,100,100,1,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(13,1,'phonebook','phonebook.png','static/phonebook.png','static/phonebook.png','static/phonebook.png','static/phonebook.png','.png','png',0,100,100,1,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(14,1,'visit','visit.png','static/visit.png','static/visit.png','static/visit.png','static/visit.png','.png','png',0,100,100,1,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(15,1,'appointments','appointments.png','static/appointments.png','static/appointments.png','static/appointments.png','static/appointments.png','.png','png',0,100,100,1,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(16,1,'break','break.png','static/break.png','static/break.png','static/break.png','static/break.png','.png','png',0,100,100,1,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(17,1,'report','report.png','static/report.png','static/report.png','static/report.png','static/report.png','.png','png',0,100,100,1,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(21,1,'portfolio1','portfolio1.png','static/portfolio1.png','static/portfolio1.png','static/portfolio1.png','static/portfolio1.png','.png','png',0,100,100,1,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(22,1,'portfolio2','portfolio2.png','static/portfolio2.png','static/portfolio2.png','static/portfolio2.png','static/portfolio2.png','.png','png',0,100,100,1,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(23,1,'portfolio3','portfolio3.png','static/portfolio3.png','static/portfolio3.png','static/portfolio3.png','static/portfolio3.png','.png','png',0,100,100,1,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(24,1,'portfolio4','portfolio4.png','static/portfolio4.png','static/portfolio4.png','static/portfolio4.png','static/portfolio4.png','.png','png',0,100,100,1,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(25,1,'portfolio5','portfolio5.png','static/portfolio5.png','static/portfolio5.png','static/portfolio5.png','static/portfolio5.png','.png','png',0,100,100,1,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(26,1,'portfolio6','portfolio6.png','static/portfolio6.png','static/portfolio6.png','static/portfolio6.png','static/portfolio6.png','.png','png',0,100,100,1,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(27,1,'portfolio7','portfolio7.png','static/portfolio7.png','static/portfolio7.png','static/portfolio7.png','static/portfolio7.png','.png','png',0,100,100,1,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(28,1,'portfolio8','portfolio8.png','static/portfolio8.png','static/portfolio8.png','static/portfolio8.png','static/portfolio8.png','.png','png',0,100,100,1,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(29,1,'team1','team1.png','static/team1.png','static/team1.png','static/team1.png','static/team1.png','.png','png',0,100,100,1,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(30,1,'team2','team2.png','static/team2.png','static/team2.png','static/team2.png','static/team2.png','.png','png',0,100,100,1,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(31,1,'team3','team3.png','static/team3.png','static/team3.png','static/team3.png','static/team3.png','.png','png',0,100,100,1,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(32,1,'team4','team4.png','static/team4.png','static/team4.png','static/team4.png','static/team4.png','.png','png',0,100,100,1,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(33,1,'team5','team5.png','static/team5.png','static/team5.png','static/team5.png','static/team5.png','.png','png',0,100,100,1,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(34,1,'team6','team6.png','static/team6.png','static/team6.png','static/team6.png','static/team6.png','.png','png',0,100,100,1,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(35,1,'team7','team7.png','static/team7.png','static/team7.png','static/team7.png','static/team7.png','.png','png',0,100,100,1,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(36,1,'team8','team8.png','static/team8.png','static/team8.png','static/team8.png','static/team8.png','.png','png',0,100,100,1,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(37,1,'team8','team8.png','static/app-screen/screen-1.png','static/app-screen/screen-1.png','static/app-screen/screen-1.png','static/app-screen/screen-1.png','.png','png',0,300,700,1,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(38,1,'team8','team8.png','static/app-screen/screen-2.png','static/app-screen/screen-2.png','static/app-screen/screen-2.png','static/app-screen/screen-2.png','.png','png',0,300,700,1,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(39,1,'team8','team8.png','static/app-screen/screen-3.png','static/app-screen/screen-3.png','static/app-screen/screen-3.png','static/app-screen/screen-3.png','.png','png',0,300,700,1,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(40,1,'cms1','cms1.png','vendor/Saas/Assets/images/img_1.png','vendor/Saas/Assets/images/img_1.png','vendor/Saas/Assets/images/img_1.png','vendor/Saas/Assets/images/img_1.png','.png','png',0,500,500,1,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(41,1,'cms2','cms2.png','vendor/Saas/Assets/images/img_2.png','vendor/Saas/Assets/images/img_2.png','vendor/Saas/Assets/images/img_2.png','vendor/Saas/Assets/images/img_2.png','.png','png',0,500,500,1,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(42,1,'cms3','cms3.png','vendor/Saas/Assets/images/img_3.png','vendor/Saas/Assets/images/img_3.png','vendor/Saas/Assets/images/img_3.png','vendor/Saas/Assets/images/img_3.png','.png','png',0,500,500,1,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(43,1,'cms4','cms4.png','vendor/Saas/Assets/images/img_4.png','vendor/Saas/Assets/images/img_4.png','vendor/Saas/Assets/images/img_4.png','vendor/Saas/Assets/images/img_4.png','.png','png',0,500,500,1,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(44,1,'cms5','cms5.png','vendor/Saas/Assets/images/img_5.png','vendor/Saas/Assets/images/img_5.png','vendor/Saas/Assets/images/img_5.png','vendor/Saas/Assets/images/img_5.png','.png','png',0,500,500,1,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(45,1,'feature','feature.png','vendor/Saas/Assets/images/project.png','vendor/Saas/Assets/images/project.png','vendor/Saas/Assets/images/project.png','vendor/Saas/Assets/images/project.png','.png','png',0,500,500,1,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(46,1,'cms6','cms6.png','vendor/Saas/Assets/images/img_6.png','vendor/Saas/Assets/images/img_6.png','vendor/Saas/Assets/images/img_6.png','vendor/Saas/Assets/images/img_6.png','.png','png',0,500,500,1,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(47,1,'cms7','cms7.png','vendor/Saas/Assets/images/img_7.png','vendor/Saas/Assets/images/img_7.png','vendor/Saas/Assets/images/img_7.png','vendor/Saas/Assets/images/img_7.png','.png','png',0,500,500,1,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(48,1,'cms8','cms8.png','vendor/Saas/Assets/images/img_8.png','vendor/Saas/Assets/images/img_8.png','vendor/Saas/Assets/images/img_8.png','vendor/Saas/Assets/images/img_8.png','.png','png',0,500,500,1,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(49,1,'hero-image','hero-image.png','vendor/Saas/Assets/images/hero-image.png','vendor/Saas/Assets/images/hero-image.png','vendor/Saas/Assets/images/hero-image.png','vendor/Saas/Assets/images/hero-image.png','.png','png',0,500,500,1,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1);
/*!40000 ALTER TABLE `uploads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_devices`
--

DROP TABLE IF EXISTS `user_devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_devices` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `device_token` longtext DEFAULT NULL COMMENT 'device_token from firebase',
  `device_name` varchar(255) DEFAULT NULL COMMENT 'device_name from firebase',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `user_devices_user_id_company_id_branch_id_index` (`user_id`,`company_id`,`branch_id`),
  CONSTRAINT `user_devices_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_devices`
--

LOCK TABLES `user_devices` WRITE;
/*!40000 ALTER TABLE `user_devices` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_devices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_document_requests`
--

DROP TABLE IF EXISTS `user_document_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_document_requests` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `branch_id` bigint(20) unsigned NOT NULL DEFAULT 1,
  `company_id` bigint(20) unsigned NOT NULL DEFAULT 1,
  `request_type` varchar(255) NOT NULL,
  `request_description` text DEFAULT NULL,
  `approved` tinyint(1) DEFAULT NULL,
  `request_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_document_requests_status_id_foreign` (`status_id`),
  KEY `user_document_requests_user_id_index` (`user_id`),
  KEY `user_document_requests_request_type_index` (`request_type`),
  KEY `user_document_requests_approved_index` (`approved`),
  KEY `user_document_requests_request_date_index` (`request_date`),
  CONSTRAINT `user_document_requests_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `user_document_requests_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_document_requests`
--

LOCK TABLES `user_document_requests` WRITE;
/*!40000 ALTER TABLE `user_document_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_document_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `country_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `userID` int(11) DEFAULT NULL,
  `face_recognition` tinyint(4) DEFAULT 1,
  `face_data` longtext DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `is_admin` varchar(255) NOT NULL DEFAULT '0',
  `is_hr` tinyint(4) DEFAULT NULL,
  `role_id` bigint(20) unsigned DEFAULT NULL,
  `department_id` bigint(20) unsigned DEFAULT NULL,
  `shift_id` bigint(20) unsigned DEFAULT NULL,
  `designation_id` bigint(20) unsigned DEFAULT NULL,
  `permissions` text DEFAULT NULL,
  `verification_code` varchar(255) DEFAULT NULL COMMENT 'email verification code',
  `manager_id` bigint(20) unsigned DEFAULT NULL,
  `employee_id` varchar(255) DEFAULT NULL,
  `employee_type` enum('Permanent','On Probation','Contractual','Intern') NOT NULL DEFAULT 'On Probation',
  `grade` varchar(255) DEFAULT NULL,
  `nationality` varchar(255) DEFAULT NULL,
  `facebook_link` varchar(255) DEFAULT NULL,
  `linkedin_link` varchar(255) DEFAULT NULL,
  `instagram_link` varchar(255) DEFAULT NULL,
  `passport_number` varchar(255) DEFAULT NULL,
  `passport_file_id` bigint(20) unsigned DEFAULT NULL,
  `passport_expire_date` varchar(255) DEFAULT NULL,
  `passport_is_notified` tinyint(4) NOT NULL DEFAULT 0,
  `eid_number` varchar(255) DEFAULT NULL,
  `eid_file_id` bigint(20) unsigned DEFAULT NULL,
  `eid_expire_date` varchar(255) DEFAULT NULL,
  `eid_is_notified` tinyint(4) NOT NULL DEFAULT 0,
  `visa_number` varchar(255) DEFAULT NULL,
  `visa_file_id` bigint(20) unsigned DEFAULT NULL,
  `visa_expire_date` varchar(255) DEFAULT NULL,
  `visa_is_notified` tinyint(4) NOT NULL DEFAULT 0,
  `insurance_number` varchar(255) DEFAULT NULL,
  `insurance_file_id` bigint(20) unsigned DEFAULT NULL,
  `insurance_expire_date` varchar(255) DEFAULT NULL,
  `insurance_is_notified` tinyint(4) NOT NULL DEFAULT 0,
  `labour_card_number` varchar(255) DEFAULT NULL,
  `labour_card_file_id` bigint(20) unsigned DEFAULT NULL,
  `labour_card_expire_date` varchar(255) DEFAULT NULL,
  `labour_card_is_notified` tinyint(4) NOT NULL DEFAULT 0,
  `nid_card_number` varchar(255) DEFAULT NULL,
  `nid_card_id` bigint(20) unsigned DEFAULT NULL COMMENT 'this will be uploaded file',
  `tin` varchar(255) DEFAULT NULL,
  `tin_id_front_file` varchar(255) DEFAULT NULL,
  `tin_id_back_file` varchar(255) DEFAULT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  `bank_account` varchar(255) DEFAULT NULL,
  `last_login_device` varchar(255) DEFAULT NULL,
  `device_uuid` varchar(255) DEFAULT NULL,
  `emergency_name` varchar(255) DEFAULT NULL,
  `emergency_mobile_number` varchar(255) DEFAULT NULL,
  `emergency_mobile_relationship` varchar(255) DEFAULT NULL,
  `_token` varchar(255) DEFAULT NULL COMMENT 'email verify token',
  `email_verify_token` varchar(255) DEFAULT NULL COMMENT 'email verify token',
  `is_email_verified` enum('verified','non-verified') NOT NULL DEFAULT 'verified',
  `email_verified_at` timestamp NULL DEFAULT NULL COMMENT 'email verified at',
  `phone_verify_token` varchar(255) DEFAULT NULL COMMENT 'phone verify token',
  `is_phone_verified` enum('verified','non-verified') NOT NULL DEFAULT 'verified',
  `phone_verified_at` timestamp NULL DEFAULT NULL COMMENT 'phone verified at',
  `password` varchar(255) NOT NULL,
  `password_hints` varchar(255) DEFAULT NULL COMMENT 'user can set a password hint for easy remember',
  `avatar_id` bigint(20) unsigned DEFAULT NULL,
  `status_id` bigint(20) unsigned NOT NULL DEFAULT 1,
  `last_login_at` timestamp NULL DEFAULT NULL COMMENT 'last login at',
  `last_logout_at` timestamp NULL DEFAULT NULL COMMENT 'last logout at',
  `last_login_ip` varchar(255) DEFAULT NULL COMMENT 'last login ip',
  `device_token` longtext DEFAULT NULL COMMENT 'device_token from firebase',
  `login_access` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0 = off, 1 = on',
  `address` varchar(191) DEFAULT NULL,
  `gender` enum('Male','Female','Unisex','Others') DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `religion` enum('Islam','Hindu','Christian') NOT NULL DEFAULT 'Islam',
  `blood_group` enum('A+','A-','B+','B-','O+','O-','AB+','AB-') DEFAULT NULL,
  `joining_date` date DEFAULT NULL,
  `basic_salary` double(16,2) NOT NULL DEFAULT 0.00,
  `marital_status` enum('Married','Unmarried') NOT NULL DEFAULT 'Unmarried',
  `contract_start_date` date DEFAULT NULL,
  `contract_end_date` date DEFAULT NULL,
  `payslip_type` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 = monthly, 2 = weekly, 3 = daily',
  `late_check_in` int(11) NOT NULL DEFAULT 0,
  `early_check_out` int(11) NOT NULL DEFAULT 0,
  `extra_leave` int(11) NOT NULL DEFAULT 0,
  `monthly_leave` int(11) NOT NULL DEFAULT 0,
  `is_free_location` tinyint(4) NOT NULL DEFAULT 0,
  `time_zone` varchar(191) NOT NULL DEFAULT 'Asia/Dhaka',
  `speak_language` varchar(191) NOT NULL DEFAULT 'english',
  `lang` varchar(255) DEFAULT NULL,
  `social_id` varchar(255) DEFAULT NULL,
  `social_type` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `face_image` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  `stripe_id` varchar(255) DEFAULT NULL,
  `pm_type` varchar(255) DEFAULT NULL,
  `pm_last_four` varchar(4) DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_phone_unique` (`phone`),
  KEY `users_country_id_foreign` (`country_id`),
  KEY `users_role_id_foreign` (`role_id`),
  KEY `users_department_id_foreign` (`department_id`),
  KEY `users_shift_id_foreign` (`shift_id`),
  KEY `users_designation_id_foreign` (`designation_id`),
  KEY `users_manager_id_foreign` (`manager_id`),
  KEY `users_passport_file_id_foreign` (`passport_file_id`),
  KEY `users_eid_file_id_foreign` (`eid_file_id`),
  KEY `users_visa_file_id_foreign` (`visa_file_id`),
  KEY `users_insurance_file_id_foreign` (`insurance_file_id`),
  KEY `users_labour_card_file_id_foreign` (`labour_card_file_id`),
  KEY `users_nid_card_id_foreign` (`nid_card_id`),
  KEY `users_avatar_id_foreign` (`avatar_id`),
  KEY `users_face_image_foreign` (`face_image`),
  KEY `users_combined_index` (`status_id`,`company_id`,`branch_id`,`email`,`manager_id`,`role_id`,`designation_id`,`is_admin`,`is_hr`,`department_id`,`shift_id`),
  KEY `users_status_id_index` (`status_id`),
  KEY `users_stripe_id_index` (`stripe_id`),
  CONSTRAINT `users_avatar_id_foreign` FOREIGN KEY (`avatar_id`) REFERENCES `uploads` (`id`),
  CONSTRAINT `users_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE,
  CONSTRAINT `users_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `users_designation_id_foreign` FOREIGN KEY (`designation_id`) REFERENCES `designations` (`id`) ON DELETE CASCADE,
  CONSTRAINT `users_eid_file_id_foreign` FOREIGN KEY (`eid_file_id`) REFERENCES `uploads` (`id`),
  CONSTRAINT `users_face_image_foreign` FOREIGN KEY (`face_image`) REFERENCES `uploads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `users_insurance_file_id_foreign` FOREIGN KEY (`insurance_file_id`) REFERENCES `uploads` (`id`),
  CONSTRAINT `users_labour_card_file_id_foreign` FOREIGN KEY (`labour_card_file_id`) REFERENCES `uploads` (`id`),
  CONSTRAINT `users_manager_id_foreign` FOREIGN KEY (`manager_id`) REFERENCES `users` (`id`),
  CONSTRAINT `users_nid_card_id_foreign` FOREIGN KEY (`nid_card_id`) REFERENCES `uploads` (`id`),
  CONSTRAINT `users_passport_file_id_foreign` FOREIGN KEY (`passport_file_id`) REFERENCES `uploads` (`id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `users_shift_id_foreign` FOREIGN KEY (`shift_id`) REFERENCES `shifts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `users_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `users_visa_file_id_foreign` FOREIGN KEY (`visa_file_id`) REFERENCES `uploads` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES
(1,223,'Admin',NULL,1,NULL,'admin@onesttech.com','0172xxxxxxxx','1',0,2,1,1,1,'\"[\\\"team_menu\\\",\\\"team_list\\\",\\\"team_create\\\",\\\"team_update\\\",\\\"team_edit\\\",\\\"team_delete\\\",\\\"team_member_view\\\",\\\"team_member_create\\\",\\\"team_member_edit\\\",\\\"team_member_delete\\\",\\\"team_member_assign\\\",\\\"team_member_unassign\\\",\\\"dashboard\\\",\\\"hr_menu\\\",\\\"designation_read\\\",\\\"designation_create\\\",\\\"designation_update\\\",\\\"designation_delete\\\",\\\"shift_read\\\",\\\"shift_create\\\",\\\"shift_update\\\",\\\"shift_delete\\\",\\\"department_read\\\",\\\"department_create\\\",\\\"department_update\\\",\\\"department_delete\\\",\\\"user_menu\\\",\\\"user_read\\\",\\\"profile_view\\\",\\\"user_create\\\",\\\"user_edit\\\",\\\"user_update\\\",\\\"user_delete\\\",\\\"user_banned\\\",\\\"user_unbanned\\\",\\\"make_hr\\\",\\\"user_permission\\\",\\\"profile_image_view\\\",\\\"user_device_list\\\",\\\"reset_device\\\",\\\"phonebook_profile\\\",\\\"support_ticket_profile\\\",\\\"advance_profile\\\",\\\"commission_profile\\\",\\\"salary_profile\\\",\\\"project_profile\\\",\\\"task_profile\\\",\\\"award_profile\\\",\\\"travel_profile\\\",\\\"attendance_profile\\\",\\\"appointment_profile\\\",\\\"visit_profile\\\",\\\"leave_request_profile\\\",\\\"notice_profile\\\",\\\"role_read\\\",\\\"role_create\\\",\\\"role_update\\\",\\\"role_delete\\\",\\\"branch_read\\\",\\\"branch_create\\\",\\\"branch_update\\\",\\\"branch_delete\\\",\\\"leave_menu\\\",\\\"leave_type_read\\\",\\\"leave_type_create\\\",\\\"leave_type_update\\\",\\\"leave_type_delete\\\",\\\"leave_assign_read\\\",\\\"leave_assign_create\\\",\\\"leave_assign_update\\\",\\\"leave_assign_delete\\\",\\\"leave_request_read\\\",\\\"leave_request_create\\\",\\\"leave_request_store\\\",\\\"leave_request_update\\\",\\\"leave_request_approve\\\",\\\"leave_request_reject\\\",\\\"leave_request_delete\\\",\\\"daily_leave_read\\\",\\\"appointment_read\\\",\\\"appointment_menu\\\",\\\"appointment_create\\\",\\\"appointment_approve\\\",\\\"appointment_reject\\\",\\\"appointment_delete\\\",\\\"weekend_read\\\",\\\"weekend_update\\\",\\\"attendance_update\\\",\\\"holiday_read\\\",\\\"holiday_create\\\",\\\"holiday_update\\\",\\\"holiday_delete\\\",\\\"schedule_read\\\",\\\"schedule_create\\\",\\\"schedule_update\\\",\\\"schedule_delete\\\",\\\"attendance_menu\\\",\\\"attendance_read\\\",\\\"attendance_create\\\",\\\"attendance_update\\\",\\\"attendance_delete\\\",\\\"generate_qr_code\\\",\\\"leave_settings_read\\\",\\\"leave_settings_update\\\",\\\"company_settings_read\\\",\\\"company_settings_update\\\",\\\"locationApi\\\",\\\"company_setup_menu\\\",\\\"company_setup_activation\\\",\\\"company_setup_configuration\\\",\\\"company_setup_ip_whitelist\\\",\\\"company_setup_location\\\",\\\"location_create\\\",\\\"location_store\\\",\\\"location_edit\\\",\\\"location_update\\\",\\\"location_delete\\\",\\\"ip_read\\\",\\\"ip_create\\\",\\\"ip_update\\\",\\\"ip_delete\\\",\\\"attendance_report_read\\\",\\\"live_tracking_read\\\",\\\"report_menu\\\",\\\"report\\\",\\\"claim_read\\\",\\\"claim_create\\\",\\\"claim_update\\\",\\\"claim_delete\\\",\\\"payment_read\\\",\\\"payment_create\\\",\\\"payment_update\\\",\\\"payment_delete\\\",\\\"visit_menu\\\",\\\"visit_read\\\",\\\"visit_view\\\",\\\"visit_update\\\",\\\"payroll_menu\\\",\\\"list_payroll_item\\\",\\\"create_payroll_item\\\",\\\"store_payroll_item\\\",\\\"update_payroll_item\\\",\\\"delete_payroll_item\\\",\\\"view_payroll_item\\\",\\\"payroll_item_menu\\\",\\\"list_payroll_set\\\",\\\"create_payroll_set\\\",\\\"store_payroll_set\\\",\\\"update_payroll_set\\\",\\\"delete_payroll_set\\\",\\\"view_payroll_set\\\",\\\"edit_payroll_set\\\",\\\"payroll_set_menu\\\",\\\"advance_salaries_menu\\\",\\\"advance_salaries_create\\\",\\\"advance_salaries_store\\\",\\\"advance_salaries_edit\\\",\\\"advance_salaries_update\\\",\\\"advance_salaries_delete\\\",\\\"advance_salaries_view\\\",\\\"advance_salaries_approve\\\",\\\"advance_salaries_list\\\",\\\"advance_salaries_pay\\\",\\\"advance_salaries_invoice\\\",\\\"advance_salaries_search\\\",\\\"payslip_menu\\\",\\\"salary_generate\\\",\\\"salary_view\\\",\\\"salary_delete\\\",\\\"salary_edit\\\",\\\"salary_update\\\",\\\"salary_payment\\\",\\\"payslip_list\\\",\\\"advance_type_menu\\\",\\\"advance_type_create\\\",\\\"advance_type_store\\\",\\\"advance_type_edit\\\",\\\"advance_type_update\\\",\\\"advance_type_delete\\\",\\\"advance_type_view\\\",\\\"advance_type_list\\\",\\\"salary_menu\\\",\\\"salary_store\\\",\\\"salary_edit\\\",\\\"salary_update\\\",\\\"salary_delete\\\",\\\"salary_view\\\",\\\"salary_list\\\",\\\"salary_search\\\",\\\"salary_pay\\\",\\\"salary_invoice\\\",\\\"salary_approve\\\",\\\"salary_generate\\\",\\\"salary_calculate\\\",\\\"account_menu\\\",\\\"account_create\\\",\\\"account_store\\\",\\\"account_edit\\\",\\\"account_update\\\",\\\"account_delete\\\",\\\"account_view\\\",\\\"account_list\\\",\\\"account_search\\\",\\\"deposit_menu\\\",\\\"deposit_create\\\",\\\"deposit_store\\\",\\\"deposit_edit\\\",\\\"deposit_update\\\",\\\"deposit_delete\\\",\\\"deposit_list\\\",\\\"expense_menu\\\",\\\"expense_create\\\",\\\"expense_store\\\",\\\"expense_edit\\\",\\\"expense_update\\\",\\\"expense_delete\\\",\\\"expense_list\\\",\\\"expense_view\\\",\\\"expense_approve\\\",\\\"expense_invoice\\\",\\\"expense_pay\\\",\\\"transaction_menu\\\",\\\"transaction_create\\\",\\\"transaction_store\\\",\\\"transaction_edit\\\",\\\"transaction_update\\\",\\\"transaction_delete\\\",\\\"transaction_view\\\",\\\"transaction_list\\\",\\\"deposit_category_menu\\\",\\\"deposit_category_create\\\",\\\"deposit_category_store\\\",\\\"deposit_category_edit\\\",\\\"deposit_category_update\\\",\\\"deposit_category_delete\\\",\\\"deposit_category_list\\\",\\\"payment_method_menu\\\",\\\"payment_method_create\\\",\\\"payment_method_store\\\",\\\"payment_method_edit\\\",\\\"payment_method_update\\\",\\\"payment_method_delete\\\",\\\"payment_method_list\\\",\\\"project_menu\\\",\\\"project_create\\\",\\\"project_store\\\",\\\"project_edit\\\",\\\"project_update\\\",\\\"project_delete\\\",\\\"project_view\\\",\\\"project_list\\\",\\\"project_activity_view\\\",\\\"project_member_view\\\",\\\"project_member_delete\\\",\\\"project_complete\\\",\\\"project_payment\\\",\\\"project_invoice_view\\\",\\\"project_discussion_create\\\",\\\"project_discussion_store\\\",\\\"project_discussion_edit\\\",\\\"project_discussion_update\\\",\\\"project_discussion_delete\\\",\\\"project_discussion_view\\\",\\\"project_discussion_list\\\",\\\"project_discussion_comment\\\",\\\"project_discussion_reply\\\",\\\"project_file_create\\\",\\\"project_file_store\\\",\\\"project_file_edit\\\",\\\"project_file_update\\\",\\\"project_file_delete\\\",\\\"project_file_view\\\",\\\"project_file_list\\\",\\\"project_file_download\\\",\\\"project_file_comment\\\",\\\"project_file_reply\\\",\\\"project_notes_create\\\",\\\"project_notes_store\\\",\\\"project_notes_edit\\\",\\\"project_notes_update\\\",\\\"project_notes_delete\\\",\\\"project_notes_list\\\",\\\"client_menu\\\",\\\"client_create\\\",\\\"client_store\\\",\\\"client_edit\\\",\\\"client_update\\\",\\\"client_delete\\\",\\\"client_view\\\",\\\"client_list\\\",\\\"task_menu\\\",\\\"task_create\\\",\\\"task_store\\\",\\\"task_edit\\\",\\\"task_update\\\",\\\"task_delete\\\",\\\"task_view\\\",\\\"task_list\\\",\\\"task_activity_view\\\",\\\"task_assign_view\\\",\\\"task_assign_delete\\\",\\\"task_complete\\\",\\\"task_discussion_create\\\",\\\"task_discussion_store\\\",\\\"task_discussion_edit\\\",\\\"task_discussion_update\\\",\\\"task_discussion_delete\\\",\\\"task_discussion_view\\\",\\\"task_discussion_list\\\",\\\"task_discussion_comment\\\",\\\"task_discussion_reply\\\",\\\"task_file_create\\\",\\\"task_file_store\\\",\\\"task_file_edit\\\",\\\"task_file_update\\\",\\\"task_file_delete\\\",\\\"task_file_view\\\",\\\"task_file_list\\\",\\\"task_file_download\\\",\\\"task_file_comment\\\",\\\"task_file_reply\\\",\\\"task_notes_create\\\",\\\"task_notes_store\\\",\\\"task_notes_edit\\\",\\\"task_notes_update\\\",\\\"task_notes_delete\\\",\\\"task_notes_list\\\",\\\"task_files_comment\\\",\\\"award_type_menu\\\",\\\"award_type_create\\\",\\\"award_type_store\\\",\\\"award_type_edit\\\",\\\"award_type_update\\\",\\\"award_type_delete\\\",\\\"award_type_view\\\",\\\"award_type_list\\\",\\\"award_menu\\\",\\\"award_create\\\",\\\"award_store\\\",\\\"award_edit\\\",\\\"award_update\\\",\\\"award_delete\\\",\\\"award_list\\\",\\\"travel_type_menu\\\",\\\"travel_type_create\\\",\\\"travel_type_store\\\",\\\"travel_type_edit\\\",\\\"travel_type_update\\\",\\\"travel_type_delete\\\",\\\"travel_type_view\\\",\\\"travel_type_list\\\",\\\"travel_menu\\\",\\\"travel_create\\\",\\\"travel_store\\\",\\\"travel_edit\\\",\\\"travel_update\\\",\\\"travel_delete\\\",\\\"travel_list\\\",\\\"travel_approve\\\",\\\"travel_payment\\\",\\\"meeting_menu\\\",\\\"meeting_create\\\",\\\"meeting_store\\\",\\\"meeting_edit\\\",\\\"meeting_update\\\",\\\"meeting_delete\\\",\\\"meeting_list\\\",\\\"performance_menu\\\",\\\"performance_settings\\\",\\\"performance_indicator_menu\\\",\\\"performance_indicator_list\\\",\\\"performance_indicator_create\\\",\\\"performance_indicator_store\\\",\\\"performance_indicator_edit\\\",\\\"performance_indicator_update\\\",\\\"performance_indicator_delete\\\",\\\"performance_appraisal_menu\\\",\\\"performance_appraisal_create\\\",\\\"performance_appraisal_store\\\",\\\"performance_appraisal_edit\\\",\\\"performance_appraisal_update\\\",\\\"performance_appraisal_delete\\\",\\\"performance_appraisal_list\\\",\\\"performance_appraisal_view\\\",\\\"performance_goal_type_menu\\\",\\\"performance_goal_type_create\\\",\\\"performance_goal_type_store\\\",\\\"performance_goal_type_edit\\\",\\\"performance_goal_type_update\\\",\\\"performance_goal_type_delete\\\",\\\"performance_goal_type_list\\\",\\\"performance_goal_menu\\\",\\\"performance_goal_create\\\",\\\"performance_goal_store\\\",\\\"performance_goal_edit\\\",\\\"performance_goal_update\\\",\\\"performance_goal_delete\\\",\\\"performance_goal_view\\\",\\\"performance_goal_list\\\",\\\"performance_competence_type_list\\\",\\\"performance_competence_type_menu\\\",\\\"performance_competence_type_create\\\",\\\"performance_competence_type_store\\\",\\\"performance_competence_type_edit\\\",\\\"performance_competence_type_update\\\",\\\"performance_competence_type_delete\\\",\\\"performance_competence_type_view\\\",\\\"performance_competence_menu\\\",\\\"performance_competence_create\\\",\\\"performance_competence_store\\\",\\\"performance_competence_edit\\\",\\\"performance_competence_update\\\",\\\"performance_competence_delete\\\",\\\"performance_competence_view\\\",\\\"performance_competence_list\\\",\\\"app_settings_menu\\\",\\\"app_settings_update\\\",\\\"language_menu\\\",\\\"make_default\\\",\\\"conference_read\\\",\\\"general_settings_read\\\",\\\"general_settings_update\\\",\\\"email_settings_update\\\",\\\"storage_settings_update\\\",\\\"language_create\\\",\\\"language_store\\\",\\\"language_edit\\\",\\\"language_update\\\",\\\"language_delete\\\",\\\"setup_language\\\",\\\"content_menu\\\",\\\"content_create\\\",\\\"content_store\\\",\\\"content_edit\\\",\\\"content_update\\\",\\\"content_delete\\\",\\\"contact_menu\\\",\\\"contact_create\\\",\\\"contact_store\\\",\\\"contact_edit\\\",\\\"contact_update\\\",\\\"contact_delete\\\",\\\"conference_create\\\",\\\"conference_read\\\",\\\"conference_store\\\",\\\"conference_update\\\",\\\"conference_delete\\\",\\\"conference_join\\\",\\\"model_read\\\",\\\"model_create\\\",\\\"model_update\\\",\\\"model_delete\\\",\\\"brand_read\\\",\\\"brand_create\\\",\\\"brand_update\\\",\\\"brand_delete\\\",\\\"machine_read\\\",\\\"machine_create\\\",\\\"machine_update\\\",\\\"machine_delete\\\",\\\"package_read\\\",\\\"package_create\\\",\\\"package_update\\\",\\\"package_delete\\\",\\\"institution_read\\\",\\\"institution_create\\\",\\\"institution_update\\\",\\\"institution_delete\\\",\\\"addons_menu\\\",\\\"employee_document_type_read\\\",\\\"employee_document_type_create\\\",\\\"employee_document_type_update\\\",\\\"employee_document_type_delete\\\",\\\"employee_document_read\\\",\\\"employee_document_create\\\",\\\"employee_document_download\\\",\\\"announcement_menu\\\",\\\"notice_menu\\\",\\\"notice_list\\\",\\\"notice_create\\\",\\\"notice_update\\\",\\\"notice_edit\\\",\\\"notice_delete\\\",\\\"send_sms_menu\\\",\\\"send_sms_list\\\",\\\"send_sms_create\\\",\\\"send_sms_update\\\",\\\"send_sms_edit\\\",\\\"send_sms_delete\\\",\\\"send_email_menu\\\",\\\"send_email_list\\\",\\\"send_email_create\\\",\\\"send_email_update\\\",\\\"send_email_edit\\\",\\\"send_email_delete\\\",\\\"send_notification_menu\\\",\\\"send_notification_list\\\",\\\"send_notification_create\\\",\\\"send_notification_update\\\",\\\"send_notification_edit\\\",\\\"send_notification_delete\\\",\\\"announcement_menu\\\",\\\"notice_menu\\\",\\\"notice_list\\\",\\\"notice_create\\\",\\\"notice_update\\\",\\\"notice_edit\\\",\\\"notice_delete\\\",\\\"send_sms_menu\\\",\\\"send_sms_list\\\",\\\"send_sms_create\\\",\\\"send_sms_update\\\",\\\"send_sms_edit\\\",\\\"send_sms_delete\\\",\\\"send_email_menu\\\",\\\"send_email_list\\\",\\\"send_email_create\\\",\\\"send_email_update\\\",\\\"send_email_edit\\\",\\\"send_email_delete\\\",\\\"send_notification_menu\\\",\\\"send_notification_list\\\",\\\"send_notification_create\\\",\\\"send_notification_update\\\",\\\"send_notification_edit\\\",\\\"send_notification_delete\\\",\\\"support_menu\\\",\\\"support_read\\\",\\\"support_create\\\",\\\"support_reply\\\",\\\"support_delete\\\"]\"',NULL,NULL,'EMP-','On Probation',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'YojzWndSwW','verified','2024-02-06 05:41:55',NULL,'verified',NULL,'$2y$10$n.SQa/wak8aBlvwUX.NJ9e0Jg05CwkRM67ua0/PHgiJCHpCFG248y',NULL,NULL,1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'Islam',NULL,NULL,0.00,'Unmarried',NULL,NULL,1,0,0,0,0,0,'Asia/Dhaka','english',NULL,NULL,NULL,'cWheNjFgeY',NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55',1,1,NULL,NULL,NULL,NULL),
(2,223,'Admin1',NULL,1,NULL,'admin1@onesttech.com','01721xxxxxxxx','1',0,2,1,1,1,'\"[\\\"team_menu\\\",\\\"team_list\\\",\\\"team_create\\\",\\\"team_update\\\",\\\"team_edit\\\",\\\"team_delete\\\",\\\"team_member_view\\\",\\\"team_member_create\\\",\\\"team_member_edit\\\",\\\"team_member_delete\\\",\\\"team_member_assign\\\",\\\"team_member_unassign\\\",\\\"dashboard\\\",\\\"hr_menu\\\",\\\"designation_read\\\",\\\"designation_create\\\",\\\"designation_update\\\",\\\"designation_delete\\\",\\\"shift_read\\\",\\\"shift_create\\\",\\\"shift_update\\\",\\\"shift_delete\\\",\\\"department_read\\\",\\\"department_create\\\",\\\"department_update\\\",\\\"department_delete\\\",\\\"user_menu\\\",\\\"user_read\\\",\\\"profile_view\\\",\\\"user_create\\\",\\\"user_edit\\\",\\\"user_update\\\",\\\"user_delete\\\",\\\"user_banned\\\",\\\"user_unbanned\\\",\\\"make_hr\\\",\\\"user_permission\\\",\\\"profile_image_view\\\",\\\"user_device_list\\\",\\\"reset_device\\\",\\\"phonebook_profile\\\",\\\"support_ticket_profile\\\",\\\"advance_profile\\\",\\\"commission_profile\\\",\\\"salary_profile\\\",\\\"project_profile\\\",\\\"task_profile\\\",\\\"award_profile\\\",\\\"travel_profile\\\",\\\"attendance_profile\\\",\\\"appointment_profile\\\",\\\"visit_profile\\\",\\\"leave_request_profile\\\",\\\"notice_profile\\\",\\\"role_read\\\",\\\"role_create\\\",\\\"role_update\\\",\\\"role_delete\\\",\\\"branch_read\\\",\\\"branch_create\\\",\\\"branch_update\\\",\\\"branch_delete\\\",\\\"leave_menu\\\",\\\"leave_type_read\\\",\\\"leave_type_create\\\",\\\"leave_type_update\\\",\\\"leave_type_delete\\\",\\\"leave_assign_read\\\",\\\"leave_assign_create\\\",\\\"leave_assign_update\\\",\\\"leave_assign_delete\\\",\\\"leave_request_read\\\",\\\"leave_request_create\\\",\\\"leave_request_store\\\",\\\"leave_request_update\\\",\\\"leave_request_approve\\\",\\\"leave_request_reject\\\",\\\"leave_request_delete\\\",\\\"daily_leave_read\\\",\\\"appointment_read\\\",\\\"appointment_menu\\\",\\\"appointment_create\\\",\\\"appointment_approve\\\",\\\"appointment_reject\\\",\\\"appointment_delete\\\",\\\"weekend_read\\\",\\\"weekend_update\\\",\\\"attendance_update\\\",\\\"holiday_read\\\",\\\"holiday_create\\\",\\\"holiday_update\\\",\\\"holiday_delete\\\",\\\"schedule_read\\\",\\\"schedule_create\\\",\\\"schedule_update\\\",\\\"schedule_delete\\\",\\\"attendance_menu\\\",\\\"attendance_read\\\",\\\"attendance_create\\\",\\\"attendance_update\\\",\\\"attendance_delete\\\",\\\"generate_qr_code\\\",\\\"leave_settings_read\\\",\\\"leave_settings_update\\\",\\\"company_settings_read\\\",\\\"company_settings_update\\\",\\\"locationApi\\\",\\\"company_setup_menu\\\",\\\"company_setup_activation\\\",\\\"company_setup_configuration\\\",\\\"company_setup_ip_whitelist\\\",\\\"company_setup_location\\\",\\\"location_create\\\",\\\"location_store\\\",\\\"location_edit\\\",\\\"location_update\\\",\\\"location_delete\\\",\\\"ip_read\\\",\\\"ip_create\\\",\\\"ip_update\\\",\\\"ip_delete\\\",\\\"attendance_report_read\\\",\\\"live_tracking_read\\\",\\\"report_menu\\\",\\\"report\\\",\\\"claim_read\\\",\\\"claim_create\\\",\\\"claim_update\\\",\\\"claim_delete\\\",\\\"payment_read\\\",\\\"payment_create\\\",\\\"payment_update\\\",\\\"payment_delete\\\",\\\"visit_menu\\\",\\\"visit_read\\\",\\\"visit_view\\\",\\\"visit_update\\\",\\\"payroll_menu\\\",\\\"list_payroll_item\\\",\\\"create_payroll_item\\\",\\\"store_payroll_item\\\",\\\"update_payroll_item\\\",\\\"delete_payroll_item\\\",\\\"view_payroll_item\\\",\\\"payroll_item_menu\\\",\\\"list_payroll_set\\\",\\\"create_payroll_set\\\",\\\"store_payroll_set\\\",\\\"update_payroll_set\\\",\\\"delete_payroll_set\\\",\\\"view_payroll_set\\\",\\\"edit_payroll_set\\\",\\\"payroll_set_menu\\\",\\\"advance_salaries_menu\\\",\\\"advance_salaries_create\\\",\\\"advance_salaries_store\\\",\\\"advance_salaries_edit\\\",\\\"advance_salaries_update\\\",\\\"advance_salaries_delete\\\",\\\"advance_salaries_view\\\",\\\"advance_salaries_approve\\\",\\\"advance_salaries_list\\\",\\\"advance_salaries_pay\\\",\\\"advance_salaries_invoice\\\",\\\"advance_salaries_search\\\",\\\"payslip_menu\\\",\\\"salary_generate\\\",\\\"salary_view\\\",\\\"salary_delete\\\",\\\"salary_edit\\\",\\\"salary_update\\\",\\\"salary_payment\\\",\\\"payslip_list\\\",\\\"advance_type_menu\\\",\\\"advance_type_create\\\",\\\"advance_type_store\\\",\\\"advance_type_edit\\\",\\\"advance_type_update\\\",\\\"advance_type_delete\\\",\\\"advance_type_view\\\",\\\"advance_type_list\\\",\\\"salary_menu\\\",\\\"salary_store\\\",\\\"salary_edit\\\",\\\"salary_update\\\",\\\"salary_delete\\\",\\\"salary_view\\\",\\\"salary_list\\\",\\\"salary_search\\\",\\\"salary_pay\\\",\\\"salary_invoice\\\",\\\"salary_approve\\\",\\\"salary_generate\\\",\\\"salary_calculate\\\",\\\"account_menu\\\",\\\"account_create\\\",\\\"account_store\\\",\\\"account_edit\\\",\\\"account_update\\\",\\\"account_delete\\\",\\\"account_view\\\",\\\"account_list\\\",\\\"account_search\\\",\\\"deposit_menu\\\",\\\"deposit_create\\\",\\\"deposit_store\\\",\\\"deposit_edit\\\",\\\"deposit_update\\\",\\\"deposit_delete\\\",\\\"deposit_list\\\",\\\"expense_menu\\\",\\\"expense_create\\\",\\\"expense_store\\\",\\\"expense_edit\\\",\\\"expense_update\\\",\\\"expense_delete\\\",\\\"expense_list\\\",\\\"expense_view\\\",\\\"expense_approve\\\",\\\"expense_invoice\\\",\\\"expense_pay\\\",\\\"transaction_menu\\\",\\\"transaction_create\\\",\\\"transaction_store\\\",\\\"transaction_edit\\\",\\\"transaction_update\\\",\\\"transaction_delete\\\",\\\"transaction_view\\\",\\\"transaction_list\\\",\\\"deposit_category_menu\\\",\\\"deposit_category_create\\\",\\\"deposit_category_store\\\",\\\"deposit_category_edit\\\",\\\"deposit_category_update\\\",\\\"deposit_category_delete\\\",\\\"deposit_category_list\\\",\\\"payment_method_menu\\\",\\\"payment_method_create\\\",\\\"payment_method_store\\\",\\\"payment_method_edit\\\",\\\"payment_method_update\\\",\\\"payment_method_delete\\\",\\\"payment_method_list\\\",\\\"project_menu\\\",\\\"project_create\\\",\\\"project_store\\\",\\\"project_edit\\\",\\\"project_update\\\",\\\"project_delete\\\",\\\"project_view\\\",\\\"project_list\\\",\\\"project_activity_view\\\",\\\"project_member_view\\\",\\\"project_member_delete\\\",\\\"project_complete\\\",\\\"project_payment\\\",\\\"project_invoice_view\\\",\\\"project_discussion_create\\\",\\\"project_discussion_store\\\",\\\"project_discussion_edit\\\",\\\"project_discussion_update\\\",\\\"project_discussion_delete\\\",\\\"project_discussion_view\\\",\\\"project_discussion_list\\\",\\\"project_discussion_comment\\\",\\\"project_discussion_reply\\\",\\\"project_file_create\\\",\\\"project_file_store\\\",\\\"project_file_edit\\\",\\\"project_file_update\\\",\\\"project_file_delete\\\",\\\"project_file_view\\\",\\\"project_file_list\\\",\\\"project_file_download\\\",\\\"project_file_comment\\\",\\\"project_file_reply\\\",\\\"project_notes_create\\\",\\\"project_notes_store\\\",\\\"project_notes_edit\\\",\\\"project_notes_update\\\",\\\"project_notes_delete\\\",\\\"project_notes_list\\\",\\\"client_menu\\\",\\\"client_create\\\",\\\"client_store\\\",\\\"client_edit\\\",\\\"client_update\\\",\\\"client_delete\\\",\\\"client_view\\\",\\\"client_list\\\",\\\"task_menu\\\",\\\"task_create\\\",\\\"task_store\\\",\\\"task_edit\\\",\\\"task_update\\\",\\\"task_delete\\\",\\\"task_view\\\",\\\"task_list\\\",\\\"task_activity_view\\\",\\\"task_assign_view\\\",\\\"task_assign_delete\\\",\\\"task_complete\\\",\\\"task_discussion_create\\\",\\\"task_discussion_store\\\",\\\"task_discussion_edit\\\",\\\"task_discussion_update\\\",\\\"task_discussion_delete\\\",\\\"task_discussion_view\\\",\\\"task_discussion_list\\\",\\\"task_discussion_comment\\\",\\\"task_discussion_reply\\\",\\\"task_file_create\\\",\\\"task_file_store\\\",\\\"task_file_edit\\\",\\\"task_file_update\\\",\\\"task_file_delete\\\",\\\"task_file_view\\\",\\\"task_file_list\\\",\\\"task_file_download\\\",\\\"task_file_comment\\\",\\\"task_file_reply\\\",\\\"task_notes_create\\\",\\\"task_notes_store\\\",\\\"task_notes_edit\\\",\\\"task_notes_update\\\",\\\"task_notes_delete\\\",\\\"task_notes_list\\\",\\\"task_files_comment\\\",\\\"award_type_menu\\\",\\\"award_type_create\\\",\\\"award_type_store\\\",\\\"award_type_edit\\\",\\\"award_type_update\\\",\\\"award_type_delete\\\",\\\"award_type_view\\\",\\\"award_type_list\\\",\\\"award_menu\\\",\\\"award_create\\\",\\\"award_store\\\",\\\"award_edit\\\",\\\"award_update\\\",\\\"award_delete\\\",\\\"award_list\\\",\\\"travel_type_menu\\\",\\\"travel_type_create\\\",\\\"travel_type_store\\\",\\\"travel_type_edit\\\",\\\"travel_type_update\\\",\\\"travel_type_delete\\\",\\\"travel_type_view\\\",\\\"travel_type_list\\\",\\\"travel_menu\\\",\\\"travel_create\\\",\\\"travel_store\\\",\\\"travel_edit\\\",\\\"travel_update\\\",\\\"travel_delete\\\",\\\"travel_list\\\",\\\"travel_approve\\\",\\\"travel_payment\\\",\\\"meeting_menu\\\",\\\"meeting_create\\\",\\\"meeting_store\\\",\\\"meeting_edit\\\",\\\"meeting_update\\\",\\\"meeting_delete\\\",\\\"meeting_list\\\",\\\"performance_menu\\\",\\\"performance_settings\\\",\\\"performance_indicator_menu\\\",\\\"performance_indicator_list\\\",\\\"performance_indicator_create\\\",\\\"performance_indicator_store\\\",\\\"performance_indicator_edit\\\",\\\"performance_indicator_update\\\",\\\"performance_indicator_delete\\\",\\\"performance_appraisal_menu\\\",\\\"performance_appraisal_create\\\",\\\"performance_appraisal_store\\\",\\\"performance_appraisal_edit\\\",\\\"performance_appraisal_update\\\",\\\"performance_appraisal_delete\\\",\\\"performance_appraisal_list\\\",\\\"performance_appraisal_view\\\",\\\"performance_goal_type_menu\\\",\\\"performance_goal_type_create\\\",\\\"performance_goal_type_store\\\",\\\"performance_goal_type_edit\\\",\\\"performance_goal_type_update\\\",\\\"performance_goal_type_delete\\\",\\\"performance_goal_type_list\\\",\\\"performance_goal_menu\\\",\\\"performance_goal_create\\\",\\\"performance_goal_store\\\",\\\"performance_goal_edit\\\",\\\"performance_goal_update\\\",\\\"performance_goal_delete\\\",\\\"performance_goal_view\\\",\\\"performance_goal_list\\\",\\\"performance_competence_type_list\\\",\\\"performance_competence_type_menu\\\",\\\"performance_competence_type_create\\\",\\\"performance_competence_type_store\\\",\\\"performance_competence_type_edit\\\",\\\"performance_competence_type_update\\\",\\\"performance_competence_type_delete\\\",\\\"performance_competence_type_view\\\",\\\"performance_competence_menu\\\",\\\"performance_competence_create\\\",\\\"performance_competence_store\\\",\\\"performance_competence_edit\\\",\\\"performance_competence_update\\\",\\\"performance_competence_delete\\\",\\\"performance_competence_view\\\",\\\"performance_competence_list\\\",\\\"app_settings_menu\\\",\\\"app_settings_update\\\",\\\"language_menu\\\",\\\"make_default\\\",\\\"conference_read\\\",\\\"general_settings_read\\\",\\\"general_settings_update\\\",\\\"email_settings_update\\\",\\\"storage_settings_update\\\",\\\"language_create\\\",\\\"language_store\\\",\\\"language_edit\\\",\\\"language_update\\\",\\\"language_delete\\\",\\\"setup_language\\\",\\\"content_menu\\\",\\\"content_create\\\",\\\"content_store\\\",\\\"content_edit\\\",\\\"content_update\\\",\\\"content_delete\\\",\\\"contact_menu\\\",\\\"contact_create\\\",\\\"contact_store\\\",\\\"contact_edit\\\",\\\"contact_update\\\",\\\"contact_delete\\\",\\\"conference_create\\\",\\\"conference_read\\\",\\\"conference_store\\\",\\\"conference_update\\\",\\\"conference_delete\\\",\\\"conference_join\\\",\\\"model_read\\\",\\\"model_create\\\",\\\"model_update\\\",\\\"model_delete\\\",\\\"brand_read\\\",\\\"brand_create\\\",\\\"brand_update\\\",\\\"brand_delete\\\",\\\"machine_read\\\",\\\"machine_create\\\",\\\"machine_update\\\",\\\"machine_delete\\\",\\\"package_read\\\",\\\"package_create\\\",\\\"package_update\\\",\\\"package_delete\\\",\\\"institution_read\\\",\\\"institution_create\\\",\\\"institution_update\\\",\\\"institution_delete\\\",\\\"addons_menu\\\",\\\"employee_document_type_read\\\",\\\"employee_document_type_create\\\",\\\"employee_document_type_update\\\",\\\"employee_document_type_delete\\\",\\\"employee_document_read\\\",\\\"employee_document_create\\\",\\\"employee_document_download\\\",\\\"announcement_menu\\\",\\\"notice_menu\\\",\\\"notice_list\\\",\\\"notice_create\\\",\\\"notice_update\\\",\\\"notice_edit\\\",\\\"notice_delete\\\",\\\"send_sms_menu\\\",\\\"send_sms_list\\\",\\\"send_sms_create\\\",\\\"send_sms_update\\\",\\\"send_sms_edit\\\",\\\"send_sms_delete\\\",\\\"send_email_menu\\\",\\\"send_email_list\\\",\\\"send_email_create\\\",\\\"send_email_update\\\",\\\"send_email_edit\\\",\\\"send_email_delete\\\",\\\"send_notification_menu\\\",\\\"send_notification_list\\\",\\\"send_notification_create\\\",\\\"send_notification_update\\\",\\\"send_notification_edit\\\",\\\"send_notification_delete\\\",\\\"announcement_menu\\\",\\\"notice_menu\\\",\\\"notice_list\\\",\\\"notice_create\\\",\\\"notice_update\\\",\\\"notice_edit\\\",\\\"notice_delete\\\",\\\"send_sms_menu\\\",\\\"send_sms_list\\\",\\\"send_sms_create\\\",\\\"send_sms_update\\\",\\\"send_sms_edit\\\",\\\"send_sms_delete\\\",\\\"send_email_menu\\\",\\\"send_email_list\\\",\\\"send_email_create\\\",\\\"send_email_update\\\",\\\"send_email_edit\\\",\\\"send_email_delete\\\",\\\"send_notification_menu\\\",\\\"send_notification_list\\\",\\\"send_notification_create\\\",\\\"send_notification_update\\\",\\\"send_notification_edit\\\",\\\"send_notification_delete\\\",\\\"support_menu\\\",\\\"support_read\\\",\\\"support_create\\\",\\\"support_reply\\\",\\\"support_delete\\\"]\"',NULL,NULL,'EMP-','On Probation',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'9yiTVKCCyB','verified','2024-02-06 05:41:55',NULL,'verified',NULL,'$2y$10$VJT4w9Kc5eOSJjkZpfDdwumF15SdbUQxnNMiYl81tSVWKTS.GGfti',NULL,NULL,1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'Islam',NULL,NULL,0.00,'Unmarried',NULL,NULL,1,0,0,0,0,0,'Asia/Dhaka','english',NULL,NULL,NULL,'EHl9eblMpb',NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55',1,1,NULL,NULL,NULL,NULL),
(3,223,'Admin2',NULL,1,NULL,'admin2@onesttech.com','01722xxxxxxxx','1',0,2,1,1,1,'\"[\\\"team_menu\\\",\\\"team_list\\\",\\\"team_create\\\",\\\"team_update\\\",\\\"team_edit\\\",\\\"team_delete\\\",\\\"team_member_view\\\",\\\"team_member_create\\\",\\\"team_member_edit\\\",\\\"team_member_delete\\\",\\\"team_member_assign\\\",\\\"team_member_unassign\\\",\\\"dashboard\\\",\\\"hr_menu\\\",\\\"designation_read\\\",\\\"designation_create\\\",\\\"designation_update\\\",\\\"designation_delete\\\",\\\"shift_read\\\",\\\"shift_create\\\",\\\"shift_update\\\",\\\"shift_delete\\\",\\\"department_read\\\",\\\"department_create\\\",\\\"department_update\\\",\\\"department_delete\\\",\\\"user_menu\\\",\\\"user_read\\\",\\\"profile_view\\\",\\\"user_create\\\",\\\"user_edit\\\",\\\"user_update\\\",\\\"user_delete\\\",\\\"user_banned\\\",\\\"user_unbanned\\\",\\\"make_hr\\\",\\\"user_permission\\\",\\\"profile_image_view\\\",\\\"user_device_list\\\",\\\"reset_device\\\",\\\"phonebook_profile\\\",\\\"support_ticket_profile\\\",\\\"advance_profile\\\",\\\"commission_profile\\\",\\\"salary_profile\\\",\\\"project_profile\\\",\\\"task_profile\\\",\\\"award_profile\\\",\\\"travel_profile\\\",\\\"attendance_profile\\\",\\\"appointment_profile\\\",\\\"visit_profile\\\",\\\"leave_request_profile\\\",\\\"notice_profile\\\",\\\"role_read\\\",\\\"role_create\\\",\\\"role_update\\\",\\\"role_delete\\\",\\\"branch_read\\\",\\\"branch_create\\\",\\\"branch_update\\\",\\\"branch_delete\\\",\\\"leave_menu\\\",\\\"leave_type_read\\\",\\\"leave_type_create\\\",\\\"leave_type_update\\\",\\\"leave_type_delete\\\",\\\"leave_assign_read\\\",\\\"leave_assign_create\\\",\\\"leave_assign_update\\\",\\\"leave_assign_delete\\\",\\\"leave_request_read\\\",\\\"leave_request_create\\\",\\\"leave_request_store\\\",\\\"leave_request_update\\\",\\\"leave_request_approve\\\",\\\"leave_request_reject\\\",\\\"leave_request_delete\\\",\\\"daily_leave_read\\\",\\\"appointment_read\\\",\\\"appointment_menu\\\",\\\"appointment_create\\\",\\\"appointment_approve\\\",\\\"appointment_reject\\\",\\\"appointment_delete\\\",\\\"weekend_read\\\",\\\"weekend_update\\\",\\\"attendance_update\\\",\\\"holiday_read\\\",\\\"holiday_create\\\",\\\"holiday_update\\\",\\\"holiday_delete\\\",\\\"schedule_read\\\",\\\"schedule_create\\\",\\\"schedule_update\\\",\\\"schedule_delete\\\",\\\"attendance_menu\\\",\\\"attendance_read\\\",\\\"attendance_create\\\",\\\"attendance_update\\\",\\\"attendance_delete\\\",\\\"generate_qr_code\\\",\\\"leave_settings_read\\\",\\\"leave_settings_update\\\",\\\"company_settings_read\\\",\\\"company_settings_update\\\",\\\"locationApi\\\",\\\"company_setup_menu\\\",\\\"company_setup_activation\\\",\\\"company_setup_configuration\\\",\\\"company_setup_ip_whitelist\\\",\\\"company_setup_location\\\",\\\"location_create\\\",\\\"location_store\\\",\\\"location_edit\\\",\\\"location_update\\\",\\\"location_delete\\\",\\\"ip_read\\\",\\\"ip_create\\\",\\\"ip_update\\\",\\\"ip_delete\\\",\\\"attendance_report_read\\\",\\\"live_tracking_read\\\",\\\"report_menu\\\",\\\"report\\\",\\\"claim_read\\\",\\\"claim_create\\\",\\\"claim_update\\\",\\\"claim_delete\\\",\\\"payment_read\\\",\\\"payment_create\\\",\\\"payment_update\\\",\\\"payment_delete\\\",\\\"visit_menu\\\",\\\"visit_read\\\",\\\"visit_view\\\",\\\"visit_update\\\",\\\"payroll_menu\\\",\\\"list_payroll_item\\\",\\\"create_payroll_item\\\",\\\"store_payroll_item\\\",\\\"update_payroll_item\\\",\\\"delete_payroll_item\\\",\\\"view_payroll_item\\\",\\\"payroll_item_menu\\\",\\\"list_payroll_set\\\",\\\"create_payroll_set\\\",\\\"store_payroll_set\\\",\\\"update_payroll_set\\\",\\\"delete_payroll_set\\\",\\\"view_payroll_set\\\",\\\"edit_payroll_set\\\",\\\"payroll_set_menu\\\",\\\"advance_salaries_menu\\\",\\\"advance_salaries_create\\\",\\\"advance_salaries_store\\\",\\\"advance_salaries_edit\\\",\\\"advance_salaries_update\\\",\\\"advance_salaries_delete\\\",\\\"advance_salaries_view\\\",\\\"advance_salaries_approve\\\",\\\"advance_salaries_list\\\",\\\"advance_salaries_pay\\\",\\\"advance_salaries_invoice\\\",\\\"advance_salaries_search\\\",\\\"payslip_menu\\\",\\\"salary_generate\\\",\\\"salary_view\\\",\\\"salary_delete\\\",\\\"salary_edit\\\",\\\"salary_update\\\",\\\"salary_payment\\\",\\\"payslip_list\\\",\\\"advance_type_menu\\\",\\\"advance_type_create\\\",\\\"advance_type_store\\\",\\\"advance_type_edit\\\",\\\"advance_type_update\\\",\\\"advance_type_delete\\\",\\\"advance_type_view\\\",\\\"advance_type_list\\\",\\\"salary_menu\\\",\\\"salary_store\\\",\\\"salary_edit\\\",\\\"salary_update\\\",\\\"salary_delete\\\",\\\"salary_view\\\",\\\"salary_list\\\",\\\"salary_search\\\",\\\"salary_pay\\\",\\\"salary_invoice\\\",\\\"salary_approve\\\",\\\"salary_generate\\\",\\\"salary_calculate\\\",\\\"account_menu\\\",\\\"account_create\\\",\\\"account_store\\\",\\\"account_edit\\\",\\\"account_update\\\",\\\"account_delete\\\",\\\"account_view\\\",\\\"account_list\\\",\\\"account_search\\\",\\\"deposit_menu\\\",\\\"deposit_create\\\",\\\"deposit_store\\\",\\\"deposit_edit\\\",\\\"deposit_update\\\",\\\"deposit_delete\\\",\\\"deposit_list\\\",\\\"expense_menu\\\",\\\"expense_create\\\",\\\"expense_store\\\",\\\"expense_edit\\\",\\\"expense_update\\\",\\\"expense_delete\\\",\\\"expense_list\\\",\\\"expense_view\\\",\\\"expense_approve\\\",\\\"expense_invoice\\\",\\\"expense_pay\\\",\\\"transaction_menu\\\",\\\"transaction_create\\\",\\\"transaction_store\\\",\\\"transaction_edit\\\",\\\"transaction_update\\\",\\\"transaction_delete\\\",\\\"transaction_view\\\",\\\"transaction_list\\\",\\\"deposit_category_menu\\\",\\\"deposit_category_create\\\",\\\"deposit_category_store\\\",\\\"deposit_category_edit\\\",\\\"deposit_category_update\\\",\\\"deposit_category_delete\\\",\\\"deposit_category_list\\\",\\\"payment_method_menu\\\",\\\"payment_method_create\\\",\\\"payment_method_store\\\",\\\"payment_method_edit\\\",\\\"payment_method_update\\\",\\\"payment_method_delete\\\",\\\"payment_method_list\\\",\\\"project_menu\\\",\\\"project_create\\\",\\\"project_store\\\",\\\"project_edit\\\",\\\"project_update\\\",\\\"project_delete\\\",\\\"project_view\\\",\\\"project_list\\\",\\\"project_activity_view\\\",\\\"project_member_view\\\",\\\"project_member_delete\\\",\\\"project_complete\\\",\\\"project_payment\\\",\\\"project_invoice_view\\\",\\\"project_discussion_create\\\",\\\"project_discussion_store\\\",\\\"project_discussion_edit\\\",\\\"project_discussion_update\\\",\\\"project_discussion_delete\\\",\\\"project_discussion_view\\\",\\\"project_discussion_list\\\",\\\"project_discussion_comment\\\",\\\"project_discussion_reply\\\",\\\"project_file_create\\\",\\\"project_file_store\\\",\\\"project_file_edit\\\",\\\"project_file_update\\\",\\\"project_file_delete\\\",\\\"project_file_view\\\",\\\"project_file_list\\\",\\\"project_file_download\\\",\\\"project_file_comment\\\",\\\"project_file_reply\\\",\\\"project_notes_create\\\",\\\"project_notes_store\\\",\\\"project_notes_edit\\\",\\\"project_notes_update\\\",\\\"project_notes_delete\\\",\\\"project_notes_list\\\",\\\"client_menu\\\",\\\"client_create\\\",\\\"client_store\\\",\\\"client_edit\\\",\\\"client_update\\\",\\\"client_delete\\\",\\\"client_view\\\",\\\"client_list\\\",\\\"task_menu\\\",\\\"task_create\\\",\\\"task_store\\\",\\\"task_edit\\\",\\\"task_update\\\",\\\"task_delete\\\",\\\"task_view\\\",\\\"task_list\\\",\\\"task_activity_view\\\",\\\"task_assign_view\\\",\\\"task_assign_delete\\\",\\\"task_complete\\\",\\\"task_discussion_create\\\",\\\"task_discussion_store\\\",\\\"task_discussion_edit\\\",\\\"task_discussion_update\\\",\\\"task_discussion_delete\\\",\\\"task_discussion_view\\\",\\\"task_discussion_list\\\",\\\"task_discussion_comment\\\",\\\"task_discussion_reply\\\",\\\"task_file_create\\\",\\\"task_file_store\\\",\\\"task_file_edit\\\",\\\"task_file_update\\\",\\\"task_file_delete\\\",\\\"task_file_view\\\",\\\"task_file_list\\\",\\\"task_file_download\\\",\\\"task_file_comment\\\",\\\"task_file_reply\\\",\\\"task_notes_create\\\",\\\"task_notes_store\\\",\\\"task_notes_edit\\\",\\\"task_notes_update\\\",\\\"task_notes_delete\\\",\\\"task_notes_list\\\",\\\"task_files_comment\\\",\\\"award_type_menu\\\",\\\"award_type_create\\\",\\\"award_type_store\\\",\\\"award_type_edit\\\",\\\"award_type_update\\\",\\\"award_type_delete\\\",\\\"award_type_view\\\",\\\"award_type_list\\\",\\\"award_menu\\\",\\\"award_create\\\",\\\"award_store\\\",\\\"award_edit\\\",\\\"award_update\\\",\\\"award_delete\\\",\\\"award_list\\\",\\\"travel_type_menu\\\",\\\"travel_type_create\\\",\\\"travel_type_store\\\",\\\"travel_type_edit\\\",\\\"travel_type_update\\\",\\\"travel_type_delete\\\",\\\"travel_type_view\\\",\\\"travel_type_list\\\",\\\"travel_menu\\\",\\\"travel_create\\\",\\\"travel_store\\\",\\\"travel_edit\\\",\\\"travel_update\\\",\\\"travel_delete\\\",\\\"travel_list\\\",\\\"travel_approve\\\",\\\"travel_payment\\\",\\\"meeting_menu\\\",\\\"meeting_create\\\",\\\"meeting_store\\\",\\\"meeting_edit\\\",\\\"meeting_update\\\",\\\"meeting_delete\\\",\\\"meeting_list\\\",\\\"performance_menu\\\",\\\"performance_settings\\\",\\\"performance_indicator_menu\\\",\\\"performance_indicator_list\\\",\\\"performance_indicator_create\\\",\\\"performance_indicator_store\\\",\\\"performance_indicator_edit\\\",\\\"performance_indicator_update\\\",\\\"performance_indicator_delete\\\",\\\"performance_appraisal_menu\\\",\\\"performance_appraisal_create\\\",\\\"performance_appraisal_store\\\",\\\"performance_appraisal_edit\\\",\\\"performance_appraisal_update\\\",\\\"performance_appraisal_delete\\\",\\\"performance_appraisal_list\\\",\\\"performance_appraisal_view\\\",\\\"performance_goal_type_menu\\\",\\\"performance_goal_type_create\\\",\\\"performance_goal_type_store\\\",\\\"performance_goal_type_edit\\\",\\\"performance_goal_type_update\\\",\\\"performance_goal_type_delete\\\",\\\"performance_goal_type_list\\\",\\\"performance_goal_menu\\\",\\\"performance_goal_create\\\",\\\"performance_goal_store\\\",\\\"performance_goal_edit\\\",\\\"performance_goal_update\\\",\\\"performance_goal_delete\\\",\\\"performance_goal_view\\\",\\\"performance_goal_list\\\",\\\"performance_competence_type_list\\\",\\\"performance_competence_type_menu\\\",\\\"performance_competence_type_create\\\",\\\"performance_competence_type_store\\\",\\\"performance_competence_type_edit\\\",\\\"performance_competence_type_update\\\",\\\"performance_competence_type_delete\\\",\\\"performance_competence_type_view\\\",\\\"performance_competence_menu\\\",\\\"performance_competence_create\\\",\\\"performance_competence_store\\\",\\\"performance_competence_edit\\\",\\\"performance_competence_update\\\",\\\"performance_competence_delete\\\",\\\"performance_competence_view\\\",\\\"performance_competence_list\\\",\\\"app_settings_menu\\\",\\\"app_settings_update\\\",\\\"language_menu\\\",\\\"make_default\\\",\\\"conference_read\\\",\\\"general_settings_read\\\",\\\"general_settings_update\\\",\\\"email_settings_update\\\",\\\"storage_settings_update\\\",\\\"language_create\\\",\\\"language_store\\\",\\\"language_edit\\\",\\\"language_update\\\",\\\"language_delete\\\",\\\"setup_language\\\",\\\"content_menu\\\",\\\"content_create\\\",\\\"content_store\\\",\\\"content_edit\\\",\\\"content_update\\\",\\\"content_delete\\\",\\\"contact_menu\\\",\\\"contact_create\\\",\\\"contact_store\\\",\\\"contact_edit\\\",\\\"contact_update\\\",\\\"contact_delete\\\",\\\"conference_create\\\",\\\"conference_read\\\",\\\"conference_store\\\",\\\"conference_update\\\",\\\"conference_delete\\\",\\\"conference_join\\\",\\\"model_read\\\",\\\"model_create\\\",\\\"model_update\\\",\\\"model_delete\\\",\\\"brand_read\\\",\\\"brand_create\\\",\\\"brand_update\\\",\\\"brand_delete\\\",\\\"machine_read\\\",\\\"machine_create\\\",\\\"machine_update\\\",\\\"machine_delete\\\",\\\"package_read\\\",\\\"package_create\\\",\\\"package_update\\\",\\\"package_delete\\\",\\\"institution_read\\\",\\\"institution_create\\\",\\\"institution_update\\\",\\\"institution_delete\\\",\\\"addons_menu\\\",\\\"employee_document_type_read\\\",\\\"employee_document_type_create\\\",\\\"employee_document_type_update\\\",\\\"employee_document_type_delete\\\",\\\"employee_document_read\\\",\\\"employee_document_create\\\",\\\"employee_document_download\\\",\\\"announcement_menu\\\",\\\"notice_menu\\\",\\\"notice_list\\\",\\\"notice_create\\\",\\\"notice_update\\\",\\\"notice_edit\\\",\\\"notice_delete\\\",\\\"send_sms_menu\\\",\\\"send_sms_list\\\",\\\"send_sms_create\\\",\\\"send_sms_update\\\",\\\"send_sms_edit\\\",\\\"send_sms_delete\\\",\\\"send_email_menu\\\",\\\"send_email_list\\\",\\\"send_email_create\\\",\\\"send_email_update\\\",\\\"send_email_edit\\\",\\\"send_email_delete\\\",\\\"send_notification_menu\\\",\\\"send_notification_list\\\",\\\"send_notification_create\\\",\\\"send_notification_update\\\",\\\"send_notification_edit\\\",\\\"send_notification_delete\\\",\\\"announcement_menu\\\",\\\"notice_menu\\\",\\\"notice_list\\\",\\\"notice_create\\\",\\\"notice_update\\\",\\\"notice_edit\\\",\\\"notice_delete\\\",\\\"send_sms_menu\\\",\\\"send_sms_list\\\",\\\"send_sms_create\\\",\\\"send_sms_update\\\",\\\"send_sms_edit\\\",\\\"send_sms_delete\\\",\\\"send_email_menu\\\",\\\"send_email_list\\\",\\\"send_email_create\\\",\\\"send_email_update\\\",\\\"send_email_edit\\\",\\\"send_email_delete\\\",\\\"send_notification_menu\\\",\\\"send_notification_list\\\",\\\"send_notification_create\\\",\\\"send_notification_update\\\",\\\"send_notification_edit\\\",\\\"send_notification_delete\\\",\\\"support_menu\\\",\\\"support_read\\\",\\\"support_create\\\",\\\"support_reply\\\",\\\"support_delete\\\"]\"',NULL,NULL,'EMP-','On Probation',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'O1cwywf06f','verified','2024-02-06 05:41:55',NULL,'verified',NULL,'$2y$10$vt1HQToypfTh4sqkW1XeJ.E2buVu7jr07j1WaJkndWxOi5paaYfpa',NULL,NULL,1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'Islam',NULL,NULL,0.00,'Unmarried',NULL,NULL,1,0,0,0,0,0,'Asia/Dhaka','english',NULL,NULL,NULL,'ZbEsUtlVsb',NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55',1,1,NULL,NULL,NULL,NULL),
(4,223,'Admin3',NULL,1,NULL,'admin3@onesttech.com','01723xxxxxxxx','1',0,2,1,1,1,'\"[\\\"team_menu\\\",\\\"team_list\\\",\\\"team_create\\\",\\\"team_update\\\",\\\"team_edit\\\",\\\"team_delete\\\",\\\"team_member_view\\\",\\\"team_member_create\\\",\\\"team_member_edit\\\",\\\"team_member_delete\\\",\\\"team_member_assign\\\",\\\"team_member_unassign\\\",\\\"dashboard\\\",\\\"hr_menu\\\",\\\"designation_read\\\",\\\"designation_create\\\",\\\"designation_update\\\",\\\"designation_delete\\\",\\\"shift_read\\\",\\\"shift_create\\\",\\\"shift_update\\\",\\\"shift_delete\\\",\\\"department_read\\\",\\\"department_create\\\",\\\"department_update\\\",\\\"department_delete\\\",\\\"user_menu\\\",\\\"user_read\\\",\\\"profile_view\\\",\\\"user_create\\\",\\\"user_edit\\\",\\\"user_update\\\",\\\"user_delete\\\",\\\"user_banned\\\",\\\"user_unbanned\\\",\\\"make_hr\\\",\\\"user_permission\\\",\\\"profile_image_view\\\",\\\"user_device_list\\\",\\\"reset_device\\\",\\\"phonebook_profile\\\",\\\"support_ticket_profile\\\",\\\"advance_profile\\\",\\\"commission_profile\\\",\\\"salary_profile\\\",\\\"project_profile\\\",\\\"task_profile\\\",\\\"award_profile\\\",\\\"travel_profile\\\",\\\"attendance_profile\\\",\\\"appointment_profile\\\",\\\"visit_profile\\\",\\\"leave_request_profile\\\",\\\"notice_profile\\\",\\\"role_read\\\",\\\"role_create\\\",\\\"role_update\\\",\\\"role_delete\\\",\\\"branch_read\\\",\\\"branch_create\\\",\\\"branch_update\\\",\\\"branch_delete\\\",\\\"leave_menu\\\",\\\"leave_type_read\\\",\\\"leave_type_create\\\",\\\"leave_type_update\\\",\\\"leave_type_delete\\\",\\\"leave_assign_read\\\",\\\"leave_assign_create\\\",\\\"leave_assign_update\\\",\\\"leave_assign_delete\\\",\\\"leave_request_read\\\",\\\"leave_request_create\\\",\\\"leave_request_store\\\",\\\"leave_request_update\\\",\\\"leave_request_approve\\\",\\\"leave_request_reject\\\",\\\"leave_request_delete\\\",\\\"daily_leave_read\\\",\\\"appointment_read\\\",\\\"appointment_menu\\\",\\\"appointment_create\\\",\\\"appointment_approve\\\",\\\"appointment_reject\\\",\\\"appointment_delete\\\",\\\"weekend_read\\\",\\\"weekend_update\\\",\\\"attendance_update\\\",\\\"holiday_read\\\",\\\"holiday_create\\\",\\\"holiday_update\\\",\\\"holiday_delete\\\",\\\"schedule_read\\\",\\\"schedule_create\\\",\\\"schedule_update\\\",\\\"schedule_delete\\\",\\\"attendance_menu\\\",\\\"attendance_read\\\",\\\"attendance_create\\\",\\\"attendance_update\\\",\\\"attendance_delete\\\",\\\"generate_qr_code\\\",\\\"leave_settings_read\\\",\\\"leave_settings_update\\\",\\\"company_settings_read\\\",\\\"company_settings_update\\\",\\\"locationApi\\\",\\\"company_setup_menu\\\",\\\"company_setup_activation\\\",\\\"company_setup_configuration\\\",\\\"company_setup_ip_whitelist\\\",\\\"company_setup_location\\\",\\\"location_create\\\",\\\"location_store\\\",\\\"location_edit\\\",\\\"location_update\\\",\\\"location_delete\\\",\\\"ip_read\\\",\\\"ip_create\\\",\\\"ip_update\\\",\\\"ip_delete\\\",\\\"attendance_report_read\\\",\\\"live_tracking_read\\\",\\\"report_menu\\\",\\\"report\\\",\\\"claim_read\\\",\\\"claim_create\\\",\\\"claim_update\\\",\\\"claim_delete\\\",\\\"payment_read\\\",\\\"payment_create\\\",\\\"payment_update\\\",\\\"payment_delete\\\",\\\"visit_menu\\\",\\\"visit_read\\\",\\\"visit_view\\\",\\\"visit_update\\\",\\\"payroll_menu\\\",\\\"list_payroll_item\\\",\\\"create_payroll_item\\\",\\\"store_payroll_item\\\",\\\"update_payroll_item\\\",\\\"delete_payroll_item\\\",\\\"view_payroll_item\\\",\\\"payroll_item_menu\\\",\\\"list_payroll_set\\\",\\\"create_payroll_set\\\",\\\"store_payroll_set\\\",\\\"update_payroll_set\\\",\\\"delete_payroll_set\\\",\\\"view_payroll_set\\\",\\\"edit_payroll_set\\\",\\\"payroll_set_menu\\\",\\\"advance_salaries_menu\\\",\\\"advance_salaries_create\\\",\\\"advance_salaries_store\\\",\\\"advance_salaries_edit\\\",\\\"advance_salaries_update\\\",\\\"advance_salaries_delete\\\",\\\"advance_salaries_view\\\",\\\"advance_salaries_approve\\\",\\\"advance_salaries_list\\\",\\\"advance_salaries_pay\\\",\\\"advance_salaries_invoice\\\",\\\"advance_salaries_search\\\",\\\"payslip_menu\\\",\\\"salary_generate\\\",\\\"salary_view\\\",\\\"salary_delete\\\",\\\"salary_edit\\\",\\\"salary_update\\\",\\\"salary_payment\\\",\\\"payslip_list\\\",\\\"advance_type_menu\\\",\\\"advance_type_create\\\",\\\"advance_type_store\\\",\\\"advance_type_edit\\\",\\\"advance_type_update\\\",\\\"advance_type_delete\\\",\\\"advance_type_view\\\",\\\"advance_type_list\\\",\\\"salary_menu\\\",\\\"salary_store\\\",\\\"salary_edit\\\",\\\"salary_update\\\",\\\"salary_delete\\\",\\\"salary_view\\\",\\\"salary_list\\\",\\\"salary_search\\\",\\\"salary_pay\\\",\\\"salary_invoice\\\",\\\"salary_approve\\\",\\\"salary_generate\\\",\\\"salary_calculate\\\",\\\"account_menu\\\",\\\"account_create\\\",\\\"account_store\\\",\\\"account_edit\\\",\\\"account_update\\\",\\\"account_delete\\\",\\\"account_view\\\",\\\"account_list\\\",\\\"account_search\\\",\\\"deposit_menu\\\",\\\"deposit_create\\\",\\\"deposit_store\\\",\\\"deposit_edit\\\",\\\"deposit_update\\\",\\\"deposit_delete\\\",\\\"deposit_list\\\",\\\"expense_menu\\\",\\\"expense_create\\\",\\\"expense_store\\\",\\\"expense_edit\\\",\\\"expense_update\\\",\\\"expense_delete\\\",\\\"expense_list\\\",\\\"expense_view\\\",\\\"expense_approve\\\",\\\"expense_invoice\\\",\\\"expense_pay\\\",\\\"transaction_menu\\\",\\\"transaction_create\\\",\\\"transaction_store\\\",\\\"transaction_edit\\\",\\\"transaction_update\\\",\\\"transaction_delete\\\",\\\"transaction_view\\\",\\\"transaction_list\\\",\\\"deposit_category_menu\\\",\\\"deposit_category_create\\\",\\\"deposit_category_store\\\",\\\"deposit_category_edit\\\",\\\"deposit_category_update\\\",\\\"deposit_category_delete\\\",\\\"deposit_category_list\\\",\\\"payment_method_menu\\\",\\\"payment_method_create\\\",\\\"payment_method_store\\\",\\\"payment_method_edit\\\",\\\"payment_method_update\\\",\\\"payment_method_delete\\\",\\\"payment_method_list\\\",\\\"project_menu\\\",\\\"project_create\\\",\\\"project_store\\\",\\\"project_edit\\\",\\\"project_update\\\",\\\"project_delete\\\",\\\"project_view\\\",\\\"project_list\\\",\\\"project_activity_view\\\",\\\"project_member_view\\\",\\\"project_member_delete\\\",\\\"project_complete\\\",\\\"project_payment\\\",\\\"project_invoice_view\\\",\\\"project_discussion_create\\\",\\\"project_discussion_store\\\",\\\"project_discussion_edit\\\",\\\"project_discussion_update\\\",\\\"project_discussion_delete\\\",\\\"project_discussion_view\\\",\\\"project_discussion_list\\\",\\\"project_discussion_comment\\\",\\\"project_discussion_reply\\\",\\\"project_file_create\\\",\\\"project_file_store\\\",\\\"project_file_edit\\\",\\\"project_file_update\\\",\\\"project_file_delete\\\",\\\"project_file_view\\\",\\\"project_file_list\\\",\\\"project_file_download\\\",\\\"project_file_comment\\\",\\\"project_file_reply\\\",\\\"project_notes_create\\\",\\\"project_notes_store\\\",\\\"project_notes_edit\\\",\\\"project_notes_update\\\",\\\"project_notes_delete\\\",\\\"project_notes_list\\\",\\\"client_menu\\\",\\\"client_create\\\",\\\"client_store\\\",\\\"client_edit\\\",\\\"client_update\\\",\\\"client_delete\\\",\\\"client_view\\\",\\\"client_list\\\",\\\"task_menu\\\",\\\"task_create\\\",\\\"task_store\\\",\\\"task_edit\\\",\\\"task_update\\\",\\\"task_delete\\\",\\\"task_view\\\",\\\"task_list\\\",\\\"task_activity_view\\\",\\\"task_assign_view\\\",\\\"task_assign_delete\\\",\\\"task_complete\\\",\\\"task_discussion_create\\\",\\\"task_discussion_store\\\",\\\"task_discussion_edit\\\",\\\"task_discussion_update\\\",\\\"task_discussion_delete\\\",\\\"task_discussion_view\\\",\\\"task_discussion_list\\\",\\\"task_discussion_comment\\\",\\\"task_discussion_reply\\\",\\\"task_file_create\\\",\\\"task_file_store\\\",\\\"task_file_edit\\\",\\\"task_file_update\\\",\\\"task_file_delete\\\",\\\"task_file_view\\\",\\\"task_file_list\\\",\\\"task_file_download\\\",\\\"task_file_comment\\\",\\\"task_file_reply\\\",\\\"task_notes_create\\\",\\\"task_notes_store\\\",\\\"task_notes_edit\\\",\\\"task_notes_update\\\",\\\"task_notes_delete\\\",\\\"task_notes_list\\\",\\\"task_files_comment\\\",\\\"award_type_menu\\\",\\\"award_type_create\\\",\\\"award_type_store\\\",\\\"award_type_edit\\\",\\\"award_type_update\\\",\\\"award_type_delete\\\",\\\"award_type_view\\\",\\\"award_type_list\\\",\\\"award_menu\\\",\\\"award_create\\\",\\\"award_store\\\",\\\"award_edit\\\",\\\"award_update\\\",\\\"award_delete\\\",\\\"award_list\\\",\\\"travel_type_menu\\\",\\\"travel_type_create\\\",\\\"travel_type_store\\\",\\\"travel_type_edit\\\",\\\"travel_type_update\\\",\\\"travel_type_delete\\\",\\\"travel_type_view\\\",\\\"travel_type_list\\\",\\\"travel_menu\\\",\\\"travel_create\\\",\\\"travel_store\\\",\\\"travel_edit\\\",\\\"travel_update\\\",\\\"travel_delete\\\",\\\"travel_list\\\",\\\"travel_approve\\\",\\\"travel_payment\\\",\\\"meeting_menu\\\",\\\"meeting_create\\\",\\\"meeting_store\\\",\\\"meeting_edit\\\",\\\"meeting_update\\\",\\\"meeting_delete\\\",\\\"meeting_list\\\",\\\"performance_menu\\\",\\\"performance_settings\\\",\\\"performance_indicator_menu\\\",\\\"performance_indicator_list\\\",\\\"performance_indicator_create\\\",\\\"performance_indicator_store\\\",\\\"performance_indicator_edit\\\",\\\"performance_indicator_update\\\",\\\"performance_indicator_delete\\\",\\\"performance_appraisal_menu\\\",\\\"performance_appraisal_create\\\",\\\"performance_appraisal_store\\\",\\\"performance_appraisal_edit\\\",\\\"performance_appraisal_update\\\",\\\"performance_appraisal_delete\\\",\\\"performance_appraisal_list\\\",\\\"performance_appraisal_view\\\",\\\"performance_goal_type_menu\\\",\\\"performance_goal_type_create\\\",\\\"performance_goal_type_store\\\",\\\"performance_goal_type_edit\\\",\\\"performance_goal_type_update\\\",\\\"performance_goal_type_delete\\\",\\\"performance_goal_type_list\\\",\\\"performance_goal_menu\\\",\\\"performance_goal_create\\\",\\\"performance_goal_store\\\",\\\"performance_goal_edit\\\",\\\"performance_goal_update\\\",\\\"performance_goal_delete\\\",\\\"performance_goal_view\\\",\\\"performance_goal_list\\\",\\\"performance_competence_type_list\\\",\\\"performance_competence_type_menu\\\",\\\"performance_competence_type_create\\\",\\\"performance_competence_type_store\\\",\\\"performance_competence_type_edit\\\",\\\"performance_competence_type_update\\\",\\\"performance_competence_type_delete\\\",\\\"performance_competence_type_view\\\",\\\"performance_competence_menu\\\",\\\"performance_competence_create\\\",\\\"performance_competence_store\\\",\\\"performance_competence_edit\\\",\\\"performance_competence_update\\\",\\\"performance_competence_delete\\\",\\\"performance_competence_view\\\",\\\"performance_competence_list\\\",\\\"app_settings_menu\\\",\\\"app_settings_update\\\",\\\"language_menu\\\",\\\"make_default\\\",\\\"conference_read\\\",\\\"general_settings_read\\\",\\\"general_settings_update\\\",\\\"email_settings_update\\\",\\\"storage_settings_update\\\",\\\"language_create\\\",\\\"language_store\\\",\\\"language_edit\\\",\\\"language_update\\\",\\\"language_delete\\\",\\\"setup_language\\\",\\\"content_menu\\\",\\\"content_create\\\",\\\"content_store\\\",\\\"content_edit\\\",\\\"content_update\\\",\\\"content_delete\\\",\\\"contact_menu\\\",\\\"contact_create\\\",\\\"contact_store\\\",\\\"contact_edit\\\",\\\"contact_update\\\",\\\"contact_delete\\\",\\\"conference_create\\\",\\\"conference_read\\\",\\\"conference_store\\\",\\\"conference_update\\\",\\\"conference_delete\\\",\\\"conference_join\\\",\\\"model_read\\\",\\\"model_create\\\",\\\"model_update\\\",\\\"model_delete\\\",\\\"brand_read\\\",\\\"brand_create\\\",\\\"brand_update\\\",\\\"brand_delete\\\",\\\"machine_read\\\",\\\"machine_create\\\",\\\"machine_update\\\",\\\"machine_delete\\\",\\\"package_read\\\",\\\"package_create\\\",\\\"package_update\\\",\\\"package_delete\\\",\\\"institution_read\\\",\\\"institution_create\\\",\\\"institution_update\\\",\\\"institution_delete\\\",\\\"addons_menu\\\",\\\"employee_document_type_read\\\",\\\"employee_document_type_create\\\",\\\"employee_document_type_update\\\",\\\"employee_document_type_delete\\\",\\\"employee_document_read\\\",\\\"employee_document_create\\\",\\\"employee_document_download\\\",\\\"announcement_menu\\\",\\\"notice_menu\\\",\\\"notice_list\\\",\\\"notice_create\\\",\\\"notice_update\\\",\\\"notice_edit\\\",\\\"notice_delete\\\",\\\"send_sms_menu\\\",\\\"send_sms_list\\\",\\\"send_sms_create\\\",\\\"send_sms_update\\\",\\\"send_sms_edit\\\",\\\"send_sms_delete\\\",\\\"send_email_menu\\\",\\\"send_email_list\\\",\\\"send_email_create\\\",\\\"send_email_update\\\",\\\"send_email_edit\\\",\\\"send_email_delete\\\",\\\"send_notification_menu\\\",\\\"send_notification_list\\\",\\\"send_notification_create\\\",\\\"send_notification_update\\\",\\\"send_notification_edit\\\",\\\"send_notification_delete\\\",\\\"announcement_menu\\\",\\\"notice_menu\\\",\\\"notice_list\\\",\\\"notice_create\\\",\\\"notice_update\\\",\\\"notice_edit\\\",\\\"notice_delete\\\",\\\"send_sms_menu\\\",\\\"send_sms_list\\\",\\\"send_sms_create\\\",\\\"send_sms_update\\\",\\\"send_sms_edit\\\",\\\"send_sms_delete\\\",\\\"send_email_menu\\\",\\\"send_email_list\\\",\\\"send_email_create\\\",\\\"send_email_update\\\",\\\"send_email_edit\\\",\\\"send_email_delete\\\",\\\"send_notification_menu\\\",\\\"send_notification_list\\\",\\\"send_notification_create\\\",\\\"send_notification_update\\\",\\\"send_notification_edit\\\",\\\"send_notification_delete\\\",\\\"support_menu\\\",\\\"support_read\\\",\\\"support_create\\\",\\\"support_reply\\\",\\\"support_delete\\\"]\"',NULL,NULL,'EMP-','On Probation',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'g3O97FFySP','verified','2024-02-06 05:41:55',NULL,'verified',NULL,'$2y$10$RpVx8ea7TI3TUecG9fMuEecEQkVgTF.cyhv1U6D.F.Q0neQM3vTjO',NULL,NULL,1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'Islam',NULL,NULL,0.00,'Unmarried',NULL,NULL,1,0,0,0,0,0,'Asia/Dhaka','english',NULL,NULL,NULL,'Bb3Nma3i22',NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55',1,1,NULL,NULL,NULL,NULL),
(5,223,'Admin4',NULL,1,NULL,'admin4@onesttech.com','01724xxxxxxxx','1',0,2,1,1,1,'\"[\\\"team_menu\\\",\\\"team_list\\\",\\\"team_create\\\",\\\"team_update\\\",\\\"team_edit\\\",\\\"team_delete\\\",\\\"team_member_view\\\",\\\"team_member_create\\\",\\\"team_member_edit\\\",\\\"team_member_delete\\\",\\\"team_member_assign\\\",\\\"team_member_unassign\\\",\\\"dashboard\\\",\\\"hr_menu\\\",\\\"designation_read\\\",\\\"designation_create\\\",\\\"designation_update\\\",\\\"designation_delete\\\",\\\"shift_read\\\",\\\"shift_create\\\",\\\"shift_update\\\",\\\"shift_delete\\\",\\\"department_read\\\",\\\"department_create\\\",\\\"department_update\\\",\\\"department_delete\\\",\\\"user_menu\\\",\\\"user_read\\\",\\\"profile_view\\\",\\\"user_create\\\",\\\"user_edit\\\",\\\"user_update\\\",\\\"user_delete\\\",\\\"user_banned\\\",\\\"user_unbanned\\\",\\\"make_hr\\\",\\\"user_permission\\\",\\\"profile_image_view\\\",\\\"user_device_list\\\",\\\"reset_device\\\",\\\"phonebook_profile\\\",\\\"support_ticket_profile\\\",\\\"advance_profile\\\",\\\"commission_profile\\\",\\\"salary_profile\\\",\\\"project_profile\\\",\\\"task_profile\\\",\\\"award_profile\\\",\\\"travel_profile\\\",\\\"attendance_profile\\\",\\\"appointment_profile\\\",\\\"visit_profile\\\",\\\"leave_request_profile\\\",\\\"notice_profile\\\",\\\"role_read\\\",\\\"role_create\\\",\\\"role_update\\\",\\\"role_delete\\\",\\\"branch_read\\\",\\\"branch_create\\\",\\\"branch_update\\\",\\\"branch_delete\\\",\\\"leave_menu\\\",\\\"leave_type_read\\\",\\\"leave_type_create\\\",\\\"leave_type_update\\\",\\\"leave_type_delete\\\",\\\"leave_assign_read\\\",\\\"leave_assign_create\\\",\\\"leave_assign_update\\\",\\\"leave_assign_delete\\\",\\\"leave_request_read\\\",\\\"leave_request_create\\\",\\\"leave_request_store\\\",\\\"leave_request_update\\\",\\\"leave_request_approve\\\",\\\"leave_request_reject\\\",\\\"leave_request_delete\\\",\\\"daily_leave_read\\\",\\\"appointment_read\\\",\\\"appointment_menu\\\",\\\"appointment_create\\\",\\\"appointment_approve\\\",\\\"appointment_reject\\\",\\\"appointment_delete\\\",\\\"weekend_read\\\",\\\"weekend_update\\\",\\\"attendance_update\\\",\\\"holiday_read\\\",\\\"holiday_create\\\",\\\"holiday_update\\\",\\\"holiday_delete\\\",\\\"schedule_read\\\",\\\"schedule_create\\\",\\\"schedule_update\\\",\\\"schedule_delete\\\",\\\"attendance_menu\\\",\\\"attendance_read\\\",\\\"attendance_create\\\",\\\"attendance_update\\\",\\\"attendance_delete\\\",\\\"generate_qr_code\\\",\\\"leave_settings_read\\\",\\\"leave_settings_update\\\",\\\"company_settings_read\\\",\\\"company_settings_update\\\",\\\"locationApi\\\",\\\"company_setup_menu\\\",\\\"company_setup_activation\\\",\\\"company_setup_configuration\\\",\\\"company_setup_ip_whitelist\\\",\\\"company_setup_location\\\",\\\"location_create\\\",\\\"location_store\\\",\\\"location_edit\\\",\\\"location_update\\\",\\\"location_delete\\\",\\\"ip_read\\\",\\\"ip_create\\\",\\\"ip_update\\\",\\\"ip_delete\\\",\\\"attendance_report_read\\\",\\\"live_tracking_read\\\",\\\"report_menu\\\",\\\"report\\\",\\\"claim_read\\\",\\\"claim_create\\\",\\\"claim_update\\\",\\\"claim_delete\\\",\\\"payment_read\\\",\\\"payment_create\\\",\\\"payment_update\\\",\\\"payment_delete\\\",\\\"visit_menu\\\",\\\"visit_read\\\",\\\"visit_view\\\",\\\"visit_update\\\",\\\"payroll_menu\\\",\\\"list_payroll_item\\\",\\\"create_payroll_item\\\",\\\"store_payroll_item\\\",\\\"update_payroll_item\\\",\\\"delete_payroll_item\\\",\\\"view_payroll_item\\\",\\\"payroll_item_menu\\\",\\\"list_payroll_set\\\",\\\"create_payroll_set\\\",\\\"store_payroll_set\\\",\\\"update_payroll_set\\\",\\\"delete_payroll_set\\\",\\\"view_payroll_set\\\",\\\"edit_payroll_set\\\",\\\"payroll_set_menu\\\",\\\"advance_salaries_menu\\\",\\\"advance_salaries_create\\\",\\\"advance_salaries_store\\\",\\\"advance_salaries_edit\\\",\\\"advance_salaries_update\\\",\\\"advance_salaries_delete\\\",\\\"advance_salaries_view\\\",\\\"advance_salaries_approve\\\",\\\"advance_salaries_list\\\",\\\"advance_salaries_pay\\\",\\\"advance_salaries_invoice\\\",\\\"advance_salaries_search\\\",\\\"payslip_menu\\\",\\\"salary_generate\\\",\\\"salary_view\\\",\\\"salary_delete\\\",\\\"salary_edit\\\",\\\"salary_update\\\",\\\"salary_payment\\\",\\\"payslip_list\\\",\\\"advance_type_menu\\\",\\\"advance_type_create\\\",\\\"advance_type_store\\\",\\\"advance_type_edit\\\",\\\"advance_type_update\\\",\\\"advance_type_delete\\\",\\\"advance_type_view\\\",\\\"advance_type_list\\\",\\\"salary_menu\\\",\\\"salary_store\\\",\\\"salary_edit\\\",\\\"salary_update\\\",\\\"salary_delete\\\",\\\"salary_view\\\",\\\"salary_list\\\",\\\"salary_search\\\",\\\"salary_pay\\\",\\\"salary_invoice\\\",\\\"salary_approve\\\",\\\"salary_generate\\\",\\\"salary_calculate\\\",\\\"account_menu\\\",\\\"account_create\\\",\\\"account_store\\\",\\\"account_edit\\\",\\\"account_update\\\",\\\"account_delete\\\",\\\"account_view\\\",\\\"account_list\\\",\\\"account_search\\\",\\\"deposit_menu\\\",\\\"deposit_create\\\",\\\"deposit_store\\\",\\\"deposit_edit\\\",\\\"deposit_update\\\",\\\"deposit_delete\\\",\\\"deposit_list\\\",\\\"expense_menu\\\",\\\"expense_create\\\",\\\"expense_store\\\",\\\"expense_edit\\\",\\\"expense_update\\\",\\\"expense_delete\\\",\\\"expense_list\\\",\\\"expense_view\\\",\\\"expense_approve\\\",\\\"expense_invoice\\\",\\\"expense_pay\\\",\\\"transaction_menu\\\",\\\"transaction_create\\\",\\\"transaction_store\\\",\\\"transaction_edit\\\",\\\"transaction_update\\\",\\\"transaction_delete\\\",\\\"transaction_view\\\",\\\"transaction_list\\\",\\\"deposit_category_menu\\\",\\\"deposit_category_create\\\",\\\"deposit_category_store\\\",\\\"deposit_category_edit\\\",\\\"deposit_category_update\\\",\\\"deposit_category_delete\\\",\\\"deposit_category_list\\\",\\\"payment_method_menu\\\",\\\"payment_method_create\\\",\\\"payment_method_store\\\",\\\"payment_method_edit\\\",\\\"payment_method_update\\\",\\\"payment_method_delete\\\",\\\"payment_method_list\\\",\\\"project_menu\\\",\\\"project_create\\\",\\\"project_store\\\",\\\"project_edit\\\",\\\"project_update\\\",\\\"project_delete\\\",\\\"project_view\\\",\\\"project_list\\\",\\\"project_activity_view\\\",\\\"project_member_view\\\",\\\"project_member_delete\\\",\\\"project_complete\\\",\\\"project_payment\\\",\\\"project_invoice_view\\\",\\\"project_discussion_create\\\",\\\"project_discussion_store\\\",\\\"project_discussion_edit\\\",\\\"project_discussion_update\\\",\\\"project_discussion_delete\\\",\\\"project_discussion_view\\\",\\\"project_discussion_list\\\",\\\"project_discussion_comment\\\",\\\"project_discussion_reply\\\",\\\"project_file_create\\\",\\\"project_file_store\\\",\\\"project_file_edit\\\",\\\"project_file_update\\\",\\\"project_file_delete\\\",\\\"project_file_view\\\",\\\"project_file_list\\\",\\\"project_file_download\\\",\\\"project_file_comment\\\",\\\"project_file_reply\\\",\\\"project_notes_create\\\",\\\"project_notes_store\\\",\\\"project_notes_edit\\\",\\\"project_notes_update\\\",\\\"project_notes_delete\\\",\\\"project_notes_list\\\",\\\"client_menu\\\",\\\"client_create\\\",\\\"client_store\\\",\\\"client_edit\\\",\\\"client_update\\\",\\\"client_delete\\\",\\\"client_view\\\",\\\"client_list\\\",\\\"task_menu\\\",\\\"task_create\\\",\\\"task_store\\\",\\\"task_edit\\\",\\\"task_update\\\",\\\"task_delete\\\",\\\"task_view\\\",\\\"task_list\\\",\\\"task_activity_view\\\",\\\"task_assign_view\\\",\\\"task_assign_delete\\\",\\\"task_complete\\\",\\\"task_discussion_create\\\",\\\"task_discussion_store\\\",\\\"task_discussion_edit\\\",\\\"task_discussion_update\\\",\\\"task_discussion_delete\\\",\\\"task_discussion_view\\\",\\\"task_discussion_list\\\",\\\"task_discussion_comment\\\",\\\"task_discussion_reply\\\",\\\"task_file_create\\\",\\\"task_file_store\\\",\\\"task_file_edit\\\",\\\"task_file_update\\\",\\\"task_file_delete\\\",\\\"task_file_view\\\",\\\"task_file_list\\\",\\\"task_file_download\\\",\\\"task_file_comment\\\",\\\"task_file_reply\\\",\\\"task_notes_create\\\",\\\"task_notes_store\\\",\\\"task_notes_edit\\\",\\\"task_notes_update\\\",\\\"task_notes_delete\\\",\\\"task_notes_list\\\",\\\"task_files_comment\\\",\\\"award_type_menu\\\",\\\"award_type_create\\\",\\\"award_type_store\\\",\\\"award_type_edit\\\",\\\"award_type_update\\\",\\\"award_type_delete\\\",\\\"award_type_view\\\",\\\"award_type_list\\\",\\\"award_menu\\\",\\\"award_create\\\",\\\"award_store\\\",\\\"award_edit\\\",\\\"award_update\\\",\\\"award_delete\\\",\\\"award_list\\\",\\\"travel_type_menu\\\",\\\"travel_type_create\\\",\\\"travel_type_store\\\",\\\"travel_type_edit\\\",\\\"travel_type_update\\\",\\\"travel_type_delete\\\",\\\"travel_type_view\\\",\\\"travel_type_list\\\",\\\"travel_menu\\\",\\\"travel_create\\\",\\\"travel_store\\\",\\\"travel_edit\\\",\\\"travel_update\\\",\\\"travel_delete\\\",\\\"travel_list\\\",\\\"travel_approve\\\",\\\"travel_payment\\\",\\\"meeting_menu\\\",\\\"meeting_create\\\",\\\"meeting_store\\\",\\\"meeting_edit\\\",\\\"meeting_update\\\",\\\"meeting_delete\\\",\\\"meeting_list\\\",\\\"performance_menu\\\",\\\"performance_settings\\\",\\\"performance_indicator_menu\\\",\\\"performance_indicator_list\\\",\\\"performance_indicator_create\\\",\\\"performance_indicator_store\\\",\\\"performance_indicator_edit\\\",\\\"performance_indicator_update\\\",\\\"performance_indicator_delete\\\",\\\"performance_appraisal_menu\\\",\\\"performance_appraisal_create\\\",\\\"performance_appraisal_store\\\",\\\"performance_appraisal_edit\\\",\\\"performance_appraisal_update\\\",\\\"performance_appraisal_delete\\\",\\\"performance_appraisal_list\\\",\\\"performance_appraisal_view\\\",\\\"performance_goal_type_menu\\\",\\\"performance_goal_type_create\\\",\\\"performance_goal_type_store\\\",\\\"performance_goal_type_edit\\\",\\\"performance_goal_type_update\\\",\\\"performance_goal_type_delete\\\",\\\"performance_goal_type_list\\\",\\\"performance_goal_menu\\\",\\\"performance_goal_create\\\",\\\"performance_goal_store\\\",\\\"performance_goal_edit\\\",\\\"performance_goal_update\\\",\\\"performance_goal_delete\\\",\\\"performance_goal_view\\\",\\\"performance_goal_list\\\",\\\"performance_competence_type_list\\\",\\\"performance_competence_type_menu\\\",\\\"performance_competence_type_create\\\",\\\"performance_competence_type_store\\\",\\\"performance_competence_type_edit\\\",\\\"performance_competence_type_update\\\",\\\"performance_competence_type_delete\\\",\\\"performance_competence_type_view\\\",\\\"performance_competence_menu\\\",\\\"performance_competence_create\\\",\\\"performance_competence_store\\\",\\\"performance_competence_edit\\\",\\\"performance_competence_update\\\",\\\"performance_competence_delete\\\",\\\"performance_competence_view\\\",\\\"performance_competence_list\\\",\\\"app_settings_menu\\\",\\\"app_settings_update\\\",\\\"language_menu\\\",\\\"make_default\\\",\\\"conference_read\\\",\\\"general_settings_read\\\",\\\"general_settings_update\\\",\\\"email_settings_update\\\",\\\"storage_settings_update\\\",\\\"language_create\\\",\\\"language_store\\\",\\\"language_edit\\\",\\\"language_update\\\",\\\"language_delete\\\",\\\"setup_language\\\",\\\"content_menu\\\",\\\"content_create\\\",\\\"content_store\\\",\\\"content_edit\\\",\\\"content_update\\\",\\\"content_delete\\\",\\\"contact_menu\\\",\\\"contact_create\\\",\\\"contact_store\\\",\\\"contact_edit\\\",\\\"contact_update\\\",\\\"contact_delete\\\",\\\"conference_create\\\",\\\"conference_read\\\",\\\"conference_store\\\",\\\"conference_update\\\",\\\"conference_delete\\\",\\\"conference_join\\\",\\\"model_read\\\",\\\"model_create\\\",\\\"model_update\\\",\\\"model_delete\\\",\\\"brand_read\\\",\\\"brand_create\\\",\\\"brand_update\\\",\\\"brand_delete\\\",\\\"machine_read\\\",\\\"machine_create\\\",\\\"machine_update\\\",\\\"machine_delete\\\",\\\"package_read\\\",\\\"package_create\\\",\\\"package_update\\\",\\\"package_delete\\\",\\\"institution_read\\\",\\\"institution_create\\\",\\\"institution_update\\\",\\\"institution_delete\\\",\\\"addons_menu\\\",\\\"employee_document_type_read\\\",\\\"employee_document_type_create\\\",\\\"employee_document_type_update\\\",\\\"employee_document_type_delete\\\",\\\"employee_document_read\\\",\\\"employee_document_create\\\",\\\"employee_document_download\\\",\\\"announcement_menu\\\",\\\"notice_menu\\\",\\\"notice_list\\\",\\\"notice_create\\\",\\\"notice_update\\\",\\\"notice_edit\\\",\\\"notice_delete\\\",\\\"send_sms_menu\\\",\\\"send_sms_list\\\",\\\"send_sms_create\\\",\\\"send_sms_update\\\",\\\"send_sms_edit\\\",\\\"send_sms_delete\\\",\\\"send_email_menu\\\",\\\"send_email_list\\\",\\\"send_email_create\\\",\\\"send_email_update\\\",\\\"send_email_edit\\\",\\\"send_email_delete\\\",\\\"send_notification_menu\\\",\\\"send_notification_list\\\",\\\"send_notification_create\\\",\\\"send_notification_update\\\",\\\"send_notification_edit\\\",\\\"send_notification_delete\\\",\\\"announcement_menu\\\",\\\"notice_menu\\\",\\\"notice_list\\\",\\\"notice_create\\\",\\\"notice_update\\\",\\\"notice_edit\\\",\\\"notice_delete\\\",\\\"send_sms_menu\\\",\\\"send_sms_list\\\",\\\"send_sms_create\\\",\\\"send_sms_update\\\",\\\"send_sms_edit\\\",\\\"send_sms_delete\\\",\\\"send_email_menu\\\",\\\"send_email_list\\\",\\\"send_email_create\\\",\\\"send_email_update\\\",\\\"send_email_edit\\\",\\\"send_email_delete\\\",\\\"send_notification_menu\\\",\\\"send_notification_list\\\",\\\"send_notification_create\\\",\\\"send_notification_update\\\",\\\"send_notification_edit\\\",\\\"send_notification_delete\\\",\\\"support_menu\\\",\\\"support_read\\\",\\\"support_create\\\",\\\"support_reply\\\",\\\"support_delete\\\"]\"',NULL,NULL,'EMP-','On Probation',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'QdzJt7pcyA','verified','2024-02-06 05:41:55',NULL,'verified',NULL,'$2y$10$FznaR/MJjCVFuxXp8nByZOo3k2U6o3JgXXIXr2WjNTGjMAha4QR9q',NULL,NULL,1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'Islam',NULL,NULL,0.00,'Unmarried',NULL,NULL,1,0,0,0,0,0,'Asia/Dhaka','english',NULL,NULL,NULL,'saYBbZcjcU',NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55',1,1,NULL,NULL,NULL,NULL),
(6,223,'Admin5',NULL,1,NULL,'admin5@onesttech.com','01725xxxxxxxx','1',0,2,1,1,1,'\"[\\\"team_menu\\\",\\\"team_list\\\",\\\"team_create\\\",\\\"team_update\\\",\\\"team_edit\\\",\\\"team_delete\\\",\\\"team_member_view\\\",\\\"team_member_create\\\",\\\"team_member_edit\\\",\\\"team_member_delete\\\",\\\"team_member_assign\\\",\\\"team_member_unassign\\\",\\\"dashboard\\\",\\\"hr_menu\\\",\\\"designation_read\\\",\\\"designation_create\\\",\\\"designation_update\\\",\\\"designation_delete\\\",\\\"shift_read\\\",\\\"shift_create\\\",\\\"shift_update\\\",\\\"shift_delete\\\",\\\"department_read\\\",\\\"department_create\\\",\\\"department_update\\\",\\\"department_delete\\\",\\\"user_menu\\\",\\\"user_read\\\",\\\"profile_view\\\",\\\"user_create\\\",\\\"user_edit\\\",\\\"user_update\\\",\\\"user_delete\\\",\\\"user_banned\\\",\\\"user_unbanned\\\",\\\"make_hr\\\",\\\"user_permission\\\",\\\"profile_image_view\\\",\\\"user_device_list\\\",\\\"reset_device\\\",\\\"phonebook_profile\\\",\\\"support_ticket_profile\\\",\\\"advance_profile\\\",\\\"commission_profile\\\",\\\"salary_profile\\\",\\\"project_profile\\\",\\\"task_profile\\\",\\\"award_profile\\\",\\\"travel_profile\\\",\\\"attendance_profile\\\",\\\"appointment_profile\\\",\\\"visit_profile\\\",\\\"leave_request_profile\\\",\\\"notice_profile\\\",\\\"role_read\\\",\\\"role_create\\\",\\\"role_update\\\",\\\"role_delete\\\",\\\"branch_read\\\",\\\"branch_create\\\",\\\"branch_update\\\",\\\"branch_delete\\\",\\\"leave_menu\\\",\\\"leave_type_read\\\",\\\"leave_type_create\\\",\\\"leave_type_update\\\",\\\"leave_type_delete\\\",\\\"leave_assign_read\\\",\\\"leave_assign_create\\\",\\\"leave_assign_update\\\",\\\"leave_assign_delete\\\",\\\"leave_request_read\\\",\\\"leave_request_create\\\",\\\"leave_request_store\\\",\\\"leave_request_update\\\",\\\"leave_request_approve\\\",\\\"leave_request_reject\\\",\\\"leave_request_delete\\\",\\\"daily_leave_read\\\",\\\"appointment_read\\\",\\\"appointment_menu\\\",\\\"appointment_create\\\",\\\"appointment_approve\\\",\\\"appointment_reject\\\",\\\"appointment_delete\\\",\\\"weekend_read\\\",\\\"weekend_update\\\",\\\"attendance_update\\\",\\\"holiday_read\\\",\\\"holiday_create\\\",\\\"holiday_update\\\",\\\"holiday_delete\\\",\\\"schedule_read\\\",\\\"schedule_create\\\",\\\"schedule_update\\\",\\\"schedule_delete\\\",\\\"attendance_menu\\\",\\\"attendance_read\\\",\\\"attendance_create\\\",\\\"attendance_update\\\",\\\"attendance_delete\\\",\\\"generate_qr_code\\\",\\\"leave_settings_read\\\",\\\"leave_settings_update\\\",\\\"company_settings_read\\\",\\\"company_settings_update\\\",\\\"locationApi\\\",\\\"company_setup_menu\\\",\\\"company_setup_activation\\\",\\\"company_setup_configuration\\\",\\\"company_setup_ip_whitelist\\\",\\\"company_setup_location\\\",\\\"location_create\\\",\\\"location_store\\\",\\\"location_edit\\\",\\\"location_update\\\",\\\"location_delete\\\",\\\"ip_read\\\",\\\"ip_create\\\",\\\"ip_update\\\",\\\"ip_delete\\\",\\\"attendance_report_read\\\",\\\"live_tracking_read\\\",\\\"report_menu\\\",\\\"report\\\",\\\"claim_read\\\",\\\"claim_create\\\",\\\"claim_update\\\",\\\"claim_delete\\\",\\\"payment_read\\\",\\\"payment_create\\\",\\\"payment_update\\\",\\\"payment_delete\\\",\\\"visit_menu\\\",\\\"visit_read\\\",\\\"visit_view\\\",\\\"visit_update\\\",\\\"payroll_menu\\\",\\\"list_payroll_item\\\",\\\"create_payroll_item\\\",\\\"store_payroll_item\\\",\\\"update_payroll_item\\\",\\\"delete_payroll_item\\\",\\\"view_payroll_item\\\",\\\"payroll_item_menu\\\",\\\"list_payroll_set\\\",\\\"create_payroll_set\\\",\\\"store_payroll_set\\\",\\\"update_payroll_set\\\",\\\"delete_payroll_set\\\",\\\"view_payroll_set\\\",\\\"edit_payroll_set\\\",\\\"payroll_set_menu\\\",\\\"advance_salaries_menu\\\",\\\"advance_salaries_create\\\",\\\"advance_salaries_store\\\",\\\"advance_salaries_edit\\\",\\\"advance_salaries_update\\\",\\\"advance_salaries_delete\\\",\\\"advance_salaries_view\\\",\\\"advance_salaries_approve\\\",\\\"advance_salaries_list\\\",\\\"advance_salaries_pay\\\",\\\"advance_salaries_invoice\\\",\\\"advance_salaries_search\\\",\\\"payslip_menu\\\",\\\"salary_generate\\\",\\\"salary_view\\\",\\\"salary_delete\\\",\\\"salary_edit\\\",\\\"salary_update\\\",\\\"salary_payment\\\",\\\"payslip_list\\\",\\\"advance_type_menu\\\",\\\"advance_type_create\\\",\\\"advance_type_store\\\",\\\"advance_type_edit\\\",\\\"advance_type_update\\\",\\\"advance_type_delete\\\",\\\"advance_type_view\\\",\\\"advance_type_list\\\",\\\"salary_menu\\\",\\\"salary_store\\\",\\\"salary_edit\\\",\\\"salary_update\\\",\\\"salary_delete\\\",\\\"salary_view\\\",\\\"salary_list\\\",\\\"salary_search\\\",\\\"salary_pay\\\",\\\"salary_invoice\\\",\\\"salary_approve\\\",\\\"salary_generate\\\",\\\"salary_calculate\\\",\\\"account_menu\\\",\\\"account_create\\\",\\\"account_store\\\",\\\"account_edit\\\",\\\"account_update\\\",\\\"account_delete\\\",\\\"account_view\\\",\\\"account_list\\\",\\\"account_search\\\",\\\"deposit_menu\\\",\\\"deposit_create\\\",\\\"deposit_store\\\",\\\"deposit_edit\\\",\\\"deposit_update\\\",\\\"deposit_delete\\\",\\\"deposit_list\\\",\\\"expense_menu\\\",\\\"expense_create\\\",\\\"expense_store\\\",\\\"expense_edit\\\",\\\"expense_update\\\",\\\"expense_delete\\\",\\\"expense_list\\\",\\\"expense_view\\\",\\\"expense_approve\\\",\\\"expense_invoice\\\",\\\"expense_pay\\\",\\\"transaction_menu\\\",\\\"transaction_create\\\",\\\"transaction_store\\\",\\\"transaction_edit\\\",\\\"transaction_update\\\",\\\"transaction_delete\\\",\\\"transaction_view\\\",\\\"transaction_list\\\",\\\"deposit_category_menu\\\",\\\"deposit_category_create\\\",\\\"deposit_category_store\\\",\\\"deposit_category_edit\\\",\\\"deposit_category_update\\\",\\\"deposit_category_delete\\\",\\\"deposit_category_list\\\",\\\"payment_method_menu\\\",\\\"payment_method_create\\\",\\\"payment_method_store\\\",\\\"payment_method_edit\\\",\\\"payment_method_update\\\",\\\"payment_method_delete\\\",\\\"payment_method_list\\\",\\\"project_menu\\\",\\\"project_create\\\",\\\"project_store\\\",\\\"project_edit\\\",\\\"project_update\\\",\\\"project_delete\\\",\\\"project_view\\\",\\\"project_list\\\",\\\"project_activity_view\\\",\\\"project_member_view\\\",\\\"project_member_delete\\\",\\\"project_complete\\\",\\\"project_payment\\\",\\\"project_invoice_view\\\",\\\"project_discussion_create\\\",\\\"project_discussion_store\\\",\\\"project_discussion_edit\\\",\\\"project_discussion_update\\\",\\\"project_discussion_delete\\\",\\\"project_discussion_view\\\",\\\"project_discussion_list\\\",\\\"project_discussion_comment\\\",\\\"project_discussion_reply\\\",\\\"project_file_create\\\",\\\"project_file_store\\\",\\\"project_file_edit\\\",\\\"project_file_update\\\",\\\"project_file_delete\\\",\\\"project_file_view\\\",\\\"project_file_list\\\",\\\"project_file_download\\\",\\\"project_file_comment\\\",\\\"project_file_reply\\\",\\\"project_notes_create\\\",\\\"project_notes_store\\\",\\\"project_notes_edit\\\",\\\"project_notes_update\\\",\\\"project_notes_delete\\\",\\\"project_notes_list\\\",\\\"client_menu\\\",\\\"client_create\\\",\\\"client_store\\\",\\\"client_edit\\\",\\\"client_update\\\",\\\"client_delete\\\",\\\"client_view\\\",\\\"client_list\\\",\\\"task_menu\\\",\\\"task_create\\\",\\\"task_store\\\",\\\"task_edit\\\",\\\"task_update\\\",\\\"task_delete\\\",\\\"task_view\\\",\\\"task_list\\\",\\\"task_activity_view\\\",\\\"task_assign_view\\\",\\\"task_assign_delete\\\",\\\"task_complete\\\",\\\"task_discussion_create\\\",\\\"task_discussion_store\\\",\\\"task_discussion_edit\\\",\\\"task_discussion_update\\\",\\\"task_discussion_delete\\\",\\\"task_discussion_view\\\",\\\"task_discussion_list\\\",\\\"task_discussion_comment\\\",\\\"task_discussion_reply\\\",\\\"task_file_create\\\",\\\"task_file_store\\\",\\\"task_file_edit\\\",\\\"task_file_update\\\",\\\"task_file_delete\\\",\\\"task_file_view\\\",\\\"task_file_list\\\",\\\"task_file_download\\\",\\\"task_file_comment\\\",\\\"task_file_reply\\\",\\\"task_notes_create\\\",\\\"task_notes_store\\\",\\\"task_notes_edit\\\",\\\"task_notes_update\\\",\\\"task_notes_delete\\\",\\\"task_notes_list\\\",\\\"task_files_comment\\\",\\\"award_type_menu\\\",\\\"award_type_create\\\",\\\"award_type_store\\\",\\\"award_type_edit\\\",\\\"award_type_update\\\",\\\"award_type_delete\\\",\\\"award_type_view\\\",\\\"award_type_list\\\",\\\"award_menu\\\",\\\"award_create\\\",\\\"award_store\\\",\\\"award_edit\\\",\\\"award_update\\\",\\\"award_delete\\\",\\\"award_list\\\",\\\"travel_type_menu\\\",\\\"travel_type_create\\\",\\\"travel_type_store\\\",\\\"travel_type_edit\\\",\\\"travel_type_update\\\",\\\"travel_type_delete\\\",\\\"travel_type_view\\\",\\\"travel_type_list\\\",\\\"travel_menu\\\",\\\"travel_create\\\",\\\"travel_store\\\",\\\"travel_edit\\\",\\\"travel_update\\\",\\\"travel_delete\\\",\\\"travel_list\\\",\\\"travel_approve\\\",\\\"travel_payment\\\",\\\"meeting_menu\\\",\\\"meeting_create\\\",\\\"meeting_store\\\",\\\"meeting_edit\\\",\\\"meeting_update\\\",\\\"meeting_delete\\\",\\\"meeting_list\\\",\\\"performance_menu\\\",\\\"performance_settings\\\",\\\"performance_indicator_menu\\\",\\\"performance_indicator_list\\\",\\\"performance_indicator_create\\\",\\\"performance_indicator_store\\\",\\\"performance_indicator_edit\\\",\\\"performance_indicator_update\\\",\\\"performance_indicator_delete\\\",\\\"performance_appraisal_menu\\\",\\\"performance_appraisal_create\\\",\\\"performance_appraisal_store\\\",\\\"performance_appraisal_edit\\\",\\\"performance_appraisal_update\\\",\\\"performance_appraisal_delete\\\",\\\"performance_appraisal_list\\\",\\\"performance_appraisal_view\\\",\\\"performance_goal_type_menu\\\",\\\"performance_goal_type_create\\\",\\\"performance_goal_type_store\\\",\\\"performance_goal_type_edit\\\",\\\"performance_goal_type_update\\\",\\\"performance_goal_type_delete\\\",\\\"performance_goal_type_list\\\",\\\"performance_goal_menu\\\",\\\"performance_goal_create\\\",\\\"performance_goal_store\\\",\\\"performance_goal_edit\\\",\\\"performance_goal_update\\\",\\\"performance_goal_delete\\\",\\\"performance_goal_view\\\",\\\"performance_goal_list\\\",\\\"performance_competence_type_list\\\",\\\"performance_competence_type_menu\\\",\\\"performance_competence_type_create\\\",\\\"performance_competence_type_store\\\",\\\"performance_competence_type_edit\\\",\\\"performance_competence_type_update\\\",\\\"performance_competence_type_delete\\\",\\\"performance_competence_type_view\\\",\\\"performance_competence_menu\\\",\\\"performance_competence_create\\\",\\\"performance_competence_store\\\",\\\"performance_competence_edit\\\",\\\"performance_competence_update\\\",\\\"performance_competence_delete\\\",\\\"performance_competence_view\\\",\\\"performance_competence_list\\\",\\\"app_settings_menu\\\",\\\"app_settings_update\\\",\\\"language_menu\\\",\\\"make_default\\\",\\\"conference_read\\\",\\\"general_settings_read\\\",\\\"general_settings_update\\\",\\\"email_settings_update\\\",\\\"storage_settings_update\\\",\\\"language_create\\\",\\\"language_store\\\",\\\"language_edit\\\",\\\"language_update\\\",\\\"language_delete\\\",\\\"setup_language\\\",\\\"content_menu\\\",\\\"content_create\\\",\\\"content_store\\\",\\\"content_edit\\\",\\\"content_update\\\",\\\"content_delete\\\",\\\"contact_menu\\\",\\\"contact_create\\\",\\\"contact_store\\\",\\\"contact_edit\\\",\\\"contact_update\\\",\\\"contact_delete\\\",\\\"conference_create\\\",\\\"conference_read\\\",\\\"conference_store\\\",\\\"conference_update\\\",\\\"conference_delete\\\",\\\"conference_join\\\",\\\"model_read\\\",\\\"model_create\\\",\\\"model_update\\\",\\\"model_delete\\\",\\\"brand_read\\\",\\\"brand_create\\\",\\\"brand_update\\\",\\\"brand_delete\\\",\\\"machine_read\\\",\\\"machine_create\\\",\\\"machine_update\\\",\\\"machine_delete\\\",\\\"package_read\\\",\\\"package_create\\\",\\\"package_update\\\",\\\"package_delete\\\",\\\"institution_read\\\",\\\"institution_create\\\",\\\"institution_update\\\",\\\"institution_delete\\\",\\\"addons_menu\\\",\\\"employee_document_type_read\\\",\\\"employee_document_type_create\\\",\\\"employee_document_type_update\\\",\\\"employee_document_type_delete\\\",\\\"employee_document_read\\\",\\\"employee_document_create\\\",\\\"employee_document_download\\\",\\\"announcement_menu\\\",\\\"notice_menu\\\",\\\"notice_list\\\",\\\"notice_create\\\",\\\"notice_update\\\",\\\"notice_edit\\\",\\\"notice_delete\\\",\\\"send_sms_menu\\\",\\\"send_sms_list\\\",\\\"send_sms_create\\\",\\\"send_sms_update\\\",\\\"send_sms_edit\\\",\\\"send_sms_delete\\\",\\\"send_email_menu\\\",\\\"send_email_list\\\",\\\"send_email_create\\\",\\\"send_email_update\\\",\\\"send_email_edit\\\",\\\"send_email_delete\\\",\\\"send_notification_menu\\\",\\\"send_notification_list\\\",\\\"send_notification_create\\\",\\\"send_notification_update\\\",\\\"send_notification_edit\\\",\\\"send_notification_delete\\\",\\\"announcement_menu\\\",\\\"notice_menu\\\",\\\"notice_list\\\",\\\"notice_create\\\",\\\"notice_update\\\",\\\"notice_edit\\\",\\\"notice_delete\\\",\\\"send_sms_menu\\\",\\\"send_sms_list\\\",\\\"send_sms_create\\\",\\\"send_sms_update\\\",\\\"send_sms_edit\\\",\\\"send_sms_delete\\\",\\\"send_email_menu\\\",\\\"send_email_list\\\",\\\"send_email_create\\\",\\\"send_email_update\\\",\\\"send_email_edit\\\",\\\"send_email_delete\\\",\\\"send_notification_menu\\\",\\\"send_notification_list\\\",\\\"send_notification_create\\\",\\\"send_notification_update\\\",\\\"send_notification_edit\\\",\\\"send_notification_delete\\\",\\\"support_menu\\\",\\\"support_read\\\",\\\"support_create\\\",\\\"support_reply\\\",\\\"support_delete\\\"]\"',NULL,NULL,'EMP-','On Probation',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'mi1BJUgZ0U','verified','2024-02-06 05:41:55',NULL,'verified',NULL,'$2y$10$/RoMMNvGjM8eK./kK324QOseW.BiNq4c4zzcn/bcbToL4pDwfftdS',NULL,NULL,1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'Islam',NULL,NULL,0.00,'Unmarried',NULL,NULL,1,0,0,0,0,0,'Asia/Dhaka','english',NULL,NULL,NULL,'H6l0AIpek6',NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55',1,1,NULL,NULL,NULL,NULL),
(7,223,'HR',NULL,1,NULL,'hr@onesttech.com','0171xxxxxxxx','0',1,3,1,1,1,'\"[\\\"team_menu\\\",\\\"team_list\\\",\\\"team_create\\\",\\\"team_update\\\",\\\"team_edit\\\",\\\"team_delete\\\",\\\"team_member_view\\\",\\\"team_member_create\\\",\\\"team_member_edit\\\",\\\"team_member_delete\\\",\\\"team_member_assign\\\",\\\"team_member_unassign\\\",\\\"dashboard\\\",\\\"designation_read\\\",\\\"designation_create\\\",\\\"designation_update\\\",\\\"designation_delete\\\",\\\"shift_read\\\",\\\"shift_create\\\",\\\"shift_update\\\",\\\"shift_delete\\\",\\\"department_read\\\",\\\"department_create\\\",\\\"department_update\\\",\\\"department_delete\\\",\\\"user_menu\\\",\\\"user_read\\\",\\\"profile_view\\\",\\\"user_create\\\",\\\"user_edit\\\",\\\"user_update\\\",\\\"user_delete\\\",\\\"user_banned\\\",\\\"user_unbanned\\\",\\\"make_hr\\\",\\\"user_permission\\\",\\\"profile_image_view\\\",\\\"user_device_list\\\",\\\"reset_device\\\",\\\"role_read\\\",\\\"role_create\\\",\\\"role_update\\\",\\\"role_delete\\\",\\\"branch_read\\\",\\\"branch_create\\\",\\\"branch_update\\\",\\\"branch_delete\\\",\\\"leave_menu\\\",\\\"leave_type_read\\\",\\\"leave_type_create\\\",\\\"leave_type_update\\\",\\\"leave_type_delete\\\",\\\"leave_assign_read\\\",\\\"leave_assign_create\\\",\\\"leave_assign_update\\\",\\\"leave_assign_delete\\\",\\\"leave_request_read\\\",\\\"leave_request_create\\\",\\\"leave_request_approve\\\",\\\"leave_request_reject\\\",\\\"leave_request_delete\\\",\\\"appointment_read\\\",\\\"appointment_menu\\\",\\\"appointment_create\\\",\\\"appointment_approve\\\",\\\"appointment_reject\\\",\\\"appointment_delete\\\",\\\"weekend_read\\\",\\\"weekend_update\\\",\\\"attendance_update\\\",\\\"holiday_read\\\",\\\"holiday_create\\\",\\\"holiday_update\\\",\\\"holiday_delete\\\",\\\"schedule_read\\\",\\\"schedule_create\\\",\\\"schedule_update\\\",\\\"schedule_delete\\\",\\\"attendance_menu\\\",\\\"attendance_read\\\",\\\"attendance_create\\\",\\\"attendance_update\\\",\\\"attendance_delete\\\",\\\"leave_settings_read\\\",\\\"leave_settings_update\\\",\\\"company_settings_read\\\",\\\"company_settings_update\\\",\\\"locationApi\\\",\\\"company_setup_menu\\\",\\\"company_setup_activation\\\",\\\"company_setup_configuration\\\",\\\"company_setup_ip_whitelist\\\",\\\"company_setup_location\\\",\\\"ip_read\\\",\\\"ip_create\\\",\\\"ip_update\\\",\\\"ip_delete\\\",\\\"attendance_report_read\\\",\\\"live_tracking_read\\\",\\\"report_menu\\\",\\\"report\\\",\\\"claim_read\\\",\\\"claim_create\\\",\\\"claim_update\\\",\\\"claim_delete\\\",\\\"payment_read\\\",\\\"payment_create\\\",\\\"payment_update\\\",\\\"payment_delete\\\",\\\"visit_menu\\\",\\\"visit_read\\\",\\\"visit_view\\\",\\\"visit_update\\\",\\\"payroll_menu\\\",\\\"list_payroll_item\\\",\\\"create_payroll_item\\\",\\\"store_payroll_item\\\",\\\"update_payroll_item\\\",\\\"delete_payroll_item\\\",\\\"view_payroll_item\\\",\\\"payroll_item_menu\\\",\\\"list_payroll_set\\\",\\\"create_payroll_set\\\",\\\"store_payroll_set\\\",\\\"update_payroll_set\\\",\\\"delete_payroll_set\\\",\\\"view_payroll_set\\\",\\\"edit_payroll_set\\\",\\\"payroll_set_menu\\\",\\\"advance_salaries_menu\\\",\\\"advance_salaries_create\\\",\\\"advance_salaries_store\\\",\\\"advance_salaries_edit\\\",\\\"advance_salaries_update\\\",\\\"advance_salaries_delete\\\",\\\"advance_salaries_view\\\",\\\"advance_salaries_approve\\\",\\\"advance_salaries_list\\\",\\\"advance_salaries_pay\\\",\\\"advance_salaries_invoice\\\",\\\"advance_salaries_search\\\",\\\"payslip_menu\\\",\\\"salary_generate\\\",\\\"salary_view\\\",\\\"salary_delete\\\",\\\"salary_edit\\\",\\\"salary_update\\\",\\\"salary_payment\\\",\\\"payslip_list\\\",\\\"advance_type_menu\\\",\\\"advance_type_create\\\",\\\"advance_type_store\\\",\\\"advance_type_edit\\\",\\\"advance_type_update\\\",\\\"advance_type_delete\\\",\\\"advance_type_view\\\",\\\"advance_type_list\\\",\\\"salary_menu\\\",\\\"salary_store\\\",\\\"salary_edit\\\",\\\"salary_update\\\",\\\"salary_delete\\\",\\\"salary_view\\\",\\\"salary_list\\\",\\\"salary_search\\\",\\\"salary_pay\\\",\\\"salary_invoice\\\",\\\"salary_approve\\\",\\\"salary_generate\\\",\\\"salary_calculate\\\",\\\"account_menu\\\",\\\"account_create\\\",\\\"account_store\\\",\\\"account_edit\\\",\\\"account_update\\\",\\\"account_delete\\\",\\\"account_view\\\",\\\"account_list\\\",\\\"account_search\\\",\\\"deposit_menu\\\",\\\"deposit_create\\\",\\\"deposit_store\\\",\\\"deposit_edit\\\",\\\"deposit_update\\\",\\\"deposit_delete\\\",\\\"deposit_list\\\",\\\"expense_menu\\\",\\\"expense_create\\\",\\\"expense_store\\\",\\\"expense_edit\\\",\\\"expense_update\\\",\\\"expense_delete\\\",\\\"expense_list\\\",\\\"expense_view\\\",\\\"expense_approve\\\",\\\"expense_invoice\\\",\\\"expense_pay\\\",\\\"transaction_menu\\\",\\\"transaction_create\\\",\\\"transaction_store\\\",\\\"transaction_edit\\\",\\\"transaction_update\\\",\\\"transaction_delete\\\",\\\"transaction_view\\\",\\\"transaction_list\\\",\\\"deposit_category_menu\\\",\\\"deposit_category_create\\\",\\\"deposit_category_store\\\",\\\"deposit_category_edit\\\",\\\"deposit_category_update\\\",\\\"deposit_category_delete\\\",\\\"deposit_category_list\\\",\\\"payment_method_menu\\\",\\\"payment_method_create\\\",\\\"payment_method_store\\\",\\\"payment_method_edit\\\",\\\"payment_method_update\\\",\\\"payment_method_delete\\\",\\\"payment_method_list\\\",\\\"travel_menu\\\",\\\"travel_create\\\",\\\"travel_store\\\",\\\"travel_edit\\\",\\\"travel_update\\\",\\\"travel_delete\\\",\\\"travel_list\\\",\\\"travel_view\\\",\\\"travel_approve\\\",\\\"travel_invoice\\\",\\\"travel_pay\\\",\\\"meeting_menu\\\",\\\"meeting_create\\\",\\\"meeting_store\\\",\\\"meeting_edit\\\",\\\"meeting_update\\\",\\\"meeting_delete\\\",\\\"meeting_list\\\",\\\"meeting_view\\\",\\\"task_menu\\\",\\\"task.create\\\",\\\"task.index\\\",\\\"task.view\\\",\\\"task.edit\\\",\\\"conference_create\\\",\\\"conference_read\\\",\\\"conference_store\\\",\\\"conference_update\\\",\\\"conference_delete\\\",\\\"conference_join\\\",\\\"announcement_menu\\\",\\\"notice_menu\\\",\\\"notice_list\\\",\\\"notice_create\\\",\\\"notice_update\\\",\\\"notice_edit\\\",\\\"notice_delete\\\",\\\"send_sms_menu\\\",\\\"send_sms_list\\\",\\\"send_sms_create\\\",\\\"send_sms_update\\\",\\\"send_sms_edit\\\",\\\"send_sms_delete\\\",\\\"send_email_menu\\\",\\\"send_email_list\\\",\\\"send_email_create\\\",\\\"send_email_update\\\",\\\"send_email_edit\\\",\\\"send_email_delete\\\",\\\"send_notification_menu\\\",\\\"send_notification_list\\\",\\\"send_notification_create\\\",\\\"send_notification_update\\\",\\\"send_notification_edit\\\",\\\"send_notification_delete\\\",\\\"announcement_menu\\\",\\\"notice_menu\\\",\\\"notice_list\\\",\\\"notice_create\\\",\\\"notice_update\\\",\\\"notice_edit\\\",\\\"notice_delete\\\",\\\"send_sms_menu\\\",\\\"send_sms_list\\\",\\\"send_sms_create\\\",\\\"send_sms_update\\\",\\\"send_sms_edit\\\",\\\"send_sms_delete\\\",\\\"send_email_menu\\\",\\\"send_email_list\\\",\\\"send_email_create\\\",\\\"send_email_update\\\",\\\"send_email_edit\\\",\\\"send_email_delete\\\",\\\"send_notification_menu\\\",\\\"send_notification_list\\\",\\\"send_notification_create\\\",\\\"send_notification_update\\\",\\\"send_notification_edit\\\",\\\"send_notification_delete\\\",\\\"support_menu\\\",\\\"support_read\\\",\\\"support_create\\\",\\\"support_reply\\\",\\\"support_delete\\\"]\"',NULL,NULL,'EMP-','On Probation',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'zC2CfoeJFH','verified','2024-02-06 05:41:55',NULL,'verified',NULL,'$2y$10$hhkFkLEHNVQ/nAOqsOphNehv5xjrmTACnDcGt5uaxDhWawI73bjua',NULL,NULL,1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'Islam',NULL,NULL,0.00,'Unmarried',NULL,NULL,1,0,0,0,0,0,'Asia/Dhaka','english',NULL,NULL,NULL,'WNGAt5v3Fa',NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55',1,1,NULL,NULL,NULL,NULL),
(8,223,'HR1',NULL,1,NULL,'hr1@onesttech.com','01711xxxxxxxx','0',1,3,1,1,1,'\"[\\\"team_menu\\\",\\\"team_list\\\",\\\"team_create\\\",\\\"team_update\\\",\\\"team_edit\\\",\\\"team_delete\\\",\\\"team_member_view\\\",\\\"team_member_create\\\",\\\"team_member_edit\\\",\\\"team_member_delete\\\",\\\"team_member_assign\\\",\\\"team_member_unassign\\\",\\\"dashboard\\\",\\\"designation_read\\\",\\\"designation_create\\\",\\\"designation_update\\\",\\\"designation_delete\\\",\\\"shift_read\\\",\\\"shift_create\\\",\\\"shift_update\\\",\\\"shift_delete\\\",\\\"department_read\\\",\\\"department_create\\\",\\\"department_update\\\",\\\"department_delete\\\",\\\"user_menu\\\",\\\"user_read\\\",\\\"profile_view\\\",\\\"user_create\\\",\\\"user_edit\\\",\\\"user_update\\\",\\\"user_delete\\\",\\\"user_banned\\\",\\\"user_unbanned\\\",\\\"make_hr\\\",\\\"user_permission\\\",\\\"profile_image_view\\\",\\\"user_device_list\\\",\\\"reset_device\\\",\\\"role_read\\\",\\\"role_create\\\",\\\"role_update\\\",\\\"role_delete\\\",\\\"branch_read\\\",\\\"branch_create\\\",\\\"branch_update\\\",\\\"branch_delete\\\",\\\"leave_menu\\\",\\\"leave_type_read\\\",\\\"leave_type_create\\\",\\\"leave_type_update\\\",\\\"leave_type_delete\\\",\\\"leave_assign_read\\\",\\\"leave_assign_create\\\",\\\"leave_assign_update\\\",\\\"leave_assign_delete\\\",\\\"leave_request_read\\\",\\\"leave_request_create\\\",\\\"leave_request_approve\\\",\\\"leave_request_reject\\\",\\\"leave_request_delete\\\",\\\"appointment_read\\\",\\\"appointment_menu\\\",\\\"appointment_create\\\",\\\"appointment_approve\\\",\\\"appointment_reject\\\",\\\"appointment_delete\\\",\\\"weekend_read\\\",\\\"weekend_update\\\",\\\"attendance_update\\\",\\\"holiday_read\\\",\\\"holiday_create\\\",\\\"holiday_update\\\",\\\"holiday_delete\\\",\\\"schedule_read\\\",\\\"schedule_create\\\",\\\"schedule_update\\\",\\\"schedule_delete\\\",\\\"attendance_menu\\\",\\\"attendance_read\\\",\\\"attendance_create\\\",\\\"attendance_update\\\",\\\"attendance_delete\\\",\\\"leave_settings_read\\\",\\\"leave_settings_update\\\",\\\"company_settings_read\\\",\\\"company_settings_update\\\",\\\"locationApi\\\",\\\"company_setup_menu\\\",\\\"company_setup_activation\\\",\\\"company_setup_configuration\\\",\\\"company_setup_ip_whitelist\\\",\\\"company_setup_location\\\",\\\"ip_read\\\",\\\"ip_create\\\",\\\"ip_update\\\",\\\"ip_delete\\\",\\\"attendance_report_read\\\",\\\"live_tracking_read\\\",\\\"report_menu\\\",\\\"report\\\",\\\"claim_read\\\",\\\"claim_create\\\",\\\"claim_update\\\",\\\"claim_delete\\\",\\\"payment_read\\\",\\\"payment_create\\\",\\\"payment_update\\\",\\\"payment_delete\\\",\\\"visit_menu\\\",\\\"visit_read\\\",\\\"visit_view\\\",\\\"visit_update\\\",\\\"payroll_menu\\\",\\\"list_payroll_item\\\",\\\"create_payroll_item\\\",\\\"store_payroll_item\\\",\\\"update_payroll_item\\\",\\\"delete_payroll_item\\\",\\\"view_payroll_item\\\",\\\"payroll_item_menu\\\",\\\"list_payroll_set\\\",\\\"create_payroll_set\\\",\\\"store_payroll_set\\\",\\\"update_payroll_set\\\",\\\"delete_payroll_set\\\",\\\"view_payroll_set\\\",\\\"edit_payroll_set\\\",\\\"payroll_set_menu\\\",\\\"advance_salaries_menu\\\",\\\"advance_salaries_create\\\",\\\"advance_salaries_store\\\",\\\"advance_salaries_edit\\\",\\\"advance_salaries_update\\\",\\\"advance_salaries_delete\\\",\\\"advance_salaries_view\\\",\\\"advance_salaries_approve\\\",\\\"advance_salaries_list\\\",\\\"advance_salaries_pay\\\",\\\"advance_salaries_invoice\\\",\\\"advance_salaries_search\\\",\\\"payslip_menu\\\",\\\"salary_generate\\\",\\\"salary_view\\\",\\\"salary_delete\\\",\\\"salary_edit\\\",\\\"salary_update\\\",\\\"salary_payment\\\",\\\"payslip_list\\\",\\\"advance_type_menu\\\",\\\"advance_type_create\\\",\\\"advance_type_store\\\",\\\"advance_type_edit\\\",\\\"advance_type_update\\\",\\\"advance_type_delete\\\",\\\"advance_type_view\\\",\\\"advance_type_list\\\",\\\"salary_menu\\\",\\\"salary_store\\\",\\\"salary_edit\\\",\\\"salary_update\\\",\\\"salary_delete\\\",\\\"salary_view\\\",\\\"salary_list\\\",\\\"salary_search\\\",\\\"salary_pay\\\",\\\"salary_invoice\\\",\\\"salary_approve\\\",\\\"salary_generate\\\",\\\"salary_calculate\\\",\\\"account_menu\\\",\\\"account_create\\\",\\\"account_store\\\",\\\"account_edit\\\",\\\"account_update\\\",\\\"account_delete\\\",\\\"account_view\\\",\\\"account_list\\\",\\\"account_search\\\",\\\"deposit_menu\\\",\\\"deposit_create\\\",\\\"deposit_store\\\",\\\"deposit_edit\\\",\\\"deposit_update\\\",\\\"deposit_delete\\\",\\\"deposit_list\\\",\\\"expense_menu\\\",\\\"expense_create\\\",\\\"expense_store\\\",\\\"expense_edit\\\",\\\"expense_update\\\",\\\"expense_delete\\\",\\\"expense_list\\\",\\\"expense_view\\\",\\\"expense_approve\\\",\\\"expense_invoice\\\",\\\"expense_pay\\\",\\\"transaction_menu\\\",\\\"transaction_create\\\",\\\"transaction_store\\\",\\\"transaction_edit\\\",\\\"transaction_update\\\",\\\"transaction_delete\\\",\\\"transaction_view\\\",\\\"transaction_list\\\",\\\"deposit_category_menu\\\",\\\"deposit_category_create\\\",\\\"deposit_category_store\\\",\\\"deposit_category_edit\\\",\\\"deposit_category_update\\\",\\\"deposit_category_delete\\\",\\\"deposit_category_list\\\",\\\"payment_method_menu\\\",\\\"payment_method_create\\\",\\\"payment_method_store\\\",\\\"payment_method_edit\\\",\\\"payment_method_update\\\",\\\"payment_method_delete\\\",\\\"payment_method_list\\\",\\\"travel_menu\\\",\\\"travel_create\\\",\\\"travel_store\\\",\\\"travel_edit\\\",\\\"travel_update\\\",\\\"travel_delete\\\",\\\"travel_list\\\",\\\"travel_view\\\",\\\"travel_approve\\\",\\\"travel_invoice\\\",\\\"travel_pay\\\",\\\"meeting_menu\\\",\\\"meeting_create\\\",\\\"meeting_store\\\",\\\"meeting_edit\\\",\\\"meeting_update\\\",\\\"meeting_delete\\\",\\\"meeting_list\\\",\\\"meeting_view\\\",\\\"task_menu\\\",\\\"task.create\\\",\\\"task.index\\\",\\\"task.view\\\",\\\"task.edit\\\",\\\"conference_create\\\",\\\"conference_read\\\",\\\"conference_store\\\",\\\"conference_update\\\",\\\"conference_delete\\\",\\\"conference_join\\\",\\\"announcement_menu\\\",\\\"notice_menu\\\",\\\"notice_list\\\",\\\"notice_create\\\",\\\"notice_update\\\",\\\"notice_edit\\\",\\\"notice_delete\\\",\\\"send_sms_menu\\\",\\\"send_sms_list\\\",\\\"send_sms_create\\\",\\\"send_sms_update\\\",\\\"send_sms_edit\\\",\\\"send_sms_delete\\\",\\\"send_email_menu\\\",\\\"send_email_list\\\",\\\"send_email_create\\\",\\\"send_email_update\\\",\\\"send_email_edit\\\",\\\"send_email_delete\\\",\\\"send_notification_menu\\\",\\\"send_notification_list\\\",\\\"send_notification_create\\\",\\\"send_notification_update\\\",\\\"send_notification_edit\\\",\\\"send_notification_delete\\\",\\\"announcement_menu\\\",\\\"notice_menu\\\",\\\"notice_list\\\",\\\"notice_create\\\",\\\"notice_update\\\",\\\"notice_edit\\\",\\\"notice_delete\\\",\\\"send_sms_menu\\\",\\\"send_sms_list\\\",\\\"send_sms_create\\\",\\\"send_sms_update\\\",\\\"send_sms_edit\\\",\\\"send_sms_delete\\\",\\\"send_email_menu\\\",\\\"send_email_list\\\",\\\"send_email_create\\\",\\\"send_email_update\\\",\\\"send_email_edit\\\",\\\"send_email_delete\\\",\\\"send_notification_menu\\\",\\\"send_notification_list\\\",\\\"send_notification_create\\\",\\\"send_notification_update\\\",\\\"send_notification_edit\\\",\\\"send_notification_delete\\\",\\\"support_menu\\\",\\\"support_read\\\",\\\"support_create\\\",\\\"support_reply\\\",\\\"support_delete\\\"]\"',NULL,NULL,'EMP-','On Probation',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ZKkn8byj0F','verified','2024-02-06 05:41:55',NULL,'verified',NULL,'$2y$10$VlSjZ6kqLpYPnaqGGiVkauNxI63IPhFQe4VzdPMzUuHKbrkBOAF6q',NULL,NULL,1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'Islam',NULL,NULL,0.00,'Unmarried',NULL,NULL,1,0,0,0,0,0,'Asia/Dhaka','english',NULL,NULL,NULL,'gaFkMJkKsu',NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55',1,1,NULL,NULL,NULL,NULL),
(9,223,'HR2',NULL,1,NULL,'hr2@onesttech.com','01712xxxxxxxx','0',1,3,1,1,1,'\"[\\\"team_menu\\\",\\\"team_list\\\",\\\"team_create\\\",\\\"team_update\\\",\\\"team_edit\\\",\\\"team_delete\\\",\\\"team_member_view\\\",\\\"team_member_create\\\",\\\"team_member_edit\\\",\\\"team_member_delete\\\",\\\"team_member_assign\\\",\\\"team_member_unassign\\\",\\\"dashboard\\\",\\\"designation_read\\\",\\\"designation_create\\\",\\\"designation_update\\\",\\\"designation_delete\\\",\\\"shift_read\\\",\\\"shift_create\\\",\\\"shift_update\\\",\\\"shift_delete\\\",\\\"department_read\\\",\\\"department_create\\\",\\\"department_update\\\",\\\"department_delete\\\",\\\"user_menu\\\",\\\"user_read\\\",\\\"profile_view\\\",\\\"user_create\\\",\\\"user_edit\\\",\\\"user_update\\\",\\\"user_delete\\\",\\\"user_banned\\\",\\\"user_unbanned\\\",\\\"make_hr\\\",\\\"user_permission\\\",\\\"profile_image_view\\\",\\\"user_device_list\\\",\\\"reset_device\\\",\\\"role_read\\\",\\\"role_create\\\",\\\"role_update\\\",\\\"role_delete\\\",\\\"branch_read\\\",\\\"branch_create\\\",\\\"branch_update\\\",\\\"branch_delete\\\",\\\"leave_menu\\\",\\\"leave_type_read\\\",\\\"leave_type_create\\\",\\\"leave_type_update\\\",\\\"leave_type_delete\\\",\\\"leave_assign_read\\\",\\\"leave_assign_create\\\",\\\"leave_assign_update\\\",\\\"leave_assign_delete\\\",\\\"leave_request_read\\\",\\\"leave_request_create\\\",\\\"leave_request_approve\\\",\\\"leave_request_reject\\\",\\\"leave_request_delete\\\",\\\"appointment_read\\\",\\\"appointment_menu\\\",\\\"appointment_create\\\",\\\"appointment_approve\\\",\\\"appointment_reject\\\",\\\"appointment_delete\\\",\\\"weekend_read\\\",\\\"weekend_update\\\",\\\"attendance_update\\\",\\\"holiday_read\\\",\\\"holiday_create\\\",\\\"holiday_update\\\",\\\"holiday_delete\\\",\\\"schedule_read\\\",\\\"schedule_create\\\",\\\"schedule_update\\\",\\\"schedule_delete\\\",\\\"attendance_menu\\\",\\\"attendance_read\\\",\\\"attendance_create\\\",\\\"attendance_update\\\",\\\"attendance_delete\\\",\\\"leave_settings_read\\\",\\\"leave_settings_update\\\",\\\"company_settings_read\\\",\\\"company_settings_update\\\",\\\"locationApi\\\",\\\"company_setup_menu\\\",\\\"company_setup_activation\\\",\\\"company_setup_configuration\\\",\\\"company_setup_ip_whitelist\\\",\\\"company_setup_location\\\",\\\"ip_read\\\",\\\"ip_create\\\",\\\"ip_update\\\",\\\"ip_delete\\\",\\\"attendance_report_read\\\",\\\"live_tracking_read\\\",\\\"report_menu\\\",\\\"report\\\",\\\"claim_read\\\",\\\"claim_create\\\",\\\"claim_update\\\",\\\"claim_delete\\\",\\\"payment_read\\\",\\\"payment_create\\\",\\\"payment_update\\\",\\\"payment_delete\\\",\\\"visit_menu\\\",\\\"visit_read\\\",\\\"visit_view\\\",\\\"visit_update\\\",\\\"payroll_menu\\\",\\\"list_payroll_item\\\",\\\"create_payroll_item\\\",\\\"store_payroll_item\\\",\\\"update_payroll_item\\\",\\\"delete_payroll_item\\\",\\\"view_payroll_item\\\",\\\"payroll_item_menu\\\",\\\"list_payroll_set\\\",\\\"create_payroll_set\\\",\\\"store_payroll_set\\\",\\\"update_payroll_set\\\",\\\"delete_payroll_set\\\",\\\"view_payroll_set\\\",\\\"edit_payroll_set\\\",\\\"payroll_set_menu\\\",\\\"advance_salaries_menu\\\",\\\"advance_salaries_create\\\",\\\"advance_salaries_store\\\",\\\"advance_salaries_edit\\\",\\\"advance_salaries_update\\\",\\\"advance_salaries_delete\\\",\\\"advance_salaries_view\\\",\\\"advance_salaries_approve\\\",\\\"advance_salaries_list\\\",\\\"advance_salaries_pay\\\",\\\"advance_salaries_invoice\\\",\\\"advance_salaries_search\\\",\\\"payslip_menu\\\",\\\"salary_generate\\\",\\\"salary_view\\\",\\\"salary_delete\\\",\\\"salary_edit\\\",\\\"salary_update\\\",\\\"salary_payment\\\",\\\"payslip_list\\\",\\\"advance_type_menu\\\",\\\"advance_type_create\\\",\\\"advance_type_store\\\",\\\"advance_type_edit\\\",\\\"advance_type_update\\\",\\\"advance_type_delete\\\",\\\"advance_type_view\\\",\\\"advance_type_list\\\",\\\"salary_menu\\\",\\\"salary_store\\\",\\\"salary_edit\\\",\\\"salary_update\\\",\\\"salary_delete\\\",\\\"salary_view\\\",\\\"salary_list\\\",\\\"salary_search\\\",\\\"salary_pay\\\",\\\"salary_invoice\\\",\\\"salary_approve\\\",\\\"salary_generate\\\",\\\"salary_calculate\\\",\\\"account_menu\\\",\\\"account_create\\\",\\\"account_store\\\",\\\"account_edit\\\",\\\"account_update\\\",\\\"account_delete\\\",\\\"account_view\\\",\\\"account_list\\\",\\\"account_search\\\",\\\"deposit_menu\\\",\\\"deposit_create\\\",\\\"deposit_store\\\",\\\"deposit_edit\\\",\\\"deposit_update\\\",\\\"deposit_delete\\\",\\\"deposit_list\\\",\\\"expense_menu\\\",\\\"expense_create\\\",\\\"expense_store\\\",\\\"expense_edit\\\",\\\"expense_update\\\",\\\"expense_delete\\\",\\\"expense_list\\\",\\\"expense_view\\\",\\\"expense_approve\\\",\\\"expense_invoice\\\",\\\"expense_pay\\\",\\\"transaction_menu\\\",\\\"transaction_create\\\",\\\"transaction_store\\\",\\\"transaction_edit\\\",\\\"transaction_update\\\",\\\"transaction_delete\\\",\\\"transaction_view\\\",\\\"transaction_list\\\",\\\"deposit_category_menu\\\",\\\"deposit_category_create\\\",\\\"deposit_category_store\\\",\\\"deposit_category_edit\\\",\\\"deposit_category_update\\\",\\\"deposit_category_delete\\\",\\\"deposit_category_list\\\",\\\"payment_method_menu\\\",\\\"payment_method_create\\\",\\\"payment_method_store\\\",\\\"payment_method_edit\\\",\\\"payment_method_update\\\",\\\"payment_method_delete\\\",\\\"payment_method_list\\\",\\\"travel_menu\\\",\\\"travel_create\\\",\\\"travel_store\\\",\\\"travel_edit\\\",\\\"travel_update\\\",\\\"travel_delete\\\",\\\"travel_list\\\",\\\"travel_view\\\",\\\"travel_approve\\\",\\\"travel_invoice\\\",\\\"travel_pay\\\",\\\"meeting_menu\\\",\\\"meeting_create\\\",\\\"meeting_store\\\",\\\"meeting_edit\\\",\\\"meeting_update\\\",\\\"meeting_delete\\\",\\\"meeting_list\\\",\\\"meeting_view\\\",\\\"task_menu\\\",\\\"task.create\\\",\\\"task.index\\\",\\\"task.view\\\",\\\"task.edit\\\",\\\"conference_create\\\",\\\"conference_read\\\",\\\"conference_store\\\",\\\"conference_update\\\",\\\"conference_delete\\\",\\\"conference_join\\\",\\\"announcement_menu\\\",\\\"notice_menu\\\",\\\"notice_list\\\",\\\"notice_create\\\",\\\"notice_update\\\",\\\"notice_edit\\\",\\\"notice_delete\\\",\\\"send_sms_menu\\\",\\\"send_sms_list\\\",\\\"send_sms_create\\\",\\\"send_sms_update\\\",\\\"send_sms_edit\\\",\\\"send_sms_delete\\\",\\\"send_email_menu\\\",\\\"send_email_list\\\",\\\"send_email_create\\\",\\\"send_email_update\\\",\\\"send_email_edit\\\",\\\"send_email_delete\\\",\\\"send_notification_menu\\\",\\\"send_notification_list\\\",\\\"send_notification_create\\\",\\\"send_notification_update\\\",\\\"send_notification_edit\\\",\\\"send_notification_delete\\\",\\\"announcement_menu\\\",\\\"notice_menu\\\",\\\"notice_list\\\",\\\"notice_create\\\",\\\"notice_update\\\",\\\"notice_edit\\\",\\\"notice_delete\\\",\\\"send_sms_menu\\\",\\\"send_sms_list\\\",\\\"send_sms_create\\\",\\\"send_sms_update\\\",\\\"send_sms_edit\\\",\\\"send_sms_delete\\\",\\\"send_email_menu\\\",\\\"send_email_list\\\",\\\"send_email_create\\\",\\\"send_email_update\\\",\\\"send_email_edit\\\",\\\"send_email_delete\\\",\\\"send_notification_menu\\\",\\\"send_notification_list\\\",\\\"send_notification_create\\\",\\\"send_notification_update\\\",\\\"send_notification_edit\\\",\\\"send_notification_delete\\\",\\\"support_menu\\\",\\\"support_read\\\",\\\"support_create\\\",\\\"support_reply\\\",\\\"support_delete\\\"]\"',NULL,NULL,'EMP-','On Probation',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'06OCEsoPr1','verified','2024-02-06 05:41:55',NULL,'verified',NULL,'$2y$10$NhiFCqoyIht0TR1.Xthih.wXFImkYqanbDhcQSBHD/hiUYfn0iTrK',NULL,NULL,1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'Islam',NULL,NULL,0.00,'Unmarried',NULL,NULL,1,0,0,0,0,0,'Asia/Dhaka','english',NULL,NULL,NULL,'M5xK9H2grJ',NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55',1,1,NULL,NULL,NULL,NULL),
(10,223,'HR3',NULL,1,NULL,'hr3@onesttech.com','01713xxxxxxxx','0',1,3,1,1,1,'\"[\\\"team_menu\\\",\\\"team_list\\\",\\\"team_create\\\",\\\"team_update\\\",\\\"team_edit\\\",\\\"team_delete\\\",\\\"team_member_view\\\",\\\"team_member_create\\\",\\\"team_member_edit\\\",\\\"team_member_delete\\\",\\\"team_member_assign\\\",\\\"team_member_unassign\\\",\\\"dashboard\\\",\\\"designation_read\\\",\\\"designation_create\\\",\\\"designation_update\\\",\\\"designation_delete\\\",\\\"shift_read\\\",\\\"shift_create\\\",\\\"shift_update\\\",\\\"shift_delete\\\",\\\"department_read\\\",\\\"department_create\\\",\\\"department_update\\\",\\\"department_delete\\\",\\\"user_menu\\\",\\\"user_read\\\",\\\"profile_view\\\",\\\"user_create\\\",\\\"user_edit\\\",\\\"user_update\\\",\\\"user_delete\\\",\\\"user_banned\\\",\\\"user_unbanned\\\",\\\"make_hr\\\",\\\"user_permission\\\",\\\"profile_image_view\\\",\\\"user_device_list\\\",\\\"reset_device\\\",\\\"role_read\\\",\\\"role_create\\\",\\\"role_update\\\",\\\"role_delete\\\",\\\"branch_read\\\",\\\"branch_create\\\",\\\"branch_update\\\",\\\"branch_delete\\\",\\\"leave_menu\\\",\\\"leave_type_read\\\",\\\"leave_type_create\\\",\\\"leave_type_update\\\",\\\"leave_type_delete\\\",\\\"leave_assign_read\\\",\\\"leave_assign_create\\\",\\\"leave_assign_update\\\",\\\"leave_assign_delete\\\",\\\"leave_request_read\\\",\\\"leave_request_create\\\",\\\"leave_request_approve\\\",\\\"leave_request_reject\\\",\\\"leave_request_delete\\\",\\\"appointment_read\\\",\\\"appointment_menu\\\",\\\"appointment_create\\\",\\\"appointment_approve\\\",\\\"appointment_reject\\\",\\\"appointment_delete\\\",\\\"weekend_read\\\",\\\"weekend_update\\\",\\\"attendance_update\\\",\\\"holiday_read\\\",\\\"holiday_create\\\",\\\"holiday_update\\\",\\\"holiday_delete\\\",\\\"schedule_read\\\",\\\"schedule_create\\\",\\\"schedule_update\\\",\\\"schedule_delete\\\",\\\"attendance_menu\\\",\\\"attendance_read\\\",\\\"attendance_create\\\",\\\"attendance_update\\\",\\\"attendance_delete\\\",\\\"leave_settings_read\\\",\\\"leave_settings_update\\\",\\\"company_settings_read\\\",\\\"company_settings_update\\\",\\\"locationApi\\\",\\\"company_setup_menu\\\",\\\"company_setup_activation\\\",\\\"company_setup_configuration\\\",\\\"company_setup_ip_whitelist\\\",\\\"company_setup_location\\\",\\\"ip_read\\\",\\\"ip_create\\\",\\\"ip_update\\\",\\\"ip_delete\\\",\\\"attendance_report_read\\\",\\\"live_tracking_read\\\",\\\"report_menu\\\",\\\"report\\\",\\\"claim_read\\\",\\\"claim_create\\\",\\\"claim_update\\\",\\\"claim_delete\\\",\\\"payment_read\\\",\\\"payment_create\\\",\\\"payment_update\\\",\\\"payment_delete\\\",\\\"visit_menu\\\",\\\"visit_read\\\",\\\"visit_view\\\",\\\"visit_update\\\",\\\"payroll_menu\\\",\\\"list_payroll_item\\\",\\\"create_payroll_item\\\",\\\"store_payroll_item\\\",\\\"update_payroll_item\\\",\\\"delete_payroll_item\\\",\\\"view_payroll_item\\\",\\\"payroll_item_menu\\\",\\\"list_payroll_set\\\",\\\"create_payroll_set\\\",\\\"store_payroll_set\\\",\\\"update_payroll_set\\\",\\\"delete_payroll_set\\\",\\\"view_payroll_set\\\",\\\"edit_payroll_set\\\",\\\"payroll_set_menu\\\",\\\"advance_salaries_menu\\\",\\\"advance_salaries_create\\\",\\\"advance_salaries_store\\\",\\\"advance_salaries_edit\\\",\\\"advance_salaries_update\\\",\\\"advance_salaries_delete\\\",\\\"advance_salaries_view\\\",\\\"advance_salaries_approve\\\",\\\"advance_salaries_list\\\",\\\"advance_salaries_pay\\\",\\\"advance_salaries_invoice\\\",\\\"advance_salaries_search\\\",\\\"payslip_menu\\\",\\\"salary_generate\\\",\\\"salary_view\\\",\\\"salary_delete\\\",\\\"salary_edit\\\",\\\"salary_update\\\",\\\"salary_payment\\\",\\\"payslip_list\\\",\\\"advance_type_menu\\\",\\\"advance_type_create\\\",\\\"advance_type_store\\\",\\\"advance_type_edit\\\",\\\"advance_type_update\\\",\\\"advance_type_delete\\\",\\\"advance_type_view\\\",\\\"advance_type_list\\\",\\\"salary_menu\\\",\\\"salary_store\\\",\\\"salary_edit\\\",\\\"salary_update\\\",\\\"salary_delete\\\",\\\"salary_view\\\",\\\"salary_list\\\",\\\"salary_search\\\",\\\"salary_pay\\\",\\\"salary_invoice\\\",\\\"salary_approve\\\",\\\"salary_generate\\\",\\\"salary_calculate\\\",\\\"account_menu\\\",\\\"account_create\\\",\\\"account_store\\\",\\\"account_edit\\\",\\\"account_update\\\",\\\"account_delete\\\",\\\"account_view\\\",\\\"account_list\\\",\\\"account_search\\\",\\\"deposit_menu\\\",\\\"deposit_create\\\",\\\"deposit_store\\\",\\\"deposit_edit\\\",\\\"deposit_update\\\",\\\"deposit_delete\\\",\\\"deposit_list\\\",\\\"expense_menu\\\",\\\"expense_create\\\",\\\"expense_store\\\",\\\"expense_edit\\\",\\\"expense_update\\\",\\\"expense_delete\\\",\\\"expense_list\\\",\\\"expense_view\\\",\\\"expense_approve\\\",\\\"expense_invoice\\\",\\\"expense_pay\\\",\\\"transaction_menu\\\",\\\"transaction_create\\\",\\\"transaction_store\\\",\\\"transaction_edit\\\",\\\"transaction_update\\\",\\\"transaction_delete\\\",\\\"transaction_view\\\",\\\"transaction_list\\\",\\\"deposit_category_menu\\\",\\\"deposit_category_create\\\",\\\"deposit_category_store\\\",\\\"deposit_category_edit\\\",\\\"deposit_category_update\\\",\\\"deposit_category_delete\\\",\\\"deposit_category_list\\\",\\\"payment_method_menu\\\",\\\"payment_method_create\\\",\\\"payment_method_store\\\",\\\"payment_method_edit\\\",\\\"payment_method_update\\\",\\\"payment_method_delete\\\",\\\"payment_method_list\\\",\\\"travel_menu\\\",\\\"travel_create\\\",\\\"travel_store\\\",\\\"travel_edit\\\",\\\"travel_update\\\",\\\"travel_delete\\\",\\\"travel_list\\\",\\\"travel_view\\\",\\\"travel_approve\\\",\\\"travel_invoice\\\",\\\"travel_pay\\\",\\\"meeting_menu\\\",\\\"meeting_create\\\",\\\"meeting_store\\\",\\\"meeting_edit\\\",\\\"meeting_update\\\",\\\"meeting_delete\\\",\\\"meeting_list\\\",\\\"meeting_view\\\",\\\"task_menu\\\",\\\"task.create\\\",\\\"task.index\\\",\\\"task.view\\\",\\\"task.edit\\\",\\\"conference_create\\\",\\\"conference_read\\\",\\\"conference_store\\\",\\\"conference_update\\\",\\\"conference_delete\\\",\\\"conference_join\\\",\\\"announcement_menu\\\",\\\"notice_menu\\\",\\\"notice_list\\\",\\\"notice_create\\\",\\\"notice_update\\\",\\\"notice_edit\\\",\\\"notice_delete\\\",\\\"send_sms_menu\\\",\\\"send_sms_list\\\",\\\"send_sms_create\\\",\\\"send_sms_update\\\",\\\"send_sms_edit\\\",\\\"send_sms_delete\\\",\\\"send_email_menu\\\",\\\"send_email_list\\\",\\\"send_email_create\\\",\\\"send_email_update\\\",\\\"send_email_edit\\\",\\\"send_email_delete\\\",\\\"send_notification_menu\\\",\\\"send_notification_list\\\",\\\"send_notification_create\\\",\\\"send_notification_update\\\",\\\"send_notification_edit\\\",\\\"send_notification_delete\\\",\\\"announcement_menu\\\",\\\"notice_menu\\\",\\\"notice_list\\\",\\\"notice_create\\\",\\\"notice_update\\\",\\\"notice_edit\\\",\\\"notice_delete\\\",\\\"send_sms_menu\\\",\\\"send_sms_list\\\",\\\"send_sms_create\\\",\\\"send_sms_update\\\",\\\"send_sms_edit\\\",\\\"send_sms_delete\\\",\\\"send_email_menu\\\",\\\"send_email_list\\\",\\\"send_email_create\\\",\\\"send_email_update\\\",\\\"send_email_edit\\\",\\\"send_email_delete\\\",\\\"send_notification_menu\\\",\\\"send_notification_list\\\",\\\"send_notification_create\\\",\\\"send_notification_update\\\",\\\"send_notification_edit\\\",\\\"send_notification_delete\\\",\\\"support_menu\\\",\\\"support_read\\\",\\\"support_create\\\",\\\"support_reply\\\",\\\"support_delete\\\"]\"',NULL,NULL,'EMP-','On Probation',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'WP2ZKYwrBt','verified','2024-02-06 05:41:55',NULL,'verified',NULL,'$2y$10$vwU3FptteMoYDrfJcelprOp7H.TL8MIwCEPyxNxd.v4ZSHhGNbO3u',NULL,NULL,1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'Islam',NULL,NULL,0.00,'Unmarried',NULL,NULL,1,0,0,0,0,0,'Asia/Dhaka','english',NULL,NULL,NULL,'RDmJVRCcZA',NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55',1,1,NULL,NULL,NULL,NULL),
(11,223,'HR4',NULL,1,NULL,'hr4@onesttech.com','01714xxxxxxxx','0',1,3,1,1,1,'\"[\\\"team_menu\\\",\\\"team_list\\\",\\\"team_create\\\",\\\"team_update\\\",\\\"team_edit\\\",\\\"team_delete\\\",\\\"team_member_view\\\",\\\"team_member_create\\\",\\\"team_member_edit\\\",\\\"team_member_delete\\\",\\\"team_member_assign\\\",\\\"team_member_unassign\\\",\\\"dashboard\\\",\\\"designation_read\\\",\\\"designation_create\\\",\\\"designation_update\\\",\\\"designation_delete\\\",\\\"shift_read\\\",\\\"shift_create\\\",\\\"shift_update\\\",\\\"shift_delete\\\",\\\"department_read\\\",\\\"department_create\\\",\\\"department_update\\\",\\\"department_delete\\\",\\\"user_menu\\\",\\\"user_read\\\",\\\"profile_view\\\",\\\"user_create\\\",\\\"user_edit\\\",\\\"user_update\\\",\\\"user_delete\\\",\\\"user_banned\\\",\\\"user_unbanned\\\",\\\"make_hr\\\",\\\"user_permission\\\",\\\"profile_image_view\\\",\\\"user_device_list\\\",\\\"reset_device\\\",\\\"role_read\\\",\\\"role_create\\\",\\\"role_update\\\",\\\"role_delete\\\",\\\"branch_read\\\",\\\"branch_create\\\",\\\"branch_update\\\",\\\"branch_delete\\\",\\\"leave_menu\\\",\\\"leave_type_read\\\",\\\"leave_type_create\\\",\\\"leave_type_update\\\",\\\"leave_type_delete\\\",\\\"leave_assign_read\\\",\\\"leave_assign_create\\\",\\\"leave_assign_update\\\",\\\"leave_assign_delete\\\",\\\"leave_request_read\\\",\\\"leave_request_create\\\",\\\"leave_request_approve\\\",\\\"leave_request_reject\\\",\\\"leave_request_delete\\\",\\\"appointment_read\\\",\\\"appointment_menu\\\",\\\"appointment_create\\\",\\\"appointment_approve\\\",\\\"appointment_reject\\\",\\\"appointment_delete\\\",\\\"weekend_read\\\",\\\"weekend_update\\\",\\\"attendance_update\\\",\\\"holiday_read\\\",\\\"holiday_create\\\",\\\"holiday_update\\\",\\\"holiday_delete\\\",\\\"schedule_read\\\",\\\"schedule_create\\\",\\\"schedule_update\\\",\\\"schedule_delete\\\",\\\"attendance_menu\\\",\\\"attendance_read\\\",\\\"attendance_create\\\",\\\"attendance_update\\\",\\\"attendance_delete\\\",\\\"leave_settings_read\\\",\\\"leave_settings_update\\\",\\\"company_settings_read\\\",\\\"company_settings_update\\\",\\\"locationApi\\\",\\\"company_setup_menu\\\",\\\"company_setup_activation\\\",\\\"company_setup_configuration\\\",\\\"company_setup_ip_whitelist\\\",\\\"company_setup_location\\\",\\\"ip_read\\\",\\\"ip_create\\\",\\\"ip_update\\\",\\\"ip_delete\\\",\\\"attendance_report_read\\\",\\\"live_tracking_read\\\",\\\"report_menu\\\",\\\"report\\\",\\\"claim_read\\\",\\\"claim_create\\\",\\\"claim_update\\\",\\\"claim_delete\\\",\\\"payment_read\\\",\\\"payment_create\\\",\\\"payment_update\\\",\\\"payment_delete\\\",\\\"visit_menu\\\",\\\"visit_read\\\",\\\"visit_view\\\",\\\"visit_update\\\",\\\"payroll_menu\\\",\\\"list_payroll_item\\\",\\\"create_payroll_item\\\",\\\"store_payroll_item\\\",\\\"update_payroll_item\\\",\\\"delete_payroll_item\\\",\\\"view_payroll_item\\\",\\\"payroll_item_menu\\\",\\\"list_payroll_set\\\",\\\"create_payroll_set\\\",\\\"store_payroll_set\\\",\\\"update_payroll_set\\\",\\\"delete_payroll_set\\\",\\\"view_payroll_set\\\",\\\"edit_payroll_set\\\",\\\"payroll_set_menu\\\",\\\"advance_salaries_menu\\\",\\\"advance_salaries_create\\\",\\\"advance_salaries_store\\\",\\\"advance_salaries_edit\\\",\\\"advance_salaries_update\\\",\\\"advance_salaries_delete\\\",\\\"advance_salaries_view\\\",\\\"advance_salaries_approve\\\",\\\"advance_salaries_list\\\",\\\"advance_salaries_pay\\\",\\\"advance_salaries_invoice\\\",\\\"advance_salaries_search\\\",\\\"payslip_menu\\\",\\\"salary_generate\\\",\\\"salary_view\\\",\\\"salary_delete\\\",\\\"salary_edit\\\",\\\"salary_update\\\",\\\"salary_payment\\\",\\\"payslip_list\\\",\\\"advance_type_menu\\\",\\\"advance_type_create\\\",\\\"advance_type_store\\\",\\\"advance_type_edit\\\",\\\"advance_type_update\\\",\\\"advance_type_delete\\\",\\\"advance_type_view\\\",\\\"advance_type_list\\\",\\\"salary_menu\\\",\\\"salary_store\\\",\\\"salary_edit\\\",\\\"salary_update\\\",\\\"salary_delete\\\",\\\"salary_view\\\",\\\"salary_list\\\",\\\"salary_search\\\",\\\"salary_pay\\\",\\\"salary_invoice\\\",\\\"salary_approve\\\",\\\"salary_generate\\\",\\\"salary_calculate\\\",\\\"account_menu\\\",\\\"account_create\\\",\\\"account_store\\\",\\\"account_edit\\\",\\\"account_update\\\",\\\"account_delete\\\",\\\"account_view\\\",\\\"account_list\\\",\\\"account_search\\\",\\\"deposit_menu\\\",\\\"deposit_create\\\",\\\"deposit_store\\\",\\\"deposit_edit\\\",\\\"deposit_update\\\",\\\"deposit_delete\\\",\\\"deposit_list\\\",\\\"expense_menu\\\",\\\"expense_create\\\",\\\"expense_store\\\",\\\"expense_edit\\\",\\\"expense_update\\\",\\\"expense_delete\\\",\\\"expense_list\\\",\\\"expense_view\\\",\\\"expense_approve\\\",\\\"expense_invoice\\\",\\\"expense_pay\\\",\\\"transaction_menu\\\",\\\"transaction_create\\\",\\\"transaction_store\\\",\\\"transaction_edit\\\",\\\"transaction_update\\\",\\\"transaction_delete\\\",\\\"transaction_view\\\",\\\"transaction_list\\\",\\\"deposit_category_menu\\\",\\\"deposit_category_create\\\",\\\"deposit_category_store\\\",\\\"deposit_category_edit\\\",\\\"deposit_category_update\\\",\\\"deposit_category_delete\\\",\\\"deposit_category_list\\\",\\\"payment_method_menu\\\",\\\"payment_method_create\\\",\\\"payment_method_store\\\",\\\"payment_method_edit\\\",\\\"payment_method_update\\\",\\\"payment_method_delete\\\",\\\"payment_method_list\\\",\\\"travel_menu\\\",\\\"travel_create\\\",\\\"travel_store\\\",\\\"travel_edit\\\",\\\"travel_update\\\",\\\"travel_delete\\\",\\\"travel_list\\\",\\\"travel_view\\\",\\\"travel_approve\\\",\\\"travel_invoice\\\",\\\"travel_pay\\\",\\\"meeting_menu\\\",\\\"meeting_create\\\",\\\"meeting_store\\\",\\\"meeting_edit\\\",\\\"meeting_update\\\",\\\"meeting_delete\\\",\\\"meeting_list\\\",\\\"meeting_view\\\",\\\"task_menu\\\",\\\"task.create\\\",\\\"task.index\\\",\\\"task.view\\\",\\\"task.edit\\\",\\\"conference_create\\\",\\\"conference_read\\\",\\\"conference_store\\\",\\\"conference_update\\\",\\\"conference_delete\\\",\\\"conference_join\\\",\\\"announcement_menu\\\",\\\"notice_menu\\\",\\\"notice_list\\\",\\\"notice_create\\\",\\\"notice_update\\\",\\\"notice_edit\\\",\\\"notice_delete\\\",\\\"send_sms_menu\\\",\\\"send_sms_list\\\",\\\"send_sms_create\\\",\\\"send_sms_update\\\",\\\"send_sms_edit\\\",\\\"send_sms_delete\\\",\\\"send_email_menu\\\",\\\"send_email_list\\\",\\\"send_email_create\\\",\\\"send_email_update\\\",\\\"send_email_edit\\\",\\\"send_email_delete\\\",\\\"send_notification_menu\\\",\\\"send_notification_list\\\",\\\"send_notification_create\\\",\\\"send_notification_update\\\",\\\"send_notification_edit\\\",\\\"send_notification_delete\\\",\\\"announcement_menu\\\",\\\"notice_menu\\\",\\\"notice_list\\\",\\\"notice_create\\\",\\\"notice_update\\\",\\\"notice_edit\\\",\\\"notice_delete\\\",\\\"send_sms_menu\\\",\\\"send_sms_list\\\",\\\"send_sms_create\\\",\\\"send_sms_update\\\",\\\"send_sms_edit\\\",\\\"send_sms_delete\\\",\\\"send_email_menu\\\",\\\"send_email_list\\\",\\\"send_email_create\\\",\\\"send_email_update\\\",\\\"send_email_edit\\\",\\\"send_email_delete\\\",\\\"send_notification_menu\\\",\\\"send_notification_list\\\",\\\"send_notification_create\\\",\\\"send_notification_update\\\",\\\"send_notification_edit\\\",\\\"send_notification_delete\\\",\\\"support_menu\\\",\\\"support_read\\\",\\\"support_create\\\",\\\"support_reply\\\",\\\"support_delete\\\"]\"',NULL,NULL,'EMP-','On Probation',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Nxx9Ub3fte','verified','2024-02-06 05:41:55',NULL,'verified',NULL,'$2y$10$V.a8z1TM3MgUKXj9RJwh1OXZHASRLENRaDyU1YS1THDkj/3hND6z6',NULL,NULL,1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'Islam',NULL,NULL,0.00,'Unmarried',NULL,NULL,1,0,0,0,0,0,'Asia/Dhaka','english',NULL,NULL,NULL,'wS7YY16RIC',NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55',1,1,NULL,NULL,NULL,NULL),
(12,223,'HR5',NULL,1,NULL,'hr5@onesttech.com','01715xxxxxxxx','0',1,3,1,1,1,'\"[\\\"team_menu\\\",\\\"team_list\\\",\\\"team_create\\\",\\\"team_update\\\",\\\"team_edit\\\",\\\"team_delete\\\",\\\"team_member_view\\\",\\\"team_member_create\\\",\\\"team_member_edit\\\",\\\"team_member_delete\\\",\\\"team_member_assign\\\",\\\"team_member_unassign\\\",\\\"dashboard\\\",\\\"designation_read\\\",\\\"designation_create\\\",\\\"designation_update\\\",\\\"designation_delete\\\",\\\"shift_read\\\",\\\"shift_create\\\",\\\"shift_update\\\",\\\"shift_delete\\\",\\\"department_read\\\",\\\"department_create\\\",\\\"department_update\\\",\\\"department_delete\\\",\\\"user_menu\\\",\\\"user_read\\\",\\\"profile_view\\\",\\\"user_create\\\",\\\"user_edit\\\",\\\"user_update\\\",\\\"user_delete\\\",\\\"user_banned\\\",\\\"user_unbanned\\\",\\\"make_hr\\\",\\\"user_permission\\\",\\\"profile_image_view\\\",\\\"user_device_list\\\",\\\"reset_device\\\",\\\"role_read\\\",\\\"role_create\\\",\\\"role_update\\\",\\\"role_delete\\\",\\\"branch_read\\\",\\\"branch_create\\\",\\\"branch_update\\\",\\\"branch_delete\\\",\\\"leave_menu\\\",\\\"leave_type_read\\\",\\\"leave_type_create\\\",\\\"leave_type_update\\\",\\\"leave_type_delete\\\",\\\"leave_assign_read\\\",\\\"leave_assign_create\\\",\\\"leave_assign_update\\\",\\\"leave_assign_delete\\\",\\\"leave_request_read\\\",\\\"leave_request_create\\\",\\\"leave_request_approve\\\",\\\"leave_request_reject\\\",\\\"leave_request_delete\\\",\\\"appointment_read\\\",\\\"appointment_menu\\\",\\\"appointment_create\\\",\\\"appointment_approve\\\",\\\"appointment_reject\\\",\\\"appointment_delete\\\",\\\"weekend_read\\\",\\\"weekend_update\\\",\\\"attendance_update\\\",\\\"holiday_read\\\",\\\"holiday_create\\\",\\\"holiday_update\\\",\\\"holiday_delete\\\",\\\"schedule_read\\\",\\\"schedule_create\\\",\\\"schedule_update\\\",\\\"schedule_delete\\\",\\\"attendance_menu\\\",\\\"attendance_read\\\",\\\"attendance_create\\\",\\\"attendance_update\\\",\\\"attendance_delete\\\",\\\"leave_settings_read\\\",\\\"leave_settings_update\\\",\\\"company_settings_read\\\",\\\"company_settings_update\\\",\\\"locationApi\\\",\\\"company_setup_menu\\\",\\\"company_setup_activation\\\",\\\"company_setup_configuration\\\",\\\"company_setup_ip_whitelist\\\",\\\"company_setup_location\\\",\\\"ip_read\\\",\\\"ip_create\\\",\\\"ip_update\\\",\\\"ip_delete\\\",\\\"attendance_report_read\\\",\\\"live_tracking_read\\\",\\\"report_menu\\\",\\\"report\\\",\\\"claim_read\\\",\\\"claim_create\\\",\\\"claim_update\\\",\\\"claim_delete\\\",\\\"payment_read\\\",\\\"payment_create\\\",\\\"payment_update\\\",\\\"payment_delete\\\",\\\"visit_menu\\\",\\\"visit_read\\\",\\\"visit_view\\\",\\\"visit_update\\\",\\\"payroll_menu\\\",\\\"list_payroll_item\\\",\\\"create_payroll_item\\\",\\\"store_payroll_item\\\",\\\"update_payroll_item\\\",\\\"delete_payroll_item\\\",\\\"view_payroll_item\\\",\\\"payroll_item_menu\\\",\\\"list_payroll_set\\\",\\\"create_payroll_set\\\",\\\"store_payroll_set\\\",\\\"update_payroll_set\\\",\\\"delete_payroll_set\\\",\\\"view_payroll_set\\\",\\\"edit_payroll_set\\\",\\\"payroll_set_menu\\\",\\\"advance_salaries_menu\\\",\\\"advance_salaries_create\\\",\\\"advance_salaries_store\\\",\\\"advance_salaries_edit\\\",\\\"advance_salaries_update\\\",\\\"advance_salaries_delete\\\",\\\"advance_salaries_view\\\",\\\"advance_salaries_approve\\\",\\\"advance_salaries_list\\\",\\\"advance_salaries_pay\\\",\\\"advance_salaries_invoice\\\",\\\"advance_salaries_search\\\",\\\"payslip_menu\\\",\\\"salary_generate\\\",\\\"salary_view\\\",\\\"salary_delete\\\",\\\"salary_edit\\\",\\\"salary_update\\\",\\\"salary_payment\\\",\\\"payslip_list\\\",\\\"advance_type_menu\\\",\\\"advance_type_create\\\",\\\"advance_type_store\\\",\\\"advance_type_edit\\\",\\\"advance_type_update\\\",\\\"advance_type_delete\\\",\\\"advance_type_view\\\",\\\"advance_type_list\\\",\\\"salary_menu\\\",\\\"salary_store\\\",\\\"salary_edit\\\",\\\"salary_update\\\",\\\"salary_delete\\\",\\\"salary_view\\\",\\\"salary_list\\\",\\\"salary_search\\\",\\\"salary_pay\\\",\\\"salary_invoice\\\",\\\"salary_approve\\\",\\\"salary_generate\\\",\\\"salary_calculate\\\",\\\"account_menu\\\",\\\"account_create\\\",\\\"account_store\\\",\\\"account_edit\\\",\\\"account_update\\\",\\\"account_delete\\\",\\\"account_view\\\",\\\"account_list\\\",\\\"account_search\\\",\\\"deposit_menu\\\",\\\"deposit_create\\\",\\\"deposit_store\\\",\\\"deposit_edit\\\",\\\"deposit_update\\\",\\\"deposit_delete\\\",\\\"deposit_list\\\",\\\"expense_menu\\\",\\\"expense_create\\\",\\\"expense_store\\\",\\\"expense_edit\\\",\\\"expense_update\\\",\\\"expense_delete\\\",\\\"expense_list\\\",\\\"expense_view\\\",\\\"expense_approve\\\",\\\"expense_invoice\\\",\\\"expense_pay\\\",\\\"transaction_menu\\\",\\\"transaction_create\\\",\\\"transaction_store\\\",\\\"transaction_edit\\\",\\\"transaction_update\\\",\\\"transaction_delete\\\",\\\"transaction_view\\\",\\\"transaction_list\\\",\\\"deposit_category_menu\\\",\\\"deposit_category_create\\\",\\\"deposit_category_store\\\",\\\"deposit_category_edit\\\",\\\"deposit_category_update\\\",\\\"deposit_category_delete\\\",\\\"deposit_category_list\\\",\\\"payment_method_menu\\\",\\\"payment_method_create\\\",\\\"payment_method_store\\\",\\\"payment_method_edit\\\",\\\"payment_method_update\\\",\\\"payment_method_delete\\\",\\\"payment_method_list\\\",\\\"travel_menu\\\",\\\"travel_create\\\",\\\"travel_store\\\",\\\"travel_edit\\\",\\\"travel_update\\\",\\\"travel_delete\\\",\\\"travel_list\\\",\\\"travel_view\\\",\\\"travel_approve\\\",\\\"travel_invoice\\\",\\\"travel_pay\\\",\\\"meeting_menu\\\",\\\"meeting_create\\\",\\\"meeting_store\\\",\\\"meeting_edit\\\",\\\"meeting_update\\\",\\\"meeting_delete\\\",\\\"meeting_list\\\",\\\"meeting_view\\\",\\\"task_menu\\\",\\\"task.create\\\",\\\"task.index\\\",\\\"task.view\\\",\\\"task.edit\\\",\\\"conference_create\\\",\\\"conference_read\\\",\\\"conference_store\\\",\\\"conference_update\\\",\\\"conference_delete\\\",\\\"conference_join\\\",\\\"announcement_menu\\\",\\\"notice_menu\\\",\\\"notice_list\\\",\\\"notice_create\\\",\\\"notice_update\\\",\\\"notice_edit\\\",\\\"notice_delete\\\",\\\"send_sms_menu\\\",\\\"send_sms_list\\\",\\\"send_sms_create\\\",\\\"send_sms_update\\\",\\\"send_sms_edit\\\",\\\"send_sms_delete\\\",\\\"send_email_menu\\\",\\\"send_email_list\\\",\\\"send_email_create\\\",\\\"send_email_update\\\",\\\"send_email_edit\\\",\\\"send_email_delete\\\",\\\"send_notification_menu\\\",\\\"send_notification_list\\\",\\\"send_notification_create\\\",\\\"send_notification_update\\\",\\\"send_notification_edit\\\",\\\"send_notification_delete\\\",\\\"announcement_menu\\\",\\\"notice_menu\\\",\\\"notice_list\\\",\\\"notice_create\\\",\\\"notice_update\\\",\\\"notice_edit\\\",\\\"notice_delete\\\",\\\"send_sms_menu\\\",\\\"send_sms_list\\\",\\\"send_sms_create\\\",\\\"send_sms_update\\\",\\\"send_sms_edit\\\",\\\"send_sms_delete\\\",\\\"send_email_menu\\\",\\\"send_email_list\\\",\\\"send_email_create\\\",\\\"send_email_update\\\",\\\"send_email_edit\\\",\\\"send_email_delete\\\",\\\"send_notification_menu\\\",\\\"send_notification_list\\\",\\\"send_notification_create\\\",\\\"send_notification_update\\\",\\\"send_notification_edit\\\",\\\"send_notification_delete\\\",\\\"support_menu\\\",\\\"support_read\\\",\\\"support_create\\\",\\\"support_reply\\\",\\\"support_delete\\\"]\"',NULL,NULL,'EMP-','On Probation',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'8OM2IJFnIG','verified','2024-02-06 05:41:55',NULL,'verified',NULL,'$2y$10$gW3hm9LHC2exlFAca2BIE.W.fPx.ywOKeF.0pZW/lCGTHx6Ucvg5q',NULL,NULL,1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'Islam',NULL,NULL,0.00,'Unmarried',NULL,NULL,1,0,0,0,0,0,'Asia/Dhaka','english',NULL,NULL,NULL,'UsS7esPSPg',NULL,NULL,'2024-02-06 05:41:55','2024-02-06 05:41:55',1,1,NULL,NULL,NULL,NULL),
(13,223,'Staff1',NULL,1,NULL,'staff1@onesttech.com','0171xxxxxxx1','0',0,4,1,1,1,'\"[\\\"dashboard\\\",\\\"designation_read\\\",\\\"designation_create\\\",\\\"designation_update\\\",\\\"shift_read\\\",\\\"shift_create\\\",\\\"shift_update\\\",\\\"department_read\\\",\\\"department_create\\\",\\\"department_update\\\",\\\"user_menu\\\",\\\"user_read\\\",\\\"profile_view\\\",\\\"user_create\\\",\\\"user_edit\\\",\\\"user_update\\\",\\\"user_permission\\\",\\\"profile_image_view\\\",\\\"user_device_list\\\",\\\"role_read\\\",\\\"role_create\\\",\\\"role_update\\\",\\\"branch_read\\\",\\\"branch_create\\\",\\\"branch_update\\\",\\\"leave_menu\\\",\\\"leave_type_read\\\",\\\"leave_type_create\\\",\\\"leave_type_update\\\",\\\"leave_assign_read\\\",\\\"leave_assign_create\\\",\\\"leave_assign_update\\\",\\\"leave_request_read\\\",\\\"leave_request_create\\\",\\\"appointment_read\\\",\\\"appointment_menu\\\",\\\"appointment_create\\\",\\\"weekend_read\\\",\\\"attendance_update\\\",\\\"holiday_read\\\",\\\"holiday_create\\\",\\\"schedule_read\\\",\\\"schedule_create\\\",\\\"attendance_menu\\\",\\\"attendance_read\\\",\\\"attendance_create\\\",\\\"attendance_update\\\",\\\"leave_settings_read\\\",\\\"company_settings_read\\\",\\\"locationApi\\\",\\\"ip_read\\\",\\\"ip_create\\\",\\\"attendance_report_read\\\",\\\"live_tracking_read\\\",\\\"report_menu\\\",\\\"report\\\",\\\"claim_read\\\",\\\"claim_create\\\",\\\"payment_read\\\",\\\"payment_create\\\",\\\"visit_menu\\\",\\\"visit_read\\\",\\\"visit_view\\\",\\\"payroll_menu\\\",\\\"list_payroll_item\\\",\\\"view_payroll_item\\\",\\\"payroll_item_menu\\\",\\\"list_payroll_set\\\",\\\"view_payroll_set\\\",\\\"payroll_set_menu\\\",\\\"payslip_menu\\\",\\\"salary_generate\\\",\\\"salary_view\\\",\\\"salary_payment\\\",\\\"payslip_list\\\",\\\"salary_menu\\\",\\\"salary_view\\\",\\\"salary_list\\\",\\\"salary_search\\\",\\\"salary_pay\\\",\\\"salary_invoice\\\",\\\"salary_approve\\\",\\\"salary_generate\\\",\\\"salary_calculate\\\",\\\"account_menu\\\",\\\"account_view\\\",\\\"account_list\\\",\\\"account_search\\\",\\\"deposit_menu\\\",\\\"deposit_list\\\",\\\"expense_menu\\\",\\\"expense_list\\\",\\\"expense_view\\\",\\\"expense_approve\\\",\\\"expense_invoice\\\",\\\"expense_pay\\\",\\\"transaction_menu\\\",\\\"transaction_view\\\",\\\"transaction_list\\\",\\\"deposit_category_menu\\\",\\\"deposit_category_list\\\",\\\"payment_method_menu\\\",\\\"payment_method_list\\\",\\\"travel_menu\\\",\\\"travel_create\\\",\\\"travel_store\\\",\\\"travel_edit\\\",\\\"travel_update\\\",\\\"travel_list\\\",\\\"travel_view\\\",\\\"travel_approve\\\",\\\"travel_invoice\\\",\\\"travel_pay\\\",\\\"meeting_menu\\\",\\\"meeting_create\\\",\\\"meeting_store\\\",\\\"meeting_edit\\\",\\\"meeting_update\\\",\\\"meeting_list\\\",\\\"meeting_view\\\",\\\"task_menu\\\",\\\"task.create\\\",\\\"task.index\\\",\\\"task.view\\\",\\\"task.edit\\\"]\"',NULL,NULL,'EMP-','On Probation',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'YsEC0aichr','verified','2024-02-06 05:41:55',NULL,'verified',NULL,'$2y$10$s3T4KnnwpgsS95Xk4NdU0e2ItZst0Lxz7taelBEe0mX2nnnJL8Fii',NULL,NULL,1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'Islam',NULL,NULL,0.00,'Unmarried',NULL,NULL,1,0,0,0,0,0,'Asia/Dhaka','english',NULL,NULL,NULL,'VgONmbcqny',NULL,NULL,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `virtual_meetings`
--

DROP TABLE IF EXISTS `virtual_meetings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `virtual_meetings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `duration` int(11) DEFAULT 0 COMMENT '0 means unlimited',
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `host` varchar(255) NOT NULL DEFAULT 'jitsi',
  `description` text DEFAULT NULL,
  `datetime` text DEFAULT NULL,
  `status_id` bigint(20) unsigned NOT NULL DEFAULT 1,
  `created_by` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `virtual_meetings_created_by_foreign` (`created_by`),
  KEY `virtual_meetings_status_id_company_id_branch_id_index` (`status_id`,`company_id`,`branch_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `virtual_meetings_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `virtual_meetings_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `virtual_meetings`
--

LOCK TABLES `virtual_meetings` WRITE;
/*!40000 ALTER TABLE `virtual_meetings` DISABLE KEYS */;
/*!40000 ALTER TABLE `virtual_meetings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visit_images`
--

DROP TABLE IF EXISTS `visit_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visit_images` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `imageable_id` int(10) unsigned NOT NULL,
  `imageable_type` varchar(255) NOT NULL,
  `file_title` varchar(255) DEFAULT NULL,
  `file_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `visit_images_company_id_branch_id_index` (`company_id`,`branch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visit_images`
--

LOCK TABLES `visit_images` WRITE;
/*!40000 ALTER TABLE `visit_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `visit_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visit_notes`
--

DROP TABLE IF EXISTS `visit_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visit_notes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `visit_id` bigint(20) unsigned NOT NULL,
  `note` text NOT NULL,
  `status` enum('created','started','reached') NOT NULL DEFAULT 'created',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `visit_notes_visit_id_foreign` (`visit_id`),
  KEY `visit_notes_company_id_branch_id_index` (`company_id`,`branch_id`),
  CONSTRAINT `visit_notes_visit_id_foreign` FOREIGN KEY (`visit_id`) REFERENCES `visits` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visit_notes`
--

LOCK TABLES `visit_notes` WRITE;
/*!40000 ALTER TABLE `visit_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `visit_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visit_schedules`
--

DROP TABLE IF EXISTS `visit_schedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visit_schedules` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `visit_id` bigint(20) unsigned NOT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `note` longtext DEFAULT NULL,
  `status` enum('created','started','reached','end') NOT NULL DEFAULT 'created',
  `started_at` timestamp NULL DEFAULT NULL,
  `reached_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `visit_schedules_visit_id_company_id_branch_id_index` (`visit_id`,`company_id`,`branch_id`),
  CONSTRAINT `visit_schedules_visit_id_foreign` FOREIGN KEY (`visit_id`) REFERENCES `visits` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visit_schedules`
--

LOCK TABLES `visit_schedules` WRITE;
/*!40000 ALTER TABLE `visit_schedules` DISABLE KEYS */;
/*!40000 ALTER TABLE `visit_schedules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visits`
--

DROP TABLE IF EXISTS `visits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visits` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `status` enum('created','started','reached','completed','cancelled') NOT NULL DEFAULT 'created',
  `cancel_note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `visits_user_id_foreign` (`user_id`),
  KEY `visits_status_company_id_branch_id_index` (`status`,`company_id`,`branch_id`),
  CONSTRAINT `visits_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visits`
--

LOCK TABLES `visits` WRITE;
/*!40000 ALTER TABLE `visits` DISABLE KEYS */;
/*!40000 ALTER TABLE `visits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weekends`
--

DROP TABLE IF EXISTS `weekends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weekends` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` enum('saturday','sunday','monday','tuesday','wednesday','thursday','friday') NOT NULL,
  `order` int(11) DEFAULT NULL,
  `is_weekend` enum('yes','no') DEFAULT 'no',
  `status_id` bigint(20) unsigned NOT NULL,
  `created_by` bigint(20) unsigned DEFAULT 1,
  `updated_by` bigint(20) unsigned DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` bigint(20) unsigned DEFAULT 1,
  `branch_id` bigint(20) unsigned DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `weekends_status_id_foreign` (`status_id`),
  KEY `weekends_company_id_branch_id_index` (`company_id`,`branch_id`),
  CONSTRAINT `weekends_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weekends`
--

LOCK TABLES `weekends` WRITE;
/*!40000 ALTER TABLE `weekends` DISABLE KEYS */;
INSERT INTO `weekends` VALUES
(1,'saturday',NULL,'yes',1,1,1,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(2,'sunday',NULL,'yes',1,1,1,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(3,'monday',NULL,'no',1,1,1,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(4,'tuesday',NULL,'no',1,1,1,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(5,'wednesday',NULL,'no',1,1,1,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(6,'thursday',NULL,'no',1,1,1,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1),
(7,'friday',NULL,'no',1,1,1,'2024-02-06 05:41:56','2024-02-06 05:41:56',1,1);
/*!40000 ALTER TABLE `weekends` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-06 11:50:22
