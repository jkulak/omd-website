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

CREATE DATABASE IF NOT EXISTS omnicom7;
USE omnicom7;

--
-- Definition of table `omnicom7`.`articles`
--

DROP TABLE IF EXISTS `omnicom7`.`articles`;
CREATE TABLE  `omnicom7`.`articles` (
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
  `status` enum('enabled','disabled','test','deleted') collate utf8_polish_ci NOT NULL default 'disabled',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `omnicom7`.`articles`
--

/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
LOCK TABLES `articles` WRITE;
INSERT INTO `omnicom7`.`articles` VALUES  (5,'\"Marcin Winkler dyrektorem zarządzającym Optimum Media OMD\" - Press','','<p>Marcin Winkler<a href=\"../public/useruploads/files/press_2009_07_01_marcin_winkler_dyrektorem_zarzadzajacym_optimum_media_omd.pdf\"> <br /><br />Pobierz plik</a></p>','2009-12-24 00:35:57',NULL,'2010-01-18 22:37:10',NULL,'2009-07-01 00:00:00','1899-12-31 00:00:00','disabled'),
 (6,'Marcin Winkler zostaje Dyrektorem Zarządzającym Optimum Media OMD','Z początkiem lipca br. Marcin Winkler zostaje Dyrektorem Zarządzającym domu mediowego Optimum Media OMD. Będzie odpowiedzialny za kierowanie całą agencją, a także pozyskiwanie nowych Klientów.','<p>Winkler ma siedmioletnie doświadczenie w pracy w marketingu i mediach. Przez ostatnie trzy lata był Group Account Directorem jednego z zespoł&oacute;w domu mediowego Macroscoe OMD &ndash; drugiego z oddział&oacute;w OMD Sp. z o. o. w Polsce. W tym czasie pracował dla Klient&oacute;w takich jak, m.in.: EFG Polbank, Bakoma, Perfetti Van Melle, HBO, oraz wcześniej dla: mBank, Multibank, Citroen, Henkel.<br /><br />W 2008 roku został także konsultantem ds. strategii mediowych dla Kaspi Banku, Klienta DDB w Polsce.</p>\n<p>Zanim rozpoczął pracę w Macroscope OMD przez dwa lata pracował w dziale marketingu TUI Poland.<br /><br />Marcin Winkler jest studentem Executive MBA na University of Chicago: Booth School of Business.</p>\n<p>Winkler zostaje mianowany Dyrektorem Zarządzającym Optimum Media OMD po rezygnacji Małgorzaty Baranowskiej z tego stanowiska, kt&oacute;ra zdecydowała się rozwijać swoją karierę zawodową na pozamediowym polu jej zainteresowań.<br /><br />&ldquo;Jestem ogromnie zadowolony, że Marcin podjął się kierowania jednym z najbardziej doświadczonych dom&oacute;w mediowych w Polsce &ndash; Optimum Media OMD. Jest świetnym managerem i strategiem, co udowodnił podczas kierowania zespołem w Macroscope OMD zdobywając najwyższe oceny Klient&oacute;w zar&oacute;wno dla zespołu, jak i siebie jako jego szefa. Także w wyniku jego profesjonalnego podejścia do pracy, client service&rsquo;u i zaangażowania dom mediowy Macroscope OMD trzykrotnie z rzędu osiągał stabilne drugie miejsce w ocenach Klient&oacute;w w badaniu &bdquo;Smile Check&rdquo; prowadzonym przez Stowarzyszenie Komunikacji Marketingowej SAR. Jestem przekonany, że doświadczenie, zalety i kompetencje Marcina Winklera pomogą w rozwoju i stabilizacji pozycji Optimum Media OMD jako domu mediowego cenionego przez Klient&oacute;w, jak i docenianego przez pracownik&oacute;w miejsca pracy, a także przyniesie przyszłe sukcesy na polu nowobiznesowym.&rdquo; &ndash; m&oacute;wi Jakub Bierzyński, CEO OmnicomMediaGroup.<br /><br /><img src=\"../public/useruploads/images/marcin_winkler_optimum_media_omd_068.jpg\" alt=\"\" width=\"2912\" height=\"4368\" /><br /><br /></p>','2009-12-24 00:37:31',NULL,'2010-01-18 17:07:17',NULL,'2009-06-09 00:00:00','1899-12-31 00:00:00','enabled'),
 (7,'OMG Metrics wprowadza unikalne narzędzie ekonometryczne AdEffect, wspierające planowanie kampanii telewizyjnych!','Dział Badań Omnicom Media Group, zakończył realizację dużego projektu ekonometrycznego, którego celem było ustalenie uniwersalnych determinant –czynników decydujących o skuteczności kampanii reklamowej.','<p>Dział Badań Omnicom Media Group, zakończył realizację dużego projektu ekonometrycznego, kt&oacute;rego celem było ustalenie uniwersalnych determinant &ndash;czynnik&oacute;w decydujących o skuteczności kampanii reklamowej. W ramach projektu testowano wpływ ponad 20 czynnik&oacute;w potencjalnie warunkujących wynik świadomościowy kampanii telewizyjnych, m.in. wielkość i długość kampanii, dob&oacute;r stacji telewizyjnych, aktywność konkurencji, mix medi&oacute;w czy r&oacute;żnorodne aspekty kreacji spotu reklamowego. <br /><br />Końcowy model przedstawia w syntetyczny spos&oacute;b najsilniejsze i najbardziej stabilne zależności, wyodrębniając te elementy strategii reklamowej, kt&oacute;re mają wyraźne i konsekwentne przełożenie na mierzalne przyrosty świadomości marki oraz reklamy. <br /><br />Wyniki zostały opracowane w postaci narzędzia AdEffect, służącego do por&oacute;wnywania scenariuszy kampanii. Dzięki tej aplikacji planerzy w domach mediowych Optimum Media OMD, Macroscope OMD, PHD i Easymedia mogą obecnie przeliczać przewidywane przyrosty świadomości marki i reklamy w zależności od zdefiniowanych parametr&oacute;w kampanii i rekomendować optymalne rozwiązanie w zakresie np. intensywności kampanii, wsparcia kampanii TV w innych mediach, udziału PrimeTime&rsquo;u czy pozycji premiowanych. <br /><br />Powstały model ekonometryczny jest unikalny na skalę Polski - został zbudowany na podstawie wyjątkowo obszernej bazy danych, zawierającej wyniki wyłącznie z naszego rodzimego rynku. Dane wykorzystane w modelu pochodzą z wieloletniego monitoringu prowadzonego przez dział OMG Metrics, kt&oacute;ry od 2001 roku wykonuje trackingowe badania świadomości marki i reklamy. W rezultacie model opiera się na pomiarach zrealizowanych z wykorzystaniem jednolitej i stabilnej metodologii dla: <br /><br /></p>\n<ul>\n<li>70 kategorii produktowych, reprezentujących przekr&oacute;j branż &ndash; od FMCG i OTC po produkty i usługi wysoko angażujące; </li>\n<li>714 marek o r&oacute;żnorodnym statusie rynkowym &ndash; od tych najsłabiej kojarzonych, poprzez marki sukcesywnie budujące własną świadomość, do najsilniejszych graczy z pozycją lider&oacute;w; </li>\n<li>1 034 kampanii reklamowych o zdefiniowanych parametrach mediowych (na podstawie panelu telemetrycznego AGB Nielsen i monitoringu Expert Monitor); </li>\n<li>4 353 spot&oacute;w telewizyjnych, opisanych na wielu wymiarach określających jakość kreacji reklamowej. </li>\n</ul>\n<p><br />Dysponując tak rozbudowaną bazą obserwacji empirycznych, OMG Metrics stworzył model ekonometryczny, wyłaniający generalne zależności dotyczące wpływu reklamy telewizyjnej na wskaźniki świadomościowe. AdEffect opisuje w spos&oacute;b ilościowy uniwersalne prawidłowości, stwierdzone dla większości badanych 714 marek i 70 kategorii. W oparciu o twarde, liczbowe dane oraz zaawansowane analizy statystyczne, dostarcza odpowiedzi na wiele powtarzających się pytań z obszaru planowania medi&oacute;w, a przede wszystkim wskazuje jak najefektywniej rozdysponować budżet reklamowy Klient&oacute;w. <br /><br /><br />Więcej informacji na stronie internetowej: <a href=\"http://www.omgmetrics.pl/?mod=adeffect\" target=\"_blank\">http://www.omgmetrics.pl/?mod=adeffect</a><br /><br /><br /></p>','2009-12-24 00:44:20',NULL,'2010-01-18 16:53:35',NULL,'2009-09-04 00:00:00','1900-11-30 00:00:00','enabled'),
 (8,'Zespół Optimum Media OMD zdobywcą trzeciego miejsca podczas warsztatów Broker FM','','<p>Zesp&oacute;ł domu mediowego Optimum Media OMD w składzie: Emilia Wilamowska, Andrzej Descours i Piotr Potulski podczas warsztat&oacute;w Broker FM zdobył trzecie miejsce za przygotowanie strategii mediowej optymalizującej media mix.<br /> <br /> Uczestnicy warsztat&oacute;w na kilka tygodni przed spotkaniem otrzymali brief do przygotowania optymalizacji strategii mediowej dla chips&oacute;w, kt&oacute;rą prezentowali przed jury składającym się z przedstawicieli Klient&oacute;w oraz organizatora Broker FM.<br /> <br /> Strategia stworzona przez zesp&oacute;ł domu mediowego Optimum Media OMD zyskała uznanie jury zdobywając trzecie miejsce spośr&oacute;d kilkunastu dom&oacute;w mediowych biorących udział w warsztatach i konkursie.</p>','2009-12-24 01:27:00',NULL,'2010-01-18 16:38:40',NULL,'2009-06-10 00:00:00','1899-12-31 00:00:00','enabled'),
 (9,'O nas','','<p><strong>Optimum Media OMD to jeden z najbardziej doświadczonych dom&oacute;w mediowych Polsce!</strong><br />Planujemy i kupujemy media, przygotowujemy analizy oraz strategie mediowe i doradzamy Klientom w prowadzeniu kampanii reklamowych w mediach już od 1993 roku.</p>\n<p><img style=\"margin-left: 15px; float: right;\" src=\"../public/useruploads/images/cannes-media-lion-omd4.jpg\" alt=\"Nagroda Cannes Golden Lion dla OMD\" width=\"175\" height=\"175\" /></p>\n<p><strong>Dbamy o </strong><strong>oryginalne wykorzystanie medi&oacute;w w ciekawy, nowatorski spos&oacute;b</strong>, dzięki kt&oacute;remu kampanie reklamowe marek naszych Klient&oacute;w zostaną lepiej zauważone i zapamiętane przez grupę celową.<br />Jesteśmy dumni ze zdobycia najważniejszej, najbardziej prestiżowej, międzynarodowej nagrody za pracę agencji marketingowych &ndash; <strong>Cannes Golden Lion</strong>!</p>\n<p>Jedne z podstawowych kryteri&oacute;w naszych rekomendacji to <strong>efektywność i optymalizacja wydatk&oacute;w mediowych</strong> w kampaniach, kt&oacute;re realizujemy. <strong>Osiągamy je m.in. <a href=\"http://omd.kosiarka/narzedzia.html\" target=\"_blank\">dzięki narzędziom</a></strong> - zar&oacute;wno sieciowym, jak i autorskim &ndash; dopasowanym do reali&oacute;w polskiego rynku medi&oacute;w i sposobu konsumpcji medi&oacute;w w Polsce - narzędziom stworzonym, rozwijanym i doskonalonym przez dział Software Development Omnicom Media Group.</p>\n<p>W trzech zespołach Optimum Media OMD pracują <strong>doświadczeni Accounci, Plannerzy i Buyerzy</strong> &ndash; ludzie o r&oacute;żnorodnych osobowościach, zainteresowaniach i temperamentach, kt&oacute;rzy potrafią zrozumieć i z obustronną satysfakcją wsp&oacute;łpracować z wieloma Klientami.</p>','2010-01-13 19:55:54',NULL,'2010-01-18 23:01:55',NULL,'2010-01-13 00:00:00','1899-12-31 00:00:00','enabled'),
 (10,'Sieć OMD','','<p>Optimum Media OMD jest jednym z oddział&oacute;w OMD &ndash; międzynarodowej sieci dom&oacute;w mediowych operującej<br />na około 100 rynkach każdego z region&oacute;w świata. OMD należy do jednego z największych holding&oacute;w komunikacyjnych na świecie &ndash; OmnicomGroup, notowanego na Nowojorskiej Giełdzie Papier&oacute;w Wartościowych.</p>\n<p>Według The Gunn Report for Media <strong>OMD to najbardziej kreatywna agencja na świecie</strong> (the \"Most Creative Media Agency in the World\"), utytułowana także przez AdWeek jako &ldquo;<strong>Global Media Agency of the Year</strong>\" oraz<br />przez Campaign uznana za <strong>Media Network of the Year</strong>.</p>\n<p><a title=\"OMD\" href=\"http://www.omd.com\" target=\"_blank\">Dowiedz się więcej &raquo;</a></p>\n<p><a href=\"http://www.omd.com\" target=\"_blank\"><img style=\"border: 0pt none;\" src=\"../public/useruploads/images/omd-map-pl2.jpg\" alt=\"\" width=\"550\" height=\"255\" /></a></p>\n<p><img src=\"../public/useruploads/images/omd.gif\" alt=\"\" width=\"199\" height=\"44\" /></p>','2010-01-13 20:33:24',NULL,'2010-01-18 22:45:41',NULL,'2010-01-13 00:00:00','1899-12-31 00:00:00','enabled'),
 (11,'\"Boss na bessę w Optimum Media OMD\" - Media i Marketing Polska','','<p><br />\"Marcin Winkler ma ustabilizować Optimum Media OMD (...) Nowy dyrektor ma opinię jednego z najlepszych menedżer&oacute;w Omnicom Media Group (...)\"<br /><br /><a href=\"../public/useruploads/files/media_i_marketing_polska__2009_06_24_boss_na_besse_w_optimum_media_omd.pdf\" target=\"_blank\">Czytaj więcej - pobierz plik</a><br /><br /><br /><br /></p>','2010-01-15 12:37:54',NULL,'2010-01-18 22:35:56',NULL,'2009-06-24 00:00:00','1899-12-31 00:00:00','enabled'),
 (12,'\"Prasa latem nadal ma potencjał\" - Media i Marketing Polska','','<p><br />\"Jak co roku o tej porze stajemy przed dylematem, co zrobić, by jak najsensowniej zagospodarować wakacyjne budżety mediowe. Pytanie o sensownośćreklamy w prasie w wakacje należy analizowaćw dw&oacute;ch horyzontach: jeden dotyczy kampanii planowanych z dużym wyprzedzeniem, kiedy rozważamy wachlarz możliwości komunikacyjnych i nie krępuje nas presja czasu, drugi związany jest z działaniami ad hoc, kiedy nie mamy pełnego wyboru. (...)\"<a href=\"../public/useruploads/files/media_i_marketing_polska_2009_07_29_prasa_latem_nadal_ma_potencjal.pdf\" target=\"_blank\"><br /><br />Czytaj więcej - pobierz plik</a><br /><br /><em><br />Artykuł autorstwa Marcina Winklera, dyrektora zarządzającego Optimum media OMD<br /><br /><br /><br /></em></p>','2010-01-15 12:43:49',NULL,'2010-01-18 22:36:25',NULL,'2009-07-29 00:00:00','1899-12-31 00:00:00','enabled'),
 (13,'Raport nt. rynku mediowego nr 1 2009','','<ul>\n<li>Rynek TV - w poszukiwaniu ceny r&oacute;wnowagi</li>\n<li>Czy warto reklamować się w prasie w wakacje ?&nbsp;</li>\n<li>Wakacje, czyli sezon og&oacute;rkowy w ram&oacute;wkach</li>\n</ul>\n<p><br /><a href=\"../public/useruploads/files/2009.07.20_raport_nt_rynku_mediowego_nr_1_2009_optimum_media_omd.gif\">Czytaj więcej - pobierz plik</a><br /><br /><br /><br /></p>','2010-01-15 12:45:59',NULL,'2010-01-18 22:27:50',NULL,'2009-07-20 00:00:00','1899-12-31 00:00:00','enabled'),
 (14,'\"Trzy pytania do Marcina Winklera\" - Media i Marketing Polska','','<p><a href=\"../public/useruploads/files/media_i_marketing_polska_2009_09_09_trzy_pytania_do_marcina_winklera.pdf\"><br /></a>Marcin Winkler odpowiada na pytania redakcji <em>Media i Marketing Polska</em>:</p>\n<ul>\n<li>110 tys. gwarantowanej sprzedaży - skąd takie asekuranctwo wydawcy \"Dziennika Gazety Prawnej\"?</li>\n<li>Kogo \"Dziennik\" może zyskać, a kogo stracić po fuzji z \"Gazetą Prawną\" ?</li>\n<li>Czy połączenie tytuł&oacute;w otwiera przed wydawcą nowe możliwości reklamowe ?</li>\n</ul>\n<p><a href=\"../public/useruploads/files/media_i_marketing_polska_2009_09_09_trzy_pytania_do_marcina_winklera.pdf\" target=\"_blank\"><br />Czytaj więcej - pobierz plik</a><br /><br /><br /><br /><br /></p>','2010-01-15 12:52:06',NULL,'2010-01-18 22:19:38',NULL,'2009-09-09 00:00:00','1899-12-31 00:00:00','enabled'),
 (15,'\"Przyczajony tygrys\" - Media i Marketing Polska','','<p><a href=\"../public/useruploads/files/media_i_marketing_polska_2009_10_21_przyczajony_tygrys.pdf\"><br /></a>\"Kiedy Marcin Winkler przejmował stery w Optimum Media OMD, scenariusz \"zero strat i dwa budżety średniego kalibru\" zakładał jako satysfakcjonujący na 2009 rok.(...)\"<br /> <a href=\"../public/useruploads/files/media_i_marketing_polska_2009_10_21_przyczajony_tygrys.pdf\" target=\"_blank\"><br />Czytaj więcej - pobierz plik</a><br /><br /><br /><br /><br /></p>','2010-01-15 12:52:50',NULL,'2010-01-18 22:20:51',NULL,'2009-10-21 00:00:00','1899-12-31 00:00:00','enabled'),
 (16,'Raport specjalny: \"Bez fajerwerków, ale też bez dołka\" - Media i Marketing Polska','','<p><br />\"Segment pism TV najsłabiej odczuwa kryzys na tle całego rynku prasowego. Rok 2009 był dla TV-guide\'&oacute;w czasem bez rewolucji. Najwięcej nowości zaproponował Bauer, kt&oacute;ry pr&oacute;buje kreować nowy segment - dwutygodnik&oacute;w. (...)\"<br /><a href=\"../public/useruploads/files/media_i_marketing_raport_specjalny_2009.10.21_bez_fajerwerkow_ale_tez_bez_dolka.pdf\"><br />Czytaj więcej - pobierz plik</a><br /><em><br />Artykuł zawiera wypowiedź Marcina Winklera, dyrektora zarządzającego Optimum Media OMD<br /><br /><br /><br /></em></p>','2010-01-15 12:54:20',NULL,'2010-01-18 22:16:15',NULL,'2009-10-21 00:00:00','1899-12-31 00:00:00','enabled'),
 (17,'\"Ślepy zaułek\" - Media i Marketing Polska','','<p><br />\"Logika sprzedawc&oacute;w powierzchni reklamowej jest pokrętna: wprowadzając coraz większe, irytujące internaut&oacute;w formy reklamy, tłumaczą, że robią to dla dobra rynku zdominowanego przez agresywne formaty. (...)\"<a href=\"../public/useruploads/files/media_i_marketing_polska_2009_11_11_slepy_zaulek.pdf\"><br /><br />Czytaj więcej - pobierz plik</a><br /><br /><br /><em>Arytkuł zawiera wypowiedź Arkadiusza Miegonia, Interactive Strategy Accounta Optimum Media OMD<br /></em><br /><br /><br /></p>','2010-01-15 12:55:44',NULL,'2010-01-18 22:15:35',NULL,'2009-11-11 00:00:00','1899-12-31 00:00:00','enabled'),
 (18,'\"Wątła stabilizacja\" - Media i Marketing Polska','','<p><br />\"Permanentne negocjacje mogą sie powt&oacute;rzyć także w 2010 r. Marketerzy chcą zostać w raju cenowym upływającego roku, a dostawc&oacute;w nie staćna jego finansowanie. Średnia z prognoz przyszłorocznej dynamiki rynku r&oacute;wna się zero. (...)\"<br /><a href=\"../public/useruploads/files/media_i_marketing_polska_2009_12_23_watla_stabilizacja.pdf\" target=\"_blank\"><br />Czytaj więcej - pobierz plik<br /><br /><br /></a><em>Artykuł zawiera komentarz Marcina Winklera, dyrektora zarządzającego Optimum Media OMD</em><br /><br /><br /></p>','2010-01-15 13:00:23',NULL,'2010-01-18 22:13:10',NULL,'2009-12-23 00:00:00','1899-12-31 00:00:00','enabled'),
 (19,'Optimum Media OMD pracuje dla Vitax - ruszyła pierwsza wspólna kampania !','Ruszyła nowa kampania Vitax TWOJA CHWILA !\nKampanię zaplanował i kupił dom mediowy Optimum Media OMD, który zdobył tego Klienta w przeglądzie ofert.','<p>Najnowsza reklama marki Vitax to reklama taktyczna, kt&oacute;rej celem jest przedstawienie charakteru i nastroju, jaki towarzyszy wyborowi i kosztowaniu linii herbat TWOJA CHWILA. Jest to pierwsza reklama, kt&oacute;ra przełamuje dotychczasową konwencję przedstawiania herbaty jako produktu. Kreacja spotu Vitax TWOJA CHWILA nie opowiada zwyczajnej, przyjemnej, typowo wizerunkowej historii przedstawiającej produkt bądź jego konsumpcję. Koncept reklamy opiera się na prostej analogii, kt&oacute;ra jednak w niekonwencjonalny spos&oacute;b wyjaśnia konsumentom, czym jest TWOJA CHWILA. Scena przedstawiająca wybieranie kanału w radiu szukając muzyki, na jaką mamy ochotę w danej chwili sugeruje i tłumaczy konsumentom, że mogą podobnie wybierać dowolny z r&oacute;żnorodnych smak&oacute;w herbaty Vitax TWOJA CHWILA w zależności od ich nastroju w danej chwili.</p>\n<p>Jednocześnie kampania nawiązuje do pozycjonowania marki: &bdquo;Vitax &ndash; naturalny wyb&oacute;r&rdquo; &ndash; wyb&oacute;r zawsze zgodny z upodobaniami, nastrojem i smakiem chwili.</p>\n<p>Pomysłodawcą reklamy jest poznańska agencja Soul and Mind, natomiast nad jego wykonaniem czuwała agencja HOSSA Advertising.<br /><br />Kampanię, kt&oacute;rą można zobaczyć w telewizji, zaplanował i kupił dom mediowy Optimum Media OMD, kt&oacute;ry zdobył tego Klienta w przeglądzie ofert. Dotychczas dla Vitax media planował Mediaedge:cia.<br /><br /><br /></p>','2010-01-18 16:26:45',NULL,'2010-01-18 16:33:59',NULL,'2009-11-04 00:00:00','1899-12-31 00:00:00','enabled'),
 (20,'d’aucy planuje media z Optimum Media OMD !','Firma d’aucy Polska Sp. z o.o. rozpoczęła współpracę z domem mediowym Optimum Media OMD.\n','<p>Firma d&rsquo;aucy Polska Sp. z o.o. rozpoczyna wsp&oacute;łpracę z domem mediowym &nbsp;Optimum Media OMD.<em><br /><br />d&rsquo;aucy</em> Polska wybrała dom mediowy Optimum Media OMD do obsługi budżetu marki <em>d&rsquo;aucy </em>w sezonie 2009&ndash;2010. Optimum Media OMD jest odpowiedzialny za stworzenie strategii medialnej, doradztwo reklamowe oraz zakup medi&oacute;w. Jednym z gł&oacute;wnym cel&oacute;w postawionych przed domem mediowym jest także zaplanowanie telewizyjnej kampanii reklamowej dla marki <em>d&rsquo;aucy.</em></p>\n<p>Optimum Media OMD został wybrany w drodze przetargu, do kt&oacute;rego zostało zaproszonych pięć czołowych dom&oacute;w mediowych i dział&oacute;w mediowych agencji reklamowych. O wyborze tej agencji zadecydowało dotychczasowe doświadczenie zespołu, kreatywne podejście do działań reklamowych oraz zrozumienie potrzeb klienta.<em>d&rsquo;aucy</em> to nowa marka na polskim rynku spożywczym. Na jej portfolio składa się około 50 produkt&oacute;w w dw&oacute;ch segmentach &ndash; warzyw i owoc&oacute;w mrożonych oraz warzyw w puszkach. Wiosną tego roku firma wprowadziła do sprzedaży pierwszą w Polsce linię ugotowanych warzyw mrożonych <em>d&rsquo;aucy heat&amp;eat</em>, kt&oacute;re można jeść natychmiast po rozmrożeniu &ndash; na zimno lub na ciepło. W ciągu 5-6 lat <em>d&rsquo;aucy </em>Polska planuje stać się jednym z lider&oacute;w rynku, zar&oacute;wno w segmencie produkt&oacute;w apertyzowanych, jak i mrożonych.<br /><br /><br /></p>\n<p class=\"Bezodstpw\"><strong><em>Informacje o d&rsquo;aucy Polska Sp. z o.o.</em></strong></p>\n<p>Firma <em>d&rsquo;aucy</em> Polska Sp. z o.o. łączy w sobie dwudziestoletnie doświadczenie Globus Polska w produkcji i sprzedaży mrożonek z sięgającym lat 60. XX wieku doświadczeniem grupy CECAB &ndash; producenta marki nr 1 na francuskim rynku warzyw w puszkach. Grupa CECAB zatrudnia 6000 pracownik&oacute;w. Swoją działalność koncentruje na pięciu obszarach biznesowych: rolnictwie, produkcji artykuł&oacute;w mrożonych i w puszkach, mięsa wieprzowego i drobiu oraz jaj i produkt&oacute;w jajecznych. Firma <em>d&rsquo;aucy</em> Polska zatrudnia ok. 500 pracownik&oacute;w i posiada cztery nowoczesne zakłady produkcyjne w Lipnie, Adamowie, Dąbrowie Chełmińskiej oraz Ełku. Wyroby firmy sprzedawane są na polskim rynku detalicznym pod marką <em>d&rsquo;aucy</em>. Jej portfolio w Polsce obejmuje 7 kategorii mrożonych warzyw i owoc&oacute;w, w tym innowacyjne <em>heat&amp;eat </em>oraz<em> fit mix, </em>a także 4 grupy produkt&oacute;w w puszkach, w tym <em>d&rsquo;aucy KIDS</em> oraz <em>francuskie smaki</em>, m.in. fasolkę szparagową <em>extra fine</em>. Wysoką jakość artykuł&oacute;w potwierdzają międzynarodowe certyfikaty HACCP, ISO 9001:2000 oraz British Retail Consortium Global Standard-Food.<br /><br /><br /></p>','2010-01-18 16:31:09',NULL,'2010-01-18 17:00:32',NULL,'2009-09-10 00:00:00','1899-12-31 00:00:00','enabled'),
 (21,'Optimum Media OMD pierwszy na Twitterze !','Optimum Media OMD, pierwszy dom mediowy w Polsce, który zdobył Złotego Lwa w Cannes, jeden z pierwszych domów mediowych na polskim rynku reklamowym – teraz jako pierwszy polski dom mediowy jest obecny na www.twitter.com.','<p>Użytkownik &bdquo;Optimum Media OMD&rdquo; dołączył do Twittera 14 lipca 2009 r. Publikuje wiadomości zar&oacute;wno branżowe, jak i dotyczące domu mediowego. Mikrobloguje nt. ciekawostek oraz news&oacute;w z ostatniej chwili w mediach, informacji merytorycznych dot. planowania i kupowania medi&oacute;w, zamieszcza ciekawe materiały z cyklu &bdquo;do poczytania&rdquo;, etc. Wyszukuje i śledzi tematy warte poruszenia i przekazania, by Klienci, sympatycy i <em>followerzy</em> byli wraz z Optimum Media OMD na bieżąco!</p>\n<p>&bdquo;Nasza aktywność na Twitterze&nbsp; to element strategii Optimum Media OMD, kt&oacute;ry kładzie nacisk na rozwijanie i wykorzystywanie w komunikacji marketingowej naszych Klient&oacute;w nowoczesnych medi&oacute;w, kt&oacute;rych podstawą jest Internet. Twitter to także doskonała platforma, by informować Klient&oacute;w i wszystkich zainteresowanych o ciekawych, ważnych, najnowszych tematach czy wydarzeniach zar&oacute;wno w mediach, jak i z życia agencji.&rdquo; &ndash; podkreśla Marcin Winkler, dyrektor zarządzający Optimum Media OMD.</p>\n<p>\"Serwisy mikroblogowe, przeżywające niewątpliwy boom popularności, coraz częściej wykorzystywane są przez marketer&oacute;w, jak choćby Nissan. Jego niepodważalną zaletą jest międzynarodowy charakter. &bdquo;<em>Świergot</em>&rdquo;, kt&oacute;ry doczekał się już rodzimych naśladowc&oacute;w, jak Blip.pl, zdobywa kolejnych użytkownik&oacute;w, zakochanych w zwięzłości 140-znakowej komunikacji, dlatego także my stwierdziliśmy, że komunikacja przez Twittera to coś, wobec czego jako dom mediowy nie możemy przejść obojętnie!&rdquo; &ndash; dodaje Arkadiusz Miegoń, Interactive Strategy Account Optimum Media OMD.<br /><br /><br />Zapraszamy ! - <a href=\"http://twitter.com/optimummediaomd\">http://twitter.com/optimummediaomd<br /><br /><br /></a></p>','2010-01-18 16:36:07',NULL,'2010-01-18 17:00:16',NULL,'2009-06-24 00:00:00','1899-12-31 00:00:00','enabled'),
 (22,'Agnieszka Szynal Group Account Directorem w Optimum Media OMD','Z początkiem kwietnia br. Agnieszka Szynal, dotąd Senior Account, awansowała na stanowisko Group Account Director przejmując jednocześnie pełne kierownictwo jednym z zespołów Optimum Media OMD.','<p>Z początkiem kwietnia br. Agnieszka Szynal, dotąd Senior Account, awansowała na stanowisko Group Account Director przejmując jednocześnie pełne kierownictwo jednym z zespoł&oacute;w od Małgorzaty Baranowskiej, kt&oacute;ra od jesieni 2008r. zarządza także całym Optimum Media OMD.<br />&nbsp;<br />Szynal odpowiada za pracę zespołu obsługującego takich Klient&oacute;w jak: Henkel, Sony czy Renault. &nbsp;<br /><br />W tym samym teamie na stanowisko Accounta awansował ponadto Grzegorz Deka. Deka dołączył do zespołu jesienią 2008, po przejściu do Optimum Media OMD z PHD &ndash; innego domu mediowego w strukturze OmnicomMediaGroup.</p>','2010-01-18 21:30:56',NULL,'2010-01-18 22:10:57',NULL,'2009-04-03 00:00:00','1899-12-31 00:00:00','enabled'),
 (23,'Awanse w domu mediowym Optimum Media OMD','','<p>W Optimum Media OMD awansowały dwie osoby.<br /><br />Agnieszka Cierpisz, dotychczas Account awansowała na stanowisko Senior Account. Cierpisz rozpoczęła pracę w Optimum Media OMD 4 lata temu i obecnie odpowiada za obsługę mediową marek Henkel Polska (kosmetyki).<br /><br />Maciek Kutera awansował ze stanowiska Media Buyer na Junior Media Plannera. Kutera pracuje w Optimum Media OMD od ponad roku i odpowiada za planowanie i zakup telewizji oraz Internetu.<br /><br />Agnieszka i Maciek pracują w zespole Katarzyny Wasiluk, Group Account Director.<br /><br /><br /><br /></p>','2010-01-18 21:33:46',NULL,'2010-01-18 21:49:42',NULL,'2009-02-26 00:00:00','1899-12-31 00:00:00','enabled'),
 (24,'Optimum Media OMD rozpoczął prace dla Renault Polska','Dom Mediowy Optimum Media OMD po wygranym przetargu rozpoczął współpracę z Renault Polska. W styczniu wystartowała pierwsza kampania zakupiona przez Optimum Media – launch nowego Renault Megane.','<p>Dom Mediowy Optimum Media OMD po wygranym przetargu rozpoczął wsp&oacute;łpracę z Renault Polska. W styczniu wystartowała pierwsza kampania zakupiona przez Optimum Media &ndash; launch nowego Renault Megane.&nbsp;<br /><br />Renault jest obsługiwany przez team zarządzany przez Małgorzatę Baranowską, dyrektor zarządzającą Optimum Media OMD i pełniącą obowiązki Group Account Directora w tym zespole, kt&oacute;rym wsp&oacute;łkieruje Agnieszka Szynal.&nbsp;<br /><br />Jako account dla tego nowego klienta Optimum Media OMD do agencji wr&oacute;ciła Monika Stanke-Rusin. Monika zaczynała pracę w Optimum Media OMD pracując między innymi dla Nissana. Od lutego 2008 roku pracowała dla Unilevera i pełniła obowiązki accounta takich marek jak Lipton, Saga i Lipton Ice Tea.<br /><br />W skład zespołu wchodzą także: Piotr Potulski, kt&oacute;ry przeszedł z zespołu obsługującego dotychczas PTC, Ewelina Zaborowska, Grzegorz Deka, Hubert Kurczyński. Koordynacją kampanii internetowych zajmuje się Arkadiusz Miegoń, kt&oacute;ry od stycznia awansował na stanowisko interactive strategy account. Kampanie SEMowe (Search Engine Marketing) prowadzi Emil Sobkowicz, szef kom&oacute;rki specjalizującej się w kampaniach marketingu wyszukiwarkowego w OMG Digital.<br /><br />Zar&oacute;wno Arek, jak i Emil posiadają tytuł Google Advertising Professional, kt&oacute;ry potwierdza dużą wiedzę i profesjonalizm w prowadzeniu kampanii reklamowych w wyszukiwarce Google. OMG Digital dodatkowo szczyci się certyfikatami: Google Qualified Company oraz Certyfikowany Partnerem Adkontekst - dwoma najważniejszymi dowodami wysokich umiejętności i doświadczenia w prowadzeniu kampanii SEM.<br /><br /><br /><br /></p>','2010-01-18 21:36:42',NULL,'2010-01-18 21:49:15',NULL,'2009-01-29 00:00:00','1899-12-31 00:00:00','enabled'),
 (26,'OMD nagrodzone przez Adweek tytułem Global Media Agency of the Year !','Międzynarodowa sieć domów mediowych, do której w Polsce należy m.in. Macroscope OMD została doceniona przez magazyn Adweek jako globalna agencja mediowa roku!','<p>Międzynarodowa sieć dom&oacute;w mediowych, do kt&oacute;rej w Polsce należy m.in. Optimum Media OMD została doceniona przez magazyn Adweek jako globalna agencja mediowa roku!<br /><img alt=\\\"\\\\&quot;\\\\\\\\&quot;\\\\&quot;\\\" align=\\\"\\\\&quot;\\\\\\\\&quot;right\\\\\\\\&quot;\\\\&quot;\\\" /><br /><strong>To już drugi raz z rzędu OMD zostalo nagrodzone jako Global Agency of the Year ! <br /></strong><br />Adweek dostrzegł wybitną pracę OMD na świecie dla swoich Klient&oacute;w - <strong>zaangażowanie w oferowanie innowacyjnych sp&oacute;jnych strategii, osiągnięcia w kreatywnym podejściu do medi&oacute;w, jak r&oacute;wnież bycie zaufanym partnerem w dziedzinie marketingu</strong>. Doceniono zdolność OMD w utrzymaniu wsp&oacute;łpracy z dotychczasowymi Klientami, jak r&oacute;wnież umiejętność i skuteczność w zdobywaniu nowych - zwłaszcza w tak trudnym otoczeniu rynkowym.</p>\n<p><strong>Także zesp&oacute;ł&nbsp;Optimum Media OMD w Polsce kończy 2009 rok pracy z zadowoleniem. </strong>Dotychczasowi Klienci&nbsp;</p>\n<p>Międzynarodowa sieć dom&oacute;w mediowych, do kt&oacute;rej w Polsce należy m.in. Macroscope OMD została doceniona przez magazyn Adweek jako globalna agencja mediowa roku!<br /><img alt=\\\"\\\\&quot;\\\\\\\\&quot;\\\\&quot;\\\" align=\\\"\\\\&quot;\\\\\\\\&quot;right\\\\\\\\&quot;\\\\&quot;\\\" /><br /><strong>To już drugi raz z rzędu OMD zostalo nagrodzone jako Global Agency of the Year ! <br /></strong><br />Adweek dostrzegł wybitną pracę OMD na świecie dla swoich Klient&oacute;w - <strong>zaangażowanie w oferowanie innowacyjnych sp&oacute;jnych strategii, osiągnięcia w kreatywnym podejściu do medi&oacute;w, jak r&oacute;wnież bycie zaufanym partnerem w dziedzinie marketingu</strong>. Doceniono zdolność OMD w utrzymaniu wsp&oacute;łpracy z dotychczasowymi Klientami, jak r&oacute;wnież umiejętność i skuteczność w zdobywaniu nowych - zwłaszcza w tak trudnym otoczeniu rynkowym.</p>\n<p><strong>Także zesp&oacute;ł&nbsp;Optimum Media OMD w Polsce kończy 2009 rok z zadowoleniem.</strong> Dotychczasowi Klienci oceniają wsp&oacute;łpracę z agencją wyżej niż&nbsp;poprzednim roku, w ciągu roku ten dom mediowy zdobył także nowych Klient&oacute;w, a wraz z końcem roku wygrał r&oacute;wnież trudne przetargi na obsługę mediową swoich dw&oacute;ch wieloletnich waznych Klient&oacute;w: Lotos i Storck.</p>','2010-01-19 12:22:14',NULL,'2010-01-19 22:11:20',NULL,NULL,'1899-12-31 00:00:00','enabled'),
 (27,'\"Reklama wkrótce wróci do łask\" - Puls Biznesu','','<p>&nbsp;</p>\n<p><span style=\"font-size: 7.5pt; color: black; font-family: Verdana;\">\"Bliski koniec reklamowej zapaści. Kryzys jeszcze sie nie skończył, ale w IV kw. rynek odbije - m&oacute;wi Monika Nowak, Media Buying Manager w Omnicom Media Group. (...)\"<br /><br /><a href=\"../public/useruploads/files/puls_biznesu_2009_12_29_reklama_wkrotce_wroci_do_lask__pdf_(1)_k.pdf\" target=\"_blank\">Czytaj więcej - pobierz plik<br /></a><br /><em><span style=\"font-family: Verdana;\">W artykule rynek medi&oacute;w komentuje Monika Nowak - Media Buying Manager w Opera OmnicomMediaGroup<br /><br /><br /></span></em></span></p>','2010-01-19 12:49:09',NULL,'2010-01-19 12:58:12',NULL,'2009-12-29 00:00:00','1899-12-31 00:00:00','enabled'),
 (28,'\"Ciekawiej w kinie\" - Press','','<p>\"Interaktywne manekiny, podłoga i animacje, na suficie reagujące na ruch mają sie pojawić w polskich kinach.(...)\"<br /><br /><a href=\"../public/useruploads/files/press_2009_08_01_ciekawiej_w_kinie_pdf_k.pdf\" target=\"_blank\">Czytaj więcej - pobierz plik</a><br /><br /><em>Artykuł zawiera komentarze Moniki Nowak - Media Buying Manager w Opera OmnicomMediaGroup<br /><br /><br /><br /></em></p>','2010-01-19 12:54:22',NULL,'2010-01-19 12:57:49',NULL,'2009-08-02 00:00:00','1899-12-31 00:00:00','enabled'),
 (29,'\"Cyfryzacja - czy zabije reklamę TV ?\" - Brief','','<p>\"Telewizja cyfrowa powszechnie działa w Stanach Zjednoczonych, Anglii czy Francji. Przyszła kolej na Polskę. I choć nie do końca jesteśmy świadomi tego, co może zmienić cyfryzacja w codziennym odbiorze TV, patrząc na to, jaki miała wpływ na rozw&oacute;j wymienionych kraj&oacute;w, może zmieć... \"wszystko\", czyli rynek medi&oacute;w i reklamy. (...)\"<br /><br /><a href=\"../public/useruploads/files/brief_2009_11_25_cyfryzacja_czy_zabije_reklame_tv_pdf_(1)_k.pdf\" target=\"_blank\">Czytaj więcej - pobierz plik</a><br /><br /><em>W artykule wypowiada się Maciej Kita - Media Buying Director w Opera OmnicomMediaGroup<br /><br /><br /></em></p>','2010-01-19 13:06:40',NULL,'2010-01-19 13:06:40',NULL,'2009-11-11 00:00:00','0000-00-00 00:00:00','enabled'),
 (30,'Testowy artykul','sdfasdfasdfsadfsadf','','2010-01-19 21:46:27',NULL,'2010-01-19 22:30:12',NULL,NULL,NULL,'deleted');
UNLOCK TABLES;
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;


--
-- Definition of table `omnicom7`.`categories`
--

DROP TABLE IF EXISTS `omnicom7`.`categories`;
CREATE TABLE  `omnicom7`.`categories` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(45) collate utf8_polish_ci NOT NULL,
  `added` datetime default NULL,
  `addedby` int(11) default NULL,
  `updated` datetime default NULL,
  `updatedby` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `omnicom7`.`categories`
--

/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
LOCK TABLES `categories` WRITE;
INSERT INTO `omnicom7`.`categories` VALUES  (2,'Aktualnosci','2009-12-23 23:11:24',NULL,'2010-01-15 12:27:09',NULL),
 (3,'Analizy i publikacje','2009-12-23 23:11:49',NULL,'2010-01-15 12:26:44',NULL),
 (6,'Strony statyczne','2010-01-13 19:55:14',NULL,'2010-01-15 23:51:31',NULL),
 (8,'Kuba drugi test','2010-01-19 21:45:41',NULL,'2010-01-19 21:45:41',NULL);
UNLOCK TABLES;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;


--
-- Definition of table `omnicom7`.`categories_has_articles`
--

DROP TABLE IF EXISTS `omnicom7`.`categories_has_articles`;
CREATE TABLE  `omnicom7`.`categories_has_articles` (
  `CATEGORIES_id` int(11) NOT NULL,
  `ARTICLES_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Dumping data for table `omnicom7`.`categories_has_articles`
--

/*!40000 ALTER TABLE `categories_has_articles` DISABLE KEYS */;
LOCK TABLES `categories_has_articles` WRITE;
INSERT INTO `omnicom7`.`categories_has_articles` VALUES  (2,1),
 (2,2),
 (2,3),
 (2,4),
 (3,5),
 (2,6),
 (2,7),
 (2,8),
 (6,9),
 (6,10),
 (3,11),
 (3,12),
 (3,13),
 (3,14),
 (3,15),
 (3,16),
 (3,17),
 (3,18),
 (2,19),
 (2,20),
 (2,21),
 (2,22),
 (2,23),
 (2,24),
 (2,25),
 (3,27),
 (3,28),
 (3,29),
 (2,26),
 (2,30);
UNLOCK TABLES;
/*!40000 ALTER TABLE `categories_has_articles` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
