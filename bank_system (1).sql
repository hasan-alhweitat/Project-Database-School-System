-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 04, 2021 at 12:35 PM
-- Server version: 5.7.31
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bank_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
CREATE TABLE IF NOT EXISTS `account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(255) NOT NULL,
  `balance` decimal(65,10) NOT NULL,
  `account_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Account_fk_1` (`account_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`id`, `status`, `balance`, `account_type_id`) VALUES
(1, 'current account', '2812.2350000000', 1),
(2, 'current account', '5232.2350000000', 2),
(3, 'current account', '200.2350000000', 3),
(4, 'current account', '10215.2350000000', 1),
(5, 'current account', '3251.2350000000', 1),
(6, 'closed account', '45875.2350000000', 2),
(7, 'current account', '1254.2350000000', 3),
(8, 'closed account', '2000.2350000000', 1),
(9, 'current account', '4521.2350000000', 1),
(10, 'current account', '3654.2350000000', 1),
(11, 'current account', '785.2350000000', 2),
(12, 'current account', '9856.2350000000', 2),
(13, 'closed account', '1542.2350000000', 1),
(14, 'current account', '8745.2350000000', 3),
(15, 'current account', '3525.2350000000', 1);

-- --------------------------------------------------------

--
-- Table structure for table `account_type`
--

DROP TABLE IF EXISTS `account_type`;
CREATE TABLE IF NOT EXISTS `account_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account_type`
--

