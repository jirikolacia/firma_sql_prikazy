-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Počítač: 127.0.0.1
-- Vytvořeno: Úte 29. srp 2023, 22:11
-- Verze serveru: 10.4.27-MariaDB
-- Verze PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáze: `firma`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `alergeny`
--

CREATE TABLE `alergeny` (
  `id` int(11) NOT NULL,
  `nazev` varchar(60) NOT NULL,
  `popis` varchar(90) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Vypisuji data pro tabulku `alergeny`
--

INSERT INTO `alergeny` (`id`, `nazev`, `popis`) VALUES
(1, ' Lepek ', ' pšenice, žito, ječmen, oves, špalda, kamut nebo jejich odrůdy'),
(2, 'Korýši', 'NULL'),
(3, 'Vejce', 'NULL'),
(4, 'Arašídy', 'podzemnice olejná'),
(5, 'Sója', 'sójové boby'),
(6, 'Mléko', 'NULL'),
(7, 'Skořápkové plody', 'mandle, lískové ořechy, vlašské ořechy, kešu ořechy, pekanové ořechy, para ořechy, pistáci'),
(8, 'Celer', 'NULL'),
(9, 'Hořčice', 'NULL'),
(10, 'Seznam', 'sezamová semena'),
(11, 'Oxid siřičitý a siřičitany', ' E220, E221, E222, E223, E224, E226, E227, E228'),
(12, 'Vlčí bob', 'lupina'),
(13, 'Měkkýši', 'NULL');

-- --------------------------------------------------------

--
-- Struktura tabulky `cenik`
--

CREATE TABLE `cenik` (
  `id` int(11) NOT NULL,
  `cena` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Vypisuji data pro tabulku `cenik`
--

INSERT INTO `cenik` (`id`, `cena`) VALUES
(1, '85'),
(2, '103'),
(3, '115'),
(4, '125'),
(5, '150');

-- --------------------------------------------------------

--
-- Struktura tabulky `firma`
--

CREATE TABLE `firma` (
  `id` int(11) NOT NULL,
  `nazev` varchar(60) NOT NULL,
  `popisek` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Vypisuji data pro tabulku `firma`
--

INSERT INTO `firma` (`id`, `nazev`, `popisek`) VALUES
(1, 'Jaromírova sirkárna', 'My mu to říkali, ale on nás stejně neposlechl'),
(2, 'Dolňácký med', 'Po všeckém hovno, enem po včelách med.');

-- --------------------------------------------------------

--
-- Struktura tabulky `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `obed` int(11) NOT NULL,
  `polevka` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `objednavky`
--

CREATE TABLE `objednavky` (
  `id` int(11) NOT NULL,
  `zamestnanec` int(11) NOT NULL,
  `jidlo` int(11) NOT NULL,
  `polevka` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `pozice`
--

CREATE TABLE `pozice` (
  `id` int(11) NOT NULL,
  `nazev_pozice` varchar(60) NOT NULL,
  `popis_pozice` varchar(60) NOT NULL,
  `bozp_faktor` varchar(60) NOT NULL,
  `platid` int(11) DEFAULT NULL,
  `firma` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Vypisuji data pro tabulku `pozice`
--

INSERT INTO `pozice` (`id`, `nazev_pozice`, `popis_pozice`, `bozp_faktor`, `platid`, `firma`) VALUES
(1, 'Ředitel', 'Ředitel pobočky', '1', 3, '1,2'),
(2, 'Náměstek', 'Náměstek ředitele', '1', 3, '1,2'),
(3, 'Účetní mzdy', 'Účetní pro mzdový úsek', '1', 14, '1,2'),
(4, 'Fakturantka', 'Účetní pro fakturace', '1', 14, '1,2'),
(5, 'Účetní hlavní', 'Hlavní účetní', '1', 10, '1,2'),
(6, 'IT manažer', 'Manažer pro IT úsek', '1', 9, '1,2'),
(7, 'IT specialista', 'Specialista IT techniky', '1', 11, '1,2'),
(8, 'BOZP specialista', 'Specialista bezpečnosti práce', '1', 14, '1,2'),
(9, 'Manažer kvality', 'manažer pro QA úsek', '1', 10, '1,2'),
(10, 'Kvalitář', 'Pracovník kvality', '1', 2, '1,2'),
(11, 'Manažer logistiky', 'Manažer pro logistický úsek', '1', 10, '1,2'),
(12, 'Nákupčí', 'Pracovník nákupu', '1', 11, '1,2'),
(13, 'Expedient', 'Pracovník expedice', '1', 11, '1,2'),
(14, 'Příjemce', 'Pracovník příjmu', '2', 6, '1,2'),
(15, 'Skladník', 'Pracovník skladu', '2', 6, '1,2'),
(16, 'Řidič skladu', 'Řidič pro skladová vozidla', '2', 16, '1,2'),
(17, 'Kuchař', 'Pracovník jídelny', '1', 4, '1'),
(18, 'Uklízeč', 'Pracovník úklidu', '1', 5, '1'),
(19, 'Šéfkuchař', 'Šéfkuchař jídelny', '1', 4, '1'),
(20, 'Údržbář', 'Údržba objektu', '1', 15, '1,2'),
(21, 'Mistr výroba', 'Mistr úseku výroby', '1', 14, '1,2'),
(22, 'Řidič MKD', 'Řidič mezinárodní kamionové dopravy', '2', 13, '1,2'),
(23, 'Řidič NV', 'Řidič nákladních vozidel', '2', 10, '1,2'),
(24, 'Automechanik', 'Technik kolových vozidel', '2', 15, '1,2'),
(25, 'Opravář', 'Opravář všeho', '2', 15, '1'),
(26, 'Mistr údržby', 'Mistr úseku údržby', '1', 13, '1,2'),
(27, 'Mistr oprav', 'Mistr úseku oprav', '1', 7, '1'),
(28, 'Svářeč', 'Svářeč - TIG', '3', 2, '2'),
(29, 'Válcovník', 'Obsluha válcovny', '3', 16, '1'),
(30, 'Elektrikář', 'Elektrikář - slaboproud', '2', 10, '1'),
(31, 'Soustružník', 'Soustružník', '3', 7, '1'),
(32, 'Přípravář', 'Přípravář materiálu', '2', 1, '1,2'),
(33, 'Metrolog', 'Pracovník přeměřování', '1', 2, '2'),
(34, 'Mistr metrolog', 'Mistr úseku metrologů', '1', 15, '2'),
(35, 'Včelař', 'Včelař', '1', 12, '2'),
(36, 'Vrátný', 'Pracovník vrátnice', '1', 5, '1,2'),
(37, 'Ostraha', 'Pracovník ostrahy', '1', 5, '1,2'),
(38, 'Administrativní pracovník', 'Pracovník administrativy', '1', 14, '1,2'),
(39, 'Elektrikář', 'Elektrikář - silnoproud', '3', 13, '1'),
(40, 'Mistr elektrikář', 'Mistr úseku elektrikářů', '3', 9, '1'),
(41, 'Obsluha nádrže', 'Obsluha vodní nádrže', '2', 8, '1'),
(42, 'Mistr vodotechnik', 'Mistr úseku vodní nádrže', '2', 12, '1'),
(43, 'Krmič kaprů', 'Vrchní výkonný krmič kaprů', '1', 12, '1'),
(44, 'Obsluha CNC', 'Obsluha CNC strojů', '2', 10, '2'),
(45, 'Programátor PLC', 'Programátor PLC', '1', 9, '2'),
(46, 'Mistr programátor PLC', 'Mistr úseku programátorů PLC', '1', 3, '2'),
(47, 'Skladník pneu', 'Pracovník skladu pneumatik', '2', 6, '2'),
(48, 'Pracovník pneu', 'Pracovník pneumatik', '2', 6, '2'),
(49, 'Obsluha v. souprav', 'Obsluha vlakové točny', '2', 8, '2'),
(50, 'Obsluha v. střediska', 'Obsluha vlakového střediska', '2', 8, '2'),
(51, 'Manažer dopravy', 'Manažer dopravy', '1', 13, '1,2');

-- --------------------------------------------------------

--
-- Struktura tabulky `pracoviste`
--

CREATE TABLE `pracoviste` (
  `id` int(11) NOT NULL,
  `fid` int(11) DEFAULT NULL,
  `bid` int(11) DEFAULT NULL,
  `nazev_kancelare` varchar(60) NOT NULL,
  `popis` varchar(120) NOT NULL,
  `offcnr` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Vypisuji data pro tabulku `pracoviste`
--

INSERT INTO `pracoviste` (`id`, `fid`, `bid`, `nazev_kancelare`, `popis`, `offcnr`) VALUES
(1, 1, 1, 'Kancelář ředitele', 'Ředitel', 15),
(2, 1, 1, 'Kancelář náměstka', 'Náměstek', 14),
(3, 1, 1, 'Kancelář finance', 'Finance, mzdové a účetnictví', 13),
(4, 1, 1, 'Kancelář IT', 'IT', 12),
(5, 1, 1, 'Kancelář BOZP', 'Bezpečnost práce', 11),
(6, 1, 1, 'Kancelář kvality', 'Kvalita', 16),
(7, 1, 1, 'Kancelář logistiky', 'Logistika, příjem, expedice', 17),
(8, 1, 2, 'Hlavní hala - soustruhy', 'Hala soustruhů - třískových obráběcích strojů.', 2),
(9, 1, 2, 'Přípravna', 'Místo určené k přípravě obrobků', 1),
(10, 1, 2, 'Sklad', 'Sklad materiálu', 3),
(11, 1, 2, 'Expedice', 'Expediční pracoviště', 4),
(12, 1, 3, 'Jídelna', 'Jídelna pro zaměstnance', 1),
(13, 1, 3, 'Kuchyně', 'Kuchyně včetně mrazáků a salátového baru', 2),
(14, 1, 3, 'Úklidová místnost', 'Místnost pro pracovníky úklidu', 3),
(15, 1, 3, 'Technické zázemí', 'Technické zázemí jídelny - chemikálie pro mytí, polotovary, atd.', 4),
(16, 1, 4, 'Hlavní hala - válcovny', 'Hala válcoven plechů.', 5),
(17, 1, 4, 'Přípravna', 'Místo určené k přípravě obrobků', 1),
(18, 1, 4, 'Sklad', 'Sklad materiálu', 3),
(19, 1, 4, 'Expedice', 'Expediční pracoviště', 2),
(20, 1, 4, 'Kancelář mistra', 'Kancelář mistra válcovny', 4),
(21, 1, 5, 'Garáž 1 - kamiony', 'Garáž pro MKD', 3),
(22, 1, 5, 'Garáž 2 - osobní automobily', 'Garáž se služebními vozy', 1),
(23, 1, 5, 'Garáž 3 - dodávky', 'Garáž pro transport po areálu továrny', 2),
(24, 1, 5, 'Opravna', 'Servisní garáž', 4),
(25, 1, 6, 'Dílna', 'Dílny elektrikářů', 1),
(26, 1, 6, 'Učebna', 'Školící místnost', 2),
(27, 1, 7, 'Vrátnice', 'Pracoviště vrátného a ostrahy', 1),
(28, 1, 8, 'Velín', 'Hlavní místnost', 1),
(29, 1, 8, 'Obsluha čerpadel', 'Obsluha čerpadel nádrže', 2),
(30, 1, 8, 'Čistička vody', 'Obsluha ČOVky', 3),
(31, 1, 8, 'Firemní kapři', 'Kapři na vánoce', 4),
(32, 1, 8, 'Opravna', 'Opravna špatných kusů', 5),
(33, 2, 9, 'Kancelář ředitele', 'Ředitel', 11),
(34, 2, 9, 'Kancelář náměstka', 'Náměstek', 4),
(35, 2, 9, 'Kancelář finance', 'Finance, mzdové a účetnictví', 3),
(36, 2, 9, 'Kancelář IT', 'IT', 4),
(37, 2, 9, 'Kancelář BOZP', 'Bezpečnost práce', 6),
(38, 2, 9, 'Kancelář kvality', 'Kvalita', 3),
(39, 2, 9, 'Kancelář logistiky', 'Logistika, příjem, expedice', 2),
(40, 2, 10, 'Hlavní hala - svařovna', 'Svařovna - konstrukce', 3),
(41, 2, 10, 'Přípravna', 'Přípravna konstrukcí', 2),
(42, 2, 10, 'Sklad', 'Sklad konstrukcí - hrubé', 1),
(43, 2, 10, 'Expedice svařených kusů', 'Expedice výsledných svárů', 4),
(44, 2, 11, 'Hlavní hala - CNC', 'Hlavní  hala, neobsahuje CNC stroje', 1),
(45, 2, 11, 'Hala - automaty', 'Hala s CNC stroji', 2),
(46, 2, 11, 'Sklad', 'Sklad obrobků', 3),
(47, 2, 11, 'PLC kancelář', 'Kancelář programátora PLC', 4),
(48, 2, 11, 'Expedice', 'Expedice vyhotovených obrobků', 5),
(49, 2, 12, 'Hlavní hala - metrolog', 'Hlavní hala s metrologickými stroji', 1),
(50, 2, 12, 'Kancelář metrologa', 'Kancelář hlavního metrologa', 2),
(51, 2, 12, 'Dílna údržby', 'Dílna údržbářů strojů', 3),
(52, 2, 12, 'Sklad', 'Sklad materiálu k přeměření', 4),
(53, 2, 12, 'Expedice', 'Expedice změřených obrobků', 5),
(54, 2, 12, 'Přípravna', 'Přípravna obrobků k měření', 6),
(55, 2, 13, 'Garáž 1 - kamiony', 'Garáž pro MKD', 3),
(56, 2, 13, 'Garáž 2 - osobní automobily', 'Garáž se služebními vozy', 1),
(57, 2, 13, 'Garáž 3 - dodávky', 'Garáž pro transport po areálu továrny', 2),
(58, 2, 13, 'Sklad pneumatik', 'Sklad pneumatik vozidel firmy', 4),
(59, 2, 14, 'Úl včelí 1', 'Úl červené barvy', 1),
(60, 2, 14, 'Úl včelí 2', 'Úl modré barvy', 2),
(61, 2, 14, 'Úl včelí 3', 'Úl zelené barvy', 3),
(62, 2, 14, 'Úl včelí 4', 'Úl žluté barvy', 4),
(63, 2, 15, 'Obsluha točny', 'Obsluha vlakové točny na vagóny', 1),
(64, 2, 16, 'Vrátnice', 'Pracoviště vrátného a ostrahy', 1),
(65, 2, 17, 'Kancelář programátorů PLC', 'Kancelář programátorů PLC - mimo dílny', 3),
(66, 2, 17, 'Kancelář obsluhy v. souprav', 'Kancelář obsluhy vlakových souprav točny', 2),
(67, 2, 17, 'Kancelář řidícího střediska', 'Kancelář řídícího střediska vlakových souprav', 1),
(68, 2, 17, 'Kancelář metrologů', 'Kancelář metrologů měřící dílny', 4),
(69, 2, 17, 'Kancelář mistrů - menší', 'Kancelář mistrů, menší prostory', 5),
(70, 2, 17, 'Kancelář mistrů - větší', 'Kancelář mistrů, větší prostory', 6);

-- --------------------------------------------------------

--
-- Struktura tabulky `seznam_budov`
--

CREATE TABLE `seznam_budov` (
  `id` int(11) NOT NULL,
  `budovy` varchar(60) NOT NULL,
  `umisteni` varchar(60) NOT NULL,
  `firmaid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Vypisuji data pro tabulku `seznam_budov`
--

INSERT INTO `seznam_budov` (`id`, `budovy`, `umisteni`, `firmaid`) VALUES
(1, 'Ředitelství', 'Areál A', 1),
(2, 'Dílny soustruhy', 'Areál A', 1),
(3, 'Jídelna', 'Areál A', 1),
(4, 'Dílny válcovny', 'Areál A', 1),
(5, 'Garáž', 'Areál A', 1),
(6, 'Elektrikáři', 'Areál A', 1),
(7, 'Vrátnice', 'Areál A', 1),
(8, 'Vodní nádrž', 'Areál A', 1),
(9, 'Ředitelství', 'Areál B', 2),
(10, 'Svařovna', 'Areál B', 2),
(11, 'Dílna frézy', 'Areál B', 2),
(12, 'Dílna měřění', 'Areál B', 2),
(13, 'Garáž', 'Areál B', 2),
(14, 'Úly', 'Areál B', 2),
(15, 'Točna', 'Areál B', 2),
(16, 'Vrátnice', 'Areál B', 2),
(17, 'Kancl', 'Areál B', 2);

-- --------------------------------------------------------

--
-- Struktura tabulky `seznam_jidel`
--

CREATE TABLE `seznam_jidel` (
  `id` int(11) NOT NULL,
  `nazev` varchar(60) DEFAULT NULL,
  `popis` varchar(255) DEFAULT NULL,
  `cena` int(20) DEFAULT NULL,
  `vaha` int(20) DEFAULT NULL,
  `alergen` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Tabulka sloužící k zobrazení podrobností  ke všem jídlům';

--
-- Vypisuji data pro tabulku `seznam_jidel`
--

INSERT INTO `seznam_jidel` (`id`, `nazev`, `popis`, `cena`, `vaha`, `alergen`) VALUES
(1, 'Grilovaná chapadla z chobotnice s majonézovým dipem', ' Chobotnice je v našich končinách spíše sváteční pokrm – ale uvidíte, že když ji připravíte na letní grilovačce, vaši přátelé budou nadšení. Je sice potřeba chapadla předem předvařit, ale jinak je tento recept až neskutečně jednoduchý.', 3, 5, '1'),
(2, 'Zapečená quesadilla s grilovanou zeleninou', 'Grilované quesadilly jsou super jídlo pro všechny, kdo rádi grilují, ale moc nemusí maso. Vegetariánská tortilla je plná křupavé zeleniny a rozteklého sýra.', 2, 3, '6'),
(3, 'Chléb s opečeným lilkem a rajčaty', 'Křupavý chlebík, tatarka, opečený lilek a pěkně nakyslá rajčátka... Božská to kombinace!', 1, 2, '4'),
(4, 'Grilované krevetové špízy', 'Špízy jsou výborné – napícháte na ně, co máte rádi, a gril už pak odvede tu hlavní práci. Nezapomeňte na omáčku, protože ta dodá špízu šmrnc!', 5, 1, '2'),
(5, 'Hovězí burger s krémovou omáčkou', 'Základem dobrého burgeru je kvalitní mleté hovězí maso a dobrá bulka. Pak už jen stačí dochutit parádně nakyslou majonézou a delikatesa je na světě.', 5, 3, '6'),
(6, 'Lasagne bolognese', 'Italská klasika s mletým masem, rajčaty, bešamelem a parmazánem', 4, 5, '3'),
(7, 'Rychlá svíčková na smetaně', 'Česká klasika, která je za chvíli hotová. Výborně chutná s domácím houskovým knedlíkem.', 1, 3, '7'),
(8, 'Pečené kuře', 'Díky pečení na mřížce je kuře měkké a má křupavou kůžičku.', 5, 4, '10'),
(9, 'Lasagne', 'Boloňské lasagne', 2, 3, '11'),
(10, 'Vepřové kotlety pečené v hořčičné omáčce', 'Vepřové kotlety můžete připravit na mnoho způsobů, vyzkoušejte tentokrát třeba ten s hořčičnou omáčkou.', 3, 4, '9'),
(11, 'Kuřecí prso supreme s bylinkami a citronovou kúrou', 'Kuřecí prsíčko Supreme je klasika a měla by ho umět každá hospodyňka. Když ho vylepšíte bylinkami a citronovou kůrou, budete jednička.', 4, 1, '13'),
(12, 'Mexiko Burger', 'Vyzkoušejte burger, který má opravdový říz!', 5, 5, '7'),
(13, 'Frankfurtské hot dogy', 'Frankfurtské hot dogy jsou lákavou pochoutkou, kterou můžete připravit třeba na dětskou oslavu, jistě ji všichni ocení.', 5, 2, '1'),
(14, 'Bratwurst hot dog', 'Řekl někdo hot dog? Touhle pochoutkou rozhodně zabodujete hlavně u dětí, neurazíte však ani žádného dospělého.', 5, 1, '6'),
(15, 'Royal Goat Cheese Burger', 'Všichni milovníci kozího sýra pozor, tento recept si rozhodně zamilujete.', 1, 5, '12'),
(16, 'King Onion Burger', 'Možností, jak si připravit dokonalý burger, je nespočet. Vyzkoušejte třeba tento recept, který si jistě zamilujete.', 2, 1, '1'),
(17, 'Lečo', 'Recept na krémově lahodné lečo. Ideální jako rychlá teplá večeře.', 1, 4, '6'),
(18, 'Grilovaná sezamová panenka', 'Panenka je skvělý kousek masa, který lze připravit na mnoho způsobů. Připravte si ji třeba na sezamu dle našeho receptu.', 4, 3, '5'),
(19, 'Krémové těstoviny se zeleninou', 'Tento jednoduchý recept pomůže zužitkovat běžné suroviny, které doma máte, ale nevíte, jak je využít. Jídlo je příliš dobré na to, aby se jím plýtvalo.', 5, 3, '2'),
(20, 'Citronové špagety se zbylou pečenou zeleninou', 'Nenechte pečenou zeleninu ladem. S hellmanns s ní vykouzlíte perfektní těstoviny, zkuste třeba tyto s citronem.', 4, 3, '2'),
(21, 'Fazolové kuličky s mrkvovou kaší a kapustovým pestem', 'Citronové špagety se zbylou pečenou zeleninou', 3, 2, '4'),
(22, 'Šťavnaté kuře s bramborami, dýní a růžičkovou kapustou', 'Pečené kuře je oblíbeným jídlem skoro v každé rodině. Skvělé na něm je, že se jedno kuře dá zpracovat hned několikrát. Začněte tímto pečeným s hellmanns gurmánskou hořčicí.', 3, 4, '5'),
(23, 'Vepřový guláš', 'Oblíbený recept na vepřový guláš jehož výhodou je kratší doba dušení a nižší cena masa než u hovězího guláše.', 5, 4, '3'),
(24, 'Zapečené fazole se strouhankou ze starého chleba', 'Fazole jsou naprosto univerzální surovinou, která se dá využít na nespočet způsobů. hellmanns snadné zapečené fazole jsou bezpochyby oblíbenou volbou.', 3, 5, '3'),
(25, 'Poké bowl – miska s rýží a zeleninou', 'Havajský pokrm Poke bowl skvěle chutná, je lehký, ale hlavně díky němu využijete plno surovin, které právě máte doma. Výborně si na něm pochutnáte a navíc můžete předejít zbytečnému plýtvání jídla. Inspirujte se naší verzí níže, použít ale můžete jakékoli', 4, 4, '3'),
(26, 'Pečená kachna na zelí', 'Prostě kachna! Se zelim, vole!', 3, 4, '5'),
(27, 'Základní langoše', 'Základní recept na langoše, velkých 6, malých 12 kousků.', 3, 4, '1'),
(28, 'Jednoduché francouzské brambory', 'Jednoduchý recept na tradiční české jídlo - francouzské brambory.', 4, 5, '3'),
(29, 'Rychlá musaka', 'Zjednodušený recept na klasický řecký recept - rychlá musaka.', 1, 1, '1'),
(30, 'Šunkofleky', 'Rychlý recept na základní a jednoduché šunkofleky jako od babičky.', 4, 3, '1'),
(31, 'Brokolicové rizoto s černou rýží', 'Recept na brokolicové rizoto s černou rýží, kde se spojuje superpotravina černá rýže s brokolicí plnou prospěšných vitamínů.', 3, 2, '2'),
(32, 'Červená čočka s kokosovým mlékem', 'Tato jemná a lahodná červená čočka s kokosovým mlékem bude chutnat i zarytým odpůrcům luštěnin. Vynikající a rychlý recept.', 4, 3, '8'),
(33, 'Holandský řízek z krůtího masa', 'Odlehčený recept na holandský řízek z krůtího masa. Recept se skvěle hodí na nedělní oběd a je čistě Českého původu - s Holandskem ho spojuje pouze město Edam, ze kterého pochází sýr, který se do masa přidává... Vyzkoušejte šťavnaté maso s rozpuštěným sýr', 4, 3, '11'),
(34, 'Bylinkové karbanátky', 'Velice rychlá a jednoduchá úprava mletého masa, vhodné i na grilovaní. Vyzkoušejte tyto bylinkové karbanátky.', 4, 4, '8'),
(35, 'Houbová omáčka bez mouky', 'Vyzkoušejte tento univerzální recept na houbovou omáčku z jakýchkoliv jedlých hub se smetanou a bez mouky.', 4, 3, '2');

-- --------------------------------------------------------

--
-- Struktura tabulky `vahy`
--

CREATE TABLE `vahy` (
  `id` int(11) NOT NULL,
  `vaha` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Vypisuji data pro tabulku `vahy`
--

INSERT INTO `vahy` (`id`, `vaha`) VALUES
(1, '260g'),
(2, '290g'),
(3, '320g'),
(4, '420g'),
(5, '480g');

-- --------------------------------------------------------

--
-- Struktura tabulky `vyplatnice`
--

CREATE TABLE `vyplatnice` (
  `id` int(11) NOT NULL,
  `hruba_mzda` int(11) NOT NULL,
  `cista_mzda` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Vypisuji data pro tabulku `vyplatnice`
--

INSERT INTO `vyplatnice` (`id`, `hruba_mzda`, `cista_mzda`) VALUES
(1, 25000, 21070),
(2, 30000, 24770),
(3, 120000, 91370),
(4, 21000, 18110),
(5, 18750, 16437),
(6, 23500, 19960),
(7, 45000, 35870),
(8, 35000, 28470),
(9, 61000, 47710),
(10, 55000, 43270),
(11, 28500, 23659),
(12, 75000, 58070),
(13, 59000, 46230),
(14, 42000, 33650),
(15, 31650, 25982),
(16, 24200, 20478);

-- --------------------------------------------------------

--
-- Struktura tabulky `zamestnanci`
--

CREATE TABLE `zamestnanci` (
  `id` int(11) NOT NULL,
  `jmeno` varchar(60) NOT NULL,
  `prijmeni` varchar(60) NOT NULL,
  `pozice` varchar(60) DEFAULT NULL,
  `pracoviste` int(11) DEFAULT NULL,
  `nadrizeny` int(11) DEFAULT NULL,
  `firma` int(11) DEFAULT NULL,
  `vek` int(11) DEFAULT NULL,
  `pohlavi` varchar(1) DEFAULT NULL,
  `datum_nastupu` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Vypisuji data pro tabulku `zamestnanci`
--

INSERT INTO `zamestnanci` (`id`, `jmeno`, `prijmeni`, `pozice`, `pracoviste`, `nadrizeny`, `firma`, `vek`, `pohlavi`, `datum_nastupu`) VALUES
(1, 'Ivo', 'Merkl', '1', 33, NULL, 2, 58, 'M', '2008-09-11'),
(2, 'Danuše', 'Mikešová', '4', 3, 12, 1, 58, 'F', '2013-10-26'),
(3, 'Lubomír', 'Palma', '1', 1, NULL, 1, 51, 'M', '2019-12-30'),
(4, 'Věra', 'Otýpkový', '5', 35, 1, 2, 63, 'M', '1997-07-11'),
(5, 'Jan', 'Šeps', '2', 34, 1, 2, 52, 'M', '2018-08-22'),
(6, 'Michaela', 'Eliášová', '4', 35, 4, 2, 50, 'F', '2001-08-16'),
(7, 'Filip', 'Čech', '6', 4, 3, 1, 29, 'M', '2005-03-14'),
(8, 'Václav', 'Hlaváč', '2', 2, 3, 1, 21, 'M', '1998-02-16'),
(9, 'Nikol', 'Davídková', '3', 3, 12, 1, 46, 'F', '1990-01-12'),
(10, 'Andrea', 'Šedá', '3', 35, 4, 2, 54, 'M', '2008-10-12'),
(11, 'Františka', 'Židlická', '4', 3, 12, 1, 24, 'M', '2012-10-23'),
(12, 'Daniela', 'Schnáblová', '5', 3, 3, 1, 28, 'F', '2014-09-17'),
(13, 'Milan', 'Nešvara', '6', 36, 1, 2, 47, 'M', '2012-02-13'),
(14, 'Jiří', 'Škripek', '7', 6, 13, 2, 44, 'M', '1993-06-18'),
(15, 'Tereza', 'Zapletalová', '7', 4, 7, 1, 58, 'F', '2021-12-15'),
(16, 'Matěj', 'Pešek', '7', 4, 7, 1, 47, 'M', '1992-05-24'),
(17, 'Lucie', 'Matějková', '8', 37, 1, 2, 43, 'F', '1987-02-08'),
(18, 'Kamila', 'Uhlířová', '8', 5, 3, 1, 55, 'F', '2011-05-04'),
(19, 'Petr', 'Havránek', '8', 5, 3, 1, 38, 'M', '1996-05-15'),
(20, 'Věra', 'Kim', '9', 6, 3, 1, 48, 'M', '2000-11-04'),
(21, 'Ludmila', 'Vondráková', '9', 38, 1, 2, 61, 'F', '1992-02-06'),
(22, 'Kristýna', 'Procházka', '13', 6, 20, 1, 51, 'M', '2010-12-21'),
(23, 'Ludvík', 'Ambrožová', '13', 6, 20, 1, 54, 'F', '2017-07-20'),
(24, 'Zdeňka', 'Sopoušek', '12', 6, 20, 1, 54, 'M', '1993-11-04'),
(25, 'Jiří', 'Pešková', '10', 38, 21, 2, 43, 'F', '2007-07-24'),
(26, 'Tereza', 'Jaroňová', '10', 38, 21, 2, 34, 'F', '1995-04-11'),
(27, 'Michaela', 'Lebeda', '11', 52, 1, 2, 20, 'M', '2006-09-09'),
(28, 'Josef', 'Liška', '12', 7, 29, 1, 26, 'M', '1986-08-16'),
(29, 'Tomáš', 'Cikhartová', '11', 7, 3, 1, 49, 'F', '2004-01-19'),
(30, 'Květuše', 'Flek', '13', 7, 29, 1, 57, 'M', '1999-05-19'),
(31, 'Matěj', 'Veselý', '14', 7, 29, 1, 30, 'M', '1999-09-30'),
(32, 'Jana', 'Fadrhonc', '12', 7, 29, 1, 47, 'M', '2015-08-06'),
(33, 'Milan', 'Komárek', '12', 7, 29, 1, 39, 'M', '2017-09-26'),
(34, 'Jan', 'Triebe', '13', 39, 27, 2, 32, 'M', '2018-11-24'),
(35, 'Jaroslav', 'Dlouhý', '14', 39, 27, 2, 24, 'M', '2018-04-11'),
(36, 'Miloš', 'Svobodový', '12', 39, 27, 2, 49, 'M', '2011-09-10'),
(37, 'Marie', 'Rýsová', '14', 39, 27, 2, 62, 'F', '2018-08-17'),
(38, 'Petr', 'Bůbela', '15', 39, 27, 2, 56, 'M', '1997-01-22'),
(39, 'Martin', 'Kim', '15', 39, 27, 2, 27, 'M', '2020-05-30'),
(40, 'Tomáš', 'Vondráková', '16', 39, 27, 2, 39, 'F', '2011-11-20'),
(41, 'Jaroslava', 'Procházka', '14', 39, 27, 2, 48, 'M', '2013-03-12'),
(42, 'Václav', 'Ambrožová', '14', 10, 29, 1, 60, 'F', '2007-04-24'),
(43, 'Soňa', 'Sopoušek', '14', 10, 29, 1, 46, 'M', '2011-12-20'),
(44, 'Daniel', 'Pešková', '15', 10, 29, 1, 31, 'F', '2014-11-30'),
(45, 'Mila', 'Jaroňová', '15', 10, 29, 1, 44, 'F', '2015-08-31'),
(46, 'Antonín', 'Lebeda', '16', 10, 29, 1, 59, 'M', '2010-07-30'),
(47, 'Fedir', 'Liška', '19', 12, 3, 1, 57, 'M', '2020-11-21'),
(48, 'Jan', 'Cikhartová', '17', 12, 47, 1, 42, 'F', '2011-09-24'),
(49, 'Petr', 'Flek', '17', 13, 47, 1, 21, 'M', '2010-12-19'),
(50, 'Jaroslav', 'Veselý', '17', 13, 47, 1, 48, 'M', '1996-08-23'),
(51, 'Anděla', 'Fadrhonc', '17', 13, 47, 1, 21, 'M', '2003-04-29'),
(52, 'Karel', 'Komárek', '17', 13, 47, 1, 33, 'M', '2003-09-08'),
(53, 'Pavel', 'Triebe', '17', 13, 47, 1, 36, 'M', '1985-06-14'),
(54, 'Martin', 'Dlouhý', '26', 51, 1, 2, 64, 'M', '2007-03-15'),
(55, 'Josef', 'Krátký', '26', 15, 3, 1, 57, 'M', '2018-08-28'),
(56, 'Jana', 'Rýsová', '20', 15, 55, 1, 26, 'F', '2010-09-03'),
(57, 'Martin', 'Bůbela', '20', 15, 55, 1, 31, 'M', '2012-05-23'),
(58, 'Martin', 'Peřina', '20', 15, 55, 1, 58, 'M', '2006-12-12'),
(59, 'Václav', 'Sedláček', '20', 15, 55, 1, 40, 'M', '2012-07-23'),
(60, 'Pavel', 'Kortán', '20', 15, 55, 1, 55, 'M', '2018-12-13'),
(61, 'Zdeněk', 'Šmejkal', '20', 15, 55, 1, 43, 'M', '1996-01-26'),
(62, 'Monika', 'Hyttychová', '20', 51, 54, 2, 33, 'F', '2014-06-29'),
(63, 'Jan', 'Smolík', '20', 51, 54, 2, 60, 'M', '1985-04-05'),
(64, 'Karel', 'Kosowski', '20', 51, 54, 2, 46, 'M', '2011-10-25'),
(65, 'František', 'Nesvadba', '20', 51, 54, 2, 31, 'M', '2004-04-18'),
(66, 'Tomáš', 'Skřivánek', '20', 51, 54, 2, 44, 'M', '2001-01-16'),
(67, 'Alois', 'Němec', '21', 8, 8, 1, 63, 'M', '2007-04-27'),
(68, 'Silvie', 'Ačová', '21', 8, 8, 1, 26, 'F', '2010-06-22'),
(69, 'Jitka', 'Srbecká', '21', 16, 8, 1, 59, 'M', '2007-05-28'),
(70, 'Vít', 'Veleba', '21', 16, 8, 1, 62, 'M', '2020-08-04'),
(71, 'Dagmar', 'Gardianová', '21', 69, 5, 2, 23, 'F', '2019-10-05'),
(72, 'Milan', 'Tkáčik', '21', 69, 5, 2, 46, 'M', '2014-01-07'),
(73, 'Zdenka', 'Senčíková', '21', 69, 5, 2, 52, 'F', '1987-10-25'),
(74, 'Lukáš', 'Trnka', '21', 70, 5, 2, 55, 'M', '1988-01-05'),
(75, 'Jaroslav', 'Kopečný', '21', 70, 5, 2, 55, 'M', '1991-08-12'),
(76, 'Štěpán', 'Drahohrad', '21', 70, 5, 2, 47, 'M', '2009-01-09'),
(77, 'Matěj', 'Augustin', '21', 70, 5, 2, 49, 'M', '2009-04-17'),
(78, 'Ibrišim', 'Časpek', '21', 70, 5, 2, 41, 'M', '1996-05-20'),
(79, 'Jan', 'Honěk', '21', 70, 5, 2, 38, 'M', '2007-01-16'),
(80, 'Lukáš', 'Fabiánek', '22', 21, 87, 1, 49, 'M', '1985-01-23'),
(81, 'Jiří', 'Pospíšil', '22', 21, 87, 1, 64, 'M', '1995-03-06'),
(82, 'Ladislav', 'Štolc', '22', 21, 87, 1, 62, 'M', '1997-09-11'),
(83, 'Rostislav', 'Bayer', '22', 21, 87, 1, 57, 'M', '2017-12-12'),
(84, 'Zdeněk', 'Polický', '23', 23, 87, 1, 31, 'M', '1997-08-26'),
(85, 'Vladimír', 'Holub', '23', 23, 87, 1, 57, 'M', '1987-05-30'),
(86, 'Jaroslav', 'Šťástka', '24', 22, 87, 1, 37, 'M', '1997-02-04'),
(87, 'Bedřich', 'Zikmund', '24', 22, 87, 1, 40, 'M', '2000-04-02'),
(88, 'Petr', 'Nedvěd', '51', 22, 8, 1, 25, 'M', '1986-12-23'),
(89, 'Roman', 'Slunečko', '25', 32, 91, 1, 29, 'M', '1987-02-12'),
(90, 'Pavel', 'Šverma', '25', 32, 91, 1, 53, 'M', '1989-08-26'),
(91, 'František', 'Probošt', '27', 32, 8, 1, 23, 'M', '2001-11-26'),
(92, 'Josef', 'Šimíček', '22', 55, 101, 2, 24, 'M', '2017-07-27'),
(93, 'Václav', 'Richter', '22', 55, 101, 2, 33, 'M', '2021-02-20'),
(94, 'Zbyněk', 'Burgert', '22', 55, 101, 2, 29, 'M', '1991-12-29'),
(95, 'Radek', 'Sabala', '22', 55, 101, 2, 27, 'M', '1987-07-16'),
(96, 'Walter', 'Pour', '22', 55, 101, 2, 29, 'M', '2014-09-17'),
(97, 'Otto', 'Smetana', '23', 57, 101, 2, 42, 'M', '2011-12-11'),
(98, 'Zdeněk', 'Uher', '23', 57, 101, 2, 62, 'M', '1992-07-31'),
(99, 'Jan', 'Horský', '24', 56, 101, 2, 27, 'M', '2018-01-26'),
(100, 'Jaroslav', 'Mihulka', '24', 56, 101, 2, 21, 'M', '2013-08-11'),
(101, 'Josef', 'Pavelka', '51', 56, 5, 2, 48, 'M', '1990-11-04'),
(102, 'Alexander', 'Brandl', '36', 27, 3, 1, 21, 'M', '2004-05-18'),
(103, 'Miroslav', 'Stallmach', '36', 27, 3, 1, 34, 'M', '1988-05-12'),
(104, 'Jiří', 'Janoušek', '37', 27, 3, 1, 43, 'M', '2019-09-02'),
(105, 'František', 'Hatrik', '37', 27, 3, 1, 46, 'M', '1996-04-08'),
(106, 'Petr', 'Kučera', '36', NULL, 3, 1, 39, 'M', '2013-04-29'),
(107, 'David', 'Hána', '36', 64, 5, 2, 39, 'M', '2016-10-31'),
(108, 'VáclavRadek', 'Jindra', '37', NULL, 3, 1, 55, 'M', '2021-03-07'),
(109, 'Stanislav', 'Hrubča', '37', 64, 5, 2, 51, 'M', '1994-05-28'),
(110, 'Miroslav', 'Sýkora', '38', 3, 4, 1, 25, 'M', '1999-06-25'),
(111, 'Rudolf', 'Vinš', '38', 4, 7, 1, 41, 'M', '1991-03-11'),
(112, 'Tomáš', 'Laštovka', '38', 5, 17, 1, 64, 'M', '2010-07-05'),
(113, 'Martin', 'Kochta', '38', 5, 17, 1, 45, 'M', '2017-12-19'),
(114, 'Vladimír', 'Jiřička', '38', 4, 7, 1, 59, 'M', '1997-04-24'),
(115, 'Zdeněk', 'Kovařík', '38', 6, 13, 1, 50, 'M', '1985-08-30'),
(116, 'Otakar', 'Neumann', '38', 7, 29, 1, 55, 'M', '1989-05-14'),
(117, 'Pavel', 'Kotajny', '38', 35, 5, 2, 60, 'M', '2004-11-04'),
(118, 'Lukáš', 'Křístek', '38', 35, 5, 2, 27, 'M', '1995-02-15'),
(119, 'Radan', 'Čežíš', '38', 36, 13, 2, 25, 'M', '2014-01-31'),
(120, 'Jiří', 'Vavrouš', '38', 36, 13, 2, 23, 'M', '1986-01-20'),
(121, 'Josef', 'Vaščík', '38', 37, 17, 2, 20, 'M', '2017-01-03'),
(122, 'Ivan', 'Uher', '38', 37, 17, 2, 56, 'M', '1989-11-18'),
(123, 'Jan', 'Šercl', '38', 38, 21, 2, 20, 'M', '1989-05-21'),
(124, 'Petr', 'Dostál', '38', 38, 21, 2, 50, 'M', '1992-04-14'),
(125, 'Michal', 'Dzurko', '40', 25, 3, 1, 34, 'M', '2008-04-04'),
(126, 'Ludvík', 'Kopřiva', '39', 25, 125, 1, 45, 'M', '2003-06-12'),
(127, 'František', 'Poul', '39', 25, 125, 1, 59, 'M', '2007-06-13'),
(128, 'Jaroslav', 'Kačena', '39', 25, 125, 1, 53, 'M', '2003-11-24'),
(129, 'Filip', 'Šedivý', '39', 25, 125, 1, 20, 'M', '2012-02-24'),
(130, 'Ivo', 'Jansa', '42', 28, 8, 1, 59, 'M', '1988-01-17'),
(131, 'Robert', 'Jíra', '41', 29, 130, 1, 35, 'M', '1994-10-11'),
(132, 'Milan', 'Calda', '41', 30, 130, 1, 22, 'M', '1986-10-02'),
(133, 'Roman', 'Vodehnal', '42', 29, 130, 1, 31, 'M', '2002-06-06'),
(134, 'Marcel', 'Veselý', '42', 30, 130, 1, 24, 'M', '1990-11-22'),
(135, 'Ivo', 'Zůvala', '43', 31, 130, 1, 54, 'M', '2000-03-01'),
(136, 'Tomáš', 'Peršan', '31', 8, 67, 1, 43, 'M', '2005-02-26'),
(137, 'Petr', 'Turek', '31', 8, 67, 1, 34, 'M', '2002-04-13'),
(138, 'Karol', 'Černoch', '31', 8, 67, 1, 23, 'M', '2010-12-07'),
(139, 'Kristýn', 'Krása', '31', 8, 67, 1, 37, 'M', '1986-10-29'),
(140, 'Vít', 'Borut', '31', 8, 68, 1, 53, 'M', '1992-04-29'),
(141, 'Xaver', 'Veselý', '31', 8, 68, 1, 42, 'M', '2016-02-27'),
(142, 'Martin', 'Novák', '31', 8, 68, 1, 34, 'M', '2004-10-22'),
(143, 'Ludvík', 'Kružberk', '31', 8, 68, 1, 23, 'M', '1990-07-27'),
(144, 'Martin', 'Jánský', '29', 16, 69, 1, 38, 'M', '1991-06-02'),
(145, 'Lukáš', 'Otyla', '29', 16, 69, 1, 55, 'M', '2000-05-16'),
(146, 'Antonín', 'Volný', '29', 16, 69, 1, 55, 'M', '2004-08-13'),
(147, 'Cyril', 'Mrtvý', '29', 16, 69, 1, 42, 'M', '1998-12-18'),
(148, 'Petr', 'Crha', '29', 16, 69, 1, 28, 'M', '1995-12-19'),
(149, 'Karel', 'Škrtič', '29', 16, 70, 1, 37, 'M', '1997-12-05'),
(150, 'Ivo', 'Káňa', '29', 16, 70, 1, 37, 'M', '2016-10-02'),
(151, 'Radek', 'Ludvík', '29', 16, 70, 1, 55, 'M', '1990-12-26'),
(152, 'Bartoloměj', 'Pampeliška', '29', 16, 70, 1, 56, 'M', '1995-08-30'),
(153, 'Karel', 'Zelený', '32', 17, 69, 1, 48, 'M', '2020-05-06'),
(154, 'Tomáš', 'Modrý', '32', 17, 69, 1, 55, 'M', '2015-10-01'),
(155, 'Petr', 'Veselý', '32', 17, 70, 1, 21, 'M', '1994-09-14'),
(156, 'Martin', 'Zahradník', '32', 17, 70, 1, 57, 'M', '2017-04-07'),
(157, 'Adam', 'Kanálek', '32', 9, 68, 1, 22, 'M', '2003-03-24'),
(158, 'Michal', 'Kopeček', '32', 9, 68, 1, 53, 'M', '2017-05-01'),
(159, 'Lukáš', 'Domeček', '32', 9, 67, 1, 44, 'M', '2015-12-24'),
(160, 'Xaver', 'Lesák', '32', 9, 67, 1, 42, 'M', '2004-11-25'),
(161, 'Daniel', 'Vlčák', '32', 41, 71, 2, 59, 'M', '1991-07-26'),
(162, 'Václav', 'Stoleček', '32', 41, 77, 2, 61, 'M', '1996-02-15'),
(163, 'Marek', 'Paleček', '32', 41, 72, 2, 61, 'M', '2020-12-03'),
(164, 'Jaroslav', 'Pero', '32', 41, 73, 2, 57, 'M', '2017-04-02'),
(165, 'Milan', 'Krátký', '32', 41, 74, 2, 37, 'M', '2000-06-24'),
(166, 'Patrik', 'Dlouhý', '32', 41, 75, 2, 39, 'M', '2003-08-23'),
(167, 'Kristýna', 'Fialová', '32', 41, 78, 2, 64, 'F', '1993-10-09'),
(168, 'Aneta', 'Zedničková', '32', 41, 76, 2, 51, 'F', '2010-12-08'),
(169, 'Monika', 'Stoličková', '32', 41, 79, 2, 41, 'F', '2012-05-13'),
(170, 'Patricie', 'Doktorová', '32', 54, 172, 2, 32, 'F', '2006-01-05'),
(171, 'Karolína', 'Strakatá', '32', 54, 172, 2, 63, 'M', '2007-12-21'),
(172, 'Věra', 'Pohlová', '34', 50, 5, 2, 20, 'F', '1998-10-24'),
(173, 'Vladimír', 'Pohl', '15', 42, 191, 2, 29, 'M', '1985-02-25'),
(174, 'Josef', 'Kopretina', '15', 42, 191, 2, 62, 'M', '2020-04-28'),
(175, 'Kateřina', 'Vlašáková', '15', 42, 191, 2, 24, 'F', '2009-03-01'),
(176, 'Milena', 'Koprová', '15', 42, 191, 2, 50, 'F', '1999-11-05'),
(177, 'Marie', 'Lindová', '16', 42, 191, 2, 21, 'F', '1986-09-25'),
(178, 'Antonín', 'Peterka', '16', 42, 191, 2, 29, 'M', '1987-02-15'),
(179, 'Alice', 'Mokrá', '15', 46, 192, 2, 60, 'M', '1990-06-02'),
(180, 'Miloslav', 'Vlhký', '15', 46, 192, 2, 61, 'M', '2005-09-21'),
(181, 'Miloš', 'Kopretina', '15', 46, 192, 2, 58, 'M', '1996-05-11'),
(182, 'Petr', 'David', '15', 46, 192, 2, 44, 'M', '2017-08-19'),
(183, 'David', 'Michal', '16', 46, 192, 2, 27, 'M', '2000-01-29'),
(184, 'Iveta', 'Františková', '16', 46, 192, 2, 27, 'F', '2000-06-26'),
(185, 'Františka', 'Petrová', '15', 52, 27, 2, 33, 'F', '2017-03-12'),
(186, 'Jiřina', 'Kaprová', '15', 52, 27, 2, 23, 'F', '1985-07-07'),
(187, 'Jan', 'Štika', '15', 52, 27, 2, 40, 'M', '2004-12-28'),
(188, 'Ladislav', 'Okoun', '15', 52, 27, 2, 23, 'M', '2007-06-01'),
(189, 'Marian', 'Pstruh', '16', 52, 27, 2, 20, 'M', '1999-02-07'),
(190, 'Marcel', 'Sumec', '16', 52, 27, 2, 54, 'M', '1988-04-07'),
(191, 'Josef', 'Halaxa', '11', 42, 1, 2, 59, 'M', '1997-01-07'),
(192, 'Jan', 'Budi', '11', 46, 1, 2, 21, 'M', '1997-04-18'),
(193, 'Marta', 'Hrdá', '28', 40, 71, 2, 44, 'M', '2010-06-02'),
(194, 'Marie', 'Dvořáková', '28', 40, 71, 2, 49, 'F', '1999-03-18'),
(195, 'Miriam', 'Kubešová', '28', 40, 72, 2, 49, 'F', '2017-10-14'),
(196, 'Aneta', 'Jankovská', '28', 40, 72, 2, 33, 'M', '1992-04-22'),
(197, 'Marek', 'Dvořák', '28', 40, 73, 2, 42, 'M', '1999-03-06'),
(198, 'Vendula', 'Gáborová', '28', 40, 73, 2, 46, 'F', '1995-12-18'),
(199, 'Ivan', 'Novák', '28', 40, 74, 2, 42, 'M', '1997-04-13'),
(200, 'Lucie', 'Holubec', '28', 40, 74, 2, 51, 'M', '2013-07-10'),
(201, 'Kurt', 'Kylar', '28', 40, 75, 2, 21, 'M', '2014-10-09'),
(202, 'Iva', 'Burianová', '28', 40, 75, 2, 22, 'F', '2010-04-14'),
(203, 'Dagmar', 'Dientsbierová', '28', 40, 76, 2, 29, 'F', '2022-02-07'),
(204, 'Milan', 'Schreiber', '28', 40, 76, 2, 58, 'M', '2018-08-30'),
(205, 'Petr', 'Kačmařík', '28', 40, 77, 2, 47, 'M', '2004-01-03'),
(206, 'Renata', 'Legůtková', '28', 40, 77, 2, 41, 'F', '2017-01-13'),
(207, 'Jaroslava', 'Kovářová', '28', 40, 78, 2, 47, 'F', '2012-03-01'),
(208, 'Mirka', 'Plonková', '28', 40, 79, 2, 46, 'F', '1986-09-21'),
(209, 'Petra', 'Ponková', '28', 40, 79, 2, 24, 'F', '1988-02-08'),
(210, 'Hobli', 'Born', '1', NULL, NULL, 3, 52, 'M', '1995-05-12'),
(211, 'Kobli', 'Born', '10', NULL, NULL, 3, 34, 'M', '1989-06-27'),
(212, 'Šimon', 'Kabát', '33', 68, 172, 2, 38, 'M', '2014-05-10'),
(213, 'Michal', 'Káňa', '33', 68, 172, 2, 23, 'M', '2004-04-25'),
(214, 'Rudolf', 'Pechanec', '33', 68, 172, 2, 27, 'M', '1993-07-03'),
(215, 'David', 'Skřička', '33', 68, 172, 2, 46, 'M', '2007-07-31'),
(216, 'Pavel', 'Alexa', '44', 44, 71, 2, 42, 'M', '1996-05-19'),
(217, 'Jakub', 'Kopecký', '44', 45, 71, 2, 50, 'M', '2012-03-02'),
(218, 'Jan', 'DlapaHubáček', '44', 44, 72, 2, 60, 'M', '2010-09-10'),
(219, 'Vladimír', 'Slováček', '44', 45, 72, 2, 40, 'M', '1993-12-15'),
(220, 'Jaroslav', 'Fusek', '44', 44, 73, 2, 47, 'M', '1990-09-12'),
(221, 'Bořek', 'Ryaska', '44', 45, 73, 2, 50, 'M', '1986-08-14'),
(222, 'Jiří', 'Šimon', '44', 44, 74, 2, 44, 'M', '2014-01-01'),
(223, 'Milan', 'Urbánek', '44', 45, 74, 2, 51, 'M', '2011-02-26'),
(224, 'Luděk', 'Kalita', '44', 44, 75, 2, 58, 'M', '1990-10-09'),
(225, 'Petr', 'Přibyl', '44', 45, 75, 2, 30, 'M', '2011-05-21'),
(226, 'Marian', 'Stacha', '44', 44, 76, 2, 43, 'M', '1985-08-10'),
(227, 'Zdeněk', 'Strejc', '44', 45, 76, 2, 64, 'M', '2022-11-19'),
(228, 'František', 'Buchta', '44', 44, 77, 2, 35, 'M', '2020-08-06'),
(229, 'Luboš', 'Čermák', '44', 45, 77, 2, 52, 'M', '2011-05-04'),
(230, 'Martin', 'Vašíček', '44', 44, 78, 2, 47, 'M', '2009-11-22'),
(231, 'Jindřich', 'Kohout', '44', 45, 78, 2, 58, 'M', '1992-06-15'),
(232, 'Radek', 'Vaňha', '44', 44, 79, 2, 40, 'M', '1985-08-03'),
(233, 'Miloš', 'Tesař', '44', 45, 79, 2, 50, 'M', '2003-07-29'),
(234, 'František', 'Bobek', '35', 59, 1, 2, 21, 'M', '2000-02-07'),
(235, 'Viktor', 'Kollert', '35', 60, 1, 2, 26, 'M', '2004-10-14'),
(236, 'Vladislav', 'Hordějčuk', '35', 61, 1, 2, 48, 'M', '2000-08-19'),
(237, 'Jakub', 'Trojan', '35', 62, 1, 2, 53, 'M', '2003-10-19'),
(238, 'Drahomír', 'Axmann', '46', 65, 1, 2, 57, 'M', '1994-02-02'),
(239, 'Jan', 'Foltánek', '45', 65, 238, 2, 59, 'M', '2012-01-20'),
(240, 'Tomáš', 'Mašek', '45', 65, 238, 2, 60, 'M', '2016-12-30'),
(241, 'Jaroslav', 'Huml', '45', 65, 238, 2, 60, 'M', '1987-10-30'),
(242, 'Jiří', 'Reich', '47', 58, 101, 2, 55, 'M', '2017-02-22'),
(243, 'Daniel', 'Staňo', '47', 58, 101, 2, 31, 'M', '1985-04-01'),
(244, 'Václav', 'Teplík', '48', 58, 101, 2, 58, 'M', '2003-10-22'),
(245, 'Petr', 'Jirásek', '48', 58, 101, 2, 45, 'M', '2002-04-13'),
(246, 'Vasyl', 'Tirala', '51', 67, 1, 2, 29, 'M', '2014-12-28'),
(247, 'Miloslav', 'Tóth', '49', 66, 246, 2, 36, 'M', '2007-02-09'),
(248, 'Rudolf', 'Strnad', '49', 66, 246, 2, 27, 'M', '2005-07-28'),
(249, 'Mirek', 'Kavalír', '49', 66, 246, 2, 55, 'M', '2021-07-13'),
(250, 'Patrik', 'Hlávka', '49', 66, 246, 2, 37, 'M', '1991-12-11'),
(251, 'Michal', 'Pospíšil', '50', 67, 246, 2, 45, 'M', '1986-02-11'),
(252, 'Jaroslav', 'Kalčík', '50', 67, 246, 2, 51, 'M', '2007-09-28'),
(253, 'Jurij', 'Uhlíř', '50', 67, 246, 2, 56, 'M', '2019-05-13'),
(254, 'Martin', 'Vrána', '50', 67, 246, 2, 64, 'M', '2012-08-03'),
(255, 'Petr', 'Mejzlík', '45', 47, 238, 2, 41, 'M', '2019-11-09'),
(256, 'Jan', 'Koschatzký', '45', 47, 238, 2, 39, 'M', '2000-07-08'),
(257, 'Josef', 'Pres', '15', 48, 192, 2, 54, 'M', '1996-01-09'),
(258, 'Jiří', 'Dědič', '15', 48, 192, 2, 43, 'M', '1993-07-22'),
(259, 'František', 'Zajíček', '15', 48, 192, 2, 33, 'M', '1994-09-16'),
(260, 'Václav', 'Částka', '15', 43, 191, 2, 60, 'M', '2007-11-14'),
(261, 'Miroslav', 'Chrastina', '15', 43, 191, 2, 49, 'M', '1994-03-22'),
(262, 'Vladimír', 'Hrůza', '33', 49, 172, 2, 44, 'M', '2000-07-01'),
(263, 'Oldřich', 'Fiala', '33', 49, 172, 2, 52, 'M', '1996-10-29'),
(264, 'Miloš', 'Novák', '15', 53, 264, 2, 20, 'M', '1997-08-22'),
(265, 'Vít', 'Mráček', '15', 53, 264, 2, 58, 'M', '2012-09-19'),
(266, 'Roman', 'Jordán', '11', 53, 5, 2, 32, 'M', '2009-08-31'),
(267, 'Marek', 'Žejdl', '49', 63, 246, 2, 55, 'M', '1987-03-07'),
(268, 'Pavel', 'Vrána', NULL, NULL, NULL, NULL, 25, 'M', '1997-11-21');

--
-- Indexy pro exportované tabulky
--

--
-- Indexy pro tabulku `alergeny`
--
ALTER TABLE `alergeny`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pro tabulku `cenik`
--
ALTER TABLE `cenik`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pro tabulku `firma`
--
ALTER TABLE `firma`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pro tabulku `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pro tabulku `objednavky`
--
ALTER TABLE `objednavky`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pro tabulku `pozice`
--
ALTER TABLE `pozice`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pro tabulku `pracoviste`
--
ALTER TABLE `pracoviste`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pro tabulku `seznam_budov`
--
ALTER TABLE `seznam_budov`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pro tabulku `seznam_jidel`
--
ALTER TABLE `seznam_jidel`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pro tabulku `vahy`
--
ALTER TABLE `vahy`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pro tabulku `vyplatnice`
--
ALTER TABLE `vyplatnice`
  ADD PRIMARY KEY (`id`);

--
-- Indexy pro tabulku `zamestnanci`
--
ALTER TABLE `zamestnanci`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pro tabulky
--

--
-- AUTO_INCREMENT pro tabulku `alergeny`
--
ALTER TABLE `alergeny`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pro tabulku `cenik`
--
ALTER TABLE `cenik`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pro tabulku `firma`
--
ALTER TABLE `firma`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pro tabulku `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pro tabulku `objednavky`
--
ALTER TABLE `objednavky`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pro tabulku `pozice`
--
ALTER TABLE `pozice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT pro tabulku `pracoviste`
--
ALTER TABLE `pracoviste`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT pro tabulku `seznam_budov`
--
ALTER TABLE `seznam_budov`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT pro tabulku `seznam_jidel`
--
ALTER TABLE `seznam_jidel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT pro tabulku `vahy`
--
ALTER TABLE `vahy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pro tabulku `vyplatnice`
--
ALTER TABLE `vyplatnice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pro tabulku `zamestnanci`
--
ALTER TABLE `zamestnanci`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=269;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
