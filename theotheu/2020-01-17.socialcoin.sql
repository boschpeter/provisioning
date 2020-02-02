-- MySQL dump 10.13  Distrib 5.7.28, for Linux (x86_64)
--
-- Host: localhost    Database: socialcoin
-- ------------------------------------------------------
-- Server version	5.7.28-0ubuntu0.16.04.2

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
-- Table structure for table `actions`
--

DROP TABLE IF EXISTS `actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(45) NOT NULL,
  `description` longtext NOT NULL,
  `files_id` int(11) DEFAULT NULL,
  `startDate` datetime DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  `duration` double DEFAULT NULL,
  `json` json DEFAULT NULL,
  `creationDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` varchar(255) DEFAULT NULL,
  `modificationDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedBy` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid_UNIQUE` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actions`
--

LOCK TABLES `actions` WRITE;
/*!40000 ALTER TABLE `actions` DISABLE KEYS */;
/*!40000 ALTER TABLE `actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_labels`
--

DROP TABLE IF EXISTS `app_labels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_labels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(45) NOT NULL,
  `name` varchar(255) NOT NULL,
  `json` json DEFAULT NULL,
  `creationDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` varchar(255) DEFAULT NULL,
  `modificationDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedBy` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  UNIQUE KEY `uuid_UNIQUE` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_labels`
--

LOCK TABLES `app_labels` WRITE;
/*!40000 ALTER TABLE `app_labels` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_labels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_languages`
--

DROP TABLE IF EXISTS `app_languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(45) NOT NULL,
  `local_name` varchar(255) NOT NULL,
  `english_name` varchar(255) NOT NULL,
  `creationDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `createdBy` varchar(255) DEFAULT NULL,
  `modificationDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `modifiedBy` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`local_name`),
  UNIQUE KEY `english_name_UNIQUE` (`english_name`),
  UNIQUE KEY `uuid_UNIQUE` (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_languages`
--

