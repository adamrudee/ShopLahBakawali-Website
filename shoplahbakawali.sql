-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 09, 2025 at 04:51 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shoplahbakawali`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `adminID` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`adminID`, `email`, `password`) VALUES
(1, 'admin1@gmail.com', 'admin1');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cartID` int(11) NOT NULL,
  `totalPrice` decimal(10,2) DEFAULT 0.00,
  `customerID` int(11) DEFAULT NULL,
  `guestID` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart_product`
--

CREATE TABLE `cart_product` (
  `cartID` int(11) NOT NULL,
  `productID` int(11) NOT NULL,
  `quantity` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `checkout`
--

CREATE TABLE `checkout` (
  `checkoutID` int(11) NOT NULL,
  `date` datetime DEFAULT current_timestamp(),
  `finalPrice` decimal(10,2) DEFAULT NULL,
  `paymentMethod` varchar(50) DEFAULT NULL,
  `cartID` int(11) DEFAULT NULL,
  `customerID` int(11) DEFAULT NULL,
  `fullName` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phoneNumber` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `postcode` varchar(10) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `subtotal` decimal(10,2) DEFAULT NULL,
  `deliveryFee` decimal(10,2) DEFAULT NULL,
  `deliveryMethod` varchar(50) DEFAULT NULL,
  `pointsRedeemed` int(11) DEFAULT 0,
  `pointsDiscount` decimal(10,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `checkout_product`
--

CREATE TABLE `checkout_product` (
  `id` int(11) NOT NULL,
  `checkoutID` int(11) NOT NULL,
  `productID` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `brand` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customerID` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `phoneNumber` varchar(20) DEFAULT NULL,
  `adminID` int(11) DEFAULT NULL,
  `wishlistID` int(11) DEFAULT NULL,
  `membershipID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `membership`
--

CREATE TABLE `membership` (
  `membershipID` bigint(20) NOT NULL,
  `points` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `productID` int(11) NOT NULL,
  `brand` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `category` varchar(100) NOT NULL,
  `image` varchar(255) NOT NULL,
  `adminID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`productID`, `brand`, `name`, `price`, `category`, `image`, `adminID`) VALUES
(97, 'Sensodyne', 'toothbrush', 3.99, 'Personal Care', 'sensodyne.png', 1),
(98, 'Darlie', 'toothbrush', 5.50, 'Personal Care', 'darlie.png', 1),
(99, 'Colgate', 'toothbrush', 9.99, 'Personal Care', 'colgate.png', 1),
(100, 'Oral-B', 'toothbrush', 50.90, 'Personal Care', 'oral-b.png', 1),
(101, 'Head & Shoulders', 'Shampoo', 15.90, 'Personal Care', 'shampoo-head-shoulders.png', 1),
(102, 'Pantene', 'Shampoo', 14.50, 'Personal Care', 'pantene-shampoo.png', 1),
(103, 'Sunsilk', 'Shampoo', 10.90, 'Personal Care', 'sunsilk-shampoo.png', 1),
(104, 'Dove', 'Shampoo', 16.20, 'Personal Care', 'dove-shampoo.png', 1),
(105, 'Dove', 'Body Wash', 12.50, 'Personal Care', 'dove-body-wash.png', 1),
(106, 'Lux', 'Body Wash', 21.90, 'Personal Care', 'lux-body-wash.png', 1),
(107, 'Dettol', 'Body Wash', 13.50, 'Personal Care', 'dettol-body-wash.png', 1),
(108, 'Shokubutsu', 'Body Wash', 9.90, 'Personal Care', 'shokubutsu-body-wash.png', 1),
(109, 'Colgate', 'Toothpaste', 21.90, 'Personal Care', 'colgate-toothpaste.png', 1),
(110, 'Darlie', 'Toothpaste', 8.50, 'Personal Care', 'darlie-toothpaste.png', 1),
(111, 'Sensodyne', 'Toothpaste', 17.90, 'Personal Care', 'sensodyne-toothpaste.png', 1),
(112, 'Oral-B', 'Toothpaste', 12.50, 'Personal Care', 'oral-b-toothpaste.png', 1),
(113, 'Nescafe', '3-in-1', 12.90, 'Beverages', 'nescafe-3in1.png', 1),
(114, 'Aik Cheong', '3-in-1', 9.90, 'Beverages', 'aikcheong-3in1.png', 1),
(115, 'Old Town', 'White Coffee', 18.60, 'Beverages', 'oldtown-white-coffee.png', 1),
(116, 'Super', '3-in-1 Coffee', 11.90, 'Beverages', 'super-3in1.png', 1),
(117, 'Spritzer', 'Mineral Water', 1.20, 'Beverages', 'spritzer-water.png', 1),
(118, 'Evian', 'Mineral Water', 6.10, 'Beverages', 'evian-water.png', 1),
(119, 'Ice Mountain', 'Water', 1.30, 'Beverages', 'icemountain-water.png', 1),
(120, 'Dasani', 'Water', 1.40, 'Beverages', 'dasani-water.png', 1),
(121, 'Tropicana', 'Orange Juice', 6.99, 'Beverages', 'tropicana-orange-juice.png', 1),
(122, 'Minute Maid', 'Orange Juice', 8.50, 'Beverages', 'minutemaid-orange-juice.png', 1),
(123, 'Florida\'s Natural', 'Orange Juice', 11.90, 'Beverages', 'floridasnatural-orange-juice.png', 1),
(124, 'Marigold Peel Fresh', 'Orange Juice', 6.50, 'Beverages', 'marigold-orange-juice.png', 1),
(125, 'Heaven and Earth', 'Green Tea', 4.50, 'Beverages', 'heavenearth-greentea.png', 1),
(126, 'F&N Seasons', 'Green Tea', 2.40, 'Beverages', 'fnseasons-greentea.png', 1),
(127, 'Oishi', 'Green Tea', 5.60, 'Beverages', 'oishi-greentea.png', 1),
(128, 'Pokka', 'Green Tea', 2.70, 'Beverages', 'pokka-greentea.png', 1),
(129, 'Dutch Lady', 'Fresh Milk', 11.90, 'Dairy', 'dutchlady-milk.png', 1),
(130, 'Farm Fresh', 'Milk', 8.50, 'Dairy', 'farmfresh-milk.png', 1),
(131, 'Goodday', 'Fresh Milk', 7.50, 'Dairy', 'goodday-milk.png', 1),
(132, 'Magnolia', 'Milk', 15.20, 'Dairy', 'magnolia-milk.png', 1),
(133, 'Nestle', 'Yogurt Strawberry', 8.50, 'Dairy', 'nestle-yogurt.png', 1),
(134, 'Farm Fresh', 'Yogurt', 10.90, 'Dairy', 'farmfresh-yogurt.png', 1),
(135, 'Anlene', 'Yogurt', 12.20, 'Dairy', 'anlene-yogurt.png', 1),
(136, 'Marigold', 'Yogurt', 4.80, 'Dairy', 'marigold-yogurt.png', 1),
(137, 'Kraft', 'Cheese Slices', 6.90, 'Dairy', 'kraft-cheese.png', 1),
(138, 'Emborg', 'Cheese Slices', 16.50, 'Dairy', 'emborg-cheese.png', 1),
(139, 'Anchor', 'Cheese Slices', 7.90, 'Dairy', 'anchor-cheese.png', 1),
(140, 'Cheesdale', 'Cheese Slices', 15.90, 'Dairy', 'chees-cheese.png', 1),
(141, 'Anchor', 'Butter', 5.90, 'Dairy', 'anchor-butter.png', 1),
(142, 'Lurpak', 'Butter', 9.50, 'Dairy', 'lurpak-butter.png', 1),
(143, 'SCS', 'Butter', 8.50, 'Dairy', 'scs-butter.png', 1),
(144, 'Golden Churn', 'Butter', 14.90, 'Dairy', 'goldenchurn-butter.png', 1),
(145, 'Lay\'s', 'Potato Chips', 2.80, 'Snacks', 'lays-chips.png', 1),
(146, 'Pringles', 'Potato Chips', 6.50, 'Snacks', 'pringles-chips.png', 1),
(147, 'Jack \'n Jill', 'Potato Chips', 3.70, 'Snacks', 'jacknjill-chips.png', 1),
(148, 'Mister Potato', 'Potato Chips', 4.99, 'Snacks', 'misterpotato-chips.png', 1),
(149, 'Cadbury', 'Dairy Milk Bar', 8.90, 'Snacks', 'cadbury-bar.png', 1),
(150, 'KitKat', 'Bar', 3.20, 'Snacks', 'kitkat-bar.png', 1),
(151, 'Snickers', 'Bar', 5.50, 'Snacks', 'snickers-bar.png', 1),
(152, 'Mars', 'Bar', 10.80, 'Snacks', 'mars-bar.png', 1),
(153, 'Chipsmore', 'Cookies', 3.50, 'Snacks', 'chipsmore-cookies.png', 1),
(154, 'Famous Amos', 'Cookies', 21.90, 'Snacks', 'famousamos-cookies.png', 1),
(155, 'Oreo', 'Cookies', 5.90, 'Snacks', 'oreo-cookies.png', 1),
(156, 'Julie\'s', 'Cookies', 4.20, 'Snacks', 'julies-cookies.png', 1),
(157, 'Act II', 'Popcorn', 11.50, 'Snacks', 'act2-popcorn.jpeg', 1),
(158, 'Orville Redenbacher\'s', 'Popcorn', 9.20, 'Snacks', 'orville-popcorn.png', 1),
(159, 'Pop Secret', 'Popcorn', 13.90, 'Snacks', 'popsecret-popcorn.png', 1),
(160, 'Garrett', 'Popcorn', 10.50, 'Snacks', 'garrett-popcorn.png', 1),
(161, 'Sunlight', 'Dish Soap', 5.50, 'Household', 'sunlight-dish-soap.png', 1),
(162, 'Joy', 'Dish Soap', 7.50, 'Household', 'joy-dish-soap.png', 1),
(163, 'Axion', 'Dish Soap', 4.90, 'Household', 'axion-dish-soap.png', 1),
(164, 'Fairy', 'Dish Soap', 11.20, 'Household', 'fairy-dish-soap.png', 1),
(165, 'Scotch-Brite', 'Sponge', 3.50, 'Household', 'scotch-brite-sponge.png', 1),
(166, 'Vileda', 'Sponge', 6.20, 'Household', 'vileda-sponge.png', 1),
(167, 'Mr. Clean', 'Sponge', 2.80, 'Household', 'mr-clean-sponge.png', 1),
(168, 'Spontex', 'Sponge', 3.80, 'Household', 'spontex-sponge.png', 1),
(169, 'Clorox', 'Bleach', 7.50, 'Household', 'clorox-bleach.png', 1),
(170, 'Kao', 'Bleach', 8.50, 'Household', 'kao-bleach.png', 1),
(171, 'Top', 'Bleach', 9.90, 'Household', 'top-bleach.png', 1),
(172, 'Domestos', 'Bleach', 12.00, 'Household', 'domestos-bleach.png', 1),
(173, 'Top', 'Laundry Detergent', 19.90, 'Household', 'top-detergent.png', 1),
(174, 'Dynamo', 'Laundry Detergent', 26.90, 'Household', 'dynamo-detergent.png', 1),
(175, 'Attack', 'Laundry Detergent', 21.90, 'Household', 'attack-detergent.png', 1),
(176, 'Fab', 'Laundry Detergent', 16.90, 'Household', 'fab-detergent.png', 1),
(177, 'UHU', 'Glue Stick', 2.50, 'Stationery', 'uhu-glue.png', 1),
(178, 'Faber-Castell', 'Glue Stick', 3.80, 'Stationery', 'faber-castell-glue.png', 1),
(179, 'Deli', 'Glue Stick', 1.20, 'Stationery', 'deli-glue.png', 1),
(180, 'Pilot', 'Glue Stick', 5.90, 'Stationery', 'pilot-glue.png', 1),
(181, 'Pilot', 'G2 Gel Pen', 3.50, 'Stationery', 'pilot-g2-pen.png', 1),
(182, 'Faber-Castell', 'Ball Pen', 1.20, 'Stationery', 'faber-castell-pen.png', 1),
(183, 'Stabilo', 'Ball Pen', 2.50, 'Stationery', 'stabilo-pen.png', 1),
(184, 'Zebra', 'Ball Pen', 1.40, 'Stationery', 'zebra-pen.png', 1),
(185, 'Staedtler', 'Eraser', 1.00, 'Stationery', 'staedtler-eraser.png', 1),
(186, 'Faber-Castell', 'Eraser', 1.10, 'Stationery', 'faber-castell-eraser.png', 1),
(187, 'Deli', 'Eraser', 2.90, 'Stationery', 'deli-eraser.png', 1),
(188, 'Maped', 'Eraser', 3.20, 'Stationery', 'maped-eraser.png', 1),
(189, 'Pilot', 'Whiteboard Marker', 4.50, 'Stationery', 'pilot-marker.png', 1),
(190, 'Artline', 'Permanent Marker', 2.90, 'Stationery', 'artline-marker.png', 1),
(191, 'Faber-Castell', 'Marker', 8.20, 'Stationery', 'faber-castell-marker.png', 1),
(192, 'Snowman', 'Marker', 6.80, 'Stationery', 'snowman-marker.png', 1);

-- --------------------------------------------------------

--
-- Table structure for table `salesreport`
--

CREATE TABLE `salesreport` (
  `salesReportID` int(11) NOT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `totalOrders` int(11) DEFAULT NULL,
  `totalSales` decimal(12,2) DEFAULT NULL,
  `adminID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tracking`
--

CREATE TABLE `tracking` (
  `trackingID` int(11) NOT NULL,
  `shippingStatus` varchar(50) DEFAULT NULL,
  `adminID` int(11) DEFAULT NULL,
  `customerID` int(11) DEFAULT NULL,
  `checkoutID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `wishlistID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wishlist_product`
--

CREATE TABLE `wishlist_product` (
  `wishlistID` int(11) NOT NULL,
  `productID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`adminID`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cartID`),
  ADD KEY `customerID` (`customerID`);

--
-- Indexes for table `cart_product`
--
ALTER TABLE `cart_product`
  ADD PRIMARY KEY (`cartID`,`productID`),
  ADD KEY `productID` (`productID`);

--
-- Indexes for table `checkout`
--
ALTER TABLE `checkout`
  ADD PRIMARY KEY (`checkoutID`),
  ADD KEY `cartID` (`cartID`),
  ADD KEY `customerID` (`customerID`);

--
-- Indexes for table `checkout_product`
--
ALTER TABLE `checkout_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `checkoutID` (`checkoutID`),
  ADD KEY `productID` (`productID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customerID`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `adminID` (`adminID`),
  ADD KEY `wishlistID` (`wishlistID`),
  ADD KEY `membershipID` (`membershipID`);

--
-- Indexes for table `membership`
--
ALTER TABLE `membership`
  ADD PRIMARY KEY (`membershipID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`productID`),
  ADD KEY `adminID` (`adminID`);

--
-- Indexes for table `salesreport`
--
ALTER TABLE `salesreport`
  ADD PRIMARY KEY (`salesReportID`),
  ADD KEY `adminID` (`adminID`);

--
-- Indexes for table `tracking`
--
ALTER TABLE `tracking`
  ADD PRIMARY KEY (`trackingID`),
  ADD KEY `adminID` (`adminID`),
  ADD KEY `customerID` (`customerID`),
  ADD KEY `fk_tracking_checkout` (`checkoutID`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`wishlistID`);

--
-- Indexes for table `wishlist_product`
--
ALTER TABLE `wishlist_product`
  ADD PRIMARY KEY (`wishlistID`,`productID`),
  ADD KEY `productID` (`productID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `adminID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cartID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `checkout`
--
ALTER TABLE `checkout`
  MODIFY `checkoutID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `checkout_product`
--
ALTER TABLE `checkout_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customerID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `membership`
--
ALTER TABLE `membership`
  MODIFY `membershipID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2023866465;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `productID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=193;

--
-- AUTO_INCREMENT for table `salesreport`
--
ALTER TABLE `salesreport`
  MODIFY `salesReportID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tracking`
--
ALTER TABLE `tracking`
  MODIFY `trackingID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `wishlistID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`customerID`) REFERENCES `customer` (`customerID`);

--
-- Constraints for table `cart_product`
--
ALTER TABLE `cart_product`
  ADD CONSTRAINT `cart_product_ibfk_1` FOREIGN KEY (`cartID`) REFERENCES `cart` (`cartID`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_product_ibfk_2` FOREIGN KEY (`productID`) REFERENCES `product` (`productID`) ON DELETE CASCADE;

--
-- Constraints for table `checkout`
--
ALTER TABLE `checkout`
  ADD CONSTRAINT `checkout_ibfk_1` FOREIGN KEY (`cartID`) REFERENCES `cart` (`cartID`),
  ADD CONSTRAINT `checkout_ibfk_2` FOREIGN KEY (`customerID`) REFERENCES `customer` (`customerID`);

--
-- Constraints for table `checkout_product`
--
ALTER TABLE `checkout_product`
  ADD CONSTRAINT `checkout_product_ibfk_1` FOREIGN KEY (`checkoutID`) REFERENCES `checkout` (`checkoutID`),
  ADD CONSTRAINT `checkout_product_ibfk_2` FOREIGN KEY (`productID`) REFERENCES `product` (`productID`);

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`adminID`) REFERENCES `admin` (`adminID`),
  ADD CONSTRAINT `customer_ibfk_2` FOREIGN KEY (`wishlistID`) REFERENCES `wishlist` (`wishlistID`),
  ADD CONSTRAINT `customer_ibfk_3` FOREIGN KEY (`membershipID`) REFERENCES `membership` (`membershipID`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`adminID`) REFERENCES `admin` (`adminID`);

--
-- Constraints for table `salesreport`
--
ALTER TABLE `salesreport`
  ADD CONSTRAINT `salesreport_ibfk_1` FOREIGN KEY (`adminID`) REFERENCES `admin` (`adminID`);

--
-- Constraints for table `tracking`
--
ALTER TABLE `tracking`
  ADD CONSTRAINT `fk_tracking_checkout` FOREIGN KEY (`checkoutID`) REFERENCES `checkout` (`checkoutID`) ON DELETE CASCADE,
  ADD CONSTRAINT `tracking_ibfk_1` FOREIGN KEY (`adminID`) REFERENCES `admin` (`adminID`),
  ADD CONSTRAINT `tracking_ibfk_2` FOREIGN KEY (`customerID`) REFERENCES `customer` (`customerID`);

--
-- Constraints for table `wishlist_product`
--
ALTER TABLE `wishlist_product`
  ADD CONSTRAINT `wishlist_product_ibfk_1` FOREIGN KEY (`wishlistID`) REFERENCES `wishlist` (`wishlistID`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlist_product_ibfk_2` FOREIGN KEY (`productID`) REFERENCES `product` (`productID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
