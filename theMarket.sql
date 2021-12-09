-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 01, 2021 at 11:38 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `theMarket`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_info`
--

CREATE TABLE `account_info` (
  `username` varchar(15) NOT NULL,
  `password` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `account_info`
--

INSERT INTO `account_info` (`username`, `password`) VALUES
('dkalluri', 'cococharlie123'),
('mark', 'eba1f9096ac1c2a055c10f0ea52893aad355e63952fb57169bad9a6a25e8beae8f0ab4e29bf43948449dace829038ceff7f6a49c8bd322dc7f9b06e39de336c1'),
('newUser', '$2y$10$ToweWBwClCLFVKEvpIlnVuSZhoJoESZOLKYyUeystnjHN8ejAgG/y'),
('newUser3', '$2y$10$bAwn1RB3G6jgn3GcBmLJRODUeqxT6fvZWhxZvgNIdUDD9IGAiTG5.'),
('samara', 'aramas9999'),
('vatsal', 'coolrami'),
('yuvi', 'Wahoowa123');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `cardNumber` varchar(20) NOT NULL,
  `securityCode` int(3) DEFAULT NULL,
  `nameOnCard` varchar(20) DEFAULT NULL,
  `expirationDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`cardNumber`, `securityCode`, `nameOnCard`, `expirationDate`) VALUES
('1234567890123456', 1, 'Yuvraj Sreepathi', '2021-01-01'),
('3334567890123450', 4, 'Vatsal Rami', '2024-11-04'),
('4434567890123451', 452, 'Samara Elahi', '2026-11-01'),
('7334567890123453', 224, 'Divya Kalluri', '2023-02-06'),
('9134567890123452', 455, 'Mark Chitre', '2022-06-07');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `userID` int(6) NOT NULL,
  `productID` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`userID`, `productID`) VALUES
(1, 5),
(2, 4),
(3, 1),
(3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `productID` int(11) NOT NULL,
  `quantity` int(4) NOT NULL,
  `price` double NOT NULL,
  `category` varchar(15) DEFAULT NULL,
  `productStat` varchar(15) NOT NULL,
  `condition` varchar(30) DEFAULT NULL,
  `productName` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`productID`, `quantity`, `price`, `category`, `productStat`, `condition`, `productName`) VALUES
(1, 1, 100, 'electronic', 'available', 'used', 'Headphone'),
(2, 2, 10.2, 'kitchen', 'available', 'new', 'Pot'),
(3, 4, 17.69, 'outdoor', 'available', 'new', 'Lawn Chair'),
(4, 0, 25.5, 'electronic', 'sold out', 'new', 'Charger'),
(5, 0, 67.99, 'sports', 'sold out', 'used', 'Baseball Bat'),
(1765880, 10, 10.99, 'Home/Kitchen', 'available', 'new', 'Bowl'),
(2927888, 2, 12, 'Home/Kitchen', 'available', 'used', 'Knives'),
(4834279, 1, 5, 'Clothing', 'available', 'new', 'pants'),
(6332982, 1, 500, 'Electronics', 'available', 'used', 'Laptop');

-- --------------------------------------------------------

--
-- Table structure for table `product_review`
--

