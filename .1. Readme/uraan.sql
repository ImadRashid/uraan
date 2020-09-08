-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 01, 2020 at 08:53 AM
-- Server version: 5.7.29-cll-lve
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hjfbxhev_monies`
--

-- --------------------------------------------------------

--
-- Table structure for table `Department`
--

CREATE TABLE `Department` (
  `depID` int(11) NOT NULL,
  `depName` varchar(30) NOT NULL,
  `depDescription` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Employee`
--

CREATE TABLE `Employee` (
  `empID` int(11) NOT NULL,
  `empCNIC` varchar(30) DEFAULT NULL,
  `empPhone` varchar(30) NOT NULL,
  `empEmail` varchar(30) NOT NULL,
  `empLname` varchar(30) NOT NULL,
  `empFname` varchar(30) NOT NULL,
  `empDOB` varchar(30) DEFAULT NULL,
  `empDept` varchar(30) DEFAULT NULL,
  `empDateOfJoining` varchar(30) DEFAULT NULL,
  `empDateOfLeaving` varchar(30) DEFAULT NULL,
  `empStatus` varchar(30) DEFAULT NULL,
  `empAge` varchar(30) DEFAULT NULL,
  `empAddress` varchar(30) DEFAULT NULL,
  `empCity` varchar(30) DEFAULT NULL,
  `empZIP` int(11) DEFAULT NULL,
  `empCountry` varchar(30) DEFAULT NULL,
  `depID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Employee`
--

INSERT INTO `Employee` (`empID`, `empCNIC`, `empPhone`, `empEmail`, `empLname`, `empFname`, `empDOB`, `empDept`, `empDateOfJoining`, `empDateOfLeaving`, `empStatus`, `empAge`, `empAddress`, `empCity`, `empZIP`, `empCountry`, `depID`) VALUES
(2, NULL, '33532523', 'qasim@gmail.com', 'Khan', 'Qasim', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, NULL, '353453', 'naseem@gmail.com', 'Khan', 'Naeem', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, NULL, '7890123', 'raheela@gmail.com', 'Hassana', 'Raheela', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Task`
--

CREATE TABLE `Task` (
  `taskID` int(11) NOT NULL,
  `taskAdmin` varchar(30) NOT NULL,
  `taskEmployee` varchar(30) NOT NULL,
  `taskDate` varchar(30) DEFAULT NULL,
  `taskDeadline` varchar(30) DEFAULT NULL,
  `taskTitle` varchar(30) NOT NULL,
  `taskDesc` varchar(30) NOT NULL,
  `taskStatus` varchar(30) DEFAULT NULL,
  `userID` int(11) NOT NULL,
  `empID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `User`
--

CREATE TABLE `User` (
  `userID` int(255) NOT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `username` varchar(30) DEFAULT NULL,
  `userpass` varchar(30) NOT NULL,
  `userEmail` varchar(30) NOT NULL,
  `userRecoveryPhone` varchar(30) NOT NULL,
  `userRole` varchar(30) DEFAULT NULL,
  `empID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `User`
--

INSERT INTO `User` (`userID`, `fullname`, `username`, `userpass`, `userEmail`, `userRecoveryPhone`, `userRole`, `empID`) VALUES
(1, 'Imad Rashid', NULL, 'asDF1234', 'admin@admin.com', '1234567890', 'admin', NULL),
(2, 'Muhammad Nasir', NULL, 'tryit987', 'nasir@gmail.com', '03351996734', NULL, NULL),
(3, 'imad', NULL, 'tryit987', 'imad@gmail.com', '03351996723', NULL, NULL),
(11, 'Muhammad Nasir', NULL, 'tryit987', 'nasiruetian.pk@gmail.com', '03351996734', 'admin', NULL),
(12, 'Nakhlah Tanoli', NULL, '11223344', 'nkl123@gmail.com', '090078601', NULL, NULL),
(13, 'Tasmiya Khan', NULL, 'asdf1234', 'tasmiya@gmail.com', '123456', NULL, NULL),
(14, 'Imad', NULL, 'asdf1234', 'mohsin@uraan.com', '1234567890', NULL, NULL),
(18, 'try', NULL, 'asdf1234', 'try@try.com', '1234567890', NULL, NULL),
(19, 'Adil Shahab', NULL, 'asDF1234', 'adilshahab@uraan.com', '1234567890', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Department`
--
ALTER TABLE `Department`
  ADD PRIMARY KEY (`depID`);

--
-- Indexes for table `Employee`
--
ALTER TABLE `Employee`
  ADD PRIMARY KEY (`empID`,`empPhone`,`empEmail`) USING BTREE,
  ADD UNIQUE KEY `empCNIC` (`empCNIC`),
  ADD KEY `depID` (`depID`);

--
-- Indexes for table `Task`
--
ALTER TABLE `Task`
  ADD PRIMARY KEY (`taskID`),
  ADD KEY `userID` (`userID`),
  ADD KEY `empID` (`empID`);

--
-- Indexes for table `User`
--
ALTER TABLE `User`
  ADD PRIMARY KEY (`userID`),
  ADD KEY `empID` (`empID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Department`
--
ALTER TABLE `Department`
  MODIFY `depID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Employee`
--
ALTER TABLE `Employee`
  MODIFY `empID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `Task`
--
ALTER TABLE `Task`
  MODIFY `taskID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `User`
--
ALTER TABLE `User`
  MODIFY `userID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Employee`
--
ALTER TABLE `Employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`depID`) REFERENCES `Department` (`depID`);

--
-- Constraints for table `Task`
--
ALTER TABLE `Task`
  ADD CONSTRAINT `task_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `User` (`userID`),
  ADD CONSTRAINT `task_ibfk_2` FOREIGN KEY (`empID`) REFERENCES `Employee` (`empID`);

--
-- Constraints for table `User`
--
ALTER TABLE `User`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`empID`) REFERENCES `Employee` (`empID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
