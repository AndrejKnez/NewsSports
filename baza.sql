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
(42, 'Beretini zreo za zavr??nicu Vimbldona: Ru??i prepreke servisom i ima novi zicer u osmini finala', 'Za manje od dva sata razre??io Bedenea du??nosti, naredna prepreka Belorus Iva??ka\r\n\r\nZahuktava se Mateo Beretini, odli??no servira i deluje kao teniser koji je zreo za zavr??nicu Vimbldona. Posle Gvida Pelje i kvalifikanta Botika van den Zand??ulpa, u tre??em kolu travnatog grend slema pao je Alja?? Bendene. Odigrao je Italijan onoliko koliko mu je bilo potrebno da bez bilo kakve napetosti razre??i Slovenca du??nosti u Londonu. To je u??inio sa po jednim brejkom u sva tri seta - 3:0 (6:4, 6:4, 6:4).\r\n\r\nDeveti teniser sveta je bio prili??no siguran prilikom izvo??enja po??etnog udarca, spasao je obe brejk lopte koje je dozvolio rivalu, a uni??tavao ga je ??estim servis vinerima - na kraju ih je bio 20, identi??no kao i u prva dva me??a. Sa ukupno 60 asova Italijan je izbio na prvo mesto liste najboljih servera.\r\n\r\nBeretini je uglavnom re??avao poene sa osnovne linije, a kada se odlu??ivao za izlazak na mre??u, nije gre??io. I tre??i put uzastopno ro??eni Rimljanin slavio je protiv Bedenea, pa ??e u osmini finala igrati sa Belorusom Iva??kom koji je tako??e u tri seta savladao Australijanca Tompsona.\r\n\r\nZa razliku od ju??era??njeg kada je eliminisan Fabio Fonjini, dana??nji dan bio je vrlo uspe??an za Italijene budu??i da je plasman me??u 16 najbolji izborio i Lorenco Sonego. Za maksimalnih 3:0 (6:3, 6:4, 6:4) protiv D??ejmsa Dakvorta 27. teniseru sveta bilo je neophodno 111 minuta borbe. Mo??da je borba prejaka re??, budu??i da je i Sonego poput sunarodnika Beretinija napravio po brejk u sva tri seta ne dozvoli??i rivalu da mu oduzme servis. Sonego u osmini finala ??eka pobednika me??a Rod??er Federer - Kameron Nori koji je na programu ne pre 16.15.\r\n\r\nTrijumf maksimalnim rezultatom ostvario je i Poljak Hubert Hurka?? protiv Aleksandera Bublika, pa ??e se 18. na ATP lisi u osmini sastati ili sa Danilom Medvedevim ili sa Marinom ??ili??em.', '2021-07-03 12:26:56', 1, 3, 0, NULL, 0, 14),
(43, 'Duop Rit potpisao za Ilavara Hokse', 'Sada ve?? biv??i igra?? crveno-belih profesionalnu karijeru nastavlja u Australiji\r\n\r\nDoskora??nji prvotimac Crvene zvezde Duop Rit karijeru nastavlja u australijskom klubu Ilavara Hoks, saznaje Mozzart Sport. Rit se proteklih dana povezivao sa Mornarom iz Bara, ali se na kraju odlu??io za klub iz zemlje ??iji ??e dres nositi na Olimpijskim igrama u Tokiju.\r\n\r\nIlavara Hoks nastupa u tamo??njoj Nacionalnoj ligi, koju je osvajao 2001. godine. Pro??lu sezonu zavr??io je u polufinalu plej-ofa, gde je pora??en od Perta Vajldketsa.\r\n\r\nRit je pro??le sezone osvojio titule u ABA ligi i Superligi Srbije. Na 23 utakmice u Evroligi prose??no je postizao 4,8 poena i imao 1,9 skokova po me??u. Sli??no je bilo i u ABA ligi, gde je imao 4,5 poena i 2,3 skoka po me??u.\r\n\r\nRit je studirao na Luizijana Stejt univerzitet, ali 2018. godne nije draftovan, posle ??ega je do??ao u FMP. Posle dve sezone u dresu Pantera dobio je priliku i u Crvenoj zvezdi, ali je usledio rastanak posle godinu dana.\r\n\r\n', '2021-07-03 12:28:23', 1, 2, 0, NULL, 0, 14),
(44, 'Petar Stani?? zvani??no u crveno-belom', 'Ugovor na ??etiri godine\r\n\r\nBurno u Crvenoj zvezdi danas. Dogovoren je dolazak Ohija Omoi??uanfa na zimu, pregovara se oko dovo??enja novog ??pica, a i zvani??no je promovisan Petar Stani?? kao najnovije poja??anje srpskog prvaka.\r\n\r\nFudbaler sredine terena koji je pro??le sezone igrao za ??elezni??ar iz Pan??eva u Prvoj ligi Srbije, potpisao je ugovor na ??etiri godine.\r\n\r\n???Nadam se da ??u opravdati o??ekivanja koja ljudi u klubu imaju od mene. Za ovaj klub navijam od malih nogu, kao i cela moja porodica, tako da sam veoma sre??an zbog dolaska u Crvenu zvezdu???, rekao je Stani?? za klupski sajt.\r\n\r\n', '2021-07-03 12:29:05', 1, 1, 0, NULL, 0, 9),
(45, 'Pozitivni signali: Svi ko??arka??i Srbije na zagrevanju pred Portoriko', 'Vide??emo samo ko ??e igrati\r\n\r\nVelika neizvesnost vladala je u taboru reprezentacije Srbije pred susret s Portorikom zbog svih povreda koje su se dogodile u utakmicama grupne faze olimpijskih kvalifikacija.\r\n\r\nIpak, u satu uo??i starta polufinalnog okr??aja s Portorikom sti??u pozitivni signali - svi roviti igra??i istr??ali su na zagrevanje! Sada ostaje samo da se vidi ko ??e i u kolikom obimu mo??i da pomogne Srbiji da obezbedi plasman u finale olimpijskih kvalifikacija i zaka??e novi megdan s reprezentacijom Italije koja je ne??to ranije ubedljivo savladala Dominikansku Republiku.\r\n\r\n', '2021-07-03 12:29:51', 1, 2, 0, NULL, 0, 11),
(46, 'Radni??ki iz Ni??a odmerava snagu sa slovena??kim prvoliga??em, na terenu i Partizanov protivnik', 'Real sa Ni??ave od 18.30 ??asova igra protiv Tabor Se??ane, dok DAC Dunajska Streda igra sa ma??arskim drugoliga??em Halada??om\r\n\r\nDobro je Radni??ki iz Ni??a zapo??eo pripreme u Terme ??ate??u, deklasirao je u prvom pripremnom me??u Bre??ice sa 8:1. Ove subote od 18.30 ??asova o??ekuje ga znatno te??i test, odmeri??e snage sa prvoliga??em Slovenije Taborom Se??anom.\r\n\r\nNovajlija iz Japana Rioheji Mi??ibu??i dobro se pokazao na svom prvom me??u u dresu Ni??lija, postigao je jedan od golova. Poku??a??e da nastavi u istom ritmu i protiv tima koji je pro??lu sezonu zavr??io na ??estoj poziciji u ??ampionatu Slovenije.\r\n\r\n', '2021-07-03 12:30:27', 1, 1, 0, NULL, 0, 9),
(47, '??esi protiv Danaca za polufinale Eura: Hoc??e li o??iveti 17-godi??nja sec??anja???esi protiv Danaca za polufinale Eura: Hoc??e li o??iveti 17-godi??nja sec??anja?', 'Knedli??ke 2004. eliminisale Skandinavce, a sada se u Bakuu bore u sklopu ??etvrtfinala kontinentalne smotre\r\n\r\nUdarac glavom Jana Kolera i dva pogotka Milana Baro??a vec?? su jednom razveselili navija??e ??e??ke reprezentacije u ??etvrtfinalu Eura protiv Danske. Posle 17 leta, obe selekcije c??e se ponovo takmi??iti u istoj fazi Evropskog prvenstva, iako su se po??etne pozicije, naravno, promenile poslednjih godina.\r\n\r\nOvo je svojevrstan povratak otpisanih, i to na velika vrata. Uzdi??uc??i se posle impresivnih pobeda u osmini finala ??e??ka i Danska ??e ve??eras u Bakuu da odlu??e o u??esniku polufinala Evropskog prvenstva (18.00).\r\n\r\n', '2021-07-03 12:31:23', 1, 1, 0, NULL, 0, 12),
(48, 'DOGOVORENO: Zvezda dovela Dionija na pozajmicu! Otkupna klauzula 1.200.000 evra, plata pola miliona', 'Uskoro i zvani??na potvrda\r\n\r\nZvezdina potraga za novim napada??em je zavr??ena! Francuski ??pic Loi Dioni igra??e u narednoj sezoni za srpskog ??ampiona kao pozajmljeni fudbaler An??ea, saznaje Mozzart Sport.\r\n\r\nNema jo?? zvani??ne potvrde, ali ??elnici srpskog ??amiona dogovorili su sve uslove saradnje sa francuskim klubom. Sna??ni napada?? preseli??e se na Marakanu na jednogodi??nju pozajmicu, a u ugovor je uba??ena opcija o otkupu. Ukoliko crveno-beli budu ??eleli da otkupe Dionija mora??e An??eu da plate 1.200.000 evra u tri rate.', '2021-07-04 10:27:47', 1, 1, 0, NULL, 0, 9),
(49, 'a', 'a', '2021-07-05 09:20:08', 1, 1, 1, '2021-07-05 09:21:04', 0, 14),
(50, 'a', 'a', '2021-07-05 09:20:34', 1, 1, 1, '2021-07-05 09:21:00', 0, 14),
(51, 'a', 'a', '2021-07-05 09:20:45', 1, 1, 1, '2021-07-05 09:21:02', 0, 10),
(52, 'a', 'a', '2021-07-06 11:50:12', 1, 1, 1, '2021-07-06 11:50:21', 0, 15),
(54, 'a', 'a', '2021-07-10 12:59:25', 1, 1, 1, '2021-07-10 13:01:05', 0, 17),
(55, 'Ovo nije (ni blizu) poslednja Novakova ??ansa za stizanje Rod??era i Rafe', 'D??on Mekinro predvi??a da bi srpski teniser, za razliku od rivala, mogao do jo?? ??etiri-pet grend slemova\r\n\r\nNovak ??okovi?? je ogroman posao odradio u polufinalu Rolan Garosa. Savladao je Rafaela Nadala na njegovom ognji??tu i time u??inio nekoliko stvari. Prvo - kasnije je u finalu stigao do novog grend slema. Drugo - u??inio je da Nadal ne osvoji. Tre??e - Nadal se pod uticajem takvog razvoja situacije povukao sa Vimbldona i Olimpijskih igara. Na sve to, bilo je jasno da Rod??er Federer jako te??ko mo??e do novog grend slema u ovim godinama.\r\n\r\nSa ??est pobeda stigao je sada do finala Vimbldona gde ??e imati ??ansu da se pobedom nad Mateom Beretinijem poravna na 20-20-20 sa Federerom i Nadalom. Ali, najbolja stvar u celoj pri??i je ??to to Novaku nije poslednja ??ansa. Ima??e ih on jo?? u budu??nosti, kada gledamo situaciju sa Rod??erom i Rafom, ali i mla??im igra??ima. Zato, sutra??nji me?? nije sudbonosan. Ali, jeste od velikog zna??aja.\r\n\r\nDakle, pobedom protiv Beretinija bi ispisao istoriju ve?? sutra. Ali, ima??e jo?? ??ansi za tako ne??to. U prilog tome idu re??i i ??uvenog D??ona Mekinroa.\r\n\r\n\"Rekao bih da Rod??er Federer vi??e ne??e osvojiti nijedan grend slem\", rekao je Mekinro.\r\n\r\n', '2021-07-10 13:01:24', 1, 3, 0, NULL, 0, 65),
(56, 'Dve promocije u danu: Novi Beograd ozvani??io Du??ka Pijetlovi??a i Viktora Ra??ovi??a', 'Sastav Vladimira Vujasinovi??a ja??a svakim danom\r\n\r\nOno ??to je najavljeno se obistinilo. Iz dana u dan VK Novi Beograd pokazuje karte zbog kojih rivali gutaju knedle. Varke nema, ambiciozni klub ??e napasti evropsku titulu. Posle Du??ana Mandi??a, Nikole Jak??i??a, Strahinje Ra??ovi??a i Radomira Dra??ovi??a, Novi Beograd je promovisao jo?? dva poja??anja ??? Du??ka Pijetlovi??a i Viktora Ra??ovi??a.\r\n\r\nNapravi??e Novi Beograd tim koji ??e biti Srbija u malom, ima??e Vlada Vujasinovi?? neophodnu ??irinu u rosteru i adekvatno popunjenu svaku poziciju. I Viktor Ra??ovi?? i Du??ko Pijetlovi?? se posle nekoliko godina igranja u inostranstvu vra??aju u dmovinu, a njih dvojica su ve?? imali priliku da sara??uju i osvajaju trofeje.\r\n\r\n', '2021-07-10 13:01:55', 1, 4, 0, NULL, 0, 18),
(57, 'Marselo kao novi kapiten Reala: Siguran sam da ??emo osvojiti neki trofej', 'Levi bek Kraljevskog kluba o predstoje??oj sezoni, An??elotiju, odnosu sa mla??im igra??ima\r\n\r\nSve ono ??to je Brazilac Marselo uradio u dresu Real Madrida za 16 godina koliko nosi njegov dres, daju mu status klupske legende. Nije se levi bek naigrao pro??le sezone pod dirigentskom palicom Zinedina Zidana. Svega 16 nastupa, odnosno 1052 minuta u Primeri gde je standardno nastupao Ferlan Mendi. Zidan je napustio klub, kao i Serhio Ramos, tako da ??e Marselo prvi put u karijeri predvoditi Blankose kao prvi kapiten.\r\n\r\n\"Velika je ??ast, ali i odgovornost biti kapiten najboljeg kluba na svetu\", rekao je Marselo.\r\n\r\nBrazilac je pri??ao o novoj sezoni i svemu onome ??to ??eka Real u novom mandatu Karla An??elotija.\r\n\r\n\"Svakoga dana se budim sa mnogo ??elje i svaku narednu sezonu o??ekujem za novim entutzijazmom. Ovde sam jako dugo, ali se motivi nikada nisu promenili, samo su se granice pomerale. Ne mogu da do??ekam start sezone. Trudim se da konstantno u??im, ali mi je potrebna pomo?? od saigra??a. Isto tako, verujem da kao kapiten, ja treba da budem taj kojem ??e se kolege obratiti i od koga ??e dobiti pomo?? kada im je neophopdna,\"\r\n\r\nPro??le sezone Real je do poslednjeg kola bio u trci za titulu, odradio je ??to je bilo do njega u 38. rundi, ali nije do??ekao kiks Atletika koji mu je bio neophodan. Naravno, Real Madrid u svaku sezonu ulazi s ambicijom da na kraju podigne pehar.\r\n\r\n???Vrlo je te??ko okon??ati sezonu bez ijednog trofeja, ali ako ni??ta drugo nismo odustajali i borili smo se do samog kraja. Siguran sam da ??emo u predstoje??oj osvojiti ne??to. Imamo dosta fudbalera koji su i dalje sa dr??avnim timovima, ali nam ne manjka motivacije za po??etak sezone.???\r\n\r\n', '2021-07-10 13:02:57', 1, 1, 0, NULL, 0, 3),
(58, 'Ivani??: Sve smo podredili plasmanu u Ligu ??ampiona', '?????elim da dam doprinos i trudi??u se da budem efikasan kao i pro??le godine???\r\n\r\nZavr??ila je Crvena zvezda pripreme u Austriji i okre??e se novoj sezoni, koja kuca na vrata. Osvaja?? duple krune na startu prvenstva, koje po??inje idu??e sedmice, igra protiv novosadske Vojvodine.\r\n\r\nCrveno-bele uskoro o??ekuju obaveze i u evropskim kvalifikacijama, a Mirko Ivani?? se osvrnuo na pripremni period i ono ??to sledi ??? pohod na grupnu fazu Lige ??ampiona.\r\n\r\n???Navikli smo se na ??itav ritam, ovo su nam ??etvrte pripreme zaredom. Treninzi su bili veoma te??ki, ali imamo cilj, da u??emo u Ligu ??ampiona ili barem Ligu Evrope. Zato smo i trenirali tako, sve je uskla??eno sa tim i ka tome idemo???, rekao je Ivani??.\r\n\r\nZvezda je u Austriji odradila ??etiri provere, a samo u generalnoj probi protiv ??turma nije upisala trijumf.\r\n\r\n???Takav je plan i program. Stru??ni ??tab je tu ve?? godinu dana i postoji obostrano poverenje. Voleli bismo da smo imali vi??e loptu u nogama, ali smo svesni da je takav period. Da se spremamo za ono ??to nas o??ekuje???.\r\n\r\nTokom priprema akcenat nije na rezultatima, ve?? na fizi??koj spremi i usvajanju zamisli trenera Dejana Stankovi??a.\r\n\r\n???Definitivno rezultat nije prioritet na pripremnim utakmicama. Va??nije nam je da uradimo ono ??to smo zamislili na treninzima i da to sprovedemo, pa rezultat do??e kao zadovoljstvo i nagrada. Ali sada nije bio u prvom planu???.\r\n\r\n', '2021-07-10 13:03:36', 1, 1, 0, '2021-07-13 15:34:27', 28, 9),
(59, 'Kembel je ??ukin u naredne tri godine', 'Potpisan ugovor na Banovom brdu\r\n\r\nZavr??en je i formalni deo: Norman Kembel je od danas novi fudbaler ??ukari??kog.\r\n\r\nReprezentativac Jamajke je bio sa Br??anima na pripremama na Bledu, ostavio je dobar utisak i samo potvrdio da uprava kluba nije pogre??ila kada je anga??ovala iz Grafi??ara.\r\n\r\nKembel je danas stavio potpis na ugovor sa ??ukari??kim, po kojem ??e biti naredne tri godine ??lan kluba sa Banovog brda. On donosi belo-crnima ta??no ono ??to su tra??ili, ??to im je nedostajalo prethodnog prole??a: brzinu, probojnost po boku, ve??i broj igra??a u zavr??nici akcija???\r\n\r\n', '2021-07-10 13:04:11', 1, 1, 0, NULL, 0, 9),
(60, 'Real i Kerol nastavljaju saradnju, ali dogovaraju nesvakida??nji aran??man', 'Iskusni ??uter po??e??e sezonu ne??to kasnije\r\n\r\nKraj sezone za nama zna??io je i odlazak u penziju za legendarnog Felipea Rejesa, a spekulisalo se i o mogu??em kraju za D??ejsija Kerola.\r\n\r\nPrekaljeni ameri??ki ??uter razmi??lja o penziji, ali postoji velika ??ansa da odigra jo?? jednu sezonu. Ili, bolje re??eno, polusezonu u dresu Reala. Naime, ??panski mediji pi??u o tome da Real i Kerol rade na nesvakida??njem aran??manu odnosno ugovoru koji bi bio potpisan prakti??no na ??est meseci.\r\n\r\nO ??emu se zapravo radi? Kerol ima ??elju da posle delimi??nog smirivanja pandemijskog stanja provede vi??e vremena sa porodicom u Sjedinjenim Ameri??kim Dr??avama i Real je spreman da mu iza??e u susret tako ??to ??e mu ponuditi ugovor na pola godine. Od decembra-januara, do kraja sezone. Tako ne??to se zaista ne vi??a u profesionalnom sportu, ali Kraljevski klub je spreman da ga ispo??tuje s obzirom na sve ??to je uradio tokom deset godina boravka u Realu.\r\n\r\n\r\n\r\n', '2021-07-10 13:05:23', 1, 2, 0, NULL, 0, 3),
(61, 'Iz Evrolige na Novi Zeland: Pejton Siva napustio berlinsku Albu', 'Ameri??ki plejmejker ??e idu??e sezone igrati u NLB ligi\r\n\r\nJedan od najboljih organizatora igre u Evropi prethodnih godina odlu??io se na nesvakida??nji potez. Posle odli??ne sezone u Evroligi na individuelnom planu, Pejton Siva je krem evropske ko??arke zamenio Novim Zelandom.\r\n\r\nPet godina je Pejton Siva nosio dres berlinske Albe, a od jeseni ??e braniti boje Nju Ziland Brejkersa, prenosi ESPN. Pejton Siva je minule sezone u Evroligi bele??io 10,1 poen i 5,2 asistencije po me??u, a 2019. je nastupaju??i za Albu bio najBolji poenter Evrokupa.\r\n\r\nPokupio je brojna individualna priznanja igraju??i za nema??ki tim, a sa Albom je u dva navrata osvajao Bundesligu. Ameri??ki plejmejker je u najboljim godinama, kada je bio me??u najcenjenijim igra??ima na svojoj poziciji u Evropi, spakovao kofere, zatvorio jedno pOglavlje i otvorio novo ??? egzoti??no.\r\n\r\nIako se opredelio za klub sa Novog Zelanda, Pejton Siva ??e utakmice mahom igrati u Australiji. Nju Ziland Bejkersi su jedini tim u NLB ligi koji nije iz Zemlje kengura.\r\n\r\n', '2021-07-10 13:05:59', 1, 2, 0, NULL, 0, 2),
(62, 'INTERVJU - Marko Marinovi??: Svaki doma??i igra?? kojeg sam hteo da dovedem - prvo bi tra??io pare', 'Mladi trener pri??ao o izazovnoj sezoni za nama, odluci da u Superligi pru??i ??ansu talentovanoj deci Borca, ko??arci u Srbiji i za??to je va??no da se ponovo o??ive ko??arka??ki centri van Beograda, za??to je bilo vi??e stranaca, saradnji sa ??eljkom Obradovi??em, ali i planovima za budu??nost\r\n\r\nZavr??nicu pro??le klupske sezone u Srbiji obele??io je ??a??anski Borac. Podvig s izborenim opstankom u Jadranskoj ligi tokom nikad izazovnije godine za kompletno dru??tvo, mladi i perspektivni trener Marko Marinovi?? doneo je va??nu odluku da u poslednjih nekoliko utakmica Superlige pru??i ??ansu najtalentovanijim klupskim izdancima. I napravio je pun pogodak!\r\n\r\nO igrama njegove de??urlije pisalo se i pri??alo danima, pobeda u seriji sa FMP iz ??eleznika do??ao je kao savr??en dokaz da se poverenje isplati, a odmeravanje snaga sa Crvenom zvezdom u polufinalu kao ??lag na tortu za momke koji su ne??to ranije osvojili kadetskku ligu Srbije.\r\n\r\nMarko Marinovi?? u svemu tome vidi odli??an temelj za dalji rad, rast, razvoj i usavr??avanje. Njega kao trenera i igra??a ??ije vreme tek dolazi.\r\n\r\n???Sezona je bila mnogo te??ka, ali smo na kraju iza??li s povoljnim rezultatom iza nas. Mo??da smo uradili ne??to vi??e od onoga ??to se o??ekivalo. Dobro je ??to smo se plasirali u polufinale Superlige. Mi smo zacrtane ciljeve ispunili, nije bilo nimalo lako, cele sezone smo se mu??ili???, po??eo je Marinovi?? razgovor za Mozzart Sport.\r\n\r\nNa ??ta konkretno mislite?\r\n\r\n???Znate i sami da je publika na?? ??esti igra??, tu je uvek da nam pomogne. Cela sezona bila je turbulentna, sa odlaganjima u pandemijskim uslovima. I pored nepovoljnog rasporeda na po??etku sezone, uspeli smo da se izvu??emo i izbegnemo bara?? za ostanak u ligi???.\r\n\r\n', '2021-07-10 13:06:32', 1, 2, 0, NULL, 0, 14),
(63, 'Prvi inostrani anga??man: Nenadi?? se seli u Poljsku', 'Srpski ko??arka?? je novo poja??anje Zjelone Gore\r\n\r\nSrpski ko??arka?? Nemanja Nenadi?? nastavlja karijeru u Poljskoj. On je poja??ao ekipu Zjelone Gore, sa kojom ??e igrati u doma??em prevenstvu i VTB ligi.\r\n\r\nTokom prethodne sezone Nenadi?? je igrao za FMP iz ??eleznika, a ovo ??e mu biti prvi inostrani anga??man u karijeri.\r\n\r\n???Hvala vam ??to sam dobio priliku da se pridru??im ovom timu. ??uo sam mnogo lepih stvari o klubu i drago mi je ??to ??u imati ??ansu da poka??em svoje ume??e. Dobri rezultati kluba iz pro??le sezone samo mi daju motivaciju da pru??im maksimum???, rekao je za klupski sajt Nemanja Nenadi??.\r\n\r\nOn je tokom poslednje sezone odigrao za FMP u ABA ligi 22 utakmice na kojima je ostvario prosek od 17 poena, pet skokova i 2,5 asistencije. Najbolji me?? odigrao je protiv Partizana u drugom kolu kada je postigao 26 poena i zabele??io tri skoka za ukupan indeks korisnosti ??? 29.\r\n\r\nKarijeru je po??eo u Slodesu, a posle toga je nosio dres Tami??a, Mladosti, Pirota, Vojvodine, Dunava, FMP u dva navrata, Crvene zvezde i Mege.\r\n\r\nNjegov novi tim je tokom prethodne sezone stigao do jednog trofeja ??? osvojio je nacionalni Kup, dok je u prvenstvu Poljske zavr??io na drugoj poziciji.\r\n\r\n', '2021-07-10 13:07:05', 1, 2, 0, NULL, 0, 14),
(64, 'Jo?? jedna gr??ka legenda u penziji: Burusis stavio ta??ku posle dve decenije', 'Jedan od najboljih gr??kih centara novijeg doba re??io da se oprosti od ko??arke\r\n\r\nGr??ka ko??arka je u roku od samo nekoliko sedmica ostala siroma??nija zbog trojice asova koji su re??ili da oka??e patike o klin. Vasilis Spanulis, Nikos Zizis i sada Janis Burusis koji je tako??e odlu??io da ka??e - dosta!\r\n\r\nPosle pune dve decenije. I igranja za AEK, Barselonu, Olimpijakos, Olimpiju Milano, Real Madrid, baskoniju, Panatinaikos, ??e??ijang, Gran Kanariju i Peristeriju gde je proveo sezonu za nama.\r\n\r\nBurusis odlazi u igra??ku penziju kao jedan od najboljih centara svoje generacije. Sa reprezentacijom Gr??ke osvojio je evropsko zlato u Beogradu 2005. i bronzu ??etiri godine kasnije, a bio je i ??ampion Starog kontinenta za igra??e do 20 godina. Uzeo je Evroligu sa Real Madridom 2015, a s Kraljevi??ima je bio prvak ??panije 2015, te osvaja?? Kupa kralja 2014. i 2015. godine. ??panski Superkup uzeo je 2013. i 2014. godine. Uz to je bio ??ampion Gr??ke sa Aekom 2002. i Panatinaikosom 2017. godine. Dvaput je sa Olimpijakosom uzeo nacionalni kup (2010. i 2011. godine), a jednom sa Panatinaikosom 2017. godine.\r\n\r\n', '2021-07-10 13:08:01', 1, 2, 0, '2021-07-13 15:35:44', 1, 15),
(65, 'Godina iz snova - heroj Azura iz Beograda pre??ao u Baskoniju', 'Tre??e poja??anje za klub iz Vitorije\r\n\r\nVrhunska klupska sezona u berlinskoj Albi, plasman na Olimpijske igre usred Beograda gde je postao jedan od heroja Italije, pa veliki evropski transfer u Baskoniju! Simone Fontekio mo??e slobodno mo??e da ka??e kako ??ivi verovatno najbolju godinu dosada??nje karijere po??to je veliki uspon nastavio potpisom za Baskoniju.\r\n\r\nFontekio je sa klubom iz Vitorije potpisao trogodi??nji ugovor i postao tre??e poja??anje ekipe Du??ka Ivanovi??a posle Meta Kostela i Vanje Marinkovi??a.\r\n\r\nItalijanski reprezentativac je posle nekoliko godina lutanja odigrao odli??nu sezonu u Berlinu gde je bio me??u najboljim pojedincima. Evroligu je zavr??io sa 10,6 poena i 3,4 skoka na 29 utakmica, uz ne??to vi??e od 38 odsto preciznosti na ??utu za tri poena. U delikatnoj situaciji, kada je Italija ostala bez pomo??i ??etvorice vode??ih igra??a Danila Galinarija, Marka Belinelija, ??i??ija Datomea i Danijela Heketa, Fontekio je zajedno sa Akileom Polonarom izrastao u lidera reprezentacije tokom olimpijskih kvalifikacija u Beogradu. U finalu protiv Srbije ubacio je 22 poena, uz osam skokova i uz Nikola Maniona i pomenutog Polonaru bio glavna uzdanica Azura i neko ko je najvi??e ??tete naneo Orlovima u oba smera.\r\n\r\n', '2021-07-10 13:08:42', 1, 2, 0, NULL, 0, 3),
(66, '??ampionski pehar ide za Australiju: E??li Barti ??? stvarno najbolja na svetu', 'Prvi put od 2012. finale se igralo u tri seta\r\n\r\nNajbolja na svetu se potvrdila na najve??em testu! E??li Barti, prva na VTA listi, podigla je ??ampionski pehar na Vimbldonu i dokazala time da je u ovom trenutku bez premca kada je ??enski karavan belog sporta u pitanju.\r\n\r\nPrvi put jo?? od 2012. godine finale Vimbldona se igralo u tri seta. Posle lako dobijenog prvog i brejka prednosti u drugom, ??inilo se da je Barti na autoputu ka pobedi. Ali, trenutak pada koncentracije probudio je Pli??kovu, koja je uspela da se izvu??e, dobije drugi set, me??utim, u tre??em nije imala ??ansi za do??e do pehara ??? 6:3, 6:7, 6:3.\r\n\r\nOsvajanjem titule, koju je prethodno osvojila Simona Halep, pove??ala je E??li Barti prednost na vrhu VTA liste i sa 2.300 bodova prednosti u odnosu na Naomi Osaku ??eka drugu polovinu sezone.\r\n\r\nAustralijanka Barti je podigla danas tek drugi grend slem trofej u karijeri, jedini je imala sa Rolan Garosa 2019. godine. Mo??da bi bila jo?? uspe??nija ovog leta da je povreda nije izbacila sa Otvorenog prvenstva Francuske. Mirovanje joj je na kraju dobro do??lo, po??to je u Londonu protutnjala do trofeja, izgubiv??i samo po set u prvom i poslednjem me??u.\r\n\r\nPli??kova nije uspela da do??e do prvog grend slem pehara. ??ehinja, nekada??nja prva na svetskoj listi, kao da je sa velikom tremom iza??la na teren, po??to je tek posle tri i po gema osvojila prvi poen u me??u! Taj prvi set je ekspresno bacila u vodu, izgubila ga je za 30 minuta igre.\r\n\r\nU drugom setu Barti je propustila priliku da osvoji titulu sa manje truda nego ??to je morala da ulo??i na kraju. Na 5:5 je napravila brejk i servirala je za trijumf, ali joj se ruka ???skratila??? i Pli??kova je uzvratila ribrejkom, a u taj-brejku je bila bolja sa 7:4.\r\n\r\nTre??i set, koji bi logici stvari trebalo da donese vrhunac me??a, nije bio preterano uzbudljiv. Barti je odmah oduzela servis rivalki, povela 3:0 i dr??ala tu prednost do poslednjeg gema, ponovo joj je ruka zadrhtala, dala je ??ehinji jednu brejk ??ansu, koju je Pli??kova proma??ila. Drugu nije dobila???\r\n\r\n', '2021-07-10 13:09:29', 1, 3, 0, NULL, 0, 67),
(67, 'Groblje snova i izgubljena generacija svetskog tenisa pod nogama velike trojke', 'Conga, Berdih, Gaske, Monfis, Ni??ikori, Raoni??, Dimitrov... Svi bi oni verovatno bili vlasnici bar nekoliko grend slem titula... Samo da su se rodili deceniju pre ili kasnije. A ista sudbina preti i novim mladim lavovima\r\n\r\nMu??ki tenis je poslednjih godina jedan od najatraktivnijih sportova na svetu. Razlog je vrlo jednostavan. Igraju ga Novak ??okovi??, Rafel Nadal i Rod??er Federer. Trojica najve??ih svih vremena. Ne samo da ga igraju nego oni skoro na svakom velikom turniru i skoro u svakom me??usobnom okr??aju pi??u istoriju. Ve?? sada su me??u 20 najve??ih sportista svih vremena i penju se...\r\n\r\nA kada se takav kvalitet koncentri??e u jednoj eri i kada ro??eni pobednici po??nu da guraju jedan drugog ka nat??ove??anskim podvizima, neminovno je da postoji i druga strana. Gubitni??ka.\r\n\r\n(1,25) N. ??OKOVI?? - M. BERETINI (4,00)\r\n\r\nDok su Novak, Rafa i Rod??er pisali istoriji u mitskim me??evima i podvizima, ostatak svetskog tenisa im je zavr??io pod nogama. Generacije i generacije su proklinjale sudbinu ??to su ro??ene u pogre??no vreme. Samo da su se pojavili 15 godina ranije ili kasnije, imali bi realne ??anse da karijere zavr??e sa grend slem titulama, prvim mesto na ATP listi i ko zna kakvim jo?? dostignu??ima...\r\n\r\nVe?? sada kao valjan argument stoji ??injenica da je Rod??er Federer prve grend slemove osvojio u eri koju brojni teniski stru??njaci nazivaju ???Weak one??? iliti ???Slaba???. Rivali su mu bili lepu??kasti Mark Filipusis, kontroverzni Marat Safin, tada ve?? matori Andre Agasi i Karlos Moja, Endi Rodik koji je bio neupotrebljiv na ??ljaci, Huan Karlos Ferero koji je bio neupotrebljiv van ??ljake, Lejton Hjuit, pa solidni ???specijalci??? Gaston Gaudio, Giljermo Korija, Joakim Johanson, Tim Henman, Guga Kerten...\r\n\r\nPotom je do??ao Nadal i prvo uspostavio strahovladu na Rolan Garosu, a dok je Novak ??okovi?? osvojio prvi grend slem, Federer je ve?? imao 12 grend slem titula. I krenula je zlatna era.\r\n\r\nOd 4. jula 2011. ne postoji Velika trojka, ve?? samo surova decenijska dominacija Novaka ??okovi??a\r\nOd 4. jula 2011. ne postoji Velika trojka, ve?? samo surova decenijska dominacija Novaka ??okovi??a\r\n\r\n\r\nMnogi odli??ni igra??i poput Davida Ferera, Nikolaja Davidenka, Davida Nalbandijana, Fernanda Gonzalesa i drugih ro??enih krajem 70-ih i po??etkom 80-ih su ostali u senci velike trojke... I kada su igrali fenomenalan tenis i pobe??ivali po jednog ili dvojicu, nisu mogli tre??eg. Nikada nisu osvojili makar jedan od ??etiri najve??a turnira.\r\n\r\nIzuzetak je bio Sten Vavrinka koji je kasno eksplodirao gotovo niotkuda i uspeo da re??ira nekoliko malih ??uda. Napravio je karijeru iznad svih o??ekivanja i osvojio tri grend slem titule. Uvek je bio tu da iskoristi rupe koje bi nastale povredama velike trojke, ali je umeo da im zapr??i ??orbu i kada su bili spremni i zdravi. Pobe??ivao ih je u bitnim grend slem me??evima i sve tri titule osvojio na razli??itim podlogama ??to je uspeh vredan ogromnog po??tovanja. ??ak i takav Vavrinka na kraju ima pora??avaju??i skor sa velikom trojkom: 12 pobeda i 59 poraza. I nikad se nije popeo vi??e od tre??eg mesta na svetskoj rang listi.\r\n\r\nIgra?? koji ima isti broj grend slemova u eri velike trojke kao Vavrinka, a zaslu??io je mo??da i jo?? koji je Endi Mari. ??ak je jedno vreme bio ??lan ???velike ??etvorke??? sa Novakom, Rafom i Rod??erom. Osvojio je dva Vimbldona, jedan US Open, dve zlatne medalje na Olimpijskim igrama, Dejvis kup, brojne masterse, ATP kup, postao svetski broj jedan... Zaista je u jednom trenutku bio ravnopravan rival velikoj trojci, ali su ga problemi sa povredama izbacili iz te trke. Ko zna ??ta bi bilo da je izdr??ao. Ali to famozni triling i ??ini velikim. Njima ni povrede nisu mogle ni??ta.\r\n\r\nBio je tu jo?? jedan kojeg bi bio greh ne pomenuti. Huan Martin Del Porto. U mnogo ??emu je mogao da im parira, a nekada je imao ne??to i ??to oni nisu. Div iz Tandila je bio paklen igra?? kada je bio zdrav. Na??alost, to je bilo retko. Povrede su ugu??ile potencijalno veliku karijeru. Ali kao satisfakcija ostaje osvojen US Open 2009. godine. Od Rolan Garosa 2005. do US Opena 2012. godine, velika trojka je osvojila 26 od 27 grend slem tunira. Taj jedan je bio Delpovo delo...\r\n\r\nSvi ostali teniseri u prethodnih 15-ak godina, pripadaju groblju sru??enih snova i pojedenih talenata. Trudili su se, poku??avali, dali sve od sebe, ali su nai??li na nadljude... Mnogi su izgubili, ali su najvi??e dobili navija??i. Ve?? skoro dve decenije prisustvuju jednoj od najzanimljivijih trka u istoriji sporta. ??istoj esenciji sporta. Najboljim me??evima koje je tenis ponudio. Danas ispodprose??ni ??enski tenis je najbolji dokaz koliko treba ceniti i u??ivati u onome ??to nudi mu??ki. Pitanje je kada ??e i da li ??e u narednih 100 godina ovo da se ponovi...\r\n\r\nKada se ovo zavr??i jednog dana, ve??ina ??e ??aliti ??to njih trojice vi??e nema, mnogo vi??e no ??to ??e se se??ati onih koji su mogli da naprave ne??to vi??e u karijerama. Mi smo se dotakli karijera nekih koji su makar igrali poluinala ili finala grend slemova ili bili u Top 10.\r\n\r\n', '2021-07-10 13:10:04', 1, 3, 0, NULL, 0, 66),
(68, 'Rafael Nadal doneo odluku da se krajem meseca vrati na teren', '??panac ??e prvi put u karijeri igrati na ATP 500 turniru u Va??ingtonu\r\n\r\nRafael Nadal najavio je da ??e se na teren vratiti krajem jula. Naime, ??panac je potvrdio premijerno igranje u Va??ingtonu na turniru iz serije 500 koji ??e biti od 31. jula i 8 avgusta.\r\n\r\nNadal je odmah posle eliminacije na Rolan Garosu saop??tio da ??e propustiti Vimbldon i Olimpijske igre, pa bi igranje u glavnom gradu SAD trebalo da mu predstavlja pripreme za US Open (30. avgust - 12. septembar).\r\n\r\nNadal, kao ni Novak ??okovi?? nikada nije igrao na ovom turniru, dok je tre??i ??lan \"velike trojke\" Rod??er Federer samo jednom, i to na po??etku karijere, 1999. godine, pojavio u Va??ingtonu kada je izgubio u prvom kolu od kvalifikanta Bjorna Faua.\r\n\r\nPored Nadala u??e????e u Va??ingtonu potvrdili su Feliks O??ije Ajasim, Aleks de Minor, Grigor Dimitrov, Miomir Kecmanovi??, Milo?? Raoni??...\r\n\r\n??panac je u 2021. godini igrao na ??est turnira, od kojih je ??ak pet na ??ljaci. Osvojio je pehar u Barseloni (??ljaka) koji je podigao posle trijumfa nad Stefanosom Cicipasom (6:4, 6:7, 7:5) i masters u Rimu (??ljaka) gde je u finalu pobedio ??okovi??a (7:5, 1:6, 6:3).\r\n\r\nNa Australijan openu (tvrda podloga) izgubio je u ??etvrtfinalu od Cicipasa (6:3, 6:2, 6:7, 4:6, 5:7), a na Rolan Garosu (??ljaka) u polufinalu od ??okovi??a (6:3, 3:6, 6:7, 2:6). U ??etvrtfinalu mastersa u Monte Karlu (??ljaka) eliminisao ga je Andrej Rubljov (6:2, 4:6, 6:2), a Aleksandar Zverev je bio bolji od Nadala na ??ljaci u ??etvrtfinalu mastersa u Madridu (6:4, 6:4).', '2021-07-10 13:10:44', 1, 3, 0, NULL, 0, 66),
(69, 'Novaku sve otvoreno, Hurka?? izbacio Federera!', 'Veliko iznena??enje u ??etvrtfinalu Vimbldona\r\n\r\nFenomenalni poljski teniser Hubert Hurka?? nastavio je seriju iznena??enja na ovogodi??njem Vimbldonu, po??to je posle eliminacije Danila Medvedeva izbacio i legendarnog Rod??era Federera. Poljak je slavio u tri seta 6:3, 7:6(4), 6:0, a me?? je trajao 111 minuta.\r\n\r\nPoljak je odu??evio na??inom na koji je zgromio Federera, otpor mu je slomio u taj-brejku drugog seta, a onda ga sa nulom po??istio u tre??em setu, za svega 29 minuta igre. Hurka?? ??e u polufinalu igrati sa boljim iz me??a Beretini - O??e Alijasim.\r\n\r\nHurka?? (24) je dominirao u svim segmentima igre, imao je duplo vi??e asova (10-5) od protivnika, vi??e vinera i daleko manje neiznu??enih gre??aka (12-31). Bolje se kretao, bio agresivniji i delovao sve??ije od protivnika. Federer je od po??etka bio u kontraritmu, iz kojeg nije uspeo da se izvu??e do kraja me??a.\r\n\r\nPoljaku je u prvom setu bila dovoljna jedna brejk lopta da re??i set u svoju korist. Nju je osvojio pri rezultatu 3:2, a onda sigurnim servisom obezbedio dragoceno vo??stvo. Federer je u drugom setu propustio veliku ??ansu. Odmah je napravio brejk, vodio sa 3:0 i 4:1, ali se Hurka?? vratio na fenomenalan na??in. Pri rezultatu 2:4 iskoristio je drugu brejk loptu, smanjio rezultat i potom izjedna??io. Oti??lo se u taj-brejk gde je Federer bio ispod svog nivoa.\r\n\r\n??vajcarac kao da je ve?? tada znao da je povratak u me?? nemogu??a misija, pa je potpuno bezdu??no u??ao u tre??i set. To je nadahnuti Poljak surovo kaznio i ekspresno do??ao do najve??e pobede u karijeri.\r\n\r\n', '2021-07-10 13:11:17', 1, 3, 0, NULL, 0, 66),
(70, 'E??li Barti prva finalistkinja Vimbldona', 'Prva teniserka sveta u polufinalu grend slema u Londonu bolja od An??elik Kerber posle dva seta\r\n\r\nPrva finalistkinja Vimbldona je E??li Barti. Australijska teniserka je u polufinalu travnatog grend slema bila bolja od An??elik Kerber iz Nema??ke u dva seta - 6:3, 7:6 (7:3).\r\n\r\nPrvoj teniserki sveta bilo je potrebno sat vremena i 30 minuta da pre??e jo?? jednu prepreku na putu ka velikom finalu. Barti se u prvom gemu suo??ila sa dve brejk lopte, koje je uspela da spasi i povede 1:0. U narednom gemu je ona napravila pritisak na servis protivnice i stigla do prilike za brejk, koju je za razliku od Kerber odmah iskoristila. U slede??em gemu ga je potvrdila i stigla do prednosti od 3:0. Do kraja seta su teniserke ??uvale svoj servis, pa se razlika na semaforu na kraju ovog perioda nije promenila. Barti ga je dobila rezultatom 6:3.\r\n\r\n', '2021-07-10 13:11:46', 1, 3, 0, '2021-07-10 16:57:18', 1, 67),
(71, 'Terzi??: Spisak za Tokio dan pred polazak', 'Odbojka??ice u ??etvrtak polaze na Olimpijske igre\r\n\r\nSelektor ??enske odbojka??ke reprezentacije Srbije Zoran Terzi?? otkrio je da ??e kona??an spisak putnica na Olimpijske igre objaviti dan pred polazak za Japan, 14. jula.\r\n\r\nStrateg srpskog tima, koji ??e na Igrama u Tokiju braniti srebro iz Rija, a napasti zlato, re??io je da za svaki slu??aj odlo??i objavljivanje sastava reprezentacije do poslednjeg dana.\r\n\r\n???Sastav tima bi??e poznat 14. jula. Generalno, 15-ak igra??a se zna, ali ne bih da govorim ta??no spisak. Na kraju krajeva, i ja ga ne znam ta??no. Ne daj Bo??e, uvek mo??e da bude nekih problema, da moraju neke izmene da se prave. Sa??eka??emo 14. jul\", objasnio je Terzi??.\r\n\r\nSrbija ??e put Tokija krenuti u dobrom raspolo??enju, po??to je dobila sve tri kontrolne utakmice protiv Italije koje su se igrale u Ubu i Beogradu.\r\n\r\n', '2021-07-10 13:12:29', 1, 4, 0, NULL, 0, 19),
(72, 'Serija promocija na Novom Beogradu, ozvani??en i Strahinja Ra??ovi??', 'Veliko poja??anje za sastav Vladimira Vujasinovi??a\r\n\r\nNastavlja se projekat stvaranja pravog drim-tima na Novom Beogradu. Organizator finalnog turnira Lige ??ampiona u vaterpolu seriju promocija velikih poja??anja nastavio je Strahinjom Ra??ovi??em, koji je i zvani??no predstavljan kao novi igra?? ekipe legendarnog Vladimira Vujasinovi??a.\r\n\r\nRa??ovi?? u redove Novobeogra??ana sti??e posle ??ampionske sezone u Radni??kom iz Kragujevca, gde je postao vladar regionalnog i doma??eg prvenstva, a sada je deo jo?? ambicioznijeg projekta koji za cilj ima osvajanje najva??nijeg trofeja u klupskom vaterpolu.\r\n\r\nStrahinja Ra??ovi?? dobro zna kakav je ose??aj biti prvak Evrope, po??to je to u??inio sa Crvenom zvezdom 2013. godine. Sa crveno-belima je osvojio dve duple krune i Superkup Evrope, a potom je uzeo Kup kralja i dva Superkupa ??panije sa Barselonetom. Pre Radni??kog nastupao je i za Eger.\r\n\r\n\"Drago mi je ??to ??u ponovo igrati sa bratom Viktorom u istom klubu. Poku??a??emo udru??enim snagama sa Novim Beogradom da napadnemo krov Evrope\", rekao je Strahinja Ra??ovi?? za Mozzart Sport.\r\n\r\nPro??le sezone je bio najbolji igra?? Kragujev??ana, kojima ??e ove sezone biti te??ko da se nose sa ambicioznim protivnicima kao ??to su Novi Beograd i Partizan.\r\n\r\n', '2021-07-10 13:13:18', 1, 4, 0, NULL, 0, 18),
(73, 'Uspe??na generalna proba pred Tokio: Odbojka??ice Srbije tre??i put bolje od Italijanki', 'Izabranice Zorana Terzi??a u odli??nom raspolo??enju putuju na Olimpijske igre\r\n\r\nTri prijateljska me??a su odigrale selekcije Srbije i Italije u sklopu priprema za Olimpijske igre u Tokiju i sva tri su zavr??ena na identi??an na??in ??? pobedom odbojka??ica Srbije.\r\n\r\nRazlika izme??u Srbije i Italije je ta??no jedan set. Tri puta su odbojka??ice Srbije slavile u pet setova, a generalnoj probi pred put u Tokio prisustvovalo je oko 1.000 gledalaca u dvorani Sportskog centra ???Vo??dovac???. Plava ??eta je slavila sa 3:2, po setovima 25:18, 23:25, 24:26, 25:22, 16:14.\r\n\r\nU centru pa??nje bile su Tijana Bo??kovi?? i Paula Egonu. Briljirale su Bo??kovi?? i Egonu, a italijanki je pripao ???mali rat???, ali ne i bitka. Osvojila je Tijana Bo??kovi?? 29 poena, dok je Paula Egonu gurala Italijanke, ali 31 poen nije bio dovoljan da se nadigraju devojke Zorana Terzi??a.\r\n\r\n', '2021-07-10 13:13:45', 1, 4, 0, NULL, 0, 19),
(74, 'Selektori Hrvatske, Crne Gore, ??panije i Ma??arske saop??tili spisak putnika za Tokio', '??ekaju se Italijani\r\n\r\nOdredio je Dejan Savi?? vaterpoliste koji ??e predstavljati Srbiju na Olimpijskim igrama u Tokiju, a za svaki slu??aj ??e na zavr??ne pripreme povesti i rezervne igra??e. Delfini ??e u Japanu braniti zlato osvojeno u Riju pre pet godina, a kako se Igre bli??e, sve je manje nepoznanica.\r\n\r\nSa listama igra??a iza??li su selektori Hrvatske, Crne Gore, ??panije, Ma??arske, Gr??ke, Sjedinjenih Ameri??kih Dr??ava i Australije. Sti??e se utisak da ??e Srbiji najve??i konkurent za zlato biti reprezentacija Hrvatske, ba?? kao i u Riju. Ali, tek treba Italijani da objave kona??an spisak.\r\n\r\nSrbija je uo??i puta u Tokio osvojila turnir, koji je organizovala u Beogradu. Pored na??e selekcije su u??estvovale ??panija, Francuska i B selekcija Srbije. U odli??nom raspolo??enju na igre putuju i Ajkule. Crna Gora je u Tbilisiju osvojila Svetsku ligu savladav??i Ameriku u finalu.\r\n\r\nSpisak Srbije: Branislav Mitrovi??, Gojko Pijetlovi??, Filip Filipovi??, Du??an Mandi??, Nikola Dedovi??, Milan Aleksi??, Sava Ran??elovi??, Nikola Jak??i??, Andrija Prlainovi??, Stefan Mitrovi??, Strahinja Ra??ovi??, Du??ko Pijetlovi?? i ??or??e Lazi??, kao i Radomir Dra??ovi??, odnosno ??or??e Vu??ini??, koji u Ka??ivazaki (baza za zavr??ne pripreme) putuju kao rezervne opcije.\r\n\r\nSelektor: Dejan Savi??.\r\n\r\nSpisak Hrvatske: Marko Bija??, Ivan Marceli??, Luka Lon??ar, Josip Vrli??, Andro Bu??lje, Marko Macan, Paulo Obradovi??, Lovre Milo??, Maro Jokovi??, Havijer Garsija, Ante Vuki??evi??, Luka Buki?? i Loren Fatovi??.\r\n\r\nSelektor: Ivica Tucak.\r\n\r\nSpisak Crne Gore: Slaven Kandi??, Dra??ko Brguljan, Miroslav Perkovi??, Marko Petkovi??, Uro?? ??u??kovi??, Vlado Popadi??, Stefan Vidovi??, Aleksa Ukropina, Aleksandar Ivovi??, Vladan Spai??, Du??an Matkovi??, Du??an Bani??evi?? i Petar Te??anovi??.\r\n\r\nSelektor: Vladimir Gojkovi??.\r\n\r\nSpisak Ma??arske: Viktor Na??i, Soma Vogel, Danijel An??ijal, Bala?? Erdelji, Norbert Hosnijanski, Bala?? Harai, Silard Jansik, Kristijan Manherc, Tama?? Mezei, Matja?? Pastor, Dene?? Varga, Marton Vamo?? i Gergo Zalanki.\r\n\r\nSelektor: Tama?? Marc.\r\n\r\nSpisak ??panije: Danijel Lopez Pinedo, Unaj Agire, Alehandro Bustos, Migel de Toro, Martin Famera, Fransisko Fernandez, Alvaro Granados, Mark Larumbe, Blai Malarah, Alberto Munariz, Felipe Perone, Bernat Sanauha i Ro??er Taulj.\r\n\r\nSelektor: David Martin.\r\n\r\nSpisak Gr??ke: Manolis Zerdevas, Kostas Galanidis, Konstantinos Genidunijas, Dimitris Skumpakis, Marios Kapocis, Janis Funtulis, Aleksandros Papanastasiju, Jorgos Dervidis, Stelios Argiropulos, Konstantinos Murikis, Hristoldulos Kolomvos, Konstantinos Gkiuvecis i Angelos Vlahopulos.\r\n\r\nSelektor Gr??ke: Todoris Vlahos.\r\n\r\nSpisak SAD: Dru Holand, Aleks Volf, D??oni Huper, Marko Vavi??, Aleks Obert, Hanes Dube, Luka Kupido, Ben Halok, Ben Stevenson, Aleks Boven, Dilan Vudhed, D??esi Smit i Maks Irving.\r\n\r\nSelektor: Dejan Udovi??i??.\r\n\r\nSpisak Australije: D??oel Denerli, Entoni Hrisantos, Ri??i Kembel, Lahlan Edvards, Blejk Edvards, Endrju Ford, D??ord?? Ford, Ris Houden, Nejtan Pauer, Timoti Put, Ejdan Rou??, Goran Toma??evi?? i Aron Janger.\r\n\r\nSelektor: Elvis Fatovi??.\r\n\r\n', '2021-07-10 13:14:15', 1, 4, 0, NULL, 0, 18),
(75, 'Selektori Hrvatske, Crne Gore, ??panije i Ma??arske saop??tili spisak putnika za Tokio', '??ekaju se Italijani\r\n\r\nOdredio je Dejan Savi?? vaterpoliste koji ??e predstavljati Srbiju na Olimpijskim igrama u Tokiju, a za svaki slu??aj ??e na zavr??ne pripreme povesti i rezervne igra??e. Delfini ??e u Japanu braniti zlato osvojeno u Riju pre pet godina, a kako se Igre bli??e, sve je manje nepoznanica.\r\n\r\nSa listama igra??a iza??li su selektori Hrvatske, Crne Gore, ??panije, Ma??arske, Gr??ke, Sjedinjenih Ameri??kih Dr??ava i Australije. Sti??e se utisak da ??e Srbiji najve??i konkurent za zlato biti reprezentacija Hrvatske, ba?? kao i u Riju. Ali, tek treba Italijani da objave kona??an spisak.\r\n\r\nSrbija je uo??i puta u Tokio osvojila turnir, koji je organizovala u Beogradu. Pored na??e selekcije su u??estvovale ??panija, Francuska i B selekcija Srbije. U odli??nom raspolo??enju na igre putuju i Ajkule. Crna Gora je u Tbilisiju osvojila Svetsku ligu savladav??i Ameriku u finalu.\r\n\r\nSpisak Srbije: Branislav Mitrovi??, Gojko Pijetlovi??, Filip Filipovi??, Du??an Mandi??, Nikola Dedovi??, Milan Aleksi??, Sava Ran??elovi??, Nikola Jak??i??, Andrija Prlainovi??, Stefan Mitrovi??, Strahinja Ra??ovi??, Du??ko Pijetlovi?? i ??or??e Lazi??, kao i Radomir Dra??ovi??, odnosno ??or??e Vu??ini??, koji u Ka??ivazaki (baza za zavr??ne pripreme) putuju kao rezervne opcije.\r\n\r\nSelektor: Dejan Savi??.\r\n\r\nSpisak Hrvatske: Marko Bija??, Ivan Marceli??, Luka Lon??ar, Josip Vrli??, Andro Bu??lje, Marko Macan, Paulo Obradovi??, Lovre Milo??, Maro Jokovi??, Havijer Garsija, Ante Vuki??evi??, Luka Buki?? i Loren Fatovi??.\r\n\r\nSelektor: Ivica Tucak.\r\n\r\nSpisak Crne Gore: Slaven Kandi??, Dra??ko Brguljan, Miroslav Perkovi??, Marko Petkovi??, Uro?? ??u??kovi??, Vlado Popadi??, Stefan Vidovi??, Aleksa Ukropina, Aleksandar Ivovi??, Vladan Spai??, Du??an Matkovi??, Du??an Bani??evi?? i Petar Te??anovi??.\r\n\r\nSelektor: Vladimir Gojkovi??.\r\n\r\nSpisak Ma??arske: Viktor Na??i, Soma Vogel, Danijel An??ijal, Bala?? Erdelji, Norbert Hosnijanski, Bala?? Harai, Silard Jansik, Kristijan Manherc, Tama?? Mezei, Matja?? Pastor, Dene?? Varga, Marton Vamo?? i Gergo Zalanki.\r\n\r\nSelektor: Tama?? Marc.\r\n\r\nSpisak ??panije: Danijel Lopez Pinedo, Unaj Agire, Alehandro Bustos, Migel de Toro, Martin Famera, Fransisko Fernandez, Alvaro Granados, Mark Larumbe, Blai Malarah, Alberto Munariz, Felipe Perone, Bernat Sanauha i Ro??er Taulj.\r\n\r\nSelektor: David Martin.\r\n\r\nSpisak Gr??ke: Manolis Zerdevas, Kostas Galanidis, Konstantinos Genidunijas, Dimitris Skumpakis, Marios Kapocis, Janis Funtulis, Aleksandros Papanastasiju, Jorgos Dervidis, Stelios Argiropulos, Konstantinos Murikis, Hristoldulos Kolomvos, Konstantinos Gkiuvecis i Angelos Vlahopulos.\r\n\r\nSelektor Gr??ke: Todoris Vlahos.\r\n\r\nSpisak SAD: Dru Holand, Aleks Volf, D??oni Huper, Marko Vavi??, Aleks Obert, Hanes Dube, Luka Kupido, Ben Halok, Ben Stevenson, Aleks Boven, Dilan Vudhed, D??esi Smit i Maks Irving.\r\n\r\nSelektor: Dejan Udovi??i??.\r\n\r\nSpisak Australije: D??oel Denerli, Entoni Hrisantos, Ri??i Kembel, Lahlan Edvards, Blejk Edvards, Endrju Ford, D??ord?? Ford, Ris Houden, Nejtan Pauer, Timoti Put, Ejdan Rou??, Goran Toma??evi?? i Aron Janger.\r\n\r\nSelektor: Elvis Fatovi??.\r\n\r\n', '2021-07-10 13:15:46', 1, 4, 0, '2021-07-11 08:00:25', 1, 18),
(76, 'Dijamantska liga: Ivana ??panovi?? druga u Oslu', 'Dobro izdanje ohrabruje\r\n\r\nIvana ??panovi??, najbolja srpska atleti??arka, osvojila je drugo mesto na mitingu Dijamantske lige u Oslu. Reprezentativka Srbije nije uspela da ponovi rezultat iz Toskane, gde je stigla do 13. trijumfa u Dijamantskoj ligi, ali raduje to ??to je povreda stopala definitivno pro??lost.\r\n\r\nDu??ina od 6,66 metara donela je Ivani ??panovi?? drugo mesto. Najbolja na mitingu u Oslu bila je Nemica Malaiha Mikambo, koja je sko??ila 6,83 metra. Tre??eplasirana Nastasija, Miron??uk-Ivanova je dosegla du??inu od 6,58 metara u poslednjoj seriji. Ni njoj, kao ni Nemici to nije bio najbolji skok dana, ali svi su se odavno navikli na ??udnovati sistem bodovanja u Dijamantskoj ligi.\r\n\r\nPeta stanica Dijamantske lige je Stokholm, a Ivana ??panovi?? ??e 4. jula skakati u dalj za nove bodove.\r\n\r\n', '2021-07-10 13:16:04', 1, 4, 0, '2021-07-10 16:56:03', 1, 70),
(77, 'Gde sprintom na Kevendi??a? Britancu tre??a etapna pobeda i monopol na zelenu majicu (VIDEO)', 'Poga??ar i nakon desete etape vode??i u generalnom plasmanu\r\n\r\nKakva dominacija jednog od najboljih sprintera 21. veka. Mark Kevendi?? je trijumfovao na 10. etapi Tur de Fransa jer je deonicu dugu 190 kilometara od Albervila do Valensa odvezao za ??etiri sata, 14 minuta i sedam sekundi. Kada na dnevni red do??e sprint zavr??nica, nema mu ravnog ??to je pokazao i danas okitiv??i se tre??om etapnom pobedom na ovogodi??njem Turu.\r\n\r\nNeprikosnoveni je vlasnik zelene majice namenjene najboljem sprinteru - sakupio je 218 poena i nema voza??a koji mu di??e za vratom. Najbli??i mu je Australijanac Majkl Metjus sa 159 poena.\r\n\r\n', '2021-07-10 13:16:32', 1, 4, 0, '2022-02-08 12:48:01', 43, 68),
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