CREATE TABLE `product_review` (
  `productID` int(6) NOT NULL,
  `review` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_review`
--

INSERT INTO `product_review` (`productID`, `review`) VALUES
(1, 'Banging sound'),
(2, 'Makes me happy'),
(3, 'Very comfortable'),
(4, 'Standard quality'),
(5, 'Chipped at the handle');

-- --------------------------------------------------------

--
-- Table structure for table `purchase`
--

CREATE TABLE `purchase` (
  `orderID` int(6) NOT NULL,
  `dateBought` date NOT NULL,
  `numberOfItems` int(6) NOT NULL,
  `totalPrice` double NOT NULL,
  `shippingDate` date DEFAULT NULL,
  `shippingCost` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `purchase`
--

INSERT INTO `purchase` (`orderID`, `dateBought`, `numberOfItems`, `totalPrice`, `shippingDate`, `shippingCost`) VALUES
(51, '2021-09-09', 1, 76.43, '2021-09-09', 7.99),
(52, '2021-10-01', 1, 45.68, '2021-10-04', 4.99),
(53, '2020-04-24', 2, 37.94, '2020-04-28', 0.03),
(54, '2021-11-01', 3, 23.97, '2021-11-08', 0),
(55, '2019-07-03', 2, 12.56, '2019-07-04', 3.99);

-- --------------------------------------------------------

--
-- Table structure for table `purchase_history`
--

CREATE TABLE `purchase_history` (
  `userID` int(6) NOT NULL,
  `productBought` int(6) NOT NULL,
  `quantityBought` int(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `purchase_history`
--

INSERT INTO `purchase_history` (`userID`, `productBought`, `quantityBought`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 5, 1),
(4, 4, 1),
(5, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `sellerHistory`
--

CREATE TABLE `sellerHistory` (
  `userID` int(6) NOT NULL,
  `saleHistory` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sellerHistory`
--

INSERT INTO `sellerHistory` (`userID`, `saleHistory`) VALUES
(1, 5),
(2, 4),
(3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `sellerSelling`
--

CREATE TABLE `sellerSelling` (
  `userID` int(6) NOT NULL,
  `productsForSale` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sellerSelling`
--

INSERT INTO `sellerSelling` (`userID`, `productsForSale`) VALUES
(1, 2),
(2, 1),
(3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `seller_review`
--

CREATE TABLE `seller_review` (
  `userID` int(6) NOT NULL,
  `review` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `seller_review`
--

INSERT INTO `seller_review` (`userID`, `review`) VALUES
(1, 'Good seller, sends on time'),
(2, 'Good looking dude'),
(3, 'Sent me broken package');

-- --------------------------------------------------------

--
-- Table structure for table `user_account`
--

CREATE TABLE `user_account` (
  `userID` int(6) NOT NULL,
  `username` varchar(15) DEFAULT NULL,
  `cardNumber` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_account`
--

INSERT INTO `user_account` (`userID`, `username`, `cardNumber`) VALUES
(1, 'yuvi', '1234567890123456'),
(2, 'vatsal', '3334567890123450'),
(3, 'samara', '4434567890123451'),
(4, 'markmark', '9134567890123452'),
(5, 'dkalluri', '7334567890123453');

-- --------------------------------------------------------

--
-- Table structure for table `user_basicinfo`
--

CREATE TABLE `user_basicinfo` (
  `userID` int(6) NOT NULL,
  `email` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_basicinfo`
--

INSERT INTO `user_basicinfo` (`userID`, `email`) VALUES
(5, 'ddk3zq@virginia.edu'),
(4, 'mcf8sr@virginia.edu'),
(3, 'se4hy@virginia.edu'),
(1, 'uvsethi@gmail.com'),
(2, 'vr9sjk@virginia.edu');

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE `user_info` (
  `email` varchar(20) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `age` int(3) DEFAULT NULL,
  `address` varchar(30) NOT NULL,
  `cardNumber` varchar(20) NOT NULL
) ;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`email`, `name`, `age`, `address`, `cardNumber`) VALUES
('blreh@virginia.edu', 'Steve Jobs', 22, 'Moon Star Cir', '8998899889988998'),
('ddk3zq@virginia.edu', 'Divya Kalluri', 20, 'Indian Paintbrush Ave', '7334567890123453'),
('mcf8sr@virginia.edu', 'Mark Chitre', 20, 'Marker Dr', '9134567890123452'),
('se4hy@virginia.edu', 'Samara Elahi', 22, 'Elnido Dr', '4434567890123451'),
('vr9sjk@virginia.edu', 'Vatsal Rami', 20, 'Cayuga Ct', '3334567890123450'),
('ys3mnq@virginia.edu', 'Yuvraj Sreepathi', 20, 'Stone Roses Cir', '1234567890123456');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account_info`
--
ALTER TABLE `account_info`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`cardNumber`),
  ADD UNIQUE KEY `cardNumber` (`cardNumber`),
  ADD UNIQUE KEY `securityCode` (`securityCode`),
  ADD UNIQUE KEY `nameOnCard` (`nameOnCard`),
  ADD UNIQUE KEY `expirationDate` (`expirationDate`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`userID`,`productID`),
  ADD UNIQUE KEY `productID` (`productID`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`productID`),
  ADD UNIQUE KEY `productID` (`productID`);

--
-- Indexes for table `product_review`
--
ALTER TABLE `product_review`
  ADD PRIMARY KEY (`productID`),
  ADD UNIQUE KEY `productID` (`productID`);

--
-- Indexes for table `purchase`
--
ALTER TABLE `purchase`
  ADD PRIMARY KEY (`orderID`),
  ADD UNIQUE KEY `orderID` (`orderID`);

--
-- Indexes for table `purchase_history`
--
ALTER TABLE `purchase_history`
  ADD PRIMARY KEY (`userID`,`productBought`),
  ADD UNIQUE KEY `userID` (`userID`);

--
-- Indexes for table `sellerHistory`
--
ALTER TABLE `sellerHistory`
  ADD PRIMARY KEY (`userID`,`saleHistory`);

--
-- Indexes for table `sellerSelling`
--
ALTER TABLE `sellerSelling`
  ADD PRIMARY KEY (`userID`,`productsForSale`);

--
-- Indexes for table `seller_review`
--
ALTER TABLE `seller_review`
  ADD PRIMARY KEY (`userID`,`review`),
  ADD UNIQUE KEY `userID` (`userID`);

--
-- Indexes for table `user_account`
--
ALTER TABLE `user_account`
  ADD PRIMARY KEY (`userID`),
  ADD UNIQUE KEY `userID` (`userID`),
  ADD UNIQUE KEY `cardNumber` (`cardNumber`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `user_basicinfo`
--
ALTER TABLE `user_basicinfo`
  ADD PRIMARY KEY (`userID`),
  ADD UNIQUE KEY `userID` (`userID`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`email`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `cardNumber` (`cardNumber`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `productID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6332983;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `card2` FOREIGN KEY (`cardNumber`) REFERENCES `user_account` (`cardNumber`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cardNumber` FOREIGN KEY (`cardNumber`) REFERENCES `user_info` (`cardNumber`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `productID` FOREIGN KEY (`productID`) REFERENCES `products` (`productID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `userID` FOREIGN KEY (`userID`) REFERENCES `user_account` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_basicinfo`
--
ALTER TABLE `user_basicinfo`
  ADD CONSTRAINT `user_id_1` FOREIGN KEY (`userID`) REFERENCES `user_account` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
