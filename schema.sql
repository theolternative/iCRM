-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.47


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema icrm
--

CREATE DATABASE IF NOT EXISTS icrm;
USE icrm;

--
-- Definition of table `icrm`.`contacts`
--

DROP TABLE IF EXISTS `icrm`.`contacts`;
CREATE TABLE  `icrm`.`contacts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(200) DEFAULT '',
  `creationDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modificationDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `creator` int(10) DEFAULT '0',
  `tags` varchar(100) DEFAULT '',
  `surname` varchar(50) DEFAULT '',
  `company` int(10) unsigned NOT NULL DEFAULT '0',
  `isCompany` tinyint(1) NOT NULL DEFAULT '0',
  `genre` tinyint(1) NOT NULL DEFAULT '0',
  `addresses` varchar(300) DEFAULT '',
  `privacyChecked` tinyint(1) NOT NULL DEFAULT '1',
  `birthDate` date DEFAULT '1900-01-01',
  `fiscalID` varchar(20) DEFAULT '',
  `VAT` varchar(20) DEFAULT '',
  `phones` varchar(120) DEFAULT '',
  `emails` varchar(120) DEFAULT '',
  `internet` varchar(120) DEFAULT '',
  `password` varchar(64) DEFAULT '',
  `alerts` varchar(20) DEFAULT '',
  `photoName` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8814 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `icrm`.`contacts`
--



--
-- Definition of table `icrm`.`folders`
--

DROP TABLE IF EXISTS `icrm`.`folders`;
CREATE TABLE  `icrm`.`folders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL DEFAULT '',
  `description` varchar(100) DEFAULT '',
  `creationDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modificationDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `creator` int(10) DEFAULT '0',
  `tags` varchar(100) DEFAULT '',
  `type` smallint(6) DEFAULT '0',
  `editable` tinyint(1) DEFAULT '0',
  `smart` int(10) DEFAULT '0',
  `criteria` varchar(1000) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=317 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `icrm`.`folders`
--

/*!40000 ALTER TABLE `folders` DISABLE KEYS */;
LOCK TABLES `folders` WRITE;
INSERT INTO `icrm`.`folders` VALUES  (1,'Tutti','','2011-05-25 18:53:09','0000-00-00 00:00:00',0,'',0,0,2,'1=1'),
 (2,'Clienti','','2011-05-25 18:53:09','0000-00-00 00:00:00',0,'',0,0,0,''),
 (3,'Imprese','','2011-05-25 18:53:09','0000-00-00 00:00:00',0,'',0,0,0,''),
 (4,'Tutti','','2011-05-25 18:53:09','0000-00-00 00:00:00',0,'',1,0,0,''),
 (5,'Pubblici','','2011-05-25 18:53:09','0000-00-00 00:00:00',0,'',1,0,0,''),
 (6,'Privati','','2011-05-25 18:53:09','0000-00-00 00:00:00',0,'',1,0,0,'');
UNLOCK TABLES;
/*!40000 ALTER TABLE `folders` ENABLE KEYS */;


--
-- Definition of table `icrm`.`titles`
--

DROP TABLE IF EXISTS `icrm`.`titles`;
CREATE TABLE  `icrm`.`titles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL DEFAULT '',
  `description` varchar(100) DEFAULT '',
  `creationDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modificationDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `creator` int(10) DEFAULT '0',
  `type` smallint(6) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=317 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `icrm`.`titles`
--

/*!40000 ALTER TABLE `titles` DISABLE KEYS */;
LOCK TABLES `titles` WRITE;
INSERT INTO `icrm`.`titles` VALUES  (1,'Tutti','Signor','2011-05-25 18:53:09','0000-00-00 00:00:00',0,0),
 (2,'Sig.ra','Signora','2011-05-25 18:53:09','0000-00-00 00:00:00',0,0),
 (3,'Soc.','SocietÃ ','2011-05-25 18:53:09','0000-00-00 00:00:00',0,1),
 (4,'Ing.','Ingegnere','2011-05-25 18:53:09','0000-00-00 00:00:00',0,0),
 (5,'Rag.','Ragioniere','2011-05-25 18:53:09','0000-00-00 00:00:00',0,0),
 (6,'Dott.','Dottore','2011-05-25 18:53:09','0000-00-00 00:00:00',0,0),
 (7,'Dott.ssa','Dottoressa','2011-05-25 18:53:09','0000-00-00 00:00:00',0,0),
 (8,'Avv.','Avvocato','2011-05-25 18:53:09','0000-00-00 00:00:00',0,0),
 (9,'Geom.','Geometra','2011-05-25 18:53:09','0000-00-00 00:00:00',0,0),
 (10,'Notaio','Notaio','2011-05-25 18:53:09','0000-00-00 00:00:00',0,0),
 (11,'Arch.','Architetto','2011-05-25 18:53:09','0000-00-00 00:00:00',0,0),
 (12,'Banca','Banca','2011-05-25 18:53:09','0000-00-00 00:00:00',0,1),
 (13,'Comune','Comune','2011-05-25 18:53:09','0000-00-00 00:00:00',0,1),
 (14,'Uff.','Ufficio','2011-05-25 18:53:09','0000-00-00 00:00:00',0,1);
UNLOCK TABLES;
/*!40000 ALTER TABLE `titles` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
