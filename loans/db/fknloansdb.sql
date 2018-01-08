-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 08, 2018 at 08:36 PM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fknloansdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `CustomerId` int(11) NOT NULL,
  `FirstName` varchar(45) NOT NULL,
  `LastName` varchar(45) NOT NULL,
  `CellNumber` varchar(13) NOT NULL,
  `EmailAddress` varchar(45) NOT NULL,
  `IdNumber` varchar(13) NOT NULL,
  `Location` varchar(45) NOT NULL,
  `Address` varchar(50) NOT NULL,
  `BankName` varchar(45) NOT NULL,
  `AccountNumber` int(11) NOT NULL,
  `BranchCode` varchar(15) NOT NULL,
  `AccountType` varchar(45) NOT NULL,
  `IsActive` int(11) NOT NULL,
  `url` varchar(225) DEFAULT NULL,
  `CreateDate` datetime NOT NULL,
  `CreateUserId` int(11) NOT NULL,
  `ModifyDate` datetime NOT NULL,
  `ModifyUserId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`CustomerId`, `FirstName`, `LastName`, `CellNumber`, `EmailAddress`, `IdNumber`, `Location`, `Address`, `BankName`, `AccountNumber`, `BranchCode`, `AccountType`, `IsActive`, `url`, `CreateDate`, `CreateUserId`, `ModifyDate`, `ModifyUserId`) VALUES
(1, 'John', 'Blake', '27740606060', 'jblake@mail.com', '9207258405005', 'Gauteng', '11 MeetPlace, Main Avenue, Randburg', 'Capitec', 250050250, '255-500', 'Savings', 1, 'http://localhost/git.fknloans/loans/api/uploads/profiles/5.png', '2017-12-26 21:15:30', 1, '2018-01-08 20:04:55', 1),
(2, 'Jane', 'Blake', '27740606060', 'janeb@mail.com', '9207258405005', 'Gauteng', '33 Palace, New Way, Sandton', 'Standard Bank', 250050250, '255-500', 'Gold Cheque Account', 1, 'http://localhost/git.fknloans/loans/api/uploads/profiles/1515437601Logo - Design with writing whitebg.PNG\r\n', '2017-12-26 21:20:31', 1, '2018-01-08 20:53:22', 1),
(3, 'Kenneth', 'Nkosi', '27740606060', 'kennyn@mail.com', '9107258405005', 'Kwa-Zulu Natal', '1 JikaPlace, Jika Avenue, Kwa-Mashu', 'Capitec', 250050250, '255-500', 'Savings', 1, 'http://localhost/git.fknloans/loans/api/uploads/profiles/5.png', '2017-12-26 21:20:43', 1, '2017-12-26 21:20:43', 1),
(4, 'Sam', 'Magwaza', '27740606060', 'magwazasam@mail.com', '9007258405005', 'Kwa-Zulu Natal', '300 Prince Palace, Main Avenue, Umhlanga', 'Bidvest', 250050250, '255-500', 'Savings', 1, 'http://localhost/git.fknloans/loans/api/uploads/profiles/5.png', '2017-12-26 21:20:48', 1, '2017-12-26 21:20:48', 1),
(5, 'David', 'Beckham', '745060658', 'email@mail.com', '920825064005', 'Gauteng', 'Randburg 210 Main', 'BidVest Bank', 5208535, '255-500', 'Savings Account', 1, 'http://localhost/git.fknloans/loans/api/uploads/profiles/5.png', '2018-01-01 12:48:52', 1, '2018-01-06 23:52:55', 1),
(6, 'Jessica', 'Simpson', '745680008', 'jesica@mail.com', '920845520084', 'Kwa-Zulu Natal', 'Mhlanga Unit 3 Ferns', 'Bidvest', 580646358, '300-600', 'Savings', 1, 'http://localhost/git.fknloans/loans/api/uploads/profiles/1515437958Logo.png\r\n', '2018-01-01 12:51:10', 2, '2018-01-08 20:59:19', 1),
(7, 'Freedom', 'Khanyile', '745020506', 'free@mail.com', '', 'Gauteng', 'Randburg, 2101', 'FNB', 450450454, '255-500', 'Gold Cheque', 1, 'http://localhost/git.fknloans/loans/api/uploads/profiles/5.png', '2018-01-02 00:02:32', 1, '2018-01-02 00:02:32', 1),
(8, 'Freedom', 'Khanyile', '745020506', 'free@mail.com', '', 'Gauteng', 'Randburg, 2101', 'FNB', 450450454, '255-500', 'Gold Cheque', 1, 'http://localhost/git.fknloans/loans/api/uploads/profiles/5.png', '2018-01-02 00:04:15', 1, '2018-01-02 00:04:15', 1),
(9, 'Freedom', 'Khanyile', '27746958064', 'freedom@mail.com', '450650425384', 'Gauteng', 'Randburg', 'FNB', 2147483647, '255-500', 'Cheque Account', 1, 'http://localhost/git.fknloans/loans/api/uploads/profiles/5.png', '2018-01-02 00:06:14', 1, '2018-01-02 00:06:14', 1),
(10, 'Sam', 'Smith', '75468208', 'smith@mail.com', '924072524515', 'Cape Town', 'Cape Flats Unit 92', 'BidVest', 2147483647, '222-580', 'Check Savings', 1, 'http://localhost/git.fknloans/loans/api/uploads/profiles/5.png', '2018-01-08 20:56:11', 1, '2018-01-08 20:56:11', 1);

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `DocumentId` int(11) NOT NULL,
  `CustomerId` int(11) NOT NULL,
  `LoanId` int(11) DEFAULT NULL,
  `Description` varchar(45) NOT NULL,
  `Url` int(11) NOT NULL,
  `Status` int(11) NOT NULL,
  `CreateDate` datetime NOT NULL,
  `CreateUserId` int(11) NOT NULL,
  `ModifyDate` datetime NOT NULL,
  `ModifyUserId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `loan`
