-- MySQL dump 10.13  Distrib 8.4.4, for macos15 (arm64)
--
-- Host: 127.0.0.1    Database: martfury
-- ------------------------------------------------------
-- Server version	8.4.4

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
-- Table structure for table `activations`
--

DROP TABLE IF EXISTS `activations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `code` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activations_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activations`
--

LOCK TABLES `activations` WRITE;
/*!40000 ALTER TABLE `activations` DISABLE KEYS */;
INSERT INTO `activations` VALUES (1,1,'UnBZW7qdXbJy90VS5p7Df6mekvieHh9P',1,'2025-12-26 09:38:50','2025-12-26 09:38:50','2025-12-26 09:38:50');
/*!40000 ALTER TABLE `activations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_notifications`
--

DROP TABLE IF EXISTS `admin_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_notifications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `permission` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_notifications`
--

LOCK TABLES `admin_notifications` WRITE;
/*!40000 ALTER TABLE `admin_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ads`
--

DROP TABLE IF EXISTS `ads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ads` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expired_at` datetime DEFAULT NULL,
  `location` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clicked` bigint NOT NULL DEFAULT '0',
  `order` int DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `open_in_new_tab` tinyint(1) NOT NULL DEFAULT '1',
  `tablet_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ads_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google_adsense_slot_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ads_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ads`
--

LOCK TABLES `ads` WRITE;
/*!40000 ALTER TABLE `ads` DISABLE KEYS */;
INSERT INTO `ads` VALUES (1,'Top Slider Image 1','2030-12-26 00:00:00','not_set','VC2C8Q1UGCBG','promotion/1.jpg','/products',0,1,'published','2025-12-26 09:38:52','2025-12-26 09:38:52',1,NULL,NULL,NULL,NULL),(2,'Top Slider Image 2','2030-12-26 00:00:00','not_set','NBDWRXTSVZ8N','promotion/2.jpg','/products',0,2,'published','2025-12-26 09:38:52','2025-12-26 09:38:52',1,NULL,NULL,NULL,NULL),(3,'Homepage middle 1','2030-12-26 00:00:00','not_set','IZ6WU8KUALYD','promotion/3.jpg','/products',0,3,'published','2025-12-26 09:38:52','2025-12-26 09:38:52',1,NULL,NULL,NULL,NULL),(4,'Homepage middle 2','2030-12-26 00:00:00','not_set','ILSFJVYFGCPZ','promotion/4.jpg','/products',0,4,'published','2025-12-26 09:38:52','2025-12-26 09:38:52',1,NULL,NULL,NULL,NULL),(5,'Homepage middle 3','2030-12-26 00:00:00','not_set','ZDOZUZZIU7FT','promotion/5.jpg','/products',0,5,'published','2025-12-26 09:38:52','2025-12-26 09:38:52',1,NULL,NULL,NULL,NULL),(6,'Homepage big 1','2030-12-26 00:00:00','not_set','Q9YDUIC9HSWS','promotion/6.jpg','/products',0,6,'published','2025-12-26 09:38:52','2025-12-26 09:38:52',1,NULL,NULL,NULL,NULL),(7,'Homepage bottom small','2030-12-26 00:00:00','not_set','WLOKBA8FIVPA','promotion/7.jpg','/products',0,7,'published','2025-12-26 09:38:52','2025-12-26 09:38:52',1,NULL,NULL,NULL,NULL),(8,'Product sidebar','2030-12-26 00:00:00','product-sidebar','Q1QP5BQIG5RB','promotion/8.jpg','/products',0,8,'published','2025-12-26 09:38:52','2025-12-26 09:38:52',1,NULL,NULL,NULL,NULL),(9,'Homepage big 2','2030-12-26 00:00:00','not_set','IZ6WU8KUALYE','promotion/9.jpg','/products',0,9,'published','2025-12-26 09:38:52','2025-12-26 09:38:52',1,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `ads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ads_translations`
--

DROP TABLE IF EXISTS `ads_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ads_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ads_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tablet_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ads_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ads_translations`
--

LOCK TABLES `ads_translations` WRITE;
/*!40000 ALTER TABLE `ads_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ads_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_histories`
--

DROP TABLE IF EXISTS `audit_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_histories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'Botble\\ACL\\Models\\User',
  `module` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `request` longtext COLLATE utf8mb4_unicode_ci,
  `action` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `actor_id` bigint unsigned NOT NULL,
  `actor_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'Botble\\ACL\\Models\\User',
  `reference_id` bigint unsigned NOT NULL,
  `reference_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `audit_histories_user_id_index` (`user_id`),
  KEY `audit_histories_module_index` (`module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_histories`
--

LOCK TABLES `audit_histories` WRITE;
/*!40000 ALTER TABLE `audit_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `audit_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `author_id` bigint unsigned DEFAULT NULL,
  `author_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `icon` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int unsigned NOT NULL DEFAULT '0',
  `is_featured` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categories_parent_id_index` (`parent_id`),
  KEY `categories_status_index` (`status`),
  KEY `categories_created_at_index` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Ecommerce',0,'This is a sample description text for the category.','published',1,'Botble\\ACL\\Models\\User',NULL,0,0,1,'2025-12-26 09:38:51','2025-12-26 09:38:51'),(2,'Fashion',0,'This is a sample description text for the category.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2025-12-26 09:38:51','2025-12-26 09:38:51'),(3,'Electronic',0,'This is a sample description text for the category.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2025-12-26 09:38:51','2025-12-26 09:38:51'),(4,'Commercial',0,'This is a sample description text for the category.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2025-12-26 09:38:51','2025-12-26 09:38:51');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories_translations`
--

DROP TABLE IF EXISTS `categories_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categories_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`categories_id`),
  KEY `idx_categories_trans_categories_id` (`categories_id`),
  KEY `idx_categories_trans_category_lang` (`categories_id`,`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories_translations`
--

LOCK TABLES `categories_translations` WRITE;
/*!40000 ALTER TABLE `categories_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state_id` bigint unsigned DEFAULT NULL,
  `country_id` bigint unsigned DEFAULT NULL,
  `record_id` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `zip_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cities_slug_unique` (`slug`),
  KEY `idx_cities_name` (`name`),
  KEY `idx_cities_state_status` (`state_id`,`status`),
  KEY `idx_cities_status` (`status`),
  KEY `idx_cities_state_id` (`state_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities_translations`
--

DROP TABLE IF EXISTS `cities_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cities_id` bigint unsigned NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`cities_id`),
  KEY `idx_cities_trans_city_lang` (`cities_id`,`lang_code`),
  KEY `idx_cities_trans_name` (`name`),
  KEY `idx_cities_trans_cities_id` (`cities_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities_translations`
--

LOCK TABLES `cities_translations` WRITE;
/*!40000 ALTER TABLE `cities_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `cities_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_custom_field_options`
--

DROP TABLE IF EXISTS `contact_custom_field_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_custom_field_options` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `custom_field_id` bigint unsigned NOT NULL,
  `label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '999',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_custom_field_options`
--

LOCK TABLES `contact_custom_field_options` WRITE;
/*!40000 ALTER TABLE `contact_custom_field_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_custom_field_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_custom_field_options_translations`
--

DROP TABLE IF EXISTS `contact_custom_field_options_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_custom_field_options_translations` (
  `contact_custom_field_options_id` bigint unsigned NOT NULL,
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`contact_custom_field_options_id`),
  KEY `idx_contact_cfo_trans_cfo_id` (`contact_custom_field_options_id`),
  KEY `idx_contact_cfo_trans_cfo_lang` (`contact_custom_field_options_id`,`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_custom_field_options_translations`
--

LOCK TABLES `contact_custom_field_options_translations` WRITE;
/*!40000 ALTER TABLE `contact_custom_field_options_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_custom_field_options_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_custom_fields`
--

DROP TABLE IF EXISTS `contact_custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_custom_fields` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `placeholder` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int NOT NULL DEFAULT '999',
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_custom_fields`
--

LOCK TABLES `contact_custom_fields` WRITE;
/*!40000 ALTER TABLE `contact_custom_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_custom_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_custom_fields_translations`
--

DROP TABLE IF EXISTS `contact_custom_fields_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_custom_fields_translations` (
  `contact_custom_fields_id` bigint unsigned NOT NULL,
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `placeholder` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`contact_custom_fields_id`),
  KEY `idx_contact_cf_trans_cf_id` (`contact_custom_fields_id`),
  KEY `idx_contact_cf_trans_cf_lang` (`contact_custom_fields_id`,`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_custom_fields_translations`
--

LOCK TABLES `contact_custom_fields_translations` WRITE;
/*!40000 ALTER TABLE `contact_custom_fields_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_custom_fields_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_replies`
--

DROP TABLE IF EXISTS `contact_replies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_replies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_replies`
--

LOCK TABLES `contact_replies` WRITE;
/*!40000 ALTER TABLE `contact_replies` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_replies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `custom_fields` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unread',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
INSERT INTO `contacts` VALUES (1,'John Doe','contact_1@example.com','+15558904106','123 Main St, New York, US','General Inquiry','This is a sample contact message content for testing purposes.',NULL,'unread','2025-12-26 09:38:50','2025-12-26 09:38:50'),(2,'Michael Green','contact_2@example.com','+15557635440','123 Main St, New York, US','Support Request','This is a sample contact message content for testing purposes.',NULL,'read','2025-12-26 09:38:50','2025-12-26 09:38:50'),(3,'Emily White','contact_3@example.com','+15553662135','123 Main St, New York, US','Support Request','This is a sample contact message content for testing purposes.',NULL,'read','2025-12-26 09:38:50','2025-12-26 09:38:50'),(4,'Michael Green','contact_4@example.com','+15559159030','123 Main St, New York, US','Support Request','This is a sample contact message content for testing purposes.',NULL,'unread','2025-12-26 09:38:50','2025-12-26 09:38:50'),(5,'John Doe','contact_5@example.com','+15555857172','123 Main St, New York, US','Support Request','This is a sample contact message content for testing purposes.',NULL,'read','2025-12-26 09:38:50','2025-12-26 09:38:50'),(6,'Robert Brown','contact_6@example.com','+15554181693','123 Main St, New York, US','Support Request','This is a sample contact message content for testing purposes.',NULL,'unread','2025-12-26 09:38:50','2025-12-26 09:38:50'),(7,'John Doe','contact_7@example.com','+15555737597','123 Main St, New York, US','General Inquiry','This is a sample contact message content for testing purposes.',NULL,'unread','2025-12-26 09:38:50','2025-12-26 09:38:50'),(8,'Jane Smith','contact_8@example.com','+15558027287','123 Main St, New York, US','Feedback','This is a sample contact message content for testing purposes.',NULL,'unread','2025-12-26 09:38:50','2025-12-26 09:38:50'),(9,'Jane Smith','contact_9@example.com','+15556872597','123 Main St, New York, US','Other','This is a sample contact message content for testing purposes.',NULL,'unread','2025-12-26 09:38:50','2025-12-26 09:38:50'),(10,'Emily White','contact_10@example.com','+15556446804','123 Main St, New York, US','General Inquiry','This is a sample contact message content for testing purposes.',NULL,'unread','2025-12-26 09:38:50','2025-12-26 09:38:50');
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nationality` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_countries_name` (`name`),
  KEY `idx_countries_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries_translations`
--

DROP TABLE IF EXISTS `countries_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `countries_id` bigint unsigned NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nationality` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`countries_id`),
  KEY `idx_countries_trans_country_lang` (`countries_id`,`lang_code`),
  KEY `idx_countries_trans_name` (`name`),
  KEY `idx_countries_trans_countries_id` (`countries_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries_translations`
--

LOCK TABLES `countries_translations` WRITE;
/*!40000 ALTER TABLE `countries_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `countries_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_widget_settings`
--

DROP TABLE IF EXISTS `dashboard_widget_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_widget_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `user_id` bigint unsigned NOT NULL,
  `widget_id` bigint unsigned NOT NULL,
  `order` tinyint unsigned NOT NULL DEFAULT '0',
  `status` tinyint unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dashboard_widget_settings_user_id_index` (`user_id`),
  KEY `dashboard_widget_settings_widget_id_index` (`widget_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_widget_settings`
--

LOCK TABLES `dashboard_widget_settings` WRITE;
/*!40000 ALTER TABLE `dashboard_widget_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_widget_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_widgets`
--

DROP TABLE IF EXISTS `dashboard_widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_widgets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_widgets`
--

LOCK TABLES `dashboard_widgets` WRITE;
/*!40000 ALTER TABLE `dashboard_widgets` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_widgets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_tokens`
--

DROP TABLE IF EXISTS `device_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `device_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `platform` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `app_version` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `device_tokens_token_unique` (`token`),
  KEY `device_tokens_user_type_user_id_index` (`user_type`,`user_id`),
  KEY `device_tokens_platform_is_active_index` (`platform`,`is_active`),
  KEY `device_tokens_is_active_index` (`is_active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_tokens`
--

LOCK TABLES `device_tokens` WRITE;
/*!40000 ALTER TABLE `device_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `device_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_abandoned_carts`
--

DROP TABLE IF EXISTS `ec_abandoned_carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_abandoned_carts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` bigint unsigned DEFAULT NULL,
  `session_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cart_data` json NOT NULL,
  `total_amount` decimal(15,2) NOT NULL DEFAULT '0.00',
  `items_count` int NOT NULL DEFAULT '0',
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `abandoned_at` timestamp NULL DEFAULT NULL,
  `reminder_sent_at` timestamp NULL DEFAULT NULL,
  `reminders_sent` int NOT NULL DEFAULT '0',
  `last_email_sequence` tinyint unsigned NOT NULL DEFAULT '0',
  `recovery_token` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_code` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clicked_at` timestamp NULL DEFAULT NULL,
  `unsubscribe_token` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unsubscribed_at` timestamp NULL DEFAULT NULL,
  `is_recovered` tinyint(1) NOT NULL DEFAULT '0',
  `recovered_at` timestamp NULL DEFAULT NULL,
  `recovered_order_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_abandoned_carts_recovery_token_unique` (`recovery_token`),
  UNIQUE KEY `ec_abandoned_carts_unsubscribe_token_unique` (`unsubscribe_token`),
  KEY `ec_abandoned_carts_abandoned_at_is_recovered_index` (`abandoned_at`,`is_recovered`),
  KEY `ec_abandoned_carts_created_at_is_recovered_index` (`created_at`,`is_recovered`),
  KEY `ec_abandoned_carts_customer_id_index` (`customer_id`),
  KEY `ec_abandoned_carts_session_id_index` (`session_id`),
  KEY `ec_abandoned_carts_email_index` (`email`),
  KEY `ec_abandoned_carts_recovered_order_id_index` (`recovered_order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_abandoned_carts`
--

LOCK TABLES `ec_abandoned_carts` WRITE;
/*!40000 ALTER TABLE `ec_abandoned_carts` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_abandoned_carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_brands`
--

DROP TABLE IF EXISTS `ec_brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_brands` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `order` tinyint unsigned NOT NULL DEFAULT '0',
  `is_featured` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_brands`
--

LOCK TABLES `ec_brands` WRITE;
/*!40000 ALTER TABLE `ec_brands` DISABLE KEYS */;
INSERT INTO `ec_brands` VALUES (1,'Fashion live',NULL,NULL,'brands/1.jpg','published',0,1,'2025-12-26 09:38:19','2025-12-26 09:38:19'),(2,'Hand crafted',NULL,NULL,'brands/2.jpg','published',1,1,'2025-12-26 09:38:19','2025-12-26 09:38:19'),(3,'Mestonix',NULL,NULL,'brands/3.jpg','published',2,1,'2025-12-26 09:38:19','2025-12-26 09:38:19'),(4,'Sunshine',NULL,NULL,'brands/4.jpg','published',3,1,'2025-12-26 09:38:19','2025-12-26 09:38:19'),(5,'Pure',NULL,NULL,'brands/5.jpg','published',4,1,'2025-12-26 09:38:19','2025-12-26 09:38:19'),(6,'Anfold',NULL,NULL,'brands/6.jpg','published',5,1,'2025-12-26 09:38:19','2025-12-26 09:38:19'),(7,'Automotive',NULL,NULL,'brands/7.jpg','published',6,1,'2025-12-26 09:38:19','2025-12-26 09:38:19');
/*!40000 ALTER TABLE `ec_brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_brands_translations`
--

DROP TABLE IF EXISTS `ec_brands_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_brands_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_brands_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`ec_brands_id`),
  KEY `idx_brands_fk` (`ec_brands_id`),
  KEY `idx_brands_brands_lang` (`ec_brands_id`,`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_brands_translations`
--

LOCK TABLES `ec_brands_translations` WRITE;
/*!40000 ALTER TABLE `ec_brands_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_brands_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_cart`
--

DROP TABLE IF EXISTS `ec_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_cart` (
  `identifier` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `instance` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`identifier`,`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_cart`
--

LOCK TABLES `ec_cart` WRITE;
/*!40000 ALTER TABLE `ec_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_currencies`
--

DROP TABLE IF EXISTS `ec_currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_currencies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_prefix_symbol` tinyint unsigned NOT NULL DEFAULT '0',
  `decimals` tinyint unsigned DEFAULT '0',
  `number_format_style` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'western',
  `space_between_price_and_currency` tinyint(1) NOT NULL DEFAULT '0',
  `order` int unsigned DEFAULT '0',
  `is_default` tinyint NOT NULL DEFAULT '0',
  `exchange_rate` double NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_currencies`
--

LOCK TABLES `ec_currencies` WRITE;
/*!40000 ALTER TABLE `ec_currencies` DISABLE KEYS */;
INSERT INTO `ec_currencies` VALUES (1,'USD','$',1,2,'western',0,0,1,1,'2025-12-26 09:38:19','2025-12-26 09:38:19'),(2,'EUR','€',0,2,'western',0,1,0,0.84,'2025-12-26 09:38:19','2025-12-26 09:38:19'),(3,'VND','₫',0,0,'western',0,2,0,23203,'2025-12-26 09:38:19','2025-12-26 09:38:19'),(4,'NGN','₦',1,2,'western',0,2,0,895.52,'2025-12-26 09:38:19','2025-12-26 09:38:19');
/*!40000 ALTER TABLE `ec_currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_customer_addresses`
--

DROP TABLE IF EXISTS `ec_customer_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_customer_addresses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` bigint unsigned NOT NULL,
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `zip_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_customer_addresses`
--

LOCK TABLES `ec_customer_addresses` WRITE;
/*!40000 ALTER TABLE `ec_customer_addresses` DISABLE KEYS */;
INSERT INTO `ec_customer_addresses` VALUES (1,'John Doe','customer@botble.com','+15555804717','VN','Washington','London','101 Oak St',1,1,'2025-12-26 09:38:46','2025-12-26 09:38:46','20002'),(2,'John Doe','customer@botble.com','+15552708391','US','Florida','New York','456 Elm St',1,0,'2025-12-26 09:38:46','2025-12-26 09:38:46','50005'),(3,'Sarah Black','vendor@botble.com','+15551399517','KR','Florida','Melbourne','202 Maple St',2,1,'2025-12-26 09:38:46','2025-12-26 09:38:46','20002'),(4,'Sarah Black','vendor@botble.com','+15556279348','UK','Washington','New York','123 Main St',2,0,'2025-12-26 09:38:46','2025-12-26 09:38:46','40004'),(5,'Anna Orange','customer_1@example.com','+15558868093','KR','Florida','Melbourne','101 Oak St',3,1,'2025-12-26 09:38:47','2025-12-26 09:38:47','30003'),(6,'Robert Brown','customer_2@example.com','+15552298864','VN','Texas','Melbourne','789 Pine St',4,1,'2025-12-26 09:38:47','2025-12-26 09:38:47','40004'),(7,'Emily White','customer_3@example.com','+15553596926','JP','California','London','456 Elm St',5,1,'2025-12-26 09:38:47','2025-12-26 09:38:47','40004'),(8,'Sarah Black','customer_4@example.com','+15556386963','AU','Texas','Melbourne','456 Elm St',6,1,'2025-12-26 09:38:47','2025-12-26 09:38:47','50005'),(9,'Michael Green','customer_5@example.com','+15555980810','AU','California','Hanoi','456 Elm St',7,1,'2025-12-26 09:38:48','2025-12-26 09:38:48','30003'),(10,'Emily White','customer_6@example.com','+15559552608','KR','Texas','Paris','456 Elm St',8,1,'2025-12-26 09:38:48','2025-12-26 09:38:48','20002'),(11,'David Blue','customer_7@example.com','+15555186980','UK','New York','Hanoi','123 Main St',9,1,'2025-12-26 09:38:48','2025-12-26 09:38:48','30003'),(12,'David Blue','customer_8@example.com','+15555495085','KR','New York','Seoul','123 Main St',10,1,'2025-12-26 09:38:48','2025-12-26 09:38:48','10001');
/*!40000 ALTER TABLE `ec_customer_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_customer_deletion_requests`
--

DROP TABLE IF EXISTS `ec_customer_deletion_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_customer_deletion_requests` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` bigint unsigned NOT NULL,
  `customer_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `verification_code` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code_expires_at` timestamp NULL DEFAULT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'waiting_for_confirmation',
  `reason` text COLLATE utf8mb4_unicode_ci,
  `confirmed_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_customer_deletion_requests_token_unique` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_customer_deletion_requests`
--

LOCK TABLES `ec_customer_deletion_requests` WRITE;
/*!40000 ALTER TABLE `ec_customer_deletion_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_customer_deletion_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_customer_password_resets`
--

DROP TABLE IF EXISTS `ec_customer_password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_customer_password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `ec_customer_password_resets_email_index` (`email`),
  KEY `ec_customer_password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_customer_password_resets`
--

LOCK TABLES `ec_customer_password_resets` WRITE;
/*!40000 ALTER TABLE `ec_customer_password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_customer_password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_customer_recently_viewed_products`
--

DROP TABLE IF EXISTS `ec_customer_recently_viewed_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_customer_recently_viewed_products` (
  `customer_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`customer_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_customer_recently_viewed_products`
--

LOCK TABLES `ec_customer_recently_viewed_products` WRITE;
/*!40000 ALTER TABLE `ec_customer_recently_viewed_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_customer_recently_viewed_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_customer_used_coupons`
--

DROP TABLE IF EXISTS `ec_customer_used_coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_customer_used_coupons` (
  `discount_id` bigint unsigned NOT NULL,
  `customer_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`discount_id`,`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_customer_used_coupons`
--

LOCK TABLES `ec_customer_used_coupons` WRITE;
/*!40000 ALTER TABLE `ec_customer_used_coupons` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_customer_used_coupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_customers`
--

DROP TABLE IF EXISTS `ec_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_customers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `email_verify_token` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'activated',
  `block_reason` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `private_notes` text COLLATE utf8mb4_unicode_ci,
  `is_vendor` tinyint(1) NOT NULL DEFAULT '0',
  `vendor_verified_at` datetime DEFAULT NULL,
  `stripe_account_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_account_active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ec_customers_is_vendor_index` (`is_vendor`),
  KEY `ec_customers_vendor_verified_at_index` (`vendor_verified_at`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_customers`
--

LOCK TABLES `ec_customers` WRITE;
/*!40000 ALTER TABLE `ec_customers` DISABLE KEYS */;
INSERT INTO `ec_customers` VALUES (1,'John Doe','customer@botble.com','$2y$12$ropvk7rmbUnA.QDUJJj5BeL7IO2eeDRffpe4UuOkOKD1SMDdoj4oS','customers/10.jpg','1995-12-03','+15551143286',NULL,'2025-12-26 09:38:46','2025-12-26 09:38:46','2025-12-26 16:38:46',NULL,'activated',NULL,NULL,0,NULL,NULL,0),(2,'Sarah Black','vendor@botble.com','$2y$12$PsSGSbwAxFETG2Vp8GUguOMptIC3h5GtWcPOajcQhJW/cmJdryJlu','customers/10.jpg','1992-12-25','+15551392183',NULL,'2025-12-26 09:38:46','2025-12-26 09:38:57','2025-12-26 16:38:46',NULL,'activated',NULL,NULL,1,'2025-12-26 16:38:57',NULL,0),(3,'Anna Orange','customer_1@example.com','$2y$12$7z7nXJW8TU.L3LmP/W8p5.ZcsHld./wfCr3k28nTS/Y4PfZBNX/2S','customers/1.jpg','1996-12-15','+15556824634',NULL,'2025-12-26 09:38:47','2025-12-26 09:38:57','2025-12-26 16:38:47',NULL,'activated',NULL,NULL,1,'2025-12-26 16:38:57',NULL,0),(4,'Robert Brown','customer_2@example.com','$2y$12$QvaHrb6XKaiGBnR5aB2ZS.yMYzzTopZBn5u4547wzQi.N.fFDaXMG','customers/2.jpg','1984-12-11','+15557343151',NULL,'2025-12-26 09:38:47','2025-12-26 09:38:57','2025-12-26 16:38:47',NULL,'activated',NULL,NULL,1,'2025-12-26 16:38:57',NULL,0),(5,'Emily White','customer_3@example.com','$2y$12$/NLhzXdHEzfk8muzMbDCxua3xEB6YBrXbJmX2KzgQGYdnHcDjWdy.','customers/3.jpg','1996-11-28','+15554157296',NULL,'2025-12-26 09:38:47','2025-12-26 09:38:58','2025-12-26 16:38:47',NULL,'activated',NULL,NULL,1,'2025-12-26 16:38:57',NULL,0),(6,'Sarah Black','customer_4@example.com','$2y$12$Vy/vxH4ruli191MnEcDh4uxg4MUrcsOuVVvAaWj195bDdWTwPGosu','customers/4.jpg','1998-12-02','+15552048685',NULL,'2025-12-26 09:38:47','2025-12-26 09:38:58','2025-12-26 16:38:47',NULL,'activated',NULL,NULL,1,'2025-12-26 16:38:57',NULL,0),(7,'Michael Green','customer_5@example.com','$2y$12$85b/0yP4yP7sHHw7642B8.PFLZybC3AF3mluzKwgtRrVh8xt3f/ai','customers/5.jpg','1992-12-25','+15559440576',NULL,'2025-12-26 09:38:48','2025-12-26 09:38:58','2025-12-26 16:38:48',NULL,'activated',NULL,NULL,1,'2025-12-26 16:38:57',NULL,0),(8,'Emily White','customer_6@example.com','$2y$12$sr4jil/Q.cDdUhHWCWxD9uzva8BjzhF3NCbHrgGujg206aSHeMx5i','customers/6.jpg','1987-12-16','+15557149761',NULL,'2025-12-26 09:38:48','2025-12-26 09:38:58','2025-12-26 16:38:48',NULL,'activated',NULL,NULL,1,'2025-12-26 16:38:57',NULL,0),(9,'David Blue','customer_7@example.com','$2y$12$VMlu7gliFFEe.TGQ53vOl.dyf7t3FezNF7tjBqo6sASitl4FU6qlC','customers/7.jpg','1998-12-10','+15558401450',NULL,'2025-12-26 09:38:48','2025-12-26 09:38:59','2025-12-26 16:38:48',NULL,'activated',NULL,NULL,1,'2025-12-26 16:38:57',NULL,0),(10,'David Blue','customer_8@example.com','$2y$12$YiOzpHMEupqyj.RHArP6Z.34zdhDIzQ3EIuz8ZU.G/CWb.XkCMrl.','customers/8.jpg','2001-11-26','+15556303242',NULL,'2025-12-26 09:38:48','2025-12-26 09:38:59','2025-12-26 16:38:48',NULL,'activated',NULL,NULL,0,NULL,NULL,0);
/*!40000 ALTER TABLE `ec_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_discount_customers`
--

DROP TABLE IF EXISTS `ec_discount_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_discount_customers` (
  `discount_id` bigint unsigned NOT NULL,
  `customer_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`discount_id`,`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_discount_customers`
--

LOCK TABLES `ec_discount_customers` WRITE;
/*!40000 ALTER TABLE `ec_discount_customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_discount_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_discount_product_categories`
--

DROP TABLE IF EXISTS `ec_discount_product_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_discount_product_categories` (
  `discount_id` bigint unsigned NOT NULL,
  `product_category_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`discount_id`,`product_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_discount_product_categories`
--

LOCK TABLES `ec_discount_product_categories` WRITE;
/*!40000 ALTER TABLE `ec_discount_product_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_discount_product_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_discount_product_collections`
--

DROP TABLE IF EXISTS `ec_discount_product_collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_discount_product_collections` (
  `discount_id` bigint unsigned NOT NULL,
  `product_collection_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`discount_id`,`product_collection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_discount_product_collections`
--

LOCK TABLES `ec_discount_product_collections` WRITE;
/*!40000 ALTER TABLE `ec_discount_product_collections` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_discount_product_collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_discount_products`
--

DROP TABLE IF EXISTS `ec_discount_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_discount_products` (
  `discount_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`discount_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_discount_products`
--

LOCK TABLES `ec_discount_products` WRITE;
/*!40000 ALTER TABLE `ec_discount_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_discount_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_discounts`
--

DROP TABLE IF EXISTS `ec_discounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_discounts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `total_used` int unsigned NOT NULL DEFAULT '0',
  `value` double DEFAULT NULL,
  `type` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT 'coupon',
  `can_use_with_promotion` tinyint(1) NOT NULL DEFAULT '0',
  `can_use_with_flash_sale` tinyint(1) NOT NULL DEFAULT '0',
  `discount_on` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_quantity` int unsigned DEFAULT NULL,
  `type_option` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'amount',
  `target` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'all-orders',
  `min_order_price` decimal(15,2) DEFAULT NULL,
  `apply_via_url` tinyint(1) NOT NULL DEFAULT '0',
  `display_at_checkout` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `store_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_discounts_code_unique` (`code`),
  KEY `ec_discounts_store_id_index` (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_discounts`
--

LOCK TABLES `ec_discounts` WRITE;
/*!40000 ALTER TABLE `ec_discounts` DISABLE KEYS */;
INSERT INTO `ec_discounts` VALUES (1,'Discount 1','5QJVNRR95VST','2025-12-25 16:38:50','2026-01-10 16:38:50',NULL,0,899,'coupon',0,0,NULL,NULL,'amount','all-orders',NULL,0,1,'2025-12-26 09:38:50','2025-12-26 09:38:50',NULL,NULL),(2,'Discount 2','0DHHSHWNEEVE','2025-12-25 16:38:50',NULL,NULL,0,445,'coupon',0,0,NULL,NULL,'amount','all-orders',NULL,0,1,'2025-12-26 09:38:50','2025-12-26 09:38:50',NULL,NULL),(3,'Discount 3','KZY0QCCIY1FD','2025-12-25 16:38:50','2026-01-12 16:38:50',NULL,0,679,'coupon',0,0,NULL,NULL,'amount','all-orders',NULL,0,1,'2025-12-26 09:38:50','2025-12-26 09:38:50',NULL,NULL),(4,'Discount 4','UQQRB3UO3HDU','2025-12-25 16:38:50',NULL,NULL,0,857,'coupon',0,0,NULL,NULL,'amount','all-orders',NULL,0,1,'2025-12-26 09:38:50','2025-12-26 09:38:50',NULL,NULL),(5,'Discount 5','PHVQ9GDMG0KY','2025-12-25 16:38:50','2026-01-14 16:38:50',NULL,0,78,'coupon',0,0,NULL,NULL,'same-price','all-orders',NULL,0,1,'2025-12-26 09:38:50','2025-12-26 09:38:50',NULL,NULL),(6,'Discount 6','7KLBSSVNLO7A','2025-12-25 16:38:50','2026-01-25 16:38:50',NULL,0,349,'coupon',0,0,NULL,NULL,'same-price','all-orders',NULL,0,1,'2025-12-26 09:38:50','2025-12-26 09:38:50',NULL,NULL),(7,'Discount 7','K6TUSG0VG5CO','2025-12-25 16:38:50','2026-01-21 16:38:50',NULL,0,99,'coupon',0,0,NULL,NULL,'percentage','all-orders',NULL,0,1,'2025-12-26 09:38:50','2025-12-26 09:38:50',NULL,NULL),(8,'Discount 8','HBRPDAGMDJFA','2025-12-25 16:38:50','2026-01-11 16:38:50',NULL,0,83,'coupon',0,0,NULL,NULL,'percentage','all-orders',NULL,0,1,'2025-12-26 09:38:50','2025-12-26 09:38:50',NULL,NULL),(9,'Discount 9','PSONRBQI87KS','2025-12-25 16:38:50','2026-01-03 16:38:50',NULL,0,523,'coupon',0,0,NULL,NULL,'amount','all-orders',NULL,0,1,'2025-12-26 09:38:50','2025-12-26 09:38:50',NULL,NULL),(10,'Discount 10','8QT7ZWWJIMWF','2025-12-25 16:38:50',NULL,NULL,0,283,'coupon',0,0,NULL,NULL,'shipping','all-orders',NULL,0,1,'2025-12-26 09:38:50','2025-12-26 09:38:50',NULL,NULL);
/*!40000 ALTER TABLE `ec_discounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_flash_sale_products`
--

DROP TABLE IF EXISTS `ec_flash_sale_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_flash_sale_products` (
  `flash_sale_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `price` double unsigned DEFAULT NULL,
  `quantity` int unsigned DEFAULT NULL,
  `sold` int unsigned NOT NULL DEFAULT '0',
  KEY `ec_flash_sale_products_product_id_flash_sale_id_index` (`product_id`,`flash_sale_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_flash_sale_products`
--

LOCK TABLES `ec_flash_sale_products` WRITE;
/*!40000 ALTER TABLE `ec_flash_sale_products` DISABLE KEYS */;
INSERT INTO `ec_flash_sale_products` VALUES (1,1,184.821,18,2),(1,2,410.9828,10,5),(1,3,462.46,17,5),(1,4,477.84048,7,2),(1,5,512.69448,20,5),(1,6,1187.4104,17,4),(1,7,94.176,6,5),(1,8,268.70584,18,4),(1,9,116.7606,7,2),(1,10,512.861,9,1);
/*!40000 ALTER TABLE `ec_flash_sale_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_flash_sales`
--

DROP TABLE IF EXISTS `ec_flash_sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_flash_sales` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_date` datetime NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_flash_sales`
--

LOCK TABLES `ec_flash_sales` WRITE;
/*!40000 ALTER TABLE `ec_flash_sales` DISABLE KEYS */;
INSERT INTO `ec_flash_sales` VALUES (1,'Winter Sale','2026-09-25 00:00:00','published','2025-12-26 09:38:50','2025-12-26 09:38:50');
/*!40000 ALTER TABLE `ec_flash_sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_flash_sales_translations`
--

DROP TABLE IF EXISTS `ec_flash_sales_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_flash_sales_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_flash_sales_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_flash_sales_id`),
  KEY `idx_flash_sales_fk` (`ec_flash_sales_id`),
  KEY `idx_flash_sales_flash_sales_lang` (`ec_flash_sales_id`,`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_flash_sales_translations`
--

LOCK TABLES `ec_flash_sales_translations` WRITE;
/*!40000 ALTER TABLE `ec_flash_sales_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_flash_sales_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_global_option_value`
--

DROP TABLE IF EXISTS `ec_global_option_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_global_option_value` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `option_id` bigint unsigned NOT NULL COMMENT 'option id',
  `option_value` tinytext COLLATE utf8mb4_unicode_ci COMMENT 'option value',
  `affect_price` double DEFAULT NULL COMMENT 'value of price of this option affect',
  `order` int NOT NULL DEFAULT '9999',
  `affect_type` tinyint NOT NULL DEFAULT '0' COMMENT '0. fixed 1. percent',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_global_option_value`
--

LOCK TABLES `ec_global_option_value` WRITE;
/*!40000 ALTER TABLE `ec_global_option_value` DISABLE KEYS */;
INSERT INTO `ec_global_option_value` VALUES (1,1,'1 Year',0,9999,0,'2025-12-26 09:38:56','2025-12-26 09:38:56'),(2,1,'2 Year',10,9999,0,'2025-12-26 09:38:56','2025-12-26 09:38:56'),(3,1,'3 Year',20,9999,0,'2025-12-26 09:38:56','2025-12-26 09:38:56'),(4,2,'4GB',0,9999,0,'2025-12-26 09:38:56','2025-12-26 09:38:56'),(5,2,'8GB',10,9999,0,'2025-12-26 09:38:56','2025-12-26 09:38:56'),(6,2,'16GB',20,9999,0,'2025-12-26 09:38:56','2025-12-26 09:38:56'),(7,3,'Core i5',0,9999,0,'2025-12-26 09:38:56','2025-12-26 09:38:56'),(8,3,'Core i7',10,9999,0,'2025-12-26 09:38:56','2025-12-26 09:38:56'),(9,3,'Core i9',20,9999,0,'2025-12-26 09:38:56','2025-12-26 09:38:56'),(10,4,'128GB',0,9999,0,'2025-12-26 09:38:56','2025-12-26 09:38:56'),(11,4,'256GB',10,9999,0,'2025-12-26 09:38:56','2025-12-26 09:38:56'),(12,4,'512GB',20,9999,0,'2025-12-26 09:38:56','2025-12-26 09:38:56');
/*!40000 ALTER TABLE `ec_global_option_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_global_option_value_translations`
--

DROP TABLE IF EXISTS `ec_global_option_value_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_global_option_value_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_global_option_value_id` bigint unsigned NOT NULL,
  `option_value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_global_option_value_id`),
  KEY `idx_global_option_value_fk` (`ec_global_option_value_id`),
  KEY `idx_global_option_value_global_option_value_lang` (`ec_global_option_value_id`,`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_global_option_value_translations`
--

LOCK TABLES `ec_global_option_value_translations` WRITE;
/*!40000 ALTER TABLE `ec_global_option_value_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_global_option_value_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_global_options`
--

DROP TABLE IF EXISTS `ec_global_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_global_options` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Name of options',
  `option_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'option type',
  `required` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Checked if this option is required',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_global_options`
--

LOCK TABLES `ec_global_options` WRITE;
/*!40000 ALTER TABLE `ec_global_options` DISABLE KEYS */;
INSERT INTO `ec_global_options` VALUES (1,'Warranty','Botble\\Ecommerce\\Option\\OptionType\\RadioButton',1,'2025-12-26 09:38:56','2025-12-26 09:38:56'),(2,'RAM','Botble\\Ecommerce\\Option\\OptionType\\RadioButton',1,'2025-12-26 09:38:56','2025-12-26 09:38:56'),(3,'CPU','Botble\\Ecommerce\\Option\\OptionType\\RadioButton',1,'2025-12-26 09:38:56','2025-12-26 09:38:56'),(4,'HDD','Botble\\Ecommerce\\Option\\OptionType\\Dropdown',0,'2025-12-26 09:38:56','2025-12-26 09:38:56');
/*!40000 ALTER TABLE `ec_global_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_global_options_translations`
--

DROP TABLE IF EXISTS `ec_global_options_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_global_options_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_global_options_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_global_options_id`),
  KEY `idx_global_options_fk` (`ec_global_options_id`),
  KEY `idx_global_options_global_options_lang` (`ec_global_options_id`,`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_global_options_translations`
--

LOCK TABLES `ec_global_options_translations` WRITE;
/*!40000 ALTER TABLE `ec_global_options_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_global_options_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_grouped_products`
--

DROP TABLE IF EXISTS `ec_grouped_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_grouped_products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `parent_product_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `fixed_qty` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_grouped_products`
--

LOCK TABLES `ec_grouped_products` WRITE;
/*!40000 ALTER TABLE `ec_grouped_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_grouped_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_invoice_items`
--

DROP TABLE IF EXISTS `ec_invoice_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_invoice_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `invoice_id` bigint unsigned NOT NULL,
  `reference_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int unsigned NOT NULL,
  `price` decimal(15,2) NOT NULL DEFAULT '0.00',
  `sub_total` decimal(15,2) unsigned NOT NULL,
  `tax_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `discount_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `amount` decimal(15,2) unsigned NOT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_invoice_items_reference_type_reference_id_index` (`reference_type`,`reference_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_invoice_items`
--

LOCK TABLES `ec_invoice_items` WRITE;
/*!40000 ALTER TABLE `ec_invoice_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_invoice_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_invoices`
--

DROP TABLE IF EXISTS `ec_invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_invoices` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `reference_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_zip_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_address_line` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_tax_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_total` decimal(15,2) unsigned NOT NULL,
  `tax_amount` decimal(15,2) DEFAULT '0.00',
  `shipping_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `payment_fee` decimal(15,2) DEFAULT '0.00',
  `discount_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `shipping_option` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_method` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `coupon_code` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(15,2) unsigned NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `payment_id` bigint unsigned DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `paid_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_invoices_code_unique` (`code`),
  KEY `ec_invoices_reference_type_reference_id_index` (`reference_type`,`reference_id`),
  KEY `ec_invoices_payment_id_index` (`payment_id`),
  KEY `ec_invoices_status_index` (`status`),
  KEY `ec_invoices_reference_id_reference_type_index` (`reference_id`,`reference_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_invoices`
--

LOCK TABLES `ec_invoices` WRITE;
/*!40000 ALTER TABLE `ec_invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_option_value`
--

DROP TABLE IF EXISTS `ec_option_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_option_value` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `option_id` bigint unsigned NOT NULL COMMENT 'option id',
  `option_value` tinytext COLLATE utf8mb4_unicode_ci COMMENT 'option value',
  `affect_price` double DEFAULT NULL COMMENT 'value of price of this option affect',
  `order` int NOT NULL DEFAULT '9999',
  `affect_type` tinyint NOT NULL DEFAULT '0' COMMENT '0. fixed 1. percent',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_option_value`
--

LOCK TABLES `ec_option_value` WRITE;
/*!40000 ALTER TABLE `ec_option_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_option_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_option_value_translations`
--

DROP TABLE IF EXISTS `ec_option_value_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_option_value_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_option_value_id` bigint unsigned NOT NULL,
  `option_value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_option_value_id`),
  KEY `idx_option_value_fk` (`ec_option_value_id`),
  KEY `idx_option_value_option_value_lang` (`ec_option_value_id`,`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_option_value_translations`
--

LOCK TABLES `ec_option_value_translations` WRITE;
/*!40000 ALTER TABLE `ec_option_value_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_option_value_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_options`
--

DROP TABLE IF EXISTS `ec_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_options` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Name of options',
  `option_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'option type',
  `product_id` bigint unsigned NOT NULL DEFAULT '0',
  `order` int NOT NULL DEFAULT '9999',
  `required` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Checked if this option is required',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_options`
--

LOCK TABLES `ec_options` WRITE;
/*!40000 ALTER TABLE `ec_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_options_translations`
--

DROP TABLE IF EXISTS `ec_options_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_options_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_options_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_options_id`),
  KEY `idx_options_fk` (`ec_options_id`),
  KEY `idx_options_options_lang` (`ec_options_id`,`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_options_translations`
--

LOCK TABLES `ec_options_translations` WRITE;
/*!40000 ALTER TABLE `ec_options_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_options_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_order_addresses`
--

DROP TABLE IF EXISTS `ec_order_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_order_addresses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` bigint unsigned NOT NULL,
  `zip_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'shipping_address',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_order_addresses_order_id_type_unique` (`order_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_order_addresses`
--

LOCK TABLES `ec_order_addresses` WRITE;
/*!40000 ALTER TABLE `ec_order_addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_order_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_order_histories`
--

DROP TABLE IF EXISTS `ec_order_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_order_histories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `order_id` bigint unsigned NOT NULL,
  `extras` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_order_histories`
--

LOCK TABLES `ec_order_histories` WRITE;
/*!40000 ALTER TABLE `ec_order_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_order_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_order_metadata`
--

DROP TABLE IF EXISTS `ec_order_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_order_metadata` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint unsigned NOT NULL,
  `meta_key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_order_metadata_order_id_meta_key_index` (`order_id`,`meta_key`),
  KEY `ec_order_metadata_order_id_index` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_order_metadata`
--

LOCK TABLES `ec_order_metadata` WRITE;
/*!40000 ALTER TABLE `ec_order_metadata` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_order_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_order_product`
--

DROP TABLE IF EXISTS `ec_order_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_order_product` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint unsigned NOT NULL,
  `qty` int NOT NULL,
  `price` decimal(15,2) NOT NULL,
  `tax_amount` decimal(15,2) DEFAULT '0.00',
  `options` text COLLATE utf8mb4_unicode_ci,
  `product_options` text COLLATE utf8mb4_unicode_ci COMMENT 'product option data',
  `product_id` bigint unsigned DEFAULT NULL,
  `product_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight` double DEFAULT '0',
  `restock_quantity` int unsigned DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `product_type` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'physical',
  `times_downloaded` int NOT NULL DEFAULT '0',
  `license_code` text COLLATE utf8mb4_unicode_ci,
  `downloaded_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_order_product_order_id_product_id_index` (`order_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_order_product`
--

LOCK TABLES `ec_order_product` WRITE;
/*!40000 ALTER TABLE `ec_order_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_order_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_order_referrals`
--

DROP TABLE IF EXISTS `ec_order_referrals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_order_referrals` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(39) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `landing_domain` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `landing_page` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `landing_params` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referral` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gclid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fclid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `utm_source` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `utm_campaign` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `utm_medium` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `utm_term` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `utm_content` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referrer_url` text COLLATE utf8mb4_unicode_ci,
  `referrer_domain` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_order_referrals_order_id_index` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_order_referrals`
--

LOCK TABLES `ec_order_referrals` WRITE;
/*!40000 ALTER TABLE `ec_order_referrals` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_order_referrals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_order_return_histories`
--

DROP TABLE IF EXISTS `ec_order_return_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_order_return_histories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `order_return_id` bigint unsigned NOT NULL,
  `action` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reason` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_order_return_histories`
--

LOCK TABLES `ec_order_return_histories` WRITE;
/*!40000 ALTER TABLE `ec_order_return_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_order_return_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_order_return_items`
--

DROP TABLE IF EXISTS `ec_order_return_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_order_return_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_return_id` bigint unsigned NOT NULL COMMENT 'Order return id',
  `order_product_id` bigint unsigned NOT NULL COMMENT 'Order product id',
  `product_id` bigint unsigned NOT NULL COMMENT 'Product id',
  `product_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int NOT NULL COMMENT 'Quantity return',
  `price` decimal(15,2) NOT NULL COMMENT 'Price Product',
  `reason` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `refund_amount` decimal(12,2) DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_order_return_items`
--

LOCK TABLES `ec_order_return_items` WRITE;
/*!40000 ALTER TABLE `ec_order_return_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_order_return_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_order_returns`
--

DROP TABLE IF EXISTS `ec_order_returns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_order_returns` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` bigint unsigned NOT NULL COMMENT 'Order ID',
  `store_id` bigint unsigned DEFAULT NULL COMMENT 'Store ID',
  `user_id` bigint unsigned NOT NULL COMMENT 'Customer ID',
  `reason` text COLLATE utf8mb4_unicode_ci COMMENT 'Reason return order',
  `order_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Order current status',
  `return_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Return status',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_order_returns_code_unique` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_order_returns`
--

LOCK TABLES `ec_order_returns` WRITE;
/*!40000 ALTER TABLE `ec_order_returns` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_order_returns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_order_tax_information`
--

DROP TABLE IF EXISTS `ec_order_tax_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_order_tax_information` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint unsigned NOT NULL,
  `company_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_tax_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_email` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_order_tax_information_order_id_index` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_order_tax_information`
--

LOCK TABLES `ec_order_tax_information` WRITE;
/*!40000 ALTER TABLE `ec_order_tax_information` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_order_tax_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_orders`
--

DROP TABLE IF EXISTS `ec_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `shipping_option` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_method` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `status` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `amount` decimal(15,2) NOT NULL,
  `tax_amount` decimal(15,2) DEFAULT '0.00',
  `shipping_amount` decimal(15,2) DEFAULT NULL,
  `payment_fee` decimal(15,2) DEFAULT '0.00',
  `description` text COLLATE utf8mb4_unicode_ci,
  `coupon_code` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` decimal(15,2) DEFAULT NULL,
  `sub_total` decimal(15,2) NOT NULL,
  `is_confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `discount_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_finished` tinyint(1) DEFAULT '0',
  `cancellation_reason` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cancellation_reason_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `completed_at` timestamp NULL DEFAULT NULL,
  `token` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `proof_file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `private_notes` text COLLATE utf8mb4_unicode_ci,
  `store_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_orders_code_unique` (`code`),
  KEY `ec_orders_user_id_status_created_at_index` (`user_id`,`status`,`created_at`),
  KEY `ec_orders_status_created_at_index` (`status`,`created_at`),
  KEY `ec_orders_user_id_is_finished_index` (`user_id`,`is_finished`),
  KEY `ec_orders_store_id_index` (`store_id`),
  KEY `ec_orders_store_finished_index` (`store_id`,`is_finished`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_orders`
--

LOCK TABLES `ec_orders` WRITE;
/*!40000 ALTER TABLE `ec_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_attribute_sets`
--

DROP TABLE IF EXISTS `ec_product_attribute_sets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_attribute_sets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `display_layout` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'dropdown',
  `is_searchable` tinyint unsigned NOT NULL DEFAULT '1',
  `is_comparable` tinyint unsigned NOT NULL DEFAULT '1',
  `is_use_in_product_listing` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `order` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `use_image_from_product_variation` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_order_id` (`order`,`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_attribute_sets`
--

LOCK TABLES `ec_product_attribute_sets` WRITE;
/*!40000 ALTER TABLE `ec_product_attribute_sets` DISABLE KEYS */;
INSERT INTO `ec_product_attribute_sets` VALUES (1,'Color','color','visual',1,1,1,'published',0,'2025-12-26 09:38:20','2025-12-26 09:38:20',0),(2,'Size','size','text',1,1,1,'published',1,'2025-12-26 09:38:20','2025-12-26 09:38:20',0);
/*!40000 ALTER TABLE `ec_product_attribute_sets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_attribute_sets_translations`
--

DROP TABLE IF EXISTS `ec_product_attribute_sets_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_attribute_sets_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_product_attribute_sets_id` bigint unsigned NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_product_attribute_sets_id`),
  KEY `idx_product_attribute_sets_fk` (`ec_product_attribute_sets_id`),
  KEY `idx_product_attribute_sets_product_attribute_sets_lang` (`ec_product_attribute_sets_id`,`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_attribute_sets_translations`
--

LOCK TABLES `ec_product_attribute_sets_translations` WRITE;
/*!40000 ALTER TABLE `ec_product_attribute_sets_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_product_attribute_sets_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_attributes`
--

DROP TABLE IF EXISTS `ec_product_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_attributes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `attribute_set_id` bigint unsigned NOT NULL,
  `title` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `order` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attribute_set_status_index` (`attribute_set_id`),
  KEY `idx_attribute_set_id` (`attribute_set_id`),
  KEY `idx_attribute_set_order_id` (`attribute_set_id`,`order`,`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_attributes`
--

LOCK TABLES `ec_product_attributes` WRITE;
/*!40000 ALTER TABLE `ec_product_attributes` DISABLE KEYS */;
INSERT INTO `ec_product_attributes` VALUES (1,1,'Green','green','#5FB7D4',NULL,1,1,'2025-12-26 09:38:20','2025-12-26 09:38:20'),(2,1,'Blue','blue','#333333',NULL,0,2,'2025-12-26 09:38:20','2025-12-26 09:38:20'),(3,1,'Red','red','#DA323F',NULL,0,3,'2025-12-26 09:38:20','2025-12-26 09:38:20'),(4,1,'Black','black','#2F366C',NULL,0,4,'2025-12-26 09:38:20','2025-12-26 09:38:20'),(5,1,'Brown','brown','#87554B',NULL,0,5,'2025-12-26 09:38:20','2025-12-26 09:38:20'),(6,2,'S','s',NULL,NULL,1,1,'2025-12-26 09:38:20','2025-12-26 09:38:20'),(7,2,'M','m',NULL,NULL,0,2,'2025-12-26 09:38:20','2025-12-26 09:38:20'),(8,2,'L','l',NULL,NULL,0,3,'2025-12-26 09:38:20','2025-12-26 09:38:20'),(9,2,'XL','xl',NULL,NULL,0,4,'2025-12-26 09:38:20','2025-12-26 09:38:20'),(10,2,'XXL','xxl',NULL,NULL,0,5,'2025-12-26 09:38:20','2025-12-26 09:38:20');
/*!40000 ALTER TABLE `ec_product_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_attributes_translations`
--

DROP TABLE IF EXISTS `ec_product_attributes_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_attributes_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_product_attributes_id` bigint unsigned NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_product_attributes_id`),
  KEY `idx_product_attributes_fk` (`ec_product_attributes_id`),
  KEY `idx_product_attributes_product_attributes_lang` (`ec_product_attributes_id`,`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_attributes_translations`
--

LOCK TABLES `ec_product_attributes_translations` WRITE;
/*!40000 ALTER TABLE `ec_product_attributes_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_product_attributes_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_categories`
--

DROP TABLE IF EXISTS `ec_product_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `order` int unsigned NOT NULL DEFAULT '0',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_featured` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_product_categories_parent_id_status_created_at_index` (`parent_id`,`status`,`created_at`),
  KEY `ec_product_categories_parent_id_status_index` (`parent_id`,`status`),
  KEY `idx_categories_status_order` (`status`,`order`),
  KEY `idx_categories_order` (`order`),
  KEY `ec_product_categories_slug_index` (`slug`),
  KEY `idx_ec_product_categories_status` (`status`),
  KEY `idx_ec_product_categories_parent_id` (`parent_id`),
  KEY `idx_ec_product_categories_status_parent_order` (`status`,`parent_id`,`order`),
  KEY `idx_ec_product_categories_is_featured` (`is_featured`),
  KEY `idx_ec_product_categories_name` (`name`),
  KEY `idx_ec_product_categories_slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_categories`
--

LOCK TABLES `ec_product_categories` WRITE;
/*!40000 ALTER TABLE `ec_product_categories` DISABLE KEYS */;
INSERT INTO `ec_product_categories` VALUES (1,'Hot Promotions','hot-promotions',0,NULL,'published',0,NULL,0,'2025-12-26 09:38:20','2025-12-26 09:38:20','icon-star',NULL),(2,'Electronics','electronics',0,NULL,'published',1,'product-categories/1.jpg',1,'2025-12-26 09:38:20','2025-12-26 09:38:20','icon-laundry',NULL),(3,'Consumer Electronic','consumer-electronic',2,NULL,'published',0,NULL,0,'2025-12-26 09:38:20','2025-12-26 09:38:20',NULL,NULL),(4,'Home Audio & Theaters','home-audio-theaters',3,NULL,'published',0,NULL,0,'2025-12-26 09:38:20','2025-12-26 09:38:20',NULL,NULL),(5,'TV & Videos','tv-videos',3,NULL,'published',1,NULL,0,'2025-12-26 09:38:20','2025-12-26 09:38:20',NULL,NULL),(6,'Camera, Photos & Videos','camera-photos-videos',3,NULL,'published',2,NULL,0,'2025-12-26 09:38:20','2025-12-26 09:38:20',NULL,NULL),(7,'Cellphones & Accessories','cellphones-accessories',3,NULL,'published',3,NULL,0,'2025-12-26 09:38:20','2025-12-26 09:38:20',NULL,NULL),(8,'Headphones','headphones',3,NULL,'published',4,NULL,0,'2025-12-26 09:38:20','2025-12-26 09:38:20',NULL,NULL),(9,'Videos games','videos-games',3,NULL,'published',5,NULL,0,'2025-12-26 09:38:20','2025-12-26 09:38:20',NULL,NULL),(10,'Wireless Speakers','wireless-speakers',3,NULL,'published',6,NULL,0,'2025-12-26 09:38:20','2025-12-26 09:38:20',NULL,NULL),(11,'Office Electronic','office-electronic',3,NULL,'published',7,NULL,0,'2025-12-26 09:38:20','2025-12-26 09:38:20',NULL,NULL),(12,'Accessories & Parts','accessories-parts',2,NULL,'published',1,NULL,0,'2025-12-26 09:38:20','2025-12-26 09:38:20',NULL,NULL),(13,'Digital Cables','digital-cables',12,NULL,'published',0,NULL,0,'2025-12-26 09:38:20','2025-12-26 09:38:20',NULL,NULL),(14,'Audio & Video Cables','audio-video-cables',12,NULL,'published',1,NULL,0,'2025-12-26 09:38:20','2025-12-26 09:38:20',NULL,NULL),(15,'Batteries','batteries',12,NULL,'published',2,NULL,0,'2025-12-26 09:38:20','2025-12-26 09:38:20',NULL,NULL),(16,'Clothing','clothing',0,NULL,'published',2,'product-categories/2.jpg',1,'2025-12-26 09:38:20','2025-12-26 09:38:20','icon-shirt',NULL),(17,'Computers','computers',0,NULL,'published',3,'product-categories/3.jpg',1,'2025-12-26 09:38:20','2025-12-26 09:38:20','icon-desktop',NULL),(18,'Computer & Technologies','computer-technologies',17,NULL,'published',0,NULL,0,'2025-12-26 09:38:20','2025-12-26 09:38:20',NULL,NULL),(19,'Computer & Tablets','computer-tablets',18,NULL,'published',0,NULL,0,'2025-12-26 09:38:20','2025-12-26 09:38:20',NULL,NULL),(20,'Laptop','laptop',18,NULL,'published',1,NULL,0,'2025-12-26 09:38:20','2025-12-26 09:38:20',NULL,NULL),(21,'Monitors','monitors',18,NULL,'published',2,NULL,0,'2025-12-26 09:38:20','2025-12-26 09:38:20',NULL,NULL),(22,'Computer Components','computer-components',18,NULL,'published',3,NULL,0,'2025-12-26 09:38:20','2025-12-26 09:38:20',NULL,NULL),(23,'Networking','networking',17,NULL,'published',1,NULL,0,'2025-12-26 09:38:20','2025-12-26 09:38:20',NULL,NULL),(24,'Drive & Storages','drive-storages',23,NULL,'published',0,NULL,0,'2025-12-26 09:38:20','2025-12-26 09:38:20',NULL,NULL),(25,'Gaming Laptop','gaming-laptop',23,NULL,'published',1,NULL,0,'2025-12-26 09:38:20','2025-12-26 09:38:20',NULL,NULL),(26,'Security & Protection','security-protection',23,NULL,'published',2,NULL,0,'2025-12-26 09:38:20','2025-12-26 09:38:20',NULL,NULL),(27,'Accessories','accessories',23,NULL,'published',3,NULL,0,'2025-12-26 09:38:20','2025-12-26 09:38:20',NULL,NULL),(28,'Home & Kitchen','home-kitchen',0,NULL,'published',4,'product-categories/4.jpg',1,'2025-12-26 09:38:20','2025-12-26 09:38:20','icon-lampshade',NULL),(29,'Health & Beauty','health-beauty',0,NULL,'published',5,'product-categories/5.jpg',1,'2025-12-26 09:38:20','2025-12-26 09:38:20','icon-heart-pulse',NULL),(30,'Jewelry & Watch','jewelry-watch',0,NULL,'published',6,'product-categories/6.jpg',1,'2025-12-26 09:38:20','2025-12-26 09:38:20','icon-diamond2',NULL),(31,'Technology Toys','technology-toys',0,NULL,'published',7,'product-categories/7.jpg',1,'2025-12-26 09:38:20','2025-12-26 09:38:20','icon-desktop',NULL),(32,'Phones','phones',0,NULL,'published',8,'product-categories/8.jpg',1,'2025-12-26 09:38:20','2025-12-26 09:38:20','icon-smartphone',NULL),(33,'Babies & Moms','babies-moms',0,NULL,'published',9,NULL,0,'2025-12-26 09:38:20','2025-12-26 09:38:20','icon-baby-bottle',NULL),(34,'Sport & Outdoor','sport-outdoor',0,NULL,'published',10,NULL,0,'2025-12-26 09:38:20','2025-12-26 09:38:20','icon-baseball',NULL),(35,'Books & Office','books-office',0,NULL,'published',11,NULL,0,'2025-12-26 09:38:20','2025-12-26 09:38:20','icon-book2',NULL),(36,'Cars & Motorcycles','cars-motorcycles',0,NULL,'published',12,NULL,0,'2025-12-26 09:38:20','2025-12-26 09:38:20','icon-car-siren',NULL),(37,'Home Improvements','home-improvements',0,NULL,'published',13,NULL,0,'2025-12-26 09:38:20','2025-12-26 09:38:20','icon-wrench',NULL);
/*!40000 ALTER TABLE `ec_product_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_categories_translations`
--

DROP TABLE IF EXISTS `ec_product_categories_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_categories_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_product_categories_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`ec_product_categories_id`),
  KEY `idx_product_categories_fk` (`ec_product_categories_id`),
  KEY `idx_product_categories_product_categories_lang` (`ec_product_categories_id`,`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_categories_translations`
--

LOCK TABLES `ec_product_categories_translations` WRITE;
/*!40000 ALTER TABLE `ec_product_categories_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_product_categories_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_categorizables`
--

DROP TABLE IF EXISTS `ec_product_categorizables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_categorizables` (
  `category_id` bigint unsigned NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`category_id`,`reference_id`,`reference_type`),
  KEY `ec_product_categorizables_category_id_index` (`category_id`),
  KEY `ec_product_categorizables_reference_id_index` (`reference_id`),
  KEY `ec_product_categorizables_reference_type_index` (`reference_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_categorizables`
--

LOCK TABLES `ec_product_categorizables` WRITE;
/*!40000 ALTER TABLE `ec_product_categorizables` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_product_categorizables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_category_product`
--

DROP TABLE IF EXISTS `ec_product_category_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_category_product` (
  `category_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`product_id`,`category_id`),
  KEY `ec_product_category_product_category_id_index` (`category_id`),
  KEY `ec_product_category_product_product_id_index` (`product_id`),
  KEY `idx_product_category` (`product_id`,`category_id`),
  KEY `idx_product_id_category_id` (`product_id`,`category_id`),
  KEY `idx_product_category_composite` (`product_id`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_category_product`
--

LOCK TABLES `ec_product_category_product` WRITE;
/*!40000 ALTER TABLE `ec_product_category_product` DISABLE KEYS */;
INSERT INTO `ec_product_category_product` VALUES (1,9),(1,49),(1,51),(1,53),(1,54),(2,5),(2,16),(2,22),(2,24),(2,29),(2,31),(2,32),(2,33),(2,41),(3,17),(3,23),(3,35),(3,45),(4,17),(4,19),(4,30),(5,9),(5,14),(5,20),(5,40),(5,45),(6,2),(6,11),(6,12),(6,40),(6,43),(6,50),(7,8),(7,9),(7,26),(7,27),(7,30),(7,44),(7,50),(8,29),(9,1),(9,43),(10,7),(10,23),(10,24),(10,25),(10,28),(10,32),(10,34),(10,37),(10,38),(10,44),(10,49),(11,3),(11,10),(11,25),(11,27),(11,54),(12,2),(12,7),(12,30),(12,35),(12,40),(12,53),(13,5),(13,10),(13,13),(13,16),(13,21),(13,34),(13,36),(13,41),(13,44),(13,50),(13,51),(14,6),(14,17),(14,22),(15,6),(15,11),(15,15),(15,18),(15,19),(15,39),(15,47),(16,11),(16,34),(16,43),(16,49),(16,54),(17,1),(17,26),(17,30),(17,48),(17,53),(18,4),(18,12),(18,17),(18,31),(18,35),(18,36),(18,42),(18,52),(19,13),(19,15),(19,16),(19,18),(19,21),(19,43),(19,45),(20,1),(20,12),(20,18),(20,20),(20,24),(20,33),(21,8),(22,4),(22,12),(22,18),(22,22),(22,23),(22,52),(23,4),(23,8),(23,14),(23,37),(23,38),(23,41),(23,42),(24,4),(24,10),(24,13),(24,15),(24,19),(24,28),(24,44),(25,3),(25,6),(25,13),(25,21),(25,26),(25,28),(25,39),(25,41),(25,46),(25,48),(25,51),(26,7),(26,15),(26,48),(26,51),(27,47),(27,48),(28,5),(28,21),(28,25),(28,36),(28,38),(28,45),(29,2),(29,7),(29,22),(29,27),(29,35),(30,3),(30,10),(30,24),(30,25),(30,32),(30,39),(30,42),(30,53),(31,2),(31,11),(31,26),(31,32),(31,37),(31,38),(31,52),(31,54),(32,1),(32,14),(32,20),(32,31),(32,33),(32,46),(32,52),(33,6),(33,16),(33,28),(33,29),(33,39),(33,46),(33,47),(34,9),(34,29),(34,33),(34,34),(34,36),(34,37),(34,42),(34,47),(35,5),(35,8),(35,19),(35,23),(35,27),(35,31),(35,50),(36,3),(36,49),(37,14),(37,20),(37,40),(37,46);
/*!40000 ALTER TABLE `ec_product_category_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_collection_products`
--

DROP TABLE IF EXISTS `ec_product_collection_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_collection_products` (
  `product_collection_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`product_id`,`product_collection_id`),
  KEY `ec_product_collection_products_product_collection_id_index` (`product_collection_id`),
  KEY `ec_product_collection_products_product_id_index` (`product_id`),
  KEY `idx_product_id_collection_id` (`product_id`,`product_collection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_collection_products`
--

LOCK TABLES `ec_product_collection_products` WRITE;
/*!40000 ALTER TABLE `ec_product_collection_products` DISABLE KEYS */;
INSERT INTO `ec_product_collection_products` VALUES (1,5),(1,10),(1,11),(1,17),(1,19),(1,21),(1,22),(1,28),(1,31),(1,33),(1,35),(1,37),(1,38),(1,39),(1,40),(1,41),(1,43),(1,45),(1,46),(1,48),(1,52),(2,2),(2,3),(2,4),(2,12),(2,14),(2,15),(2,24),(2,25),(2,27),(2,29),(2,36),(2,44),(2,50),(2,51),(3,1),(3,6),(3,7),(3,8),(3,9),(3,13),(3,16),(3,18),(3,20),(3,23),(3,26),(3,30),(3,32),(3,34),(3,42),(3,47),(3,49),(3,53),(3,54);
/*!40000 ALTER TABLE `ec_product_collection_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_collections`
--

DROP TABLE IF EXISTS `ec_product_collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_collections` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_featured` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_collections`
--

LOCK TABLES `ec_product_collections` WRITE;
/*!40000 ALTER TABLE `ec_product_collections` DISABLE KEYS */;
INSERT INTO `ec_product_collections` VALUES (1,'New Arrival','new-arrival',NULL,NULL,'published','2025-12-26 09:38:20','2025-12-26 09:38:20',0),(2,'Best Sellers','best-sellers',NULL,NULL,'published','2025-12-26 09:38:20','2025-12-26 09:38:20',0),(3,'Special Offer','special-offer',NULL,NULL,'published','2025-12-26 09:38:20','2025-12-26 09:38:20',0);
/*!40000 ALTER TABLE `ec_product_collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_collections_translations`
--

DROP TABLE IF EXISTS `ec_product_collections_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_collections_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_product_collections_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_product_collections_id`),
  KEY `idx_product_collections_fk` (`ec_product_collections_id`),
  KEY `idx_product_collections_product_collections_lang` (`ec_product_collections_id`,`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_collections_translations`
--

LOCK TABLES `ec_product_collections_translations` WRITE;
/*!40000 ALTER TABLE `ec_product_collections_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_product_collections_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_cross_sale_relations`
--

DROP TABLE IF EXISTS `ec_product_cross_sale_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_cross_sale_relations` (
  `from_product_id` bigint unsigned NOT NULL,
  `to_product_id` bigint unsigned NOT NULL,
  `is_variant` tinyint(1) NOT NULL DEFAULT '0',
  `price` decimal(15,2) DEFAULT '0.00',
  `price_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fixed',
  `apply_to_all_variations` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`from_product_id`,`to_product_id`),
  KEY `ec_product_cross_sale_relations_from_product_id_index` (`from_product_id`),
  KEY `ec_product_cross_sale_relations_to_product_id_index` (`to_product_id`),
  KEY `idx_product_cross_sale` (`from_product_id`,`to_product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_cross_sale_relations`
--

LOCK TABLES `ec_product_cross_sale_relations` WRITE;
/*!40000 ALTER TABLE `ec_product_cross_sale_relations` DISABLE KEYS */;
INSERT INTO `ec_product_cross_sale_relations` VALUES (1,4,0,0.00,'fixed',1),(1,7,0,0.00,'fixed',1),(1,9,0,0.00,'fixed',1),(1,39,0,0.00,'fixed',1),(1,40,0,0.00,'fixed',1),(1,41,0,0.00,'fixed',1),(2,10,0,0.00,'fixed',1),(2,30,0,0.00,'fixed',1),(2,40,0,0.00,'fixed',1),(2,41,0,0.00,'fixed',1),(2,48,0,0.00,'fixed',1),(2,51,0,0.00,'fixed',1),(3,1,0,0.00,'fixed',1),(3,5,0,0.00,'fixed',1),(3,9,0,0.00,'fixed',1),(3,17,0,0.00,'fixed',1),(3,19,0,0.00,'fixed',1),(3,25,0,0.00,'fixed',1),(3,38,0,0.00,'fixed',1),(4,5,0,0.00,'fixed',1),(4,13,0,0.00,'fixed',1),(4,21,0,0.00,'fixed',1),(4,36,0,0.00,'fixed',1),(4,40,0,0.00,'fixed',1),(4,47,0,0.00,'fixed',1),(4,50,0,0.00,'fixed',1),(5,10,0,0.00,'fixed',1),(5,13,0,0.00,'fixed',1),(5,27,0,0.00,'fixed',1),(5,38,0,0.00,'fixed',1),(5,41,0,0.00,'fixed',1),(5,49,0,0.00,'fixed',1),(6,8,0,0.00,'fixed',1),(6,12,0,0.00,'fixed',1),(6,13,0,0.00,'fixed',1),(6,22,0,0.00,'fixed',1),(6,42,0,0.00,'fixed',1),(6,47,0,0.00,'fixed',1),(6,49,0,0.00,'fixed',1),(7,4,0,0.00,'fixed',1),(7,16,0,0.00,'fixed',1),(7,21,0,0.00,'fixed',1),(7,24,0,0.00,'fixed',1),(7,34,0,0.00,'fixed',1),(7,39,0,0.00,'fixed',1),(7,46,0,0.00,'fixed',1),(8,2,0,0.00,'fixed',1),(8,5,0,0.00,'fixed',1),(8,16,0,0.00,'fixed',1),(8,18,0,0.00,'fixed',1),(8,22,0,0.00,'fixed',1),(8,36,0,0.00,'fixed',1),(8,39,0,0.00,'fixed',1),(9,6,0,0.00,'fixed',1),(9,19,0,0.00,'fixed',1),(9,25,0,0.00,'fixed',1),(9,36,0,0.00,'fixed',1),(9,41,0,0.00,'fixed',1),(9,49,0,0.00,'fixed',1),(10,6,0,0.00,'fixed',1),(10,13,0,0.00,'fixed',1),(10,23,0,0.00,'fixed',1),(10,34,0,0.00,'fixed',1),(10,45,0,0.00,'fixed',1),(10,47,0,0.00,'fixed',1),(10,49,0,0.00,'fixed',1),(11,19,0,0.00,'fixed',1),(11,21,0,0.00,'fixed',1),(11,22,0,0.00,'fixed',1),(11,33,0,0.00,'fixed',1),(11,38,0,0.00,'fixed',1),(11,41,0,0.00,'fixed',1),(11,53,0,0.00,'fixed',1),(12,4,0,0.00,'fixed',1),(12,10,0,0.00,'fixed',1),(12,27,0,0.00,'fixed',1),(12,36,0,0.00,'fixed',1),(12,40,0,0.00,'fixed',1),(12,41,0,0.00,'fixed',1),(12,54,0,0.00,'fixed',1),(13,1,0,0.00,'fixed',1),(13,32,0,0.00,'fixed',1),(13,35,0,0.00,'fixed',1),(13,38,0,0.00,'fixed',1),(13,49,0,0.00,'fixed',1),(13,52,0,0.00,'fixed',1),(14,5,0,0.00,'fixed',1),(14,9,0,0.00,'fixed',1),(14,13,0,0.00,'fixed',1),(14,27,0,0.00,'fixed',1),(14,31,0,0.00,'fixed',1),(14,34,0,0.00,'fixed',1),(14,35,0,0.00,'fixed',1),(15,22,0,0.00,'fixed',1),(15,27,0,0.00,'fixed',1),(15,31,0,0.00,'fixed',1),(15,40,0,0.00,'fixed',1),(15,42,0,0.00,'fixed',1),(15,44,0,0.00,'fixed',1),(15,49,0,0.00,'fixed',1),(16,21,0,0.00,'fixed',1),(16,27,0,0.00,'fixed',1),(16,29,0,0.00,'fixed',1),(16,32,0,0.00,'fixed',1),(16,40,0,0.00,'fixed',1),(16,51,0,0.00,'fixed',1),(17,8,0,0.00,'fixed',1),(17,16,0,0.00,'fixed',1),(17,32,0,0.00,'fixed',1),(17,35,0,0.00,'fixed',1),(17,43,0,0.00,'fixed',1),(17,46,0,0.00,'fixed',1),(17,53,0,0.00,'fixed',1),(18,20,0,0.00,'fixed',1),(18,26,0,0.00,'fixed',1),(18,29,0,0.00,'fixed',1),(18,39,0,0.00,'fixed',1),(18,47,0,0.00,'fixed',1),(18,54,0,0.00,'fixed',1),(19,1,0,0.00,'fixed',1),(19,10,0,0.00,'fixed',1),(19,15,0,0.00,'fixed',1),(19,23,0,0.00,'fixed',1),(19,25,0,0.00,'fixed',1),(19,46,0,0.00,'fixed',1),(19,51,0,0.00,'fixed',1),(20,3,0,0.00,'fixed',1),(20,14,0,0.00,'fixed',1),(20,27,0,0.00,'fixed',1),(20,33,0,0.00,'fixed',1),(20,36,0,0.00,'fixed',1),(20,51,0,0.00,'fixed',1),(21,1,0,0.00,'fixed',1),(21,20,0,0.00,'fixed',1),(21,26,0,0.00,'fixed',1),(21,41,0,0.00,'fixed',1),(21,42,0,0.00,'fixed',1),(21,50,0,0.00,'fixed',1),(21,52,0,0.00,'fixed',1),(22,12,0,0.00,'fixed',1),(22,33,0,0.00,'fixed',1),(22,38,0,0.00,'fixed',1),(22,47,0,0.00,'fixed',1),(22,48,0,0.00,'fixed',1),(22,51,0,0.00,'fixed',1),(23,16,0,0.00,'fixed',1),(23,19,0,0.00,'fixed',1),(23,22,0,0.00,'fixed',1),(23,27,0,0.00,'fixed',1),(23,31,0,0.00,'fixed',1),(23,39,0,0.00,'fixed',1),(24,7,0,0.00,'fixed',1),(24,9,0,0.00,'fixed',1),(24,13,0,0.00,'fixed',1),(24,22,0,0.00,'fixed',1),(24,32,0,0.00,'fixed',1),(24,43,0,0.00,'fixed',1),(25,8,0,0.00,'fixed',1),(25,10,0,0.00,'fixed',1),(25,16,0,0.00,'fixed',1),(25,17,0,0.00,'fixed',1),(25,18,0,0.00,'fixed',1),(25,36,0,0.00,'fixed',1),(25,51,0,0.00,'fixed',1),(26,1,0,0.00,'fixed',1),(26,6,0,0.00,'fixed',1),(26,12,0,0.00,'fixed',1),(26,18,0,0.00,'fixed',1),(26,39,0,0.00,'fixed',1),(26,46,0,0.00,'fixed',1),(26,47,0,0.00,'fixed',1),(27,8,0,0.00,'fixed',1),(27,17,0,0.00,'fixed',1),(27,21,0,0.00,'fixed',1),(27,25,0,0.00,'fixed',1),(27,26,0,0.00,'fixed',1),(27,43,0,0.00,'fixed',1),(27,50,0,0.00,'fixed',1),(28,6,0,0.00,'fixed',1),(28,15,0,0.00,'fixed',1),(28,17,0,0.00,'fixed',1),(28,32,0,0.00,'fixed',1),(28,36,0,0.00,'fixed',1),(28,41,0,0.00,'fixed',1),(28,46,0,0.00,'fixed',1),(29,5,0,0.00,'fixed',1),(29,7,0,0.00,'fixed',1),(29,13,0,0.00,'fixed',1),(29,17,0,0.00,'fixed',1),(29,32,0,0.00,'fixed',1),(29,40,0,0.00,'fixed',1),(29,50,0,0.00,'fixed',1),(30,4,0,0.00,'fixed',1),(30,18,0,0.00,'fixed',1),(30,23,0,0.00,'fixed',1),(30,38,0,0.00,'fixed',1),(30,43,0,0.00,'fixed',1),(30,48,0,0.00,'fixed',1),(31,6,0,0.00,'fixed',1),(31,8,0,0.00,'fixed',1),(31,12,0,0.00,'fixed',1),(31,15,0,0.00,'fixed',1),(31,41,0,0.00,'fixed',1),(31,43,0,0.00,'fixed',1),(31,49,0,0.00,'fixed',1),(32,8,0,0.00,'fixed',1),(32,20,0,0.00,'fixed',1),(32,28,0,0.00,'fixed',1),(32,45,0,0.00,'fixed',1),(32,47,0,0.00,'fixed',1),(32,49,0,0.00,'fixed',1),(32,51,0,0.00,'fixed',1),(33,14,0,0.00,'fixed',1),(33,30,0,0.00,'fixed',1),(33,32,0,0.00,'fixed',1),(33,35,0,0.00,'fixed',1),(33,36,0,0.00,'fixed',1),(33,37,0,0.00,'fixed',1),(33,49,0,0.00,'fixed',1),(34,6,0,0.00,'fixed',1),(34,11,0,0.00,'fixed',1),(34,22,0,0.00,'fixed',1),(34,24,0,0.00,'fixed',1),(34,35,0,0.00,'fixed',1),(34,49,0,0.00,'fixed',1),(34,50,0,0.00,'fixed',1),(35,3,0,0.00,'fixed',1),(35,7,0,0.00,'fixed',1),(35,10,0,0.00,'fixed',1),(35,21,0,0.00,'fixed',1),(35,41,0,0.00,'fixed',1),(35,47,0,0.00,'fixed',1),(35,50,0,0.00,'fixed',1),(36,1,0,0.00,'fixed',1),(36,3,0,0.00,'fixed',1),(36,4,0,0.00,'fixed',1),(36,6,0,0.00,'fixed',1),(36,10,0,0.00,'fixed',1),(36,14,0,0.00,'fixed',1),(36,17,0,0.00,'fixed',1),(37,7,0,0.00,'fixed',1),(37,8,0,0.00,'fixed',1),(37,23,0,0.00,'fixed',1),(37,33,0,0.00,'fixed',1),(37,34,0,0.00,'fixed',1),(37,50,0,0.00,'fixed',1),(37,53,0,0.00,'fixed',1),(38,2,0,0.00,'fixed',1),(38,3,0,0.00,'fixed',1),(38,17,0,0.00,'fixed',1),(38,24,0,0.00,'fixed',1),(38,31,0,0.00,'fixed',1),(38,46,0,0.00,'fixed',1),(38,49,0,0.00,'fixed',1),(39,5,0,0.00,'fixed',1),(39,9,0,0.00,'fixed',1),(39,20,0,0.00,'fixed',1),(39,23,0,0.00,'fixed',1),(39,27,0,0.00,'fixed',1),(40,3,0,0.00,'fixed',1),(40,14,0,0.00,'fixed',1),(40,33,0,0.00,'fixed',1),(40,39,0,0.00,'fixed',1),(40,48,0,0.00,'fixed',1),(40,52,0,0.00,'fixed',1),(41,12,0,0.00,'fixed',1),(41,22,0,0.00,'fixed',1),(41,23,0,0.00,'fixed',1),(41,26,0,0.00,'fixed',1),(41,34,0,0.00,'fixed',1),(41,50,0,0.00,'fixed',1),(41,51,0,0.00,'fixed',1),(42,9,0,0.00,'fixed',1),(42,15,0,0.00,'fixed',1),(42,18,0,0.00,'fixed',1),(42,20,0,0.00,'fixed',1),(42,23,0,0.00,'fixed',1),(42,31,0,0.00,'fixed',1),(42,34,0,0.00,'fixed',1),(43,8,0,0.00,'fixed',1),(43,13,0,0.00,'fixed',1),(43,24,0,0.00,'fixed',1),(43,28,0,0.00,'fixed',1),(43,38,0,0.00,'fixed',1),(43,52,0,0.00,'fixed',1),(44,18,0,0.00,'fixed',1),(44,31,0,0.00,'fixed',1),(44,35,0,0.00,'fixed',1),(44,37,0,0.00,'fixed',1),(44,45,0,0.00,'fixed',1),(44,46,0,0.00,'fixed',1),(44,51,0,0.00,'fixed',1),(45,8,0,0.00,'fixed',1),(45,14,0,0.00,'fixed',1),(45,18,0,0.00,'fixed',1),(45,23,0,0.00,'fixed',1),(45,37,0,0.00,'fixed',1),(45,39,0,0.00,'fixed',1),(45,51,0,0.00,'fixed',1),(46,3,0,0.00,'fixed',1),(46,5,0,0.00,'fixed',1),(46,12,0,0.00,'fixed',1),(46,15,0,0.00,'fixed',1),(46,17,0,0.00,'fixed',1),(46,48,0,0.00,'fixed',1),(46,49,0,0.00,'fixed',1),(47,18,0,0.00,'fixed',1),(47,21,0,0.00,'fixed',1),(47,27,0,0.00,'fixed',1),(47,28,0,0.00,'fixed',1),(47,32,0,0.00,'fixed',1),(47,41,0,0.00,'fixed',1),(48,2,0,0.00,'fixed',1),(48,3,0,0.00,'fixed',1),(48,28,0,0.00,'fixed',1),(48,30,0,0.00,'fixed',1),(48,34,0,0.00,'fixed',1),(48,36,0,0.00,'fixed',1),(48,37,0,0.00,'fixed',1),(49,4,0,0.00,'fixed',1),(49,9,0,0.00,'fixed',1),(49,26,0,0.00,'fixed',1),(49,32,0,0.00,'fixed',1),(49,33,0,0.00,'fixed',1),(49,39,0,0.00,'fixed',1),(49,43,0,0.00,'fixed',1),(50,1,0,0.00,'fixed',1),(50,17,0,0.00,'fixed',1),(50,22,0,0.00,'fixed',1),(50,31,0,0.00,'fixed',1),(50,35,0,0.00,'fixed',1),(50,37,0,0.00,'fixed',1),(50,51,0,0.00,'fixed',1),(51,1,0,0.00,'fixed',1),(51,2,0,0.00,'fixed',1),(51,11,0,0.00,'fixed',1),(51,13,0,0.00,'fixed',1),(51,32,0,0.00,'fixed',1),(51,44,0,0.00,'fixed',1),(51,54,0,0.00,'fixed',1),(52,10,0,0.00,'fixed',1),(52,20,0,0.00,'fixed',1),(52,22,0,0.00,'fixed',1),(52,27,0,0.00,'fixed',1),(52,36,0,0.00,'fixed',1),(52,45,0,0.00,'fixed',1),(52,53,0,0.00,'fixed',1),(53,4,0,0.00,'fixed',1),(53,10,0,0.00,'fixed',1),(53,19,0,0.00,'fixed',1),(53,24,0,0.00,'fixed',1),(53,36,0,0.00,'fixed',1),(53,51,0,0.00,'fixed',1),(54,1,0,0.00,'fixed',1),(54,5,0,0.00,'fixed',1),(54,21,0,0.00,'fixed',1),(54,27,0,0.00,'fixed',1),(54,32,0,0.00,'fixed',1),(54,35,0,0.00,'fixed',1),(54,51,0,0.00,'fixed',1);
/*!40000 ALTER TABLE `ec_product_cross_sale_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_files`
--

DROP TABLE IF EXISTS `ec_product_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_files` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned DEFAULT NULL,
  `url` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extras` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_product_files_product_id_index` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_files`
--

LOCK TABLES `ec_product_files` WRITE;
/*!40000 ALTER TABLE `ec_product_files` DISABLE KEYS */;
INSERT INTO `ec_product_files` VALUES (1,4,'ecommerce/digital-product-files/4-1.jpg','{\"filename\":\"4-1.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/4-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-12-26 16:38:43\",\"name\":\"4-1\",\"extension\":\"jpg\"}','2025-12-26 09:38:43','2025-12-26 09:38:43'),(2,4,'ecommerce/digital-product-files/4-2.jpg','{\"filename\":\"4-2.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/4-2.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-12-26 16:38:43\",\"name\":\"4-2\",\"extension\":\"jpg\"}','2025-12-26 09:38:43','2025-12-26 09:38:43'),(3,8,'ecommerce/digital-product-files/8-1.jpg','{\"filename\":\"8-1.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/8-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-12-26 16:38:43\",\"name\":\"8-1\",\"extension\":\"jpg\"}','2025-12-26 09:38:43','2025-12-26 09:38:43'),(4,8,'ecommerce/digital-product-files/8-2.jpg','{\"filename\":\"8-2.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/8-2.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-12-26 16:38:43\",\"name\":\"8-2\",\"extension\":\"jpg\"}','2025-12-26 09:38:43','2025-12-26 09:38:43'),(5,12,'ecommerce/digital-product-files/12-1.jpg','{\"filename\":\"12-1.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/12-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-12-26 16:38:43\",\"name\":\"12-1\",\"extension\":\"jpg\"}','2025-12-26 09:38:43','2025-12-26 09:38:43'),(6,12,'ecommerce/digital-product-files/12-2.jpg','{\"filename\":\"12-2.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/12-2.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-12-26 16:38:43\",\"name\":\"12-2\",\"extension\":\"jpg\"}','2025-12-26 09:38:43','2025-12-26 09:38:43'),(7,16,'ecommerce/digital-product-files/16-1.jpg','{\"filename\":\"16-1.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/16-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-12-26 16:38:43\",\"name\":\"16-1\",\"extension\":\"jpg\"}','2025-12-26 09:38:43','2025-12-26 09:38:43'),(8,16,'ecommerce/digital-product-files/16-2.jpg','{\"filename\":\"16-2.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/16-2.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-12-26 16:38:43\",\"name\":\"16-2\",\"extension\":\"jpg\"}','2025-12-26 09:38:43','2025-12-26 09:38:43'),(9,20,'ecommerce/digital-product-files/20-1.jpg','{\"filename\":\"20-1.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/20-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-12-26 16:38:43\",\"name\":\"20-1\",\"extension\":\"jpg\"}','2025-12-26 09:38:43','2025-12-26 09:38:43'),(10,20,'ecommerce/digital-product-files/20-2.jpg','{\"filename\":\"20-2.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/20-2.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-12-26 16:38:43\",\"name\":\"20-2\",\"extension\":\"jpg\"}','2025-12-26 09:38:43','2025-12-26 09:38:43'),(11,24,'ecommerce/digital-product-files/24-1.jpg','{\"filename\":\"24-1.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/24-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-12-26 16:38:43\",\"name\":\"24-1\",\"extension\":\"jpg\"}','2025-12-26 09:38:43','2025-12-26 09:38:43'),(12,24,'ecommerce/digital-product-files/24-2.jpg','{\"filename\":\"24-2.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/24-2.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-12-26 16:38:43\",\"name\":\"24-2\",\"extension\":\"jpg\"}','2025-12-26 09:38:43','2025-12-26 09:38:43'),(13,28,'ecommerce/digital-product-files/28-1.jpg','{\"filename\":\"28-1.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/28-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-12-26 16:38:43\",\"name\":\"28-1\",\"extension\":\"jpg\"}','2025-12-26 09:38:43','2025-12-26 09:38:43'),(14,28,'ecommerce/digital-product-files/28-2.jpg','{\"filename\":\"28-2.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/28-2.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-12-26 16:38:43\",\"name\":\"28-2\",\"extension\":\"jpg\"}','2025-12-26 09:38:43','2025-12-26 09:38:43'),(15,32,'ecommerce/digital-product-files/32-1.jpg','{\"filename\":\"32-1.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/32-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-12-26 16:38:43\",\"name\":\"32-1\",\"extension\":\"jpg\"}','2025-12-26 09:38:43','2025-12-26 09:38:43'),(16,32,'ecommerce/digital-product-files/32-2.jpg','{\"filename\":\"32-2.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/32-2.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-12-26 16:38:43\",\"name\":\"32-2\",\"extension\":\"jpg\"}','2025-12-26 09:38:43','2025-12-26 09:38:43'),(17,36,'ecommerce/digital-product-files/36-1.jpg','{\"filename\":\"36-1.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/36-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-12-26 16:38:43\",\"name\":\"36-1\",\"extension\":\"jpg\"}','2025-12-26 09:38:43','2025-12-26 09:38:43'),(18,36,'ecommerce/digital-product-files/36-2.jpg','{\"filename\":\"36-2.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/36-2.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-12-26 16:38:43\",\"name\":\"36-2\",\"extension\":\"jpg\"}','2025-12-26 09:38:43','2025-12-26 09:38:43'),(19,40,'ecommerce/digital-product-files/40-1.jpg','{\"filename\":\"40-1.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/40-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-12-26 16:38:43\",\"name\":\"40-1\",\"extension\":\"jpg\"}','2025-12-26 09:38:43','2025-12-26 09:38:43'),(20,40,'ecommerce/digital-product-files/40-2.jpg','{\"filename\":\"40-2.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/40-2.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-12-26 16:38:43\",\"name\":\"40-2\",\"extension\":\"jpg\"}','2025-12-26 09:38:43','2025-12-26 09:38:43'),(21,44,'ecommerce/digital-product-files/44-1.jpg','{\"filename\":\"44-1.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/44-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-12-26 16:38:43\",\"name\":\"44-1\",\"extension\":\"jpg\"}','2025-12-26 09:38:43','2025-12-26 09:38:43'),(22,44,'ecommerce/digital-product-files/44-2.jpg','{\"filename\":\"44-2.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/44-2.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-12-26 16:38:43\",\"name\":\"44-2\",\"extension\":\"jpg\"}','2025-12-26 09:38:43','2025-12-26 09:38:43'),(23,48,'ecommerce/digital-product-files/48-1.jpg','{\"filename\":\"48-1.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/48-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-12-26 16:38:43\",\"name\":\"48-1\",\"extension\":\"jpg\"}','2025-12-26 09:38:43','2025-12-26 09:38:43'),(24,48,'ecommerce/digital-product-files/48-2.jpg','{\"filename\":\"48-2.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/48-2.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-12-26 16:38:43\",\"name\":\"48-2\",\"extension\":\"jpg\"}','2025-12-26 09:38:43','2025-12-26 09:38:43'),(25,52,'ecommerce/digital-product-files/52-1.jpg','{\"filename\":\"52-1.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/52-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-12-26 16:38:43\",\"name\":\"52-1\",\"extension\":\"jpg\"}','2025-12-26 09:38:43','2025-12-26 09:38:43'),(26,52,'ecommerce/digital-product-files/52-2.jpg','{\"filename\":\"52-2.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/52-2.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-12-26 16:38:43\",\"name\":\"52-2\",\"extension\":\"jpg\"}','2025-12-26 09:38:43','2025-12-26 09:38:43'),(27,63,'ecommerce/digital-product-files/4-2.jpg','{\"filename\":\"4-2.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/4-2.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-12-26 16:38:43\",\"name\":\"4-2\",\"extension\":\"jpg\"}','2025-12-26 09:38:43','2025-12-26 09:38:43'),(28,64,'ecommerce/digital-product-files/4-3.jpg','{\"filename\":\"4-3.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/4-3.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-12-26 16:38:43\",\"name\":\"4-3\",\"extension\":\"jpg\"}','2025-12-26 09:38:43','2025-12-26 09:38:43'),(29,67,'ecommerce/digital-product-files/8-2.jpg','{\"filename\":\"8-2.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/8-2.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-12-26 16:38:43\",\"name\":\"8-2\",\"extension\":\"jpg\"}','2025-12-26 09:38:43','2025-12-26 09:38:43'),(30,68,'ecommerce/digital-product-files/8-3.jpg','{\"filename\":\"8-3.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/8-3.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-12-26 16:38:43\",\"name\":\"8-3\",\"extension\":\"jpg\"}','2025-12-26 09:38:43','2025-12-26 09:38:43'),(31,70,'ecommerce/digital-product-files/12-2.jpg','{\"filename\":\"12-2.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/12-2.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-12-26 16:38:43\",\"name\":\"12-2\",\"extension\":\"jpg\"}','2025-12-26 09:38:43','2025-12-26 09:38:43'),(32,71,'ecommerce/digital-product-files/12-3.jpg','{\"filename\":\"12-3.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/12-3.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-12-26 16:38:43\",\"name\":\"12-3\",\"extension\":\"jpg\"}','2025-12-26 09:38:43','2025-12-26 09:38:43'),(33,72,'ecommerce/digital-product-files/12-4.jpg','{\"filename\":\"12-4.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/12-4.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-12-26 16:38:43\",\"name\":\"12-4\",\"extension\":\"jpg\"}','2025-12-26 09:38:43','2025-12-26 09:38:43'),(34,82,'ecommerce/digital-product-files/20-2.jpg','{\"filename\":\"20-2.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/20-2.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-12-26 16:38:43\",\"name\":\"20-2\",\"extension\":\"jpg\"}','2025-12-26 09:38:43','2025-12-26 09:38:43'),(35,83,'ecommerce/digital-product-files/20-3.jpg','{\"filename\":\"20-3.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/20-3.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-12-26 16:38:43\",\"name\":\"20-3\",\"extension\":\"jpg\"}','2025-12-26 09:38:43','2025-12-26 09:38:43'),(36,84,'ecommerce/digital-product-files/20-4.jpg','{\"filename\":\"20-4.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/20-4.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-12-26 16:38:43\",\"name\":\"20-4\",\"extension\":\"jpg\"}','2025-12-26 09:38:43','2025-12-26 09:38:43'),(37,85,'ecommerce/digital-product-files/20-1.jpg','{\"filename\":\"20-1.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/20-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-12-26 16:38:43\",\"name\":\"20-1\",\"extension\":\"jpg\"}','2025-12-26 09:38:43','2025-12-26 09:38:43'),(38,86,'ecommerce/digital-product-files/20-1.jpg','{\"filename\":\"20-1.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/20-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-12-26 16:38:43\",\"name\":\"20-1\",\"extension\":\"jpg\"}','2025-12-26 09:38:43','2025-12-26 09:38:43'),(39,93,'ecommerce/digital-product-files/24-2.jpg','{\"filename\":\"24-2.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/24-2.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-12-26 16:38:43\",\"name\":\"24-2\",\"extension\":\"jpg\"}','2025-12-26 09:38:43','2025-12-26 09:38:43'),(40,94,'ecommerce/digital-product-files/24-3.jpg','{\"filename\":\"24-3.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/24-3.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-12-26 16:38:43\",\"name\":\"24-3\",\"extension\":\"jpg\"}','2025-12-26 09:38:43','2025-12-26 09:38:43'),(41,95,'ecommerce/digital-product-files/24-4.jpg','{\"filename\":\"24-4.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/24-4.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-12-26 16:38:43\",\"name\":\"24-4\",\"extension\":\"jpg\"}','2025-12-26 09:38:43','2025-12-26 09:38:43'),(42,96,'ecommerce/digital-product-files/24-1.jpg','{\"filename\":\"24-1.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/24-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-12-26 16:38:43\",\"name\":\"24-1\",\"extension\":\"jpg\"}','2025-12-26 09:38:43','2025-12-26 09:38:43'),(43,109,'ecommerce/digital-product-files/32-2.jpg','{\"filename\":\"32-2.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/32-2.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-12-26 16:38:43\",\"name\":\"32-2\",\"extension\":\"jpg\"}','2025-12-26 09:38:43','2025-12-26 09:38:43'),(44,110,'ecommerce/digital-product-files/32-3.jpg','{\"filename\":\"32-3.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/32-3.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-12-26 16:38:43\",\"name\":\"32-3\",\"extension\":\"jpg\"}','2025-12-26 09:38:43','2025-12-26 09:38:43'),(45,111,'ecommerce/digital-product-files/32-4.jpg','{\"filename\":\"32-4.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/32-4.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-12-26 16:38:43\",\"name\":\"32-4\",\"extension\":\"jpg\"}','2025-12-26 09:38:43','2025-12-26 09:38:43'),(46,112,'ecommerce/digital-product-files/32-1.jpg','{\"filename\":\"32-1.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/32-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-12-26 16:38:43\",\"name\":\"32-1\",\"extension\":\"jpg\"}','2025-12-26 09:38:43','2025-12-26 09:38:43'),(47,122,'ecommerce/digital-product-files/40-2.jpg','{\"filename\":\"40-2.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/40-2.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-12-26 16:38:43\",\"name\":\"40-2\",\"extension\":\"jpg\"}','2025-12-26 09:38:43','2025-12-26 09:38:43'),(48,128,'ecommerce/digital-product-files/44-2.jpg','{\"filename\":\"44-2.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/44-2.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-12-26 16:38:43\",\"name\":\"44-2\",\"extension\":\"jpg\"}','2025-12-26 09:38:43','2025-12-26 09:38:43'),(49,129,'ecommerce/digital-product-files/44-3.jpg','{\"filename\":\"44-3.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/44-3.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-12-26 16:38:43\",\"name\":\"44-3\",\"extension\":\"jpg\"}','2025-12-26 09:38:43','2025-12-26 09:38:43'),(50,130,'ecommerce/digital-product-files/44-1.jpg','{\"filename\":\"44-1.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/44-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-12-26 16:38:43\",\"name\":\"44-1\",\"extension\":\"jpg\"}','2025-12-26 09:38:43','2025-12-26 09:38:43'),(51,131,'ecommerce/digital-product-files/44-1.jpg','{\"filename\":\"44-1.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/44-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-12-26 16:38:43\",\"name\":\"44-1\",\"extension\":\"jpg\"}','2025-12-26 09:38:43','2025-12-26 09:38:43'),(52,135,'ecommerce/digital-product-files/52-2.jpg','{\"filename\":\"52-2.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/52-2.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-12-26 16:38:43\",\"name\":\"52-2\",\"extension\":\"jpg\"}','2025-12-26 09:38:43','2025-12-26 09:38:43'),(53,136,'ecommerce/digital-product-files/52-3.jpg','{\"filename\":\"52-3.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/52-3.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-12-26 16:38:43\",\"name\":\"52-3\",\"extension\":\"jpg\"}','2025-12-26 09:38:43','2025-12-26 09:38:43'),(54,137,'ecommerce/digital-product-files/52-1.jpg','{\"filename\":\"52-1.jpg\",\"url\":\"ecommerce\\/digital-product-files\\/52-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9803,\"modified\":\"2025-12-26 16:38:43\",\"name\":\"52-1\",\"extension\":\"jpg\"}','2025-12-26 09:38:43','2025-12-26 09:38:43');
/*!40000 ALTER TABLE `ec_product_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_label_products`
--

DROP TABLE IF EXISTS `ec_product_label_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_label_products` (
  `product_label_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`product_label_id`,`product_id`),
  KEY `ec_product_label_products_product_label_id_index` (`product_label_id`),
  KEY `ec_product_label_products_product_id_index` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_label_products`
--

LOCK TABLES `ec_product_label_products` WRITE;
/*!40000 ALTER TABLE `ec_product_label_products` DISABLE KEYS */;
INSERT INTO `ec_product_label_products` VALUES (1,3),(1,12),(1,30),(1,33),(1,39),(2,18),(2,21),(2,27),(2,36),(2,51),(3,6),(3,9),(3,15),(3,24),(3,42),(3,45),(3,48),(3,54);
/*!40000 ALTER TABLE `ec_product_label_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_labels`
--

DROP TABLE IF EXISTS `ec_product_labels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_labels` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `text_color` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_product_labels_status_index` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_labels`
--

LOCK TABLES `ec_product_labels` WRITE;
/*!40000 ALTER TABLE `ec_product_labels` DISABLE KEYS */;
INSERT INTO `ec_product_labels` VALUES (1,'Hot','#d71e2d','published','2025-12-26 09:38:20','2025-12-26 09:38:20','#ffffff'),(2,'New','#02856e','published','2025-12-26 09:38:20','2025-12-26 09:38:20','#ffffff'),(3,'Sale','#fe9931','published','2025-12-26 09:38:20','2025-12-26 09:38:20','#ffffff');
/*!40000 ALTER TABLE `ec_product_labels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_labels_translations`
--

DROP TABLE IF EXISTS `ec_product_labels_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_labels_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_product_labels_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_product_labels_id`),
  KEY `idx_product_labels_fk` (`ec_product_labels_id`),
  KEY `idx_product_labels_product_labels_lang` (`ec_product_labels_id`,`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_labels_translations`
--

LOCK TABLES `ec_product_labels_translations` WRITE;
/*!40000 ALTER TABLE `ec_product_labels_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_product_labels_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_license_codes`
--

DROP TABLE IF EXISTS `ec_product_license_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_license_codes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned NOT NULL,
  `license_code` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'available',
  `assigned_order_product_id` bigint unsigned DEFAULT NULL,
  `assigned_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_product_license_codes_product_id_status_index` (`product_id`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_license_codes`
--

LOCK TABLES `ec_product_license_codes` WRITE;
/*!40000 ALTER TABLE `ec_product_license_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_product_license_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_related_relations`
--

DROP TABLE IF EXISTS `ec_product_related_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_related_relations` (
  `from_product_id` bigint unsigned NOT NULL,
  `to_product_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`from_product_id`,`to_product_id`),
  KEY `ec_product_related_relations_from_product_id_index` (`from_product_id`),
  KEY `ec_product_related_relations_to_product_id_index` (`to_product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_related_relations`
--

LOCK TABLES `ec_product_related_relations` WRITE;
/*!40000 ALTER TABLE `ec_product_related_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_product_related_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_specification_attribute`
--

DROP TABLE IF EXISTS `ec_product_specification_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_specification_attribute` (
  `product_id` bigint unsigned NOT NULL,
  `attribute_id` bigint unsigned NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  `order` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`,`attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_specification_attribute`
--

LOCK TABLES `ec_product_specification_attribute` WRITE;
/*!40000 ALTER TABLE `ec_product_specification_attribute` DISABLE KEYS */;
INSERT INTO `ec_product_specification_attribute` VALUES (1,1,'54.14 cm',0,0),(1,2,'14.97 cm',0,0),(1,3,'34.83 cm',0,0),(1,4,'37.28 cm',0,0),(1,5,'62.35 cm',0,0),(2,6,'96.48 cm',0,0),(2,7,'51.24 cm',0,0),(2,8,'1920x1080',0,0),(3,6,'71.89 cm',0,0),(3,7,'69.74 cm',0,0),(3,8,'3840x2160',0,0),(4,6,'92.94 cm',0,0),(4,7,'40.2 cm',0,0),(4,8,'1920x1080',0,0),(5,1,'66.83 cm',0,0),(5,2,'72.63 cm',0,0),(5,3,'72.07 cm',0,0),(5,4,'37.83 cm',0,0),(5,5,'58.12 cm',0,0),(6,6,'31.48 cm',0,0),(6,7,'63.17 cm',0,0),(6,8,'3840x2160',0,0),(7,6,'22.27 cm',0,0),(7,7,'15.93 cm',0,0),(7,8,'1920x1080',0,0),(8,6,'21.23 cm',0,0),(8,7,'79.76 cm',0,0),(8,8,'3840x2160',0,0),(9,6,'65.97 cm',0,0),(9,7,'86.69 cm',0,0),(9,8,'3840x2160',0,0),(10,6,'47.58 cm',0,0),(10,7,'69.89 cm',0,0),(10,8,'1920x1080',0,0),(11,1,'71.95 cm',0,0),(11,2,'14.37 cm',0,0),(11,3,'93.24 cm',0,0),(11,4,'87.99 cm',0,0),(11,5,'68.97 cm',0,0),(12,1,'10.03 cm',0,0),(12,2,'10.03 cm',0,0),(12,3,'6.8 cm',0,0),(12,4,'13.22 cm',0,0),(12,5,'35.03 cm',0,0),(13,1,'8.67 cm',0,0),(13,2,'21.31 cm',0,0),(13,3,'29.79 cm',0,0),(13,4,'67.06 cm',0,0),(13,5,'81.16 cm',0,0),(14,6,'31.77 cm',0,0),(14,7,'59.56 cm',0,0),(14,8,'1920x1080',0,0),(15,6,'5.85 cm',0,0),(15,7,'43.4 cm',0,0),(15,8,'2560x1440',0,0),(16,1,'29.76 cm',0,0),(16,2,'67.02 cm',0,0),(16,3,'28.1 cm',0,0),(16,4,'45.76 cm',0,0),(16,5,'59.05 cm',0,0),(17,1,'25.02 cm',0,0),(17,2,'26.06 cm',0,0),(17,3,'46.62 cm',0,0),(17,4,'86.47 cm',0,0),(17,5,'84.32 cm',0,0),(18,6,'92.79 cm',0,0),(18,7,'44.82 cm',0,0),(18,8,'3840x2160',0,0),(19,1,'97.97 cm',0,0),(19,2,'18.52 cm',0,0),(19,3,'33.4 cm',0,0),(19,4,'73.64 cm',0,0),(19,5,'7.92 cm',0,0),(20,1,'13.81 cm',0,0),(20,2,'66.94 cm',0,0),(20,3,'22.44 cm',0,0),(20,4,'10 cm',0,0),(20,5,'73.77 cm',0,0),(21,6,'41.02 cm',0,0),(21,7,'27.6 cm',0,0),(21,8,'2560x1440',0,0),(22,1,'9.69 cm',0,0),(22,2,'82.63 cm',0,0),(22,3,'55.83 cm',0,0),(22,4,'59.31 cm',0,0),(22,5,'88.42 cm',0,0),(23,6,'65.8 cm',0,0),(23,7,'35.71 cm',0,0),(23,8,'1920x1080',0,0),(24,6,'55.18 cm',0,0),(24,7,'64.33 cm',0,0),(24,8,'3840x2160',0,0),(25,1,'2.28 cm',0,0),(25,2,'54.15 cm',0,0),(25,3,'9.8 cm',0,0),(25,4,'46.26 cm',0,0),(25,5,'42.36 cm',0,0),(26,1,'74.56 cm',0,0),(26,2,'5.45 cm',0,0),(26,3,'75.07 cm',0,0),(26,4,'28.57 cm',0,0),(26,5,'98.35 cm',0,0),(27,1,'78.43 cm',0,0),(27,2,'25.64 cm',0,0),(27,3,'83.9 cm',0,0),(27,4,'85.62 cm',0,0),(27,5,'58 cm',0,0),(28,6,'99.05 cm',0,0),(28,7,'54.45 cm',0,0),(28,8,'3840x2160',0,0),(29,1,'80.73 cm',0,0),(29,2,'91.16 cm',0,0),(29,3,'92.83 cm',0,0),(29,4,'89.11 cm',0,0),(29,5,'40.13 cm',0,0),(30,1,'11.34 cm',0,0),(30,2,'63.13 cm',0,0),(30,3,'72.99 cm',0,0),(30,4,'58.52 cm',0,0),(30,5,'59.2 cm',0,0),(31,1,'73.19 cm',0,0),(31,2,'14.24 cm',0,0),(31,3,'97.66 cm',0,0),(31,4,'80.32 cm',0,0),(31,5,'49.43 cm',0,0),(32,1,'13.94 cm',0,0),(32,2,'35.5 cm',0,0),(32,3,'89.75 cm',0,0),(32,4,'98 cm',0,0),(32,5,'33.64 cm',0,0),(33,6,'81.9 cm',0,0),(33,7,'1.41 cm',0,0),(33,8,'3840x2160',0,0),(34,6,'24.9 cm',0,0),(34,7,'29.5 cm',0,0),(34,8,'2560x1440',0,0),(35,6,'27.4 cm',0,0),(35,7,'88.32 cm',0,0),(35,8,'1920x1080',0,0),(36,1,'4.13 cm',0,0),(36,2,'64.03 cm',0,0),(36,3,'13.07 cm',0,0),(36,4,'88.65 cm',0,0),(36,5,'41.54 cm',0,0),(37,1,'44.69 cm',0,0),(37,2,'18.03 cm',0,0),(37,3,'41.03 cm',0,0),(37,4,'42.29 cm',0,0),(37,5,'92.13 cm',0,0),(38,6,'94.24 cm',0,0),(38,7,'13.56 cm',0,0),(38,8,'2560x1440',0,0),(39,1,'90.32 cm',0,0),(39,2,'8.17 cm',0,0),(39,3,'11.65 cm',0,0),(39,4,'26.53 cm',0,0),(39,5,'46.6 cm',0,0),(40,1,'34.53 cm',0,0),(40,2,'93 cm',0,0),(40,3,'4.15 cm',0,0),(40,4,'17.34 cm',0,0),(40,5,'65.18 cm',0,0),(41,1,'6.07 cm',0,0),(41,2,'57.77 cm',0,0),(41,3,'50.09 cm',0,0),(41,4,'41.36 cm',0,0),(41,5,'72.26 cm',0,0),(42,6,'95.6 cm',0,0),(42,7,'80.11 cm',0,0),(42,8,'2560x1440',0,0),(43,1,'17.89 cm',0,0),(43,2,'43.56 cm',0,0),(43,3,'46.03 cm',0,0),(43,4,'10.25 cm',0,0),(43,5,'48.92 cm',0,0),(44,1,'86.12 cm',0,0),(44,2,'30.93 cm',0,0),(44,3,'96.09 cm',0,0),(44,4,'48.18 cm',0,0),(44,5,'93.44 cm',0,0),(45,6,'71.99 cm',0,0),(45,7,'23 cm',0,0),(45,8,'2560x1440',0,0),(46,1,'71.22 cm',0,0),(46,2,'36.69 cm',0,0),(46,3,'38.33 cm',0,0),(46,4,'77.49 cm',0,0),(46,5,'31.87 cm',0,0),(47,6,'97.55 cm',0,0),(47,7,'33.27 cm',0,0),(47,8,'3840x2160',0,0),(48,6,'91.23 cm',0,0),(48,7,'8.07 cm',0,0),(48,8,'3840x2160',0,0),(49,1,'24.63 cm',0,0),(49,2,'37.77 cm',0,0),(49,3,'77.77 cm',0,0),(49,4,'67.25 cm',0,0),(49,5,'63.42 cm',0,0),(50,6,'82.54 cm',0,0),(50,7,'23.9 cm',0,0),(50,8,'2560x1440',0,0),(51,1,'74.93 cm',0,0),(51,2,'89.01 cm',0,0),(51,3,'91.44 cm',0,0),(51,4,'79.79 cm',0,0),(51,5,'98.85 cm',0,0),(52,1,'80.57 cm',0,0),(52,2,'84.24 cm',0,0),(52,3,'61.33 cm',0,0),(52,4,'34.38 cm',0,0),(52,5,'73.99 cm',0,0),(53,6,'70.82 cm',0,0),(53,7,'92.67 cm',0,0),(53,8,'3840x2160',0,0),(54,6,'34.48 cm',0,0),(54,7,'56.92 cm',0,0),(54,8,'3840x2160',0,0);
/*!40000 ALTER TABLE `ec_product_specification_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_specification_attribute_translations`
--

DROP TABLE IF EXISTS `ec_product_specification_attribute_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_specification_attribute_translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned NOT NULL,
  `attribute_id` bigint unsigned NOT NULL,
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `psat_unique` (`product_id`,`attribute_id`,`lang_code`),
  KEY `psat_product_attribute_index` (`product_id`,`attribute_id`),
  KEY `psat_product_id_index` (`product_id`),
  KEY `psat_attribute_id_index` (`attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_specification_attribute_translations`
--

LOCK TABLES `ec_product_specification_attribute_translations` WRITE;
/*!40000 ALTER TABLE `ec_product_specification_attribute_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_product_specification_attribute_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_tag_product`
--

DROP TABLE IF EXISTS `ec_product_tag_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_tag_product` (
  `product_id` bigint unsigned NOT NULL,
  `tag_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`product_id`,`tag_id`),
  KEY `ec_product_tag_product_product_id_index` (`product_id`),
  KEY `ec_product_tag_product_tag_id_index` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_tag_product`
--

LOCK TABLES `ec_product_tag_product` WRITE;
/*!40000 ALTER TABLE `ec_product_tag_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_product_tag_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_tags`
--

DROP TABLE IF EXISTS `ec_product_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_tags`
--

LOCK TABLES `ec_product_tags` WRITE;
/*!40000 ALTER TABLE `ec_product_tags` DISABLE KEYS */;
INSERT INTO `ec_product_tags` VALUES (1,'Electronic',NULL,'published','2025-12-26 09:38:49','2025-12-26 09:38:49'),(2,'Mobile',NULL,'published','2025-12-26 09:38:49','2025-12-26 09:38:49'),(3,'Iphone',NULL,'published','2025-12-26 09:38:49','2025-12-26 09:38:49'),(4,'Printer',NULL,'published','2025-12-26 09:38:49','2025-12-26 09:38:49'),(5,'Office',NULL,'published','2025-12-26 09:38:49','2025-12-26 09:38:49'),(6,'IT',NULL,'published','2025-12-26 09:38:49','2025-12-26 09:38:49');
/*!40000 ALTER TABLE `ec_product_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_tags_translations`
--

DROP TABLE IF EXISTS `ec_product_tags_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_tags_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_product_tags_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_product_tags_id`),
  KEY `idx_product_tags_fk` (`ec_product_tags_id`),
  KEY `idx_product_tags_product_tags_lang` (`ec_product_tags_id`,`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_tags_translations`
--

LOCK TABLES `ec_product_tags_translations` WRITE;
/*!40000 ALTER TABLE `ec_product_tags_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_product_tags_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_up_sale_relations`
--

DROP TABLE IF EXISTS `ec_product_up_sale_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_up_sale_relations` (
  `from_product_id` bigint unsigned NOT NULL,
  `to_product_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`from_product_id`,`to_product_id`),
  KEY `ec_product_up_sale_relations_from_product_id_index` (`from_product_id`),
  KEY `ec_product_up_sale_relations_to_product_id_index` (`to_product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_up_sale_relations`
--

LOCK TABLES `ec_product_up_sale_relations` WRITE;
/*!40000 ALTER TABLE `ec_product_up_sale_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_product_up_sale_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_variation_items`
--

DROP TABLE IF EXISTS `ec_product_variation_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_variation_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `attribute_id` bigint unsigned NOT NULL,
  `variation_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_product_variation_items_attribute_id_variation_id_unique` (`attribute_id`,`variation_id`),
  KEY `attribute_variation_index` (`attribute_id`,`variation_id`),
  KEY `idx_variation_id` (`variation_id`),
  KEY `idx_variation_attribute_covering` (`variation_id`,`attribute_id`),
  KEY `ec_product_variation_items_variation_id_attribute_id_index` (`variation_id`,`attribute_id`)
) ENGINE=InnoDB AUTO_INCREMENT=167 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_variation_items`
--

LOCK TABLES `ec_product_variation_items` WRITE;
/*!40000 ALTER TABLE `ec_product_variation_items` DISABLE KEYS */;
INSERT INTO `ec_product_variation_items` VALUES (7,1,4),(9,1,5),(17,1,9),(19,1,10),(21,1,11),(49,1,25),(51,1,26),(59,1,30),(67,1,34),(85,1,43),(89,1,45),(93,1,47),(95,1,48),(103,1,52),(111,1,56),(115,1,58),(129,1,65),(137,1,69),(139,1,70),(143,1,72),(147,1,74),(149,1,75),(157,1,79),(15,2,8),(29,2,15),(61,2,31),(81,2,41),(99,2,50),(107,2,54),(117,2,59),(127,2,64),(155,2,78),(159,2,80),(163,2,82),(31,3,16),(37,3,19),(43,3,22),(45,3,23),(63,3,32),(79,3,40),(121,3,61),(123,3,62),(125,3,63),(135,3,68),(151,3,76),(161,3,81),(165,3,83),(1,4,1),(23,4,12),(33,4,17),(35,4,18),(73,4,37),(77,4,39),(87,4,44),(91,4,46),(109,4,55),(119,4,60),(131,4,66),(141,4,71),(145,4,73),(3,5,2),(5,5,3),(11,5,6),(13,5,7),(25,5,13),(27,5,14),(39,5,20),(41,5,21),(47,5,24),(53,5,27),(55,5,28),(57,5,29),(65,5,33),(69,5,35),(71,5,36),(75,5,38),(83,5,42),(97,5,49),(101,5,51),(105,5,53),(113,5,57),(133,5,67),(153,5,77),(22,6,11),(24,6,12),(36,6,18),(40,6,20),(42,6,21),(56,6,28),(58,6,29),(62,6,31),(66,6,33),(72,6,36),(80,6,40),(112,6,56),(120,6,60),(128,6,64),(138,6,69),(140,6,70),(146,6,73),(158,6,79),(6,7,3),(12,7,6),(18,7,9),(38,7,19),(44,7,22),(54,7,27),(60,7,30),(74,7,37),(78,7,39),(82,7,41),(100,7,50),(104,7,52),(106,7,53),(118,7,59),(124,7,62),(126,7,63),(134,7,67),(136,7,68),(142,7,71),(144,7,72),(150,7,75),(162,7,81),(2,8,1),(14,8,7),(20,8,10),(26,8,13),(32,8,16),(64,8,32),(68,8,34),(76,8,38),(88,8,44),(90,8,45),(92,8,46),(98,8,49),(102,8,51),(108,8,54),(152,8,76),(154,8,77),(166,8,83),(4,9,2),(16,9,8),(28,9,14),(34,9,17),(48,9,24),(50,9,25),(52,9,26),(70,9,35),(86,9,43),(114,9,57),(122,9,61),(130,9,65),(132,9,66),(160,9,80),(8,10,4),(10,10,5),(30,10,15),(46,10,23),(84,10,42),(94,10,47),(96,10,48),(110,10,55),(116,10,58),(148,10,74),(156,10,78),(164,10,82);
/*!40000 ALTER TABLE `ec_product_variation_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_variations`
--

DROP TABLE IF EXISTS `ec_product_variations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_variations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned DEFAULT NULL,
  `configurable_product_id` bigint unsigned NOT NULL,
  `is_default` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_product_variations_product_id_configurable_product_id_unique` (`product_id`,`configurable_product_id`),
  KEY `configurable_product_index` (`product_id`,`configurable_product_id`),
  KEY `idx_configurable_product_id` (`configurable_product_id`),
  KEY `idx_product_variations_config` (`configurable_product_id`,`is_default`),
  KEY `ec_product_variations_product_id_index` (`product_id`),
  KEY `ec_product_variations_configurable_product_id_index` (`configurable_product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_variations`
--

LOCK TABLES `ec_product_variations` WRITE;
/*!40000 ALTER TABLE `ec_product_variations` DISABLE KEYS */;
INSERT INTO `ec_product_variations` VALUES (1,55,2,1),(2,56,2,0),(3,57,2,0),(4,58,2,0),(5,59,3,1),(6,60,3,0),(7,61,3,0),(8,62,3,0),(9,63,4,1),(10,64,4,0),(11,65,6,1),(12,66,7,1),(13,67,8,1),(14,68,8,0),(15,69,11,1),(16,70,12,1),(17,71,12,0),(18,72,12,0),(19,73,13,1),(20,74,13,0),(21,75,14,1),(22,76,14,0),(23,77,14,0),(24,78,19,1),(25,79,19,0),(26,80,19,0),(27,81,19,0),(28,82,20,1),(29,83,20,0),(30,84,20,0),(31,85,20,0),(32,86,20,0),(33,87,21,1),(34,88,21,0),(35,89,21,0),(36,90,21,0),(37,91,23,1),(38,92,23,0),(39,93,24,1),(40,94,24,0),(41,95,24,0),(42,96,24,0),(43,97,25,1),(44,98,25,0),(45,99,26,1),(46,100,26,0),(47,101,26,0),(48,102,26,0),(49,103,27,1),(50,104,27,0),(51,105,27,0),(52,106,31,1),(53,107,31,0),(54,108,31,0),(55,109,32,1),(56,110,32,0),(57,111,32,0),(58,112,32,0),(59,113,34,1),(60,114,34,0),(61,115,34,0),(62,116,35,1),(63,117,35,0),(64,118,35,0),(65,119,37,1),(66,120,37,0),(67,121,39,1),(68,122,40,1),(69,123,42,1),(70,124,42,0),(71,125,42,0),(72,126,43,1),(73,127,43,0),(74,128,44,1),(75,129,44,0),(76,130,44,0),(77,131,44,0),(78,132,46,1),(79,133,46,0),(80,134,46,0),(81,135,52,1),(82,136,52,0),(83,137,52,0);
/*!40000 ALTER TABLE `ec_product_variations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_views`
--

DROP TABLE IF EXISTS `ec_product_views`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_views` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned NOT NULL,
  `views` int NOT NULL DEFAULT '1',
  `date` date NOT NULL DEFAULT '2025-12-26',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_product_views_product_id_date_unique` (`product_id`,`date`),
  KEY `ec_product_views_product_id_index` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_views`
--

LOCK TABLES `ec_product_views` WRITE;
/*!40000 ALTER TABLE `ec_product_views` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_product_views` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_with_attribute_set`
--

DROP TABLE IF EXISTS `ec_product_with_attribute_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_with_attribute_set` (
  `attribute_set_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `order` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`,`attribute_set_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_with_attribute_set`
--

LOCK TABLES `ec_product_with_attribute_set` WRITE;
/*!40000 ALTER TABLE `ec_product_with_attribute_set` DISABLE KEYS */;
INSERT INTO `ec_product_with_attribute_set` VALUES (1,2,0),(2,2,0),(1,3,0),(2,3,0),(1,4,0),(2,4,0),(1,6,0),(2,6,0),(1,7,0),(2,7,0),(1,8,0),(2,8,0),(1,11,0),(2,11,0),(1,12,0),(2,12,0),(1,13,0),(2,13,0),(1,14,0),(2,14,0),(1,19,0),(2,19,0),(1,20,0),(2,20,0),(1,21,0),(2,21,0),(1,23,0),(2,23,0),(1,24,0),(2,24,0),(1,25,0),(2,25,0),(1,26,0),(2,26,0),(1,27,0),(2,27,0),(1,31,0),(2,31,0),(1,32,0),(2,32,0),(1,34,0),(2,34,0),(1,35,0),(2,35,0),(1,37,0),(2,37,0),(1,39,0),(2,39,0),(1,40,0),(2,40,0),(1,42,0),(2,42,0),(1,43,0),(2,43,0),(1,44,0),(2,44,0),(1,46,0),(2,46,0),(1,52,0),(2,52,0);
/*!40000 ALTER TABLE `ec_product_with_attribute_set` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_products`
--

DROP TABLE IF EXISTS `ec_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `images` text COLLATE utf8mb4_unicode_ci,
  `video_media` text COLLATE utf8mb4_unicode_ci,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int unsigned NOT NULL DEFAULT '0',
  `quantity` int unsigned DEFAULT NULL,
  `allow_checkout_when_out_of_stock` tinyint unsigned NOT NULL DEFAULT '0',
  `with_storehouse_management` tinyint unsigned NOT NULL DEFAULT '0',
  `stock_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'in_stock',
  `is_featured` tinyint unsigned NOT NULL DEFAULT '0',
  `is_new_until` date DEFAULT NULL,
  `brand_id` bigint unsigned DEFAULT NULL,
  `is_variation` tinyint NOT NULL DEFAULT '0',
  `variations_count` int unsigned NOT NULL DEFAULT '0',
  `reviews_count` int unsigned NOT NULL DEFAULT '0',
  `reviews_avg` decimal(3,2) NOT NULL DEFAULT '0.00',
  `sale_type` tinyint NOT NULL DEFAULT '0',
  `price` double unsigned DEFAULT NULL,
  `sale_price` double unsigned DEFAULT NULL,
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `length` double DEFAULT NULL,
  `wide` double DEFAULT NULL,
  `height` double DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `tax_id` bigint unsigned DEFAULT NULL,
  `views` bigint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by_id` bigint unsigned DEFAULT '0',
  `created_by_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_type` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT 'physical',
  `barcode` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cost_per_item` double DEFAULT NULL,
  `price_includes_tax` tinyint(1) NOT NULL DEFAULT '0',
  `generate_license_code` tinyint(1) NOT NULL DEFAULT '0',
  `license_code_type` enum('auto_generate','pick_from_list') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'auto_generate',
  `minimum_order_quantity` int unsigned DEFAULT '0',
  `maximum_order_quantity` int unsigned DEFAULT '0',
  `notify_attachment_updated` tinyint(1) NOT NULL DEFAULT '0',
  `specification_table_id` bigint unsigned DEFAULT NULL,
  `store_id` bigint unsigned DEFAULT NULL,
  `approved_by` bigint unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ec_products_brand_id_status_is_variation_created_at_index` (`brand_id`,`status`,`is_variation`,`created_at`),
  KEY `sale_type_index` (`sale_type`),
  KEY `start_date_index` (`start_date`),
  KEY `end_date_index` (`end_date`),
  KEY `sale_price_index` (`sale_price`),
  KEY `is_variation_index` (`is_variation`),
  KEY `ec_products_sku_index` (`sku`),
  KEY `idx_products_export` (`id`,`is_variation`),
  KEY `idx_variation_name_id` (`is_variation`,`name`,`id`),
  KEY `ec_products_variations_count_index` (`variations_count`),
  KEY `ec_products_slug_index` (`slug`),
  KEY `idx_products_status_variation` (`status`,`is_variation`,`id`),
  KEY `idx_products_price_sale` (`sale_type`,`sale_price`,`price`),
  KEY `idx_products_order_created` (`order`,`created_at`),
  KEY `idx_products_stock` (`with_storehouse_management`,`stock_status`,`quantity`),
  KEY `ec_products_reviews_count_index` (`reviews_count`),
  KEY `ec_products_reviews_avg_index` (`reviews_avg`),
  KEY `ec_products_status_is_variation_index` (`status`,`is_variation`),
  KEY `ec_products_storehouse_quantity_index` (`with_storehouse_management`,`quantity`),
  KEY `idx_store_variation_status` (`store_id`,`is_variation`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_products`
--

LOCK TABLES `ec_products` WRITE;
/*!40000 ALTER TABLE `ec_products` DISABLE KEYS */;
INSERT INTO `ec_products` VALUES (1,'Smart Home Speaker','smart-home-speaker','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/1-1.jpg\",\"products\\/1-2.jpg\",\"products\\/1-3.jpg\",\"products\\/1-4.jpg\"]',NULL,'FR-116',0,18,0,1,'in_stock',0,NULL,4,0,0,9,2.67,0,839.03,264.03,NULL,NULL,10,16,10,665,NULL,11155,'2025-12-26 09:38:36','2025-12-26 09:38:59',0,'Botble\\ACL\\Models\\User',NULL,'physical','1424349382389',NULL,0,0,'auto_generate',0,0,0,1,3,0),(2,'Headphone Ultra Bass','headphone-ultra-bass','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/2-1.jpg\",\"products\\/2-2.jpg\",\"products\\/2-3.jpg\",\"products\\/2-4.jpg\"]',NULL,'AL-156-A1',0,16,0,1,'in_stock',0,NULL,2,0,4,8,3.13,0,495.16,NULL,NULL,NULL,13,16,14,816,NULL,69046,'2025-12-26 09:38:36','2025-12-26 09:38:59',0,'Botble\\ACL\\Models\\User',NULL,'physical','6200884792310',NULL,0,0,'auto_generate',0,0,0,2,4,0),(3,'Boxed - Bluetooth Headphone','boxed-bluetooth-headphone','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/3-1.jpg\",\"products\\/3-2.jpg\",\"products\\/3-3.jpg\",\"products\\/3-4.jpg\"]',NULL,'LT-171-A1',0,18,0,1,'in_stock',0,NULL,2,0,4,9,3.22,0,924.92,NULL,NULL,NULL,19,20,11,519,NULL,134381,'2025-12-26 09:38:36','2025-12-26 09:38:59',0,'Botble\\ACL\\Models\\User',NULL,'physical','4543420404486',NULL,0,0,'auto_generate',0,0,0,2,6,0),(4,'Camera Samsung SS-24 (Digital)','camera-samsung-ss-24','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/4-1.jpg\",\"products\\/4-2.jpg\",\"products\\/4-3.jpg\",\"products\\/4-4.jpg\"]',NULL,'OO-131-A1',0,14,0,1,'in_stock',0,NULL,5,0,2,9,3.33,0,1007.04,735.1392,NULL,NULL,12,20,16,711,NULL,11043,'2025-12-26 09:38:36','2025-12-26 09:38:59',0,'Botble\\ACL\\Models\\User',NULL,'digital','5992409533621',NULL,0,0,'auto_generate',0,0,0,2,2,0),(5,'Macbook Pro 2015','macbook-pro-2015','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/5-1.jpg\",\"products\\/5-2.jpg\",\"products\\/5-3.jpg\",\"products\\/5-4.jpg\"]',NULL,'SL-150',0,10,0,1,'in_stock',0,NULL,6,0,0,8,2.38,0,1550.8,1349.196,NULL,NULL,19,11,13,655,NULL,126338,'2025-12-26 09:38:36','2025-12-26 09:38:59',0,'Botble\\ACL\\Models\\User',NULL,'physical','6206922297212',NULL,0,0,'auto_generate',0,0,0,1,1,0),(6,'Apple Watch Serial 7','apple-watch-serial-7','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/6-1.jpg\",\"products\\/6-2.jpg\",\"products\\/6-3.jpg\",\"products\\/6-4.jpg\"]',NULL,'8W-111-A1',0,20,0,1,'in_stock',0,NULL,7,0,1,10,3.90,0,1349.33,NULL,NULL,NULL,18,18,10,508,NULL,176223,'2025-12-26 09:38:36','2025-12-26 09:38:59',0,'Botble\\ACL\\Models\\User',NULL,'physical','0423604009611',NULL,0,0,'auto_generate',0,0,0,2,2,0),(7,'Macbook Pro 13 inch','macbook-pro-13-inch','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/7-1.jpg\",\"products\\/7-2.jpg\",\"products\\/7-3.jpg\"]',NULL,'FX-184-A1',0,17,0,1,'in_stock',0,NULL,6,0,1,9,2.56,0,209.28,NULL,NULL,NULL,12,10,14,542,NULL,50181,'2025-12-26 09:38:36','2025-12-26 09:38:59',0,'Botble\\ACL\\Models\\User',NULL,'physical','5704965803182',NULL,0,0,'auto_generate',0,0,0,2,9,0),(8,'Apple Keyboard (Digital)','apple-keyboard','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/8-1.jpg\",\"products\\/8-2.jpg\",\"products\\/8-3.jpg\",\"products\\/8-4.jpg\"]',NULL,'ZY-152-A1',0,12,0,1,'in_stock',0,NULL,4,0,2,10,2.60,0,558.64,413.3936,NULL,NULL,20,13,17,779,NULL,14998,'2025-12-26 09:38:36','2025-12-26 09:38:59',0,'Botble\\ACL\\Models\\User',NULL,'digital','1038051192169',NULL,0,0,'auto_generate',0,0,0,2,6,0),(9,'MacSafe 80W','macsafe-80w','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/9-1.jpg\",\"products\\/9-2.jpg\",\"products\\/9-3.jpg\"]',NULL,'MR-154',0,15,0,1,'in_stock',0,NULL,6,0,0,10,2.90,0,199.91,176.91,NULL,NULL,15,20,16,514,NULL,148565,'2025-12-26 09:38:36','2025-12-26 09:39:00',0,'Botble\\ACL\\Models\\User',NULL,'physical','7868518109980',NULL,0,0,'auto_generate',0,0,0,2,2,0),(10,'Hand playstation','hand-playstation','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/10-1.jpg\",\"products\\/10-2.jpg\",\"products\\/10-3.jpg\",\"products\\/10-4.jpg\"]',NULL,'2Q-143',0,11,0,1,'in_stock',0,NULL,4,0,0,10,3.40,0,604.35,596.35,NULL,NULL,13,11,16,723,NULL,99258,'2025-12-26 09:38:36','2025-12-26 09:39:00',0,'Botble\\ACL\\Models\\User',NULL,'physical','1942003679595',NULL,0,0,'auto_generate',0,0,0,2,7,0),(11,'Apple Airpods Serial 3','apple-airpods-serial-3','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/11-1.jpg\",\"products\\/11-2.jpg\",\"products\\/11-3.jpg\",\"products\\/11-4.jpg\"]',NULL,'SA-157-A1',0,19,0,1,'in_stock',0,NULL,6,0,1,9,2.67,0,1708.93,NULL,NULL,NULL,14,13,12,638,NULL,105370,'2025-12-26 09:38:36','2025-12-26 09:39:00',0,'Botble\\ACL\\Models\\User',NULL,'physical','1026650285375',NULL,0,0,'auto_generate',0,0,0,1,7,0),(12,'Cool Smart Watches (Digital)','cool-smart-watches','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/12-1.jpg\",\"products\\/12-2.jpg\",\"products\\/12-3.jpg\",\"products\\/12-4.jpg\"]',NULL,'Q3-123-A1',0,20,0,1,'in_stock',0,NULL,2,0,3,10,3.20,0,229.13,206.217,NULL,NULL,14,10,15,566,NULL,168918,'2025-12-26 09:38:37','2025-12-26 09:39:00',0,'Botble\\ACL\\Models\\User',NULL,'digital','0837549395157',NULL,0,0,'auto_generate',0,0,0,1,8,0),(13,'Black Smart Watches','black-smart-watches','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/13-1.jpg\",\"products\\/13-2.jpg\",\"products\\/13-3.jpg\",\"products\\/13-4.jpg\"]',NULL,'P2-196-A1',0,19,0,1,'in_stock',1,NULL,5,0,2,10,2.60,0,496.18,NULL,NULL,NULL,11,10,18,685,NULL,115535,'2025-12-26 09:38:37','2025-12-26 09:39:00',0,'Botble\\ACL\\Models\\User',NULL,'physical','6500702781367',NULL,0,0,'auto_generate',0,0,0,1,4,0),(14,'Leather Watch In Black','leather-watch-in-black','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/14-1.jpg\",\"products\\/14-2.jpg\",\"products\\/14-3.jpg\",\"products\\/14-4.jpg\"]',NULL,'FT-154-A1',0,11,0,1,'in_stock',1,NULL,7,0,3,10,2.10,0,742.57,NULL,NULL,NULL,16,18,12,510,NULL,199110,'2025-12-26 09:38:37','2025-12-26 09:39:00',0,'Botble\\ACL\\Models\\User',NULL,'physical','4167686993791',NULL,0,0,'auto_generate',0,0,0,2,4,0),(15,'Macbook Pro 2015 13 inch','macbook-pro-2015-13-inch','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/15-1.jpg\",\"products\\/15-2.jpg\",\"products\\/15-3.jpg\",\"products\\/15-4.jpg\"]',NULL,'0W-101',0,11,0,1,'in_stock',0,NULL,3,0,0,10,3.30,0,847.39,660.9642,NULL,NULL,19,20,11,773,NULL,120885,'2025-12-26 09:38:37','2025-12-26 09:39:00',0,'Botble\\ACL\\Models\\User',NULL,'physical','1322764099182',NULL,0,0,'auto_generate',0,0,0,2,9,0),(16,'Historic Alarm Clock (Digital)','historic-alarm-clock','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/16-1.jpg\",\"products\\/16-2.jpg\",\"products\\/16-3.jpg\",\"products\\/16-4.jpg\"]',NULL,'BT-148',0,17,0,1,'in_stock',0,NULL,6,0,0,10,2.10,0,1238.28,1182.28,NULL,NULL,11,10,11,868,NULL,7603,'2025-12-26 09:38:37','2025-12-26 09:39:00',0,'Botble\\ACL\\Models\\User',NULL,'digital','3131291330556',NULL,0,0,'auto_generate',0,0,0,1,3,0),(17,'Black Glasses','black-glasses','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/17-1.jpg\",\"products\\/17-2.jpg\",\"products\\/17-3.jpg\",\"products\\/17-4.jpg\"]',NULL,'OE-144',0,15,0,1,'in_stock',0,NULL,7,0,0,9,2.78,0,1151.72,651.72,NULL,NULL,12,15,12,567,NULL,173996,'2025-12-26 09:38:37','2025-12-26 09:39:00',0,'Botble\\ACL\\Models\\User',NULL,'physical','8457033492678',NULL,0,0,'auto_generate',0,0,0,1,9,0),(18,'Phillips Mouse','phillips-mouse','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/18-1.jpg\",\"products\\/18-2.jpg\",\"products\\/18-3.jpg\",\"products\\/18-4.jpg\"]',NULL,'DT-183',0,19,0,1,'in_stock',0,NULL,7,0,0,10,3.90,0,836.99,54.99,NULL,NULL,12,20,10,642,NULL,117217,'2025-12-26 09:38:37','2025-12-26 09:39:00',0,'Botble\\ACL\\Models\\User',NULL,'physical','9591418959949',NULL,0,0,'auto_generate',0,0,0,2,6,0),(19,'Gaming Keyboard','gaming-keyboard','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/19-1.jpg\",\"products\\/19-2.jpg\",\"products\\/19-3.jpg\",\"products\\/19-4.jpg\"]',NULL,'UJ-117-A1',0,16,0,1,'in_stock',0,NULL,2,0,4,10,3.20,0,462.51,NULL,NULL,NULL,19,14,13,641,NULL,163971,'2025-12-26 09:38:37','2025-12-26 09:39:00',0,'Botble\\ACL\\Models\\User',NULL,'physical','6146884752872',NULL,0,0,'auto_generate',0,0,0,1,2,0),(20,'Wireless Keyboard (Digital)','wireless-keyboard','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/20-1.jpg\",\"products\\/20-2.jpg\",\"products\\/20-3.jpg\",\"products\\/20-4.jpg\"]',NULL,'ZE-125-A1',0,18,0,1,'in_stock',1,NULL,1,0,5,10,3.50,0,603.23,542.907,NULL,NULL,10,16,16,550,NULL,142254,'2025-12-26 09:38:37','2025-12-26 09:39:00',0,'Botble\\ACL\\Models\\User',NULL,'digital','3970032355133',NULL,0,0,'auto_generate',0,0,0,1,2,0),(21,'Black Smart Watches','black-smart-watches','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/21-1.jpg\",\"products\\/21-2.jpg\",\"products\\/21-3.jpg\",\"products\\/21-4.jpg\"]',NULL,'DM-119-A1',0,11,0,1,'in_stock',0,NULL,7,0,4,10,3.80,0,1944.64,NULL,NULL,NULL,14,19,14,856,NULL,131933,'2025-12-26 09:38:37','2025-12-26 09:39:00',0,'Botble\\ACL\\Models\\User',NULL,'physical','2397711253541',NULL,0,0,'auto_generate',0,0,0,2,9,0),(22,'Smart Home Speaker','smart-home-speaker','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/22-1.jpg\",\"products\\/22-2.jpg\",\"products\\/22-3.jpg\",\"products\\/22-4.jpg\"]',NULL,'TF-137',0,11,0,1,'in_stock',0,NULL,4,0,0,9,3.11,0,1020.68,453.68,NULL,NULL,15,11,19,705,NULL,70496,'2025-12-26 09:38:37','2025-12-26 09:39:00',0,'Botble\\ACL\\Models\\User',NULL,'physical','1271174939482',NULL,0,0,'auto_generate',0,0,0,1,7,0),(23,'Headphone Ultra Bass','headphone-ultra-bass','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/23-1.jpg\",\"products\\/23-2.jpg\",\"products\\/23-3.jpg\",\"products\\/23-4.jpg\"]',NULL,'UR-130-A1',0,16,0,1,'in_stock',1,NULL,7,0,2,9,2.56,0,900.36,NULL,NULL,NULL,18,15,18,763,NULL,134753,'2025-12-26 09:38:37','2025-12-26 09:39:00',0,'Botble\\ACL\\Models\\User',NULL,'physical','6901135956368',NULL,0,0,'auto_generate',0,0,0,2,3,0),(24,'Boxed - Bluetooth Headphone (Digital)','boxed-bluetooth-headphone','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/24-1.jpg\",\"products\\/24-2.jpg\",\"products\\/24-3.jpg\",\"products\\/24-4.jpg\"]',NULL,'TC-126-A1',0,12,0,1,'in_stock',0,NULL,7,0,4,10,2.90,0,759.14,584.5378,NULL,NULL,11,11,18,506,NULL,22956,'2025-12-26 09:38:37','2025-12-26 09:39:00',0,'Botble\\ACL\\Models\\User',NULL,'digital','5028444276305',NULL,0,0,'auto_generate',0,0,0,2,3,0),(25,'Camera Samsung SS-24','camera-samsung-ss-24','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/25-1.jpg\",\"products\\/25-2.jpg\",\"products\\/25-3.jpg\",\"products\\/25-4.jpg\"]',NULL,'BU-196-A1',0,19,0,1,'in_stock',1,NULL,7,0,2,10,2.70,0,674.04,NULL,NULL,NULL,10,15,13,863,NULL,192034,'2025-12-26 09:38:37','2025-12-26 09:39:00',0,'Botble\\ACL\\Models\\User',NULL,'physical','8214520190178',NULL,0,0,'auto_generate',0,0,0,1,3,0),(26,'Leather Watch In Black','leather-watch-in-black','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/26-1.jpg\",\"products\\/26-2.jpg\",\"products\\/26-3.jpg\",\"products\\/26-4.jpg\"]',NULL,'JV-193-A1',0,12,0,1,'in_stock',0,NULL,7,0,4,10,2.90,0,471.27,NULL,NULL,NULL,16,16,11,866,NULL,178956,'2025-12-26 09:38:37','2025-12-26 09:39:00',0,'Botble\\ACL\\Models\\User',NULL,'physical','6384985798355',NULL,0,0,'auto_generate',0,0,0,1,1,0),(27,'Apple iPhone 13 Plus','apple-iphone-13-plus','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/27-1.jpg\",\"products\\/27-2.jpg\",\"products\\/27-3.jpg\",\"products\\/27-4.jpg\"]',NULL,'DL-135-A1',0,19,0,1,'in_stock',0,NULL,4,0,3,10,3.70,0,948.45,NULL,NULL,NULL,18,17,18,793,NULL,163723,'2025-12-26 09:38:37','2025-12-26 09:39:00',0,'Botble\\ACL\\Models\\User',NULL,'physical','5593812037531',NULL,0,0,'auto_generate',0,0,0,1,8,0),(28,'Macbook Pro 2015 (Digital)','macbook-pro-2015','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/28-1.jpg\",\"products\\/28-2.jpg\",\"products\\/28-3.jpg\",\"products\\/28-4.jpg\"]',NULL,'U2-115',0,20,0,1,'in_stock',0,NULL,3,0,0,10,2.80,0,1629.19,56.19,NULL,NULL,15,12,13,815,NULL,176686,'2025-12-26 09:38:37','2025-12-26 09:39:00',0,'Botble\\ACL\\Models\\User',NULL,'digital','8246737510548',NULL,0,0,'auto_generate',0,0,0,2,3,0),(29,'Apple Watch Serial 7','apple-watch-serial-7','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/29-1.jpg\",\"products\\/29-2.jpg\",\"products\\/29-3.jpg\"]',NULL,'YK-145',0,16,0,1,'in_stock',1,NULL,3,0,0,10,3.40,0,1038.88,936.88,NULL,NULL,17,12,11,655,NULL,6407,'2025-12-26 09:38:37','2025-12-26 09:39:00',0,'Botble\\ACL\\Models\\User',NULL,'physical','5682179648204',NULL,0,0,'auto_generate',0,0,0,1,8,0),(30,'Macbook Pro 13 inch','macbook-pro-13-inch','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/30-1.jpg\",\"products\\/30-2.jpg\",\"products\\/30-3.jpg\",\"products\\/30-4.jpg\"]',NULL,'KL-102',0,14,0,1,'in_stock',0,NULL,5,0,0,10,2.20,0,1083.36,953.36,NULL,NULL,13,16,10,780,NULL,173064,'2025-12-26 09:38:37','2025-12-26 09:39:00',0,'Botble\\ACL\\Models\\User',NULL,'physical','7055786802617',NULL,0,0,'auto_generate',0,0,0,1,7,0),(31,'Apple Keyboard','apple-keyboard','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/31-1.jpg\",\"products\\/31-2.jpg\",\"products\\/31-3.jpg\",\"products\\/31-4.jpg\"]',NULL,'8T-128-A1',0,11,0,1,'in_stock',1,NULL,7,0,3,10,2.80,0,193.52,NULL,NULL,NULL,20,12,18,815,NULL,72095,'2025-12-26 09:38:37','2025-12-26 09:39:00',0,'Botble\\ACL\\Models\\User',NULL,'physical','7089868738150',NULL,0,0,'auto_generate',0,0,0,1,2,0),(32,'MacSafe 80W (Digital)','macsafe-80w','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/32-1.jpg\",\"products\\/32-2.jpg\",\"products\\/32-3.jpg\",\"products\\/32-4.jpg\"]',NULL,'E3-108-A1',0,10,0,1,'in_stock',0,NULL,4,0,4,10,3.10,0,1595.01,1244.1078,NULL,NULL,19,13,14,784,NULL,191393,'2025-12-26 09:38:38','2025-12-26 09:39:00',0,'Botble\\ACL\\Models\\User',NULL,'digital','2375437468937',NULL,0,0,'auto_generate',0,0,0,1,4,0),(33,'Hand playstation','hand-playstation','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/33-1.jpg\",\"products\\/33-2.jpg\",\"products\\/33-3.jpg\",\"products\\/33-4.jpg\"]',NULL,'RY-149',0,15,0,1,'in_stock',0,NULL,3,0,0,10,2.70,0,1418.22,1233.8514,NULL,NULL,20,12,17,538,NULL,173998,'2025-12-26 09:38:38','2025-12-26 09:39:01',0,'Botble\\ACL\\Models\\User',NULL,'physical','9165247742500',NULL,0,0,'auto_generate',0,0,0,2,8,0),(34,'Apple Airpods Serial 3','apple-airpods-serial-3','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/34-1.jpg\",\"products\\/34-2.jpg\",\"products\\/34-3.jpg\",\"products\\/34-4.jpg\"]',NULL,'4B-118-A1',0,14,0,1,'in_stock',0,NULL,2,0,3,10,3.20,0,1150.59,NULL,NULL,NULL,17,16,10,829,NULL,163699,'2025-12-26 09:38:38','2025-12-26 09:39:01',0,'Botble\\ACL\\Models\\User',NULL,'physical','5101711024141',NULL,0,0,'auto_generate',0,0,0,2,8,0),(35,'Cool Smart Watches','cool-smart-watches','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/35-1.jpg\",\"products\\/35-2.jpg\",\"products\\/35-3.jpg\",\"products\\/35-4.jpg\"]',NULL,'CK-160-A1',0,10,0,1,'in_stock',1,NULL,6,0,3,10,3.30,0,252.08,NULL,NULL,NULL,18,10,18,501,NULL,16959,'2025-12-26 09:38:38','2025-12-26 09:39:01',0,'Botble\\ACL\\Models\\User',NULL,'physical','0857434327063',NULL,0,0,'auto_generate',0,0,0,2,3,0),(36,'Black Smart Watches (Digital)','black-smart-watches','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/36-1.jpg\",\"products\\/36-2.jpg\",\"products\\/36-3.jpg\"]',NULL,'6H-158',0,14,0,1,'in_stock',0,NULL,3,0,0,10,2.80,0,1778.11,1627.11,NULL,NULL,19,12,10,752,NULL,166219,'2025-12-26 09:38:38','2025-12-26 09:39:01',0,'Botble\\ACL\\Models\\User',NULL,'digital','3758166516480',NULL,0,0,'auto_generate',0,0,0,1,6,0),(37,'Leather Watch In Black','leather-watch-in-black','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/37-1.jpg\",\"products\\/37-2.jpg\",\"products\\/37-3.jpg\"]',NULL,'YB-118-A1',0,13,0,1,'in_stock',0,NULL,7,0,2,10,3.70,0,452.15,NULL,NULL,NULL,17,19,10,714,NULL,84042,'2025-12-26 09:38:38','2025-12-26 09:39:01',0,'Botble\\ACL\\Models\\User',NULL,'physical','1870340055157',NULL,0,0,'auto_generate',0,0,0,1,2,0),(38,'Macbook Pro 2015 13 inch','macbook-pro-2015-13-inch','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/38-1.jpg\",\"products\\/38-2.jpg\",\"products\\/38-3.jpg\",\"products\\/38-4.jpg\"]',NULL,'FB-179',0,13,0,1,'in_stock',1,NULL,6,0,0,9,3.22,0,797.25,698.25,NULL,NULL,20,13,17,603,NULL,78648,'2025-12-26 09:38:38','2025-12-26 09:39:01',0,'Botble\\ACL\\Models\\User',NULL,'physical','0364798381421',NULL,0,0,'auto_generate',0,0,0,2,1,0),(39,'Sony WH-1000XM4 Wireless Headphones','sony-wh-1000xm4-wireless-headphones','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/39-1.jpg\",\"products\\/39-2.jpg\",\"products\\/39-3.jpg\",\"products\\/39-4.jpg\"]',NULL,'P7-102-A1',0,18,0,1,'in_stock',0,NULL,2,0,1,10,2.50,0,893.38,NULL,NULL,NULL,15,10,20,504,NULL,7134,'2025-12-26 09:38:38','2025-12-26 09:39:01',0,'Botble\\ACL\\Models\\User',NULL,'physical','9672197309597',NULL,0,0,'auto_generate',0,0,0,1,9,0),(40,'Samsung Galaxy S22 Ultra (Digital)','samsung-galaxy-s22-ultra','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/40-1.jpg\",\"products\\/40-2.jpg\",\"products\\/40-3.jpg\",\"products\\/40-4.jpg\"]',NULL,'7H-109-A1',0,12,0,1,'in_stock',1,NULL,7,0,1,10,3.10,0,1716.1,1493.007,NULL,NULL,18,13,20,600,NULL,11673,'2025-12-26 09:38:38','2025-12-26 09:39:01',0,'Botble\\ACL\\Models\\User',NULL,'digital','0518244514608',NULL,0,0,'auto_generate',0,0,0,1,2,0),(41,'Dell XPS 15 Laptop','dell-xps-15-laptop','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/41-1.jpg\",\"products\\/41-2.jpg\",\"products\\/41-3.jpg\",\"products\\/41-4.jpg\"]',NULL,'DX-158',0,11,0,1,'in_stock',0,NULL,3,0,0,10,3.40,0,614.28,358.28,NULL,NULL,12,14,14,740,NULL,33705,'2025-12-26 09:38:38','2025-12-26 09:39:01',0,'Botble\\ACL\\Models\\User',NULL,'physical','2641038278115',NULL,0,0,'auto_generate',0,0,0,1,3,0),(42,'iPad Pro 12.9-inch','ipad-pro-129-inch','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/42-1.jpg\",\"products\\/42-2.jpg\",\"products\\/42-3.jpg\"]',NULL,'BQ-196-A1',0,11,0,1,'in_stock',0,NULL,5,0,3,10,2.40,0,1191.66,NULL,NULL,NULL,14,15,16,641,NULL,149757,'2025-12-26 09:38:38','2025-12-26 09:39:01',0,'Botble\\ACL\\Models\\User',NULL,'physical','7964001128220',NULL,0,0,'auto_generate',0,0,0,2,1,0),(43,'Bose QuietComfort Earbuds','bose-quietcomfort-earbuds','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/43-1.jpg\",\"products\\/43-2.jpg\",\"products\\/43-3.jpg\"]',NULL,'0V-183-A1',0,13,0,1,'in_stock',1,NULL,2,0,2,9,2.56,0,469.16,NULL,NULL,NULL,12,20,20,763,NULL,7485,'2025-12-26 09:38:38','2025-12-26 09:39:01',0,'Botble\\ACL\\Models\\User',NULL,'physical','1741715830788',NULL,0,0,'auto_generate',0,0,0,1,3,0),(44,'LG OLED C1 Series TV (Digital)','lg-oled-c1-series-tv','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/44-1.jpg\",\"products\\/44-2.jpg\",\"products\\/44-3.jpg\"]',NULL,'6A-145-A1',0,19,0,1,'in_stock',1,NULL,2,0,4,10,2.80,0,1905.2,1676.576,NULL,NULL,15,18,14,703,NULL,92348,'2025-12-26 09:38:38','2025-12-26 09:39:01',0,'Botble\\ACL\\Models\\User',NULL,'digital','5120874150689',NULL,0,0,'auto_generate',0,0,0,1,7,0),(45,'Dyson V11 Vacuum Cleaner','dyson-v11-vacuum-cleaner','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/45-1.jpg\",\"products\\/45-2.jpg\",\"products\\/45-3.jpg\",\"products\\/45-4.jpg\"]',NULL,'8K-190',0,20,0,1,'in_stock',1,NULL,5,0,0,10,3.00,0,1630.52,1064.52,NULL,NULL,17,20,16,771,NULL,49938,'2025-12-26 09:38:38','2025-12-26 09:39:01',0,'Botble\\ACL\\Models\\User',NULL,'physical','5526506106725',NULL,0,0,'auto_generate',0,0,0,2,2,0),(46,'Nintendo Switch OLED Model','nintendo-switch-oled-model','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/46-1.jpg\",\"products\\/46-2.jpg\",\"products\\/46-3.jpg\",\"products\\/46-4.jpg\"]',NULL,'YB-121-A1',0,15,0,1,'in_stock',0,NULL,4,0,3,10,2.20,0,1732.12,NULL,NULL,NULL,17,20,18,582,NULL,60619,'2025-12-26 09:38:38','2025-12-26 09:39:01',0,'Botble\\ACL\\Models\\User',NULL,'physical','0429202776450',NULL,0,0,'auto_generate',0,0,0,1,1,0),(47,'Canon EOS R5 Camera','canon-eos-r5-camera','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/47-1.jpg\",\"products\\/47-2.jpg\",\"products\\/47-3.jpg\"]',NULL,'VM-121',0,17,0,1,'in_stock',0,NULL,5,0,0,10,2.60,0,1297.23,900.23,NULL,NULL,18,13,17,582,NULL,95613,'2025-12-26 09:38:38','2025-12-26 09:39:01',0,'Botble\\ACL\\Models\\User',NULL,'physical','1525683064198',NULL,0,0,'auto_generate',0,0,0,2,1,0),(48,'Fitbit Sense Smartwatch (Digital)','fitbit-sense-smartwatch','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/48-1.jpg\",\"products\\/48-2.jpg\",\"products\\/48-3.jpg\",\"products\\/48-4.jpg\"]',NULL,'LQ-176',0,15,0,1,'in_stock',0,NULL,3,0,0,8,3.00,0,1547.32,1284.2756,NULL,NULL,16,12,16,660,NULL,92447,'2025-12-26 09:38:38','2025-12-26 09:39:01',0,'Botble\\ACL\\Models\\User',NULL,'digital','4292155246730',NULL,0,0,'auto_generate',0,0,0,2,1,0),(49,'Sonos Beam Soundbar','sonos-beam-soundbar','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/49-1.jpg\",\"products\\/49-2.jpg\",\"products\\/49-3.jpg\",\"products\\/49-4.jpg\"]',NULL,'KZ-192',0,17,0,1,'in_stock',0,NULL,2,0,0,10,3.50,0,1311.08,917.756,NULL,NULL,20,17,13,512,NULL,22520,'2025-12-26 09:38:38','2025-12-26 09:39:01',0,'Botble\\ACL\\Models\\User',NULL,'physical','9959660564227',NULL,0,0,'auto_generate',0,0,0,1,8,0),(50,'Logitech MX Master 3 Mouse','logitech-mx-master-3-mouse','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/50-1.jpg\",\"products\\/50-2.jpg\",\"products\\/50-3.jpg\",\"products\\/50-4.jpg\"]',NULL,'3F-125',0,18,0,1,'in_stock',0,NULL,4,0,0,10,2.70,0,1311.13,1193.13,NULL,NULL,11,14,18,755,NULL,136921,'2025-12-26 09:38:38','2025-12-26 09:39:01',0,'Botble\\ACL\\Models\\User',NULL,'physical','9163776725599',NULL,0,0,'auto_generate',0,0,0,2,9,0),(51,'Kindle Paperwhite E-reader','kindle-paperwhite-e-reader','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/51-1.jpg\",\"products\\/51-2.jpg\",\"products\\/51-3.jpg\",\"products\\/51-4.jpg\"]',NULL,'EI-172',0,15,0,1,'in_stock',0,NULL,4,0,0,9,3.33,0,1924.02,385.02,NULL,NULL,16,14,16,556,NULL,3420,'2025-12-26 09:38:38','2025-12-26 09:39:01',0,'Botble\\ACL\\Models\\User',NULL,'physical','4357201426709',NULL,0,0,'auto_generate',0,0,0,1,3,0),(52,'GoPro HERO10 Black (Digital)','gopro-hero10-black','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/52-1.jpg\",\"products\\/52-2.jpg\",\"products\\/52-3.jpg\"]',NULL,'CO-195-A1',0,19,0,1,'in_stock',0,NULL,7,0,3,10,3.00,0,113.81,88.7718,NULL,NULL,18,11,11,678,NULL,110370,'2025-12-26 09:38:38','2025-12-26 09:39:01',0,'Botble\\ACL\\Models\\User',NULL,'digital','9024549579132',NULL,0,0,'auto_generate',0,0,0,1,4,0),(53,'Anker PowerCore Power Bank','anker-powercore-power-bank','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/53-1.jpg\",\"products\\/53-2.jpg\",\"products\\/53-3.jpg\",\"products\\/53-4.jpg\"]',NULL,'JZ-173',0,12,0,1,'in_stock',0,NULL,2,0,0,10,2.90,0,522.59,402.3943,NULL,NULL,15,11,12,788,NULL,7795,'2025-12-26 09:38:38','2025-12-26 09:39:01',0,'Botble\\ACL\\Models\\User',NULL,'physical','7190927764604',NULL,0,0,'auto_generate',0,0,0,2,8,0),(54,'Samsung Galaxy Buds Pro','samsung-galaxy-buds-pro','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/54-1.jpg\",\"products\\/54-2.jpg\",\"products\\/54-3.jpg\"]',NULL,'PF-177',0,13,0,1,'in_stock',0,NULL,6,0,0,9,3.00,0,65,29,NULL,NULL,19,16,13,747,NULL,8668,'2025-12-26 09:38:39','2025-12-26 09:39:01',0,'Botble\\ACL\\Models\\User',NULL,'physical','6451936143691',NULL,0,0,'auto_generate',0,0,0,2,1,0),(55,'Headphone Ultra Bass',NULL,NULL,NULL,'published','[\"products\\/2-2.jpg\"]',NULL,'AL-156-A1',0,16,0,1,'in_stock',0,NULL,2,1,0,0,0.00,0,495.16,NULL,NULL,NULL,13,16,14,816,NULL,0,'2025-12-26 09:38:39','2025-12-26 09:38:59',0,'Botble\\ACL\\Models\\User',NULL,'physical','8556268860488',NULL,0,0,'auto_generate',0,0,0,NULL,NULL,0),(56,'Headphone Ultra Bass',NULL,NULL,NULL,'published','[\"products\\/2-3.jpg\"]',NULL,'AL-156-A1-A2',0,16,0,1,'in_stock',0,NULL,2,1,0,0,0.00,0,495.16,NULL,NULL,NULL,13,16,14,816,NULL,0,'2025-12-26 09:38:39','2025-12-26 09:38:59',0,'Botble\\ACL\\Models\\User',NULL,'physical','0416819614633',NULL,0,0,'auto_generate',0,0,0,NULL,NULL,0),(57,'Headphone Ultra Bass',NULL,NULL,NULL,'published','[\"products\\/2-4.jpg\"]',NULL,'AL-156-A1-A3',0,16,0,1,'in_stock',0,NULL,2,1,0,0,0.00,0,495.16,NULL,NULL,NULL,13,16,14,816,NULL,0,'2025-12-26 09:38:39','2025-12-26 09:38:59',0,'Botble\\ACL\\Models\\User',NULL,'physical','5347580624086',NULL,0,0,'auto_generate',0,0,0,NULL,NULL,0),(58,'Headphone Ultra Bass',NULL,NULL,NULL,'published','[\"products\\/2-1.jpg\"]',NULL,'AL-156-A1-A4',0,16,0,1,'in_stock',0,NULL,2,1,0,0,0.00,0,495.16,NULL,NULL,NULL,13,16,14,816,NULL,0,'2025-12-26 09:38:39','2025-12-26 09:38:59',0,'Botble\\ACL\\Models\\User',NULL,'physical','4022641932126',NULL,0,0,'auto_generate',0,0,0,NULL,NULL,0),(59,'Boxed - Bluetooth Headphone',NULL,NULL,NULL,'published','[\"products\\/3-2.jpg\"]',NULL,'LT-171-A1',0,18,0,1,'in_stock',0,NULL,2,1,0,0,0.00,0,924.92,NULL,NULL,NULL,19,20,11,519,NULL,0,'2025-12-26 09:38:39','2025-12-26 09:38:59',0,'Botble\\ACL\\Models\\User',NULL,'physical','4932942272800',NULL,0,0,'auto_generate',0,0,0,NULL,NULL,0),(60,'Boxed - Bluetooth Headphone',NULL,NULL,NULL,'published','[\"products\\/3-3.jpg\"]',NULL,'LT-171-A1-A2',0,18,0,1,'in_stock',0,NULL,2,1,0,0,0.00,0,924.92,NULL,NULL,NULL,19,20,11,519,NULL,0,'2025-12-26 09:38:39','2025-12-26 09:38:59',0,'Botble\\ACL\\Models\\User',NULL,'physical','9521302711261',NULL,0,0,'auto_generate',0,0,0,NULL,NULL,0),(61,'Boxed - Bluetooth Headphone',NULL,NULL,NULL,'published','[\"products\\/3-4.jpg\"]',NULL,'LT-171-A1-A3',0,18,0,1,'in_stock',0,NULL,2,1,0,0,0.00,0,924.92,NULL,NULL,NULL,19,20,11,519,NULL,0,'2025-12-26 09:38:39','2025-12-26 09:38:59',0,'Botble\\ACL\\Models\\User',NULL,'physical','7531278126053',NULL,0,0,'auto_generate',0,0,0,NULL,NULL,0),(62,'Boxed - Bluetooth Headphone',NULL,NULL,NULL,'published','[\"products\\/3-1.jpg\"]',NULL,'LT-171-A1-A4',0,18,0,1,'in_stock',0,NULL,2,1,0,0,0.00,0,924.92,NULL,NULL,NULL,19,20,11,519,NULL,0,'2025-12-26 09:38:39','2025-12-26 09:38:59',0,'Botble\\ACL\\Models\\User',NULL,'physical','9951715809321',NULL,0,0,'auto_generate',0,0,0,NULL,NULL,0),(63,'Camera Samsung SS-24 (Digital)',NULL,NULL,NULL,'published','[\"products\\/4-2.jpg\"]',NULL,'OO-131-A1',0,14,0,1,'in_stock',0,NULL,5,1,0,0,0.00,0,1007.04,735.1392,NULL,NULL,12,20,16,711,NULL,0,'2025-12-26 09:38:39','2025-12-26 09:38:59',0,'Botble\\ACL\\Models\\User',NULL,'digital','1573650701539',NULL,0,0,'auto_generate',0,0,0,NULL,NULL,0),(64,'Camera Samsung SS-24 (Digital)',NULL,NULL,NULL,'published','[\"products\\/4-3.jpg\"]',NULL,'OO-131-A1-A2',0,14,0,1,'in_stock',0,NULL,5,1,0,0,0.00,0,1007.04,735.1392,NULL,NULL,12,20,16,711,NULL,0,'2025-12-26 09:38:39','2025-12-26 09:38:59',0,'Botble\\ACL\\Models\\User',NULL,'digital','0839683134296',NULL,0,0,'auto_generate',0,0,0,NULL,NULL,0),(65,'Apple Watch Serial 7',NULL,NULL,NULL,'published','[\"products\\/6-2.jpg\"]',NULL,'8W-111-A1',0,20,0,1,'in_stock',0,NULL,7,1,0,0,0.00,0,1349.33,NULL,NULL,NULL,18,18,10,508,NULL,0,'2025-12-26 09:38:39','2025-12-26 09:38:59',0,'Botble\\ACL\\Models\\User',NULL,'physical','7565578445439',NULL,0,0,'auto_generate',0,0,0,NULL,NULL,0),(66,'Macbook Pro 13 inch',NULL,NULL,NULL,'published','[\"products\\/7-2.jpg\"]',NULL,'FX-184-A1',0,17,0,1,'in_stock',0,NULL,6,1,0,0,0.00,0,209.28,NULL,NULL,NULL,12,10,14,542,NULL,0,'2025-12-26 09:38:39','2025-12-26 09:38:59',0,'Botble\\ACL\\Models\\User',NULL,'physical','0850907149605',NULL,0,0,'auto_generate',0,0,0,NULL,NULL,0),(67,'Apple Keyboard (Digital)',NULL,NULL,NULL,'published','[\"products\\/8-2.jpg\"]',NULL,'ZY-152-A1',0,12,0,1,'in_stock',0,NULL,4,1,0,0,0.00,0,558.64,413.3936,NULL,NULL,20,13,17,779,NULL,0,'2025-12-26 09:38:39','2025-12-26 09:38:59',0,'Botble\\ACL\\Models\\User',NULL,'digital','7483556415963',NULL,0,0,'auto_generate',0,0,0,NULL,NULL,0),(68,'Apple Keyboard (Digital)',NULL,NULL,NULL,'published','[\"products\\/8-3.jpg\"]',NULL,'ZY-152-A1-A2',0,12,0,1,'in_stock',0,NULL,4,1,0,0,0.00,0,558.64,424.5664,NULL,NULL,20,13,17,779,NULL,0,'2025-12-26 09:38:39','2025-12-26 09:38:59',0,'Botble\\ACL\\Models\\User',NULL,'digital','1167485228370',NULL,0,0,'auto_generate',0,0,0,NULL,NULL,0),(69,'Apple Airpods Serial 3',NULL,NULL,NULL,'published','[\"products\\/11-2.jpg\"]',NULL,'SA-157-A1',0,19,0,1,'in_stock',0,NULL,6,1,0,0,0.00,0,1708.93,NULL,NULL,NULL,14,13,12,638,NULL,0,'2025-12-26 09:38:39','2025-12-26 09:39:00',0,'Botble\\ACL\\Models\\User',NULL,'physical','4777476873211',NULL,0,0,'auto_generate',0,0,0,NULL,NULL,0),(70,'Cool Smart Watches (Digital)',NULL,NULL,NULL,'published','[\"products\\/12-2.jpg\"]',NULL,'Q3-123-A1',0,20,0,1,'in_stock',0,NULL,2,1,0,0,0.00,0,229.13,206.217,NULL,NULL,14,10,15,566,NULL,0,'2025-12-26 09:38:39','2025-12-26 09:39:00',0,'Botble\\ACL\\Models\\User',NULL,'digital','0868055896715',NULL,0,0,'auto_generate',0,0,0,NULL,NULL,0),(71,'Cool Smart Watches (Digital)',NULL,NULL,NULL,'published','[\"products\\/12-3.jpg\"]',NULL,'Q3-123-A1-A2',0,20,0,1,'in_stock',0,NULL,2,1,0,0,0.00,0,229.13,176.4301,NULL,NULL,14,10,15,566,NULL,0,'2025-12-26 09:38:39','2025-12-26 09:39:00',0,'Botble\\ACL\\Models\\User',NULL,'digital','6662312939689',NULL,0,0,'auto_generate',0,0,0,NULL,NULL,0),(72,'Cool Smart Watches (Digital)',NULL,NULL,NULL,'published','[\"products\\/12-4.jpg\"]',NULL,'Q3-123-A1-A3',0,20,0,1,'in_stock',0,NULL,2,1,0,0,0.00,0,229.13,190.1779,NULL,NULL,14,10,15,566,NULL,0,'2025-12-26 09:38:39','2025-12-26 09:39:00',0,'Botble\\ACL\\Models\\User',NULL,'digital','3922969567936',NULL,0,0,'auto_generate',0,0,0,NULL,NULL,0),(73,'Black Smart Watches',NULL,NULL,NULL,'published','[\"products\\/13-2.jpg\"]',NULL,'P2-196-A1',0,19,0,1,'in_stock',0,NULL,5,1,0,0,0.00,0,496.18,NULL,NULL,NULL,11,10,18,685,NULL,0,'2025-12-26 09:38:39','2025-12-26 09:39:00',0,'Botble\\ACL\\Models\\User',NULL,'physical','2637346307722',NULL,0,0,'auto_generate',0,0,0,NULL,NULL,0),(74,'Black Smart Watches',NULL,NULL,NULL,'published','[\"products\\/13-3.jpg\"]',NULL,'P2-196-A1-A2',0,19,0,1,'in_stock',0,NULL,5,1,0,0,0.00,0,496.18,NULL,NULL,NULL,11,10,18,685,NULL,0,'2025-12-26 09:38:40','2025-12-26 09:39:00',0,'Botble\\ACL\\Models\\User',NULL,'physical','5642052650588',NULL,0,0,'auto_generate',0,0,0,NULL,NULL,0),(75,'Leather Watch In Black',NULL,NULL,NULL,'published','[\"products\\/14-2.jpg\"]',NULL,'FT-154-A1',0,11,0,1,'in_stock',0,NULL,7,1,0,0,0.00,0,742.57,NULL,NULL,NULL,16,18,12,510,NULL,0,'2025-12-26 09:38:40','2025-12-26 09:39:00',0,'Botble\\ACL\\Models\\User',NULL,'physical','6998599369445',NULL,0,0,'auto_generate',0,0,0,NULL,NULL,0),(76,'Leather Watch In Black',NULL,NULL,NULL,'published','[\"products\\/14-3.jpg\"]',NULL,'FT-154-A1-A2',0,11,0,1,'in_stock',0,NULL,7,1,0,0,0.00,0,742.57,NULL,NULL,NULL,16,18,12,510,NULL,0,'2025-12-26 09:38:40','2025-12-26 09:39:00',0,'Botble\\ACL\\Models\\User',NULL,'physical','2829927379956',NULL,0,0,'auto_generate',0,0,0,NULL,NULL,0),(77,'Leather Watch In Black',NULL,NULL,NULL,'published','[\"products\\/14-4.jpg\"]',NULL,'FT-154-A1-A3',0,11,0,1,'in_stock',0,NULL,7,1,0,0,0.00,0,742.57,NULL,NULL,NULL,16,18,12,510,NULL,0,'2025-12-26 09:38:40','2025-12-26 09:39:00',0,'Botble\\ACL\\Models\\User',NULL,'physical','5252315009475',NULL,0,0,'auto_generate',0,0,0,NULL,NULL,0),(78,'Gaming Keyboard',NULL,NULL,NULL,'published','[\"products\\/19-2.jpg\"]',NULL,'UJ-117-A1',0,16,0,1,'in_stock',0,NULL,2,1,0,0,0.00,0,462.51,NULL,NULL,NULL,19,14,13,641,NULL,0,'2025-12-26 09:38:40','2025-12-26 09:39:00',0,'Botble\\ACL\\Models\\User',NULL,'physical','3747941491494',NULL,0,0,'auto_generate',0,0,0,NULL,NULL,0),(79,'Gaming Keyboard',NULL,NULL,NULL,'published','[\"products\\/19-3.jpg\"]',NULL,'UJ-117-A1-A2',0,16,0,1,'in_stock',0,NULL,2,1,0,0,0.00,0,462.51,NULL,NULL,NULL,19,14,13,641,NULL,0,'2025-12-26 09:38:40','2025-12-26 09:39:00',0,'Botble\\ACL\\Models\\User',NULL,'physical','0446581112563',NULL,0,0,'auto_generate',0,0,0,NULL,NULL,0),(80,'Gaming Keyboard',NULL,NULL,NULL,'published','[\"products\\/19-4.jpg\"]',NULL,'UJ-117-A1-A3',0,16,0,1,'in_stock',0,NULL,2,1,0,0,0.00,0,462.51,NULL,NULL,NULL,19,14,13,641,NULL,0,'2025-12-26 09:38:40','2025-12-26 09:39:00',0,'Botble\\ACL\\Models\\User',NULL,'physical','1978508236889',NULL,0,0,'auto_generate',0,0,0,NULL,NULL,0),(81,'Gaming Keyboard',NULL,NULL,NULL,'published','[\"products\\/19-1.jpg\"]',NULL,'UJ-117-A1-A4',0,16,0,1,'in_stock',0,NULL,2,1,0,0,0.00,0,462.51,NULL,NULL,NULL,19,14,13,641,NULL,0,'2025-12-26 09:38:40','2025-12-26 09:39:00',0,'Botble\\ACL\\Models\\User',NULL,'physical','6504837082719',NULL,0,0,'auto_generate',0,0,0,NULL,NULL,0),(82,'Wireless Keyboard (Digital)',NULL,NULL,NULL,'published','[\"products\\/20-2.jpg\"]',NULL,'ZE-125-A1',0,18,0,1,'in_stock',0,NULL,1,1,0,0,0.00,0,603.23,542.907,NULL,NULL,10,16,16,550,NULL,0,'2025-12-26 09:38:40','2025-12-26 09:39:00',0,'Botble\\ACL\\Models\\User',NULL,'digital','9598498761806',NULL,0,0,'auto_generate',0,0,0,NULL,NULL,0),(83,'Wireless Keyboard (Digital)',NULL,NULL,NULL,'published','[\"products\\/20-3.jpg\"]',NULL,'ZE-125-A1-A2',0,18,0,1,'in_stock',0,NULL,1,1,0,0,0.00,0,603.23,446.3902,NULL,NULL,10,16,16,550,NULL,0,'2025-12-26 09:38:40','2025-12-26 09:39:00',0,'Botble\\ACL\\Models\\User',NULL,'digital','7371658862221',NULL,0,0,'auto_generate',0,0,0,NULL,NULL,0),(84,'Wireless Keyboard (Digital)',NULL,NULL,NULL,'published','[\"products\\/20-4.jpg\"]',NULL,'ZE-125-A1-A3',0,18,0,1,'in_stock',0,NULL,1,1,0,0,0.00,0,603.23,476.5517,NULL,NULL,10,16,16,550,NULL,0,'2025-12-26 09:38:40','2025-12-26 09:39:00',0,'Botble\\ACL\\Models\\User',NULL,'digital','1376802292707',NULL,0,0,'auto_generate',0,0,0,NULL,NULL,0),(85,'Wireless Keyboard (Digital)',NULL,NULL,NULL,'published','[\"products\\/20-1.jpg\"]',NULL,'ZE-125-A1-A4',0,18,0,1,'in_stock',0,NULL,1,1,0,0,0.00,0,603.23,512.7455,NULL,NULL,10,16,16,550,NULL,0,'2025-12-26 09:38:40','2025-12-26 09:39:00',0,'Botble\\ACL\\Models\\User',NULL,'digital','5922739969623',NULL,0,0,'auto_generate',0,0,0,NULL,NULL,0),(86,'Wireless Keyboard (Digital)',NULL,NULL,NULL,'published','[\"products\\/20-1.jpg\"]',NULL,'ZE-125-A1-A5',0,18,0,1,'in_stock',0,NULL,1,1,0,0,0.00,0,603.23,446.3902,NULL,NULL,10,16,16,550,NULL,0,'2025-12-26 09:38:40','2025-12-26 09:39:00',0,'Botble\\ACL\\Models\\User',NULL,'digital','1268073540970',NULL,0,0,'auto_generate',0,0,0,NULL,NULL,0),(87,'Black Smart Watches',NULL,NULL,NULL,'published','[\"products\\/21-2.jpg\"]',NULL,'DM-119-A1',0,11,0,1,'in_stock',0,NULL,7,1,0,0,0.00,0,1944.64,NULL,NULL,NULL,14,19,14,856,NULL,0,'2025-12-26 09:38:40','2025-12-26 09:39:00',0,'Botble\\ACL\\Models\\User',NULL,'physical','6830863995007',NULL,0,0,'auto_generate',0,0,0,NULL,NULL,0),(88,'Black Smart Watches',NULL,NULL,NULL,'published','[\"products\\/21-3.jpg\"]',NULL,'DM-119-A1-A2',0,11,0,1,'in_stock',0,NULL,7,1,0,0,0.00,0,1944.64,NULL,NULL,NULL,14,19,14,856,NULL,0,'2025-12-26 09:38:40','2025-12-26 09:39:00',0,'Botble\\ACL\\Models\\User',NULL,'physical','9914679241330',NULL,0,0,'auto_generate',0,0,0,NULL,NULL,0),(89,'Black Smart Watches',NULL,NULL,NULL,'published','[\"products\\/21-4.jpg\"]',NULL,'DM-119-A1-A3',0,11,0,1,'in_stock',0,NULL,7,1,0,0,0.00,0,1944.64,NULL,NULL,NULL,14,19,14,856,NULL,0,'2025-12-26 09:38:40','2025-12-26 09:39:00',0,'Botble\\ACL\\Models\\User',NULL,'physical','9793511654114',NULL,0,0,'auto_generate',0,0,0,NULL,NULL,0),(90,'Black Smart Watches',NULL,NULL,NULL,'published','[\"products\\/21-1.jpg\"]',NULL,'DM-119-A1-A4',0,11,0,1,'in_stock',0,NULL,7,1,0,0,0.00,0,1944.64,NULL,NULL,NULL,14,19,14,856,NULL,0,'2025-12-26 09:38:40','2025-12-26 09:39:00',0,'Botble\\ACL\\Models\\User',NULL,'physical','6787168962312',NULL,0,0,'auto_generate',0,0,0,NULL,NULL,0),(91,'Headphone Ultra Bass',NULL,NULL,NULL,'published','[\"products\\/23-2.jpg\"]',NULL,'UR-130-A1',0,16,0,1,'in_stock',0,NULL,7,1,0,0,0.00,0,900.36,NULL,NULL,NULL,18,15,18,763,NULL,0,'2025-12-26 09:38:40','2025-12-26 09:39:00',0,'Botble\\ACL\\Models\\User',NULL,'physical','5599544733970',NULL,0,0,'auto_generate',0,0,0,NULL,NULL,0),(92,'Headphone Ultra Bass',NULL,NULL,NULL,'published','[\"products\\/23-3.jpg\"]',NULL,'UR-130-A1-A2',0,16,0,1,'in_stock',0,NULL,7,1,0,0,0.00,0,900.36,NULL,NULL,NULL,18,15,18,763,NULL,0,'2025-12-26 09:38:40','2025-12-26 09:39:00',0,'Botble\\ACL\\Models\\User',NULL,'physical','9246583634633',NULL,0,0,'auto_generate',0,0,0,NULL,NULL,0),(93,'Boxed - Bluetooth Headphone (Digital)',NULL,NULL,NULL,'published','[\"products\\/24-2.jpg\"]',NULL,'TC-126-A1',0,12,0,1,'in_stock',0,NULL,7,1,0,0,0.00,0,759.14,584.5378,NULL,NULL,11,11,18,506,NULL,0,'2025-12-26 09:38:40','2025-12-26 09:39:00',0,'Botble\\ACL\\Models\\User',NULL,'digital','3989889265007',NULL,0,0,'auto_generate',0,0,0,NULL,NULL,0),(94,'Boxed - Bluetooth Headphone (Digital)',NULL,NULL,NULL,'published','[\"products\\/24-3.jpg\"]',NULL,'TC-126-A1-A2',0,12,0,1,'in_stock',0,NULL,7,1,0,0,0.00,0,759.14,538.9894,NULL,NULL,11,11,18,506,NULL,0,'2025-12-26 09:38:40','2025-12-26 09:39:00',0,'Botble\\ACL\\Models\\User',NULL,'digital','2376843979949',NULL,0,0,'auto_generate',0,0,0,NULL,NULL,0),(95,'Boxed - Bluetooth Headphone (Digital)',NULL,NULL,NULL,'published','[\"products\\/24-4.jpg\"]',NULL,'TC-126-A1-A3',0,12,0,1,'in_stock',0,NULL,7,1,0,0,0.00,0,759.14,675.6346,NULL,NULL,11,11,18,506,NULL,0,'2025-12-26 09:38:41','2025-12-26 09:39:00',0,'Botble\\ACL\\Models\\User',NULL,'digital','5208574785605',NULL,0,0,'auto_generate',0,0,0,NULL,NULL,0),(96,'Boxed - Bluetooth Headphone (Digital)',NULL,NULL,NULL,'published','[\"products\\/24-1.jpg\"]',NULL,'TC-126-A1-A4',0,12,0,1,'in_stock',0,NULL,7,1,0,0,0.00,0,759.14,645.269,NULL,NULL,11,11,18,506,NULL,0,'2025-12-26 09:38:41','2025-12-26 09:39:00',0,'Botble\\ACL\\Models\\User',NULL,'digital','1899808404672',NULL,0,0,'auto_generate',0,0,0,NULL,NULL,0),(97,'Camera Samsung SS-24',NULL,NULL,NULL,'published','[\"products\\/25-2.jpg\"]',NULL,'BU-196-A1',0,19,0,1,'in_stock',0,NULL,7,1,0,0,0.00,0,674.04,NULL,NULL,NULL,10,15,13,863,NULL,0,'2025-12-26 09:38:41','2025-12-26 09:39:00',0,'Botble\\ACL\\Models\\User',NULL,'physical','6660301820383',NULL,0,0,'auto_generate',0,0,0,NULL,NULL,0),(98,'Camera Samsung SS-24',NULL,NULL,NULL,'published','[\"products\\/25-3.jpg\"]',NULL,'BU-196-A1-A2',0,19,0,1,'in_stock',0,NULL,7,1,0,0,0.00,0,674.04,NULL,NULL,NULL,10,15,13,863,NULL,0,'2025-12-26 09:38:41','2025-12-26 09:39:00',0,'Botble\\ACL\\Models\\User',NULL,'physical','4129997355866',NULL,0,0,'auto_generate',0,0,0,NULL,NULL,0),(99,'Leather Watch In Black',NULL,NULL,NULL,'published','[\"products\\/26-2.jpg\"]',NULL,'JV-193-A1',0,12,0,1,'in_stock',0,NULL,7,1,0,0,0.00,0,471.27,NULL,NULL,NULL,16,16,11,866,NULL,0,'2025-12-26 09:38:41','2025-12-26 09:39:00',0,'Botble\\ACL\\Models\\User',NULL,'physical','3211419354203',NULL,0,0,'auto_generate',0,0,0,NULL,NULL,0),(100,'Leather Watch In Black',NULL,NULL,NULL,'published','[\"products\\/26-3.jpg\"]',NULL,'JV-193-A1-A2',0,12,0,1,'in_stock',0,NULL,7,1,0,0,0.00,0,471.27,NULL,NULL,NULL,16,16,11,866,NULL,0,'2025-12-26 09:38:41','2025-12-26 09:39:00',0,'Botble\\ACL\\Models\\User',NULL,'physical','2301851714015',NULL,0,0,'auto_generate',0,0,0,NULL,NULL,0),(101,'Leather Watch In Black',NULL,NULL,NULL,'published','[\"products\\/26-4.jpg\"]',NULL,'JV-193-A1-A3',0,12,0,1,'in_stock',0,NULL,7,1,0,0,0.00,0,471.27,NULL,NULL,NULL,16,16,11,866,NULL,0,'2025-12-26 09:38:41','2025-12-26 09:39:00',0,'Botble\\ACL\\Models\\User',NULL,'physical','3442821831581',NULL,0,0,'auto_generate',0,0,0,NULL,NULL,0),(102,'Leather Watch In Black',NULL,NULL,NULL,'published','[\"products\\/26-1.jpg\"]',NULL,'JV-193-A1-A4',0,12,0,1,'in_stock',0,NULL,7,1,0,0,0.00,0,471.27,NULL,NULL,NULL,16,16,11,866,NULL,0,'2025-12-26 09:38:41','2025-12-26 09:39:00',0,'Botble\\ACL\\Models\\User',NULL,'physical','2241676213112',NULL,0,0,'auto_generate',0,0,0,NULL,NULL,0),(103,'Apple iPhone 13 Plus',NULL,NULL,NULL,'published','[\"products\\/27-2.jpg\"]',NULL,'DL-135-A1',0,19,0,1,'in_stock',0,NULL,4,1,0,0,0.00,0,948.45,NULL,NULL,NULL,18,17,18,793,NULL,0,'2025-12-26 09:38:41','2025-12-26 09:39:00',0,'Botble\\ACL\\Models\\User',NULL,'physical','3243600815934',NULL,0,0,'auto_generate',0,0,0,NULL,NULL,0),(104,'Apple iPhone 13 Plus',NULL,NULL,NULL,'published','[\"products\\/27-3.jpg\"]',NULL,'DL-135-A1-A2',0,19,0,1,'in_stock',0,NULL,4,1,0,0,0.00,0,948.45,NULL,NULL,NULL,18,17,18,793,NULL,0,'2025-12-26 09:38:41','2025-12-26 09:39:00',0,'Botble\\ACL\\Models\\User',NULL,'physical','9174353459844',NULL,0,0,'auto_generate',0,0,0,NULL,NULL,0),(105,'Apple iPhone 13 Plus',NULL,NULL,NULL,'published','[\"products\\/27-4.jpg\"]',NULL,'DL-135-A1-A3',0,19,0,1,'in_stock',0,NULL,4,1,0,0,0.00,0,948.45,NULL,NULL,NULL,18,17,18,793,NULL,0,'2025-12-26 09:38:41','2025-12-26 09:39:00',0,'Botble\\ACL\\Models\\User',NULL,'physical','2896484906697',NULL,0,0,'auto_generate',0,0,0,NULL,NULL,0),(106,'Apple Keyboard',NULL,NULL,NULL,'published','[\"products\\/31-2.jpg\"]',NULL,'8T-128-A1',0,11,0,1,'in_stock',0,NULL,7,1,0,0,0.00,0,193.52,NULL,NULL,NULL,20,12,18,815,NULL,0,'2025-12-26 09:38:41','2025-12-26 09:39:00',0,'Botble\\ACL\\Models\\User',NULL,'physical','0448061535077',NULL,0,0,'auto_generate',0,0,0,NULL,NULL,0),(107,'Apple Keyboard',NULL,NULL,NULL,'published','[\"products\\/31-3.jpg\"]',NULL,'8T-128-A1-A2',0,11,0,1,'in_stock',0,NULL,7,1,0,0,0.00,0,193.52,NULL,NULL,NULL,20,12,18,815,NULL,0,'2025-12-26 09:38:41','2025-12-26 09:39:00',0,'Botble\\ACL\\Models\\User',NULL,'physical','5538736243750',NULL,0,0,'auto_generate',0,0,0,NULL,NULL,0),(108,'Apple Keyboard',NULL,NULL,NULL,'published','[\"products\\/31-4.jpg\"]',NULL,'8T-128-A1-A3',0,11,0,1,'in_stock',0,NULL,7,1,0,0,0.00,0,193.52,NULL,NULL,NULL,20,12,18,815,NULL,0,'2025-12-26 09:38:41','2025-12-26 09:39:00',0,'Botble\\ACL\\Models\\User',NULL,'physical','4034167407545',NULL,0,0,'auto_generate',0,0,0,NULL,NULL,0),(109,'MacSafe 80W (Digital)',NULL,NULL,NULL,'published','[\"products\\/32-2.jpg\"]',NULL,'E3-108-A1',0,10,0,1,'in_stock',0,NULL,4,1,0,0,0.00,0,1595.01,1244.1078,NULL,NULL,19,13,14,784,NULL,0,'2025-12-26 09:38:41','2025-12-26 09:39:00',0,'Botble\\ACL\\Models\\User',NULL,'digital','7520978084565',NULL,0,0,'auto_generate',0,0,0,NULL,NULL,0),(110,'MacSafe 80W (Digital)',NULL,NULL,NULL,'published','[\"products\\/32-3.jpg\"]',NULL,'E3-108-A1-A2',0,10,0,1,'in_stock',0,NULL,4,1,0,0,0.00,0,1595.01,1116.507,NULL,NULL,19,13,14,784,NULL,0,'2025-12-26 09:38:41','2025-12-26 09:39:00',0,'Botble\\ACL\\Models\\User',NULL,'digital','4336510329963',NULL,0,0,'auto_generate',0,0,0,NULL,NULL,0),(111,'MacSafe 80W (Digital)',NULL,NULL,NULL,'published','[\"products\\/32-4.jpg\"]',NULL,'E3-108-A1-A3',0,10,0,1,'in_stock',0,NULL,4,1,0,0,0.00,0,1595.01,1339.8084,NULL,NULL,19,13,14,784,NULL,0,'2025-12-26 09:38:41','2025-12-26 09:39:00',0,'Botble\\ACL\\Models\\User',NULL,'digital','5594615075126',NULL,0,0,'auto_generate',0,0,0,NULL,NULL,0),(112,'MacSafe 80W (Digital)',NULL,NULL,NULL,'published','[\"products\\/32-1.jpg\"]',NULL,'E3-108-A1-A4',0,10,0,1,'in_stock',0,NULL,4,1,0,0,0.00,0,1595.01,1371.7086,NULL,NULL,19,13,14,784,NULL,0,'2025-12-26 09:38:41','2025-12-26 09:39:00',0,'Botble\\ACL\\Models\\User',NULL,'digital','4582836737887',NULL,0,0,'auto_generate',0,0,0,NULL,NULL,0),(113,'Apple Airpods Serial 3',NULL,NULL,NULL,'published','[\"products\\/34-2.jpg\"]',NULL,'4B-118-A1',0,14,0,1,'in_stock',0,NULL,2,1,0,0,0.00,0,1150.59,NULL,NULL,NULL,17,16,10,829,NULL,0,'2025-12-26 09:38:41','2025-12-26 09:39:01',0,'Botble\\ACL\\Models\\User',NULL,'physical','0242959057968',NULL,0,0,'auto_generate',0,0,0,NULL,NULL,0),(114,'Apple Airpods Serial 3',NULL,NULL,NULL,'published','[\"products\\/34-3.jpg\"]',NULL,'4B-118-A1-A2',0,14,0,1,'in_stock',0,NULL,2,1,0,0,0.00,0,1150.59,NULL,NULL,NULL,17,16,10,829,NULL,0,'2025-12-26 09:38:41','2025-12-26 09:39:01',0,'Botble\\ACL\\Models\\User',NULL,'physical','9483465745265',NULL,0,0,'auto_generate',0,0,0,NULL,NULL,0),(115,'Apple Airpods Serial 3',NULL,NULL,NULL,'published','[\"products\\/34-4.jpg\"]',NULL,'4B-118-A1-A3',0,14,0,1,'in_stock',0,NULL,2,1,0,0,0.00,0,1150.59,NULL,NULL,NULL,17,16,10,829,NULL,0,'2025-12-26 09:38:41','2025-12-26 09:39:01',0,'Botble\\ACL\\Models\\User',NULL,'physical','4746349216820',NULL,0,0,'auto_generate',0,0,0,NULL,NULL,0),(116,'Cool Smart Watches',NULL,NULL,NULL,'published','[\"products\\/35-2.jpg\"]',NULL,'CK-160-A1',0,10,0,1,'in_stock',0,NULL,6,1,0,0,0.00,0,252.08,NULL,NULL,NULL,18,10,18,501,NULL,0,'2025-12-26 09:38:41','2025-12-26 09:39:01',0,'Botble\\ACL\\Models\\User',NULL,'physical','3062215126972',NULL,0,0,'auto_generate',0,0,0,NULL,NULL,0),(117,'Cool Smart Watches',NULL,NULL,NULL,'published','[\"products\\/35-3.jpg\"]',NULL,'CK-160-A1-A2',0,10,0,1,'in_stock',0,NULL,6,1,0,0,0.00,0,252.08,NULL,NULL,NULL,18,10,18,501,NULL,0,'2025-12-26 09:38:41','2025-12-26 09:39:01',0,'Botble\\ACL\\Models\\User',NULL,'physical','8300688228812',NULL,0,0,'auto_generate',0,0,0,NULL,NULL,0),(118,'Cool Smart Watches',NULL,NULL,NULL,'published','[\"products\\/35-4.jpg\"]',NULL,'CK-160-A1-A3',0,10,0,1,'in_stock',0,NULL,6,1,0,0,0.00,0,252.08,NULL,NULL,NULL,18,10,18,501,NULL,0,'2025-12-26 09:38:42','2025-12-26 09:39:01',0,'Botble\\ACL\\Models\\User',NULL,'physical','2462523975766',NULL,0,0,'auto_generate',0,0,0,NULL,NULL,0),(119,'Leather Watch In Black',NULL,NULL,NULL,'published','[\"products\\/37-2.jpg\"]',NULL,'YB-118-A1',0,13,0,1,'in_stock',0,NULL,7,1,0,0,0.00,0,452.15,NULL,NULL,NULL,17,19,10,714,NULL,0,'2025-12-26 09:38:42','2025-12-26 09:39:01',0,'Botble\\ACL\\Models\\User',NULL,'physical','2731022044090',NULL,0,0,'auto_generate',0,0,0,NULL,NULL,0),(120,'Leather Watch In Black',NULL,NULL,NULL,'published','[\"products\\/37-3.jpg\"]',NULL,'YB-118-A1-A2',0,13,0,1,'in_stock',0,NULL,7,1,0,0,0.00,0,452.15,NULL,NULL,NULL,17,19,10,714,NULL,0,'2025-12-26 09:38:42','2025-12-26 09:39:01',0,'Botble\\ACL\\Models\\User',NULL,'physical','5684517588340',NULL,0,0,'auto_generate',0,0,0,NULL,NULL,0),(121,'Sony WH-1000XM4 Wireless Headphones',NULL,NULL,NULL,'published','[\"products\\/39-2.jpg\"]',NULL,'P7-102-A1',0,18,0,1,'in_stock',0,NULL,2,1,0,0,0.00,0,893.38,NULL,NULL,NULL,15,10,20,504,NULL,0,'2025-12-26 09:38:42','2025-12-26 09:39:01',0,'Botble\\ACL\\Models\\User',NULL,'physical','7713446544931',NULL,0,0,'auto_generate',0,0,0,NULL,NULL,0),(122,'Samsung Galaxy S22 Ultra (Digital)',NULL,NULL,NULL,'published','[\"products\\/40-2.jpg\"]',NULL,'7H-109-A1',0,12,0,1,'in_stock',0,NULL,7,1,0,0,0.00,0,1716.1,1493.007,NULL,NULL,18,13,20,600,NULL,0,'2025-12-26 09:38:42','2025-12-26 09:39:01',0,'Botble\\ACL\\Models\\User',NULL,'digital','4672113165219',NULL,0,0,'auto_generate',0,0,0,NULL,NULL,0),(123,'iPad Pro 12.9-inch',NULL,NULL,NULL,'published','[\"products\\/42-2.jpg\"]',NULL,'BQ-196-A1',0,11,0,1,'in_stock',0,NULL,5,1,0,0,0.00,0,1191.66,NULL,NULL,NULL,14,15,16,641,NULL,0,'2025-12-26 09:38:42','2025-12-26 09:39:01',0,'Botble\\ACL\\Models\\User',NULL,'physical','9954491250141',NULL,0,0,'auto_generate',0,0,0,NULL,NULL,0),(124,'iPad Pro 12.9-inch',NULL,NULL,NULL,'published','[\"products\\/42-3.jpg\"]',NULL,'BQ-196-A1-A2',0,11,0,1,'in_stock',0,NULL,5,1,0,0,0.00,0,1191.66,NULL,NULL,NULL,14,15,16,641,NULL,0,'2025-12-26 09:38:42','2025-12-26 09:39:01',0,'Botble\\ACL\\Models\\User',NULL,'physical','0774059260899',NULL,0,0,'auto_generate',0,0,0,NULL,NULL,0),(125,'iPad Pro 12.9-inch',NULL,NULL,NULL,'published','[\"products\\/42-1.jpg\"]',NULL,'BQ-196-A1-A3',0,11,0,1,'in_stock',0,NULL,5,1,0,0,0.00,0,1191.66,NULL,NULL,NULL,14,15,16,641,NULL,0,'2025-12-26 09:38:42','2025-12-26 09:39:01',0,'Botble\\ACL\\Models\\User',NULL,'physical','5430035968481',NULL,0,0,'auto_generate',0,0,0,NULL,NULL,0),(126,'Bose QuietComfort Earbuds',NULL,NULL,NULL,'published','[\"products\\/43-2.jpg\"]',NULL,'0V-183-A1',0,13,0,1,'in_stock',0,NULL,2,1,0,0,0.00,0,469.16,NULL,NULL,NULL,12,20,20,763,NULL,0,'2025-12-26 09:38:42','2025-12-26 09:39:01',0,'Botble\\ACL\\Models\\User',NULL,'physical','7799658707654',NULL,0,0,'auto_generate',0,0,0,NULL,NULL,0),(127,'Bose QuietComfort Earbuds',NULL,NULL,NULL,'published','[\"products\\/43-3.jpg\"]',NULL,'0V-183-A1-A2',0,13,0,1,'in_stock',0,NULL,2,1,0,0,0.00,0,469.16,NULL,NULL,NULL,12,20,20,763,NULL,0,'2025-12-26 09:38:42','2025-12-26 09:39:01',0,'Botble\\ACL\\Models\\User',NULL,'physical','9063612479801',NULL,0,0,'auto_generate',0,0,0,NULL,NULL,0),(128,'LG OLED C1 Series TV (Digital)',NULL,NULL,NULL,'published','[\"products\\/44-2.jpg\"]',NULL,'6A-145-A1',0,19,0,1,'in_stock',0,NULL,2,1,0,0,0.00,0,1905.2,1676.576,NULL,NULL,15,18,14,703,NULL,0,'2025-12-26 09:38:42','2025-12-26 09:39:01',0,'Botble\\ACL\\Models\\User',NULL,'digital','6068438045660',NULL,0,0,'auto_generate',0,0,0,NULL,NULL,0),(129,'LG OLED C1 Series TV (Digital)',NULL,NULL,NULL,'published','[\"products\\/44-3.jpg\"]',NULL,'6A-145-A1-A2',0,19,0,1,'in_stock',0,NULL,2,1,0,0,0.00,0,1905.2,1714.68,NULL,NULL,15,18,14,703,NULL,0,'2025-12-26 09:38:42','2025-12-26 09:39:01',0,'Botble\\ACL\\Models\\User',NULL,'digital','6774903094483',NULL,0,0,'auto_generate',0,0,0,NULL,NULL,0),(130,'LG OLED C1 Series TV (Digital)',NULL,NULL,NULL,'published','[\"products\\/44-1.jpg\"]',NULL,'6A-145-A1-A3',0,19,0,1,'in_stock',0,NULL,2,1,0,0,0.00,0,1905.2,1562.264,NULL,NULL,15,18,14,703,NULL,0,'2025-12-26 09:38:42','2025-12-26 09:39:01',0,'Botble\\ACL\\Models\\User',NULL,'digital','7831104873770',NULL,0,0,'auto_generate',0,0,0,NULL,NULL,0),(131,'LG OLED C1 Series TV (Digital)',NULL,NULL,NULL,'published','[\"products\\/44-1.jpg\"]',NULL,'6A-145-A1-A4',0,19,0,1,'in_stock',0,NULL,2,1,0,0,0.00,0,1905.2,1390.796,NULL,NULL,15,18,14,703,NULL,0,'2025-12-26 09:38:42','2025-12-26 09:39:01',0,'Botble\\ACL\\Models\\User',NULL,'digital','3261754170877',NULL,0,0,'auto_generate',0,0,0,NULL,NULL,0),(132,'Nintendo Switch OLED Model',NULL,NULL,NULL,'published','[\"products\\/46-2.jpg\"]',NULL,'YB-121-A1',0,15,0,1,'in_stock',0,NULL,4,1,0,0,0.00,0,1732.12,NULL,NULL,NULL,17,20,18,582,NULL,0,'2025-12-26 09:38:42','2025-12-26 09:39:01',0,'Botble\\ACL\\Models\\User',NULL,'physical','9601103351504',NULL,0,0,'auto_generate',0,0,0,NULL,NULL,0),(133,'Nintendo Switch OLED Model',NULL,NULL,NULL,'published','[\"products\\/46-3.jpg\"]',NULL,'YB-121-A1-A2',0,15,0,1,'in_stock',0,NULL,4,1,0,0,0.00,0,1732.12,NULL,NULL,NULL,17,20,18,582,NULL,0,'2025-12-26 09:38:43','2025-12-26 09:39:01',0,'Botble\\ACL\\Models\\User',NULL,'physical','3579756402804',NULL,0,0,'auto_generate',0,0,0,NULL,NULL,0),(134,'Nintendo Switch OLED Model',NULL,NULL,NULL,'published','[\"products\\/46-4.jpg\"]',NULL,'YB-121-A1-A3',0,15,0,1,'in_stock',0,NULL,4,1,0,0,0.00,0,1732.12,NULL,NULL,NULL,17,20,18,582,NULL,0,'2025-12-26 09:38:43','2025-12-26 09:39:01',0,'Botble\\ACL\\Models\\User',NULL,'physical','2524978430389',NULL,0,0,'auto_generate',0,0,0,NULL,NULL,0),(135,'GoPro HERO10 Black (Digital)',NULL,NULL,NULL,'published','[\"products\\/52-2.jpg\"]',NULL,'CO-195-A1',0,19,0,1,'in_stock',0,NULL,7,1,0,0,0.00,0,113.81,88.7718,NULL,NULL,18,11,11,678,NULL,0,'2025-12-26 09:38:43','2025-12-26 09:39:01',0,'Botble\\ACL\\Models\\User',NULL,'digital','2471335229042',NULL,0,0,'auto_generate',0,0,0,NULL,NULL,0),(136,'GoPro HERO10 Black (Digital)',NULL,NULL,NULL,'published','[\"products\\/52-3.jpg\"]',NULL,'CO-195-A1-A2',0,19,0,1,'in_stock',0,NULL,7,1,0,0,0.00,0,113.81,84.2194,NULL,NULL,18,11,11,678,NULL,0,'2025-12-26 09:38:43','2025-12-26 09:39:01',0,'Botble\\ACL\\Models\\User',NULL,'digital','1979868264024',NULL,0,0,'auto_generate',0,0,0,NULL,NULL,0),(137,'GoPro HERO10 Black (Digital)',NULL,NULL,NULL,'published','[\"products\\/52-1.jpg\"]',NULL,'CO-195-A1-A3',0,19,0,1,'in_stock',0,NULL,7,1,0,0,0.00,0,113.81,100.1528,NULL,NULL,18,11,11,678,NULL,0,'2025-12-26 09:38:43','2025-12-26 09:39:01',0,'Botble\\ACL\\Models\\User',NULL,'digital','7336763933587',NULL,0,0,'auto_generate',0,0,0,NULL,NULL,0);
/*!40000 ALTER TABLE `ec_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_products_translations`
--

DROP TABLE IF EXISTS `ec_products_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_products_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_products_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `content` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`ec_products_id`),
  KEY `idx_products_fk` (`ec_products_id`),
  KEY `idx_products_products_lang` (`ec_products_id`,`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_products_translations`
--

LOCK TABLES `ec_products_translations` WRITE;
/*!40000 ALTER TABLE `ec_products_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_products_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_review_replies`
--

DROP TABLE IF EXISTS `ec_review_replies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_review_replies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `review_id` bigint unsigned NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_review_replies_review_id_user_id_unique` (`review_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_review_replies`
--

LOCK TABLES `ec_review_replies` WRITE;
/*!40000 ALTER TABLE `ec_review_replies` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_review_replies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_reviews`
--

DROP TABLE IF EXISTS `ec_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_reviews` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` bigint unsigned DEFAULT NULL,
  `customer_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` bigint unsigned NOT NULL,
  `star` double NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `images` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_reviews_product_id_customer_id_unique` (`product_id`,`customer_id`),
  KEY `ec_reviews_product_id_customer_id_status_created_at_index` (`product_id`,`customer_id`,`status`,`created_at`),
  KEY `review_relation_index` (`product_id`,`customer_id`,`status`),
  KEY `ec_reviews_product_id_status_index` (`product_id`,`status`),
  KEY `ec_reviews_customer_id_status_index` (`customer_id`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=523 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_reviews`
--

LOCK TABLES `ec_reviews` WRITE;
/*!40000 ALTER TABLE `ec_reviews` DISABLE KEYS */;
INSERT INTO `ec_reviews` VALUES (1,7,NULL,NULL,46,1,'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(2,5,NULL,NULL,33,2,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(3,1,NULL,NULL,10,5,'The code is good, in general, if you like it, can you give it 5 stars?','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(4,2,NULL,NULL,52,5,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(5,5,NULL,NULL,2,1,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(6,1,NULL,NULL,2,5,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(7,4,NULL,NULL,45,4,'Great E-commerce system. And much more : Wonderful Customer Support.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(8,7,NULL,NULL,31,1,'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(9,6,NULL,NULL,21,2,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(10,4,NULL,NULL,15,4,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(11,4,NULL,NULL,13,2,'Best ecommerce CMS online store!','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(12,4,NULL,NULL,16,2,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(13,6,NULL,NULL,31,2,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(14,3,NULL,NULL,29,4,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(15,2,NULL,NULL,50,4,'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(16,8,NULL,NULL,31,2,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(17,2,NULL,NULL,21,3,'The best store template! Excellent coding! Very good support! Thank you so much for all the help, I really appreciated.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(18,4,NULL,NULL,8,3,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(19,5,NULL,NULL,31,4,'The code is good, in general, if you like it, can you give it 5 stars?','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(20,7,NULL,NULL,14,1,'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(21,7,NULL,NULL,19,3,'Good app, good backup service and support. Good documentation.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(22,2,NULL,NULL,1,1,'Clean & perfect source code','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(23,8,NULL,NULL,43,3,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(24,2,NULL,NULL,42,4,'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(25,2,NULL,NULL,29,4,'Great E-commerce system. And much more : Wonderful Customer Support.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(26,10,NULL,NULL,38,3,'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot BOTBLE Teams','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(27,3,NULL,NULL,22,4,'Good app, good backup service and support. Good documentation.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(28,1,NULL,NULL,30,3,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(29,9,NULL,NULL,29,5,'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(30,5,NULL,NULL,18,4,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(31,3,NULL,NULL,39,2,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(32,4,NULL,NULL,9,1,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(33,5,NULL,NULL,46,1,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(34,8,NULL,NULL,23,2,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(35,8,NULL,NULL,7,3,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(36,1,NULL,NULL,38,4,'The code is good, in general, if you like it, can you give it 5 stars?','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(37,2,NULL,NULL,35,5,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(38,7,NULL,NULL,18,4,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(39,3,NULL,NULL,32,2,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(40,7,NULL,NULL,4,2,'Good app, good backup service and support. Good documentation.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(41,9,NULL,NULL,26,2,'The code is good, in general, if you like it, can you give it 5 stars?','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(42,5,NULL,NULL,41,5,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(43,4,NULL,NULL,50,1,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(44,10,NULL,NULL,32,4,'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(45,2,NULL,NULL,31,5,'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(46,3,NULL,NULL,52,3,'Best ecommerce CMS online store!','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(47,5,NULL,NULL,34,3,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(48,10,NULL,NULL,33,1,'Clean & perfect source code','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(49,9,NULL,NULL,53,4,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(50,2,NULL,NULL,17,1,'Good app, good backup service and support. Good documentation.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(51,10,NULL,NULL,15,4,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(52,7,NULL,NULL,43,1,'Best ecommerce CMS online store!','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(53,9,NULL,NULL,13,5,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(54,3,NULL,NULL,30,1,'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot BOTBLE Teams','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(55,8,NULL,NULL,34,2,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(56,3,NULL,NULL,19,3,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(57,8,NULL,NULL,30,5,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(58,6,NULL,NULL,40,4,'Clean & perfect source code','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(59,1,NULL,NULL,46,1,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(60,4,NULL,NULL,34,4,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(61,1,NULL,NULL,14,2,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(62,1,NULL,NULL,18,1,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(63,7,NULL,NULL,3,2,'Great E-commerce system. And much more : Wonderful Customer Support.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(64,3,NULL,NULL,34,4,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(65,6,NULL,NULL,32,3,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(66,4,NULL,NULL,52,5,'Good app, good backup service and support. Good documentation.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(67,5,NULL,NULL,29,1,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(68,8,NULL,NULL,44,3,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(69,1,NULL,NULL,13,1,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(70,4,NULL,NULL,40,4,'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(71,10,NULL,NULL,17,2,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(72,8,NULL,NULL,19,2,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(73,10,NULL,NULL,37,4,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(74,6,NULL,NULL,4,5,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(75,9,NULL,NULL,45,5,'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot BOTBLE Teams','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(76,8,NULL,NULL,45,2,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(77,7,NULL,NULL,36,2,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(78,9,NULL,NULL,20,5,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(79,8,NULL,NULL,29,4,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(80,8,NULL,NULL,42,4,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(81,9,NULL,NULL,30,5,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(82,3,NULL,NULL,7,3,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(83,9,NULL,NULL,8,3,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(84,7,NULL,NULL,27,4,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(85,7,NULL,NULL,47,2,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(86,3,NULL,NULL,47,1,'Clean & perfect source code','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(87,6,NULL,NULL,20,1,'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(88,4,NULL,NULL,29,3,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(89,2,NULL,NULL,14,5,'Best ecommerce CMS online store!','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(90,5,NULL,NULL,3,5,'Great E-commerce system. And much more : Wonderful Customer Support.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(91,10,NULL,NULL,45,1,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(92,2,NULL,NULL,23,2,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(93,2,NULL,NULL,3,1,'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(94,9,NULL,NULL,48,2,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(95,5,NULL,NULL,47,2,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(96,9,NULL,NULL,18,4,'The best store template! Excellent coding! Very good support! Thank you so much for all the help, I really appreciated.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(97,6,NULL,NULL,18,5,'The best store template! Excellent coding! Very good support! Thank you so much for all the help, I really appreciated.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(98,8,NULL,NULL,16,1,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(99,5,NULL,NULL,24,4,'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(100,9,NULL,NULL,6,2,'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(101,5,NULL,NULL,50,3,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(102,3,NULL,NULL,3,3,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(103,5,NULL,NULL,8,2,'The code is good, in general, if you like it, can you give it 5 stars?','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(104,5,NULL,NULL,21,3,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(105,10,NULL,NULL,48,4,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(106,5,NULL,NULL,19,1,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(107,4,NULL,NULL,46,2,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(108,3,NULL,NULL,40,2,'Best ecommerce CMS online store!','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(109,3,NULL,NULL,36,2,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(110,8,NULL,NULL,22,3,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(111,7,NULL,NULL,45,2,'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(112,5,NULL,NULL,48,4,'Best ecommerce CMS online store!','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(113,9,NULL,NULL,35,5,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(114,1,NULL,NULL,31,4,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(115,1,NULL,NULL,5,1,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(116,2,NULL,NULL,53,4,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(117,4,NULL,NULL,25,1,'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(118,10,NULL,NULL,53,3,'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot BOTBLE Teams','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(119,2,NULL,NULL,32,2,'Great E-commerce system. And much more : Wonderful Customer Support.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(120,9,NULL,NULL,44,2,'Great E-commerce system. And much more : Wonderful Customer Support.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(121,4,NULL,NULL,26,1,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(122,6,NULL,NULL,46,1,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(123,4,NULL,NULL,7,3,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(124,3,NULL,NULL,38,4,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(125,2,NULL,NULL,28,2,'Clean & perfect source code','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(126,7,NULL,NULL,33,4,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(127,3,NULL,NULL,50,2,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(128,2,NULL,NULL,40,1,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(129,10,NULL,NULL,42,1,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(130,3,NULL,NULL,26,4,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(131,10,NULL,NULL,19,4,'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(132,9,NULL,NULL,16,1,'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(133,4,NULL,NULL,53,4,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(134,7,NULL,NULL,50,3,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(135,4,NULL,NULL,23,3,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(136,2,NULL,NULL,48,4,'The code is good, in general, if you like it, can you give it 5 stars?','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(137,1,NULL,NULL,33,2,'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot BOTBLE Teams','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(138,9,NULL,NULL,47,2,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(139,4,NULL,NULL,33,3,'Good app, good backup service and support. Good documentation.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(140,4,NULL,NULL,32,5,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(141,3,NULL,NULL,44,2,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(142,4,NULL,NULL,24,2,'Best ecommerce CMS online store!','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(143,4,NULL,NULL,31,3,'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(144,1,NULL,NULL,29,3,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(145,4,NULL,NULL,47,2,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(146,4,NULL,NULL,2,3,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(147,1,NULL,NULL,6,5,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(148,7,NULL,NULL,52,4,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(149,1,NULL,NULL,45,2,'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(150,10,NULL,NULL,29,3,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(151,1,NULL,NULL,39,1,'The code is good, in general, if you like it, can you give it 5 stars?','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(152,3,NULL,NULL,10,4,'The best store template! Excellent coding! Very good support! Thank you so much for all the help, I really appreciated.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(153,9,NULL,NULL,49,4,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(154,4,NULL,NULL,20,4,'Great E-commerce system. And much more : Wonderful Customer Support.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(155,3,NULL,NULL,5,1,'Great E-commerce system. And much more : Wonderful Customer Support.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(156,8,NULL,NULL,46,4,'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(157,10,NULL,NULL,1,2,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(158,1,NULL,NULL,3,5,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(159,9,NULL,NULL,42,3,'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot BOTBLE Teams','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(160,7,NULL,NULL,22,2,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(161,3,NULL,NULL,23,2,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(162,6,NULL,NULL,39,1,'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(163,2,NULL,NULL,43,4,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(164,5,NULL,NULL,30,1,'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot BOTBLE Teams','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(165,6,NULL,NULL,25,5,'The code is good, in general, if you like it, can you give it 5 stars?','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(166,10,NULL,NULL,24,1,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(167,10,NULL,NULL,35,4,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(168,9,NULL,NULL,4,3,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(169,3,NULL,NULL,17,2,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(170,6,NULL,NULL,2,2,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(171,1,NULL,NULL,41,3,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(172,10,NULL,NULL,11,1,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(173,3,NULL,NULL,42,5,'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(174,3,NULL,NULL,54,2,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(175,4,NULL,NULL,18,5,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(176,6,NULL,NULL,17,5,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(177,9,NULL,NULL,9,5,'Best ecommerce CMS online store!','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(178,10,NULL,NULL,28,4,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(179,8,NULL,NULL,13,2,'Great E-commerce system. And much more : Wonderful Customer Support.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(180,3,NULL,NULL,8,2,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(181,4,NULL,NULL,28,1,'Great E-commerce system. And much more : Wonderful Customer Support.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(182,6,NULL,NULL,29,4,'The best store template! Excellent coding! Very good support! Thank you so much for all the help, I really appreciated.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(183,1,NULL,NULL,8,3,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(184,7,NULL,NULL,54,5,'Good app, good backup service and support. Good documentation.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(185,10,NULL,NULL,12,3,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(186,8,NULL,NULL,35,4,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(187,10,NULL,NULL,27,1,'Best ecommerce CMS online store!','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(188,3,NULL,NULL,45,4,'Great E-commerce system. And much more : Wonderful Customer Support.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(189,8,NULL,NULL,54,4,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(190,6,NULL,NULL,36,5,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(191,10,NULL,NULL,46,5,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(192,6,NULL,NULL,35,1,'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(193,7,NULL,NULL,24,2,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(194,1,NULL,NULL,53,2,'The code is good, in general, if you like it, can you give it 5 stars?','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(195,7,NULL,NULL,51,4,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(196,4,NULL,NULL,1,2,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(197,7,NULL,NULL,42,2,'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(198,5,NULL,NULL,36,1,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(199,5,NULL,NULL,53,1,'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(200,2,NULL,NULL,8,2,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(201,9,NULL,NULL,24,5,'Clean & perfect source code','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(202,4,NULL,NULL,22,2,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(203,10,NULL,NULL,41,4,'Good app, good backup service and support. Good documentation.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(204,5,NULL,NULL,10,1,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(205,8,NULL,NULL,50,1,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(206,5,NULL,NULL,15,1,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(207,9,NULL,NULL,37,5,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(208,3,NULL,NULL,37,3,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(209,8,NULL,NULL,4,4,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(210,10,NULL,NULL,43,1,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(211,10,NULL,NULL,4,3,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(212,8,NULL,NULL,14,1,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(213,10,NULL,NULL,13,3,'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(214,9,NULL,NULL,46,2,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(215,5,NULL,NULL,5,4,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(216,10,NULL,NULL,54,3,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(217,9,NULL,NULL,40,5,'Best ecommerce CMS online store!','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(218,5,NULL,NULL,12,3,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(219,4,NULL,NULL,51,2,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(220,10,NULL,NULL,14,2,'The best store template! Excellent coding! Very good support! Thank you so much for all the help, I really appreciated.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(221,2,NULL,NULL,11,2,'The code is good, in general, if you like it, can you give it 5 stars?','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(222,6,NULL,NULL,7,1,'Good app, good backup service and support. Good documentation.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(223,6,NULL,NULL,23,4,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(224,9,NULL,NULL,43,5,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(225,9,NULL,NULL,14,1,'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(226,6,NULL,NULL,33,4,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(227,2,NULL,NULL,24,3,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(228,7,NULL,NULL,32,1,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(229,3,NULL,NULL,46,4,'Best ecommerce CMS online store!','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(230,6,NULL,NULL,28,1,'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(231,6,NULL,NULL,13,3,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(232,7,NULL,NULL,15,1,'Great E-commerce system. And much more : Wonderful Customer Support.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(233,9,NULL,NULL,10,2,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(234,6,NULL,NULL,53,4,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(235,3,NULL,NULL,48,4,'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(236,7,NULL,NULL,38,2,'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot BOTBLE Teams','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(237,9,NULL,NULL,5,2,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(238,6,NULL,NULL,22,4,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(239,8,NULL,NULL,39,3,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(240,4,NULL,NULL,37,5,'Good app, good backup service and support. Good documentation.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(241,7,NULL,NULL,49,5,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(242,10,NULL,NULL,52,1,'Good app, good backup service and support. Good documentation.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(243,6,NULL,NULL,48,2,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(244,4,NULL,NULL,43,4,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(245,5,NULL,NULL,28,5,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(246,1,NULL,NULL,28,3,'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot BOTBLE Teams','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(247,5,NULL,NULL,39,3,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(248,5,NULL,NULL,9,3,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(249,6,NULL,NULL,52,1,'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(250,8,NULL,NULL,48,1,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(251,10,NULL,NULL,9,2,'Clean & perfect source code','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(252,1,NULL,NULL,44,3,'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(253,9,NULL,NULL,19,5,'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot BOTBLE Teams','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(254,1,NULL,NULL,26,3,'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot BOTBLE Teams','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(255,8,NULL,NULL,8,2,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(256,8,NULL,NULL,24,5,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(257,5,NULL,NULL,49,1,'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(258,9,NULL,NULL,21,5,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(259,5,NULL,NULL,32,5,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(260,10,NULL,NULL,23,1,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(261,8,NULL,NULL,11,2,'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(262,2,NULL,NULL,34,2,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(263,3,NULL,NULL,24,4,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(264,7,NULL,NULL,16,1,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(265,10,NULL,NULL,31,3,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(266,6,NULL,NULL,43,1,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(267,10,NULL,NULL,8,2,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(268,10,NULL,NULL,5,4,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(269,8,NULL,NULL,2,4,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(270,9,NULL,NULL,17,3,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(271,8,NULL,NULL,51,1,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(272,1,NULL,NULL,19,3,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(273,2,NULL,NULL,18,5,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(274,2,NULL,NULL,4,1,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(275,5,NULL,NULL,22,5,'Great E-commerce system. And much more : Wonderful Customer Support.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(276,3,NULL,NULL,6,5,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(277,1,NULL,NULL,24,2,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(278,9,NULL,NULL,12,1,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(279,9,NULL,NULL,11,1,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(280,5,NULL,NULL,42,1,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(281,1,NULL,NULL,54,2,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(282,5,NULL,NULL,35,3,'Good app, good backup service and support. Good documentation.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(283,8,NULL,NULL,52,2,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(284,6,NULL,NULL,51,4,'Best ecommerce CMS online store!','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(285,2,NULL,NULL,38,2,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(286,2,NULL,NULL,45,4,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(287,5,NULL,NULL,11,2,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(288,3,NULL,NULL,1,5,'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(289,5,NULL,NULL,27,3,'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(290,1,NULL,NULL,34,5,'Good app, good backup service and support. Good documentation.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(291,6,NULL,NULL,9,1,'Good app, good backup service and support. Good documentation.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(292,1,NULL,NULL,37,5,'Great E-commerce system. And much more : Wonderful Customer Support.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(293,3,NULL,NULL,13,2,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(294,9,NULL,NULL,52,1,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(295,9,NULL,NULL,15,4,'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(296,10,NULL,NULL,20,5,'Good app, good backup service and support. Good documentation.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(297,7,NULL,NULL,12,3,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(298,2,NULL,NULL,22,2,'Great E-commerce system. And much more : Wonderful Customer Support.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(299,9,NULL,NULL,54,2,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(300,1,NULL,NULL,40,4,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(301,1,NULL,NULL,50,2,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(302,9,NULL,NULL,33,3,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(303,2,NULL,NULL,15,5,'The best store template! Excellent coding! Very good support! Thank you so much for all the help, I really appreciated.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(304,2,NULL,NULL,9,3,'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(305,8,NULL,NULL,32,2,'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(306,6,NULL,NULL,44,2,'Good app, good backup service and support. Good documentation.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(307,6,NULL,NULL,30,1,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(308,4,NULL,NULL,19,5,'Good app, good backup service and support. Good documentation.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(309,9,NULL,NULL,36,3,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(310,8,NULL,NULL,15,3,'Clean & perfect source code','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(311,6,NULL,NULL,10,5,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(312,7,NULL,NULL,20,3,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(313,10,NULL,NULL,6,2,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(314,2,NULL,NULL,20,5,'Best ecommerce CMS online store!','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(315,9,NULL,NULL,28,2,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(316,10,NULL,NULL,34,5,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(317,2,NULL,NULL,27,5,'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(318,2,NULL,NULL,41,1,'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(319,6,NULL,NULL,49,5,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(320,1,NULL,NULL,25,4,'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(321,5,NULL,NULL,16,5,'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(322,7,NULL,NULL,48,3,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(323,4,NULL,NULL,36,3,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(324,8,NULL,NULL,40,5,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(325,2,NULL,NULL,30,1,'Best ecommerce CMS online store!','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(326,9,NULL,NULL,7,2,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(327,4,NULL,NULL,27,4,'The best store template! Excellent coding! Very good support! Thank you so much for all the help, I really appreciated.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(328,5,NULL,NULL,44,3,'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(329,3,NULL,NULL,25,4,'The best store template! Excellent coding! Very good support! Thank you so much for all the help, I really appreciated.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(330,6,NULL,NULL,14,2,'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(331,6,NULL,NULL,11,4,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(332,8,NULL,NULL,9,3,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(333,1,NULL,NULL,52,3,'Clean & perfect source code','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(334,4,NULL,NULL,11,4,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(335,5,NULL,NULL,20,5,'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(336,9,NULL,NULL,31,1,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(337,7,NULL,NULL,44,2,'The best store template! Excellent coding! Very good support! Thank you so much for all the help, I really appreciated.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(338,10,NULL,NULL,47,5,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(339,1,NULL,NULL,27,3,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(340,1,NULL,NULL,16,5,'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(341,7,NULL,NULL,40,1,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(342,4,NULL,NULL,12,3,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(343,8,NULL,NULL,3,3,'Clean & perfect source code','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(344,7,NULL,NULL,17,1,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(345,9,NULL,NULL,3,5,'Clean & perfect source code','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(346,10,NULL,NULL,49,2,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(347,6,NULL,NULL,5,4,'Great E-commerce system. And much more : Wonderful Customer Support.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(348,4,NULL,NULL,44,5,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(349,7,NULL,NULL,1,4,'Great E-commerce system. And much more : Wonderful Customer Support.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(350,1,NULL,NULL,47,3,'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(351,3,NULL,NULL,21,4,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(352,2,NULL,NULL,37,3,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(353,6,NULL,NULL,27,3,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(354,10,NULL,NULL,26,1,'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(355,7,NULL,NULL,25,4,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(356,5,NULL,NULL,38,5,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(357,6,NULL,NULL,37,5,'Good app, good backup service and support. Good documentation.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(358,6,NULL,NULL,50,5,'Clean & perfect source code','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(359,9,NULL,NULL,50,4,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(360,10,NULL,NULL,7,2,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(361,4,NULL,NULL,38,2,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(362,7,NULL,NULL,39,2,'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot BOTBLE Teams','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(363,9,NULL,NULL,34,2,'The best store template! Excellent coding! Very good support! Thank you so much for all the help, I really appreciated.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(364,9,NULL,NULL,51,2,'The code is good, in general, if you like it, can you give it 5 stars?','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(365,8,NULL,NULL,53,2,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(366,7,NULL,NULL,6,4,'Clean & perfect source code','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(367,9,NULL,NULL,38,2,'The code is good, in general, if you like it, can you give it 5 stars?','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(368,5,NULL,NULL,43,3,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(369,6,NULL,NULL,15,2,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(370,5,NULL,NULL,52,5,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(371,7,NULL,NULL,8,3,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(372,9,NULL,NULL,1,2,'The best store template! Excellent coding! Very good support! Thank you so much for all the help, I really appreciated.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(373,1,NULL,NULL,15,4,'Clean & perfect source code','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(374,8,NULL,NULL,6,4,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(375,8,NULL,NULL,25,1,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(376,6,NULL,NULL,34,2,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(377,9,NULL,NULL,27,5,'Clean & perfect source code','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(378,5,NULL,NULL,26,5,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(379,6,NULL,NULL,45,3,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(380,6,NULL,NULL,12,5,'Good app, good backup service and support. Good documentation.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(381,9,NULL,NULL,22,1,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(382,8,NULL,NULL,17,1,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(383,7,NULL,NULL,29,3,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(384,8,NULL,NULL,20,5,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(385,10,NULL,NULL,44,1,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(386,7,NULL,NULL,13,2,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(387,8,NULL,NULL,10,4,'Best ecommerce CMS online store!','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(388,7,NULL,NULL,35,3,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(389,10,NULL,NULL,50,2,'Great E-commerce system. And much more : Wonderful Customer Support.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(390,10,NULL,NULL,16,1,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(391,4,NULL,NULL,39,4,'The best store template! Excellent coding! Very good support! Thank you so much for all the help, I really appreciated.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(392,2,NULL,NULL,25,1,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(393,6,NULL,NULL,8,4,'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(394,3,NULL,NULL,27,5,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(395,10,NULL,NULL,18,4,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(396,8,NULL,NULL,33,4,'Clean & perfect source code','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(397,6,NULL,NULL,24,1,'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(398,10,NULL,NULL,3,4,'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot BOTBLE Teams','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(399,8,NULL,NULL,21,4,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(400,6,NULL,NULL,54,2,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(401,3,NULL,NULL,35,3,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(402,1,NULL,NULL,21,5,'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(403,2,NULL,NULL,10,4,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(404,6,NULL,NULL,47,4,'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(405,7,NULL,NULL,26,4,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(406,8,NULL,NULL,18,3,'The code is good, in general, if you like it, can you give it 5 stars?','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(407,1,NULL,NULL,11,4,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(408,2,NULL,NULL,19,3,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(409,8,NULL,NULL,41,3,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(410,7,NULL,NULL,41,4,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(411,5,NULL,NULL,1,3,'The code is good, in general, if you like it, can you give it 5 stars?','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(412,1,NULL,NULL,23,2,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(413,1,NULL,NULL,20,1,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(414,6,NULL,NULL,6,5,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(415,10,NULL,NULL,51,2,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(416,6,NULL,NULL,41,3,'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(417,1,NULL,NULL,1,4,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(418,10,NULL,NULL,10,5,'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(419,8,NULL,NULL,49,3,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(420,3,NULL,NULL,51,5,'Clean & perfect source code','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(421,5,NULL,NULL,54,4,'Good app, good backup service and support. Good documentation.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(422,4,NULL,NULL,30,2,'Best ecommerce CMS online store!','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(423,2,NULL,NULL,6,4,'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(424,10,NULL,NULL,21,3,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(425,4,NULL,NULL,6,3,'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot BOTBLE Teams','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(426,3,NULL,NULL,12,2,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(427,5,NULL,NULL,40,2,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(428,8,NULL,NULL,26,4,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(429,2,NULL,NULL,33,2,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(430,1,NULL,NULL,7,2,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(431,8,NULL,NULL,47,1,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(432,2,NULL,NULL,46,1,'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(433,9,NULL,NULL,41,5,'Great E-commerce system. And much more : Wonderful Customer Support.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(434,2,NULL,NULL,2,3,'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(435,7,NULL,NULL,9,5,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(436,2,NULL,NULL,36,2,'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(437,8,NULL,NULL,37,2,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(438,2,NULL,NULL,26,1,'Good app, good backup service and support. Good documentation.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(439,3,NULL,NULL,41,4,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(440,1,NULL,NULL,43,1,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(441,5,NULL,NULL,45,3,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(442,7,NULL,NULL,34,3,'The code is good, in general, if you like it, can you give it 5 stars?','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(443,9,NULL,NULL,25,1,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(444,1,NULL,NULL,35,4,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(445,7,NULL,NULL,53,3,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(446,2,NULL,NULL,49,3,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(447,8,NULL,NULL,28,2,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(448,1,NULL,NULL,32,3,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(449,7,NULL,NULL,37,4,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(450,9,NULL,NULL,23,3,'The code is good, in general, if you like it, can you give it 5 stars?','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(451,2,NULL,NULL,44,5,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(452,1,NULL,NULL,12,5,'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(453,10,NULL,NULL,39,3,'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(454,4,NULL,NULL,41,2,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(455,1,NULL,NULL,17,5,'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(456,4,NULL,NULL,35,1,'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(457,3,NULL,NULL,53,2,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(458,7,NULL,NULL,5,2,'Clean & perfect source code','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(459,1,NULL,NULL,49,4,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(460,2,NULL,NULL,12,5,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(461,2,NULL,NULL,7,5,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(462,3,NULL,NULL,20,1,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(463,4,NULL,NULL,49,5,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(464,5,NULL,NULL,51,5,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(465,7,NULL,NULL,23,4,'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot BOTBLE Teams','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(466,6,NULL,NULL,42,1,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(467,2,NULL,NULL,16,1,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(468,3,NULL,NULL,16,2,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(469,1,NULL,NULL,42,1,'Clean & perfect source code','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(470,4,NULL,NULL,4,3,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(471,2,NULL,NULL,54,3,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(472,3,NULL,NULL,14,2,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(473,3,NULL,NULL,18,4,'Good app, good backup service and support. Good documentation.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(474,3,NULL,NULL,11,4,'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(475,10,NULL,NULL,22,5,'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(476,3,NULL,NULL,49,3,'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(477,2,NULL,NULL,39,2,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(478,1,NULL,NULL,4,4,'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot BOTBLE Teams','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(479,2,NULL,NULL,47,4,'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot BOTBLE Teams','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(480,8,NULL,NULL,36,4,'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(481,9,NULL,NULL,32,4,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(482,8,NULL,NULL,12,2,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(483,4,NULL,NULL,10,2,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(484,3,NULL,NULL,2,4,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(485,10,NULL,NULL,25,2,'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(486,3,NULL,NULL,9,3,'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(487,1,NULL,NULL,9,3,'The code is good, in general, if you like it, can you give it 5 stars?','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(488,9,NULL,NULL,39,4,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(489,5,NULL,NULL,37,1,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(490,7,NULL,NULL,10,2,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(491,5,NULL,NULL,17,5,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(492,6,NULL,NULL,26,4,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(493,3,NULL,NULL,15,5,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(494,7,NULL,NULL,28,5,'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(495,5,NULL,NULL,14,2,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(496,10,NULL,NULL,30,1,'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(497,1,NULL,NULL,51,5,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(498,3,NULL,NULL,28,3,'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(499,3,NULL,NULL,31,3,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(500,10,NULL,NULL,40,3,'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(501,10,NULL,NULL,36,4,'Good app, good backup service and support. Good documentation.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(502,2,NULL,NULL,13,2,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(503,3,NULL,NULL,33,2,'Best ecommerce CMS online store!','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(504,6,NULL,NULL,1,1,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(505,5,NULL,NULL,6,5,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(506,8,NULL,NULL,27,4,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(507,4,NULL,NULL,42,2,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(508,7,NULL,NULL,21,4,'Good app, good backup service and support. Good documentation.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(509,6,NULL,NULL,19,3,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(510,7,NULL,NULL,7,2,'Good app, good backup service and support. Good documentation.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(511,8,NULL,NULL,5,1,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(512,7,NULL,NULL,2,3,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(513,4,NULL,NULL,21,5,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(514,7,NULL,NULL,30,2,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(515,5,NULL,NULL,25,4,'Best ecommerce CMS online store!','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(516,4,NULL,NULL,3,1,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(517,6,NULL,NULL,16,2,'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(518,1,NULL,NULL,36,2,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(519,5,NULL,NULL,4,5,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(520,4,NULL,NULL,14,3,'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(521,8,NULL,NULL,38,5,'Good app, good backup service and support. Good documentation.','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL),(522,5,NULL,NULL,13,4,'Clean & perfect source code','published','2025-12-26 09:38:49','2025-12-26 09:38:49',NULL);
/*!40000 ALTER TABLE `ec_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_shared_wishlists`
--

DROP TABLE IF EXISTS `ec_shared_wishlists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_shared_wishlists` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_ids` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_shared_wishlists_code_unique` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_shared_wishlists`
--

LOCK TABLES `ec_shared_wishlists` WRITE;
/*!40000 ALTER TABLE `ec_shared_wishlists` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_shared_wishlists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_shipment_histories`
--

DROP TABLE IF EXISTS `ec_shipment_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_shipment_histories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `shipment_id` bigint unsigned NOT NULL,
  `order_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_shipment_histories`
--

LOCK TABLES `ec_shipment_histories` WRITE;
/*!40000 ALTER TABLE `ec_shipment_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_shipment_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_shipments`
--

DROP TABLE IF EXISTS `ec_shipments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_shipments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `weight` double DEFAULT '0',
  `shipment_id` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rate_id` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `cod_amount` decimal(15,2) DEFAULT '0.00',
  `cod_status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `cross_checking_status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `price` decimal(15,2) DEFAULT '0.00',
  `store_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tracking_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_company_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tracking_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estimate_date_shipped` datetime DEFAULT NULL,
  `date_shipped` datetime DEFAULT NULL,
  `customer_delivered_confirmed_at` timestamp NULL DEFAULT NULL,
  `label_url` text COLLATE utf8mb4_unicode_ci,
  `metadata` mediumtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_shipments_order_id_unique` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_shipments`
--

LOCK TABLES `ec_shipments` WRITE;
/*!40000 ALTER TABLE `ec_shipments` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_shipments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_shipping`
--

DROP TABLE IF EXISTS `ec_shipping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_shipping` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_shipping`
--

LOCK TABLES `ec_shipping` WRITE;
/*!40000 ALTER TABLE `ec_shipping` DISABLE KEYS */;
INSERT INTO `ec_shipping` VALUES (1,'All',NULL,'2025-12-26 09:38:50','2025-12-26 09:38:50');
/*!40000 ALTER TABLE `ec_shipping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_shipping_rule_items`
--

DROP TABLE IF EXISTS `ec_shipping_rule_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_shipping_rule_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `shipping_rule_id` bigint unsigned NOT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adjustment_price` decimal(15,2) DEFAULT '0.00',
  `is_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_shipping_rule_items`
--

LOCK TABLES `ec_shipping_rule_items` WRITE;
/*!40000 ALTER TABLE `ec_shipping_rule_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_shipping_rule_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_shipping_rules`
--

DROP TABLE IF EXISTS `ec_shipping_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_shipping_rules` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_id` bigint unsigned NOT NULL,
  `type` varchar(24) COLLATE utf8mb4_unicode_ci DEFAULT 'based_on_price',
  `from` decimal(15,2) DEFAULT '0.00',
  `to` decimal(15,2) DEFAULT '0.00',
  `price` decimal(15,2) DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_shipping_rules`
--

LOCK TABLES `ec_shipping_rules` WRITE;
/*!40000 ALTER TABLE `ec_shipping_rules` DISABLE KEYS */;
INSERT INTO `ec_shipping_rules` VALUES (1,'Free delivery',1,'based_on_price',1000.00,NULL,0.00,'2025-12-26 09:38:50','2025-12-26 09:38:50'),(2,'Flat Rate',1,'based_on_price',0.00,NULL,20.00,'2025-12-26 09:38:50','2025-12-26 09:38:50'),(3,'Local Pickup',1,'based_on_price',0.00,NULL,0.00,'2025-12-26 09:38:50','2025-12-26 09:38:50');
/*!40000 ALTER TABLE `ec_shipping_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_specification_attributes`
--

DROP TABLE IF EXISTS `ec_specification_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_specification_attributes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `group_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `default_value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `author_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_specification_attributes_author_type_author_id_index` (`author_type`,`author_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_specification_attributes`
--

LOCK TABLES `ec_specification_attributes` WRITE;
/*!40000 ALTER TABLE `ec_specification_attributes` DISABLE KEYS */;
INSERT INTO `ec_specification_attributes` VALUES (1,1,'Height','text',NULL,NULL,'2025-12-26 09:38:53','2025-12-26 09:38:53',NULL,NULL),(2,1,'Width','text',NULL,NULL,'2025-12-26 09:38:53','2025-12-26 09:38:53',NULL,NULL),(3,1,'Weight','text',NULL,NULL,'2025-12-26 09:38:53','2025-12-26 09:38:53',NULL,NULL),(4,2,'Power','text',NULL,NULL,'2025-12-26 09:38:53','2025-12-26 09:38:53',NULL,NULL),(5,2,'Speed','text',NULL,NULL,'2025-12-26 09:38:53','2025-12-26 09:38:53',NULL,NULL),(6,3,'Battery Life','text',NULL,NULL,'2025-12-26 09:38:53','2025-12-26 09:38:53',NULL,NULL),(7,4,'Screen Size','text',NULL,NULL,'2025-12-26 09:38:53','2025-12-26 09:38:53',NULL,NULL),(8,4,'Resolution','select','[\"1920x1080\",\"2560x1440\",\"3840x2160\"]',NULL,'2025-12-26 09:38:53','2025-12-26 09:38:53',NULL,NULL);
/*!40000 ALTER TABLE `ec_specification_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_specification_attributes_translations`
--

DROP TABLE IF EXISTS `ec_specification_attributes_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_specification_attributes_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_specification_attributes_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `default_value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_specification_attributes_id`),
  KEY `idx_specification_attributes_fk` (`ec_specification_attributes_id`),
  KEY `idx_specification_attributes_specification_attributes_lang` (`ec_specification_attributes_id`,`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_specification_attributes_translations`
--

LOCK TABLES `ec_specification_attributes_translations` WRITE;
/*!40000 ALTER TABLE `ec_specification_attributes_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_specification_attributes_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_specification_groups`
--

DROP TABLE IF EXISTS `ec_specification_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_specification_groups` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `author_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_specification_groups_author_type_author_id_index` (`author_type`,`author_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_specification_groups`
--

LOCK TABLES `ec_specification_groups` WRITE;
/*!40000 ALTER TABLE `ec_specification_groups` DISABLE KEYS */;
INSERT INTO `ec_specification_groups` VALUES (1,'Dimensions',NULL,'2025-12-26 09:38:53','2025-12-26 09:38:53',NULL,NULL),(2,'Performance',NULL,'2025-12-26 09:38:53','2025-12-26 09:38:53',NULL,NULL),(3,'Battery',NULL,'2025-12-26 09:38:53','2025-12-26 09:38:53',NULL,NULL),(4,'Display',NULL,'2025-12-26 09:38:53','2025-12-26 09:38:53',NULL,NULL);
/*!40000 ALTER TABLE `ec_specification_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_specification_groups_translations`
--

DROP TABLE IF EXISTS `ec_specification_groups_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_specification_groups_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_specification_groups_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_specification_groups_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_specification_groups_translations`
--

LOCK TABLES `ec_specification_groups_translations` WRITE;
/*!40000 ALTER TABLE `ec_specification_groups_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_specification_groups_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_specification_table_group`
--

DROP TABLE IF EXISTS `ec_specification_table_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_specification_table_group` (
  `table_id` bigint unsigned NOT NULL,
  `group_id` bigint unsigned NOT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`table_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_specification_table_group`
--

LOCK TABLES `ec_specification_table_group` WRITE;
/*!40000 ALTER TABLE `ec_specification_table_group` DISABLE KEYS */;
INSERT INTO `ec_specification_table_group` VALUES (1,1,0),(1,2,0),(2,3,0),(2,4,0);
/*!40000 ALTER TABLE `ec_specification_table_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_specification_tables`
--

DROP TABLE IF EXISTS `ec_specification_tables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_specification_tables` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `author_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_specification_tables_author_type_author_id_index` (`author_type`,`author_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_specification_tables`
--

LOCK TABLES `ec_specification_tables` WRITE;
/*!40000 ALTER TABLE `ec_specification_tables` DISABLE KEYS */;
INSERT INTO `ec_specification_tables` VALUES (1,'General Specification',NULL,'2025-12-26 09:38:53','2025-12-26 09:38:53',NULL,NULL),(2,'Technical Specification',NULL,'2025-12-26 09:38:53','2025-12-26 09:38:53',NULL,NULL);
/*!40000 ALTER TABLE `ec_specification_tables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_specification_tables_translations`
--

DROP TABLE IF EXISTS `ec_specification_tables_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_specification_tables_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_specification_tables_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_specification_tables_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_specification_tables_translations`
--

LOCK TABLES `ec_specification_tables_translations` WRITE;
/*!40000 ALTER TABLE `ec_specification_tables_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_specification_tables_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_store_locators`
--

DROP TABLE IF EXISTS `ec_store_locators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_store_locators` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_primary` tinyint(1) DEFAULT '0',
  `is_shipping_location` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `zip_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_store_locators`
--

LOCK TABLES `ec_store_locators` WRITE;
/*!40000 ALTER TABLE `ec_store_locators` DISABLE KEYS */;
INSERT INTO `ec_store_locators` VALUES (1,'Martfury','sales@botble.com','1800979769','502 New Street','AU','Brighton VIC','Brighton VIC',1,1,'2025-12-26 09:38:55','2025-12-26 09:38:55',NULL);
/*!40000 ALTER TABLE `ec_store_locators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_tax_products`
--

DROP TABLE IF EXISTS `ec_tax_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_tax_products` (
  `tax_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`product_id`,`tax_id`),
  KEY `ec_tax_products_tax_id_index` (`tax_id`),
  KEY `ec_tax_products_product_id_index` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_tax_products`
--

LOCK TABLES `ec_tax_products` WRITE;
/*!40000 ALTER TABLE `ec_tax_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_tax_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_tax_rules`
--

DROP TABLE IF EXISTS `ec_tax_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_tax_rules` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tax_id` bigint unsigned NOT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priority` int DEFAULT NULL,
  `is_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `percentage` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_tax_rules`
--

LOCK TABLES `ec_tax_rules` WRITE;
/*!40000 ALTER TABLE `ec_tax_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_tax_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_taxes`
--

DROP TABLE IF EXISTS `ec_taxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_taxes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `percentage` float DEFAULT NULL,
  `priority` int DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_taxes`
--

LOCK TABLES `ec_taxes` WRITE;
/*!40000 ALTER TABLE `ec_taxes` DISABLE KEYS */;
INSERT INTO `ec_taxes` VALUES (1,'VAT',10,1,'published','2025-12-26 09:38:49','2025-12-26 09:38:49'),(2,'None',0,2,'published','2025-12-26 09:38:49','2025-12-26 09:38:49'),(3,'Import Tax',15,3,'published','2025-12-26 09:38:49','2025-12-26 09:38:49');
/*!40000 ALTER TABLE `ec_taxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_taxes_translations`
--

DROP TABLE IF EXISTS `ec_taxes_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_taxes_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_taxes_id` bigint unsigned NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_taxes_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_taxes_translations`
--

LOCK TABLES `ec_taxes_translations` WRITE;
/*!40000 ALTER TABLE `ec_taxes_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_taxes_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_wish_lists`
--

DROP TABLE IF EXISTS `ec_wish_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_wish_lists` (
  `customer_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`customer_id`,`product_id`),
  KEY `wishlist_relation_index` (`product_id`,`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_wish_lists`
--

LOCK TABLES `ec_wish_lists` WRITE;
/*!40000 ALTER TABLE `ec_wish_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_wish_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
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
-- Table structure for table `faq_categories`
--

DROP TABLE IF EXISTS `faq_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faq_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faq_categories`
--

LOCK TABLES `faq_categories` WRITE;
/*!40000 ALTER TABLE `faq_categories` DISABLE KEYS */;
INSERT INTO `faq_categories` VALUES (1,'SHIPPING',0,'published','2025-12-26 09:38:52','2025-12-26 09:38:52',NULL),(2,'PAYMENT',1,'published','2025-12-26 09:38:52','2025-12-26 09:38:52',NULL),(3,'ORDER &amp; RETURNS',2,'published','2025-12-26 09:38:52','2025-12-26 09:38:52',NULL);
/*!40000 ALTER TABLE `faq_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faq_categories_translations`
--

DROP TABLE IF EXISTS `faq_categories_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faq_categories_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `faq_categories_id` bigint unsigned NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`faq_categories_id`),
  KEY `idx_faq_cat_trans_faq_cat_id` (`faq_categories_id`),
  KEY `idx_faq_cat_trans_faq_cat_lang` (`faq_categories_id`,`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faq_categories_translations`
--

LOCK TABLES `faq_categories_translations` WRITE;
/*!40000 ALTER TABLE `faq_categories_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `faq_categories_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faqs`
--

DROP TABLE IF EXISTS `faqs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faqs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `question` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint unsigned NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faqs`
--

LOCK TABLES `faqs` WRITE;
/*!40000 ALTER TABLE `faqs` DISABLE KEYS */;
INSERT INTO `faqs` VALUES (1,'What Shipping Methods Are Available?','We offer several shipping methods including Standard Shipping, Express Shipping, and Overnight Delivery. You can select your preferred method at checkout.',1,'published','2025-12-26 09:38:52','2025-12-26 09:38:52'),(2,'Do You Ship Internationally?','Yes, we ship to over 200 countries worldwide. International shipping rates and delivery times vary by location.',1,'published','2025-12-26 09:38:52','2025-12-26 09:38:52'),(3,'How Long Will It Take To Get My Package?','Standard shipping typically takes 3-5 business days. Express shipping takes 1-2 business days. International orders may take 7-14 business days depending on customs.',1,'published','2025-12-26 09:38:52','2025-12-26 09:38:52'),(4,'What Payment Methods Are Accepted?','We accept all major credit cards (Visa, MasterCard, American Express), PayPal, and Apple Pay. We also support local payment methods depending on your region.',2,'published','2025-12-26 09:38:52','2025-12-26 09:38:52'),(5,'Is Buying On-Line Safe?','Yes, buying online with us is completely safe. We use SSL encryption to protect your personal and payment information. We do not store your credit card details.',2,'published','2025-12-26 09:38:52','2025-12-26 09:38:52'),(6,'How do I place an Order?','To place an order, browse our catalog, select the items you like, and add them to your cart. Then proceed to checkout, enter your shipping and payment details, and confirm your order.',3,'published','2025-12-26 09:38:52','2025-12-26 09:38:52'),(7,'How Can I Cancel Or Change My Order?','You can cancel or change your order within 1 hour of placing it by contacting our customer support. After that, we may have already processed it, but we will do our best to assist you.',3,'published','2025-12-26 09:38:52','2025-12-26 09:38:52'),(8,'Do I need an account to place an order?','No, you can place an order as a guest. However, creating an account allows you to track your orders, save your address for faster checkout, and access exclusive offers.',3,'published','2025-12-26 09:38:52','2025-12-26 09:38:52'),(9,'How Do I Track My Order?','Once your order is shipped, we will send you a tracking number via email. You can use this number to track your package on our website or the carrier\'s tracking page.',3,'published','2025-12-26 09:38:52','2025-12-26 09:38:52'),(10,'How Can I Return a Product?','We accept returns within 30 days of purchase. The item must be unused and in its original packaging. Please contact our support team to initiate a return and get a return shipping label.',3,'published','2025-12-26 09:38:52','2025-12-26 09:38:52');
/*!40000 ALTER TABLE `faqs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faqs_translations`
--

DROP TABLE IF EXISTS `faqs_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faqs_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `faqs_id` bigint unsigned NOT NULL,
  `question` text COLLATE utf8mb4_unicode_ci,
  `answer` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`faqs_id`),
  KEY `idx_faqs_trans_faqs_id` (`faqs_id`),
  KEY `idx_faqs_trans_faq_lang` (`faqs_id`,`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faqs_translations`
--

LOCK TABLES `faqs_translations` WRITE;
/*!40000 ALTER TABLE `faqs_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `faqs_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
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
-- Table structure for table `language_meta`
--

DROP TABLE IF EXISTS `language_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `language_meta` (
  `lang_meta_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `lang_meta_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang_meta_origin` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`lang_meta_id`),
  KEY `language_meta_reference_id_index` (`reference_id`),
  KEY `meta_code_index` (`lang_meta_code`),
  KEY `meta_origin_index` (`lang_meta_origin`),
  KEY `meta_reference_type_index` (`reference_type`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language_meta`
--

LOCK TABLES `language_meta` WRITE;
/*!40000 ALTER TABLE `language_meta` DISABLE KEYS */;
INSERT INTO `language_meta` VALUES (1,'en_US','5495e13e6a141c509012f587d3418c7e',1,'Botble\\SimpleSlider\\Models\\SimpleSlider'),(2,'en_US','0a61ed23df057a914643665a1591ff98',1,'Botble\\Menu\\Models\\MenuLocation'),(3,'en_US','f3fc352dd4f3ff3048e08be31d628d84',1,'Botble\\Menu\\Models\\Menu'),(4,'en_US','cbbc53643787745436e34d5c95207828',2,'Botble\\Menu\\Models\\Menu'),(5,'en_US','d9cc29a458c9d13c52fd11c2992e7f73',3,'Botble\\Menu\\Models\\Menu'),(6,'en_US','9c57f8503aa5095d39af46301bcb9b2f',4,'Botble\\Menu\\Models\\Menu');
/*!40000 ALTER TABLE `language_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `languages` (
  `lang_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `lang_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_locale` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_flag` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang_is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `lang_order` int NOT NULL DEFAULT '0',
  `lang_is_rtl` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`lang_id`),
  KEY `lang_locale_index` (`lang_locale`),
  KEY `lang_code_index` (`lang_code`),
  KEY `lang_is_default_index` (`lang_is_default`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,'English','en','en_US','us',1,0,0);
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_files`
--

DROP TABLE IF EXISTS `media_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_files` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alt` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `folder_id` bigint unsigned NOT NULL DEFAULT '0',
  `mime_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `visibility` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'public',
  PRIMARY KEY (`id`),
  KEY `media_files_user_id_index` (`user_id`),
  KEY `media_files_index` (`folder_id`,`user_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=299 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_files`
--

LOCK TABLES `media_files` WRITE;
/*!40000 ALTER TABLE `media_files` DISABLE KEYS */;
INSERT INTO `media_files` VALUES (1,0,'1','1',1,'image/jpeg',1613,'brands/1.jpg','[]','2025-12-26 09:38:19','2025-12-26 09:38:19',NULL,'public'),(2,0,'2','2',1,'image/jpeg',1613,'brands/2.jpg','[]','2025-12-26 09:38:19','2025-12-26 09:38:19',NULL,'public'),(3,0,'3','3',1,'image/jpeg',1613,'brands/3.jpg','[]','2025-12-26 09:38:19','2025-12-26 09:38:19',NULL,'public'),(4,0,'4','4',1,'image/jpeg',1613,'brands/4.jpg','[]','2025-12-26 09:38:19','2025-12-26 09:38:19',NULL,'public'),(5,0,'5','5',1,'image/jpeg',1613,'brands/5.jpg','[]','2025-12-26 09:38:19','2025-12-26 09:38:19',NULL,'public'),(6,0,'6','6',1,'image/jpeg',1613,'brands/6.jpg','[]','2025-12-26 09:38:19','2025-12-26 09:38:19',NULL,'public'),(7,0,'7','7',1,'image/jpeg',1613,'brands/7.jpg','[]','2025-12-26 09:38:19','2025-12-26 09:38:19',NULL,'public'),(8,0,'1','1',2,'image/jpeg',9803,'product-categories/1.jpg','[]','2025-12-26 09:38:19','2025-12-26 09:38:19',NULL,'public'),(9,0,'2','2',2,'image/jpeg',9803,'product-categories/2.jpg','[]','2025-12-26 09:38:19','2025-12-26 09:38:19',NULL,'public'),(10,0,'3','3',2,'image/jpeg',9803,'product-categories/3.jpg','[]','2025-12-26 09:38:19','2025-12-26 09:38:19',NULL,'public'),(11,0,'4','4',2,'image/jpeg',9803,'product-categories/4.jpg','[]','2025-12-26 09:38:19','2025-12-26 09:38:19',NULL,'public'),(12,0,'5','5',2,'image/jpeg',9803,'product-categories/5.jpg','[]','2025-12-26 09:38:19','2025-12-26 09:38:19',NULL,'public'),(13,0,'6','6',2,'image/jpeg',9803,'product-categories/6.jpg','[]','2025-12-26 09:38:19','2025-12-26 09:38:19',NULL,'public'),(14,0,'7','7',2,'image/jpeg',9803,'product-categories/7.jpg','[]','2025-12-26 09:38:19','2025-12-26 09:38:19',NULL,'public'),(15,0,'8','8',2,'image/jpeg',9803,'product-categories/8.jpg','[]','2025-12-26 09:38:20','2025-12-26 09:38:20',NULL,'public'),(16,0,'1-1','1-1',3,'image/jpeg',9803,'products/1-1.jpg','[]','2025-12-26 09:38:20','2025-12-26 09:38:20',NULL,'public'),(17,0,'1-2','1-2',3,'image/jpeg',9803,'products/1-2.jpg','[]','2025-12-26 09:38:20','2025-12-26 09:38:20',NULL,'public'),(18,0,'1-3','1-3',3,'image/jpeg',9803,'products/1-3.jpg','[]','2025-12-26 09:38:20','2025-12-26 09:38:20',NULL,'public'),(19,0,'1-4','1-4',3,'image/jpeg',9803,'products/1-4.jpg','[]','2025-12-26 09:38:20','2025-12-26 09:38:20',NULL,'public'),(20,0,'10-1','10-1',3,'image/jpeg',9803,'products/10-1.jpg','[]','2025-12-26 09:38:20','2025-12-26 09:38:20',NULL,'public'),(21,0,'10-2','10-2',3,'image/jpeg',9803,'products/10-2.jpg','[]','2025-12-26 09:38:20','2025-12-26 09:38:20',NULL,'public'),(22,0,'10-3','10-3',3,'image/jpeg',9803,'products/10-3.jpg','[]','2025-12-26 09:38:21','2025-12-26 09:38:21',NULL,'public'),(23,0,'10-4','10-4',3,'image/jpeg',9803,'products/10-4.jpg','[]','2025-12-26 09:38:21','2025-12-26 09:38:21',NULL,'public'),(24,0,'11-1','11-1',3,'image/jpeg',9803,'products/11-1.jpg','[]','2025-12-26 09:38:21','2025-12-26 09:38:21',NULL,'public'),(25,0,'11-2','11-2',3,'image/jpeg',9803,'products/11-2.jpg','[]','2025-12-26 09:38:21','2025-12-26 09:38:21',NULL,'public'),(26,0,'11-3','11-3',3,'image/jpeg',9803,'products/11-3.jpg','[]','2025-12-26 09:38:21','2025-12-26 09:38:21',NULL,'public'),(27,0,'11-4','11-4',3,'image/jpeg',9803,'products/11-4.jpg','[]','2025-12-26 09:38:21','2025-12-26 09:38:21',NULL,'public'),(28,0,'12-1','12-1',3,'image/jpeg',9803,'products/12-1.jpg','[]','2025-12-26 09:38:21','2025-12-26 09:38:21',NULL,'public'),(29,0,'12-2','12-2',3,'image/jpeg',9803,'products/12-2.jpg','[]','2025-12-26 09:38:21','2025-12-26 09:38:21',NULL,'public'),(30,0,'12-3','12-3',3,'image/jpeg',9803,'products/12-3.jpg','[]','2025-12-26 09:38:21','2025-12-26 09:38:21',NULL,'public'),(31,0,'12-4','12-4',3,'image/jpeg',9803,'products/12-4.jpg','[]','2025-12-26 09:38:21','2025-12-26 09:38:21',NULL,'public'),(32,0,'13-1','13-1',3,'image/jpeg',9803,'products/13-1.jpg','[]','2025-12-26 09:38:21','2025-12-26 09:38:21',NULL,'public'),(33,0,'13-2','13-2',3,'image/jpeg',9803,'products/13-2.jpg','[]','2025-12-26 09:38:21','2025-12-26 09:38:21',NULL,'public'),(34,0,'13-3','13-3',3,'image/jpeg',9803,'products/13-3.jpg','[]','2025-12-26 09:38:21','2025-12-26 09:38:21',NULL,'public'),(35,0,'13-4','13-4',3,'image/jpeg',9803,'products/13-4.jpg','[]','2025-12-26 09:38:22','2025-12-26 09:38:22',NULL,'public'),(36,0,'14-1','14-1',3,'image/jpeg',9803,'products/14-1.jpg','[]','2025-12-26 09:38:22','2025-12-26 09:38:22',NULL,'public'),(37,0,'14-2','14-2',3,'image/jpeg',9803,'products/14-2.jpg','[]','2025-12-26 09:38:22','2025-12-26 09:38:22',NULL,'public'),(38,0,'14-3','14-3',3,'image/jpeg',9803,'products/14-3.jpg','[]','2025-12-26 09:38:22','2025-12-26 09:38:22',NULL,'public'),(39,0,'14-4','14-4',3,'image/jpeg',9803,'products/14-4.jpg','[]','2025-12-26 09:38:22','2025-12-26 09:38:22',NULL,'public'),(40,0,'15-1','15-1',3,'image/jpeg',9803,'products/15-1.jpg','[]','2025-12-26 09:38:22','2025-12-26 09:38:22',NULL,'public'),(41,0,'15-2','15-2',3,'image/jpeg',9803,'products/15-2.jpg','[]','2025-12-26 09:38:22','2025-12-26 09:38:22',NULL,'public'),(42,0,'15-3','15-3',3,'image/jpeg',9803,'products/15-3.jpg','[]','2025-12-26 09:38:22','2025-12-26 09:38:22',NULL,'public'),(43,0,'15-4','15-4',3,'image/jpeg',9803,'products/15-4.jpg','[]','2025-12-26 09:38:22','2025-12-26 09:38:22',NULL,'public'),(44,0,'16-1','16-1',3,'image/jpeg',9803,'products/16-1.jpg','[]','2025-12-26 09:38:22','2025-12-26 09:38:22',NULL,'public'),(45,0,'16-2','16-2',3,'image/jpeg',9803,'products/16-2.jpg','[]','2025-12-26 09:38:22','2025-12-26 09:38:22',NULL,'public'),(46,0,'16-3','16-3',3,'image/jpeg',9803,'products/16-3.jpg','[]','2025-12-26 09:38:22','2025-12-26 09:38:22',NULL,'public'),(47,0,'16-4','16-4',3,'image/jpeg',9803,'products/16-4.jpg','[]','2025-12-26 09:38:23','2025-12-26 09:38:23',NULL,'public'),(48,0,'17-1','17-1',3,'image/jpeg',9803,'products/17-1.jpg','[]','2025-12-26 09:38:23','2025-12-26 09:38:23',NULL,'public'),(49,0,'17-2','17-2',3,'image/jpeg',9803,'products/17-2.jpg','[]','2025-12-26 09:38:23','2025-12-26 09:38:23',NULL,'public'),(50,0,'17-3','17-3',3,'image/jpeg',9803,'products/17-3.jpg','[]','2025-12-26 09:38:23','2025-12-26 09:38:23',NULL,'public'),(51,0,'17-4','17-4',3,'image/jpeg',9803,'products/17-4.jpg','[]','2025-12-26 09:38:23','2025-12-26 09:38:23',NULL,'public'),(52,0,'17-5','17-5',3,'image/jpeg',9803,'products/17-5.jpg','[]','2025-12-26 09:38:23','2025-12-26 09:38:23',NULL,'public'),(53,0,'18-1','18-1',3,'image/jpeg',9803,'products/18-1.jpg','[]','2025-12-26 09:38:23','2025-12-26 09:38:23',NULL,'public'),(54,0,'18-2','18-2',3,'image/jpeg',9803,'products/18-2.jpg','[]','2025-12-26 09:38:23','2025-12-26 09:38:23',NULL,'public'),(55,0,'18-3','18-3',3,'image/jpeg',9803,'products/18-3.jpg','[]','2025-12-26 09:38:23','2025-12-26 09:38:23',NULL,'public'),(56,0,'18-4','18-4',3,'image/jpeg',9803,'products/18-4.jpg','[]','2025-12-26 09:38:23','2025-12-26 09:38:23',NULL,'public'),(57,0,'19-1','19-1',3,'image/jpeg',9803,'products/19-1.jpg','[]','2025-12-26 09:38:23','2025-12-26 09:38:23',NULL,'public'),(58,0,'19-2','19-2',3,'image/jpeg',9803,'products/19-2.jpg','[]','2025-12-26 09:38:24','2025-12-26 09:38:24',NULL,'public'),(59,0,'19-3','19-3',3,'image/jpeg',9803,'products/19-3.jpg','[]','2025-12-26 09:38:24','2025-12-26 09:38:24',NULL,'public'),(60,0,'19-4','19-4',3,'image/jpeg',9803,'products/19-4.jpg','[]','2025-12-26 09:38:24','2025-12-26 09:38:24',NULL,'public'),(61,0,'2-1','2-1',3,'image/jpeg',9803,'products/2-1.jpg','[]','2025-12-26 09:38:24','2025-12-26 09:38:24',NULL,'public'),(62,0,'2-2','2-2',3,'image/jpeg',9803,'products/2-2.jpg','[]','2025-12-26 09:38:24','2025-12-26 09:38:24',NULL,'public'),(63,0,'2-3','2-3',3,'image/jpeg',9803,'products/2-3.jpg','[]','2025-12-26 09:38:24','2025-12-26 09:38:24',NULL,'public'),(64,0,'2-4','2-4',3,'image/jpeg',9803,'products/2-4.jpg','[]','2025-12-26 09:38:24','2025-12-26 09:38:24',NULL,'public'),(65,0,'20-1','20-1',3,'image/jpeg',9803,'products/20-1.jpg','[]','2025-12-26 09:38:24','2025-12-26 09:38:24',NULL,'public'),(66,0,'20-2','20-2',3,'image/jpeg',9803,'products/20-2.jpg','[]','2025-12-26 09:38:24','2025-12-26 09:38:24',NULL,'public'),(67,0,'20-3','20-3',3,'image/jpeg',9803,'products/20-3.jpg','[]','2025-12-26 09:38:24','2025-12-26 09:38:24',NULL,'public'),(68,0,'20-4','20-4',3,'image/jpeg',9803,'products/20-4.jpg','[]','2025-12-26 09:38:24','2025-12-26 09:38:24',NULL,'public'),(69,0,'21-1','21-1',3,'image/jpeg',9803,'products/21-1.jpg','[]','2025-12-26 09:38:25','2025-12-26 09:38:25',NULL,'public'),(70,0,'21-2','21-2',3,'image/jpeg',9803,'products/21-2.jpg','[]','2025-12-26 09:38:25','2025-12-26 09:38:25',NULL,'public'),(71,0,'21-3','21-3',3,'image/jpeg',9803,'products/21-3.jpg','[]','2025-12-26 09:38:25','2025-12-26 09:38:25',NULL,'public'),(72,0,'21-4','21-4',3,'image/jpeg',9803,'products/21-4.jpg','[]','2025-12-26 09:38:25','2025-12-26 09:38:25',NULL,'public'),(73,0,'22-1','22-1',3,'image/jpeg',9803,'products/22-1.jpg','[]','2025-12-26 09:38:25','2025-12-26 09:38:25',NULL,'public'),(74,0,'22-2','22-2',3,'image/jpeg',9803,'products/22-2.jpg','[]','2025-12-26 09:38:25','2025-12-26 09:38:25',NULL,'public'),(75,0,'22-3','22-3',3,'image/jpeg',9803,'products/22-3.jpg','[]','2025-12-26 09:38:25','2025-12-26 09:38:25',NULL,'public'),(76,0,'22-4','22-4',3,'image/jpeg',9803,'products/22-4.jpg','[]','2025-12-26 09:38:25','2025-12-26 09:38:25',NULL,'public'),(77,0,'23-1','23-1',3,'image/jpeg',9803,'products/23-1.jpg','[]','2025-12-26 09:38:25','2025-12-26 09:38:25',NULL,'public'),(78,0,'23-2','23-2',3,'image/jpeg',9803,'products/23-2.jpg','[]','2025-12-26 09:38:25','2025-12-26 09:38:25',NULL,'public'),(79,0,'23-3','23-3',3,'image/jpeg',9803,'products/23-3.jpg','[]','2025-12-26 09:38:25','2025-12-26 09:38:25',NULL,'public'),(80,0,'23-4','23-4',3,'image/jpeg',9803,'products/23-4.jpg','[]','2025-12-26 09:38:25','2025-12-26 09:38:25',NULL,'public'),(81,0,'24-1','24-1',3,'image/jpeg',9803,'products/24-1.jpg','[]','2025-12-26 09:38:26','2025-12-26 09:38:26',NULL,'public'),(82,0,'24-2','24-2',3,'image/jpeg',9803,'products/24-2.jpg','[]','2025-12-26 09:38:26','2025-12-26 09:38:26',NULL,'public'),(83,0,'24-3','24-3',3,'image/jpeg',9803,'products/24-3.jpg','[]','2025-12-26 09:38:26','2025-12-26 09:38:26',NULL,'public'),(84,0,'24-4','24-4',3,'image/jpeg',9803,'products/24-4.jpg','[]','2025-12-26 09:38:26','2025-12-26 09:38:26',NULL,'public'),(85,0,'25-1','25-1',3,'image/jpeg',9803,'products/25-1.jpg','[]','2025-12-26 09:38:26','2025-12-26 09:38:26',NULL,'public'),(86,0,'25-2','25-2',3,'image/jpeg',9803,'products/25-2.jpg','[]','2025-12-26 09:38:26','2025-12-26 09:38:26',NULL,'public'),(87,0,'25-3','25-3',3,'image/jpeg',9803,'products/25-3.jpg','[]','2025-12-26 09:38:26','2025-12-26 09:38:26',NULL,'public'),(88,0,'25-4','25-4',3,'image/jpeg',9803,'products/25-4.jpg','[]','2025-12-26 09:38:26','2025-12-26 09:38:26',NULL,'public'),(89,0,'26-1','26-1',3,'image/jpeg',9803,'products/26-1.jpg','[]','2025-12-26 09:38:26','2025-12-26 09:38:26',NULL,'public'),(90,0,'26-2','26-2',3,'image/jpeg',9803,'products/26-2.jpg','[]','2025-12-26 09:38:26','2025-12-26 09:38:26',NULL,'public'),(91,0,'26-3','26-3',3,'image/jpeg',9803,'products/26-3.jpg','[]','2025-12-26 09:38:26','2025-12-26 09:38:26',NULL,'public'),(92,0,'26-4','26-4',3,'image/jpeg',9803,'products/26-4.jpg','[]','2025-12-26 09:38:26','2025-12-26 09:38:26',NULL,'public'),(93,0,'27-1','27-1',3,'image/jpeg',9803,'products/27-1.jpg','[]','2025-12-26 09:38:26','2025-12-26 09:38:26',NULL,'public'),(94,0,'27-2','27-2',3,'image/jpeg',9803,'products/27-2.jpg','[]','2025-12-26 09:38:26','2025-12-26 09:38:26',NULL,'public'),(95,0,'27-3','27-3',3,'image/jpeg',9803,'products/27-3.jpg','[]','2025-12-26 09:38:27','2025-12-26 09:38:27',NULL,'public'),(96,0,'27-4','27-4',3,'image/jpeg',9803,'products/27-4.jpg','[]','2025-12-26 09:38:27','2025-12-26 09:38:27',NULL,'public'),(97,0,'28-1','28-1',3,'image/jpeg',9803,'products/28-1.jpg','[]','2025-12-26 09:38:27','2025-12-26 09:38:27',NULL,'public'),(98,0,'28-2','28-2',3,'image/jpeg',9803,'products/28-2.jpg','[]','2025-12-26 09:38:27','2025-12-26 09:38:27',NULL,'public'),(99,0,'28-3','28-3',3,'image/jpeg',9803,'products/28-3.jpg','[]','2025-12-26 09:38:27','2025-12-26 09:38:27',NULL,'public'),(100,0,'28-4','28-4',3,'image/jpeg',9803,'products/28-4.jpg','[]','2025-12-26 09:38:27','2025-12-26 09:38:27',NULL,'public'),(101,0,'29-1','29-1',3,'image/jpeg',9803,'products/29-1.jpg','[]','2025-12-26 09:38:27','2025-12-26 09:38:27',NULL,'public'),(102,0,'29-2','29-2',3,'image/jpeg',9803,'products/29-2.jpg','[]','2025-12-26 09:38:27','2025-12-26 09:38:27',NULL,'public'),(103,0,'29-3','29-3',3,'image/jpeg',9803,'products/29-3.jpg','[]','2025-12-26 09:38:27','2025-12-26 09:38:27',NULL,'public'),(104,0,'3-1','3-1',3,'image/jpeg',9803,'products/3-1.jpg','[]','2025-12-26 09:38:27','2025-12-26 09:38:27',NULL,'public'),(105,0,'3-2','3-2',3,'image/jpeg',9803,'products/3-2.jpg','[]','2025-12-26 09:38:27','2025-12-26 09:38:27',NULL,'public'),(106,0,'3-3','3-3',3,'image/jpeg',9803,'products/3-3.jpg','[]','2025-12-26 09:38:27','2025-12-26 09:38:27',NULL,'public'),(107,0,'3-4','3-4',3,'image/jpeg',9803,'products/3-4.jpg','[]','2025-12-26 09:38:27','2025-12-26 09:38:27',NULL,'public'),(108,0,'30-1','30-1',3,'image/jpeg',9803,'products/30-1.jpg','[]','2025-12-26 09:38:27','2025-12-26 09:38:27',NULL,'public'),(109,0,'30-2','30-2',3,'image/jpeg',9803,'products/30-2.jpg','[]','2025-12-26 09:38:28','2025-12-26 09:38:28',NULL,'public'),(110,0,'30-3','30-3',3,'image/jpeg',9803,'products/30-3.jpg','[]','2025-12-26 09:38:28','2025-12-26 09:38:28',NULL,'public'),(111,0,'30-4','30-4',3,'image/jpeg',9803,'products/30-4.jpg','[]','2025-12-26 09:38:28','2025-12-26 09:38:28',NULL,'public'),(112,0,'31-1','31-1',3,'image/jpeg',9803,'products/31-1.jpg','[]','2025-12-26 09:38:28','2025-12-26 09:38:28',NULL,'public'),(113,0,'31-2','31-2',3,'image/jpeg',9803,'products/31-2.jpg','[]','2025-12-26 09:38:28','2025-12-26 09:38:28',NULL,'public'),(114,0,'31-3','31-3',3,'image/jpeg',9803,'products/31-3.jpg','[]','2025-12-26 09:38:28','2025-12-26 09:38:28',NULL,'public'),(115,0,'31-4','31-4',3,'image/jpeg',9803,'products/31-4.jpg','[]','2025-12-26 09:38:28','2025-12-26 09:38:28',NULL,'public'),(116,0,'32-1','32-1',3,'image/jpeg',9803,'products/32-1.jpg','[]','2025-12-26 09:38:28','2025-12-26 09:38:28',NULL,'public'),(117,0,'32-2','32-2',3,'image/jpeg',9803,'products/32-2.jpg','[]','2025-12-26 09:38:28','2025-12-26 09:38:28',NULL,'public'),(118,0,'32-3','32-3',3,'image/jpeg',9803,'products/32-3.jpg','[]','2025-12-26 09:38:28','2025-12-26 09:38:28',NULL,'public'),(119,0,'32-4','32-4',3,'image/jpeg',9803,'products/32-4.jpg','[]','2025-12-26 09:38:28','2025-12-26 09:38:28',NULL,'public'),(120,0,'33-1','33-1',3,'image/jpeg',9803,'products/33-1.jpg','[]','2025-12-26 09:38:28','2025-12-26 09:38:28',NULL,'public'),(121,0,'33-2','33-2',3,'image/jpeg',9803,'products/33-2.jpg','[]','2025-12-26 09:38:28','2025-12-26 09:38:28',NULL,'public'),(122,0,'33-3','33-3',3,'image/jpeg',9803,'products/33-3.jpg','[]','2025-12-26 09:38:28','2025-12-26 09:38:28',NULL,'public'),(123,0,'33-4','33-4',3,'image/jpeg',9803,'products/33-4.jpg','[]','2025-12-26 09:38:29','2025-12-26 09:38:29',NULL,'public'),(124,0,'34-1','34-1',3,'image/jpeg',9803,'products/34-1.jpg','[]','2025-12-26 09:38:29','2025-12-26 09:38:29',NULL,'public'),(125,0,'34-2','34-2',3,'image/jpeg',9803,'products/34-2.jpg','[]','2025-12-26 09:38:29','2025-12-26 09:38:29',NULL,'public'),(126,0,'34-3','34-3',3,'image/jpeg',9803,'products/34-3.jpg','[]','2025-12-26 09:38:29','2025-12-26 09:38:29',NULL,'public'),(127,0,'34-4','34-4',3,'image/jpeg',9803,'products/34-4.jpg','[]','2025-12-26 09:38:29','2025-12-26 09:38:29',NULL,'public'),(128,0,'35-1','35-1',3,'image/jpeg',9803,'products/35-1.jpg','[]','2025-12-26 09:38:29','2025-12-26 09:38:29',NULL,'public'),(129,0,'35-2','35-2',3,'image/jpeg',9803,'products/35-2.jpg','[]','2025-12-26 09:38:29','2025-12-26 09:38:29',NULL,'public'),(130,0,'35-3','35-3',3,'image/jpeg',9803,'products/35-3.jpg','[]','2025-12-26 09:38:29','2025-12-26 09:38:29',NULL,'public'),(131,0,'35-4','35-4',3,'image/jpeg',9803,'products/35-4.jpg','[]','2025-12-26 09:38:29','2025-12-26 09:38:29',NULL,'public'),(132,0,'36-1','36-1',3,'image/jpeg',9803,'products/36-1.jpg','[]','2025-12-26 09:38:29','2025-12-26 09:38:29',NULL,'public'),(133,0,'36-2','36-2',3,'image/jpeg',9803,'products/36-2.jpg','[]','2025-12-26 09:38:29','2025-12-26 09:38:29',NULL,'public'),(134,0,'36-3','36-3',3,'image/jpeg',9803,'products/36-3.jpg','[]','2025-12-26 09:38:29','2025-12-26 09:38:29',NULL,'public'),(135,0,'37-1','37-1',3,'image/jpeg',9803,'products/37-1.jpg','[]','2025-12-26 09:38:29','2025-12-26 09:38:29',NULL,'public'),(136,0,'37-2','37-2',3,'image/jpeg',9803,'products/37-2.jpg','[]','2025-12-26 09:38:29','2025-12-26 09:38:29',NULL,'public'),(137,0,'37-3','37-3',3,'image/jpeg',9803,'products/37-3.jpg','[]','2025-12-26 09:38:30','2025-12-26 09:38:30',NULL,'public'),(138,0,'38-1','38-1',3,'image/jpeg',9803,'products/38-1.jpg','[]','2025-12-26 09:38:30','2025-12-26 09:38:30',NULL,'public'),(139,0,'38-2','38-2',3,'image/jpeg',9803,'products/38-2.jpg','[]','2025-12-26 09:38:30','2025-12-26 09:38:30',NULL,'public'),(140,0,'38-3','38-3',3,'image/jpeg',9803,'products/38-3.jpg','[]','2025-12-26 09:38:30','2025-12-26 09:38:30',NULL,'public'),(141,0,'38-4','38-4',3,'image/jpeg',9803,'products/38-4.jpg','[]','2025-12-26 09:38:30','2025-12-26 09:38:30',NULL,'public'),(142,0,'39-1','39-1',3,'image/jpeg',9803,'products/39-1.jpg','[]','2025-12-26 09:38:30','2025-12-26 09:38:30',NULL,'public'),(143,0,'39-2','39-2',3,'image/jpeg',9803,'products/39-2.jpg','[]','2025-12-26 09:38:30','2025-12-26 09:38:30',NULL,'public'),(144,0,'39-3','39-3',3,'image/jpeg',9803,'products/39-3.jpg','[]','2025-12-26 09:38:30','2025-12-26 09:38:30',NULL,'public'),(145,0,'39-4','39-4',3,'image/jpeg',9803,'products/39-4.jpg','[]','2025-12-26 09:38:30','2025-12-26 09:38:30',NULL,'public'),(146,0,'4-1','4-1',3,'image/jpeg',9803,'products/4-1.jpg','[]','2025-12-26 09:38:30','2025-12-26 09:38:30',NULL,'public'),(147,0,'4-2','4-2',3,'image/jpeg',9803,'products/4-2.jpg','[]','2025-12-26 09:38:30','2025-12-26 09:38:30',NULL,'public'),(148,0,'4-3','4-3',3,'image/jpeg',9803,'products/4-3.jpg','[]','2025-12-26 09:38:30','2025-12-26 09:38:30',NULL,'public'),(149,0,'4-4','4-4',3,'image/jpeg',9803,'products/4-4.jpg','[]','2025-12-26 09:38:30','2025-12-26 09:38:30',NULL,'public'),(150,0,'40-1','40-1',3,'image/jpeg',9803,'products/40-1.jpg','[]','2025-12-26 09:38:31','2025-12-26 09:38:31',NULL,'public'),(151,0,'40-2','40-2',3,'image/jpeg',9803,'products/40-2.jpg','[]','2025-12-26 09:38:31','2025-12-26 09:38:31',NULL,'public'),(152,0,'40-3','40-3',3,'image/jpeg',9803,'products/40-3.jpg','[]','2025-12-26 09:38:31','2025-12-26 09:38:31',NULL,'public'),(153,0,'40-4','40-4',3,'image/jpeg',9803,'products/40-4.jpg','[]','2025-12-26 09:38:31','2025-12-26 09:38:31',NULL,'public'),(154,0,'41-1','41-1',3,'image/jpeg',9803,'products/41-1.jpg','[]','2025-12-26 09:38:31','2025-12-26 09:38:31',NULL,'public'),(155,0,'41-2','41-2',3,'image/jpeg',9803,'products/41-2.jpg','[]','2025-12-26 09:38:31','2025-12-26 09:38:31',NULL,'public'),(156,0,'41-3','41-3',3,'image/jpeg',9803,'products/41-3.jpg','[]','2025-12-26 09:38:31','2025-12-26 09:38:31',NULL,'public'),(157,0,'41-4','41-4',3,'image/jpeg',9803,'products/41-4.jpg','[]','2025-12-26 09:38:31','2025-12-26 09:38:31',NULL,'public'),(158,0,'42-1','42-1',3,'image/jpeg',9803,'products/42-1.jpg','[]','2025-12-26 09:38:31','2025-12-26 09:38:31',NULL,'public'),(159,0,'42-2','42-2',3,'image/jpeg',9803,'products/42-2.jpg','[]','2025-12-26 09:38:31','2025-12-26 09:38:31',NULL,'public'),(160,0,'42-3','42-3',3,'image/jpeg',9803,'products/42-3.jpg','[]','2025-12-26 09:38:31','2025-12-26 09:38:31',NULL,'public'),(161,0,'43-1','43-1',3,'image/jpeg',9803,'products/43-1.jpg','[]','2025-12-26 09:38:31','2025-12-26 09:38:31',NULL,'public'),(162,0,'43-2','43-2',3,'image/jpeg',9803,'products/43-2.jpg','[]','2025-12-26 09:38:31','2025-12-26 09:38:31',NULL,'public'),(163,0,'43-3','43-3',3,'image/jpeg',9803,'products/43-3.jpg','[]','2025-12-26 09:38:31','2025-12-26 09:38:31',NULL,'public'),(164,0,'44-1','44-1',3,'image/jpeg',9803,'products/44-1.jpg','[]','2025-12-26 09:38:32','2025-12-26 09:38:32',NULL,'public'),(165,0,'44-2','44-2',3,'image/jpeg',9803,'products/44-2.jpg','[]','2025-12-26 09:38:32','2025-12-26 09:38:32',NULL,'public'),(166,0,'44-3','44-3',3,'image/jpeg',9803,'products/44-3.jpg','[]','2025-12-26 09:38:32','2025-12-26 09:38:32',NULL,'public'),(167,0,'45-1','45-1',3,'image/jpeg',9803,'products/45-1.jpg','[]','2025-12-26 09:38:32','2025-12-26 09:38:32',NULL,'public'),(168,0,'45-2','45-2',3,'image/jpeg',9803,'products/45-2.jpg','[]','2025-12-26 09:38:32','2025-12-26 09:38:32',NULL,'public'),(169,0,'45-3','45-3',3,'image/jpeg',9803,'products/45-3.jpg','[]','2025-12-26 09:38:32','2025-12-26 09:38:32',NULL,'public'),(170,0,'45-4','45-4',3,'image/jpeg',9803,'products/45-4.jpg','[]','2025-12-26 09:38:32','2025-12-26 09:38:32',NULL,'public'),(171,0,'46-1','46-1',3,'image/jpeg',9803,'products/46-1.jpg','[]','2025-12-26 09:38:32','2025-12-26 09:38:32',NULL,'public'),(172,0,'46-2','46-2',3,'image/jpeg',9803,'products/46-2.jpg','[]','2025-12-26 09:38:32','2025-12-26 09:38:32',NULL,'public'),(173,0,'46-3','46-3',3,'image/jpeg',9803,'products/46-3.jpg','[]','2025-12-26 09:38:32','2025-12-26 09:38:32',NULL,'public'),(174,0,'46-4','46-4',3,'image/jpeg',9803,'products/46-4.jpg','[]','2025-12-26 09:38:32','2025-12-26 09:38:32',NULL,'public'),(175,0,'47-1','47-1',3,'image/jpeg',9803,'products/47-1.jpg','[]','2025-12-26 09:38:32','2025-12-26 09:38:32',NULL,'public'),(176,0,'47-2','47-2',3,'image/jpeg',9803,'products/47-2.jpg','[]','2025-12-26 09:38:32','2025-12-26 09:38:32',NULL,'public'),(177,0,'47-3','47-3',3,'image/jpeg',9803,'products/47-3.jpg','[]','2025-12-26 09:38:33','2025-12-26 09:38:33',NULL,'public'),(178,0,'48-1','48-1',3,'image/jpeg',9803,'products/48-1.jpg','[]','2025-12-26 09:38:33','2025-12-26 09:38:33',NULL,'public'),(179,0,'48-2','48-2',3,'image/jpeg',9803,'products/48-2.jpg','[]','2025-12-26 09:38:33','2025-12-26 09:38:33',NULL,'public'),(180,0,'48-3','48-3',3,'image/jpeg',9803,'products/48-3.jpg','[]','2025-12-26 09:38:33','2025-12-26 09:38:33',NULL,'public'),(181,0,'48-4','48-4',3,'image/jpeg',9803,'products/48-4.jpg','[]','2025-12-26 09:38:33','2025-12-26 09:38:33',NULL,'public'),(182,0,'49-1','49-1',3,'image/jpeg',9803,'products/49-1.jpg','[]','2025-12-26 09:38:33','2025-12-26 09:38:33',NULL,'public'),(183,0,'49-2','49-2',3,'image/jpeg',9803,'products/49-2.jpg','[]','2025-12-26 09:38:33','2025-12-26 09:38:33',NULL,'public'),(184,0,'49-3','49-3',3,'image/jpeg',9803,'products/49-3.jpg','[]','2025-12-26 09:38:33','2025-12-26 09:38:33',NULL,'public'),(185,0,'49-4','49-4',3,'image/jpeg',9803,'products/49-4.jpg','[]','2025-12-26 09:38:33','2025-12-26 09:38:33',NULL,'public'),(186,0,'5-1','5-1',3,'image/jpeg',9803,'products/5-1.jpg','[]','2025-12-26 09:38:33','2025-12-26 09:38:33',NULL,'public'),(187,0,'5-2','5-2',3,'image/jpeg',9803,'products/5-2.jpg','[]','2025-12-26 09:38:33','2025-12-26 09:38:33',NULL,'public'),(188,0,'5-3','5-3',3,'image/jpeg',9803,'products/5-3.jpg','[]','2025-12-26 09:38:33','2025-12-26 09:38:33',NULL,'public'),(189,0,'5-4','5-4',3,'image/jpeg',9803,'products/5-4.jpg','[]','2025-12-26 09:38:33','2025-12-26 09:38:33',NULL,'public'),(190,0,'50-1','50-1',3,'image/jpeg',9803,'products/50-1.jpg','[]','2025-12-26 09:38:33','2025-12-26 09:38:33',NULL,'public'),(191,0,'50-2','50-2',3,'image/jpeg',9803,'products/50-2.jpg','[]','2025-12-26 09:38:33','2025-12-26 09:38:33',NULL,'public'),(192,0,'50-3','50-3',3,'image/jpeg',9803,'products/50-3.jpg','[]','2025-12-26 09:38:34','2025-12-26 09:38:34',NULL,'public'),(193,0,'50-4','50-4',3,'image/jpeg',9803,'products/50-4.jpg','[]','2025-12-26 09:38:34','2025-12-26 09:38:34',NULL,'public'),(194,0,'51-1','51-1',3,'image/jpeg',9803,'products/51-1.jpg','[]','2025-12-26 09:38:34','2025-12-26 09:38:34',NULL,'public'),(195,0,'51-2','51-2',3,'image/jpeg',9803,'products/51-2.jpg','[]','2025-12-26 09:38:34','2025-12-26 09:38:34',NULL,'public'),(196,0,'51-3','51-3',3,'image/jpeg',9803,'products/51-3.jpg','[]','2025-12-26 09:38:34','2025-12-26 09:38:34',NULL,'public'),(197,0,'51-4','51-4',3,'image/jpeg',9803,'products/51-4.jpg','[]','2025-12-26 09:38:34','2025-12-26 09:38:34',NULL,'public'),(198,0,'52-1','52-1',3,'image/jpeg',9803,'products/52-1.jpg','[]','2025-12-26 09:38:34','2025-12-26 09:38:34',NULL,'public'),(199,0,'52-2','52-2',3,'image/jpeg',9803,'products/52-2.jpg','[]','2025-12-26 09:38:34','2025-12-26 09:38:34',NULL,'public'),(200,0,'52-3','52-3',3,'image/jpeg',9803,'products/52-3.jpg','[]','2025-12-26 09:38:34','2025-12-26 09:38:34',NULL,'public'),(201,0,'53-1','53-1',3,'image/jpeg',9803,'products/53-1.jpg','[]','2025-12-26 09:38:34','2025-12-26 09:38:34',NULL,'public'),(202,0,'53-2','53-2',3,'image/jpeg',9803,'products/53-2.jpg','[]','2025-12-26 09:38:34','2025-12-26 09:38:34',NULL,'public'),(203,0,'53-3','53-3',3,'image/jpeg',9803,'products/53-3.jpg','[]','2025-12-26 09:38:34','2025-12-26 09:38:34',NULL,'public'),(204,0,'53-4','53-4',3,'image/jpeg',9803,'products/53-4.jpg','[]','2025-12-26 09:38:35','2025-12-26 09:38:35',NULL,'public'),(205,0,'54-1','54-1',3,'image/jpeg',9803,'products/54-1.jpg','[]','2025-12-26 09:38:35','2025-12-26 09:38:35',NULL,'public'),(206,0,'54-2','54-2',3,'image/jpeg',9803,'products/54-2.jpg','[]','2025-12-26 09:38:35','2025-12-26 09:38:35',NULL,'public'),(207,0,'54-3','54-3',3,'image/jpeg',9803,'products/54-3.jpg','[]','2025-12-26 09:38:35','2025-12-26 09:38:35',NULL,'public'),(208,0,'6-1','6-1',3,'image/jpeg',9803,'products/6-1.jpg','[]','2025-12-26 09:38:35','2025-12-26 09:38:35',NULL,'public'),(209,0,'6-2','6-2',3,'image/jpeg',9803,'products/6-2.jpg','[]','2025-12-26 09:38:35','2025-12-26 09:38:35',NULL,'public'),(210,0,'6-3','6-3',3,'image/jpeg',9803,'products/6-3.jpg','[]','2025-12-26 09:38:35','2025-12-26 09:38:35',NULL,'public'),(211,0,'6-4','6-4',3,'image/jpeg',9803,'products/6-4.jpg','[]','2025-12-26 09:38:35','2025-12-26 09:38:35',NULL,'public'),(212,0,'7-1','7-1',3,'image/jpeg',9803,'products/7-1.jpg','[]','2025-12-26 09:38:35','2025-12-26 09:38:35',NULL,'public'),(213,0,'7-2','7-2',3,'image/jpeg',9803,'products/7-2.jpg','[]','2025-12-26 09:38:35','2025-12-26 09:38:35',NULL,'public'),(214,0,'7-3','7-3',3,'image/jpeg',9803,'products/7-3.jpg','[]','2025-12-26 09:38:35','2025-12-26 09:38:35',NULL,'public'),(215,0,'8-1','8-1',3,'image/jpeg',9803,'products/8-1.jpg','[]','2025-12-26 09:38:35','2025-12-26 09:38:35',NULL,'public'),(216,0,'8-2','8-2',3,'image/jpeg',9803,'products/8-2.jpg','[]','2025-12-26 09:38:36','2025-12-26 09:38:36',NULL,'public'),(217,0,'8-3','8-3',3,'image/jpeg',9803,'products/8-3.jpg','[]','2025-12-26 09:38:36','2025-12-26 09:38:36',NULL,'public'),(218,0,'8-4','8-4',3,'image/jpeg',9803,'products/8-4.jpg','[]','2025-12-26 09:38:36','2025-12-26 09:38:36',NULL,'public'),(219,0,'9-1','9-1',3,'image/jpeg',9803,'products/9-1.jpg','[]','2025-12-26 09:38:36','2025-12-26 09:38:36',NULL,'public'),(220,0,'9-2','9-2',3,'image/jpeg',9803,'products/9-2.jpg','[]','2025-12-26 09:38:36','2025-12-26 09:38:36',NULL,'public'),(221,0,'9-3','9-3',3,'image/jpeg',9803,'products/9-3.jpg','[]','2025-12-26 09:38:36','2025-12-26 09:38:36',NULL,'public'),(222,0,'1','1',4,'image/jpeg',9803,'customers/1.jpg','[]','2025-12-26 09:38:44','2025-12-26 09:38:44',NULL,'public'),(223,0,'10','10',4,'image/jpeg',9803,'customers/10.jpg','[]','2025-12-26 09:38:44','2025-12-26 09:38:44',NULL,'public'),(224,0,'2','2',4,'image/jpeg',9803,'customers/2.jpg','[]','2025-12-26 09:38:44','2025-12-26 09:38:44',NULL,'public'),(225,0,'3','3',4,'image/jpeg',9803,'customers/3.jpg','[]','2025-12-26 09:38:44','2025-12-26 09:38:44',NULL,'public'),(226,0,'4','4',4,'image/jpeg',9803,'customers/4.jpg','[]','2025-12-26 09:38:44','2025-12-26 09:38:44',NULL,'public'),(227,0,'5','5',4,'image/jpeg',9803,'customers/5.jpg','[]','2025-12-26 09:38:45','2025-12-26 09:38:45',NULL,'public'),(228,0,'6','6',4,'image/jpeg',9803,'customers/6.jpg','[]','2025-12-26 09:38:45','2025-12-26 09:38:45',NULL,'public'),(229,0,'7','7',4,'image/jpeg',9803,'customers/7.jpg','[]','2025-12-26 09:38:45','2025-12-26 09:38:45',NULL,'public'),(230,0,'8','8',4,'image/jpeg',9803,'customers/8.jpg','[]','2025-12-26 09:38:45','2025-12-26 09:38:45',NULL,'public'),(231,0,'9','9',4,'image/jpeg',9803,'customers/9.jpg','[]','2025-12-26 09:38:45','2025-12-26 09:38:45',NULL,'public'),(232,0,'1','1',5,'image/jpeg',9803,'news/1.jpg','[]','2025-12-26 09:38:50','2025-12-26 09:38:50',NULL,'public'),(233,0,'10','10',5,'image/jpeg',9803,'news/10.jpg','[]','2025-12-26 09:38:50','2025-12-26 09:38:50',NULL,'public'),(234,0,'11','11',5,'image/jpeg',9803,'news/11.jpg','[]','2025-12-26 09:38:50','2025-12-26 09:38:50',NULL,'public'),(235,0,'2','2',5,'image/jpeg',9803,'news/2.jpg','[]','2025-12-26 09:38:50','2025-12-26 09:38:50',NULL,'public'),(236,0,'3','3',5,'image/jpeg',9803,'news/3.jpg','[]','2025-12-26 09:38:50','2025-12-26 09:38:50',NULL,'public'),(237,0,'4','4',5,'image/jpeg',9803,'news/4.jpg','[]','2025-12-26 09:38:50','2025-12-26 09:38:50',NULL,'public'),(238,0,'5','5',5,'image/jpeg',9803,'news/5.jpg','[]','2025-12-26 09:38:51','2025-12-26 09:38:51',NULL,'public'),(239,0,'6','6',5,'image/jpeg',9803,'news/6.jpg','[]','2025-12-26 09:38:51','2025-12-26 09:38:51',NULL,'public'),(240,0,'7','7',5,'image/jpeg',9803,'news/7.jpg','[]','2025-12-26 09:38:51','2025-12-26 09:38:51',NULL,'public'),(241,0,'8','8',5,'image/jpeg',9803,'news/8.jpg','[]','2025-12-26 09:38:51','2025-12-26 09:38:51',NULL,'public'),(242,0,'9','9',5,'image/jpeg',9803,'news/9.jpg','[]','2025-12-26 09:38:51','2025-12-26 09:38:51',NULL,'public'),(243,0,'1-lg','1-lg',6,'image/jpeg',8828,'sliders/1-lg.jpg','[]','2025-12-26 09:38:51','2025-12-26 09:38:51',NULL,'public'),(244,0,'1-md','1-md',6,'image/jpeg',8828,'sliders/1-md.jpg','[]','2025-12-26 09:38:51','2025-12-26 09:38:51',NULL,'public'),(245,0,'1-sm','1-sm',6,'image/jpeg',8828,'sliders/1-sm.jpg','[]','2025-12-26 09:38:51','2025-12-26 09:38:51',NULL,'public'),(246,0,'2-lg','2-lg',6,'image/jpeg',8828,'sliders/2-lg.jpg','[]','2025-12-26 09:38:51','2025-12-26 09:38:51',NULL,'public'),(247,0,'2-md','2-md',6,'image/jpeg',8828,'sliders/2-md.jpg','[]','2025-12-26 09:38:51','2025-12-26 09:38:51',NULL,'public'),(248,0,'2-sm','2-sm',6,'image/jpeg',8828,'sliders/2-sm.jpg','[]','2025-12-26 09:38:51','2025-12-26 09:38:51',NULL,'public'),(249,0,'3-lg','3-lg',6,'image/jpeg',8828,'sliders/3-lg.jpg','[]','2025-12-26 09:38:52','2025-12-26 09:38:52',NULL,'public'),(250,0,'3-md','3-md',6,'image/jpeg',8828,'sliders/3-md.jpg','[]','2025-12-26 09:38:52','2025-12-26 09:38:52',NULL,'public'),(251,0,'3-sm','3-sm',6,'image/jpeg',8828,'sliders/3-sm.jpg','[]','2025-12-26 09:38:52','2025-12-26 09:38:52',NULL,'public'),(252,0,'1','1',7,'image/jpeg',3613,'promotion/1.jpg','[]','2025-12-26 09:38:52','2025-12-26 09:38:52',NULL,'public'),(253,0,'2','2',7,'image/jpeg',3613,'promotion/2.jpg','[]','2025-12-26 09:38:52','2025-12-26 09:38:52',NULL,'public'),(254,0,'3','3',7,'image/jpeg',5391,'promotion/3.jpg','[]','2025-12-26 09:38:52','2025-12-26 09:38:52',NULL,'public'),(255,0,'4','4',7,'image/jpeg',5391,'promotion/4.jpg','[]','2025-12-26 09:38:52','2025-12-26 09:38:52',NULL,'public'),(256,0,'5','5',7,'image/jpeg',5391,'promotion/5.jpg','[]','2025-12-26 09:38:52','2025-12-26 09:38:52',NULL,'public'),(257,0,'6','6',7,'image/jpeg',5391,'promotion/6.jpg','[]','2025-12-26 09:38:52','2025-12-26 09:38:52',NULL,'public'),(258,0,'7','7',7,'image/jpeg',5391,'promotion/7.jpg','[]','2025-12-26 09:38:52','2025-12-26 09:38:52',NULL,'public'),(259,0,'8','8',7,'image/jpeg',5391,'promotion/8.jpg','[]','2025-12-26 09:38:52','2025-12-26 09:38:52',NULL,'public'),(260,0,'9','9',7,'image/jpeg',5391,'promotion/9.jpg','[]','2025-12-26 09:38:52','2025-12-26 09:38:52',NULL,'public'),(261,0,'cod','cod',8,'image/png',12121,'payments/cod.png','[]','2025-12-26 09:38:52','2025-12-26 09:38:52',NULL,'public'),(262,0,'bank-transfer','bank-transfer',8,'image/png',29089,'payments/bank-transfer.png','[]','2025-12-26 09:38:52','2025-12-26 09:38:52',NULL,'public'),(263,0,'stripe','stripe',8,'image/webp',7516,'payments/stripe.webp','[]','2025-12-26 09:38:53','2025-12-26 09:38:53',NULL,'public'),(264,0,'paypal','paypal',8,'image/png',3001,'payments/paypal.png','[]','2025-12-26 09:38:53','2025-12-26 09:38:53',NULL,'public'),(265,0,'mollie','mollie',8,'image/png',8968,'payments/mollie.png','[]','2025-12-26 09:38:53','2025-12-26 09:38:53',NULL,'public'),(266,0,'paystack','paystack',8,'image/png',31015,'payments/paystack.png','[]','2025-12-26 09:38:53','2025-12-26 09:38:53',NULL,'public'),(267,0,'razorpay','razorpay',8,'image/png',8489,'payments/razorpay.png','[]','2025-12-26 09:38:53','2025-12-26 09:38:53',NULL,'public'),(268,0,'sslcommerz','sslcommerz',8,'image/png',3482,'payments/sslcommerz.png','[]','2025-12-26 09:38:53','2025-12-26 09:38:53',NULL,'public'),(269,0,'app','app',9,'image/png',8667,'general/app.png','[]','2025-12-26 09:38:55','2025-12-26 09:38:55',NULL,'public'),(270,0,'coming-soon','coming-soon',9,'image/jpeg',22253,'general/coming-soon.jpg','[]','2025-12-26 09:38:55','2025-12-26 09:38:55',NULL,'public'),(271,0,'favicon','favicon',9,'image/png',5047,'general/favicon.png','[]','2025-12-26 09:38:55','2025-12-26 09:38:55',NULL,'public'),(272,0,'logo-dark','logo-dark',9,'image/png',1562,'general/logo-dark.png','[]','2025-12-26 09:38:55','2025-12-26 09:38:55',NULL,'public'),(273,0,'logo-light','logo-light',9,'image/png',1529,'general/logo-light.png','[]','2025-12-26 09:38:55','2025-12-26 09:38:55',NULL,'public'),(274,0,'logo','logo',9,'image/png',1441,'general/logo.png','[]','2025-12-26 09:38:55','2025-12-26 09:38:55',NULL,'public'),(275,0,'newsletter','newsletter',9,'image/jpeg',9778,'general/newsletter.jpg','[]','2025-12-26 09:38:55','2025-12-26 09:38:55',NULL,'public'),(276,0,'payment-method-1','payment-method-1',9,'image/jpeg',1128,'general/payment-method-1.jpg','[]','2025-12-26 09:38:56','2025-12-26 09:38:56',NULL,'public'),(277,0,'payment-method-2','payment-method-2',9,'image/jpeg',1184,'general/payment-method-2.jpg','[]','2025-12-26 09:38:56','2025-12-26 09:38:56',NULL,'public'),(278,0,'payment-method-3','payment-method-3',9,'image/jpeg',1109,'general/payment-method-3.jpg','[]','2025-12-26 09:38:56','2025-12-26 09:38:56',NULL,'public'),(279,0,'payment-method-4','payment-method-4',9,'image/jpeg',944,'general/payment-method-4.jpg','[]','2025-12-26 09:38:56','2025-12-26 09:38:56',NULL,'public'),(280,0,'payment-method-5','payment-method-5',9,'image/jpeg',964,'general/payment-method-5.jpg','[]','2025-12-26 09:38:56','2025-12-26 09:38:56',NULL,'public'),(281,0,'placeholder','placeholder',9,'image/png',12344,'general/placeholder.png','[]','2025-12-26 09:38:56','2025-12-26 09:38:56',NULL,'public'),(282,0,'1','1',10,'image/png',9022,'stores/1.png','[]','2025-12-26 09:38:56','2025-12-26 09:38:56',NULL,'public'),(283,0,'10','10',10,'image/png',4384,'stores/10.png','[]','2025-12-26 09:38:56','2025-12-26 09:38:56',NULL,'public'),(284,0,'11','11',10,'image/png',4706,'stores/11.png','[]','2025-12-26 09:38:56','2025-12-26 09:38:56',NULL,'public'),(285,0,'12','12',10,'image/png',5075,'stores/12.png','[]','2025-12-26 09:38:56','2025-12-26 09:38:56',NULL,'public'),(286,0,'13','13',10,'image/png',3700,'stores/13.png','[]','2025-12-26 09:38:56','2025-12-26 09:38:56',NULL,'public'),(287,0,'14','14',10,'image/png',4239,'stores/14.png','[]','2025-12-26 09:38:56','2025-12-26 09:38:56',NULL,'public'),(288,0,'15','15',10,'image/png',5304,'stores/15.png','[]','2025-12-26 09:38:56','2025-12-26 09:38:56',NULL,'public'),(289,0,'16','16',10,'image/png',4796,'stores/16.png','[]','2025-12-26 09:38:56','2025-12-26 09:38:56',NULL,'public'),(290,0,'17','17',10,'image/png',4919,'stores/17.png','[]','2025-12-26 09:38:56','2025-12-26 09:38:56',NULL,'public'),(291,0,'2','2',10,'image/png',8598,'stores/2.png','[]','2025-12-26 09:38:56','2025-12-26 09:38:56',NULL,'public'),(292,0,'3','3',10,'image/png',7888,'stores/3.png','[]','2025-12-26 09:38:56','2025-12-26 09:38:56',NULL,'public'),(293,0,'4','4',10,'image/png',8393,'stores/4.png','[]','2025-12-26 09:38:56','2025-12-26 09:38:56',NULL,'public'),(294,0,'5','5',10,'image/png',10159,'stores/5.png','[]','2025-12-26 09:38:57','2025-12-26 09:38:57',NULL,'public'),(295,0,'6','6',10,'image/png',10312,'stores/6.png','[]','2025-12-26 09:38:57','2025-12-26 09:38:57',NULL,'public'),(296,0,'7','7',10,'image/png',3764,'stores/7.png','[]','2025-12-26 09:38:57','2025-12-26 09:38:57',NULL,'public'),(297,0,'8','8',10,'image/png',4237,'stores/8.png','[]','2025-12-26 09:38:57','2025-12-26 09:38:57',NULL,'public'),(298,0,'9','9',10,'image/png',4096,'stores/9.png','[]','2025-12-26 09:38:57','2025-12-26 09:38:57',NULL,'public');
/*!40000 ALTER TABLE `media_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_folders`
--

DROP TABLE IF EXISTS `media_folders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_folders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_folders_user_id_index` (`user_id`),
  KEY `media_folders_index` (`parent_id`,`user_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_folders`
--

LOCK TABLES `media_folders` WRITE;
/*!40000 ALTER TABLE `media_folders` DISABLE KEYS */;
INSERT INTO `media_folders` VALUES (1,0,'brands',NULL,'brands',0,'2025-12-26 09:38:19','2025-12-26 09:38:19',NULL),(2,0,'product-categories',NULL,'product-categories',0,'2025-12-26 09:38:19','2025-12-26 09:38:19',NULL),(3,0,'products',NULL,'products',0,'2025-12-26 09:38:20','2025-12-26 09:38:20',NULL),(4,0,'customers',NULL,'customers',0,'2025-12-26 09:38:43','2025-12-26 09:38:43',NULL),(5,0,'news',NULL,'news',0,'2025-12-26 09:38:50','2025-12-26 09:38:50',NULL),(6,0,'sliders',NULL,'sliders',0,'2025-12-26 09:38:51','2025-12-26 09:38:51',NULL),(7,0,'promotion',NULL,'promotion',0,'2025-12-26 09:38:52','2025-12-26 09:38:52',NULL),(8,0,'payments',NULL,'payments',0,'2025-12-26 09:38:52','2025-12-26 09:38:52',NULL),(9,0,'general',NULL,'general',0,'2025-12-26 09:38:55','2025-12-26 09:38:55',NULL),(10,0,'stores',NULL,'stores',0,'2025-12-26 09:38:56','2025-12-26 09:38:56',NULL);
/*!40000 ALTER TABLE `media_folders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_settings`
--

DROP TABLE IF EXISTS `media_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `media_id` bigint unsigned DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_settings`
--

LOCK TABLES `media_settings` WRITE;
/*!40000 ALTER TABLE `media_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `media_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_locations`
--

DROP TABLE IF EXISTS `menu_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_locations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` bigint unsigned NOT NULL,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_locations_menu_id_created_at_index` (`menu_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_locations`
--

LOCK TABLES `menu_locations` WRITE;
/*!40000 ALTER TABLE `menu_locations` DISABLE KEYS */;
INSERT INTO `menu_locations` VALUES (1,1,'main-menu','2025-12-26 09:38:55','2025-12-26 09:38:55');
/*!40000 ALTER TABLE `menu_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_nodes`
--

DROP TABLE IF EXISTS `menu_nodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_nodes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` bigint unsigned NOT NULL,
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  `reference_id` bigint unsigned DEFAULT NULL,
  `reference_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_font` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` tinyint unsigned NOT NULL DEFAULT '0',
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `css_class` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `has_child` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_nodes_menu_id_index` (`menu_id`),
  KEY `menu_nodes_parent_id_index` (`parent_id`),
  KEY `reference_id` (`reference_id`),
  KEY `reference_type` (`reference_type`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_nodes`
--

LOCK TABLES `menu_nodes` WRITE;
/*!40000 ALTER TABLE `menu_nodes` DISABLE KEYS */;
INSERT INTO `menu_nodes` VALUES (1,1,0,NULL,NULL,'/',NULL,0,'Home',NULL,'_self',0,'2025-12-26 09:38:55','2025-12-26 09:38:55'),(2,1,0,NULL,NULL,'#',NULL,1,'Pages',NULL,'_self',1,'2025-12-26 09:38:55','2025-12-26 09:38:55'),(3,1,2,2,'Botble\\Page\\Models\\Page','/about-us',NULL,0,'About us',NULL,'_self',0,'2025-12-26 09:38:55','2025-12-26 09:38:55'),(4,1,2,3,'Botble\\Page\\Models\\Page','/terms-of-use',NULL,1,'Terms Of Use',NULL,'_self',0,'2025-12-26 09:38:55','2025-12-26 09:38:55'),(5,1,2,4,'Botble\\Page\\Models\\Page','/terms-conditions',NULL,2,'Terms & Conditions',NULL,'_self',0,'2025-12-26 09:38:55','2025-12-26 09:38:55'),(6,1,2,5,'Botble\\Page\\Models\\Page','/refund-policy',NULL,3,'Refund Policy',NULL,'_self',0,'2025-12-26 09:38:55','2025-12-26 09:38:55'),(7,1,2,12,'Botble\\Page\\Models\\Page','/coming-soon',NULL,4,'Coming soon',NULL,'_self',0,'2025-12-26 09:38:55','2025-12-26 09:38:55'),(8,1,0,NULL,NULL,'/products',NULL,2,'Products',NULL,'_self',1,'2025-12-26 09:38:55','2025-12-26 09:38:55'),(9,1,8,NULL,NULL,'/products',NULL,0,'All products',NULL,'_self',0,'2025-12-26 09:38:55','2025-12-26 09:38:55'),(10,1,8,15,'Botble\\Ecommerce\\Models\\ProductCategory',NULL,NULL,1,'Products Of Category',NULL,'_self',0,'2025-12-26 09:38:55','2025-12-26 09:38:55'),(11,1,8,NULL,NULL,'/products/headphone-ultra-bass',NULL,2,'Product Single',NULL,'_self',0,'2025-12-26 09:38:55','2025-12-26 09:38:55'),(12,1,0,NULL,NULL,'/stores',NULL,3,'Stores',NULL,'_self',0,'2025-12-26 09:38:55','2025-12-26 09:38:55'),(13,1,0,6,'Botble\\Page\\Models\\Page',NULL,NULL,4,'Blog',NULL,'_self',0,'2025-12-26 09:38:55','2025-12-26 09:38:55'),(14,1,0,7,'Botble\\Page\\Models\\Page',NULL,NULL,5,'FAQs',NULL,'_self',0,'2025-12-26 09:38:55','2025-12-26 09:38:55'),(15,1,0,8,'Botble\\Page\\Models\\Page',NULL,NULL,6,'Contact',NULL,'_self',0,'2025-12-26 09:38:55','2025-12-26 09:38:55'),(16,2,0,3,'Botble\\Page\\Models\\Page',NULL,NULL,0,'Terms Of Use',NULL,'_self',0,'2025-12-26 09:38:55','2025-12-26 09:38:55'),(17,2,0,4,'Botble\\Page\\Models\\Page',NULL,NULL,1,'Terms & Conditions',NULL,'_self',0,'2025-12-26 09:38:55','2025-12-26 09:38:55'),(18,2,0,5,'Botble\\Page\\Models\\Page',NULL,NULL,2,'Refund Policy',NULL,'_self',0,'2025-12-26 09:38:55','2025-12-26 09:38:55'),(19,2,0,7,'Botble\\Page\\Models\\Page',NULL,NULL,3,'FAQs',NULL,'_self',0,'2025-12-26 09:38:55','2025-12-26 09:38:55'),(20,2,0,NULL,NULL,'/nothing',NULL,4,'404 Page',NULL,'_self',0,'2025-12-26 09:38:55','2025-12-26 09:38:55'),(21,3,0,2,'Botble\\Page\\Models\\Page',NULL,NULL,0,'About us',NULL,'_self',0,'2025-12-26 09:38:55','2025-12-26 09:38:55'),(22,3,0,10,'Botble\\Page\\Models\\Page',NULL,NULL,1,'Affiliate',NULL,'_self',0,'2025-12-26 09:38:55','2025-12-26 09:38:55'),(23,3,0,11,'Botble\\Page\\Models\\Page',NULL,NULL,2,'Career',NULL,'_self',0,'2025-12-26 09:38:55','2025-12-26 09:38:55'),(24,3,0,8,'Botble\\Page\\Models\\Page',NULL,NULL,3,'Contact us',NULL,'_self',0,'2025-12-26 09:38:55','2025-12-26 09:38:55'),(25,4,0,6,'Botble\\Page\\Models\\Page',NULL,NULL,0,'Our blog',NULL,'_self',0,'2025-12-26 09:38:55','2025-12-26 09:38:55'),(26,4,0,NULL,NULL,'/cart',NULL,1,'Cart',NULL,'_self',0,'2025-12-26 09:38:55','2025-12-26 09:38:55'),(27,4,0,NULL,NULL,'/customer/overview',NULL,2,'My account',NULL,'_self',0,'2025-12-26 09:38:55','2025-12-26 09:38:55'),(28,4,0,NULL,NULL,'/products',NULL,3,'Shop',NULL,'_self',0,'2025-12-26 09:38:55','2025-12-26 09:38:55');
/*!40000 ALTER TABLE `menu_nodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menus` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,'Main menu','main-menu','published','2025-12-26 09:38:55','2025-12-26 09:38:55'),(2,'Quick links','quick-links','published','2025-12-26 09:38:55','2025-12-26 09:38:55'),(3,'Company','company','published','2025-12-26 09:38:55','2025-12-26 09:38:55'),(4,'Business','business','published','2025-12-26 09:38:55','2025-12-26 09:38:55');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meta_boxes`
--

DROP TABLE IF EXISTS `meta_boxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meta_boxes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `meta_key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_value` text COLLATE utf8mb4_unicode_ci,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `meta_boxes_reference_id_index` (`reference_id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meta_boxes`
--

LOCK TABLES `meta_boxes` WRITE;
/*!40000 ALTER TABLE `meta_boxes` DISABLE KEYS */;
INSERT INTO `meta_boxes` VALUES (1,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What is the warranty period?\"},{\"key\":\"answer\",\"value\":\"This product comes with a 1-year manufacturer warranty covering defects in materials and workmanship.\"}],[{\"key\":\"question\",\"value\":\"Is this item compatible with Mac and Windows?\"},{\"key\":\"answer\",\"value\":\"Yes, this product is fully compatible with both macOS and Windows operating systems out of the box.\"}],[{\"key\":\"question\",\"value\":\"How long does the battery last?\"},{\"key\":\"answer\",\"value\":\"The battery life is approximately 10 hours on a full charge, depending on usage conditions.\"}],[{\"key\":\"question\",\"value\":\"Does it come with a carrying case?\"},{\"key\":\"answer\",\"value\":\"Yes, a protective carrying case is included in the box to keep your device safe during travel.\"}],[{\"key\":\"question\",\"value\":\"Can I return it if I don\'t like it?\"},{\"key\":\"answer\",\"value\":\"Absolutely! We offer a hassle-free 30-day return policy. If you are not satisfied, you can return it for a full refund.\"}]]]',1,'Botble\\Ecommerce\\Models\\Product','2025-12-26 09:38:36','2025-12-26 09:38:36'),(2,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What is the warranty period?\"},{\"key\":\"answer\",\"value\":\"This product comes with a 1-year manufacturer warranty covering defects in materials and workmanship.\"}],[{\"key\":\"question\",\"value\":\"Is this item compatible with Mac and Windows?\"},{\"key\":\"answer\",\"value\":\"Yes, this product is fully compatible with both macOS and Windows operating systems out of the box.\"}],[{\"key\":\"question\",\"value\":\"How long does the battery last?\"},{\"key\":\"answer\",\"value\":\"The battery life is approximately 10 hours on a full charge, depending on usage conditions.\"}],[{\"key\":\"question\",\"value\":\"Does it come with a carrying case?\"},{\"key\":\"answer\",\"value\":\"Yes, a protective carrying case is included in the box to keep your device safe during travel.\"}],[{\"key\":\"question\",\"value\":\"Can I return it if I don\'t like it?\"},{\"key\":\"answer\",\"value\":\"Absolutely! We offer a hassle-free 30-day return policy. If you are not satisfied, you can return it for a full refund.\"}]]]',2,'Botble\\Ecommerce\\Models\\Product','2025-12-26 09:38:36','2025-12-26 09:38:36'),(3,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What is the warranty period?\"},{\"key\":\"answer\",\"value\":\"This product comes with a 1-year manufacturer warranty covering defects in materials and workmanship.\"}],[{\"key\":\"question\",\"value\":\"Is this item compatible with Mac and Windows?\"},{\"key\":\"answer\",\"value\":\"Yes, this product is fully compatible with both macOS and Windows operating systems out of the box.\"}],[{\"key\":\"question\",\"value\":\"How long does the battery last?\"},{\"key\":\"answer\",\"value\":\"The battery life is approximately 10 hours on a full charge, depending on usage conditions.\"}],[{\"key\":\"question\",\"value\":\"Does it come with a carrying case?\"},{\"key\":\"answer\",\"value\":\"Yes, a protective carrying case is included in the box to keep your device safe during travel.\"}],[{\"key\":\"question\",\"value\":\"Can I return it if I don\'t like it?\"},{\"key\":\"answer\",\"value\":\"Absolutely! We offer a hassle-free 30-day return policy. If you are not satisfied, you can return it for a full refund.\"}]]]',3,'Botble\\Ecommerce\\Models\\Product','2025-12-26 09:38:36','2025-12-26 09:38:36'),(4,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What is the warranty period?\"},{\"key\":\"answer\",\"value\":\"This product comes with a 1-year manufacturer warranty covering defects in materials and workmanship.\"}],[{\"key\":\"question\",\"value\":\"Is this item compatible with Mac and Windows?\"},{\"key\":\"answer\",\"value\":\"Yes, this product is fully compatible with both macOS and Windows operating systems out of the box.\"}],[{\"key\":\"question\",\"value\":\"How long does the battery last?\"},{\"key\":\"answer\",\"value\":\"The battery life is approximately 10 hours on a full charge, depending on usage conditions.\"}],[{\"key\":\"question\",\"value\":\"Does it come with a carrying case?\"},{\"key\":\"answer\",\"value\":\"Yes, a protective carrying case is included in the box to keep your device safe during travel.\"}],[{\"key\":\"question\",\"value\":\"Can I return it if I don\'t like it?\"},{\"key\":\"answer\",\"value\":\"Absolutely! We offer a hassle-free 30-day return policy. If you are not satisfied, you can return it for a full refund.\"}]]]',4,'Botble\\Ecommerce\\Models\\Product','2025-12-26 09:38:36','2025-12-26 09:38:36'),(5,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What is the warranty period?\"},{\"key\":\"answer\",\"value\":\"This product comes with a 1-year manufacturer warranty covering defects in materials and workmanship.\"}],[{\"key\":\"question\",\"value\":\"Is this item compatible with Mac and Windows?\"},{\"key\":\"answer\",\"value\":\"Yes, this product is fully compatible with both macOS and Windows operating systems out of the box.\"}],[{\"key\":\"question\",\"value\":\"How long does the battery last?\"},{\"key\":\"answer\",\"value\":\"The battery life is approximately 10 hours on a full charge, depending on usage conditions.\"}],[{\"key\":\"question\",\"value\":\"Does it come with a carrying case?\"},{\"key\":\"answer\",\"value\":\"Yes, a protective carrying case is included in the box to keep your device safe during travel.\"}],[{\"key\":\"question\",\"value\":\"Can I return it if I don\'t like it?\"},{\"key\":\"answer\",\"value\":\"Absolutely! We offer a hassle-free 30-day return policy. If you are not satisfied, you can return it for a full refund.\"}]]]',5,'Botble\\Ecommerce\\Models\\Product','2025-12-26 09:38:36','2025-12-26 09:38:36'),(6,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What is the warranty period?\"},{\"key\":\"answer\",\"value\":\"This product comes with a 1-year manufacturer warranty covering defects in materials and workmanship.\"}],[{\"key\":\"question\",\"value\":\"Is this item compatible with Mac and Windows?\"},{\"key\":\"answer\",\"value\":\"Yes, this product is fully compatible with both macOS and Windows operating systems out of the box.\"}],[{\"key\":\"question\",\"value\":\"How long does the battery last?\"},{\"key\":\"answer\",\"value\":\"The battery life is approximately 10 hours on a full charge, depending on usage conditions.\"}],[{\"key\":\"question\",\"value\":\"Does it come with a carrying case?\"},{\"key\":\"answer\",\"value\":\"Yes, a protective carrying case is included in the box to keep your device safe during travel.\"}],[{\"key\":\"question\",\"value\":\"Can I return it if I don\'t like it?\"},{\"key\":\"answer\",\"value\":\"Absolutely! We offer a hassle-free 30-day return policy. If you are not satisfied, you can return it for a full refund.\"}]]]',6,'Botble\\Ecommerce\\Models\\Product','2025-12-26 09:38:36','2025-12-26 09:38:36'),(7,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What is the warranty period?\"},{\"key\":\"answer\",\"value\":\"This product comes with a 1-year manufacturer warranty covering defects in materials and workmanship.\"}],[{\"key\":\"question\",\"value\":\"Is this item compatible with Mac and Windows?\"},{\"key\":\"answer\",\"value\":\"Yes, this product is fully compatible with both macOS and Windows operating systems out of the box.\"}],[{\"key\":\"question\",\"value\":\"How long does the battery last?\"},{\"key\":\"answer\",\"value\":\"The battery life is approximately 10 hours on a full charge, depending on usage conditions.\"}],[{\"key\":\"question\",\"value\":\"Does it come with a carrying case?\"},{\"key\":\"answer\",\"value\":\"Yes, a protective carrying case is included in the box to keep your device safe during travel.\"}],[{\"key\":\"question\",\"value\":\"Can I return it if I don\'t like it?\"},{\"key\":\"answer\",\"value\":\"Absolutely! We offer a hassle-free 30-day return policy. If you are not satisfied, you can return it for a full refund.\"}]]]',7,'Botble\\Ecommerce\\Models\\Product','2025-12-26 09:38:36','2025-12-26 09:38:36'),(8,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What is the warranty period?\"},{\"key\":\"answer\",\"value\":\"This product comes with a 1-year manufacturer warranty covering defects in materials and workmanship.\"}],[{\"key\":\"question\",\"value\":\"Is this item compatible with Mac and Windows?\"},{\"key\":\"answer\",\"value\":\"Yes, this product is fully compatible with both macOS and Windows operating systems out of the box.\"}],[{\"key\":\"question\",\"value\":\"How long does the battery last?\"},{\"key\":\"answer\",\"value\":\"The battery life is approximately 10 hours on a full charge, depending on usage conditions.\"}],[{\"key\":\"question\",\"value\":\"Does it come with a carrying case?\"},{\"key\":\"answer\",\"value\":\"Yes, a protective carrying case is included in the box to keep your device safe during travel.\"}],[{\"key\":\"question\",\"value\":\"Can I return it if I don\'t like it?\"},{\"key\":\"answer\",\"value\":\"Absolutely! We offer a hassle-free 30-day return policy. If you are not satisfied, you can return it for a full refund.\"}]]]',8,'Botble\\Ecommerce\\Models\\Product','2025-12-26 09:38:36','2025-12-26 09:38:36'),(9,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What is the warranty period?\"},{\"key\":\"answer\",\"value\":\"This product comes with a 1-year manufacturer warranty covering defects in materials and workmanship.\"}],[{\"key\":\"question\",\"value\":\"Is this item compatible with Mac and Windows?\"},{\"key\":\"answer\",\"value\":\"Yes, this product is fully compatible with both macOS and Windows operating systems out of the box.\"}],[{\"key\":\"question\",\"value\":\"How long does the battery last?\"},{\"key\":\"answer\",\"value\":\"The battery life is approximately 10 hours on a full charge, depending on usage conditions.\"}],[{\"key\":\"question\",\"value\":\"Does it come with a carrying case?\"},{\"key\":\"answer\",\"value\":\"Yes, a protective carrying case is included in the box to keep your device safe during travel.\"}],[{\"key\":\"question\",\"value\":\"Can I return it if I don\'t like it?\"},{\"key\":\"answer\",\"value\":\"Absolutely! We offer a hassle-free 30-day return policy. If you are not satisfied, you can return it for a full refund.\"}]]]',9,'Botble\\Ecommerce\\Models\\Product','2025-12-26 09:38:36','2025-12-26 09:38:36'),(10,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What is the warranty period?\"},{\"key\":\"answer\",\"value\":\"This product comes with a 1-year manufacturer warranty covering defects in materials and workmanship.\"}],[{\"key\":\"question\",\"value\":\"Is this item compatible with Mac and Windows?\"},{\"key\":\"answer\",\"value\":\"Yes, this product is fully compatible with both macOS and Windows operating systems out of the box.\"}],[{\"key\":\"question\",\"value\":\"How long does the battery last?\"},{\"key\":\"answer\",\"value\":\"The battery life is approximately 10 hours on a full charge, depending on usage conditions.\"}],[{\"key\":\"question\",\"value\":\"Does it come with a carrying case?\"},{\"key\":\"answer\",\"value\":\"Yes, a protective carrying case is included in the box to keep your device safe during travel.\"}],[{\"key\":\"question\",\"value\":\"Can I return it if I don\'t like it?\"},{\"key\":\"answer\",\"value\":\"Absolutely! We offer a hassle-free 30-day return policy. If you are not satisfied, you can return it for a full refund.\"}]]]',10,'Botble\\Ecommerce\\Models\\Product','2025-12-26 09:38:36','2025-12-26 09:38:36'),(11,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What is the warranty period?\"},{\"key\":\"answer\",\"value\":\"This product comes with a 1-year manufacturer warranty covering defects in materials and workmanship.\"}],[{\"key\":\"question\",\"value\":\"Is this item compatible with Mac and Windows?\"},{\"key\":\"answer\",\"value\":\"Yes, this product is fully compatible with both macOS and Windows operating systems out of the box.\"}],[{\"key\":\"question\",\"value\":\"How long does the battery last?\"},{\"key\":\"answer\",\"value\":\"The battery life is approximately 10 hours on a full charge, depending on usage conditions.\"}],[{\"key\":\"question\",\"value\":\"Does it come with a carrying case?\"},{\"key\":\"answer\",\"value\":\"Yes, a protective carrying case is included in the box to keep your device safe during travel.\"}],[{\"key\":\"question\",\"value\":\"Can I return it if I don\'t like it?\"},{\"key\":\"answer\",\"value\":\"Absolutely! We offer a hassle-free 30-day return policy. If you are not satisfied, you can return it for a full refund.\"}]]]',11,'Botble\\Ecommerce\\Models\\Product','2025-12-26 09:38:37','2025-12-26 09:38:37'),(12,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What is the warranty period?\"},{\"key\":\"answer\",\"value\":\"This product comes with a 1-year manufacturer warranty covering defects in materials and workmanship.\"}],[{\"key\":\"question\",\"value\":\"Is this item compatible with Mac and Windows?\"},{\"key\":\"answer\",\"value\":\"Yes, this product is fully compatible with both macOS and Windows operating systems out of the box.\"}],[{\"key\":\"question\",\"value\":\"How long does the battery last?\"},{\"key\":\"answer\",\"value\":\"The battery life is approximately 10 hours on a full charge, depending on usage conditions.\"}],[{\"key\":\"question\",\"value\":\"Does it come with a carrying case?\"},{\"key\":\"answer\",\"value\":\"Yes, a protective carrying case is included in the box to keep your device safe during travel.\"}],[{\"key\":\"question\",\"value\":\"Can I return it if I don\'t like it?\"},{\"key\":\"answer\",\"value\":\"Absolutely! We offer a hassle-free 30-day return policy. If you are not satisfied, you can return it for a full refund.\"}]]]',12,'Botble\\Ecommerce\\Models\\Product','2025-12-26 09:38:37','2025-12-26 09:38:37'),(13,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What is the warranty period?\"},{\"key\":\"answer\",\"value\":\"This product comes with a 1-year manufacturer warranty covering defects in materials and workmanship.\"}],[{\"key\":\"question\",\"value\":\"Is this item compatible with Mac and Windows?\"},{\"key\":\"answer\",\"value\":\"Yes, this product is fully compatible with both macOS and Windows operating systems out of the box.\"}],[{\"key\":\"question\",\"value\":\"How long does the battery last?\"},{\"key\":\"answer\",\"value\":\"The battery life is approximately 10 hours on a full charge, depending on usage conditions.\"}],[{\"key\":\"question\",\"value\":\"Does it come with a carrying case?\"},{\"key\":\"answer\",\"value\":\"Yes, a protective carrying case is included in the box to keep your device safe during travel.\"}],[{\"key\":\"question\",\"value\":\"Can I return it if I don\'t like it?\"},{\"key\":\"answer\",\"value\":\"Absolutely! We offer a hassle-free 30-day return policy. If you are not satisfied, you can return it for a full refund.\"}]]]',13,'Botble\\Ecommerce\\Models\\Product','2025-12-26 09:38:37','2025-12-26 09:38:37'),(14,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What is the warranty period?\"},{\"key\":\"answer\",\"value\":\"This product comes with a 1-year manufacturer warranty covering defects in materials and workmanship.\"}],[{\"key\":\"question\",\"value\":\"Is this item compatible with Mac and Windows?\"},{\"key\":\"answer\",\"value\":\"Yes, this product is fully compatible with both macOS and Windows operating systems out of the box.\"}],[{\"key\":\"question\",\"value\":\"How long does the battery last?\"},{\"key\":\"answer\",\"value\":\"The battery life is approximately 10 hours on a full charge, depending on usage conditions.\"}],[{\"key\":\"question\",\"value\":\"Does it come with a carrying case?\"},{\"key\":\"answer\",\"value\":\"Yes, a protective carrying case is included in the box to keep your device safe during travel.\"}],[{\"key\":\"question\",\"value\":\"Can I return it if I don\'t like it?\"},{\"key\":\"answer\",\"value\":\"Absolutely! We offer a hassle-free 30-day return policy. If you are not satisfied, you can return it for a full refund.\"}]]]',14,'Botble\\Ecommerce\\Models\\Product','2025-12-26 09:38:37','2025-12-26 09:38:37'),(15,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What is the warranty period?\"},{\"key\":\"answer\",\"value\":\"This product comes with a 1-year manufacturer warranty covering defects in materials and workmanship.\"}],[{\"key\":\"question\",\"value\":\"Is this item compatible with Mac and Windows?\"},{\"key\":\"answer\",\"value\":\"Yes, this product is fully compatible with both macOS and Windows operating systems out of the box.\"}],[{\"key\":\"question\",\"value\":\"How long does the battery last?\"},{\"key\":\"answer\",\"value\":\"The battery life is approximately 10 hours on a full charge, depending on usage conditions.\"}],[{\"key\":\"question\",\"value\":\"Does it come with a carrying case?\"},{\"key\":\"answer\",\"value\":\"Yes, a protective carrying case is included in the box to keep your device safe during travel.\"}],[{\"key\":\"question\",\"value\":\"Can I return it if I don\'t like it?\"},{\"key\":\"answer\",\"value\":\"Absolutely! We offer a hassle-free 30-day return policy. If you are not satisfied, you can return it for a full refund.\"}]]]',15,'Botble\\Ecommerce\\Models\\Product','2025-12-26 09:38:37','2025-12-26 09:38:37'),(16,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What is the warranty period?\"},{\"key\":\"answer\",\"value\":\"This product comes with a 1-year manufacturer warranty covering defects in materials and workmanship.\"}],[{\"key\":\"question\",\"value\":\"Is this item compatible with Mac and Windows?\"},{\"key\":\"answer\",\"value\":\"Yes, this product is fully compatible with both macOS and Windows operating systems out of the box.\"}],[{\"key\":\"question\",\"value\":\"How long does the battery last?\"},{\"key\":\"answer\",\"value\":\"The battery life is approximately 10 hours on a full charge, depending on usage conditions.\"}],[{\"key\":\"question\",\"value\":\"Does it come with a carrying case?\"},{\"key\":\"answer\",\"value\":\"Yes, a protective carrying case is included in the box to keep your device safe during travel.\"}],[{\"key\":\"question\",\"value\":\"Can I return it if I don\'t like it?\"},{\"key\":\"answer\",\"value\":\"Absolutely! We offer a hassle-free 30-day return policy. If you are not satisfied, you can return it for a full refund.\"}]]]',16,'Botble\\Ecommerce\\Models\\Product','2025-12-26 09:38:37','2025-12-26 09:38:37'),(17,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What is the warranty period?\"},{\"key\":\"answer\",\"value\":\"This product comes with a 1-year manufacturer warranty covering defects in materials and workmanship.\"}],[{\"key\":\"question\",\"value\":\"Is this item compatible with Mac and Windows?\"},{\"key\":\"answer\",\"value\":\"Yes, this product is fully compatible with both macOS and Windows operating systems out of the box.\"}],[{\"key\":\"question\",\"value\":\"How long does the battery last?\"},{\"key\":\"answer\",\"value\":\"The battery life is approximately 10 hours on a full charge, depending on usage conditions.\"}],[{\"key\":\"question\",\"value\":\"Does it come with a carrying case?\"},{\"key\":\"answer\",\"value\":\"Yes, a protective carrying case is included in the box to keep your device safe during travel.\"}],[{\"key\":\"question\",\"value\":\"Can I return it if I don\'t like it?\"},{\"key\":\"answer\",\"value\":\"Absolutely! We offer a hassle-free 30-day return policy. If you are not satisfied, you can return it for a full refund.\"}]]]',17,'Botble\\Ecommerce\\Models\\Product','2025-12-26 09:38:37','2025-12-26 09:38:37'),(18,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What is the warranty period?\"},{\"key\":\"answer\",\"value\":\"This product comes with a 1-year manufacturer warranty covering defects in materials and workmanship.\"}],[{\"key\":\"question\",\"value\":\"Is this item compatible with Mac and Windows?\"},{\"key\":\"answer\",\"value\":\"Yes, this product is fully compatible with both macOS and Windows operating systems out of the box.\"}],[{\"key\":\"question\",\"value\":\"How long does the battery last?\"},{\"key\":\"answer\",\"value\":\"The battery life is approximately 10 hours on a full charge, depending on usage conditions.\"}],[{\"key\":\"question\",\"value\":\"Does it come with a carrying case?\"},{\"key\":\"answer\",\"value\":\"Yes, a protective carrying case is included in the box to keep your device safe during travel.\"}],[{\"key\":\"question\",\"value\":\"Can I return it if I don\'t like it?\"},{\"key\":\"answer\",\"value\":\"Absolutely! We offer a hassle-free 30-day return policy. If you are not satisfied, you can return it for a full refund.\"}]]]',18,'Botble\\Ecommerce\\Models\\Product','2025-12-26 09:38:37','2025-12-26 09:38:37'),(19,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What is the warranty period?\"},{\"key\":\"answer\",\"value\":\"This product comes with a 1-year manufacturer warranty covering defects in materials and workmanship.\"}],[{\"key\":\"question\",\"value\":\"Is this item compatible with Mac and Windows?\"},{\"key\":\"answer\",\"value\":\"Yes, this product is fully compatible with both macOS and Windows operating systems out of the box.\"}],[{\"key\":\"question\",\"value\":\"How long does the battery last?\"},{\"key\":\"answer\",\"value\":\"The battery life is approximately 10 hours on a full charge, depending on usage conditions.\"}],[{\"key\":\"question\",\"value\":\"Does it come with a carrying case?\"},{\"key\":\"answer\",\"value\":\"Yes, a protective carrying case is included in the box to keep your device safe during travel.\"}],[{\"key\":\"question\",\"value\":\"Can I return it if I don\'t like it?\"},{\"key\":\"answer\",\"value\":\"Absolutely! We offer a hassle-free 30-day return policy. If you are not satisfied, you can return it for a full refund.\"}]]]',19,'Botble\\Ecommerce\\Models\\Product','2025-12-26 09:38:37','2025-12-26 09:38:37'),(20,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What is the warranty period?\"},{\"key\":\"answer\",\"value\":\"This product comes with a 1-year manufacturer warranty covering defects in materials and workmanship.\"}],[{\"key\":\"question\",\"value\":\"Is this item compatible with Mac and Windows?\"},{\"key\":\"answer\",\"value\":\"Yes, this product is fully compatible with both macOS and Windows operating systems out of the box.\"}],[{\"key\":\"question\",\"value\":\"How long does the battery last?\"},{\"key\":\"answer\",\"value\":\"The battery life is approximately 10 hours on a full charge, depending on usage conditions.\"}],[{\"key\":\"question\",\"value\":\"Does it come with a carrying case?\"},{\"key\":\"answer\",\"value\":\"Yes, a protective carrying case is included in the box to keep your device safe during travel.\"}],[{\"key\":\"question\",\"value\":\"Can I return it if I don\'t like it?\"},{\"key\":\"answer\",\"value\":\"Absolutely! We offer a hassle-free 30-day return policy. If you are not satisfied, you can return it for a full refund.\"}]]]',20,'Botble\\Ecommerce\\Models\\Product','2025-12-26 09:38:37','2025-12-26 09:38:37'),(21,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What is the warranty period?\"},{\"key\":\"answer\",\"value\":\"This product comes with a 1-year manufacturer warranty covering defects in materials and workmanship.\"}],[{\"key\":\"question\",\"value\":\"Is this item compatible with Mac and Windows?\"},{\"key\":\"answer\",\"value\":\"Yes, this product is fully compatible with both macOS and Windows operating systems out of the box.\"}],[{\"key\":\"question\",\"value\":\"How long does the battery last?\"},{\"key\":\"answer\",\"value\":\"The battery life is approximately 10 hours on a full charge, depending on usage conditions.\"}],[{\"key\":\"question\",\"value\":\"Does it come with a carrying case?\"},{\"key\":\"answer\",\"value\":\"Yes, a protective carrying case is included in the box to keep your device safe during travel.\"}],[{\"key\":\"question\",\"value\":\"Can I return it if I don\'t like it?\"},{\"key\":\"answer\",\"value\":\"Absolutely! We offer a hassle-free 30-day return policy. If you are not satisfied, you can return it for a full refund.\"}]]]',21,'Botble\\Ecommerce\\Models\\Product','2025-12-26 09:38:37','2025-12-26 09:38:37'),(22,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What is the warranty period?\"},{\"key\":\"answer\",\"value\":\"This product comes with a 1-year manufacturer warranty covering defects in materials and workmanship.\"}],[{\"key\":\"question\",\"value\":\"Is this item compatible with Mac and Windows?\"},{\"key\":\"answer\",\"value\":\"Yes, this product is fully compatible with both macOS and Windows operating systems out of the box.\"}],[{\"key\":\"question\",\"value\":\"How long does the battery last?\"},{\"key\":\"answer\",\"value\":\"The battery life is approximately 10 hours on a full charge, depending on usage conditions.\"}],[{\"key\":\"question\",\"value\":\"Does it come with a carrying case?\"},{\"key\":\"answer\",\"value\":\"Yes, a protective carrying case is included in the box to keep your device safe during travel.\"}],[{\"key\":\"question\",\"value\":\"Can I return it if I don\'t like it?\"},{\"key\":\"answer\",\"value\":\"Absolutely! We offer a hassle-free 30-day return policy. If you are not satisfied, you can return it for a full refund.\"}]]]',22,'Botble\\Ecommerce\\Models\\Product','2025-12-26 09:38:37','2025-12-26 09:38:37'),(23,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What is the warranty period?\"},{\"key\":\"answer\",\"value\":\"This product comes with a 1-year manufacturer warranty covering defects in materials and workmanship.\"}],[{\"key\":\"question\",\"value\":\"Is this item compatible with Mac and Windows?\"},{\"key\":\"answer\",\"value\":\"Yes, this product is fully compatible with both macOS and Windows operating systems out of the box.\"}],[{\"key\":\"question\",\"value\":\"How long does the battery last?\"},{\"key\":\"answer\",\"value\":\"The battery life is approximately 10 hours on a full charge, depending on usage conditions.\"}],[{\"key\":\"question\",\"value\":\"Does it come with a carrying case?\"},{\"key\":\"answer\",\"value\":\"Yes, a protective carrying case is included in the box to keep your device safe during travel.\"}],[{\"key\":\"question\",\"value\":\"Can I return it if I don\'t like it?\"},{\"key\":\"answer\",\"value\":\"Absolutely! We offer a hassle-free 30-day return policy. If you are not satisfied, you can return it for a full refund.\"}]]]',23,'Botble\\Ecommerce\\Models\\Product','2025-12-26 09:38:37','2025-12-26 09:38:37'),(24,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What is the warranty period?\"},{\"key\":\"answer\",\"value\":\"This product comes with a 1-year manufacturer warranty covering defects in materials and workmanship.\"}],[{\"key\":\"question\",\"value\":\"Is this item compatible with Mac and Windows?\"},{\"key\":\"answer\",\"value\":\"Yes, this product is fully compatible with both macOS and Windows operating systems out of the box.\"}],[{\"key\":\"question\",\"value\":\"How long does the battery last?\"},{\"key\":\"answer\",\"value\":\"The battery life is approximately 10 hours on a full charge, depending on usage conditions.\"}],[{\"key\":\"question\",\"value\":\"Does it come with a carrying case?\"},{\"key\":\"answer\",\"value\":\"Yes, a protective carrying case is included in the box to keep your device safe during travel.\"}],[{\"key\":\"question\",\"value\":\"Can I return it if I don\'t like it?\"},{\"key\":\"answer\",\"value\":\"Absolutely! We offer a hassle-free 30-day return policy. If you are not satisfied, you can return it for a full refund.\"}]]]',24,'Botble\\Ecommerce\\Models\\Product','2025-12-26 09:38:37','2025-12-26 09:38:37'),(25,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What is the warranty period?\"},{\"key\":\"answer\",\"value\":\"This product comes with a 1-year manufacturer warranty covering defects in materials and workmanship.\"}],[{\"key\":\"question\",\"value\":\"Is this item compatible with Mac and Windows?\"},{\"key\":\"answer\",\"value\":\"Yes, this product is fully compatible with both macOS and Windows operating systems out of the box.\"}],[{\"key\":\"question\",\"value\":\"How long does the battery last?\"},{\"key\":\"answer\",\"value\":\"The battery life is approximately 10 hours on a full charge, depending on usage conditions.\"}],[{\"key\":\"question\",\"value\":\"Does it come with a carrying case?\"},{\"key\":\"answer\",\"value\":\"Yes, a protective carrying case is included in the box to keep your device safe during travel.\"}],[{\"key\":\"question\",\"value\":\"Can I return it if I don\'t like it?\"},{\"key\":\"answer\",\"value\":\"Absolutely! We offer a hassle-free 30-day return policy. If you are not satisfied, you can return it for a full refund.\"}]]]',25,'Botble\\Ecommerce\\Models\\Product','2025-12-26 09:38:37','2025-12-26 09:38:37'),(26,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What is the warranty period?\"},{\"key\":\"answer\",\"value\":\"This product comes with a 1-year manufacturer warranty covering defects in materials and workmanship.\"}],[{\"key\":\"question\",\"value\":\"Is this item compatible with Mac and Windows?\"},{\"key\":\"answer\",\"value\":\"Yes, this product is fully compatible with both macOS and Windows operating systems out of the box.\"}],[{\"key\":\"question\",\"value\":\"How long does the battery last?\"},{\"key\":\"answer\",\"value\":\"The battery life is approximately 10 hours on a full charge, depending on usage conditions.\"}],[{\"key\":\"question\",\"value\":\"Does it come with a carrying case?\"},{\"key\":\"answer\",\"value\":\"Yes, a protective carrying case is included in the box to keep your device safe during travel.\"}],[{\"key\":\"question\",\"value\":\"Can I return it if I don\'t like it?\"},{\"key\":\"answer\",\"value\":\"Absolutely! We offer a hassle-free 30-day return policy. If you are not satisfied, you can return it for a full refund.\"}]]]',26,'Botble\\Ecommerce\\Models\\Product','2025-12-26 09:38:37','2025-12-26 09:38:37'),(27,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What is the warranty period?\"},{\"key\":\"answer\",\"value\":\"This product comes with a 1-year manufacturer warranty covering defects in materials and workmanship.\"}],[{\"key\":\"question\",\"value\":\"Is this item compatible with Mac and Windows?\"},{\"key\":\"answer\",\"value\":\"Yes, this product is fully compatible with both macOS and Windows operating systems out of the box.\"}],[{\"key\":\"question\",\"value\":\"How long does the battery last?\"},{\"key\":\"answer\",\"value\":\"The battery life is approximately 10 hours on a full charge, depending on usage conditions.\"}],[{\"key\":\"question\",\"value\":\"Does it come with a carrying case?\"},{\"key\":\"answer\",\"value\":\"Yes, a protective carrying case is included in the box to keep your device safe during travel.\"}],[{\"key\":\"question\",\"value\":\"Can I return it if I don\'t like it?\"},{\"key\":\"answer\",\"value\":\"Absolutely! We offer a hassle-free 30-day return policy. If you are not satisfied, you can return it for a full refund.\"}]]]',27,'Botble\\Ecommerce\\Models\\Product','2025-12-26 09:38:37','2025-12-26 09:38:37'),(28,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What is the warranty period?\"},{\"key\":\"answer\",\"value\":\"This product comes with a 1-year manufacturer warranty covering defects in materials and workmanship.\"}],[{\"key\":\"question\",\"value\":\"Is this item compatible with Mac and Windows?\"},{\"key\":\"answer\",\"value\":\"Yes, this product is fully compatible with both macOS and Windows operating systems out of the box.\"}],[{\"key\":\"question\",\"value\":\"How long does the battery last?\"},{\"key\":\"answer\",\"value\":\"The battery life is approximately 10 hours on a full charge, depending on usage conditions.\"}],[{\"key\":\"question\",\"value\":\"Does it come with a carrying case?\"},{\"key\":\"answer\",\"value\":\"Yes, a protective carrying case is included in the box to keep your device safe during travel.\"}],[{\"key\":\"question\",\"value\":\"Can I return it if I don\'t like it?\"},{\"key\":\"answer\",\"value\":\"Absolutely! We offer a hassle-free 30-day return policy. If you are not satisfied, you can return it for a full refund.\"}]]]',28,'Botble\\Ecommerce\\Models\\Product','2025-12-26 09:38:37','2025-12-26 09:38:37'),(29,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What is the warranty period?\"},{\"key\":\"answer\",\"value\":\"This product comes with a 1-year manufacturer warranty covering defects in materials and workmanship.\"}],[{\"key\":\"question\",\"value\":\"Is this item compatible with Mac and Windows?\"},{\"key\":\"answer\",\"value\":\"Yes, this product is fully compatible with both macOS and Windows operating systems out of the box.\"}],[{\"key\":\"question\",\"value\":\"How long does the battery last?\"},{\"key\":\"answer\",\"value\":\"The battery life is approximately 10 hours on a full charge, depending on usage conditions.\"}],[{\"key\":\"question\",\"value\":\"Does it come with a carrying case?\"},{\"key\":\"answer\",\"value\":\"Yes, a protective carrying case is included in the box to keep your device safe during travel.\"}],[{\"key\":\"question\",\"value\":\"Can I return it if I don\'t like it?\"},{\"key\":\"answer\",\"value\":\"Absolutely! We offer a hassle-free 30-day return policy. If you are not satisfied, you can return it for a full refund.\"}]]]',29,'Botble\\Ecommerce\\Models\\Product','2025-12-26 09:38:37','2025-12-26 09:38:37'),(30,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What is the warranty period?\"},{\"key\":\"answer\",\"value\":\"This product comes with a 1-year manufacturer warranty covering defects in materials and workmanship.\"}],[{\"key\":\"question\",\"value\":\"Is this item compatible with Mac and Windows?\"},{\"key\":\"answer\",\"value\":\"Yes, this product is fully compatible with both macOS and Windows operating systems out of the box.\"}],[{\"key\":\"question\",\"value\":\"How long does the battery last?\"},{\"key\":\"answer\",\"value\":\"The battery life is approximately 10 hours on a full charge, depending on usage conditions.\"}],[{\"key\":\"question\",\"value\":\"Does it come with a carrying case?\"},{\"key\":\"answer\",\"value\":\"Yes, a protective carrying case is included in the box to keep your device safe during travel.\"}],[{\"key\":\"question\",\"value\":\"Can I return it if I don\'t like it?\"},{\"key\":\"answer\",\"value\":\"Absolutely! We offer a hassle-free 30-day return policy. If you are not satisfied, you can return it for a full refund.\"}]]]',30,'Botble\\Ecommerce\\Models\\Product','2025-12-26 09:38:37','2025-12-26 09:38:37'),(31,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What is the warranty period?\"},{\"key\":\"answer\",\"value\":\"This product comes with a 1-year manufacturer warranty covering defects in materials and workmanship.\"}],[{\"key\":\"question\",\"value\":\"Is this item compatible with Mac and Windows?\"},{\"key\":\"answer\",\"value\":\"Yes, this product is fully compatible with both macOS and Windows operating systems out of the box.\"}],[{\"key\":\"question\",\"value\":\"How long does the battery last?\"},{\"key\":\"answer\",\"value\":\"The battery life is approximately 10 hours on a full charge, depending on usage conditions.\"}],[{\"key\":\"question\",\"value\":\"Does it come with a carrying case?\"},{\"key\":\"answer\",\"value\":\"Yes, a protective carrying case is included in the box to keep your device safe during travel.\"}],[{\"key\":\"question\",\"value\":\"Can I return it if I don\'t like it?\"},{\"key\":\"answer\",\"value\":\"Absolutely! We offer a hassle-free 30-day return policy. If you are not satisfied, you can return it for a full refund.\"}]]]',31,'Botble\\Ecommerce\\Models\\Product','2025-12-26 09:38:37','2025-12-26 09:38:37'),(32,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What is the warranty period?\"},{\"key\":\"answer\",\"value\":\"This product comes with a 1-year manufacturer warranty covering defects in materials and workmanship.\"}],[{\"key\":\"question\",\"value\":\"Is this item compatible with Mac and Windows?\"},{\"key\":\"answer\",\"value\":\"Yes, this product is fully compatible with both macOS and Windows operating systems out of the box.\"}],[{\"key\":\"question\",\"value\":\"How long does the battery last?\"},{\"key\":\"answer\",\"value\":\"The battery life is approximately 10 hours on a full charge, depending on usage conditions.\"}],[{\"key\":\"question\",\"value\":\"Does it come with a carrying case?\"},{\"key\":\"answer\",\"value\":\"Yes, a protective carrying case is included in the box to keep your device safe during travel.\"}],[{\"key\":\"question\",\"value\":\"Can I return it if I don\'t like it?\"},{\"key\":\"answer\",\"value\":\"Absolutely! We offer a hassle-free 30-day return policy. If you are not satisfied, you can return it for a full refund.\"}]]]',32,'Botble\\Ecommerce\\Models\\Product','2025-12-26 09:38:38','2025-12-26 09:38:38'),(33,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What is the warranty period?\"},{\"key\":\"answer\",\"value\":\"This product comes with a 1-year manufacturer warranty covering defects in materials and workmanship.\"}],[{\"key\":\"question\",\"value\":\"Is this item compatible with Mac and Windows?\"},{\"key\":\"answer\",\"value\":\"Yes, this product is fully compatible with both macOS and Windows operating systems out of the box.\"}],[{\"key\":\"question\",\"value\":\"How long does the battery last?\"},{\"key\":\"answer\",\"value\":\"The battery life is approximately 10 hours on a full charge, depending on usage conditions.\"}],[{\"key\":\"question\",\"value\":\"Does it come with a carrying case?\"},{\"key\":\"answer\",\"value\":\"Yes, a protective carrying case is included in the box to keep your device safe during travel.\"}],[{\"key\":\"question\",\"value\":\"Can I return it if I don\'t like it?\"},{\"key\":\"answer\",\"value\":\"Absolutely! We offer a hassle-free 30-day return policy. If you are not satisfied, you can return it for a full refund.\"}]]]',33,'Botble\\Ecommerce\\Models\\Product','2025-12-26 09:38:38','2025-12-26 09:38:38'),(34,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What is the warranty period?\"},{\"key\":\"answer\",\"value\":\"This product comes with a 1-year manufacturer warranty covering defects in materials and workmanship.\"}],[{\"key\":\"question\",\"value\":\"Is this item compatible with Mac and Windows?\"},{\"key\":\"answer\",\"value\":\"Yes, this product is fully compatible with both macOS and Windows operating systems out of the box.\"}],[{\"key\":\"question\",\"value\":\"How long does the battery last?\"},{\"key\":\"answer\",\"value\":\"The battery life is approximately 10 hours on a full charge, depending on usage conditions.\"}],[{\"key\":\"question\",\"value\":\"Does it come with a carrying case?\"},{\"key\":\"answer\",\"value\":\"Yes, a protective carrying case is included in the box to keep your device safe during travel.\"}],[{\"key\":\"question\",\"value\":\"Can I return it if I don\'t like it?\"},{\"key\":\"answer\",\"value\":\"Absolutely! We offer a hassle-free 30-day return policy. If you are not satisfied, you can return it for a full refund.\"}]]]',34,'Botble\\Ecommerce\\Models\\Product','2025-12-26 09:38:38','2025-12-26 09:38:38'),(35,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What is the warranty period?\"},{\"key\":\"answer\",\"value\":\"This product comes with a 1-year manufacturer warranty covering defects in materials and workmanship.\"}],[{\"key\":\"question\",\"value\":\"Is this item compatible with Mac and Windows?\"},{\"key\":\"answer\",\"value\":\"Yes, this product is fully compatible with both macOS and Windows operating systems out of the box.\"}],[{\"key\":\"question\",\"value\":\"How long does the battery last?\"},{\"key\":\"answer\",\"value\":\"The battery life is approximately 10 hours on a full charge, depending on usage conditions.\"}],[{\"key\":\"question\",\"value\":\"Does it come with a carrying case?\"},{\"key\":\"answer\",\"value\":\"Yes, a protective carrying case is included in the box to keep your device safe during travel.\"}],[{\"key\":\"question\",\"value\":\"Can I return it if I don\'t like it?\"},{\"key\":\"answer\",\"value\":\"Absolutely! We offer a hassle-free 30-day return policy. If you are not satisfied, you can return it for a full refund.\"}]]]',35,'Botble\\Ecommerce\\Models\\Product','2025-12-26 09:38:38','2025-12-26 09:38:38'),(36,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What is the warranty period?\"},{\"key\":\"answer\",\"value\":\"This product comes with a 1-year manufacturer warranty covering defects in materials and workmanship.\"}],[{\"key\":\"question\",\"value\":\"Is this item compatible with Mac and Windows?\"},{\"key\":\"answer\",\"value\":\"Yes, this product is fully compatible with both macOS and Windows operating systems out of the box.\"}],[{\"key\":\"question\",\"value\":\"How long does the battery last?\"},{\"key\":\"answer\",\"value\":\"The battery life is approximately 10 hours on a full charge, depending on usage conditions.\"}],[{\"key\":\"question\",\"value\":\"Does it come with a carrying case?\"},{\"key\":\"answer\",\"value\":\"Yes, a protective carrying case is included in the box to keep your device safe during travel.\"}],[{\"key\":\"question\",\"value\":\"Can I return it if I don\'t like it?\"},{\"key\":\"answer\",\"value\":\"Absolutely! We offer a hassle-free 30-day return policy. If you are not satisfied, you can return it for a full refund.\"}]]]',36,'Botble\\Ecommerce\\Models\\Product','2025-12-26 09:38:38','2025-12-26 09:38:38'),(37,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What is the warranty period?\"},{\"key\":\"answer\",\"value\":\"This product comes with a 1-year manufacturer warranty covering defects in materials and workmanship.\"}],[{\"key\":\"question\",\"value\":\"Is this item compatible with Mac and Windows?\"},{\"key\":\"answer\",\"value\":\"Yes, this product is fully compatible with both macOS and Windows operating systems out of the box.\"}],[{\"key\":\"question\",\"value\":\"How long does the battery last?\"},{\"key\":\"answer\",\"value\":\"The battery life is approximately 10 hours on a full charge, depending on usage conditions.\"}],[{\"key\":\"question\",\"value\":\"Does it come with a carrying case?\"},{\"key\":\"answer\",\"value\":\"Yes, a protective carrying case is included in the box to keep your device safe during travel.\"}],[{\"key\":\"question\",\"value\":\"Can I return it if I don\'t like it?\"},{\"key\":\"answer\",\"value\":\"Absolutely! We offer a hassle-free 30-day return policy. If you are not satisfied, you can return it for a full refund.\"}]]]',37,'Botble\\Ecommerce\\Models\\Product','2025-12-26 09:38:38','2025-12-26 09:38:38'),(38,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What is the warranty period?\"},{\"key\":\"answer\",\"value\":\"This product comes with a 1-year manufacturer warranty covering defects in materials and workmanship.\"}],[{\"key\":\"question\",\"value\":\"Is this item compatible with Mac and Windows?\"},{\"key\":\"answer\",\"value\":\"Yes, this product is fully compatible with both macOS and Windows operating systems out of the box.\"}],[{\"key\":\"question\",\"value\":\"How long does the battery last?\"},{\"key\":\"answer\",\"value\":\"The battery life is approximately 10 hours on a full charge, depending on usage conditions.\"}],[{\"key\":\"question\",\"value\":\"Does it come with a carrying case?\"},{\"key\":\"answer\",\"value\":\"Yes, a protective carrying case is included in the box to keep your device safe during travel.\"}],[{\"key\":\"question\",\"value\":\"Can I return it if I don\'t like it?\"},{\"key\":\"answer\",\"value\":\"Absolutely! We offer a hassle-free 30-day return policy. If you are not satisfied, you can return it for a full refund.\"}]]]',38,'Botble\\Ecommerce\\Models\\Product','2025-12-26 09:38:38','2025-12-26 09:38:38'),(39,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What is the warranty period?\"},{\"key\":\"answer\",\"value\":\"This product comes with a 1-year manufacturer warranty covering defects in materials and workmanship.\"}],[{\"key\":\"question\",\"value\":\"Is this item compatible with Mac and Windows?\"},{\"key\":\"answer\",\"value\":\"Yes, this product is fully compatible with both macOS and Windows operating systems out of the box.\"}],[{\"key\":\"question\",\"value\":\"How long does the battery last?\"},{\"key\":\"answer\",\"value\":\"The battery life is approximately 10 hours on a full charge, depending on usage conditions.\"}],[{\"key\":\"question\",\"value\":\"Does it come with a carrying case?\"},{\"key\":\"answer\",\"value\":\"Yes, a protective carrying case is included in the box to keep your device safe during travel.\"}],[{\"key\":\"question\",\"value\":\"Can I return it if I don\'t like it?\"},{\"key\":\"answer\",\"value\":\"Absolutely! We offer a hassle-free 30-day return policy. If you are not satisfied, you can return it for a full refund.\"}]]]',39,'Botble\\Ecommerce\\Models\\Product','2025-12-26 09:38:38','2025-12-26 09:38:38'),(40,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What is the warranty period?\"},{\"key\":\"answer\",\"value\":\"This product comes with a 1-year manufacturer warranty covering defects in materials and workmanship.\"}],[{\"key\":\"question\",\"value\":\"Is this item compatible with Mac and Windows?\"},{\"key\":\"answer\",\"value\":\"Yes, this product is fully compatible with both macOS and Windows operating systems out of the box.\"}],[{\"key\":\"question\",\"value\":\"How long does the battery last?\"},{\"key\":\"answer\",\"value\":\"The battery life is approximately 10 hours on a full charge, depending on usage conditions.\"}],[{\"key\":\"question\",\"value\":\"Does it come with a carrying case?\"},{\"key\":\"answer\",\"value\":\"Yes, a protective carrying case is included in the box to keep your device safe during travel.\"}],[{\"key\":\"question\",\"value\":\"Can I return it if I don\'t like it?\"},{\"key\":\"answer\",\"value\":\"Absolutely! We offer a hassle-free 30-day return policy. If you are not satisfied, you can return it for a full refund.\"}]]]',40,'Botble\\Ecommerce\\Models\\Product','2025-12-26 09:38:38','2025-12-26 09:38:38'),(41,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What is the warranty period?\"},{\"key\":\"answer\",\"value\":\"This product comes with a 1-year manufacturer warranty covering defects in materials and workmanship.\"}],[{\"key\":\"question\",\"value\":\"Is this item compatible with Mac and Windows?\"},{\"key\":\"answer\",\"value\":\"Yes, this product is fully compatible with both macOS and Windows operating systems out of the box.\"}],[{\"key\":\"question\",\"value\":\"How long does the battery last?\"},{\"key\":\"answer\",\"value\":\"The battery life is approximately 10 hours on a full charge, depending on usage conditions.\"}],[{\"key\":\"question\",\"value\":\"Does it come with a carrying case?\"},{\"key\":\"answer\",\"value\":\"Yes, a protective carrying case is included in the box to keep your device safe during travel.\"}],[{\"key\":\"question\",\"value\":\"Can I return it if I don\'t like it?\"},{\"key\":\"answer\",\"value\":\"Absolutely! We offer a hassle-free 30-day return policy. If you are not satisfied, you can return it for a full refund.\"}]]]',41,'Botble\\Ecommerce\\Models\\Product','2025-12-26 09:38:38','2025-12-26 09:38:38'),(42,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What is the warranty period?\"},{\"key\":\"answer\",\"value\":\"This product comes with a 1-year manufacturer warranty covering defects in materials and workmanship.\"}],[{\"key\":\"question\",\"value\":\"Is this item compatible with Mac and Windows?\"},{\"key\":\"answer\",\"value\":\"Yes, this product is fully compatible with both macOS and Windows operating systems out of the box.\"}],[{\"key\":\"question\",\"value\":\"How long does the battery last?\"},{\"key\":\"answer\",\"value\":\"The battery life is approximately 10 hours on a full charge, depending on usage conditions.\"}],[{\"key\":\"question\",\"value\":\"Does it come with a carrying case?\"},{\"key\":\"answer\",\"value\":\"Yes, a protective carrying case is included in the box to keep your device safe during travel.\"}],[{\"key\":\"question\",\"value\":\"Can I return it if I don\'t like it?\"},{\"key\":\"answer\",\"value\":\"Absolutely! We offer a hassle-free 30-day return policy. If you are not satisfied, you can return it for a full refund.\"}]]]',42,'Botble\\Ecommerce\\Models\\Product','2025-12-26 09:38:38','2025-12-26 09:38:38'),(43,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What is the warranty period?\"},{\"key\":\"answer\",\"value\":\"This product comes with a 1-year manufacturer warranty covering defects in materials and workmanship.\"}],[{\"key\":\"question\",\"value\":\"Is this item compatible with Mac and Windows?\"},{\"key\":\"answer\",\"value\":\"Yes, this product is fully compatible with both macOS and Windows operating systems out of the box.\"}],[{\"key\":\"question\",\"value\":\"How long does the battery last?\"},{\"key\":\"answer\",\"value\":\"The battery life is approximately 10 hours on a full charge, depending on usage conditions.\"}],[{\"key\":\"question\",\"value\":\"Does it come with a carrying case?\"},{\"key\":\"answer\",\"value\":\"Yes, a protective carrying case is included in the box to keep your device safe during travel.\"}],[{\"key\":\"question\",\"value\":\"Can I return it if I don\'t like it?\"},{\"key\":\"answer\",\"value\":\"Absolutely! We offer a hassle-free 30-day return policy. If you are not satisfied, you can return it for a full refund.\"}]]]',43,'Botble\\Ecommerce\\Models\\Product','2025-12-26 09:38:38','2025-12-26 09:38:38'),(44,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What is the warranty period?\"},{\"key\":\"answer\",\"value\":\"This product comes with a 1-year manufacturer warranty covering defects in materials and workmanship.\"}],[{\"key\":\"question\",\"value\":\"Is this item compatible with Mac and Windows?\"},{\"key\":\"answer\",\"value\":\"Yes, this product is fully compatible with both macOS and Windows operating systems out of the box.\"}],[{\"key\":\"question\",\"value\":\"How long does the battery last?\"},{\"key\":\"answer\",\"value\":\"The battery life is approximately 10 hours on a full charge, depending on usage conditions.\"}],[{\"key\":\"question\",\"value\":\"Does it come with a carrying case?\"},{\"key\":\"answer\",\"value\":\"Yes, a protective carrying case is included in the box to keep your device safe during travel.\"}],[{\"key\":\"question\",\"value\":\"Can I return it if I don\'t like it?\"},{\"key\":\"answer\",\"value\":\"Absolutely! We offer a hassle-free 30-day return policy. If you are not satisfied, you can return it for a full refund.\"}]]]',44,'Botble\\Ecommerce\\Models\\Product','2025-12-26 09:38:38','2025-12-26 09:38:38'),(45,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What is the warranty period?\"},{\"key\":\"answer\",\"value\":\"This product comes with a 1-year manufacturer warranty covering defects in materials and workmanship.\"}],[{\"key\":\"question\",\"value\":\"Is this item compatible with Mac and Windows?\"},{\"key\":\"answer\",\"value\":\"Yes, this product is fully compatible with both macOS and Windows operating systems out of the box.\"}],[{\"key\":\"question\",\"value\":\"How long does the battery last?\"},{\"key\":\"answer\",\"value\":\"The battery life is approximately 10 hours on a full charge, depending on usage conditions.\"}],[{\"key\":\"question\",\"value\":\"Does it come with a carrying case?\"},{\"key\":\"answer\",\"value\":\"Yes, a protective carrying case is included in the box to keep your device safe during travel.\"}],[{\"key\":\"question\",\"value\":\"Can I return it if I don\'t like it?\"},{\"key\":\"answer\",\"value\":\"Absolutely! We offer a hassle-free 30-day return policy. If you are not satisfied, you can return it for a full refund.\"}]]]',45,'Botble\\Ecommerce\\Models\\Product','2025-12-26 09:38:38','2025-12-26 09:38:38'),(46,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What is the warranty period?\"},{\"key\":\"answer\",\"value\":\"This product comes with a 1-year manufacturer warranty covering defects in materials and workmanship.\"}],[{\"key\":\"question\",\"value\":\"Is this item compatible with Mac and Windows?\"},{\"key\":\"answer\",\"value\":\"Yes, this product is fully compatible with both macOS and Windows operating systems out of the box.\"}],[{\"key\":\"question\",\"value\":\"How long does the battery last?\"},{\"key\":\"answer\",\"value\":\"The battery life is approximately 10 hours on a full charge, depending on usage conditions.\"}],[{\"key\":\"question\",\"value\":\"Does it come with a carrying case?\"},{\"key\":\"answer\",\"value\":\"Yes, a protective carrying case is included in the box to keep your device safe during travel.\"}],[{\"key\":\"question\",\"value\":\"Can I return it if I don\'t like it?\"},{\"key\":\"answer\",\"value\":\"Absolutely! We offer a hassle-free 30-day return policy. If you are not satisfied, you can return it for a full refund.\"}]]]',46,'Botble\\Ecommerce\\Models\\Product','2025-12-26 09:38:38','2025-12-26 09:38:38'),(47,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What is the warranty period?\"},{\"key\":\"answer\",\"value\":\"This product comes with a 1-year manufacturer warranty covering defects in materials and workmanship.\"}],[{\"key\":\"question\",\"value\":\"Is this item compatible with Mac and Windows?\"},{\"key\":\"answer\",\"value\":\"Yes, this product is fully compatible with both macOS and Windows operating systems out of the box.\"}],[{\"key\":\"question\",\"value\":\"How long does the battery last?\"},{\"key\":\"answer\",\"value\":\"The battery life is approximately 10 hours on a full charge, depending on usage conditions.\"}],[{\"key\":\"question\",\"value\":\"Does it come with a carrying case?\"},{\"key\":\"answer\",\"value\":\"Yes, a protective carrying case is included in the box to keep your device safe during travel.\"}],[{\"key\":\"question\",\"value\":\"Can I return it if I don\'t like it?\"},{\"key\":\"answer\",\"value\":\"Absolutely! We offer a hassle-free 30-day return policy. If you are not satisfied, you can return it for a full refund.\"}]]]',47,'Botble\\Ecommerce\\Models\\Product','2025-12-26 09:38:38','2025-12-26 09:38:38'),(48,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What is the warranty period?\"},{\"key\":\"answer\",\"value\":\"This product comes with a 1-year manufacturer warranty covering defects in materials and workmanship.\"}],[{\"key\":\"question\",\"value\":\"Is this item compatible with Mac and Windows?\"},{\"key\":\"answer\",\"value\":\"Yes, this product is fully compatible with both macOS and Windows operating systems out of the box.\"}],[{\"key\":\"question\",\"value\":\"How long does the battery last?\"},{\"key\":\"answer\",\"value\":\"The battery life is approximately 10 hours on a full charge, depending on usage conditions.\"}],[{\"key\":\"question\",\"value\":\"Does it come with a carrying case?\"},{\"key\":\"answer\",\"value\":\"Yes, a protective carrying case is included in the box to keep your device safe during travel.\"}],[{\"key\":\"question\",\"value\":\"Can I return it if I don\'t like it?\"},{\"key\":\"answer\",\"value\":\"Absolutely! We offer a hassle-free 30-day return policy. If you are not satisfied, you can return it for a full refund.\"}]]]',48,'Botble\\Ecommerce\\Models\\Product','2025-12-26 09:38:38','2025-12-26 09:38:38'),(49,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What is the warranty period?\"},{\"key\":\"answer\",\"value\":\"This product comes with a 1-year manufacturer warranty covering defects in materials and workmanship.\"}],[{\"key\":\"question\",\"value\":\"Is this item compatible with Mac and Windows?\"},{\"key\":\"answer\",\"value\":\"Yes, this product is fully compatible with both macOS and Windows operating systems out of the box.\"}],[{\"key\":\"question\",\"value\":\"How long does the battery last?\"},{\"key\":\"answer\",\"value\":\"The battery life is approximately 10 hours on a full charge, depending on usage conditions.\"}],[{\"key\":\"question\",\"value\":\"Does it come with a carrying case?\"},{\"key\":\"answer\",\"value\":\"Yes, a protective carrying case is included in the box to keep your device safe during travel.\"}],[{\"key\":\"question\",\"value\":\"Can I return it if I don\'t like it?\"},{\"key\":\"answer\",\"value\":\"Absolutely! We offer a hassle-free 30-day return policy. If you are not satisfied, you can return it for a full refund.\"}]]]',49,'Botble\\Ecommerce\\Models\\Product','2025-12-26 09:38:38','2025-12-26 09:38:38'),(50,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What is the warranty period?\"},{\"key\":\"answer\",\"value\":\"This product comes with a 1-year manufacturer warranty covering defects in materials and workmanship.\"}],[{\"key\":\"question\",\"value\":\"Is this item compatible with Mac and Windows?\"},{\"key\":\"answer\",\"value\":\"Yes, this product is fully compatible with both macOS and Windows operating systems out of the box.\"}],[{\"key\":\"question\",\"value\":\"How long does the battery last?\"},{\"key\":\"answer\",\"value\":\"The battery life is approximately 10 hours on a full charge, depending on usage conditions.\"}],[{\"key\":\"question\",\"value\":\"Does it come with a carrying case?\"},{\"key\":\"answer\",\"value\":\"Yes, a protective carrying case is included in the box to keep your device safe during travel.\"}],[{\"key\":\"question\",\"value\":\"Can I return it if I don\'t like it?\"},{\"key\":\"answer\",\"value\":\"Absolutely! We offer a hassle-free 30-day return policy. If you are not satisfied, you can return it for a full refund.\"}]]]',50,'Botble\\Ecommerce\\Models\\Product','2025-12-26 09:38:38','2025-12-26 09:38:38'),(51,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What is the warranty period?\"},{\"key\":\"answer\",\"value\":\"This product comes with a 1-year manufacturer warranty covering defects in materials and workmanship.\"}],[{\"key\":\"question\",\"value\":\"Is this item compatible with Mac and Windows?\"},{\"key\":\"answer\",\"value\":\"Yes, this product is fully compatible with both macOS and Windows operating systems out of the box.\"}],[{\"key\":\"question\",\"value\":\"How long does the battery last?\"},{\"key\":\"answer\",\"value\":\"The battery life is approximately 10 hours on a full charge, depending on usage conditions.\"}],[{\"key\":\"question\",\"value\":\"Does it come with a carrying case?\"},{\"key\":\"answer\",\"value\":\"Yes, a protective carrying case is included in the box to keep your device safe during travel.\"}],[{\"key\":\"question\",\"value\":\"Can I return it if I don\'t like it?\"},{\"key\":\"answer\",\"value\":\"Absolutely! We offer a hassle-free 30-day return policy. If you are not satisfied, you can return it for a full refund.\"}]]]',51,'Botble\\Ecommerce\\Models\\Product','2025-12-26 09:38:38','2025-12-26 09:38:38'),(52,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What is the warranty period?\"},{\"key\":\"answer\",\"value\":\"This product comes with a 1-year manufacturer warranty covering defects in materials and workmanship.\"}],[{\"key\":\"question\",\"value\":\"Is this item compatible with Mac and Windows?\"},{\"key\":\"answer\",\"value\":\"Yes, this product is fully compatible with both macOS and Windows operating systems out of the box.\"}],[{\"key\":\"question\",\"value\":\"How long does the battery last?\"},{\"key\":\"answer\",\"value\":\"The battery life is approximately 10 hours on a full charge, depending on usage conditions.\"}],[{\"key\":\"question\",\"value\":\"Does it come with a carrying case?\"},{\"key\":\"answer\",\"value\":\"Yes, a protective carrying case is included in the box to keep your device safe during travel.\"}],[{\"key\":\"question\",\"value\":\"Can I return it if I don\'t like it?\"},{\"key\":\"answer\",\"value\":\"Absolutely! We offer a hassle-free 30-day return policy. If you are not satisfied, you can return it for a full refund.\"}]]]',52,'Botble\\Ecommerce\\Models\\Product','2025-12-26 09:38:38','2025-12-26 09:38:38'),(53,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What is the warranty period?\"},{\"key\":\"answer\",\"value\":\"This product comes with a 1-year manufacturer warranty covering defects in materials and workmanship.\"}],[{\"key\":\"question\",\"value\":\"Is this item compatible with Mac and Windows?\"},{\"key\":\"answer\",\"value\":\"Yes, this product is fully compatible with both macOS and Windows operating systems out of the box.\"}],[{\"key\":\"question\",\"value\":\"How long does the battery last?\"},{\"key\":\"answer\",\"value\":\"The battery life is approximately 10 hours on a full charge, depending on usage conditions.\"}],[{\"key\":\"question\",\"value\":\"Does it come with a carrying case?\"},{\"key\":\"answer\",\"value\":\"Yes, a protective carrying case is included in the box to keep your device safe during travel.\"}],[{\"key\":\"question\",\"value\":\"Can I return it if I don\'t like it?\"},{\"key\":\"answer\",\"value\":\"Absolutely! We offer a hassle-free 30-day return policy. If you are not satisfied, you can return it for a full refund.\"}]]]',53,'Botble\\Ecommerce\\Models\\Product','2025-12-26 09:38:38','2025-12-26 09:38:38'),(54,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What is the warranty period?\"},{\"key\":\"answer\",\"value\":\"This product comes with a 1-year manufacturer warranty covering defects in materials and workmanship.\"}],[{\"key\":\"question\",\"value\":\"Is this item compatible with Mac and Windows?\"},{\"key\":\"answer\",\"value\":\"Yes, this product is fully compatible with both macOS and Windows operating systems out of the box.\"}],[{\"key\":\"question\",\"value\":\"How long does the battery last?\"},{\"key\":\"answer\",\"value\":\"The battery life is approximately 10 hours on a full charge, depending on usage conditions.\"}],[{\"key\":\"question\",\"value\":\"Does it come with a carrying case?\"},{\"key\":\"answer\",\"value\":\"Yes, a protective carrying case is included in the box to keep your device safe during travel.\"}],[{\"key\":\"question\",\"value\":\"Can I return it if I don\'t like it?\"},{\"key\":\"answer\",\"value\":\"Absolutely! We offer a hassle-free 30-day return policy. If you are not satisfied, you can return it for a full refund.\"}]]]',54,'Botble\\Ecommerce\\Models\\Product','2025-12-26 09:38:39','2025-12-26 09:38:39'),(55,'tablet_image','[\"sliders\\/1-md.jpg\"]',1,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2025-12-26 09:38:52','2025-12-26 09:38:52'),(56,'mobile_image','[\"sliders\\/1-sm.jpg\"]',1,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2025-12-26 09:38:52','2025-12-26 09:38:52'),(57,'tablet_image','[\"sliders\\/2-md.jpg\"]',2,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2025-12-26 09:38:52','2025-12-26 09:38:52'),(58,'mobile_image','[\"sliders\\/2-sm.jpg\"]',2,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2025-12-26 09:38:52','2025-12-26 09:38:52'),(59,'tablet_image','[\"sliders\\/3-md.jpg\"]',3,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2025-12-26 09:38:52','2025-12-26 09:38:52'),(60,'mobile_image','[\"sliders\\/3-sm.jpg\"]',3,'Botble\\SimpleSlider\\Models\\SimpleSliderItem','2025-12-26 09:38:52','2025-12-26 09:38:52');
/*!40000 ALTER TABLE `meta_boxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=291 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000001_create_cache_table',1),(2,'2013_04_09_032329_create_base_tables',1),(3,'2013_04_09_062329_create_revisions_table',1),(4,'2014_10_12_000000_create_users_table',1),(5,'2014_10_12_100000_create_password_reset_tokens_table',1),(6,'2016_06_10_230148_create_acl_tables',1),(7,'2016_06_14_230857_create_menus_table',1),(8,'2016_06_28_221418_create_pages_table',1),(9,'2016_10_05_074239_create_setting_table',1),(10,'2016_11_28_032840_create_dashboard_widget_tables',1),(11,'2016_12_16_084601_create_widgets_table',1),(12,'2017_05_09_070343_create_media_tables',1),(13,'2017_11_03_070450_create_slug_table',1),(14,'2019_01_05_053554_create_jobs_table',1),(15,'2019_08_19_000000_create_failed_jobs_table',1),(16,'2019_12_14_000001_create_personal_access_tokens_table',1),(17,'2021_08_02_084121_fix_old_shortcode',1),(18,'2022_04_20_100851_add_index_to_media_table',1),(19,'2022_04_20_101046_add_index_to_menu_table',1),(20,'2022_07_10_034813_move_lang_folder_to_root',1),(21,'2022_08_04_051940_add_missing_column_expires_at',1),(22,'2022_09_01_000001_create_admin_notifications_tables',1),(23,'2022_10_14_024629_drop_column_is_featured',1),(24,'2022_11_18_063357_add_missing_timestamp_in_table_settings',1),(25,'2022_12_02_093615_update_slug_index_columns',1),(26,'2023_01_30_024431_add_alt_to_media_table',1),(27,'2023_02_16_042611_drop_table_password_resets',1),(28,'2023_04_23_005903_add_column_permissions_to_admin_notifications',1),(29,'2023_05_10_075124_drop_column_id_in_role_users_table',1),(30,'2023_08_21_090810_make_page_content_nullable',1),(31,'2023_09_14_021936_update_index_for_slugs_table',1),(32,'2023_12_07_095130_add_color_column_to_media_folders_table',1),(33,'2023_12_17_162208_make_sure_column_color_in_media_folders_nullable',1),(34,'2024_04_04_110758_update_value_column_in_user_meta_table',1),(35,'2024_05_04_030654_improve_social_links',1),(36,'2024_05_12_091229_add_column_visibility_to_table_media_files',1),(37,'2024_07_07_091316_fix_column_url_in_menu_nodes_table',1),(38,'2024_07_12_100000_change_random_hash_for_media',1),(39,'2024_09_30_024515_create_sessions_table',1),(40,'2024_12_01_000000_add_indexes_to_pages_translations_table',1),(41,'2024_12_01_000000_add_key_prefix_index_to_slugs_table',1),(42,'2024_12_19_000001_create_device_tokens_table',1),(43,'2024_12_19_000002_create_push_notifications_table',1),(44,'2024_12_19_000003_create_push_notification_recipients_table',1),(45,'2024_12_30_000001_create_user_settings_table',1),(46,'2025_07_06_030754_add_phone_to_users_table',1),(47,'2025_07_31_add_performance_indexes_to_slugs_table',1),(48,'2025_11_10_000000_cleanup_duplicate_widgets',1),(49,'2025_11_30_100000_add_sessions_invalidated_at_to_users_table',1),(50,'2020_11_18_150916_ads_create_ads_table',2),(51,'2021_12_02_035301_add_ads_translations_table',2),(52,'2023_04_17_062645_add_open_in_new_tab',2),(53,'2023_11_07_023805_add_tablet_mobile_image',2),(54,'2024_04_01_043317_add_google_adsense_slot_id_to_ads_table',2),(55,'2025_04_21_000000_add_tablet_mobile_image_to_ads_translations_table',2),(56,'2024_04_27_100730_improve_analytics_setting',3),(57,'2015_06_29_025744_create_audit_history',4),(58,'2023_11_14_033417_change_request_column_in_table_audit_histories',4),(59,'2025_05_05_000001_add_user_type_to_audit_histories_table',4),(60,'2025_11_07_000001_add_actor_type_to_audit_histories_table',4),(61,'2015_06_18_033822_create_blog_table',5),(62,'2021_02_16_092633_remove_default_value_for_author_type',5),(63,'2021_12_03_030600_create_blog_translations',5),(64,'2022_04_19_113923_add_index_to_table_posts',5),(65,'2023_08_29_074620_make_column_author_id_nullable',5),(66,'2024_07_30_091615_fix_order_column_in_categories_table',5),(67,'2024_12_01_000000_add_indexes_to_blog_translations_tables',5),(68,'2025_01_06_033807_add_default_value_for_categories_author_type',5),(69,'2016_06_17_091537_create_contacts_table',6),(70,'2023_11_10_080225_migrate_contact_blacklist_email_domains_to_core',6),(71,'2024_03_20_080001_migrate_change_attribute_email_to_nullable_form_contacts_table',6),(72,'2024_03_25_000001_update_captcha_settings_for_contact',6),(73,'2024_04_19_063914_create_custom_fields_table',6),(74,'2024_12_01_000000_add_indexes_to_contact_translations_tables',6),(75,'2020_03_05_041139_create_ecommerce_tables',7),(76,'2021_01_01_044147_ecommerce_create_flash_sale_table',7),(77,'2021_01_17_082713_add_column_is_featured_to_product_collections_table',7),(78,'2021_01_18_024333_add_zip_code_into_table_customer_addresses',7),(79,'2021_02_18_073505_update_table_ec_reviews',7),(80,'2021_03_10_024419_add_column_confirmed_at_to_table_ec_customers',7),(81,'2021_03_10_025153_change_column_tax_amount',7),(82,'2021_03_20_033103_add_column_availability_to_table_ec_products',7),(83,'2021_04_28_074008_ecommerce_create_product_label_table',7),(84,'2021_05_31_173037_ecommerce_create_ec_products_translations',7),(85,'2021_08_17_105016_remove_column_currency_id_in_some_tables',7),(86,'2021_08_30_142128_add_images_column_to_ec_reviews_table',7),(87,'2021_10_04_030050_add_column_created_by_to_table_ec_products',7),(88,'2021_10_05_122616_add_status_column_to_ec_customers_table',7),(89,'2021_11_03_025806_nullable_phone_number_in_ec_customer_addresses',7),(90,'2021_11_23_071403_correct_languages_for_product_variations',7),(91,'2021_11_28_031808_add_product_tags_translations',7),(92,'2021_12_01_031123_add_featured_image_to_ec_products',7),(93,'2022_01_01_033107_update_table_ec_shipments',7),(94,'2022_02_16_042457_improve_product_attribute_sets',7),(95,'2022_03_22_075758_correct_product_name',7),(96,'2022_04_19_113334_add_index_to_ec_products',7),(97,'2022_04_28_144405_remove_unused_table',7),(98,'2022_05_05_115015_create_ec_customer_recently_viewed_products_table',7),(99,'2022_05_18_143720_add_index_to_table_ec_product_categories',7),(100,'2022_06_16_095633_add_index_to_some_tables',7),(101,'2022_06_30_035148_create_order_referrals_table',7),(102,'2022_07_24_153815_add_completed_at_to_ec_orders_table',7),(103,'2022_08_14_032836_create_ec_order_returns_table',7),(104,'2022_08_14_033554_create_ec_order_return_items_table',7),(105,'2022_08_15_040324_add_billing_address',7),(106,'2022_08_30_091114_support_digital_products_table',7),(107,'2022_09_13_095744_create_options_table',7),(108,'2022_09_13_104347_create_option_value_table',7),(109,'2022_10_05_163518_alter_table_ec_order_product',7),(110,'2022_10_12_041517_create_invoices_table',7),(111,'2022_10_12_142226_update_orders_table',7),(112,'2022_10_13_024916_update_table_order_returns',7),(113,'2022_10_21_030830_update_columns_in_ec_shipments_table',7),(114,'2022_10_28_021046_update_columns_in_ec_shipments_table',7),(115,'2022_11_16_034522_update_type_column_in_ec_shipping_rules_table',7),(116,'2022_11_19_041643_add_ec_tax_product_table',7),(117,'2022_12_12_063830_update_tax_defadult_in_ec_tax_products_table',7),(118,'2022_12_17_041532_fix_address_in_order_invoice',7),(119,'2022_12_26_070329_create_ec_product_views_table',7),(120,'2023_01_04_033051_fix_product_categories',7),(121,'2023_01_09_050400_add_ec_global_options_translations_table',7),(122,'2023_01_10_093754_add_missing_option_value_id',7),(123,'2023_01_17_082713_add_column_barcode_and_cost_per_item_to_product_table',7),(124,'2023_01_26_021854_add_ec_customer_used_coupons_table',7),(125,'2023_02_08_015900_update_options_column_in_ec_order_product_table',7),(126,'2023_02_27_095752_remove_duplicate_reviews',7),(127,'2023_03_20_115757_add_user_type_column_to_ec_shipment_histories_table',7),(128,'2023_04_21_082427_create_ec_product_categorizables_table',7),(129,'2023_05_03_011331_add_missing_column_price_into_invoice_items_table',7),(130,'2023_05_17_025812_fix_invoice_issue',7),(131,'2023_05_26_073140_move_option_make_phone_field_optional_at_checkout_page_to_mandatory_fields',7),(132,'2023_05_27_144611_fix_exchange_rate_setting',7),(133,'2023_06_22_084331_add_generate_license_code_to_ec_products_table',7),(134,'2023_06_30_042512_create_ec_order_tax_information_table',7),(135,'2023_07_14_022724_remove_column_id_from_ec_product_collection_products',7),(136,'2023_08_09_012940_remove_column_status_in_ec_product_attributes',7),(137,'2023_08_15_064505_create_ec_tax_rules_table',7),(138,'2023_08_21_021819_make_column_address_in_ec_customer_addresses_nullable',7),(139,'2023_08_22_094114_drop_unique_for_barcode',7),(140,'2023_08_30_031811_add_apply_via_url_column_to_ec_discounts_table',7),(141,'2023_09_07_094312_add_index_to_product_sku_and_translations',7),(142,'2023_09_19_024955_create_discount_product_categories_table',7),(143,'2023_10_17_070728_add_icon_and_icon_image_to_product_categories_table',7),(144,'2023_11_22_154643_add_unique_in_table_ec_products_variations',7),(145,'2023_11_27_032313_add_price_columns_to_ec_product_cross_sale_relations_table',7),(146,'2023_12_06_023945_add_display_on_checkout_column_to_ec_discounts_table',7),(147,'2023_12_25_040604_ec_create_review_replies_table',7),(148,'2023_12_26_090340_add_private_notes_column_to_ec_customers_table',7),(149,'2024_01_16_070706_fix_translation_tables',7),(150,'2024_01_23_075227_add_proof_file_to_ec_orders_table',7),(151,'2024_03_26_041531_add_cancel_reason_to_ec_orders_table',7),(152,'2024_03_27_062402_create_ec_customer_deletion_requests_table',7),(153,'2024_03_29_042242_migrate_old_captcha_settings',7),(154,'2024_03_29_093946_create_ec_order_return_histories_table',7),(155,'2024_04_01_063523_add_customer_columns_to_ec_reviews_table',7),(156,'2024_04_15_092654_migrate_ecommerce_google_tag_manager_code_setting',7),(157,'2024_04_16_035713_add_min_max_order_quantity_columns_to_products_table',7),(158,'2024_05_07_073153_improve_table_wishlist',7),(159,'2024_05_07_093703_add_missing_zip_code_into_table_store_locators',7),(160,'2024_05_15_021503_fix_invoice_path',7),(161,'2024_06_20_160724_create_ec_shared_wishlists_table',7),(162,'2024_06_28_025104_add_notify_attachment_updated_column_to_ec_products_table',7),(163,'2024_07_03_030900_add_downloaded_at_column_to_ec_order_product_table',7),(164,'2024_07_14_071826_make_customer_email_nullable',7),(165,'2024_07_15_104916_add_video_media_column_to_ec_products_table',7),(166,'2024_07_26_052530_add_percentage_to_tax_rules_table',7),(167,'2024_08_14_123028_add_customer_delivered_confirmed_at_column_to_ec_shipments_table',7),(168,'2024_08_19_132849_create_specification_tables',7),(169,'2024_09_07_060744_add_author_column_to_specification_tables',7),(170,'2024_09_14_064023_add_can_use_with_flash_sale_column_to_ec_discounts_table',7),(171,'2024_09_25_073928_remove_wrong_product_slugs',7),(172,'2024_12_01_000000_add_indexes_to_ecommerce_translations_tables',7),(173,'2025_01_10_000000_fix_order_invoice_rounding_issues',7),(174,'2025_01_15_050230_migrate_old_theme_options',7),(175,'2025_01_15_optimize_products_export_index',7),(176,'2025_01_17_082713_correct_column_barcode_and_cost_per_item_to_product_table',7),(177,'2025_01_24_044641_migrate_old_country_data',7),(178,'2025_01_28_233602_add_private_notes_into_ec_orders_table',7),(179,'2025_02_13_021247_add_tax_translations',7),(180,'2025_02_24_152621_add_text_color_to_product_labels_table',7),(181,'2025_04_12_000001_add_payment_fee_to_ec_orders_table',7),(182,'2025_04_12_000002_add_payment_fee_to_ec_invoices_table',7),(183,'2025_05_05_092036_make_user_id_and_tax_amount_nullable',7),(184,'2025_05_15_082342_drop_email_unique_index_in_ec_customers_table',7),(185,'2025_06_07_081731_add_translations_for_specification_groups_and_tables',7),(186,'2025_06_17_091813_increase_note_in_shipments_table',7),(187,'2025_06_24_000001_create_ec_product_license_codes_table',7),(188,'2025_06_24_080427_add_license_code_type_to_products_table',7),(189,'2025_07_06_062402_create_ec_customer_deletion_requests_table',7),(190,'2025_07_07_161729_change_license_code_to_text_in_ec_product_license_codes_table',7),(191,'2025_07_08_162756_increase_license_code_column_size_in_ec_order_product_table',7),(192,'2025_07_09_000001_add_customer_address_fields_to_ec_invoices_table',7),(193,'2025_07_15_090809_create_ec_abandoned_carts_table',7),(194,'2025_07_24_120510_increase_barcode_column_length_in_ec_products_table',7),(195,'2025_07_31_133600_add_performance_indexes_to_ec_product_categories_table',7),(196,'2025_08_01_161205_optimize_product_variation_query_indexes',7),(197,'2025_08_08_145059_correct_tax_amount_in_order_and_invoice_tables',7),(198,'2025_09_05_025247_create_ec_product_specification_attribute_translations_table',7),(199,'2025_09_08_025516_add_variations_count_to_ec_products_table',7),(200,'2025_09_08_080248_add_slug_column_to_ec_product_categories_table',7),(201,'2025_09_08_080330_add_slug_column_to_ec_product_categories_translations_table',7),(202,'2025_09_08_080443_populate_slug_column_for_product_categories',7),(203,'2025_09_08_081216_add_slug_column_to_ec_products_table',7),(204,'2025_09_08_081237_add_slug_column_to_ec_products_translations_table',7),(205,'2025_09_08_081321_populate_slug_column_for_products',7),(206,'2025_09_10_073321_add_performance_indexes_to_ecommerce_tables',7),(207,'2025_09_18_093922_fix_tax_rounding_in_order_products_and_invoices',7),(208,'2025_09_21_030756_add_reviews_cache_to_ec_products_table',7),(209,'2025_09_30_090432_add_performance_indexes_to_ec_product_categories_table',7),(210,'2025_10_10_090331_add_number_format_style_to_ec_currencies_table',7),(211,'2025_10_10_092235_add_space_between_price_and_currency_to_ec_currencies_table',7),(212,'2025_10_11_074318_add_price_includes_tax_to_ec_products_table',7),(213,'2025_10_13_043527_generate_slugs_for_product_collections',7),(214,'2025_10_22_020518_add_verification_code_to_ec_customer_deletion_requests_table',7),(215,'2025_10_22_090000_remove_duplicate_order_addresses',7),(216,'2025_10_28_133220_add_unique_order_id_to_shipments_table',7),(217,'2025_10_28_134738_fix_order_payment_shipment_discount_data_issues',7),(218,'2025_11_05_032148_add_performance_indexes_to_ecommerce_tables',7),(219,'2025_11_10_100000_create_ec_order_metadata_table',7),(220,'2025_11_12_100000_improve_ec_customer_recently_viewed_products_table',7),(221,'2025_11_18_214150_add_covering_indexes_to_product_relation_tables',7),(222,'2025_12_02_045049_add_index_to_product_labels_table',7),(223,'2025_12_12_150000_add_sequence_columns_to_abandoned_carts',7),(224,'2025_12_16_160000_add_is_new_until_to_ec_products_table',7),(225,'2018_07_09_221238_create_faq_table',8),(226,'2021_12_03_082134_create_faq_translations',8),(227,'2023_11_17_063408_add_description_column_to_faq_categories_table',8),(228,'2024_12_01_000000_add_indexes_to_faq_translations_tables',8),(229,'2016_10_03_032336_create_languages_table',9),(230,'2023_09_14_022423_add_index_for_language_table',9),(231,'2021_10_25_021023_fix-priority-load-for-language-advanced',10),(232,'2021_12_03_075608_create_page_translations',10),(233,'2023_07_06_011444_create_slug_translations_table',10),(234,'2024_12_01_000000_add_indexes_to_slugs_translations_table',10),(235,'2019_11_18_061011_create_country_table',11),(236,'2021_12_03_084118_create_location_translations',11),(237,'2021_12_03_094518_migrate_old_location_data',11),(238,'2021_12_10_034440_switch_plugin_location_to_use_language_advanced',11),(239,'2022_01_16_085908_improve_plugin_location',11),(240,'2022_08_04_052122_delete_location_backup_tables',11),(241,'2023_04_23_061847_increase_state_translations_abbreviation_column',11),(242,'2023_07_26_041451_add_more_columns_to_location_table',11),(243,'2023_07_27_041451_add_more_columns_to_location_translation_table',11),(244,'2023_08_15_073307_drop_unique_in_states_cities_translations',11),(245,'2023_10_21_065016_make_state_id_in_table_cities_nullable',11),(246,'2024_08_17_094600_add_image_into_countries',11),(247,'2025_01_08_093652_add_zip_code_to_cities',11),(248,'2025_07_31_083459_add_indexes_for_location_search_performance',11),(249,'2021_07_06_030002_create_marketplace_table',12),(250,'2021_09_04_150137_add_vendor_verified_at_to_ec_customers_table',12),(251,'2021_10_04_033903_add_column_approved_by_into_table_ec_products',12),(252,'2021_10_06_124943_add_transaction_id_column_to_mp_customer_withdrawals_table',12),(253,'2021_10_10_054216_add_columns_to_mp_customer_revenues_table',12),(254,'2021_12_06_031304_update_table_mp_customer_revenues',12),(255,'2022_10_19_152916_add_columns_to_mp_stores_table',12),(256,'2022_10_20_062849_create_mp_category_sale_commissions_table',12),(257,'2022_11_02_071413_add_more_info_for_store',12),(258,'2022_11_02_080444_add_tax_info',12),(259,'2023_02_01_062030_add_store_translations',12),(260,'2023_02_13_032133_update_fee_column_mp_customer_revenues_table',12),(261,'2023_02_17_023648_fix_store_prefix',12),(262,'2024_04_03_062451_add_cover_image_to_table_mp_stores',12),(263,'2024_05_07_082630_create_mp_messages_table',12),(264,'2024_07_19_131849_add_documents_to_mp_stores_table',12),(265,'2024_08_18_083119_add_tax_id_column_to_mp_stores_table',12),(266,'2024_08_27_141244_add_block_reason_to_ec_customers_table',12),(267,'2024_09_17_125408_add_square_logo_to_stores_table',12),(268,'2025_07_31_021805_add_indexes_for_vendor_categories_optimization',12),(269,'2025_08_07_073854_add_verification_fields_to_mp_stores_table',12),(270,'2025_11_05_000001_add_indexes_for_marketplace_performance_optimization',12),(271,'2017_10_24_154832_create_newsletter_table',13),(272,'2024_03_25_000001_update_captcha_settings_for_newsletter',13),(273,'2017_05_18_080441_create_payment_tables',14),(274,'2021_03_27_144913_add_customer_type_into_table_payments',14),(275,'2021_05_24_034720_make_column_currency_nullable',14),(276,'2021_08_09_161302_add_metadata_column_to_payments_table',14),(277,'2021_10_19_020859_update_metadata_field',14),(278,'2022_06_28_151901_activate_paypal_stripe_plugin',14),(279,'2022_07_07_153354_update_charge_id_in_table_payments',14),(280,'2024_07_04_083133_create_payment_logs_table',14),(281,'2025_04_12_000003_add_payment_fee_to_payments_table',14),(282,'2025_05_22_000001_add_payment_fee_type_to_settings_table',14),(283,'2017_07_11_140018_create_simple_slider_table',15),(284,'2025_04_08_040931_create_social_logins_table',16),(285,'2024_09_14_100108_add_stripe_connect_details_to_ec_customers_table',17),(286,'2018_07_09_214610_create_testimonial_table',18),(287,'2021_12_03_083642_create_testimonials_translations',18),(288,'2024_12_01_000000_add_indexes_to_testimonials_translations_table',18),(289,'2016_10_07_193005_create_translations_table',19),(290,'2023_12_12_105220_drop_translations_table',19);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp_category_sale_commissions`
--

DROP TABLE IF EXISTS `mp_category_sale_commissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mp_category_sale_commissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_category_id` bigint unsigned NOT NULL,
  `commission_percentage` decimal(8,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mp_category_sale_commissions_product_category_id_unique` (`product_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp_category_sale_commissions`
--

LOCK TABLES `mp_category_sale_commissions` WRITE;
/*!40000 ALTER TABLE `mp_category_sale_commissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp_category_sale_commissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp_customer_revenues`
--

DROP TABLE IF EXISTS `mp_customer_revenues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mp_customer_revenues` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` bigint unsigned DEFAULT NULL,
  `order_id` bigint unsigned DEFAULT NULL,
  `sub_amount` decimal(15,2) DEFAULT '0.00',
  `fee` decimal(15,2) unsigned DEFAULT '0.00',
  `amount` decimal(15,2) DEFAULT '0.00',
  `current_balance` decimal(15,2) DEFAULT '0.00',
  `currency` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL DEFAULT '0',
  `type` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mp_customer_revenues_customer_id_index` (`customer_id`),
  KEY `mp_customer_revenues_order_id_index` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp_customer_revenues`
--

LOCK TABLES `mp_customer_revenues` WRITE;
/*!40000 ALTER TABLE `mp_customer_revenues` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp_customer_revenues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp_customer_withdrawals`
--

DROP TABLE IF EXISTS `mp_customer_withdrawals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mp_customer_withdrawals` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` bigint unsigned DEFAULT NULL,
  `fee` decimal(15,2) unsigned DEFAULT '0.00',
  `amount` decimal(15,2) unsigned DEFAULT '0.00',
  `current_balance` decimal(15,2) unsigned DEFAULT '0.00',
  `currency` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `bank_info` text COLLATE utf8mb4_unicode_ci,
  `payment_channel` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `images` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `transaction_id` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mp_customer_withdrawals_customer_id_index` (`customer_id`),
  KEY `mp_customer_withdrawals_status_index` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp_customer_withdrawals`
--

LOCK TABLES `mp_customer_withdrawals` WRITE;
/*!40000 ALTER TABLE `mp_customer_withdrawals` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp_customer_withdrawals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp_messages`
--

DROP TABLE IF EXISTS `mp_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mp_messages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `store_id` bigint unsigned NOT NULL,
  `customer_id` bigint unsigned DEFAULT NULL,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp_messages`
--

LOCK TABLES `mp_messages` WRITE;
/*!40000 ALTER TABLE `mp_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp_stores`
--

DROP TABLE IF EXISTS `mp_stores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mp_stores` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` bigint unsigned DEFAULT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo_square` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `is_verified` tinyint(1) NOT NULL DEFAULT '0',
  `verified_at` timestamp NULL DEFAULT NULL,
  `verified_by` bigint unsigned DEFAULT NULL,
  `verification_note` text COLLATE utf8mb4_unicode_ci,
  `vendor_verified_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `zip_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `certificate_file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `government_id_file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mp_stores_customer_id_index` (`customer_id`),
  KEY `mp_stores_status_index` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp_stores`
--

LOCK TABLES `mp_stores` WRITE;
/*!40000 ALTER TABLE `mp_stores` DISABLE KEYS */;
INSERT INTO `mp_stores` VALUES (1,'GoPro','doyle.osbaldo@example.org','+13806268002','2847 Isobel Underpass','AQ','Massachusetts','Boylestad',2,'stores/1.png',NULL,NULL,'In occaecati officiis qui enim. Eligendi sint quos et temporibus dignissimos necessitatibus itaque. Illum in dolores eligendi amet. Sunt similique illo blanditiis laboriosam quam suscipit. Odio dolorum suscipit quia et beatae iste voluptas. Aut minus tempora accusantium quisquam. Aut fugit tempora rerum provident quia est voluptatum. Et eaque exercitationem repellendus.','Founded in 2002, GoPro has grown into a global brand known for its action cameras and versatile accessories.','published',0,NULL,NULL,NULL,NULL,'2025-12-26 09:38:59','2025-12-26 09:38:59',NULL,NULL,NULL,NULL,NULL),(2,'Global Office','demond.upton@example.org','+14586702077','7493 Gislason Way','KE','Rhode Island','Predovicfort',3,'stores/2.png',NULL,NULL,'Doloribus enim rerum inventore distinctio esse culpa nihil. Et quis aperiam assumenda ea vero totam. Labore nobis ea excepturi distinctio incidunt sequi. Quia soluta quis quia commodi temporibus. Deserunt et consequuntur qui. Voluptatem modi expedita maiores aliquid exercitationem repudiandae. Eum sit mollitia dolores ut magnam qui repudiandae.','Global Office provides high-quality office supplies and equipment for businesses of all sizes.','published',1,'2025-11-04 09:38:57',NULL,'Verified business with valid documentation',NULL,'2025-12-26 09:38:59','2025-12-26 09:38:59',NULL,NULL,NULL,NULL,NULL),(3,'Young Shop','blick.demetrius@example.net','+13525103232','7078 Royce Island Apt. 999','HK','Wyoming','Lemkeborough',7,'stores/3.png',NULL,NULL,'Reprehenderit vitae culpa magni eum veniam aliquid. Qui molestiae iusto et quia qui qui dolores provident. Dolorum suscipit in reprehenderit voluptatem in. Vel odio aut omnis. Nihil minus eos eaque expedita eveniet necessitatibus. Quo voluptate voluptatem ipsum.','Young Shop specializes in trendy fashion and accessories for the youth market.','published',0,NULL,NULL,NULL,NULL,'2025-12-26 09:38:59','2025-12-26 09:38:59',NULL,NULL,NULL,NULL,NULL),(4,'Global Store','avandervort@example.org','+13808204469','29018 Zackery Summit Suite 798','SS','Colorado','West Alethaton',2,'stores/4.png',NULL,NULL,'Qui suscipit inventore eum voluptate et et suscipit. Ipsa voluptatibus ipsam in labore ratione. Culpa quidem eveniet accusantium enim commodi. Reprehenderit molestiae similique id nostrum mollitia aut praesentium.','Global Store offers a wide range of products from electronics to home goods at competitive prices.','published',1,'2025-07-13 09:38:57',NULL,'Authentic products and reliable service confirmed',NULL,'2025-12-26 09:38:59','2025-12-26 09:38:59',NULL,NULL,NULL,NULL,NULL),(5,'Robert\'s Store','bailey.baumbach@example.org','+13038163567','11335 Taurean Place Apt. 925','CC','Alaska','Gladysborough',2,'stores/5.png',NULL,NULL,'Unde repellendus et perspiciatis natus quidem omnis. Veniam id nobis qui quis perferendis labore. Animi quia voluptatum velit ad voluptatibus. Dolor rem mollitia pariatur facilis et vel quae doloremque. Dolor suscipit voluptatum dolorem dolor vel. Sapiente pariatur qui porro. Et expedita sunt fugit et quia.','Robert\'s Store is your destination for premium quality clothing and accessories.','published',1,'2025-08-26 09:38:57',NULL,'Authentic products and reliable service confirmed',NULL,'2025-12-26 09:38:59','2025-12-26 09:38:59',NULL,NULL,NULL,NULL,NULL),(6,'Stouffer','dvonrueden@example.com','+18086453910','842 Homenick Freeway Apt. 627','IO','Pennsylvania','Port Micheal',6,'stores/6.png',NULL,NULL,'Exercitationem numquam laudantium repellendus. Consequatur qui eos veritatis commodi voluptates corrupti quae. Ratione officiis quisquam explicabo id. Iste dolor blanditiis quia est magnam eum eum dolores. At ullam sed veniam est ut repellat ut. Et aut quos itaque. Laborum qui ut qui aut aut doloremque.','Stouffer brings you delicious, ready-to-eat meals that are perfect for busy lifestyles.','published',1,'2025-08-12 09:38:57',NULL,'Verified business with valid documentation',NULL,'2025-12-26 09:38:59','2025-12-26 09:38:59',NULL,NULL,NULL,NULL,NULL),(7,'StarKist','pdickens@example.net','+19792190026','22940 Runolfsdottir Wells','SR','Connecticut','South Ronaldo',5,'stores/7.png',NULL,NULL,'Inventore ut aut dolorem consequatur voluptatibus corrupti. Et est ut iste quod voluptatem beatae suscipit. Sit iure consequuntur aut nihil nam quam et nemo. Minus numquam deserunt sint quae rem ut suscipit. Ut est itaque dolore dolorum.','StarKist is committed to providing sustainable seafood products of the highest quality.','published',1,'2025-07-23 09:38:57',NULL,'Verified business with valid documentation',NULL,'2025-12-26 09:38:59','2025-12-26 09:38:59',NULL,NULL,NULL,NULL,NULL),(8,'Old El Paso','lrath@example.net','+18729923104','47868 Bergstrom Garden','PL','Virginia','Olsonbury',8,'stores/8.png',NULL,NULL,'Voluptas at expedita iste repellendus. Maiores doloremque tenetur nisi voluptatem. Ratione consequatur eveniet iure repudiandae et. Dolore aperiam atque nobis natus. Repellendus ut corporis est omnis. Recusandae odio non vel temporibus ea eos autem aut. Quisquam consequatur quia at ut earum voluptas ut. Voluptates voluptatum dolores fuga id eos quis ex quia.','Old El Paso brings the flavors of Mexico to your table with authentic ingredients and recipes.','published',1,'2025-10-02 09:38:57',NULL,'Established vendor with proven track record',NULL,'2025-12-26 09:38:59','2025-12-26 09:38:59',NULL,NULL,NULL,NULL,NULL),(9,'Tyson','ian.hills@example.org','+18289180344','357 Nicolas Loaf','RW','South Carolina','New Penelope',4,'stores/9.png',NULL,NULL,'Itaque fugiat et accusantium voluptatum aut vel ipsam. Ut vel non nesciunt porro velit. Consequatur adipisci et facilis quia asperiores velit aut. Ut deleniti non atque eligendi. Earum aliquid magnam nobis sit. Quidem quaerat ea ab illo sunt molestiae repellat.','Tyson offers a variety of protein products to help you create delicious meals for your family.','published',1,'2025-08-25 09:38:57',NULL,'Established vendor with proven track record',NULL,'2025-12-26 09:38:59','2025-12-26 09:38:59',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `mp_stores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp_stores_translations`
--

DROP TABLE IF EXISTS `mp_stores_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mp_stores_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mp_stores_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`mp_stores_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp_stores_translations`
--

LOCK TABLES `mp_stores_translations` WRITE;
/*!40000 ALTER TABLE `mp_stores_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp_stores_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp_vendor_info`
--

DROP TABLE IF EXISTS `mp_vendor_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mp_vendor_info` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` bigint unsigned NOT NULL DEFAULT '0',
  `balance` decimal(15,2) NOT NULL DEFAULT '0.00',
  `total_fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `total_revenue` decimal(15,2) NOT NULL DEFAULT '0.00',
  `signature` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_info` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `payout_payment_method` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT 'bank_transfer',
  `tax_info` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mp_vendor_info_customer_id_index` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp_vendor_info`
--

LOCK TABLES `mp_vendor_info` WRITE;
/*!40000 ALTER TABLE `mp_vendor_info` DISABLE KEYS */;
INSERT INTO `mp_vendor_info` VALUES (1,2,0.00,0.00,0.00,'$2y$12$FqGV88IyJX2FYbyQJaOrFucRxqj8d1pMyfk1fk/nhBA8HW9QGzN5K','{\"name\":\"Halie Rogahn\",\"number\":\"+19783596768\",\"full_name\":\"Rosendo O\'Reilly\",\"description\":\"Brady DuBuque\"}','2025-12-26 09:38:57','2025-12-26 09:38:57','bank_transfer',NULL),(2,3,0.00,0.00,0.00,'$2y$12$.4GqRqrnyiM7IkvOjw54jODATXm.j4ngBHxmDHyJ6LA6CzF0Gm/5u','{\"name\":\"Efren Kutch II\",\"number\":\"+15859398176\",\"full_name\":\"Prof. Alfredo Moen Sr.\",\"description\":\"Nova Glover\"}','2025-12-26 09:38:57','2025-12-26 09:38:57','bank_transfer',NULL),(3,4,0.00,0.00,0.00,'$2y$12$ntmuw9gEn8FYd25lTNb2F.XXapvLRXaNNCk2veUjxTVOqzTt2Fydu','{\"name\":\"Miss Miracle Buckridge\",\"number\":\"+18326574659\",\"full_name\":\"Mellie Cruickshank\",\"description\":\"Felipe Yundt Sr.\"}','2025-12-26 09:38:58','2025-12-26 09:38:58','bank_transfer',NULL),(4,5,0.00,0.00,0.00,'$2y$12$3CifSoRNFKevFDnZqanymOQ1bNefz6NzQJxbCjEyCCDHg3sGzIHz6','{\"name\":\"Sandy McLaughlin\",\"number\":\"+18474945230\",\"full_name\":\"Kitty Stanton\",\"description\":\"Estefania Kassulke\"}','2025-12-26 09:38:58','2025-12-26 09:38:58','bank_transfer',NULL),(5,6,0.00,0.00,0.00,'$2y$12$rO8MLQjDwfTKDY818bDTmu70LxB2ZDCAN/PSRdSLDCTCHoJmVxm06','{\"name\":\"Hardy Wyman\",\"number\":\"+19802075768\",\"full_name\":\"Eula Ferry\",\"description\":\"Tiffany Gislason\"}','2025-12-26 09:38:58','2025-12-26 09:38:58','bank_transfer',NULL),(6,7,0.00,0.00,0.00,'$2y$12$PYUxRWGJXiKRbsbRfEerae/Xio/T/Kx..43/fCn6oLcvfJeKx2cwG','{\"name\":\"Vinnie Steuber\",\"number\":\"+12486501979\",\"full_name\":\"Salvatore Boehm\",\"description\":\"Aubrey Effertz I\"}','2025-12-26 09:38:58','2025-12-26 09:38:58','bank_transfer',NULL),(7,8,0.00,0.00,0.00,'$2y$12$axANTkzo5parwoAM7ZYoKO4v1W.w2.obZxIjGyXxRfKNBiEeNHg6C','{\"name\":\"Britney Lesch\",\"number\":\"+15807132673\",\"full_name\":\"Glenda Howe DDS\",\"description\":\"Zane Rohan\"}','2025-12-26 09:38:59','2025-12-26 09:38:59','bank_transfer',NULL),(8,9,0.00,0.00,0.00,'$2y$12$m99DS9DZ3oySpVMNxcPSk.DEbyspeWJ2jmEaNnaWeZmvLx2XkMvZq','{\"name\":\"Danika Greenfelder\",\"number\":\"+12489002353\",\"full_name\":\"Mr. Rodolfo Reichert DVM\",\"description\":\"Christian Gislason\"}','2025-12-26 09:38:59','2025-12-26 09:38:59','bank_transfer',NULL);
/*!40000 ALTER TABLE `mp_vendor_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletters`
--

DROP TABLE IF EXISTS `newsletters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `newsletters` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'subscribed',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletters`
--

LOCK TABLES `newsletters` WRITE;
/*!40000 ALTER TABLE `newsletters` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `user_id` bigint unsigned DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pages_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,'Home','<div>[simple-slider key=\"home-slider\" ads_1=\"VC2C8Q1UGCBG\" ads_2=\"NBDWRXTSVZ8N\"][/simple-slider]</div><div>[site-features icon1=\"icon-rocket\" title1=\"Free Delivery\" subtitle1=\"For all orders over $99\" icon2=\"icon-sync\" title2=\"90 Days Return\" subtitle2=\"If goods have problems\" icon3=\"icon-credit-card\" title3=\"Secure Payment\" subtitle3=\"100% secure payment\" icon4=\"icon-bubbles\" title4=\"24/7 Support\" subtitle4=\"Dedicated support\" icon5=\"icon-gift\" title5=\"Gift Service\" subtitle5=\"Support gift service\" enable_lazy_loading=\"yes\"][/site-features]</div><div>[flash-sale title=\"Deal of the day\" flash_sale_id=\"1\" enable_lazy_loading=\"yes\"][/flash-sale]</div><div>[featured-product-categories title=\"Top Categories\" enable_lazy_loading=\"yes\"][/featured-product-categories]</div><div>[theme-ads key_1=\"IZ6WU8KUALYD\" key_2=\"ILSFJVYFGCPZ\" key_3=\"ZDOZUZZIU7FT\" enable_lazy_loading=\"yes\"][/theme-ads]</div><div>[featured-products title=\"Featured products\" enable_lazy_loading=\"yes\"][/featured-products]</div><div>[theme-ads key_1=\"Q9YDUIC9HSWS\" key_2=\"IZ6WU8KUALYE\" enable_lazy_loading=\"yes\"][/theme-ads]</div><div>[product-collections title=\"Exclusive Products\" enable_lazy_loading=\"yes\"][/product-collections]</div><div>[product-category-products category_id=\"18\" enable_lazy_loading=\"yes\"][/product-category-products]</div>[testimonials title=\"What our Clients say\" subtitle=\"Customers Review\" testimonial_ids=\"1,2,3,4\" enable_lazy_loading=\"yes\"][/testimonials]<div>[download-app title=\"Download Martfury App Now!\" subtitle=\"Shopping fastly and easily more with our app. Get a link to download the app on your phone.\" screenshot=\"general/app.png\" android_app_url=\"https://www.appstore.com\" ios_app_url=\"https://play.google.com/store\" enable_lazy_loading=\"yes\"][/download-app]</div><div>[product-category-products category_id=\"23\" enable_lazy_loading=\"yes\"][/product-category-products]</div><div>[newsletter-form title=\"Join Our Newsletter Now\" subtitle=\"Subscribe to get information about products and coupons\" enable_lazy_loading=\"yes\"][/newsletter-form]</div>',1,NULL,'homepage',NULL,'published','2025-12-26 09:38:52','2025-12-26 09:38:52'),(2,'About us','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>',1,NULL,'default',NULL,'published','2025-12-26 09:38:52','2025-12-26 09:38:52'),(3,'Terms Of Use','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>',1,NULL,'default',NULL,'published','2025-12-26 09:38:52','2025-12-26 09:38:52'),(4,'Terms &amp; Conditions','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>',1,NULL,'default',NULL,'published','2025-12-26 09:38:52','2025-12-26 09:38:52'),(5,'Refund Policy','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>',1,NULL,'default',NULL,'published','2025-12-26 09:38:52','2025-12-26 09:38:52'),(6,'Blog','<p>---</p>',1,NULL,'blog-sidebar',NULL,'published','2025-12-26 09:38:52','2025-12-26 09:38:52'),(7,'FAQs','<div>[faq title=\"Frequently Asked Questions\"][/faq]</div>',1,NULL,'default',NULL,'published','2025-12-26 09:38:52','2025-12-26 09:38:52'),(8,'Contact','<div>[google-map]502 New Street, Brighton VIC, Australia[/google-map]</div><div>[contact-info-boxes title=\"Contact Us For Any Questions\"][/contact-info-boxes]</div><div>[contact-form][/contact-form]</div>',1,NULL,'full-width',NULL,'published','2025-12-26 09:38:52','2025-12-26 09:38:52'),(9,'Cookie Policy','<h3>EU Cookie Consent</h3><p>To use this Website we are using Cookies and collecting some Data. To be compliant with the EU GDPR we give you to choose if you allow us to use certain Cookies and to collect some Data.</p><h4>Essential Data</h4><p>The Essential Data is needed to run the Site you are visiting technically. You can not deactivate them.</p><p>- Session Cookie: PHP uses a Cookie to identify user sessions. Without this Cookie the Website is not working.</p><p>- XSRF-Token Cookie: Laravel automatically generates a CSRF \"token\" for each active user session managed by the application. This token is used to verify that the authenticated user is the one actually making the requests to the application.</p>',1,NULL,'default',NULL,'published','2025-12-26 09:38:52','2025-12-26 09:38:52'),(10,'Affiliate','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>',1,NULL,'default',NULL,'published','2025-12-26 09:38:52','2025-12-26 09:38:52'),(11,'Career','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>',1,NULL,'default',NULL,'published','2025-12-26 09:38:52','2025-12-26 09:38:52'),(12,'Coming soon','<p>Condimentum ipsum a adipiscing hac dolor set consectetur urna commodo elit parturient <br/>molestie ut nisl partu convallier ullamcorpe.</p><div>[coming-soon time=\"2026-12-26 16:38:52\" image=\"general/coming-soon.jpg\"][/coming-soon]</div>',1,NULL,'coming-soon',NULL,'published','2025-12-26 09:38:52','2025-12-26 09:38:52');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages_translations`
--

DROP TABLE IF EXISTS `pages_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pages_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`pages_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages_translations`
--

LOCK TABLES `pages_translations` WRITE;
/*!40000 ALTER TABLE `pages_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `pages_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_logs`
--

DROP TABLE IF EXISTS `payment_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `request` longtext COLLATE utf8mb4_unicode_ci,
  `response` longtext COLLATE utf8mb4_unicode_ci,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_logs`
--

LOCK TABLES `payment_logs` WRITE;
/*!40000 ALTER TABLE `payment_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `currency` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL DEFAULT '0',
  `charge_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_channel` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(15,2) unsigned NOT NULL,
  `payment_fee` decimal(15,2) DEFAULT '0.00',
  `order_id` bigint unsigned DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT 'pending',
  `payment_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'confirm',
  `customer_id` bigint unsigned DEFAULT NULL,
  `refunded_amount` decimal(15,2) unsigned DEFAULT NULL,
  `refund_note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `customer_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metadata` mediumtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
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
-- Table structure for table `post_categories`
--

DROP TABLE IF EXISTS `post_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_categories` (
  `category_id` bigint unsigned NOT NULL,
  `post_id` bigint unsigned NOT NULL,
  KEY `post_categories_category_id_index` (`category_id`),
  KEY `post_categories_post_id_index` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_categories`
--

LOCK TABLES `post_categories` WRITE;
/*!40000 ALTER TABLE `post_categories` DISABLE KEYS */;
INSERT INTO `post_categories` VALUES (1,1),(3,1),(1,2),(4,2),(1,3),(3,3),(1,4),(3,4),(2,5),(3,5),(2,6),(3,6),(2,7),(4,7),(2,8),(4,8),(2,9),(3,9),(1,10),(3,10),(2,11),(4,11);
/*!40000 ALTER TABLE `post_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_tags`
--

DROP TABLE IF EXISTS `post_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_tags` (
  `tag_id` bigint unsigned NOT NULL,
  `post_id` bigint unsigned NOT NULL,
  KEY `post_tags_tag_id_index` (`tag_id`),
  KEY `post_tags_post_id_index` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_tags`
--

LOCK TABLES `post_tags` WRITE;
/*!40000 ALTER TABLE `post_tags` DISABLE KEYS */;
INSERT INTO `post_tags` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(1,2),(2,2),(3,2),(4,2),(5,2),(1,3),(2,3),(3,3),(4,3),(5,3),(1,4),(2,4),(3,4),(4,4),(5,4),(1,5),(2,5),(3,5),(4,5),(5,5),(1,6),(2,6),(3,6),(4,6),(5,6),(1,7),(2,7),(3,7),(4,7),(5,7),(1,8),(2,8),(3,8),(4,8),(5,8),(1,9),(2,9),(3,9),(4,9),(5,9),(1,10),(2,10),(3,10),(4,10),(5,10),(1,11),(2,11),(3,11),(4,11),(5,11);
/*!40000 ALTER TABLE `post_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `author_id` bigint unsigned DEFAULT NULL,
  `author_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_featured` tinyint unsigned NOT NULL DEFAULT '0',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `views` int unsigned NOT NULL DEFAULT '0',
  `format_type` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `posts_status_index` (`status`),
  KEY `posts_author_id_index` (`author_id`),
  KEY `posts_author_type_index` (`author_type`),
  KEY `posts_created_at_index` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'4 Expert Tips On How To Choose The Right Men’s Wallet','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n','published',1,'Botble\\ACL\\Models\\User',1,'news/1.jpg',2411,NULL,'2025-12-26 09:38:51','2025-12-26 09:38:51'),(2,'Sexy Clutches: How to Buy &amp; Wear a Designer Clutch Bag','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n','published',1,'Botble\\ACL\\Models\\User',1,'news/2.jpg',346,NULL,'2025-12-26 09:38:51','2025-12-26 09:38:51'),(3,'The Top 2020 Handbag Trends to Know','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n','published',1,'Botble\\ACL\\Models\\User',1,'news/3.jpg',663,NULL,'2025-12-26 09:38:51','2025-12-26 09:38:51'),(4,'How to Match the Color of Your Handbag With an Outfit','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n','published',1,'Botble\\ACL\\Models\\User',1,'news/4.jpg',1189,NULL,'2025-12-26 09:38:51','2025-12-26 09:38:51'),(5,'How to Care for Leather Bags','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n','published',1,'Botble\\ACL\\Models\\User',1,'news/5.jpg',683,NULL,'2025-12-26 09:38:51','2025-12-26 09:38:51'),(6,'We\'re Crushing Hard on Summer\'s 10 Biggest Bag Trends','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n','published',1,'Botble\\ACL\\Models\\User',1,'news/6.jpg',216,NULL,'2025-12-26 09:38:51','2025-12-26 09:38:51'),(7,'Essential Qualities of Highly Successful Music','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n','published',1,'Botble\\ACL\\Models\\User',1,'news/7.jpg',815,NULL,'2025-12-26 09:38:51','2025-12-26 09:38:51'),(8,'9 Things I Love About Shaving My Head','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n','published',1,'Botble\\ACL\\Models\\User',1,'news/8.jpg',219,NULL,'2025-12-26 09:38:51','2025-12-26 09:38:51'),(9,'Why Teamwork Really Makes The Dream Work','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n','published',1,'Botble\\ACL\\Models\\User',1,'news/9.jpg',286,NULL,'2025-12-26 09:38:51','2025-12-26 09:38:51'),(10,'The World Caters to Average People','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n','published',1,'Botble\\ACL\\Models\\User',1,'news/10.jpg',1320,NULL,'2025-12-26 09:38:51','2025-12-26 09:38:51'),(11,'The litigants on the screen are not actors','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n','published',1,'Botble\\ACL\\Models\\User',0,'news/11.jpg',1929,NULL,'2025-12-26 09:38:51','2025-12-26 09:38:51');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts_translations`
--

DROP TABLE IF EXISTS `posts_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `posts_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`posts_id`),
  KEY `idx_posts_trans_posts_id` (`posts_id`),
  KEY `idx_posts_trans_post_lang` (`posts_id`,`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts_translations`
--

LOCK TABLES `posts_translations` WRITE;
/*!40000 ALTER TABLE `posts_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `posts_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `push_notification_recipients`
--

DROP TABLE IF EXISTS `push_notification_recipients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `push_notification_recipients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `push_notification_id` bigint unsigned NOT NULL,
  `user_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `device_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `platform` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sent',
  `sent_at` timestamp NULL DEFAULT NULL,
  `delivered_at` timestamp NULL DEFAULT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `clicked_at` timestamp NULL DEFAULT NULL,
  `fcm_response` json DEFAULT NULL,
  `error_message` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pnr_notification_user_index` (`push_notification_id`,`user_type`,`user_id`),
  KEY `pnr_user_status_index` (`user_type`,`user_id`,`status`),
  KEY `pnr_user_read_index` (`user_type`,`user_id`,`read_at`),
  KEY `pnr_status_index` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `push_notification_recipients`
--

LOCK TABLES `push_notification_recipients` WRITE;
/*!40000 ALTER TABLE `push_notification_recipients` DISABLE KEYS */;
/*!40000 ALTER TABLE `push_notification_recipients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `push_notifications`
--

DROP TABLE IF EXISTS `push_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `push_notifications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'general',
  `target_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target_value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` json DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sent',
  `sent_count` int NOT NULL DEFAULT '0',
  `failed_count` int NOT NULL DEFAULT '0',
  `delivered_count` int NOT NULL DEFAULT '0',
  `read_count` int NOT NULL DEFAULT '0',
  `scheduled_at` timestamp NULL DEFAULT NULL,
  `sent_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `push_notifications_type_created_at_index` (`type`,`created_at`),
  KEY `push_notifications_status_scheduled_at_index` (`status`,`scheduled_at`),
  KEY `push_notifications_created_by_index` (`created_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `push_notifications`
--

LOCK TABLES `push_notifications` WRITE;
/*!40000 ALTER TABLE `push_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `push_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `revisions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `revisionable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revisionable_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `old_value` text COLLATE utf8mb4_unicode_ci,
  `new_value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `revisions_revisionable_id_revisionable_type_index` (`revisionable_id`,`revisionable_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_users`
--

DROP TABLE IF EXISTS `role_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_users` (
  `user_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_users_user_id_index` (`user_id`),
  KEY `role_users_role_id_index` (`role_id`)
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `created_by` bigint unsigned NOT NULL,
  `updated_by` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_slug_unique` (`slug`),
  KEY `roles_created_by_index` (`created_by`),
  KEY `roles_updated_by_index` (`updated_by`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','Admin','{\"users.index\":true,\"users.create\":true,\"users.edit\":true,\"users.destroy\":true,\"roles.index\":true,\"roles.create\":true,\"roles.edit\":true,\"roles.destroy\":true,\"core.system\":true,\"core.cms\":true,\"core.manage.license\":true,\"systems.cronjob\":true,\"core.tools\":true,\"tools.data-synchronize\":true,\"media.index\":true,\"files.index\":true,\"files.create\":true,\"files.edit\":true,\"files.trash\":true,\"files.destroy\":true,\"folders.index\":true,\"folders.create\":true,\"folders.edit\":true,\"folders.trash\":true,\"folders.destroy\":true,\"settings.index\":true,\"settings.common\":true,\"settings.options\":true,\"settings.email\":true,\"settings.media\":true,\"settings.admin-appearance\":true,\"settings.cache\":true,\"settings.datatables\":true,\"settings.email.rules\":true,\"settings.phone-number\":true,\"settings.others\":true,\"menus.index\":true,\"menus.create\":true,\"menus.edit\":true,\"menus.destroy\":true,\"optimize.settings\":true,\"pages.index\":true,\"pages.create\":true,\"pages.edit\":true,\"pages.destroy\":true,\"plugins.index\":true,\"plugins.edit\":true,\"plugins.remove\":true,\"plugins.marketplace\":true,\"sitemap.settings\":true,\"core.appearance\":true,\"theme.index\":true,\"theme.activate\":true,\"theme.remove\":true,\"theme.options\":true,\"theme.custom-css\":true,\"theme.custom-js\":true,\"theme.custom-html\":true,\"theme.robots-txt\":true,\"settings.website-tracking\":true,\"widgets.index\":true,\"ads.index\":true,\"ads.create\":true,\"ads.edit\":true,\"ads.destroy\":true,\"ads.settings\":true,\"analytics.general\":true,\"analytics.page\":true,\"analytics.browser\":true,\"analytics.referrer\":true,\"analytics.settings\":true,\"audit-log.index\":true,\"audit-log.destroy\":true,\"backups.index\":true,\"backups.create\":true,\"backups.restore\":true,\"backups.destroy\":true,\"plugins.blog\":true,\"posts.index\":true,\"posts.create\":true,\"posts.edit\":true,\"posts.destroy\":true,\"categories.index\":true,\"categories.create\":true,\"categories.edit\":true,\"categories.destroy\":true,\"tags.index\":true,\"blog.reports\":true,\"tags.create\":true,\"tags.edit\":true,\"tags.destroy\":true,\"blog.settings\":true,\"posts.export\":true,\"posts.import\":true,\"captcha.settings\":true,\"contacts.index\":true,\"contacts.edit\":true,\"contacts.destroy\":true,\"contact.custom-fields\":true,\"contact.settings\":true,\"plugins.ecommerce\":true,\"ecommerce.report.index\":true,\"products.index\":true,\"products.create\":true,\"products.edit\":true,\"products.destroy\":true,\"products.duplicate\":true,\"ecommerce.product-prices.index\":true,\"ecommerce.product-prices.edit\":true,\"ecommerce.product-inventory.index\":true,\"ecommerce.product-inventory.edit\":true,\"product-categories.index\":true,\"product-categories.create\":true,\"product-categories.edit\":true,\"product-categories.destroy\":true,\"product-tag.index\":true,\"product-tag.create\":true,\"product-tag.edit\":true,\"product-tag.destroy\":true,\"brands.index\":true,\"brands.create\":true,\"brands.edit\":true,\"brands.destroy\":true,\"product-collections.index\":true,\"product-collections.create\":true,\"product-collections.edit\":true,\"product-collections.destroy\":true,\"product-attribute-sets.index\":true,\"product-attribute-sets.create\":true,\"product-attribute-sets.edit\":true,\"product-attribute-sets.destroy\":true,\"product-attributes.index\":true,\"product-attributes.create\":true,\"product-attributes.edit\":true,\"product-attributes.destroy\":true,\"tax.index\":true,\"tax.create\":true,\"tax.edit\":true,\"tax.destroy\":true,\"reviews.index\":true,\"reviews.create\":true,\"reviews.destroy\":true,\"reviews.publish\":true,\"reviews.reply\":true,\"ecommerce.shipments.index\":true,\"ecommerce.shipments.create\":true,\"ecommerce.shipments.edit\":true,\"ecommerce.shipments.destroy\":true,\"orders.index\":true,\"orders.create\":true,\"orders.edit\":true,\"orders.destroy\":true,\"discounts.index\":true,\"discounts.create\":true,\"discounts.edit\":true,\"discounts.destroy\":true,\"customers.index\":true,\"customers.create\":true,\"customers.edit\":true,\"customers.destroy\":true,\"ecommerce.customers.import\":true,\"ecommerce.customers.export\":true,\"flash-sale.index\":true,\"flash-sale.create\":true,\"flash-sale.edit\":true,\"flash-sale.destroy\":true,\"product-label.index\":true,\"product-label.create\":true,\"product-label.edit\":true,\"product-label.destroy\":true,\"ecommerce.import.products.index\":true,\"ecommerce.export.products.index\":true,\"order_returns.index\":true,\"order_returns.edit\":true,\"order_returns.destroy\":true,\"global-option.index\":true,\"global-option.create\":true,\"global-option.edit\":true,\"global-option.destroy\":true,\"ecommerce.invoice.index\":true,\"ecommerce.invoice.edit\":true,\"ecommerce.invoice.destroy\":true,\"ecommerce.settings\":true,\"ecommerce.settings.general\":true,\"ecommerce.invoice-template.index\":true,\"ecommerce.settings.currencies\":true,\"ecommerce.settings.products\":true,\"ecommerce.settings.product-search\":true,\"ecommerce.settings.digital-products\":true,\"ecommerce.settings.store-locators\":true,\"ecommerce.settings.invoices\":true,\"ecommerce.settings.product-reviews\":true,\"ecommerce.settings.customers\":true,\"ecommerce.settings.shopping\":true,\"ecommerce.settings.taxes\":true,\"ecommerce.settings.shipping\":true,\"ecommerce.shipping-rule-items.index\":true,\"ecommerce.shipping-rule-items.create\":true,\"ecommerce.shipping-rule-items.edit\":true,\"ecommerce.shipping-rule-items.destroy\":true,\"ecommerce.shipping-rule-items.bulk-import\":true,\"ecommerce.settings.tracking\":true,\"ecommerce.settings.standard-and-format\":true,\"ecommerce.settings.checkout\":true,\"ecommerce.settings.return\":true,\"ecommerce.settings.flash-sale\":true,\"ecommerce.settings.product-specification\":true,\"product-categories.export\":true,\"product-categories.import\":true,\"orders.export\":true,\"ecommerce.product-specification.index\":true,\"ecommerce.specification-groups.index\":true,\"ecommerce.specification-groups.create\":true,\"ecommerce.specification-groups.edit\":true,\"ecommerce.specification-groups.destroy\":true,\"ecommerce.specification-attributes.index\":true,\"ecommerce.specification-attributes.create\":true,\"ecommerce.specification-attributes.edit\":true,\"ecommerce.specification-attributes.destroy\":true,\"ecommerce.specification-tables.index\":true,\"ecommerce.specification-tables.create\":true,\"ecommerce.specification-tables.edit\":true,\"ecommerce.specification-tables.destroy\":true,\"plugin.faq\":true,\"faq.index\":true,\"faq.create\":true,\"faq.edit\":true,\"faq.destroy\":true,\"faq_category.index\":true,\"faq_category.create\":true,\"faq_category.edit\":true,\"faq_category.destroy\":true,\"faqs.settings\":true,\"languages.index\":true,\"languages.create\":true,\"languages.edit\":true,\"languages.destroy\":true,\"translations.import\":true,\"translations.export\":true,\"property-translations.import\":true,\"property-translations.export\":true,\"plugin.location\":true,\"country.index\":true,\"country.create\":true,\"country.edit\":true,\"country.destroy\":true,\"state.index\":true,\"state.create\":true,\"state.edit\":true,\"state.destroy\":true,\"city.index\":true,\"city.create\":true,\"city.edit\":true,\"city.destroy\":true,\"marketplace.index\":true,\"marketplace.store.index\":true,\"marketplace.store.create\":true,\"marketplace.store.edit\":true,\"marketplace.store.destroy\":true,\"marketplace.store.view\":true,\"marketplace.store.revenue.create\":true,\"marketplace.withdrawal.index\":true,\"marketplace.withdrawal.edit\":true,\"marketplace.withdrawal.destroy\":true,\"marketplace.withdrawal.invoice\":true,\"marketplace.vendors.index\":true,\"marketplace.unverified-vendors.index\":true,\"marketplace.vendors.control\":true,\"marketplace.unverified-vendors.edit\":true,\"marketplace.reports\":true,\"marketplace.settings\":true,\"marketplace.messages.index\":true,\"marketplace.messages.edit\":true,\"marketplace.messages.destroy\":true,\"newsletter.index\":true,\"newsletter.destroy\":true,\"newsletter.settings\":true,\"payment.index\":true,\"payments.settings\":true,\"payment.destroy\":true,\"payments.logs\":true,\"payments.logs.show\":true,\"payments.logs.destroy\":true,\"simple-slider.index\":true,\"simple-slider.create\":true,\"simple-slider.edit\":true,\"simple-slider.destroy\":true,\"simple-slider-item.index\":true,\"simple-slider-item.create\":true,\"simple-slider-item.edit\":true,\"simple-slider-item.destroy\":true,\"social-login.settings\":true,\"testimonial.index\":true,\"testimonial.create\":true,\"testimonial.edit\":true,\"testimonial.destroy\":true,\"plugins.translation\":true,\"translations.locales\":true,\"translations.theme-translations\":true,\"translations.index\":true,\"theme-translations.export\":true,\"other-translations.export\":true,\"theme-translations.import\":true,\"other-translations.import\":true,\"api.settings\":true,\"api.sanctum-token.index\":true,\"api.sanctum-token.create\":true,\"api.sanctum-token.destroy\":true}','Admin users role',1,1,1,'2025-12-26 09:38:50','2025-12-26 09:38:50');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'media_random_hash','0fbd3794c5c88485008b8652f20dbd94',NULL,'2025-12-26 09:38:56'),(2,'api_enabled','0',NULL,'2025-12-26 09:38:56'),(3,'activated_plugins','[\"language\",\"language-advanced\",\"ads\",\"analytics\",\"audit-log\",\"backup\",\"blog\",\"captcha\",\"contact\",\"cookie-consent\",\"ecommerce\",\"faq\",\"location\",\"marketplace\",\"mollie\",\"newsletter\",\"payment\",\"paypal\",\"paypal-payout\",\"paystack\",\"razorpay\",\"shippo\",\"simple-slider\",\"social-login\",\"sslcommerz\",\"stripe\",\"stripe-connect\",\"testimonial\",\"translation\"]',NULL,'2025-12-26 09:38:56'),(4,'analytics_dashboard_widgets','0','2025-12-26 09:38:14','2025-12-26 09:38:14'),(5,'enable_recaptcha_botble_contact_forms_fronts_contact_form','1','2025-12-26 09:38:15','2025-12-26 09:38:15'),(6,'api_layer_api_key','',NULL,'2025-12-26 09:38:56'),(9,'enable_recaptcha_botble_newsletter_forms_fronts_newsletter_form','1','2025-12-26 09:38:18','2025-12-26 09:38:18'),(10,'payment_cod_fee_type','fixed',NULL,'2025-12-26 09:38:56'),(11,'payment_bank_transfer_fee_type','fixed',NULL,'2025-12-26 09:38:56'),(12,'theme','martfury',NULL,'2025-12-26 09:38:56'),(13,'show_admin_bar','1',NULL,'2025-12-26 09:38:56'),(14,'language_hide_default','1',NULL,'2025-12-26 09:38:56'),(15,'language_switcher_display','dropdown',NULL,'2025-12-26 09:38:56'),(16,'language_display','all',NULL,'2025-12-26 09:38:56'),(17,'language_hide_languages','[]',NULL,'2025-12-26 09:38:56'),(18,'simple_slider_using_assets','0',NULL,NULL),(19,'admin_favicon','general/favicon.png',NULL,'2025-12-26 09:38:56'),(20,'admin_logo','general/logo-light.png',NULL,'2025-12-26 09:38:56'),(21,'payment_cod_status','1',NULL,'2025-12-26 09:38:56'),(22,'payment_bank_transfer_status','1',NULL,'2025-12-26 09:38:56'),(23,'payment_cod_description','Please pay money directly to the postman, if you choose cash on delivery method (COD).',NULL,'2025-12-26 09:38:56'),(24,'payment_bank_transfer_description','Please send money to our bank account: ACB - 69270 213 19.',NULL,'2025-12-26 09:38:56'),(25,'payment_stripe_payment_type','stripe_checkout',NULL,'2025-12-26 09:38:56'),(26,'plugins_ecommerce_customer_new_order_status','0',NULL,'2025-12-26 09:38:56'),(27,'plugins_ecommerce_admin_new_order_status','0',NULL,'2025-12-26 09:38:56'),(28,'ecommerce_is_enabled_support_digital_products','1',NULL,'2025-12-26 09:38:56'),(29,'ecommerce_enable_license_codes_for_digital_products','1',NULL,'2025-12-26 09:38:56'),(30,'ecommerce_auto_complete_digital_orders_after_payment','1',NULL,'2025-12-26 09:38:56'),(31,'ecommerce_load_countries_states_cities_from_location_plugin','0',NULL,'2025-12-26 09:38:56'),(32,'ecommerce_product_sku_format','SF-2443-%s%s%s%s',NULL,'2025-12-26 09:38:56'),(33,'ecommerce_store_order_prefix','SF',NULL,'2025-12-26 09:38:56'),(34,'ecommerce_enable_product_specification','1',NULL,'2025-12-26 09:38:56'),(35,'payment_bank_transfer_display_bank_info_at_the_checkout_success_page','1',NULL,'2025-12-26 09:38:56'),(36,'payment_cod_logo','payments/cod.png',NULL,'2025-12-26 09:38:56'),(37,'payment_bank_transfer_logo','payments/bank-transfer.png',NULL,'2025-12-26 09:38:56'),(38,'payment_stripe_logo','payments/stripe.webp',NULL,'2025-12-26 09:38:56'),(39,'payment_paypal_logo','payments/paypal.png',NULL,'2025-12-26 09:38:56'),(40,'payment_mollie_logo','payments/mollie.png',NULL,'2025-12-26 09:38:56'),(41,'payment_paystack_logo','payments/paystack.png',NULL,'2025-12-26 09:38:56'),(42,'payment_razorpay_logo','payments/razorpay.png',NULL,'2025-12-26 09:38:56'),(43,'payment_sslcommerz_logo','payments/sslcommerz.png',NULL,'2025-12-26 09:38:56'),(44,'permalink-botble-blog-models-post','blog',NULL,'2025-12-26 09:38:56'),(45,'permalink-botble-blog-models-category','blog',NULL,'2025-12-26 09:38:56'),(46,'ecommerce_store_name','Martfury',NULL,NULL),(47,'ecommerce_store_phone','1800979769',NULL,NULL),(48,'ecommerce_store_address','502 New Street',NULL,NULL),(49,'ecommerce_store_state','Brighton VIC',NULL,NULL),(50,'ecommerce_store_city','Brighton VIC',NULL,NULL),(51,'ecommerce_store_country','AU',NULL,NULL),(52,'theme-martfury-site_title','MartFury - Laravel Ecommerce system',NULL,NULL),(53,'theme-martfury-seo_description','MartFury is a clean & modern Laravel Ecommerce System for multipurpose online stores. With design clean and trendy, MartFury will make your online store look more impressive and attractive to viewers.',NULL,NULL),(54,'theme-martfury-copyright','© %Y MartFury. All Rights Reserved.',NULL,NULL),(55,'theme-martfury-favicon','general/favicon.png',NULL,NULL),(56,'theme-martfury-logo','general/logo.png',NULL,NULL),(57,'theme-martfury-welcome_message','Welcome to MartFury Online Shopping Store!',NULL,NULL),(58,'theme-martfury-address','502 New Street, Brighton VIC, Australia',NULL,NULL),(59,'theme-martfury-hotline','1800 97 97 69',NULL,NULL),(60,'theme-martfury-email','contact@martfury.co',NULL,NULL),(61,'theme-martfury-newsletter_image','general/newsletter.jpg',NULL,NULL),(62,'theme-martfury-homepage_id','1',NULL,NULL),(63,'theme-martfury-blog_page_id','6',NULL,NULL),(64,'theme-martfury-cookie_consent_message','Your experience on this site will be improved by allowing cookies ',NULL,NULL),(65,'theme-martfury-cookie_consent_learn_more_url','/cookie-policy',NULL,NULL),(66,'theme-martfury-cookie_consent_learn_more_text','Cookie Policy',NULL,NULL),(67,'theme-martfury-number_of_products_per_page','42',NULL,NULL),(68,'theme-martfury-product_feature_1_title','Shipping worldwide',NULL,NULL),(69,'theme-martfury-product_feature_1_icon','icon-network',NULL,NULL),(70,'theme-martfury-product_feature_2_title','Free 7-day return if eligible, so easy',NULL,NULL),(71,'theme-martfury-product_feature_2_icon','icon-3d-rotate',NULL,NULL),(72,'theme-martfury-product_feature_3_title','Supplier give bills for this product.',NULL,NULL),(73,'theme-martfury-product_feature_3_icon','icon-receipt',NULL,NULL),(74,'theme-martfury-product_feature_4_title','Pay online or when receiving goods',NULL,NULL),(75,'theme-martfury-product_feature_4_icon','icon-credit-card',NULL,NULL),(76,'theme-martfury-contact_info_box_1_title','Contact Directly',NULL,NULL),(77,'theme-martfury-contact_info_box_1_subtitle','contact@martfury.com',NULL,NULL),(78,'theme-martfury-contact_info_box_1_details','(+004) 912-3548-07',NULL,NULL),(79,'theme-martfury-contact_info_box_2_title','Headquarters',NULL,NULL),(80,'theme-martfury-contact_info_box_2_subtitle','17 Queen St, South bank, Melbourne 10560, Australia',NULL,NULL),(81,'theme-martfury-contact_info_box_2_details','',NULL,NULL),(82,'theme-martfury-contact_info_box_3_title','Work With Us',NULL,NULL),(83,'theme-martfury-contact_info_box_3_subtitle','Send your CV to our email:',NULL,NULL),(84,'theme-martfury-contact_info_box_3_details','career@martfury.com',NULL,NULL),(85,'theme-martfury-contact_info_box_4_title','Customer Service',NULL,NULL),(86,'theme-martfury-contact_info_box_4_subtitle','customercare@martfury.com',NULL,NULL),(87,'theme-martfury-contact_info_box_4_details','(800) 843-2446',NULL,NULL),(88,'theme-martfury-contact_info_box_5_title','Media Relations',NULL,NULL),(89,'theme-martfury-contact_info_box_5_subtitle','media@martfury.com',NULL,NULL),(90,'theme-martfury-contact_info_box_5_details','(801) 947-3564',NULL,NULL),(91,'theme-martfury-contact_info_box_6_title','Vendor Support',NULL,NULL),(92,'theme-martfury-contact_info_box_6_subtitle','vendorsupport@martfury.com',NULL,NULL),(93,'theme-martfury-contact_info_box_6_details','(801) 947-3100',NULL,NULL),(94,'theme-martfury-number_of_cross_sale_product','7',NULL,NULL),(95,'theme-martfury-logo_in_the_checkout_page','general/logo-dark.png',NULL,NULL),(96,'theme-martfury-logo_in_invoices','general/logo-dark.png',NULL,NULL),(97,'theme-martfury-logo_vendor_dashboard','general/logo-dark.png',NULL,NULL),(98,'theme-martfury-primary_font','Work Sans',NULL,NULL),(99,'theme-martfury-payment_methods','[\"general\\/payment-method-1.jpg\",\"general\\/payment-method-2.jpg\",\"general\\/payment-method-3.jpg\",\"general\\/payment-method-4.jpg\",\"general\\/payment-method-5.jpg\"]',NULL,NULL),(100,'theme-martfury-social_links','[[{\"key\":\"name\",\"value\":\"Facebook\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-facebook\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.facebook.com\"}],[{\"key\":\"name\",\"value\":\"X (Twitter)\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-x\"},{\"key\":\"url\",\"value\":\"https:\\/\\/x.com\"}],[{\"key\":\"name\",\"value\":\"YouTube\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-youtube\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.youtube.com\"}],[{\"key\":\"name\",\"value\":\"Instagram\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-linkedin\"},{\"key\":\"url\",\"value\":\"https:\\/\\/www.linkedin.com\"}]]',NULL,NULL),(101,'theme-martfury-social_sharing','[[{\"key\":\"social\",\"value\":\"facebook\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-facebook\"}],[{\"key\":\"social\",\"value\":\"x\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-x\"}],[{\"key\":\"social\",\"value\":\"pinterest\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-pinterest\"}],[{\"key\":\"social\",\"value\":\"linkedin\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-linkedin\"}],[{\"key\":\"social\",\"value\":\"whatsapp\"},{\"key\":\"icon\",\"value\":\"ti ti-brand-whatsapp\"}],[{\"key\":\"social\",\"value\":\"email\"},{\"key\":\"icon\",\"value\":\"ti ti-mail\"}]]',NULL,NULL),(102,'theme-martfury-lazy_load_images','1',NULL,NULL),(103,'theme-martfury-lazy_load_placeholder_image','general/placeholder.png',NULL,NULL);
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `simple_slider_items`
--

DROP TABLE IF EXISTS `simple_slider_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `simple_slider_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `simple_slider_id` bigint unsigned NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `order` int unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `simple_slider_items`
--

LOCK TABLES `simple_slider_items` WRITE;
/*!40000 ALTER TABLE `simple_slider_items` DISABLE KEYS */;
INSERT INTO `simple_slider_items` VALUES (1,1,'Slider 1','sliders/1-lg.jpg','/products',NULL,1,'2025-12-26 09:38:52','2025-12-26 09:38:52'),(2,1,'Slider 2','sliders/2-lg.jpg','/products',NULL,2,'2025-12-26 09:38:52','2025-12-26 09:38:52'),(3,1,'Slider 3','sliders/3-lg.jpg','/products',NULL,3,'2025-12-26 09:38:52','2025-12-26 09:38:52');
/*!40000 ALTER TABLE `simple_slider_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `simple_sliders`
--

DROP TABLE IF EXISTS `simple_sliders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `simple_sliders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `simple_sliders`
--

LOCK TABLES `simple_sliders` WRITE;
/*!40000 ALTER TABLE `simple_sliders` DISABLE KEYS */;
INSERT INTO `simple_sliders` VALUES (1,'Home slider','home-slider','The main slider on homepage','published','2025-12-26 09:38:52','2025-12-26 09:38:52');
/*!40000 ALTER TABLE `simple_sliders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slugs`
--

DROP TABLE IF EXISTS `slugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slugs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `slugs_reference_id_index` (`reference_id`),
  KEY `slugs_key_index` (`key`),
  KEY `slugs_prefix_index` (`prefix`),
  KEY `slugs_reference_index` (`reference_id`,`reference_type`),
  KEY `idx_key_prefix` (`key`,`prefix`),
  KEY `idx_slugs_reference` (`reference_type`,`reference_id`)
) ENGINE=InnoDB AUTO_INCREMENT=232 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slugs`
--

LOCK TABLES `slugs` WRITE;
/*!40000 ALTER TABLE `slugs` DISABLE KEYS */;
INSERT INTO `slugs` VALUES (1,'fashion-live',1,'Botble\\Ecommerce\\Models\\Brand','brands','2025-12-26 09:38:19','2025-12-26 09:38:19'),(2,'hand-crafted',2,'Botble\\Ecommerce\\Models\\Brand','brands','2025-12-26 09:38:19','2025-12-26 09:38:19'),(3,'mestonix',3,'Botble\\Ecommerce\\Models\\Brand','brands','2025-12-26 09:38:19','2025-12-26 09:38:19'),(4,'sunshine',4,'Botble\\Ecommerce\\Models\\Brand','brands','2025-12-26 09:38:19','2025-12-26 09:38:19'),(5,'pure',5,'Botble\\Ecommerce\\Models\\Brand','brands','2025-12-26 09:38:19','2025-12-26 09:38:19'),(6,'anfold',6,'Botble\\Ecommerce\\Models\\Brand','brands','2025-12-26 09:38:19','2025-12-26 09:38:19'),(7,'automotive',7,'Botble\\Ecommerce\\Models\\Brand','brands','2025-12-26 09:38:19','2025-12-26 09:38:19'),(8,'hot-promotions',1,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-12-26 09:38:20','2025-12-26 09:38:20'),(9,'electronics',2,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-12-26 09:38:20','2025-12-26 09:38:20'),(10,'consumer-electronic',3,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-12-26 09:38:20','2025-12-26 09:38:20'),(11,'home-audio-theaters',4,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-12-26 09:38:20','2025-12-26 09:38:20'),(12,'tv-videos',5,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-12-26 09:38:20','2025-12-26 09:38:20'),(13,'camera-photos-videos',6,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-12-26 09:38:20','2025-12-26 09:38:20'),(14,'cellphones-accessories',7,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-12-26 09:38:20','2025-12-26 09:38:20'),(15,'headphones',8,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-12-26 09:38:20','2025-12-26 09:38:20'),(16,'videos-games',9,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-12-26 09:38:20','2025-12-26 09:38:20'),(17,'wireless-speakers',10,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-12-26 09:38:20','2025-12-26 09:38:20'),(18,'office-electronic',11,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-12-26 09:38:20','2025-12-26 09:38:20'),(19,'accessories-parts',12,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-12-26 09:38:20','2025-12-26 09:38:20'),(20,'digital-cables',13,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-12-26 09:38:20','2025-12-26 09:38:20'),(21,'audio-video-cables',14,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-12-26 09:38:20','2025-12-26 09:38:20'),(22,'batteries',15,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-12-26 09:38:20','2025-12-26 09:38:20'),(23,'clothing',16,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-12-26 09:38:20','2025-12-26 09:38:20'),(24,'computers',17,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-12-26 09:38:20','2025-12-26 09:38:20'),(25,'computer-technologies',18,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-12-26 09:38:20','2025-12-26 09:38:20'),(26,'computer-tablets',19,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-12-26 09:38:20','2025-12-26 09:38:20'),(27,'laptop',20,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-12-26 09:38:20','2025-12-26 09:38:20'),(28,'monitors',21,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-12-26 09:38:20','2025-12-26 09:38:20'),(29,'computer-components',22,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-12-26 09:38:20','2025-12-26 09:38:20'),(30,'networking',23,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-12-26 09:38:20','2025-12-26 09:38:20'),(31,'drive-storages',24,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-12-26 09:38:20','2025-12-26 09:38:20'),(32,'gaming-laptop',25,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-12-26 09:38:20','2025-12-26 09:38:20'),(33,'security-protection',26,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-12-26 09:38:20','2025-12-26 09:38:20'),(34,'accessories',27,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-12-26 09:38:20','2025-12-26 09:38:20'),(35,'home-kitchen',28,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-12-26 09:38:20','2025-12-26 09:38:20'),(36,'health-beauty',29,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-12-26 09:38:20','2025-12-26 09:38:20'),(37,'jewelry-watch',30,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-12-26 09:38:20','2025-12-26 09:38:20'),(38,'technology-toys',31,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-12-26 09:38:20','2025-12-26 09:38:20'),(39,'phones',32,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-12-26 09:38:20','2025-12-26 09:38:20'),(40,'babies-moms',33,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-12-26 09:38:20','2025-12-26 09:38:20'),(41,'sport-outdoor',34,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-12-26 09:38:20','2025-12-26 09:38:20'),(42,'books-office',35,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-12-26 09:38:20','2025-12-26 09:38:20'),(43,'cars-motorcycles',36,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-12-26 09:38:20','2025-12-26 09:38:20'),(44,'home-improvements',37,'Botble\\Ecommerce\\Models\\ProductCategory','product-categories','2025-12-26 09:38:20','2025-12-26 09:38:20'),(45,'smart-home-speaker',1,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:38:36','2025-12-26 09:38:36'),(46,'headphone-ultra-bass',2,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:38:36','2025-12-26 09:38:36'),(47,'boxed-bluetooth-headphone',3,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:38:36','2025-12-26 09:38:36'),(48,'camera-samsung-ss-24-digital',4,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:38:36','2025-12-26 09:39:01'),(49,'macbook-pro-2015',5,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:38:36','2025-12-26 09:38:36'),(50,'apple-watch-serial-7',6,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:38:36','2025-12-26 09:38:36'),(51,'macbook-pro-13-inch',7,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:38:36','2025-12-26 09:38:36'),(52,'apple-keyboard-digital',8,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:38:36','2025-12-26 09:39:01'),(53,'macsafe-80w',9,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:38:36','2025-12-26 09:38:36'),(54,'hand-playstation',10,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:38:36','2025-12-26 09:38:36'),(55,'apple-airpods-serial-3',11,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:38:37','2025-12-26 09:38:37'),(56,'cool-smart-watches-digital',12,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:38:37','2025-12-26 09:39:01'),(57,'black-smart-watches',13,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:38:37','2025-12-26 09:38:37'),(58,'leather-watch-in-black',14,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:38:37','2025-12-26 09:38:37'),(59,'macbook-pro-2015-13-inch',15,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:38:37','2025-12-26 09:38:37'),(60,'historic-alarm-clock-digital',16,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:38:37','2025-12-26 09:39:01'),(61,'black-glasses',17,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:38:37','2025-12-26 09:38:37'),(62,'phillips-mouse',18,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:38:37','2025-12-26 09:38:37'),(63,'gaming-keyboard',19,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:38:37','2025-12-26 09:38:37'),(64,'wireless-keyboard-digital',20,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:38:37','2025-12-26 09:39:02'),(65,'black-smart-watches',21,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:38:37','2025-12-26 09:38:37'),(66,'smart-home-speaker',22,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:38:37','2025-12-26 09:38:37'),(67,'headphone-ultra-bass',23,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:38:37','2025-12-26 09:38:37'),(68,'boxed-bluetooth-headphone-digital',24,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:38:37','2025-12-26 09:39:02'),(69,'camera-samsung-ss-24',25,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:38:37','2025-12-26 09:38:37'),(70,'leather-watch-in-black',26,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:38:37','2025-12-26 09:38:37'),(71,'apple-iphone-13-plus',27,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:38:37','2025-12-26 09:38:37'),(72,'macbook-pro-2015-digital',28,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:38:37','2025-12-26 09:39:02'),(73,'apple-watch-serial-7',29,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:38:37','2025-12-26 09:38:37'),(74,'macbook-pro-13-inch',30,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:38:37','2025-12-26 09:38:37'),(75,'apple-keyboard',31,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:38:37','2025-12-26 09:38:37'),(76,'macsafe-80w-digital',32,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:38:38','2025-12-26 09:39:02'),(77,'hand-playstation',33,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:38:38','2025-12-26 09:38:38'),(78,'apple-airpods-serial-3',34,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:38:38','2025-12-26 09:38:38'),(79,'cool-smart-watches',35,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:38:38','2025-12-26 09:38:38'),(80,'black-smart-watches-digital',36,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:38:38','2025-12-26 09:39:02'),(81,'leather-watch-in-black',37,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:38:38','2025-12-26 09:38:38'),(82,'macbook-pro-2015-13-inch',38,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:38:38','2025-12-26 09:38:38'),(83,'sony-wh-1000xm4-wireless-headphones',39,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:38:38','2025-12-26 09:38:38'),(84,'samsung-galaxy-s22-ultra-digital',40,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:38:38','2025-12-26 09:39:02'),(85,'dell-xps-15-laptop',41,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:38:38','2025-12-26 09:38:38'),(86,'ipad-pro-129-inch',42,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:38:38','2025-12-26 09:38:38'),(87,'bose-quietcomfort-earbuds',43,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:38:38','2025-12-26 09:38:38'),(88,'lg-oled-c1-series-tv-digital',44,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:38:38','2025-12-26 09:39:02'),(89,'dyson-v11-vacuum-cleaner',45,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:38:38','2025-12-26 09:38:38'),(90,'nintendo-switch-oled-model',46,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:38:38','2025-12-26 09:38:38'),(91,'canon-eos-r5-camera',47,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:38:38','2025-12-26 09:38:38'),(92,'fitbit-sense-smartwatch-digital',48,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:38:38','2025-12-26 09:39:02'),(93,'sonos-beam-soundbar',49,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:38:38','2025-12-26 09:38:38'),(94,'logitech-mx-master-3-mouse',50,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:38:38','2025-12-26 09:38:38'),(95,'kindle-paperwhite-e-reader',51,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:38:38','2025-12-26 09:38:38'),(96,'gopro-hero10-black-digital',52,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:38:38','2025-12-26 09:39:02'),(97,'anker-powercore-power-bank',53,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:38:38','2025-12-26 09:38:38'),(98,'samsung-galaxy-buds-pro',54,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:38:39','2025-12-26 09:38:39'),(99,'electronic',1,'Botble\\Ecommerce\\Models\\ProductTag','product-tags','2025-12-26 09:38:49','2025-12-26 09:38:49'),(100,'mobile',2,'Botble\\Ecommerce\\Models\\ProductTag','product-tags','2025-12-26 09:38:49','2025-12-26 09:38:49'),(101,'iphone',3,'Botble\\Ecommerce\\Models\\ProductTag','product-tags','2025-12-26 09:38:49','2025-12-26 09:38:49'),(102,'printer',4,'Botble\\Ecommerce\\Models\\ProductTag','product-tags','2025-12-26 09:38:49','2025-12-26 09:38:49'),(103,'office',5,'Botble\\Ecommerce\\Models\\ProductTag','product-tags','2025-12-26 09:38:49','2025-12-26 09:38:49'),(104,'it',6,'Botble\\Ecommerce\\Models\\ProductTag','product-tags','2025-12-26 09:38:49','2025-12-26 09:38:49'),(105,'ecommerce',1,'Botble\\Blog\\Models\\Category','blog','2025-12-26 09:38:51','2025-12-26 09:38:53'),(106,'fashion',2,'Botble\\Blog\\Models\\Category','blog','2025-12-26 09:38:51','2025-12-26 09:38:53'),(107,'electronic',3,'Botble\\Blog\\Models\\Category','blog','2025-12-26 09:38:51','2025-12-26 09:38:53'),(108,'commercial',4,'Botble\\Blog\\Models\\Category','blog','2025-12-26 09:38:51','2025-12-26 09:38:53'),(109,'general',1,'Botble\\Blog\\Models\\Tag','tag','2025-12-26 09:38:51','2025-12-26 09:38:51'),(110,'design',2,'Botble\\Blog\\Models\\Tag','tag','2025-12-26 09:38:51','2025-12-26 09:38:51'),(111,'fashion',3,'Botble\\Blog\\Models\\Tag','tag','2025-12-26 09:38:51','2025-12-26 09:38:51'),(112,'branding',4,'Botble\\Blog\\Models\\Tag','tag','2025-12-26 09:38:51','2025-12-26 09:38:51'),(113,'modern',5,'Botble\\Blog\\Models\\Tag','tag','2025-12-26 09:38:51','2025-12-26 09:38:51'),(114,'4-expert-tips-on-how-to-choose-the-right-mens-wallet',1,'Botble\\Blog\\Models\\Post','blog','2025-12-26 09:38:51','2025-12-26 09:38:53'),(115,'sexy-clutches-how-to-buy-wear-a-designer-clutch-bag',2,'Botble\\Blog\\Models\\Post','blog','2025-12-26 09:38:51','2025-12-26 09:38:53'),(116,'the-top-2020-handbag-trends-to-know',3,'Botble\\Blog\\Models\\Post','blog','2025-12-26 09:38:51','2025-12-26 09:38:53'),(117,'how-to-match-the-color-of-your-handbag-with-an-outfit',4,'Botble\\Blog\\Models\\Post','blog','2025-12-26 09:38:51','2025-12-26 09:38:53'),(118,'how-to-care-for-leather-bags',5,'Botble\\Blog\\Models\\Post','blog','2025-12-26 09:38:51','2025-12-26 09:38:53'),(119,'were-crushing-hard-on-summers-10-biggest-bag-trends',6,'Botble\\Blog\\Models\\Post','blog','2025-12-26 09:38:51','2025-12-26 09:38:53'),(120,'essential-qualities-of-highly-successful-music',7,'Botble\\Blog\\Models\\Post','blog','2025-12-26 09:38:51','2025-12-26 09:38:53'),(121,'9-things-i-love-about-shaving-my-head',8,'Botble\\Blog\\Models\\Post','blog','2025-12-26 09:38:51','2025-12-26 09:38:53'),(122,'why-teamwork-really-makes-the-dream-work',9,'Botble\\Blog\\Models\\Post','blog','2025-12-26 09:38:51','2025-12-26 09:38:53'),(123,'the-world-caters-to-average-people',10,'Botble\\Blog\\Models\\Post','blog','2025-12-26 09:38:51','2025-12-26 09:38:53'),(124,'the-litigants-on-the-screen-are-not-actors',11,'Botble\\Blog\\Models\\Post','blog','2025-12-26 09:38:51','2025-12-26 09:38:53'),(125,'home',1,'Botble\\Page\\Models\\Page','','2025-12-26 09:38:52','2025-12-26 09:38:52'),(126,'about-us',2,'Botble\\Page\\Models\\Page','','2025-12-26 09:38:52','2025-12-26 09:38:52'),(127,'terms-of-use',3,'Botble\\Page\\Models\\Page','','2025-12-26 09:38:52','2025-12-26 09:38:52'),(128,'terms-conditions',4,'Botble\\Page\\Models\\Page','','2025-12-26 09:38:52','2025-12-26 09:38:52'),(129,'refund-policy',5,'Botble\\Page\\Models\\Page','','2025-12-26 09:38:52','2025-12-26 09:38:52'),(130,'blog',6,'Botble\\Page\\Models\\Page','','2025-12-26 09:38:52','2025-12-26 09:38:52'),(131,'faqs',7,'Botble\\Page\\Models\\Page','','2025-12-26 09:38:52','2025-12-26 09:38:52'),(132,'contact',8,'Botble\\Page\\Models\\Page','','2025-12-26 09:38:52','2025-12-26 09:38:52'),(133,'cookie-policy',9,'Botble\\Page\\Models\\Page','','2025-12-26 09:38:52','2025-12-26 09:38:52'),(134,'affiliate',10,'Botble\\Page\\Models\\Page','','2025-12-26 09:38:52','2025-12-26 09:38:52'),(135,'career',11,'Botble\\Page\\Models\\Page','','2025-12-26 09:38:52','2025-12-26 09:38:52'),(136,'coming-soon',12,'Botble\\Page\\Models\\Page','','2025-12-26 09:38:52','2025-12-26 09:38:52'),(137,'gopro',1,'Botble\\Marketplace\\Models\\Store','stores','2025-12-26 09:38:59','2025-12-26 09:38:59'),(138,'global-office',2,'Botble\\Marketplace\\Models\\Store','stores','2025-12-26 09:38:59','2025-12-26 09:38:59'),(139,'young-shop',3,'Botble\\Marketplace\\Models\\Store','stores','2025-12-26 09:38:59','2025-12-26 09:38:59'),(140,'global-store',4,'Botble\\Marketplace\\Models\\Store','stores','2025-12-26 09:38:59','2025-12-26 09:38:59'),(141,'roberts-store',5,'Botble\\Marketplace\\Models\\Store','stores','2025-12-26 09:38:59','2025-12-26 09:38:59'),(142,'stouffer',6,'Botble\\Marketplace\\Models\\Store','stores','2025-12-26 09:38:59','2025-12-26 09:38:59'),(143,'starkist',7,'Botble\\Marketplace\\Models\\Store','stores','2025-12-26 09:38:59','2025-12-26 09:38:59'),(144,'old-el-paso',8,'Botble\\Marketplace\\Models\\Store','stores','2025-12-26 09:38:59','2025-12-26 09:38:59'),(145,'tyson',9,'Botble\\Marketplace\\Models\\Store','stores','2025-12-26 09:38:59','2025-12-26 09:38:59'),(146,'headphone-ultra-bass',55,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:39:02','2025-12-26 09:39:02'),(147,'headphone-ultra-bass',56,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:39:02','2025-12-26 09:39:02'),(148,'headphone-ultra-bass',57,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:39:02','2025-12-26 09:39:02'),(149,'headphone-ultra-bass',58,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:39:02','2025-12-26 09:39:02'),(150,'boxed-bluetooth-headphone',59,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:39:02','2025-12-26 09:39:02'),(151,'boxed-bluetooth-headphone',60,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:39:02','2025-12-26 09:39:02'),(152,'boxed-bluetooth-headphone',61,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:39:02','2025-12-26 09:39:02'),(153,'boxed-bluetooth-headphone',62,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:39:02','2025-12-26 09:39:02'),(154,'camera-samsung-ss-24-digital',63,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:39:02','2025-12-26 09:39:02'),(155,'camera-samsung-ss-24-digital',64,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:39:02','2025-12-26 09:39:02'),(156,'apple-watch-serial-7',65,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:39:02','2025-12-26 09:39:02'),(157,'macbook-pro-13-inch',66,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:39:02','2025-12-26 09:39:02'),(158,'apple-keyboard-digital',67,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:39:02','2025-12-26 09:39:02'),(159,'apple-keyboard-digital',68,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:39:02','2025-12-26 09:39:02'),(160,'apple-airpods-serial-3',69,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:39:02','2025-12-26 09:39:02'),(161,'cool-smart-watches-digital',70,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:39:02','2025-12-26 09:39:02'),(162,'cool-smart-watches-digital',71,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:39:02','2025-12-26 09:39:02'),(163,'cool-smart-watches-digital',72,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:39:02','2025-12-26 09:39:02'),(164,'black-smart-watches',73,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:39:02','2025-12-26 09:39:02'),(165,'black-smart-watches',74,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:39:02','2025-12-26 09:39:02'),(166,'leather-watch-in-black',75,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:39:02','2025-12-26 09:39:02'),(167,'leather-watch-in-black',76,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:39:02','2025-12-26 09:39:02'),(168,'leather-watch-in-black',77,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:39:02','2025-12-26 09:39:02'),(169,'gaming-keyboard',78,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:39:02','2025-12-26 09:39:02'),(170,'gaming-keyboard',79,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:39:02','2025-12-26 09:39:02'),(171,'gaming-keyboard',80,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:39:02','2025-12-26 09:39:02'),(172,'gaming-keyboard',81,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:39:02','2025-12-26 09:39:02'),(173,'wireless-keyboard-digital',82,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:39:02','2025-12-26 09:39:02'),(174,'wireless-keyboard-digital',83,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:39:02','2025-12-26 09:39:02'),(175,'wireless-keyboard-digital',84,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:39:02','2025-12-26 09:39:02'),(176,'wireless-keyboard-digital',85,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:39:02','2025-12-26 09:39:02'),(177,'wireless-keyboard-digital',86,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:39:02','2025-12-26 09:39:02'),(178,'black-smart-watches',87,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:39:02','2025-12-26 09:39:02'),(179,'black-smart-watches',88,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:39:02','2025-12-26 09:39:02'),(180,'black-smart-watches',89,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:39:02','2025-12-26 09:39:02'),(181,'black-smart-watches',90,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:39:02','2025-12-26 09:39:02'),(182,'headphone-ultra-bass',91,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:39:02','2025-12-26 09:39:02'),(183,'headphone-ultra-bass',92,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:39:02','2025-12-26 09:39:02'),(184,'boxed-bluetooth-headphone-digital',93,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:39:02','2025-12-26 09:39:02'),(185,'boxed-bluetooth-headphone-digital',94,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:39:02','2025-12-26 09:39:02'),(186,'boxed-bluetooth-headphone-digital',95,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:39:02','2025-12-26 09:39:02'),(187,'boxed-bluetooth-headphone-digital',96,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:39:02','2025-12-26 09:39:02'),(188,'camera-samsung-ss-24',97,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:39:02','2025-12-26 09:39:02'),(189,'camera-samsung-ss-24',98,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:39:02','2025-12-26 09:39:02'),(190,'leather-watch-in-black',99,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:39:02','2025-12-26 09:39:02'),(191,'leather-watch-in-black',100,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:39:02','2025-12-26 09:39:02'),(192,'leather-watch-in-black',101,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:39:02','2025-12-26 09:39:02'),(193,'leather-watch-in-black',102,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:39:02','2025-12-26 09:39:02'),(194,'apple-iphone-13-plus',103,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:39:02','2025-12-26 09:39:02'),(195,'apple-iphone-13-plus',104,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:39:02','2025-12-26 09:39:02'),(196,'apple-iphone-13-plus',105,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:39:02','2025-12-26 09:39:02'),(197,'apple-keyboard',106,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:39:02','2025-12-26 09:39:02'),(198,'apple-keyboard',107,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:39:02','2025-12-26 09:39:02'),(199,'apple-keyboard',108,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:39:02','2025-12-26 09:39:02'),(200,'macsafe-80w-digital',109,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:39:02','2025-12-26 09:39:02'),(201,'macsafe-80w-digital',110,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:39:02','2025-12-26 09:39:02'),(202,'macsafe-80w-digital',111,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:39:02','2025-12-26 09:39:02'),(203,'macsafe-80w-digital',112,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:39:02','2025-12-26 09:39:02'),(204,'apple-airpods-serial-3',113,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:39:02','2025-12-26 09:39:02'),(205,'apple-airpods-serial-3',114,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:39:02','2025-12-26 09:39:02'),(206,'apple-airpods-serial-3',115,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:39:02','2025-12-26 09:39:02'),(207,'cool-smart-watches',116,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:39:02','2025-12-26 09:39:02'),(208,'cool-smart-watches',117,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:39:02','2025-12-26 09:39:02'),(209,'cool-smart-watches',118,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:39:02','2025-12-26 09:39:02'),(210,'leather-watch-in-black',119,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:39:02','2025-12-26 09:39:02'),(211,'leather-watch-in-black',120,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:39:02','2025-12-26 09:39:02'),(212,'sony-wh-1000xm4-wireless-headphones',121,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:39:02','2025-12-26 09:39:02'),(213,'samsung-galaxy-s22-ultra-digital',122,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:39:02','2025-12-26 09:39:02'),(214,'ipad-pro-129-inch',123,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:39:02','2025-12-26 09:39:02'),(215,'ipad-pro-129-inch',124,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:39:02','2025-12-26 09:39:02'),(216,'ipad-pro-129-inch',125,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:39:02','2025-12-26 09:39:02'),(217,'bose-quietcomfort-earbuds',126,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:39:02','2025-12-26 09:39:02'),(218,'bose-quietcomfort-earbuds',127,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:39:02','2025-12-26 09:39:02'),(219,'lg-oled-c1-series-tv-digital',128,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:39:02','2025-12-26 09:39:02'),(220,'lg-oled-c1-series-tv-digital',129,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:39:02','2025-12-26 09:39:02'),(221,'lg-oled-c1-series-tv-digital',130,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:39:02','2025-12-26 09:39:02'),(222,'lg-oled-c1-series-tv-digital',131,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:39:02','2025-12-26 09:39:02'),(223,'nintendo-switch-oled-model',132,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:39:02','2025-12-26 09:39:02'),(224,'nintendo-switch-oled-model',133,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:39:02','2025-12-26 09:39:02'),(225,'nintendo-switch-oled-model',134,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:39:02','2025-12-26 09:39:02'),(226,'gopro-hero10-black-digital',135,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:39:02','2025-12-26 09:39:02'),(227,'gopro-hero10-black-digital',136,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:39:02','2025-12-26 09:39:02'),(228,'gopro-hero10-black-digital',137,'Botble\\Ecommerce\\Models\\Product','products','2025-12-26 09:39:02','2025-12-26 09:39:02'),(229,'new-arrival',1,'Botble\\Ecommerce\\Models\\ProductCollection','collections','2025-12-26 09:39:02','2025-12-26 09:39:02'),(230,'best-sellers',2,'Botble\\Ecommerce\\Models\\ProductCollection','collections','2025-12-26 09:39:02','2025-12-26 09:39:02'),(231,'special-offer',3,'Botble\\Ecommerce\\Models\\ProductCollection','collections','2025-12-26 09:39:02','2025-12-26 09:39:02');
/*!40000 ALTER TABLE `slugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slugs_translations`
--

DROP TABLE IF EXISTS `slugs_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slugs_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slugs_id` bigint unsigned NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prefix` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`lang_code`,`slugs_id`),
  KEY `idx_slugid_key_prefix` (`slugs_id`,`key`,`prefix`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slugs_translations`
--

LOCK TABLES `slugs_translations` WRITE;
/*!40000 ALTER TABLE `slugs_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `slugs_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_logins`
--

DROP TABLE IF EXISTS `social_logins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `social_logins` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` text COLLATE utf8mb4_unicode_ci,
  `refresh_token` text COLLATE utf8mb4_unicode_ci,
  `token_expires_at` timestamp NULL DEFAULT NULL,
  `provider_data` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_logins_provider_provider_id_unique` (`provider`,`provider_id`),
  KEY `social_logins_user_type_user_id_index` (`user_type`,`user_id`),
  KEY `social_logins_user_id_user_type_index` (`user_id`,`user_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_logins`
--

LOCK TABLES `social_logins` WRITE;
/*!40000 ALTER TABLE `social_logins` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_logins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `states` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `abbreviation` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` bigint unsigned DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `states_slug_unique` (`slug`),
  KEY `idx_states_name` (`name`),
  KEY `idx_states_status` (`status`),
  KEY `idx_states_country_id` (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states`
--

LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
/*!40000 ALTER TABLE `states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states_translations`
--

DROP TABLE IF EXISTS `states_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `states_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `states_id` bigint unsigned NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `abbreviation` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`states_id`),
  KEY `idx_states_trans_state_lang` (`states_id`,`lang_code`),
  KEY `idx_states_trans_name` (`name`),
  KEY `idx_states_trans_states_id` (`states_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states_translations`
--

LOCK TABLES `states_translations` WRITE;
/*!40000 ALTER TABLE `states_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `states_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author_id` bigint unsigned DEFAULT NULL,
  `author_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'General',1,'Botble\\ACL\\Models\\User',NULL,'published','2025-12-26 09:38:51','2025-12-26 09:38:51'),(2,'Design',1,'Botble\\ACL\\Models\\User',NULL,'published','2025-12-26 09:38:51','2025-12-26 09:38:51'),(3,'Fashion',1,'Botble\\ACL\\Models\\User',NULL,'published','2025-12-26 09:38:51','2025-12-26 09:38:51'),(4,'Branding',1,'Botble\\ACL\\Models\\User',NULL,'published','2025-12-26 09:38:51','2025-12-26 09:38:51'),(5,'Modern',1,'Botble\\ACL\\Models\\User',NULL,'published','2025-12-26 09:38:51','2025-12-26 09:38:51');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags_translations`
--

DROP TABLE IF EXISTS `tags_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tags_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`tags_id`),
  KEY `idx_tags_trans_tags_id` (`tags_id`),
  KEY `idx_tags_trans_tag_lang` (`tags_id`,`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags_translations`
--

LOCK TABLES `tags_translations` WRITE;
/*!40000 ALTER TABLE `tags_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testimonials`
--

DROP TABLE IF EXISTS `testimonials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testimonials` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testimonials`
--

LOCK TABLES `testimonials` WRITE;
/*!40000 ALTER TABLE `testimonials` DISABLE KEYS */;
/*!40000 ALTER TABLE `testimonials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testimonials_translations`
--

DROP TABLE IF EXISTS `testimonials_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testimonials_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `testimonials_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `company` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`testimonials_id`),
  KEY `idx_testimonials_trans_testimonials_id` (`testimonials_id`),
  KEY `idx_testimonials_trans_testimonial_lang` (`testimonials_id`,`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testimonials_translations`
--

LOCK TABLES `testimonials_translations` WRITE;
/*!40000 ALTER TABLE `testimonials_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `testimonials_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_meta`
--

DROP TABLE IF EXISTS `user_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_meta` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_meta_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_meta`
--

LOCK TABLES `user_meta` WRITE;
/*!40000 ALTER TABLE `user_meta` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_settings`
--

DROP TABLE IF EXISTS `user_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `key` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` json NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_settings_user_type_user_id_key_unique` (`user_type`,`user_id`,`key`),
  KEY `user_settings_user_type_user_id_index` (`user_type`,`user_id`),
  KEY `user_settings_key_index` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_settings`
--

LOCK TABLES `user_settings` WRITE;
/*!40000 ALTER TABLE `user_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `first_name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_id` bigint unsigned DEFAULT NULL,
  `super_user` tinyint(1) NOT NULL DEFAULT '0',
  `manage_supers` tinyint(1) NOT NULL DEFAULT '0',
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `last_login` timestamp NULL DEFAULT NULL,
  `sessions_invalidated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin@company.com',NULL,NULL,'$2y$12$mKJZHMWWbxh7ove/N.KtL.GK3bRkC68Mf594XOMV3.A5D8QBK981G',NULL,'2025-12-26 09:38:50','2025-12-26 09:38:50','System','Admin','admin',NULL,1,1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `widgets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `widget_id` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sidebar_id` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` tinyint unsigned NOT NULL DEFAULT '0',
  `data` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `widgets_unique_index` (`theme`,`sidebar_id`,`widget_id`,`position`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
INSERT INTO `widgets` VALUES (1,'CustomMenuWidget','footer_sidebar','martfury',1,'{\"id\":\"CustomMenuWidget\",\"name\":\"Quick links\",\"menu_id\":\"quick-links\"}','2025-12-26 09:38:56','2025-12-26 09:38:56'),(2,'CustomMenuWidget','footer_sidebar','martfury',2,'{\"id\":\"CustomMenuWidget\",\"name\":\"Company\",\"menu_id\":\"company\"}','2025-12-26 09:38:56','2025-12-26 09:38:56'),(3,'CustomMenuWidget','footer_sidebar','martfury',3,'{\"id\":\"CustomMenuWidget\",\"name\":\"Business\",\"menu_id\":\"business\"}','2025-12-26 09:38:56','2025-12-26 09:38:56'),(4,'BlogSearchWidget','primary_sidebar','martfury',1,'{\"id\":\"BlogSearchWidget\",\"name\":\"Search\"}','2025-12-26 09:38:56','2025-12-26 09:38:56'),(5,'BlogCategoriesWidget','primary_sidebar','martfury',2,'{\"id\":\"BlogCategoriesWidget\",\"name\":\"Categories\"}','2025-12-26 09:38:56','2025-12-26 09:38:56'),(6,'RecentPostsWidget','primary_sidebar','martfury',3,'{\"id\":\"RecentPostsWidget\",\"name\":\"Recent Posts\"}','2025-12-26 09:38:56','2025-12-26 09:38:56'),(7,'TagsWidget','primary_sidebar','martfury',4,'{\"id\":\"TagsWidget\",\"name\":\"Popular Tags\"}','2025-12-26 09:38:56','2025-12-26 09:38:56'),(8,'ProductCategoriesWidget','bottom_footer_sidebar','martfury',1,'{\"id\":\"ProductCategoriesWidget\",\"name\":\"Consumer Electric\",\"categories\":[18,2,3,4,5,6,7]}','2025-12-26 09:38:56','2025-12-26 09:38:56'),(9,'ProductCategoriesWidget','bottom_footer_sidebar','martfury',2,'{\"id\":\"ProductCategoriesWidget\",\"name\":\"Clothing & Apparel\",\"categories\":[8,9,10,11,12]}','2025-12-26 09:38:56','2025-12-26 09:38:56'),(10,'ProductCategoriesWidget','bottom_footer_sidebar','martfury',3,'{\"id\":\"ProductCategoriesWidget\",\"name\":\"Home, Garden & Kitchen\",\"categories\":[13,14,15,16,17]}','2025-12-26 09:38:56','2025-12-26 09:38:56'),(11,'ProductCategoriesWidget','bottom_footer_sidebar','martfury',4,'{\"id\":\"ProductCategoriesWidget\",\"name\":\"Health & Beauty\",\"categories\":[20,21,22,23,24]}','2025-12-26 09:38:56','2025-12-26 09:38:56'),(12,'ProductCategoriesWidget','bottom_footer_sidebar','martfury',5,'{\"id\":\"ProductCategoriesWidget\",\"name\":\"Computer & Technologies\",\"categories\":[25,26,27,28,29,19]}','2025-12-26 09:38:56','2025-12-26 09:38:56');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-26 23:39:03
