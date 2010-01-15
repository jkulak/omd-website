-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.51b-log


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema omnicom7
--


USE omnicom7;

--
-- Definition of table `omnicom7`.`ARTICLES`
--

CREATE TABLE  `omnicom7`.`ARTICLES` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(100) collate utf8_polish_ci default NULL,
  `lead` varchar(500) collate utf8_polish_ci default NULL,
  `content` varchar(10000) collate utf8_polish_ci default NULL,
  `added` datetime default NULL,
  `addedby` int(11) default NULL,
  `updated` datetime default NULL,
  `updatedby` int(11) default NULL,
  `activate` datetime default NULL,
  `deactivate` datetime default NULL,
  `status` enum('enabled','disabled','test') collate utf8_polish_ci NOT NULL default 'disabled',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `omnicom7`.`ARTICLES`
--

/*!40000 ALTER TABLE `ARTICLES` DISABLE KEYS */;
LOCK TABLES `ARTICLES` WRITE;
INSERT INTO `omnicom7`.`ARTICLES` VALUES  (1,'Pierwsza analiza','A to jest wstęp do pierwszej analizy','<p>Treść pierwszej analizy <strong>może byc pogrubiona</strong>. Wstępizzle</p>\n<p>&nbsp;</p>\n<p>Pozdrawiam,</p>\n<p>Kuba</p>',NULL,NULL,'2009-12-24 00:20:13',NULL,'2009-12-23 00:00:00','1900-11-30 00:00:00','enabled'),
 (2,'Brokuły z masłem','Lead do brokułek','<p>Retedgsfdg sfgsd</p>',NULL,NULL,'2009-12-24 00:22:06',NULL,'2009-12-13 00:00:00','0000-00-00 00:00:00','disabled'),
 (3,'Oczywiście tak powinno być','Test','<p>sdfafadsfasdfasdfasdf</p>',NULL,NULL,'2009-12-24 00:23:24',NULL,'2009-12-22 00:00:00','0000-00-00 00:00:00','disabled'),
 (4,'Czwarty zadje się','fsfsadfdfsfafd','<p>asdfasdfasdf</p>',NULL,NULL,'2009-12-24 00:24:22',NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','disabled'),
 (5,'sfasfasdf','asdfsadf','','2009-12-24 00:35:57',NULL,'2009-12-24 00:35:57',NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','disabled'),
 (6,'Materialistyczne podejście','Nigdy nie było doceniane','','2009-12-24 00:37:31',NULL,'2009-12-24 00:37:31',NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','disabled'),
 (7,'OMG Metrics wprowadza unikalne narzędzie ekonometryczne AdEffect, wspierające planowanie kampanii te','Dział Badań Omnicom Media Group, zakończył realizację dużego projektu ekonometrycznego, którego celem było ustalenie uniwersalnych determinant –czynników decydujących o skuteczności kampanii reklamowej.','<p>OMG Metrics wprowadza unikalne narzędzie ekonometryczne AdEffect, wspierające planowanie kampanii telewizyjnych ! <br /><br />Dział Badań Omnicom Media Group, zakończył realizację dużego projektu ekonometrycznego, kt&oacute;rego celem było ustalenie uniwersalnych determinant &ndash;czynnik&oacute;w decydujących o skuteczności kampanii reklamowej. W ramach projektu testowano wpływ ponad 20 czynnik&oacute;w potencjalnie warunkujących wynik świadomościowy kampanii telewizyjnych, m.in. wielkość i długość kampanii, dob&oacute;r stacji telewizyjnych, aktywność konkurencji, mix medi&oacute;w czy r&oacute;żnorodne aspekty kreacji spotu reklamowego. <br /><br />Końcowy model przedstawia w syntetyczny spos&oacute;b najsilniejsze i najbardziej stabilne zależności, wyodrębniając te elementy strategii reklamowej, kt&oacute;re mają wyraźne i konsekwentne przełożenie na mierzalne przyrosty świadomości marki oraz reklamy. <br /><br />Wyniki zostały opracowane w postaci narzędzia AdEffect, służącego do por&oacute;wnywania scenariuszy kampanii. Dzięki tej aplikacji planerzy w domach mediowych Optimum Media OMD, Macroscope OMD, PHD i Easymedia mogą obecnie przeliczać przewidywane przyrosty świadomości marki i reklamy w zależności od zdefiniowanych parametr&oacute;w kampanii i rekomendować optymalne rozwiązanie w zakresie np. intensywności kampanii, wsparcia kampanii TV w innych mediach, udziału PrimeTime&rsquo;u czy pozycji premiowanych. <br /><br />Powstały model ekonometryczny jest unikalny na skalę Polski - został zbudowany na podstawie wyjątkowo obszernej bazy danych, zawierającej wyniki wyłącznie z naszego rodzimego rynku. Dane wykorzystane w modelu pochodzą z wieloletniego monitoringu prowadzonego przez dział OMG Metrics, kt&oacute;ry od 2001 roku wykonuje trackingowe badania świadomości marki i reklamy. W rezultacie model opiera się na pomiarach zrealizowanych z wykorzystaniem jednolitej i stabilnej metodologii dla: <br /><br />&bull;&nbsp; 70 kategorii produktowych, reprezentujących przekr&oacute;j branż &ndash; od FMCG i OTC po produkty i usługi wysoko angażujące; <br />&bull;&nbsp; 714 marek o r&oacute;żnorodnym statusie rynkowym &ndash; od tych najsłabiej kojarzonych, poprzez marki sukcesywnie budujące własną świadomość, do najsilniejszych graczy z pozycją lider&oacute;w; <br />&bull;&nbsp; 1 034 kampanii reklamowych o zdefiniowanych parametrach mediowych (na podstawie panelu telemetrycznego AGB Nielsen i monitoringu Expert Monitor); <br />&bull;&nbsp; 4 353 spot&oacute;w telewizyjnych, opisanych na wielu wymiarach określających jakość kreacji reklamowej. <br /><br />Dysponując tak rozbudowaną bazą obserwacji empirycznych, OMG Metrics stworzył model ekonometryczny, wyłaniający generalne zależności dotyczące wpływu reklamy telewizyjnej na wskaźniki świadomościowe. AdEffect opisuje w spos&oacute;b ilościowy uniwersalne prawidłowości, stwierdzone dla większości badanych 714 marek i 70 kategorii. W oparciu o twarde, liczbowe dane oraz zaawansowane analizy statystyczne, dostarcza odpowiedzi na wiele powtarzających się pytań z obszaru planowania medi&oacute;w, a przede wszystkim wskazuje jak najefektywniej rozdysponować budżet reklamowy Klient&oacute;w. <br /><br /><br />Więcej informacji na stronie internetowej: http://www.omgmetrics.pl/?mod=adeffect</p>','2009-12-24 00:44:20',NULL,'2009-12-24 00:46:34',NULL,'2009-12-22 00:00:00','1900-11-30 00:00:00','disabled'),
 (8,'Optimum Media OMD pierwszy na Twitterze!','Optimum Media OMD, pierwszy dom mediowy w Polsce, który zdobył Złotego Lwa w Cannes, jeden z pierwszych domów mediowych na polskim rynku reklamowym – teraz jako pierwszy polski dom mediowy jest obecny na www.twitter.com.','','2009-12-24 01:27:00',NULL,'2009-12-24 01:27:00',NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','disabled');
UNLOCK TABLES;
/*!40000 ALTER TABLE `ARTICLES` ENABLE KEYS */;


--
-- Definition of table `omnicom7`.`CATEGORIES`
--

CREATE TABLE  `omnicom7`.`CATEGORIES` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(45) collate utf8_polish_ci NOT NULL,
  `added` datetime default NULL,
  `addedby` int(11) default NULL,
  `updated` datetime default NULL,
  `updatedby` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `omnicom7`.`CATEGORIES`
--

/*!40000 ALTER TABLE `CATEGORIES` DISABLE KEYS */;
LOCK TABLES `CATEGORIES` WRITE;
INSERT INTO `omnicom7`.`CATEGORIES` VALUES  (1,'sdfsdfsd','2009-12-23 23:10:57',NULL,'2009-12-23 23:10:57',NULL),
 (2,'AktualnoÅ›ci','2009-12-23 23:11:24',NULL,'2009-12-23 23:11:24',NULL),
 (3,'Analizy i publikacje 2009','2009-12-23 23:11:49',NULL,'2009-12-23 23:11:49',NULL),
 (4,'dfsfsdf','2009-12-24 00:27:04',NULL,'2009-12-24 00:27:04',NULL),
 (5,'asdfasdfsdaf','2009-12-24 00:27:09',NULL,'2009-12-24 00:27:09',NULL);
UNLOCK TABLES;
/*!40000 ALTER TABLE `CATEGORIES` ENABLE KEYS */;


--
-- Definition of table `omnicom7`.`CATEGORIES_has_ARTICLES`
--

CREATE TABLE  `omnicom7`.`CATEGORIES_has_ARTICLES` (
  `CATEGORIES_id` int(11) NOT NULL,
  `ARTICLES_id` int(11) NOT NULL,
  PRIMARY KEY  (`CATEGORIES_id`,`ARTICLES_id`),
  KEY `fk_CATEGORIES_has_ARTICLES_CATEGORIES` (`CATEGORIES_id`),
  KEY `fk_CATEGORIES_has_ARTICLES_ARTICLES` (`ARTICLES_id`),
  CONSTRAINT `fk_CATEGORIES_has_ARTICLES_ARTICLES` FOREIGN KEY (`ARTICLES_id`) REFERENCES `articles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_CATEGORIES_has_ARTICLES_CATEGORIES` FOREIGN KEY (`CATEGORIES_id`) REFERENCES `categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `omnicom7`.`CATEGORIES_has_ARTICLES`
--

/*!40000 ALTER TABLE `CATEGORIES_has_ARTICLES` DISABLE KEYS */;
LOCK TABLES `CATEGORIES_has_ARTICLES` WRITE;
INSERT INTO `omnicom7`.`CATEGORIES_has_ARTICLES` VALUES  (2,1),
 (2,2),
 (2,3),
 (2,4),
 (2,6),
 (2,7),
 (2,8),
 (3,5);
UNLOCK TABLES;
/*!40000 ALTER TABLE `CATEGORIES_has_ARTICLES` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
