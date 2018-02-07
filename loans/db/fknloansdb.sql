-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 07, 2018 at 07:34 PM
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
  `CellNumber` int(13) NOT NULL,
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
  `EmployerName` varchar(225) DEFAULT NULL,
  `EmployerCellNumber` int(13) DEFAULT NULL,
  `WorkAddress` varchar(225) NOT NULL,
  `Department` varchar(225) NOT NULL,
  `CallSign` varchar(225) NOT NULL,
  `stationedarea` varchar(225) DEFAULT NULL,
  `NOKName` varchar(50) NOT NULL,
  `NOKContactNumber` int(13) NOT NULL,
  `NOKAddress` varchar(255) NOT NULL,
  `CreateDate` datetime NOT NULL,
  `CreateUserId` int(11) NOT NULL,
  `ModifyDate` datetime NOT NULL,
  `ModifyUserId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `DocumentId` int(11) NOT NULL,
  `CustomerId` int(11) NOT NULL,
  `LoanId` int(11) DEFAULT NULL,
  `Description` varchar(45) NOT NULL,
  `Url` varchar(225) NOT NULL,
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
  `LoanAmount` decimal(50,0) NOT NULL,
  `AdditionalLoan` decimal(50,0) NOT NULL,
  `PaidLoan` decimal(50,0) NOT NULL,
  `PaidInterest` decimal(50,0) NOT NULL,
  `Balance` decimal(50,0) NOT NULL,
  `AmountPayable` decimal(50,0) NOT NULL,
  `MeansOfPayment` varchar(25) NOT NULL,
  `WOI` varchar(10) NOT NULL,
  `Interest` decimal(10,0) NOT NULL,
  `LoanDate` datetime NOT NULL,
  `Status` int(11) NOT NULL,
  `Reciever` varchar(225) DEFAULT NULL,
  `Referrer` varchar(225) DEFAULT NULL,
  `CreateDate` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `CreateUserId` int(11) NOT NULL,
  `ModifyDate` datetime NOT NULL,
  `ModifyUserId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `TransactionId` int(11) NOT NULL,
  `Description` varchar(225) NOT NULL,
  `LoanId` int(11) DEFAULT NULL,
  `CustomerId` int(11) NOT NULL,
  `TransactionDate` text NOT NULL,
  `LoanAmount` decimal(10,0) NOT NULL,
  `PayedAmount` decimal(10,0) NOT NULL,
  `Balance` decimal(10,0) NOT NULL,
  `LoanTerm` varchar(225) NOT NULL,
  `Interest` decimal(10,0) NOT NULL,
  `WOI` varchar(255) NOT NULL,
  `MeansOfPayment` varchar(255) NOT NULL,
  `Referrer` varchar(255) DEFAULT NULL,
  `Reciever` text,
  `AdditionalLoan` decimal(10,0) DEFAULT NULL,
  `PaidInterest` decimal(10,0) NOT NULL,
  `CreateDate` text NOT NULL,
  `CreateUserId` int(11) NOT NULL,
  `ModifyDate` text NOT NULL,
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
  `url` varchar(225) NOT NULL,
  `CreateDate` datetime NOT NULL,
  `CreateUserId` int(11) NOT NULL,
  `ModifyDate` datetime NOT NULL,
  `ModifyUserId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserId`, `UserName`, `Password`, `Role`, `LastLoginDate`, `IsActive`, `EmailAddress`, `url`, `CreateDate`, `CreateUserId`, `ModifyDate`, `ModifyUserId`) VALUES
(18011, 'admin@mail.com', 'pass', 1, '2018-02-06 23:43:08', 1, 'admin@mail.com', 'http://localhost/git.fknloans/loans/api/uploads/profiles/5.png', '2017-12-26 00:00:00', 0, '2017-12-26 00:00:00', 0),
(18012, 'freedom', 'pass', 1, '2018-01-27 17:13:46', 0, 'freedom@mail.com', 'http://localhost/git.fknloans/loans/api/uploads/profiles/5.png', '2018-01-27 17:12:58', 18011, '2018-02-07 20:15:08', 18011);

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
  MODIFY `CustomerId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `DocumentId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loan`
--
ALTER TABLE `loan`
  MODIFY `LoanId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `TransactionId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `UserId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18013;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
