-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 09, 2013 at 07:31 AM
-- Server version: 5.5.24-log
-- PHP Version: 5.4.3

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `stenmehilane_autolammutus`
--

-- --------------------------------------------------------

--
-- Table structure for table `body_type`
--

DROP TABLE IF EXISTS `body_type`;
CREATE TABLE IF NOT EXISTS `body_type` (
  `id` mediumint(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(15) NOT NULL,
  `deleted` tinyint(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `body_type`
--

INSERT INTO `body_type` (`id`, `name`, `deleted`) VALUES
(1, 'sedaan', 0),
(2, 'luukpära', 0),
(3, 'universaal', 0),
(4, 'mahtuniversaal', 0),
(5, 'kupee', 0);

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
CREATE TABLE IF NOT EXISTS `brand` (
  `id` mediumint(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `deleted` tinyint(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`id`, `name`, `deleted`) VALUES
(6, 'Volkswagen', 0),
(7, 'Ford', 0),
(8, 'Nissan', 0),
(9, 'Opel', 0),
(10, 'Lada', 0);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` mediumint(11) unsigned NOT NULL AUTO_INCREMENT,
  `parent_category_id` mediumint(8) unsigned DEFAULT NULL,
  `name` varchar(30) NOT NULL,
  `deleted` tinyint(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parent_category_id` (`parent_category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `parent_category_id`, `name`, `deleted`) VALUES
(21, NULL, 'Mootor', 0),
(22, NULL, 'Veermik', 0),
(23, NULL, 'Kere', 0),
(24, NULL, 'Küttesüsteem', 0),
(25, NULL, 'Pidurisüsteem', 0);

-- --------------------------------------------------------

--
-- Table structure for table `model`
--

DROP TABLE IF EXISTS `model`;
CREATE TABLE IF NOT EXISTS `model` (
  `id` mediumint(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `brand_id` mediumint(8) unsigned NOT NULL,
  `deleted` tinyint(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `brand_id` (`brand_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `model`
--

INSERT INTO `model` (`id`, `name`, `brand_id`, `deleted`) VALUES
(1, 'Primera', 8, 0),
(2, 'Mondeo', 7, 0),
(3, 'Passat', 6, 0);

-- --------------------------------------------------------

--
-- Table structure for table `model_part`
--

DROP TABLE IF EXISTS `model_part`;
CREATE TABLE IF NOT EXISTS `model_part` (
  `part_id` mediumint(8) unsigned NOT NULL,
  `model_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`part_id`,`model_id`),
  KEY `part_id` (`part_id`),
  KEY `model_id` (`model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `model_part`
--

INSERT INTO `model_part` (`part_id`, `model_id`) VALUES
(2, 2),
(3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_specification`
--

DROP TABLE IF EXISTS `model_specification`;
CREATE TABLE IF NOT EXISTS `model_specification` (
  `model_spec_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `model_id` mediumint(11) unsigned NOT NULL,
  `launch_year` smallint(5) unsigned NOT NULL,
  `end_year` smallint(5) unsigned NOT NULL,
  `engine_size` varchar(10) NOT NULL,
  `body_type_id` mediumint(8) unsigned NOT NULL,
  `deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`model_spec_id`),
  KEY `body_type_id` (`body_type_id`),
  KEY `model_id` (`model_id`),
  KEY `model_id_2` (`model_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `model_specification`
--

INSERT INTO `model_specification` (`model_spec_id`, `model_id`, `launch_year`, `end_year`, `engine_size`, `body_type_id`, `deleted`) VALUES
(1, 1, 1989, 1999, '1.9', 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `part`
--

DROP TABLE IF EXISTS `part`;
CREATE TABLE IF NOT EXISTS `part` (
  `id` mediumint(11) unsigned NOT NULL AUTO_INCREMENT,
  `brand_id` mediumint(8) unsigned NOT NULL,
  `product_code` varchar(25) DEFAULT NULL,
  `category_id` mediumint(11) unsigned NOT NULL,
  `name` varchar(30) NOT NULL,
  `description` varchar(200) NOT NULL,
  `condition_grade` tinyint(11) unsigned NOT NULL,
  `price` decimal(7,2) unsigned NOT NULL,
  `picture` blob NOT NULL,
  `previous_price` decimal(7,2) unsigned NOT NULL,
  `deleted` tinyint(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  KEY `brand_id` (`brand_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `part`
--

INSERT INTO `part` (`id`, `brand_id`, `product_code`, `category_id`, `name`, `description`, `condition_grade`, `price`, `picture`, `previous_price`, `deleted`) VALUES
(1, 6, NULL, 21, 'plokikaas', 'TD 55kw', 0, '90.00', '', '110.00', 0),
(2, 7, NULL, 22, 'piduriketas', 'kulmisrant 2mm', 0, '10.00', '', '15.00', 0),
(3, 8, NULL, 23, 'uks', 'parempoolne', 0, '10.00', '', '15.00', 0),
(4, 9, NULL, 24, 'kõrgsurvepump', 'töökorras', 0, '100.00', '', '150.00', 0),
(5, 10, NULL, 25, 'pidurivõimendi', 'otse venemaalt', 0, '25.00', '', '30.00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `deleted`) VALUES
(1, 'demo', 'demo', 0);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `category_ibfk_1` FOREIGN KEY (`parent_category_id`) REFERENCES `category` (`id`);

--
-- Constraints for table `model_part`
--
ALTER TABLE `model_part`
  ADD CONSTRAINT `model_part_ibfk_1` FOREIGN KEY (`part_id`) REFERENCES `part` (`id`),
  ADD CONSTRAINT `model_part_ibfk_2` FOREIGN KEY (`model_id`) REFERENCES `model` (`id`);

--
-- Constraints for table `model_specification`
--
ALTER TABLE `model_specification`
  ADD CONSTRAINT `model_specification_ibfk_1` FOREIGN KEY (`body_type_id`) REFERENCES `body_type` (`id`),
  ADD CONSTRAINT `model_specification_ibfk_2` FOREIGN KEY (`model_id`) REFERENCES `model` (`id`);

--
-- Constraints for table `part`
--
ALTER TABLE `part`
  ADD CONSTRAINT `part_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `part_ibfk_2` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`id`);
SET FOREIGN_KEY_CHECKS=1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
