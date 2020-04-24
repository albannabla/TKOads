-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 24, 2020 at 10:28 AM
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
-- Database: `tkoads`
--

-- --------------------------------------------------------

--
-- Table structure for table `Propertyhk`
--

CREATE TABLE `Propertyhk` (
  `Id` int(3) NOT NULL,
  `Date` date NOT NULL,
  `Ref` text NOT NULL,
  `Area` text NOT NULL,
  `Price` float NOT NULL,
  `Pricepersft` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Propertyhk`
--

INSERT INTO `Propertyhk` (`Id`, `Date`, `Ref`, `Area`, `Price`, `Pricepersft`) VALUES
(3019, '2020-04-23', 'CW7172591F', '737', 12.5, 16282.2),
(3020, '2020-04-23', 'CW7172377F', '429', 7.4, 16317),
(3021, '2020-04-23', 'B7996085', '429', 8.1, 18648),
(3022, '2020-04-23', 'B7967464', '428', 8.1, 18691.6),
(3023, '2020-04-23', 'B7967442', '417', 7.6, 16786.6),
(3024, '2020-04-23', 'B7885791', '454', 25, 55066.1),
(3025, '2020-04-23', 'B7953057', '414', 8.4, 19323.7),
(3026, '2020-04-23', 'B7857304', '1186', 12.5, 10118),
(3027, '2020-04-23', 'B7875430', '470', 8.1, 17021.3),
(3028, '2020-04-22', 'CWF172591F', '737', 7.4, 9497.96),
(3029, '2020-04-20', 'CW8172377F', '429', 8.1, 18648),
(3051, '2020-04-24', 'B7907713', '417', 8.1, 19184.7),
(3054, '2020-04-24', 'B7884198', '428', 7.4, 16355.1),
(3056, '2020-04-24', 'CW0172099F', '476', 8.1, 16806.7),
(3057, '2020-04-24', 'B7883505', '454', 8.1, 17621.1),
(3059, '2020-04-24', 'B7952269', '414', 7.6, 16908.2),
(3061, '2020-04-24', 'CW0172591F', '737', 12.5, 16282.2),
(3064, '2020-04-24', 'B7876677', '470', 8.4, 17021.3),
(3065, '2020-04-24', 'B7857522', '1186', 25, 21079.3),
(3066, '2020-04-23', 'B7910802', '417', 8.1, 19184.7),
(3067, '2020-04-23', 'B7967502', '414', 7.6, 16908.2),
(3068, '2020-04-23', 'B7884325', '428', 7.4, 16355.1),
(3069, '2020-04-23', 'B7883506', '454', 8.1, 17621.1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Propertyhk`
--
ALTER TABLE `Propertyhk`
  ADD KEY `Id` (`Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Propertyhk`
--
ALTER TABLE `Propertyhk`
  MODIFY `Id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3070;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
