-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2022. Jún 28. 17:55
-- Kiszolgáló verziója: 10.4.19-MariaDB
-- PHP verzió: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `szallitas`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `cim`
--

CREATE TABLE `cim` (
  `id` int(11) NOT NULL,
  `celirszam` int(11) NOT NULL,
  `celvaros` text COLLATE utf8mb4_hungarian_ci NOT NULL,
  `celutca` text COLLATE utf8mb4_hungarian_ci NOT NULL,
  `celhazszam` text COLLATE utf8mb4_hungarian_ci NOT NULL,
  `feladoirszam` int(11) NOT NULL,
  `feladovaros` text COLLATE utf8mb4_hungarian_ci NOT NULL,
  `feladoutca` text COLLATE utf8mb4_hungarian_ci NOT NULL,
  `feladohazszam` text COLLATE utf8mb4_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `cim`
--

INSERT INTO `cim` (`id`, `celirszam`, `celvaros`, `celutca`, `celhazszam`, `feladoirszam`, `feladovaros`, `feladoutca`, `feladohazszam`) VALUES
(3, 1193, 'Budapest', 'Irányi Dániel utca', '5', 2548, 'Pécs', 'Baranya utca', '32'),
(4, 3333, 'gfds', 'fds', 'fds', 1111, 'dsa', 'asd', 'asd'),
(5, 2222, 'dsa', 'asd', '33', 1111, 'asd', 'dsa', '22'),
(6, 30, 'asd', 'asdasdsadas', '30', 222, 'dsa', 'asd', '2000'),
(7, 1111, 'debrecen', 'valami', '20', 200, 'pécs', 'fő utca', '20'),
(8, 1193, 'Budapest', 'váci út', '42', 2011, 'Budakalász', 'Pomázi út', '58');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `csomag`
--

CREATE TABLE `csomag` (
  `id` int(11) NOT NULL,
  `szelesseg` float NOT NULL,
  `magassag` float NOT NULL,
  `melyseg` float NOT NULL,
  `suly` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `csomag`
--

INSERT INTO `csomag` (`id`, `szelesseg`, `magassag`, `melyseg`, `suly`) VALUES
(1, 20, 45, 30, 652),
(2, 40, 450, 5, 1200),
(3, 20, 30, 40, 50),
(4, 20, 20, 2020, 20),
(5, 10, 10, 20, 300),
(6, 30, 40, 20, 1400);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `fuvar`
--

CREATE TABLE `fuvar` (
  `id` int(11) NOT NULL,
  `ugyfelid` int(11) NOT NULL,
  `cimid` int(11) NOT NULL,
  `feladasdatuma` date NOT NULL,
  `csomagid` int(11) NOT NULL,
  `kivanterkezes` text COLLATE utf8mb4_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `fuvar`
--

INSERT INTO `fuvar` (`id`, `ugyfelid`, `cimid`, `feladasdatuma`, `csomagid`, `kivanterkezes`) VALUES
(3, 1, 3, '2021-09-19', 1, '2021-09-20'),
(10, 9, 8, '0000-00-00', 6, '0');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `ugyfel`
--

CREATE TABLE `ugyfel` (
  `id` int(11) NOT NULL,
  `nev` text COLLATE utf8mb4_hungarian_ci NOT NULL,
  `ceges` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `ugyfel`
--

INSERT INTO `ugyfel` (`id`, `nev`, `ceges`) VALUES
(1, 'Kovács Béla', 0),
(2, 'Nagy Péter', 1),
(6, 'simon', 0),
(7, 'simon', 0),
(8, 'anderlik', 0),
(9, 'Szűcs Krisztián', 0);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `cim`
--
ALTER TABLE `cim`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `csomag`
--
ALTER TABLE `csomag`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `fuvar`
--
ALTER TABLE `fuvar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ugyfel` (`ugyfelid`),
  ADD KEY `feladas` (`cimid`),
  ADD KEY `csomag` (`csomagid`);

--
-- A tábla indexei `ugyfel`
--
ALTER TABLE `ugyfel`
  ADD PRIMARY KEY (`id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `cim`
--
ALTER TABLE `cim`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT a táblához `csomag`
--
ALTER TABLE `csomag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT a táblához `fuvar`
--
ALTER TABLE `fuvar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT a táblához `ugyfel`
--
ALTER TABLE `ugyfel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `fuvar`
--
ALTER TABLE `fuvar`
  ADD CONSTRAINT `fuvar_ibfk_2` FOREIGN KEY (`csomagid`) REFERENCES `csomag` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fuvar_ibfk_3` FOREIGN KEY (`cimid`) REFERENCES `cim` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fuvar_infk_4` FOREIGN KEY (`ugyfelid`) REFERENCES `ugyfel` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
