-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 08, 2022 at 02:20 PM
-- Server version: 10.4.16-MariaDB
-- PHP Version: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `baza`
--

-- --------------------------------------------------------

--
-- Table structure for table `kategorija`
--

CREATE TABLE `kategorija` (
  `kategorija_id` int(11) NOT NULL,
  `kategorija_naziv` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kategorija`
--

INSERT INTO `kategorija` (`kategorija_id`, `kategorija_naziv`) VALUES
(1, 'Fudbal'),
(2, 'Kosarka'),
(3, 'Tenis'),
(4, 'Ostalo');

-- --------------------------------------------------------

--
-- Table structure for table `komentar`
--

CREATE TABLE `komentar` (
  `komentar_id` int(255) NOT NULL,
  `vest_komentar_id` int(11) UNSIGNED NOT NULL,
  `komentar_ime` varchar(45) NOT NULL,
  `komentar` text NOT NULL,
  `komentar_vreme` timestamp NULL DEFAULT current_timestamp(),
  `komentar_dozvoljen` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `korisnik`
--

CREATE TABLE `korisnik` (
  `korisnik_id` int(11) NOT NULL,
  `korisnik_ime` varchar(45) NOT NULL,
  `korisnik_prezime` varchar(45) NOT NULL,
  `korisnik_email` varchar(45) NOT NULL,
  `korisnik_lozinka` varchar(256) NOT NULL,
  `korisnik_vreme` timestamp NOT NULL DEFAULT current_timestamp(),
  `korisnik_komentar` text DEFAULT NULL,
  `korisnik_aktivan` int(1) NOT NULL DEFAULT 1,
  `korisnik_status` enum('Administrator','Urednik','Korisnik') NOT NULL,
  `korisnik_validan` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `korisnik`
--

INSERT INTO `korisnik` (`korisnik_id`, `korisnik_ime`, `korisnik_prezime`, `korisnik_email`, `korisnik_lozinka`, `korisnik_vreme`, `korisnik_komentar`, `korisnik_aktivan`, `korisnik_status`, `korisnik_validan`) VALUES
(1, 'Andrej', 'Knezevic', 'knezevicandrej32@gmail.com', '12345', '2021-05-15 13:27:22', '', 1, 'Administrator', 1),
(2, 'Milan', 'Milanovic', 'mmilanovic@gmail.com', '1234567', '2021-05-16 12:24:51', '', 1, 'Urednik', 1),
(9, 'Milutin', 'Markovic', 'mmarkovic@gmail.com', 'deDB_7', '2021-05-26 13:48:02', '', 1, 'Korisnik', 1);

-- --------------------------------------------------------

--
-- Table structure for table `podkategorija`
--

CREATE TABLE `podkategorija` (
  `podKategorijaID` int(11) NOT NULL,
  `podKategorijaKategorijaID` int(11) NOT NULL,
  `podKategorija_naziv` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `podkategorija`
--

INSERT INTO `podkategorija` (`podKategorijaID`, `podKategorijaKategorijaID`, `podKategorija_naziv`) VALUES
(1, 1, 'Engleska'),
(2, 1, 'Nemacka'),
(3, 1, 'Spanija'),
(4, 1, 'Francuska'),
(5, 1, 'Belgija'),
(6, 1, 'Rusija'),
(7, 1, 'Turska'),
(8, 1, 'Portugal'),
(9, 1, 'Srbija'),
(10, 1, 'Liga sampiona'),
(11, 1, 'Liga evrope'),
(12, 1, 'Reprezentativni fudbal'),
(13, 2, 'NBA liga'),
(14, 2, 'ABA liga'),
(15, 2, 'Evroliga'),
(16, 2, 'Evrokup'),
(17, 2, 'KLS'),
(18, 4, 'Vaterpolo'),
(19, 4, 'Odbojka'),
(20, 4, 'Rukomet'),
(65, 3, 'Novak'),
(66, 3, 'Muski tenis'),
(67, 3, 'Zenski tenis'),
(68, 4, 'Biciklizam'),
(69, 4, 'NFL'),
(70, 4, 'Atletika'),
(71, 4, 'Borilacki sportovi');

-- --------------------------------------------------------

--
-- Table structure for table `vest`
--

CREATE TABLE `vest` (
  `vest_id` int(10) UNSIGNED NOT NULL,
  `vest_naslov` varchar(200) NOT NULL,
  `vest_tekst` text NOT NULL,
  `vest_vreme` timestamp NOT NULL DEFAULT current_timestamp(),
  `vest_autor_id` int(5) NOT NULL,
  `vest_kategorija_id` int(5) NOT NULL,
  `vest_obrisan` int(1) NOT NULL DEFAULT 0,
  `vest_izmena` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `vest_pogledan` int(5) NOT NULL DEFAULT 0,
  `vest_podkategorija_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vest`
--

INSERT INTO `vest` (`vest_id`, `vest_naslov`, `vest_tekst`, `vest_vreme`, `vest_autor_id`, `vest_kategorija_id`, `vest_obrisan`, `vest_izmena`, `vest_pogledan`, `vest_podkategorija_id`) VALUES
(31, 'veav', 'esavesvew', '2021-07-03 09:25:04', 1, 1, 1, '2021-07-03 09:38:40', 0, 2),
(32, 'a', 'a', '2021-07-03 09:34:02', 1, 1, 1, '2021-07-03 09:38:41', 0, 2),
(33, 'Kumanov dragulj postigao prvenac za Barselonu', 'cececececcececececcececececcececececcececececcececececcececececcececececcececececcececececcececececcececececcececececcececececcececececcececececcececececcececececcececececcececececcececececcececececcececececcececececcececececcececececcececececcececececcececececcececececcececececcececececcececececcececececcececececcececececcececececcececececcececececcececececcececececcececececcececececcececececcececececcececececcececececcececececcececececcececececcececececcececececcececececcececececcececececcececececcececececcececececcececececcececececcececececcececececcececececcececececcececececcececececcecececec', '2021-07-03 11:00:10', 1, 1, 1, '2021-07-03 11:39:32', 0, 3),
(34, 'f', 'ff', '2021-07-03 11:20:34', 1, 1, 1, '2021-07-03 11:37:25', 0, 2),
(35, 'Kumanov dragulj postigao prvenac za Barselonu', 'vsvsevsv', '2021-07-03 11:40:09', 1, 1, 1, '2021-07-05 11:33:54', 0, 2),
(36, 'vsev', 'vsver', '2021-07-03 11:45:46', 1, 1, 1, '2021-07-05 09:18:08', 0, 1),
(37, 'svsvse', 'vsvvsev', '2021-07-03 11:45:55', 1, 1, 1, '2021-07-05 09:19:47', 0, 2),
(38, 'vsv', 'sevsevse', '2021-07-03 11:46:11', 1, 1, 1, '2021-07-05 09:19:50', 0, 2),
(39, 'cece', 'svsevsrvvsrv', '2021-07-03 11:49:17', 1, 1, 1, '2021-07-05 09:19:52', 0, 1),
(40, 'cesv', 'esvesvs', '2021-07-03 11:52:43', 1, 1, 1, '2021-07-05 09:19:54', 0, 2),
(41, 'vesves', 'vsevsev', '2021-07-03 11:52:51', 1, 1, 1, '2021-07-05 09:19:55', 0, 3),
(42, 'Beretini zreo za završnicu Vimbldona: Ruši prepreke servisom i ima novi zicer u osmini finala', 'Za manje od dva sata razrešio Bedenea dužnosti, naredna prepreka Belorus Ivaška\r\n\r\nZahuktava se Mateo Beretini, odlično servira i deluje kao teniser koji je zreo za završnicu Vimbldona. Posle Gvida Pelje i kvalifikanta Botika van den Zandšulpa, u trećem kolu travnatog grend slema pao je Aljaž Bendene. Odigrao je Italijan onoliko koliko mu je bilo potrebno da bez bilo kakve napetosti razreši Slovenca dužnosti u Londonu. To je učinio sa po jednim brejkom u sva tri seta - 3:0 (6:4, 6:4, 6:4).\r\n\r\nDeveti teniser sveta je bio prilično siguran prilikom izvođenja početnog udarca, spasao je obe brejk lopte koje je dozvolio rivalu, a uništavao ga je čestim servis vinerima - na kraju ih je bio 20, identično kao i u prva dva meča. Sa ukupno 60 asova Italijan je izbio na prvo mesto liste najboljih servera.\r\n\r\nBeretini je uglavnom rešavao poene sa osnovne linije, a kada se odlučivao za izlazak na mrežu, nije grešio. I treći put uzastopno rođeni Rimljanin slavio je protiv Bedenea, pa će u osmini finala igrati sa Belorusom Ivaškom koji je takođe u tri seta savladao Australijanca Tompsona.\r\n\r\nZa razliku od jučerašnjeg kada je eliminisan Fabio Fonjini, današnji dan bio je vrlo uspešan za Italijene budući da je plasman među 16 najbolji izborio i Lorenco Sonego. Za maksimalnih 3:0 (6:3, 6:4, 6:4) protiv Džejmsa Dakvorta 27. teniseru sveta bilo je neophodno 111 minuta borbe. Možda je borba prejaka reč, budući da je i Sonego poput sunarodnika Beretinija napravio po brejk u sva tri seta ne dozvoliši rivalu da mu oduzme servis. Sonego u osmini finala čeka pobednika meča Rodžer Federer - Kameron Nori koji je na programu ne pre 16.15.\r\n\r\nTrijumf maksimalnim rezultatom ostvario je i Poljak Hubert Hurkač protiv Aleksandera Bublika, pa će se 18. na ATP lisi u osmini sastati ili sa Danilom Medvedevim ili sa Marinom Čilićem.', '2021-07-03 12:26:56', 1, 3, 0, NULL, 0, 14),
(43, 'Duop Rit potpisao za Ilavara Hokse', 'Sada već bivši igrač crveno-belih profesionalnu karijeru nastavlja u Australiji\r\n\r\nDoskorašnji prvotimac Crvene zvezde Duop Rit karijeru nastavlja u australijskom klubu Ilavara Hoks, saznaje Mozzart Sport. Rit se proteklih dana povezivao sa Mornarom iz Bara, ali se na kraju odlučio za klub iz zemlje čiji će dres nositi na Olimpijskim igrama u Tokiju.\r\n\r\nIlavara Hoks nastupa u tamošnjoj Nacionalnoj ligi, koju je osvajao 2001. godine. Prošlu sezonu završio je u polufinalu plej-ofa, gde je poražen od Perta Vajldketsa.\r\n\r\nRit je prošle sezone osvojio titule u ABA ligi i Superligi Srbije. Na 23 utakmice u Evroligi prosečno je postizao 4,8 poena i imao 1,9 skokova po meču. Slično je bilo i u ABA ligi, gde je imao 4,5 poena i 2,3 skoka po meču.\r\n\r\nRit je studirao na Luizijana Stejt univerzitet, ali 2018. godne nije draftovan, posle čega je došao u FMP. Posle dve sezone u dresu Pantera dobio je priliku i u Crvenoj zvezdi, ali je usledio rastanak posle godinu dana.\r\n\r\n', '2021-07-03 12:28:23', 1, 2, 0, NULL, 0, 14),
(44, 'Petar Stanić zvanično u crveno-belom', 'Ugovor na četiri godine\r\n\r\nBurno u Crvenoj zvezdi danas. Dogovoren je dolazak Ohija Omoižuanfa na zimu, pregovara se oko dovođenja novog špica, a i zvanično je promovisan Petar Stanić kao najnovije pojačanje srpskog prvaka.\r\n\r\nFudbaler sredine terena koji je prošle sezone igrao za Železničar iz Pančeva u Prvoj ligi Srbije, potpisao je ugovor na četiri godine.\r\n\r\n„Nadam se da ću opravdati očekivanja koja ljudi u klubu imaju od mene. Za ovaj klub navijam od malih nogu, kao i cela moja porodica, tako da sam veoma srećan zbog dolaska u Crvenu zvezdu“, rekao je Stanić za klupski sajt.\r\n\r\n', '2021-07-03 12:29:05', 1, 1, 0, NULL, 0, 9),
(45, 'Pozitivni signali: Svi košarkaši Srbije na zagrevanju pred Portoriko', 'Videćemo samo ko će igrati\r\n\r\nVelika neizvesnost vladala je u taboru reprezentacije Srbije pred susret s Portorikom zbog svih povreda koje su se dogodile u utakmicama grupne faze olimpijskih kvalifikacija.\r\n\r\nIpak, u satu uoči starta polufinalnog okršaja s Portorikom stižu pozitivni signali - svi roviti igrači istrčali su na zagrevanje! Sada ostaje samo da se vidi ko će i u kolikom obimu moći da pomogne Srbiji da obezbedi plasman u finale olimpijskih kvalifikacija i zakaže novi megdan s reprezentacijom Italije koja je nešto ranije ubedljivo savladala Dominikansku Republiku.\r\n\r\n', '2021-07-03 12:29:51', 1, 2, 0, NULL, 0, 11),
(46, 'Radnički iz Niša odmerava snagu sa slovenačkim prvoligašem, na terenu i Partizanov protivnik', 'Real sa Nišave od 18.30 časova igra protiv Tabor Sežane, dok DAC Dunajska Streda igra sa mađarskim drugoligašem Haladašom\r\n\r\nDobro je Radnički iz Niša započeo pripreme u Terme Čatežu, deklasirao je u prvom pripremnom meču Brežice sa 8:1. Ove subote od 18.30 časova očekuje ga znatno teži test, odmeriće snage sa prvoligašem Slovenije Taborom Sežanom.\r\n\r\nNovajlija iz Japana Rioheji Mićibući dobro se pokazao na svom prvom meču u dresu Nišlija, postigao je jedan od golova. Pokušaće da nastavi u istom ritmu i protiv tima koji je prošlu sezonu završio na šestoj poziciji u šampionatu Slovenije.\r\n\r\n', '2021-07-03 12:30:27', 1, 1, 0, NULL, 0, 9),
(47, 'Česi protiv Danaca za polufinale Eura: Hoće li oživeti 17-godišnja sećanja?Česi protiv Danaca za polufinale Eura: Hoće li oživeti 17-godišnja sećanja?', 'Knedličke 2004. eliminisale Skandinavce, a sada se u Bakuu bore u sklopu četvrtfinala kontinentalne smotre\r\n\r\nUdarac glavom Jana Kolera i dva pogotka Milana Baroša već su jednom razveselili navijače češke reprezentacije u četvrtfinalu Eura protiv Danske. Posle 17 leta, obe selekcije će se ponovo takmičiti u istoj fazi Evropskog prvenstva, iako su se početne pozicije, naravno, promenile poslednjih godina.\r\n\r\nOvo je svojevrstan povratak otpisanih, i to na velika vrata. Uzdižući se posle impresivnih pobeda u osmini finala Češka i Danska će večeras u Bakuu da odluče o učesniku polufinala Evropskog prvenstva (18.00).\r\n\r\n', '2021-07-03 12:31:23', 1, 1, 0, NULL, 0, 12),
(48, 'DOGOVORENO: Zvezda dovela Dionija na pozajmicu! Otkupna klauzula 1.200.000 evra, plata pola miliona', 'Uskoro i zvanična potvrda\r\n\r\nZvezdina potraga za novim napadačem je završena! Francuski špic Loi Dioni igraće u narednoj sezoni za srpskog šampiona kao pozajmljeni fudbaler Anžea, saznaje Mozzart Sport.\r\n\r\nNema još zvanične potvrde, ali čelnici srpskog šamiona dogovorili su sve uslove saradnje sa francuskim klubom. Snažni napadač preseliće se na Marakanu na jednogodišnju pozajmicu, a u ugovor je ubačena opcija o otkupu. Ukoliko crveno-beli budu želeli da otkupe Dionija moraće Anžeu da plate 1.200.000 evra u tri rate.', '2021-07-04 10:27:47', 1, 1, 0, NULL, 0, 9),
(49, 'a', 'a', '2021-07-05 09:20:08', 1, 1, 1, '2021-07-05 09:21:04', 0, 14),
(50, 'a', 'a', '2021-07-05 09:20:34', 1, 1, 1, '2021-07-05 09:21:00', 0, 14),
(51, 'a', 'a', '2021-07-05 09:20:45', 1, 1, 1, '2021-07-05 09:21:02', 0, 10),
(52, 'a', 'a', '2021-07-06 11:50:12', 1, 1, 1, '2021-07-06 11:50:21', 0, 15),
(54, 'a', 'a', '2021-07-10 12:59:25', 1, 1, 1, '2021-07-10 13:01:05', 0, 17),
(55, 'Ovo nije (ni blizu) poslednja Novakova šansa za stizanje Rodžera i Rafe', 'Džon Mekinro predviđa da bi srpski teniser, za razliku od rivala, mogao do još četiri-pet grend slemova\r\n\r\nNovak Đoković je ogroman posao odradio u polufinalu Rolan Garosa. Savladao je Rafaela Nadala na njegovom ognjištu i time učinio nekoliko stvari. Prvo - kasnije je u finalu stigao do novog grend slema. Drugo - učinio je da Nadal ne osvoji. Treće - Nadal se pod uticajem takvog razvoja situacije povukao sa Vimbldona i Olimpijskih igara. Na sve to, bilo je jasno da Rodžer Federer jako teško može do novog grend slema u ovim godinama.\r\n\r\nSa šest pobeda stigao je sada do finala Vimbldona gde će imati šansu da se pobedom nad Mateom Beretinijem poravna na 20-20-20 sa Federerom i Nadalom. Ali, najbolja stvar u celoj priči je što to Novaku nije poslednja šansa. Imaće ih on još u budućnosti, kada gledamo situaciju sa Rodžerom i Rafom, ali i mlađim igračima. Zato, sutrašnji meč nije sudbonosan. Ali, jeste od velikog značaja.\r\n\r\nDakle, pobedom protiv Beretinija bi ispisao istoriju već sutra. Ali, imaće još šansi za tako nešto. U prilog tome idu reči i čuvenog Džona Mekinroa.\r\n\r\n\"Rekao bih da Rodžer Federer više neće osvojiti nijedan grend slem\", rekao je Mekinro.\r\n\r\n', '2021-07-10 13:01:24', 1, 3, 0, NULL, 0, 65),
(56, 'Dve promocije u danu: Novi Beograd ozvaničio Duška Pijetlovića i Viktora Rašovića', 'Sastav Vladimira Vujasinovića jača svakim danom\r\n\r\nOno što je najavljeno se obistinilo. Iz dana u dan VK Novi Beograd pokazuje karte zbog kojih rivali gutaju knedle. Varke nema, ambiciozni klub će napasti evropsku titulu. Posle Dušana Mandića, Nikole Jakšića, Strahinje Rašovića i Radomira Drašovića, Novi Beograd je promovisao još dva pojačanja – Duška Pijetlovića i Viktora Rašovića.\r\n\r\nNapraviće Novi Beograd tim koji će biti Srbija u malom, imaće Vlada Vujasinović neophodnu širinu u rosteru i adekvatno popunjenu svaku poziciju. I Viktor Rašović i Duško Pijetlović se posle nekoliko godina igranja u inostranstvu vraćaju u dmovinu, a njih dvojica su već imali priliku da sarađuju i osvajaju trofeje.\r\n\r\n', '2021-07-10 13:01:55', 1, 4, 0, NULL, 0, 18),
(57, 'Marselo kao novi kapiten Reala: Siguran sam da ćemo osvojiti neki trofej', 'Levi bek Kraljevskog kluba o predstojećoj sezoni, Ančelotiju, odnosu sa mlađim igračima\r\n\r\nSve ono što je Brazilac Marselo uradio u dresu Real Madrida za 16 godina koliko nosi njegov dres, daju mu status klupske legende. Nije se levi bek naigrao prošle sezone pod dirigentskom palicom Zinedina Zidana. Svega 16 nastupa, odnosno 1052 minuta u Primeri gde je standardno nastupao Ferlan Mendi. Zidan je napustio klub, kao i Serhio Ramos, tako da će Marselo prvi put u karijeri predvoditi Blankose kao prvi kapiten.\r\n\r\n\"Velika je čast, ali i odgovornost biti kapiten najboljeg kluba na svetu\", rekao je Marselo.\r\n\r\nBrazilac je pričao o novoj sezoni i svemu onome što čeka Real u novom mandatu Karla Ančelotija.\r\n\r\n\"Svakoga dana se budim sa mnogo želje i svaku narednu sezonu očekujem za novim entutzijazmom. Ovde sam jako dugo, ali se motivi nikada nisu promenili, samo su se granice pomerale. Ne mogu da dočekam start sezone. Trudim se da konstantno učim, ali mi je potrebna pomoć od saigrača. Isto tako, verujem da kao kapiten, ja treba da budem taj kojem će se kolege obratiti i od koga će dobiti pomoć kada im je neophopdna,\"\r\n\r\nProšle sezone Real je do poslednjeg kola bio u trci za titulu, odradio je što je bilo do njega u 38. rundi, ali nije dočekao kiks Atletika koji mu je bio neophodan. Naravno, Real Madrid u svaku sezonu ulazi s ambicijom da na kraju podigne pehar.\r\n\r\n“Vrlo je teško okončati sezonu bez ijednog trofeja, ali ako ništa drugo nismo odustajali i borili smo se do samog kraja. Siguran sam da ćemo u predstojećoj osvojiti nešto. Imamo dosta fudbalera koji su i dalje sa državnim timovima, ali nam ne manjka motivacije za početak sezone.“\r\n\r\n', '2021-07-10 13:02:57', 1, 1, 0, NULL, 0, 3),
(58, 'Ivanić: Sve smo podredili plasmanu u Ligu šampiona', '“Želim da dam doprinos i trudiću se da budem efikasan kao i prošle godine”\r\n\r\nZavršila je Crvena zvezda pripreme u Austriji i okreće se novoj sezoni, koja kuca na vrata. Osvajač duple krune na startu prvenstva, koje počinje iduće sedmice, igra protiv novosadske Vojvodine.\r\n\r\nCrveno-bele uskoro očekuju obaveze i u evropskim kvalifikacijama, a Mirko Ivanić se osvrnuo na pripremni period i ono što sledi – pohod na grupnu fazu Lige šampiona.\r\n\r\n“Navikli smo se na čitav ritam, ovo su nam četvrte pripreme zaredom. Treninzi su bili veoma teški, ali imamo cilj, da uđemo u Ligu šampiona ili barem Ligu Evrope. Zato smo i trenirali tako, sve je usklađeno sa tim i ka tome idemo”, rekao je Ivanić.\r\n\r\nZvezda je u Austriji odradila četiri provere, a samo u generalnoj probi protiv Šturma nije upisala trijumf.\r\n\r\n“Takav je plan i program. Stručni štab je tu već godinu dana i postoji obostrano poverenje. Voleli bismo da smo imali više loptu u nogama, ali smo svesni da je takav period. Da se spremamo za ono što nas očekuje”.\r\n\r\nTokom priprema akcenat nije na rezultatima, već na fizičkoj spremi i usvajanju zamisli trenera Dejana Stankovića.\r\n\r\n“Definitivno rezultat nije prioritet na pripremnim utakmicama. Važnije nam je da uradimo ono što smo zamislili na treninzima i da to sprovedemo, pa rezultat dođe kao zadovoljstvo i nagrada. Ali sada nije bio u prvom planu”.\r\n\r\n', '2021-07-10 13:03:36', 1, 1, 0, '2021-07-13 15:34:27', 28, 9),
(59, 'Kembel je Čukin u naredne tri godine', 'Potpisan ugovor na Banovom brdu\r\n\r\nZavršen je i formalni deo: Norman Kembel je od danas novi fudbaler Čukaričkog.\r\n\r\nReprezentativac Jamajke je bio sa Brđanima na pripremama na Bledu, ostavio je dobar utisak i samo potvrdio da uprava kluba nije pogrešila kada je angažovala iz Grafičara.\r\n\r\nKembel je danas stavio potpis na ugovor sa Čukaričkim, po kojem će biti naredne tri godine član kluba sa Banovog brda. On donosi belo-crnima tačno ono što su tražili, što im je nedostajalo prethodnog proleća: brzinu, probojnost po boku, veći broj igrača u završnici akcija…\r\n\r\n', '2021-07-10 13:04:11', 1, 1, 0, NULL, 0, 9),
(60, 'Real i Kerol nastavljaju saradnju, ali dogovaraju nesvakidašnji aranžman', 'Iskusni šuter počeće sezonu nešto kasnije\r\n\r\nKraj sezone za nama značio je i odlazak u penziju za legendarnog Felipea Rejesa, a spekulisalo se i o mogućem kraju za Džejsija Kerola.\r\n\r\nPrekaljeni američki šuter razmišlja o penziji, ali postoji velika šansa da odigra još jednu sezonu. Ili, bolje rečeno, polusezonu u dresu Reala. Naime, španski mediji pišu o tome da Real i Kerol rade na nesvakidašnjem aranžmanu odnosno ugovoru koji bi bio potpisan praktično na šest meseci.\r\n\r\nO čemu se zapravo radi? Kerol ima želju da posle delimičnog smirivanja pandemijskog stanja provede više vremena sa porodicom u Sjedinjenim Američkim Državama i Real je spreman da mu izađe u susret tako što će mu ponuditi ugovor na pola godine. Od decembra-januara, do kraja sezone. Tako nešto se zaista ne viđa u profesionalnom sportu, ali Kraljevski klub je spreman da ga ispoštuje s obzirom na sve što je uradio tokom deset godina boravka u Realu.\r\n\r\n\r\n\r\n', '2021-07-10 13:05:23', 1, 2, 0, NULL, 0, 3),
(61, 'Iz Evrolige na Novi Zeland: Pejton Siva napustio berlinsku Albu', 'Američki plejmejker će iduće sezone igrati u NLB ligi\r\n\r\nJedan od najboljih organizatora igre u Evropi prethodnih godina odlučio se na nesvakidašnji potez. Posle odlične sezone u Evroligi na individuelnom planu, Pejton Siva je krem evropske košarke zamenio Novim Zelandom.\r\n\r\nPet godina je Pejton Siva nosio dres berlinske Albe, a od jeseni će braniti boje Nju Ziland Brejkersa, prenosi ESPN. Pejton Siva je minule sezone u Evroligi beležio 10,1 poen i 5,2 asistencije po meču, a 2019. je nastupajući za Albu bio najBolji poenter Evrokupa.\r\n\r\nPokupio je brojna individualna priznanja igrajući za nemački tim, a sa Albom je u dva navrata osvajao Bundesligu. Američki plejmejker je u najboljim godinama, kada je bio među najcenjenijim igračima na svojoj poziciji u Evropi, spakovao kofere, zatvorio jedno pOglavlje i otvorio novo – egzotično.\r\n\r\nIako se opredelio za klub sa Novog Zelanda, Pejton Siva će utakmice mahom igrati u Australiji. Nju Ziland Bejkersi su jedini tim u NLB ligi koji nije iz Zemlje kengura.\r\n\r\n', '2021-07-10 13:05:59', 1, 2, 0, NULL, 0, 2),
(62, 'INTERVJU - Marko Marinović: Svaki domaći igrač kojeg sam hteo da dovedem - prvo bi tražio pare', 'Mladi trener pričao o izazovnoj sezoni za nama, odluci da u Superligi pruži šansu talentovanoj deci Borca, košarci u Srbiji i zašto je važno da se ponovo ožive košarkaški centri van Beograda, zašto je bilo više stranaca, saradnji sa Željkom Obradovićem, ali i planovima za budućnost\r\n\r\nZavršnicu prošle klupske sezone u Srbiji obeležio je čačanski Borac. Podvig s izborenim opstankom u Jadranskoj ligi tokom nikad izazovnije godine za kompletno društvo, mladi i perspektivni trener Marko Marinović doneo je važnu odluku da u poslednjih nekoliko utakmica Superlige pruži šansu najtalentovanijim klupskim izdancima. I napravio je pun pogodak!\r\n\r\nO igrama njegove dečurlije pisalo se i pričalo danima, pobeda u seriji sa FMP iz Železnika došao je kao savršen dokaz da se poverenje isplati, a odmeravanje snaga sa Crvenom zvezdom u polufinalu kao šlag na tortu za momke koji su nešto ranije osvojili kadetskku ligu Srbije.\r\n\r\nMarko Marinović u svemu tome vidi odličan temelj za dalji rad, rast, razvoj i usavršavanje. Njega kao trenera i igrača čije vreme tek dolazi.\r\n\r\n“Sezona je bila mnogo teška, ali smo na kraju izašli s povoljnim rezultatom iza nas. Možda smo uradili nešto više od onoga što se očekivalo. Dobro je što smo se plasirali u polufinale Superlige. Mi smo zacrtane ciljeve ispunili, nije bilo nimalo lako, cele sezone smo se mučili“, počeo je Marinović razgovor za Mozzart Sport.\r\n\r\nNa šta konkretno mislite?\r\n\r\n“Znate i sami da je publika naš šesti igrač, tu je uvek da nam pomogne. Cela sezona bila je turbulentna, sa odlaganjima u pandemijskim uslovima. I pored nepovoljnog rasporeda na početku sezone, uspeli smo da se izvučemo i izbegnemo baraž za ostanak u ligi“.\r\n\r\n', '2021-07-10 13:06:32', 1, 2, 0, NULL, 0, 14),
(63, 'Prvi inostrani angažman: Nenadić se seli u Poljsku', 'Srpski košarkaš je novo pojačanje Zjelone Gore\r\n\r\nSrpski košarkaš Nemanja Nenadić nastavlja karijeru u Poljskoj. On je pojačao ekipu Zjelone Gore, sa kojom će igrati u domaćem prevenstvu i VTB ligi.\r\n\r\nTokom prethodne sezone Nenadić je igrao za FMP iz Železnika, a ovo će mu biti prvi inostrani angažman u karijeri.\r\n\r\n„Hvala vam što sam dobio priliku da se pridružim ovom timu. Čuo sam mnogo lepih stvari o klubu i drago mi je što ću imati šansu da pokažem svoje umeće. Dobri rezultati kluba iz prošle sezone samo mi daju motivaciju da pružim maksimum“, rekao je za klupski sajt Nemanja Nenadić.\r\n\r\nOn je tokom poslednje sezone odigrao za FMP u ABA ligi 22 utakmice na kojima je ostvario prosek od 17 poena, pet skokova i 2,5 asistencije. Najbolji meč odigrao je protiv Partizana u drugom kolu kada je postigao 26 poena i zabeležio tri skoka za ukupan indeks korisnosti – 29.\r\n\r\nKarijeru je počeo u Slodesu, a posle toga je nosio dres Tamiša, Mladosti, Pirota, Vojvodine, Dunava, FMP u dva navrata, Crvene zvezde i Mege.\r\n\r\nNjegov novi tim je tokom prethodne sezone stigao do jednog trofeja – osvojio je nacionalni Kup, dok je u prvenstvu Poljske završio na drugoj poziciji.\r\n\r\n', '2021-07-10 13:07:05', 1, 2, 0, NULL, 0, 14),
(64, 'Još jedna grčka legenda u penziji: Burusis stavio tačku posle dve decenije', 'Jedan od najboljih grčkih centara novijeg doba rešio da se oprosti od košarke\r\n\r\nGrčka košarka je u roku od samo nekoliko sedmica ostala siromašnija zbog trojice asova koji su rešili da okače patike o klin. Vasilis Spanulis, Nikos Zizis i sada Janis Burusis koji je takođe odlučio da kaže - dosta!\r\n\r\nPosle pune dve decenije. I igranja za AEK, Barselonu, Olimpijakos, Olimpiju Milano, Real Madrid, baskoniju, Panatinaikos, Žeđijang, Gran Kanariju i Peristeriju gde je proveo sezonu za nama.\r\n\r\nBurusis odlazi u igračku penziju kao jedan od najboljih centara svoje generacije. Sa reprezentacijom Grčke osvojio je evropsko zlato u Beogradu 2005. i bronzu četiri godine kasnije, a bio je i šampion Starog kontinenta za igrače do 20 godina. Uzeo je Evroligu sa Real Madridom 2015, a s Kraljevićima je bio prvak Španije 2015, te osvajač Kupa kralja 2014. i 2015. godine. Španski Superkup uzeo je 2013. i 2014. godine. Uz to je bio šampion Grčke sa Aekom 2002. i Panatinaikosom 2017. godine. Dvaput je sa Olimpijakosom uzeo nacionalni kup (2010. i 2011. godine), a jednom sa Panatinaikosom 2017. godine.\r\n\r\n', '2021-07-10 13:08:01', 1, 2, 0, '2021-07-13 15:35:44', 1, 15),
(65, 'Godina iz snova - heroj Azura iz Beograda prešao u Baskoniju', 'Treće pojačanje za klub iz Vitorije\r\n\r\nVrhunska klupska sezona u berlinskoj Albi, plasman na Olimpijske igre usred Beograda gde je postao jedan od heroja Italije, pa veliki evropski transfer u Baskoniju! Simone Fontekio može slobodno može da kaže kako živi verovatno najbolju godinu dosadašnje karijere pošto je veliki uspon nastavio potpisom za Baskoniju.\r\n\r\nFontekio je sa klubom iz Vitorije potpisao trogodišnji ugovor i postao treće pojačanje ekipe Duška Ivanovića posle Meta Kostela i Vanje Marinkovića.\r\n\r\nItalijanski reprezentativac je posle nekoliko godina lutanja odigrao odličnu sezonu u Berlinu gde je bio među najboljim pojedincima. Evroligu je završio sa 10,6 poena i 3,4 skoka na 29 utakmica, uz nešto više od 38 odsto preciznosti na šutu za tri poena. U delikatnoj situaciji, kada je Italija ostala bez pomoći četvorice vodećih igrača Danila Galinarija, Marka Belinelija, Điđija Datomea i Danijela Heketa, Fontekio je zajedno sa Akileom Polonarom izrastao u lidera reprezentacije tokom olimpijskih kvalifikacija u Beogradu. U finalu protiv Srbije ubacio je 22 poena, uz osam skokova i uz Nikola Maniona i pomenutog Polonaru bio glavna uzdanica Azura i neko ko je najviše štete naneo Orlovima u oba smera.\r\n\r\n', '2021-07-10 13:08:42', 1, 2, 0, NULL, 0, 3),
(66, 'Šampionski pehar ide za Australiju: Ešli Barti – stvarno najbolja na svetu', 'Prvi put od 2012. finale se igralo u tri seta\r\n\r\nNajbolja na svetu se potvrdila na najvećem testu! Ešli Barti, prva na VTA listi, podigla je šampionski pehar na Vimbldonu i dokazala time da je u ovom trenutku bez premca kada je ženski karavan belog sporta u pitanju.\r\n\r\nPrvi put još od 2012. godine finale Vimbldona se igralo u tri seta. Posle lako dobijenog prvog i brejka prednosti u drugom, činilo se da je Barti na autoputu ka pobedi. Ali, trenutak pada koncentracije probudio je Pliškovu, koja je uspela da se izvuče, dobije drugi set, međutim, u trećem nije imala šansi za dođe do pehara – 6:3, 6:7, 6:3.\r\n\r\nOsvajanjem titule, koju je prethodno osvojila Simona Halep, povećala je Ešli Barti prednost na vrhu VTA liste i sa 2.300 bodova prednosti u odnosu na Naomi Osaku čeka drugu polovinu sezone.\r\n\r\nAustralijanka Barti je podigla danas tek drugi grend slem trofej u karijeri, jedini je imala sa Rolan Garosa 2019. godine. Možda bi bila još uspešnija ovog leta da je povreda nije izbacila sa Otvorenog prvenstva Francuske. Mirovanje joj je na kraju dobro došlo, pošto je u Londonu protutnjala do trofeja, izgubivši samo po set u prvom i poslednjem meču.\r\n\r\nPliškova nije uspela da dođe do prvog grend slem pehara. Čehinja, nekadašnja prva na svetskoj listi, kao da je sa velikom tremom izašla na teren, pošto je tek posle tri i po gema osvojila prvi poen u meču! Taj prvi set je ekspresno bacila u vodu, izgubila ga je za 30 minuta igre.\r\n\r\nU drugom setu Barti je propustila priliku da osvoji titulu sa manje truda nego što je morala da uloži na kraju. Na 5:5 je napravila brejk i servirala je za trijumf, ali joj se ruka “skratila” i Pliškova je uzvratila ribrejkom, a u taj-brejku je bila bolja sa 7:4.\r\n\r\nTreći set, koji bi logici stvari trebalo da donese vrhunac meča, nije bio preterano uzbudljiv. Barti je odmah oduzela servis rivalki, povela 3:0 i držala tu prednost do poslednjeg gema, ponovo joj je ruka zadrhtala, dala je Čehinji jednu brejk šansu, koju je Pliškova promašila. Drugu nije dobila…\r\n\r\n', '2021-07-10 13:09:29', 1, 3, 0, NULL, 0, 67),
(67, 'Groblje snova i izgubljena generacija svetskog tenisa pod nogama velike trojke', 'Conga, Berdih, Gaske, Monfis, Nišikori, Raonić, Dimitrov... Svi bi oni verovatno bili vlasnici bar nekoliko grend slem titula... Samo da su se rodili deceniju pre ili kasnije. A ista sudbina preti i novim mladim lavovima\r\n\r\nMuški tenis je poslednjih godina jedan od najatraktivnijih sportova na svetu. Razlog je vrlo jednostavan. Igraju ga Novak Đoković, Rafel Nadal i Rodžer Federer. Trojica najvećih svih vremena. Ne samo da ga igraju nego oni skoro na svakom velikom turniru i skoro u svakom međusobnom okršaju pišu istoriju. Već sada su među 20 najvećih sportista svih vremena i penju se...\r\n\r\nA kada se takav kvalitet koncentriše u jednoj eri i kada rođeni pobednici počnu da guraju jedan drugog ka natčovečanskim podvizima, neminovno je da postoji i druga strana. Gubitnička.\r\n\r\n(1,25) N. ĐOKOVIĆ - M. BERETINI (4,00)\r\n\r\nDok su Novak, Rafa i Rodžer pisali istoriji u mitskim mečevima i podvizima, ostatak svetskog tenisa im je završio pod nogama. Generacije i generacije su proklinjale sudbinu što su rođene u pogrešno vreme. Samo da su se pojavili 15 godina ranije ili kasnije, imali bi realne šanse da karijere završe sa grend slem titulama, prvim mesto na ATP listi i ko zna kakvim još dostignućima...\r\n\r\nVeć sada kao valjan argument stoji činjenica da je Rodžer Federer prve grend slemove osvojio u eri koju brojni teniski stručnjaci nazivaju „Weak one“ iliti „Slaba“. Rivali su mu bili lepuškasti Mark Filipusis, kontroverzni Marat Safin, tada već matori Andre Agasi i Karlos Moja, Endi Rodik koji je bio neupotrebljiv na šljaci, Huan Karlos Ferero koji je bio neupotrebljiv van šljake, Lejton Hjuit, pa solidni “specijalci“ Gaston Gaudio, Giljermo Korija, Joakim Johanson, Tim Henman, Guga Kerten...\r\n\r\nPotom je došao Nadal i prvo uspostavio strahovladu na Rolan Garosu, a dok je Novak Đoković osvojio prvi grend slem, Federer je već imao 12 grend slem titula. I krenula je zlatna era.\r\n\r\nOd 4. jula 2011. ne postoji Velika trojka, već samo surova decenijska dominacija Novaka Đokovića\r\nOd 4. jula 2011. ne postoji Velika trojka, već samo surova decenijska dominacija Novaka Đokovića\r\n\r\n\r\nMnogi odlični igrači poput Davida Ferera, Nikolaja Davidenka, Davida Nalbandijana, Fernanda Gonzalesa i drugih rođenih krajem 70-ih i početkom 80-ih su ostali u senci velike trojke... I kada su igrali fenomenalan tenis i pobeđivali po jednog ili dvojicu, nisu mogli trećeg. Nikada nisu osvojili makar jedan od četiri najveća turnira.\r\n\r\nIzuzetak je bio Sten Vavrinka koji je kasno eksplodirao gotovo niotkuda i uspeo da režira nekoliko malih čuda. Napravio je karijeru iznad svih očekivanja i osvojio tri grend slem titule. Uvek je bio tu da iskoristi rupe koje bi nastale povredama velike trojke, ali je umeo da im zaprži čorbu i kada su bili spremni i zdravi. Pobeđivao ih je u bitnim grend slem mečevima i sve tri titule osvojio na različitim podlogama što je uspeh vredan ogromnog poštovanja. Čak i takav Vavrinka na kraju ima poražavajući skor sa velikom trojkom: 12 pobeda i 59 poraza. I nikad se nije popeo više od trećeg mesta na svetskoj rang listi.\r\n\r\nIgrač koji ima isti broj grend slemova u eri velike trojke kao Vavrinka, a zaslužio je možda i još koji je Endi Mari. Čak je jedno vreme bio član “velike četvorke“ sa Novakom, Rafom i Rodžerom. Osvojio je dva Vimbldona, jedan US Open, dve zlatne medalje na Olimpijskim igrama, Dejvis kup, brojne masterse, ATP kup, postao svetski broj jedan... Zaista je u jednom trenutku bio ravnopravan rival velikoj trojci, ali su ga problemi sa povredama izbacili iz te trke. Ko zna šta bi bilo da je izdržao. Ali to famozni triling i čini velikim. Njima ni povrede nisu mogle ništa.\r\n\r\nBio je tu još jedan kojeg bi bio greh ne pomenuti. Huan Martin Del Porto. U mnogo čemu je mogao da im parira, a nekada je imao nešto i što oni nisu. Div iz Tandila je bio paklen igrač kada je bio zdrav. Nažalost, to je bilo retko. Povrede su ugušile potencijalno veliku karijeru. Ali kao satisfakcija ostaje osvojen US Open 2009. godine. Od Rolan Garosa 2005. do US Opena 2012. godine, velika trojka je osvojila 26 od 27 grend slem tunira. Taj jedan je bio Delpovo delo...\r\n\r\nSvi ostali teniseri u prethodnih 15-ak godina, pripadaju groblju srušenih snova i pojedenih talenata. Trudili su se, pokušavali, dali sve od sebe, ali su naišli na nadljude... Mnogi su izgubili, ali su najviše dobili navijači. Već skoro dve decenije prisustvuju jednoj od najzanimljivijih trka u istoriji sporta. Čistoj esenciji sporta. Najboljim mečevima koje je tenis ponudio. Danas ispodprosečni ženski tenis je najbolji dokaz koliko treba ceniti i uživati u onome što nudi muški. Pitanje je kada će i da li će u narednih 100 godina ovo da se ponovi...\r\n\r\nKada se ovo završi jednog dana, većina će žaliti što njih trojice više nema, mnogo više no što će se sećati onih koji su mogli da naprave nešto više u karijerama. Mi smo se dotakli karijera nekih koji su makar igrali poluinala ili finala grend slemova ili bili u Top 10.\r\n\r\n', '2021-07-10 13:10:04', 1, 3, 0, NULL, 0, 66),
(68, 'Rafael Nadal doneo odluku da se krajem meseca vrati na teren', 'Španac će prvi put u karijeri igrati na ATP 500 turniru u Vašingtonu\r\n\r\nRafael Nadal najavio je da će se na teren vratiti krajem jula. Naime, Španac je potvrdio premijerno igranje u Vašingtonu na turniru iz serije 500 koji će biti od 31. jula i 8 avgusta.\r\n\r\nNadal je odmah posle eliminacije na Rolan Garosu saopštio da će propustiti Vimbldon i Olimpijske igre, pa bi igranje u glavnom gradu SAD trebalo da mu predstavlja pripreme za US Open (30. avgust - 12. septembar).\r\n\r\nNadal, kao ni Novak Đoković nikada nije igrao na ovom turniru, dok je treći član \"velike trojke\" Rodžer Federer samo jednom, i to na početku karijere, 1999. godine, pojavio u Vašingtonu kada je izgubio u prvom kolu od kvalifikanta Bjorna Faua.\r\n\r\nPored Nadala učešće u Vašingtonu potvrdili su Feliks Ožije Ajasim, Aleks de Minor, Grigor Dimitrov, Miomir Kecmanović, Miloš Raonić...\r\n\r\nŠpanac je u 2021. godini igrao na šest turnira, od kojih je čak pet na šljaci. Osvojio je pehar u Barseloni (šljaka) koji je podigao posle trijumfa nad Stefanosom Cicipasom (6:4, 6:7, 7:5) i masters u Rimu (šljaka) gde je u finalu pobedio Đokovića (7:5, 1:6, 6:3).\r\n\r\nNa Australijan openu (tvrda podloga) izgubio je u četvrtfinalu od Cicipasa (6:3, 6:2, 6:7, 4:6, 5:7), a na Rolan Garosu (šljaka) u polufinalu od Đokovića (6:3, 3:6, 6:7, 2:6). U četvrtfinalu mastersa u Monte Karlu (šljaka) eliminisao ga je Andrej Rubljov (6:2, 4:6, 6:2), a Aleksandar Zverev je bio bolji od Nadala na šljaci u četvrtfinalu mastersa u Madridu (6:4, 6:4).', '2021-07-10 13:10:44', 1, 3, 0, NULL, 0, 66),
(69, 'Novaku sve otvoreno, Hurkač izbacio Federera!', 'Veliko iznenađenje u četvrtfinalu Vimbldona\r\n\r\nFenomenalni poljski teniser Hubert Hurkač nastavio je seriju iznenađenja na ovogodišnjem Vimbldonu, pošto je posle eliminacije Danila Medvedeva izbacio i legendarnog Rodžera Federera. Poljak je slavio u tri seta 6:3, 7:6(4), 6:0, a meč je trajao 111 minuta.\r\n\r\nPoljak je oduševio načinom na koji je zgromio Federera, otpor mu je slomio u taj-brejku drugog seta, a onda ga sa nulom počistio u trećem setu, za svega 29 minuta igre. Hurkač će u polufinalu igrati sa boljim iz meča Beretini - Ože Alijasim.\r\n\r\nHurkač (24) je dominirao u svim segmentima igre, imao je duplo više asova (10-5) od protivnika, više vinera i daleko manje neiznuđenih grešaka (12-31). Bolje se kretao, bio agresivniji i delovao svežije od protivnika. Federer je od početka bio u kontraritmu, iz kojeg nije uspeo da se izvuče do kraja meča.\r\n\r\nPoljaku je u prvom setu bila dovoljna jedna brejk lopta da reši set u svoju korist. Nju je osvojio pri rezultatu 3:2, a onda sigurnim servisom obezbedio dragoceno vođstvo. Federer je u drugom setu propustio veliku šansu. Odmah je napravio brejk, vodio sa 3:0 i 4:1, ali se Hurkač vratio na fenomenalan način. Pri rezultatu 2:4 iskoristio je drugu brejk loptu, smanjio rezultat i potom izjednačio. Otišlo se u taj-brejk gde je Federer bio ispod svog nivoa.\r\n\r\nŠvajcarac kao da je već tada znao da je povratak u meč nemoguća misija, pa je potpuno bezdušno ušao u treći set. To je nadahnuti Poljak surovo kaznio i ekspresno došao do najveće pobede u karijeri.\r\n\r\n', '2021-07-10 13:11:17', 1, 3, 0, NULL, 0, 66),
(70, 'Ešli Barti prva finalistkinja Vimbldona', 'Prva teniserka sveta u polufinalu grend slema u Londonu bolja od Anđelik Kerber posle dva seta\r\n\r\nPrva finalistkinja Vimbldona je Ešli Barti. Australijska teniserka je u polufinalu travnatog grend slema bila bolja od Anđelik Kerber iz Nemačke u dva seta - 6:3, 7:6 (7:3).\r\n\r\nPrvoj teniserki sveta bilo je potrebno sat vremena i 30 minuta da pređe još jednu prepreku na putu ka velikom finalu. Barti se u prvom gemu suočila sa dve brejk lopte, koje je uspela da spasi i povede 1:0. U narednom gemu je ona napravila pritisak na servis protivnice i stigla do prilike za brejk, koju je za razliku od Kerber odmah iskoristila. U sledećem gemu ga je potvrdila i stigla do prednosti od 3:0. Do kraja seta su teniserke čuvale svoj servis, pa se razlika na semaforu na kraju ovog perioda nije promenila. Barti ga je dobila rezultatom 6:3.\r\n\r\n', '2021-07-10 13:11:46', 1, 3, 0, '2021-07-10 16:57:18', 1, 67),
(71, 'Terzić: Spisak za Tokio dan pred polazak', 'Odbojkašice u četvrtak polaze na Olimpijske igre\r\n\r\nSelektor ženske odbojkaške reprezentacije Srbije Zoran Terzić otkrio je da će konačan spisak putnica na Olimpijske igre objaviti dan pred polazak za Japan, 14. jula.\r\n\r\nStrateg srpskog tima, koji će na Igrama u Tokiju braniti srebro iz Rija, a napasti zlato, rešio je da za svaki slučaj odloži objavljivanje sastava reprezentacije do poslednjeg dana.\r\n\r\n“Sastav tima biće poznat 14. jula. Generalno, 15-ak igrača se zna, ali ne bih da govorim tačno spisak. Na kraju krajeva, i ja ga ne znam tačno. Ne daj Bože, uvek može da bude nekih problema, da moraju neke izmene da se prave. Sačekaćemo 14. jul\", objasnio je Terzić.\r\n\r\nSrbija će put Tokija krenuti u dobrom raspoloženju, pošto je dobila sve tri kontrolne utakmice protiv Italije koje su se igrale u Ubu i Beogradu.\r\n\r\n', '2021-07-10 13:12:29', 1, 4, 0, NULL, 0, 19),
(72, 'Serija promocija na Novom Beogradu, ozvaničen i Strahinja Rašović', 'Veliko pojačanje za sastav Vladimira Vujasinovića\r\n\r\nNastavlja se projekat stvaranja pravog drim-tima na Novom Beogradu. Organizator finalnog turnira Lige šampiona u vaterpolu seriju promocija velikih pojačanja nastavio je Strahinjom Rašovićem, koji je i zvanično predstavljan kao novi igrač ekipe legendarnog Vladimira Vujasinovića.\r\n\r\nRašović u redove Novobeograđana stiže posle šampionske sezone u Radničkom iz Kragujevca, gde je postao vladar regionalnog i domaćeg prvenstva, a sada je deo još ambicioznijeg projekta koji za cilj ima osvajanje najvažnijeg trofeja u klupskom vaterpolu.\r\n\r\nStrahinja Rašović dobro zna kakav je osećaj biti prvak Evrope, pošto je to učinio sa Crvenom zvezdom 2013. godine. Sa crveno-belima je osvojio dve duple krune i Superkup Evrope, a potom je uzeo Kup kralja i dva Superkupa Španije sa Barselonetom. Pre Radničkog nastupao je i za Eger.\r\n\r\n\"Drago mi je što ću ponovo igrati sa bratom Viktorom u istom klubu. Pokušaćemo udruženim snagama sa Novim Beogradom da napadnemo krov Evrope\", rekao je Strahinja Rašović za Mozzart Sport.\r\n\r\nProšle sezone je bio najbolji igrač Kragujevčana, kojima će ove sezone biti teško da se nose sa ambicioznim protivnicima kao što su Novi Beograd i Partizan.\r\n\r\n', '2021-07-10 13:13:18', 1, 4, 0, NULL, 0, 18),
(73, 'Uspešna generalna proba pred Tokio: Odbojkašice Srbije treći put bolje od Italijanki', 'Izabranice Zorana Terzića u odličnom raspoloženju putuju na Olimpijske igre\r\n\r\nTri prijateljska meča su odigrale selekcije Srbije i Italije u sklopu priprema za Olimpijske igre u Tokiju i sva tri su završena na identičan način – pobedom odbojkašica Srbije.\r\n\r\nRazlika između Srbije i Italije je tačno jedan set. Tri puta su odbojkašice Srbije slavile u pet setova, a generalnoj probi pred put u Tokio prisustvovalo je oko 1.000 gledalaca u dvorani Sportskog centra “Voždovac”. Plava četa je slavila sa 3:2, po setovima 25:18, 23:25, 24:26, 25:22, 16:14.\r\n\r\nU centru pažnje bile su Tijana Bošković i Paula Egonu. Briljirale su Bošković i Egonu, a italijanki je pripao “mali rat”, ali ne i bitka. Osvojila je Tijana Bošković 29 poena, dok je Paula Egonu gurala Italijanke, ali 31 poen nije bio dovoljan da se nadigraju devojke Zorana Terzića.\r\n\r\n', '2021-07-10 13:13:45', 1, 4, 0, NULL, 0, 19),
(74, 'Selektori Hrvatske, Crne Gore, Španije i Mađarske saopštili spisak putnika za Tokio', 'Čekaju se Italijani\r\n\r\nOdredio je Dejan Savić vaterpoliste koji će predstavljati Srbiju na Olimpijskim igrama u Tokiju, a za svaki slučaj će na završne pripreme povesti i rezervne igrače. Delfini će u Japanu braniti zlato osvojeno u Riju pre pet godina, a kako se Igre bliže, sve je manje nepoznanica.\r\n\r\nSa listama igrača izašli su selektori Hrvatske, Crne Gore, Španije, Mađarske, Grčke, Sjedinjenih Američkih Država i Australije. Stiče se utisak da će Srbiji najveći konkurent za zlato biti reprezentacija Hrvatske, baš kao i u Riju. Ali, tek treba Italijani da objave konačan spisak.\r\n\r\nSrbija je uoči puta u Tokio osvojila turnir, koji je organizovala u Beogradu. Pored naše selekcije su učestvovale Španija, Francuska i B selekcija Srbije. U odličnom raspoloženju na igre putuju i Ajkule. Crna Gora je u Tbilisiju osvojila Svetsku ligu savladavši Ameriku u finalu.\r\n\r\nSpisak Srbije: Branislav Mitrović, Gojko Pijetlović, Filip Filipović, Dušan Mandić, Nikola Dedović, Milan Aleksić, Sava Ranđelović, Nikola Jakšić, Andrija Prlainović, Stefan Mitrović, Strahinja Rašović, Duško Pijetlović i Đorđe Lazić, kao i Radomir Drašović, odnosno Đorđe Vučinić, koji u Kašivazaki (baza za završne pripreme) putuju kao rezervne opcije.\r\n\r\nSelektor: Dejan Savić.\r\n\r\nSpisak Hrvatske: Marko Bijač, Ivan Marcelić, Luka Lončar, Josip Vrlić, Andro Bušlje, Marko Macan, Paulo Obradović, Lovre Miloš, Maro Joković, Havijer Garsija, Ante Vukičević, Luka Bukić i Loren Fatović.\r\n\r\nSelektor: Ivica Tucak.\r\n\r\nSpisak Crne Gore: Slaven Kandić, Draško Brguljan, Miroslav Perković, Marko Petković, Uroš Ćućković, Vlado Popadić, Stefan Vidović, Aleksa Ukropina, Aleksandar Ivović, Vladan Spaić, Dušan Matković, Dušan Banićević i Petar Tešanović.\r\n\r\nSelektor: Vladimir Gojković.\r\n\r\nSpisak Mađarske: Viktor Nađi, Soma Vogel, Danijel Anđijal, Balaš Erdelji, Norbert Hosnijanski, Balaš Harai, Silard Jansik, Kristijan Manherc, Tamaš Mezei, Matjaš Pastor, Deneš Varga, Marton Vamoš i Gergo Zalanki.\r\n\r\nSelektor: Tamaš Marc.\r\n\r\nSpisak Španije: Danijel Lopez Pinedo, Unaj Agire, Alehandro Bustos, Migel de Toro, Martin Famera, Fransisko Fernandez, Alvaro Granados, Mark Larumbe, Blai Malarah, Alberto Munariz, Felipe Perone, Bernat Sanauha i Rožer Taulj.\r\n\r\nSelektor: David Martin.\r\n\r\nSpisak Grčke: Manolis Zerdevas, Kostas Galanidis, Konstantinos Genidunijas, Dimitris Skumpakis, Marios Kapocis, Janis Funtulis, Aleksandros Papanastasiju, Jorgos Dervidis, Stelios Argiropulos, Konstantinos Murikis, Hristoldulos Kolomvos, Konstantinos Gkiuvecis i Angelos Vlahopulos.\r\n\r\nSelektor Grčke: Todoris Vlahos.\r\n\r\nSpisak SAD: Dru Holand, Aleks Volf, Džoni Huper, Marko Vavić, Aleks Obert, Hanes Dube, Luka Kupido, Ben Halok, Ben Stevenson, Aleks Boven, Dilan Vudhed, Džesi Smit i Maks Irving.\r\n\r\nSelektor: Dejan Udovičić.\r\n\r\nSpisak Australije: Džoel Denerli, Entoni Hrisantos, Riči Kembel, Lahlan Edvards, Blejk Edvards, Endrju Ford, Džordž Ford, Ris Houden, Nejtan Pauer, Timoti Put, Ejdan Rouč, Goran Tomašević i Aron Janger.\r\n\r\nSelektor: Elvis Fatović.\r\n\r\n', '2021-07-10 13:14:15', 1, 4, 0, NULL, 0, 18),
(75, 'Selektori Hrvatske, Crne Gore, Španije i Mađarske saopštili spisak putnika za Tokio', 'Čekaju se Italijani\r\n\r\nOdredio je Dejan Savić vaterpoliste koji će predstavljati Srbiju na Olimpijskim igrama u Tokiju, a za svaki slučaj će na završne pripreme povesti i rezervne igrače. Delfini će u Japanu braniti zlato osvojeno u Riju pre pet godina, a kako se Igre bliže, sve je manje nepoznanica.\r\n\r\nSa listama igrača izašli su selektori Hrvatske, Crne Gore, Španije, Mađarske, Grčke, Sjedinjenih Američkih Država i Australije. Stiče se utisak da će Srbiji najveći konkurent za zlato biti reprezentacija Hrvatske, baš kao i u Riju. Ali, tek treba Italijani da objave konačan spisak.\r\n\r\nSrbija je uoči puta u Tokio osvojila turnir, koji je organizovala u Beogradu. Pored naše selekcije su učestvovale Španija, Francuska i B selekcija Srbije. U odličnom raspoloženju na igre putuju i Ajkule. Crna Gora je u Tbilisiju osvojila Svetsku ligu savladavši Ameriku u finalu.\r\n\r\nSpisak Srbije: Branislav Mitrović, Gojko Pijetlović, Filip Filipović, Dušan Mandić, Nikola Dedović, Milan Aleksić, Sava Ranđelović, Nikola Jakšić, Andrija Prlainović, Stefan Mitrović, Strahinja Rašović, Duško Pijetlović i Đorđe Lazić, kao i Radomir Drašović, odnosno Đorđe Vučinić, koji u Kašivazaki (baza za završne pripreme) putuju kao rezervne opcije.\r\n\r\nSelektor: Dejan Savić.\r\n\r\nSpisak Hrvatske: Marko Bijač, Ivan Marcelić, Luka Lončar, Josip Vrlić, Andro Bušlje, Marko Macan, Paulo Obradović, Lovre Miloš, Maro Joković, Havijer Garsija, Ante Vukičević, Luka Bukić i Loren Fatović.\r\n\r\nSelektor: Ivica Tucak.\r\n\r\nSpisak Crne Gore: Slaven Kandić, Draško Brguljan, Miroslav Perković, Marko Petković, Uroš Ćućković, Vlado Popadić, Stefan Vidović, Aleksa Ukropina, Aleksandar Ivović, Vladan Spaić, Dušan Matković, Dušan Banićević i Petar Tešanović.\r\n\r\nSelektor: Vladimir Gojković.\r\n\r\nSpisak Mađarske: Viktor Nađi, Soma Vogel, Danijel Anđijal, Balaš Erdelji, Norbert Hosnijanski, Balaš Harai, Silard Jansik, Kristijan Manherc, Tamaš Mezei, Matjaš Pastor, Deneš Varga, Marton Vamoš i Gergo Zalanki.\r\n\r\nSelektor: Tamaš Marc.\r\n\r\nSpisak Španije: Danijel Lopez Pinedo, Unaj Agire, Alehandro Bustos, Migel de Toro, Martin Famera, Fransisko Fernandez, Alvaro Granados, Mark Larumbe, Blai Malarah, Alberto Munariz, Felipe Perone, Bernat Sanauha i Rožer Taulj.\r\n\r\nSelektor: David Martin.\r\n\r\nSpisak Grčke: Manolis Zerdevas, Kostas Galanidis, Konstantinos Genidunijas, Dimitris Skumpakis, Marios Kapocis, Janis Funtulis, Aleksandros Papanastasiju, Jorgos Dervidis, Stelios Argiropulos, Konstantinos Murikis, Hristoldulos Kolomvos, Konstantinos Gkiuvecis i Angelos Vlahopulos.\r\n\r\nSelektor Grčke: Todoris Vlahos.\r\n\r\nSpisak SAD: Dru Holand, Aleks Volf, Džoni Huper, Marko Vavić, Aleks Obert, Hanes Dube, Luka Kupido, Ben Halok, Ben Stevenson, Aleks Boven, Dilan Vudhed, Džesi Smit i Maks Irving.\r\n\r\nSelektor: Dejan Udovičić.\r\n\r\nSpisak Australije: Džoel Denerli, Entoni Hrisantos, Riči Kembel, Lahlan Edvards, Blejk Edvards, Endrju Ford, Džordž Ford, Ris Houden, Nejtan Pauer, Timoti Put, Ejdan Rouč, Goran Tomašević i Aron Janger.\r\n\r\nSelektor: Elvis Fatović.\r\n\r\n', '2021-07-10 13:15:46', 1, 4, 0, '2021-07-11 08:00:25', 1, 18),
(76, 'Dijamantska liga: Ivana Španović druga u Oslu', 'Dobro izdanje ohrabruje\r\n\r\nIvana Španović, najbolja srpska atletičarka, osvojila je drugo mesto na mitingu Dijamantske lige u Oslu. Reprezentativka Srbije nije uspela da ponovi rezultat iz Toskane, gde je stigla do 13. trijumfa u Dijamantskoj ligi, ali raduje to što je povreda stopala definitivno prošlost.\r\n\r\nDužina od 6,66 metara donela je Ivani Španović drugo mesto. Najbolja na mitingu u Oslu bila je Nemica Malaiha Mikambo, koja je skočila 6,83 metra. Trećeplasirana Nastasija, Mirončuk-Ivanova je dosegla dužinu od 6,58 metara u poslednjoj seriji. Ni njoj, kao ni Nemici to nije bio najbolji skok dana, ali svi su se odavno navikli na čudnovati sistem bodovanja u Dijamantskoj ligi.\r\n\r\nPeta stanica Dijamantske lige je Stokholm, a Ivana Španović će 4. jula skakati u dalj za nove bodove.\r\n\r\n', '2021-07-10 13:16:04', 1, 4, 0, '2021-07-10 16:56:03', 1, 70),
(77, 'Gde sprintom na Kevendiša? Britancu treća etapna pobeda i monopol na zelenu majicu (VIDEO)', 'Pogačar i nakon desete etape vodeći u generalnom plasmanu\r\n\r\nKakva dominacija jednog od najboljih sprintera 21. veka. Mark Kevendiš je trijumfovao na 10. etapi Tur de Fransa jer je deonicu dugu 190 kilometara od Albervila do Valensa odvezao za četiri sata, 14 minuta i sedam sekundi. Kada na dnevni red dođe sprint završnica, nema mu ravnog što je pokazao i danas okitivši se trećom etapnom pobedom na ovogodišnjem Turu.\r\n\r\nNeprikosnoveni je vlasnik zelene majice namenjene najboljem sprinteru - sakupio je 218 poena i nema vozača koji mu diše za vratom. Najbliži mu je Australijanac Majkl Metjus sa 159 poena.\r\n\r\n', '2021-07-10 13:16:32', 1, 4, 0, '2022-02-08 12:48:01', 43, 68),
(78, 'vsev', 'evever', '2021-07-10 16:16:22', 1, 1, 1, '2021-07-10 16:21:11', 0, 20);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vwvest`
-- (See below for the actual view)
--
CREATE TABLE `vwvest` (
`vest_id` int(10) unsigned
,`vest_naslov` varchar(200)
,`vest_obrisan` int(1)
,`vest_autor_id` int(5)
,`vest_tekst` text
,`vest_vreme` timestamp
,`vest_pogledan` int(5)
,`vest_kategorija_id` int(5)
,`vest_podkategorija_id` int(11)
,`kategorija_naziv` varchar(45)
,`podKategorija_naziv` varchar(45)
);

-- --------------------------------------------------------

--
-- Structure for view `vwvest`
--
DROP TABLE IF EXISTS `vwvest`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwvest`  AS SELECT `vest`.`vest_id` AS `vest_id`, `vest`.`vest_naslov` AS `vest_naslov`, `vest`.`vest_obrisan` AS `vest_obrisan`, `vest`.`vest_autor_id` AS `vest_autor_id`, `vest`.`vest_tekst` AS `vest_tekst`, `vest`.`vest_vreme` AS `vest_vreme`, `vest`.`vest_pogledan` AS `vest_pogledan`, `vest`.`vest_kategorija_id` AS `vest_kategorija_id`, `vest`.`vest_podkategorija_id` AS `vest_podkategorija_id`, `kategorija`.`kategorija_naziv` AS `kategorija_naziv`, `podkategorija`.`podKategorija_naziv` AS `podKategorija_naziv` FROM ((`vest` join `kategorija` on(`kategorija`.`kategorija_id` = `vest`.`vest_kategorija_id`)) join `podkategorija` on(`podkategorija`.`podKategorijaID` = `vest`.`vest_podkategorija_id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kategorija`
--
ALTER TABLE `kategorija`
  ADD PRIMARY KEY (`kategorija_id`);

--
-- Indexes for table `komentar`
--
ALTER TABLE `komentar`
  ADD PRIMARY KEY (`komentar_id`),
  ADD KEY `vest_komentar_id` (`vest_komentar_id`);

--
-- Indexes for table `korisnik`
--
ALTER TABLE `korisnik`
  ADD PRIMARY KEY (`korisnik_id`);

--
-- Indexes for table `podkategorija`
--
ALTER TABLE `podkategorija`
  ADD PRIMARY KEY (`podKategorijaID`),
  ADD KEY `fk_kategorija_idx` (`podKategorijaKategorijaID`);

--
-- Indexes for table `vest`
--
ALTER TABLE `vest`
  ADD PRIMARY KEY (`vest_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kategorija`
--
ALTER TABLE `kategorija`
  MODIFY `kategorija_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `komentar`
--
ALTER TABLE `komentar`
  MODIFY `komentar_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `korisnik`
--
ALTER TABLE `korisnik`
  MODIFY `korisnik_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT for table `podkategorija`
--
ALTER TABLE `podkategorija`
  MODIFY `podKategorijaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `vest`
--
ALTER TABLE `vest`
  MODIFY `vest_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `komentar`
--
ALTER TABLE `komentar`
  ADD CONSTRAINT `komentar_ibfk_1` FOREIGN KEY (`vest_komentar_id`) REFERENCES `vest` (`vest_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