LOCK TABLES `app_languages` WRITE;
/*!40000 ALTER TABLE `app_languages` DISABLE KEYS */;
INSERT INTO `app_languages` VALUES (1,'en','English','English','2018-07-29 17:38:09','admin','2018-07-29 17:38:09','admin'),(2,'nl','Nederlands','Dutch','2018-07-29 17:38:09','admin','2018-07-29 17:38:09','admin');
/*!40000 ALTER TABLE `app_languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_translations`
--

DROP TABLE IF EXISTS `app_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_translations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(45) NOT NULL,
  `app_languages_id` int(11) NOT NULL,
  `app_labels_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `json` json DEFAULT NULL,
  `creationDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` varchar(255) DEFAULT NULL,
  `modificationDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedBy` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid_UNIQUE` (`uuid`),
  KEY `fk_app_translations_app_languages1_idx` (`app_languages_id`),
  KEY `fk_app_translations_app_labels1_idx` (`app_labels_id`),
  CONSTRAINT `fk_app_translations_app_labels1` FOREIGN KEY (`app_labels_id`) REFERENCES `app_labels` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_app_translations_app_languages1` FOREIGN KEY (`app_languages_id`) REFERENCES `app_languages` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_translations`
--

LOCK TABLES `app_translations` WRITE;
/*!40000 ALTER TABLE `app_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit`
--

DROP TABLE IF EXISTS `audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tablename` varchar(255) NOT NULL,
  `crud_operation` varchar(45) NOT NULL,
  `creationDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` varchar(255) NOT NULL,
  `query` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit`
--

LOCK TABLES `audit` WRITE;
/*!40000 ALTER TABLE `audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(45) NOT NULL,
  `relations_id` int(11) NOT NULL,
  `locations_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` longtext,
  `json` json DEFAULT NULL,
  `creationDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` varchar(255) DEFAULT NULL,
  `modificationDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedBy` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  UNIQUE KEY `uuid_UNIQUE` (`uuid`),
  KEY `relation_fk_idx` (`relations_id`),
  KEY `fk_cities_locations1_idx` (`locations_id`),
  CONSTRAINT `fk_cities_locations1` FOREIGN KEY (`locations_id`) REFERENCES `locations` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `relation_fk1` FOREIGN KEY (`relations_id`) REFERENCES `relations` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `debts`
--

DROP TABLE IF EXISTS `debts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `debts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(45) NOT NULL,
  `relations_id` int(11) NOT NULL,
  `debt_lc` double NOT NULL DEFAULT '0',
  `debtDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `description` longtext,
  `json` json DEFAULT NULL,
  `creationDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` varchar(255) DEFAULT NULL,
  `modificationDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedBy` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid_UNIQUE` (`uuid`),
  KEY `fk_debts_relations1_idx` (`relations_id`),
  CONSTRAINT `fk_debts_relations1` FOREIGN KEY (`relations_id`) REFERENCES `relations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `debts`
--

LOCK TABLES `debts` WRITE;
/*!40000 ALTER TABLE `debts` DISABLE KEYS */;
/*!40000 ALTER TABLE `debts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `files`
--

DROP TABLE IF EXISTS `files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `url` varchar(512) DEFAULT NULL,
  `creationDate` datetime DEFAULT NULL,
  `createdBy` varchar(255) DEFAULT NULL,
  `modificationDate` datetime DEFAULT NULL,
  `modifiedBy` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
INSERT INTO `files` VALUES (7,'teste','','http://www.gstatic.com/webp/gallery/1.jpg',NULL,NULL,NULL,NULL),(8,'teste.jpg','image/jpeg','/api/containers/common/download/46413e00-c2ad-4fc4-a154-5faa43d86d15.jpg',NULL,NULL,NULL,NULL),(9,'blob','application/octet-stream','/api/containers/common/download/f7654342-ba3d-4090-9c84-739e7cef1f41',NULL,NULL,NULL,NULL),(10,'blob','application/octet-stream','/api/containers/common/download/20279433-2bac-4e8c-a6aa-1f8c6cf06ba6',NULL,NULL,NULL,NULL),(11,'blob','application/octet-stream','/api/containers/common/download/6ff463ef-4b0f-49fa-a717-fb0af21c5a37',NULL,NULL,NULL,NULL),(12,'blob','application/octet-stream','/api/containers/common/download/8b3063f7-96db-4ca1-a066-6fa5792e85af',NULL,NULL,NULL,NULL),(13,'blob','image/png','/api/containers/common/download/e9fa3213-76b2-46c1-93c7-fa610edef5a4',NULL,NULL,NULL,NULL),(14,'blob','image/png','/api/containers/common/download/a26283f4-2379-4c18-b101-0834781e4aaf',NULL,NULL,NULL,NULL),(15,'blob','image/png','/api/containers/common/download/ad7363e6-f748-42d4-a0b2-3b3ec27f12b2',NULL,NULL,NULL,NULL),(16,'blob','image/png','/api/containers/common/download/6b2e5f79-0625-45a5-ad84-2ea93ca5494d',NULL,NULL,NULL,NULL),(17,'blob','image/png','/api/containers/common/download/db5c7a64-cd2e-4c97-a579-b31ef220470a',NULL,NULL,NULL,NULL),(18,'blob','image/png','/api/containers/common/download/8e9ec583-4be9-439d-9967-e2168b884e1f',NULL,NULL,NULL,NULL),(19,'blob','image/png','/api/containers/common/download/447f38c4-3bda-4751-ab25-926f2645dfe0',NULL,NULL,NULL,NULL),(20,'blob','image/png','/api/containers/common/download/0c5136e9-7832-483a-89c2-d3e4aed7ff7b',NULL,NULL,NULL,NULL),(21,'blob','image/png','/api/containers/common/download/f4ffa47c-3141-4eb1-bef3-0e5779aff535',NULL,NULL,NULL,NULL),(22,'blob','image/png','/api/containers/common/download/187150ce-fdc5-4606-8c66-bb646026c095',NULL,NULL,NULL,NULL),(23,'blob','image/png','/api/containers/common/download/85b3c6a6-d861-4d23-a99a-cc108e6a6b1d',NULL,NULL,NULL,NULL),(24,'blob','image/png','/api/containers/common/download/72635b85-0eda-4d15-b1d2-260348c30d86',NULL,NULL,NULL,NULL),(25,'blob','image/png','/api/containers/common/download/f816be41-1449-4c33-bc53-e8f9512b5253',NULL,NULL,NULL,NULL),(26,'blob','image/png','/api/containers/common/download/52d62086-cf13-43b3-b32e-38f06cc019d5',NULL,NULL,NULL,NULL),(27,'blob','image/png','/api/containers/common/download/ca758813-7f97-49f8-89ce-ec99640f4f52',NULL,NULL,NULL,NULL),(28,'blob','image/png','/api/containers/common/download/401483c9-0439-4935-ac58-ccba7b02efcd',NULL,NULL,NULL,NULL),(29,'blob','image/png','/api/containers/common/download/6257301e-2865-4809-afa2-d4af4f7c634b',NULL,NULL,NULL,NULL),(30,'blob','image/png','/api/containers/common/download/9f3a37de-99a5-4f27-90fb-50b3e243f973',NULL,NULL,NULL,NULL),(31,'blob','image/png','/api/containers/common/download/8e3a07fe-3775-40bc-84d5-97c3863ea726',NULL,NULL,NULL,NULL),(32,'blob','image/png','/api/containers/common/download/acce89c1-9fb1-4aa1-afda-1a7a4e1d14ea',NULL,NULL,NULL,NULL),(33,'blob','image/png','/api/containers/common/download/0fcb96ff-33dd-415d-a954-0d8f33a2ac46',NULL,NULL,NULL,NULL),(34,'blob','image/png','/api/containers/common/download/95d9fd9f-1d20-4156-9240-cb09b7633b0e',NULL,NULL,NULL,NULL),(35,'blob','image/png','/api/containers/common/download/5a027256-969e-4747-ae2c-4b3153cdf98a',NULL,NULL,NULL,NULL),(36,'blob','image/png','/api/containers/common/download/35eed7ec-8a3d-4855-83d5-855ae996335e',NULL,NULL,NULL,NULL),(37,'blob','image/png','/api/containers/common/download/8a183fd5-d7c5-4664-af25-50078fd2d9ee',NULL,NULL,NULL,NULL),(38,'blob','image/png','/api/containers/common/download/bde70fc2-6834-4467-b0b9-e2362975221a',NULL,NULL,NULL,NULL),(39,'blob','image/png','/api/containers/common/download/f301333a-d56c-414a-9bd9-3c1f9e7a7be6',NULL,NULL,NULL,NULL),(40,'blob','image/png','/api/containers/common/download/1557501e-b517-4c9f-8437-b1e5e03ffd1d',NULL,NULL,NULL,NULL),(41,'blob','image/png','/api/containers/common/download/79dc0aca-d2b2-4f9f-807c-c7d81691d494',NULL,NULL,NULL,NULL),(42,'blob','image/png','/api/containers/common/download/95443388-3a0f-4d28-bb1d-9cf7def01fe5',NULL,NULL,NULL,NULL),(43,'blob','image/png','/api/containers/common/download/c6d1382f-0218-4b30-911a-4fcc954fdcd9',NULL,NULL,NULL,NULL),(44,'blob','image/png','/api/containers/common/download/66350b82-e820-4cd1-a5df-0462cc24bc43',NULL,NULL,NULL,NULL),(45,'blob','image/png','/api/containers/common/download/c4c6e4dd-c9af-4bf5-a3b2-8d8d55d7fac5',NULL,NULL,NULL,NULL),(46,'blob','image/png','/api/containers/common/download/15de2cdc-a0e0-4697-b6b5-c1831758b249',NULL,NULL,NULL,NULL),(47,'blob','image/png','/api/containers/common/download/4bd1ac74-c1a0-45d6-8379-e21ce2f67481',NULL,NULL,NULL,NULL),(48,'blob','image/png','/api/containers/common/download/59bfff2d-ae3d-4265-bf25-3a4f3b82d85e',NULL,NULL,NULL,NULL),(49,'blob','image/png','/api/containers/common/download/c2f68211-44e8-4c62-b017-195f462d8cf3',NULL,NULL,NULL,NULL),(50,'blob','image/png','/api/containers/common/download/c2a0fab3-0452-4fc3-a68b-873e06299e3a',NULL,NULL,NULL,NULL),(51,'blob','image/png','/api/containers/common/download/5aff2dd6-7cbf-416b-aa28-f95dda802e4a',NULL,NULL,NULL,NULL),(52,'blob','image/png','/api/containers/common/download/f7835f2f-3ab9-4337-a5df-10a4ea8fb678',NULL,NULL,NULL,NULL),(53,'blob','image/png','/api/containers/common/download/82979688-9632-4900-b20d-6d23a9442f83',NULL,NULL,NULL,NULL),(54,'blob','image/png','/api/containers/common/download/ffd41e58-1492-43f9-9fe0-e4895252cfa0',NULL,NULL,NULL,NULL),(55,'blob','image/png','/api/containers/common/download/9f5a372c-72bc-42d8-9e53-b0bed504884b',NULL,NULL,NULL,NULL),(56,'blob','image/png','/api/containers/common/download/f6b65d4f-5a11-4c0e-8fbc-b8bc2c48393b',NULL,NULL,NULL,NULL),(57,'blob','image/png','/api/containers/common/download/4ca139e5-d014-48fa-bc80-8308e44fd1dd',NULL,NULL,NULL,NULL),(58,'blob','image/png','/api/containers/common/download/8bbbe24a-bec8-4666-8805-494480be9590',NULL,NULL,NULL,NULL),(59,'blob','image/png','/api/containers/common/download/333034e6-1e3f-457d-ae61-98c9c5d3bd81',NULL,NULL,NULL,NULL),(60,'blob','image/png','/api/containers/common/download/389b014a-8502-42cc-a243-e72c0333ca07',NULL,NULL,NULL,NULL),(61,'blob','image/png','/api/containers/common/download/1228d00b-2cf4-43aa-91ba-0eab9add28c4',NULL,NULL,NULL,NULL),(62,'blob','image/png','/api/containers/common/download/e32ae46c-91e1-485b-b7c0-ec395483c41d',NULL,NULL,NULL,NULL),(63,'blob','image/png','/api/containers/common/download/a2dfde49-909a-475d-8a7a-5a28f163884d',NULL,NULL,NULL,NULL),(64,'blob','image/png','/api/containers/common/download/afcf1c6a-c5d7-4210-b876-147a6dc111c0',NULL,NULL,NULL,NULL),(65,'blob','image/png','/api/containers/common/download/80c4224e-b01b-43bd-8fb5-4e2fd2119500',NULL,NULL,NULL,NULL),(66,'blob','image/png','/api/containers/common/download/8d7f8562-59d2-4a49-9289-1410b38a617b',NULL,NULL,NULL,NULL),(67,'blob','image/png','/api/containers/common/download/e056d125-7706-412d-b218-bd9dd52ceee5',NULL,NULL,NULL,NULL),(68,'blob','image/png','/api/containers/common/download/7c39e2a1-43e8-404c-9d60-10002c76a41d',NULL,NULL,NULL,NULL),(69,'blob','image/png','/api/containers/common/download/2a108250-077e-4c9f-b9b5-a31bf939ab26',NULL,NULL,NULL,NULL),(70,'blob','image/png','/api/containers/common/download/878cab4b-297d-48f1-80b5-610254dce354',NULL,NULL,NULL,NULL),(71,'blob','image/png','/api/containers/common/download/db54a973-c928-4dcd-b56e-5caf187f4100',NULL,NULL,NULL,NULL),(72,'blob','image/png','/api/containers/common/download/d762c3a4-e041-477f-a595-eb93da9f3158',NULL,NULL,NULL,NULL),(73,'blob','image/png','/api/containers/common/download/8fd4ed48-b752-4770-b571-a19a3e799154',NULL,NULL,NULL,NULL),(74,'blob','image/png','/api/containers/common/download/17955c80-cce0-4691-9ee3-b0c7a5e8a144',NULL,NULL,NULL,NULL),(75,'blob','image/png','/api/containers/common/download/6b76fe09-c297-4331-8051-79e46f74c201',NULL,NULL,NULL,NULL),(76,'blob','image/png','/api/containers/common/download/913a0fa9-b02d-446c-8c5f-ed4875bad8d8',NULL,NULL,NULL,NULL),(77,'blob','image/png','/api/containers/common/download/9d57d643-bd9e-4369-b4e5-2d9e2720e536',NULL,NULL,NULL,NULL),(78,'blob','image/png','/api/containers/common/download/4c50e7d7-0839-4bbf-8e7e-5ee0f25633a9',NULL,NULL,NULL,NULL),(79,'blob','image/png','/api/containers/common/download/e3876024-8b47-40b0-a62d-372752784ce9',NULL,NULL,NULL,NULL),(80,'blob','image/png','/api/containers/common/download/19e9fbcd-6575-4a34-9f2d-1bd8fc22cde0',NULL,NULL,NULL,NULL),(81,'blob','image/png','/api/containers/common/download/f2b8ed8f-e0ce-4b90-a62b-3b206daf0600',NULL,NULL,NULL,NULL),(82,'blob','image/png','/api/containers/common/download/fccf0810-b289-499e-b517-82468f3b148f',NULL,NULL,NULL,NULL),(83,'blob','image/png','/api/containers/common/download/2ed15e62-d128-488c-9c76-4e796d0e195e',NULL,NULL,NULL,NULL),(84,'blob','image/png','/api/containers/common/download/f11a211b-5184-4263-95ac-18df6da62775',NULL,NULL,NULL,NULL),(85,'blob','image/png','/api/containers/common/download/4d29f540-0e68-4c9e-a34a-1eaf85271cd5',NULL,NULL,NULL,NULL),(86,'blob','image/png','/api/containers/common/download/502b2d2f-4a20-4e9a-bedd-dc7357532ec3',NULL,NULL,NULL,NULL),(87,'blob','image/png','/api/containers/common/download/e764d2cb-685d-4716-aa62-8397097b9b0e',NULL,NULL,NULL,NULL),(88,'blob','image/png','/api/containers/common/download/b2437c98-05ec-48c6-8007-ac01a310a945',NULL,NULL,NULL,NULL),(89,'blob','image/png','/api/containers/common/download/9ea05224-e6d3-45f2-ab0d-20233f911dd1',NULL,NULL,NULL,NULL),(90,'blob','image/png','/api/containers/common/download/5b1c53fd-7915-4036-9f53-aab7a7cd1a5b',NULL,NULL,NULL,NULL),(91,'blob','image/png','/api/containers/common/download/51e5333c-91fb-4a75-9c19-3a2b7ebc43a3',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(45) NOT NULL,
  `streetname` varchar(255) NOT NULL,
  `housenumber` varchar(45) NOT NULL,
  `housenumber_suffix` varchar(45) DEFAULT NULL,
  `postalcode` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `description` longtext,
  `latitude` varchar(45) DEFAULT NULL,
  `longitude` varchar(45) DEFAULT NULL,
  `json` json DEFAULT NULL,
  `creationDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` varchar(255) DEFAULT NULL,
  `modificationDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedBy` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid_UNIQUE` (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=524 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (1,'a02aa638-18b4-4b05-ad65-9af40ca720ab','My Streetnames','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-10 17:34:01','127.0.0.1','2018-12-11 15:36:56','127.0.0.1'),(196,'60efa995-f6a6-4ec8-8e7b-f322c5d46b71','Gelijkheid','1',NULL,'8014XC','Zwolle','Naam: Zwolle Zuid',NULL,NULL,NULL,'2018-11-01 12:08:43','145.74.166.166','2018-11-01 12:08:43','145.74.166.166'),(197,'d0e42b56-1b6e-4088-b35f-21ae670e9d99','Bachlaan','20',NULL,'8031HL','Zwolle','Naam: Zwolle Noord',NULL,NULL,NULL,'2018-11-01 12:09:54','145.74.166.166','2018-11-01 12:09:54','145.74.166.166'),(198,'44e54fde-4c6c-4c4b-ad6d-15c8f35e20ea','Werkerlaan','1',NULL,'8043LT','Zwolle','Naam: Zwolle West',NULL,NULL,NULL,'2018-11-01 12:10:49','145.74.166.166','2018-11-01 12:10:49','145.74.166.166'),(199,'eb2ef1be-72ba-48d4-b983-84cb1d522fe6','Enkstraat','67',NULL,'8012VA','Zwolle','Naam: Zwolle Oost',NULL,NULL,NULL,'2018-11-01 12:15:55','145.74.166.166','2018-11-01 12:15:55','145.74.166.166'),(200,'4c1e1b63-9a99-4249-a953-e7cd31695dc6','Jacob Gillesstraat','1',NULL,'8022SN','Zwolle','Naam: Zwolle Midden',NULL,NULL,NULL,'2018-11-01 12:16:27','145.74.166.166','2018-11-01 12:16:27','145.74.166.166'),(201,'2463fb52-d217-48fb-b580-0220deb78a37','','',NULL,'','','created with relation',NULL,NULL,NULL,'2018-11-01 12:39:23','145.74.166.166','2018-11-01 13:29:19','145.74.166.166'),(202,'52cae664-6a6f-4810-a542-5b4eef3de9de','','',NULL,'','','created with relation',NULL,NULL,NULL,'2018-11-01 12:39:23','145.74.166.166','2018-11-01 13:37:42','145.74.166.166'),(203,'faa97c8c-7b6d-4beb-a09d-d4f4483c9327','','',NULL,'','','created with relation',NULL,NULL,NULL,'2018-11-01 12:39:23','145.74.166.166','2018-11-01 13:38:06','145.74.166.166'),(204,'e657f002-3d49-472d-921c-c48e7b7f12b4','','',NULL,'','','created with relation',NULL,NULL,NULL,'2018-11-01 12:39:23','145.74.166.166','2018-11-01 13:38:46','145.74.166.166'),(205,'18c7fd32-256a-4a47-ae78-08b01f9fbc5d','','',NULL,'','','created with relation',NULL,NULL,NULL,'2018-11-01 12:39:23','145.74.166.166','2018-11-01 13:39:18','145.74.166.166'),(207,'98b695b0-1450-402b-aeda-71bde1a7c84f','','',NULL,'','','created with relation',NULL,NULL,NULL,'2018-11-01 12:39:23','145.74.166.166','2018-11-01 13:40:14','145.74.166.166'),(208,'1362a61c-4d9a-4aa2-acd3-c679ea2e2643','','',NULL,'','','created with relation',NULL,NULL,NULL,'2018-11-01 12:39:23','145.74.166.166','2018-11-01 13:40:40','145.74.166.166'),(209,'b490edb5-a260-46ae-8b02-bc6f85054421','','',NULL,'','','created with relation',NULL,NULL,NULL,'2018-11-01 12:39:23','145.74.166.166','2018-11-01 13:41:05','145.74.166.166'),(210,'bb745ca0-93d7-4b21-acb9-33fcc7d4b4cb','','',NULL,'','','created with relation',NULL,NULL,NULL,'2018-11-01 12:39:23','145.74.166.166','2018-11-01 13:42:18','145.74.166.166'),(211,'3385a483-33d5-45e6-a7b4-fd1d2c6a30bf','','',NULL,'','','created with relation',NULL,NULL,NULL,'2018-11-01 12:39:23','145.74.166.166','2018-11-01 13:42:40','145.74.166.166'),(212,'11feeb60-fe61-464e-bac1-dc7ac73429e6','Bachmanlaan','20',NULL,'8031HL','Zwolle','created with team',NULL,NULL,NULL,'2018-11-01 13:22:06','145.74.104.153','2018-11-01 13:22:06','145.74.104.153'),(213,'d1709f20-939e-409e-b03f-cee765245256','Gelijkheid ','1',NULL,'8014XC','Zwolle','created with team',NULL,NULL,NULL,'2018-11-01 13:29:55','145.74.104.153','2018-11-01 13:29:55','145.74.104.153'),(214,'d257f4b8-ff45-40c8-932a-7549f7cb225b','change this','change this','change this','change this','change this','change this','change this','change this','\"change this\"','2018-11-01 14:33:18','145.74.166.166','2019-01-22 11:26:47','145.74.104.153'),(215,'e7e845c5-8967-46e9-a288-dbbcd0ecaa4c','change this','change this','change this','change this','change this','change this','change this','change this','\"change this\"','2018-11-01 14:34:10','145.74.166.166','2018-12-13 15:45:44','145.74.104.153'),(216,'cd14603c-c6e1-43a7-af73-bc7202ac2da4','Parklaan ','12','change this','8009AA','Zwolle','change this','change this','change this','\"change this\"','2018-11-01 14:34:31','145.74.166.166','2019-03-27 20:02:13','145.74.104.153'),(217,'abb0a3a9-2bc1-4a09-b79b-68a13d3eb011','Scoutinglaan','100','change this','1122GG','Zwolle','change this','change this','change this','\"change this\"','2018-11-01 14:34:46','145.74.166.166','2019-03-27 19:37:55','145.74.104.153'),(218,'b9fff464-5090-432e-a534-9e48bc8c4050','change this','change this','change this','change this','change this','change this','change this','change this','\"change this\"','2018-11-01 14:35:00','145.74.166.166','2018-11-01 14:35:00','145.74.166.166'),(219,'21614fa2-c4d5-472d-8394-f6660252b209','change this','change this','change this','change this','change this','change this','change this','change this','\"change this\"','2018-11-01 14:35:13','145.74.166.166','2018-11-01 14:35:13','145.74.166.166'),(220,'a3e74a08-4bf2-4c0e-921b-e763e01e9d1d','Jacob Gillesstraat','1',NULL,'8022SN','Zwolle','created with team',NULL,NULL,NULL,'2018-11-01 13:35:31','145.74.104.153','2018-11-01 13:35:31','145.74.104.153'),(221,'5965a7d3-fb21-4a0c-bcb9-f6d8527b95f8','Oude mars ','1','change this','8104AA','Zwolle','change this','change this','change this','\"change this\"','2018-11-01 14:35:49','145.74.166.166','2019-07-08 19:44:34','145.74.104.153'),(222,'0b1ba0c9-8ac5-4a9d-8a0b-4eea2f235147','Werkerlaan','1',NULL,'8043LT','Zwolle','created with team',NULL,NULL,NULL,'2018-11-01 13:37:25','145.74.104.153','2018-11-01 13:37:25','145.74.104.153'),(223,'705ac8d3-f9f2-4eee-8d0c-77ed22587d00','Enkstraat','67',NULL,'8012VA','Zwolle','created with team',NULL,NULL,NULL,'2018-11-01 13:39:24','145.74.104.153','2018-11-01 13:39:24','145.74.104.153'),(224,'c3824b05-ed2a-4c55-90af-5b150edd687d','','',NULL,'','','created with relation',NULL,NULL,NULL,'2018-11-01 14:57:38','145.74.166.166','2018-11-01 15:08:10','145.74.166.166'),(225,'9dfa8a08-c60c-4768-9471-e3ba2f04f71e','','',NULL,'','','created with relation',NULL,NULL,NULL,'2018-11-01 14:57:38','145.74.166.166','2018-11-01 15:08:51','145.74.166.166'),(226,'c11bbb77-fb8c-4287-941c-1b928f6d1cd2','','',NULL,'','','created with relation',NULL,NULL,NULL,'2018-11-01 14:57:38','145.74.166.166','2018-11-01 15:09:24','145.74.166.166'),(227,'ae89c646-06e3-4d51-9abe-5b5f628d0b0a','','',NULL,'','','created with relation',NULL,NULL,NULL,'2018-11-01 14:57:38','145.74.166.166','2018-11-01 15:11:10','145.74.166.166'),(228,'3ec433c6-7cc2-44e4-937e-b543b4b4f56e','','',NULL,'','','created with relation',NULL,NULL,NULL,'2018-11-01 14:57:38','145.74.166.166','2018-11-01 15:11:38','145.74.166.166'),(229,'9d03367c-5826-4cae-a6cb-3728be4dbe72','','',NULL,'','','created with relation',NULL,NULL,NULL,'2018-11-01 14:57:38','145.74.166.166','2018-11-01 15:12:38','145.74.166.166'),(230,'8293ef46-f74f-42cd-a991-32a84e6e30af','','',NULL,'','','created with relation',NULL,NULL,NULL,'2018-11-01 14:57:38','145.74.166.166','2018-11-01 15:13:40','145.74.166.166'),(231,'67efcecc-9588-4f6f-a103-ce6c8df8163d','','',NULL,'','','created with relation',NULL,NULL,NULL,'2018-11-01 14:57:38','145.74.166.166','2018-11-01 15:15:14','145.74.166.166'),(232,'b13aeca8-31fa-4039-9734-93609cd49bea','','',NULL,'','','created with relation',NULL,NULL,NULL,'2018-11-01 14:57:38','145.74.166.166','2018-11-01 15:15:40','145.74.166.166'),(233,'9c253731-2a17-4ccf-9dfd-de2e42bca172','','',NULL,'','','created with relation',NULL,NULL,NULL,'2018-11-01 14:57:38','145.74.166.166','2018-11-01 15:16:05','145.74.166.166'),(234,'ac71be28-b4c4-4505-85f0-9f2f6a84d9ae','','',NULL,'','','created with relation',NULL,NULL,NULL,'2018-11-01 14:57:38','145.74.166.166','2018-11-01 15:24:54','145.74.166.166'),(235,'366efc1e-f983-4b7b-816d-a75202346ecc','','',NULL,'','','created with relation',NULL,NULL,NULL,'2018-11-05 11:24:51','145.74.104.153','2018-11-08 12:40:04','145.74.104.153'),(236,'ad728640-f975-4af6-85bc-883bd9917c8e','','',NULL,'','','created with relation',NULL,NULL,NULL,'2018-11-08 12:45:52','145.74.104.153','2018-11-08 12:51:52','145.74.104.153'),(237,'2fe712d6-54c4-4dc7-a451-958ba7db40dc','','',NULL,'','','created with relation',NULL,NULL,NULL,'2018-11-08 12:45:52','109.33.193.14','2018-11-08 13:11:11','109.33.193.14'),(238,'df370d68-44fc-4e28-9271-619d1b04dafc','','',NULL,'','','created with relation',NULL,NULL,NULL,'2018-11-08 12:45:52','109.33.193.14','2018-11-08 13:22:12','109.33.193.14'),(239,'469452a7-22ed-4654-9864-c402ce9eaecd','','',NULL,'','','created with relation',NULL,NULL,NULL,'2018-11-08 12:45:52','62.45.62.123','2018-11-08 20:58:45','62.45.62.123'),(240,'c6cc22e9-d135-403e-98fc-8ba87ab44de5','','',NULL,'','','created with relation',NULL,NULL,NULL,'2018-11-08 12:45:52','62.45.62.123','2018-11-08 21:02:28','62.45.62.123'),(241,'8941745a-8ac6-42a2-b6ea-dbfe2d7ca7df','','',NULL,'','','created with relation',NULL,NULL,NULL,'2018-11-08 12:45:52','62.45.62.123','2018-11-08 21:08:49','62.45.62.123'),(242,'27bbc20f-0428-4318-b9b6-910675235226','','',NULL,'','','created with relation',NULL,NULL,NULL,'2018-11-08 21:33:42','62.45.62.123','2018-11-08 21:34:37','62.45.62.123'),(243,'4d2a1a76-629b-4756-af7a-cfe6fa07def3','','',NULL,'','','created with relation',NULL,NULL,NULL,'2018-11-08 21:47:55','62.45.62.123','2018-11-08 21:48:48','62.45.62.123'),(244,'e34d69da-d8e6-46cb-a916-642349afe450','','',NULL,'','','created with relation',NULL,NULL,NULL,'2018-11-08 21:50:19','62.45.62.123','2018-11-08 21:51:34','62.45.62.123'),(245,'aa75e744-e79c-4300-a49d-091e655c8b22','','',NULL,'','','created with relation',NULL,NULL,NULL,'2018-11-08 21:53:42','62.45.62.123','2018-11-08 21:54:37','62.45.62.123'),(246,'df78d0a0-749b-4f99-a1f0-5f47bf59578f','','',NULL,'','','created with relation',NULL,NULL,NULL,'2018-11-08 21:53:42','62.45.62.123','2018-11-08 21:55:51','62.45.62.123'),(248,'30801c4f-3aae-419f-9e07-517c026e8ef5','','',NULL,'','','created with relation',NULL,NULL,NULL,'2018-11-08 21:53:42','145.74.166.254','2018-11-22 13:53:24','145.74.166.254'),(249,'9830c218-2502-4c59-9d63-436a9bea66d8','','',NULL,'','','created with relation',NULL,NULL,NULL,'2018-11-08 21:53:42','145.74.166.254','2018-11-22 13:53:56','145.74.166.254'),(250,'0067851f-dc4a-422e-b05b-1ce956540917','','',NULL,'','','created with relation',NULL,NULL,NULL,'2018-11-08 21:53:42','145.74.166.254','2018-11-22 13:54:34','145.74.166.254'),(251,'6f909af0-77c0-44fa-a593-096a175bcf65','','',NULL,'','','created with relation',NULL,NULL,NULL,'2018-11-08 21:53:42','145.74.166.254','2018-11-22 13:55:00','145.74.166.254'),(254,'3c2e75e9-d173-45f7-9f0a-a95e01c17d20','','',NULL,'','','created with relation',NULL,NULL,NULL,'2018-11-08 21:53:42','145.74.166.254','2018-11-22 13:57:01','145.74.166.254'),(255,'9b80b301-34c9-4e7d-8594-e882b8ac49d8','','',NULL,'','','created with relation',NULL,NULL,NULL,'2018-11-08 21:53:42','145.74.166.254','2018-11-22 13:57:34','145.74.166.254'),(256,'5d25eb4c-51db-4dee-8240-570bba8292a3','','',NULL,'','','created with relation',NULL,NULL,NULL,'2018-11-08 21:53:42','145.74.166.254','2018-11-22 13:57:59','145.74.166.254'),(257,'c1de72ac-1726-4dec-90f5-d4a109ca16a6','','',NULL,'','','created with relation',NULL,NULL,NULL,'2018-11-08 21:53:42','145.74.166.254','2018-11-22 13:58:33','145.74.166.254'),(258,'a495c778-2464-4c15-a1f6-cbd4a0a758c0','','',NULL,'','','created with relation',NULL,NULL,NULL,'2018-11-08 21:53:42','145.74.166.254','2018-11-22 13:59:09','145.74.166.254'),(259,'c2782469-29a9-4063-afe1-7b6d44071ac6','','',NULL,'','','created with relation',NULL,NULL,NULL,'2018-11-08 21:53:42','145.74.166.254','2018-11-22 13:59:33','145.74.166.254'),(260,'cd66347b-7eb3-481a-98e4-9ed3c99fa893','','',NULL,'','','created with relation',NULL,NULL,NULL,'2018-12-05 15:34:36','145.74.104.153','2018-12-06 10:53:26','145.74.104.153'),(261,'fdfb28ce-8ae7-457d-8736-bbcacf538032','','',NULL,'','','created with relation',NULL,NULL,NULL,'2018-12-06 10:53:37','145.74.104.153','2018-12-06 10:54:53','145.74.104.153'),(262,'14413e66-907a-473f-a01d-650d12e90638','','',NULL,'','','created with relation',NULL,NULL,NULL,'2018-12-06 10:54:54','85.241.97.116','2018-12-06 10:56:45','85.241.97.116'),(263,'57189817-b104-457d-8d9d-06a697417b0c','','',NULL,'','','created with relation',NULL,NULL,NULL,'2018-12-06 10:56:46','145.74.104.153','2018-12-06 10:57:07','145.74.104.153'),(264,'c30c13fb-7edf-4e37-82b4-9acfde55beed','','',NULL,'','','created with relation',NULL,NULL,NULL,'2018-12-06 10:57:08','145.74.104.153','2018-12-06 11:00:11','145.74.104.153'),(265,'0eb8e525-b59d-42c4-a6b2-82c7a0423c83','','',NULL,'','','created with relation',NULL,NULL,NULL,'2018-12-06 11:00:12','62.45.62.123','2018-12-06 11:32:17','62.45.62.123'),(266,'99232eac-b7cc-405b-a996-f9d89df72a61','','',NULL,'','','created with relation',NULL,NULL,NULL,'2018-12-06 12:12:30','62.45.62.123','2018-12-06 12:12:31','62.45.62.123'),(267,'82c79e51-611d-45bf-93f2-f5509059a8d2','','',NULL,'','','created with relation',NULL,NULL,NULL,'2018-12-06 12:14:00','62.45.62.123','2018-12-06 12:14:05','62.45.62.123'),(268,'bbdda591-2a61-4a2a-bdcc-a92aa47a1a4d','','',NULL,'','','created with relation',NULL,NULL,NULL,'2018-12-06 12:14:44','62.45.62.123','2018-12-06 12:14:47','62.45.62.123'),(269,'cdb5f840-ae60-42c6-ad12-d26491b71c2a','','',NULL,'','','created with relation',NULL,NULL,NULL,'2018-12-06 12:14:44','62.45.62.123','2018-12-06 12:17:31','62.45.62.123'),(270,'57548a1c-8694-454d-a0bd-effc67ade423','','',NULL,'','','created with relation',NULL,NULL,NULL,'2018-12-06 12:20:11','62.45.62.123','2018-12-06 12:20:14','62.45.62.123'),(271,'5613227d-bc69-4c26-b1a7-da4915a8951b','','',NULL,'','','created with relation',NULL,NULL,NULL,'2018-12-06 12:21:02','62.45.62.123','2018-12-06 12:21:07','62.45.62.123'),(272,'2ecb262b-e2f7-4423-bf03-6d88a93e13c6','','',NULL,'','','created with relation',NULL,NULL,NULL,'2018-12-06 12:21:02','62.45.62.123','2018-12-06 12:22:40','62.45.62.123'),(273,'eb44b51f-c235-4228-8515-f9fe23e8ae66','','',NULL,'','','created with relation',NULL,NULL,NULL,'2018-12-06 12:21:02','62.45.62.123','2018-12-06 12:23:40','62.45.62.123'),(274,'26ca3241-2bb3-423a-bd38-1e7317bded5f','','',NULL,'','','created with relation',NULL,NULL,NULL,'2018-12-06 12:23:51','62.45.62.123','2018-12-06 12:23:54','62.45.62.123'),(275,'d1e82214-38df-43c4-8e93-bd8d77cda10d','','',NULL,'','','created with relation',NULL,NULL,NULL,'2018-12-06 12:24:24','62.45.62.123','2018-12-06 12:24:26','62.45.62.123'),(276,'c59cd64e-d633-4ed8-8479-29807db4d3c2','','',NULL,'','','created with relation',NULL,NULL,NULL,'2018-12-06 12:25:21','62.45.62.123','2018-12-06 12:26:30','62.45.62.123'),(277,'0fdd502f-80c7-4979-90fb-95a11a5c0057','','',NULL,'','','created with relation',NULL,NULL,NULL,'2018-12-06 12:26:48','62.45.62.123','2018-12-06 12:26:49','62.45.62.123'),(278,'8c6e0cc1-fa7a-48f6-8986-b627ae4e861d','','',NULL,'','','created with relation',NULL,NULL,NULL,'2018-12-06 12:29:27','62.45.62.123','2018-12-06 12:29:28','62.45.62.123'),(279,'1e45a8a3-298c-4bdc-8103-1b15b4b14a25','My Streetnamess','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-06 12:52:13','127.0.0.1','2018-12-06 12:52:18','127.0.0.1'),(280,'31fc0b5c-53ca-46ee-a9c0-eb20b30096c6','My Streetnamess','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-06 12:55:57','127.0.0.1','2018-12-06 12:56:01','127.0.0.1'),(281,'ba6fbf03-3838-4bf6-ba6d-84a2784cf406','My Streetnamess','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-06 12:57:19','127.0.0.1','2018-12-06 12:57:22','127.0.0.1'),(282,'9c95f762-a75d-4a5d-9713-e98f44348f87','My Streetnamess','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-06 12:57:48','127.0.0.1','2018-12-06 12:57:53','127.0.0.1'),(283,'9f56c28b-2b6d-48a4-8a91-4a758ac5224c','My Streetnamess','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-06 12:58:35','127.0.0.1','2018-12-06 12:58:41','127.0.0.1'),(284,'662a0524-78a9-4c8a-bdf6-7bee136952d5','My Streetnamess','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-06 12:58:56','127.0.0.1','2018-12-06 12:59:01','127.0.0.1'),(285,'50787b01-d024-4ed1-9f92-4ed3eacfdf41','My Streetnamess','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-06 13:01:25','127.0.0.1','2018-12-06 13:01:32','127.0.0.1'),(286,'e6525a25-e03f-4898-b44b-4dcf5a20bc7f','My Streetnamess','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-06 13:01:47','127.0.0.1','2018-12-06 13:01:52','127.0.0.1'),(287,'00f0a241-6f0d-4e1b-9610-70fc77269b36','','',NULL,'','','created with relation',NULL,NULL,NULL,'2018-12-06 13:02:31','127.0.0.1','2018-12-06 13:04:57','127.0.0.1'),(288,'3f6123c4-6218-4bf6-9ade-0a8230e104ff','My Streetnamess','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-06 14:51:23','127.0.0.1','2018-12-06 14:51:28','127.0.0.1'),(289,'52ffe76d-2656-4dc9-a1c2-0902644c8665','','',NULL,'','','created with relation',NULL,NULL,NULL,'2018-12-06 14:52:03','127.0.0.1','2018-12-06 14:53:08','127.0.0.1'),(290,'4de4df7c-b302-493d-bd62-2e10466f4dc7','','',NULL,'','','created with relation',NULL,NULL,NULL,'2018-12-06 14:52:03','127.0.0.1','2018-12-06 14:55:07','127.0.0.1'),(291,'452fb757-2a04-47a9-a969-401ff4055edd','','',NULL,'','','created with relation',NULL,NULL,NULL,'2018-12-06 14:55:15','127.0.0.1','2018-12-06 14:56:04','127.0.0.1'),(293,'061a69a7-b83e-4b96-9bb8-f4398c5c7054','','',NULL,'','','created with relation',NULL,NULL,NULL,'2018-12-06 14:55:15','127.0.0.1','2018-12-06 15:22:40','127.0.0.1'),(294,'db8bba94-7e2b-44ad-b48f-b98dd90ba5de','','',NULL,'','','created with relation',NULL,NULL,NULL,'2018-12-06 15:26:34','127.0.0.1','2018-12-06 15:57:00','127.0.0.1'),(295,'2e2ef668-e2d3-430e-8c71-b12dd61ca7b9','','',NULL,'','','created with relation',NULL,NULL,NULL,'2018-12-06 16:00:27','127.0.0.1','2018-12-06 16:01:00','127.0.0.1'),(302,'002e5803-6c20-4653-827e-113f44d71a49','','',NULL,'','','created with relation',NULL,NULL,NULL,'2018-12-06 18:00:24','127.0.0.1','2018-12-06 18:01:57','127.0.0.1'),(303,'15bc9616-c704-491f-8bc4-068181ce364f','My Streetnamess','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-06 18:57:37','127.0.0.1','2018-12-06 18:57:47','127.0.0.1'),(304,'eb9ca392-f6a6-4eb3-b83e-7f47b548e116','','',NULL,'','','created with relation',NULL,NULL,NULL,'2018-12-06 19:02:09','127.0.0.1','2018-12-06 19:02:13','127.0.0.1'),(305,'12d6f820-3bf8-4fd9-a1f3-754733801a09','My Streetnamess','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-06 19:02:09','127.0.0.1','2018-12-06 19:04:07','127.0.0.1'),(306,'6798924d-38d9-4f94-a62c-7fdcd6ed1e0d','My Streetnamess','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-06 19:04:47','127.0.0.1','2018-12-06 19:12:30','127.0.0.1'),(307,'7a37a987-15d0-4391-bb09-db7aa6c15223','My Streetnamess','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-06 19:15:26','127.0.0.1','2018-12-06 19:15:34','127.0.0.1'),(308,'8e22e9ef-3149-4862-b902-f2989421821c','My Streetnamess','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-06 19:16:20','127.0.0.1','2018-12-06 19:16:24','127.0.0.1'),(309,'2ea52ed3-23b7-4b8d-8e9e-0f92c63868cb','My Streetnamess','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-06 19:16:20','127.0.0.1','2018-12-06 19:17:31','127.0.0.1'),(310,'7cf183d9-dc10-4d45-897f-073fffbcd14d','My Streetnamess','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-06 19:21:25','127.0.0.1','2018-12-06 19:21:32','127.0.0.1'),(311,'a45d0993-ec4e-4aae-a9fb-e0b96dd87dff','My Streetnamess','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-06 19:23:29','127.0.0.1','2018-12-06 19:23:36','127.0.0.1'),(312,'f2e68587-ff1d-41a9-a584-558d785c55cb','My Streetnamess','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-06 19:23:29','127.0.0.1','2018-12-06 19:24:35','127.0.0.1'),(313,'b856efb0-252d-4ce9-a5ae-729a828f517a','My Streetnamess','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-06 19:23:29','127.0.0.1','2018-12-06 19:26:39','127.0.0.1'),(314,'d0c090c7-4369-4d59-8e11-57dac9952ea3','My Streetnamess','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-06 19:23:29','127.0.0.1','2018-12-06 19:26:57','127.0.0.1'),(315,'c7152b31-c75b-47d8-973d-faba835c94b8','My Streetnamess','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-06 19:23:29','127.0.0.1','2018-12-06 19:27:10','127.0.0.1'),(316,'080100d6-8622-45e0-aead-bfb44785d5dc','My Streetnamess','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-06 19:23:29','127.0.0.1','2018-12-06 19:27:22','127.0.0.1'),(317,'d7f42efe-38a3-4dc9-84b2-6e669214019d','My Streetnamess','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-06 19:23:29','127.0.0.1','2018-12-06 19:28:25','127.0.0.1'),(318,'d22deb15-40cb-4bb2-9675-8f88d7abfd1f','My Streetnamess','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-06 19:23:29','127.0.0.1','2018-12-06 20:24:42','127.0.0.1'),(319,'4493cadc-cb9e-4446-aa5e-497465f3e39a','My Streetnamess','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-06 19:23:29','127.0.0.1','2018-12-06 20:25:27','127.0.0.1'),(320,'01142619-b90a-4b6c-b6c6-c88b54648a65','My Streetnamess','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-06 19:23:29','127.0.0.1','2018-12-06 20:25:41','127.0.0.1'),(322,'b7689074-d5dc-492e-85eb-eaa66be11fac','My Streetnamess','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-06 19:23:29','127.0.0.1','2018-12-06 20:37:02','127.0.0.1'),(323,'7c48d570-f444-469e-9860-fe2a3c54356a','My Streetnamess','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-06 20:44:51','127.0.0.1','2018-12-06 20:44:55','127.0.0.1'),(324,'f2f02ed4-2359-4a63-8f06-cf4b6ba9bfed','My Streetnamess','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-06 20:45:16','127.0.0.1','2018-12-06 20:45:23','127.0.0.1'),(325,'86c48080-7d5f-4618-b953-09431a4a210a','My Streetnamess','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-06 20:56:24','127.0.0.1','2018-12-06 20:56:34','127.0.0.1'),(326,'9c116350-a742-4fba-b113-8d242adcb4d7','My Streetnamess','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-06 20:56:55','127.0.0.1','2018-12-06 20:57:00','127.0.0.1'),(327,'ccf1235c-3632-4876-82ef-98abb42153f5','My Streetnamess','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-06 20:56:55','127.0.0.1','2018-12-06 20:58:48','127.0.0.1'),(328,'aa739999-dae8-4f2f-8fa5-ef4894d9793d','My Streetnamess','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-06 20:59:02','127.0.0.1','2018-12-06 20:59:22','127.0.0.1'),(333,'2bed1e12-b891-403d-90ce-b1f9775f609b','My Streetnamess','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-10 14:00:49','127.0.0.1','2018-12-10 14:05:39','127.0.0.1'),(334,'f2bc2070-a179-4396-836e-25d309154aa0','My Streetnamess','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-10 14:06:46','127.0.0.1','2018-12-10 14:06:50','127.0.0.1'),(341,'d8cf7f17-6b94-4c8b-bca8-a9c3271927c1','My Streetnames','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-10 14:06:46','127.0.0.1','2018-12-10 14:08:58','127.0.0.1'),(343,'15e14cae-ff30-4f94-9d98-07f3d0161674','My Streetnamess','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-10 14:06:46','127.0.0.1','2018-12-10 14:09:01','127.0.0.1'),(344,'5918e5ec-7370-460a-876f-6d370ba5fc10','My Streetnames','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-10 14:06:46','127.0.0.1','2018-12-10 14:09:02','127.0.0.1'),(346,'5e6c3c75-16f0-4823-8067-c0646f41f3a5','My Streetnamess','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-10 14:06:46','127.0.0.1','2018-12-10 14:09:31','127.0.0.1'),(348,'61d884d5-b025-46ef-8401-7507a6b53173','My Streetnames','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-10 15:39:34','145.74.104.153','2018-12-10 15:39:44','145.74.104.153'),(349,'36d37cdd-7d66-4cad-a991-11d21406a478','My Streetnamess','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-10 15:39:34','145.74.104.153','2018-12-10 15:39:45','145.74.104.153'),(350,'e7d6a107-7dbc-47d7-a135-55db77f06cd8','My Streetnames','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-10 15:39:46','145.74.104.153','2018-12-10 15:40:40','145.74.104.153'),(351,'4825e83c-0c15-401b-b423-18772708374d','My Streetnamess','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-10 15:39:46','145.74.104.153','2018-12-10 15:40:40','145.74.104.153'),(352,'00e43d4b-695c-42cd-86c5-4f5f6dfdcd25','My Streetnames','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-10 14:06:46','127.0.0.1','2018-12-10 15:41:05','127.0.0.1'),(354,'2adfa19f-b10d-4840-93fc-0a80a29fd2a7','My Streetnamess','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-10 14:06:46','127.0.0.1','2018-12-10 15:41:07','127.0.0.1'),(355,'870b7367-db72-4faf-9213-31aecda70557','My Streetnames','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-10 14:06:46','127.0.0.1','2018-12-10 15:41:08','127.0.0.1'),(358,'c9730326-a919-4e6f-a54a-37df531b9f71','My Streetnames','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-10 15:50:20','127.0.0.1','2018-12-10 17:03:31','127.0.0.1'),(359,'bc2d2cb0-79f3-441b-9a17-1b0ef2424e67','My Streetnames','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-10 15:50:20','127.0.0.1','2018-12-10 17:03:42','127.0.0.1'),(360,'378c584b-f556-47b6-b1cc-da17e68294b7','My Streetnames','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-10 15:50:20','127.0.0.1','2018-12-10 17:04:26','127.0.0.1'),(361,'6832e4df-5b64-4a4d-b8e4-078cc00b7436','My Streetnames','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-10 15:50:20','127.0.0.1','2018-12-10 17:04:37','127.0.0.1'),(362,'fcd47c90-d20c-47df-aab0-56261a1bf9eb','My Streetnames','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-10 15:50:20','127.0.0.1','2018-12-10 17:04:47','127.0.0.1'),(363,'15797376-b3df-4c36-bd4b-4da35e6a8379','My Streetnames','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-10 15:50:20','127.0.0.1','2018-12-10 17:07:21','127.0.0.1'),(364,'f74620de-8bb6-4bc5-ad32-9c8361b2d8a5','Updated Valkstraat','Updated 6','','Updated 6611KW','Updated Overasselt','updated participant','string','string','{\"a\": \"updated \"}','2018-12-10 17:07:23','127.0.0.1','2018-12-10 17:07:23','127.0.0.1'),(365,'edcfd24f-7ad1-40b5-b939-ad5bed4202f9','My Streetnames','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-10 15:50:20','127.0.0.1','2018-12-10 17:25:24','127.0.0.1'),(366,'c0b7b4c0-a695-4016-96b3-c8fb8584ee18','Updated Valkstraat','Updated 6','','Updated 6611KW','Updated Overasselt','updated participant','string','string','{\"a\": \"updated \"}','2018-12-10 17:25:26','127.0.0.1','2018-12-10 17:25:27','127.0.0.1'),(367,'97c21e23-0daa-49ad-bdb1-cf2cef263cbe','My Streetnames','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-10 17:34:01','127.0.0.1','2018-12-10 17:37:31','127.0.0.1'),(368,'7425e632-cb50-424b-8440-51fb9369150b','Updated Valkstraat','Updated 6','','Updated 6611KW','Updated Overasselt','updated participant','string','string','{\"a\": \"updated \"}','2018-12-10 17:37:32','127.0.0.1','2018-12-10 17:37:33','127.0.0.1'),(369,'f2587f8a-7e13-4bcf-ae40-7dd553d31179','My Streetnames','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-10 17:34:01','127.0.0.1','2018-12-10 17:38:08','127.0.0.1'),(370,'24af9747-8882-46d7-8856-287b46eb0805','Updated Valkstraat','Updated 6','','Updated 6611KW','Updated Overasselt','updated participant','string','string','{\"a\": \"updated \"}','2018-12-10 17:38:10','127.0.0.1','2018-12-10 17:38:10','127.0.0.1'),(371,'a65ff879-ff66-4177-bd07-882650e9b588','My Streetnames','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-10 17:34:01','127.0.0.1','2018-12-10 17:39:10','127.0.0.1'),(372,'8828f95d-8426-4cc5-a659-ab519810cc8a','Updated Valkstraat','Updated 6','','Updated 6611KW','Updated Overasselt','updated participant','string','string','{\"a\": \"updated \"}','2018-12-10 17:39:11','127.0.0.1','2018-12-10 17:39:12','127.0.0.1'),(373,'b9f05fdb-a740-413b-9cc7-f9be1e1990c6','My Streetnames','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-10 17:34:01','127.0.0.1','2018-12-10 17:39:52','127.0.0.1'),(374,'facdba76-d96e-4f47-bbdd-4f96ebcb94de','Updated Valkstraat','Updated 6','','Updated 6611KW','Updated Overasselt','updated participant','string','string','{\"a\": \"updated \"}','2018-12-10 17:39:54','127.0.0.1','2018-12-10 17:39:54','127.0.0.1'),(377,'d40c802b-2151-4b81-aaca-7d9ef2fe22ac','My Streetnamess','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-11 16:08:51','127.0.0.1','2018-12-11 16:08:54','127.0.0.1'),(378,'fce18944-323b-4f5e-be66-ed40713c686c','My Streetnames','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-11 16:08:51','127.0.0.1','2018-12-11 16:09:09','127.0.0.1'),(379,'2e785b1e-dbd2-47e2-b4f4-6d2553f7741b','string','string','','string','string','string','string','string','\"string\"','2018-12-11 16:09:11','127.0.0.1','2018-12-11 16:09:11','127.0.0.1'),(380,'533c6c48-443f-478c-b38c-373f82488d02','My Streetnames','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-11 16:08:51','127.0.0.1','2018-12-11 16:09:18','127.0.0.1'),(381,'177eb375-5c95-4b56-b73a-c9cb7bce89c5','string','string','','string','string','string','string','string','\"string\"','2018-12-11 16:09:19','127.0.0.1','2018-12-11 16:09:19','127.0.0.1'),(382,'fc8decc7-9be2-41c1-b9ac-d31eefad3f3f','My Streetnames','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-11 16:08:51','127.0.0.1','2018-12-11 16:09:36','127.0.0.1'),(383,'04f1bf06-ddd6-4432-80f5-913b70c6abfc','Updated Valkstraat','Updated 6','','Updated 6611KW','Updated Overasselt','updated participant','string','string','{\"a\": \"updated \"}','2018-12-11 16:09:38','127.0.0.1','2018-12-11 16:09:38','127.0.0.1'),(384,'d3f7593e-5451-4196-b715-dbf432b548e6','My Streetnames','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-11 16:08:51','127.0.0.1','2018-12-11 16:10:35','127.0.0.1'),(385,'bb52df50-ba24-4c86-9dfe-1660ed20411b','Updated Valkstraat','Updated 6','','Updated 6611KW','Updated Overasselt','updated participant','string','string','{\"a\": \"updated \"}','2018-12-11 16:10:36','127.0.0.1','2018-12-11 16:10:37','127.0.0.1'),(386,'eba21e16-f7ee-4f52-b339-232414152c02','My Streetnames','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-11 16:08:51','127.0.0.1','2018-12-11 16:10:47','127.0.0.1'),(387,'3b94d8a6-0843-4a74-a573-9e7c4687bffe','Updated Valkstraat','Updated 6','','Updated 6611KW','Updated Overasselt','updated participant','string','string','{\"a\": \"updated \"}','2018-12-11 16:10:48','127.0.0.1','2018-12-11 16:10:53','127.0.0.1'),(388,'242bd98e-392e-4912-8b18-b34b177e8eab','My Streetnames','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-11 16:08:51','127.0.0.1','2018-12-11 16:11:29','127.0.0.1'),(389,'7d857128-3027-4a20-aa8f-5e02d5b44615','Updated Valkstraat','Updated 6','','Updated 6611KW','Updated Overasselt','updated participant','string','string','{\"a\": \"updated \"}','2018-12-11 16:11:31','127.0.0.1','2018-12-11 16:11:31','127.0.0.1'),(390,'a186794a-19bb-4aec-821f-4ad0ebc6183c','My Streetnames','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-11 16:08:51','127.0.0.1','2018-12-11 16:11:36','127.0.0.1'),(391,'f9f2a5c4-f2a8-4870-8a0a-a5ea989be1f4','Updated Valkstraat','Updated 6','','Updated 6611KW','Updated Overasselt','updated participant','string','string','{\"a\": \"updated \"}','2018-12-11 16:11:37','127.0.0.1','2018-12-11 16:11:37','127.0.0.1'),(392,'383e737f-090f-451b-8e33-1782733c673d','My Streetnames','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-11 16:08:51','127.0.0.1','2018-12-11 16:32:58','127.0.0.1'),(394,'9e9bb42a-ed94-4d3d-a6a0-323a02a63567','My Streetnames','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-11 16:08:51','127.0.0.1','2018-12-11 16:33:04','127.0.0.1'),(400,'88ab55a4-909d-497b-9397-5a9fb0211019','My Streetnames','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-11 16:42:43','127.0.0.1','2018-12-11 16:42:47','127.0.0.1'),(402,'17ef4422-abb6-45e5-a6df-ba48cee76a9e','My Streetnames','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-11 17:02:16','127.0.0.1','2018-12-11 17:02:24','127.0.0.1'),(404,'6ef3e70f-c810-4f30-af9c-976e69f7b2d7','My Streetnames','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-11 17:09:08','127.0.0.1','2018-12-11 17:10:56','127.0.0.1'),(407,'abcd7905-f6fc-471e-baef-7a5bee9f586c','My Streetnames','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-11 17:09:08','undefined','2018-12-11 17:17:10','undefined'),(408,'35653376-80e1-4975-9596-02cb0feea2c9','My Streetnames','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-11 17:09:08','undefined','2018-12-11 17:17:24','undefined'),(409,'cff740a1-c40f-4912-ae92-d764f08920ae','My Streetnames','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-11 17:09:08','127.0.0.1','2018-12-11 17:18:32','127.0.0.1'),(413,'1b5387ab-477d-496b-996e-8277c0600792','My Streetnames','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-11 17:09:08','127.0.0.1','2018-12-11 17:32:08','127.0.0.1'),(416,'fa149f91-3b6b-40b2-bfc7-3471b4db8a67','My Streetnamess','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-11 18:01:13','127.0.0.1','2018-12-11 18:01:21','127.0.0.1'),(417,'fc2101ea-056c-4393-ad53-8729484b055e','My Streetnamess','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-11 18:03:36','127.0.0.1','2018-12-11 18:04:36','127.0.0.1'),(419,'ded18682-d05a-4ab9-8745-58d2deb102e5','Apenheul ','1','','1234AB','Apeldoorn','','','','{}','2018-12-12 12:45:24','145.74.104.153','2019-10-28 18:39:47','145.74.104.153'),(420,'bff5bf62-d2a5-481e-bb2e-7971a0c4b55a','Avenida da Liberdade','230','','1250-148','Lisboa','','','','{}','2018-12-12 13:03:08','145.74.104.153','2018-12-12 13:03:43','145.74.104.153'),(421,'a5b31433-603f-4412-bc48-8860d38e3652','Avenida Liberdade','230','','1250148','Lisboa','','','','{}','2018-12-12 15:31:19','145.74.104.153','2018-12-12 15:31:19','145.74.104.153'),(422,'c95d8a97-d41f-410a-97df-55e003eeda2b','asdsa','asdasd','','123123','asdasd','','','','{}','2018-12-12 16:08:29','145.74.104.153','2018-12-12 16:08:29','145.74.104.153'),(423,'8e2a1c79-52e9-49e7-a5a6-5d3fdcf6d85f','Avenida da Liberdade, 230','Lisboa','','1250148','Lisboa','','','','{}','2018-12-12 16:26:08','145.74.104.153','2018-12-12 16:26:08','145.74.104.153'),(424,'4b32b353-8199-4693-9446-2e7d83d379f9','Avenida da Liberdade, 230','230','','1250148','Lisboa','','','','{}','2018-12-12 16:40:25','145.74.104.153','2018-12-12 16:40:25','145.74.104.153'),(425,'0e5d5c92-3e47-487d-9563-f6012bb66fe0','Avenida Liberdade','230','','1250148','Lisboa','','','','{}','2018-12-12 17:01:16','145.74.104.153','2018-12-12 17:01:16','145.74.104.153'),(426,'73268f9c-4886-46e0-89b5-1a8032653088','asdas','d123123','','213123','sdfdsf','','','','{}','2018-12-12 17:21:10','127.0.0.1','2018-12-12 17:21:10','127.0.0.1'),(427,'63bff76f-5a35-4f52-97f7-29c668dd1bb9','Avenida da Liberdade, 230, 1st & 5nd floor','230','','1250148','Lisboa','','','','{}','2018-12-12 18:03:10','145.74.104.153','2018-12-12 18:03:10','145.74.104.153'),(428,'2741e107-44af-4214-9844-03067ada49a6','Avenida da Liberdade, 230','230','','1250148','Lisboa','','','','{}','2018-12-12 18:03:43','145.74.104.153','2018-12-12 18:03:43','145.74.104.153'),(429,'34d7b6a2-00ce-4861-b64b-979e7a847b6e','Avenida da Liberdade, 230','230','','1250148','Lisboa','','','','{}','2018-12-12 18:04:20','145.74.104.153','2018-12-12 18:04:20','145.74.104.153'),(430,'c3d18a80-3d59-448c-98c6-d7d48a5eca4c','Avenida da Liberdade, 230','230','','1250148','Lisboa','','','','{}','2018-12-12 18:31:53','145.74.104.153','2018-12-12 18:31:53','145.74.104.153'),(431,'9a75d9b3-cbe2-4711-b25a-ee0be97822ba','','',NULL,'','','created with relation',NULL,NULL,NULL,'2018-12-12 18:20:19','145.74.104.153','2018-12-12 18:41:13','145.74.104.153'),(432,'a46d1f94-8dae-4eff-ac80-1473cefd5976','My Streetnames','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-11 18:03:36','127.0.0.1','2018-12-12 19:19:20','127.0.0.1'),(433,'faf477b2-91e2-4f02-9f2f-3b532891e619','Updated Valkstraat','Updated 6','','Updated 6611KW','Updated Overasselt','updated participant','string','string','{\"a\": \"updated \"}','2018-12-12 19:19:22','127.0.0.1','2018-12-12 19:19:23','127.0.0.1'),(434,'ea5abc8d-236c-4e88-aa1a-5bcadfcce61f','My Streetnames','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-12 18:59:27','62.45.62.123','2018-12-12 20:04:23','62.45.62.123'),(435,'5da24026-d108-4179-b5f0-0c1fc6c2cff3','Updated Valkstraat','Updated 6','','Updated 6611KW','Updated Overasselt','updated participant','string','string','{\"a\": \"updated \"}','2018-12-12 20:04:25','62.45.62.123','2018-12-12 20:04:26','62.45.62.123'),(436,'870e40f2-be54-4216-996a-c1c375cbfbf4','My Streetnames','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-12 18:59:27','62.45.62.123','2018-12-12 20:05:14','62.45.62.123'),(437,'2cc7d159-b7ca-44a2-8c0f-885297c8ba13','Updated Valkstraat','Updated 6','','Updated 6611KW','Updated Overasselt','updated participant','string','string','{\"a\": \"updated \"}','2018-12-12 20:05:15','62.45.62.123','2018-12-12 20:05:15','62.45.62.123'),(438,'efc18121-69b6-4049-93f0-ba972dc7b9dd','Avenida da Liberdade, 230, 1st & 5nd floor','230','','1250148','Lisboa','','','','{}','2018-12-13 11:52:37','145.74.104.153','2018-12-13 11:52:37','145.74.104.153'),(439,'5f5a4efc-ae29-443b-8bc9-53942cc1913e','Penguin Formula','5','','1250-148','Lisboa','','','','{}','2018-12-13 16:10:18','145.74.104.153','2018-12-13 16:10:18','145.74.104.153'),(440,'4001aa36-5612-4448-a27f-06351c0af151','Avenida da Liberdade, 230','230','','1250148','Lisboa','','','','{}','2018-12-13 16:13:49','145.74.104.153','2018-12-13 16:13:49','145.74.104.153'),(441,'4ac7c079-c977-4421-9f5b-11f80c5b2872','Avenida da Liberdade, 230','230','','1250148','Lisboa','','','','{}','2018-12-13 16:15:07','145.74.104.153','2018-12-13 16:15:07','145.74.104.153'),(442,'7801223f-6457-483e-9660-6c966b5e22fe','My Streetnamess','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-14 16:43:04','127.0.0.1','2018-12-14 16:45:35','127.0.0.1'),(444,'0c87f026-7143-4df4-a5d5-cadff1823a9e','My Streetnames','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-14 16:43:04','127.0.0.1','2018-12-14 16:45:38','127.0.0.1'),(445,'c26c60f7-f9bd-426c-8769-5c4fbf9a888e','Updated Valkstraat','Updated 6','','Updated 6611KW','Updated Overasselt','updated participant','string','string','{\"a\": \"updated \"}','2018-12-14 16:45:41','127.0.0.1','2018-12-14 16:45:43','127.0.0.1'),(446,'56b35443-56d3-443c-b9a8-be7a2cac25e9','My Streetnames','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-14 16:43:04','127.0.0.1','2018-12-14 16:45:45','127.0.0.1'),(449,'c89b1486-c784-4c17-8587-c8f85bacc617','My Streetnames','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-17 10:14:27','127.0.0.1','2018-12-17 10:16:15','127.0.0.1'),(450,'5f4a8fb2-72ac-45f0-bdff-d9f472ee3de1','My Streetnamess','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-17 10:14:27','127.0.0.1','2018-12-17 10:16:35','127.0.0.1'),(451,'1f67271b-5ca9-4fae-bfd3-5d62e966ad3e','My Streetnamess','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-17 10:16:43','127.0.0.1','2018-12-17 10:16:49','127.0.0.1'),(452,'4c4a5ab1-e592-4978-b699-7fe7051e7216','My Streetnamess','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-17 10:18:19','127.0.0.1','2018-12-17 10:18:25','127.0.0.1'),(455,'45f05926-90e1-4529-b39b-ee2b775a95ac','My Streetnames','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-17 10:18:19','127.0.0.1','2018-12-17 10:19:31','127.0.0.1'),(457,'fa05354a-39ff-4f35-8820-88f46e99b98a','My Streetnames','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-17 10:24:16','127.0.0.1','2018-12-17 10:24:21','127.0.0.1'),(459,'7996b5b1-fce0-4e9b-8856-bc9abec29fe3','My Streetnames','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-17 10:27:31','127.0.0.1','2018-12-17 10:27:38','127.0.0.1'),(461,'ac957578-e98d-47e3-bcec-c7b9dc9b0e7a','My Streetnames','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-17 10:27:31','127.0.0.1','2018-12-17 10:28:18','127.0.0.1'),(463,'7cb7872b-f82b-4b01-b0d3-f0d87107eed0','My Streetnames','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-17 11:36:24','127.0.0.1','2018-12-17 11:36:37','127.0.0.1'),(465,'243fbb73-a691-47e1-a335-ae1bd73c116c','My Streetnames','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-17 11:36:24','127.0.0.1','2018-12-17 11:37:13','127.0.0.1'),(467,'468540cb-f1be-46fa-a748-c8e900abf26b','Avenida da Liberdade, 230','230','','1250148','Lisboa','','','','{}','2018-12-17 11:58:45','145.74.104.153','2018-12-17 11:58:45','145.74.104.153'),(468,'4cece7db-1045-40c1-87ed-8b59b84fb301','Avenida da Liberdade, 230, 1st & 5nd floor','230','','1250148','Lisboa','','','','{}','2018-12-17 12:01:16','145.74.104.153','2018-12-17 12:01:16','145.74.104.153'),(469,'39859859-fbbd-40e7-88df-b7754b15131e','Avenida da Liberdade, 230, 1st & 5nd floor','230','','1250148','Lisboa','','','','{}','2018-12-17 12:36:59','145.74.104.153','2018-12-17 12:36:59','145.74.104.153'),(470,'36d7ee84-f740-41bd-b282-81b2f010ea2b','Avenida da Liberdade, 230','230','','1250148','Lisboa','','','','{}','2018-12-17 12:39:16','145.74.104.153','2018-12-17 12:39:16','145.74.104.153'),(471,'d8b45244-44fc-4b00-a190-f988b38a211f','Avenida da Liberdade, 230','230','','1250148','Lisboa','','','','{}','2018-12-17 12:46:12','145.74.104.153','2018-12-17 12:46:12','145.74.104.153'),(472,'ea3b2d69-3fc1-4128-a00d-c8ec3938609d','My Streetnames','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-17 13:31:41','127.0.0.1','2018-12-17 13:41:30','127.0.0.1'),(474,'e7941606-78f4-40be-89bf-245a73f40ff0','My Streetnames','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-17 13:31:41','127.0.0.1','2018-12-17 13:44:19','127.0.0.1'),(476,'c9dea09f-5813-43b1-90d1-fa548c842a76','Avenida da Liberdade, 230','230','','Lisboa','Lisboa','','','','{}','2018-12-17 17:55:09','145.74.104.153','2018-12-17 17:55:09','145.74.104.153'),(477,'89151308-8aa3-4dca-8177-5ec7471826b5','','',NULL,'','','created with relation',NULL,NULL,NULL,'2018-12-17 13:39:31','145.74.104.153','2018-12-17 20:05:06','145.74.104.153'),(478,'3395b602-b349-480e-a98c-f08dee297d93','Avenida Liberdade','230','','1250148','Lisboa','','','','{}','2018-12-18 11:41:43','145.74.104.153','2018-12-18 11:41:43','145.74.104.153'),(479,'e7fcce3e-8683-4f79-a2b7-0a1afaf6a62c','Avenida da Liberdade, 230','230','','1250148','Lisboa','','','','{}','2018-12-18 15:21:41','145.74.104.153','2018-12-18 15:21:41','145.74.104.153'),(480,'46122dfa-350c-4bd5-853d-fd5e0a224b57','My Streetnames','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-18 17:42:55','127.0.0.1','2018-12-18 17:43:00','127.0.0.1'),(482,'ef89a906-94e3-4e77-9be7-8b7550cd6c42','My Streetnames','123',NULL,'1234AB','MyCity','created with relation',NULL,NULL,NULL,'2018-12-18 17:44:01','127.0.0.1','2018-12-18 17:44:07','127.0.0.1'),(491,'8c011fa1-bdf2-48dd-9c2f-c8dbadb00ba4','Weldingstraat ','5','','8000SC','Zwolle','','','','{}','2019-01-02 12:57:45','145.74.104.153','2019-01-02 12:57:45','145.74.104.153'),(495,'9be09145-3063-4a16-9a05-f4efcf73694a','asdasda','213213','','asdasda','asdasdsadda','','','','{}','2019-01-15 16:48:00','145.74.104.153','2019-01-15 16:48:00','145.74.104.153'),(497,'810976a8-475c-4924-84a3-89013525a72a','asdasd','123123','','21312','3asdasd','','','','{}','2019-01-21 12:45:58','145.74.104.153','2019-01-21 12:45:58','145.74.104.153'),(498,'16453e66-31d0-4c26-a5d3-7920ecc3588d','aasdasd','123123','','21312312','asdasds','','','','{}','2019-01-21 12:48:21','145.74.104.153','2019-01-21 12:48:21','145.74.104.153'),(499,'289f653c-9e36-4627-ac79-3b3e3314ff77','aasdasd','12312','','12312','asdas','','','','{}','2019-01-21 12:50:05','145.74.104.153','2019-01-21 12:50:05','145.74.104.153'),(500,'7a92b6c1-8499-45a5-920f-22c189f0a5aa','asdas','123123','','12321','asdsad','','','','{}','2019-01-21 12:50:50','145.74.104.153','2019-01-21 14:06:21','145.74.104.153'),(501,'799321c4-0db9-4995-b0a3-c4ff1117a4e3','asdas','d123123','','asdas','asdasd','','','','{}','2019-01-21 14:13:16','145.74.104.153','2019-01-21 14:13:16','145.74.104.153'),(502,'39db1a06-964b-4a31-b37c-b13749a7e987','asdas','12312','','123123','asdsad','','','','{}','2019-01-21 14:15:24','145.74.104.153','2019-01-21 14:15:24','145.74.104.153'),(503,'db32665b-3a7f-48a0-8316-f4ecd19b6268','asdasd','asdas','','asdas','asdasd','','','','{}','2019-01-21 14:15:40','145.74.104.153','2019-01-21 14:15:40','145.74.104.153'),(504,'69627cc6-80ca-466d-84e8-7d12a96b6a88','asdas','2312','','213213','asdasd','','','','{}','2019-01-21 14:17:25','145.74.104.153','2019-01-21 14:17:25','145.74.104.153'),(505,'9320ad0d-227a-4d74-82cb-6fd5e5f1b422','asdas','123123','','12312','asdas','','','','{}','2019-01-21 14:18:40','145.74.104.153','2019-01-21 14:34:46','145.74.104.153'),(507,'f7529d47-1bef-4186-a064-11dd02e19ba8','asdas','12312','','213213','asdasd','','','','{}','2019-01-21 15:28:43','145.74.104.153','2019-01-22 11:15:48','145.74.104.153'),(508,'39b3560d-9fcb-4e73-baf3-494257b8f7b6','rua de teste','123','','1250','lisboa','','','','{}','2019-01-21 17:40:37','145.74.104.153','2019-01-22 11:12:14','145.74.104.153'),(509,'1549b97f-d0ee-434c-b15b-8a93ca392596','','',NULL,'','','created with relation',NULL,NULL,NULL,'2019-01-21 18:04:00','145.74.104.153','2019-01-22 12:28:19','145.74.104.153'),(510,'0a157efb-94fd-4ceb-bb97-5efe63bcfc25','','',NULL,'','','created with relation',NULL,NULL,NULL,'2019-01-21 18:04:00','145.74.104.153','2019-01-22 12:33:30','145.74.104.153'),(511,'8cfc293a-7bf8-4785-b4f6-b975e7b3b817','','',NULL,'','','created with relation',NULL,NULL,NULL,'2019-01-21 18:04:00','145.74.104.153','2019-01-22 12:36:58','145.74.104.153'),(512,'9fe48e3f-6041-4cf8-b277-ba705d626f57','1','1',NULL,'1','1','created with team',NULL,NULL,NULL,'2019-01-22 11:39:22','145.74.104.153','2019-01-22 11:39:22','145.74.104.153'),(513,'761d6646-50b6-4f0a-8889-2938dde5266d','1','1','','1','1','','','','{}','2019-01-22 12:42:22','145.74.104.153','2019-01-22 12:42:22','145.74.104.153'),(514,'9e58e5c7-80a2-4966-965d-be0ac17e96c8','','',NULL,'','','created with relation',NULL,NULL,NULL,'2019-01-21 18:04:00','145.74.104.153','2019-01-22 12:48:15','145.74.104.153'),(515,'23952ad0-b865-4b6e-a0ac-3bf7ab250780','Demostraat','2','','8000AA','Zwolle','','','','{}','2019-02-11 19:45:05','145.74.104.153','2019-02-11 19:45:05','145.74.104.153'),(516,'31a70f66-9a50-4967-b1ce-41472c445c63','Demostraat ','3','','8000AA','Zwolle','','','','{}','2019-02-11 20:06:23','145.74.104.153','2019-02-11 20:06:23','145.74.104.153'),(517,'a717f465-27da-42ef-a674-752c7a1f43e0','a','a','','1','as','','','','{}','2019-02-21 11:27:18','145.74.104.153','2019-02-21 11:27:18','145.74.104.153'),(518,'282748c0-d8cf-4ded-92ea-9411b79003d8','asdasd','asdas','','asda','asda','','','','{}','2019-02-21 11:32:40','145.74.104.153','2019-02-21 11:32:40','145.74.104.153'),(519,'bcdeb791-bf61-4b90-b001-ee3d5f4469c3','asdas','asd','','asdas','ada','','','','{}','2019-02-22 12:14:54','145.74.104.153','2019-02-22 12:14:54','145.74.104.153'),(520,'a94c88ad-5872-4f14-9424-d50fec94f15c','Demo straat','10','','0000AA','Zwolle','','','','{}','2019-02-22 16:36:20','145.74.104.153','2019-02-22 16:36:20','145.74.104.153'),(521,'8f58aff3-f87f-4999-b647-1527df102e76','1','1','','1','w','','','','{}','2019-03-27 20:32:41','145.74.104.153','2019-03-27 20:32:41','145.74.104.153'),(522,'e71fd2fc-c8fe-4165-bf60-8853335bc62f','asdasd','123','','123','asdas','','','','{}','2019-04-15 11:19:53','145.74.104.153','2019-04-15 11:21:10','145.74.104.153'),(523,'fc287975-20f9-468e-82ee-cf548192f492','Berg en Dal laa1','11','','3456BB','Apeldoorn','','','','{}','2019-10-28 18:52:43','145.74.104.153','2019-10-28 18:59:52','145.74.104.153');
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `participants`
--

DROP TABLE IF EXISTS `participants`;
/*!50001 DROP VIEW IF EXISTS `participants`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `participants` AS SELECT 
 1 AS `id`,
 1 AS `locations_id`,
 1 AS `firstname`,
 1 AS `prefix`,
 1 AS `lastname`,
 1 AS `participant`,
 1 AS `date_of_birth`,
 1 AS `phonenumber`,
 1 AS `email`,
 1 AS `description`,
 1 AS `username`,
 1 AS `creationDate`,
 1 AS `createdBy`,
 1 AS `modificationDate`,
 1 AS `modifiedBy`,
 1 AS `teamId`,
 1 AS `teamName`,
 1 AS `debt`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `privileges`
--

DROP TABLE IF EXISTS `privileges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `privileges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) NOT NULL,
  `column_name` varchar(255) NOT NULL,
  `create` varchar(1) NOT NULL DEFAULT '0',
  `retrieve` varchar(1) NOT NULL DEFAULT '0',
  `update` varchar(1) NOT NULL DEFAULT '0',
  `delete` varchar(1) NOT NULL DEFAULT '0',
  `creationDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` varchar(255) DEFAULT NULL,
  `modificationDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedBy` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `privileges`
--

LOCK TABLES `privileges` WRITE;
/*!40000 ALTER TABLE `privileges` DISABLE KEYS */;
/*!40000 ALTER TABLE `privileges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relations`
--

DROP TABLE IF EXISTS `relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(45) NOT NULL,
  `locations_id` int(11) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `prefix` varchar(15) DEFAULT NULL,
  `lastname` varchar(50) NOT NULL,
  `date_of_birth` datetime DEFAULT NULL,
  `phonenumber` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `description` longtext,
  `realm` varchar(512) DEFAULT NULL,
  `username` varchar(512) DEFAULT NULL,
  `password` varchar(512) NOT NULL,
  `emailVerified` tinyint(3) DEFAULT NULL,
  `verificationToken` varchar(512) DEFAULT NULL,
  `json` json DEFAULT NULL,
  `creationDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` varchar(255) DEFAULT NULL,
  `modificationDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedBy` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid_UNIQUE` (`uuid`),
  KEY `fk_relations_locations1_idx` (`locations_id`),
  CONSTRAINT `fk_relations_locations1` FOREIGN KEY (`locations_id`) REFERENCES `locations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=543 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relations`
--

LOCK TABLES `relations` WRITE;
/*!40000 ALTER TABLE `relations` DISABLE KEYS */;
INSERT INTO `relations` VALUES (261,'88a745f5-6fd2-4cbf-8228-0ac79dace0c0',202,'CA-Gemeente-1',NULL,'CA-Gemeente1','1970-01-01 00:00:00','0612345678','theotheunissen+CA-Gemeente-1@gmail.com',NULL,NULL,'CA-Gemeente1','$2a$10$uGH3sHib.Z3/RrBu7oZT3OJjaPp7upQkC/4aH8A0tH4eXqhZ8Z.sa',1,NULL,NULL,'2018-11-01 11:39:23','145.74.166.166','2018-11-22 20:56:41','62.45.62.123'),(262,'951a5435-1fcf-42ff-8f09-c380fa9e5c91',203,'CA-Gemeente-2',NULL,'CA-Gemeente2','1970-01-01 00:00:00','0612345678','pietschelive+CA-Gemeente-2@gmail.com',NULL,NULL,'CA-Gemeente2','$2a$10$5WKKGPequ71Xu2X5RuYHhOtlyL5wgZYyYC3EuPIBRdzCPK9ptMNZy',1,NULL,NULL,'2018-11-01 11:39:23','145.74.166.166','2018-11-01 11:39:23','tester'),(263,'4a7afa9e-56d2-4e0d-a616-72ba07973b62',204,'NO-Gemeente-1',NULL,'NO-Gemeente1','1970-01-01 00:00:00','0612345678','pietschelive+NO-Gemeente-1@gmail.com',NULL,NULL,'NO-Gemeente1','$2a$10$ntRvw5YahBy5H/pTSVhLzO7U.Bh.tAmzlacfDNvQ1zwZtam.090Ca',1,NULL,NULL,'2018-11-01 11:39:23','145.74.166.166','2018-11-01 11:39:23','tester'),(264,'f4748792-0705-49e7-acac-cd1e4dae743e',205,'NO-Gemeente-2',NULL,'NO-Gemeente2','1970-01-01 00:00:00','0612345678','pietschelive+NO-Gemeente-2@gmail.com',NULL,NULL,'NO-Gemeente2','$2a$10$y0nH2ZfhRK9SNIm2DcPF/u44dU5e69zJDeJsn94g8tfjPwWdvWwD6',1,NULL,NULL,'2018-11-01 11:39:23','145.74.166.166','2018-11-01 11:39:23','tester'),(266,'e10f3b74-7fa9-4a91-b0a6-2029715aa546',207,'TO-Gemeente-2',NULL,'TO-Gemeente2','1970-01-01 00:00:00','0612345678','pietschelive+TO-Gemeente-2@gmail.com',NULL,NULL,'TO-Gemeente2','$2a$10$5Evk2oZSYdfolZfU1IAmv.A4INxFXWXzSFodx6iZ7CJ5keZVyeUgu',1,NULL,NULL,'2018-11-01 11:39:23','145.74.166.166','2018-11-01 11:39:23','tester'),(269,'d7b5b1b1-1c97-402b-9fc5-8b603c92b90c',210,'PA-Hans',NULL,'PA-Hans','1970-01-01 00:00:00','0612345678','pietschelive+PA-Hans@gmail.com',NULL,NULL,'PA-Hans','$2a$10$Ux/ALp0XfRW1mUlOpKko2.cYESxwnz3tI3M4.PR7KHKhwYfSXoo5G',1,NULL,NULL,'2018-11-01 11:39:23','145.74.166.166','2018-11-01 11:39:23','tester'),(270,'c455b18e-ce27-41b3-9fe2-b70efb81c546',211,'PA-Quon',NULL,'PA-Quon','1970-01-01 00:00:00','0612345678','pietschelive+PA-Quon@gmail.com',NULL,NULL,'PA-Quon','$2a$10$8bmsinlZDE6FtF3tkOonnu.rYC6gu9h/NtC/2UBskFqpsgXzIgW/y',1,NULL,NULL,'2018-11-01 11:39:23','145.74.166.166','2018-11-01 11:39:23','tester'),(271,'d3daece8-c770-4262-a592-3d6d78212172',212,'Noord','','Gemeente',NULL,'038-1111112','pietschelive+contzn1@gmail.com','Created with team',NULL,'pietschelive+contzn1@gmail.com','m_PyA8LAIrLDm_PyA8LAIrLD',NULL,NULL,'{}','2018-11-01 13:22:06','145.74.104.153','2018-12-20 06:55:05','145.74.104.153'),(272,'44e35217-f185-4ee5-a74a-437f81885cb5',213,'Zuid','','Gemeente',NULL,'038-2222222','pietschelive+contzz1@gmail.com','Created with team',NULL,'pietschelive+contzz1@gmail.com','nHeawQPhGv1xnHeawQPhGv1x',NULL,NULL,'{}','2018-11-01 13:29:55','145.74.104.153','2018-11-01 13:29:55','145.74.104.153'),(273,'07a27f15-c310-4018-a6b6-455f11dce0ad',220,'Oost','','Gemeente',NULL,'038-3333333','piteschelive+contzo1@gmail.com','Created with team',NULL,'piteschelive+contzo1@gmail.com','XAp9VZhFRxM1XAp9VZhFRxM1',NULL,NULL,'{}','2018-11-01 13:35:31','145.74.104.153','2018-11-01 13:35:31','145.74.104.153'),(274,'bd145c34-f455-4ca6-b0f7-e6496d54b6e7',222,'West','','Gemeente',NULL,'038-4444444','pietschelive+contzw1@gmail.com','Created with team',NULL,'pietschelive+contzw1@gmail.com','nR7wj_TOr5WGnR7wj_TOr5WG',NULL,NULL,'{}','2018-11-01 13:37:25','145.74.104.153','2018-11-01 13:37:25','145.74.104.153'),(275,'7d12fbcf-f158-427a-857d-e295e6d4b1e1',223,'Midden','','Gemeente',NULL,'038-5555555','pietschelive+contzm1@gmail.com','Created with team',NULL,'pietschelive+contzm1@gmail.com','c7zp7UlnEUojc7zp7UlnEUoj',NULL,NULL,'{}','2018-11-01 13:39:24','145.74.104.153','2018-11-01 13:39:24','145.74.104.153'),(284,'33b14791-c810-47a0-a3ce-5993cdd6e545',232,'NO-Gemeente-3',NULL,'NO-Gemeente3','1970-01-01 00:00:00','0612345678','pietschelive+NO-Gemeente-3@gmail.com',NULL,NULL,'NO-Gemeente3','$2a$10$7B4e4jeni/PhMB/BrtLIHu5UkNd0u5AcTQKhvuXj0tVenrM/0qu3a',1,NULL,NULL,'2018-11-01 13:57:38','145.74.166.166','2018-11-01 13:57:38','tester'),(285,'358a252a-c286-47aa-b4e9-206c47e8af67',233,'NO-Gemeente-5',NULL,'NO-Gemeente5','1970-01-01 00:00:00','0612345678','pietschelive+NO-Gemeente-5@gmail.com',NULL,NULL,'NO-Gemeente5','$2a$10$bbfP8W7tynFdmxFJArlZZObxiW6R2vydPMB14ZGX7oPnT5Ko.0kuG',1,NULL,NULL,'2018-11-01 13:57:38','145.74.166.166','2018-11-01 13:57:38','tester'),(286,'3af49200-5e38-442e-8aa8-36453bedb788',234,'NO-Gemeente-4',NULL,'NO-Gemeente4','1970-01-01 00:00:00','0612345678','pietschelive+NO-Gemeente-4@gmail.com',NULL,NULL,'NO-Gemeente4','$2a$10$d7t233ETXD0N1EpVKq76v.ja4TcUnjcfQIDevxXrGRzeqDST9xrei',1,NULL,NULL,'2018-11-01 13:57:38','145.74.166.166','2018-11-01 13:57:38','tester'),(289,'0fa47df7-d5d6-486c-bd21-087f8c4aec0b',237,'Test',NULL,'---Er1','1970-01-02 00:00:00','0612345671','pietschelive+tester1@gmail.com',NULL,NULL,'tester1','$2a$10$tEURl/Lbi15SN9xAaaPWdeGHCclyLbvhoYIFQKKuQHljM0uSOCLAC',1,NULL,NULL,'2018-11-08 11:45:52','109.33.193.14','2019-01-08 16:33:35','145.74.104.153'),(290,'8df1c022-e84d-4db5-afcb-39032a00a77e',238,'Demo',NULL,'---Visitor1','1970-02-02 00:00:00','0612345611','pietschelive+demo1@gmail.com',NULL,NULL,'Demo1','$2a$10$orrp3iM6tj.cye3/Q905cu8dbssiYT7mFfmtq2Zh7/tC1GMyn0lN2',1,NULL,NULL,'2018-11-08 11:45:52','109.33.193.14','2019-01-22 11:12:14','145.74.104.153'),(292,'61ba13fd-9f0d-40d2-9fd2-f4dca92e2364',240,'Scys',NULL,'Manager1','1970-01-01 00:00:00','0612345678','pietschelive+scysmanager1@gmail.com',NULL,NULL,'Scysmanager1 ','$2a$10$I5we4jTnolxi8ytiNcYn9uPVGcUs9uhk5P/Hm80b5F7AaLC1IWxFq',1,NULL,NULL,'2018-11-08 11:45:52','62.45.62.123','2018-11-08 11:45:52','tester'),(300,'973d0967-e1df-42c5-b7b1-ab05ca82b93b',248,'CA-Gemeente-1',NULL,'CA-Gemeente1','1970-01-01 00:00:00','0612345678','theo.theunissen+CA-Gemeente-1@gmail.com',NULL,NULL,'CAGemeente1','$2a$10$6Pr2b2dApDMy66Aa3n4r/OHFtEqRuIIizxqx3Hv/sdxv8U3hAXSBW',1,NULL,NULL,'2018-11-08 20:53:42','145.74.166.254','2018-11-08 20:53:42','tester'),(301,'9b6d2432-795d-49e5-9d5c-51749cb8c475',249,'CA-Gemeente-2',NULL,'CA-Gemeente2','1970-01-01 00:00:00','0612345678','theo.theunissen+CA-Gemeente-2@gmail.com',NULL,NULL,'CAGemeente2','$2a$10$V/7QzanUJxwV7p1hMTRmSOUvW6OiUa.JjH8aYd7Luzixk6wpBoDRm',1,NULL,NULL,'2018-11-08 20:53:42','145.74.166.254','2018-11-08 20:53:42','tester'),(489,'3191402e-befc-4a7c-aedd-e740aa259143',431,'eduardo',NULL,'carvalho','2018-12-11 00:00:00','123213','eduardo.carvalho+participant@penguinformula.com',NULL,NULL,'participant_eduardo','$2a$10$LXVxx.EBaB4ml1poEEm79uih4mUW/PN4xOogVyGRHeO4nRfrWgR7C',1,NULL,NULL,'2018-12-12 17:20:19','145.74.104.153','2018-12-12 17:20:19','tester'),(521,'7a971268-cece-42a5-94de-09c0bc74d075',477,'Piet',NULL,'Schouten','1956-10-22 23:00:00','038-4466113','pietschelive+pietschou@gmail.com',NULL,NULL,'PietSchou','$2a$10$vBd1xxG17VpBp8.8ZhY.WePmWynxbfHEVQUjqW9YZakDoctE7EhIW',1,NULL,NULL,'2018-12-17 12:39:31','145.74.104.153','2018-12-17 12:39:31','tester'),(538,'4749f17d-82b1-4dab-ac80-58f24581252d',509,'CADemo1',NULL,'CADemo1','2019-01-01 00:00:00','1','eduardo.carvalho+cademo1@penguinformula.com',NULL,NULL,'CADemo1','$2a$10$qvQDoftS20OJS3oe5J/AueztZgNmM9pH0iC13a.J/uwdwi2tgi7lS',1,NULL,NULL,'2019-01-21 17:04:00','145.74.104.153','2019-01-21 17:04:00','tester'),(539,'0820dba2-afd0-4157-8d44-eada31f453d2',510,'NTDemo1',NULL,'NTDemo1','2019-01-10 00:00:00','1','eduardo.carvalho+ntdemo1@penguinformula.com',NULL,NULL,'NTDemo1','$2a$10$BxKHstLzLKB.aKIa0LdZtu/ZxmBu1236D7q0sqgvW8p8hv37w2P0.',1,NULL,NULL,'2019-01-21 17:04:00','145.74.104.153','2019-01-21 17:04:00','tester'),(540,'c4d1c09a-6af4-4203-9af4-7f280f67a2d5',511,'TODemo1',NULL,'TODemo1','2019-01-17 00:00:00','1','eduardo.carvalho+todemo1@penguinformula.com',NULL,NULL,'TODemo1','$2a$10$dv5EcfeVeZSqm9bCcjCb1uIOVbdcfC.jk9lUsbrCHZbhDs45kL.UO',1,NULL,NULL,'2019-01-21 17:04:00','145.74.104.153','2019-10-28 18:59:52','145.74.104.153'),(541,'b32bde1b-462a-47da-a39d-b09946583392',512,'TeamDemo1','1','TeamDemo1',NULL,'1','eduardo.carvalho+teamdemo1@penguinformula.com','Created with team',NULL,'TeamDemo1','nyZfRcULk42anyZfRcULk42a',NULL,NULL,'{}','2019-01-22 11:39:22','145.74.104.153','2019-01-22 11:39:22','145.74.104.153'),(542,'0a8b6527-6129-4d81-9352-9b218b50c346',514,'PARDemo1',NULL,'PARDemo1','2019-01-09 00:00:00','1','eduardo.carvalho+pardemo1@penguinformula.com',NULL,NULL,'PARDemo1','$2a$10$ruXVtZKLKmp9eYUUGKXsPekmdtcZfFhiMpAURlrPRqGIZKq/BSPgK',1,NULL,NULL,'2019-01-21 17:04:00','145.74.104.153','2019-01-21 17:04:00','tester');
/*!40000 ALTER TABLE `relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relations_with_roles`
--

DROP TABLE IF EXISTS `relations_with_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relations_with_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roles_id` int(11) NOT NULL,
  `relations_id` int(11) NOT NULL,
  `creationDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` varchar(255) DEFAULT NULL,
  `modificationDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedBy` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `relation_role_uk` (`roles_id`,`relations_id`),
  KEY `fk_relations_with_roles_roles1_idx` (`roles_id`),
  KEY `fk_relations_with_roles_relations1_idx` (`relations_id`),
  CONSTRAINT `fk_relations_with_roles_relations1` FOREIGN KEY (`relations_id`) REFERENCES `relations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_relations_with_roles_roles1` FOREIGN KEY (`roles_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=309 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relations_with_roles`
--

LOCK TABLES `relations_with_roles` WRITE;
/*!40000 ALTER TABLE `relations_with_roles` DISABLE KEYS */;
INSERT INTO `relations_with_roles` VALUES (158,9,261,'2018-11-01 12:51:06','145.74.104.153','2018-11-01 12:51:06','145.74.104.153'),(160,11,263,'2018-11-01 12:51:34','145.74.104.153','2018-11-01 12:51:34','145.74.104.153'),(161,11,264,'2018-11-01 12:52:32','145.74.104.153','2018-11-01 12:52:32','145.74.104.153'),(163,13,266,'2018-11-01 12:53:04','145.74.104.153','2018-11-01 12:53:04','145.74.104.153'),(165,12,269,'2018-11-01 12:53:31','145.74.104.153','2018-11-01 12:53:31','145.74.104.153'),(166,12,270,'2018-11-01 12:53:43','145.74.104.153','2018-11-01 12:53:43','145.74.104.153'),(167,11,284,'2018-11-01 14:18:25','145.74.104.153','2018-11-01 14:18:25','145.74.104.153'),(168,11,285,'2018-11-01 14:18:47','145.74.104.153','2018-11-01 14:18:47','145.74.104.153'),(169,11,286,'2018-11-01 14:38:30','145.74.104.153','2018-11-01 14:38:30','145.74.104.153'),(178,11,271,'2018-11-08 11:28:44','145.74.104.153','2018-11-08 11:28:44','145.74.104.153'),(179,11,272,'2018-11-08 11:29:21','145.74.104.153','2018-11-08 11:29:21','145.74.104.153'),(180,11,273,'2018-11-08 11:29:35','145.74.104.153','2018-11-08 11:29:35','145.74.104.153'),(182,11,274,'2018-11-08 11:30:17','145.74.104.153','2018-11-08 11:30:17','145.74.104.153'),(183,11,275,'2018-11-08 11:30:28','145.74.104.153','2018-11-08 11:30:28','145.74.104.153'),(187,11,290,'2018-11-08 12:23:42','145.74.104.153','2018-11-08 12:23:42','145.74.104.153'),(188,9,290,'2018-11-08 12:23:42','145.74.104.153','2018-11-08 12:23:42','145.74.104.153'),(189,12,290,'2018-11-08 12:23:42','145.74.104.153','2018-11-08 12:23:42','145.74.104.153'),(190,13,290,'2018-11-08 12:23:42','145.74.104.153','2018-11-08 12:23:42','145.74.104.153'),(191,10,290,'2018-11-08 20:44:25',NULL,'2018-11-08 20:44:25',NULL),(192,9,289,'2018-11-08 20:44:25',NULL,'2018-11-08 20:44:25',NULL),(194,11,289,'2018-11-08 20:44:25',NULL,'2018-11-08 20:44:25',NULL),(195,12,289,'2018-11-08 20:44:25',NULL,'2018-11-08 20:44:25',NULL),(196,13,289,'2018-11-08 20:44:25',NULL,'2018-11-08 20:44:25',NULL),(197,9,292,'2018-11-09 09:15:57','145.74.104.153','2018-11-09 09:15:57','145.74.104.153'),(198,10,292,'2018-11-09 09:15:57','145.74.104.153','2018-11-09 09:15:57','145.74.104.153'),(199,11,292,'2018-11-09 09:15:57','145.74.104.153','2018-11-09 09:15:57','145.74.104.153'),(200,13,292,'2018-11-09 09:15:57','145.74.104.153','2018-11-09 09:15:57','145.74.104.153'),(218,9,262,'2018-12-06 14:17:54','145.74.104.153','2018-12-06 14:17:54','145.74.104.153'),(296,9,521,'2018-12-17 19:06:27','145.74.104.153','2018-12-17 19:06:27','145.74.104.153'),(297,11,521,'2018-12-17 19:06:27','145.74.104.153','2018-12-17 19:06:27','145.74.104.153'),(298,10,521,'2018-12-17 19:06:27','145.74.104.153','2018-12-17 19:06:27','145.74.104.153'),(305,9,538,'2019-01-22 11:30:55','145.74.104.153','2019-01-22 11:30:55','145.74.104.153'),(306,11,539,'2019-01-22 11:34:56','145.74.104.153','2019-01-22 11:34:56','145.74.104.153'),(307,13,540,'2019-01-22 11:37:48','145.74.104.153','2019-01-22 11:37:48','145.74.104.153'),(308,12,542,'2019-01-22 11:48:10','145.74.104.153','2019-01-22 11:48:10','145.74.104.153');
/*!40000 ALTER TABLE `relations_with_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relations_with_tasks`
--

DROP TABLE IF EXISTS `relations_with_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relations_with_tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tasks_id` int(11) NOT NULL,
  `relations_id` int(11) NOT NULL,
  `creationDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` varchar(255) DEFAULT NULL,
  `modificationDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedBy` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `relation_task_uk` (`tasks_id`,`relations_id`),
  KEY `fk_relations_with_tasks_roles1_idx` (`tasks_id`),
  KEY `fk_relations_with_tasks_relations1_idx` (`relations_id`),
  CONSTRAINT `fk_relations_with_tasks_relations1` FOREIGN KEY (`relations_id`) REFERENCES `relations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_relations_with_tasks_roles1` FOREIGN KEY (`tasks_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relations_with_tasks`
--

LOCK TABLES `relations_with_tasks` WRITE;
/*!40000 ALTER TABLE `relations_with_tasks` DISABLE KEYS */;
INSERT INTO `relations_with_tasks` VALUES (118,68,542,'2019-03-27 19:40:15','145.74.104.153','2019-03-27 19:40:15','145.74.104.153'),(119,67,542,'2019-03-27 20:03:21','145.74.104.153','2019-03-27 20:03:21','145.74.104.153'),(123,71,542,'2019-07-08 19:45:53','145.74.104.153','2019-07-08 19:45:53','145.74.104.153');
/*!40000 ALTER TABLE `relations_with_tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relations_with_teams`
--

DROP TABLE IF EXISTS `relations_with_teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relations_with_teams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `relations_id` int(11) NOT NULL,
  `teams_id` int(11) NOT NULL,
  `creationDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` varchar(255) DEFAULT NULL,
  `modificationDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedBy` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `relation_team_uk` (`relations_id`,`teams_id`),
  KEY `relation_fk_idx` (`relations_id`),
  KEY `team_fk_idx` (`teams_id`),
  CONSTRAINT `relation_fk` FOREIGN KEY (`relations_id`) REFERENCES `relations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `team_fk` FOREIGN KEY (`teams_id`) REFERENCES `teams` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=267 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relations_with_teams`
--

LOCK TABLES `relations_with_teams` WRITE;
/*!40000 ALTER TABLE `relations_with_teams` DISABLE KEYS */;
INSERT INTO `relations_with_teams` VALUES (132,272,69,'2018-11-01 13:29:55','145.74.104.153','2018-11-01 13:29:55','145.74.104.153'),(133,273,70,'2018-11-01 13:35:31','145.74.104.153','2018-11-01 13:35:31','145.74.104.153'),(134,274,71,'2018-11-01 13:37:25','145.74.104.153','2018-11-01 13:37:25','145.74.104.153'),(135,275,72,'2018-11-01 13:39:24','145.74.104.153','2018-11-01 13:39:24','145.74.104.153'),(136,263,68,'2018-11-01 15:34:13',NULL,'2018-11-01 15:34:13',NULL),(137,264,69,'2018-11-01 15:34:13',NULL,'2018-11-01 15:34:13',NULL),(138,284,70,'2018-11-01 15:34:13',NULL,'2018-11-01 15:34:13',NULL),(139,285,71,'2018-11-01 15:34:13',NULL,'2018-11-01 15:34:13',NULL),(140,286,72,'2018-11-01 15:34:13',NULL,'2018-11-01 15:34:13',NULL),(234,290,68,'2018-12-12 20:01:17','145.74.104.153','2018-12-12 20:01:17','145.74.104.153'),(235,269,71,'2018-12-12 20:02:25','145.74.104.153','2018-12-12 20:02:25','145.74.104.153'),(236,270,72,'2018-12-12 20:02:36','145.74.104.153','2018-12-12 20:02:36','145.74.104.153'),(249,289,72,'2018-12-17 19:28:12','145.74.104.153','2018-12-17 19:28:12','145.74.104.153'),(262,262,103,'2019-01-21 17:14:02','145.74.104.153','2019-01-21 17:14:02','145.74.104.153'),(264,539,107,'2019-01-22 11:40:35','145.74.104.153','2019-01-22 11:40:35','145.74.104.153'),(265,542,107,'2019-03-27 18:57:52','145.74.104.153','2019-03-27 18:57:52','145.74.104.153'),(266,539,72,'2019-07-08 17:53:13','145.74.104.153','2019-07-08 17:53:13','145.74.104.153');
/*!40000 ALTER TABLE `relations_with_teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `description` longtext,
  `json` json DEFAULT NULL,
  `creationDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` varchar(255) DEFAULT NULL,
  `modificationDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedBy` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  UNIQUE KEY `uuid_UNIQUE` (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (9,'17b6e95e-96fe-11e8-99ba-8e9c42f3e967','City administration',NULL,NULL,'2018-07-26 16:52:56',NULL,'2018-07-26 16:52:56',NULL),(10,'61aedaf2-96fe-11e8-99ba-8e9c42f3e967','Application administration',NULL,NULL,'2018-07-26 16:53:11',NULL,'2018-07-26 16:53:11',NULL),(11,'667ff766-96fe-11e8-99ba-8e9c42f3e967','Neighborhood team',NULL,NULL,'2018-07-26 16:53:20',NULL,'2018-07-26 16:53:20',NULL),(12,'716a38bd-96fe-11e8-99ba-8e9c42f3e967','Participant',NULL,NULL,'2018-07-26 16:53:33',NULL,'2018-07-26 16:53:33',NULL),(13,'716a38bd-96fe-11e8-99ba-8e9c42f3e961','Task Owner',NULL,NULL,'2018-11-01 13:44:00','admin','2018-11-01 13:44:00','admin');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_with_privileges`
--

DROP TABLE IF EXISTS `roles_with_privileges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles_with_privileges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roles_id` int(11) NOT NULL,
  `privileges_id` int(11) NOT NULL,
  `creationDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` varchar(255) DEFAULT NULL,
  `modificationDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedBy` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `role_privilege_uk` (`roles_id`,`privileges_id`),
  KEY `fk_roles_with_privileges_privileges1_idx` (`privileges_id`),
  KEY `fk_roles_with_privileges_roles1_idx` (`roles_id`),
  CONSTRAINT `fk_roles_with_privileges_privileges1` FOREIGN KEY (`privileges_id`) REFERENCES `privileges` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_roles_with_privileges_roles1` FOREIGN KEY (`roles_id`) REFERENCES `roles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_with_privileges`
--

LOCK TABLES `roles_with_privileges` WRITE;
/*!40000 ALTER TABLE `roles_with_privileges` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles_with_privileges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skills`
--

DROP TABLE IF EXISTS `skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(45) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `json` json DEFAULT NULL,
  `creationDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` varchar(255) DEFAULT NULL,
  `modificationDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedBy` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  UNIQUE KEY `uuid_UNIQUE` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skills`
--

LOCK TABLES `skills` WRITE;
/*!40000 ALTER TABLE `skills` DISABLE KEYS */;
/*!40000 ALTER TABLE `skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(45) NOT NULL,
  `displayOrder` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `description` longtext,
  `json` json DEFAULT NULL,
  `creationDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` varchar(255) DEFAULT NULL,
  `modificationDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedBy` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `creationDate_UNIQUE` (`creationDate`),
  UNIQUE KEY `modificationDate_UNIQUE` (`modificationDate`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  UNIQUE KEY `uuid_UNIQUE` (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (30,'c7bc99c3-46eb-44a8-8b19-6fff108ece48',100,'Registered',NULL,NULL,'2018-07-28 13:00:47',NULL,'2018-07-28 13:00:47',NULL),(31,'b21927a9-96fe-11e8-99ba-8e9c42f3e967',200,'Assigned',NULL,NULL,'2018-07-28 13:01:00',NULL,'2018-07-28 13:01:00',NULL),(32,'b69ba2aa-96fe-11e8-99ba-8e9c42f3e967',400,'Completed',NULL,NULL,'2018-07-28 13:01:08',NULL,'2018-07-28 13:01:08',NULL),(33,'bd612f02-96fe-11e8-99ba-8e9c42f3e967',500,'Pending for approval',NULL,NULL,'2018-07-28 13:01:11',NULL,'2018-07-28 13:01:11',NULL),(34,'c3914aa6-96fe-11e8-99ba-8e9c42f3e967',600,'Approved',NULL,NULL,'2018-07-28 13:01:15',NULL,'2018-07-28 13:01:15',NULL),(35,'52d68b34-9947-11e8-99ba-8e9c42f3e967',300,'In progress',NULL,NULL,'2018-08-06 09:07:38',NULL,'2018-08-06 09:07:38',NULL),(47,'dee3a4d3-9ba1-11e8-99ba-8e9c42f3e967',350,'Delayed',NULL,NULL,'2018-08-09 09:00:46',NULL,'2018-08-09 09:00:46',NULL),(48,'f27eb37f-9ba1-11e8-99ba-8e9c42f3e967',700,'Rejected',NULL,NULL,'2018-08-09 09:01:17',NULL,'2018-08-09 09:01:17',NULL);
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status_flows`
--

DROP TABLE IF EXISTS `status_flows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status_flows` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status_uuid` varchar(45) NOT NULL,
  `status_uuid1` varchar(45) NOT NULL,
  `creationDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` varchar(255) DEFAULT NULL,
  `modificationDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `modifedBy` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_status_flows_status_uuidx` (`status_uuid`),
  KEY `fk_status_flows_status1_uuidx` (`status_uuid1`),
  CONSTRAINT `fk_status_flows_status` FOREIGN KEY (`status_uuid`) REFERENCES `status` (`uuid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_status_flows_status1` FOREIGN KEY (`status_uuid1`) REFERENCES `status` (`uuid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status_flows`
--

LOCK TABLES `status_flows` WRITE;
/*!40000 ALTER TABLE `status_flows` DISABLE KEYS */;
INSERT INTO `status_flows` VALUES (1,'c7bc99c3-46eb-44a8-8b19-6fff108ece48','b21927a9-96fe-11e8-99ba-8e9c42f3e967','2018-08-09 09:02:25',NULL,'2018-08-09 09:02:25',NULL),(2,'b21927a9-96fe-11e8-99ba-8e9c42f3e967','52d68b34-9947-11e8-99ba-8e9c42f3e967','2018-08-09 09:02:52',NULL,'2018-08-09 09:02:52',NULL),(3,'52d68b34-9947-11e8-99ba-8e9c42f3e967','b69ba2aa-96fe-11e8-99ba-8e9c42f3e967','2018-08-09 09:03:35',NULL,'2018-08-09 09:03:35',NULL),(4,'b69ba2aa-96fe-11e8-99ba-8e9c42f3e967','bd612f02-96fe-11e8-99ba-8e9c42f3e967','2018-08-09 09:04:41',NULL,'2018-08-09 09:04:41',NULL),(5,'bd612f02-96fe-11e8-99ba-8e9c42f3e967','c3914aa6-96fe-11e8-99ba-8e9c42f3e967','2018-08-09 09:04:41',NULL,'2018-08-09 09:04:41',NULL),(6,'bd612f02-96fe-11e8-99ba-8e9c42f3e967','f27eb37f-9ba1-11e8-99ba-8e9c42f3e967','2018-08-09 09:04:41',NULL,'2018-08-09 09:04:41',NULL),(7,'f27eb37f-9ba1-11e8-99ba-8e9c42f3e967','b21927a9-96fe-11e8-99ba-8e9c42f3e967','2018-08-09 09:04:41',NULL,'2018-08-09 09:04:41',NULL),(8,'52d68b34-9947-11e8-99ba-8e9c42f3e967','dee3a4d3-9ba1-11e8-99ba-8e9c42f3e967','2018-08-09 09:26:38',NULL,'2018-08-09 09:26:38',NULL),(9,'dee3a4d3-9ba1-11e8-99ba-8e9c42f3e967','b69ba2aa-96fe-11e8-99ba-8e9c42f3e967','2018-08-09 09:31:32',NULL,'2018-08-09 09:31:32',NULL);
/*!40000 ALTER TABLE `status_flows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(45) NOT NULL,
  `relations_id` int(11) DEFAULT '0',
  `locations_id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `description` varchar(255) NOT NULL,
  `value_sc` double NOT NULL DEFAULT '0',
  `locationDescription` varchar(255) DEFAULT NULL,
  `phonenumber` varchar(45) NOT NULL,
  `email` varchar(255) NOT NULL,
  `startDate` datetime DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  `effort` int(11) NOT NULL DEFAULT '0',
  `creationDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` varchar(255) DEFAULT NULL,
  `modificationDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `json` json DEFAULT NULL,
  `modifiedBy` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid_UNIQUE` (`uuid`),
  KEY `fk_tasks_locations1_idx` (`locations_id`),
  CONSTRAINT `fk_tasks_locations1` FOREIGN KEY (`locations_id`) REFERENCES `locations` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
INSERT INTO `tasks` VALUES (65,'cbccb137-d927-4a5c-807e-0ffe0b86d7b6',260,214,'Gezelschap houden','Initial task',100,NULL,'.','.','2019-01-10 16:21:00','2019-01-05 02:11:00',0,'2018-11-01 13:33:18',NULL,'2019-01-22 11:26:47',NULL,'145.74.104.153'),(66,'50bea706-9d27-45d9-b86d-d723c5c8a9a4',260,215,'Winkelhulp','Initial task',100,NULL,'.','.','2018-12-14 02:11:00','2018-12-22 04:18:00',0,'2018-11-01 13:34:10',NULL,'2018-12-13 15:45:44',NULL,'145.74.104.153'),(67,'83fd8423-bee3-4813-a19e-e71ebef20e6f',260,216,'Park schoonmaken','Initial task',100,NULL,'.','.','2019-04-05 00:00:00','2019-04-12 00:00:00',0,'2018-11-01 13:34:31',NULL,'2019-03-27 20:02:13',NULL,'145.74.104.153'),(68,'d08f961a-a7e3-4ba5-b373-a7184fccba39',260,217,'Scouting klussen','Initial task',100,NULL,'.','.','2019-04-02 12:00:00','2019-04-09 00:00:00',0,'2018-11-01 13:34:46',NULL,'2019-03-27 19:37:55',NULL,'145.74.104.153'),(69,'92707745-1b33-47ae-9476-f2c8c0330f4b',260,218,'Taal ondersteuning','Initial task',100,NULL,'.','.',NULL,NULL,0,'2018-11-01 13:35:00',NULL,'2018-11-01 13:35:00',NULL,NULL),(70,'f376ea35-1a5d-40d2-9b23-3a5fd39b07bf',260,219,'Wilgen knotten','Initial task',100,NULL,'.','.',NULL,NULL,0,'2018-11-01 13:35:13',NULL,'2018-11-01 13:35:13',NULL,NULL),(71,'248cecf9-7c77-43d5-9296-16f599845122',260,221,'Tuin hulp De oude mars','Onder begeleiding helpen in de volkstuin van de oude mars',100,NULL,'.','.','2019-07-01 00:00:00','2019-07-22 00:00:00',0,'2018-11-01 13:35:49',NULL,'2019-07-08 19:44:34',NULL,'145.74.104.153');
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks_with_actions`
--

DROP TABLE IF EXISTS `tasks_with_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tasks_with_actions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tasks_id` int(11) NOT NULL,
  `actions_id` int(11) NOT NULL,
  `creationDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` varchar(255) DEFAULT NULL,
  `modificationDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedBy` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `task_action_uk` (`tasks_id`,`actions_id`),
  KEY `fk_tasks_with_actions_tasks1_idx1` (`tasks_id`),
  KEY `fk_tasks_with_actions_actions1_idx1` (`actions_id`),
  CONSTRAINT `fk_tasks_with_actions_actions1` FOREIGN KEY (`actions_id`) REFERENCES `actions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tasks_with_actions_tasks1` FOREIGN KEY (`tasks_id`) REFERENCES `tasks` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks_with_actions`
--

LOCK TABLES `tasks_with_actions` WRITE;
/*!40000 ALTER TABLE `tasks_with_actions` DISABLE KEYS */;
/*!40000 ALTER TABLE `tasks_with_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks_with_skills`
--

DROP TABLE IF EXISTS `tasks_with_skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tasks_with_skills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `skills_id` int(11) NOT NULL,
  `tasks_id` int(11) NOT NULL,
  `creationDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` varchar(255) DEFAULT NULL,
  `modificationDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedBy` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `skill_task_uk` (`skills_id`,`tasks_id`),
  KEY `fk_tasks_with_skills_skills1_idx` (`skills_id`),
  KEY `fk_tasks_with_skills_tasks1_idx` (`tasks_id`),
  CONSTRAINT `fk_tasks_with_skills_skills1` FOREIGN KEY (`skills_id`) REFERENCES `skills` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tasks_with_skills_tasks1` FOREIGN KEY (`tasks_id`) REFERENCES `tasks` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks_with_skills`
--

LOCK TABLES `tasks_with_skills` WRITE;
/*!40000 ALTER TABLE `tasks_with_skills` DISABLE KEYS */;
/*!40000 ALTER TABLE `tasks_with_skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks_with_status`
--

DROP TABLE IF EXISTS `tasks_with_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tasks_with_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tasks_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  `description` longtext,
  `json` json DEFAULT NULL,
  `creationDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` varchar(255) DEFAULT NULL,
  `modificationDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedBy` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `task_status_uk` (`tasks_id`,`status_id`),
  KEY `fk_actions_with_status_status1_idx` (`status_id`),
  KEY `fk_tasks_with_status_tasks1_idx` (`tasks_id`),
  CONSTRAINT `fk_actions_with_status_status1` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tasks_with_status_tasks1` FOREIGN KEY (`tasks_id`) REFERENCES `tasks` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks_with_status`
--

LOCK TABLES `tasks_with_status` WRITE;
/*!40000 ALTER TABLE `tasks_with_status` DISABLE KEYS */;
INSERT INTO `tasks_with_status` VALUES (65,65,33,NULL,NULL,'2018-11-01 14:33:18','145.74.166.166','2018-11-08 21:28:11','145.74.104.153'),(66,66,30,NULL,NULL,'2018-11-01 14:34:10','145.74.166.166','2018-11-01 14:34:10','145.74.166.166'),(67,67,34,NULL,NULL,'2018-11-01 14:34:30','145.74.166.166','2019-10-28 18:34:10','145.74.104.153'),(68,68,34,NULL,NULL,'2018-11-01 14:34:46','145.74.166.166','2019-07-10 15:36:53','145.74.104.153'),(69,69,30,NULL,NULL,'2018-11-01 14:35:00','145.74.166.166','2018-11-01 14:35:00','145.74.166.166'),(70,70,30,NULL,NULL,'2018-11-01 14:35:13','145.74.166.166','2018-11-01 14:35:13','145.74.166.166'),(71,71,33,NULL,NULL,'2018-11-01 14:35:49','145.74.166.166','2019-07-11 15:06:07','145.74.104.153');
/*!40000 ALTER TABLE `tasks_with_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks_with_teams`
--

DROP TABLE IF EXISTS `tasks_with_teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tasks_with_teams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tasks_id` int(11) NOT NULL,
  `teams_id` int(11) NOT NULL,
  `description` longtext,
  `json` json DEFAULT NULL,
  `creationDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` varchar(255) DEFAULT NULL,
  `modificationDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedBy` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `task_action_uk` (`tasks_id`,`teams_id`),
  KEY `fk_tasks_with_teams_tasks1_idx1` (`tasks_id`),
  KEY `fk_tasks_with_teams_teams1_idx1` (`teams_id`),
  CONSTRAINT `fk_tasks_with_teams_tasks1` FOREIGN KEY (`tasks_id`) REFERENCES `tasks` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tasks_with_teams_teams1` FOREIGN KEY (`teams_id`) REFERENCES `teams` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=433 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks_with_teams`
--

LOCK TABLES `tasks_with_teams` WRITE;
/*!40000 ALTER TABLE `tasks_with_teams` DISABLE KEYS */;
INSERT INTO `tasks_with_teams` VALUES (419,65,72,NULL,NULL,'2019-01-22 10:26:49','145.74.104.153','2019-01-22 10:26:49','145.74.104.153'),(427,68,107,NULL,NULL,'2019-03-27 18:37:56','145.74.104.153','2019-03-27 18:37:56','145.74.104.153'),(428,67,107,NULL,NULL,'2019-03-27 19:02:14','145.74.104.153','2019-03-27 19:02:14','145.74.104.153'),(432,71,107,NULL,NULL,'2019-07-08 17:44:35','145.74.104.153','2019-07-08 17:44:35','145.74.104.153');
/*!40000 ALTER TABLE `tasks_with_teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `description` longtext,
  `json` json DEFAULT NULL,
  `creationDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` varchar(255) DEFAULT NULL,
  `modificationDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedBy` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  UNIQUE KEY `uuid_UNIQUE` (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
INSERT INTO `teams` VALUES (68,'0be9b2e9-b6eb-4a64-84f5-234aed7ad60d','Zwolle Noord',NULL,NULL,'2018-11-01 13:22:07',NULL,'2018-12-19 23:00:00',NULL),(69,'681def27-6538-461d-a254-0923782d87d3','Zwolle Zuid',NULL,NULL,'2018-11-01 13:29:55','145.74.104.153','2018-11-01 13:29:55','145.74.104.153'),(70,'7e0e18e9-ccc7-43d7-864f-7efb6f3813e3','Zwolle Oost',NULL,NULL,'2018-11-01 13:35:32','145.74.104.153','2018-11-01 13:35:32','145.74.104.153'),(71,'a9d0b319-aaf2-404c-9a54-fd8bb23f7b48','Zwolle West',NULL,NULL,'2018-11-01 13:37:26','145.74.104.153','2018-11-01 13:37:26','145.74.104.153'),(72,'b905d831-19a4-4bde-8a27-9eb76ad275f7','Zwolle Midden',NULL,NULL,'2018-11-01 13:39:24','145.74.104.153','2018-11-01 13:39:24','145.74.104.153'),(73,'c4a2f434-51c2-46a7-98f9-9e998e5e5521','teste_team',NULL,NULL,'2018-12-06 14:02:51','145.74.104.153','2018-12-06 14:02:51','145.74.104.153'),(74,'9c8b12c1-9f43-48f8-bc08-78d93c93939e','team_pedro',NULL,NULL,'2018-12-06 15:33:01','145.74.104.153','2018-12-06 15:33:01','145.74.104.153'),(75,'515ec572-11d7-415f-9537-e9b401f6d9ea','Social Teams',NULL,NULL,'2018-12-06 16:03:36','145.74.104.153','2018-12-06 16:03:36','145.74.104.153'),(78,'672b0cfb-c39b-4f79-b01a-3c529e0d6e99','Social Teamsgggg',NULL,NULL,'2018-12-06 16:04:45','145.74.104.153','2018-12-06 16:04:45','145.74.104.153'),(79,'000e587f-9130-45e4-8ee2-eb27716a60ab','Mengão',NULL,NULL,'2018-12-06 16:44:47','145.74.104.153','2018-12-06 16:44:47','145.74.104.153'),(80,'078bed18-e718-47f2-9133-a100e28d0002','Penguin Formula',NULL,NULL,'2018-12-06 16:48:46',NULL,'2018-12-18 23:00:00',NULL),(81,'6bbeb41c-37a9-4167-920e-3c3faab39dca','test_production',NULL,NULL,'2018-12-06 17:00:08','145.74.104.153','2018-12-06 17:00:08','145.74.104.153'),(92,'e362780f-52a2-4c80-a2ff-0d6d5a88e4b3','Test - e362780f-52a2-4c80-a2ff-0d6d5a88e4b3','Created in Team test','{\"updated\": \"Team is updated.\"}','2018-08-25 17:03:37','string','2018-08-25 17:03:37','string'),(93,'e4eaef47-43a7-45ce-8ba4-0ece80748b44','Test - e4eaef47-43a7-45ce-8ba4-0ece80748b44','Created in Team test','{\"updated\": \"Team is updated.\"}','2018-08-25 17:03:37','string','2018-08-25 17:03:37','string'),(94,'8cb2888c-2b8d-4a28-9a87-cb6413ffe095','Test - 8cb2888c-2b8d-4a28-9a87-cb6413ffe095','Created in Team test','{\"updated\": \"Team is updated.\"}','2018-08-25 17:03:37','string','2018-08-25 17:03:37','string'),(95,'8855690e-7769-4601-b78e-31f550750570','Test - 8855690e-7769-4601-b78e-31f550750570','Created in Team test','{\"updated\": \"Team is updated.\"}','2018-08-25 17:03:37','string','2018-08-25 17:03:37','string'),(96,'76be69bc-8cc7-46d4-9ccc-fa763c55a0ae','Test - 76be69bc-8cc7-46d4-9ccc-fa763c55a0ae','Created in Team test','{\"updated\": \"Team is updated.\"}','2018-08-25 17:03:37','string','2018-08-25 17:03:37','string'),(97,'a2c87b03-98c3-4acc-8076-c4be314c4a16','Test - a2c87b03-98c3-4acc-8076-c4be314c4a16','Created in Team test','{\"updated\": \"Team is updated.\"}','2018-08-25 17:03:37','string','2018-08-25 17:03:37','string'),(98,'5bdc8768-ce6f-4a09-a51c-21092303528a','Test - 5bdc8768-ce6f-4a09-a51c-21092303528a','Created in Team test. Partially updated, including relationd and location','{\"updated\": \"Team is updated.\"}','2018-08-25 17:03:37','string','2018-08-25 17:03:37','string'),(99,'b062e066-b31f-4003-8afc-29f7c9e95c95','Test - b062e066-b31f-4003-8afc-29f7c9e95c95','Created in Team test. Partially updated, including relationd and location','{\"updated\": \"Team is updated.\"}','2018-08-25 17:03:37','string','2018-08-25 17:03:37','string'),(100,'036f40cb-32ab-4d3f-aa0c-1048386e35a1','Test - 036f40cb-32ab-4d3f-aa0c-1048386e35a1','Created in Team test. Partially updated, including relationd and location','{\"updated\": \"Team is updated.\"}','2018-08-25 17:03:37','string','2018-08-25 17:03:37','string'),(101,'4a903a4a-901b-42f8-bc83-ff2fadad058a','Test - 4a903a4a-901b-42f8-bc83-ff2fadad058a','Created in Team test. Partially updated, including relationd and location','{\"updated\": \"Team is updated.\"}','2018-08-25 17:03:37','string','2018-08-25 17:03:37','string'),(102,'96949134-1787-47f0-b184-691c98ef7a30','Test - 96949134-1787-47f0-b184-691c98ef7a30','Created in Team test. Partially updated, including relationd and location','{\"updated\": \"Team is updated.\"}','2018-08-25 17:03:37','string','2018-08-25 17:03:37','string'),(103,'a25e159b-fb89-47ee-b034-d0bb461b21e7','Test - a25e159b-fb89-47ee-b034-d0bb461b21e7','Created in Team test','{\"updated\": \"Team is updated.\"}','2018-08-25 17:03:37','string','2018-08-25 17:03:37','string'),(104,'a2924efa-a283-408d-838d-0a2707a095dd','Test - a2924efa-a283-408d-838d-0a2707a095dd','Created in Team test. Partially updated, including relationd and location','{\"updated\": \"Team is updated.\"}','2018-08-25 17:03:37','string','2018-08-25 17:03:37','string'),(105,'bd671a51-3b0a-485d-af4b-a4e7bd5505f8','Test - bd671a51-3b0a-485d-af4b-a4e7bd5505f8','Created in Team test. Partially updated, including relationd and location','{\"updated\": \"Team is updated.\"}','2018-08-25 17:03:37','string','2018-08-25 17:03:37','string'),(107,'e9ce039c-c7dc-4556-b7d9-307703c779cd','TeamDemo1',NULL,NULL,'2019-01-22 11:39:13','145.74.104.153','2019-01-22 11:39:13','145.74.104.153');
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(45) NOT NULL,
  `relations_id` int(11) NOT NULL,
  `tasks_id` int(11) NOT NULL,
  `amount_euro` double NOT NULL DEFAULT '0',
  `amount_sc` double NOT NULL DEFAULT '0',
  `creationDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdBy` varchar(255) DEFAULT NULL,
  `description` longtext,
  `json` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid_UNIQUE` (`uuid`),
  KEY `fk_transactions_relations1_idx` (`relations_id`),
  KEY `fk_transactions_tasks1_idx` (`tasks_id`),
  CONSTRAINT `fk_transactions_relations1` FOREIGN KEY (`relations_id`) REFERENCES `relations` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_transactions_tasks1` FOREIGN KEY (`tasks_id`) REFERENCES `tasks` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (38,'07c9a4a4-cbc0-4155-a155-0a34e641c003',542,68,0,0,'2019-03-27 18:40:15','145.74.104.153',NULL,NULL),(39,'c65bce63-d0ab-48a8-a8ef-378ef06bc791',542,67,0,0,'2019-03-27 19:03:22','145.74.104.153',NULL,NULL),(41,'6a41075b-8e23-4c7d-9879-f63e947c2197',542,71,0,0,'2019-07-08 17:45:54','145.74.104.153',NULL,NULL);
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `participants`
--

/*!50001 DROP VIEW IF EXISTS `participants`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`theotheu`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `participants` AS select `r`.`id` AS `id`,`r`.`locations_id` AS `locations_id`,`r`.`firstname` AS `firstname`,`r`.`prefix` AS `prefix`,`r`.`lastname` AS `lastname`,concat(`r`.`firstname`,' ',`r`.`prefix`,' ',`r`.`lastname`) AS `participant`,`r`.`date_of_birth` AS `date_of_birth`,`r`.`phonenumber` AS `phonenumber`,`r`.`email` AS `email`,`r`.`description` AS `description`,`r`.`username` AS `username`,`r`.`creationDate` AS `creationDate`,`r`.`createdBy` AS `createdBy`,`r`.`modificationDate` AS `modificationDate`,`r`.`modifiedBy` AS `modifiedBy`,`t`.`id` AS `teamId`,`t`.`name` AS `teamName`,(select sum(`debts`.`debt_lc`) from `debts` where (`debts`.`relations_id` = `r`.`id`)) AS `debt` from (((`relations` `r` join `relations_with_roles` `rwr`) left join `relations_with_teams` `rwt` on((`r`.`id` = `rwt`.`relations_id`))) left join `teams` `t` on((`t`.`id` = `rwt`.`teams_id`))) where ((`r`.`id` = `rwr`.`relations_id`) and (`rwr`.`roles_id` = 12)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-17 10:41:07
