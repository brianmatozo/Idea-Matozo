CREATE DATABASE  IF NOT EXISTS `idea_matozo` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `idea_matozo`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: idea_matozo
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Temporary view structure for view `cart_view`
--

DROP TABLE IF EXISTS `cart_view`;
/*!50001 DROP VIEW IF EXISTS `cart_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `cart_view` AS SELECT 
 1 AS `cart_id`,
 1 AS `customer_id`,
 1 AS `total_amount`,
 1 AS `promotion_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Panificados'),(2,'Legumbres'),(3,'Leches'),(4,'Jugos'),(5,'Bebidas Alcoholicas'),(6,'Frutos Secos'),(7,'Frutos Rojos'),(8,'Frutas'),(9,'Alfajores'),(10,'Barritas'),(11,'Limpieza'),(12,'Belleza');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_cart`
--

DROP TABLE IF EXISTS `customer_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_cart` (
  `cart_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int DEFAULT NULL,
  `order_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `total_amount` decimal(10,2) DEFAULT NULL,
  `status` enum('Pending','Shipped','Delivered') DEFAULT 'Pending',
  `shipping_address` varchar(255) DEFAULT NULL,
  `payment_method_id` int DEFAULT NULL,
  `promotion_id` int DEFAULT NULL,
  PRIMARY KEY (`cart_id`),
  KEY `customer_id` (`customer_id`),
  KEY `payment_method_id` (`payment_method_id`),
  KEY `promotion_id` (`promotion_id`),
  CONSTRAINT `customer_cart_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  CONSTRAINT `customer_cart_ibfk_2` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`payment_method_id`),
  CONSTRAINT `customer_cart_ibfk_3` FOREIGN KEY (`promotion_id`) REFERENCES `promotions` (`promotion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_cart`
--

LOCK TABLES `customer_cart` WRITE;
/*!40000 ALTER TABLE `customer_cart` DISABLE KEYS */;
INSERT INTO `customer_cart` VALUES (1,23,'2024-02-22 03:38:11',261996.84,'Shipped',NULL,5,3),(2,14,'2024-02-22 03:38:11',2162916.53,'Shipped',NULL,9,1),(3,13,'2024-02-22 03:38:11',NULL,'Delivered',NULL,1,NULL),(4,17,'2024-02-22 03:38:11',1576032.85,'Pending',NULL,5,1),(5,14,'2024-02-22 03:38:11',4467334.07,'Shipped',NULL,2,1),(6,28,'2024-02-22 03:38:11',5003730.78,'Shipped',NULL,3,1),(7,12,'2024-02-22 03:38:11',NULL,'Delivered',NULL,3,NULL),(8,5,'2024-02-22 03:38:11',1261448.16,'Shipped',NULL,5,1),(9,10,'2024-02-22 03:38:11',515868.30,'Shipped',NULL,3,2),(10,11,'2024-02-22 03:38:11',621550.41,'Pending',NULL,6,2),(11,29,'2024-02-22 03:38:11',664733.09,'Shipped',NULL,6,2),(12,21,'2024-02-22 03:38:11',221742.60,'Delivered',NULL,3,3),(13,15,'2024-02-22 03:38:11',3361178.88,'Pending',NULL,2,1),(14,14,'2024-02-22 03:38:11',1535704.80,'Shipped',NULL,3,1),(15,5,'2024-02-22 03:38:11',293030.58,'Delivered',NULL,7,3),(16,3,'2024-02-22 03:38:11',752405.83,'Pending',NULL,2,2),(17,16,'2024-02-22 03:38:11',1179784.14,'Shipped',NULL,5,1),(18,29,'2024-02-22 03:38:11',2657594.49,'Shipped',NULL,8,1),(19,18,'2024-02-22 03:38:11',3215591.72,'Delivered',NULL,7,1),(20,4,'2024-02-22 03:38:11',3097000.22,'Delivered',NULL,8,1),(21,28,'2024-02-22 03:38:11',1933264.74,'Shipped',NULL,8,1),(22,5,'2024-02-22 03:38:11',1713289.07,'Shipped',NULL,3,1),(23,29,'2024-02-22 03:38:11',2405441.18,'Delivered',NULL,7,1),(24,10,'2024-02-22 03:38:11',1821232.05,'Pending',NULL,2,1),(25,8,'2024-02-22 03:38:11',2281423.98,'Shipped',NULL,6,1),(26,22,'2024-02-22 03:38:11',3933899.22,'Pending',NULL,1,1),(27,6,'2024-02-22 03:38:11',218820.78,'Shipped',NULL,5,3),(28,30,'2024-02-22 03:38:11',1323332.72,'Pending',NULL,9,1),(29,25,'2024-02-22 03:38:11',NULL,'Delivered',NULL,5,NULL),(30,21,'2024-02-22 03:38:11',3759950.06,'Shipped',NULL,4,1),(31,10,'2024-02-22 03:38:11',1798051.18,'Shipped',NULL,5,1),(32,11,'2024-02-22 03:38:11',NULL,'Delivered',NULL,7,NULL),(33,11,'2024-02-22 03:38:11',3094228.98,'Pending',NULL,3,1),(34,24,'2024-02-22 03:38:11',2125576.98,'Delivered',NULL,4,1),(35,28,'2024-02-22 03:38:11',403250.77,'Pending',NULL,6,3),(36,3,'2024-02-22 03:38:11',1097998.64,'Shipped',NULL,9,1),(37,3,'2024-02-22 03:38:11',NULL,'Pending',NULL,9,NULL),(38,8,'2024-02-22 03:38:11',2016893.04,'Shipped',NULL,6,1),(39,12,'2024-02-22 03:38:11',2106585.15,'Delivered',NULL,2,1),(40,2,'2024-02-22 03:38:11',1708439.05,'Shipped',NULL,3,1),(41,14,'2024-02-22 03:38:11',9647.91,'Shipped',NULL,1,NULL),(42,10,'2024-02-22 03:38:11',806659.65,'Delivered',NULL,4,2),(43,14,'2024-02-22 03:38:11',681179.26,'Delivered',NULL,3,2),(44,1,'2024-02-22 03:38:11',2407517.53,'Delivered',NULL,5,1),(45,5,'2024-02-22 03:38:11',1443186.72,'Pending',NULL,3,1),(46,28,'2024-02-22 03:38:11',1723383.78,'Delivered',NULL,2,1),(47,24,'2024-02-22 03:38:11',1403785.75,'Pending',NULL,2,1),(48,13,'2024-02-22 03:38:11',1393639.23,'Pending',NULL,8,1),(49,21,'2024-02-22 03:38:11',NULL,'Shipped',NULL,8,NULL),(50,21,'2024-02-22 03:38:11',500425.45,'Delivered',NULL,3,2);
/*!40000 ALTER TABLE `customer_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_cartitems`
--

DROP TABLE IF EXISTS `customer_cartitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_cartitems` (
  `cart_item_id` int NOT NULL AUTO_INCREMENT,
  `cart_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `subtotal` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`cart_item_id`),
  KEY `cart_id` (`cart_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `customer_cartitems_ibfk_1` FOREIGN KEY (`cart_id`) REFERENCES `customer_cart` (`cart_id`),
  CONSTRAINT `customer_cartitems_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_cartitems`
--

LOCK TABLES `customer_cartitems` WRITE;
/*!40000 ALTER TABLE `customer_cartitems` DISABLE KEYS */;
INSERT INTO `customer_cartitems` VALUES (1,12,29,15,221742.60),(2,21,25,30,1438738.50),(3,5,17,42,663064.92),(4,19,31,28,720827.52),(5,23,9,32,105853.44),(6,25,30,23,772915.92),(7,17,37,18,270739.44),(8,14,44,42,1535704.80),(9,23,28,8,194507.36),(10,46,38,46,345201.48),(11,33,41,34,1133979.22),(12,41,46,3,9647.91),(13,46,16,31,1354336.06),(14,23,11,34,1179112.86),(15,2,3,41,700635.88),(16,25,30,38,1276991.52),(17,30,46,50,160798.50),(18,36,29,26,384353.84),(19,35,41,3,100056.99),(20,33,17,21,331532.46),(21,35,17,13,205234.38),(22,6,1,46,2006838.78),(23,10,33,33,591550.41),(24,26,21,40,1066242.00),(25,24,41,10,333523.30),(26,48,42,7,44591.61),(27,28,6,8,3009.76),(28,9,10,45,515868.30),(29,8,31,49,1261448.16),(30,28,16,1,43688.26),(31,28,11,32,1109753.28),(32,21,47,26,494526.24),(33,18,49,21,770301.63),(34,18,41,41,1367445.53),(35,13,19,48,2357169.12),(36,2,47,37,703748.88),(37,47,19,18,883938.42),(38,42,33,45,806659.65),(39,6,18,47,1959302.16),(40,34,13,12,261996.84),(41,20,43,49,1243854.22),(42,11,44,14,511901.60),(43,45,9,48,158780.16),(44,25,34,34,231516.54),(45,2,38,32,240140.16),(46,30,15,49,2409840.09),(47,10,2,30,30000.00),(48,31,39,35,1675483.60),(49,47,33,29,519847.33),(50,34,18,44,1834240.32),(51,48,43,43,1091545.54),(52,30,21,17,453152.85),(53,5,25,34,1630570.30),(54,26,49,46,1687327.38),(55,16,7,43,752405.83),(56,34,32,1,29339.82),(57,1,13,12,261996.84),(58,44,1,45,1963211.85),(59,39,21,23,613089.15),(60,5,25,43,2062191.85),(61,24,8,17,243063.79),(62,30,43,29,736158.62),(63,39,40,50,1493496.00),(64,38,45,18,401425.20),(65,43,33,38,681179.26),(66,13,31,39,1004009.76),(67,27,28,9,218820.78),(68,15,42,46,293030.58),(69,33,48,35,1628717.30),(70,18,33,29,519847.33),(71,5,45,5,111507.00),(72,19,48,50,2326739.00),(73,35,27,28,97959.40),(74,44,3,26,444305.68),(75,22,14,37,1713289.07),(76,20,12,50,1853146.00),(77,2,28,16,389014.72),(78,48,27,32,111953.60),(79,48,9,44,145548.48),(80,40,29,15,221742.60),(81,38,44,34,1243189.60),(82,28,6,9,3385.98),(83,17,8,15,214468.05),(84,28,24,9,163495.44),(85,26,15,24,1180329.84),(86,50,8,35,500425.45),(87,31,34,18,122567.58),(88,19,30,5,168025.20),(89,36,45,32,713644.80),(90,38,48,8,372278.24),(91,17,14,15,694576.65),(92,11,13,7,152831.49),(93,40,25,31,1486696.45),(94,46,23,8,23846.24),(95,2,34,19,129376.89),(96,23,40,31,925967.52),(97,45,40,43,1284406.56),(98,24,39,26,1244644.96),(99,6,26,36,1037589.84),(100,4,35,35,1576032.85);
/*!40000 ALTER TABLE `customer_cartitems` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `CalculateCartItemSubtotal` BEFORE INSERT ON `customer_cartitems` FOR EACH ROW BEGIN
    SET NEW.subtotal = (
        SELECT p.price * NEW.quantity
        FROM products p
        WHERE p.product_id = NEW.product_id
	LIMIT 1
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `UpdateCartTotalAmount` AFTER INSERT ON `customer_cartitems` FOR EACH ROW BEGIN
    UPDATE customer_cart
    SET total_amount = (
        SELECT SUM(subtotal)
        FROM customer_cartitems
        WHERE cart_id = NEW.cart_id
    )
    WHERE cart_id = NEW.cart_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `AfterInsertCIStored` AFTER INSERT ON `customer_cartitems` FOR EACH ROW BEGIN
    DECLARE cartID INT;
    DECLARE paymentMethodID INT;

	-- obtener el customer id y el metodo de pago para poder llamar la procedure
    SELECT cart_id, payment_method_id INTO cartID, paymentMethodID
    FROM customer_cart
    WHERE cart_id = NEW.cart_id
    LIMIT 1;

    -- llamar la procedure con los datos anteriormente obtenidos
    CALL AutoPromotion(cartID, paymentMethodID);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `SubtractFromStock` AFTER INSERT ON `customer_cartitems` FOR EACH ROW BEGIN
    DECLARE currentStock INT;
    DECLARE newStock INT;

    -- obtener el stock
    SELECT stock_quantity INTO currentStock
    FROM products
    WHERE product_id = NEW.product_id;

    -- restar el stock con la cantida de la orden (cliente)
    SET newStock = currentStock - NEW.quantity;

    -- actualizar el stock de productos
    UPDATE products
    SET stock_quantity = newStock
    WHERE product_id = NEW.product_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `UpdateCartTotalAmountAfterDelete` AFTER DELETE ON `customer_cartitems` FOR EACH ROW BEGIN
    DECLARE cart_total DECIMAL(10, 2);

    -- nuevo monto total
    SELECT SUM(subtotal) INTO cart_total
    FROM customer_cartitems
    WHERE cart_id = OLD.cart_id;

    -- actualizar el carrito(orden cliente) con el nuevo total
    UPDATE customer_cart
    SET total_amount = cart_total
    WHERE cart_id = OLD.cart_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Rora','Perren','rperren0@google.com.au','3803954185','663 Becker Pass'),(2,'Inessa','Magnar','imagnar1@shop-pro.jp','1067735967','47 2nd Street'),(3,'Brooke','Morales','bmorales2@pcworld.com','4116856345','2 Elmside Trail'),(4,'Harp','Winwood','hwinwood3@google.it','2197648526','158 South Place'),(5,'Ertha','Tite','etite4@flavors.me','6048866624','889 Onsgard Street'),(6,'Zed','Crush','zcrush5@devhub.com','2711766752','3 Drewry Terrace'),(7,'Emmy','Kibbee','ekibbee6@google.fr','7174403954','75 Nancy Plaza'),(8,'Felike','Seymark','fseymark7@ocn.ne.jp','5261550129','5 Pawling Trail'),(9,'Teodoro','Stockow','tstockow8@un.org','3965951259','59 Pleasure Center'),(10,'Pegeen','Probat','pprobat9@sogou.com','5127298544','329 Anderson Way'),(11,'Bobette','Carus','bcarusa@chronoengine.com','5095377083','4 Donald Court'),(12,'Giustino','Clackers','gclackersb@slate.com','1189413458','52 Blue Bill Park Lane'),(13,'Dietrich','Rabson','drabsonc@tiny.cc','6803529099','07026 Prairie Rose Street'),(14,'Bradley','Summerlie','bsummerlied@uol.com.br','4758570973','9 Service Street'),(15,'Dredi','O\'Gleasane','dogleasanee@scientificamerican.com','9262542125','235 Graedel Road'),(16,'Natalya','Roubay','nroubayf@economist.com','3423457633','6 East Lane'),(17,'Albrecht','Macbeth','amacbethg@chron.com','2318926440','611 Crest Line Point'),(18,'Diarmid','Winterton','dwintertonh@si.edu','7069131283','7 Pawling Plaza'),(19,'Donall','Renouf','drenoufi@163.com','9773969752','9834 Lien Street'),(20,'Charlena','Avramchik','cavramchikj@slashdot.org','4082862608','49339 Eagan Avenue'),(21,'Marchall','Staveley','mstaveleyk@bing.com','2714677615','7 Bowman Plaza'),(22,'Davide','Azema','dazemal@wunderground.com','5057564228','919 Boyd Hill'),(23,'Steven','Yve','syvem@shop-pro.jp','9259815796','31843 Moose Park'),(24,'Gweneth','Erington','geringtonn@blogs.com','6926961717','592 Welch Alley'),(25,'Laurent','Anthes','lantheso@4shared.com','8847332230','93169 Meadow Vale Street'),(26,'Briney','Jahnke','bjahnkep@businesswire.com','1964830132','1820 Rieder Junction'),(27,'Avram','Puleque','apulequeq@tinyurl.com','6647126283','073 Sloan Place'),(28,'Otes','Claxson','oclaxsonr@mtv.com','1228977404','63244 Chive Terrace'),(29,'Pennie','Favelle','pfavelles@icio.us','9673372896','92940 Coolidge Circle'),(30,'Mallory','Salsbury','msalsburyt@sfgate.com','9607261217','67 Corscot Road');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderitems`
--

DROP TABLE IF EXISTS `orderitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderitems` (
  `order_item_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int DEFAULT NULL,
  `subtotal` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`order_item_id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `orderitems_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `orderitems_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderitems`
--

LOCK TABLES `orderitems` WRITE;
/*!40000 ALTER TABLE `orderitems` DISABLE KEYS */;
INSERT INTO `orderitems` VALUES (1,30,26,40,1152877.60),(2,49,31,10,257438.40),(3,41,13,47,1026154.29),(4,28,28,32,778029.44),(5,40,41,5,166761.65),(6,16,47,19,361384.56),(7,36,45,1,22301.40),(8,30,41,3,100056.99),(9,23,39,23,1101032.08),(10,18,37,32,481314.56),(11,22,40,20,597398.40),(12,5,18,24,1000494.72),(13,38,42,26,165625.98),(14,22,48,8,372278.24),(15,38,25,34,1630570.30),(16,33,48,15,698021.70),(17,4,12,41,1519579.72),(18,46,5,9,409461.84),(19,21,9,42,138932.64),(20,9,33,40,717030.80),(21,40,1,25,1090673.25),(22,47,33,16,286812.32),(23,14,9,3,9923.76),(24,29,22,40,1507422.80),(25,33,12,8,296503.36),(26,9,40,36,1075317.12),(27,38,37,49,737012.92),(28,7,12,17,630069.64),(29,34,35,15,675442.65),(30,5,12,28,1037761.76),(31,42,18,36,1500742.08),(32,49,31,15,386157.60),(33,4,4,5,35906.35),(34,9,47,45,855910.80),(35,5,34,1,6809.31),(36,11,11,5,173398.95),(37,5,49,7,256767.21),(38,43,32,37,1085573.34),(39,47,3,42,717724.56),(40,22,30,44,1478621.76),(41,40,7,42,734908.02),(42,27,17,44,694639.44),(43,36,27,44,153936.20),(44,31,17,39,615703.14),(45,30,8,31,443233.97),(46,7,30,40,1344201.60),(47,31,42,28,178366.44),(48,10,38,35,262653.30),(49,8,12,49,1816083.08),(50,46,50,40,1385333.60),(51,1,30,49,1646646.96),(52,6,30,33,1108966.32),(53,35,1,37,1614196.41),(54,43,45,26,579836.40),(55,35,17,18,284170.68),(56,24,36,27,1053676.62),(57,29,12,42,1556642.64),(58,4,42,6,38221.38),(59,37,43,14,355386.92),(60,28,46,29,93263.13),(61,30,16,29,1266959.54),(62,50,24,12,217993.92),(63,8,2,47,47000.00),(64,13,49,16,586896.48),(65,27,43,16,406156.48),(66,22,31,32,823802.88),(67,42,3,23,393039.64),(68,33,47,25,475506.00),(69,30,20,10,255917.00),(70,8,45,4,89205.60),(71,17,34,40,272372.40),(72,25,17,18,284170.68),(73,13,42,5,31851.15),(74,33,35,29,1305855.79),(75,49,48,16,744556.48);
/*!40000 ALTER TABLE `orderitems` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `CalculateOrderItemSubtotal` BEFORE INSERT ON `orderitems` FOR EACH ROW BEGIN
    SET NEW.subtotal = (
        SELECT p.price * NEW.quantity
        FROM products p
        WHERE p.product_id = NEW.product_id
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `UpdateOrderTotalAmount` AFTER INSERT ON `orderitems` FOR EACH ROW BEGIN
    UPDATE orders
    SET total_amount = (
        SELECT SUM(subtotal)
        FROM orderitems
        WHERE order_id = NEW.order_id
    )
    WHERE order_id = NEW.order_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `SumStockFromOrder` AFTER INSERT ON `orderitems` FOR EACH ROW BEGIN
    DECLARE currentStock INT;
    DECLARE newStock INT;

    -- Solamente se obtiene el stock cuando el pedido es 'Delivered'
    -- si no se obtiene el stock, la procedure no puede continuar
    SELECT p.stock_quantity INTO currentStock
    FROM products p
    JOIN orders o ON p.product_id = NEW.product_id
    WHERE o.order_id = NEW.order_id
      AND o.status = 'Delivered';

    -- condicional para evitar problemas
    IF currentStock IS NOT NULL THEN
		-- sumar stock si el condicional acepta
        SET newStock = currentStock + NEW.quantity;

		-- actualizar stock si el condicional acepta
		UPDATE products
		SET stock_quantity = newStock
		WHERE product_id = NEW.product_id;
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `order_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `total_amount` decimal(10,2) DEFAULT NULL,
  `payment_method_id` int DEFAULT NULL,
  `status` enum('Pending','Shipped','Delivered') DEFAULT 'Pending',
  PRIMARY KEY (`order_id`),
  KEY `payment_method_id` (`payment_method_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`payment_method_id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `orders_chk_1` CHECK ((`status` in (_utf8mb4'Pending',_utf8mb4'Shipped',_utf8mb4'Delivered')))
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,8,'2024-02-22 03:38:11',1646646.96,2,'Pending'),(2,6,'2024-02-22 03:38:11',NULL,2,'Shipped'),(3,5,'2024-02-22 03:38:11',NULL,3,'Pending'),(4,3,'2024-02-22 03:38:11',1593707.45,2,'Pending'),(5,8,'2024-02-22 03:38:11',2301833.00,6,'Delivered'),(6,7,'2024-02-22 03:38:11',1108966.32,2,'Shipped'),(7,8,'2024-02-22 03:38:11',1974271.24,2,'Shipped'),(8,5,'2024-02-22 03:38:11',1952288.68,1,'Delivered'),(9,3,'2024-02-22 03:38:11',2648258.72,4,'Pending'),(10,2,'2024-02-22 03:38:11',262653.30,4,'Delivered'),(11,8,'2024-02-22 03:38:11',173398.95,1,'Pending'),(12,7,'2024-02-22 03:38:11',NULL,3,'Delivered'),(13,5,'2024-02-22 03:38:11',618747.63,6,'Pending'),(14,6,'2024-02-22 03:38:11',9923.76,2,'Shipped'),(15,8,'2024-02-22 03:38:11',NULL,1,'Pending'),(16,4,'2024-02-22 03:38:11',361384.56,5,'Pending'),(17,2,'2024-02-22 03:38:11',272372.40,1,'Delivered'),(18,1,'2024-02-22 03:38:11',481314.56,5,'Pending'),(19,1,'2024-02-22 03:38:11',NULL,7,'Delivered'),(20,8,'2024-02-22 03:38:11',NULL,5,'Shipped'),(21,3,'2024-02-22 03:38:11',138932.64,4,'Shipped'),(22,9,'2024-02-22 03:38:11',3272101.28,8,'Pending'),(23,1,'2024-02-22 03:38:11',1101032.08,4,'Pending'),(24,2,'2024-02-22 03:38:11',1053676.62,4,'Shipped'),(25,6,'2024-02-22 03:38:11',284170.68,1,'Pending'),(26,10,'2024-02-22 03:38:11',NULL,9,'Shipped'),(27,9,'2024-02-22 03:38:11',1100795.92,8,'Shipped'),(28,3,'2024-02-22 03:38:11',871292.57,5,'Shipped'),(29,6,'2024-02-22 03:38:11',3064065.44,6,'Pending'),(30,1,'2024-02-22 03:38:11',3219045.10,2,'Pending'),(31,1,'2024-02-22 03:38:11',794069.58,3,'Delivered'),(32,5,'2024-02-22 03:38:11',NULL,4,'Pending'),(33,6,'2024-02-22 03:38:11',2775886.85,2,'Shipped'),(34,3,'2024-02-22 03:38:11',675442.65,4,'Pending'),(35,7,'2024-02-22 03:38:11',1898367.09,8,'Pending'),(36,6,'2024-02-22 03:38:11',176237.60,6,'Shipped'),(37,6,'2024-02-22 03:38:11',355386.92,2,'Pending'),(38,9,'2024-02-22 03:38:11',2533209.20,6,'Pending'),(39,3,'2024-02-22 03:38:11',NULL,7,'Shipped'),(40,9,'2024-02-22 03:38:11',1992342.92,4,'Shipped'),(41,9,'2024-02-22 03:38:11',1026154.29,8,'Pending'),(42,8,'2024-02-22 03:38:11',1893781.72,7,'Pending'),(43,3,'2024-02-22 03:38:11',1665409.74,3,'Pending'),(44,4,'2024-02-22 03:38:11',NULL,6,'Pending'),(45,3,'2024-02-22 03:38:11',NULL,1,'Delivered'),(46,5,'2024-02-22 03:38:11',1794795.44,5,'Pending'),(47,6,'2024-02-22 03:38:11',1004536.88,7,'Shipped'),(48,7,'2024-02-22 03:38:11',NULL,4,'Delivered'),(49,9,'2024-02-22 03:38:11',1388152.48,8,'Delivered'),(50,1,'2024-02-22 03:38:11',217993.92,3,'Pending');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_methods`
--

DROP TABLE IF EXISTS `payment_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_methods` (
  `payment_method_id` int NOT NULL AUTO_INCREMENT,
  `method_name` varchar(50) NOT NULL,
  PRIMARY KEY (`payment_method_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_methods`
--

LOCK TABLES `payment_methods` WRITE;
/*!40000 ALTER TABLE `payment_methods` DISABLE KEYS */;
INSERT INTO `payment_methods` VALUES (1,'Cash'),(2,'Credit'),(3,'Debit'),(4,'BNPL'),(5,'Check'),(6,'Transfer'),(7,'Cryptocurrency'),(8,'Gift Card'),(9,'E-Wallets');
/*!40000 ALTER TABLE `payment_methods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(50) NOT NULL,
  `description` text,
  `price` decimal(10,2) NOT NULL,
  `stock_quantity` int NOT NULL,
  `category_id` int DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Ostrich - Prime Cut','Laceration w fb of l little finger w damage to nail',43626.93,18783,5),(2,'Bread - Pain Au Liat X12','Lacerat musc/fasc/tend long hd bicep, left arm, sequela',1000.00,117,10),(3,'Dried Peach','Lacerat musc/tend at lower leg level, right leg, sequela',17088.68,39730,7),(4,'Nut - Almond, Blanched, Whole','War op w direct blast effect of nuclr weapon, milt, sequela',7181.27,93094,6),(5,'Containter - 3oz Microwave Rect.','Occup of dune buggy injured in traffic accident, init encntr',45495.76,87350,8),(6,'Muffin - Mix - Bran And Maple 15l','Unsp injury of deep palmar arch of unsp hand, init encntr',376.22,7925,2),(7,'Wine - Magnotta - Bel Paese White','Burn of first degree of left knee, subsequent encounter',17497.81,12399,9),(8,'Clams - Littleneck, Whole','Infct fol oth infusion, transfuse and theraputc inject, subs',14297.87,11075,5),(9,'Steamers White','Nondisp oblique fx shaft of r fibula, 7thM',3307.92,28318,6),(10,'Quail - Whole, Boneless','Unspecified disp fx of surgical neck of left humerus',11463.74,81191,10),(11,'Pork - Suckling Pig','Kearns-Sayre syndrome',34679.79,38147,5),(12,'Wine - Casablanca Valley','Minor laceration of right innominate or subclav art, init',37062.92,31283,12),(13,'Wine - Montecillo Rioja Crianza','Fall into natural body of water striking water surface',21833.07,29611,2),(14,'Arizona - Plum Green Tea','Unsp fx left femur, subs for opn fx type I/2 w delay heal',46305.11,93383,6),(15,'Cup - 3.5oz, Foam','Contracture of muscle, unspecified thigh',49180.41,75313,12),(16,'Crackers - Melba Toast','Laceration of muscle, fascia and tendon of lower back, init',43688.26,63901,7),(17,'Sugar - Crumb','Hypervitaminosis D',15787.26,13730,3),(18,'Soup - Knorr, Country Bean','Disp fx of lateral cuneiform of unsp ft, 7thP',41687.28,52687,3),(19,'Cookie Choc','Intcran inj w loss of consciousness of 30 minutes or less',49107.69,45043,12),(20,'Lamb - Shanks','Abrasion of nose, subsequent encounter',25591.70,35043,11),(21,'Glass Clear 8 Oz','Other and unspecified osteoarthritis',26656.05,96529,6),(22,'Dried Cherries','Displacement of int fix of bones of foot and toes, init',37685.57,51081,9),(23,'Wine - Red, Pinot Noir, Chateau','Nondisp fx of lateral malleolus of l fibula, 7thB',2980.78,95432,1),(24,'Coffee - French Vanilla Frothy','Labor and delivery comp by vascular lesion of cord, fetus 1',18166.16,7677,7),(25,'Table Cloth 91x91 Colour','Burn unsp deg mult sites of right low limb, ex ank/ft, sqla',47957.95,43413,5),(26,'Wine - Fume Blanc Fetzer','Fracture of symphysis of mandible, init for clos fx',28821.94,75703,9),(27,'Praline Paste','Nondisp fx of med condyle of r femr, 7thG',3498.55,96960,5),(28,'Energy Drink Red Bull','War operations involving other firearms discharge',24313.42,24667,12),(29,'Wine - Masi Valpolocell','Chronic gout due to renal impairment, ankle and foot',14782.84,54479,7),(30,'Lettuce - California Mix','Fracture of unsp phalanx of left thumb, init for opn fx',33605.04,75527,3),(31,'Longos - Chicken Curried','Prsn brd/alit pk-up/van inj in clsn w nonmtr vehicle, init',25743.84,93112,8),(32,'Tuna - Salad Premix','Minor contusion of unspecified kidney, subsequent encounter',29339.82,81504,8),(33,'Almonds Ground Blanched','Occupant of anml-drn vehicle injured in clsn w stcar, subs',17925.77,88556,4),(34,'Chicken - Whole','Disp fx of first metatarsal bone, right foot, sequela',6809.31,82448,5),(35,'Ice Cream - Life Savers','Subluxation and dislocation of distal end of ulna',45029.51,98977,2),(36,'Wine - Red, Mosaic Zweigelt','Atheroembolism of unspecified upper extremity',39025.06,99452,2),(37,'Coffee Decaf Colombian','Unsp fx fifth MC bone, right hand, subs for fx w delay heal',15041.08,17917,8),(38,'Veal - Bones','Laceration of radial artery at wrs/hnd lv of unsp arm, init',7504.38,25537,3),(39,'Alize Gold Passion','Displaced transverse fracture of unspecified acetabulum',47870.96,84883,11),(40,'Taro Leaves','Nondisp fx of nk of 3rd MC bone, r hand, 7thK',29869.92,12456,3),(41,'Curry Paste - Green Masala','Oligohydramnios, third trimester, not applicable or unsp',33352.33,87588,3),(42,'Ice Cream Bar - Oreo Sandwich','Adverse effect of other synthetic narcotics',6370.23,93928,12),(43,'Vermacelli - Sprinkles, Assorted','Villonodular synovitis (pigmented), left hand',25384.78,44523,9),(44,'Pickle - Dill','Contusion of stomach, initial encounter',36564.40,84022,11),(45,'Whmis - Spray Bottle Trigger','Unequal limb length (acquired), unspecified femur',22301.40,37211,7),(46,'Wine - Magnotta - Red, Baco','Focal hyperhidrosis',3215.97,23351,12),(47,'Gatorade - Cool Blue Raspberry','Unspecified injury of brachial artery, right side, sequela',19020.24,52127,2),(48,'Cheese - Le Cru Du Clocher','Corrosion of third degree of right hand, unsp site, subs',46534.78,41407,10),(49,'Wine - Peller Estates Late','Strain of right Achilles tendon, initial encounter',36681.03,92869,10),(50,'Dill - Primerba, Paste','Bent bone of unsp ulna, 7thH',34633.34,34237,6);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotions`
--

DROP TABLE IF EXISTS `promotions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promotions` (
  `promotion_id` int NOT NULL AUTO_INCREMENT,
  `promotion_name` varchar(50) NOT NULL,
  `description` text,
  `discount_type` enum('Percentage','FixedAmount') NOT NULL,
  `discount_value` decimal(5,2) NOT NULL,
  `min_purchase_amount` decimal(20,2) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`promotion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotions`
--

LOCK TABLES `promotions` WRITE;
/*!40000 ALTER TABLE `promotions` DISABLE KEYS */;
INSERT INTO `promotions` VALUES (1,'Liquidacion','Liquidacion porque si','Percentage',30.00,1000000.00,'2000-01-01','2099-12-31',1),(2,'Promo Navidena','Promo navidena por navidad','Percentage',15.00,500000.00,'2000-01-01','2099-12-31',1),(3,'Black Friday','Black Friday pero para siempre','FixedAmount',10.00,50000.00,'2000-01-01','2099-12-31',1);
/*!40000 ALTER TABLE `promotions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `review_id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `rating` int DEFAULT NULL,
  `comment` text,
  `review_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`review_id`),
  KEY `product_id` (`product_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `review_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  CONSTRAINT `review_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  CONSTRAINT `review_chk_1` CHECK (((`Rating` >= 0) and (`Rating` <= 10)))
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (1,45,4,7,'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.','2024-02-22 03:38:11'),(2,43,4,3,'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.','2024-02-22 03:38:11'),(3,26,14,3,'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.','2024-02-22 03:38:11'),(4,43,23,2,'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.','2024-02-22 03:38:11'),(5,32,11,4,'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.','2024-02-22 03:38:11'),(6,50,3,10,'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.','2024-02-22 03:38:11'),(7,49,4,1,'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.','2024-02-22 03:38:11'),(8,37,17,1,'Sed ante. Vivamus tortor. Duis mattis egestas metus.Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.','2024-02-22 03:38:11'),(9,1,26,10,'In congue. Etiam justo. Etiam pretium iaculis justo.','2024-02-22 03:38:11'),(10,37,13,2,'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.','2024-02-22 03:38:11'),(11,22,30,8,'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.','2024-02-22 03:38:11'),(12,26,16,1,'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.','2024-02-22 03:38:11'),(13,50,19,4,'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.','2024-02-22 03:38:11'),(14,10,26,1,'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.','2024-02-22 03:38:11'),(15,15,2,9,'Sed ante. Vivamus tortor. Duis mattis egestas metus.Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.','2024-02-22 03:38:11'),(16,10,7,8,'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.','2024-02-22 03:38:11'),(17,16,20,9,'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.','2024-02-22 03:38:11'),(18,18,23,3,'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.','2024-02-22 03:38:11'),(19,44,29,6,'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.','2024-02-22 03:38:11'),(20,9,24,0,'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.','2024-02-22 03:38:11');
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'nbromehead0','aB7,B3T#2d>5M','tklejna0@army.mil'),(2,'preace1','lI1+jMLmX#AxGB%','keasman1@ovh.net'),(3,'wswinnard2','eI0*|FTx7`~_65O','hnoke2@drupal.org'),(4,'mmattisssen3','uO2#YnRlXvFEB/\"s','mtilio3@dion.ne.jp'),(5,'tlogue4','mU0<ahZxOjMK','vverillo4@flavors.me'),(6,'csurmeyers5','xV5*4|aYyPr','bgraith5@geocities.com'),(7,'gharlick6','vY3.*GzK((','rgilstoun6@arizona.edu'),(8,'dreynault7','mM1%@iWxrS5','mfould7@flickr.com'),(9,'thullins8','yC5<8|b=/U','pcullon8@seesaa.net'),(10,'rhulburd9','xI2,!sKU(','aorneblow9@shareasale.com');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_details`
--

DROP TABLE IF EXISTS `user_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_details` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `registration_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `user_details_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_details`
--

LOCK TABLES `user_details` WRITE;
/*!40000 ALTER TABLE `user_details` DISABLE KEYS */;
INSERT INTO `user_details` VALUES (1,'Willabella','Dansie','43 Ramsey Junction','196-378-4055','2024-02-22 04:07:17'),(2,'Karol','Shorte','21 Thierer Terrace','866-340-6285','2024-02-22 04:08:10'),(3,'Sue','Chirm','95 Dixon Terrace','289-841-5058','2024-02-22 03:38:10'),(4,'Lawton','O\'Lyhane','0964 Springview Way','895-315-9088','2024-02-22 03:38:10'),(5,'Adore','Wickwarth','01340 Melby Center','937-635-3255','2024-02-22 03:38:10'),(6,'Almira','Nelles','81 Talisman Terrace','645-681-8642','2024-02-22 03:38:10'),(7,'Michaeline','Markovic','25 Lake View Court','655-855-4799','2024-02-22 03:38:10'),(8,'Tyler','Rudeforth','48 Sachtjen Parkway','172-323-2714','2024-02-22 03:38:10'),(9,'Garald','Braiden','67 Meadow Valley Place','505-555-0230','2024-02-22 03:38:10'),(10,'Dwayne','Westrey','404 Sommers Terrace','668-590-3490','2024-02-22 03:38:10');
/*!40000 ALTER TABLE `user_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'idea_matozo'
--

--
-- Dumping routines for database 'idea_matozo'
--
/*!50003 DROP PROCEDURE IF EXISTS `AutoPromotion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AutoPromotion`(
    IN p_cart_id INT,
    IN p_payment_method_id INT
)
BEGIN
    DECLARE promotionID INT;
	DECLARE totalAmount DECIMAL(10, 2);

    -- calcular el monto total segun el subtotal
    -- usando el cart_id
    SELECT SUM(subtotal) INTO totalAmount
    FROM customer_cartitems
    WHERE cart_id = p_cart_id;

    -- condicionales para la promocion
    SELECT promotion_id INTO promotionID
    FROM promotions
    WHERE start_date <= CURRENT_DATE
      AND end_date >= CURRENT_DATE
      AND min_purchase_amount <= totalAmount
      AND active = TRUE
    LIMIT 1;

    -- si los condicionales encuentran una promo valida se inserta su promotion_id a la orden(lado cliente)
    IF promotionID IS NOT NULL THEN
        UPDATE customer_cart
        SET promotion_id = promotionID
        WHERE cart_id = p_cart_id;
    END IF;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SearchProducts` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchProducts`(
	IN p_keyword VARCHAR(255)
)
BEGIN
    SELECT * FROM products
    WHERE product_name LIKE CONCAT('%', p_keyword, '%');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `cart_view`
--

/*!50001 DROP VIEW IF EXISTS `cart_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `cart_view` AS select `c`.`cart_id` AS `cart_id`,`c`.`customer_id` AS `customer_id`,sum(`ci`.`subtotal`) AS `total_amount`,`p`.`promotion_id` AS `promotion_id` from ((`customer_cart` `c` join `customer_cartitems` `ci` on((`c`.`cart_id` = `ci`.`cart_id`))) left join `promotions` `p` on((((`c`.`total_amount` + `ci`.`subtotal`) >= `p`.`min_purchase_amount`) and (curdate() between `p`.`start_date` and `p`.`end_date`) and (`p`.`active` = true)))) group by `c`.`cart_id`,`c`.`customer_id`,`p`.`promotion_id` */;
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

-- Dump completed on 2024-02-22  2:21:47
