-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 25, 2018 at 08:46 PM
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
(1, 'Freedom', 'Khanyile', '7469580564', 'freedom@ndu-systems.net', '9250560420008', 'Gauteng', 'Randburg', 'FNB', 2305458, '255-305', 'Savings', 1, 'http://localhost/git.fknloans/loans/api/uploads/profiles/1516651110pic.jpg\n', '2018-01-22 20:48:19', 1, '2018-01-22 21:58:33', 1),
(2, 'Ndumiso', 'Mthembu', '27746050808', 'ndumiso@ndu-systems.net', '925005086064', 'Gauteng', 'Johanessburg', 'FNB', 250466084, '255-2508', 'Cheque', 1, 'http://localhost/git.fknloans/loans/api/uploads/profiles/5.png', '2018-01-22 20:52:05', 1, '2018-01-22 20:52:05', 1);

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
(1, 1, 1, 'Proof Of Payment for Freedom Khanyile', 'http://localhost/git.fknloans/loans/api/uploads/151664700920170207095229681.pdf\n', 1, '2018-01-22 20:50:09', 1, '2018-01-22 20:50:09', 1),
(2, 2, 2, 'Proof Of Payment for Ndumiso Mthembu', 'http://localhost/git.fknloans/loans/api/uploads/151664725620170207095229681.pdf\n', 1, '2018-01-22 20:54:16', 1, '2018-01-22 20:54:16', 1),
(3, 1, 0, 'Proof Of ID for Freedom Khanyile', 'http://localhost/git.fknloans/loans/api/uploads/1516651371pic.jpg\n', 1, '2018-01-22 22:02:51', 1, '2018-01-22 22:02:51', 1),
(4, 1, 3, 'Proof Of Payment for Freedom Khanyile', 'http://localhost/git.fknloans/loans/api/uploads/1516653522coh_npc_profile.pdf\n', 1, '2018-01-22 22:38:42', 1, '2018-01-22 22:38:42', 1),
(5, 0, 0, '', '', 0, '2018-01-22 23:30:42', 0, '2018-01-22 23:30:42', 0),
(6, 2, 4, 'Proof Of Payment for Ndumiso Mthembu', 'http://localhost/git.fknloans/loans/api/uploads/1516656642coh_npc_profile.pdf\n', 1, '2018-01-22 23:30:42', 1, '2018-01-22 23:30:42', 1);

-- --------------------------------------------------------

--
-- Table structure for table `loan`
--

