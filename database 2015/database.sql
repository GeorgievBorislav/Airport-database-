-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 08, 2015 at 03:27 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `test`
--

-- --------------------------------------------------------

--
-- Table structure for table `airlines`
--

CREATE TABLE IF NOT EXISTS `airlines` (
  `Airline_ID` char(11) NOT NULL,
  `Airline_Name` varchar(45) NOT NULL,
  `Airline_Origin` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Airline_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `airlines`
--

INSERT INTO `airlines` (`Airline_ID`, `Airline_Name`, `Airline_Origin`) VALUES
('AF', 'Air France', 'France'),
('AZ', 'Alitalia', 'Italy'),
('BA', 'Bulgaria Air', 'Bulgaria'),
('IB', 'Iberia', 'Spain'),
('KLM', 'KLM', 'Netherlands'),
('LF', 'Lufthansa', 'Germany');

-- --------------------------------------------------------

--
-- Table structure for table `airlines_orders`
--

CREATE TABLE IF NOT EXISTS `airlines_orders` (
  `Order_ID` int(11) NOT NULL,
  `Airlines_Airline_ID` char(11) NOT NULL,
  `Items_Item_ID` char(11) NOT NULL,
  `Items_Supplier_Supplier_ID` int(11) NOT NULL,
  `Quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`Order_ID`,`Airlines_Airline_ID`,`Items_Item_ID`,`Items_Supplier_Supplier_ID`),
  KEY `fk_Airlines_has_Items_Items1_idx` (`Items_Item_ID`,`Items_Supplier_Supplier_ID`),
  KEY `fk_Airlines_has_Items_Airlines1_idx` (`Airlines_Airline_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `airlines_orders`
--

INSERT INTO `airlines_orders` (`Order_ID`, `Airlines_Airline_ID`, `Items_Item_ID`, `Items_Supplier_Supplier_ID`, `Quantity`) VALUES
(1, 'AF', 'I00001', 111, 100),
(2, 'AF', 'I00002', 111, 90);

-- --------------------------------------------------------

--
-- Table structure for table `airline_contracts`
--

CREATE TABLE IF NOT EXISTS `airline_contracts` (
  `Terminals_Terminal_ID` char(11) NOT NULL,
  `Airlines_Airline_ID` char(11) NOT NULL,
  `Contract_Start_Date` date DEFAULT NULL,
  `Contract_Expiration_Date` date DEFAULT NULL,
  PRIMARY KEY (`Terminals_Terminal_ID`,`Airlines_Airline_ID`),
  KEY `fk_Terminals_has_Airlines_Terminals1_idx` (`Terminals_Terminal_ID`),
  KEY `fk_Terminals_has_Airlines_Airlines1_idx` (`Airlines_Airline_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `airline_contracts`
--

INSERT INTO `airline_contracts` (`Terminals_Terminal_ID`, `Airlines_Airline_ID`, `Contract_Start_Date`, `Contract_Expiration_Date`) VALUES
('T01', 'AF', '2010-01-01', '2015-12-31'),
('T02', 'AZ', '2016-01-01', '2018-01-01');

-- --------------------------------------------------------

--
-- Table structure for table `airline_employees`
--

CREATE TABLE IF NOT EXISTS `airline_employees` (
  `Airlines_Airline_ID` char(11) NOT NULL,
  `Staff_Staff_ID` int(11) NOT NULL,
  `Start_Date` date DEFAULT NULL,
  `End_Date` date DEFAULT NULL,
  PRIMARY KEY (`Airlines_Airline_ID`,`Staff_Staff_ID`),
  KEY `fk_Airlines_has_Staff_Staff1_idx` (`Staff_Staff_ID`),
  KEY `fk_Airlines_has_Staff_Airlines1_idx` (`Airlines_Airline_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `airline_employees`
--

INSERT INTO `airline_employees` (`Airlines_Airline_ID`, `Staff_Staff_ID`, `Start_Date`, `End_Date`) VALUES
('AF', 100085647, '2015-01-01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `flights`
--

CREATE TABLE IF NOT EXISTS `flights` (
  `Flight_ID` char(6) NOT NULL,
  `Airlines_Airline_ID` char(11) NOT NULL,
  `Planes_Plane_ID` char(6) NOT NULL,
  `Flight_From` varchar(45) DEFAULT NULL,
  `Flight_To` varchar(45) DEFAULT NULL,
  `Flight_DepartureTime` datetime DEFAULT NULL,
  `Flight_ArrivalTime` datetime DEFAULT NULL,
  `Gates_Terminals_Terminal_ID` char(11) NOT NULL,
  `Gates_Gate_ID` char(3) NOT NULL,
  PRIMARY KEY (`Flight_ID`,`Airlines_Airline_ID`,`Planes_Plane_ID`,`Gates_Terminals_Terminal_ID`,`Gates_Gate_ID`),
  KEY `fk_Flights_Planes1_idx` (`Planes_Plane_ID`),
  KEY `fk_Flights_Airlines1_idx` (`Airlines_Airline_ID`),
  KEY `fk_Flights_Gates1_idx` (`Gates_Terminals_Terminal_ID`,`Gates_Gate_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `gates`
--

CREATE TABLE IF NOT EXISTS `gates` (
  `Terminals_Terminal_ID` char(11) NOT NULL,
  `Gate_ID` char(3) NOT NULL,
  PRIMARY KEY (`Terminals_Terminal_ID`,`Gate_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gates`
--

INSERT INTO `gates` (`Terminals_Terminal_ID`, `Gate_ID`) VALUES
('T01', 'A1'),
('T01', 'A2'),
('T01', 'B1'),
('T02', 'A1'),
('T02', 'A2');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE IF NOT EXISTS `items` (
  `Item_ID` char(11) NOT NULL,
  `Item_Name` varchar(30) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `Item_Price` double DEFAULT NULL,
  `Supplier_Supplier_ID` int(11) NOT NULL,
  PRIMARY KEY (`Item_ID`,`Supplier_Supplier_ID`),
  KEY `fk_Items_Company1_idx` (`Supplier_Supplier_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`Item_ID`, `Item_Name`, `Quantity`, `Item_Price`, `Supplier_Supplier_ID`) VALUES
('I00001', 'Coca-Cola', 1000, 1, 111),
('I00002', 'Sprite', 500, 1, 111),
('I00003', 'Fanta', 3500, 1, 111),
('I00004', 'Small bottle of wate', 6000, 1, 123),
('I00005', 'Big bottle of water', 6000, 1, 123);

-- --------------------------------------------------------

--
-- Table structure for table `planes`
--

CREATE TABLE IF NOT EXISTS `planes` (
  `Plane_ID` char(6) NOT NULL,
  `Plane_Model` varchar(20) DEFAULT NULL,
  `Plane_Capacity` int(11) DEFAULT NULL,
  PRIMARY KEY (`Plane_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `planes`
--

INSERT INTO `planes` (`Plane_ID`, `Plane_Model`, `Plane_Capacity`) VALUES
('157351', 'Boeing 747-8', 362),
('157869', 'Boeing 747-400', 512),
('157964', 'Boeing 737-300', 124),
('391268', 'Embraer E-195', 112),
('391429', 'Embraer E-190', 100),
('472102', 'Airbus A330-300', 400),
('472228', 'Airbus A340-600', 306),
('472301', 'Airbus A380-800', 509);

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE IF NOT EXISTS `projects` (
  `Project_ID` char(11) NOT NULL,
  `Project_Name` varchar(30) NOT NULL,
  `Start_Date` date DEFAULT NULL,
  `End_Date` date DEFAULT NULL,
  PRIMARY KEY (`Project_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`Project_ID`, `Project_Name`, `Start_Date`, `End_Date`) VALUES
('P01', 'Security Checks', '2015-12-09', '2015-12-11'),
('P02', 'Supplies Checks', '2015-12-16', '2015-12-18'),
('P03', 'Flight Checks', '0000-00-00', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `project_employees`
--

CREATE TABLE IF NOT EXISTS `project_employees` (
  `Projects_Project_ID` char(11) NOT NULL,
  `Staff_Staff_ID` int(11) NOT NULL,
  `Start_Date` date DEFAULT NULL,
  `End_Date` date DEFAULT NULL,
  PRIMARY KEY (`Projects_Project_ID`,`Staff_Staff_ID`),
  KEY `fk_Projects_has_Staff_Staff1_idx` (`Staff_Staff_ID`),
  KEY `fk_Projects_has_Staff_Projects1_idx` (`Projects_Project_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `project_employees`
--

INSERT INTO `project_employees` (`Projects_Project_ID`, `Staff_Staff_ID`, `Start_Date`, `End_Date`) VALUES
('P01', 100047152, '2015-12-14', '2015-12-15'),
('P02', 100078456, '2015-12-22', '2015-12-24');

-- --------------------------------------------------------

--
-- Table structure for table `project_execution`
--

CREATE TABLE IF NOT EXISTS `project_execution` (
  `Terminals_Terminal_ID` char(11) NOT NULL,
  `Projects_Project_ID` char(11) NOT NULL,
  `Start_Date` date DEFAULT NULL,
  `End_Date` date DEFAULT NULL,
  PRIMARY KEY (`Terminals_Terminal_ID`,`Projects_Project_ID`),
  KEY `fk_Terminals_has_Projects_Projects1_idx` (`Projects_Project_ID`),
  KEY `fk_Terminals_has_Projects_Terminals1_idx` (`Terminals_Terminal_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `project_execution`
--

INSERT INTO `project_execution` (`Terminals_Terminal_ID`, `Projects_Project_ID`, `Start_Date`, `End_Date`) VALUES
('T01', 'P01', '2015-12-09', '2015-12-12'),
('T01', 'P02', '2015-12-16', '2015-12-20'),
('T02', 'P02', '2015-12-16', '2015-12-18');

-- --------------------------------------------------------

--
-- Table structure for table `restaurants`
--

CREATE TABLE IF NOT EXISTS `restaurants` (
  `Restaurant_ID` char(11) NOT NULL,
  `Restaurant_Name` varchar(45) NOT NULL,
  `Restaurant_Phone` varchar(17) DEFAULT NULL,
  `Gates_Terminals_Terminal_ID` char(11) NOT NULL,
  `Gates_Gate_ID` char(3) NOT NULL,
  PRIMARY KEY (`Restaurant_ID`,`Gates_Terminals_Terminal_ID`,`Gates_Gate_ID`),
  KEY `fk_Restaurants_Gates1_idx` (`Gates_Terminals_Terminal_ID`,`Gates_Gate_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `restaurants`
--

INSERT INTO `restaurants` (`Restaurant_ID`, `Restaurant_Name`, `Restaurant_Phone`, `Gates_Terminals_Terminal_ID`, `Gates_Gate_ID`) VALUES
('BKing1093', 'Burger King', '+359 884 56 12 34', 'T01', 'A1'),
('STB123', 'Starbucks', '+359 887 34 98 10', 'T01', 'A2'),
('SWay40', 'Subway', '+359 885 44 85 64', 'T02', 'A1'),
('TT134', 'Tasty Thai', '+359 884 31 24 56', 'T02', 'A1'),
('WD23', 'Wendy''s', '+359 886 24 57 84', 'T02', 'A2');

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_contracts`
--

CREATE TABLE IF NOT EXISTS `restaurant_contracts` (
  `Terminals_Terminal_ID` char(11) NOT NULL,
  `Restaurants_Restaurant_ID` char(11) NOT NULL,
  `Contract_Start_Date` date DEFAULT NULL,
  `Contract_End_Date` date DEFAULT NULL,
  PRIMARY KEY (`Terminals_Terminal_ID`,`Restaurants_Restaurant_ID`),
  KEY `fk_Terminals_has_Restaurants_Restaurants1_idx` (`Restaurants_Restaurant_ID`),
  KEY `fk_Terminals_has_Restaurants_Terminals1_idx` (`Terminals_Terminal_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `restaurant_contracts`
--

INSERT INTO `restaurant_contracts` (`Terminals_Terminal_ID`, `Restaurants_Restaurant_ID`, `Contract_Start_Date`, `Contract_End_Date`) VALUES
('T01', 'BKing1093', '2016-01-01', '2021-01-01'),
('T01', 'STB123', '2016-01-01', '2020-01-01'),
('T01', 'WD23', '2000-01-01', '2020-01-01'),
('T02', 'TT134', '2016-01-01', '2025-01-01'),
('T02', 'WD23', '2010-01-01', '2015-12-31');

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_employees`
--

CREATE TABLE IF NOT EXISTS `restaurant_employees` (
  `Restaurants_Restaurant_ID` char(11) NOT NULL,
  `Staff_Staff_ID` int(11) NOT NULL,
  `Start_Date` date DEFAULT NULL,
  `End_Date` date DEFAULT NULL,
  PRIMARY KEY (`Restaurants_Restaurant_ID`,`Staff_Staff_ID`),
  KEY `fk_Restaurants_has_Staff_Staff1_idx` (`Staff_Staff_ID`),
  KEY `fk_Restaurants_has_Staff_Restaurants1_idx` (`Restaurants_Restaurant_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `restaurant_employees`
--

INSERT INTO `restaurant_employees` (`Restaurants_Restaurant_ID`, `Staff_Staff_ID`, `Start_Date`, `End_Date`) VALUES
('BKing1093', 100074145, '2013-05-23', NULL),
('STB123', 100094142, '2012-09-15', '2013-10-25');

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_orders`
--

CREATE TABLE IF NOT EXISTS `restaurant_orders` (
  `Order_ID` int(11) NOT NULL,
  `Restaurants_Restaurant_ID` char(11) NOT NULL,
  `Items_Item_ID` char(11) NOT NULL,
  `Items_Supplier_Supplier_ID` int(11) NOT NULL,
  `Quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`Order_ID`,`Restaurants_Restaurant_ID`,`Items_Item_ID`,`Items_Supplier_Supplier_ID`),
  KEY `fk_Restaurants_has_Items_Items1_idx` (`Items_Item_ID`,`Items_Supplier_Supplier_ID`),
  KEY `fk_Restaurants_has_Items_Restaurants1_idx` (`Restaurants_Restaurant_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `restaurant_orders`
--

INSERT INTO `restaurant_orders` (`Order_ID`, `Restaurants_Restaurant_ID`, `Items_Item_ID`, `Items_Supplier_Supplier_ID`, `Quantity`) VALUES
(1, 'BKing1093', 'I00001', 111, 240),
(1, 'SWay40', 'I00004', 123, 1000),
(1, 'WD23', 'I00002', 111, 400),
(2, 'BKing1093', 'I00002', 111, 100),
(2, 'SWay40', 'I00005', 123, 1000);

-- --------------------------------------------------------

--
-- Table structure for table `shops`
--

CREATE TABLE IF NOT EXISTS `shops` (
  `Shop_ID` char(8) NOT NULL,
  `Shop_Name` varchar(45) NOT NULL,
  `Shop_Phone` varchar(17) DEFAULT NULL,
  `Gates_Terminals_Terminal_ID` char(11) NOT NULL,
  `Gates_Gate_ID` char(3) NOT NULL,
  PRIMARY KEY (`Shop_ID`,`Gates_Terminals_Terminal_ID`,`Gates_Gate_ID`),
  KEY `fk_Shops_Gates1_idx` (`Gates_Terminals_Terminal_ID`,`Gates_Gate_ID`),
  KEY `Shop_ID` (`Shop_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shops`
--

INSERT INTO `shops` (`Shop_ID`, `Shop_Name`, `Shop_Phone`, `Gates_Terminals_Terminal_ID`, `Gates_Gate_ID`) VALUES
('Shop0001', 'Discover France', '+359 883 45 72 68', 'T01', 'A1'),
('Shop0002', 'The Flowers''s Shop', '+359 886 12 31 57', 'T01', 'A1'),
('Shop0003', 'Swarovski', '+359 886 42 59 61', 'T01', 'A1'),
('Shop0004', 'Swarovski', '+359 886 42 59 62', 'T01', 'A2'),
('Shop0005', 'Swarovski', '+359 886 42 59 63', 'T01', 'B1'),
('Shop0006', 'Apple', '+359 889 01 52 70', 'T02', 'A2'),
('Shop0007', 'Louis Vuitton', '+359 878 20 33 75', 'T02', 'A1'),
('Shop0008', 'Lindt', '+359 878 99 68 31', 'T02', 'A1'),
('Shop0009', 'Souvenirs', '+359 895 24 19 80', 'T02', 'A2');

-- --------------------------------------------------------

--
-- Table structure for table `shop_contracts`
--

CREATE TABLE IF NOT EXISTS `shop_contracts` (
  `Terminals_Terminal_ID` char(11) NOT NULL,
  `Shops_Shop_ID` char(8) NOT NULL,
  `Contract_Start_Date` date DEFAULT NULL,
  `Contract_Expiration_Date` date DEFAULT NULL,
  PRIMARY KEY (`Terminals_Terminal_ID`,`Shops_Shop_ID`),
  KEY `fk_Terminals_has_Shops_Shops1_idx` (`Shops_Shop_ID`),
  KEY `fk_Terminals_has_Shops_Terminals1_idx` (`Terminals_Terminal_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `shop_employees`
--

CREATE TABLE IF NOT EXISTS `shop_employees` (
  `Shops_Shop_ID` char(8) NOT NULL,
  `Staff_Staff_ID` int(11) NOT NULL,
  `Start_Date` date DEFAULT NULL,
  `End_Date` date DEFAULT NULL,
  PRIMARY KEY (`Shops_Shop_ID`,`Staff_Staff_ID`),
  KEY `fk_Shops_has_Staff_Staff1_idx` (`Staff_Staff_ID`),
  KEY `fk_Shops_has_Staff_Shops1_idx` (`Shops_Shop_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `shop_orders`
--

CREATE TABLE IF NOT EXISTS `shop_orders` (
  `Order_ID` int(11) NOT NULL,
  `Shops_Shop_ID` char(8) NOT NULL,
  `Items_Item_ID` char(11) NOT NULL,
  `Items_Supplier_Supplier_ID` int(11) NOT NULL,
  `Quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`Order_ID`,`Shops_Shop_ID`,`Items_Item_ID`,`Items_Supplier_Supplier_ID`),
  KEY `fk_Shops_has_Items_Items1_idx` (`Items_Item_ID`,`Items_Supplier_Supplier_ID`),
  KEY `fk_Shops_has_Items_Shops1_idx` (`Shops_Shop_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE IF NOT EXISTS `staff` (
  `Staff_ID` int(11) NOT NULL,
  `Staff_Name` varchar(20) DEFAULT NULL,
  `Staff_Phone` varchar(17) DEFAULT NULL,
  `Staff_Address` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Staff_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`Staff_ID`, `Staff_Name`, `Staff_Phone`, `Staff_Address`) VALUES
(100024067, 'Aleksiya Trifonova', '+359 875 12 30 06', '31 St. Ivan Str.'),
(100047152, 'Georgi Georgiev', '+359 882 11 11 11', '1 Data Str'),
(100074145, 'Dimitar Dimitrov', '+359 883 12 23 34', '2 Test Str'),
(100074568, 'Ivan Ivanov', '+359 882 34 45 54', '3 Example Str'),
(100078456, 'Teodor Ivanov', '+359 884 45 97 84', '4 Huff Str'),
(100085647, 'Dobromir Todorov', '+359 885 24 15 67', '23 Strom Str'),
(100094142, 'Aleksandra Hristova', '+359 886 24 78 91', '42 Spec Str'),
(100096296, 'Gergana Sokolova', '+359 889 39 51 24', '14 Proc Str'),
(100096431, 'Petar Stoev', '+359 881 70 24 68', '52 Noemi Str.');

-- --------------------------------------------------------

--
-- Table structure for table `staff_type`
--

CREATE TABLE IF NOT EXISTS `staff_type` (
  `Staff_Staff_ID` int(11) NOT NULL,
  `Staff_Type` varchar(45) NOT NULL,
  PRIMARY KEY (`Staff_Staff_ID`,`Staff_Type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `staff_type`
--

INSERT INTO `staff_type` (`Staff_Staff_ID`, `Staff_Type`) VALUES
(100024067, 'Air Hostess'),
(100047152, 'Consultant'),
(100074145, 'Cashier'),
(100074568, 'Waitress'),
(100078456, 'Consultant'),
(100085647, 'Captain'),
(100094142, 'Cook'),
(100096296, 'Consultant'),
(100096431, 'Air Host');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE IF NOT EXISTS `suppliers` (
  `Supplier_ID` int(11) NOT NULL,
  `Supplier_Name` varchar(45) DEFAULT NULL,
  `Supplier_Phone` varchar(17) DEFAULT NULL,
  `Supplier_Address` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Supplier_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`Supplier_ID`, `Supplier_Name`, `Supplier_Phone`, `Supplier_Address`) VALUES
(111, 'Coca-Cola', '+359 887 45 21 68', '22 Somerville Str'),
(123, 'Devin', '+359 888 24 03 71', '32 San Stefanon Str.'),
(345, 'Crumbs', '+359 895 12 35 40', '68 Stat Str.'),
(920, 'Fishy''s', '+359 878 01 39 61', '13 Trus Str.');

-- --------------------------------------------------------

--
-- Table structure for table `supplier_type`
--

CREATE TABLE IF NOT EXISTS `supplier_type` (
  `Supplier_Type` varchar(45) NOT NULL,
  `Suppliers_Supplier_ID` int(11) NOT NULL,
  PRIMARY KEY (`Suppliers_Supplier_ID`,`Supplier_Type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier_type`
--

INSERT INTO `supplier_type` (`Supplier_Type`, `Suppliers_Supplier_ID`) VALUES
('Soft Drinks', 111),
('Water ', 123),
('Bread', 345),
('Sea food', 920);

-- --------------------------------------------------------

--
-- Table structure for table `terminals`
--

CREATE TABLE IF NOT EXISTS `terminals` (
  `Terminal_ID` char(11) NOT NULL,
  `Terminal_Name` varchar(20) DEFAULT NULL,
  `Terminal_Type` varchar(20) DEFAULT NULL,
  `Terminal_Location` varchar(50) DEFAULT NULL,
  `Managment_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`Terminal_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `terminals`
--

INSERT INTO `terminals` (`Terminal_ID`, `Terminal_Name`, `Terminal_Type`, `Terminal_Location`, `Managment_ID`) VALUES
('T01', 'Terminal 1', 'Domestic', 'Sofia', 1),
('T02', 'Terminal 2', 'International', 'Sofia', 2);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `airlines_orders`
--
ALTER TABLE `airlines_orders`
  ADD CONSTRAINT `fk_Airlines_has_Items_Airlines1` FOREIGN KEY (`Airlines_Airline_ID`) REFERENCES `airlines` (`Airline_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Airlines_has_Items_Items1` FOREIGN KEY (`Items_Item_ID`, `Items_Supplier_Supplier_ID`) REFERENCES `items` (`Item_ID`, `Supplier_Supplier_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `airline_contracts`
--
ALTER TABLE `airline_contracts`
  ADD CONSTRAINT `fk_Terminals_has_Airlines_Terminals1` FOREIGN KEY (`Terminals_Terminal_ID`) REFERENCES `terminals` (`Terminal_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Terminals_has_Airlines_Airlines1` FOREIGN KEY (`Airlines_Airline_ID`) REFERENCES `airlines` (`Airline_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `airline_employees`
--
ALTER TABLE `airline_employees`
  ADD CONSTRAINT `fk_Airlines_has_Staff_Airlines1` FOREIGN KEY (`Airlines_Airline_ID`) REFERENCES `airlines` (`Airline_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Airlines_has_Staff_Staff1` FOREIGN KEY (`Staff_Staff_ID`) REFERENCES `staff` (`Staff_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `flights`
--
ALTER TABLE `flights`
  ADD CONSTRAINT `flights_ibfk_1` FOREIGN KEY (`Planes_Plane_ID`) REFERENCES `planes` (`Plane_ID`),
  ADD CONSTRAINT `fk_Flights_Airlines1` FOREIGN KEY (`Airlines_Airline_ID`) REFERENCES `airlines` (`Airline_ID`),
  ADD CONSTRAINT `fk_Flights_Gates1` FOREIGN KEY (`Gates_Terminals_Terminal_ID`, `Gates_Gate_ID`) REFERENCES `gates` (`Terminals_Terminal_ID`, `Gate_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `gates`
--
ALTER TABLE `gates`
  ADD CONSTRAINT `fk_Gates_Terminals1` FOREIGN KEY (`Terminals_Terminal_ID`) REFERENCES `terminals` (`Terminal_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `fk_Items_Company1` FOREIGN KEY (`Supplier_Supplier_ID`) REFERENCES `suppliers` (`Supplier_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `project_employees`
--
ALTER TABLE `project_employees`
  ADD CONSTRAINT `fk_Projects_has_Staff_Projects1` FOREIGN KEY (`Projects_Project_ID`) REFERENCES `projects` (`Project_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Projects_has_Staff_Staff1` FOREIGN KEY (`Staff_Staff_ID`) REFERENCES `staff` (`Staff_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `project_execution`
--
ALTER TABLE `project_execution`
  ADD CONSTRAINT `fk_Terminals_has_Projects_Terminals1` FOREIGN KEY (`Terminals_Terminal_ID`) REFERENCES `terminals` (`Terminal_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Terminals_has_Projects_Projects1` FOREIGN KEY (`Projects_Project_ID`) REFERENCES `projects` (`Project_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `restaurants`
--
ALTER TABLE `restaurants`
  ADD CONSTRAINT `fk_Restaurants_Gates1` FOREIGN KEY (`Gates_Terminals_Terminal_ID`, `Gates_Gate_ID`) REFERENCES `gates` (`Terminals_Terminal_ID`, `Gate_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `restaurant_contracts`
--
ALTER TABLE `restaurant_contracts`
  ADD CONSTRAINT `fk_Terminals_has_Restaurants_Terminals1` FOREIGN KEY (`Terminals_Terminal_ID`) REFERENCES `terminals` (`Terminal_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Terminals_has_Restaurants_Restaurants1` FOREIGN KEY (`Restaurants_Restaurant_ID`) REFERENCES `restaurants` (`Restaurant_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `restaurant_employees`
--
ALTER TABLE `restaurant_employees`
  ADD CONSTRAINT `fk_Restaurants_has_Staff_Restaurants1` FOREIGN KEY (`Restaurants_Restaurant_ID`) REFERENCES `restaurants` (`Restaurant_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Restaurants_has_Staff_Staff1` FOREIGN KEY (`Staff_Staff_ID`) REFERENCES `staff` (`Staff_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `restaurant_orders`
--
ALTER TABLE `restaurant_orders`
  ADD CONSTRAINT `fk_Restaurants_has_Items_Restaurants1` FOREIGN KEY (`Restaurants_Restaurant_ID`) REFERENCES `restaurants` (`Restaurant_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Restaurants_has_Items_Items1` FOREIGN KEY (`Items_Item_ID`, `Items_Supplier_Supplier_ID`) REFERENCES `items` (`Item_ID`, `Supplier_Supplier_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `shops`
--
ALTER TABLE `shops`
  ADD CONSTRAINT `fk_Shops_Gates1` FOREIGN KEY (`Gates_Terminals_Terminal_ID`, `Gates_Gate_ID`) REFERENCES `gates` (`Terminals_Terminal_ID`, `Gate_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `shop_contracts`
--
ALTER TABLE `shop_contracts`
  ADD CONSTRAINT `shop_contracts_ibfk_1` FOREIGN KEY (`Shops_Shop_ID`) REFERENCES `shops` (`Shop_ID`),
  ADD CONSTRAINT `fk_Terminals_has_Shops_Terminals1` FOREIGN KEY (`Terminals_Terminal_ID`) REFERENCES `terminals` (`Terminal_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `shop_employees`
--
ALTER TABLE `shop_employees`
  ADD CONSTRAINT `fk_Shops_has_Staff_Staff1` FOREIGN KEY (`Staff_Staff_ID`) REFERENCES `staff` (`Staff_ID`),
  ADD CONSTRAINT `shop_employees_ibfk_1` FOREIGN KEY (`Shops_Shop_ID`) REFERENCES `shops` (`Shop_ID`);

--
-- Constraints for table `shop_orders`
--
ALTER TABLE `shop_orders`
  ADD CONSTRAINT `fk_Shops_has_Items_Items1` FOREIGN KEY (`Items_Item_ID`, `Items_Supplier_Supplier_ID`) REFERENCES `items` (`Item_ID`, `Supplier_Supplier_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `staff_type`
--
ALTER TABLE `staff_type`
  ADD CONSTRAINT `fk_Staff_Type_Staff1` FOREIGN KEY (`Staff_Staff_ID`) REFERENCES `staff` (`Staff_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `supplier_type`
--
ALTER TABLE `supplier_type`
  ADD CONSTRAINT `fk_Supplier_Type_Suppliers1` FOREIGN KEY (`Suppliers_Supplier_ID`) REFERENCES `suppliers` (`Supplier_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
