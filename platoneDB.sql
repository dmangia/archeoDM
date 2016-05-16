-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versione server:              10.1.9-MariaDB - mariadb.org binary distribution
-- S.O. server:                  Win32
-- HeidiSQL Versione:            9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dump della struttura del database platone
CREATE DATABASE IF NOT EXISTS `platone` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `platone`;


-- Dump della struttura di tabella platone.posts
CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` tinyint(1) DEFAULT '1' COMMENT '1 = Active, 0 = Inactive',
  `user_id` varchar(45) NOT NULL,
  `category` varchar(20) NOT NULL,
  `image` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1_posts` (`user_id`),
  CONSTRAINT `FK1_posts` FOREIGN KEY (`user_id`) REFERENCES `users` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

-- Dump dei dati della tabella platone.posts: ~10 rows (circa)
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` (`id`, `title`, `description`, `created`, `modified`, `status`, `user_id`, `category`, `image`) VALUES
	(1, 'Akrai (Palazzolo Acreide)', '                  Akrai, attuale Palazzolo Acreide, fu edificata nel 663 a. C. dai siracusani. Sorgeva nel territorio dell`attuale Palazzolo Acreide. Fu costruita in cima ad un colle per cui difficilmente attaccabile e da qui di poteva vigilare sui territori circostanti. Raggiunse il suo massimo splendore sotto il dominio di Gerone II (tra il 275 a. C. e il 215 a. C.). Nel 211 a. C. passò sotto il dominio dei romani.\r\nNumerose furono le dominazioni che si avvicendarono nel corso dei secoli: romana, bizantina, araba, normanna. Da qui le varie denominazioni date alla città: Akrai, Acre, Balansùl, Placeolum o Palatioli ed infine Palazzolo a cui, nel 1862, fu aggiunto il patronimico di Acreide.\r\n            \r\n            \r\n            ', '2016-05-12 14:10:07', '2016-05-12 14:42:13', 1, 'alex', 'grecia', 'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcSnFYf1iZ1p5UBNJK_3do61dNMoZK7V9fXBfAVeNdlNdq3fjAXx'),
	(2, 'Heraclea Minoa (Cattolica Eraclea)', ' L&#96;attuale territorio di Cattolica Eraclea ospitava un tempo Heraclea Minoa, un’antica città greca che secondo lo storico Erodoto fu fondata dai greci di Selinunte i quali originariamente la chiamarono Minoa. Alla fine del VI secolo Minoa passò sotto il dominio di Akragas. Passò dai greci a cartaginesi in seguito a numerose battaglie finché nel III secolo a. C. non divenne colonia romana.\r\nPer la sua importanza, la visita all\'area archeologica di Eraclea Minoa costituisce il complemento ideale a quella di Agrigento. In queste zone, dopo un lungo e tortuoso percorso fra le valli dei Monti Sicani, giunge a mare il fiume Platani (l’antico Alykos): remota via di collegamento fra la costa e le zone collinari interne, limite naturale fra la zona d’influenza greca e cartaginese,  il cui sbocco a mare oggi  è noto come la Riserva Naturale Foce del Fiume Platani. A levante della foce, la splendida spiaggia di Eraclea si affaccia su di un mare cristallino. La Festa di S. Giuseppe è tra le ricorrenze popolari e religiose più sentite del luogo', '2016-04-15 09:41:45', '2016-04-15 09:41:45', 1, 'alex', 'grecia', 'http://www.bbsolaris.com/userfiles/images/foto-box/eraclea/teatro_greco.jpg'),
	(3, 'Il cammino Egizio verso la civiltà', 'L\'evoluzione culturale e le condizioni geografico-ambientali sono fattori strettamente interdipendenti e l\'Egitto illustra in modo esemplare questo reciproco legame. La valle del Nilo è un\'oasi fluviale situata tra due deserti: a ovest si apre la vasta distesa del Sahara, a est frastagliate cime montuose separano l\'Egitto dal Mar Rosso. Solo a nord-est uno stretto varco, attraverso la costa settentrionale del Sinai, permette il passaggio verso la Palestina e l\'Asia anteriore. ', '2016-04-15 09:41:45', '2016-05-12 15:20:08', 1, 'frank', 'egitto', 'http://a.mytrend.it/prp/2013/07/471210/o.181057.jpg'),
	(4, 'Akragas (Agrigento)', 'Akragas, l&#96;attuale Agrigento, fu fondata nel 581 a.C. da alcuni abitanti di Gela. Il nome deriva dall&#96;omonimo fiume che bagnava questo territorio. La fondazione di questa città nasce dalla necessità che avevano alcuni abitanti di Gelas di arginare l’espansione di quest&#96;ultima verso ovest. Un fantastico sviluppo che vide Akragas diventare uno sviluppato centro commerciale e un fiorente centro agricolo. La vicinanza del mare fece la fortuna della città. Oggi Agrigento è una splendente città che vanta diverse bellezze appartenenti all’età greca a cominciare dall’incantata Valle dei Templi.', '2016-04-15 09:41:45', '2016-04-15 09:41:45', 1, 'alex', 'grecia', 'http://www.casettadelviaggiatore.com/img/mare-Sicilia-Agrigento.jpg'),
	(5, 'La preistoria egizia', 'Le aree pianeggianti, dal suolo fertile e ricche di risorse naturali grazie alle inondazioni annuali del fiume, favorirono il concentrarsi degli insediamenti umani nella valle del Nilo, delimitata sia a est sia a ovest dal deserto, che la protesse per lungo tempo dalle invasioni. Sappiamo, da ritrovamenti archeologici, che già nel Paleolitico vi erano insediamenti lungo la valle del Nilo e che dall\'età del Bronzo (che ebbe inizio nella regione attorno al 4000 a.C.) fino agli inizi dell\'Antico Regno le popolazioni indigene cominciarono a espandersi e a fondare piccoli villaggi. ', '2016-04-15 09:41:45', '2016-05-12 15:20:05', 1, 'frank', 'egitto', 'http://media.travelblog.it/c/cos/cosa-vedere-in-egitto-top-10/00piramidigiza.jpg'),
	(7, 'Periodo arcaico o dinastico antico (3100-2778 CA. A.C.)', 'Nel tardo periodo Gerziano (3100 ca. a.C.) si erano costituiti due regni, uno nell\'Alto Egitto, che aveva come capitale la città di Hieraconpolis (attuale El-Kôm el-Ahmar), l’altro nel Basso Egitto. L\'unificazione del paese sarebbe avvenuta, secondo la tradizione, intorno al 3100 a.C. per opera di Menes, re dell\'Alto Egitto che avrebbe occupato il Nord, attratto anche dalla maggiore fertilità del suolo. ', '2016-04-15 09:41:45', '2016-05-12 14:31:45', 1, 'alex', 'egitto', 'http://www.ilturista.info/myTurista/files/1/La_Cittadella_di_Qaytbay_Alessandria_Egitto_105762668.jpg'),
	(8, 'Il maestoso passato dei Sumeri', 'Meno dell&#961 per cento in Iraq è stato scavato e studiato”, rivela il dottor Robert Killick, archeologo britannico che ha lavorato in Iraq per oltre un decennio e poi nel resto della regione per altri due decenni. “Le informazioni principali sulla verità del passato del genere umano sono ancora nascoste sotto il paesaggio dell’Iraq, specialmente nei resti di antiche città, borghi e cascine”.\r\n“Contrariamente a quanto la gente crede sullo stato attuale dell&#96Iraq, la maggior parte dei siti antichi non è stato affatto distrutto dalla recente guerra”, continua Killick.', '2016-05-10 12:21:40', '2016-05-12 15:19:56', 1, 'frank', 'news', 'http://www.tlcws.com/blog/wp-content/uploads/2013/02/shutterstock_46344220.jpg'),
	(9, 'Ercolano: la capsula del tempo', 'Alla fine del 2013, il British Museum ha allestito una mostra dove sono stati esposti i segreti di una piccola capsula del tempo rinvenuta ad Ercolano, la città campana distrutta dall\'eruzione del Monte Vesuvio del 79 d.C. Con l\'ausilio di sofisticate tecniche, i ricercatori sono riusciti a fotografare il testo impresso su alcuni papiri rimasti sepolti per lungo tempo sotto la cenere del vulcano.', '2016-05-10 12:23:06', '2016-05-12 15:19:59', 1, 'frank', 'news', 'http://www.roadtvitalia.it/wp-content/uploads/2016/01/Capitale-Italiana-della-Cultura.jpg'),
	(10, 'L&#96antica isola greca di Samo', 'L&#96isola ha una storia antichissima. Gli scavi hanno portato alla luce le mura fornite di torri circolari, due grandi moli risalenti al VI secolo a.C. e una necropoli.\r\nIl tempio di Era è formato da una parte più antica, addirittura risalente al 9° secolo a.C., realizzato in pietra e mattoni di argilla e una copertura di legno. Dopo l’incendio del 600 a.C., venne costruita la stoà e quarant’anni dopo fu ultimato il cosiddetto grande tempio chiamato “labirinto” per la presenza di numerose colonne.\r\nNei tempi antichi, Samo era considerata un’isola molto importante, tanto che lo storico Erotodo la definì come la migliore città mai realizzata sia dai Greci che dai barbari.', '2016-05-10 12:24:02', '2016-05-12 15:20:02', 1, 'frank', 'news', 'http://www.galassiere.it/costellazioni_file/leo_file/leone.jpg'),
	(17, 'La bella siracusa', '            Siracusa sorge nel lato sud-orientale della Sicilia. La sua geografia è molto variegata, comprende al suo interno fiumi e colline rocciose, e confina per lo più con il mare, che la circonda in quasi ogni suo lato. Ciò conferisce al paesaggio la conformazione tipica delle località che sorgono sulla costa: promontori, baie, isole e penisole. Il litorale siracusano presenta numerose scogliere e diverse spiagge sabbiose.\r\n\r\nSiracusa si sviluppa in parte sull\'isola di Ortigia e in parte sulla terraferma. Tenendo inoltre presente che l\'intera città è situata all\'interno dell\'isola di Sicilia, e proprio per questa sua peculiarità geografica, Siracusa è spesso appellata come « isola nell\'isola »[7]\r\n\r\nLa posizione geografica ha reso celebre Siracusa per i suoi tramonti: spesso descritti e decantati nella letteratura.[N 5]\r\n\r\nLa conformazione della costa determina la vasta insenatura naturale dentro la quale si sviluppa il porto Grande. A circa 1200 metri di distanza dalla punta meridionale dell\'isola aretusea,[N 6] sorge il promontorio della penisola della Maddalena, la cui punta più estrema è rappresentata dalla scogliera di Capo Murro di Porco, di fronte alla quale si estende l\'area marina protetta del Plemmirio.[8] La penisola era detta anche isola (nome odierno dato ad una sua contrada) poiché un tempo lo stretto lembo di terra che oggi la collega alla terraferma, era sott\'acqua.[9]            \r\n            ', '2016-05-12 14:36:21', '2016-05-13 10:11:35', 1, 'miki', 'news', 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcRZeRfP3WNyRHsDl2YuQK0Fl47f9KIDuixBRdy1stQcw7hGQ3Ga'),
	(18, 'Il delfino e i ragazzo', 'Presso i Greci numerose divinità assumono sembianze pisciformi oppure sono raffigurate nell?atto di cavalcare delfini e ippocampi; il pesce è sacro, inoltre, ad Afrodite quale simbolo di fecondità e nel mito di Poseidone rappresenta la forza delle acque (il medesimo significato assume presso i romani rispetto a Venere e a Nettuno).\r\nPer gli Israeliti il pesce è la vivanda della cena sacra del Sabbath, e l?antica Pasqua ebraica cadeva proprio nel mese del Pesce.\r\nPer i Cristiani il pescatore è colui che raccoglie (pesca) le anime e il pesce rappresenta il Cristo stesso, tanto che nella parola greca ICHTHUS (pesce) si sono riconosciute le iniziali delle parole Iesùs CHristòs THeù Uiòs Sotér, cioè Gesù Cristo figlio di Dio Salvatore.\r\n            ', '2016-05-12 16:04:12', '2016-05-13 10:11:37', 0, 'miki', 'news', 'http://localhost:8080/ArcheoDM/static/delfino.jpg');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;


-- Dump della struttura di tabella platone.users
CREATE TABLE IF NOT EXISTS `users` (
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `nome` varchar(20) DEFAULT NULL,
  `cognome` varchar(20) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `indirizzo` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dump dei dati della tabella platone.users: ~3 rows (circa)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`username`, `password`, `enabled`, `nome`, `cognome`, `email`, `indirizzo`) VALUES
	('alex', '123456', 1, 'Alex', 'Weller', 'weller@mail.it', 'via Gelsi 10'),
	('frank', '123456', 1, 'Frank', 'Tesser', 'tesser@mail.it', 'via Popper 213'),
	('miki', '123456', 1, 'Myk', 'Kong', 'kong@mail.it', 'via Letter 322');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;


-- Dump della struttura di tabella platone.user_roles
CREATE TABLE IF NOT EXISTS `user_roles` (
  `user_role_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `role` varchar(45) NOT NULL,
  PRIMARY KEY (`user_role_id`),
  UNIQUE KEY `uni_username_role` (`role`,`username`),
  KEY `fk_username_idx` (`username`),
  CONSTRAINT `fk_username` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dump dei dati della tabella platone.user_roles: ~5 rows (circa)
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` (`user_role_id`, `username`, `role`) VALUES
	(2, 'alex', 'ROLE_ADMIN'),
	(5, 'frank', 'ROLE_AUT'),
	(3, 'alex', 'ROLE_USER'),
	(1, 'miki', 'ROLE_USER');
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
