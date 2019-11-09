-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 09, 2019 at 01:38 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `car_rental`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `reservation_ID` int(11) NOT NULL,
  `fk_car_ID` int(11) NOT NULL,
  `fk_customer_ID` int(11) NOT NULL,
  `fk_pklocation_ID` int(11) NOT NULL,
  `fk_relocation_ID` int(11) NOT NULL,
  `pickup_date` date NOT NULL,
  `dropoff_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`reservation_ID`, `fk_car_ID`, `fk_customer_ID`, `fk_pklocation_ID`, `fk_relocation_ID`, `pickup_date`, `dropoff_date`) VALUES
(996, 114, 5, 202, 101, '2019-11-15', '2019-11-23'),
(997, 113, 3, 201, 101, '2019-11-15', '2019-11-16'),
(998, 115, 2, 204, 102, '2019-11-14', '2019-11-16'),
(999, 111, 1, 205, 101, '2019-11-09', '2019-11-10');

-- --------------------------------------------------------

--
-- Table structure for table `carinfo`
--

CREATE TABLE `carinfo` (
  `car_ID` int(11) NOT NULL,
  `brand` varchar(20) NOT NULL,
  `capacity` int(11) NOT NULL,
  `model` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `carinfo`
--

INSERT INTO `carinfo` (`car_ID`, `brand`, `capacity`, `model`) VALUES
(111, 'Audi', 4, 'A3'),
(112, 'VW', 4, 'golf'),
(113, 'Mercede Benz', 2, 'SLK'),
(114, 'VW', 8, 'van'),
(115, 'audi', 4, 'A4');

-- --------------------------------------------------------

--
-- Table structure for table `car_category`
--

CREATE TABLE `car_category` (
  `fk_car_ID` int(11) NOT NULL,
  `category` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `car_category`
--

INSERT INTO `car_category` (`fk_car_ID`, `category`) VALUES
(111, 'auto'),
(113, 'sportcar'),
(114, 'van'),
(112, 'auto');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_ID` int(11) NOT NULL,
  `customer_name` varchar(55) NOT NULL,
  `drivingLicense_no` int(11) NOT NULL,
  `cell` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_ID`, `customer_name`, `drivingLicense_no`, `cell`) VALUES
(1, 'Linda', 111222333, 12345678),
(2, 'Jack', 222333444, 12345677),
(3, 'oliver', 333444555, 12345676),
(4, 'Miranda', 444555666, 12345675),
(5, 'Lukas', 555666777, 12345674),
(6, 'John', 666777888, 12345673);

-- --------------------------------------------------------

--
-- Table structure for table `flight`
--

CREATE TABLE `flight` (
  `fk_reservation_ID` int(11) NOT NULL,
  `flight_no` varchar(20) NOT NULL,
  `vaucher_no` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `flight`
--

INSERT INTO `flight` (`fk_reservation_ID`, `flight_no`, `vaucher_no`) VALUES
(996, 'B123', '202A'),
(999, 'M123', '205A'),
(997, 'null', 'nul');

-- --------------------------------------------------------

--
-- Table structure for table `insurance`
--

CREATE TABLE `insurance` (
  `fk_reservation_ID` int(11) NOT NULL,
  `policy` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `insurance`
--

INSERT INTO `insurance` (`fk_reservation_ID`, `policy`) VALUES
(999, 'all_cover'),
(998, 'partial_cover'),
(997, 'all_cover'),
(996, 'partial_cover');

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `invoice_ID` int(11) NOT NULL,
  `fk_reservation_ID` int(11) NOT NULL,
  `add_charge` int(11) NOT NULL,
  `add_charge_desp` varchar(20) NOT NULL,
  `fk_vaucher_no` varchar(20) NOT NULL,
  `amout` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`invoice_ID`, `fk_reservation_ID`, `add_charge`, `add_charge_desp`, `fk_vaucher_no`, `amout`) VALUES
(13576, 996, 80, 'different return', '205A', 228),
(13577, 997, 50, 'different return', 'nul', 220),
(13578, 998, 0, 'null', 'nul', 150),
(13579, 999, 35, 'empty tank', '205A', 229);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `fk_invoice_ID` int(11) NOT NULL,
  `pay_method` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`fk_invoice_ID`, `pay_method`) VALUES
(13579, 'credit card'),
(13578, 'cash'),
(13577, 'credit card'),
(13576, 'credit card');

-- --------------------------------------------------------

--
-- Table structure for table `pklocation`
--

CREATE TABLE `pklocation` (
  `pklocation_ID` int(11) NOT NULL,
  `location_name` varchar(20) NOT NULL,
  `city_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pklocation`
--

INSERT INTO `pklocation` (`pklocation_ID`, `location_name`, `city_name`) VALUES
(201, 'citycenter', 'vienna'),
(202, 'aiport', 'graz'),
(203, 'transtation', 'salzburg'),
(204, 'trainstation', 'Linz'),
(205, 'aiport', 'vienna');

-- --------------------------------------------------------

--
-- Table structure for table `relocation`
--

CREATE TABLE `relocation` (
  `relocation_ID` int(11) NOT NULL,
  `relocation_name` varchar(20) NOT NULL,
  `city_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `relocation`
