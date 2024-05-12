-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `address_id` int NOT NULL AUTO_INCREMENT,
  `city_id` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `postal-code` varchar(45) NOT NULL,
  PRIMARY KEY (`address_id`,`city_id`),
  KEY `city_id_idx` (`city_id`),
  CONSTRAINT `city_id` FOREIGN KEY (`city_id`) REFERENCES `city` (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,1,'82 Leather Ln','2024-03-11 17:53:55','EC1N7TR'),(2,1,'366 Holloway Rd','2024-03-11 17:54:57','N76PA'),(3,3,'154 Great Charles Street Queensway','2024-03-11 17:56:08','B33LP'),(4,3,'653 Alum Rock Rd','2024-03-11 18:00:19','B83NS'),(5,4,'Nadbystrzycka 44a','2024-03-11 18:07:11','20-618'),(6,4,'Lipowa 13','2024-03-11 18:07:51','20-020'),(8,5,'Fryderyka Chopina 5A','2024-03-11 18:10:14','00-559'),(9,5,'Mokotowska 33/35','2024-03-11 18:12:53','00-560'),(10,9,'Unter den Linden 17','2024-03-11 18:17:02','10117'),(11,9,'Friedrichstraße 158','2024-03-11 18:18:41','10124'),(12,11,'Mönckebergstraße 7','2024-03-11 18:19:31','20095'),(13,11,'Jungfernstieg 16','2024-03-11 18:23:53','20354'),(14,12,'Zeil 106','2024-03-11 18:46:50','60313'),(15,11,'Altstädter Str. 4','2024-03-11 18:47:45','20095'),(16,9,'Engeldamm 60','2024-03-11 18:48:20','10179'),(17,5,'6 Narcyzowa','2024-03-11 18:50:13','00-561'),(18,9,'Galluner Str. 33','2024-03-12 20:54:49','12307'),(19,1,'25 Golden square','2024-03-12 20:56:15','EM6L7PY');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `city_id` int NOT NULL AUTO_INCREMENT,
  `country_id` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`city_id`,`country_id`),
  KEY `country_id_idx` (`country_id`),
  CONSTRAINT `country_id` FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,1,'London','2024-03-11 17:43:31'),(2,1,'Manchester','2024-03-11 17:43:39'),(3,1,'Birmingham','2024-03-11 17:43:49'),(4,2,'Lublin','2024-03-11 17:44:15'),(5,2,'Warsaw','2024-03-11 17:44:21'),(6,2,'Krakow','2024-03-11 17:44:31'),(7,2,'Gdansk','2024-03-11 17:44:40'),(8,2,'Wroclaw','2024-03-11 17:44:50'),(9,3,'Berlin','2024-03-11 17:45:08'),(10,3,'Munich','2024-03-11 17:45:13'),(11,3,'Hamburg','2024-03-11 17:45:23'),(12,3,'Frankfurt','2024-03-11 17:45:37');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `client_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `address_id` int DEFAULT NULL,
  PRIMARY KEY (`client_id`,`user_id`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`),
  KEY `user_id_idx` (`user_id`),
  KEY `fk_client_address1_idx` (`address_id`),
  CONSTRAINT `address_id` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`),
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,1,'Alisha','Schwartz','+(048)756234545','2024-02-28 00:03:18',4),(2,2,'Soraya','Hoffman','+(048)756234545','2024-02-29 20:34:15',15),(3,3,'Aminah','Mcdowell','+(048)756234545','2024-03-01 21:13:18',NULL),(4,4,'Brian','Sherman','+(048)756234545','2024-03-02 14:45:18',NULL),(5,5,'Ernest','Campos','+(048)756234545','2024-03-03 16:23:34',5);
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country` (
  `country_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`country_id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'England','2024-03-11 17:41:22'),(2,'Poland','2024-03-11 17:41:33'),(3,'Germany','2024-03-11 17:41:38'),(4,'USA','2024-04-17 10:26:05');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country_has_language`
--

DROP TABLE IF EXISTS `country_has_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country_has_language` (
  `country_country_id` int NOT NULL,
  `language_language_id` int NOT NULL,
  PRIMARY KEY (`country_country_id`,`language_language_id`),
  KEY `fk_country_has_language_language1_idx` (`language_language_id`),
  KEY `fk_country_has_language_country1_idx` (`country_country_id`),
  CONSTRAINT `fk_country_has_language_country1` FOREIGN KEY (`country_country_id`) REFERENCES `country` (`country_id`),
  CONSTRAINT `fk_country_has_language_language1` FOREIGN KEY (`language_language_id`) REFERENCES `language` (`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country_has_language`
--

LOCK TABLES `country_has_language` WRITE;
/*!40000 ALTER TABLE `country_has_language` DISABLE KEYS */;
INSERT INTO `country_has_language` VALUES (1,1),(2,1),(3,1),(2,2),(3,3);
/*!40000 ALTER TABLE `country_has_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery`
--

DROP TABLE IF EXISTS `delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery` (
  `delivery_id` int NOT NULL AUTO_INCREMENT,
  `delivery_method` varchar(45) NOT NULL,
  `delivery_status` tinyint NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `address_id` int NOT NULL,
  `orders_id` int NOT NULL,
  PRIMARY KEY (`delivery_id`,`address_id`,`orders_id`),
  KEY `fk_delivery_address1_idx` (`address_id`),
  KEY `fk_orders_id_idx` (`orders_id`),
  KEY `orders_id_idx` (`orders_id`),
  CONSTRAINT `fk_delivery_address1` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`),
  CONSTRAINT `orders_id` FOREIGN KEY (`orders_id`) REFERENCES `orders` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery`
--

LOCK TABLES `delivery` WRITE;
/*!40000 ALTER TABLE `delivery` DISABLE KEYS */;
INSERT INTO `delivery` VALUES (1,'Self-Delivery',1,'2024-03-11 18:50:26','2024-03-11 18:50:26',4,1),(2,'Company-Delivery',1,'2024-03-11 18:57:32','2024-03-11 18:57:32',5,2),(3,'Self-Delivery',0,'2024-03-11 18:57:53','2024-03-11 18:57:53',8,3),(4,'Self-Delivery',0,'2024-03-11 18:58:09','2024-03-11 18:58:09',16,4);
/*!40000 ALTER TABLE `delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredient`
--

DROP TABLE IF EXISTS `ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredient` (
  `ingredient_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ingredient_id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredient`
--

LOCK TABLES `ingredient` WRITE;
/*!40000 ALTER TABLE `ingredient` DISABLE KEYS */;
INSERT INTO `ingredient` VALUES (1,'Beef','2024-03-12 23:39:48'),(2,'Turkey','2024-03-12 23:41:14'),(3,'Chicken','2024-03-12 23:41:30'),(4,'Classic sesame seed buns','2024-03-12 23:41:53'),(5,'Whole whea buns','2024-03-12 23:42:07'),(6,'Brioche','2024-03-12 23:42:23'),(7,'Lettuce','2024-03-12 23:42:41'),(8,'Romaine','2024-03-12 23:42:56'),(9,'Iceberg','2024-03-12 23:43:10'),(10,'Tomato','2024-03-12 23:43:30'),(11,'Onion','2024-03-12 23:43:56'),(12,'Cheddar','2024-03-12 23:44:12'),(13,'Swiss','2024-03-12 23:44:21'),(14,'Pickles','2024-03-12 23:44:32'),(15,'Ketchup','2024-03-12 23:44:46'),(16,'Mustard','2024-03-12 23:45:00'),(17,'Mayonnaise','2024-03-12 23:45:21'),(18,'BBQ sauce','2024-03-12 23:45:30'),(19,'Bacon','2024-03-12 23:45:44'),(20,'Fried egg','2024-03-12 23:46:01'),(21,'Tea','2024-03-12 23:50:59'),(22,'Coffee','2024-03-12 23:52:10'),(23,'Milk','2024-03-12 23:53:34'),(24,'Orange Juice','2024-03-12 23:57:27'),(25,'Apple Juice','2024-03-12 23:57:51'),(26,'Pepsi cola','2024-03-12 23:58:43'),(27,'Coca cola','2024-03-12 23:58:54'),(28,'Fries','2024-03-13 00:09:22'),(29,'Apple slices','2024-03-13 00:09:44');
/*!40000 ALTER TABLE `ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language`
--

DROP TABLE IF EXISTS `language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `language` (
  `language_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`language_id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language`
--

LOCK TABLES `language` WRITE;
/*!40000 ALTER TABLE `language` DISABLE KEYS */;
INSERT INTO `language` VALUES (1,'English','2024-03-11 17:46:26'),(2,'Polish','2024-03-11 17:46:33'),(3,'German','2024-03-11 17:46:42');
/*!40000 ALTER TABLE `language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `menu_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`menu_id`),
  UNIQUE KEY `menu_name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'Main-menu','2024-03-12 23:48:25');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menucategory`
--

DROP TABLE IF EXISTS `menucategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menucategory` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `menu_id` int NOT NULL,
  `name` varchar(32) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_name_UNIQUE` (`name`),
  KEY `menu_id_idx` (`menu_id`),
  CONSTRAINT `menu_id` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menucategory`
--

LOCK TABLES `menucategory` WRITE;
/*!40000 ALTER TABLE `menucategory` DISABLE KEYS */;
INSERT INTO `menucategory` VALUES (1,1,'Burgers','2024-03-13 00:03:38'),(2,1,'Breakfast','2024-03-13 00:07:53'),(3,1,'Beverages','2024-03-13 00:08:33'),(4,1,'Fries & Sides','2024-03-13 00:10:14'),(5,1,'Cofees','2024-03-20 12:32:57'),(6,1,'Salads','2024-03-20 12:35:19');
/*!40000 ALTER TABLE `menucategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menucategory_has_menuitem`
--

DROP TABLE IF EXISTS `menucategory_has_menuitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menucategory_has_menuitem` (
  `menuCategory_category_id` int NOT NULL,
  `menuItem_menu_item_id` int NOT NULL,
  PRIMARY KEY (`menuCategory_category_id`,`menuItem_menu_item_id`),
  KEY `fk_menuCategory_has_menuItem_menuCategory1_idx` (`menuCategory_category_id`),
  KEY `fk_menuItem_menu_item_id_idx` (`menuItem_menu_item_id`),
  CONSTRAINT `fk_menuCategory_category_id` FOREIGN KEY (`menuCategory_category_id`) REFERENCES `menucategory` (`category_id`),
  CONSTRAINT `fk_menuItem_menu_item_id_1` FOREIGN KEY (`menuItem_menu_item_id`) REFERENCES `menuitem` (`menu_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menucategory_has_menuitem`
--

LOCK TABLES `menucategory_has_menuitem` WRITE;
/*!40000 ALTER TABLE `menucategory_has_menuitem` DISABLE KEYS */;
INSERT INTO `menucategory_has_menuitem` VALUES (1,1),(1,2),(1,4),(1,5),(1,6),(3,7),(3,8),(3,13),(3,14),(3,15),(3,16),(4,17),(4,18),(4,19),(4,20),(5,9),(5,10),(5,11),(5,12),(6,3);
/*!40000 ALTER TABLE `menucategory_has_menuitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menuitem`
--

DROP TABLE IF EXISTS `menuitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menuitem` (
  `menu_item_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `price` float NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`menu_item_id`),
  UNIQUE KEY `product_name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menuitem`
