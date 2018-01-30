-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 30, 2018 at 11:27 PM
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
  `WorkAddress` varchar(225) NOT NULL,
  `Department` varchar(225) NOT NULL,
  `CallSign` varchar(225) NOT NULL,
  `NOKName` varchar(50) NOT NULL,
  `NOKContactNumber` int(13) NOT NULL,
  `NOKAddress` varchar(255) NOT NULL,
  `CreateDate` datetime NOT NULL,
  `CreateUserId` int(11) NOT NULL,
  `ModifyDate` datetime NOT NULL,
  `ModifyUserId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`CustomerId`, `FirstName`, `LastName`, `CellNumber`, `EmailAddress`, `IdNumber`, `Location`, `Address`, `BankName`, `AccountNumber`, `BranchCode`, `AccountType`, `IsActive`, `url`, `WorkAddress`, `Department`, `CallSign`, `NOKName`, `NOKContactNumber`, `NOKAddress`, `CreateDate`, `CreateUserId`, `ModifyDate`, `ModifyUserId`) VALUES
(1, 'Freedom', 'Khanyile', 2147483647, 'freedom@mail.com', '9250254658051', 'Gauteng', 'Randpark Ridge', 'FNB', 2450084, '20508-5250', 'Cheque', 1, 'http://localhost/git.fknloans/loans/api/uploads/profiles/5.png', 'Randburg', 'IT', 'KHA101', 'laam', 2147483647, 'alex', '2018-01-30 22:50:00', 18011, '2018-01-30 22:50:00', 18011);

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

--
-- Dumping data for table `documents`
--

INSERT INTO `documents` (`DocumentId`, `CustomerId`, `LoanId`, `Description`, `Url`, `Status`, `CreateDate`, `CreateUserId`, `ModifyDate`, `ModifyUserId`) VALUES
(1, 1, 0, 'Proof of ID for Freedom Khanyile', 'http://localhost/git.fknloans/loans/api/uploads/1517345868FN Khanyile ID.pdf\n', 1, '2018-01-30 22:57:49', 18011, '2018-01-30 22:57:49', 18011),
(2, 1, 1, 'Proof Of Payment for Freedom Khanyile', 'http://localhost/git.fknloans/loans/api/uploads/1517349591doc_9.pdf\n', 1, '2018-01-30 23:59:51', 18011, '2018-01-30 23:59:51', 18011),
(3, 1, 2, 'Proof Of Payment for Freedom Khanyile', 'http://localhost/git.fknloans/loans/api/uploads/1517350953doc_11.pdf\n', 1, '2018-01-31 00:22:33', 18011, '2018-01-31 00:22:33', 18011),
(4, 1, 4, 'Proof Of Payment for Freedom Khanyile', 'http://localhost/git.fknloans/loans/api/uploads/1517350968doc_10.pdf\n', 1, '2018-01-31 00:22:48', 18011, '2018-01-31 00:22:48', 18011);

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

--
-- Dumping data for table `loan`
--

INSERT INTO `loan` (`LoanId`, `CustomerId`, `LoanAmount`, `AdditionalLoan`, `PaidLoan`, `PaidInterest`, `Balance`, `AmountPayable`, `MeansOfPayment`, `WOI`, `Interest`, `LoanDate`, `Status`, `Reciever`, `Referrer`, `CreateDate`, `CreateUserId`, `ModifyDate`, `ModifyUserId`) VALUES
(1, 1, '800', '0', '450', '0', '500', '100', 'EFT', 'No', '25', '2018-01-30 22:53:11', 1, 'Capitec', 'Freedom', '2018-01-31 00:19:54', 18011, '2018-01-31 00:19:54', 18011),
(2, 1, '100', '0', '0', '0', '100', '100', 'Cash', 'No', '25', '2018-01-30 23:03:31', 1, '', 'Freedom', '2018-01-31 00:22:34', 18011, '2018-01-31 00:22:34', 18011),
(3, 1, '200', '0', '0', '51', '200', '200', 'Cash', 'No', '25', '2018-01-30 23:12:21', 1, 'FNB', 'Freedom', '2018-01-30 23:12:21', 18011, '2018-01-30 23:12:21', 18011),
(4, 1, '200', '0', '0', '0', '200', '200', 'Cash', 'No', '25', '2018-01-30 23:17:32', 1, '', 'Freedom', '2018-01-31 00:22:49', 18011, '2018-01-31 00:22:49', 18011);

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

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`TransactionId`, `Description`, `LoanId`, `CustomerId`, `TransactionDate`, `LoanAmount`, `PayedAmount`, `Balance`, `LoanTerm`, `Interest`, `WOI`, `MeansOfPayment`, `Referrer`, `Reciever`, `AdditionalLoan`, `PaidInterest`, `CreateDate`, `CreateUserId`, `ModifyDate`, `ModifyUserId`) VALUES
(1, 'New Load deposit', NULL, 1, 'Tuesday 30th of January 2018 09:53:11 PM', '100', '0', '100', '', '25', 'No', 'EFT', 'N/A', 'FNB Bank', '0', '25', '2018-01-30 22:53:11', 18011, 'Tuesday 30th of January 2018 09:53:11 PM', 18011),
(2, 'New Load deposit', NULL, 1, 'Tuesday 30th of January 2018 10:03:31 PM', '100', '0', '100', '', '25', 'No', 'Cash', 'Freedom', 'FNB', '0', '25', '2018-01-30 23:03:31', 18011, 'Tuesday 30th of January 2018 10:03:31 PM', 18011),
(3, 'New Load deposit', NULL, 1, 'Tuesday 30th of January 2018 10:12:21 PM', '200', '0', '200', '', '25', 'No', 'Cash', 'Freedom', 'FNB', '0', '51', '2018-01-30 23:12:21', 18011, 'Tuesday 30th of January 2018 10:12:21 PM', 18011),
(4, 'New Load deposit', NULL, 1, 'Tuesday 30th of January 2018 10:17:33 PM', '200', '0', '200', '', '25', 'No', 'Cash', 'Freedom', 'Capitec', '0', '50', '2018-01-30 23:17:33', 18011, 'Tuesday 30th of January 2018 10:17:33 PM', 18011),
(5, 'Loan Update Transaction', NULL, 1, 'Tuesday 30th of January 2018 10:59:53 PM', '100', '0', '100', '', '25', 'No', '', 'N/A', '', '0', '0', '2018-01-30 23:59:53', 18011, 'Tuesday 30th of January 2018 10:59:53 PM', 18011),
(6, 'Loan Update Transaction', NULL, 1, 'Tuesday 30th of January 2018 11:08:57 PM', '300', '0', '300', '', '25', 'No', '', 'N/A', 'FNB', '200', '50', '2018-01-31 00:08:57', 18011, 'Tuesday 30th of January 2018 11:08:57 PM', 18011),
(7, 'Loan Update Transaction', NULL, 1, 'Tuesday 30th of January 2018 11:09:39 PM', '300', '150', '150', '', '25', 'No', '', 'Freedom', 'Freedom', '0', '0', '2018-01-31 00:09:39', 18011, 'Tuesday 30th of January 2018 11:09:39 PM', 18011),
(8, 'Loan Update Transaction', NULL, 1, 'Tuesday 30th of January 2018 11:12:57 PM', '300', '150', '175', '', '25', 'No', '', 'Freedom', '', '0', '0', '2018-01-31 00:12:57', 18011, 'Tuesday 30th of January 2018 11:12:57 PM', 18011),
(9, 'Loan Update Transaction', NULL, 1, 'Tuesday 30th of January 2018 11:15:10 PM', '800', '150', '800', '', '25', 'No', '', 'Freedom', '', '500', '0', '2018-01-31 00:15:10', 18011, 'Tuesday 30th of January 2018 11:15:10 PM', 18011),
(10, 'Loan Update Transaction', NULL, 1, 'Tuesday 30th of January 2018 11:19:47 PM', '800', '450', '0', '', '25', 'No', '', 'Freedom', 'Capitec', '0', '0', '2018-01-31 00:19:47', 18011, 'Tuesday 30th of January 2018 11:19:47 PM', 18011),
(11, 'Loan Update Transaction', NULL, 1, 'Tuesday 30th of January 2018 11:19:54 PM', '800', '450', '500', '', '25', 'No', '', 'Freedom', 'Capitec', '0', '0', '2018-01-31 00:19:54', 18011, 'Tuesday 30th of January 2018 11:19:54 PM', 18011),
(12, 'Loan Update Transaction', NULL, 1, 'Tuesday 30th of January 2018 11:22:34 PM', '100', '0', '100', '', '25', 'No', '', 'Freedom', '', '0', '0', '2018-01-31 00:22:34', 18011, 'Tuesday 30th of January 2018 11:22:34 PM', 18011),
(13, 'Loan Update Transaction', NULL, 1, 'Tuesday 30th of January 2018 11:22:49 PM', '200', '0', '200', '', '25', 'No', '', 'Freedom', '', '0', '0', '2018-01-31 00:22:49', 18011, 'Tuesday 30th of January 2018 11:22:49 PM', 18011);

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
(18011, 'admin@mail.com', 'pass', 1, '2018-01-31 00:05:47', 1, 'admin@mail.com', 'http://localhost/git.fknloans/loans/api/uploads/profiles/5.png', '2017-12-26 00:00:00', 0, '2017-12-26 00:00:00', 0),
(18012, 'freedom', 'pass', 1, '2018-01-27 17:13:46', 1, 'freedom@mail.com', 'http://localhost/git.fknloans/loans/api/uploads/profiles/5.png', '2018-01-27 17:12:58', 18011, '2018-01-27 17:13:39', 18012);

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
  MODIFY `CustomerId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `DocumentId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `loan`
--
ALTER TABLE `loan`
  MODIFY `LoanId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `TransactionId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `UserId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18013;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
