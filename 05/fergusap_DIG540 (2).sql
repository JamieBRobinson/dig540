-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 21, 2020 at 10:45 AM
-- Server version: 10.3.25-MariaDB
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fergusap_DIG540`
--

-- --------------------------------------------------------

--
-- Table structure for table `Artist`
--

CREATE TABLE `Artist` (
  `Id` int(8) NOT NULL,
  `Genre` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `Name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Derivative`
--

CREATE TABLE `Derivative` (
  `Id` int(8) NOT NULL,
  `Artist_Id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Date` date NOT NULL,
  `Country` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Recording_ID` int(8) NOT NULL,
  `Description` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Origin`
--

CREATE TABLE `Origin` (
  `Id` int(8) NOT NULL,
  `Date` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `Sheet` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Publisher` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Origin`
--

INSERT INTO `Origin` (`Id`, `Date`, `Sheet`, `Publisher`) VALUES
(1, '1745', 'traditional ', 'Adam Skirving');

-- --------------------------------------------------------

--
-- Table structure for table `Recording`
--

CREATE TABLE `Recording` (
  `Id` int(8) NOT NULL,
  `Artist_Id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Medium` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Description` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Rights_Id` int(11) NOT NULL,
  `Date` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Song`
--

CREATE TABLE `Song` (
  `Id` int(11) NOT NULL,
  `Title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Author` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Origin` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Score_ID` int(8) NOT NULL,
  `Recording_ID` int(8) NOT NULL,
  `Derivative_ID` int(8) NOT NULL,
  `Description` mediumtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Song`
--

INSERT INTO `Song` (`Id`, `Title`, `Author`, `Origin`, `Score_ID`, `Recording_ID`, `Derivative_ID`, `Description`) VALUES
(2, 'Hey, Johnnie Cope, Are Ye Waking Yet?', 'Adam Skirving', '', 1, 0, 0, 'The song commemorates the Battle of Prestonpans, fought on 21 September during the Jacobite rising of 1745. Forces led by the Stuart exile Charles Edward Stuart defeated a government army under Sir John Cope, whose troops broke in the face of a highland charge. The battle lasted less than fifteen minutes and was a huge boost to Jacobite morale, while a heavily mythologised version of the story entered art and legend. Cope and two others were tried by a court-martial in 1746 and exonerated, the court deciding defeat was due to the \'shameful conduct of the private soldiers.\"\r\n\r\nAdam Skirving, a local farmer, visited the battlefield later that afternoon where he was, by his own account, mugged by the victors. He wrote two songs, \"Tranent Muir\" and the better known \"Hey, Johnnie Cope, Are Ye Waking Yet?\", using well-known tunes which still feature in Scottish folk music and bagpipe recitals.');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Artist`
--
ALTER TABLE `Artist`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `Derivative`
--
ALTER TABLE `Derivative`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Recording_ID` (`Id`),
  ADD KEY `Artist_Id` (`Artist_Id`);

--
-- Indexes for table `Origin`
--
ALTER TABLE `Origin`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Country` (`Date`);

--
-- Indexes for table `Recording`
--
ALTER TABLE `Recording`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `D_artist` (`Artist_Id`);

--
-- Indexes for table `Song`
--
ALTER TABLE `Song`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Score_ID` (`Score_ID`),
  ADD UNIQUE KEY `Derivative_ID` (`Derivative_ID`,`Recording_ID`),
  ADD UNIQUE KEY `Recording_ID` (`Recording_ID`),
  ADD KEY `Author` (`Author`),
  ADD KEY `Origin` (`Origin`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Artist`
--
ALTER TABLE `Artist`
  MODIFY `Id` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Derivative`
--
ALTER TABLE `Derivative`
  MODIFY `Id` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Origin`
--
ALTER TABLE `Origin`
  MODIFY `Id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `Recording`
--
ALTER TABLE `Recording`
  MODIFY `Id` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Song`
--
ALTER TABLE `Song`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Derivative`
--
ALTER TABLE `Derivative`
  ADD CONSTRAINT `derivatives` FOREIGN KEY (`Id`) REFERENCES `Song` (`Derivative_ID`);

--
-- Constraints for table `Song`
--
ALTER TABLE `Song`
  ADD CONSTRAINT `Song_ibfk_1` FOREIGN KEY (`Score_ID`) REFERENCES `Origin` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