--

INSERT INTO `relocation` (`relocation_ID`, `relocation_name`, `city_name`) VALUES
(101, 'airport', 'vienna'),
(102, 'trainstation', 'vienna'),
(103, 'trainstation', 'salzburg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`reservation_ID`),
  ADD KEY `fk_car_ID` (`fk_car_ID`),
  ADD KEY `fk_customer_ID` (`fk_customer_ID`),
  ADD KEY `fk_pklocation_ID` (`fk_pklocation_ID`),
  ADD KEY `fk_relocation_ID` (`fk_relocation_ID`);

--
-- Indexes for table `carinfo`
--
ALTER TABLE `carinfo`
  ADD PRIMARY KEY (`car_ID`);

--
-- Indexes for table `car_category`
--
ALTER TABLE `car_category`
  ADD KEY `fk_car_ID` (`fk_car_ID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_ID`);

--
-- Indexes for table `flight`
--
ALTER TABLE `flight`
  ADD PRIMARY KEY (`vaucher_no`),
  ADD KEY `fk_reservation_ID` (`fk_reservation_ID`);

--
-- Indexes for table `insurance`
--
ALTER TABLE `insurance`
  ADD KEY `fk_reservation_ID` (`fk_reservation_ID`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoice_ID`),
  ADD KEY `fk_reservation_ID` (`fk_reservation_ID`),
  ADD KEY `fk_vaucher_no` (`fk_vaucher_no`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD KEY `fk_invoice_ID` (`fk_invoice_ID`);

--
-- Indexes for table `pklocation`
--
ALTER TABLE `pklocation`
  ADD PRIMARY KEY (`pklocation_ID`),
  ADD UNIQUE KEY `city_name` (`pklocation_ID`);

--
-- Indexes for table `relocation`
--
ALTER TABLE `relocation`
  ADD PRIMARY KEY (`relocation_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`fk_car_ID`) REFERENCES `carinfo` (`car_ID`),
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`fk_customer_ID`) REFERENCES `customer` (`customer_ID`),
  ADD CONSTRAINT `booking_ibfk_3` FOREIGN KEY (`fk_car_ID`) REFERENCES `carinfo` (`car_ID`),
  ADD CONSTRAINT `booking_ibfk_4` FOREIGN KEY (`fk_customer_ID`) REFERENCES `customer` (`customer_ID`),
  ADD CONSTRAINT `booking_ibfk_5` FOREIGN KEY (`fk_car_ID`) REFERENCES `carinfo` (`car_ID`),
  ADD CONSTRAINT `booking_ibfk_6` FOREIGN KEY (`fk_customer_ID`) REFERENCES `customer` (`customer_ID`),
  ADD CONSTRAINT `booking_ibfk_7` FOREIGN KEY (`fk_pklocation_ID`) REFERENCES `pklocation` (`pklocation_ID`),
  ADD CONSTRAINT `booking_ibfk_8` FOREIGN KEY (`fk_relocation_ID`) REFERENCES `relocation` (`relocation_ID`);

--
-- Constraints for table `car_category`
--
ALTER TABLE `car_category`
  ADD CONSTRAINT `car_category_ibfk_1` FOREIGN KEY (`fk_car_ID`) REFERENCES `carinfo` (`car_ID`);

--
-- Constraints for table `flight`
--
ALTER TABLE `flight`
  ADD CONSTRAINT `flight_ibfk_1` FOREIGN KEY (`fk_reservation_ID`) REFERENCES `booking` (`reservation_ID`);

--
-- Constraints for table `insurance`
--
ALTER TABLE `insurance`
  ADD CONSTRAINT `insurance_ibfk_1` FOREIGN KEY (`fk_reservation_ID`) REFERENCES `booking` (`reservation_ID`);

--
-- Constraints for table `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`fk_reservation_ID`) REFERENCES `booking` (`reservation_ID`),
  ADD CONSTRAINT `invoice_ibfk_2` FOREIGN KEY (`fk_vaucher_no`) REFERENCES `flight` (`vaucher_no`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`fk_invoice_ID`) REFERENCES `invoice` (`invoice_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