--

LOCK TABLES `menuitem` WRITE;
/*!40000 ALTER TABLE `menuitem` DISABLE KEYS */;
INSERT INTO `menuitem` VALUES (1,'Classic Cheeseburger',2.5,'2024-03-13 09:52:16','2024-03-13 09:52:16'),(2,'Chicken Club Burger',3,'2024-03-13 09:53:44','2024-03-13 09:53:44'),(3,'Grilled Chicken Salad',8.99,'2024-03-20 12:20:37','2024-03-20 12:20:37'),(4,'Chicken BBQ Burger',4,'2024-03-13 09:55:27','2024-03-13 09:55:27'),(5,'Turkey&Bacon Burger',4,'2024-03-13 09:56:14','2024-03-13 09:56:14'),(6,'Hamburger',2,'2024-03-13 09:57:02','2024-03-13 09:57:02'),(7,'Tea',1.49,'2024-03-13 09:58:21','2024-03-13 09:58:21'),(8,'Iced Tea',1.99,'2024-03-13 09:58:37','2024-03-13 09:58:37'),(9,'Espresso',2.49,'2024-03-13 09:59:00','2024-03-13 09:59:00'),(10,'Cappuccino',3.49,'2024-03-13 10:00:53','2024-03-13 10:00:53'),(11,'Latte',4,'2024-03-13 10:01:21','2024-03-13 10:01:21'),(12,'Iced Coffee',2.99,'2024-03-13 10:01:38','2024-03-13 10:01:38'),(13,'Orange Juice',2.49,'2024-03-13 10:01:57','2024-03-13 10:01:57'),(14,'Apple Juice',2.49,'2024-03-13 10:02:08','2024-03-13 10:02:08'),(15,'Pepsi Cola',1.49,'2024-03-13 10:02:22','2024-03-13 10:02:22'),(16,'Coca Cola',1.49,'2024-03-13 10:02:35','2024-03-13 10:02:35'),(17,'Fries small',1.99,'2024-03-13 10:02:56','2024-03-13 10:02:56'),(18,'Fries medium',2.49,'2024-03-13 10:03:13','2024-03-13 10:03:13'),(19,'Fries large',3,'2024-03-13 10:03:31','2024-03-13 10:03:31'),(20,'Apple Slices',1.29,'2024-03-13 10:03:46','2024-03-13 10:03:46');
/*!40000 ALTER TABLE `menuitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menuitem_has_ingredient`
--

DROP TABLE IF EXISTS `menuitem_has_ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menuitem_has_ingredient` (
  `ingredient_ingredient_id` int NOT NULL,
  `menuItem_menu_item_id` int NOT NULL,
  PRIMARY KEY (`ingredient_ingredient_id`,`menuItem_menu_item_id`),
  KEY `fk_ingredient_ingredient_id_idx` (`ingredient_ingredient_id`),
  KEY `fk_menuItem_menu_item_id_idx` (`menuItem_menu_item_id`),
  CONSTRAINT `fk_ingredient_ingredient_id` FOREIGN KEY (`ingredient_ingredient_id`) REFERENCES `ingredient` (`ingredient_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_menuItem_menu_item_id` FOREIGN KEY (`menuItem_menu_item_id`) REFERENCES `menuitem` (`menu_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menuitem_has_ingredient`
--

LOCK TABLES `menuitem_has_ingredient` WRITE;
/*!40000 ALTER TABLE `menuitem_has_ingredient` DISABLE KEYS */;
INSERT INTO `menuitem_has_ingredient` VALUES (1,1),(1,6),(2,5),(3,2),(3,3),(3,4),(4,1),(4,6),(5,4),(6,2),(6,5),(7,1),(7,3),(7,4),(7,5),(8,3),(9,2),(10,1),(10,2),(10,3),(10,4),(10,5),(11,1),(11,3),(11,4),(11,5),(11,6),(12,1),(12,2),(12,4),(13,2),(13,5),(14,1),(14,6),(15,1),(15,2),(15,6),(16,1),(16,2),(16,6),(17,1),(17,2),(17,3),(17,5),(18,4),(19,2),(21,7),(21,8),(22,9),(22,10),(22,11),(22,12),(23,10),(23,11),(24,13),(25,14),(26,15),(27,16),(28,17),(28,18),(28,19),(29,20);
/*!40000 ALTER TABLE `menuitem_has_ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderitem`
--

DROP TABLE IF EXISTS `orderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderitem` (
  `order_item_id` int NOT NULL AUTO_INCREMENT,
  `topping_id` int DEFAULT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `menu_item_id` int DEFAULT NULL,
  `specialoffer_id` int DEFAULT NULL,
  PRIMARY KEY (`order_item_id`),
  KEY `topping_id_idx` (`topping_id`),
  KEY `menu_item_id_idx` (`menu_item_id`),
  KEY `specialoffer_id_idx` (`specialoffer_id`),
  CONSTRAINT `menu_item_id` FOREIGN KEY (`menu_item_id`) REFERENCES `menuitem` (`menu_item_id`),
  CONSTRAINT `specialoffer_id` FOREIGN KEY (`specialoffer_id`) REFERENCES `specialoffer` (`offer_id`),
  CONSTRAINT `topping_id` FOREIGN KEY (`topping_id`) REFERENCES `topping` (`topping_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderitem`
--

LOCK TABLES `orderitem` WRITE;
/*!40000 ALTER TABLE `orderitem` DISABLE KEYS */;
INSERT INTO `orderitem` VALUES (1,1,'2024-03-22 16:21:10',1,NULL),(2,3,'2024-03-22 16:22:00',2,NULL),(3,3,'2024-03-22 16:22:21',3,NULL),(4,2,'2024-03-22 16:22:44',6,NULL),(5,NULL,'2024-03-22 16:23:09',7,NULL),(6,NULL,'2024-03-22 16:23:14',9,NULL),(7,NULL,'2024-03-22 16:23:25',15,NULL),(8,NULL,'2024-03-22 16:23:30',16,NULL),(9,NULL,'2024-03-22 16:23:39',11,NULL),(10,NULL,'2024-03-22 16:23:47',17,NULL),(11,NULL,'2024-03-22 16:23:51',18,NULL),(12,NULL,'2024-03-22 16:23:54',19,NULL),(13,NULL,'2024-03-22 16:24:16',13,NULL),(14,NULL,'2024-03-22 16:24:20',14,NULL),(15,NULL,'2024-03-22 16:25:40',5,NULL),(16,NULL,'2024-03-22 16:25:46',1,NULL),(17,NULL,'2024-03-22 16:25:50',2,NULL),(18,NULL,'2024-03-22 16:25:54',3,NULL),(19,NULL,'2024-03-22 16:25:58',4,NULL),(20,NULL,'2024-03-22 16:28:48',NULL,1),(21,NULL,'2024-03-22 16:28:52',NULL,2),(22,NULL,'2024-03-22 16:29:15',NULL,3),(23,NULL,'2024-03-22 16:29:20',NULL,4);
/*!40000 ALTER TABLE `orderitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `client_id` int NOT NULL,
  `restaurant_id` int NOT NULL,
  `worker_id` int NOT NULL,
  `eating_inside` tinyint NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `address_id` int NOT NULL,
  PRIMARY KEY (`order_id`,`restaurant_id`,`client_id`,`worker_id`),
  KEY `client_id_idx` (`client_id`),
  KEY `restaurant_id_idx` (`restaurant_id`),
  KEY `worker_id_idx` (`worker_id`),
  KEY `address_id_idx` (`address_id`),
  CONSTRAINT `address_id_order` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`),
  CONSTRAINT `client_id` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`),
  CONSTRAINT `restaurant_id` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`restaurant_id`),
  CONSTRAINT `worker_id` FOREIGN KEY (`worker_id`) REFERENCES `worker` (`worker_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,7,2,0,'2024-03-24 16:59:51','2024-03-24 16:59:51',13),(2,3,3,7,0,'2024-03-24 17:10:07','2024-03-24 17:10:07',6),(3,2,4,1,0,'2024-03-24 17:12:01','2024-03-24 17:12:01',9),(4,5,6,5,0,'2024-03-24 17:13:55','2024-03-24 17:13:55',11),(5,4,1,6,1,'2024-03-24 17:19:49','2024-03-24 17:19:49',1),(6,1,3,7,1,'2024-03-24 17:21:43','2024-03-24 17:21:43',6),(7,2,7,2,1,'2024-03-24 17:23:00','2024-03-24 17:23:00',13),(8,3,7,2,0,'2024-03-24 17:24:25','2024-03-24 17:24:25',13),(9,5,6,5,1,'2024-03-24 17:25:13','2024-03-24 17:25:13',11);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_has_ordersitem`
--

DROP TABLE IF EXISTS `orders_has_ordersitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_has_ordersitem` (
  `orders_orders_id` int NOT NULL,
  `ordersitem_ordersitem_id` int NOT NULL,
  `number` int NOT NULL,
  PRIMARY KEY (`orders_orders_id`,`ordersitem_ordersitem_id`),
  KEY `fk_ordersitem_ordersitem_id_idx` (`ordersitem_ordersitem_id`),
  CONSTRAINT `fk_orders_orders_id` FOREIGN KEY (`orders_orders_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ordersitem_ordersitem_id` FOREIGN KEY (`ordersitem_ordersitem_id`) REFERENCES `orderitem` (`order_item_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_has_ordersitem`
--

LOCK TABLES `orders_has_ordersitem` WRITE;
/*!40000 ALTER TABLE `orders_has_ordersitem` DISABLE KEYS */;
INSERT INTO `orders_has_ordersitem` VALUES (1,2,1),(1,8,1),(1,10,1),(2,11,1),(2,14,1),(2,15,1),(3,4,1),(3,8,1),(3,10,1),(3,19,1),(4,1,1),(4,9,1),(4,13,1),(4,20,1),(5,7,1),(5,10,1),(5,15,1),(6,4,1),(6,19,1),(7,2,1),(7,9,1),(7,11,1),(8,3,1),(8,6,1),(8,13,1),(8,14,1),(9,1,1),(9,5,1),(9,8,1);
/*!40000 ALTER TABLE `orders_has_ordersitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `payment_method` varchar(45) NOT NULL,
  `payment_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `amount` float NOT NULL,
  `orders_id` int NOT NULL,
  PRIMARY KEY (`payment_id`,`orders_id`),
  KEY `fk_order_id_idx` (`orders_id`),
  CONSTRAINT `fk_order_id` FOREIGN KEY (`orders_id`) REFERENCES `orders` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,'Cash','2024-03-22 16:43:57',7.98,9),(2,'Credit Card','2024-03-22 16:44:18',16.46,8),(3,'Cash','2024-03-22 16:44:35',13.49,7),(4,'Cash','2024-03-22 16:44:51',6,6),(5,'Credit Card','2024-03-22 16:45:06',9.98,5),(6,'BLIK','2024-03-24 16:16:13',11.98,4),(7,'Credit Card','2024-03-24 16:20:37',8.49,3),(8,'BLIK','2024-03-24 16:25:40',7.48,2),(9,'BLIK','2024-03-24 16:30:46',6.48,1);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant`
--

DROP TABLE IF EXISTS `restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant` (
  `restaurant_id` int NOT NULL AUTO_INCREMENT,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `address_id` int NOT NULL,
  PRIMARY KEY (`restaurant_id`),
  KEY `fk_restaurant_address1_idx` (`address_id`),
  CONSTRAINT `fk_restaurant_address1` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant`
--

LOCK TABLES `restaurant` WRITE;
/*!40000 ALTER TABLE `restaurant` DISABLE KEYS */;
INSERT INTO `restaurant` VALUES (1,'2024-03-22 11:08:26',1),(2,'2024-03-22 11:09:27',2),(3,'2024-03-22 11:21:06',6),(4,'2024-03-22 11:21:11',9),(5,'2024-03-22 11:21:16',10),(6,'2024-03-22 11:21:29',11),(7,'2024-03-22 11:21:35',13);
/*!40000 ALTER TABLE `restaurant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant_has_specialoffer`
--

DROP TABLE IF EXISTS `restaurant_has_specialoffer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant_has_specialoffer` (
  `restaurant_restaurant_id` int NOT NULL,
  `specialOffer_offer_id` int NOT NULL,
  PRIMARY KEY (`restaurant_restaurant_id`,`specialOffer_offer_id`),
  KEY `fk_restaurant_has_specialOffer_specialOffer1_idx` (`specialOffer_offer_id`),
  KEY `fk_restaurant_has_specialOffer_restaurant1_idx` (`restaurant_restaurant_id`),
  CONSTRAINT `fk_restaurant_has_specialOffer_restaurant1` FOREIGN KEY (`restaurant_restaurant_id`) REFERENCES `restaurant` (`restaurant_id`),
  CONSTRAINT `fk_restaurant_has_specialOffer_specialOffer1` FOREIGN KEY (`specialOffer_offer_id`) REFERENCES `specialoffer` (`offer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant_has_specialoffer`
--

LOCK TABLES `restaurant_has_specialoffer` WRITE;
/*!40000 ALTER TABLE `restaurant_has_specialoffer` DISABLE KEYS */;
INSERT INTO `restaurant_has_specialoffer` VALUES (3,1),(6,1),(7,1),(1,2),(2,2),(3,2),(4,2),(7,2),(2,3),(7,3),(1,4),(2,4),(5,4),(6,4),(7,4);
/*!40000 ALTER TABLE `restaurant_has_specialoffer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant_has_warehouse`
--

DROP TABLE IF EXISTS `restaurant_has_warehouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant_has_warehouse` (
  `restaurant_restaurant_id` int NOT NULL,
  `warehouse_warehouse_id` int NOT NULL,
  PRIMARY KEY (`restaurant_restaurant_id`,`warehouse_warehouse_id`),
  KEY `fk_restaurant_has_warehouse_warehouse1_idx` (`warehouse_warehouse_id`),
  KEY `fk_restaurant_has_warehouse_restaurant1_idx` (`restaurant_restaurant_id`),
  CONSTRAINT `fk_restaurant_has_warehouse_restaurant1` FOREIGN KEY (`restaurant_restaurant_id`) REFERENCES `restaurant` (`restaurant_id`),
  CONSTRAINT `fk_restaurant_has_warehouse_warehouse1` FOREIGN KEY (`warehouse_warehouse_id`) REFERENCES `warehouse` (`warehouse_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant_has_warehouse`
--

LOCK TABLES `restaurant_has_warehouse` WRITE;
/*!40000 ALTER TABLE `restaurant_has_warehouse` DISABLE KEYS */;
INSERT INTO `restaurant_has_warehouse` VALUES (1,1),(4,1),(3,2),(5,3),(6,3),(7,3),(2,4);
/*!40000 ALTER TABLE `restaurant_has_warehouse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specialoffer`
--

DROP TABLE IF EXISTS `specialoffer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `specialoffer` (
  `offer_id` int NOT NULL AUTO_INCREMENT,
  `offer_price` float NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`offer_id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specialoffer`
--

LOCK TABLES `specialoffer` WRITE;
/*!40000 ALTER TABLE `specialoffer` DISABLE KEYS */;
INSERT INTO `specialoffer` VALUES (1,5.99,'2024-03-22 10:02:07','2024-03-22 10:02:07','Classic Cheeseburger Combo'),(2,6.99,'2024-03-22 11:24:01','2024-03-22 11:24:01','Chicken Club Burger Combo'),(3,4.59,'2024-03-22 11:24:24','2024-03-22 11:24:24','Coffee Lovers\' Deal'),(4,4.99,'2024-03-22 11:24:45','2024-03-22 11:24:45','Happy Meal');
/*!40000 ALTER TABLE `specialoffer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specialoffer_has_menuitem`
--

DROP TABLE IF EXISTS `specialoffer_has_menuitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `specialoffer_has_menuitem` (
  `specialOffer_offer_id` int NOT NULL,
  `menuItem_menu_item_id` int NOT NULL,
  PRIMARY KEY (`specialOffer_offer_id`,`menuItem_menu_item_id`),
  KEY `fk_specialOffer_has_menuItem_specialOffer1_idx` (`specialOffer_offer_id`),
  KEY `menuItem_menu_item_id_idx` (`menuItem_menu_item_id`),
  CONSTRAINT `fk_specialOffer_has_menuItem_specialOffer1` FOREIGN KEY (`specialOffer_offer_id`) REFERENCES `specialoffer` (`offer_id`),
  CONSTRAINT `menuItem_menu_item_id` FOREIGN KEY (`menuItem_menu_item_id`) REFERENCES `menuitem` (`menu_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specialoffer_has_menuitem`
--

LOCK TABLES `specialoffer_has_menuitem` WRITE;
/*!40000 ALTER TABLE `specialoffer_has_menuitem` DISABLE KEYS */;
INSERT INTO `specialoffer_has_menuitem` VALUES (1,1),(1,16),(1,17),(2,2),(2,8),(2,18),(3,9),(3,10),(4,6),(4,13),(4,20);
/*!40000 ALTER TABLE `specialoffer_has_menuitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topping`
--

DROP TABLE IF EXISTS `topping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `topping` (
  `topping_id` int NOT NULL AUTO_INCREMENT,
  `topping_price` float NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ingredient_id` int NOT NULL,
  PRIMARY KEY (`topping_id`,`ingredient_id`),
  KEY `fk_topping_ingredient1_idx` (`ingredient_id`),
  CONSTRAINT `fk_topping_ingredient1` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredient` (`ingredient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topping`
--

LOCK TABLES `topping` WRITE;
/*!40000 ALTER TABLE `topping` DISABLE KEYS */;
INSERT INTO `topping` VALUES (1,0.2,'2024-03-22 09:51:35',7),(2,0.2,'2024-03-22 09:52:06',8),(3,0.2,'2024-03-22 09:52:11',9),(4,0.15,'2024-03-22 09:54:07',10),(5,0.1,'2024-03-22 09:54:15',11),(6,0.2,'2024-03-22 09:54:34',12),(7,0.1,'2024-03-22 09:54:59',14);
/*!40000 ALTER TABLE `topping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(20) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'LostAndFound','lostafound@gmail.com','4325f0rgiven1997','2024-02-28 00:03:18'),(2,'BottleCream','creamcheese@gmail.com','foodISlove@19','2024-02-29 20:34:15'),(3,'TallulahMusician','tallulahoff@gmail.com','no_father2024@1','2024-03-01 21:13:18'),(4,'minecraft1234','imminecraft@gmail.com','min333cr4ft','2024-03-02 14:45:18'),(5,'pavelWhereFrom','pavelfromengland@gmail.com','GlasgowUnhappy!324','2024-03-03 16:23:34'),(6,'KaanSalt','kaan.stewart@gmail.com','salt_slate90283@','2024-03-04 03:03:18'),(7,'ShaniceNo','shanice.noble@gmail.com','sh4an1c3','2024-03-06 06:34:18'),(8,'AlecNotMusician','alec.ruiz@gmail.com','guitar324@broken_sad','2024-03-07 17:03:18'),(10,'DarkDruid','druidfromdungeon@gmail.com','Magic_1982!','2024-03-09 11:54:18'),(11,'RomanEmo','romanempire78@gmail.com','my32roman@empire','2024-03-09 06:03:12'),(12,'Harun69','harunnnnn@gmail.com','harun3245is3289there','2024-03-10 00:03:18'),(13,'MacFoodmee','spareemail97@gmail.com','mac3food2006','2024-03-20 16:32:18'),(14,'MazeDungeon','notmazerunner@gmail.com','m2m4m5aze@1','2024-03-12 05:35:05');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warehouse`
--

DROP TABLE IF EXISTS `warehouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `warehouse` (
  `warehouse_id` int NOT NULL AUTO_INCREMENT,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `address_id` int NOT NULL,
  PRIMARY KEY (`warehouse_id`),
  KEY `fk_warehouse_address1_idx` (`address_id`),
  CONSTRAINT `fk_warehouse_address1` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehouse`
--

LOCK TABLES `warehouse` WRITE;
/*!40000 ALTER TABLE `warehouse` DISABLE KEYS */;
INSERT INTO `warehouse` VALUES (1,'2024-03-22 15:48:38',6),(2,'2024-03-22 15:52:04',17),(3,'2024-03-22 15:53:55',18),(4,'2024-03-22 15:54:35',19);
/*!40000 ALTER TABLE `warehouse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warehouse_has_ingredient`
--

DROP TABLE IF EXISTS `warehouse_has_ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `warehouse_has_ingredient` (
  `warehouse_warehouse_id` int NOT NULL,
  `ingredient_ingredient_id` int NOT NULL,
  `number` int NOT NULL,
  PRIMARY KEY (`warehouse_warehouse_id`,`ingredient_ingredient_id`),
  KEY `fk_warehouse_has_ingredient_ingredient1_idx` (`ingredient_ingredient_id`),
  KEY `fk_warehouse_has_ingredient_warehouse1_idx` (`warehouse_warehouse_id`),
  CONSTRAINT `fk_warehouse_has_ingredient_ingredient1` FOREIGN KEY (`ingredient_ingredient_id`) REFERENCES `ingredient` (`ingredient_id`),
  CONSTRAINT `fk_warehouse_has_ingredient_warehouse1` FOREIGN KEY (`warehouse_warehouse_id`) REFERENCES `warehouse` (`warehouse_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehouse_has_ingredient`
--

LOCK TABLES `warehouse_has_ingredient` WRITE;
/*!40000 ALTER TABLE `warehouse_has_ingredient` DISABLE KEYS */;
INSERT INTO `warehouse_has_ingredient` VALUES (1,1,100),(1,2,500),(1,4,257),(1,5,236),(1,6,25),(1,9,147),(1,12,136),(1,15,36),(1,19,87),(1,28,54),(1,29,369),(2,1,147),(2,2,269),(2,3,357),(2,5,698),(2,6,125),(2,7,369),(2,8,88),(2,9,475),(2,10,345),(2,11,222),(2,12,64),(2,13,250),(3,13,146),(3,14,230),(3,15,96),(3,16,83),(3,17,246),(3,18,369),(3,19,72),(3,20,73),(3,21,71),(3,22,69),(3,23,96),(3,24,357),(3,25,369),(3,26,124);
/*!40000 ALTER TABLE `warehouse_has_ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `worker`
--

DROP TABLE IF EXISTS `worker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `worker` (
  `worker_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `position` varchar(45) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int NOT NULL,
  `restaurant_id` int NOT NULL,
  PRIMARY KEY (`worker_id`,`user_id`),
  UNIQUE KEY `phone_UNIQUE` (`phone`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`),
  KEY `fk_worker_user1_idx` (`user_id`),
  KEY `fk_worker_restaurant1_idx` (`restaurant_id`),
  CONSTRAINT `fk_worker_restaurant1` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`restaurant_id`),
  CONSTRAINT `fk_worker_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `worker`
--

LOCK TABLES `worker` WRITE;
/*!40000 ALTER TABLE `worker` DISABLE KEYS */;
INSERT INTO `worker` VALUES (1,'Dan','Brown','Manager','(248)156874325','2024-03-12 05:31:05',6,4),(2,'Yasin','Patrick','Cashier','(048)146234577','2024-03-06 06:34:18',7,7),(3,'Emma','Mckenzie','Cook','(048)756234545','2024-03-07 17:03:18',8,2),(5,'Neha','Connor','Cashier','(380)696114545','2024-03-09 11:54:18',10,6),(6,'Harry','Clay','Cashier','(017)758234545','2024-03-09 06:03:12',11,1),(7,'Eric','Caldwell','Cashier','(048)732234561','2024-03-10 00:03:18',12,3),(8,'Betty','Rush','Cook','(048)776234123','2024-03-20 16:32:18',13,2),(9,'Dean','Hughes','Cashier','(056)156334545','2024-03-12 05:35:05',14,5);
/*!40000 ALTER TABLE `worker` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-12 17:20:34
