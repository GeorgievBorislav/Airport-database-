-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 02, 2015 at 02:12 AM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `mki130`
--

-- --------------------------------------------------------

--
-- Table structure for table `airlines`
--

CREATE TABLE IF NOT EXISTS `airlines` (
  `Airline_ID` char(11) NOT NULL,
  `Airline_Name` varchar(45) NOT NULL,
  `Airline_Origin` varchar(45) NOT NULL,
  PRIMARY KEY (`Airline_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `airlines`
--

INSERT INTO `airlines` (`Airline_ID`, `Airline_Name`, `Airline_Origin`) VALUES
('AF', 'Air France', 'France'),
('BA', 'Bulgaria Air', 'Bulgaria'),
('KL', 'KLM', 'Netherlands'),
('TK', 'Turkish Airlines', 'Turkey'),
('US', 'US Airways', 'United States');

-- --------------------------------------------------------

--
-- Table structure for table `airline_contracts`
--

CREATE TABLE IF NOT EXISTS `airline_contracts` (
  `Terminal_ID` char(11) NOT NULL,
  `Airline_ID` char(11) NOT NULL,
  `Contract_Start_Date` datetime NOT NULL,
  `Contract_Expiration_Date` datetime NOT NULL,
  PRIMARY KEY (`Terminal_ID`,`Airline_ID`),
  KEY `T_ID` (`Terminal_ID`),
  KEY `Airline_ID` (`Airline_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `airline_employees`
--

CREATE TABLE IF NOT EXISTS `airline_employees` (
  `Airline_ID` char(11) NOT NULL,
  `Staff_ID` int(11) NOT NULL,
  `Start_Date` datetime NOT NULL,
  `End_Date` datetime NOT NULL,
  PRIMARY KEY (`Airline_ID`,`Staff_ID`),
  KEY `Staff_ID` (`Staff_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `airline_orders`
--

CREATE TABLE IF NOT EXISTS `airline_orders` (
  `Order_ID` int(11) NOT NULL,
  `Airline_ID` char(11) NOT NULL,
  `Item_ID` char(11) NOT NULL,
  `Supplier_ID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  PRIMARY KEY (`Order_ID`,`Airline_ID`,`Item_ID`,`Supplier_ID`),
  KEY `Airline_ID` (`Airline_ID`),
  KEY `Item_ID` (`Item_ID`),
  KEY `Supplier_ID` (`Supplier_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `flights`
--

CREATE TABLE IF NOT EXISTS `flights` (
  `Flight_ID` int(11) NOT NULL,
  `Plane_ID` int(11) NOT NULL,
  `Airline_ID` char(11) NOT NULL,
  `Terminal_ID` char(11) NOT NULL,
  `Flight_From` varchar(45) NOT NULL,
  `Flight_To` varchar(45) NOT NULL,
  `Flight_DepartureTime` datetime NOT NULL,
  `Flight_ArrivalTime` datetime NOT NULL,
  `Flight_Gate` char(3) NOT NULL,
  PRIMARY KEY (`Flight_ID`,`Plane_ID`,`Airline_ID`,`Terminal_ID`),
  KEY `Plane_ID` (`Plane_ID`),
  KEY `Airline_ID` (`Airline_ID`,`Terminal_ID`),
  KEY `Terminal_ID` (`Terminal_ID`),
  KEY `Flight_ID` (`Flight_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `gates`
--

CREATE TABLE IF NOT EXISTS `gates` (
  `Terminal_ID` char(11) NOT NULL,
  `Gate_ID` char(3) NOT NULL,
  PRIMARY KEY (`Terminal_ID`,`Gate_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gates`
--

INSERT INTO `gates` (`Terminal_ID`, `Gate_ID`) VALUES
('T01', 'A1'),
('T01', 'A2'),
('T01', 'B3'),
('T02', 'C1');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE IF NOT EXISTS `items` (
  `Item_ID` char(11) NOT NULL,
  `Item_Name` varchar(20) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Item_Price` int(20) NOT NULL,
  `Supplier_ID` int(11) NOT NULL,
  PRIMARY KEY (`Item_ID`),
  KEY `Supplier_ID` (`Supplier_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`Item_ID`, `Item_Name`, `Quantity`, `Item_Price`, `Supplier_ID`) VALUES
('I01', 'Apples', 20, 1, 1787),
('I02', 'Bananas ', 25, 1, 1787),
('I03', 'Salmon fish', 12, 3, 1515),
('I04', 'Tuna Fish', 12, 3, 1515),
('I05', 'Chicken Wings', 24, 4, 1475),
('I06', 'Souvenirs', 45, 14, 1245);

-- --------------------------------------------------------

--
-- Table structure for table `planes`
--

CREATE TABLE IF NOT EXISTS `planes` (
  `Plane_ID` int(11) NOT NULL,
  `Plane_Model` varchar(20) NOT NULL,
  `Plane_Capacity` int(11) NOT NULL,
  PRIMARY KEY (`Plane_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `planes`
--

INSERT INTO `planes` (`Plane_ID`, `Plane_Model`, `Plane_Capacity`) VALUES
(1, 'Boeing 777-300E', 440),
(2, 'Airbus A330-300', 327),
(3, 'Airbus A380-700', 525),
(4, 'Embraer 175', 135);

-- --------------------------------------------------------

--
-- Table structure for table `plane_type`
--

CREATE TABLE IF NOT EXISTS `plane_type` (
  `Plane_ID` int(11) NOT NULL,
  `Plane_Type` varchar(10) NOT NULL,
  PRIMARY KEY (`Plane_Type`,`Plane_ID`),
  KEY `Plane_ID` (`Plane_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `plane_type`
--

INSERT INTO `plane_type` (`Plane_ID`, `Plane_Type`) VALUES
(1, 'B737'),
(1, 'B738'),
(2, 'A319');

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE IF NOT EXISTS `projects` (
  `Project_ID` char(11) NOT NULL,
  `Project_Name` varchar(30) NOT NULL,
  `Start_Date` datetime NOT NULL,
  `End_Date` datetime NOT NULL,
  PRIMARY KEY (`Project_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`Project_ID`, `Project_Name`, `Start_Date`, `End_Date`) VALUES
('P01', 'Security Checks', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('P02', 'Supplies Checks ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('P03', 'Flight Checks', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `project_employees`
--

CREATE TABLE IF NOT EXISTS `project_employees` (
  `Project_ID` char(11) NOT NULL,
  `Staff_ID` int(11) NOT NULL,
  `Start_Date` datetime NOT NULL,
  `End_Date` datetime NOT NULL,
  PRIMARY KEY (`Project_ID`,`Staff_ID`),
  KEY `Staff_ID` (`Staff_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `project_employees`
--

INSERT INTO `project_employees` (`Project_ID`, `Staff_ID`, `Start_Date`, `End_Date`) VALUES
('P01', 100047152, '2015-12-02 00:00:00', '2016-12-02 00:00:00'),
('P01', 100074145, '2015-12-02 00:00:00', '2016-03-31 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `project_execution`
--

CREATE TABLE IF NOT EXISTS `project_execution` (
  `Terminal_ID` char(11) NOT NULL,
  `Project_ID` char(11) NOT NULL,
  `Start_Date` datetime NOT NULL,
  `End_Date` datetime NOT NULL,
  PRIMARY KEY (`Terminal_ID`,`Project_ID`),
  KEY `Project_ID` (`Project_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `restaurants`
--

CREATE TABLE IF NOT EXISTS `restaurants` (
  `Restaurant_ID` char(11) NOT NULL,
  `Restaurant_Name` varchar(45) NOT NULL,
  `Restaurant_Phone` varchar(17) NOT NULL,
  `Restaurant_Terminal` char(11) NOT NULL,
  `Restaurant_Gate` char(3) NOT NULL,
  PRIMARY KEY (`Restaurant_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `restaurants`
--

INSERT INTO `restaurants` (`Restaurant_ID`, `Restaurant_Name`, `Restaurant_Phone`, `Restaurant_Terminal`, `Restaurant_Gate`) VALUES
('BKing1093', 'Burger King', '021 - 741 - 985', 'T01', 'A1'),
('STB123', 'Starbucks', '021 - 576 - 694', 'T01', 'A2'),
('SWay40', 'Subway', '021 - 471 - 547', 'T02', 'B3'),
('ThaiTast134', 'Tasty Thai', '021 - 411 - 987', 'T02', 'C1'),
('Wdy23', 'Wendy''s', '021  - 247 - 122', 'T02', 'B3');

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_contracts`
--

CREATE TABLE IF NOT EXISTS `restaurant_contracts` (
  `Terminal_ID` char(11) NOT NULL,
  `Restaurant_ID` char(11) NOT NULL,
  `Contract_Start_Date` datetime NOT NULL,
  `Contract_Expiration_Date` datetime NOT NULL,
  PRIMARY KEY (`Terminal_ID`,`Restaurant_ID`),
  KEY `T_ID` (`Terminal_ID`),
  KEY `Airline_ID` (`Restaurant_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_employees`
--

CREATE TABLE IF NOT EXISTS `restaurant_employees` (
  `Restaurant_ID` char(11) NOT NULL,
  `Staff_ID` int(11) NOT NULL,
  `Start_Date` datetime NOT NULL,
  `End_Date` datetime DEFAULT NULL,
  PRIMARY KEY (`Restaurant_ID`,`Staff_ID`),
  KEY `Restaurant_ID` (`Restaurant_ID`,`Staff_ID`),
  KEY `Staff_ID` (`Staff_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_orders`
--

CREATE TABLE IF NOT EXISTS `restaurant_orders` (
  `Order_ID` int(11) NOT NULL,
  `Restaurant_ID` char(11) NOT NULL,
  `Item_ID` char(11) NOT NULL,
  `Supplier_ID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  PRIMARY KEY (`Order_ID`,`Restaurant_ID`,`Item_ID`,`Supplier_ID`),
  KEY `Restaurant_ID` (`Restaurant_ID`),
  KEY `Item_ID` (`Item_ID`),
  KEY `Supplier_ID` (`Supplier_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `shops`
--

CREATE TABLE IF NOT EXISTS `shops` (
  `Shop_ID` char(11) NOT NULL,
  `Shop_Name` varchar(45) NOT NULL,
  `Shop_Phone` varchar(17) NOT NULL,
  `Shop_Terminal` char(11) NOT NULL,
  `Shop_Gate` char(3) NOT NULL,
  PRIMARY KEY (`Shop_ID`),
  KEY `Shop_Gate` (`Shop_Gate`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shops`
--

INSERT INTO `shops` (`Shop_ID`, `Shop_Name`, `Shop_Phone`, `Shop_Terminal`, `Shop_Gate`) VALUES
('Shop01', 'Discover France', '021-888-333', 'T02', 'A1'),
('Shop02', 'The Flowers''s Shop', '021-444-355', 'T02', 'A2'),
('Shop03', 'Swarovski', '021-369-965', 'T02', 'A1'),
('Shop04', 'Apple', '021-777-666', 'T01', 'B3');

-- --------------------------------------------------------

--
-- Table structure for table `shop_contracts`
--

CREATE TABLE IF NOT EXISTS `shop_contracts` (
  `Terminal_ID` char(11) NOT NULL,
  `Shop_ID` char(11) NOT NULL,
  `Contract_Start_Date` datetime NOT NULL,
  `Contract_Expiration_Date` datetime NOT NULL,
  PRIMARY KEY (`Terminal_ID`,`Shop_ID`),
  KEY `T_ID` (`Terminal_ID`),
  KEY `Airline_ID` (`Shop_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `shop_employees`
--

CREATE TABLE IF NOT EXISTS `shop_employees` (
  `Shop_ID` char(11) NOT NULL,
  `Staff_ID` int(11) NOT NULL,
  `Start_Date` datetime NOT NULL,
  `End_Date` datetime DEFAULT NULL,
  PRIMARY KEY (`Shop_ID`,`Staff_ID`),
  KEY `Shop_ID` (`Shop_ID`,`Staff_ID`),
  KEY `Staff_ID` (`Staff_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `shop_orders`
--

CREATE TABLE IF NOT EXISTS `shop_orders` (
  `Order_ID` int(11) NOT NULL,
  `Shop_ID` char(11) NOT NULL,
  `Item_ID` char(11) NOT NULL,
  `Supplier_ID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  PRIMARY KEY (`Order_ID`,`Shop_ID`,`Item_ID`,`Supplier_ID`),
  KEY `Shop_ID` (`Shop_ID`),
  KEY `Item_ID` (`Item_ID`),
  KEY `Supplier_ID` (`Supplier_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE IF NOT EXISTS `staff` (
  `Staff_ID` int(11) NOT NULL,
  `Staff_Name` varchar(20) NOT NULL,
  `Staff_Phone` varchar(17) NOT NULL,
  `Staff_Address` varchar(45) NOT NULL,
  PRIMARY KEY (`Staff_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`Staff_ID`, `Staff_Name`, `Staff_Phone`, `Staff_Address`) VALUES
(100047152, 'Damon Salvator', '', ''),
(100074145, 'Kate Winslet', '', ''),
(100074568, 'Christian Pann', '', ''),
(100078456, 'Matt Damon', '', ''),
(100085647, 'Angelina Joli ', '', ''),
(100094142, 'Bill Gates', '', ''),
(100096296, 'Kristina Nikiforova', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `staff_type`
--

CREATE TABLE IF NOT EXISTS `staff_type` (
  `Staff_ID` int(11) NOT NULL,
  `Staff_Type` varchar(45) NOT NULL,
  PRIMARY KEY (`Staff_ID`,`Staff_Type`),
  KEY `Staff_ID` (`Staff_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `staff_type`
--

INSERT INTO `staff_type` (`Staff_ID`, `Staff_Type`) VALUES
(100047152, 'Consultant '),
(100074145, 'Consultant '),
(100074568, 'Cashier'),
(100078456, 'Flight Attendant '),
(100085647, 'Waitress'),
(100094142, 'Cashier'),
(100096296, 'Waitress');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE IF NOT EXISTS `suppliers` (
  `Supplier_ID` int(11) NOT NULL,
  `Supplier_Name` varchar(45) NOT NULL,
  `Supplier_Phone` varchar(17) NOT NULL,
  `Supplier_Address` varchar(45) NOT NULL,
  PRIMARY KEY (`Supplier_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`Supplier_ID`, `Supplier_Name`, `Supplier_Phone`, `Supplier_Address`) VALUES
(1245, 'Mike Miller', '0887-745-142', '125 Searsville rd S.Dennis MA'),
(1475, 'Jeffrey Nilson', '0889-598-606', '268 Elizabeth St, NY10012,'),
(1515, 'Steven King', '0889-754-124', '2918 Bluebonnet Lane MA'),
(1787, 'Jake Sullivan', '0877-874-987', '234 Lane Ave.Dennis Port MA');

-- --------------------------------------------------------

--
-- Table structure for table `supplier_type`
--

CREATE TABLE IF NOT EXISTS `supplier_type` (
  `Supplier_Type` char(15) NOT NULL,
  `Supplier_ID` int(11) NOT NULL,
  PRIMARY KEY (`Supplier_Type`,`Supplier_ID`),
  KEY `Supplier_ID` (`Supplier_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier_type`
--

INSERT INTO `supplier_type` (`Supplier_Type`, `Supplier_ID`) VALUES
('Shop supplier', 1245),
('Meat Supplier', 1475),
('Fish Supplier', 1515),
('Fruit Supplier', 1787);

-- --------------------------------------------------------

--
-- Table structure for table `terminals`
--

CREATE TABLE IF NOT EXISTS `terminals` (
  `Terminal_ID` char(11) NOT NULL,
  `Terminal_Name` varchar(20) NOT NULL,
  `Terminal_Type` varchar(20) NOT NULL,
  `Terminal_Location` varchar(50) NOT NULL,
  `Management_ID` int(11) NOT NULL,
  PRIMARY KEY (`Terminal_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `terminals`
--

INSERT INTO `terminals` (`Terminal_ID`, `Terminal_Name`, `Terminal_Type`, `Terminal_Location`, `Management_ID`) VALUES
('T01', 'Terminal 1', 'Domestic', 'Sofia', 1),
('T02', 'Terminal 2', 'International', 'Sofia', 2);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `airline_contracts`
--
ALTER TABLE `airline_contracts`
  ADD CONSTRAINT `airline_contracts_ibfk_2` FOREIGN KEY (`Airline_ID`) REFERENCES `airlines` (`Airline_ID`),
  ADD CONSTRAINT `airline_contracts_ibfk_1` FOREIGN KEY (`Terminal_ID`) REFERENCES `terminals` (`Terminal_ID`);

--
-- Constraints for table `airline_employees`
--
ALTER TABLE `airline_employees`
  ADD CONSTRAINT `airline_employees_ibfk_1` FOREIGN KEY (`Staff_ID`) REFERENCES `staff` (`Staff_ID`);

--
-- Constraints for table `airline_orders`
--
ALTER TABLE `airline_orders`
  ADD CONSTRAINT `airline_orders_ibfk_3` FOREIGN KEY (`Supplier_ID`) REFERENCES `suppliers` (`Supplier_ID`),
  ADD CONSTRAINT `airline_orders_ibfk_1` FOREIGN KEY (`Airline_ID`) REFERENCES `airlines` (`Airline_ID`),
  ADD CONSTRAINT `airline_orders_ibfk_2` FOREIGN KEY (`Item_ID`) REFERENCES `items` (`Item_ID`);

--
-- Constraints for table `flights`
--
ALTER TABLE `flights`
  ADD CONSTRAINT `flights_ibfk_3` FOREIGN KEY (`Terminal_ID`) REFERENCES `terminals` (`Terminal_ID`),
  ADD CONSTRAINT `flights_ibfk_1` FOREIGN KEY (`Plane_ID`) REFERENCES `planes` (`Plane_ID`),
  ADD CONSTRAINT `flights_ibfk_2` FOREIGN KEY (`Airline_ID`) REFERENCES `airlines` (`Airline_ID`);

--
-- Constraints for table `gates`
--
ALTER TABLE `gates`
  ADD CONSTRAINT `gates_ibfk_1` FOREIGN KEY (`Terminal_ID`) REFERENCES `terminals` (`Terminal_ID`);

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_ibfk_1` FOREIGN KEY (`Supplier_ID`) REFERENCES `suppliers` (`Supplier_ID`);

--
-- Constraints for table `plane_type`
--
ALTER TABLE `plane_type`
  ADD CONSTRAINT `plane_type_ibfk_1` FOREIGN KEY (`Plane_ID`) REFERENCES `planes` (`Plane_ID`);

--
-- Constraints for table `project_employees`
--
ALTER TABLE `project_employees`
  ADD CONSTRAINT `project_employees_ibfk_2` FOREIGN KEY (`Staff_ID`) REFERENCES `staff` (`Staff_ID`),
  ADD CONSTRAINT `project_employees_ibfk_1` FOREIGN KEY (`Project_ID`) REFERENCES `projects` (`Project_ID`);

--
-- Constraints for table `project_execution`
--
ALTER TABLE `project_execution`
  ADD CONSTRAINT `project_execution_ibfk_2` FOREIGN KEY (`Project_ID`) REFERENCES `projects` (`Project_ID`),
  ADD CONSTRAINT `project_execution_ibfk_1` FOREIGN KEY (`Terminal_ID`) REFERENCES `terminals` (`Terminal_ID`);

--
-- Constraints for table `restaurant_contracts`
--
ALTER TABLE `restaurant_contracts`
  ADD CONSTRAINT `restaurant_contracts_ibfk_2` FOREIGN KEY (`Restaurant_ID`) REFERENCES `restaurants` (`Restaurant_ID`),
  ADD CONSTRAINT `restaurant_contracts_ibfk_1` FOREIGN KEY (`Terminal_ID`) REFERENCES `terminals` (`Terminal_ID`);

--
-- Constraints for table `restaurant_employees`
--
ALTER TABLE `restaurant_employees`
  ADD CONSTRAINT `restaurant_employees_ibfk_1` FOREIGN KEY (`Restaurant_ID`) REFERENCES `restaurants` (`Restaurant_ID`),
  ADD CONSTRAINT `restaurant_employees_ibfk_2` FOREIGN KEY (`Staff_ID`) REFERENCES `staff` (`Staff_ID`);

--
-- Constraints for table `restaurant_orders`
--
ALTER TABLE `restaurant_orders`
  ADD CONSTRAINT `restaurant_orders_ibfk_3` FOREIGN KEY (`Supplier_ID`) REFERENCES `suppliers` (`Supplier_ID`),
  ADD CONSTRAINT `restaurant_orders_ibfk_1` FOREIGN KEY (`Restaurant_ID`) REFERENCES `restaurants` (`Restaurant_ID`),
  ADD CONSTRAINT `restaurant_orders_ibfk_2` FOREIGN KEY (`Item_ID`) REFERENCES `items` (`Item_ID`);

--
-- Constraints for table `shop_contracts`
--
ALTER TABLE `shop_contracts`
  ADD CONSTRAINT `shop_contracts_ibfk_2` FOREIGN KEY (`Shop_ID`) REFERENCES `shops` (`Shop_ID`),
  ADD CONSTRAINT `shop_contracts_ibfk_1` FOREIGN KEY (`Terminal_ID`) REFERENCES `terminals` (`Terminal_ID`);

--
-- Constraints for table `shop_employees`
--
ALTER TABLE `shop_employees`
  ADD CONSTRAINT `shop_employees_ibfk_1` FOREIGN KEY (`Shop_ID`) REFERENCES `shops` (`Shop_ID`),
  ADD CONSTRAINT `shop_employees_ibfk_2` FOREIGN KEY (`Staff_ID`) REFERENCES `staff` (`Staff_ID`);

--
-- Constraints for table `shop_orders`
--
ALTER TABLE `shop_orders`
  ADD CONSTRAINT `shop_orders_ibfk_3` FOREIGN KEY (`Supplier_ID`) REFERENCES `suppliers` (`Supplier_ID`),
  ADD CONSTRAINT `shop_orders_ibfk_1` FOREIGN KEY (`Shop_ID`) REFERENCES `shops` (`Shop_ID`),
  ADD CONSTRAINT `shop_orders_ibfk_2` FOREIGN KEY (`Item_ID`) REFERENCES `items` (`Item_ID`);

--
-- Constraints for table `staff_type`
--
ALTER TABLE `staff_type`
  ADD CONSTRAINT `staff_type_ibfk_1` FOREIGN KEY (`Staff_ID`) REFERENCES `staff` (`Staff_ID`);

--
-- Constraints for table `supplier_type`
--
ALTER TABLE `supplier_type`
  ADD CONSTRAINT `supplier_type_ibfk_1` FOREIGN KEY (`Supplier_ID`) REFERENCES `suppliers` (`Supplier_ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