--

CREATE TABLE `loan` (
  `LoanId` int(11) NOT NULL,
  `CustomerId` int(11) NOT NULL,
  `LoanAmount` decimal(10,0) NOT NULL,
  `PaidAmount` decimal(10,0) NOT NULL,
  `Balance` decimal(10,0) NOT NULL,
  `LoanTerm` varchar(20) NOT NULL,
  `Interest` decimal(10,0) NOT NULL,
  `LoanDate` datetime NOT NULL,
  `Status` int(11) NOT NULL,
  `CreateDate` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `CreateUserId` int(11) NOT NULL,
  `ModifyDate` datetime NOT NULL,
  `ModifyUserId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `loan`
--

INSERT INTO `loan` (`LoanId`, `CustomerId`, `LoanAmount`, `PaidAmount`, `Balance`, `LoanTerm`, `Interest`, `LoanDate`, `Status`, `CreateDate`, `CreateUserId`, `ModifyDate`, `ModifyUserId`) VALUES
(1, 1, '5000', '0', '5000', '3', '0', '2018-01-01 10:55:18', 1, '2018-01-01 10:59:51', 1, '2018-01-01 10:55:18', 1),
(2, 2, '5000', '0', '5000', '3', '0', '2018-01-01 10:56:34', 1, '2018-01-01 10:59:56', 1, '2018-01-01 10:56:34', 1),
(3, 3, '5000', '0', '5000', '3', '0', '2018-01-01 10:56:49', 1, '2018-01-01 11:00:00', 1, '2018-01-01 10:56:49', 1);

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `TransactionId` int(11) NOT NULL,
  `Description` varchar(225) NOT NULL,
  `LoanId` int(11) NOT NULL,
  `CustomerId` int(11) NOT NULL,
  `TransactionDate` datetime NOT NULL,
  `LoanAmount` decimal(10,0) NOT NULL,
  `PayedAmount` decimal(10,0) NOT NULL,
  `Balance` decimal(10,0) NOT NULL,
  `LoanTerm` varchar(225) NOT NULL,
  `Interest` decimal(10,0) NOT NULL,
  `CreateDate` datetime NOT NULL,
  `CreateUserId` int(11) NOT NULL,
  `ModifyDate` datetime NOT NULL,
  `ModifyUserId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UserId` int(11) NOT NULL,
  `UserName` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `Role` int(11) NOT NULL,
  `LastLoginDate` datetime DEFAULT NULL,
  `IsActive` int(11) NOT NULL,
  `EmailAddress` varchar(45) NOT NULL,
  `CreateDate` datetime NOT NULL,
  `CreateUserId` int(11) NOT NULL,
  `ModifyDate` datetime NOT NULL,
  `ModifyUserId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserId`, `UserName`, `Password`, `Role`, `LastLoginDate`, `IsActive`, `EmailAddress`, `CreateDate`, `CreateUserId`, `ModifyDate`, `ModifyUserId`) VALUES
(1, 'admin@mail.com', 'pass', 1, '2018-01-08 21:10:41', 1, 'admin@mail.com', '2017-12-26 00:00:00', 0, '2017-12-26 00:00:00', 0),
(2, 'admin', 'pass', 1, '2018-01-06 23:36:00', 1, 'admin@mail.com', '2017-12-26 00:00:00', 0, '2017-12-26 00:00:00', 0),
(3, 'freedom', 'pass', 1, '2018-01-08 21:34:25', 1, 'freedom@mail.com', '2018-01-08 21:34:06', 1, '2018-01-08 21:34:06', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`CustomerId`);

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`DocumentId`);

--
-- Indexes for table `loan`
--
ALTER TABLE `loan`
  ADD PRIMARY KEY (`LoanId`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`TransactionId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `CustomerId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `DocumentId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loan`
--
ALTER TABLE `loan`
  MODIFY `LoanId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `TransactionId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `UserId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
