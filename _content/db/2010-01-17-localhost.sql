-- phpMyAdmin SQL Dump
-- version 2.9.2
-- http://www.phpmyadmin.net
-- 
-- Host: localhost
-- Generation Time: Jan 17, 2010 at 11:03 PM
-- Server version: 5.0.66
-- PHP Version: 5.2.6
-- 
-- Database: `omnicom7`
-- 
DROP DATABASE `hhbd_omd`;
CREATE DATABASE `hhbd_omd` DEFAULT CHARACTER SET utf8 COLLATE utf8_polish_ci;
USE `hhbd_omd`;

-- --------------------------------------------------------

-- 
-- Table structure for table `ARTICLES`
-- 

DROP TABLE IF EXISTS `ARTICLES`;
CREATE TABLE IF NOT EXISTS `ARTICLES` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=19 ;

-- 
-- Dumping data for table `ARTICLES`
-- 

INSERT INTO `ARTICLES` VALUES (5, 'Marcin Winkler dyrektorem zarządzającym Optimum Media OMD', '', '<p>Marcin Winkler<a href="../public/useruploads/files/press_2009_07_01_marcin_winkler_dyrektorem_zarzadzajacym_optimum_media_omd.pdf"> <br /><br />Pobierz plik</a></p>', '2009-12-24 00:35:57', NULL, '2010-01-15 14:57:16', NULL, '2009-07-01 00:00:00', '1899-12-31 00:00:00', 'disabled');
INSERT INTO `ARTICLES` VALUES (6, 'Materialistyczne podejście', 'Nigdy nie było doceniane', '', '2009-12-24 00:37:31', NULL, '2009-12-24 00:37:31', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'disabled');
INSERT INTO `ARTICLES` VALUES (7, 'OMG Metrics wprowadza unikalne narzędzie ekonometryczne AdEffect, wspierające planowanie kampanii telewizyjnych!', 'Dział Badań Omnicom Media Group, zakończył realizację dużego projektu ekonometrycznego, którego celem było ustalenie uniwersalnych determinant –czynników decydujących o skuteczności kampanii reklamowej.', '<p>Dział Badań Omnicom Media Group, zakończył realizację dużego projektu ekonometrycznego, kt&oacute;rego celem było ustalenie uniwersalnych determinant &ndash;czynnik&oacute;w decydujących o skuteczności kampanii reklamowej. W ramach projektu testowano wpływ ponad 20 czynnik&oacute;w potencjalnie warunkujących wynik świadomościowy kampanii telewizyjnych, m.in. wielkość i długość kampanii, dob&oacute;r stacji telewizyjnych, aktywność konkurencji, mix medi&oacute;w czy r&oacute;żnorodne aspekty kreacji spotu reklamowego. <br /><br />Końcowy model przedstawia w syntetyczny spos&oacute;b najsilniejsze i najbardziej stabilne zależności, wyodrębniając te elementy strategii reklamowej, kt&oacute;re mają wyraźne i konsekwentne przełożenie na mierzalne przyrosty świadomości marki oraz reklamy. <br /><br />Wyniki zostały opracowane w postaci narzędzia AdEffect, służącego do por&oacute;wnywania scenariuszy kampanii. Dzięki tej aplikacji planerzy w domach mediowych Optimum Media OMD, Macroscope OMD, PHD i Easymedia mogą obecnie przeliczać przewidywane przyrosty świadomości marki i reklamy w zależności od zdefiniowanych parametr&oacute;w kampanii i rekomendować optymalne rozwiązanie w zakresie np. intensywności kampanii, wsparcia kampanii TV w innych mediach, udziału PrimeTime&rsquo;u czy pozycji premiowanych. <br /><br />Powstały model ekonometryczny jest unikalny na skalę Polski - został zbudowany na podstawie wyjątkowo obszernej bazy danych, zawierającej wyniki wyłącznie z naszego rodzimego rynku. Dane wykorzystane w modelu pochodzą z wieloletniego monitoringu prowadzonego przez dział OMG Metrics, kt&oacute;ry od 2001 roku wykonuje trackingowe badania świadomości marki i reklamy. W rezultacie model opiera się na pomiarach zrealizowanych z wykorzystaniem jednolitej i stabilnej metodologii dla: <br /><br /></p>\n<ul>\n<li>70 kategorii produktowych, reprezentujących przekr&oacute;j branż &ndash; od FMCG i OTC po produkty i usługi wysoko angażujące; </li>\n<li>714 marek o r&oacute;żnorodnym statusie rynkowym &ndash; od tych najsłabiej kojarzonych, poprzez marki sukcesywnie budujące własną świadomość, do najsilniejszych graczy z pozycją lider&oacute;w; </li>\n<li>1 034 kampanii reklamowych o zdefiniowanych parametrach mediowych (na podstawie panelu telemetrycznego AGB Nielsen i monitoringu Expert Monitor); </li>\n<li>4 353 spot&oacute;w telewizyjnych, opisanych na wielu wymiarach określających jakość kreacji reklamowej. </li>\n</ul>\n<p><br />Dysponując tak rozbudowaną bazą obserwacji empirycznych, OMG Metrics stworzył model ekonometryczny, wyłaniający generalne zależności dotyczące wpływu reklamy telewizyjnej na wskaźniki świadomościowe. AdEffect opisuje w spos&oacute;b ilościowy uniwersalne prawidłowości, stwierdzone dla większości badanych 714 marek i 70 kategorii. W oparciu o twarde, liczbowe dane oraz zaawansowane analizy statystyczne, dostarcza odpowiedzi na wiele powtarzających się pytań z obszaru planowania medi&oacute;w, a przede wszystkim wskazuje jak najefektywniej rozdysponować budżet reklamowy Klient&oacute;w. <br /><br /><br />Więcej informacji na stronie internetowej: http://www.omgmetrics.pl/?mod=adeffect</p>', '2009-12-24 00:44:20', NULL, '2010-01-15 13:08:10', NULL, '2009-12-01 00:00:00', '1900-11-30 00:00:00', 'enabled');
INSERT INTO `ARTICLES` VALUES (8, 'Optimum Media OMD pierwszy na Twitterze!', 'Optimum Media OMD, pierwszy dom mediowy w Polsce, który zdobył Złotego Lwa w Cannes, jeden z pierwszych domów mediowych na polskim rynku reklamowym – teraz jako pierwszy polski dom mediowy jest obecny na www.twitter.com.', '<p>Optimum Media OMD, pierwszy dom mediowy w Polsce, kt&oacute;ry zdobył Złotego Lwa w Cannes, jeden z pierwszych dom&oacute;w mediowych na polskim rynku reklamowym &ndash; teraz jako pierwszy polski dom mediowy jest obecny na www.twitter.com.</p>', '2009-12-24 01:27:00', NULL, '2010-01-15 13:08:56', NULL, '2009-07-24 00:00:00', '0000-00-00 00:00:00', 'enabled');
INSERT INTO `ARTICLES` VALUES (9, 'O nas', '', '<p>Optimum Media OMD to jeden z najbardziej doświadczonych dom&oacute;w mediowych Polsce!<br />Planujemy i kupujemy media, przygotowujemy analizy oraz strategie mediowe i doradzamy Klientom w prowadzeniu kampanii reklamowych w mediach już od 1993 roku.</p>\n<p><img style="margin-left: 15px; float: right;" src="../public/useruploads/images/cannes-media-lion-omd4.jpg" alt="Nagroda Cannes Golden Lion dla OMD" width="175" height="175" /></p>\n<p>Dbamy o <strong>oryginalne wykorzystanie medi&oacute;w w ciekawy, nowatorski spos&oacute;b</strong>, dzięki kt&oacute;remu kampanie reklamowe marek naszych Klient&oacute;w zostaną lepiej zauważone i zapamiętane przez grupę celową. Jesteśmy dumni ze zdobycia najważniejszej, najbardziej prestiżowej, międzynarodowej nagrody za pracę agencji marketingowych &ndash; <strong>Cannes Golden Lion</strong>!</p>\n<p>Jednym z podstawowych kryteri&oacute;w naszych rekomendacji jest <strong>efektywność i optymalizacja wydatk&oacute;w mediowych</strong> w kampaniach, kt&oacute;re realizujemy. Osiągamy je <a href="http://omd.kosiarka/narzedzia.html">dzięki narzędziom</a> - zar&oacute;wno sieciowym, jak i autorskim &ndash; dopasowanym do reali&oacute;w polskiego rynku medi&oacute;w i sposobu konsumpcji medi&oacute;w w Polsce - narzędziom stworzonym, rozwijanym i doskonalonym przez dział Software Development Omnicom Media Group.</p>\n<p>W trzech zespołach Optimum Media OMD pracują <strong>doświadczeni Accounci, Plannerzy i Buyerzy</strong> &ndash; ludzie o r&oacute;żnorodnych osobowościach, zainteresowaniach i temperamentach, kt&oacute;rzy potrafią zrozumieć i z obustronną satysfakcją wsp&oacute;łpracować z wieloma Klientami.</p>', '2010-01-13 19:55:54', NULL, '2010-01-15 14:58:55', NULL, '2010-01-13 00:00:00', '1899-12-31 00:00:00', 'enabled');
INSERT INTO `ARTICLES` VALUES (10, 'Sieć OMD', '', '<p>Optimum Media OMD jest jednym z oddział&oacute;w OMD &ndash; międzynarodowej sieci dom&oacute;w mediowych operującej na około 100 rynkach każdego z region&oacute;w świata. OMD należy do jednego z największych holding&oacute;w komunikacyjnych na świecie &ndash; OmnicomGroup, notowanego na Nowojorskiej Giełdzie Papier&oacute;w Wartościowych.</p>\n<p>Według The Gunn Report for Media OMD to najbardziej kreatywna agencja na świecie (the "Most Creative Media Agency in the World"), utytułowana także przez Adweek jako &ldquo;Global Media Agency&rdquo; of the Year oraz przez Campaign uznana za Media Network of the Year.</p>\n<p><a title="OMD" href="http://www.omd.com" target="_blank">Dowiedz się więcej &raquo;</a></p>\n<p><a href="http://www.omd.com" target="_blank"><img style="border: 0pt none;" src="../public/useruploads/images/omd-map-pl2.jpg" alt="" width="550" height="255" /></a></p>\n<p><img src="../public/useruploads/images/omd.gif" alt="" width="199" height="44" /></p>', '2010-01-13 20:33:24', NULL, '2010-01-15 13:49:30', NULL, '2010-01-13 00:00:00', '1899-12-31 00:00:00', 'enabled');
INSERT INTO `ARTICLES` VALUES (11, 'Boss na bessę w Optimum Media OMD', '', '<p><a href="../public/useruploads/files/media_i_marketing_polska__2009_06_24_boss_na_besse_w_optimum_media_omd.pdf">pobierz plik</a></p>', '2010-01-15 12:37:54', NULL, '2010-01-15 13:52:44', NULL, '2009-06-24 00:00:00', '1899-12-31 00:00:00', 'enabled');
INSERT INTO `ARTICLES` VALUES (12, 'Prasa latem nadal ma potencjał - Media i Marketing Polska', '', '<p><br />"Jak co roku o tej porze stajemy przed dylematem, co zrobić, by jak najsensowniej zagospodarować wakacyjne budżety mediowe. Pytanie o sensownośćreklamy w prasie w wakacje należy analizowaćw dw&oacute;ch horyzontach: jeden dotyczy kampanii planowanych z dużym wyprzedzeniem, ...............................<a href="../public/useruploads/files/media_i_marketing_polska_2009_07_29_prasa_latem_nadal_ma_potencjal.pdf"><br /><br />Czytaj więcej - pobierz plik</a><br /><br /><em><br />Artykuł autorstwa Marcina Winklera, dyrektora zarządzającego Optimum media OMD</em></p>', '2010-01-15 12:43:49', NULL, '2010-01-15 16:15:14', NULL, '2009-07-29 00:00:00', '1899-12-31 00:00:00', 'enabled');
INSERT INTO `ARTICLES` VALUES (13, 'Raport nt rynku mediowego nr 1 2009 Optimum Media OMD', '', '<p><a href="../public/useruploads/files/2009.07.20_raport_nt_rynku_mediowego_nr_1_2009_optimum_media_omd.gif">pobierz plik</a></p>', '2010-01-15 12:45:59', NULL, '2010-01-15 13:53:11', NULL, '2009-07-20 00:00:00', '1899-12-31 00:00:00', 'enabled');
INSERT INTO `ARTICLES` VALUES (14, 'Trzy pytania do Marcina Winklera - Media i Marketing Polska', '', '<p><a href="../public/useruploads/files/media_i_marketing_polska_2009_09_09_trzy_pytania_do_marcina_winklera.pdf"><br /></a>Marcin Winkler odpowiada na pytania redakcji <em>Media i Marketing Polska</em>:</p>\n<ul>\n<li>110 tys. gwarantowanej sprzedaży - skąd takie asekuranctwo wydawcy "Dziennika Gazety Prawnej"?</li>\n<li>Kogo "Dziennik" może zyskać, a kogo stracić po fuzji z "Gazetą Prawną" ?</li>\n<li>Czy połączenie tytuł&oacute;w otwiera przed wydawcą nowe możliwości reklamowe ?</li>\n</ul>\n<p><a href="../public/useruploads/files/media_i_marketing_polska_2009_09_09_trzy_pytania_do_marcina_winklera.pdf"><br />Czytaj więcej - pobierz plik</a><br /><br /><br /></p>', '2010-01-15 12:52:06', NULL, '2010-01-15 15:57:52', NULL, '2009-09-09 00:00:00', '1899-12-31 00:00:00', 'enabled');
INSERT INTO `ARTICLES` VALUES (15, 'Przyczajony tygrys - Media i Marketing Polska', '', '<p><a href="../public/useruploads/files/media_i_marketing_polska_2009_10_21_przyczajony_tygrys.pdf"><br /></a>"Kiedy Marcin Winkler przejmował stery w Optimum Media OMD, scenariusz "zero strat i dwa budżety średniego kalibru" zakładał jako satysfakcjonujący na 2009 rok.(...)"<br /> <a href="../public/useruploads/files/media_i_marketing_polska_2009_10_21_przyczajony_tygrys.pdf"><br />Czytaj więcej - pobierz plik</a><br /><br /><br /></p>', '2010-01-15 12:52:50', NULL, '2010-01-15 16:09:25', NULL, '2009-10-21 00:00:00', '1899-12-31 00:00:00', 'enabled');
INSERT INTO `ARTICLES` VALUES (16, 'Raport specjalny: Bez fajerwerków, ale też bez dołka - Media i Marketing Polska', '', '<p><br />"Segment pism TV najsłabiej odczuwa kryzys na tle całego rynku prasowego. Rok 2009 był dla TV-guide''&oacute;w czasem bez rewolucji. Najwięcej nowości zaproponował Bauer, kt&oacute;ry pr&oacute;buje kreować nowy segment - dwutygodnik&oacute;w. (...)"<br /><a href="../public/useruploads/files/media_i_marketing_raport_specjalny_2009.10.21_bez_fajerwerkow_ale_tez_bez_dolka.pdf"><br />Czytaj więcej - pobierz plik</a><br /><em><br />Artykuł zawiera wypowiedź Marcina Winklera, dyrektora zarządzającego Optimum Media OMD<br /><br /><br /></em></p>', '2010-01-15 12:54:20', NULL, '2010-01-15 15:47:48', NULL, '2009-10-21 00:00:00', '1899-12-31 00:00:00', 'enabled');
INSERT INTO `ARTICLES` VALUES (17, 'Ślepy zaułek - Media i Marketing Polska', '', '<p><br />"Logika sprzedawc&oacute;w powierzchni reklamowej jest pokrętna: wprowadzając coraz większe, irytujące internaut&oacute;w formy reklamy, tłumaczą, że robią to dla dobra rynku zdominowanego przez agresywne formaty. (...)"<a href="../public/useruploads/files/media_i_marketing_polska_2009_11_11_slepy_zaulek.pdf"><br /><br />Czytaj więcej - pobierz plik</a><br /><br /><br /><em>Arytkuł zawiera wypowiedź Arkadiusza Miegonia, Interactive Strategy Accounta Optimum Media OMD</em><br /><br /><br /></p>', '2010-01-15 12:55:44', NULL, '2010-01-15 15:52:13', NULL, '2009-11-11 00:00:00', '1899-12-31 00:00:00', 'enabled');
INSERT INTO `ARTICLES` VALUES (18, 'Wątła stabilizacja - Media i Marketing Polska', '', '<p><br />"Permanentne negocjacje mogą sie powt&oacute;rzyć także w 2010 r. Marketerzy chcą zostać w raju cenowym upływającego roku, a dostawc&oacute;w nie staćna jego finansowanie. Średnia z prognoz przyszłorocznej dynamiki rynku r&oacute;wna się zero. (...)"<br /><a href="public/useruploads/files/media_i_marketing_polska_2009_12_23_watla_stabilizacja.pdf"><br />Czytaj więcej - pobierz plik<br /><br /><br /></a><em>Artykuł zawiera komentarz Marcina Winklera, dyrektora zarządzającego Optimum Media OMD</em><br /><br /><br /></p>', '2010-01-15 13:00:23', NULL, '2010-01-15 19:00:25', NULL, '2009-12-23 00:00:00', '1899-12-31 00:00:00', 'enabled');

