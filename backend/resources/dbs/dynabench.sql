-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: localhost    Database: dynabench
-- ------------------------------------------------------
-- Server version	8.0.36-0ubuntu0.22.04.1

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
-- Table structure for table `_yoyo_log`
--

DROP TABLE IF EXISTS `_yoyo_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_yoyo_log` (
  `id` varchar(36) NOT NULL,
  `migration_hash` varchar(64) DEFAULT NULL,
  `migration_id` varchar(255) DEFAULT NULL,
  `operation` varchar(10) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `hostname` varchar(255) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `created_at_utc` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_yoyo_log`
--

LOCK TABLES `_yoyo_log` WRITE;
/*!40000 ALTER TABLE `_yoyo_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `_yoyo_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_yoyo_migration`
--

DROP TABLE IF EXISTS `_yoyo_migration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_yoyo_migration` (
  `migration_hash` varchar(64) NOT NULL,
  `migration_id` varchar(255) DEFAULT NULL,
  `applied_at_utc` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`migration_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_yoyo_migration`
--

LOCK TABLES `_yoyo_migration` WRITE;
/*!40000 ALTER TABLE `_yoyo_migration` DISABLE KEYS */;
/*!40000 ALTER TABLE `_yoyo_migration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_yoyo_version`
--

DROP TABLE IF EXISTS `_yoyo_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_yoyo_version` (
  `version` int NOT NULL,
  `installed_at_utc` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_yoyo_version`
--

LOCK TABLES `_yoyo_version` WRITE;
/*!40000 ALTER TABLE `_yoyo_version` DISABLE KEYS */;
/*!40000 ALTER TABLE `_yoyo_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `badges`
--

DROP TABLE IF EXISTS `badges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `badges` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uid` int DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `metadata_json` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `awarded` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  CONSTRAINT `badges_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=29919 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `badges`
--

LOCK TABLES `badges` WRITE;
/*!40000 ALTER TABLE `badges` DISABLE KEYS */;
INSERT INTO `badges` VALUES (29917,4933,'WELCOME_NOOB',NULL,'2024-02-29 14:32:35'),(29918,4934,'WELCOME_NOOB',NULL,'2024-02-29 14:48:41');
/*!40000 ALTER TABLE `badges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `challenges_types`
--

DROP TABLE IF EXISTS `challenges_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `challenges_types` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `challenges_types`
--

LOCK TABLES `challenges_types` WRITE;
/*!40000 ALTER TABLE `challenges_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `challenges_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contexts`
--

DROP TABLE IF EXISTS `contexts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contexts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `r_realid` int NOT NULL,
  `context_json` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `total_used` int DEFAULT NULL,
  `last_used` datetime DEFAULT NULL,
  `metadata_json` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `tag` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`),
  KEY `r_realid` (`r_realid`),
  CONSTRAINT `contexts_ibfk_1` FOREIGN KEY (`r_realid`) REFERENCES `rounds` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=489563 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contexts`
--

LOCK TABLES `contexts` WRITE;
/*!40000 ALTER TABLE `contexts` DISABLE KEYS */;
/*!40000 ALTER TABLE `contexts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datasets`
--

DROP TABLE IF EXISTS `datasets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `datasets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `tid` int NOT NULL,
  `rid` int DEFAULT '0',
  `desc` varchar(255) DEFAULT NULL,
  `access_type` enum('scoring','standard','hidden') DEFAULT 'scoring',
  `longdesc` text,
  `source_url` text,
  `log_access_type` enum('owner','user') DEFAULT 'owner',
  `tags` tinyint(1) DEFAULT '1',
  `has_downstream` int DEFAULT '0',
  `weight` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `tid` (`tid`),
  CONSTRAINT `datasets_tid` FOREIGN KEY (`tid`) REFERENCES `tasks` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=314 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datasets`
--

LOCK TABLES `datasets` WRITE;
/*!40000 ALTER TABLE `datasets` DISABLE KEYS */;
/*!40000 ALTER TABLE `datasets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `examples`
--

DROP TABLE IF EXISTS `examples`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `examples` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cid` int NOT NULL,
  `uid` int DEFAULT NULL,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `verifier_preds` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `model_wrong` tinyint(1) DEFAULT NULL,
  `retracted` tinyint(1) DEFAULT NULL,
  `verified_correct` tinyint(1) DEFAULT NULL,
  `generated_datetime` datetime DEFAULT NULL,
  `time_elapsed` time DEFAULT NULL,
  `annotator_id` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `model_endpoint_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `metadata_json` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `split` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'undecided',
  `flagged` tinyint(1) DEFAULT '0',
  `total_verified` int DEFAULT '0',
  `verified` tinyint(1) DEFAULT '0',
  `verified_incorrect` tinyint(1) DEFAULT '0',
  `verified_flagged` tinyint(1) DEFAULT '0',
  `tag` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `input_json` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `output_json` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  KEY `uid` (`uid`),
  CONSTRAINT `examples_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `contexts` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `examples_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=459168 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `examples`
--

LOCK TABLES `examples` WRITE;
/*!40000 ALTER TABLE `examples` DISABLE KEYS */;
/*!40000 ALTER TABLE `examples` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historical_data`
--

DROP TABLE IF EXISTS `historical_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historical_data` (
  `id` int NOT NULL AUTO_INCREMENT,
  `task_id` int NOT NULL,
  `user_id` int NOT NULL,
  `history` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_user_task_history` (`user_id`,`task_id`,`history`(2000)),
  KEY `task_id` (`task_id`),
  CONSTRAINT `historical_data_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`),
  CONSTRAINT `historical_data_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18306 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historical_data`
--

LOCK TABLES `historical_data` WRITE;
/*!40000 ALTER TABLE `historical_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `historical_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leaderboard_configurations`
--

DROP TABLE IF EXISTS `leaderboard_configurations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leaderboard_configurations` (
  `tid` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `uid` int NOT NULL,
  `create_datetime` datetime DEFAULT NULL,
  `configuration_json` text NOT NULL,
  `desc` text,
  PRIMARY KEY (`name`,`tid`),
  KEY `leaderboard_configurations_tid` (`tid`),
  KEY `leaderboard_configurations_uid` (`uid`),
  CONSTRAINT `leaderboard_configurations_tid` FOREIGN KEY (`tid`) REFERENCES `tasks` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `leaderboard_configurations_uid` FOREIGN KEY (`uid`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leaderboard_configurations`
--

LOCK TABLES `leaderboard_configurations` WRITE;
/*!40000 ALTER TABLE `leaderboard_configurations` DISABLE KEYS */;
/*!40000 ALTER TABLE `leaderboard_configurations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leaderboard_snapshots`
--

DROP TABLE IF EXISTS `leaderboard_snapshots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leaderboard_snapshots` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tid` int NOT NULL,
  `uid` int NOT NULL,
  `desc` text,
  `create_datetime` datetime DEFAULT CURRENT_TIMESTAMP,
  `data_json` longtext NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_tid_name_pair` (`tid`,`name`),
  KEY `leaderboard_snapshots_uid` (`uid`),
  CONSTRAINT `leaderboard_snapshots_tid` FOREIGN KEY (`tid`) REFERENCES `tasks` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `leaderboard_snapshots_uid` FOREIGN KEY (`uid`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leaderboard_snapshots`
--

LOCK TABLES `leaderboard_snapshots` WRITE;
/*!40000 ALTER TABLE `leaderboard_snapshots` DISABLE KEYS */;
/*!40000 ALTER TABLE `leaderboard_snapshots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `models`
--

DROP TABLE IF EXISTS `models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `models` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tid` int NOT NULL,
  `uid` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `shortname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `longdesc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `papers` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `is_published` tinyint(1) DEFAULT '0',
  `params` bigint DEFAULT NULL,
  `languages` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `license` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `upload_datetime` datetime DEFAULT NULL,
  `model_card` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `deployment_status` enum('uploaded','processing','deployed','created','failed','unknown','takendown','predictions_upload','takendownnonactive') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'unknown',
  `secret` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `endpoint_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `light_model` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_in_the_loop` tinyint(1) DEFAULT NULL,
  `source_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `is_anonymous` tinyint(1) DEFAULT '0',
  `evaluation_status_json` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`),
  KEY `tid` (`tid`),
  KEY `uid` (`uid`),
  CONSTRAINT `models_ibfk_1` FOREIGN KEY (`tid`) REFERENCES `tasks` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `models_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=1646 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `models`
--

LOCK TABLES `models` WRITE;
/*!40000 ALTER TABLE `models` DISABLE KEYS */;
/*!40000 ALTER TABLE `models` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uid` int DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `metadata_json` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `seen` tinyint(1) DEFAULT '0',
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=65420 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refresh_tokens`
--

DROP TABLE IF EXISTS `refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `refresh_tokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` varchar(255) NOT NULL,
  `generated_datetime` datetime DEFAULT NULL,
  `uid` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`),
  KEY `tid` (`uid`),
  CONSTRAINT `refresh_tokens_uid` FOREIGN KEY (`uid`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=19763 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refresh_tokens`
--

LOCK TABLES `refresh_tokens` WRITE;
/*!40000 ALTER TABLE `refresh_tokens` DISABLE KEYS */;
INSERT INTO `refresh_tokens` VALUES (19760,'c9a14c5dcbeccea020d6c3366a95f431f5501229fd35ca3ab87271e40d6b7341','2024-02-29 12:40:06',4933),(19761,'5bc78c6ded19a4a8e74ce7b94324793fdcf93f898b880b39e3d4eed6bbbadd61','2024-03-01 10:37:29',4933),(19762,'cb7be9f84653b3d1beef15ae514622d5e5f6a053187600f211d5df6a3d60e77d','2024-03-01 10:39:58',2);
/*!40000 ALTER TABLE `refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `round_user_example_info`
--

DROP TABLE IF EXISTS `round_user_example_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `round_user_example_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uid` int NOT NULL,
  `r_realid` int NOT NULL,
  `total_fooled` int DEFAULT '0',
  `total_verified_not_correct_fooled` int DEFAULT '0',
  `examples_submitted` int DEFAULT '0',
  `amount_examples_on_a_day` int DEFAULT NULL,
  `last_used` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `r_realid` (`r_realid`),
  CONSTRAINT `round_user_example_info_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `round_user_example_info_ibfk_2` FOREIGN KEY (`r_realid`) REFERENCES `rounds` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=2621 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `round_user_example_info`
--

LOCK TABLES `round_user_example_info` WRITE;
/*!40000 ALTER TABLE `round_user_example_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `round_user_example_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rounds`
--

DROP TABLE IF EXISTS `rounds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rounds` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tid` int NOT NULL,
  `rid` int NOT NULL,
  `secret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `longdesc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `total_fooled` int DEFAULT '0',
  `total_collected` int DEFAULT '0',
  `total_time_spent` time DEFAULT NULL,
  `start_datetime` datetime DEFAULT NULL,
  `end_datetime` datetime DEFAULT NULL,
  `total_verified_fooled` int DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `tid` (`tid`),
  KEY `ix_rounds_rid` (`rid`),
  CONSTRAINT `rounds_ibfk_1` FOREIGN KEY (`tid`) REFERENCES `tasks` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rounds`
--

LOCK TABLES `rounds` WRITE;
/*!40000 ALTER TABLE `rounds` DISABLE KEYS */;
/*!40000 ALTER TABLE `rounds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scores`
--

DROP TABLE IF EXISTS `scores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `mid` int NOT NULL,
  `r_realid` int DEFAULT NULL,
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `longdesc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `pretty_perf` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `perf` float DEFAULT NULL,
  `raw_upload_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `eval_id_start` int DEFAULT '-1',
  `eval_id_end` int DEFAULT '-1',
  `metadata_json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `did` int DEFAULT NULL,
  `memory_utilization` float DEFAULT NULL COMMENT 'Unit: GiB',
  `examples_per_second` float DEFAULT NULL,
  `raw_output_s3_uri` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `fairness` float DEFAULT NULL COMMENT 'raw perf metric on fairness perturbed dataset',
  `robustness` float DEFAULT NULL COMMENT 'raw perf metric on robustness perturbed datast',
  `perf_std` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mid` (`mid`),
  KEY `rid` (`r_realid`),
  KEY `dataset_id` (`did`),
  CONSTRAINT `dataset_id` FOREIGN KEY (`did`) REFERENCES `datasets` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `scores_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `models` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=33058 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scores`
--

LOCK TABLES `scores` WRITE;
/*!40000 ALTER TABLE `scores` DISABLE KEYS */;
/*!40000 ALTER TABLE `scores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_categories`
--

DROP TABLE IF EXISTS `task_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task_categories` (
  `id_task` int DEFAULT NULL,
  `id_category` int DEFAULT NULL,
  KEY `id_task` (`id_task`),
  KEY `id_category` (`id_category`),
  CONSTRAINT `task_categories_ibfk_1` FOREIGN KEY (`id_task`) REFERENCES `tasks` (`id`),
  CONSTRAINT `task_categories_ibfk_2` FOREIGN KEY (`id_category`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_categories`
--

LOCK TABLES `task_categories` WRITE;
/*!40000 ALTER TABLE `task_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_proposals`
--

DROP TABLE IF EXISTS `task_proposals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task_proposals` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uid` int NOT NULL,
  `task_code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `longdesc` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `task_code` (`task_code`),
  UNIQUE KEY `name` (`name`),
  KEY `task_proposals_uid` (`uid`),
  CONSTRAINT `task_proposals_uid` FOREIGN KEY (`uid`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=557 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_proposals`
--

LOCK TABLES `task_proposals` WRITE;
/*!40000 ALTER TABLE `task_proposals` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_proposals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_user_permissions`
--

DROP TABLE IF EXISTS `task_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uid` int DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tid` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `task_user_permissions_ibfk_1` (`uid`),
  KEY `task_user_permissions_ibfk_2` (`tid`),
  CONSTRAINT `task_user_permissions_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `task_user_permissions_ibfk_2` FOREIGN KEY (`tid`) REFERENCES `tasks` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_user_permissions`
--

LOCK TABLES `task_user_permissions` WRITE;
/*!40000 ALTER TABLE `task_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tasks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `last_updated` datetime DEFAULT NULL,
  `cur_round` int NOT NULL,
  `hidden` tinyint(1) DEFAULT '1',
  `owner_uid` int DEFAULT NULL,
  `task_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `submitable` tinyint(1) DEFAULT '0',
  `create_endpoint` tinyint(1) DEFAULT NULL,
  `gpu` tinyint(1) DEFAULT NULL,
  `extra_torchserve_config` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `config_yaml` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `general_instructions` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `instructions_md` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `instance_type` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `instance_count` int DEFAULT '1',
  `aws_region` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `s3_bucket` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `eval_server_id` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `active` tinyint(1) DEFAULT '0',
  `validate_non_fooling` tinyint(1) NOT NULL DEFAULT '0',
  `unpublished_models_in_leaderboard` tinyint(1) NOT NULL DEFAULT '0',
  `num_matching_validations` int NOT NULL DEFAULT '3',
  `dynalab_threshold` int NOT NULL DEFAULT '3',
  `dynalab_hr_diff` int NOT NULL DEFAULT '24',
  `has_predictions_upload` tinyint(1) DEFAULT '0',
  `predictions_upload_instructions_md` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `is_building` tinyint(1) DEFAULT '0',
  `unique_validators_for_example_tags` tinyint(1) DEFAULT '0',
  `train_file_upload_instructions_md` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `build_sqs_queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `eval_sqs_queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `is_decen_task` tinyint(1) DEFAULT '0',
  `task_aws_account_id` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `task_gateway_predict_prefix` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `context` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'min',
  `dataperf` tinyint(1) DEFAULT NULL,
  `lambda_model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `mlcube_tutorial_markdown` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `mlsphere_json` json DEFAULT NULL,
  `dynamic_adversarial_data_collection` int DEFAULT NULL,
  `dynamic_adversarial_data_validation` int NOT NULL DEFAULT '1',
  `challenge_type` int DEFAULT NULL,
  `decen_queue` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `decen_bucket` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `decen_aws_region` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `image_url` varchar(550) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `documentation_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `accept_sandbox_creation` int DEFAULT '1',
  `creation_example_md` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `max_amount_examples_on_a_day` int DEFAULT '1000',
  `bucket_for_aditional_example_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `submitable_predictions` int DEFAULT '0',
  `is_finished` int DEFAULT '0',
  `show_trends` int DEFAULT '1',
  `show_leaderboard` int DEFAULT '1',
  `show_user_leaderboard` int DEFAULT '1',
  `show_username_leaderboard` int DEFAULT '1',
  `show_user_leaderboard_csv` int DEFAULT '0',
  `leaderboard_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `task_code` (`task_code`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `realname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `affiliation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `examples_verified_correct` int DEFAULT NULL,
  `examples_submitted` int DEFAULT NULL,
  `examples_verified` int DEFAULT NULL,
  `forgot_password_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `forgot_password_token_expiry_date` datetime DEFAULT NULL,
  `avatar_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `models_submitted` int DEFAULT '0',
  `unseen_notifications` int DEFAULT '0',
  `streak_days` int DEFAULT '0',
  `streak_days_last_model_wrong` datetime DEFAULT NULL,
  `streak_examples` int DEFAULT '0',
  `admin` tinyint(1) DEFAULT '0',
  `settings_json` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `total_fooled` int DEFAULT '0',
  `total_verified_fooled` int DEFAULT '0',
  `total_retracted` int DEFAULT '0',
  `api_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `metadata_json` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `total_verified_not_correct_fooled` int DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4935 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'gfragi','gfragi@hua.gr','pbkdf2:sha256:260000$YLigYhHWItvwi4qG$1b344609a4b7b79e9b97fb491cfb300d28f716306b649c41fdcd6bd699f3abba','George Fragiadakis','HUA',10,20,125,NULL,NULL,NULL,0,0,0,NULL,0,0,NULL,0,0,0,NULL,NULL,0),(4933,'gfragi2','gfragi@gmail.com','pbkdf2:sha256:260000$YLigYhHWItvwi4qG$1b344609a4b7b79e9b97fb491cfb300d28f716306b649c41fdcd6bd699f3abba',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4934,'test','test@test.com','pbkdf2:sha256:260000$dUCTzaTNyDvSc4AU$a21118ffff68b512f5a657f2dd1ec7b3d9effe79908aa1ce4a13b9c2240fa3cd',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `validations`
--

DROP TABLE IF EXISTS `validations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `validations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uid` int DEFAULT NULL,
  `label` enum('flagged','correct','incorrect','placeholder') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `mode` enum('owner','user') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `eid` int DEFAULT NULL,
  `metadata_json` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`),
  KEY `validations_ibfk_1` (`eid`),
  KEY `validations_ibfk_2` (`uid`),
  CONSTRAINT `validations_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `examples` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `validations_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=495130 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `validations`
--

LOCK TABLES `validations` WRITE;
/*!40000 ALTER TABLE `validations` DISABLE KEYS */;
/*!40000 ALTER TABLE `validations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yoyo_lock`
--

DROP TABLE IF EXISTS `yoyo_lock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `yoyo_lock` (
  `locked` int NOT NULL DEFAULT '1',
  `ctime` timestamp NULL DEFAULT NULL,
  `pid` int NOT NULL,
  PRIMARY KEY (`locked`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yoyo_lock`
--

LOCK TABLES `yoyo_lock` WRITE;
/*!40000 ALTER TABLE `yoyo_lock` DISABLE KEYS */;
/*!40000 ALTER TABLE `yoyo_lock` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-01 14:56:06
