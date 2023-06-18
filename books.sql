-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 06, 2023 at 07:54 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `books`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `ISBN` char(13) NOT NULL,
  `Title` char(100) NOT NULL,
  `Author` char(100) DEFAULT NULL,
  `Price` float(4,2) DEFAULT NULL,
  `Book_Cover` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`ISBN`, `Title`, `Author`, `Price`, `Book_Cover`) VALUES
('0-13-312945-4', 'Starting Out With Visual C Sharp', 'Tonny Gaddis', 20.99, '../uploads/starting out with C sharp.jpg'),
('123-44-3122', 'Java How To Program', 'Dietel Hurvey', 34.00, '../uploads/cover image.jpg'),
('129-342-12221', 'PHP Laura And William', 'Laura', 20.00, '../uploads/PHP.jpg'),
('13-4698-46158', 'Starting Out With Python 5th ED', 'Tonny Gaddis', 29.00, '../uploads/cover python.jpg'),
('13-8589-52599', 'Internet And WWW How To Program', 'Paul Ditel', 30.00, '../uploads/cover image.jpg'),
('189-332-1642', 'Introduction to java programming', 'Daniel Liang', 15.00, '../uploads/javaprogramming.jpg'),
('978-0-470-540', 'Beginning With HTML,XHTML,JavaScript And Css', 'Jon Duket', 15.99, '../uploads/web html css js.jpg'),
('978-1-78883', 'Python GUI Programming With Tkinter', 'Alan D.Moore', 13.00, '../uploads/python gui.jpg'),
('ISBN-190-545-', 'Database Development', 'Thomas Collony', 99.99, '../uploads/database systems.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `book_reviews`
--

CREATE TABLE `book_reviews` (
  `ISBN` char(13) NOT NULL,
  `Review` text DEFAULT NULL,
  `stars` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `CustomerID` int(10) UNSIGNED NOT NULL,
  `Name` char(50) NOT NULL,
  `Address` char(100) NOT NULL,
  `City` char(30) NOT NULL,
  `Phone` varchar(15) NOT NULL,
  `EMail` varchar(50) NOT NULL,
  `Password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`CustomerID`, `Name`, `Address`, `City`, `Phone`, `EMail`, `Password`) VALUES
(1, 'Abel Mesay', 'Mauritius Street', 'Addis Ababa', '0951078852', 'abelmesay49@gmail.com', ''),
(2, 'Robel Michael', 'Gambia Street', 'Addis Ababa', '0987303695', 'abelmesay830@gmail.com', '');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `OrderID` int(10) UNSIGNED NOT NULL,
  `CustomerID` int(10) UNSIGNED NOT NULL,
  `Amount` float(6,2) DEFAULT NULL,
  `ODate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`OrderID`, `CustomerID`, `Amount`, `ODate`) VALUES
(1, 1, 1.00, '0000-00-00'),
(2, 1, 1.00, '0000-00-00'),
(3, 1, 1.00, '0000-00-00');

-- --------------------------------------------------------

--
-- Stand-in structure for view `orderview`
-- (See below for the actual view)
--
CREATE TABLE `orderview` (
`OrderID` int(10) unsigned
,`Name` char(50)
,`City` char(30)
,`Address` char(100)
,`Phone` varchar(15)
,`EMail` varchar(50)
,`ODate` date
,`Amount` float(6,2)
);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `OrderID` int(10) UNSIGNED NOT NULL,
  `ISBN` char(13) NOT NULL,
  `Quantity` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbluser`
--

CREATE TABLE `tbluser` (
  `user_name` varchar(30) NOT NULL,
  `FName` varchar(30) NOT NULL,
  `LName` varchar(30) NOT NULL,
  `MName` varchar(30) NOT NULL,
  `DOB` date NOT NULL,
  `EMail` varchar(50) NOT NULL,
  `Phone` varchar(15) NOT NULL,
  `UPassword` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbluser`
--

INSERT INTO `tbluser` (`user_name`, `FName`, `LName`, `MName`, `DOB`, `EMail`, `Phone`, `UPassword`) VALUES
('abelmesay830@gmail.com', 'Abel', 'Gebremeskel', 'Mesay', '2000-06-23', 'abelmesay830@gmail.com', '951078852', '16aa76bb12ee00ll'),
('abel_mesay', 'Abel', 'Gebremeskel', 'Mesay', '2000-06-23', 'abelmesay49@gmail.com', '0951078852', '16761200'),
('abel_mesay1', 'Abel', 'Gebremeskel', 'Mesay', '2000-06-23', 'abelmesay123@gmail.com', '0987303695', '16761200');

-- --------------------------------------------------------

--
-- Structure for view `orderview`
--
DROP TABLE IF EXISTS `orderview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `orderview`  AS SELECT `o`.`OrderID` AS `OrderID`, `c`.`Name` AS `Name`, `c`.`City` AS `City`, `c`.`Address` AS `Address`, `c`.`Phone` AS `Phone`, `c`.`EMail` AS `EMail`, `o`.`ODate` AS `ODate`, `o`.`Amount` AS `Amount` FROM (`customers` `c` join `orders` `o` on(`c`.`CustomerID` = `o`.`CustomerID`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`ISBN`);

--
-- Indexes for table `book_reviews`
--
ALTER TABLE `book_reviews`
  ADD PRIMARY KEY (`ISBN`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`CustomerID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `CustomerID` (`CustomerID`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`OrderID`,`ISBN`),
  ADD KEY `ISBN` (`ISBN`);

--
-- Indexes for table `tbluser`
--
ALTER TABLE `tbluser`
  ADD PRIMARY KEY (`user_name`),
  ADD UNIQUE KEY `EMail` (`EMail`),
  ADD UNIQUE KEY `Phone` (`Phone`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `CustomerID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `OrderID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `book_reviews`
--
ALTER TABLE `book_reviews`
  ADD CONSTRAINT `book_reviews_ibfk_1` FOREIGN KEY (`ISBN`) REFERENCES `books` (`ISBN`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`),
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`ISBN`) REFERENCES `books` (`ISBN`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