INSERT INTO `account_type` (`id`, `name`, `description`) VALUES
(1, 'saving', NULL),
(2, 'checking', NULL),
(3, 'money market accounts', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bank`
--

DROP TABLE IF EXISTS `bank`;
CREATE TABLE IF NOT EXISTS `bank` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bank`
--

INSERT INTO `bank` (`id`, `name`) VALUES
(1, 'Al Ittihad Bank');

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
CREATE TABLE IF NOT EXISTS `branch` (
  `id` int(11) NOT NULL,
  `bank_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `country` varchar(200) DEFAULT 'Jordan',
  `city` varchar(150) NOT NULL,
  `street_name` varchar(200) NOT NULL,
  `building_number` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`,`bank_id`),
  UNIQUE KEY `name` (`name`),
  KEY `Branch_fk_1` (`bank_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `branch`
--

INSERT INTO `branch` (`id`, `bank_id`, `name`, `country`, `city`, `street_name`, `building_number`) VALUES
(1, 1, 'Al Ittihad Branch 1', 'Jordan', 'Amman', 'Queen Rania street', 25),
(2, 1, 'Al Ittihad Branch 2', 'Jordan', 'Irbid', 'Alhorieh street', 32),
(3, 1, 'Al Ittihad Branch 3', 'Jordan', 'Salt', 'sixty street', 14);

-- --------------------------------------------------------

--
-- Table structure for table `branch_phone`
--

DROP TABLE IF EXISTS `branch_phone`;
CREATE TABLE IF NOT EXISTS `branch_phone` (
  `branch_id` int(11) NOT NULL,
  `bank_id` int(11) NOT NULL,
  `phone` varchar(15) NOT NULL,
  PRIMARY KEY (`branch_id`,`bank_id`,`phone`),
  KEY `Branch_Phone_fk_2` (`bank_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `branch_phone`
--

INSERT INTO `branch_phone` (`branch_id`, `bank_id`, `phone`) VALUES
(1, 1, '064201286'),
(1, 1, '064203568'),
(2, 1, '054823564'),
(2, 1, '054824712'),
(2, 1, '054827894'),
(3, 1, '082365481');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `birth_date` date DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `bank_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `Customer_fk_1` (`bank_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `first_name`, `last_name`, `birth_date`, `email`, `bank_id`) VALUES
(1, 'Ali', 'Mousa', '1980-12-12', 'ali@gmail.com', 1),
(2, 'Salem', 'Mousa', '1965-01-05', 'salem@gmail.com', 1),
(3, 'Suliman', 'Adel', '1988-06-06', 'suliman@gmail.com', 1),
(4, 'Ali', 'Saleem', '1970-11-11', 'ali2@gmail.com', 1),
(5, 'Naji', 'Taha', '1993-12-12', 'naji@gmail.com', 1),
(6, 'Qamar', 'Mousa', '1992-12-12', 'qamar@gmail.com', 1),
(7, 'Faten', 'Zakaria', '1983-12-12', 'faten@gmail.com', 1),
(8, 'Nasser', 'Mousa', '2000-04-12', 'nasser@gmail.com', 1),
(9, 'Adel', 'Masoud', '1980-12-12', 'adel@gmail.com', 1),
(10, 'Najat', 'Abdullah', '1955-12-12', 'najat@gmail.com', 1);

-- --------------------------------------------------------

--
-- Table structure for table `customer_account`
--

DROP TABLE IF EXISTS `customer_account`;
CREATE TABLE IF NOT EXISTS `customer_account` (
  `customer_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  PRIMARY KEY (`customer_id`,`account_id`),
  KEY `Customer_Account_fk_2` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer_account`
--

INSERT INTO `customer_account` (`customer_id`, `account_id`) VALUES
(1, 1),
(2, 1),
(1, 2),
(2, 3),
(3, 4),
(4, 5),
(5, 6),
(6, 7),
(7, 8),
(8, 9),
(10, 9),
(9, 10),
(10, 11),
(3, 12),
(4, 13),
(8, 14),
(8, 15),
(9, 15);

-- --------------------------------------------------------

--
-- Table structure for table `customer_address`
--

DROP TABLE IF EXISTS `customer_address`;
CREATE TABLE IF NOT EXISTS `customer_address` (
  `customer_id` int(11) NOT NULL,
  `city` varchar(150) NOT NULL,
  `street_name` varchar(200) NOT NULL,
  `building_number` int(4) DEFAULT NULL,
  PRIMARY KEY (`customer_id`,`city`,`street_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer_address`
--

INSERT INTO `customer_address` (`customer_id`, `city`, `street_name`, `building_number`) VALUES
(1, 'Amman', 'street1', 13),
(1, 'Irbid', 'street2', 15),
(2, 'Amman', 'street3', 18),
(2, 'Irbid', 'street4', 20),
(2, 'Jarash', 'street5', 25),
(3, 'Amman', 'street7', 30),
(3, 'Irbid', 'street6', 12),
(4, 'Amman', 'street8', 34),
(5, 'Amman', 'street9', 42),
(6, 'Amman', 'street10', 15),
(7, 'Amman', 'street11', 10),
(8, 'Amman', 'street12', 6),
(9, 'Amman', 'street13', 48),
(10, 'Amman', 'street14', 58);

-- --------------------------------------------------------

--
-- Table structure for table `customer_phone`
--

DROP TABLE IF EXISTS `customer_phone`;
CREATE TABLE IF NOT EXISTS `customer_phone` (
  `customer_id` int(11) NOT NULL,
  `phone` varchar(15) NOT NULL,
  PRIMARY KEY (`customer_id`,`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer_phone`
--

INSERT INTO `customer_phone` (`customer_id`, `phone`) VALUES
(1, '06125424'),
(1, '32652584'),
(2, '42052635'),
(3, '12542555'),
(3, '25264445'),
(3, '74584555'),
(4, '22553125'),
(5, '06458222'),
(6, '12458788'),
(6, '32652525'),
(7, '32652222'),
(8, '06524875'),
(9, '12454777'),
(10, '12525485'),
(10, '1254252');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
CREATE TABLE IF NOT EXISTS `department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `bank_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `department_fk_1` (`branch_id`),
  KEY `department_fk_2` (`bank_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`id`, `name`, `phone`, `branch_id`, `bank_id`) VALUES
(1, 'customer service department', '010', 1, 1),
(2, 'financial department', '020', 1, 1),
(3, 'HR department', '030', 1, 1),
(4, 'customer service department', '010', 2, 1),
(5, 'financial department', '020', 2, 1),
(6, 'HR department', '030', 2, 1),
(7, 'customer service department', '010', 3, 1),
(8, 'financial department', '020', 3, 1),
(9, 'HR department', '030', 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
CREATE TABLE IF NOT EXISTS `employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `salary` decimal(30,7) NOT NULL,
  `password` varchar(100) NOT NULL,
  `level` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `dept_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `employee_fk_1` (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `first_name`, `last_name`, `salary`, `password`, `level`, `email`, `dept_id`) VALUES
(1, 'Ahmad', 'Ali', '800.1200000', 'a@123', 'level 1', 'ahmad.ali@itb.com', 1),
(2, 'Salem', 'Mohammad', '900.1000000', 'm@123', 'level 2', 'salem.mohammad@itb.com', 1),
(3, 'Yehia', 'Ali', '152.1200000', 'y@123', 'level 3', 'yehia.ali@itb.com', 1),
(4, 'Moh', 'Ahmad', '1800.1200000', 'm2@123', 'level 1', 'moh.ahmad@itb.com', 2),
(5, 'Adel', 'Mohammad', '950.1000000', 'a2@123', 'level 2', 'adel.mohammad@itb.com', 2),
(6, 'Mamoun', 'Ali', '152.1200000', 'm3@123', 'level 3', 'mamoun.ali@itb.com', 2),
(7, 'Zaid', 'Ali', '152.1200000', 'z@123', 'level 3', 'zaid.ali@itb.com', 2),
(8, 'lina', 'badawi', '1800.1200000', 'l@123', 'level 1', 'lina.badawi@itb.com', 3),
(9, 'Alia', 'Maitah', '550.1000000', 'a3@123', 'level 2', 'alia.maitah@itb.com', 3),
(10, 'Faisal', 'Shadid', '800.1200000', 'f@123', 'level 1', 'faisal.shadid@itb.com', 4),
(11, 'Elham', 'AbuShetayyah', '900.1000000', 'e@123', 'level 2', 'Elham.AbuShetayyah@itb.com', 4),
(12, 'Omar', 'Saleh', '152.1200000', 'o@123', 'level 3', 'omar.saleh@itb.com', 4),
(13, 'Ramin', 'Nawajaa', '1800.1200000', 'r@123', 'level 1', 'ramin.nawajaa@itb.com', 4),
(14, 'Abdullah', 'Saleh', '950.1000000', 'a4@123', 'level 2', 'abdullah.saleh@itb.com', 5),
(15, 'Hebah', 'Hanandeh', '152.1200000', 'h@123', 'level 3', 'heba.hanandeh@itb.com', 5),
(16, 'Zaid', 'Areda', '152.1200000', 'z2@123', 'level 3', 'zaid.areda@itb.com', 5),
(17, 'lina', 'yousef', '1800.1200000', 'l2@123', 'level 1', 'lina.yousef@itb.com', 6),
(18, 'Yousef', 'Ihsan', '550.1000000', 'a3@123', 'level 2', 'yousef.ihsan@itb.com', 6),
(19, 'Fouad', 'Shamel', '800.1200000', 'f2@123', 'level 1', 'fouad.shamel@itb.com', 7),
(20, 'Elham', 'Da`as', '900.1000000', 'e1@123', 'level 2', 'Elham.daas@itb.com', 7),
(21, 'Omar', 'Yousef', '152.1200000', 'o2@123', 'level 3', 'omar.yousef@itb.com', 8),
(22, 'Rami', 'Hesham', '1800.1200000', 'r2@123', 'level 1', 'rami.hashem@itb.com', 8),
(23, 'Abdullah', 'Nezam', '950.1000000', 'a5@123', 'level 2', 'abdullah.nezam@itb.com', 9),
(24, 'Hebah', 'Esam', '152.1200000', 'h1@123', 'level 3', 'heba.esam@itb.com', 9);

-- --------------------------------------------------------

--
-- Table structure for table `employee_address`
--

DROP TABLE IF EXISTS `employee_address`;
CREATE TABLE IF NOT EXISTS `employee_address` (
  `emp_id` int(11) NOT NULL,
  `city` varchar(150) NOT NULL,
  `street_name` varchar(200) NOT NULL,
  PRIMARY KEY (`emp_id`,`city`,`street_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee_address`
--

INSERT INTO `employee_address` (`emp_id`, `city`, `street_name`) VALUES
(1, 'Amman', 'street1'),
(1, 'Irbid', 'street2'),
(2, 'Amman', 'street3'),
(2, 'Irbid', 'street4'),
(2, 'Jarash', 'street5'),
(3, 'Amman', 'street7'),
(3, 'Irbid', 'street6'),
(4, 'Amman', 'street8'),
(5, 'Amman', 'street9'),
(6, 'Amman', 'street10'),
(7, 'Amman', 'street11'),
(8, 'Amman', 'street12'),
(9, 'Amman', 'street13'),
(10, 'Amman', 'street14'),
(11, 'Amman', 'street15'),
(12, 'Amman', 'street16'),
(13, 'Amman', 'street17'),
(14, 'Amman', 'street18'),
(15, 'Amman', 'street19'),
(16, 'Amman', 'street20'),
(17, 'Amman', 'street21'),
(18, 'Amman', 'street22'),
(19, 'Amman', 'street23'),
(20, 'Amman', 'street24'),
(21, 'Amman', 'street25'),
(22, 'Amman', 'street26'),
(23, 'Amman', 'street27'),
(24, 'Amman', 'street28'),
(24, 'Zarqa', 'street2');

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
CREATE TABLE IF NOT EXISTS `transaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_type` varchar(100) NOT NULL,
  `transaction_date` date NOT NULL,
  `transaction_time` time NOT NULL,
  `emp_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Transaction_fk_1` (`account_id`),
  KEY `Transaction_fk_2` (`emp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`id`, `transaction_type`, `transaction_date`, `transaction_time`, `emp_id`, `account_id`) VALUES
(1, 'credit', '2020-01-01', '08:10:01', 1, 1),
(2, 'credit', '2020-02-03', '10:15:11', 1, 1),
(3, 'debit', '2020-04-01', '12:55:01', 4, 1),
(4, 'credit', '2019-12-12', '23:10:01', 7, 1),
(5, 'debit', '2020-05-06', '03:15:01', 1, 1),
(6, 'credit', '2019-12-12', '23:10:01', 7, 2),
(7, 'debit', '2020-05-06', '03:15:01', 1, 2),
(8, 'credit', '2019-12-12', '23:10:01', 7, 3),
(9, 'debit', '2020-05-06', '03:15:01', 1, 3),
(10, 'credit', '2020-01-01', '08:10:01', 1, 4),
(11, 'credit', '2020-02-03', '10:15:11', 1, 4),
(12, 'debit', '2020-04-01', '12:55:01', 4, 4),
(13, 'credit', '2019-12-12', '23:10:01', 7, 4),
(14, 'debit', '2020-05-06', '03:15:01', 1, 4),
(15, 'credit', '2020-01-01', '08:10:01', 1, 5),
(16, 'credit', '2020-02-03', '10:15:11', 1, 5),
(17, 'debit', '2020-04-01', '12:55:01', 4, 5),
(18, 'credit', '2019-12-12', '23:10:01', 7, 6),
(19, 'debit', '2020-05-06', '03:15:01', 1, 6),
(20, 'debit', '2020-05-06', '03:15:01', 4, 6),
(21, 'credit', '2020-01-01', '09:10:01', 1, 7),
(22, 'credit', '2020-02-03', '10:15:11', 1, 8),
(23, 'debit', '2020-04-01', '12:55:01', 4, 8),
(24, 'credit', '2019-12-12', '23:10:01', 7, 9),
(25, 'debit', '2020-04-13', '03:15:01', 1, 9),
(26, 'credit', '2020-01-01', '06:10:01', 1, 10),
(27, 'credit', '2020-02-03', '10:16:11', 1, 11),
(28, 'debit', '2020-04-01', '12:30:01', 4, 12),
(29, 'credit', '2019-12-12', '20:10:01', 7, 13),
(30, 'debit', '2020-04-13', '03:15:01', 1, 13),
(31, 'credit', '2019-12-12', '23:10:01', 7, 14),
(32, 'debit', '2020-04-15', '05:15:01', 1, 14),
(33, 'credit', '2019-12-12', '13:10:01', 7, 14),
(34, 'debit', '2020-04-13', '03:15:01', 1, 14),
(35, 'credit', '2019-11-11', '21:10:01', 7, 15),
(36, 'debit', '2020-04-13', '03:15:01', 1, 15);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `account`
--
ALTER TABLE `account`
  ADD CONSTRAINT `Account_fk_1` FOREIGN KEY (`account_type_id`) REFERENCES `account_type` (`id`);

--
-- Constraints for table `branch`
--
ALTER TABLE `branch`
  ADD CONSTRAINT `Branch_fk_1` FOREIGN KEY (`bank_id`) REFERENCES `bank` (`id`);

--
-- Constraints for table `branch_phone`
--
ALTER TABLE `branch_phone`
  ADD CONSTRAINT `Branch_Phone_fk_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`),
  ADD CONSTRAINT `Branch_Phone_fk_2` FOREIGN KEY (`bank_id`) REFERENCES `bank` (`id`);

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `Customer_fk_1` FOREIGN KEY (`bank_id`) REFERENCES `bank` (`id`);

--
-- Constraints for table `customer_account`
--
ALTER TABLE `customer_account`
  ADD CONSTRAINT `Customer_Account_fk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  ADD CONSTRAINT `Customer_Account_fk_2` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`);

--
-- Constraints for table `customer_address`
--
ALTER TABLE `customer_address`
  ADD CONSTRAINT `Customer_Address_fk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`);

--
-- Constraints for table `customer_phone`
--
ALTER TABLE `customer_phone`
  ADD CONSTRAINT `Customer_Phone_fk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`);

--
-- Constraints for table `department`
--
ALTER TABLE `department`
  ADD CONSTRAINT `department_fk_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`),
  ADD CONSTRAINT `department_fk_2` FOREIGN KEY (`bank_id`) REFERENCES `bank` (`id`);

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_fk_1` FOREIGN KEY (`dept_id`) REFERENCES `department` (`id`);

--
-- Constraints for table `employee_address`
--
ALTER TABLE `employee_address`
  ADD CONSTRAINT `Employee_Address_fk_1` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`id`);

--
-- Constraints for table `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `Transaction_fk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`),
  ADD CONSTRAINT `Transaction_fk_2` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
