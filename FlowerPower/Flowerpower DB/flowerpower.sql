-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 26, 2021 at 11:50 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `flowerpower`
--

-- --------------------------------------------------------

--
-- Table structure for table `artikel`
--

CREATE TABLE `artikel` (
  `Artikelcode` int(11) NOT NULL,
  `Artikel` varchar(255) DEFAULT NULL,
  `Prijs` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bestelling`
--

CREATE TABLE `bestelling` (
  `Artikelcode` int(11) DEFAULT NULL,
  `Winkelcode` int(11) DEFAULT NULL,
  `Aantal` int(11) DEFAULT NULL,
  `Klantcode` int(11) DEFAULT NULL,
  `Medewerkerscode` int(11) DEFAULT NULL,
  `Afgehaald` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `factuur`
--

CREATE TABLE `factuur` (
  `Factuurnummer` int(11) NOT NULL,
  `Factuurdatum` date DEFAULT NULL,
  `Klantcode` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `factuurregel`
--

CREATE TABLE `factuurregel` (
  `Factuurnummer` int(11) DEFAULT NULL,
  `Artikelcode` int(11) DEFAULT NULL,
  `Aantal` int(11) DEFAULT NULL,
  `Prijs` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `klant`
--

CREATE TABLE `klant` (
  `Klantcode` int(11) NOT NULL,
  `Voorletters` varchar(255) DEFAULT NULL,
  `Tussenvoegsels` varchar(255) DEFAULT NULL,
  `Achternaam` varchar(255) DEFAULT NULL,
  `Adres` varchar(255) DEFAULT NULL,
  `Postcode` varchar(255) DEFAULT NULL,
  `Woonplaats` varchar(255) DEFAULT NULL,
  `Geboortedatum` date DEFAULT NULL,
  `Gebruikersnaam` varchar(255) DEFAULT NULL,
  `Wachtwoord` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `medewerker`
--

CREATE TABLE `medewerker` (
  `Medewerkerscode` int(11) NOT NULL,
  `Voorletter` varchar(255) DEFAULT NULL,
  `Voorvoegsels` varchar(255) DEFAULT NULL,
  `Acthernaam` varchar(255) DEFAULT NULL,
  `Gebruikersnaam` varchar(255) DEFAULT NULL,
  `Wachtwoord` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `winkel`
--

CREATE TABLE `winkel` (
  `Winkelcode` int(11) NOT NULL,
  `Winkelnaam` varchar(255) DEFAULT NULL,
  `Winkeladres` varchar(255) DEFAULT NULL,
  `Winkelpostcode` varchar(255) DEFAULT NULL,
  `Vestigingsplaats` varchar(255) DEFAULT NULL,
  `Telefoonnummer` int(13) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `artikel`
--
ALTER TABLE `artikel`
  ADD PRIMARY KEY (`Artikelcode`);

--
-- Indexes for table `bestelling`
--
ALTER TABLE `bestelling`
  ADD KEY `Artikelcode` (`Artikelcode`),
  ADD KEY `Winkelcode` (`Winkelcode`),
  ADD KEY `Klantcode` (`Klantcode`),
  ADD KEY `Medewerkerscode` (`Medewerkerscode`);

--
-- Indexes for table `factuur`
--
ALTER TABLE `factuur`
  ADD PRIMARY KEY (`Factuurnummer`),
  ADD KEY `Klantcode` (`Klantcode`);

--
-- Indexes for table `factuurregel`
--
ALTER TABLE `factuurregel`
  ADD KEY `Factuurnummer` (`Factuurnummer`),
  ADD KEY `Artikelcode` (`Artikelcode`);

--
-- Indexes for table `klant`
--
ALTER TABLE `klant`
  ADD PRIMARY KEY (`Klantcode`);

--
-- Indexes for table `medewerker`
--
ALTER TABLE `medewerker`
  ADD PRIMARY KEY (`Medewerkerscode`);

--
-- Indexes for table `winkel`
--
ALTER TABLE `winkel`
  ADD PRIMARY KEY (`Winkelcode`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `artikel`
--
ALTER TABLE `artikel`
  MODIFY `Artikelcode` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `factuur`
--
ALTER TABLE `factuur`
  MODIFY `Factuurnummer` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `klant`
--
ALTER TABLE `klant`
  MODIFY `Klantcode` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `medewerker`
--
ALTER TABLE `medewerker`
  MODIFY `Medewerkerscode` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `winkel`
--
ALTER TABLE `winkel`
  MODIFY `Winkelcode` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bestelling`
--
ALTER TABLE `bestelling`
  ADD CONSTRAINT `bestelling_ibfk_1` FOREIGN KEY (`Artikelcode`) REFERENCES `artikel` (`Artikelcode`),
  ADD CONSTRAINT `bestelling_ibfk_2` FOREIGN KEY (`Winkelcode`) REFERENCES `winkel` (`Winkelcode`),
  ADD CONSTRAINT `bestelling_ibfk_3` FOREIGN KEY (`Klantcode`) REFERENCES `klant` (`Klantcode`),
  ADD CONSTRAINT `bestelling_ibfk_4` FOREIGN KEY (`Medewerkerscode`) REFERENCES `medewerker` (`Medewerkerscode`);

--
-- Constraints for table `factuur`
--
ALTER TABLE `factuur`
  ADD CONSTRAINT `factuur_ibfk_1` FOREIGN KEY (`Klantcode`) REFERENCES `klant` (`Klantcode`);

--
-- Constraints for table `factuurregel`
--
ALTER TABLE `factuurregel`
  ADD CONSTRAINT `factuurregel_ibfk_1` FOREIGN KEY (`Factuurnummer`) REFERENCES `factuur` (`Factuurnummer`),
  ADD CONSTRAINT `factuurregel_ibfk_2` FOREIGN KEY (`Artikelcode`) REFERENCES `artikel` (`Artikelcode`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
