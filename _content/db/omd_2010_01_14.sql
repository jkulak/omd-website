-- MySQL dump 10.11
--
-- Host: localhost    Database: hhbd_omd
-- ------------------------------------------------------
-- Server version	5.0.51b-log

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
-- Table structure for table `ARTICLES`
--

DROP TABLE IF EXISTS `ARTICLES`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `ARTICLES` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(500) collate utf8_polish_ci default NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `ARTICLES`
--

LOCK TABLES `ARTICLES` WRITE;
/*!40000 ALTER TABLE `ARTICLES` DISABLE KEYS */;
INSERT INTO `ARTICLES` VALUES (1,'Pierwsza analiza','A to jest wstęp do pierwszej analizy','<p>Treść pierwszej analizy <strong>może byc pogrubiona</strong>. Wstępizzle</p>\n<p>&nbsp;</p>\n<p>Pozdrawiam,</p>\n<p>Kuba</p>',NULL,NULL,'2009-12-24 00:20:13',NULL,'2009-12-23 00:00:00','1900-11-30 00:00:00','enabled'),(2,'Brokuły z masłem','Lead do brokułek','<p>Retedgsfdg sfgsd</p>',NULL,NULL,'2009-12-24 00:22:06',NULL,'2009-12-13 00:00:00','0000-00-00 00:00:00','disabled'),(3,'Oczywiście tak powinno być','Test','<p>sdfafadsfasdfasdfasdf</p>',NULL,NULL,'2009-12-24 00:23:24',NULL,'2009-12-22 00:00:00','0000-00-00 00:00:00','disabled'),(4,'Czwarty zadje się','fsfsadfdfsfafd','<p>asdfasdfasdf</p>',NULL,NULL,'2009-12-24 00:24:22',NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','disabled'),(5,'Marcin Winkler dyrektorem zarządzającym Optimum Media OMD','','<p><a href=\"public/useruploads/files/press_2009_07_01_marcin_winkler_dyrektorem_zarzĄdzajĄcym_optimum_media_omd.pdf\">Pobierz plik</a></p>','2009-12-24 00:35:57',NULL,'2010-01-14 23:28:26',NULL,'2009-07-01 00:00:00','1899-12-31 00:00:00','disabled'),(6,'Materialistyczne podejście','Nigdy nie było doceniane','','2009-12-24 00:37:31',NULL,'2009-12-24 00:37:31',NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','disabled'),(7,'OMG Metrics wprowadza unikalne narzędzie ekonometryczne AdEffect, wspierające planowanie kampanii telewizyjnych!','Dział Badań Omnicom Media Group, zakończył realizację dużego projektu ekonometrycznego, którego celem było ustalenie uniwersalnych determinant –czynników decydujących o skuteczności kampanii reklamowej.','<p>Dział Badań Omnicom Media Group, zakończył realizację dużego projektu ekonometrycznego, kt&oacute;rego celem było ustalenie uniwersalnych determinant &ndash;czynnik&oacute;w decydujących o skuteczności kampanii reklamowej. W ramach projektu testowano wpływ ponad 20 czynnik&oacute;w potencjalnie warunkujących wynik świadomościowy kampanii telewizyjnych, m.in. wielkość i długość kampanii, dob&oacute;r stacji telewizyjnych, aktywność konkurencji, mix medi&oacute;w czy r&oacute;żnorodne aspekty kreacji spotu reklamowego. <br /><br />Końcowy model przedstawia w syntetyczny spos&oacute;b najsilniejsze i najbardziej stabilne zależności, wyodrębniając te elementy strategii reklamowej, kt&oacute;re mają wyraźne i konsekwentne przełożenie na mierzalne przyrosty świadomości marki oraz reklamy. <br /><br />Wyniki zostały opracowane w postaci narzędzia AdEffect, służącego do por&oacute;wnywania scenariuszy kampanii. Dzięki tej aplikacji planerzy w domach mediowych Optimum Media OMD, Macroscope OMD, PHD i Easymedia mogą obecnie przeliczać przewidywane przyrosty świadomości marki i reklamy w zależności od zdefiniowanych parametr&oacute;w kampanii i rekomendować optymalne rozwiązanie w zakresie np. intensywności kampanii, wsparcia kampanii TV w innych mediach, udziału PrimeTime&rsquo;u czy pozycji premiowanych. <br /><br />Powstały model ekonometryczny jest unikalny na skalę Polski - został zbudowany na podstawie wyjątkowo obszernej bazy danych, zawierającej wyniki wyłącznie z naszego rodzimego rynku. Dane wykorzystane w modelu pochodzą z wieloletniego monitoringu prowadzonego przez dział OMG Metrics, kt&oacute;ry od 2001 roku wykonuje trackingowe badania świadomości marki i reklamy. W rezultacie model opiera się na pomiarach zrealizowanych z wykorzystaniem jednolitej i stabilnej metodologii dla: <br /><br /></p>\n<ul>\n<li>70 kategorii produktowych, reprezentujących przekr&oacute;j branż &ndash; od FMCG i OTC po produkty i usługi wysoko angażujące; </li>\n<li>714 marek o r&oacute;żnorodnym statusie rynkowym &ndash; od tych najsłabiej kojarzonych, poprzez marki sukcesywnie budujące własną świadomość, do najsilniejszych graczy z pozycją lider&oacute;w; </li>\n<li>1 034 kampanii reklamowych o zdefiniowanych parametrach mediowych (na podstawie panelu telemetrycznego AGB Nielsen i monitoringu Expert Monitor); </li>\n<li>4 353 spot&oacute;w telewizyjnych, opisanych na wielu wymiarach określających jakość kreacji reklamowej. </li>\n</ul>\n<p><br />Dysponując tak rozbudowaną bazą obserwacji empirycznych, OMG Metrics stworzył model ekonometryczny, wyłaniający generalne zależności dotyczące wpływu reklamy telewizyjnej na wskaźniki świadomościowe. AdEffect opisuje w spos&oacute;b ilościowy uniwersalne prawidłowości, stwierdzone dla większości badanych 714 marek i 70 kategorii. W oparciu o twarde, liczbowe dane oraz zaawansowane analizy statystyczne, dostarcza odpowiedzi na wiele powtarzających się pytań z obszaru planowania medi&oacute;w, a przede wszystkim wskazuje jak najefektywniej rozdysponować budżet reklamowy Klient&oacute;w. <br /><br /><br />Więcej informacji na stronie internetowej: http://www.omgmetrics.pl/?mod=adeffect</p>','2009-12-24 00:44:20',NULL,'2010-01-13 19:45:55',NULL,'2009-12-01 00:00:00','1900-11-30 00:00:00','disabled'),(8,'Optimum Media OMD pierwszy na Twitterze!','Optimum Media OMD, pierwszy dom mediowy w Polsce, który zdobył Złotego Lwa w Cannes, jeden z pierwszych domów mediowych na polskim rynku reklamowym – teraz jako pierwszy polski dom mediowy jest obecny na www.twitter.com.','','2009-12-24 01:27:00',NULL,'2009-12-24 01:27:00',NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00','disabled'),(9,'O nas','','<p>Optimum Media OMD to jeden z najbardziej doświadczonych dom&oacute;w mediowych Polsce &ndash; planujemy i kupujemy media, przygotowujemy analizy oraz strategie mediowe i doradzamy Klientom w prowadzeniu kampanii reklamowych w mediach już od 1993 roku.</p>\n<p><img style=\"margin-left: 15px; float: right;\" src=\"http://omd.kosiarka/public/images/cannes-media-lion-omd4.jpg\" alt=\"Nagroda Cannes Golden Lion dla OMD\" /></p>\n<p>Dbamy o <strong>oryginalne wykorzystanie medi&oacute;w w ciekawy, nowatorski spos&oacute;b</strong>, dzięki kt&oacute;remu kampanie reklamowe marek naszych Klient&oacute;w zostaną lepiej zauważone i zapamiętane przez grupę celową. Jesteśmy dumni ze zdobycia najważniejszej, najbardziej prestiżowej, międzynarodowej nagrody za pracę agencji marketingowych &ndash; <strong>Cannes Golden Lion</strong>!</p>\n<p>Jednym z podstawowych kryteri&oacute;w naszych rekomendacji jest <strong>efektywność i optymalizacja wydatk&oacute;w mediowych</strong> w kampaniach, kt&oacute;re realizujemy. <a href=\"http://omd.kosiarka/narzedzia.html\">Osiągamy je dzięki narzędziom</a> - zar&oacute;wno sieciowym, jak i autorskim &ndash; dopasowanym do reali&oacute;w polskiego rynku medi&oacute;w i sposobu konsumpcji medi&oacute;w w Polsce - narzędziom stworzonym, rozwijanym i doskonalonym przez dział Software Development Omnicom Media Group.</p>\n<p>W trzech zespołach Optimum Media OMD pracują <strong>doświadczeni Accounci, Plannerzy i Buyerzy</strong> &ndash; ludzie o r&oacute;żnorodnych osobowościach, zainteresowaniach i temperamentach, kt&oacute;rzy potrafią zrozumieć i z obustronną satysfakcją wsp&oacute;łpracować z wieloma Klientami.</p>','2010-01-13 19:55:54',NULL,'2010-01-13 20:32:48',NULL,'2010-01-13 00:00:00','2010-01-13 00:00:00','disabled'),(10,'Sieć OMD','','<p>Optimum Media OMD jest jednym z oddział&oacute;w OMD &ndash; międzynarodowej sieci dom&oacute;w mediowych operującej na około 100 rynkach każdego z region&oacute;w świata. OMD należy do jednego z największych holding&oacute;w komunikacyjnych na świecie &ndash; OmnicomGroup, notowanego na Nowojorskiej Giełdzie Papier&oacute;w Wartościowych.</p>\n<p>Według The Gunn Report for Media OMD to najbardziej kreatywna agencja na świecie (the \"Most Creative Media Agency in the World\"), utytułowana także przez Adweek jako &ldquo;Global Media Agency&rdquo; of the Year oraz przez Campaign uznana za Media Network of the Year.</p>\n<p><a title=\"OMD\" href=\"http://www.omd.com\" target=\"_blank\">Dowiedz się więcej &gt;&gt;</a></p>\n<p><a href=\"http://www.omd.com\" target=\"_blank\"><img src=\"public/useruploads/images/omd-map-pl2.jpg\" alt=\"\" width=\"564\" height=\"261\" /></a></p>\n<p><img src=\"public/useruploads/images/omd.gif\" alt=\"\" width=\"199\" height=\"44\" /></p>','2010-01-13 20:33:24',NULL,'2010-01-14 19:58:59',NULL,'2010-01-13 00:00:00','1899-12-31 00:00:00','disabled');
/*!40000 ALTER TABLE `ARTICLES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CATEGORIES`
--

DROP TABLE IF EXISTS `CATEGORIES`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `CATEGORIES` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(45) collate utf8_polish_ci NOT NULL,
  `added` datetime default NULL,
  `addedby` int(11) default NULL,
  `updated` datetime default NULL,
  `updatedby` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `CATEGORIES`
--

LOCK TABLES `CATEGORIES` WRITE;
/*!40000 ALTER TABLE `CATEGORIES` DISABLE KEYS */;
INSERT INTO `CATEGORIES` VALUES (2,'AktualnoÅ›ci','2009-12-23 23:11:24',NULL,'2009-12-23 23:11:24',NULL),(3,'Analizy i publikacje 2009','2009-12-23 23:11:49',NULL,'2009-12-23 23:11:49',NULL),(6,'Strony','2010-01-13 19:55:14',NULL,'2010-01-13 19:55:14',NULL);
/*!40000 ALTER TABLE `CATEGORIES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CATEGORIES_has_ARTICLES`
--

DROP TABLE IF EXISTS `CATEGORIES_has_ARTICLES`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `CATEGORIES_has_ARTICLES` (
  `CATEGORIES_id` int(11) NOT NULL,
  `ARTICLES_id` int(11) NOT NULL,
  PRIMARY KEY  (`CATEGORIES_id`,`ARTICLES_id`),
  KEY `fk_CATEGORIES_has_ARTICLES_CATEGORIES` (`CATEGORIES_id`),
  KEY `fk_CATEGORIES_has_ARTICLES_ARTICLES` (`ARTICLES_id`),
  CONSTRAINT `fk_CATEGORIES_has_ARTICLES_ARTICLES` FOREIGN KEY (`ARTICLES_id`) REFERENCES `articles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_CATEGORIES_has_ARTICLES_CATEGORIES` FOREIGN KEY (`CATEGORIES_id`) REFERENCES `categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `CATEGORIES_has_ARTICLES`
--

LOCK TABLES `CATEGORIES_has_ARTICLES` WRITE;
/*!40000 ALTER TABLE `CATEGORIES_has_ARTICLES` DISABLE KEYS */;
INSERT INTO `CATEGORIES_has_ARTICLES` VALUES (2,1),(2,2),(2,3),(2,4),(2,6),(2,7),(2,8),(3,5),(6,9),(6,10);
/*!40000 ALTER TABLE `CATEGORIES_has_ARTICLES` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-01-15  0:16:56
