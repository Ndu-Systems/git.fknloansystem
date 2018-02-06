-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 06, 2018 at 10:45 PM
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

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`CustomerId`, `FirstName`, `LastName`, `CellNumber`, `EmailAddress`, `IdNumber`, `Location`, `Address`, `BankName`, `AccountNumber`, `BranchCode`, `AccountType`, `IsActive`, `url`, `EmployerName`, `EmployerCellNumber`, `WorkAddress`, `Department`, `CallSign`, `stationedarea`, `NOKName`, `NOKContactNumber`, `NOKAddress`, `CreateDate`, `CreateUserId`, `ModifyDate`, `ModifyUserId`) VALUES
(1, 'Freedom', 'Khanyile', 2147483647, 'freedom@mail.com', '9250254658051', 'Gauteng', 'Randpark Ridge', 'FNB', 2450084, '20508-5250', 'Cheque', 1, 'http://localhost/git.fknloans/loans/api/uploads/profiles/5.png', 'Multichoice', 0, 'Randburg', 'IT', 'KHA101', 'Mtateni', 'laam', 2147483647, 'alex', '2018-01-30 22:50:00', 18011, '2018-02-05 21:28:40', 18011),
(2, 'Maria', 'Jackson', 2147483640, 'Maria@mail.com', '240587166752', 'Kwa-Zulu Natal', 'Kwamashu', 'FNB', 2147483647, '500-505', 'Savings', 0, 'http://localhost/git.fknloans/loans/api/uploads/profiles/5.png', 'Multichoice', 2147483647, 'Station, Shoprite', 'Security', '1002', 'mtateni', 'Maxwel', 2147483647, 'Jackson', '2018-02-03 21:59:00', 18011, '2018-02-03 23:09:32', 18011),
(3, 'Xolani', 'Ngcobo', 2147483647, 'xolani@mail.com', '9280842580084', 'Kwa-Zulu Natal', 'Parking Hill', 'Capitec', 250804, '500-000', 'Savings', 1, 'http://localhost/git.fknloans/loans/api/uploads/profiles/5.png', 'Multichoice', 2147483647, 'Rosebank', 'Fishing, Docs', '2500', 'Mtateni', 'Musa Ngcobo', 2147483647, 'Kwa-Mashu', '2018-02-04 21:52:29', 18011, '2018-02-04 21:52:29', 18011),
(4, 'Lamlile', 'Magwaza', 2147483647, 'laam@mail.com', '9258066485008', 'Kwa-Zulu Natal', 'Nanda', 'Bidvest', 443008584, '500-580', 'Cheque', 1, 'http://localhost/git.fknloans/loans/api/uploads/profiles/5.png', 'Mr Price', 2147483647, 'Durban Umngeni', 'CEO', 'KH!01', 'Umlazi', 'Freedom Nduduzo', 2147483647, 'Nanda', '2018-02-05 20:18:15', 18011, '2018-02-05 21:38:46', 18011),
(5, 'Test', 'User', 277558056, 'email@mail.com', '8400744585666', 'KXN', 'Mash', 'KNM', 256658845, '55055', 'Savings', 1, NULL, 'Jet', 277585503, 'Mashu', 'Cashier', 'M3454', 'NewTown', 'Freedo', 27745058, 'Nanda', '2018-02-06 23:37:00', 1, '2018-02-06 23:37:00', 1),
(6, 'Test', 'User', 277558056, 'email@mail.com', '8400744585666', 'KXN', 'Mash', 'KNM', 256658845, '55055', 'Savings', 1, NULL, 'Jet', 277585503, 'Mashu', 'Cashier', 'M3454', 'NewTown', 'Freedo', 27745058, 'Nanda', '2018-02-06 23:39:24', 1, '2018-02-06 23:39:24', 1),
(7, 'Test', 'User', 277558056, 'email@mail.com', '8400744585666', 'KXN', 'Mash', 'KNM', 256658845, '55055', 'Savings', 1, NULL, 'Jet', 277585503, 'Mashu', 'Cashier', 'M3454', 'NewTown', 'Freedo', 27745058, 'Nanda', '2018-02-06 23:39:31', 1, '2018-02-06 23:39:31', 1),
(8, 'Test', 'User', 277558056, 'email@mail.com', '8400744585666', 'KXN', 'Mash', 'KNM', 256658845, '55055', 'Savings', 1, NULL, 'Jet', 277585503, 'Mashu', 'Cashier', 'M3454', 'NewTown', 'Freedo', 27745058, 'Nanda', '2018-02-06 23:39:37', 1, '2018-02-06 23:39:37', 1),
(9, 'Test', 'User', 277558056, 'email@mail.com', '8400744585666', 'KXN', 'Mash', 'KNM', 256658845, '55055', 'Savings', 1, NULL, 'Jet', 277585503, 'Mashu', 'Cashier', 'M3454', 'NewTown', 'Freedo', 27745058, 'Nanda', '2018-02-06 23:39:41', 1, '2018-02-06 23:39:41', 1),
(10, 'Test', 'User', 277558056, 'email@mail.com', '8400744585666', 'KXN', 'Mash', 'KNM', 256658845, '55055', 'Savings', 1, NULL, 'Jet', 277585503, 'Mashu', 'Cashier', 'M3454', 'NewTown', 'Freedo', 27745058, 'Nanda', '2018-02-06 23:39:46', 1, '2018-02-06 23:39:46', 1),
(11, 'Test', 'User', 277558056, 'email@mail.com', '8400744585666', 'KXN', 'Mash', 'KNM', 256658845, '55055', 'Savings', 1, NULL, 'Jet', 277585503, 'Mashu', 'Cashier', 'M3454', 'NewTown', 'Freedo', 27745058, 'Nanda', '2018-02-06 23:39:54', 1, '2018-02-06 23:39:54', 1),
(12, 'Test', 'User', 277558056, 'email@mail.com', '8400744585666', 'KXN', 'Mash', 'KNM', 256658845, '55055', 'Savings', 1, NULL, 'Jet', 277585503, 'Mashu', 'Cashier', 'M3454', 'NewTown', 'Freedo', 27745058, 'Nanda', '2018-02-06 23:40:00', 1, '2018-02-06 23:40:00', 1),
(13, 'Test', 'User1', 277558056, 'email@mail.com', '8400744585666', 'KXN', 'Mash', 'KNM', 256658845, '55055', 'Savings', 1, NULL, 'Jet', 277585503, 'Mashu', 'Cashier', 'M3454', 'NewTown', 'Freedo', 27745058, 'Nanda', '2018-02-06 23:40:04', 1, '2018-02-06 23:43:44', 18011);

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
(1, 4, 0, 'ID Copy for Lamlile Magwaza', 'http://localhost/git.fknloans/loans/api/uploads/151785978439651821-developer-wallpapers.jpg\n', 1, '2018-02-05 21:43:04', 18011, '2018-02-05 21:43:04', 18011);

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
(1, 1, '1000', '0', '500', '0', '550', '500', 'EFT', 'Yes', '0', '2018-02-01 21:53:31', 1, 'FNB Bank', 'Max', '2018-02-02 22:50:38', 18011, '2018-02-02 22:50:38', 18011),
(2, 1, '300', '0', '0', '75', '300', '300', 'Cash', 'No', '25', '2018-02-01 22:27:07', 0, 'Muzi', 'Khaye', '2018-02-01 22:38:15', 18011, '2018-02-01 22:38:15', 18011),
(3, 1, '100', '0', '0', '25', '100', '100', 'Cash', 'No', '25', '2018-02-02 23:52:15', 1, 'Magwaza', 'Patrick', '2018-02-04 12:53:52', 18011, '2018-02-02 23:52:15', 18011);

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
(1, 'New Load deposit', NULL, 1, 'Thursday 1st of February 2018 08:53:31 PM', '500', '0', '500', '', '0', 'Yes', 'EFT', 'Max', 'FNB', '0', '0', '2018-02-01 21:53:31', 18011, 'Thursday 1st of February 2018 08:53:31 PM', 18011),
(2, 'Loan Update ', NULL, 1, 'Thursday 1st of February 2018 09:14:54 PM', '1000', '0', '1050', '', '0', 'Yes', '', 'Max', 'Capitec', '500', '125', '2018-02-01 22:14:54', 18011, 'Thursday 1st of February 2018 09:14:54 PM', 18011),
(3, 'New Load deposit', NULL, 1, 'Thursday 1st of February 2018 09:27:08 PM', '300', '0', '300', '', '25', 'No', 'Cash', 'Khaye', 'Muzi', '0', '75', '2018-02-01 22:27:08', 18011, 'Thursday 1st of February 2018 09:27:08 PM', 18011),
(4, 'Loan Update', NULL, 1, 'Friday 2nd of February 2018 09:50:20 PM', '1000', '500', '550', '', '0', 'Yes', '', 'Max', '', '0', '0', '2018-02-02 22:50:20', 18011, 'Friday 2nd of February 2018 09:50:20 PM', 18011),
(5, 'Loan Update', NULL, 1, 'Friday 2nd of February 2018 09:50:38 PM', '1000', '500', '550', '', '0', 'Yes', '', 'Max', 'FNB Bank', '0', '0', '2018-02-02 22:50:38', 18011, 'Friday 2nd of February 2018 09:50:38 PM', 18011),
(6, 'New Load deposit', NULL, 1, 'Friday 2nd of February 2018 10:52:15 PM', '100', '0', '100', '', '25', 'No', 'Cash', 'Patrick', 'Magwaza', '0', '25', '2018-02-02 23:52:15', 18011, 'Friday 2nd of February 2018 10:52:15 PM', 18011);

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
  MODIFY `CustomerId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `DocumentId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `loan`
--
ALTER TABLE `loan`
  MODIFY `LoanId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `TransactionId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `UserId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18013;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
