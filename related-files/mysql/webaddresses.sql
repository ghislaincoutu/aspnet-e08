-- MySQL dump 10.13  Distrib 8.4.11, for Linux (x86_64)
--
-- Host: localhost    Database: webaddresses
-- ------------------------------------------------------
-- Server version	8.4.11-0ubuntu0.26.04.1

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
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `cat_id` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `enterprise` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES (1,'i01','GitHub','https://github.com/','GitHub'),(2,'i01','Microsoft','https://microsoft.com/','Microsoft'),(3,'i01','Linux Academy','https://linuxacademy.com/','Linux Academy'),(5,'a01','La Presse','https://lapresse.ca/','La Presse'),(6,'a01','Radio-Canada','https://ici.radio-canada.ca/','Radio-Canada'),(7,'a01','Journal de Montréal','https://journaldemontreal.com/','Journal de Montréal'),(8,'a01','Le Devoir','https://ledevoir.com/','Le Devoir'),(9,'a01','Montreal Gazette','https://montrealgazette.com/','Montreal Gazette'),(10,'a01','Global News Montreal','https://globalnews.ca/montreal/','Global News'),(11,'a01','CNN','https://cnn.com/','CNN'),(12,'i02','Code Guide','https://codeguide.co/','Code Guide'),(13,'a02','Adobe Color','https://color.adobe.com/','Adobe'),(14,'a02','Material Design','https://m3.material.io/','Material Design'),(15,'i02','HTML Color Picker','https://w3schools.com/colors/colors_picker.asp','W3Schools'),(16,'m01','Ambient Sleeping Pill','https://ambientsleepingpill.com/','Ambient Sleeping Pill'),(17,'m01','SomaFM','https://somafm.com/','SomaFM'),(18,'m01','YourClassical Radio','https://yourclassical.org/','YourClassical Radio'),(19,'m01','Live365','https://live365.com/','Live365'),(20,'m01','GotRadio','https://gotradio.com/','GotRadio'),(21,'m01','Bandcamp','https://bandcamp.com/','Bandcamp'),(22,'m01','FilterMusic','https://filtermusic.net/','FilterMusic'),(23,'a01','Météo région de Montréal','https://meteo.gc.ca/fr/location/index.html?coords=45.509,-73.554','Environnement Canada'),(24,'t01','État du métro de Montréal','https://stm.info/fr/infos/etat-du-service/metro','Société de transport de Montréal'),(25,'e01','Indeed','https://ca.indeed.com/','Indeed'),(26,'i01','Google Trends','https://trends.google.com','Google'),(27,'i04','WebAIM','https://webaim.org/','WebAIM'),(28,'i01','Microsoft Outlook','https://outlook.live.com/','Microsoft'),(29,'i01','Google Fonts','https://fonts.google.com','Google'),(30,'i01','Google Analytics','https://analytics.google.com/','Google'),(31,'i01','Statcounter GlobalStats','https://gs.statcounter.com/','Statcounter'),(32,'l01','Google Traduction','https://translate.google.fr/','Google'),(33,'l01','DeepL','https://deepl.com/','DeepL'),(34,'l01','Scribiens','https://scribens.fr/index.html','Scribiens'),(35,'l01','Reverso','https://reverso.net/orthographe/correcteur-francais/','Reverso'),(36,'l01','Linguee','http://linguee.fr/','Linguee'),(37,'l01','TERMIUM Plus','https://btb.termiumplus.gc.ca/','Gouvernement du Canada'),(38,'l01','Office québécois de la langue française','https://oqlf.gouv.qc.ca/','Gouvernement du Québec'),(39,'l01','Vitrine linguistique','https://vitrinelinguistique.oqlf.gouv.qc.ca/','Gouvernement du Québec');
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `cat_id` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES ('e01','Emploi'),('i01','Informatique'),('i03','Sécurité et confidentialité'),('a01','Actualité et médias'),('i02','Programmation'),('a02','Art et culture'),('m01','Musique'),('t01','Transports'),('i04','Accessibilité'),('l01','Langue et linguistique');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-15 15:03:46
