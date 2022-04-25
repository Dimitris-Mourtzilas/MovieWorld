-- MySQL dump 10.13  Distrib 5.7.37, for Linux (x86_64)
--
-- Host: localhost    Database: db
-- ------------------------------------------------------
-- Server version	5.7.37-0ubuntu0.18.04.1

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
-- Table structure for table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctrine_migration_versions`
--

LOCK TABLES `doctrine_migration_versions` WRITE;
/*!40000 ALTER TABLE `doctrine_migration_versions` DISABLE KEYS */;
INSERT INTO `doctrine_migration_versions` VALUES ('DoctrineMigrations\\Version20220420122748','2022-04-20 15:27:59',336),('DoctrineMigrations\\Version20220420122949','2022-04-21 09:28:57',587),('DoctrineMigrations\\Version20220421062932','2022-04-21 09:30:02',784),('DoctrineMigrations\\Version20220421102018','2022-04-21 13:20:22',4471),('DoctrineMigrations\\Version20220421114111','2022-04-21 14:41:17',2411),('DoctrineMigrations\\Version20220421134728','2022-04-21 16:47:37',2739),('DoctrineMigrations\\Version20220422071453','2022-04-22 10:15:04',1625),('DoctrineMigrations\\Version20220422073557','2022-04-22 10:36:02',521),('DoctrineMigrations\\Version20220422073624','2022-04-22 10:36:27',407),('DoctrineMigrations\\Version20220422081614','2022-04-22 11:16:21',910),('DoctrineMigrations\\Version20220423121447','2022-04-23 15:14:54',908),('DoctrineMigrations\\Version20220423124956','2022-04-23 15:50:00',1053),('DoctrineMigrations\\Version20220423125233','2022-04-23 15:52:37',570),('DoctrineMigrations\\Version20220423134846','2022-04-23 16:48:55',983),('DoctrineMigrations\\Version20220423135144','2022-04-23 16:51:48',839),('DoctrineMigrations\\Version20220423135254','2022-04-23 16:52:59',378),('DoctrineMigrations\\Version20220423225654','2022-04-24 01:56:59',596),('DoctrineMigrations\\Version20220424091720','2022-04-24 12:17:24',1197),('DoctrineMigrations\\Version20220424093355','2022-04-24 12:34:00',1665),('DoctrineMigrations\\Version20220424133205','2022-04-24 16:32:08',216),('DoctrineMigrations\\Version20220424134038','2022-04-24 16:40:43',1187),('DoctrineMigrations\\Version20220424144340','2022-04-24 17:43:44',490),('DoctrineMigrations\\Version20220424145153','2022-04-24 17:51:58',1770),('DoctrineMigrations\\Version20220424151119','2022-04-24 18:11:23',1625),('DoctrineMigrations\\Version20220424151652','2022-04-24 18:17:00',1805),('DoctrineMigrations\\Version20220424163205','2022-04-24 19:32:12',1820),('DoctrineMigrations\\Version20220424163743','2022-04-24 19:37:47',1686),('DoctrineMigrations\\Version20220424164000','2022-04-24 19:40:04',68),('DoctrineMigrations\\Version20220424164703','2022-04-24 19:47:06',1249),('DoctrineMigrations\\Version20220424165042','2022-04-24 19:50:46',1623),('DoctrineMigrations\\Version20220424165613','2022-04-24 19:56:17',1699),('DoctrineMigrations\\Version20220424165845','2022-04-24 19:58:49',1619),('DoctrineMigrations\\Version20220425100254','2022-04-25 13:02:58',624),('DoctrineMigrations\\Version20220425100551','2022-04-25 13:15:44',457),('DoctrineMigrations\\Version20220425101540','2022-04-25 13:15:44',388);
/*!40000 ALTER TABLE `doctrine_migration_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie`
--

DROP TABLE IF EXISTS `movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descr` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `date_posted` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_1D5EF26FA76ED395` (`user_id`),
  CONSTRAINT `FK_1D5EF26FA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie`
--

LOCK TABLES `movie` WRITE;
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
/*!40000 ALTER TABLE `movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nick_name` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
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

-- Dump completed on 2022-04-25 14:31:01
