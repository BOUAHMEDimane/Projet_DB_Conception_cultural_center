-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: events
-- ------------------------------------------------------
-- Server version	5.7.31

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
-- Dumping data for table `artiste`
--

LOCK TABLES `artiste` WRITE;
/*!40000 ALTER TABLE `artiste` DISABLE KEYS */;
INSERT INTO `artiste` VALUES (2,'rock'),(3,'slow'),(4,'disco'),(20,'classic'),(30,'pob'),(40,'pob'),(50,'dance');
/*!40000 ALTER TABLE `artiste` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `benevole`
--

LOCK TABLES `benevole` WRITE;
/*!40000 ALTER TABLE `benevole` DISABLE KEYS */;
INSERT INTO `benevole` VALUES (5,'organisation','2021-01-01','2021-02-15'),(6,'electrecite','2021-01-01','2021-12-31'),(7,'nettoyage','2021-01-01','2021-12-01'),(8,'pub','2021-01-01','2021-09-01'),(9,'stand-by','2021-01-01','2021-05-01');
/*!40000 ALTER TABLE `benevole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (100,'commercial',NULL,1200,'2035-12-31','2020-12-01'),(101,'RH',NULL,1200,'2035-12-31','2020-10-01'),(102,'chef',NULL,1800,'2035-12-31','2020-01-01'),(103,'chef',NULL,1800,'2035-12-31','2019-06-01'),(104,'agent',NULL,1300,'2035-12-31','2021-01-01'),(105,'agent',NULL,1300,'2035-12-31','2012-10-01'),(106,'comptabilité',NULL,1900,'2035-12-31','2016-12-01'),(107,'secretariat',NULL,1600,'2035-12-31','2015-10-01'),(108,'admin',NULL,1500,'2035-12-31','2020-10-01'),(109,'admin',NULL,1900,'2035-12-31','2018-05-01');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `evenement`
--

LOCK TABLES `evenement` WRITE;
/*!40000 ALTER TABLE `evenement` DISABLE KEYS */;
INSERT INTO `evenement` VALUES (1,'journée des parent','social','2021-06-01','2021-06-03','ANNULE'),(2,'journén de velo','social','2021-06-03','2021-06-06','ok'),(3,'tour de france','musical','2021-06-26','2021-07-18','ok'),(4,'jourée de l\'amitié','musical','2021-07-30','2021-07-30','ok'),(5,'journée mondial de tourism','culturel','2021-08-27','2021-08-29','ok'),(6,'journée des enseignants','culturel','2021-10-05','2021-10-05','ok'),(7,'journée de vélo','social','2022-06-03','2022-06-06','ok'),(8,'event_test','cinema','2021-07-01','2021-07-07','A VENIR'),(9,'event_test','cinema','2021-07-01','2021-07-07','A VENIR'),(10,'event_test','cinema','2021-07-01','2021-07-07','A VENIR');
/*!40000 ALTER TABLE `evenement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `histo_evenement`
--

LOCK TABLES `histo_evenement` WRITE;
/*!40000 ALTER TABLE `histo_evenement` DISABLE KEYS */;
/*!40000 ALTER TABLE `histo_evenement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `histo_listeartistspect`
--

LOCK TABLES `histo_listeartistspect` WRITE;
/*!40000 ALTER TABLE `histo_listeartistspect` DISABLE KEYS */;
/*!40000 ALTER TABLE `histo_listeartistspect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `histo_listeeventbenev`
--

LOCK TABLES `histo_listeeventbenev` WRITE;
/*!40000 ALTER TABLE `histo_listeeventbenev` DISABLE KEYS */;
/*!40000 ALTER TABLE `histo_listeeventbenev` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `histo_spectacle`
--

LOCK TABLES `histo_spectacle` WRITE;
/*!40000 ALTER TABLE `histo_spectacle` DISABLE KEYS */;
/*!40000 ALTER TABLE `histo_spectacle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `histo_ticket`
--

LOCK TABLES `histo_ticket` WRITE;
/*!40000 ALTER TABLE `histo_ticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `histo_ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `listeartistspect`
--

LOCK TABLES `listeartistspect` WRITE;
/*!40000 ALTER TABLE `listeartistspect` DISABLE KEYS */;
INSERT INTO `listeartistspect` VALUES (1,2,200.00,0),(2,4,500.00,1),(2,30,10.00,1),(3,40,20.00,1),(5,3,100.00,0),(5,20,100.00,1),(6,50,100.00,0);
/*!40000 ALTER TABLE `listeartistspect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `listeeventbenev`
--

LOCK TABLES `listeeventbenev` WRITE;
/*!40000 ALTER TABLE `listeeventbenev` DISABLE KEYS */;
INSERT INTO `listeeventbenev` VALUES (5,1,NULL),(8,2,NULL),(6,4,5),(7,1,5);
/*!40000 ALTER TABLE `listeeventbenev` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `listeeventempl`
--

LOCK TABLES `listeeventempl` WRITE;
/*!40000 ALTER TABLE `listeeventempl` DISABLE KEYS */;
INSERT INTO `listeeventempl` VALUES (1,100),(7,100),(9,101),(1,102),(4,102),(5,102),(5,104),(10,105),(6,109),(8,109);
/*!40000 ALTER TABLE `listeeventempl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `personne`
--

LOCK TABLES `personne` WRITE;
/*!40000 ALTER TABLE `personne` DISABLE KEYS */;
INSERT INTO `personne` VALUES (1,'ABBAS','Raed',NULL,'22 aer 38000',NULL,2121215469,''),(2,'fabian','lara',NULL,'aezrer 38200','aer@hotmail.com',111111111,'artiste'),(3,'jack','jack',NULL,NULL,'qsdf@qsdf.com',121212121,'artiste'),(4,'joe','abbas',NULL,NULL,'qsdf@qsdf.com',422222255,'artiste'),(5,'e','f','2012-04-19',NULL,'mlkj@mlkjm.fr',745123695,'benevole'),(6,'d','e','1989-02-16',NULL,'mjkdf@mk.com',239635875,'benevole'),(7,'c','d','1999-08-14',NULL,'jfkls@sdf.com',521478453,'benevole'),(8,'b','c','2000-11-11',NULL,'jfkdksl@kdj.com',254781369,'benevole'),(9,'a','b','1989-12-22',NULL,'jsldls@edl.com',123568974,'benevole'),(10,'jj','hh',NULL,NULL,'jlkjd@jlq.com',215487784,''),(11,'client1','client1',NULL,NULL,NULL,NULL,'client'),(12,'client2','client2',NULL,NULL,NULL,NULL,'client'),(20,'francois','jean','2000-12-12','41jlmqkj 25414',NULL,NULL,'artiste'),(30,'louis','luc',NULL,NULL,'louis@ljf.com',215458963,'artiste'),(40,'nathalie','nathalie',NULL,NULL,NULL,NULL,'artiste'),(50,'segara','helen',NULL,NULL,NULL,NULL,'artiste'),(51,'salarie1',NULL,NULL,NULL,NULL,NULL,''),(52,'salarie2','rami',NULL,NULL,NULL,NULL,''),(53,'salarie3','remi',NULL,NULL,NULL,NULL,''),(54,'salarie4','joe',NULL,NULL,NULL,NULL,''),(55,'salarie5','mani',NULL,NULL,NULL,NULL,''),(56,'salarie6','nicola',NULL,NULL,NULL,NULL,''),(57,'salarie7','mera','1999-01-02','11jfkdlsm 12456','mljazer@lkj.com',124569869,''),(100,'employe0','employe0','2009-02-23',NULL,NULL,NULL,''),(101,'employe1','employe1','2002-04-26',NULL,NULL,NULL,''),(102,'employe2','employe2','2000-10-25',NULL,NULL,NULL,''),(103,'employe3','employe3','2000-09-19',NULL,NULL,NULL,''),(104,'employe4','employe4','2000-10-10',NULL,NULL,NULL,''),(105,'employe5','employe5','1999-12-25',NULL,NULL,NULL,''),(106,'employe6','employe6','1998-11-17',NULL,NULL,NULL,''),(107,'employe7','employe7','1999-04-04',NULL,NULL,NULL,''),(108,'employe8','employe8','1988-12-15',NULL,NULL,NULL,''),(109,'employe9','employe9','1987-12-14',NULL,NULL,NULL,''),(150,'benevole','bb','2000-04-04',NULL,NULL,NULL,'');
/*!40000 ALTER TABLE `personne` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `salle`
--

LOCK TABLES `salle` WRITE;
/*!40000 ALTER TABLE `salle` DISABLE KEYS */;
INSERT INTO `salle` VALUES (1,50,'a'),(2,100,'b'),(3,300,'c');
/*!40000 ALTER TABLE `salle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `spectacle`
--

LOCK TABLES `spectacle` WRITE;
/*!40000 ALTER TABLE `spectacle` DISABLE KEYS */;
INSERT INTO `spectacle` VALUES (1,'concert1','music',296,'2021-06-01 00:00:00',100.00,'2021-06-01 00:00:00',1,3,80.00,60.00),(2,'concert2','théâtre',49,'2021-06-02 18:00:00',200.00,'2021-06-02 22:00:00',2,1,15.00,13.00),(3,'concert3','fete',49,'2021-07-01 18:00:00',500.00,'2021-07-01 22:00:00',3,1,450.00,350.00),(4,'concert4','fete',99,'2021-07-02 18:00:00',200.00,'2021-07-02 22:00:00',4,2,180.00,160.00),(5,'concert5','fete',298,'2021-07-01 18:00:00',400.00,'2021-07-01 22:00:00',8,3,350.00,300.00),(6,'concert6','music',50,'2021-07-01 14:00:00',300.00,'2021-07-01 16:00:00',8,1,280.00,260.00),(7,'concert7','style',100,'2021-07-03 18:00:00',300.00,'2021-07-03 22:00:00',8,2,280.00,260.00),(8,'concert8','dance',299,'2021-07-04 18:00:00',200.00,'2021-07-04 22:00:00',8,3,180.00,160.00),(9,'concert9','cinema',49,'2021-07-05 18:00:00',400.00,'2021-07-05 22:00:00',8,1,350.00,300.00),(10,NULL,NULL,50,'2021-07-01 18:00:00',100.00,'2021-07-01 22:00:00',10,1,80.00,60.00);
/*!40000 ALTER TABLE `spectacle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (1,100.00,1,1,'RESERVE'),(2,80.00,2,1,'PAYE'),(3,300.00,5,3,'PAYE'),(4,400.00,5,5,'PAYE'),(5,400.00,8,2,'PAYE'),(6,180.00,6,4,'PAYE'),(7,160.00,1,8,'PAYE'),(8,60.00,1,9,'RESERVE'),(9,100.00,11,5,'PAYE'),(10,200.00,12,1,'RESERVE'),(11,100.00,50,1,'PAYE');
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-31 17:10:37