CREATE TABLE `loan` (
  `LoanId` int(11) NOT NULL,
  `CustomerId` int(11) NOT NULL,
  `LoanAmount` decimal(50,0) NOT NULL,
  `PaidAmount` decimal(50,0) NOT NULL,
  `Balance` decimal(50,0) NOT NULL,
  `AmountPayable` decimal(50,0) NOT NULL,
  `LoanTerm` int(10) NOT NULL,
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

INSERT INTO `loan` (`LoanId`, `CustomerId`, `LoanAmount`, `PaidAmount`, `Balance`, `AmountPayable`, `LoanTerm`, `Interest`, `LoanDate`, `Status`, `CreateDate`, `CreateUserId`, `ModifyDate`, `ModifyUserId`) VALUES
(1, 1, '3000', '300', '3000', '3300', 6, '10', '2018-01-22 20:49:56', 1, '2018-01-22 22:36:40', 1, '2018-01-22 22:36:40', 1),
(2, 2, '2500', '0', '2750', '2750', 3, '10', '2018-01-22 20:53:50', 1, '2018-01-22 20:54:18', 1, '2018-01-22 20:54:18', 1),
(3, 1, '1000', '200', '1000', '1200', 6, '20', '2018-01-22 22:38:06', 1, '2018-01-22 22:58:46', 1, '2018-01-22 22:58:46', 1),
(4, 2, '5000', '2000', '4000', '6000', 6, '20', '2018-01-22 23:30:22', 1, '2018-01-22 23:31:18', 1, '2018-01-22 23:31:18', 1);

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `TransactionId` int(11) NOT NULL,
  `Description` varchar(225) NOT NULL,
  `LoanId` int(11) NOT NULL,
  `CustomerId` int(11) NOT NULL,
  `TransactionDate` text NOT NULL,
  `LoanAmount` decimal(10,0) NOT NULL,
  `PayedAmount` decimal(10,0) NOT NULL,
  `Balance` decimal(10,0) NOT NULL,
  `LoanTerm` varchar(225) NOT NULL,
  `Interest` decimal(10,0) NOT NULL,
  `CreateDate` text NOT NULL,
  `CreateUserId` int(11) NOT NULL,
  `ModifyDate` text NOT NULL,
  `ModifyUserId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`TransactionId`, `Description`, `LoanId`, `CustomerId`, `TransactionDate`, `LoanAmount`, `PayedAmount`, `Balance`, `LoanTerm`, `Interest`, `CreateDate`, `CreateUserId`, `ModifyDate`, `ModifyUserId`) VALUES
(1, 'New Load deposit', 100, 1, 'Monday 22nd of January 2018 07:49:56 PM', '3000', '0', '3300', '6', '10', '2018-01-22 20:49:56', 1, 'Monday 22nd of January 2018 07:49:56 PM', 1),
(2, 'New Load deposit', 100, 2, 'Monday 22nd of January 2018 07:53:50 PM', '2500', '0', '2750', '3', '10', '2018-01-22 20:53:50', 1, 'Monday 22nd of January 2018 07:53:50 PM', 1),
(3, 'New Load deposit', 100, 1, 'Monday 22nd of January 2018 09:38:07 PM', '1000', '0', '1200', '6', '20', '2018-01-22 22:38:07', 1, 'Monday 22nd of January 2018 09:38:07 PM', 1),
(4, 'Loan Update Transaction', 3, 1, 'Monday 22nd of January 2018 09:58:46 PM', '1000', '200', '1000', '6', '20', '2018-01-22 22:58:46', 1, 'Monday 22nd of January 2018 09:58:46 PM', 1),
(5, 'New Load deposit', 0, 2, 'Monday 22nd of January 2018 10:30:22 PM', '5000', '0', '6000', '6', '20', '2018-01-22 23:30:22', 1, 'Monday 22nd of January 2018 10:30:22 PM', 1),
(6, 'Loan Update Transaction', 4, 2, 'Monday 22nd of January 2018 10:30:44 PM', '5000', '0', '6000', '6', '20', '2018-01-22 23:30:44', 1, 'Monday 22nd of January 2018 10:30:44 PM', 1),
(7, 'Loan Update Transaction', 4, 2, 'Monday 22nd of January 2018 10:31:18 PM', '5000', '2000', '4000', '6', '20', '2018-01-22 23:31:18', 1, 'Monday 22nd of January 2018 10:31:18 PM', 1);

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
(1, 'admin@mail.com', 'pass', 1, '2018-01-22 23:56:22', 1, 'admin@mail.com', 'http://localhost/git.fknloans/loans/api/uploads/profiles/5.png', '2017-12-26 00:00:00', 0, '2017-12-26 00:00:00', 0),
(2, 'admin', 'pass', 1, '2018-01-06 23:36:00', 1, 'admin@mail.com', 'http://localhost/git.fknloans/loans/api/uploads/profiles/5.png', '2017-12-26 00:00:00', 0, '2017-12-26 00:00:00', 0),
(3, 'freedom', 'pass', 1, '2018-01-08 22:32:41', 1, 'freedom@mail.com', 'http://localhost/git.fknloans/loans/api/uploads/profiles/5.png', '2018-01-08 21:34:06', 1, '2018-01-08 21:34:06', 1),
(4, 'King', 'pass', 1, '2018-01-11 19:10:06', 1, 'king@mail.com', 'http://localhost/git.fknloans/loans/api/uploads/profiles/5.png', '2018-01-08 22:36:06', 3, '2018-01-09 00:01:32', 4),
(5, 'systemuser', 'pass', 1, '2018-01-10 05:53:48', 1, 'systemuser@mail.com', 'http://localhost/git.fknloans/loans/api/uploads/profiles/5.png', '2018-01-09 00:02:14', 4, '2018-01-09 00:02:36', 5),
(6, 'ndu@ndu-systems.net', 'pass', 1, '2018-01-22 21:01:34', 1, 'ndu@ndu-systems.net', 'http://localhost/git.fknloans/loans/api/uploads/profiles/5.png', '2018-01-22 21:00:55', 1, '2018-01-22 21:01:18', 6);

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
  MODIFY `CustomerId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `DocumentId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `loan`
--
ALTER TABLE `loan`
  MODIFY `LoanId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `TransactionId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `UserId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
