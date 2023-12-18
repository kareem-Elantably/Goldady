-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: mysql
-- Generation Time: Dec 18, 2023 at 01:19 PM
-- Server version: 10.5.8-MariaDB-1:10.5.8+maria~focal
-- PHP Version: 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `goldady`
--

-- --------------------------------------------------------

--
-- Table structure for table `golds`
--

CREATE TABLE `golds` (
  `GoldID` int(11) NOT NULL,
  `Karat` int(11) DEFAULT NULL,
  `Type` varchar(10) DEFAULT NULL,
  `SafeID` int(11) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `golds`
--

INSERT INTO `golds` (`GoldID`, `Karat`, `Type`, `SafeID`, `Price`) VALUES
(1, 18, 'external', 2, 5000.00),
(2, 21, 'external', 2, 5000.00),
(3, 24, 'external', 2, 5000.00),
(4, 24, 'internal', 1, 5000.00),
(5, 21, 'internal', 1, 5000.00),
(6, 18, 'internal', 1, 5000.00);

-- --------------------------------------------------------

--
-- Table structure for table `safes`
--

CREATE TABLE `safes` (
  `SafeID` int(11) NOT NULL,
  `Type` varchar(10) DEFAULT NULL,
  `Capacity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `safes`
--

INSERT INTO `safes` (`SafeID`, `Type`, `Capacity`) VALUES
(1, 'internal', 50000),
(2, 'external', 49500);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `TransactionID` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `GoldID` int(11) DEFAULT NULL,
  `SafeID` int(11) DEFAULT NULL,
  `TransactionType` varchar(10) DEFAULT NULL,
  `Date` datetime DEFAULT NULL,
  `Weight` decimal(10,2) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`TransactionID`, `UserID`, `GoldID`, `SafeID`, `TransactionType`, `Date`, `Weight`, `Price`) VALUES
(1, 1, 1, 1, 'buy', '2023-02-02 00:00:00', 50.00, 5000.00),
(2, 1, 1, 1, 'sell', '2023-02-02 00:00:00', 50.00, 5000.00),
(3, 1, 1, 1, 'buy', '2023-02-02 00:00:00', 500.00, 5000.00),
(4, 1, 1, 1, 'transfer', '2023-02-02 00:00:00', 500.00, 5000.00);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UserID` int(11) NOT NULL,
  `Username` varchar(50) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `TotalAmount` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserID`, `Username`, `Email`, `TotalAmount`) VALUES
(1, 'kareem', 'kelantably2019@gmail.com', 50.00),
(2, 'kareem2', 'kelantably2019@gmail.com', 500.00);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `golds`
--
ALTER TABLE `golds`
  ADD PRIMARY KEY (`GoldID`),
  ADD KEY `SafeID` (`SafeID`);

--
-- Indexes for table `safes`
--
ALTER TABLE `safes`
  ADD PRIMARY KEY (`SafeID`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`TransactionID`),
  ADD KEY `UserID` (`UserID`),
  ADD KEY `GoldID` (`GoldID`),
  ADD KEY `SafeID` (`SafeID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `golds`
--
ALTER TABLE `golds`
  MODIFY `GoldID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `TransactionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `golds`
--
ALTER TABLE `golds`
  ADD CONSTRAINT `golds_ibfk_1` FOREIGN KEY (`SafeID`) REFERENCES `safes` (`SafeID`);

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`),
  ADD CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`GoldID`) REFERENCES `golds` (`GoldID`),
  ADD CONSTRAINT `transactions_ibfk_3` FOREIGN KEY (`SafeID`) REFERENCES `safes` (`SafeID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