-- --------------------------------------------------------

-- 
-- Table structure for table `CATEGORIES`
-- 

DROP TABLE IF EXISTS `CATEGORIES`;
CREATE TABLE IF NOT EXISTS `CATEGORIES` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(45) collate utf8_polish_ci NOT NULL,
  `added` datetime default NULL,
  `addedby` int(11) default NULL,
  `updated` datetime default NULL,
  `updatedby` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=7 ;

-- 
-- Dumping data for table `CATEGORIES`
-- 

INSERT INTO `CATEGORIES` VALUES (2, 'Aktualnosci', '2009-12-23 23:11:24', NULL, '2010-01-15 12:27:09', NULL);
INSERT INTO `CATEGORIES` VALUES (3, 'Analizy i publikacje', '2009-12-23 23:11:49', NULL, '2010-01-15 12:26:44', NULL);
INSERT INTO `CATEGORIES` VALUES (6, 'Strony statyczne', '2010-01-13 19:55:14', NULL, '2010-01-15 23:51:31', NULL);

-- --------------------------------------------------------

-- 
-- Table structure for table `CATEGORIES_has_ARTICLES`
-- 

DROP TABLE IF EXISTS `CATEGORIES_has_ARTICLES`;
CREATE TABLE IF NOT EXISTS `CATEGORIES_has_ARTICLES` (
  `CATEGORIES_id` int(11) NOT NULL,
  `ARTICLES_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- 
-- Dumping data for table `CATEGORIES_has_ARTICLES`
-- 

INSERT INTO `CATEGORIES_has_ARTICLES` VALUES (2, 1);
INSERT INTO `CATEGORIES_has_ARTICLES` VALUES (2, 2);
INSERT INTO `CATEGORIES_has_ARTICLES` VALUES (2, 3);
INSERT INTO `CATEGORIES_has_ARTICLES` VALUES (2, 4);
INSERT INTO `CATEGORIES_has_ARTICLES` VALUES (3, 5);
INSERT INTO `CATEGORIES_has_ARTICLES` VALUES (2, 6);
INSERT INTO `CATEGORIES_has_ARTICLES` VALUES (2, 7);
INSERT INTO `CATEGORIES_has_ARTICLES` VALUES (2, 8);
INSERT INTO `CATEGORIES_has_ARTICLES` VALUES (6, 9);
INSERT INTO `CATEGORIES_has_ARTICLES` VALUES (6, 10);
INSERT INTO `CATEGORIES_has_ARTICLES` VALUES (3, 11);
INSERT INTO `CATEGORIES_has_ARTICLES` VALUES (3, 12);
INSERT INTO `CATEGORIES_has_ARTICLES` VALUES (3, 13);
INSERT INTO `CATEGORIES_has_ARTICLES` VALUES (3, 14);
INSERT INTO `CATEGORIES_has_ARTICLES` VALUES (3, 15);
INSERT INTO `CATEGORIES_has_ARTICLES` VALUES (3, 16);
INSERT INTO `CATEGORIES_has_ARTICLES` VALUES (3, 17);
INSERT INTO `CATEGORIES_has_ARTICLES` VALUES (3, 18);
INSERT INTO `CATEGORIES_has_ARTICLES` VALUES (3, 20);
INSERT INTO `CATEGORIES_has_ARTICLES` VALUES (2, 21);
