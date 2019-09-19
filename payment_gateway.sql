-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 04, 2019 at 05:12 AM
-- Server version: 5.7.26-0ubuntu0.16.04.1
-- PHP Version: 7.1.29-1+ubuntu16.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `payment_gateway`
--

-- --------------------------------------------------------

--
-- Table structure for table `blacklist`
--

CREATE TABLE `blacklist` (
  `black_id` varchar(255) NOT NULL,
  `created` decimal(18,7) DEFAULT NULL,
  `objectType` varchar(255) DEFAULT NULL,
  `ruleType` varchar(255) DEFAULT NULL,
  `fingerprint` varchar(200) DEFAULT NULL,
  `ipAddress` varchar(200) DEFAULT NULL,
  `ipCountry` varchar(255) DEFAULT NULL,
  `metadataKey` varchar(200) DEFAULT NULL,
  `metadataValue` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `userAgent` varchar(200) DEFAULT NULL,
  `acceptLanguage` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blacklist`
--

INSERT INTO `blacklist` (`black_id`, `created`, `objectType`, `ruleType`, `fingerprint`, `ipAddress`, `ipCountry`, `metadataKey`, `metadataValue`, `email`, `userAgent`, `acceptLanguage`) VALUES
('blr_07f97e64-85d3-11e9-a6a6-966a0a06784e', '1559547702.9898300', 'blacklistRule', 'ipCountry', '0', '0', '0', 'DZ', '0', '0', '0', '0'),
('blr_0d0b4d0e-8396-11e9-a6a6-966a0a06784e', '1559301609.8689800', 'blacklistRule', 'email', '0', '0', '0', '0', '0', 'ashishranjan1@gmail.com', '0', '0'),
('blr_0e1560c8-8395-11e9-a6a6-966a0a06784e', '1559301182.1160400', 'blacklistRule', 'email', '0', '0', '0', '0', '0', 'troy@gmail.com', '0', '0'),
('blr_1463d83e-85d3-11e9-a6a6-966a0a06784e', '1559547723.8195100', 'blacklistRule', 'ipCountry', '0', '0', '0', 'AL', '0', '0', '0', '0'),
('blr_156cf408-85d4-11e9-a6a6-966a0a06784e', '1559548155.0534800', 'blacklistRule', 'ipCountry', '0', '0', '0', 'AI', '0', '0', '0', '0'),
('blr_19bd1558-85d2-11e9-a6a6-966a0a06784e', '1559547303.2960900', 'blacklistRule', 'email', '0', '0', '0', '0', '0', 'dfgdf@gmail.com', '0', '0'),
('blr_20730598-7988-11e9-a6a6-966a0a06784e', '1558196117.8434800', 'blacklistRule', 'email', '0', '0', '0', '0', '0', 'selvan@amalpay.com', '0', '0'),
('blr_23213ee4-81f4-11e9-a6a6-966a0a06784e', '1559122117.2896900', 'blacklistRule', 'email', '0', '0', '0', '0', '0', 'selvan@amalpay.com', '0', '0'),
('blr_2ad29ad6-8387-11e9-a6a6-966a0a06784e', '1559295217.3781100', 'blacklistRule', 'email', '0', '0', '0', '0', '0', 'abhi@gmail.com', '0', '0'),
('blr_2b7b8ac8-845a-11e9-a6a6-966a0a06784e', '1559385842.2951900', 'blacklistRule', 'email', '0', '0', '0', '0', '0', 'vondelmort@gmail.com', '0', '0'),
('blr_32409e92-7989-11e9-a6a6-966a0a06784e', '1558196577.2088400', 'blacklistRule', 'email', '0', '0', '0', '0', '0', 'selvan@amalpay.com', '0', '0'),
('blr_32bf72c4-85d4-11e9-a6a6-966a0a06784e', '1559548204.2480600', 'blacklistRule', 'ipCountry', '0', '0', '0', 'AL', '0', '0', '0', '0'),
('blr_3c95159e-85d2-11e9-a6a6-966a0a06784e', '1559547361.7541400', 'blacklistRule', 'ipCountry', '0', '0', '0', 'AL', '0', '0', '0', '0'),
('blr_42f80446-8393-11e9-a6a6-966a0a06784e', '1559300411.8493600', 'blacklistRule', 'email', '0', '0', '0', '0', '0', 'abhi@gmail.com', '0', '0'),
('blr_5192f4a6-85d3-11e9-a6a6-966a0a06784e', '1559547826.4691100', 'blacklistRule', 'ipCountry', '0', '0', '0', 'DZ', '0', '0', '0', '0'),
('blr_65f69280-8476-11e9-a6a6-966a0a06784e', '1559397966.3177800', 'blacklistRule', 'email', '0', '0', '0', '0', '0', 'rahul.kumar9961@gmail.com', '0', '0'),
('blr_662a5b36-7af0-11e9-a6a6-966a0a06784e', '1558350853.6303400', 'blacklistRule', 'email', '0', '0', '0', '0', '0', 'selvan@amalpay.com', '0', '0'),
('blr_7bdfb0d2-85d3-11e9-a6a6-966a0a06784e', '1559547897.4362800', 'blacklistRule', 'ipCountry', '0', '0', '0', 'AR', '0', '0', '0', '0'),
('blr_82892e28-85d2-11e9-a6a6-966a0a06784e', '1559547479.1166400', 'blacklistRule', 'ipCountry', '0', '0', '0', 'AO', '0', '0', '0', '0'),
('blr_8bbedb0c-82c4-11e9-a6a6-966a0a06784e', '1559211628.1254000', 'blacklistRule', 'fingerprint', '522fd11a5a880b14cbd7f2811c018d75d3e6db828fa3118aa693a6f1', '0', '0', '0', '0', '0', '0', '0'),
('blr_a78a94f4-85d3-11e9-a6a6-966a0a06784e', '1559547970.6982900', 'blacklistRule', 'ipCountry', '0', '0', '0', 'AM', '0', '0', '0', '0'),
('blr_c1daa87e-7af4-11e9-a6a6-966a0a06784e', '1558352725.4453900', 'blacklistRule', 'email', '0', '0', '0', '0', '0', 'ashishranjan@gmail.com', '0', '0'),
('blr_d1dd393e-81f3-11e9-a6a6-966a0a06784e', '1559121980.9484900', 'blacklistRule', 'email', '0', '0', '0', '0', '0', 'ashishranjan@gmail.com', '0', '0');

-- --------------------------------------------------------

--
-- Table structure for table `cards`
--

CREATE TABLE `cards` (
  `card_id` varchar(41) NOT NULL,
  `created` decimal(18,7) DEFAULT NULL,
  `objectType` varchar(255) DEFAULT NULL,
  `first6` int(6) DEFAULT NULL,
  `last4` int(6) DEFAULT NULL,
  `fingerprint` varchar(56) DEFAULT NULL,
  `expMonth` int(2) DEFAULT NULL,
  `expYear` int(2) DEFAULT NULL,
  `cardholderName` varchar(20) DEFAULT NULL,
  `customerId` varchar(41) DEFAULT NULL,
  `brand` varchar(20) DEFAULT NULL,
  `type` varchar(6) DEFAULT NULL,
  `country` varchar(15) DEFAULT NULL,
  `addressLine1` varchar(200) DEFAULT NULL,
  `addressLine2` varchar(200) DEFAULT NULL,
  `addressCity` varchar(200) DEFAULT NULL,
  `addressState` varchar(200) DEFAULT NULL,
  `addressZip` int(6) DEFAULT NULL,
  `addressCountry` varchar(20) DEFAULT NULL,
  `ipAddress` varchar(20) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `userAgent` varchar(200) DEFAULT NULL,
  `acceptLanguage` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cards`
--

INSERT INTO `cards` (`card_id`, `created`, `objectType`, `first6`, `last4`, `fingerprint`, `expMonth`, `expYear`, `cardholderName`, `customerId`, `brand`, `type`, `country`, `addressLine1`, `addressLine2`, `addressCity`, `addressState`, `addressZip`, `addressCountry`, `ipAddress`, `email`, `userAgent`, `acceptLanguage`) VALUES
('card_00dd5349-8214-11e9-a6a6-966a0a06784e', '1559135803.6975000', 'card', 402400, 4842, 'd50bb9e92e1ef4124781e0e6046e8be519bfd96461971f621c28fb82', 8, 2021, 'dasdasdas', '0', 'Visa', 'type', 'country', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('card_0181c941-8215-11e9-a6a6-966a0a06784e', '1559136234.2720400', 'card', 402400, 4842, 'd50bb9e92e1ef4124781e0e6046e8be519bfd96461971f621c28fb82', 8, 2021, 'dasdasdas', '0', 'Visa', 'type', 'country', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('card_0716ba82-85e4-11e9-a6a6-966a0a06784e', '1559555002.9479700', 'card', 401200, 7, '522fd11a5a880b14cbd7f2811c018d75d3e6db828fa3118aa693a6f1', 8, 2021, '', '8d42311d-85e0-11e9-a6a6-966a0a06784e', 'Visa', 'type', 'country', '0', '0', '0', '0', 0, '0', '0', '0', '0', '0'),
('card_086be232-85e3-11e9-a6a6-966a0a06784e', '1559554575.6870200', 'card', 402400, 4842, 'd50bb9e92e1ef4124781e0e6046e8be519bfd96461971f621c28fb82', 5, 2021, '', '8d42311d-85e0-11e9-a6a6-966a0a06784e', 'Visa', 'type', 'country', '0', '0', '0', '0', 0, '0', '0', '0', '0', '0'),
('card_0bcca183-820f-11e9-a6a6-966a0a06784e', '1559133674.5612100', 'card', 402400, 4842, 'd50bb9e92e1ef4124781e0e6046e8be519bfd96461971f621c28fb82', 8, 2021, 'Sample', '0', 'Visa', 'type', 'country', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('card_1835e4c9-8215-11e9-a6a6-966a0a06784e', '1559136272.3622500', 'card', 401200, 7, '522fd11a5a880b14cbd7f2811c018d75d3e6db828fa3118aa693a6f1', 9, 2020, 'fsd', '0', 'Visa', 'type', 'country', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('card_1851aab1-8467-11e9-a6a6-966a0a06784e', '1559391393.6033000', 'card', 402400, 4842, 'd50bb9e92e1ef4124781e0e6046e8be519bfd96461971f621c28fb82', 5, 2023, '', '0', 'Visa', 'type', 'country', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('card_23a2dbf1-85d9-11e9-a6a6-966a0a06784e', '1559550326.3786500', 'card', 402400, 2486, '3ab88ef8a417cd29b05431bfac1180db0b8224fdc06cdb82e4043ff3', 1, 2024, 'dfgfgf', '0', 'Visa', 'type', 'country', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('card_25b0d94a-5f93-11e9-bcdd-966a0a06784e', '1555342120.8690000', 'card', 424242, 4245, '08ad630afe58235e08a5d52924c69e09ca55c9e9b53517e742808708', 12, 25, 'asdfsdf', 'c8316fef-5f8f-11e9-bcdd-966a0a06784e', 'None', 'type', 'country', '0', '0', '0', '0', 0, '0', '0', '0', '0', '0'),
('card_29cd6382-85da-11e9-a6a6-966a0a06784e', '1559550766.2202600', 'card', 401200, 7, '522fd11a5a880b14cbd7f2811c018d75d3e6db828fa3118aa693a6f1', 9, 2026, '', '60079b77-85d9-11e9-a6a6-966a0a06784e', 'Visa', 'type', 'country', '0', '0', '0', '0', 0, '0', '0', '0', '0', '0'),
('card_2c40b07e-85e4-11e9-a6a6-966a0a06784e', '1559555065.2987200', 'card', 401200, 7, '522fd11a5a880b14cbd7f2811c018d75d3e6db828fa3118aa693a6f1', 7, 2020, '', '8d42311d-85e0-11e9-a6a6-966a0a06784e', 'Visa', 'type', 'country', '0', '0', '0', '0', 0, '0', '0', '0', '0', '0'),
('card_2f216f42-85e2-11e9-a6a6-966a0a06784e', '1559554211.1335800', 'card', 402400, 4842, 'd50bb9e92e1ef4124781e0e6046e8be519bfd96461971f621c28fb82', 4, 2022, '', '8d42311d-85e0-11e9-a6a6-966a0a06784e', 'Visa', 'type', 'country', '0', '0', '0', '0', 0, '0', '0', '0', '0', '0'),
('card_34c2d916-85da-11e9-a6a6-966a0a06784e', '1559550784.6061200', 'card', 401200, 7, '522fd11a5a880b14cbd7f2811c018d75d3e6db828fa3118aa693a6f1', 4, 2028, '', '60079b77-85d9-11e9-a6a6-966a0a06784e', 'Visa', 'type', 'country', '0', '0', '0', '0', 0, '0', '0', '0', '0', '0'),
('card_412ad874-600b-11e9-bcdd-966a0a06784e', '1555393706.5745700', 'card', 424242, 4245, '08ad630afe58235e08a5d52924c69e09ca55c9e9b53517e742808708', 12, 25, 'asdfsdf', 'c8316fef-5f8f-11e9-bcdd-966a0a06784e', 'None', 'type', 'country', '0', '0', '0', '0', 0, '0', '0', '0', '0', '0'),
('card_42411ddc-85e4-11e9-a6a6-966a0a06784e', '1559555102.2113500', 'card', 402400, 4842, 'd50bb9e92e1ef4124781e0e6046e8be519bfd96461971f621c28fb82', 2, 2022, '', '8d42311d-85e0-11e9-a6a6-966a0a06784e', 'Visa', 'type', 'country', '0', '0', '0', '0', 0, '0', '0', '0', '0', '0'),
('card_5186d922-85e3-11e9-a6a6-966a0a06784e', '1559554698.3374500', 'card', 401200, 7, '522fd11a5a880b14cbd7f2811c018d75d3e6db828fa3118aa693a6f1', 4, 2021, '', '8d42311d-85e0-11e9-a6a6-966a0a06784e', 'Visa', 'type', 'country', '0', '0', '0', '0', 0, '0', '0', '0', '0', '0'),
('card_56fb42bf-82a3-11e9-a6a6-966a0a06784e', '1559197366.2119300', 'card', 402400, 8684, '317608417e7ab68b9291b33f8c7e9484ee8c503e7f53c967d067035e', 7, 2023, 'Sample', '0', 'Visa', 'type', 'country', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('card_589768f2-85e4-11e9-a6a6-966a0a06784e', '1559555139.6867900', 'card', 402400, 8684, '317608417e7ab68b9291b33f8c7e9484ee8c503e7f53c967d067035e', 1, 2022, '', '8d42311d-85e0-11e9-a6a6-966a0a06784e', 'Visa', 'type', 'country', '0', '0', '0', '0', 0, '0', '0', '0', '0', '0'),
('card_59f7fde9-8214-11e9-a6a6-966a0a06784e', '1559135953.1910800', 'card', 402400, 4842, 'd50bb9e92e1ef4124781e0e6046e8be519bfd96461971f621c28fb82', 8, 2021, 'dasdasdas', '0', 'Visa', 'type', 'country', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('card_5fb8a630-5f94-11e9-bcdd-966a0a06784e', '1555342647.7247100', 'card', 424242, 4245, '08ad630afe58235e08a5d52924c69e09ca55c9e9b53517e742808708', 12, 25, 'asdfsdf', 'c8316fef-5f8f-11e9-bcdd-966a0a06784e', 'None', 'type', 'country', '0', '0', '0', '0', 0, '0', '0', '0', '0', '0'),
('card_626ff609-81ea-11e9-a6a6-966a0a06784e', '1559117928.5373800', 'card', 402400, 8684, '317608417e7ab68b9291b33f8c7e9484ee8c503e7f53c967d067035e', 2, 2021, 'ddfg', '0', 'Visa', 'type', 'country', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('card_6bcbbabd-7af5-11e9-a6a6-966a0a06784e', '1558353010.5603500', 'card', 401200, 7, '522fd11a5a880b14cbd7f2811c018d75d3e6db828fa3118aa693a6f1', 2, 2022, 'neha kumari', '0', 'Visa', 'type', 'country', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('card_6ea401f0-8684-11e9-a6a6-966a0a06784e', '1559623896.1558900', 'card', 402400, 1187, '02eff1364cb2018c2a88f48c2d497ca482e634759353e48858b616cc', 10, 2026, 'test', 'c8be2c17-85cf-11e9-a6a6-966a0a06784e', 'Visa', 'type', 'country', '0', '0', '0', '0', 0, '0', '0', '0', '0', '0'),
('card_7213929e-85e2-11e9-a6a6-966a0a06784e', '1559554323.4500700', 'card', 401200, 7, '522fd11a5a880b14cbd7f2811c018d75d3e6db828fa3118aa693a6f1', 8, 2022, '', '8d42311d-85e0-11e9-a6a6-966a0a06784e', 'Visa', 'type', 'country', '0', '0', '0', '0', 0, '0', '0', '0', '0', '0'),
('card_741d3d77-7af5-11e9-a6a6-966a0a06784e', '1558353024.5162300', 'card', 401200, 7, '522fd11a5a880b14cbd7f2811c018d75d3e6db828fa3118aa693a6f1', 2, 2022, 'neha kumari', '0', 'Visa', 'type', 'country', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('card_82892e2a-85d2-11e9-a6a6-966a0a06784e', '1559547479.2616900', 'card', 402400, 2486, '3ab88ef8a417cd29b05431bfac1180db0b8224fdc06cdb82e4043ff3', 5, 2023, '', '0', 'Visa', 'type', 'country', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('card_8e106bae-5f93-11e9-bcdd-966a0a06784e', '1555342295.9783600', 'card', 424242, 4245, '08ad630afe58235e08a5d52924c69e09ca55c9e9b53517e742808708', 12, 25, 'dadada', 'c8316fef-5f8f-11e9-bcdd-966a0a06784e', 'None', 'type', 'country', '0', '0', '0', '0', 0, '0', '0', '0', '0', '0'),
('card_8e88a7f1-8210-11e9-a6a6-966a0a06784e', '1559134323.3940600', 'card', 402400, 4842, 'd50bb9e92e1ef4124781e0e6046e8be519bfd96461971f621c28fb82', 8, 2021, 'dasdasdas', '0', 'Visa', 'type', 'country', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('card_933f9a0c-5f91-11e9-bcdd-966a0a06784e', '1555341445.6827100', 'card', 424242, 4245, '08ad630afe58235e08a5d52924c69e09ca55c9e9b53517e742808708', 5, 2028, 'asdfsdf', 'c8316fef-5f8f-11e9-bcdd-966a0a06784e', 'None', 'type', 'country', '0', '0', '0', '0', 0, '0', '0', '0', '0', '0'),
('card_98f98390-85e3-11e9-a6a6-966a0a06784e', '1559554818.2071900', 'card', 401200, 7, '522fd11a5a880b14cbd7f2811c018d75d3e6db828fa3118aa693a6f1', 4, 2027, '', '8d42311d-85e0-11e9-a6a6-966a0a06784e', 'Visa', 'type', 'country', '0', '0', '0', '0', 0, '0', '0', '0', '0', '0'),
('card_99f12173-8214-11e9-a6a6-966a0a06784e', '1559136060.5188000', 'card', 402400, 4842, 'd50bb9e92e1ef4124781e0e6046e8be519bfd96461971f621c28fb82', 8, 2021, 'dasdasdas', '0', 'Visa', 'type', 'country', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('card_9c290621-797d-11e9-a6a6-966a0a06784e', '1558191600.9336400', 'card', 402400, 4842, 'd50bb9e92e1ef4124781e0e6046e8be519bfd96461971f621c28fb82', 1, 2020, '', '0', 'Visa', 'type', 'country', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('card_9e28cf98-85e2-11e9-a6a6-966a0a06784e', '1559554397.4090500', 'card', 402400, 8684, '317608417e7ab68b9291b33f8c7e9484ee8c503e7f53c967d067035e', 4, 2022, '', '8d42311d-85e0-11e9-a6a6-966a0a06784e', 'Visa', 'type', 'country', '0', '0', '0', '0', 0, '0', '0', '0', '0', '0'),
('card_a0d2ff68-85e0-11e9-a6a6-966a0a06784e', '1559553542.8862900', 'card', 402400, 4842, 'd50bb9e92e1ef4124781e0e6046e8be519bfd96461971f621c28fb82', 3, 2023, '', '8d42311d-85e0-11e9-a6a6-966a0a06784e', 'Visa', 'type', 'country', '0', '0', '0', '0', 0, '0', '0', '0', '0', '0'),
('card_b0c10afc-85d9-11e9-a6a6-966a0a06784e', '1559550563.1351600', 'card', 401200, 7, '522fd11a5a880b14cbd7f2811c018d75d3e6db828fa3118aa693a6f1', 5, 2021, '', '60079b77-85d9-11e9-a6a6-966a0a06784e', 'Visa', 'type', 'country', '0', '0', '0', '0', 0, '0', '0', '0', '0', '0'),
('card_b3b9e495-797d-11e9-a6a6-966a0a06784e', '1558191640.4690800', 'card', 401200, 7, '522fd11a5a880b14cbd7f2811c018d75d3e6db828fa3118aa693a6f1', 1, 2020, '', '0', 'Visa', 'type', 'country', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('card_c08ee9d3-820e-11e9-a6a6-966a0a06784e', '1559133548.3293600', 'card', 402400, 4842, 'd50bb9e92e1ef4124781e0e6046e8be519bfd96461971f621c28fb82', 8, 2021, 'Sample', '0', 'Visa', 'type', 'country', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('card_c11d22b1-8457-11e9-a6a6-966a0a06784e', '1559384804.8468900', 'card', 401200, 7, '522fd11a5a880b14cbd7f2811c018d75d3e6db828fa3118aa693a6f1', 2, 2020, '', '0', 'Visa', 'type', 'country', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('card_c7909623-820e-11e9-a6a6-966a0a06784e', '1559133560.0807900', 'card', 402400, 4842, 'd50bb9e92e1ef4124781e0e6046e8be519bfd96461971f621c28fb82', 8, 2021, 'Sample', '0', 'Visa', 'type', 'country', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('card_d43ac981-85e5-11e9-a6a6-966a0a06784e', '1559555776.6154900', 'card', 402400, 4842, 'd50bb9e92e1ef4124781e0e6046e8be519bfd96461971f621c28fb82', 5, 2024, 'subhashKr', '0', 'Visa', 'type', 'country', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('card_e0b953f1-82a9-11e9-a6a6-966a0a06784e', '1559200174.2860400', 'card', 402400, 8684, '317608417e7ab68b9291b33f8c7e9484ee8c503e7f53c967d067035e', 7, 2021, 'subhash', '0', 'Visa', 'type', 'country', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('card_e739b606-85e3-11e9-a6a6-966a0a06784e', '1559554949.4901700', 'card', 402400, 1187, '02eff1364cb2018c2a88f48c2d497ca482e634759353e48858b616cc', 6, 2021, '', '8d42311d-85e0-11e9-a6a6-966a0a06784e', 'Visa', 'type', 'country', '0', '0', '0', '0', 0, '0', '0', '0', '0', '0'),
('card_e83d9a1c-8684-11e9-a6a6-966a0a06784e', '1559624100.1668000', 'card', 402400, 8684, '317608417e7ab68b9291b33f8c7e9484ee8c503e7f53c967d067035e', 6, 2022, 'yest1', 'c8be2c17-85cf-11e9-a6a6-966a0a06784e', 'Visa', 'type', 'country', '0', '0', '0', '0', 0, '0', '0', '0', '0', '0'),
('card_ec212f3d-8214-11e9-a6a6-966a0a06784e', '1559136198.4085400', 'card', 402400, 4842, 'd50bb9e92e1ef4124781e0e6046e8be519bfd96461971f621c28fb82', 8, 2021, 'dasdasdas', '0', 'Visa', 'type', 'country', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('card_ee4fdfa3-8457-11e9-a6a6-966a0a06784e', '1559384880.6747000', 'card', 402400, 4842, 'd50bb9e92e1ef4124781e0e6046e8be519bfd96461971f621c28fb82', 2, 2024, 'SERTEART', '0', 'Visa', 'type', 'country', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('card_f000e582-85e0-11e9-a6a6-966a0a06784e', '1559553675.7271400', 'card', 402400, 8684, '317608417e7ab68b9291b33f8c7e9484ee8c503e7f53c967d067035e', 4, 2021, '', '8d42311d-85e0-11e9-a6a6-966a0a06784e', 'Visa', 'type', 'country', '0', '0', '0', '0', 0, '0', '0', '0', '0', '0'),
('card_f3d63040-5f93-11e9-bcdd-966a0a06784e', '1555342466.7243500', 'card', 424242, 4245, '08ad630afe58235e08a5d52924c69e09ca55c9e9b53517e742808708', 12, 25, 'asdfsdf', 'c8316fef-5f8f-11e9-bcdd-966a0a06784e', 'None', 'type', 'country', '0', '0', '0', '0', 0, '0', '0', '0', '0', '0'),
('card_f8625a47-8214-11e9-a6a6-966a0a06784e', '1559136218.9666400', 'card', 402400, 4842, 'd50bb9e92e1ef4124781e0e6046e8be519bfd96461971f621c28fb82', 8, 2021, 'dasdasdas', '0', 'Visa', 'type', 'country', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('card_f8f19b70-7aee-11e9-a6a6-966a0a06784e', '1558350240.8900500', 'card', 402400, 4842, 'd50bb9e92e1ef4124781e0e6046e8be519bfd96461971f621c28fb82', 9, 2022, '', 'c8316fef-5f8f-11e9-bcdd-966a0a06784e', 'Visa', 'type', 'country', '0', '0', '0', '0', 0, '0', '0', '0', '0', '0'),
('card_fd08a225-85d6-11e9-a6a6-966a0a06784e', '1559549402.6230100', 'card', 402400, 8684, '317608417e7ab68b9291b33f8c7e9484ee8c503e7f53c967d067035e', 2, 2021, 'xcvxcvxcv', '0', 'Visa', 'type', 'country', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `charge`
--

CREATE TABLE `charge` (
  `id` varchar(36) NOT NULL,
  `created` decimal(18,7) DEFAULT NULL,
  `objectType` varchar(255) NOT NULL,
  `amount` float(25,5) DEFAULT NULL,
  `currency` varchar(3) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `customerId` varchar(36) DEFAULT NULL,
  `card_id` varchar(41) DEFAULT NULL,
  `captured` tinyint(1) DEFAULT NULL,
  `refunded` tinyint(1) DEFAULT NULL,
  `disputed` tinyint(1) DEFAULT NULL,
  `dispute_id` varchar(255) DEFAULT NULL,
  `fraud_status` varchar(255) DEFAULT NULL,
  `fraud_score` varchar(255) DEFAULT NULL,
  `cso_id` varchar(255) DEFAULT NULL,
  `failureCode` varchar(255) DEFAULT NULL,
  `failureMessage` varchar(255) DEFAULT NULL,
  `metadata` varchar(200) DEFAULT NULL,
  `refunded_amt` float(25,5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `charge`
--

INSERT INTO `charge` (`id`, `created`, `objectType`, `amount`, `currency`, `description`, `customerId`, `card_id`, `captured`, `refunded`, `disputed`, `dispute_id`, `fraud_status`, `fraud_score`, `cso_id`, `failureCode`, `failureMessage`, `metadata`, `refunded_amt`) VALUES
('0181c940-8215-11e9-a6a6-966a0a06784e', '1559136234.2719700', 'charge', 1.00000, 'INR', '0', NULL, 'card_0181c941-8215-11e9-a6a6-966a0a06784e', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('0c53aecc-85eb-11e9-a6a6-966a0a06784e', '1559558018.2150100', 'charge', 1223.00000, 'INR', 'testing...', '60079b77-85d9-11e9-a6a6-966a0a06784e', 'null', 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('1835e4c8-8215-11e9-a6a6-966a0a06784e', '1559136272.3622000', 'charge', 1.00000, 'AED', 'qewew', NULL, 'card_1835e4c9-8215-11e9-a6a6-966a0a06784e', 1, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1.00000),
('1851aab0-8467-11e9-a6a6-966a0a06784e', '1559391393.6032400', 'charge', 233.00000, 'ALL', 'Praveen', NULL, 'card_1851aab1-8467-11e9-a6a6-966a0a06784e', 0, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 233.00000),
('23a2dbf0-85d9-11e9-a6a6-966a0a06784e', '1559550326.3785900', 'charge', 4355.00000, 'EUR', 'zfsdfwqzdsfd', NULL, 'card_23a2dbf1-85d9-11e9-a6a6-966a0a06784e', 1, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4325.00000),
('291ab4c4-82a3-11e9-a6a6-966a0a06784e', '1559197289.2428700', 'charge', 4874.00000, 'EUR', 'priyanka', 'e25c1ecb-601e-11e9-bcdd-966a0a06784e', 'null', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('41536e58-839a-11e9-a6a6-966a0a06784e', '1559303415.5701800', 'charge', 64.00000, 'INR', 'asdasdsa', NULL, 'null', 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('56fb42be-82a3-11e9-a6a6-966a0a06784e', '1559197366.2118400', 'charge', 234.00000, 'NIO', 'Sample', NULL, 'card_56fb42bf-82a3-11e9-a6a6-966a0a06784e', 1, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 234.00000),
('5b880368-60d2-11e9-bcdd-966a0a06784e', '1555479220.6760200', 'charge', 6700.00000, 'USD', 'description', '77855b5f-6058-11e9-bcdd-966a0a06784e', 'card_5b880364-60d2-11e9-bcdd-966a0a06784e', 0, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6700.00000),
('7457565a-605f-11e9-bcdd-966a0a06784e', '1555429870.1682800', 'charge', 500.00000, 'USD', 'charge', '77855b5f-6058-11e9-bcdd-966a0a06784e', 'card_74575656-605f-11e9-bcdd-966a0a06784e', 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('768424c8-839a-11e9-a6a6-966a0a06784e', '1559303504.8086200', 'charge', 64.00000, 'INR', 'test', NULL, 'null', 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('7cc60cec-839b-11e9-a6a6-966a0a06784e', '1559303944.8036400', 'charge', 64.00000, 'INR', 'asdasdsa', NULL, 'null', 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('82892e29-85d2-11e9-a6a6-966a0a06784e', '1559547479.2616500', 'charge', 234.00000, 'AUD', 'cfgbfb', NULL, 'card_82892e2a-85d2-11e9-a6a6-966a0a06784e', 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('961a4382-6060-11e9-bcdd-966a0a06784e', '1555430356.3095400', 'charge', 5000.00000, 'USD', 'charge', '77855b5f-6058-11e9-bcdd-966a0a06784e', 'card_961a437e-6060-11e9-bcdd-966a0a06784e', 0, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6000.00000),
('99f12172-8214-11e9-a6a6-966a0a06784e', '1559136060.5187300', 'charge', 1.00000, 'INR', '0', NULL, 'card_99f12173-8214-11e9-a6a6-966a0a06784e', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 111.10000),
('a0b2c182-6058-11e9-bcdd-966a0a06784e', '1555426938.1133800', 'charge', 500.00000, 'USD', 'charge', '77855b5f-6058-11e9-bcdd-966a0a06784e', 'card_a0b2c17e-6058-11e9-bcdd-966a0a06784e', 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('ab8d50d6-6058-11e9-bcdd-966a0a06784e', '1555426956.3214900', 'charge', 100000.00000, 'USD', 'charge', '77855b5f-6058-11e9-bcdd-966a0a06784e', 'card_ab8d50d2-6058-11e9-bcdd-966a0a06784e', 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('b6f09d8c-605f-11e9-bcdd-966a0a06784e', '1555429981.9037600', 'charge', 500.00000, 'USD', 'charge', '77855b5f-6058-11e9-bcdd-966a0a06784e', 'card_74575656-605f-11e9-bcdd-966a0a06784e', 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('c11d22b0-8457-11e9-a6a6-966a0a06784e', '1559384804.8468000', 'charge', 1234.00000, 'AED', 'DFGHSTYSD', NULL, 'card_c11d22b1-8457-11e9-a6a6-966a0a06784e', 0, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 111.00000),
('d43ac980-85e5-11e9-a6a6-966a0a06784e', '1559555776.6154000', 'charge', 45.00000, 'ALL', 'cxvxcvcv', NULL, 'card_d43ac981-85e5-11e9-a6a6-966a0a06784e', 1, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 37.00000),
('d6628260-8604-11e9-a6a6-966a0a06784e', '1559569094.6301900', 'charge', 1223.00000, 'INR', 'testing...', '60079b77-85d9-11e9-a6a6-966a0a06784e', 'null', 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('da35495e-8604-11e9-a6a6-966a0a06784e', '1559569101.0440700', 'charge', 1223.00000, 'INR', 'testing...', '60079b77-85d9-11e9-a6a6-966a0a06784e', 'null', 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('db846590-6058-11e9-bcdd-966a0a06784e', '1555427036.7938400', 'charge', 1500.00000, 'USD', 'charge', '77855b5f-6058-11e9-bcdd-966a0a06784e', 'card_db84658c-6058-11e9-bcdd-966a0a06784e', 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('e0b953f0-82a9-11e9-a6a6-966a0a06784e', '1559200174.2859300', 'charge', 4323.00000, 'GEL', 'Sample', NULL, 'card_e0b953f1-82a9-11e9-a6a6-966a0a06784e', 1, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5617.00000),
('ec212f3c-8214-11e9-a6a6-966a0a06784e', '1559136198.4084600', 'charge', 1.00000, 'INR', '0', NULL, 'card_ec212f3d-8214-11e9-a6a6-966a0a06784e', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('ece2416e-8399-11e9-a6a6-966a0a06784e', '1559303273.8999100', 'charge', 64.00000, 'INR', 'asdasdsa', NULL, 'null', 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('ee4fdfa2-8457-11e9-a6a6-966a0a06784e', '1559384880.6746400', 'charge', 123456.00000, 'RON', 'cvcxvxczxcx454646876587jhgjuh755475', NULL, 'card_ee4fdfa3-8457-11e9-a6a6-966a0a06784e', 0, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13677.00000),
('ee82a566-605e-11e9-bcdd-966a0a06784e', '1555429645.6515300', 'charge', 500.00000, 'USD', 'charge', '77855b5f-6058-11e9-bcdd-966a0a06784e', 'card_db84658c-6058-11e9-bcdd-966a0a06784e', 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('f8625a46-8214-11e9-a6a6-966a0a06784e', '1559136218.9665600', 'charge', 1.00000, 'INR', '0', NULL, 'card_f8625a47-8214-11e9-a6a6-966a0a06784e', 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('fd08a224-85d6-11e9-a6a6-966a0a06784e', '1559549402.6229300', 'charge', 1222123264.00000, 'AED', 'xzcvxzvcx', NULL, 'card_fd08a225-85d6-11e9-a6a6-966a0a06784e', 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Checkout`
--

CREATE TABLE `Checkout` (
  `charge_amount` float(255,20) DEFAULT NULL,
  `charge_currency` varchar(3) DEFAULT NULL,
  `charge_capture` tinyint(1) DEFAULT NULL,
  `charge_metadata` varchar(255) DEFAULT NULL,
  `subscription_planId` varchar(41) DEFAULT NULL,
  `subscription_captureCharges` tinyint(1) DEFAULT NULL,
  `subscription_metadata` varchar(255) DEFAULT NULL,
  `customCharge_amountOptions` float(255,20) DEFAULT NULL,
  `customCharge_customAmount` float(255,20) DEFAULT NULL,
  `customCharge_currency` varchar(3) DEFAULT NULL,
  `customCharge_capture` tinyint(1) DEFAULT NULL,
  `customCharge_metadata` varchar(255) DEFAULT NULL,
  `customerId` varchar(41) DEFAULT NULL,
  `crossSaleOfferIds` varchar(41) DEFAULT NULL,
  `rememberMe` tinyint(1) DEFAULT NULL,
  `termsAndConditionsUrl` varchar(255) DEFAULT NULL,
  `3D_enable` tinyint(1) DEFAULT NULL,
  `3D_requireEnrolledCard` tinyint(1) DEFAULT NULL,
  `3D_requireSuccessfulLiabilityShiftForEnrolledCard` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `credit`
--

CREATE TABLE `credit` (
  `credit_id` varchar(255) NOT NULL,
  `created` decimal(18,7) DEFAULT NULL,
  `objectType` varchar(255) DEFAULT NULL,
  `amount` int(10) DEFAULT NULL,
  `currency` varchar(10) DEFAULT NULL,
  `card_Id` varchar(41) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `customer_Id` varchar(41) DEFAULT NULL,
  `metadata` varchar(41) DEFAULT NULL,
  `3D_amount` int(10) DEFAULT NULL,
  `3D_currency` varchar(10) DEFAULT NULL,
  `3D_enrolled` tinyint(1) DEFAULT NULL,
  `3D_liabilityShift` varchar(41) DEFAULT NULL,
  `failureCode` varchar(41) DEFAULT NULL,
  `failureMessage` varchar(41) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `CrossSaleOffer`
--

CREATE TABLE `CrossSaleOffer` (
  `cso_id` varchar(100) NOT NULL,
  `created` decimal(18,7) DEFAULT NULL,
  `objectType` varchar(255) DEFAULT NULL,
  `charge_amount` float(255,20) DEFAULT NULL,
  `charge_currency` varchar(3) DEFAULT NULL,
  `charge_capture` tinyint(1) DEFAULT NULL,
  `subscription_planId` varchar(41) DEFAULT NULL,
  `subscription_captureCharges` tinyint(1) DEFAULT NULL,
  `template` varchar(100) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `imageUrl` varchar(100) DEFAULT NULL,
  `companyName` varchar(100) DEFAULT NULL,
  `companyLocation` varchar(100) DEFAULT NULL,
  `termsAndConditionsUrl` varchar(100) DEFAULT NULL,
  `partnerId` varchar(100) DEFAULT NULL,
  `visibleForAllPartners` tinyint(1) DEFAULT NULL,
  `visibleForPartnerId` varchar(255) DEFAULT NULL,
  `metadata` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `CrossSaleOffer`
--

INSERT INTO `CrossSaleOffer` (`cso_id`, `created`, `objectType`, `charge_amount`, `charge_currency`, `charge_capture`, `subscription_planId`, `subscription_captureCharges`, `template`, `title`, `description`, `imageUrl`, `companyName`, `companyLocation`, `termsAndConditionsUrl`, `partnerId`, `visibleForAllPartners`, `visibleForPartnerId`, `metadata`) VALUES
('cso_13b2f3ea-85f9-11e9-a6a6-966a0a06784e', '1559564043.5357700', 'CrossSaleOffer', 77.00000000000000000000, 'UAH', 0, NULL, NULL, 'text_only', 'cxvvc', 'xcvccvcvc', '', 'xcvxcvsfd', 'AR', 'https://securionpay.com/cross-sale', '0', 0, '0', '0'),
('cso_1cb27162-85fb-11e9-a6a6-966a0a06784e', '1559564917.6253700', 'CrossSaleOffer', 1.00000000000000000000, 'AMD', 0, NULL, NULL, 'text_only', 'etr', 'cbvn', '', 'cxv', 'AS', 'https://securionpay.com/cross-sale', '0', 0, '0', '0'),
('cso_25edd072-85ed-11e9-a6a6-966a0a06784e', '1559558920.1597500', 'CrossSaleOffer', NULL, NULL, NULL, 'plan_4b99a3ba-846b-11e9-a6a6-966a0a06784e', 0, 'text_only', 'xvcbvcbb', 'xcsdf', '', 'company nnae', 'IN', 'https://securionpay.com/cross-sale', '0', 0, '0', '0'),
('cso_7bb9a5bc-85fc-11e9-a6a6-966a0a06784e', '1559565506.5529100', 'CrossSaleOffer', 5674567.00000000000000000000, 'BBD', 1, NULL, NULL, 'image_and_text', 'fdghdfh', 'fryhrfy', '', 'dftudfydf', 'AT', 'fdghdfhdfydfh', '0', 0, '0', '0'),
('cso_7dc65054-85ec-11e9-a6a6-966a0a06784e', '1559558638.0436600', 'CrossSaleOffer', NULL, NULL, NULL, 'plan_e2b2442c-85e8-11e9-a6a6-966a0a06784e', 0, 'undefined', 'qwew', 'cvcbdf', '', 'vee', 'KH', 'https://securionpay.com/cross-sale-offers/', '0', 0, '0', '0'),
('cso_8c7e70b4-85fa-11e9-a6a6-966a0a06784e', '1559564675.6927200', 'CrossSaleOffer', 1221212110848.00000000000000000000, 'CDF', 0, NULL, NULL, 'text_only', 'were', 'captured', '', 'captured', 'VU', 'https://securionpay.com/cross-sale', '0', 0, '0', '0'),
('cso_c843993a-8479-11e9-a6a6-966a0a06784e', '1559399419.7294700', 'CrossSaleOffer', 12.00000000000000000000, 'AFN', 0, NULL, NULL, 'image_and_text', 'praveen', 'abhi', '', 'tech', 'BS', 'hkkjjh', '0', 0, '0', '0'),
('cso_e429ae04-85ec-11e9-a6a6-966a0a06784e', '1559558809.8225000', 'CrossSaleOffer', 12.00000000000000000000, 'INR', 0, NULL, NULL, 'text_only', 'XXCV', 'SDFSDF', '', 'SDFSD', 'VU', 'https://securionpay.com/cross-sale-offers', '0', 0, '0', '0');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` varchar(36) NOT NULL,
  `created` decimal(18,7) DEFAULT NULL,
  `objectType` varchar(255) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `defaultCardId` varchar(41) DEFAULT NULL,
  `metadata` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `created`, `objectType`, `email`, `description`, `defaultCardId`, `metadata`) VALUES
('0e01c3b9-85c7-11e9-a6a6-966a0a06784e', '1559542559.1494951', 'customer', 'bcnmbn@gretrgf.com', 'ehtrytyj', '0', '0'),
('18910fc1-85cf-11e9-a6a6-966a0a06784e', '1559546012.8397675', 'customer', 'cvbvcb@gmail.com', 'cvbcnvbn', '0', '0'),
('23c1f6ef-85c9-11e9-a6a6-966a0a06784e', '1559543454.6347320', 'customer', 'uoyiuoew@uhij.com', 'tuyiu', '0', '0'),
('4434007b-85ce-11e9-a6a6-966a0a06784e', '1559545656.5527976', 'customer', 'fsd@gmail.com', 'vcxvcxbvbcv', '0', '0'),
('60079b77-85d9-11e9-a6a6-966a0a06784e', '1559550427.7020780', 'customer', 'aks6dgheh382@gmail.com', 'gsdgsdfgs', '0', '0'),
('7a41eb83-85ce-11e9-a6a6-966a0a06784e', '1559545747.2409778', 'customer', 'vnvbnb@gmail.com', 'trtrrtrr', '0', '0'),
('8d42311d-85e0-11e9-a6a6-966a0a06784e', '1559553510.0606406', 'customer', 'priyanertgwertwka@gmail.com', 'sdtywerywerywertwqert', '0', '0'),
('953c3b3d-85cd-11e9-a6a6-966a0a06784e', '1559545363.0055237', 'customer', 'xcv@gmail.com', 'gdfgfdghfd', '0', '0'),
('b07ca5dd-85c6-11e9-a6a6-966a0a06784e', '1559542402.2490830', 'customer', 'sddff@gmail.com', 'sxxdcdecfevgv', '0', '0'),
('bf05ab6b-85cd-11e9-a6a6-966a0a06784e', '1559545433.1121802', 'customer', 'xfxxf@gmail.com', 'xcvgcxvbcxvb', '0', '0'),
('c8be2c17-85cf-11e9-a6a6-966a0a06784e', '1559546308.4142845', 'customer', 'cxbvvcb@gmail.com', 'vcvcvxc', '0', '0'),
('e6c10a49-85c6-11e9-a6a6-966a0a06784e', '1559542493.2942247', 'customer', 'erhee@yuiuile.com', 'ughijlk', '0', '0'),
('e83d5e61-85cd-11e9-a6a6-966a0a06784e', '1559545502.2637944', 'customer', 'fdgbfhfg@gmail.com', 'vbmvbm', '0', '0'),
('ebdef56f-85c9-11e9-a6a6-966a0a06784e', '1559543790.3690370', 'customer', 'gfast@gmail.com', 'ertyrewty', '0', '0'),
('fbdff997-85c8-11e9-a6a6-966a0a06784e', '1559543387.7225292', 'customer', 'ituyukidf@ituygikh.com', 'utyiui', '0', '0');

-- --------------------------------------------------------

--
-- Table structure for table `data`
--

CREATE TABLE `data` (
  `data_id` varchar(100) NOT NULL,
  `created` decimal(18,7) DEFAULT NULL,
  `objectType` varchar(255) DEFAULT NULL,
  `amount` float(200,10) DEFAULT NULL,
  `currency` varchar(200) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `card` varchar(255) DEFAULT NULL,
  `captured` tinyint(1) DEFAULT NULL,
  `refunded` tinyint(1) DEFAULT NULL,
  `desputed` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data`
--

INSERT INTO `data` (`data_id`, `created`, `objectType`, `amount`, `currency`, `description`, `card`, `captured`, `refunded`, `desputed`) VALUES
('char_00ea63db-85e3-11e9-a6a6-966a0a06784e', '1559554563.0945800', 'Charge_Updated', 4355.0000000000, 'EUR', 'zfsdfwqzdsfd', 'card_23a2dbf1-85d9-11e9-a6a6-966a0a06784e', 1, 0, 0),
('char_012be8a3-8372-11e9-a6a6-966a0a06784e', '1559286128.0706100', 'Customer_Created', NULL, NULL, '0', '0', NULL, NULL, NULL),
('char_0181c943-8215-11e9-a6a6-966a0a06784e', '1559136234.2768700', 'charge', 1.0000000000, 'INR', '0', 'card_0181c941-8215-11e9-a6a6-966a0a06784e', 1, 0, 0),
('char_018908ab-8458-11e9-a6a6-966a0a06784e', '1559384912.9258900', 'Charge_Updated', 123456.0000000000, 'RON', 'ERTASERTFDGHDFHSDYH', 'card_ee4fdfa3-8457-11e9-a6a6-966a0a06784e', 0, 0, 0),
('char_02420c66-85e9-11e9-a6a6-966a0a06784e', '1559557142.3304100', 'charge', 4.0000000000, 'INR', NULL, NULL, NULL, NULL, NULL),
('char_036d6789-8476-11e9-a6a6-966a0a06784e', '1559397801.0023900', 'CrossSaleOfferDeleted', 1.0000000000, 'EUR', NULL, NULL, NULL, NULL, NULL),
('char_0393ddbf-8458-11e9-a6a6-966a0a06784e', '1559384916.3523100', 'Charge_Updated', 123456.0000000000, 'RON', 'ERTASERTFDGHDFHSDYH', 'card_ee4fdfa3-8457-11e9-a6a6-966a0a06784e', 0, 0, 0),
('char_044054a1-8468-11e9-a6a6-966a0a06784e', '1559391789.4332000', 'Customer_Created', NULL, NULL, 'zXcvb', '0', NULL, NULL, NULL),
('char_0599be7b-82da-11e9-a6a6-966a0a06784e', '1559220851.9987800', 'Customer_Created', NULL, NULL, 'asdasdd', '0', NULL, NULL, NULL),
('char_0716ba84-85e4-11e9-a6a6-966a0a06784e', '1559555002.9506400', 'Card_Created', NULL, NULL, NULL, 'card_0716ba82-85e4-11e9-a6a6-966a0a06784e', NULL, NULL, NULL),
('char_075d319d-7aef-11e9-a6a6-966a0a06784e', '1558350265.0833100', 'Card_update', NULL, NULL, NULL, 'card_933f9a0c-5f91-11e9-bcdd-966a0a06784e', NULL, NULL, NULL),
('char_07d6c20b-8477-11e9-a6a6-966a0a06784e', '1559398237.9003000', 'Customer_Deleted', NULL, NULL, NULL, '', NULL, NULL, NULL),
('char_082e6c75-8372-11e9-a6a6-966a0a06784e', '1559286139.8308000', 'Customer_Created', NULL, NULL, '0', '0', NULL, NULL, NULL),
('char_086be234-85e3-11e9-a6a6-966a0a06784e', '1559554575.6911300', 'Card_Created', NULL, NULL, NULL, 'card_086be232-85e3-11e9-a6a6-966a0a06784e', NULL, NULL, NULL),
('char_08a59242-7aec-11e9-a6a6-966a0a06784e', '1558348978.7543900', 'charge', NULL, NULL, NULL, '0', 0, NULL, NULL),
('char_0a133737-845b-11e9-a6a6-966a0a06784e', '1559386215.7434900', 'CrossSaleOfferDeleted', 121.0000000000, 'EUR', NULL, NULL, NULL, NULL, NULL),
('char_0a36365b-85e1-11e9-a6a6-966a0a06784e', '1559553719.6973300', 'Charge_Updated', 4355.0000000000, 'EUR', 'zfsdfwqzxaszxczx', 'card_23a2dbf1-85d9-11e9-a6a6-966a0a06784e', 1, 0, 0),
('char_0aa35b42-7ad8-11e9-a6a6-966a0a06784e', '1558340392.1580200', 'charge', 4.0000000000, 'EUR', '0', NULL, 0, NULL, NULL),
('char_0aef97fe-846b-11e9-a6a6-966a0a06784e', '1559393089.1404600', 'charge', 43.0000000000, 'INR', NULL, NULL, NULL, NULL, NULL),
('char_0b7fe6d3-8372-11e9-a6a6-966a0a06784e', '1559286145.3977700', 'Customer_Created', NULL, NULL, '0', '0', NULL, NULL, NULL),
('char_0c53aece-85eb-11e9-a6a6-966a0a06784e', '1559558018.2189100', 'charge', 1223.0000000000, 'INR', 'testing...', 'null', 0, 0, 0),
('char_0cf1f889-8475-11e9-a6a6-966a0a06784e', '1559397387.4737800', 'CrossSaleOfferDeleted', 121.0000000000, 'EUR', NULL, NULL, NULL, NULL, NULL),
('char_0e01c3bb-85c7-11e9-a6a6-966a0a06784e', '1559542559.1517900', 'Customer_Created', NULL, NULL, 'ehtrytyj', '0', NULL, NULL, NULL),
('char_0e977627-8390-11e9-a6a6-966a0a06784e', '1559299035.4849800', 'Card_update', NULL, NULL, NULL, 'card_8e106bae-5f93-11e9-bcdd-966a0a06784e', NULL, NULL, NULL),
('char_0ea2cc45-8372-11e9-a6a6-966a0a06784e', '1559286150.6616900', 'Customer_Created', NULL, NULL, '0', '0', NULL, NULL, NULL),
('char_0f405fba-846f-11e9-a6a6-966a0a06784e', '1559394814.3671000', 'charge', NULL, NULL, 'fggdfg', NULL, 0, NULL, NULL),
('char_0fbf268f-8476-11e9-a6a6-966a0a06784e', '1559397821.6705800', 'CrossSaleOfferDeleted', 121.0000000000, 'EUR', NULL, NULL, NULL, NULL, NULL),
('char_11b14df3-5f96-11e9-bcdd-966a0a06784e', '1555343375.8100200', 'Customer_Created', NULL, NULL, '0', '0', NULL, NULL, NULL),
('char_11b14df7-5f96-11e9-bcdd-966a0a06784e', '1555343375.8229100', 'Card_Created', NULL, NULL, NULL, 'card_11b14df5-5f96-11e9-bcdd-966a0a06784e', NULL, NULL, NULL),
('char_11c00485-8477-11e9-a6a6-966a0a06784e', '1559398254.5283900', 'Customer_Deleted', NULL, NULL, NULL, '', NULL, NULL, NULL),
('char_133b8971-845c-11e9-a6a6-966a0a06784e', '1559386660.6039300', 'CrossSaleOfferDeleted', 0.0000000000, 'INR', NULL, NULL, NULL, NULL, NULL),
('char_13b2f3ec-85f9-11e9-a6a6-966a0a06784e', '1559564043.5406400', 'charge', 77.0000000000, 'UAH', 'xcvccvcvc', NULL, 0, NULL, NULL),
('char_147b2925-8477-11e9-a6a6-966a0a06784e', '1559398259.1102900', 'Customer_Deleted', NULL, NULL, NULL, '', NULL, NULL, NULL),
('char_14f344a6-83a5-11e9-a6a6-966a0a06784e', '1559308065.5910300', 'charge', 64.0000000000, 'INR', NULL, NULL, NULL, NULL, NULL),
('char_15879ec0-7af0-11e9-a6a6-966a0a06784e', '1558350718.3512000', 'charge', 1.0000000000, 'EUR', NULL, NULL, NULL, NULL, NULL),
('char_15ba5763-82d1-11e9-a6a6-966a0a06784e', '1559217013.5822500', 'Charge_Refund', 234.0000000000, 'NIO', 'Sample', 'card_56fb42bf-82a3-11e9-a6a6-966a0a06784e', 1, 1, 0),
('char_15ebb35e-846b-11e9-a6a6-966a0a06784e', '1559393107.5713900', 'charge', 2.0000000000, 'INR', NULL, NULL, NULL, NULL, NULL),
('char_18138bbd-85da-11e9-a6a6-966a0a06784e', '1559550736.4811500', 'Charge_Updated', 4355.0000000000, 'EUR', 'dfgdfs', 'card_23a2dbf1-85d9-11e9-a6a6-966a0a06784e', 1, 0, 0),
('char_1835e4cb-8215-11e9-a6a6-966a0a06784e', '1559136272.3677100', 'charge', 1.0000000000, 'AED', 'qewew', 'card_1835e4c9-8215-11e9-a6a6-966a0a06784e', 1, 0, 0),
('char_1851aab3-8467-11e9-a6a6-966a0a06784e', '1559391393.6087400', 'charge', 233.0000000000, 'ALL', 'xcvc', 'card_1851aab1-8467-11e9-a6a6-966a0a06784e', 0, 0, 0),
('char_18910fc3-85cf-11e9-a6a6-966a0a06784e', '1559546012.8423600', 'Customer_Created', NULL, NULL, 'cvbcnvbn', '0', NULL, NULL, NULL),
('char_18b6bc0f-845b-11e9-a6a6-966a0a06784e', '1559386240.3031700', 'CrossSaleOfferDeleted', 1223.0000000000, 'INR', NULL, NULL, NULL, NULL, NULL),
('char_193ad859-847a-11e9-a6a6-966a0a06784e', '1559399555.5677300', 'Customer_Deleted', NULL, NULL, NULL, '', NULL, NULL, NULL),
('char_1a5f8e1f-8433-11e9-a6a6-966a0a06784e', '1559369063.2181300', 'charge', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('char_1a817659-85c0-11e9-a6a6-966a0a06784e', '1559539573.6419500', 'Customer_Updated', NULL, NULL, NULL, '0', NULL, NULL, NULL),
('char_1af2c39e-839c-11e9-a6a6-966a0a06784e', '1559304210.1819700', 'charge', 234.0000000000, 'BHD', 'tgrfsd', NULL, 0, NULL, NULL),
('char_1cb27164-85fb-11e9-a6a6-966a0a06784e', '1559564917.6292700', 'charge', 1.0000000000, 'AMD', 'cbvn', NULL, 0, NULL, NULL),
('char_1fcd5031-85ea-11e9-a6a6-966a0a06784e', '1559557621.3903700', 'charge', 3.0000000000, 'INR', NULL, NULL, NULL, NULL, NULL),
('char_2187d76d-82cd-11e9-a6a6-966a0a06784e', '1559215315.3974800', 'Charge_Refund', 432.0000000000, 'GEL', 'Sample', 'card_e0b953f1-82a9-11e9-a6a6-966a0a06784e', 1, 1, 0),
('char_22788e0f-7aef-11e9-a6a6-966a0a06784e', '1558350310.5611900', 'Card_update', NULL, NULL, NULL, 'card_e13fc858-5f91-11e9-bcdd-966a0a06784e', NULL, NULL, NULL),
('char_22fcd10b-85da-11e9-a6a6-966a0a06784e', '1559550754.7871200', 'Charge_Updated', 4355.0000000000, 'EUR', 'dfgdfsvjhgj', 'card_23a2dbf1-85d9-11e9-a6a6-966a0a06784e', 1, 0, 0),
('char_23a2dbf3-85d9-11e9-a6a6-966a0a06784e', '1559550326.3824900', 'charge', 4355.0000000000, 'EUR', 'dfgdf', 'card_23a2dbf1-85d9-11e9-a6a6-966a0a06784e', 1, 0, 0),
('char_23b45bc9-837c-11e9-a6a6-966a0a06784e', '1559290480.9720400', 'Customer_Updated', NULL, NULL, NULL, '0', NULL, NULL, NULL),
('char_23c1f6f1-85c9-11e9-a6a6-966a0a06784e', '1559543454.6373000', 'Customer_Created', NULL, NULL, 'tuyiu', '0', NULL, NULL, NULL),
('char_24337a91-8458-11e9-a6a6-966a0a06784e', '1559384971.0880800', 'Customer_Created', NULL, NULL, 'vcbdf', '0', NULL, NULL, NULL),
('char_25b0d94c-5f93-11e9-bcdd-966a0a06784e', '1555342120.8715000', 'Card_Created', NULL, NULL, NULL, 'card_25b0d94a-5f93-11e9-bcdd-966a0a06784e', NULL, NULL, NULL),
('char_25cb8559-82cd-11e9-a6a6-966a0a06784e', '1559215322.5516100', 'Charge_Refund', 863.0000000000, 'GEL', 'Sample', 'card_e0b953f1-82a9-11e9-a6a6-966a0a06784e', 1, 1, 0),
('char_25edd074-85ed-11e9-a6a6-966a0a06784e', '1559558920.1638200', 'charge', NULL, NULL, 'xcsdf', NULL, 0, NULL, NULL),
('char_26a67fc3-8477-11e9-a6a6-966a0a06784e', '1559398289.5933000', 'Customer_Deleted', NULL, NULL, NULL, '', NULL, NULL, NULL),
('char_26bfcbe9-85ea-11e9-a6a6-966a0a06784e', '1559557633.0458700', 'charge', 67.0000000000, 'GEL', NULL, NULL, NULL, NULL, NULL),
('char_26ea4f7f-845c-11e9-a6a6-966a0a06784e', '1559386693.6261100', 'CrossSaleOfferDeleted', 121.0000000000, 'EUR', NULL, NULL, NULL, NULL, NULL),
('char_291ab4c6-82a3-11e9-a6a6-966a0a06784e', '1559197289.2465100', 'charge', 4874.0000000000, 'EUR', 'priyanka', 'null', 1, 0, 0),
('char_29cd6384-85da-11e9-a6a6-966a0a06784e', '1559550766.2223800', 'Card_Created', NULL, NULL, NULL, 'card_29cd6382-85da-11e9-a6a6-966a0a06784e', NULL, NULL, NULL),
('char_2a06ecf0-846b-11e9-a6a6-966a0a06784e', '1559393141.3013000', 'charge', 2.0000000000, 'INR', NULL, NULL, NULL, NULL, NULL),
('char_2a63c7e3-8476-11e9-a6a6-966a0a06784e', '1559397866.3703100', 'CrossSaleOfferDeleted', 1212.0000000000, 'AZN', NULL, NULL, NULL, NULL, NULL),
('char_2acddb9f-85e0-11e9-a6a6-966a0a06784e', '1559553344.8815100', 'Charge_Updated', 4355.0000000000, 'EUR', 'zfsdfwq', 'card_23a2dbf1-85d9-11e9-a6a6-966a0a06784e', 1, 0, 0),
('char_2b2b88d0-839d-11e9-a6a6-966a0a06784e', '1559304666.8936900', 'charge', 121.0000000000, 'EUR', 'adsdd', NULL, 0, NULL, NULL),
('char_2bdec51f-847a-11e9-a6a6-966a0a06784e', '1559399586.8408700', 'Customer_Deleted', NULL, NULL, NULL, '', NULL, NULL, NULL),
('char_2c0ba9cf-8684-11e9-a6a6-966a0a06784e', '1559623784.4280400', 'Customer_Updated', NULL, NULL, NULL, '0', NULL, NULL, NULL),
('char_2c40b080-85e4-11e9-a6a6-966a0a06784e', '1559555065.3023500', 'Card_Created', NULL, NULL, NULL, 'card_2c40b07e-85e4-11e9-a6a6-966a0a06784e', NULL, NULL, NULL),
('char_2cc10c62-85e9-11e9-a6a6-966a0a06784e', '1559557213.6270300', 'charge', 32.0000000000, 'INR', NULL, NULL, NULL, NULL, NULL),
('char_2d76c69c-839b-11e9-a6a6-966a0a06784e', '1559303811.7505500', 'charge', 121.0000000000, 'EUR', 'adsdd', NULL, 0, NULL, NULL),
('char_2f1f2327-838b-11e9-a6a6-966a0a06784e', '1559296942.5776500', 'Card_Deleted', NULL, NULL, NULL, 'card_c4d23545-5f99-11e9-bcdd-966a0a06784e', NULL, NULL, NULL),
('char_2f216f44-85e2-11e9-a6a6-966a0a06784e', '1559554211.1363100', 'Card_Created', NULL, NULL, NULL, 'card_2f216f42-85e2-11e9-a6a6-966a0a06784e', NULL, NULL, NULL),
('char_2f86fc8f-85da-11e9-a6a6-966a0a06784e', '1559550775.8252800', 'Charge_Updated', 4355.0000000000, 'EUR', 'dfgdfs', 'card_23a2dbf1-85d9-11e9-a6a6-966a0a06784e', 1, 0, 0),
('char_2fd186bd-8458-11e9-a6a6-966a0a06784e', '1559384990.5785600', 'Customer_Created', NULL, NULL, 'cxxxcxzxx', '0', NULL, NULL, NULL),
('char_30e33328-8432-11e9-a6a6-966a0a06784e', '1559368671.5018700', 'charge', NULL, NULL, NULL, '0', 0, NULL, NULL),
('char_318ff22b-8476-11e9-a6a6-966a0a06784e', '1559397878.4037100', 'CrossSaleOfferDeleted', 4.0000000000, 'EUR', NULL, NULL, NULL, NULL, NULL),
('char_3219017f-8475-11e9-a6a6-966a0a06784e', '1559397449.8052900', 'CrossSaleOfferDeleted', 234.0000000000, 'BHD', NULL, NULL, NULL, NULL, NULL),
('char_3226a5d9-8478-11e9-a6a6-966a0a06784e', '1559398738.3848500', 'Customer_Deleted', NULL, NULL, NULL, '', NULL, NULL, NULL),
('char_33958887-85e4-11e9-a6a6-966a0a06784e', '1559555077.5988000', 'Card_update', NULL, NULL, NULL, 'card_2c40b07e-85e4-11e9-a6a6-966a0a06784e', NULL, NULL, NULL),
('char_33be9672-85d2-11e9-a6a6-966a0a06784e', '1559547346.9294600', 'Card_Created', NULL, NULL, NULL, 'card_33be9670-85d2-11e9-a6a6-966a0a06784e', NULL, NULL, NULL),
('char_33cb9bf7-8463-11e9-a6a6-966a0a06784e', '1559389721.7123700', 'Charge_Refund', 246.0000000000, 'RON', 'cvcxvxczxcx454646876587jhgjuh755475', 'card_ee4fdfa3-8457-11e9-a6a6-966a0a06784e', 0, 1, 0),
('char_34c2d918-85da-11e9-a6a6-966a0a06784e', '1559550784.6086500', 'Card_Created', NULL, NULL, NULL, 'card_34c2d916-85da-11e9-a6a6-966a0a06784e', NULL, NULL, NULL),
('char_350e3b37-82ce-11e9-a6a6-966a0a06784e', '1559215777.6512200', 'Charge_Refund', 5617.0000000000, 'GEL', 'Sample', 'card_e0b953f1-82a9-11e9-a6a6-966a0a06784e', 1, 1, 0),
('char_3563d3c4-846b-11e9-a6a6-966a0a06784e', '1559393160.3654500', 'charge', 56789.0000000000, 'SDG', NULL, NULL, NULL, NULL, NULL),
('char_360203a5-7aec-11e9-a6a6-966a0a06784e', '1558349054.8485800', 'Customer_Deleted', NULL, NULL, NULL, 'card_b8f36660-7aea-11e9-a6a6-966a0a06784e', NULL, NULL, NULL),
('char_36cfb1db-82cd-11e9-a6a6-966a0a06784e', '1559215351.1000800', 'Charge_Refund', 1294.0000000000, 'GEL', 'Sample', 'card_e0b953f1-82a9-11e9-a6a6-966a0a06784e', 1, 1, 0),
('char_3724a90d-838f-11e9-a6a6-966a0a06784e', '1559298674.0225700', 'Card_update', NULL, NULL, NULL, 'card_8e106bae-5f93-11e9-bcdd-966a0a06784e', NULL, NULL, NULL),
('char_37a06d79-7979-11e9-a6a6-966a0a06784e', '1558189714.2777700', 'Customer_Updated', NULL, NULL, NULL, '0', NULL, NULL, NULL),
('char_39e6bf13-8390-11e9-a6a6-966a0a06784e', '1559299108.1465900', 'Card_update', NULL, NULL, NULL, 'card_8e106bae-5f93-11e9-bcdd-966a0a06784e', NULL, NULL, NULL),
('char_3d63fac9-797d-11e9-a6a6-966a0a06784e', '1558191441.9348500', 'Customer_Deleted', NULL, NULL, NULL, 'card_5b880364-60d2-11e9-bcdd-966a0a06784e', NULL, NULL, NULL),
('char_3e16faa3-845d-11e9-a6a6-966a0a06784e', '1559387162.0031100', 'CrossSaleOfferDeleted', 654.0000000000, 'AZN', NULL, NULL, NULL, NULL, NULL),
('char_3fb2991b-85da-11e9-a6a6-966a0a06784e', '1559550802.9546400', 'Charge_Updated', 4355.0000000000, 'EUR', 'dfgdfsdsf', 'card_23a2dbf1-85d9-11e9-a6a6-966a0a06784e', 1, 0, 0),
('char_40964812-846b-11e9-a6a6-966a0a06784e', '1559393179.1536400', 'charge', 2122.0000000000, 'DJF', NULL, NULL, NULL, NULL, NULL),
('char_40c9c97d-82da-11e9-a6a6-966a0a06784e', '1559220951.2988200', 'Customer_Created', NULL, NULL, 'asdasdd', '0', NULL, NULL, NULL),
('char_412ad876-600b-11e9-bcdd-966a0a06784e', '1555393706.5774500', 'Card_Created', NULL, NULL, NULL, 'card_412ad874-600b-11e9-bcdd-966a0a06784e', NULL, NULL, NULL),
('char_41536e5a-839a-11e9-a6a6-966a0a06784e', '1559303415.5735200', 'charge', 64.0000000000, 'INR', 'asdasdsa', 'null', 0, 0, 0),
('char_41822329-8477-11e9-a6a6-966a0a06784e', '1559398334.6536700', 'Customer_Deleted', NULL, NULL, NULL, '', NULL, NULL, NULL),
('char_41872536-7af0-11e9-a6a6-966a0a06784e', '1558350792.1678600', 'charge', 2.0000000000, 'AED', NULL, NULL, NULL, NULL, NULL),
('char_421ee6bd-8473-11e9-a6a6-966a0a06784e', '1559396617.6939400', 'CrossSaleOfferDeleted', 1221.0000000000, 'AOA', NULL, NULL, NULL, NULL, NULL),
('char_42411dde-85e4-11e9-a6a6-966a0a06784e', '1559555102.2150700', 'Card_Created', NULL, NULL, NULL, 'card_42411ddc-85e4-11e9-a6a6-966a0a06784e', NULL, NULL, NULL),
('char_42449093-85c2-11e9-a6a6-966a0a06784e', '1559540499.3452500', 'Customer_Deleted', NULL, NULL, NULL, '', NULL, NULL, NULL),
('char_4434007d-85ce-11e9-a6a6-966a0a06784e', '1559545656.5549700', 'Customer_Created', NULL, NULL, 'vcxvcxbvbcv', '0', NULL, NULL, NULL),
('char_45c8f161-8435-11e9-a6a6-966a0a06784e', '1559369995.0443400', 'charge', 1234123.0000000000, 'EUR', NULL, NULL, NULL, NULL, NULL),
('char_46585734-8468-11e9-a6a6-966a0a06784e', '1559391900.3217100', 'charge', 54.0000000000, 'AUD', NULL, NULL, NULL, NULL, NULL),
('char_48a0f13f-8477-11e9-a6a6-966a0a06784e', '1559398346.5996200', 'Charge_Refund', 10.0000000000, 'ALL', 'xcvc', 'card_1851aab1-8467-11e9-a6a6-966a0a06784e', 0, 1, 0),
('char_48a44ded-7af0-11e9-a6a6-966a0a06784e', '1558350804.0981400', 'charge', 1.0000000000, 'INR', NULL, NULL, NULL, NULL, NULL),
('char_48b4b20b-600c-11e9-bcdd-966a0a06784e', '1555394148.7205200', 'Customer_Created', NULL, NULL, '0', '0', NULL, NULL, NULL),
('char_48b4b20f-600c-11e9-bcdd-966a0a06784e', '1555394148.7337800', 'Card_Created', NULL, NULL, NULL, 'card_48b4b20d-600c-11e9-bcdd-966a0a06784e', NULL, NULL, NULL),
('char_4acfe642-85e9-11e9-a6a6-966a0a06784e', '1559557264.0568600', 'charge', 67.0000000000, 'GEL', NULL, NULL, NULL, NULL, NULL),
('char_4b2163e7-8376-11e9-a6a6-966a0a06784e', '1559287970.1372600', 'Customer_Updated', NULL, NULL, NULL, 'card_99e40204-836c-11e9-a6a6-966a0a06784e', NULL, NULL, NULL),
('char_4b99a3bc-846b-11e9-a6a6-966a0a06784e', '1559393197.6273600', 'charge', 3223.0000000000, 'DJF', NULL, NULL, NULL, NULL, NULL),
('char_4bfce2e3-85bd-11e9-a6a6-966a0a06784e', '1559538368.1690400', 'Customer_Deleted', NULL, NULL, NULL, '', NULL, NULL, NULL),
('char_4c4a21e1-797b-11e9-a6a6-966a0a06784e', '1558190607.9378200', 'Card_update', NULL, NULL, NULL, 'card_f7d12c30-797a-11e9-a6a6-966a0a06784e', NULL, NULL, NULL),
('char_4d89a875-8479-11e9-a6a6-966a0a06784e', '1559399213.8289100', 'Charge_Updated', 233.0000000000, 'ALL', 'xcvckhgkih', 'card_1851aab1-8467-11e9-a6a6-966a0a06784e', 0, 1, 0),
('char_4da664ca-8438-11e9-a6a6-966a0a06784e', '1559371296.7363900', 'charge', 1223.0000000000, 'INR', '0', NULL, 0, NULL, NULL),
('char_4f706921-85c3-11e9-a6a6-966a0a06784e', '1559540950.9397600', 'Customer_Deleted', NULL, NULL, NULL, '', NULL, NULL, NULL),
('char_4fc85b25-85c5-11e9-a6a6-966a0a06784e', '1559541810.5096300', 'Customer_Deleted', NULL, NULL, NULL, '', NULL, NULL, NULL),
('char_5186d924-85e3-11e9-a6a6-966a0a06784e', '1559554698.3405500', 'Card_Created', NULL, NULL, NULL, 'card_5186d922-85e3-11e9-a6a6-966a0a06784e', NULL, NULL, NULL),
('char_5186d927-85e3-11e9-a6a6-966a0a06784e', '1559554699.1887900', 'Charge_Refund', 4325.0000000000, 'EUR', 'zfsdfwqzdsfd', 'card_23a2dbf1-85d9-11e9-a6a6-966a0a06784e', 1, 1, 0),
('char_531f8b5d-8477-11e9-a6a6-966a0a06784e', '1559398364.2064000', 'Charge_Refund', 233.0000000000, 'ALL', 'xcvc', 'card_1851aab1-8467-11e9-a6a6-966a0a06784e', 0, 1, 0),
('char_543e77ff-8431-11e9-a6a6-966a0a06784e', '1559368301.3231100', 'charge', NULL, NULL, NULL, '0', 0, NULL, NULL),
('char_5536b244-7af6-11e9-a6a6-966a0a06784e', '1558353402.1735100', 'Card_Created', NULL, NULL, NULL, 'card_5536b242-7af6-11e9-a6a6-966a0a06784e', NULL, NULL, NULL),
('char_569c6bb1-8477-11e9-a6a6-966a0a06784e', '1559398370.0578900', 'Customer_Deleted', NULL, NULL, NULL, '', NULL, NULL, NULL),
('char_56fb42c1-82a3-11e9-a6a6-966a0a06784e', '1559197366.2191800', 'charge', 234.0000000000, 'NIO', 'Sample', 'card_56fb42bf-82a3-11e9-a6a6-966a0a06784e', 1, 0, 0),
('char_57153ce1-838f-11e9-a6a6-966a0a06784e', '1559298727.6084900', 'Card_update', NULL, NULL, NULL, 'card_8e106bae-5f93-11e9-bcdd-966a0a06784e', NULL, NULL, NULL),
('char_58492439-797a-11e9-a6a6-966a0a06784e', '1558190198.5672800', 'Customer_Updated', NULL, NULL, NULL, '0', NULL, NULL, NULL),
('char_585352c9-8467-11e9-a6a6-966a0a06784e', '1559391500.9891900', 'Customer_Created', NULL, NULL, 'sample', '0', NULL, NULL, NULL),
('char_589768f4-85e4-11e9-a6a6-966a0a06784e', '1559555139.6896400', 'Card_Created', NULL, NULL, NULL, 'card_589768f2-85e4-11e9-a6a6-966a0a06784e', NULL, NULL, NULL),
('char_598f9356-8438-11e9-a6a6-966a0a06784e', '1559371316.7192800', 'charge', 1223.0000000000, 'INR', '0', NULL, 0, NULL, NULL),
('char_5a51c59b-8461-11e9-a6a6-966a0a06784e', '1559388927.3516000', 'Charge_Updated', 123456.0000000000, 'RON', 'cvcxvxczxcx', 'card_ee4fdfa3-8457-11e9-a6a6-966a0a06784e', 0, 1, 0),
('char_5aa6a278-839a-11e9-a6a6-966a0a06784e', '1559303458.0651600', 'charge', 1212.0000000000, 'AZN', 'csdcsc', NULL, 0, NULL, NULL),
('char_5b880366-60d2-11e9-bcdd-966a0a06784e', '1555479220.6618100', 'Card_Created', NULL, NULL, NULL, 'card_5b880364-60d2-11e9-bcdd-966a0a06784e', NULL, NULL, NULL),
('char_5b88036a-60d2-11e9-bcdd-966a0a06784e', '1555479220.6789700', 'charge', 8000.0000000000, 'USD', 'charge', 'card_5b880364-60d2-11e9-bcdd-966a0a06784e', 0, 0, 0),
('char_5c7ead3f-85e1-11e9-a6a6-966a0a06784e', '1559553857.7454100', 'Customer_Updated', NULL, NULL, NULL, '0', NULL, NULL, NULL),
('char_5cc44903-85be-11e9-a6a6-966a0a06784e', '1559538825.8161900', 'Customer_Deleted', NULL, NULL, NULL, 'card_48b4b20d-600c-11e9-bcdd-966a0a06784e', NULL, NULL, NULL),
('char_5e41310b-8479-11e9-a6a6-966a0a06784e', '1559399241.8752400', 'Customer_Deleted', NULL, NULL, NULL, '', NULL, NULL, NULL),
('char_5e900791-7979-11e9-a6a6-966a0a06784e', '1558189779.6014300', 'Customer_Updated', NULL, NULL, NULL, '0', NULL, NULL, NULL),
('char_5fb8a632-5f94-11e9-bcdd-966a0a06784e', '1555342647.7270600', 'Card_Created', NULL, NULL, NULL, 'card_5fb8a630-5f94-11e9-bcdd-966a0a06784e', NULL, NULL, NULL),
('char_60079b79-85d9-11e9-a6a6-966a0a06784e', '1559550427.7040700', 'Customer_Created', NULL, NULL, 'gsdgsdfgs', '0', NULL, NULL, NULL),
('char_6046f12a-846b-11e9-a6a6-966a0a06784e', '1559393232.3185500', 'charge', 2.0000000000, 'NAD', NULL, NULL, NULL, NULL, NULL),
('char_606dee5b-8479-11e9-a6a6-966a0a06784e', '1559399245.5238900', 'Charge_Updated', 4323.0000000000, 'GEL', 'Samples', 'card_e0b953f1-82a9-11e9-a6a6-966a0a06784e', 1, 1, 0),
('char_60da011f-8477-11e9-a6a6-966a0a06784e', '1559398387.2387400', 'Customer_Deleted', NULL, NULL, NULL, '', NULL, NULL, NULL),
('char_60e841de-8438-11e9-a6a6-966a0a06784e', '1559371329.0422100', 'charge', 1223.0000000000, 'INR', '0', NULL, 0, NULL, NULL),
('char_61a0952b-85c3-11e9-a6a6-966a0a06784e', '1559540981.4543300', 'Customer_Deleted', NULL, NULL, NULL, '', NULL, NULL, NULL),
('char_6461119b-8479-11e9-a6a6-966a0a06784e', '1559399252.1504800', 'Charge_Updated', 233.0000000000, 'ALL', 'ouyuio', 'card_1851aab1-8467-11e9-a6a6-966a0a06784e', 0, 1, 0),
('char_6461119e-8479-11e9-a6a6-966a0a06784e', '1559399252.6547700', 'Charge_Updated', 233.0000000000, 'ALL', 'ouyuio', 'card_1851aab1-8467-11e9-a6a6-966a0a06784e', 0, 1, 0),
('char_646111a1-8479-11e9-a6a6-966a0a06784e', '1559399252.9125800', 'Charge_Updated', 233.0000000000, 'ALL', 'ouyuio', 'card_1851aab1-8467-11e9-a6a6-966a0a06784e', 0, 1, 0),
('char_64758a65-85df-11e9-a6a6-966a0a06784e', '1559553012.1140500', 'Charge_Updated', 4355.0000000000, 'EUR', 'dfgdfsdsfsfd', 'card_23a2dbf1-85d9-11e9-a6a6-966a0a06784e', 1, 0, 0),
('char_65ab7c0b-85d9-11e9-a6a6-966a0a06784e', '1559550437.1647100', 'Charge_Updated', 4355.0000000000, 'EUR', 'dfgdfsdfsdf', 'card_23a2dbf1-85d9-11e9-a6a6-966a0a06784e', 1, 0, 0),
('char_65c0e34f-85e1-11e9-a6a6-966a0a06784e', '1559553873.2788100', 'Customer_Updated', NULL, NULL, NULL, '0', NULL, NULL, NULL),
('char_6661eadf-8477-11e9-a6a6-966a0a06784e', '1559398396.5180300', 'Charge_Refund', 111.0000000000, 'AED', 'DFGHSTYSD', 'card_c11d22b1-8457-11e9-a6a6-966a0a06784e', 0, 1, 0),
('char_67146c10-8472-11e9-a6a6-966a0a06784e', '1559396250.2109700', 'charge', NULL, NULL, 'xcvcbvb', NULL, 0, NULL, NULL),
('char_67f04b8d-8479-11e9-a6a6-966a0a06784e', '1559399258.1223100', 'Charge_Updated', 233.0000000000, 'ALL', 'Praveen', 'card_1851aab1-8467-11e9-a6a6-966a0a06784e', 0, 1, 0),
('char_691204c0-797b-11e9-a6a6-966a0a06784e', '1558190656.2277600', 'charge', 1.0000000000, 'INR', NULL, NULL, NULL, NULL, NULL),
('char_69387273-85e0-11e9-a6a6-966a0a06784e', '1559553449.5988300', 'Charge_Updated', 4355.0000000000, 'EUR', 'zfsdfwqzxas', 'card_23a2dbf1-85d9-11e9-a6a6-966a0a06784e', 1, 0, 0),
('char_6ea401f2-8684-11e9-a6a6-966a0a06784e', '1559623896.1583300', 'Card_Created', NULL, NULL, NULL, 'card_6ea401f0-8684-11e9-a6a6-966a0a06784e', NULL, NULL, NULL),
('char_6f3ec87b-82da-11e9-a6a6-966a0a06784e', '1559221029.2404900', 'Customer_Created', NULL, NULL, 'asdasdd', '0', NULL, NULL, NULL),
('char_721392a0-85e2-11e9-a6a6-966a0a06784e', '1559554323.4528000', 'Card_Created', NULL, NULL, NULL, 'card_7213929e-85e2-11e9-a6a6-966a0a06784e', NULL, NULL, NULL),
('char_72cef901-8473-11e9-a6a6-966a0a06784e', '1559396699.3785200', 'CrossSaleOfferDeleted', 1.0000000000, 'AFN', NULL, NULL, NULL, NULL, NULL),
('char_73ebd1e2-8438-11e9-a6a6-966a0a06784e', '1559371360.9425500', 'charge', 1223.0000000000, 'INR', '0', NULL, 0, NULL, NULL),
('char_74016e89-846a-11e9-a6a6-966a0a06784e', '1559392835.9165900', 'charge', 54.0000000000, 'AUD', NULL, NULL, NULL, NULL, NULL),
('char_7432cb3f-7986-11e9-a6a6-966a0a06784e', '1558195399.3577100', 'charge', 1.0000000000, 'INR', NULL, NULL, NULL, NULL, NULL),
('char_74575658-605f-11e9-bcdd-966a0a06784e', '1555429870.1572400', 'Card_Created', NULL, NULL, NULL, 'card_74575656-605f-11e9-bcdd-966a0a06784e', NULL, NULL, NULL),
('char_7457565c-605f-11e9-bcdd-966a0a06784e', '1555429870.1713800', 'charge', 500.0000000000, 'USD', 'charge', 'card_74575656-605f-11e9-bcdd-966a0a06784e', 0, 0, 0),
('char_74e9ceb5-8463-11e9-a6a6-966a0a06784e', '1559389830.9622100', 'Charge_Refund', 1480.0000000000, 'RON', 'cvcxvxczxcx454646876587jhgjuh755475', 'card_ee4fdfa3-8457-11e9-a6a6-966a0a06784e', 0, 1, 0),
('char_768424ca-839a-11e9-a6a6-966a0a06784e', '1559303504.8137500', 'charge', 64.0000000000, 'INR', 'asdasdsa', 'null', 0, 0, 0),
('char_77855b61-6058-11e9-bcdd-966a0a06784e', '1555426869.0150000', 'Customer_Created', NULL, NULL, '0', '0', NULL, NULL, NULL),
('char_78dc9d45-845e-11e9-a6a6-966a0a06784e', '1559387690.1030000', 'Charge_Updated', 123456.0000000000, 'RON', 'ERTASERTFDGHDFHSDYH', 'card_ee4fdfa3-8457-11e9-a6a6-966a0a06784e', 0, 1, 0),
('char_7907bd23-8458-11e9-a6a6-966a0a06784e', '1559385113.4051500', 'Charge_Refund', 123.0000000000, 'RON', 'ERTASERTFDGHDFHSDYH', 'card_ee4fdfa3-8457-11e9-a6a6-966a0a06784e', 0, 1, 0),
('char_7928b4d7-85df-11e9-a6a6-966a0a06784e', '1559553046.8424500', 'Charge_Updated', 4355.0000000000, 'EUR', 'dfgdfsdsfsfdqwe', 'card_23a2dbf1-85d9-11e9-a6a6-966a0a06784e', 1, 0, 0),
('char_79aa2e93-8479-11e9-a6a6-966a0a06784e', '1559399287.8618500', 'Charge_Updated', 233.0000000000, 'ALL', 'Praveen Dagdi', 'card_1851aab1-8467-11e9-a6a6-966a0a06784e', 0, 1, 0),
('char_7a41eb85-85ce-11e9-a6a6-966a0a06784e', '1559545747.2435000', 'Customer_Created', NULL, NULL, 'trtrrtrr', '0', NULL, NULL, NULL),
('char_7bb9a5be-85fc-11e9-a6a6-966a0a06784e', '1559565506.5574200', 'charge', 5674567.0000000000, 'BBD', 'fryhrfy', NULL, 1, NULL, NULL),
('char_7c7a5b99-843c-11e9-a6a6-966a0a06784e', '1559373093.2810700', 'CrossSaleOfferDeleted', 1223.0000000000, 'INR', NULL, NULL, NULL, NULL, NULL),
('char_7cc60cee-839b-11e9-a6a6-966a0a06784e', '1559303944.8070700', 'charge', 64.0000000000, 'INR', 'asdasdsa', 'null', 0, 0, 0),
('char_7ce6ddf1-845e-11e9-a6a6-966a0a06784e', '1559387696.8809600', 'Charge_Updated', 123456.0000000000, 'RON', 'ERTASERTFDGHDFHSDYH', 'card_ee4fdfa3-8457-11e9-a6a6-966a0a06784e', 0, 1, 0),
('char_7dc65056-85ec-11e9-a6a6-966a0a06784e', '1559558638.0478400', 'charge', NULL, NULL, 'cvcbdf', NULL, 0, NULL, NULL),
('char_7ec1e0ba-797b-11e9-a6a6-966a0a06784e', '1558190692.6127500', 'charge', 1.0000000000, 'INR', NULL, NULL, NULL, NULL, NULL),
('char_7f8c74e9-6002-11e9-bcdd-966a0a06784e', '1555389945.7644000', 'Customer_Created', NULL, NULL, '0', '0', NULL, NULL, NULL),
('char_7f8c74ed-6002-11e9-bcdd-966a0a06784e', '1555389945.7787600', 'Card_Created', NULL, NULL, NULL, 'card_7f8c74eb-6002-11e9-bcdd-966a0a06784e', NULL, NULL, NULL),
('char_804df5af-85bd-11e9-a6a6-966a0a06784e', '1559538455.9418500', 'Customer_Deleted', NULL, NULL, NULL, '', NULL, NULL, NULL),
('char_82892e2c-85d2-11e9-a6a6-966a0a06784e', '1559547479.2659100', 'charge', 234.0000000000, 'AUD', 'cfgbfb', 'card_82892e2a-85d2-11e9-a6a6-966a0a06784e', 0, 0, 0),
('char_834d4269-8479-11e9-a6a6-966a0a06784e', '1559399304.0300900', 'Charge_Updated', 233.0000000000, 'ALL', 'Praveen Dagdi', 'card_1851aab1-8467-11e9-a6a6-966a0a06784e', 0, 1, 0),
('char_834d426c-8479-11e9-a6a6-966a0a06784e', '1559399305.1913700', 'Charge_Updated', 4323.0000000000, 'GEL', 'Sample', 'card_e0b953f1-82a9-11e9-a6a6-966a0a06784e', 1, 1, 0),
('char_84165559-837b-11e9-a6a6-966a0a06784e', '1559290213.1785500', 'Customer_Deleted', NULL, NULL, NULL, '', NULL, NULL, NULL),
('char_8423c147-82da-11e9-a6a6-966a0a06784e', '1559221064.2963000', 'Customer_Created', NULL, NULL, 'asdasdd', '0', NULL, NULL, NULL),
('char_8423c14c-82da-11e9-a6a6-966a0a06784e', '1559221065.5924100', 'Customer_Created', NULL, NULL, 'asdasdd', '0', NULL, NULL, NULL),
('char_858c0bd9-85f8-11e9-a6a6-966a0a06784e', '1559563805.0445700', 'CrossSaleOfferUpdate', NULL, NULL, 'cvcbdf', NULL, 0, NULL, NULL),
('char_88a3c803-82d9-11e9-a6a6-966a0a06784e', '1559220642.3489200', 'Customer_Created', NULL, NULL, 'asdasdd', '0', NULL, NULL, NULL),
('char_88d4483b-8479-11e9-a6a6-966a0a06784e', '1559399313.3035700', 'Charge_Updated', 233.0000000000, 'ALL', 'Praveen', 'card_1851aab1-8467-11e9-a6a6-966a0a06784e', 0, 1, 0),
('char_88d767cc-8386-11e9-a6a6-966a0a06784e', '1559294945.6225100', 'Card_Created', NULL, NULL, NULL, 'card_88d767ca-8386-11e9-a6a6-966a0a06784e', NULL, NULL, NULL),
('char_8a0da912-85e8-11e9-a6a6-966a0a06784e', '1559556940.6608100', 'charge', 1.0000000000, 'INR', NULL, NULL, NULL, NULL, NULL),
('char_8c7e70b6-85fa-11e9-a6a6-966a0a06784e', '1559564675.6973600', 'charge', 1221212110848.0000000000, 'CDF', 'captured', NULL, 0, NULL, NULL),
('char_8d09e238-8472-11e9-a6a6-966a0a06784e', '1559396313.8947000', 'charge', 1.0000000000, 'AFN', 'cvb', NULL, 0, NULL, NULL),
('char_8d42311f-85e0-11e9-a6a6-966a0a06784e', '1559553510.0628600', 'Customer_Created', NULL, NULL, 'dtryhwreey', '0', NULL, NULL, NULL),
('char_8e07db22-85e9-11e9-a6a6-966a0a06784e', '1559557376.8302900', 'charge', 3.0000000000, 'INR', NULL, NULL, NULL, NULL, NULL),
('char_8e106bb0-5f93-11e9-bcdd-966a0a06784e', '1555342295.9815300', 'Card_Created', NULL, NULL, NULL, 'card_8e106bae-5f93-11e9-bcdd-966a0a06784e', NULL, NULL, NULL),
('char_8e5fa895-8479-11e9-a6a6-966a0a06784e', '1559399322.6055400', 'Customer_Deleted', NULL, NULL, NULL, '', NULL, NULL, NULL),
('char_9088aa4f-845b-11e9-a6a6-966a0a06784e', '1559386441.3279900', 'CrossSaleOfferDeleted', 1223.0000000000, 'INR', NULL, NULL, NULL, NULL, NULL),
('char_9278398d-8458-11e9-a6a6-966a0a06784e', '1559385156.0875800', 'Customer_Created', NULL, NULL, 'sample', '0', NULL, NULL, NULL),
('char_92e3c92c-82aa-11e9-a6a6-966a0a06784e', '1559200473.2025100', 'charge', NULL, NULL, NULL, '0', 0, NULL, NULL),
('char_933f9a0e-5f91-11e9-bcdd-966a0a06784e', '1555341445.6856000', 'Card_Created', NULL, NULL, NULL, 'card_933f9a0c-5f91-11e9-bcdd-966a0a06784e', NULL, NULL, NULL),
('char_953c3b3f-85cd-11e9-a6a6-966a0a06784e', '1559545363.0104300', 'Customer_Created', NULL, NULL, 'gdfgfdghfd', '0', NULL, NULL, NULL),
('char_961a4380-6060-11e9-bcdd-966a0a06784e', '1555430356.2971800', 'Card_Created', NULL, NULL, NULL, 'card_961a437e-6060-11e9-bcdd-966a0a06784e', NULL, NULL, NULL),
('char_961a4384-6060-11e9-bcdd-966a0a06784e', '1555430356.3133600', 'charge', 5000.0000000000, 'USD', 'charge', 'card_961a437e-6060-11e9-bcdd-966a0a06784e', 0, 0, 0),
('char_966b324e-7af6-11e9-a6a6-966a0a06784e', '1558353511.5754200', 'charge', NULL, NULL, NULL, '0', 0, NULL, NULL),
('char_973f9d6e-8464-11e9-a6a6-966a0a06784e', '1559390318.0690100', 'charge', 121.0000000000, 'EUR', 'adsdd', NULL, 0, NULL, NULL),
('char_98ac8773-797a-11e9-a6a6-966a0a06784e', '1558190306.5928300', 'Customer_Updated', NULL, NULL, NULL, '0', NULL, NULL, NULL),
('char_98f98392-85e3-11e9-a6a6-966a0a06784e', '1559554818.2101900', 'Card_Created', NULL, NULL, NULL, 'card_98f98390-85e3-11e9-a6a6-966a0a06784e', NULL, NULL, NULL),
('char_99842018-8437-11e9-a6a6-966a0a06784e', '1559370994.5223300', 'charge', 12.0000000000, 'INR', '0', NULL, 0, NULL, NULL),
('char_99e40207-836c-11e9-a6a6-966a0a06784e', '1559283807.3146600', 'Customer_Created', NULL, NULL, '0', 'card_25b0d94a-5f93-11e9-bcdd-966a0a06784e', NULL, NULL, NULL),
('char_99f12175-8214-11e9-a6a6-966a0a06784e', '1559136060.5245600', 'charge', 1.0000000000, 'INR', '0', 'card_99f12173-8214-11e9-a6a6-966a0a06784e', 1, 0, 0),
('char_9b20268c-839d-11e9-a6a6-966a0a06784e', '1559304854.7266300', 'charge', 0.0000000000, 'INR', 'indian', NULL, 0, NULL, NULL),
('char_9cca4ff3-7979-11e9-a6a6-966a0a06784e', '1558189884.0021200', 'Customer_Updated', NULL, NULL, NULL, '0', NULL, NULL, NULL),
('char_9d86dff7-6002-11e9-bcdd-966a0a06784e', '1555389996.0601600', 'Customer_Created', NULL, NULL, '0', '0', NULL, NULL, NULL),
('char_9d86dffb-6002-11e9-bcdd-966a0a06784e', '1555389996.0730800', 'Card_Created', NULL, NULL, NULL, 'card_9d86dff9-6002-11e9-bcdd-966a0a06784e', NULL, NULL, NULL),
('char_9e28cf9a-85e2-11e9-a6a6-966a0a06784e', '1559554397.4126500', 'Card_Created', NULL, NULL, NULL, 'card_9e28cf98-85e2-11e9-a6a6-966a0a06784e', NULL, NULL, NULL),
('char_9ee6a171-85bb-11e9-a6a6-966a0a06784e', '1559537648.2806700', 'Customer_Updated', NULL, NULL, NULL, '0', NULL, NULL, NULL),
('char_a0934405-85c2-11e9-a6a6-966a0a06784e', '1559540657.5668300', 'Customer_Deleted', NULL, NULL, NULL, '', NULL, NULL, NULL),
('char_a0b2c180-6058-11e9-bcdd-966a0a06784e', '1555426938.0997700', 'Card_Created', NULL, NULL, NULL, 'card_a0b2c17e-6058-11e9-bcdd-966a0a06784e', NULL, NULL, NULL),
('char_a0b2c184-6058-11e9-bcdd-966a0a06784e', '1555426938.1171000', 'charge', 500.0000000000, 'USD', 'charge', 'card_a0b2c17e-6058-11e9-bcdd-966a0a06784e', 0, 0, 0),
('char_a0d2ff6a-85e0-11e9-a6a6-966a0a06784e', '1559553542.8889300', 'Card_Created', NULL, NULL, NULL, 'card_a0d2ff68-85e0-11e9-a6a6-966a0a06784e', NULL, NULL, NULL),
('char_a22136a7-7aea-11e9-a6a6-966a0a06784e', '1558348377.2534500', 'Customer_Updated', NULL, NULL, NULL, '0', NULL, NULL, NULL),
('char_a62c07c9-838f-11e9-a6a6-966a0a06784e', '1559298860.2979900', 'Card_update', NULL, NULL, NULL, 'card_8e106bae-5f93-11e9-bcdd-966a0a06784e', NULL, NULL, NULL),
('char_a786b7e1-85f5-11e9-a6a6-966a0a06784e', '1559562573.5618800', 'Charge_Refund', 37.0000000000, 'ALL', 'cxvxcvcv', 'card_d43ac981-85e5-11e9-a6a6-966a0a06784e', 1, 1, 0),
('char_a939a5b0-839b-11e9-a6a6-966a0a06784e', '1559304019.3864700', 'charge', 121.0000000000, 'EUR', 'adsdd', NULL, 0, NULL, NULL),
('char_a97066cb-85df-11e9-a6a6-966a0a06784e', '1559553127.8429800', 'Charge_Updated', 4355.0000000000, 'EUR', 'zfsdf', 'card_23a2dbf1-85d9-11e9-a6a6-966a0a06784e', 1, 0, 0),
('char_aa83f3c5-8459-11e9-a6a6-966a0a06784e', '1559385625.9242700', 'charge', 64.0000000000, 'INR', NULL, NULL, NULL, NULL, NULL),
('char_aa8c4559-8371-11e9-a6a6-966a0a06784e', '1559285982.7377000', 'Customer_Deleted', NULL, NULL, NULL, 'card_9d86dff9-6002-11e9-bcdd-966a0a06784e', NULL, NULL, NULL),
('char_aadab7c9-8379-11e9-a6a6-966a0a06784e', '1559289419.2285400', 'Customer_Created', NULL, NULL, '0', '0', NULL, NULL, NULL),
('char_aae3c903-8477-11e9-a6a6-966a0a06784e', '1559398511.4542200', 'Customer_Deleted', NULL, NULL, NULL, '', NULL, NULL, NULL),
('char_ab8d50d4-6058-11e9-bcdd-966a0a06784e', '1555426956.3092600', 'Card_Created', NULL, NULL, NULL, 'card_ab8d50d2-6058-11e9-bcdd-966a0a06784e', NULL, NULL, NULL),
('char_ab8d50d8-6058-11e9-bcdd-966a0a06784e', '1555426956.3258200', 'charge', 100000.0000000000, 'USD', 'charge', 'card_ab8d50d2-6058-11e9-bcdd-966a0a06784e', 0, 0, 0),
('char_ac8a8c8e-8472-11e9-a6a6-966a0a06784e', '1559396366.7456500', 'charge', 1221.0000000000, 'AOA', 'cxvcbv', NULL, 0, NULL, NULL),
('char_ad25075f-85bb-11e9-a6a6-966a0a06784e', '1559537672.1776800', 'Customer_Updated', NULL, NULL, NULL, '0', NULL, NULL, NULL),
('char_adc67978-839b-11e9-a6a6-966a0a06784e', '1559304027.0201700', 'charge', 121.0000000000, 'EUR', 'adsdd', NULL, 0, NULL, NULL),
('char_af97cca5-8388-11e9-a6a6-966a0a06784e', '1559295869.6265900', 'Card_Deleted', NULL, NULL, NULL, 'card_88d767ca-8386-11e9-a6a6-966a0a06784e', NULL, NULL, NULL),
('char_afdbe55b-7af6-11e9-a6a6-966a0a06784e', '1558353554.2481100', 'Customer_Deleted', NULL, NULL, NULL, 'card_cf65396d-6038-11e9-bcdd-966a0a06784e', NULL, NULL, NULL),
('char_b039ecd6-85e8-11e9-a6a6-966a0a06784e', '1559557004.7046200', 'charge', 12.0000000000, 'INR', NULL, NULL, NULL, NULL, NULL),
('char_b07ca5df-85c6-11e9-a6a6-966a0a06784e', '1559542402.2534500', 'Customer_Created', NULL, NULL, 'sxxdcdecfevgv', '0', NULL, NULL, NULL),
('char_b0c10afe-85d9-11e9-a6a6-966a0a06784e', '1559550563.1387100', 'Card_Created', NULL, NULL, NULL, 'card_b0c10afc-85d9-11e9-a6a6-966a0a06784e', NULL, NULL, NULL),
('char_b2020621-85be-11e9-a6a6-966a0a06784e', '1559538968.8270700', 'Customer_Deleted', NULL, NULL, NULL, '', NULL, NULL, NULL),
('char_b251b8ab-8458-11e9-a6a6-966a0a06784e', '1559385209.5221300', 'Customer_Created', NULL, NULL, 'xcxvdfdf', '0', NULL, NULL, NULL),
('char_b3f86195-8461-11e9-a6a6-966a0a06784e', '1559389077.7607000', 'Charge_Updated', 123456.0000000000, 'RON', 'cvcxvxczxcx454646876587jhgjuh755475', 'card_ee4fdfa3-8457-11e9-a6a6-966a0a06784e', 0, 1, 0),
('char_b4800df9-836c-11e9-a6a6-966a0a06784e', '1559283851.9536600', 'Customer_Created', NULL, NULL, '0', '0', NULL, NULL, NULL),
('char_b6706073-843c-11e9-a6a6-966a0a06784e', '1559373190.5235500', 'CrossSaleOfferUpdate', 1223.0000000000, 'INR', NULL, NULL, NULL, NULL, NULL),
('char_b6f09d8a-605f-11e9-bcdd-966a0a06784e', '1555429981.8911400', 'Card_Created', NULL, NULL, NULL, 'card_b6f09d88-605f-11e9-bcdd-966a0a06784e', NULL, NULL, NULL),
('char_b6f09d8e-605f-11e9-bcdd-966a0a06784e', '1555429981.9066600', 'charge', 500.0000000000, 'USD', 'charge', 'card_74575656-605f-11e9-bcdd-966a0a06784e', 0, 0, 0),
('char_b7a8363b-85e1-11e9-a6a6-966a0a06784e', '1559554010.6904300', 'Charge_Updated', 4355.0000000000, 'EUR', 'zfsdfwqzxaszxczxzxcxz', 'card_23a2dbf1-85d9-11e9-a6a6-966a0a06784e', 1, 0, 0),
('char_b8f36662-7aea-11e9-a6a6-966a0a06784e', '1558348415.5432200', 'Card_Created', NULL, NULL, NULL, 'card_b8f36660-7aea-11e9-a6a6-966a0a06784e', NULL, NULL, NULL),
('char_b9778718-7981-11e9-a6a6-966a0a06784e', '1558193368.0920700', 'charge', 1.0000000000, 'EUR', 'test', NULL, 0, NULL, NULL),
('char_b9f4046c-7aeb-11e9-a6a6-966a0a06784e', '1558348846.7260500', 'charge', NULL, NULL, NULL, '0', 0, NULL, NULL),
('char_b9ff7111-836c-11e9-a6a6-966a0a06784e', '1559283861.1782800', 'Customer_Created', NULL, NULL, '0', '0', NULL, NULL, NULL),
('char_bba3dacf-8473-11e9-a6a6-966a0a06784e', '1559396821.5696100', 'CrossSaleOfferDeleted', 121.0000000000, 'EUR', NULL, NULL, NULL, NULL, NULL),
('char_bc5f2578-846a-11e9-a6a6-966a0a06784e', '1559392957.3306300', 'charge', 1.0000000000, 'AMD', NULL, NULL, NULL, NULL, NULL),
('char_bd0495e5-82da-11e9-a6a6-966a0a06784e', '1559221159.7220500', 'Customer_Created', NULL, NULL, 'asdasdd', '0', NULL, NULL, NULL),
('char_bde0827f-836c-11e9-a6a6-966a0a06784e', '1559283867.6848200', 'Customer_Created', NULL, NULL, '0', '0', NULL, NULL, NULL),
('char_bde1e58d-85e1-11e9-a6a6-966a0a06784e', '1559554021.1346900', 'Customer_Updated', NULL, NULL, NULL, '0', NULL, NULL, NULL),
('char_bed3866d-845b-11e9-a6a6-966a0a06784e', '1559386518.9936400', 'CrossSaleOfferDeleted', 12.0000000000, 'INR', NULL, NULL, NULL, NULL, NULL),
('char_bf05ab6d-85cd-11e9-a6a6-966a0a06784e', '1559545433.1145400', 'Customer_Created', NULL, NULL, 'xcvgcxvbcxvb', '0', NULL, NULL, NULL),
('char_c06b74d1-85c3-11e9-a6a6-966a0a06784e', '1559541140.4897500', 'Customer_Deleted', NULL, NULL, NULL, '', NULL, NULL, NULL),
('char_c11d22b3-8457-11e9-a6a6-966a0a06784e', '1559384804.8522700', 'charge', 1234.0000000000, 'AED', 'DFGHSTYSD', 'card_c11d22b1-8457-11e9-a6a6-966a0a06784e', 0, 0, 0),
('char_c25ae471-8473-11e9-a6a6-966a0a06784e', '1559396832.8355500', 'CrossSaleOfferDeleted', 121.0000000000, 'EUR', NULL, NULL, NULL, NULL, NULL),
('char_c3c38c09-85e1-11e9-a6a6-966a0a06784e', '1559554031.0021800', 'Charge_Updated', 4355.0000000000, 'EUR', 'zfsdfwqz', 'card_23a2dbf1-85d9-11e9-a6a6-966a0a06784e', 1, 0, 0),
('char_c4d23543-5f99-11e9-bcdd-966a0a06784e', '1555344964.8286500', 'Customer_Created', NULL, NULL, '0', '0', NULL, NULL, NULL),
('char_c4d23547-5f99-11e9-bcdd-966a0a06784e', '1555344964.8415300', 'Card_Created', NULL, NULL, NULL, 'card_c4d23545-5f99-11e9-bcdd-966a0a06784e', NULL, NULL, NULL),
('char_c5f4b8fd-85c4-11e9-a6a6-966a0a06784e', '1559541579.2746400', 'Customer_Deleted', NULL, NULL, NULL, 'card_f7f7d451-5f9a-11e9-bcdd-966a0a06784e', NULL, NULL, NULL),
('char_c723c2b2-839c-11e9-a6a6-966a0a06784e', '1559304499.0719300', 'charge', 654.0000000000, 'AZN', 'cvcbvbv', NULL, 0, NULL, NULL),
('char_c7cb775f-8477-11e9-a6a6-966a0a06784e', '1559398559.9488200', 'Customer_Deleted', NULL, NULL, NULL, '', NULL, NULL, NULL),
('char_c8316ff1-5f8f-11e9-bcdd-966a0a06784e', '1555340675.5185000', 'Customer_Created', NULL, NULL, '0', '0', NULL, NULL, NULL),
('char_c843993c-8479-11e9-a6a6-966a0a06784e', '1559399419.7336200', 'charge', 12.0000000000, 'AFN', 'abhi', NULL, 0, NULL, NULL),
('char_c8be2c19-85cf-11e9-a6a6-966a0a06784e', '1559546308.4163100', 'Customer_Created', NULL, NULL, 'cvcxvcxb', '0', NULL, NULL, NULL),
('char_c9ca38cd-603b-11e9-bcdd-966a0a06784e', '1555414551.6346800', 'Customer_Created', NULL, NULL, '0', '0', NULL, NULL, NULL),
('char_cbc8c6b7-85be-11e9-a6a6-966a0a06784e', '1559539012.0726700', 'Customer_Deleted', NULL, NULL, NULL, '', NULL, NULL, NULL),
('char_ccbf44ab-83a7-11e9-a6a6-966a0a06784e', '1559309232.9377300', 'charge', 64.0000000000, 'INR', NULL, NULL, NULL, NULL, NULL),
('char_cdb3f67b-838f-11e9-a6a6-966a0a06784e', '1559298926.6199200', 'Card_update', NULL, NULL, NULL, 'card_8e106bae-5f93-11e9-bcdd-966a0a06784e', NULL, NULL, NULL),
('char_cdf4cd5f-8479-11e9-a6a6-966a0a06784e', '1559399429.2795800', 'Customer_Deleted', NULL, NULL, NULL, '', NULL, NULL, NULL),
('char_cf65396b-6038-11e9-bcdd-966a0a06784e', '1555413272.5496400', 'Customer_Created', NULL, NULL, '0', '0', NULL, NULL, NULL),
('char_cf65396f-6038-11e9-bcdd-966a0a06784e', '1555413272.5623100', 'Card_Created', NULL, NULL, NULL, 'card_cf65396d-6038-11e9-bcdd-966a0a06784e', NULL, NULL, NULL),
('char_d119c625-8479-11e9-a6a6-966a0a06784e', '1559399434.5551400', 'CrossSaleOfferDeleted', 1.0000000000, 'EUR', NULL, NULL, NULL, NULL, NULL),
('char_d3639dec-797c-11e9-a6a6-966a0a06784e', '1558191264.1024600', 'charge', NULL, NULL, NULL, '0', 0, NULL, NULL),
('char_d4076807-8464-11e9-a6a6-966a0a06784e', '1559390420.0364500', 'Charge_Refund', 13677.0000000000, 'RON', 'cvcxvxczxcx454646876587jhgjuh755475', 'card_ee4fdfa3-8457-11e9-a6a6-966a0a06784e', 0, 1, 0),
('char_d43ac983-85e5-11e9-a6a6-966a0a06784e', '1559555776.6195400', 'charge', 45.0000000000, 'ALL', 'cxvxcvcv', 'card_d43ac981-85e5-11e9-a6a6-966a0a06784e', 1, 0, 0),
('char_d49bed2b-85e8-11e9-a6a6-966a0a06784e', '1559557065.7408800', 'Charge_Refund', 7.0000000000, 'ALL', 'cxvxcvcv', 'card_d43ac981-85e5-11e9-a6a6-966a0a06784e', 1, 1, 0),
('char_d54f49f2-839b-11e9-a6a6-966a0a06784e', '1559304093.3480700', 'charge', 121.0000000000, 'EUR', 'adsdd', NULL, 0, NULL, NULL),
('char_d6628262-8604-11e9-a6a6-966a0a06784e', '1559569094.6341500', 'charge', 1223.0000000000, 'INR', 'testing...', 'null', 0, 0, 0),
('char_d6ae1508-8463-11e9-a6a6-966a0a06784e', '1559389994.9916100', 'charge', 1212.0000000000, 'BDT', 'cvbvb', NULL, 0, NULL, NULL),
('char_d7c51db7-85e1-11e9-a6a6-966a0a06784e', '1559554064.5669500', 'Customer_Updated', NULL, NULL, NULL, '0', NULL, NULL, NULL),
('char_d9aaa267-82b9-11e9-a6a6-966a0a06784e', '1559207034.3913800', 'Customer_Updated', NULL, NULL, NULL, '0', NULL, NULL, NULL),
('char_da354960-8604-11e9-a6a6-966a0a06784e', '1559569101.0473900', 'charge', 1223.0000000000, 'INR', 'testing...', 'null', 0, 0, 0),
('char_db84658e-6058-11e9-bcdd-966a0a06784e', '1555427036.7810000', 'Card_Created', NULL, NULL, NULL, 'card_db84658c-6058-11e9-bcdd-966a0a06784e', NULL, NULL, NULL),
('char_db846592-6058-11e9-bcdd-966a0a06784e', '1555427036.7969900', 'charge', 1500.0000000000, 'USD', 'charge', 'card_db84658c-6058-11e9-bcdd-966a0a06784e', 0, 0, 0),
('char_de1bc0d6-846a-11e9-a6a6-966a0a06784e', '1559393013.9327400', 'charge', 212.0000000000, 'INR', NULL, NULL, NULL, NULL, NULL),
('char_deb0c208-5f94-11e9-bcdd-966a0a06784e', '1555342860.7459600', 'Card_Created', NULL, NULL, NULL, 'card_deb0c206-5f94-11e9-bcdd-966a0a06784e', NULL, NULL, NULL),
('char_df76d9f7-85bd-11e9-a6a6-966a0a06784e', '1559538615.5935200', 'Customer_Deleted', NULL, NULL, NULL, '', NULL, NULL, NULL),
('char_dfc13c2b-85c3-11e9-a6a6-966a0a06784e', '1559541193.0612900', 'Customer_Deleted', NULL, NULL, NULL, '', NULL, NULL, NULL),
('char_dfc9530f-82b9-11e9-a6a6-966a0a06784e', '1559207044.6586600', 'Customer_Updated', NULL, NULL, NULL, '0', NULL, NULL, NULL),
('char_e0b953f3-82a9-11e9-a6a6-966a0a06784e', '1559200174.2928400', 'charge', 4323.0000000000, 'GEL', 'Sample', 'card_e0b953f1-82a9-11e9-a6a6-966a0a06784e', 1, 0, 0),
('char_e13fc85a-5f91-11e9-bcdd-966a0a06784e', '1555341576.5493600', 'Card_Created', NULL, NULL, NULL, 'card_e13fc858-5f91-11e9-bcdd-966a0a06784e', NULL, NULL, NULL),
('char_e1889c12-797a-11e9-a6a6-966a0a06784e', '1558190428.8334100', 'Card_Created', NULL, NULL, NULL, 'card_e1889c10-797a-11e9-a6a6-966a0a06784e', NULL, NULL, NULL),
('char_e25c1ecd-601e-11e9-bcdd-966a0a06784e', '1555402137.4506200', 'Customer_Created', NULL, NULL, '0', '0', NULL, NULL, NULL),
('char_e25c1ed1-601e-11e9-bcdd-966a0a06784e', '1555402137.4668300', 'Card_Created', NULL, NULL, NULL, 'card_e25c1ecf-601e-11e9-bcdd-966a0a06784e', NULL, NULL, NULL),
('char_e2723d15-8476-11e9-a6a6-966a0a06784e', '1559398175.1657700', 'charge', 2.0000000000, 'NAD', NULL, NULL, NULL, NULL, NULL),
('char_e2b2442e-85e8-11e9-a6a6-966a0a06784e', '1559557089.3791500', 'charge', 3.0000000000, 'INR', NULL, NULL, NULL, NULL, NULL),
('char_e429ae06-85ec-11e9-a6a6-966a0a06784e', '1559558809.8272200', 'charge', 12.0000000000, 'INR', 'SDFSDF', NULL, 0, NULL, NULL),
('char_e5a9b693-82d9-11e9-a6a6-966a0a06784e', '1559220798.4162800', 'Customer_Created', NULL, NULL, 'asdasdd', '0', NULL, NULL, NULL),
('char_e63015ed-85bc-11e9-a6a6-966a0a06784e', '1559538197.3769500', 'Customer_Deleted', NULL, NULL, NULL, '', NULL, NULL, NULL),
('char_e654f3e3-8370-11e9-a6a6-966a0a06784e', '1559285653.5416400', 'Customer_Deleted', NULL, NULL, NULL, 'card_7f8c74eb-6002-11e9-bcdd-966a0a06784e', NULL, NULL, NULL),
('char_e6a58843-8434-11e9-a6a6-966a0a06784e', '1559369835.4287500', 'charge', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('char_e6c10a4b-85c6-11e9-a6a6-966a0a06784e', '1559542493.2965100', 'Customer_Created', NULL, NULL, 'ughijlk', '0', NULL, NULL, NULL),
('char_e6e4045f-82b9-11e9-a6a6-966a0a06784e', '1559207056.5776500', 'Customer_Updated', NULL, NULL, NULL, '0', NULL, NULL, NULL),
('char_e6f48316-846d-11e9-a6a6-966a0a06784e', '1559394317.2674200', 'charge', 2.0000000000, 'INR', 'cvxcvc', NULL, 0, NULL, NULL),
('char_e739b608-85e3-11e9-a6a6-966a0a06784e', '1559554949.4931300', 'Card_Created', NULL, NULL, NULL, 'card_e739b606-85e3-11e9-a6a6-966a0a06784e', NULL, NULL, NULL),
('char_e8245957-85e6-11e9-a6a6-966a0a06784e', '1559556239.5181100', 'Customer_Deleted', NULL, NULL, NULL, 'card_33be9670-85d2-11e9-a6a6-966a0a06784e', NULL, NULL, NULL),
('char_e83d5e63-85cd-11e9-a6a6-966a0a06784e', '1559545502.2659900', 'Customer_Created', NULL, NULL, 'vbmvbm', '0', NULL, NULL, NULL),
('char_e83d9a1e-8684-11e9-a6a6-966a0a06784e', '1559624100.1692400', 'Card_Created', NULL, NULL, NULL, 'card_e83d9a1c-8684-11e9-a6a6-966a0a06784e', NULL, NULL, NULL),
('char_ebdef571-85c9-11e9-a6a6-966a0a06784e', '1559543790.3710600', 'Customer_Created', NULL, NULL, 'ertyrewty', '0', NULL, NULL, NULL),
('char_ebeacde3-846a-11e9-a6a6-966a0a06784e', '1559393037.0976200', 'Customer_Created', NULL, NULL, 'afgagag', '0', NULL, NULL, NULL),
('char_ebeacde7-846a-11e9-a6a6-966a0a06784e', '1559393037.2220000', 'charge', 1.0000000000, 'INR', NULL, NULL, NULL, NULL, NULL),
('char_ec212f3f-8214-11e9-a6a6-966a0a06784e', '1559136198.4159800', 'charge', 1.0000000000, 'INR', '0', 'card_ec212f3d-8214-11e9-a6a6-966a0a06784e', 1, 0, 0),
('char_ec7a9179-85cf-11e9-a6a6-966a0a06784e', '1559546368.3716700', 'Customer_Created', NULL, NULL, 'cvbvbcfghf', '0', NULL, NULL, NULL),
('char_ece24170-8399-11e9-a6a6-966a0a06784e', '1559303273.9042500', 'charge', 64.0000000000, 'INR', 'asdasdsa', 'null', 0, 0, 0),
('char_ee4fdfa5-8457-11e9-a6a6-966a0a06784e', '1559384880.6821300', 'charge', 123456.0000000000, 'RON', 'ERTASERT', 'card_ee4fdfa3-8457-11e9-a6a6-966a0a06784e', 0, 0, 0),
('char_ee82a564-605e-11e9-bcdd-966a0a06784e', '1555429645.6268900', 'Card_Created', NULL, NULL, NULL, 'card_ee82a562-605e-11e9-bcdd-966a0a06784e', NULL, NULL, NULL),
('char_ee82a568-605e-11e9-bcdd-966a0a06784e', '1555429645.6550900', 'charge', 500.0000000000, 'USD', 'charge', 'card_db84658c-6058-11e9-bcdd-966a0a06784e', 0, 0, 0),
('char_f000e584-85e0-11e9-a6a6-966a0a06784e', '1559553675.7298800', 'Card_Created', NULL, NULL, NULL, 'card_f000e582-85e0-11e9-a6a6-966a0a06784e', NULL, NULL, NULL),
('char_f01f6a19-603d-11e9-bcdd-966a0a06784e', '1555415474.9396700', 'Customer_Created', NULL, NULL, '0', '0', NULL, NULL, NULL),
('char_f01f6a1d-603d-11e9-bcdd-966a0a06784e', '1555415474.9537400', 'Card_Created', NULL, NULL, NULL, 'card_f01f6a1b-603d-11e9-bcdd-966a0a06784e', NULL, NULL, NULL),
('char_f1a04460-7ad3-11e9-a6a6-966a0a06784e', '1558338632.2058300', 'charge', 1.0000000000, 'EUR', '0', NULL, 0, NULL, NULL),
('char_f1e0f1bf-8476-11e9-a6a6-966a0a06784e', '1559398201.0571600', 'Customer_Deleted', NULL, NULL, NULL, '', NULL, NULL, NULL),
('char_f23ecb23-85c5-11e9-a6a6-966a0a06784e', '1559542083.0765500', 'Customer_Deleted', NULL, NULL, NULL, '', NULL, NULL, NULL),
('char_f29b9305-8460-11e9-a6a6-966a0a06784e', '1559388753.3522300', 'Charge_Updated', 123456.0000000000, 'RON', 'ERTASERTFDGHDFHSDYH', 'card_ee4fdfa3-8457-11e9-a6a6-966a0a06784e', 0, 1, 0),
('char_f3d63042-5f93-11e9-bcdd-966a0a06784e', '1555342466.7265400', 'Card_Created', NULL, NULL, NULL, 'card_f3d63040-5f93-11e9-bcdd-966a0a06784e', NULL, NULL, NULL),
('char_f6732bba-846a-11e9-a6a6-966a0a06784e', '1559393054.7697900', 'charge', 1.0000000000, 'ALL', NULL, NULL, NULL, NULL, NULL),
('char_f68aad93-8460-11e9-a6a6-966a0a06784e', '1559388759.9522800', 'Charge_Updated', 123456.0000000000, 'RON', 'cvcxvxc', 'card_ee4fdfa3-8457-11e9-a6a6-966a0a06784e', 0, 1, 0),
('char_f752917b-8476-11e9-a6a6-966a0a06784e', '1559398210.1903600', 'Customer_Deleted', NULL, NULL, NULL, '', NULL, NULL, NULL),
('char_f7b64111-8465-11e9-a6a6-966a0a06784e', '1559390909.4019800', 'Customer_Created', NULL, NULL, 'admin', '0', NULL, NULL, NULL),
('char_f7d12c32-797a-11e9-a6a6-966a0a06784e', '1558190466.2193000', 'Card_Created', NULL, NULL, NULL, 'card_f7d12c30-797a-11e9-a6a6-966a0a06784e', NULL, NULL, NULL),
('char_f7f7d44f-5f9a-11e9-bcdd-966a0a06784e', '1555345480.1349500', 'Customer_Created', NULL, NULL, '0', '0', NULL, NULL, NULL);
INSERT INTO `data` (`data_id`, `created`, `objectType`, `amount`, `currency`, `description`, `card`, `captured`, `refunded`, `desputed`) VALUES
('char_f7f7d453-5f9a-11e9-bcdd-966a0a06784e', '1555345480.1522400', 'Card_Created', NULL, NULL, NULL, 'card_f7f7d451-5f9a-11e9-bcdd-966a0a06784e', NULL, NULL, NULL),
('char_f8625a49-8214-11e9-a6a6-966a0a06784e', '1559136218.9719100', 'charge', 1.0000000000, 'INR', '0', 'card_f8625a47-8214-11e9-a6a6-966a0a06784e', 0, 0, 0),
('char_f8f19b72-7aee-11e9-a6a6-966a0a06784e', '1558350240.8936300', 'Card_Created', NULL, NULL, NULL, 'card_f8f19b70-7aee-11e9-a6a6-966a0a06784e', NULL, NULL, NULL),
('char_f9c674bb-8473-11e9-a6a6-966a0a06784e', '1559396925.8151300', 'CrossSaleOfferDeleted', 1212.0000000000, 'BDT', NULL, NULL, NULL, NULL, NULL),
('char_f9eaab7d-845b-11e9-a6a6-966a0a06784e', '1559386618.1309100', 'CrossSaleOfferDeleted', 1223.0000000000, 'INR', NULL, NULL, NULL, NULL, NULL),
('char_fbdff999-85c8-11e9-a6a6-966a0a06784e', '1559543387.7246100', 'Customer_Created', NULL, NULL, 'utyiui', '0', NULL, NULL, NULL),
('char_fc2ddb0d-83a7-11e9-a6a6-966a0a06784e', '1559309312.5153300', 'charge', 654.0000000000, 'EUR', NULL, NULL, NULL, NULL, NULL),
('char_fc6d8101-8465-11e9-a6a6-966a0a06784e', '1559390917.3128500', 'Customer_Created', NULL, NULL, 'drtyeryre', '0', NULL, NULL, NULL),
('char_fcca4ba1-8473-11e9-a6a6-966a0a06784e', '1559396930.8734600', 'CrossSaleOfferDeleted', 2.0000000000, 'INR', NULL, NULL, NULL, NULL, NULL),
('char_fd08a227-85d6-11e9-a6a6-966a0a06784e', '1559549402.6298400', 'charge', 1222123264.0000000000, 'AED', 'xzcvxzvcx', 'card_fd08a225-85d6-11e9-a6a6-966a0a06784e', 1, 0, 0),
('char_ff8123e2-846a-11e9-a6a6-966a0a06784e', '1559393069.9609500', 'charge', 65.0000000000, 'INR', NULL, NULL, NULL, NULL, NULL),
('char_ffd74471-85e1-11e9-a6a6-966a0a06784e', '1559554131.7955700', 'Customer_Created', NULL, NULL, 'dstsdtyyergh', '0', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `deleted_blacklist`
--

CREATE TABLE `deleted_blacklist` (
  `black_id` varchar(255) NOT NULL,
  `created` decimal(18,7) DEFAULT NULL,
  `objectType` varchar(255) DEFAULT NULL,
  `ruleType` varchar(255) DEFAULT NULL,
  `fingerprint` varchar(200) DEFAULT NULL,
  `ipAddress` varchar(200) DEFAULT NULL,
  `ipCountry` varchar(255) DEFAULT NULL,
  `metadataKey` varchar(200) DEFAULT NULL,
  `metadataValue` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `userAgent` varchar(200) DEFAULT NULL,
  `acceptLanguage` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `deleted_blacklist`
--

INSERT INTO `deleted_blacklist` (`black_id`, `created`, `objectType`, `ruleType`, `fingerprint`, `ipAddress`, `ipCountry`, `metadataKey`, `metadataValue`, `email`, `userAgent`, `acceptLanguage`) VALUES
('blr_0201fca4-82ca-11e9-a6a6-966a0a06784e', '1559213974.0202700', 'blacklistRule', 'fingerprint', '317608417e7ab68b9291b33f8c7e9484ee8c503e7f53c967d067035e', '0', '0', '0', '0', '0', '0', '0'),
('blr_02e2ffa6-81f3-11e9-a6a6-966a0a06784e', '1559121633.6979100', 'blacklistRule', 'email', '0', '0', '0', '0', '0', 'ashishranjan@gmail.com', '0', '0'),
('blr_03c60270-81fc-11e9-a6a6-966a0a06784e', '1559125500.6562500', 'blacklistRule', 'email', '0', '0', '0', '0', '0', 'ashishranjan@gmail.com', '0', '0'),
('blr_056470ce-7af1-11e9-a6a6-966a0a06784e', '1558351120.7687400', 'blacklistRule', 'email', '0', '0', '0', '0', '0', 'ashishranjan@gmail.com', '0', '0'),
('blr_08cefbe6-81ed-11e9-a6a6-966a0a06784e', '1559119066.6526700', 'blacklistRule', 'email', '0', '0', '0', '0', '0', 'ashishranjan@gmail.com', '0', '0'),
('blr_0db4a510-81f3-11e9-a6a6-966a0a06784e', '1559121651.8490400', 'blacklistRule', 'email', '0', '0', '0', '0', '0', 'ashishranjan@gmail.com', '0', '0'),
('blr_15f43a3c-81f4-11e9-a6a6-966a0a06784e', '1559122095.1842800', 'blacklistRule', 'email', '0', '0', '0', '0', '0', 'ashishranjan@gmail.com', '0', '0'),
('blr_176d484a-7989-11e9-a6a6-966a0a06784e', '1558196532.2031600', 'blacklistRule', 'email', '0', '0', '0', '0', '0', 'selvan@amalpay.com', '0', '0'),
('blr_1a04eb9a-820c-11e9-a6a6-966a0a06784e', '1559132409.9261200', 'blacklistRule', 'email', '0', '0', '0', '0', '0', 'hello@gmail.com', '0', '0'),
('blr_1a800b42-8395-11e9-a6a6-966a0a06784e', '1559301202.9477100', 'blacklistRule', 'email', '0', '0', '0', '0', '0', 'avengers@gmail.com', '0', '0'),
('blr_1ae4f390-8205-11e9-a6a6-966a0a06784e', '1559129404.9172100', 'blacklistRule', 'email', '0', '0', '0', '0', '0', 'ashishranjan@gmail.com', '0', '0'),
('blr_25dd5c24-8110-11e9-a6a6-966a0a06784e', '1559024196.6236200', 'blacklistRule', 'email', '0', '0', '0', '0', '0', 'ashishranjan@gmail.com', '0', '0'),
('blr_38125e8e-81fc-11e9-a6a6-966a0a06784e', '1559125588.3981500', 'blacklistRule', 'email', '0', '0', '0', '0', '0', 'ashishranjan@gmail.com', '0', '0'),
('blr_3c3b668a-7988-11e9-a6a6-966a0a06784e', '1558196164.4550800', 'blacklistRule', 'email', '0', '0', '0', '0', '0', 'saurabh@gmail.com', '0', '0'),
('blr_4117480a-81ed-11e9-a6a6-966a0a06784e', '1559119161.0789300', 'blacklistRule', 'email', '0', '0', '0', '0', '0', 'ashishranjan@gmail.com', '0', '0'),
('blr_48786594-820a-11e9-a6a6-966a0a06784e', '1559131628.8646200', 'blacklistRule', 'email', '0', '0', '0', '0', '0', 'hello@gmail.com', '0', '0'),
('blr_4c791b26-820e-11e9-a6a6-966a0a06784e', '1559133353.5671200', 'blacklistRule', 'email', '0', '0', '0', '0', '0', 'hello@gmail.com', '0', '0'),
('blr_4e07d888-85d8-11e9-a6a6-966a0a06784e', '1559549968.0078900', 'blacklistRule', 'email', '0', '0', '0', '0', '0', 'cvbvcb@gmail.com', '0', '0'),
('blr_5702a95c-85bc-11e9-a6a6-966a0a06784e', '1559537957.1650300', 'blacklistRule', 'email', '0', '0', '0', '0', '0', 'steve@gmail.com', '0', '0'),
('blr_58cae0f4-85d7-11e9-a6a6-966a0a06784e', '1559549556.5665500', 'blacklistRule', 'ipCountry', '0', '0', '0', 'AL', '0', '0', '0', '0'),
('blr_5f7ac8de-85e5-11e9-a6a6-966a0a06784e', '1559555580.7399000', 'blacklistRule', 'email', '0', '0', '0', '0', '0', 'vnvbnb@gmail.com', '0', '0'),
('blr_6937b876-82b3-11e9-a6a6-966a0a06784e', '1559204268.7528000', 'blacklistRule', 'fingerprint', '317608417e7ab68b9291b33f8c7e9484ee8c503e7f53c967d067035e', '0', '0', '0', '0', '0', '0', '0'),
('blr_6b733acc-85e5-11e9-a6a6-966a0a06784e', '1559555600.8230500', 'blacklistRule', 'email', '0', '0', '0', '0', '0', 'priyanertgwertwka@gmail.com', '0', '0'),
('blr_763a3b4a-85d6-11e9-a6a6-966a0a06784e', '1559549176.4535000', 'blacklistRule', 'ipCountry', '0', '0', '0', 'AL', '0', '0', '0', '0'),
('blr_7b2410e2-837c-11e9-a6a6-966a0a06784e', '1559290627.6656400', 'blacklistRule', 'fingerprint', '317608417e7ab68b9291b33f8c7e9484ee8c503e7f53c967d067035e', '0', '0', '0', '0', '0', '0', '0'),
('blr_7b474e2e-81d6-11e9-a6a6-966a0a06784e', '1559109380.2767200', 'blacklistRule', 'email', '0', '0', '0', '0', '0', 'ashishranjan@gmail.com', '0', '0'),
('blr_7e7c8c90-7af0-11e9-a6a6-966a0a06784e', '1558350894.4343100', 'blacklistRule', 'email', '0', '0', '0', '0', '0', 'ashishranjan@gmail.com', '0', '0'),
('blr_8684bf5c-81e9-11e9-a6a6-966a0a06784e', '1559117559.5722100', 'blacklistRule', 'email', '0', '0', '0', '0', '0', 'ashishranjan@gmail.com', '0', '0'),
('blr_8fd0d6f6-85d4-11e9-a6a6-966a0a06784e', '1559548360.3901300', 'blacklistRule', 'ipCountry', '0', '0', '0', 'AX', '0', '0', '0', '0'),
('blr_9165e89a-85d8-11e9-a6a6-966a0a06784e', '1559550081.0316800', 'blacklistRule', 'email', '0', '0', '0', '0', '0', 'vnvbnb@gmail.com', '0', '0'),
('blr_9398f808-7af4-11e9-a6a6-966a0a06784e', '1558352647.8396700', 'blacklistRule', 'email', '0', '0', '0', '0', '0', 'ashishranjan@gmail.com', '0', '0'),
('blr_946267d6-81f4-11e9-a6a6-966a0a06784e', '1559122307.2992500', 'blacklistRule', 'email', '0', '0', '0', '0', '0', 'abhi@gmail.com', '0', '0'),
('blr_a065de68-85d8-11e9-a6a6-966a0a06784e', '1559550106.1972400', 'blacklistRule', 'email', '0', '0', '0', '0', '0', 'fdgbfhfg@gmail.com', '0', '0'),
('blr_a2bb43ea-81f7-11e9-a6a6-966a0a06784e', '1559123619.8599400', 'blacklistRule', 'email', '0', '0', '0', '0', '0', 'ashishranjan@gmail.com', '0', '0'),
('blr_a810d510-85d7-11e9-a6a6-966a0a06784e', '1559549689.5649900', 'blacklistRule', 'email', '0', '0', '0', '0', '0', 'dfgdf@gmail.com', '0', '0'),
('blr_abb4b78e-85d4-11e9-a6a6-966a0a06784e', '1559548407.1820400', 'blacklistRule', 'ipCountry', '0', '0', '0', 'AI', '0', '0', '0', '0'),
('blr_b346fc20-8299-11e9-a6a6-966a0a06784e', '1559193226.0895400', 'blacklistRule', 'email', '0', '0', '0', '0', '0', 'hello@gmail.com', '0', '0'),
('blr_bb1013c6-8459-11e9-a6a6-966a0a06784e', '1559385653.6860600', 'blacklistRule', 'ipCountry', '0', '0', '0', 'DZ', '0', '0', '0', '0'),
('blr_bf1774f8-8208-11e9-a6a6-966a0a06784e', '1559130968.8847500', 'blacklistRule', 'email', '0', '0', '0', '0', '0', 'hello@gmail.com', '0', '0'),
('blr_c00a6e3a-82c4-11e9-a6a6-966a0a06784e', '1559211715.8621800', 'blacklistRule', 'fingerprint', 'd50bb9e92e1ef4124781e0e6046e8be519bfd96461971f621c28fb82', '0', '0', '0', '0', '0', '0', '0'),
('blr_d51b79fc-81f4-11e9-a6a6-966a0a06784e', '1559122415.8863300', 'blacklistRule', 'email', '0', '0', '0', '0', '0', 'ashishranjan@gmail.com', '0', '0'),
('blr_dd33b64c-85d5-11e9-a6a6-966a0a06784e', '1559548919.7193700', 'blacklistRule', 'ipCountry', '0', '0', '0', 'AL', '0', '0', '0', '0'),
('blr_e41078f0-820c-11e9-a6a6-966a0a06784e', '1559132748.9016000', 'blacklistRule', 'email', '0', '0', '0', '0', '0', 'hello@gmail.com', '0', '0'),
('blr_f9ba40fc-837c-11e9-a6a6-966a0a06784e', '1559290840.0428900', 'blacklistRule', 'fingerprint', '317608417e7ab68b9291b33f8c7e9484ee8c503e7f53c967d067035e', '0', '0', '0', '0', '0', '0', '0'),
('blr_fd733b46-8394-11e9-a6a6-966a0a06784e', '1559301154.2098200', 'blacklistRule', 'email', '0', '0', '0', '0', '0', 'troy@gmail.com', '0', '0'),
('blr_fe548b10-85d7-11e9-a6a6-966a0a06784e', '1559549834.2928400', 'blacklistRule', 'email', '0', '0', '0', '0', '0', 'cxbvvcb@gmail.com', '0', '0');

-- --------------------------------------------------------

--
-- Table structure for table `deleted_cards`
--

CREATE TABLE `deleted_cards` (
  `card_id` varchar(41) NOT NULL,
  `created` decimal(18,7) DEFAULT NULL,
  `objectType` varchar(255) DEFAULT NULL,
  `first6` int(6) DEFAULT NULL,
  `last4` int(6) DEFAULT NULL,
  `fingerprint` varchar(56) DEFAULT NULL,
  `expMonth` int(2) DEFAULT NULL,
  `expYear` int(2) DEFAULT NULL,
  `cardholderName` varchar(20) DEFAULT NULL,
  `customerId` varchar(41) DEFAULT NULL,
  `brand` varchar(20) DEFAULT NULL,
  `type` varchar(6) DEFAULT NULL,
  `country` varchar(15) DEFAULT NULL,
  `addressLine1` varchar(200) DEFAULT NULL,
  `addressLine2` varchar(200) DEFAULT NULL,
  `addressCity` varchar(200) DEFAULT NULL,
  `addressState` varchar(200) DEFAULT NULL,
  `addressZip` int(6) DEFAULT NULL,
  `addressCountry` varchar(20) DEFAULT NULL,
  `ipAddress` varchar(20) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `userAgent` varchar(200) DEFAULT NULL,
  `acceptLanguage` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `deleted_cards`
--

INSERT INTO `deleted_cards` (`card_id`, `created`, `objectType`, `first6`, `last4`, `fingerprint`, `expMonth`, `expYear`, `cardholderName`, `customerId`, `brand`, `type`, `country`, `addressLine1`, `addressLine2`, `addressCity`, `addressState`, `addressZip`, `addressCountry`, `ipAddress`, `email`, `userAgent`, `acceptLanguage`) VALUES
('card_11b14df5-5f96-11e9-bcdd-966a0a06784e', '1555343375.8206400', 'card', 424452, 2424, '2731464fbeb0b819ed50583db6bda3503a3cac74f6d24be4f0a964a5', 20, 1, 'jay', '11b14df1-5f96-11e9-bcdd-966a0a06784e', 'None', 'type', 'country', '0', '0', '0', '0', 0, '0', '0', '0', '0', '0'),
('card_25b0d94a-5f93-11e9-bcdd-966a0a06784e', '1555342120.8690000', 'card', 424242, 4245, '08ad630afe58235e08a5d52924c69e09ca55c9e9b53517e742808708', 12, 25, 'asdfsdf', 'c8316fef-5f8f-11e9-bcdd-966a0a06784e', 'None', 'type', 'country', '0', '0', '0', '0', 0, '0', '0', '0', '0', '0'),
('card_33be9670-85d2-11e9-a6a6-966a0a06784e', '1559547346.9266700', 'card', 402400, 1187, '02eff1364cb2018c2a88f48c2d497ca482e634759353e48858b616cc', 5, 2020, 'Subhsdh', 'ec7a9177-85cf-11e9-a6a6-966a0a06784e', 'Visa', 'type', 'country', '0', '0', '0', '0', 0, '0', '0', '0', '0', '0'),
('card_412ad874-600b-11e9-bcdd-966a0a06784e', '1555393706.5745700', 'card', 424242, 4245, '08ad630afe58235e08a5d52924c69e09ca55c9e9b53517e742808708', 12, 25, 'asdfsdf', 'c8316fef-5f8f-11e9-bcdd-966a0a06784e', 'None', 'type', 'country', '0', '0', '0', '0', 0, '0', '0', '0', '0', '0'),
('card_48b4b20d-600c-11e9-bcdd-966a0a06784e', '1555394148.7320500', 'card', 343434, 3434, '97f418eadcd634d5072a34057e7c1140f0f3162be91fdcd578835ccb', 18, 9, 'tyhu', '48b4b209-600c-11e9-bcdd-966a0a06784e', 'None', 'type', 'country', '0', '0', '0', '0', 0, '0', '0', '0', '0', '0'),
('card_5536b242-7af6-11e9-a6a6-966a0a06784e', '1558353402.1703600', 'card', 401200, 7, '522fd11a5a880b14cbd7f2811c018d75d3e6db828fa3118aa693a6f1', 4, 2020, '', '48b4b209-600c-11e9-bcdd-966a0a06784e', 'Visa', 'type', 'country', '0', '0', '0', '0', 0, '0', '0', '0', '0', '0'),
('card_5b880364-60d2-11e9-bcdd-966a0a06784e', '1555479220.6550700', 'card', 424242, 4242, '4e346ebf37e7af576825c872c9adfa1aa9acdd8374f96bf2b3594ed9', 12, 45, 'ravi', '77855b5f-6058-11e9-bcdd-966a0a06784e', 'Visa', 'type', 'country', '0', '0', '0', '0', 302015, '0', '0', '0', '0', '0'),
('card_74575656-605f-11e9-bcdd-966a0a06784e', '1555429870.1551900', 'card', 546546, 5466, 'f8cfe460f8a31bf108b1393571f4bfdbda9763be97dc71b442bf4859', 11, 11, 'test', '77855b5f-6058-11e9-bcdd-966a0a06784e', 'Mastercard', 'type', 'country', '0', '0', '0', '0', 111111, '0', '0', '0', '0', '0'),
('card_7f8c74eb-6002-11e9-bcdd-966a0a06784e', '1555389945.7767000', 'card', 789528, 5655, '8b0c143abb20dbcdeaad24a95dee37862ee9e1f70bac279f1a10194b', 20, 12, 'mayank', '7f8c74e7-6002-11e9-bcdd-966a0a06784e', 'None', 'type', 'country', '0', '0', '0', '0', 0, '0', '0', '0', '0', '0'),
('card_88d767ca-8386-11e9-a6a6-966a0a06784e', '1559294945.6187000', 'card', 424242, 4242, '4e346ebf37e7af576825c872c9adfa1aa9acdd8374f96bf2b3594ed9', 11, 22, '0', '012be8a1-8372-11e9-a6a6-966a0a06784e', 'Visa', 'type', 'country', '0', '0', '0', '0', 0, '0', '0', '0', '0', '0'),
('card_961a437e-6060-11e9-bcdd-966a0a06784e', '1555430356.2942000', 'card', 123345, 3434, 'dac026363f132bfcd0353fba9499bcff0b40ebc6d9c74458b9b7ee7a', 12, 10, 'praveen', '77855b5f-6058-11e9-bcdd-966a0a06784e', 'None', 'type', 'country', '0', '0', '0', '0', 234251, '0', '0', '0', '0', '0'),
('card_9d86dff9-6002-11e9-bcdd-966a0a06784e', '1555389996.0710700', 'card', 666666, 6666, '068ba4f79b649a1934f7f72458dcfd6a0d7b51e262f9e2fb1295b37c', 21, 11, 'rahul', '9d86dff5-6002-11e9-bcdd-966a0a06784e', 'None', 'type', 'country', '0', '0', '0', '0', 0, '0', '0', '0', '0', '0'),
('card_a0b2c17e-6058-11e9-bcdd-966a0a06784e', '1555426938.0969400', 'card', 456546, 4565, '1202360667577f5f6b6a4625325a4642c239a6e10c20d52401bd078b', 12, 25, 'jay', '77855b5f-6058-11e9-bcdd-966a0a06784e', 'Visa', 'type', 'country', '0', '0', '0', '0', 32163, '0', '0', '0', '0', '0'),
('card_ab8d50d2-6058-11e9-bcdd-966a0a06784e', '1555426956.3065300', 'card', 423423, 4234, 'f9f199dfd803cab14e6860935a085c0f2c99fbc8a2ef55ba73ba1966', 51, 20, 'ram', '77855b5f-6058-11e9-bcdd-966a0a06784e', 'None', 'type', 'country', '0', '0', '0', '0', 303457, '0', '0', '0', '0', '0'),
('card_b6f09d88-605f-11e9-bcdd-966a0a06784e', '1555429981.8893600', 'card', 546546, 5466, 'f8cfe460f8a31bf108b1393571f4bfdbda9763be97dc71b442bf4859', 11, 11, 'test', '77855b5f-6058-11e9-bcdd-966a0a06784e', 'Mastercard', 'type', 'country', '0', '0', '0', '0', 111111, '0', '0', '0', '0', '0'),
('card_b8f36660-7aea-11e9-a6a6-966a0a06784e', '1558348415.5407100', 'card', 402400, 4842, 'd50bb9e92e1ef4124781e0e6046e8be519bfd96461971f621c28fb82', 3, 2023, '', 'f01f6a17-603d-11e9-bcdd-966a0a06784e', 'Visa', 'type', 'country', '0', '0', '0', '0', 0, '0', '0', '0', '0', '0'),
('card_c4d23545-5f99-11e9-bcdd-966a0a06784e', '1555344964.8390500', 'card', 123456, 2321, '52563f8c187b6d487a9ccfdc77a678207c1173a12d195e7de605afbd', 19, 1, 'praveen', 'c4d23541-5f99-11e9-bcdd-966a0a06784e', 'None', 'type', 'country', '0', '0', '0', '0', 0, '0', '0', '0', '0', '0'),
('card_cf65396d-6038-11e9-bcdd-966a0a06784e', '1555413272.5599800', 'card', 424242, 4242, '4e346ebf37e7af576825c872c9adfa1aa9acdd8374f96bf2b3594ed9', 20, 1, 'heheh', 'cf653969-6038-11e9-bcdd-966a0a06784e', 'Visa', 'type', 'country', '0', '0', '0', '0', 0, '0', '0', '0', '0', '0'),
('card_db84658c-6058-11e9-bcdd-966a0a06784e', '1555427036.7787300', 'card', 546546, 5466, 'f8cfe460f8a31bf108b1393571f4bfdbda9763be97dc71b442bf4859', 11, 11, 'test', '77855b5f-6058-11e9-bcdd-966a0a06784e', 'Mastercard', 'type', 'country', '0', '0', '0', '0', 111111, '0', '0', '0', '0', '0'),
('card_deb0c206-5f94-11e9-bcdd-966a0a06784e', '1555342860.7436000', 'card', 424242, 4245, '08ad630afe58235e08a5d52924c69e09ca55c9e9b53517e742808708', 12, 25, 'asdfsdf', 'c8316fef-5f8f-11e9-bcdd-966a0a06784e', 'None', 'type', 'country', '0', '0', '0', '0', 0, '0', '0', '0', '0', '0'),
('card_e13fc858-5f91-11e9-bcdd-966a0a06784e', '1555341576.5461900', 'card', 424242, 4245, '08ad630afe58235e08a5d52924c69e09ca55c9e9b53517e742808708', 4, 2022, 'asdfsdf', 'c8316fef-5f8f-11e9-bcdd-966a0a06784e', 'None', 'type', 'country', '0', '0', '0', '0', 0, '0', '0', '0', '0', '0'),
('card_e1889c10-797a-11e9-a6a6-966a0a06784e', '1558190428.8309200', 'card', 401200, 7, '522fd11a5a880b14cbd7f2811c018d75d3e6db828fa3118aa693a6f1', 3, 2020, '', '77855b5f-6058-11e9-bcdd-966a0a06784e', 'Visa', 'type', 'country', '0', '0', '0', '0', 0, '0', '0', '0', '0', '0'),
('card_e25c1ecf-601e-11e9-bcdd-966a0a06784e', '1555402137.4642600', 'card', 777777, 7777, '2cf042debd89dd5adcf84f0b7b03ca6fc30d3f2256d0781c58aade62', 20, 1, 'rahul', 'e25c1ecb-601e-11e9-bcdd-966a0a06784e', 'None', 'type', 'country', '0', '0', '0', '0', 0, '0', '0', '0', '0', '0'),
('card_ee82a562-605e-11e9-bcdd-966a0a06784e', '1555429645.6243300', 'card', 546546, 5466, 'f8cfe460f8a31bf108b1393571f4bfdbda9763be97dc71b442bf4859', 11, 11, 'test', '77855b5f-6058-11e9-bcdd-966a0a06784e', 'Mastercard', 'type', 'country', '0', '0', '0', '0', 111111, '0', '0', '0', '0', '0'),
('card_f7f7d451-5f9a-11e9-bcdd-966a0a06784e', '1555345480.1502300', 'card', 471610, 6531, '63978e91d740d5881254b7cba8c0f0c2289f5f7e83297e8de2f855a1', 21, 5, 'selvan', 'f7f7d44d-5f9a-11e9-bcdd-966a0a06784e', 'Visa', 'type', 'country', '0', '0', '0', '0', 0, '0', '0', '0', '0', '0');

-- --------------------------------------------------------

--
-- Table structure for table `deleted_CrossSaleOffer`
--

CREATE TABLE `deleted_CrossSaleOffer` (
  `cso_id` varchar(100) NOT NULL,
  `created` decimal(18,7) DEFAULT NULL,
  `objectType` varchar(255) DEFAULT NULL,
  `charge_amount` float(255,20) DEFAULT NULL,
  `charge_currency` varchar(3) DEFAULT NULL,
  `charge_capture` tinyint(1) DEFAULT NULL,
  `subscription_planId` varchar(41) DEFAULT NULL,
  `subscription_captureCharges` tinyint(1) DEFAULT NULL,
  `template` varchar(100) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `imageUrl` varchar(100) DEFAULT NULL,
  `companyName` varchar(100) DEFAULT NULL,
  `companyLocation` varchar(100) DEFAULT NULL,
  `termsAndConditionsUrl` varchar(100) DEFAULT NULL,
  `partnerId` varchar(100) DEFAULT NULL,
  `visibleForAllPartners` tinyint(1) DEFAULT NULL,
  `visibleForPartnerId` varchar(255) DEFAULT NULL,
  `metadata` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `deleted_CrossSaleOffer`
--

INSERT INTO `deleted_CrossSaleOffer` (`cso_id`, `created`, `objectType`, `charge_amount`, `charge_currency`, `charge_capture`, `subscription_planId`, `subscription_captureCharges`, `template`, `title`, `description`, `imageUrl`, `companyName`, `companyLocation`, `termsAndConditionsUrl`, `partnerId`, `visibleForAllPartners`, `visibleForPartnerId`, `metadata`) VALUES
('cso_0aa35b40-7ad8-11e9-a6a6-966a0a06784e', '1558340392.1515300', 'CrossSaleOffer', 4.00000000000000000000, 'EUR', 0, 'None', NULL, 'text_only', 'update', '0', '0', 'udaodercom', 'AW', 'https://securionpay.com/cross-sale-offers/', '0', 0, '0', '0'),
('cso_1af2c39c-839c-11e9-a6a6-966a0a06784e', '1559304210.1766100', 'CrossSaleOffer', 234.00000000000000000000, 'BHD', 0, 'None', NULL, 'image_and_text', 'xcvb', 'tgrfsd', '', 'fhrtesfd', 'AU', 'https://securionpay.com/cross-sale', '0', 0, '0', '0'),
('cso_2b2b88ce-839d-11e9-a6a6-966a0a06784e', '1559304666.8889400', 'CrossSaleOffer', 121.00000000000000000000, 'EUR', 0, 'None', NULL, 'text_only', 'zxcx', 'adsdd', '', 'cdswaszx', 'CH', 'http://xcsdfsdfd', '0', 0, '0', '0'),
('cso_2d76c69a-839b-11e9-a6a6-966a0a06784e', '1559303811.7440900', 'CrossSaleOffer', 121.00000000000000000000, 'EUR', 0, 'None', NULL, 'text_only', 'zxcx', 'adsdd', '0', 'cdswaszx', 'CH', 'http://xcsdfsdfd', '0', 0, '0', '0'),
('cso_4da664c8-8438-11e9-a6a6-966a0a06784e', '1559371296.7297200', 'CrossSaleOffer', 1223.00000000000000000000, 'INR', 0, 'None', NULL, 'qweqw', 'asdasd', '0', '0', 'qweqw', 'qweqwe', 'qweqw', '0', 0, '0', '0'),
('cso_598f9354-8438-11e9-a6a6-966a0a06784e', '1559371316.7128300', 'CrossSaleOffer', 1223.00000000000000000000, 'INR', 0, 'None', NULL, 'qweqw', 'asdasd', '0', '0', 'qweqw', 'qweqwe', 'qweqw', '0', 0, '0', '0'),
('cso_5aa6a276-839a-11e9-a6a6-966a0a06784e', '1559303458.0584500', 'CrossSaleOffer', 1212.00000000000000000000, 'AZN', 0, 'None', NULL, 'image_and_text', 'cxczczsad', 'csdcsc', '', 'xcxxvcv', 'AF', 'https://securionpay.com/cross-sale-offers', '0', 0, '0', '0'),
('cso_60e841dc-8438-11e9-a6a6-966a0a06784e', '1559371329.0380700', 'CrossSaleOffer', 1223.00000000000000000000, 'INR', 0, 'None', NULL, 'qweqw', 'asdasd', '0', '0', 'qweqw', 'qweqwe', 'qweqw', '0', 0, '0', '0'),
('cso_73ebd1e0-8438-11e9-a6a6-966a0a06784e', '1559371360.9381300', 'CrossSaleOffer', 1223.00000000000000000000, 'INR', 0, 'None', NULL, 'qweqw', 'asdasd', '0', '0', 'qweqw', 'qweqwe', 'qweqw', '0', 0, '0', '0'),
('cso_8d09e236-8472-11e9-a6a6-966a0a06784e', '1559396313.8885400', 'CrossSaleOffer', 1.00000000000000000000, 'AFN', 0, 'None', NULL, 'text_only', 'cvcbv', 'cvb', '', 'cxvcb', 'DZ', 'xcvcbvv', '0', 0, '0', '0'),
('cso_973f9d6c-8464-11e9-a6a6-966a0a06784e', '1559390318.0636700', 'CrossSaleOffer', 121.00000000000000000000, 'EUR', 0, 'None', NULL, 'text_only', 'zxcx', 'adsdd', '0', 'cdswaszx', 'CH', 'http://xcsdfsdfd', '0', 0, '0', '0'),
('cso_99842016-8437-11e9-a6a6-966a0a06784e', '1559370994.5152600', 'CrossSaleOffer', 12.00000000000000000000, 'INR', 0, 'None', NULL, 'qweqw', 'asdasd', '0', '0', 'qweqw', 'qweqwe', 'qweqw', '0', 0, '0', '0'),
('cso_9b20268a-839d-11e9-a6a6-966a0a06784e', '1559304854.7192600', 'CrossSaleOffer', 0.00000000000000000000, 'INR', 0, 'None', NULL, 'image_and_text', 'india', 'indian', '', 'dgxfhc', 'IN', 'https://securionpay.com/cross-sale-offers', '0', 0, '0', '0'),
('cso_a939a5ae-839b-11e9-a6a6-966a0a06784e', '1559304019.3809000', 'CrossSaleOffer', 121.00000000000000000000, 'EUR', 0, 'None', NULL, 'text_only', 'zxcx', 'adsdd', '0', 'cdswaszx', 'CH', 'http://xcsdfsdfd', '0', 0, '0', '0'),
('cso_ac8a8c8c-8472-11e9-a6a6-966a0a06784e', '1559396366.7411000', 'CrossSaleOffer', 1221.00000000000000000000, 'AOA', 0, 'None', NULL, 'text_only', 'rtrtr', 'cxvcbv', '', 'xcvxcvcv', 'AL', 'cvbvbbvv', '0', 0, '0', '0'),
('cso_adc67976-839b-11e9-a6a6-966a0a06784e', '1559304027.0147300', 'CrossSaleOffer', 121.00000000000000000000, 'EUR', 0, 'None', NULL, 'text_only', 'zxcx', 'adsdd', '', 'cdswaszx', 'CH', 'http://xcsdfsdfd', '0', 0, '0', '0'),
('cso_b9778716-7981-11e9-a6a6-966a0a06784e', '1558193368.0872300', 'CrossSaleOffer', 1.00000000000000000000, 'EUR', 0, 'None', NULL, 'image_and_text', '1212', 'test', 'blob:http://139.59.66.127:3001/9a1da915-96d5-4233-af4c-602c16ef2e8f', 'xcvcv', 'AM', 'https://securionpay.com/cross-sale-offers/cso_LvenXNUQ7s4kObxzSeDAurGX', '0', 0, '0', '0'),
('cso_c723c2b0-839c-11e9-a6a6-966a0a06784e', '1559304499.0658600', 'CrossSaleOffer', 654.00000000000000000000, 'AZN', 0, 'None', NULL, 'image_and_text', 'nbfg', 'cvcbvbv', '', 'cvbvcbfb', 'AR', 'https://securionpay.com/cross-sale', '0', 0, '0', '0'),
('cso_d54f49f0-839b-11e9-a6a6-966a0a06784e', '1559304093.3424600', 'CrossSaleOffer', 121.00000000000000000000, 'EUR', 0, 'None', NULL, 'text_only', 'zxcx', 'adsdd', '', 'cdswaszx', 'CH', 'http://xcsdfsdfd', '0', 0, '0', '0'),
('cso_d6ae1506-8463-11e9-a6a6-966a0a06784e', '1559389994.9873400', 'CrossSaleOffer', 1212.00000000000000000000, 'BDT', 0, 'None', NULL, 'text_only', 'cxvvcv', 'cvbvb', '', 'cbche', 'AI', 'https://securionpay.com/cross-sale-offers', '0', 0, '0', '0'),
('cso_e6f48314-846d-11e9-a6a6-966a0a06784e', '1559394317.2598200', 'CrossSaleOffer', 2.00000000000000000000, 'INR', 0, 'None', NULL, 'text_only', 'titel', 'cvxcvc', '', 'nmghfdsa', 'IN', 'https://securionpay.com/cross-sale', '0', 0, '0', '0'),
('cso_f1a0445e-7ad3-11e9-a6a6-966a0a06784e', '1558338632.2012800', 'CrossSaleOffer', 1.00000000000000000000, 'EUR', 0, 'None', NULL, 'text_only', 'update', '0', '0', 'udaodercom', 'AW', 'https://securionpay.com/cross-sale-offers/', '0', 0, '0', '0');

-- --------------------------------------------------------

--
-- Table structure for table `deleted_customers`
--

CREATE TABLE `deleted_customers` (
  `id` varchar(36) NOT NULL,
  `created` decimal(18,7) DEFAULT NULL,
  `objectType` varchar(255) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `defaultCardId` varchar(41) DEFAULT NULL,
  `metadata` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `deleted_customers`
--

INSERT INTO `deleted_customers` (`id`, `created`, `objectType`, `email`, `description`, `defaultCardId`, `metadata`) VALUES
('012be8a1-8372-11e9-a6a6-966a0a06784e', '1559286128.0678700', 'customer', 'steve@gmail.com', '0', '0', '0'),
('0440549f-8468-11e9-a6a6-966a0a06784e', '1559391789.4303400', 'customer', 'rahul.kumar9961@gmail.com', 'zXcvb', '0', '0'),
('0599be79-82da-11e9-a6a6-966a0a06784e', '1559220851.9956200', 'customer', 'agmayank007@gmail.com', 'asdasdd', '0', '0'),
('082e6c73-8372-11e9-a6a6-966a0a06784e', '1559286139.8283200', 'customer', 'rogers@gmail.com', '0', '0', '0'),
('0b7fe6d1-8372-11e9-a6a6-966a0a06784e', '1559286145.3954200', 'customer', 'iron@gmail.com', '0', '0', '0'),
('0ea2cc43-8372-11e9-a6a6-966a0a06784e', '1559286150.6572800', 'customer', 'hulk@gmail.com', '0', '0', '0'),
('11b14df1-5f96-11e9-bcdd-966a0a06784e', '1555343375.8077300', 'customer', 'hello@gmail.com', '0', '0', '0'),
('174f1359-8379-11e9-a6a6-966a0a06784e', '1559289171.6852600', 'customer', 'troy@gmail.com', '0', '0', '0'),
('24337a8f-8458-11e9-a6a6-966a0a06784e', '1559384971.0854700', 'customer', 'vondelmort@gmail.com', 'vcbdf', '0', '0'),
('2b0e3f47-8378-11e9-a6a6-966a0a06784e', '1559288775.3181100', 'customer', 'troy@gmail.com', '0', '0', '0'),
('2fd186bb-8458-11e9-a6a6-966a0a06784e', '1559384990.5762100', 'customer', 'vondelmort@gmail.com', 'cxxxcxzxx', '0', '0'),
('40c9c97b-82da-11e9-a6a6-966a0a06784e', '1559220951.2961400', 'customer', 'agmayank007@gmail.com', 'bnkbjhikjh', '0', '0'),
('43131f8f-8379-11e9-a6a6-966a0a06784e', '1559289245.1121900', 'customer', 'troy@gmail.com', '0', '0', '0'),
('48b4b209-600c-11e9-bcdd-966a0a06784e', '1555394148.7187300', 'customer', 'hello@gmail.com', '0', '0', '0'),
('50ff7f31-8378-11e9-a6a6-966a0a06784e', '1559288838.9749300', 'customer', 'troy@gmail.com', '0', '0', '0'),
('585352c7-8467-11e9-a6a6-966a0a06784e', '1559391500.9866400', 'customer', 'sample@gmail.com', 'sample', '0', '0'),
('6ef0ef5b-8379-11e9-a6a6-966a0a06784e', '1559289318.7078900', 'customer', 'troy@gmail.com', '0', '0', '0'),
('6f3ec879-82da-11e9-a6a6-966a0a06784e', '1559221029.2380200', 'customer', 'agmayank007@gmail.com', 'asdasdd', '0', '0'),
('77855b5f-6058-11e9-bcdd-966a0a06784e', '1555426869.0128600', 'customer', 'saurabh@gmail.com', 'update', '0', '0'),
('7f8c74e7-6002-11e9-bcdd-966a0a06784e', '1555389945.7624000', 'customer', 'agmayank007@gmail.com', '0', '0', '0'),
('8423c145-82da-11e9-a6a6-966a0a06784e', '1559221064.2930500', 'customer', 'agmayank007@gmail.com', 'asdasdd', '0', '0'),
('8423c14a-82da-11e9-a6a6-966a0a06784e', '1559221065.5898400', 'customer', 'agmayank007@gmail.com', 'asdasdd', '0', '0'),
('88a3c801-82d9-11e9-a6a6-966a0a06784e', '1559220642.3462800', 'customer', 'agmayank007@gmail.com', 'asdasdd', '0', '0'),
('9278398b-8458-11e9-a6a6-966a0a06784e', '1559385156.0853600', 'customer', 'vondelmort@gmail.com', 'sample', '0', '0'),
('99e40205-836c-11e9-a6a6-966a0a06784e', '1559283807.3116600', 'customer', 'tony@gmail.com', '0', 'card_99e40204-836c-11e9-a6a6-966a0a06784e', '0'),
('9d86dff5-6002-11e9-bcdd-966a0a06784e', '1555389996.0574800', 'customer', 'agmayank007@gmail.com', '0', '0', '0'),
('aadab7c7-8379-11e9-a6a6-966a0a06784e', '1559289419.2256100', 'customer', 'troy@gmail.com', '0', '0', '0'),
('b251b8a9-8458-11e9-a6a6-966a0a06784e', '1559385209.5200800', 'customer', 'sdfdfdf@gmail.com', 'xcxvdfdf', '0', '0'),
('b4800df7-836c-11e9-a6a6-966a0a06784e', '1559283851.9510000', 'customer', 'avengers@gmail.com', '0', '0', '0'),
('b9ff710f-836c-11e9-a6a6-966a0a06784e', '1559283861.1745200', 'customer', 'toy@gmail.com', '0', '0', '0'),
('bd0495e3-82da-11e9-a6a6-966a0a06784e', '1559221159.7189700', 'customer', 'agmayank007@gmail.com', 'asdasdd', '0', '0'),
('bde0827d-836c-11e9-a6a6-966a0a06784e', '1559283867.6826300', 'customer', 'avengers123456@gmail.com', '0', '0', '0'),
('c4d23541-5f99-11e9-bcdd-966a0a06784e', '1555344964.8257300', 'customer', 'techkopra1@gmail.com', '0', '0', '0'),
('c8316fef-5f8f-11e9-bcdd-966a0a06784e', '1555340675.5158600', 'customer', 'abhi@gmail.com', '0', '0', '0'),
('c9ca38cb-603b-11e9-bcdd-966a0a06784e', '1555414551.6322200', 'customer', 'saurabh@gmail.com', '0', '0', '0'),
('cf653969-6038-11e9-bcdd-966a0a06784e', '1555413272.5464700', 'customer', 'whehe', '0', '0', '0'),
('d0b0d117-8378-11e9-a6a6-966a0a06784e', '1559289053.2076100', 'customer', 'troy@gmail.com', '0', '0', '0'),
('e25c1ecb-601e-11e9-bcdd-966a0a06784e', '1555402137.4485000', 'customer', 'ashishranjan1@gmail.com', 'undefined', '0', '0'),
('e5a9b691-82d9-11e9-a6a6-966a0a06784e', '1559220798.4131800', 'customer', 'agmayank007@gmail.com', 'vdsdsd', '0', '0'),
('ebeacde1-846a-11e9-a6a6-966a0a06784e', '1559393037.0946600', 'customer', 'rahul.kumar9961@gmail.com', 'afgagag', '0', '0'),
('ec7a9177-85cf-11e9-a6a6-966a0a06784e', '1559546368.3692100', 'customer', 'dfgdf@gmail.com', 'cvbvbcfghf', '0', '0'),
('f01f6a17-603d-11e9-bcdd-966a0a06784e', '1555415474.9374100', 'customer', 'shvsvs@gmail.com', 'hjj', '0', '0'),
('f7b6410f-8465-11e9-a6a6-966a0a06784e', '1559390909.3992600', 'customer', 'admin@gmail.com', 'admin', '0', '0'),
('f7f7d44d-5f9a-11e9-bcdd-966a0a06784e', '1555345480.1328000', 'customer', 'selvan@amalpay.com', '0', '0', '0'),
('fc6d80ff-8465-11e9-a6a6-966a0a06784e', '1559390917.3110200', 'customer', 'sdfdfdf@gmail.com', 'drtyeryre', '0', '0');

-- --------------------------------------------------------

--
-- Table structure for table `deleted_plan`
--

CREATE TABLE `deleted_plan` (
  `plan_id` varchar(41) NOT NULL,
  `created` decimal(18,7) DEFAULT NULL,
  `objectType` varchar(255) DEFAULT NULL,
  `amount` float(200,10) DEFAULT NULL,
  `currency` varchar(200) DEFAULT NULL,
  `intervals` varchar(200) DEFAULT NULL,
  `intervalCount` int(10) DEFAULT NULL,
  `billingCycles` varchar(200) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `trialPeriodDays` int(10) DEFAULT NULL,
  `recursTo` varchar(200) DEFAULT NULL,
  `metadata` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `deleted_plan`
--

INSERT INTO `deleted_plan` (`plan_id`, `created`, `objectType`, `amount`, `currency`, `intervals`, `intervalCount`, `billingCycles`, `name`, `trialPeriodDays`, `recursTo`, `metadata`) VALUES
('plan_14f344a4-83a5-11e9-a6a6-966a0a06784e', '1559308065.5842200', 'plan', 64.0000000000, 'INR', 'day', 1, 'null', 'arfwdfa', 0, '0', '0'),
('plan_46585732-8468-11e9-a6a6-966a0a06784e', '1559391900.3172100', 'plan', 54.0000000000, 'AUD', 'hour', 1, '1', 'Subhash', 1, '', '0'),
('plan_4acfe640-85e9-11e9-a6a6-966a0a06784e', '1559557264.0524800', 'plan', 67.0000000000, 'GEL', 'hour', 2, '1', 'sample3', 2, '', '0'),
('plan_6046f128-846b-11e9-a6a6-966a0a06784e', '1559393232.3141300', 'plan', 2.0000000000, 'NAD', 'week', 1, '44', 'xcxv', 3, '', '0'),
('plan_691204be-797b-11e9-a6a6-966a0a06784e', '1558190656.2238700', 'plan', 1.0000000000, 'INR', 'hour', 1, '1', 'Subhash', 1, '', '0'),
('plan_7ec1e0b8-797b-11e9-a6a6-966a0a06784e', '1558190692.6085300', 'plan', 1.0000000000, 'INR', 'day', 1, '1', 'Subhash', 1, '', '0'),
('plan_8e07db20-85e9-11e9-a6a6-966a0a06784e', '1559557376.8265900', 'plan', 3.0000000000, 'INR', 'month', 4, '3', 'testr6', 3, '', '0'),
('plan_f82b285a-83a4-11e9-a6a6-966a0a06784e', '1559308017.2965500', 'plan', 64.0000000000, 'INR', 'day', 1, 'null', 'arfwdfa', 0, '0', '0');

-- --------------------------------------------------------

--
-- Table structure for table `disputes`
--

CREATE TABLE `disputes` (
  `id` varchar(41) NOT NULL,
  `created` decimal(18,7) DEFAULT NULL,
  `objectType` varchar(255) DEFAULT NULL,
  `updated` float(255,20) DEFAULT NULL,
  `amount` float(255,20) DEFAULT NULL,
  `currency` varchar(56) DEFAULT NULL,
  `status` varchar(200) DEFAULT NULL,
  `reason` varchar(200) DEFAULT NULL,
  `acceptedAsLost` tinyint(1) DEFAULT NULL,
  `charge` varchar(200) DEFAULT NULL,
  `evidence` varchar(200) DEFAULT NULL,
  `hasEvidence` tinyint(1) DEFAULT NULL,
  `submissionCount` int(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `disputes_evidence`
--

CREATE TABLE `disputes_evidence` (
  `productDescription` varchar(255) DEFAULT NULL,
  `customerName` varchar(255) DEFAULT NULL,
  `customerEmail` varchar(255) DEFAULT NULL,
  `customerPurchaseIp` varchar(255) DEFAULT NULL,
  `customerSignature` varchar(255) DEFAULT NULL,
  `billingAddress` varchar(200) DEFAULT NULL,
  `receipt` varchar(200) DEFAULT NULL,
  `reason` varchar(200) DEFAULT NULL,
  `customerCommunication` varchar(200) DEFAULT NULL,
  `serviceDate` varchar(200) DEFAULT NULL,
  `serviceDocumentation` varchar(200) DEFAULT NULL,
  `duplicateChargeId` varchar(200) DEFAULT NULL,
  `duplicateChargeDocumentation` varchar(200) DEFAULT NULL,
  `duplicateChargeExplanation` varchar(255) DEFAULT NULL,
  `refundPolicy` varchar(255) DEFAULT NULL,
  `refundPolicyDisclosure` varchar(255) DEFAULT NULL,
  `refundRefusalExplanation` varchar(255) DEFAULT NULL,
  `cancellationPolicy` varchar(200) DEFAULT NULL,
  `cancellationPolicyDisclosure` varchar(200) DEFAULT NULL,
  `cancellationRefusalExplanation` varchar(200) DEFAULT NULL,
  `accessActivityLogs` varchar(200) DEFAULT NULL,
  `shippingAddress` varchar(200) DEFAULT NULL,
  `shippingDate` varchar(200) DEFAULT NULL,
  `shippingCarrier` varchar(200) DEFAULT NULL,
  `shippingTrackingNumber` varchar(200) DEFAULT NULL,
  `shippingDocumentation` varchar(200) DEFAULT NULL,
  `uncategorizedText` varchar(200) DEFAULT NULL,
  `uncategorizedFile` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `event_id` varchar(100) NOT NULL,
  `created` decimal(18,7) DEFAULT NULL,
  `objectType` varchar(255) DEFAULT NULL,
  `type` varchar(200) DEFAULT NULL,
  `data` varchar(200) DEFAULT NULL,
  `log` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`event_id`, `created`, `objectType`, `type`, `data`, `log`) VALUES
('event_00ea63da-85e3-11e9-a6a6-966a0a06784e', '1559554563.0945800', 'event', 'CHARGE_UPDATED', 'char_00ea63db-85e3-11e9-a6a6-966a0a06784e', 'log_00ea63dc-85e3-11e9-a6a6-966a0a06784e'),
('event_012be8a2-8372-11e9-a6a6-966a0a06784e', '1559286128.0706100', 'event', 'CUSTOMER_CREATED', 'char_012be8a3-8372-11e9-a6a6-966a0a06784e', 'log_012be8a4-8372-11e9-a6a6-966a0a06784e'),
('event_0181c942-8215-11e9-a6a6-966a0a06784e', '1559136234.2768700', 'event', 'CHARGE_SUCCEEDED', 'char_0181c943-8215-11e9-a6a6-966a0a06784e', 'log_0181c944-8215-11e9-a6a6-966a0a06784e'),
('event_018908aa-8458-11e9-a6a6-966a0a06784e', '1559384912.9258900', 'event', 'CHARGE_UPDATED', 'char_018908ab-8458-11e9-a6a6-966a0a06784e', 'log_018908ac-8458-11e9-a6a6-966a0a06784e'),
('event_02420c65-85e9-11e9-a6a6-966a0a06784e', '1559557142.3304100', 'event', 'PLAN_CREATED', 'char_02420c66-85e9-11e9-a6a6-966a0a06784e', 'log_02420c67-85e9-11e9-a6a6-966a0a06784e'),
('event_036d6788-8476-11e9-a6a6-966a0a06784e', '1559397801.0023900', 'event', 'CROSS_SALE_OFFER_DELETED', 'char_036d6789-8476-11e9-a6a6-966a0a06784e', 'log_036d678a-8476-11e9-a6a6-966a0a06784e'),
('event_0393ddbe-8458-11e9-a6a6-966a0a06784e', '1559384916.3523100', 'event', 'CHARGE_UPDATED', 'char_0393ddbf-8458-11e9-a6a6-966a0a06784e', 'log_0393ddc0-8458-11e9-a6a6-966a0a06784e'),
('event_044054a0-8468-11e9-a6a6-966a0a06784e', '1559391789.4332000', 'event', 'CUSTOMER_CREATED', 'char_044054a1-8468-11e9-a6a6-966a0a06784e', 'log_044054a2-8468-11e9-a6a6-966a0a06784e'),
('event_0599be7a-82da-11e9-a6a6-966a0a06784e', '1559220851.9987800', 'event', 'CUSTOMER_CREATED', 'char_0599be7b-82da-11e9-a6a6-966a0a06784e', 'log_0599be7c-82da-11e9-a6a6-966a0a06784e'),
('event_0716ba83-85e4-11e9-a6a6-966a0a06784e', '1559555002.9506400', 'event', 'CUSTOMER_CARD_CREATED', 'char_0716ba84-85e4-11e9-a6a6-966a0a06784e', 'log_0716ba85-85e4-11e9-a6a6-966a0a06784e'),
('event_075d319c-7aef-11e9-a6a6-966a0a06784e', '1558350265.0833100', 'event', 'CUSTOMER_CARD_UPDATE', 'char_075d319d-7aef-11e9-a6a6-966a0a06784e', 'log_075d319e-7aef-11e9-a6a6-966a0a06784e'),
('event_07d6c20a-8477-11e9-a6a6-966a0a06784e', '1559398237.9003000', 'event', 'CUSTOMER_DELETED', 'char_07d6c20b-8477-11e9-a6a6-966a0a06784e', 'log_07d6c20c-8477-11e9-a6a6-966a0a06784e'),
('event_082e6c74-8372-11e9-a6a6-966a0a06784e', '1559286139.8308000', 'event', 'CUSTOMER_CREATED', 'char_082e6c75-8372-11e9-a6a6-966a0a06784e', 'log_082e6c76-8372-11e9-a6a6-966a0a06784e'),
('event_086be233-85e3-11e9-a6a6-966a0a06784e', '1559554575.6911300', 'event', 'CUSTOMER_CARD_CREATED', 'char_086be234-85e3-11e9-a6a6-966a0a06784e', 'log_086be235-85e3-11e9-a6a6-966a0a06784e'),
('event_08a59241-7aec-11e9-a6a6-966a0a06784e', '1558348978.7543900', 'event', 'CUSTOMER_SUBSCRIPTION_CREATED', 'char_08a59242-7aec-11e9-a6a6-966a0a06784e', 'log_08a59243-7aec-11e9-a6a6-966a0a06784e'),
('event_0a133736-845b-11e9-a6a6-966a0a06784e', '1559386215.7434900', 'event', 'CROSS_SALE_OFFER_DELETED', 'char_0a133737-845b-11e9-a6a6-966a0a06784e', 'log_0a133738-845b-11e9-a6a6-966a0a06784e'),
('event_0a36365a-85e1-11e9-a6a6-966a0a06784e', '1559553719.6973300', 'event', 'CHARGE_UPDATED', 'char_0a36365b-85e1-11e9-a6a6-966a0a06784e', 'log_0a36365c-85e1-11e9-a6a6-966a0a06784e'),
('event_0aa35b41-7ad8-11e9-a6a6-966a0a06784e', '1558340392.1580200', 'event', 'CROSS_SALE_OFFER_CREATED', 'char_0aa35b42-7ad8-11e9-a6a6-966a0a06784e', 'log_0aa35b43-7ad8-11e9-a6a6-966a0a06784e'),
('event_0aef97fd-846b-11e9-a6a6-966a0a06784e', '1559393089.1404600', 'event', 'PLAN_CREATED', 'char_0aef97fe-846b-11e9-a6a6-966a0a06784e', 'log_0aef97ff-846b-11e9-a6a6-966a0a06784e'),
('event_0b7fe6d2-8372-11e9-a6a6-966a0a06784e', '1559286145.3977700', 'event', 'CUSTOMER_CREATED', 'char_0b7fe6d3-8372-11e9-a6a6-966a0a06784e', 'log_0b7fe6d4-8372-11e9-a6a6-966a0a06784e'),
('event_0c53aecd-85eb-11e9-a6a6-966a0a06784e', '1559558018.2189100', 'event', 'CHARGE_SUCCEEDED', 'char_0c53aece-85eb-11e9-a6a6-966a0a06784e', 'log_0c53aecf-85eb-11e9-a6a6-966a0a06784e'),
('event_0cf1f888-8475-11e9-a6a6-966a0a06784e', '1559397387.4737800', 'event', 'CROSS_SALE_OFFER_DELETED', 'char_0cf1f889-8475-11e9-a6a6-966a0a06784e', 'log_0cf1f88a-8475-11e9-a6a6-966a0a06784e'),
('event_0e01c3ba-85c7-11e9-a6a6-966a0a06784e', '1559542559.1517900', 'event', 'CUSTOMER_CREATED', 'char_0e01c3bb-85c7-11e9-a6a6-966a0a06784e', 'log_0e01c3bc-85c7-11e9-a6a6-966a0a06784e'),
('event_0e977626-8390-11e9-a6a6-966a0a06784e', '1559299035.4849800', 'event', 'CUSTOMER_CARD_UPDATE', 'char_0e977627-8390-11e9-a6a6-966a0a06784e', 'log_0e977628-8390-11e9-a6a6-966a0a06784e'),
('event_0ea2cc44-8372-11e9-a6a6-966a0a06784e', '1559286150.6616900', 'event', 'CUSTOMER_CREATED', 'char_0ea2cc45-8372-11e9-a6a6-966a0a06784e', 'log_0ea2cc46-8372-11e9-a6a6-966a0a06784e'),
('event_0f405fb9-846f-11e9-a6a6-966a0a06784e', '1559394814.3671000', 'event', 'CROSS_SALE_OFFER_CREATED', 'char_0f405fba-846f-11e9-a6a6-966a0a06784e', 'log_0f405fbb-846f-11e9-a6a6-966a0a06784e'),
('event_0fbf268e-8476-11e9-a6a6-966a0a06784e', '1559397821.6705800', 'event', 'CROSS_SALE_OFFER_DELETED', 'char_0fbf268f-8476-11e9-a6a6-966a0a06784e', 'log_0fbf2690-8476-11e9-a6a6-966a0a06784e'),
('event_11b14df2-5f96-11e9-bcdd-966a0a06784e', '1555343375.8100200', 'event', 'CUSTOMER_CREATED', 'char_11b14df3-5f96-11e9-bcdd-966a0a06784e', 'log_11b14df4-5f96-11e9-bcdd-966a0a06784e'),
('event_11b14df6-5f96-11e9-bcdd-966a0a06784e', '1555343375.8229100', 'event', 'CUSTOMER_CARD_CREATED', 'char_11b14df7-5f96-11e9-bcdd-966a0a06784e', 'log_11b14df8-5f96-11e9-bcdd-966a0a06784e'),
('event_11c00484-8477-11e9-a6a6-966a0a06784e', '1559398254.5283900', 'event', 'CUSTOMER_DELETED', 'char_11c00485-8477-11e9-a6a6-966a0a06784e', 'log_11c00486-8477-11e9-a6a6-966a0a06784e'),
('event_133b8970-845c-11e9-a6a6-966a0a06784e', '1559386660.6039300', 'event', 'CROSS_SALE_OFFER_DELETED', 'char_133b8971-845c-11e9-a6a6-966a0a06784e', 'log_133b8972-845c-11e9-a6a6-966a0a06784e'),
('event_13b2f3eb-85f9-11e9-a6a6-966a0a06784e', '1559564043.5406400', 'event', 'CROSS_SALE_OFFER_CREATED', 'char_13b2f3ec-85f9-11e9-a6a6-966a0a06784e', 'log_13b2f3ed-85f9-11e9-a6a6-966a0a06784e'),
('event_147b2924-8477-11e9-a6a6-966a0a06784e', '1559398259.1102900', 'event', 'CUSTOMER_DELETED', 'char_147b2925-8477-11e9-a6a6-966a0a06784e', 'log_147b2926-8477-11e9-a6a6-966a0a06784e'),
('event_14f344a5-83a5-11e9-a6a6-966a0a06784e', '1559308065.5910300', 'event', 'PLAN_CREATED', 'char_14f344a6-83a5-11e9-a6a6-966a0a06784e', 'log_14f344a7-83a5-11e9-a6a6-966a0a06784e'),
('event_15879ebf-7af0-11e9-a6a6-966a0a06784e', '1558350718.3512000', 'event', 'PLAN_CREATED', 'char_15879ec0-7af0-11e9-a6a6-966a0a06784e', 'log_15879ec1-7af0-11e9-a6a6-966a0a06784e'),
('event_15ba5762-82d1-11e9-a6a6-966a0a06784e', '1559217013.5822500', 'event', 'CHARGE_REFUNDED', 'char_15ba5763-82d1-11e9-a6a6-966a0a06784e', 'log_15ba5764-82d1-11e9-a6a6-966a0a06784e'),
('event_15ebb35d-846b-11e9-a6a6-966a0a06784e', '1559393107.5713900', 'event', 'PLAN_CREATED', 'char_15ebb35e-846b-11e9-a6a6-966a0a06784e', 'log_15ebb35f-846b-11e9-a6a6-966a0a06784e'),
('event_18138bbc-85da-11e9-a6a6-966a0a06784e', '1559550736.4811500', 'event', 'CHARGE_UPDATED', 'char_18138bbd-85da-11e9-a6a6-966a0a06784e', 'log_18138bbe-85da-11e9-a6a6-966a0a06784e'),
('event_1835e4ca-8215-11e9-a6a6-966a0a06784e', '1559136272.3677100', 'event', 'CHARGE_SUCCEEDED', 'char_1835e4cb-8215-11e9-a6a6-966a0a06784e', 'log_1835e4cc-8215-11e9-a6a6-966a0a06784e'),
('event_1851aab2-8467-11e9-a6a6-966a0a06784e', '1559391393.6087400', 'event', 'CHARGE_SUCCEEDED', 'char_1851aab3-8467-11e9-a6a6-966a0a06784e', 'log_1851aab4-8467-11e9-a6a6-966a0a06784e'),
('event_18910fc2-85cf-11e9-a6a6-966a0a06784e', '1559546012.8423600', 'event', 'CUSTOMER_CREATED', 'char_18910fc3-85cf-11e9-a6a6-966a0a06784e', 'log_18910fc4-85cf-11e9-a6a6-966a0a06784e'),
('event_18b6bc0e-845b-11e9-a6a6-966a0a06784e', '1559386240.3031700', 'event', 'CROSS_SALE_OFFER_DELETED', 'char_18b6bc0f-845b-11e9-a6a6-966a0a06784e', 'log_18b6bc10-845b-11e9-a6a6-966a0a06784e'),
('event_193ad858-847a-11e9-a6a6-966a0a06784e', '1559399555.5677300', 'event', 'CUSTOMER_DELETED', 'char_193ad859-847a-11e9-a6a6-966a0a06784e', 'log_193ad85a-847a-11e9-a6a6-966a0a06784e'),
('event_1a5f8e1e-8433-11e9-a6a6-966a0a06784e', '1559369063.2181300', 'event', 'CUSTOMER_SUBSCRIPTION_UPDATED', 'char_1a5f8e1f-8433-11e9-a6a6-966a0a06784e', 'log_1a5f8e20-8433-11e9-a6a6-966a0a06784e'),
('event_1a817658-85c0-11e9-a6a6-966a0a06784e', '1559539573.6419500', 'event', 'CUSTOMER_UPDATED', 'char_1a817659-85c0-11e9-a6a6-966a0a06784e', 'log_1a81765a-85c0-11e9-a6a6-966a0a06784e'),
('event_1af2c39d-839c-11e9-a6a6-966a0a06784e', '1559304210.1819700', 'event', 'CROSS_SALE_OFFER_CREATED', 'char_1af2c39e-839c-11e9-a6a6-966a0a06784e', 'log_1af2c39f-839c-11e9-a6a6-966a0a06784e'),
('event_1cb27163-85fb-11e9-a6a6-966a0a06784e', '1559564917.6292700', 'event', 'CROSS_SALE_OFFER_CREATED', 'char_1cb27164-85fb-11e9-a6a6-966a0a06784e', 'log_1cb27165-85fb-11e9-a6a6-966a0a06784e'),
('event_1fcd5030-85ea-11e9-a6a6-966a0a06784e', '1559557621.3903700', 'event', 'PLAN_DELETED', 'char_1fcd5031-85ea-11e9-a6a6-966a0a06784e', 'log_1fcd5032-85ea-11e9-a6a6-966a0a06784e'),
('event_2187d76c-82cd-11e9-a6a6-966a0a06784e', '1559215315.3974800', 'event', 'CHARGE_REFUNDED', 'char_2187d76d-82cd-11e9-a6a6-966a0a06784e', 'log_2187d76e-82cd-11e9-a6a6-966a0a06784e'),
('event_22788e0e-7aef-11e9-a6a6-966a0a06784e', '1558350310.5611900', 'event', 'CUSTOMER_CARD_UPDATE', 'char_22788e0f-7aef-11e9-a6a6-966a0a06784e', 'log_22788e10-7aef-11e9-a6a6-966a0a06784e'),
('event_22fcd10a-85da-11e9-a6a6-966a0a06784e', '1559550754.7871200', 'event', 'CHARGE_UPDATED', 'char_22fcd10b-85da-11e9-a6a6-966a0a06784e', 'log_22fcd10c-85da-11e9-a6a6-966a0a06784e'),
('event_23a2dbf2-85d9-11e9-a6a6-966a0a06784e', '1559550326.3824900', 'event', 'CHARGE_SUCCEEDED', 'char_23a2dbf3-85d9-11e9-a6a6-966a0a06784e', 'log_23a2dbf4-85d9-11e9-a6a6-966a0a06784e'),
('event_23b45bc8-837c-11e9-a6a6-966a0a06784e', '1559290480.9720400', 'event', 'CUSTOMER_UPDATED', 'char_23b45bc9-837c-11e9-a6a6-966a0a06784e', 'log_23b45bca-837c-11e9-a6a6-966a0a06784e'),
('event_23c1f6f0-85c9-11e9-a6a6-966a0a06784e', '1559543454.6373000', 'event', 'CUSTOMER_CREATED', 'char_23c1f6f1-85c9-11e9-a6a6-966a0a06784e', 'log_23c1f6f2-85c9-11e9-a6a6-966a0a06784e'),
('event_24337a90-8458-11e9-a6a6-966a0a06784e', '1559384971.0880800', 'event', 'CUSTOMER_CREATED', 'char_24337a91-8458-11e9-a6a6-966a0a06784e', 'log_24337a92-8458-11e9-a6a6-966a0a06784e'),
('event_25b0d94b-5f93-11e9-bcdd-966a0a06784e', '1555342120.8715000', 'event', 'CUSTOMER_CARD_CREATED', 'char_25b0d94c-5f93-11e9-bcdd-966a0a06784e', 'log_25b0d94d-5f93-11e9-bcdd-966a0a06784e'),
('event_25cb8558-82cd-11e9-a6a6-966a0a06784e', '1559215322.5516100', 'event', 'CHARGE_REFUNDED', 'char_25cb8559-82cd-11e9-a6a6-966a0a06784e', 'log_25cb855a-82cd-11e9-a6a6-966a0a06784e'),
('event_25edd073-85ed-11e9-a6a6-966a0a06784e', '1559558920.1638200', 'event', 'CROSS_SALE_OFFER_CREATED', 'char_25edd074-85ed-11e9-a6a6-966a0a06784e', 'log_25edd075-85ed-11e9-a6a6-966a0a06784e'),
('event_26a67fc2-8477-11e9-a6a6-966a0a06784e', '1559398289.5933000', 'event', 'CUSTOMER_DELETED', 'char_26a67fc3-8477-11e9-a6a6-966a0a06784e', 'log_26a67fc4-8477-11e9-a6a6-966a0a06784e'),
('event_26bfcbe8-85ea-11e9-a6a6-966a0a06784e', '1559557633.0458700', 'event', 'PLAN_DELETED', 'char_26bfcbe9-85ea-11e9-a6a6-966a0a06784e', 'log_26bfcbea-85ea-11e9-a6a6-966a0a06784e'),
('event_26ea4f7e-845c-11e9-a6a6-966a0a06784e', '1559386693.6261100', 'event', 'CROSS_SALE_OFFER_DELETED', 'char_26ea4f7f-845c-11e9-a6a6-966a0a06784e', 'log_26ea4f80-845c-11e9-a6a6-966a0a06784e'),
('event_291ab4c5-82a3-11e9-a6a6-966a0a06784e', '1559197289.2465100', 'event', 'CHARGE_SUCCEEDED', 'char_291ab4c6-82a3-11e9-a6a6-966a0a06784e', 'log_291ab4c7-82a3-11e9-a6a6-966a0a06784e'),
('event_29cd6383-85da-11e9-a6a6-966a0a06784e', '1559550766.2223800', 'event', 'CUSTOMER_CARD_CREATED', 'char_29cd6384-85da-11e9-a6a6-966a0a06784e', 'log_29cd6385-85da-11e9-a6a6-966a0a06784e'),
('event_2a06ecef-846b-11e9-a6a6-966a0a06784e', '1559393141.3013000', 'event', 'PLAN_CREATED', 'char_2a06ecf0-846b-11e9-a6a6-966a0a06784e', 'log_2a06ecf1-846b-11e9-a6a6-966a0a06784e'),
('event_2a63c7e2-8476-11e9-a6a6-966a0a06784e', '1559397866.3703100', 'event', 'CROSS_SALE_OFFER_DELETED', 'char_2a63c7e3-8476-11e9-a6a6-966a0a06784e', 'log_2a63c7e4-8476-11e9-a6a6-966a0a06784e'),
('event_2acddb9e-85e0-11e9-a6a6-966a0a06784e', '1559553344.8815100', 'event', 'CHARGE_UPDATED', 'char_2acddb9f-85e0-11e9-a6a6-966a0a06784e', 'log_2acddba0-85e0-11e9-a6a6-966a0a06784e'),
('event_2b2b88cf-839d-11e9-a6a6-966a0a06784e', '1559304666.8936900', 'event', 'CROSS_SALE_OFFER_CREATED', 'char_2b2b88d0-839d-11e9-a6a6-966a0a06784e', 'log_2b2b88d1-839d-11e9-a6a6-966a0a06784e'),
('event_2bdec51e-847a-11e9-a6a6-966a0a06784e', '1559399586.8408700', 'event', 'CUSTOMER_DELETED', 'char_2bdec51f-847a-11e9-a6a6-966a0a06784e', 'log_2bdec520-847a-11e9-a6a6-966a0a06784e'),
('event_2c0ba9ce-8684-11e9-a6a6-966a0a06784e', '1559623784.4280400', 'event', 'CUSTOMER_UPDATED', 'char_2c0ba9cf-8684-11e9-a6a6-966a0a06784e', 'log_2c0ba9d0-8684-11e9-a6a6-966a0a06784e'),
('event_2c40b07f-85e4-11e9-a6a6-966a0a06784e', '1559555065.3023500', 'event', 'CUSTOMER_CARD_CREATED', 'char_2c40b080-85e4-11e9-a6a6-966a0a06784e', 'log_2c40b081-85e4-11e9-a6a6-966a0a06784e'),
('event_2cc10c61-85e9-11e9-a6a6-966a0a06784e', '1559557213.6270300', 'event', 'PLAN_CREATED', 'char_2cc10c62-85e9-11e9-a6a6-966a0a06784e', 'log_2cc10c63-85e9-11e9-a6a6-966a0a06784e'),
('event_2d76c69b-839b-11e9-a6a6-966a0a06784e', '1559303811.7505500', 'event', 'CROSS_SALE_OFFER_CREATED', 'char_2d76c69c-839b-11e9-a6a6-966a0a06784e', 'log_2d76c69d-839b-11e9-a6a6-966a0a06784e'),
('event_2f1f2326-838b-11e9-a6a6-966a0a06784e', '1559296942.5776500', 'event', 'CUSTOMER_CARD_DELETED', 'char_2f1f2327-838b-11e9-a6a6-966a0a06784e', 'log_2f1f2328-838b-11e9-a6a6-966a0a06784e'),
('event_2f216f43-85e2-11e9-a6a6-966a0a06784e', '1559554211.1363100', 'event', 'CUSTOMER_CARD_CREATED', 'char_2f216f44-85e2-11e9-a6a6-966a0a06784e', 'log_2f216f45-85e2-11e9-a6a6-966a0a06784e'),
('event_2f86fc8e-85da-11e9-a6a6-966a0a06784e', '1559550775.8252800', 'event', 'CHARGE_UPDATED', 'char_2f86fc8f-85da-11e9-a6a6-966a0a06784e', 'log_2f86fc90-85da-11e9-a6a6-966a0a06784e'),
('event_2fd186bc-8458-11e9-a6a6-966a0a06784e', '1559384990.5785600', 'event', 'CUSTOMER_CREATED', 'char_2fd186bd-8458-11e9-a6a6-966a0a06784e', 'log_2fd186be-8458-11e9-a6a6-966a0a06784e'),
('event_30e33327-8432-11e9-a6a6-966a0a06784e', '1559368671.5018700', 'event', 'CUSTOMER_SUBSCRIPTION_CREATED', 'char_30e33328-8432-11e9-a6a6-966a0a06784e', 'log_30e33329-8432-11e9-a6a6-966a0a06784e'),
('event_318ff22a-8476-11e9-a6a6-966a0a06784e', '1559397878.4037100', 'event', 'CROSS_SALE_OFFER_DELETED', 'char_318ff22b-8476-11e9-a6a6-966a0a06784e', 'log_318ff22c-8476-11e9-a6a6-966a0a06784e'),
('event_3219017e-8475-11e9-a6a6-966a0a06784e', '1559397449.8052900', 'event', 'CROSS_SALE_OFFER_DELETED', 'char_3219017f-8475-11e9-a6a6-966a0a06784e', 'log_32190180-8475-11e9-a6a6-966a0a06784e'),
('event_3226a5d8-8478-11e9-a6a6-966a0a06784e', '1559398738.3848500', 'event', 'CUSTOMER_DELETED', 'char_3226a5d9-8478-11e9-a6a6-966a0a06784e', 'log_3226a5da-8478-11e9-a6a6-966a0a06784e'),
('event_33958886-85e4-11e9-a6a6-966a0a06784e', '1559555077.5988000', 'event', 'CUSTOMER_CARD_UPDATE', 'char_33958887-85e4-11e9-a6a6-966a0a06784e', 'log_33958888-85e4-11e9-a6a6-966a0a06784e'),
('event_33be9671-85d2-11e9-a6a6-966a0a06784e', '1559547346.9294600', 'event', 'CUSTOMER_CARD_CREATED', 'char_33be9672-85d2-11e9-a6a6-966a0a06784e', 'log_33be9673-85d2-11e9-a6a6-966a0a06784e'),
('event_33cb9bf6-8463-11e9-a6a6-966a0a06784e', '1559389721.7123700', 'event', 'CHARGE_REFUNDED', 'char_33cb9bf7-8463-11e9-a6a6-966a0a06784e', 'log_33cb9bf8-8463-11e9-a6a6-966a0a06784e'),
('event_34c2d917-85da-11e9-a6a6-966a0a06784e', '1559550784.6086500', 'event', 'CUSTOMER_CARD_CREATED', 'char_34c2d918-85da-11e9-a6a6-966a0a06784e', 'log_34c2d919-85da-11e9-a6a6-966a0a06784e'),
('event_350e3b36-82ce-11e9-a6a6-966a0a06784e', '1559215777.6512200', 'event', 'CHARGE_REFUNDED', 'char_350e3b37-82ce-11e9-a6a6-966a0a06784e', 'log_350e3b38-82ce-11e9-a6a6-966a0a06784e'),
('event_3563d3c3-846b-11e9-a6a6-966a0a06784e', '1559393160.3654500', 'event', 'PLAN_CREATED', 'char_3563d3c4-846b-11e9-a6a6-966a0a06784e', 'log_3563d3c5-846b-11e9-a6a6-966a0a06784e'),
('event_360203a4-7aec-11e9-a6a6-966a0a06784e', '1558349054.8485800', 'event', 'CUSTOMER_DELETED', 'char_360203a5-7aec-11e9-a6a6-966a0a06784e', 'log_360203a6-7aec-11e9-a6a6-966a0a06784e'),
('event_36cfb1da-82cd-11e9-a6a6-966a0a06784e', '1559215351.1000800', 'event', 'CHARGE_REFUNDED', 'char_36cfb1db-82cd-11e9-a6a6-966a0a06784e', 'log_36cfb1dc-82cd-11e9-a6a6-966a0a06784e'),
('event_3724a90c-838f-11e9-a6a6-966a0a06784e', '1559298674.0225700', 'event', 'CUSTOMER_CARD_UPDATE', 'char_3724a90d-838f-11e9-a6a6-966a0a06784e', 'log_3724a90e-838f-11e9-a6a6-966a0a06784e'),
('event_37a06d78-7979-11e9-a6a6-966a0a06784e', '1558189714.2777700', 'event', 'CUSTOMER_UPDATED', 'char_37a06d79-7979-11e9-a6a6-966a0a06784e', 'log_37a06d7a-7979-11e9-a6a6-966a0a06784e'),
('event_39e6bf12-8390-11e9-a6a6-966a0a06784e', '1559299108.1465900', 'event', 'CUSTOMER_CARD_UPDATE', 'char_39e6bf13-8390-11e9-a6a6-966a0a06784e', 'log_39e6bf14-8390-11e9-a6a6-966a0a06784e'),
('event_3d63fac8-797d-11e9-a6a6-966a0a06784e', '1558191441.9348500', 'event', 'CUSTOMER_DELETED', 'char_3d63fac9-797d-11e9-a6a6-966a0a06784e', 'log_3d63faca-797d-11e9-a6a6-966a0a06784e'),
('event_3e16faa2-845d-11e9-a6a6-966a0a06784e', '1559387162.0031100', 'event', 'CROSS_SALE_OFFER_DELETED', 'char_3e16faa3-845d-11e9-a6a6-966a0a06784e', 'log_3e16faa4-845d-11e9-a6a6-966a0a06784e'),
('event_3fb2991a-85da-11e9-a6a6-966a0a06784e', '1559550802.9546400', 'event', 'CHARGE_UPDATED', 'char_3fb2991b-85da-11e9-a6a6-966a0a06784e', 'log_3fb2991c-85da-11e9-a6a6-966a0a06784e'),
('event_40964811-846b-11e9-a6a6-966a0a06784e', '1559393179.1536400', 'event', 'PLAN_CREATED', 'char_40964812-846b-11e9-a6a6-966a0a06784e', 'log_40964813-846b-11e9-a6a6-966a0a06784e'),
('event_40c9c97c-82da-11e9-a6a6-966a0a06784e', '1559220951.2988200', 'event', 'CUSTOMER_CREATED', 'char_40c9c97d-82da-11e9-a6a6-966a0a06784e', 'log_40c9c97e-82da-11e9-a6a6-966a0a06784e'),
('event_412ad875-600b-11e9-bcdd-966a0a06784e', '1555393706.5774500', 'event', 'CUSTOMER_CARD_CREATED', 'char_412ad876-600b-11e9-bcdd-966a0a06784e', 'log_412ad877-600b-11e9-bcdd-966a0a06784e'),
('event_41536e59-839a-11e9-a6a6-966a0a06784e', '1559303415.5735200', 'event', 'CHARGE_SUCCEEDED', 'char_41536e5a-839a-11e9-a6a6-966a0a06784e', 'log_41536e5b-839a-11e9-a6a6-966a0a06784e'),
('event_41822328-8477-11e9-a6a6-966a0a06784e', '1559398334.6536700', 'event', 'CUSTOMER_DELETED', 'char_41822329-8477-11e9-a6a6-966a0a06784e', 'log_4182232a-8477-11e9-a6a6-966a0a06784e'),
('event_41872535-7af0-11e9-a6a6-966a0a06784e', '1558350792.1678600', 'event', 'PLAN_CREATED', 'char_41872536-7af0-11e9-a6a6-966a0a06784e', 'log_41872537-7af0-11e9-a6a6-966a0a06784e'),
('event_421ee6bc-8473-11e9-a6a6-966a0a06784e', '1559396617.6939400', 'event', 'CROSS_SALE_OFFER_DELETED', 'char_421ee6bd-8473-11e9-a6a6-966a0a06784e', 'log_421ee6be-8473-11e9-a6a6-966a0a06784e'),
('event_42411ddd-85e4-11e9-a6a6-966a0a06784e', '1559555102.2150700', 'event', 'CUSTOMER_CARD_CREATED', 'char_42411dde-85e4-11e9-a6a6-966a0a06784e', 'log_42411ddf-85e4-11e9-a6a6-966a0a06784e'),
('event_42449092-85c2-11e9-a6a6-966a0a06784e', '1559540499.3452500', 'event', 'CUSTOMER_DELETED', 'char_42449093-85c2-11e9-a6a6-966a0a06784e', 'log_42449094-85c2-11e9-a6a6-966a0a06784e'),
('event_4434007c-85ce-11e9-a6a6-966a0a06784e', '1559545656.5549700', 'event', 'CUSTOMER_CREATED', 'char_4434007d-85ce-11e9-a6a6-966a0a06784e', 'log_4434007e-85ce-11e9-a6a6-966a0a06784e'),
('event_45c8f160-8435-11e9-a6a6-966a0a06784e', '1559369995.0443400', 'event', 'PLAN_UPDATED', 'char_45c8f161-8435-11e9-a6a6-966a0a06784e', 'log_45c8f162-8435-11e9-a6a6-966a0a06784e'),
('event_46585733-8468-11e9-a6a6-966a0a06784e', '1559391900.3217100', 'event', 'PLAN_CREATED', 'char_46585734-8468-11e9-a6a6-966a0a06784e', 'log_46585735-8468-11e9-a6a6-966a0a06784e'),
('event_48a0f13e-8477-11e9-a6a6-966a0a06784e', '1559398346.5996200', 'event', 'CHARGE_REFUNDED', 'char_48a0f13f-8477-11e9-a6a6-966a0a06784e', 'log_48a0f140-8477-11e9-a6a6-966a0a06784e'),
('event_48a44dec-7af0-11e9-a6a6-966a0a06784e', '1558350804.0981400', 'event', 'PLAN_DELETED', 'char_48a44ded-7af0-11e9-a6a6-966a0a06784e', 'log_48a44dee-7af0-11e9-a6a6-966a0a06784e'),
('event_48b4b20a-600c-11e9-bcdd-966a0a06784e', '1555394148.7205200', 'event', 'CUSTOMER_CREATED', 'char_48b4b20b-600c-11e9-bcdd-966a0a06784e', 'log_48b4b20c-600c-11e9-bcdd-966a0a06784e'),
('event_48b4b20e-600c-11e9-bcdd-966a0a06784e', '1555394148.7337800', 'event', 'CUSTOMER_CARD_CREATED', 'char_48b4b20f-600c-11e9-bcdd-966a0a06784e', 'log_48b4b210-600c-11e9-bcdd-966a0a06784e'),
('event_4acfe641-85e9-11e9-a6a6-966a0a06784e', '1559557264.0568600', 'event', 'PLAN_CREATED', 'char_4acfe642-85e9-11e9-a6a6-966a0a06784e', 'log_4acfe643-85e9-11e9-a6a6-966a0a06784e'),
('event_4b2163e6-8376-11e9-a6a6-966a0a06784e', '1559287970.1372600', 'event', 'CUSTOMER_UPDATED', 'char_4b2163e7-8376-11e9-a6a6-966a0a06784e', 'log_4b2163e8-8376-11e9-a6a6-966a0a06784e'),
('event_4b99a3bb-846b-11e9-a6a6-966a0a06784e', '1559393197.6273600', 'event', 'PLAN_CREATED', 'char_4b99a3bc-846b-11e9-a6a6-966a0a06784e', 'log_4b99a3bd-846b-11e9-a6a6-966a0a06784e'),
('event_4bfce2e2-85bd-11e9-a6a6-966a0a06784e', '1559538368.1690400', 'event', 'CUSTOMER_DELETED', 'char_4bfce2e3-85bd-11e9-a6a6-966a0a06784e', 'log_4bfce2e4-85bd-11e9-a6a6-966a0a06784e'),
('event_4c4a21e0-797b-11e9-a6a6-966a0a06784e', '1558190607.9378200', 'event', 'CUSTOMER_CARD_UPDATE', 'char_4c4a21e1-797b-11e9-a6a6-966a0a06784e', 'log_4c4a21e2-797b-11e9-a6a6-966a0a06784e'),
('event_4d89a874-8479-11e9-a6a6-966a0a06784e', '1559399213.8289100', 'event', 'CHARGE_UPDATED', 'char_4d89a875-8479-11e9-a6a6-966a0a06784e', 'log_4d89a876-8479-11e9-a6a6-966a0a06784e'),
('event_4da664c9-8438-11e9-a6a6-966a0a06784e', '1559371296.7363900', 'event', 'CROSS_SALE_OFFER_CREATED', 'char_4da664ca-8438-11e9-a6a6-966a0a06784e', 'log_4da664cb-8438-11e9-a6a6-966a0a06784e'),
('event_4f706920-85c3-11e9-a6a6-966a0a06784e', '1559540950.9397600', 'event', 'CUSTOMER_DELETED', 'char_4f706921-85c3-11e9-a6a6-966a0a06784e', 'log_4f706922-85c3-11e9-a6a6-966a0a06784e'),
('event_4fc85b24-85c5-11e9-a6a6-966a0a06784e', '1559541810.5096300', 'event', 'CUSTOMER_DELETED', 'char_4fc85b25-85c5-11e9-a6a6-966a0a06784e', 'log_4fc85b26-85c5-11e9-a6a6-966a0a06784e'),
('event_5186d923-85e3-11e9-a6a6-966a0a06784e', '1559554698.3405500', 'event', 'CUSTOMER_CARD_CREATED', 'char_5186d924-85e3-11e9-a6a6-966a0a06784e', 'log_5186d925-85e3-11e9-a6a6-966a0a06784e'),
('event_5186d926-85e3-11e9-a6a6-966a0a06784e', '1559554699.1887900', 'event', 'CHARGE_REFUNDED', 'char_5186d927-85e3-11e9-a6a6-966a0a06784e', 'log_5186d928-85e3-11e9-a6a6-966a0a06784e'),
('event_531f8b5c-8477-11e9-a6a6-966a0a06784e', '1559398364.2064000', 'event', 'CHARGE_REFUNDED', 'char_531f8b5d-8477-11e9-a6a6-966a0a06784e', 'log_531f8b5e-8477-11e9-a6a6-966a0a06784e'),
('event_543e77fe-8431-11e9-a6a6-966a0a06784e', '1559368301.3231100', 'event', 'SUBSCRIPTION_CREATE', 'char_543e77ff-8431-11e9-a6a6-966a0a06784e', 'log_543e7800-8431-11e9-a6a6-966a0a06784e'),
('event_5536b243-7af6-11e9-a6a6-966a0a06784e', '1558353402.1735100', 'event', 'CUSTOMER_CARD_CREATED', 'char_5536b244-7af6-11e9-a6a6-966a0a06784e', 'log_5536b245-7af6-11e9-a6a6-966a0a06784e'),
('event_569c6bb0-8477-11e9-a6a6-966a0a06784e', '1559398370.0578900', 'event', 'CUSTOMER_DELETED', 'char_569c6bb1-8477-11e9-a6a6-966a0a06784e', 'log_569c6bb2-8477-11e9-a6a6-966a0a06784e'),
('event_56fb42c0-82a3-11e9-a6a6-966a0a06784e', '1559197366.2191800', 'event', 'CHARGE_SUCCEEDED', 'char_56fb42c1-82a3-11e9-a6a6-966a0a06784e', 'log_56fb42c2-82a3-11e9-a6a6-966a0a06784e'),
('event_57153ce0-838f-11e9-a6a6-966a0a06784e', '1559298727.6084900', 'event', 'CUSTOMER_CARD_UPDATE', 'char_57153ce1-838f-11e9-a6a6-966a0a06784e', 'log_57153ce2-838f-11e9-a6a6-966a0a06784e'),
('event_58492438-797a-11e9-a6a6-966a0a06784e', '1558190198.5672800', 'event', 'CUSTOMER_UPDATED', 'char_58492439-797a-11e9-a6a6-966a0a06784e', 'log_5849243a-797a-11e9-a6a6-966a0a06784e'),
('event_585352c8-8467-11e9-a6a6-966a0a06784e', '1559391500.9891900', 'event', 'CUSTOMER_CREATED', 'char_585352c9-8467-11e9-a6a6-966a0a06784e', 'log_585352ca-8467-11e9-a6a6-966a0a06784e'),
('event_589768f3-85e4-11e9-a6a6-966a0a06784e', '1559555139.6896400', 'event', 'CUSTOMER_CARD_CREATED', 'char_589768f4-85e4-11e9-a6a6-966a0a06784e', 'log_589768f5-85e4-11e9-a6a6-966a0a06784e'),
('event_598f9355-8438-11e9-a6a6-966a0a06784e', '1559371316.7192800', 'event', 'CROSS_SALE_OFFER_CREATED', 'char_598f9356-8438-11e9-a6a6-966a0a06784e', 'log_598f9357-8438-11e9-a6a6-966a0a06784e'),
('event_5a51c59a-8461-11e9-a6a6-966a0a06784e', '1559388927.3516000', 'event', 'CHARGE_UPDATED', 'char_5a51c59b-8461-11e9-a6a6-966a0a06784e', 'log_5a51c59c-8461-11e9-a6a6-966a0a06784e'),
('event_5aa6a277-839a-11e9-a6a6-966a0a06784e', '1559303458.0651600', 'event', 'CROSS_SALE_OFFER_CREATED', 'char_5aa6a278-839a-11e9-a6a6-966a0a06784e', 'log_5aa6a279-839a-11e9-a6a6-966a0a06784e'),
('event_5b880365-60d2-11e9-bcdd-966a0a06784e', '1555479220.6618100', 'event', 'CUSTOMER_CARD_CREATED', 'char_5b880366-60d2-11e9-bcdd-966a0a06784e', 'log_5b880367-60d2-11e9-bcdd-966a0a06784e'),
('event_5b880369-60d2-11e9-bcdd-966a0a06784e', '1555479220.6789700', 'event', 'CHARGE_SUCCEEDED', 'char_5b88036a-60d2-11e9-bcdd-966a0a06784e', 'log_5b88036b-60d2-11e9-bcdd-966a0a06784e'),
('event_5c7ead3e-85e1-11e9-a6a6-966a0a06784e', '1559553857.7454100', 'event', 'CUSTOMER_UPDATED', 'char_5c7ead3f-85e1-11e9-a6a6-966a0a06784e', 'log_5c7ead40-85e1-11e9-a6a6-966a0a06784e'),
('event_5cc44902-85be-11e9-a6a6-966a0a06784e', '1559538825.8161900', 'event', 'CUSTOMER_DELETED', 'char_5cc44903-85be-11e9-a6a6-966a0a06784e', 'log_5cc44904-85be-11e9-a6a6-966a0a06784e'),
('event_5e41310a-8479-11e9-a6a6-966a0a06784e', '1559399241.8752400', 'event', 'CUSTOMER_DELETED', 'char_5e41310b-8479-11e9-a6a6-966a0a06784e', 'log_5e41310c-8479-11e9-a6a6-966a0a06784e'),
('event_5e900790-7979-11e9-a6a6-966a0a06784e', '1558189779.6014300', 'event', 'CUSTOMER_UPDATED', 'char_5e900791-7979-11e9-a6a6-966a0a06784e', 'log_5e900792-7979-11e9-a6a6-966a0a06784e'),
('event_5fb8a631-5f94-11e9-bcdd-966a0a06784e', '1555342647.7270600', 'event', 'CUSTOMER_CARD_CREATED', 'char_5fb8a632-5f94-11e9-bcdd-966a0a06784e', 'log_5fb8a633-5f94-11e9-bcdd-966a0a06784e'),
('event_60079b78-85d9-11e9-a6a6-966a0a06784e', '1559550427.7040700', 'event', 'CUSTOMER_CREATED', 'char_60079b79-85d9-11e9-a6a6-966a0a06784e', 'log_60079b7a-85d9-11e9-a6a6-966a0a06784e'),
('event_6046f129-846b-11e9-a6a6-966a0a06784e', '1559393232.3185500', 'event', 'PLAN_CREATED', 'char_6046f12a-846b-11e9-a6a6-966a0a06784e', 'log_6046f12b-846b-11e9-a6a6-966a0a06784e'),
('event_606dee5a-8479-11e9-a6a6-966a0a06784e', '1559399245.5238900', 'event', 'CHARGE_UPDATED', 'char_606dee5b-8479-11e9-a6a6-966a0a06784e', 'log_606dee5c-8479-11e9-a6a6-966a0a06784e'),
('event_60da011e-8477-11e9-a6a6-966a0a06784e', '1559398387.2387400', 'event', 'CUSTOMER_DELETED', 'char_60da011f-8477-11e9-a6a6-966a0a06784e', 'log_60da0120-8477-11e9-a6a6-966a0a06784e'),
('event_60e841dd-8438-11e9-a6a6-966a0a06784e', '1559371329.0422100', 'event', 'CROSS_SALE_OFFER_CREATED', 'char_60e841de-8438-11e9-a6a6-966a0a06784e', 'log_60e841df-8438-11e9-a6a6-966a0a06784e'),
('event_61a0952a-85c3-11e9-a6a6-966a0a06784e', '1559540981.4543300', 'event', 'CUSTOMER_DELETED', 'char_61a0952b-85c3-11e9-a6a6-966a0a06784e', 'log_61a0952c-85c3-11e9-a6a6-966a0a06784e'),
('event_6461119a-8479-11e9-a6a6-966a0a06784e', '1559399252.1504800', 'event', 'CHARGE_UPDATED', 'char_6461119b-8479-11e9-a6a6-966a0a06784e', 'log_6461119c-8479-11e9-a6a6-966a0a06784e'),
('event_6461119d-8479-11e9-a6a6-966a0a06784e', '1559399252.6547700', 'event', 'CHARGE_UPDATED', 'char_6461119e-8479-11e9-a6a6-966a0a06784e', 'log_6461119f-8479-11e9-a6a6-966a0a06784e'),
('event_646111a0-8479-11e9-a6a6-966a0a06784e', '1559399252.9125800', 'event', 'CHARGE_UPDATED', 'char_646111a1-8479-11e9-a6a6-966a0a06784e', 'log_646111a2-8479-11e9-a6a6-966a0a06784e'),
('event_64758a64-85df-11e9-a6a6-966a0a06784e', '1559553012.1140500', 'event', 'CHARGE_UPDATED', 'char_64758a65-85df-11e9-a6a6-966a0a06784e', 'log_64758a66-85df-11e9-a6a6-966a0a06784e'),
('event_65ab7c0a-85d9-11e9-a6a6-966a0a06784e', '1559550437.1647100', 'event', 'CHARGE_UPDATED', 'char_65ab7c0b-85d9-11e9-a6a6-966a0a06784e', 'log_65ab7c0c-85d9-11e9-a6a6-966a0a06784e'),
('event_65c0e34e-85e1-11e9-a6a6-966a0a06784e', '1559553873.2788100', 'event', 'CUSTOMER_UPDATED', 'char_65c0e34f-85e1-11e9-a6a6-966a0a06784e', 'log_65c0e350-85e1-11e9-a6a6-966a0a06784e'),
('event_6661eade-8477-11e9-a6a6-966a0a06784e', '1559398396.5180300', 'event', 'CHARGE_REFUNDED', 'char_6661eadf-8477-11e9-a6a6-966a0a06784e', 'log_6661eae0-8477-11e9-a6a6-966a0a06784e'),
('event_67146c0f-8472-11e9-a6a6-966a0a06784e', '1559396250.2109700', 'event', 'CROSS_SALE_OFFER_CREATED', 'char_67146c10-8472-11e9-a6a6-966a0a06784e', 'log_67146c11-8472-11e9-a6a6-966a0a06784e'),
('event_67f04b8c-8479-11e9-a6a6-966a0a06784e', '1559399258.1223100', 'event', 'CHARGE_UPDATED', 'char_67f04b8d-8479-11e9-a6a6-966a0a06784e', 'log_67f04b8e-8479-11e9-a6a6-966a0a06784e'),
('event_691204bf-797b-11e9-a6a6-966a0a06784e', '1558190656.2277600', 'event', 'PLAN_CREATED', 'char_691204c0-797b-11e9-a6a6-966a0a06784e', 'log_691204c1-797b-11e9-a6a6-966a0a06784e'),
('event_69387272-85e0-11e9-a6a6-966a0a06784e', '1559553449.5988300', 'event', 'CHARGE_UPDATED', 'char_69387273-85e0-11e9-a6a6-966a0a06784e', 'log_69387274-85e0-11e9-a6a6-966a0a06784e'),
('event_6ea401f1-8684-11e9-a6a6-966a0a06784e', '1559623896.1583300', 'event', 'CUSTOMER_CARD_CREATED', 'char_6ea401f2-8684-11e9-a6a6-966a0a06784e', 'log_6ea401f3-8684-11e9-a6a6-966a0a06784e'),
('event_6f3ec87a-82da-11e9-a6a6-966a0a06784e', '1559221029.2404900', 'event', 'CUSTOMER_CREATED', 'char_6f3ec87b-82da-11e9-a6a6-966a0a06784e', 'log_6f3ec87c-82da-11e9-a6a6-966a0a06784e'),
('event_7213929f-85e2-11e9-a6a6-966a0a06784e', '1559554323.4528000', 'event', 'CUSTOMER_CARD_CREATED', 'char_721392a0-85e2-11e9-a6a6-966a0a06784e', 'log_721392a1-85e2-11e9-a6a6-966a0a06784e'),
('event_72cef900-8473-11e9-a6a6-966a0a06784e', '1559396699.3785200', 'event', 'CROSS_SALE_OFFER_DELETED', 'char_72cef901-8473-11e9-a6a6-966a0a06784e', 'log_72cef902-8473-11e9-a6a6-966a0a06784e'),
('event_73ebd1e1-8438-11e9-a6a6-966a0a06784e', '1559371360.9425500', 'event', 'CROSS_SALE_OFFER_CREATED', 'char_73ebd1e2-8438-11e9-a6a6-966a0a06784e', 'log_73ebd1e3-8438-11e9-a6a6-966a0a06784e'),
('event_74016e88-846a-11e9-a6a6-966a0a06784e', '1559392835.9165900', 'event', 'PLAN_DELETED', 'char_74016e89-846a-11e9-a6a6-966a0a06784e', 'log_74016e8a-846a-11e9-a6a6-966a0a06784e'),
('event_7432cb3e-7986-11e9-a6a6-966a0a06784e', '1558195399.3577100', 'event', 'PLAN_DELETED', 'char_7432cb3f-7986-11e9-a6a6-966a0a06784e', 'log_7432cb40-7986-11e9-a6a6-966a0a06784e'),
('event_74575657-605f-11e9-bcdd-966a0a06784e', '1555429870.1572400', 'event', 'CUSTOMER_CARD_CREATED', 'char_74575658-605f-11e9-bcdd-966a0a06784e', 'log_74575659-605f-11e9-bcdd-966a0a06784e'),
('event_7457565b-605f-11e9-bcdd-966a0a06784e', '1555429870.1713800', 'event', 'CHARGE_SUCCEEDED', 'char_7457565c-605f-11e9-bcdd-966a0a06784e', 'log_7457565d-605f-11e9-bcdd-966a0a06784e'),
('event_74e9ceb4-8463-11e9-a6a6-966a0a06784e', '1559389830.9622100', 'event', 'CHARGE_REFUNDED', 'char_74e9ceb5-8463-11e9-a6a6-966a0a06784e', 'log_74e9ceb6-8463-11e9-a6a6-966a0a06784e'),
('event_768424c9-839a-11e9-a6a6-966a0a06784e', '1559303504.8137500', 'event', 'CHARGE_SUCCEEDED', 'char_768424ca-839a-11e9-a6a6-966a0a06784e', 'log_768424cb-839a-11e9-a6a6-966a0a06784e'),
('event_77855b60-6058-11e9-bcdd-966a0a06784e', '1555426869.0150000', 'event', 'CUSTOMER_CREATED', 'char_77855b61-6058-11e9-bcdd-966a0a06784e', 'log_77855b62-6058-11e9-bcdd-966a0a06784e'),
('event_78dc9d44-845e-11e9-a6a6-966a0a06784e', '1559387690.1030000', 'event', 'CHARGE_UPDATED', 'char_78dc9d45-845e-11e9-a6a6-966a0a06784e', 'log_78dc9d46-845e-11e9-a6a6-966a0a06784e'),
('event_7907bd22-8458-11e9-a6a6-966a0a06784e', '1559385113.4051500', 'event', 'CHARGE_REFUNDED', 'char_7907bd23-8458-11e9-a6a6-966a0a06784e', 'log_7907bd24-8458-11e9-a6a6-966a0a06784e'),
('event_7928b4d6-85df-11e9-a6a6-966a0a06784e', '1559553046.8424500', 'event', 'CHARGE_UPDATED', 'char_7928b4d7-85df-11e9-a6a6-966a0a06784e', 'log_7928b4d8-85df-11e9-a6a6-966a0a06784e'),
('event_79aa2e92-8479-11e9-a6a6-966a0a06784e', '1559399287.8618500', 'event', 'CHARGE_UPDATED', 'char_79aa2e93-8479-11e9-a6a6-966a0a06784e', 'log_79aa2e94-8479-11e9-a6a6-966a0a06784e'),
('event_7a41eb84-85ce-11e9-a6a6-966a0a06784e', '1559545747.2435000', 'event', 'CUSTOMER_CREATED', 'char_7a41eb85-85ce-11e9-a6a6-966a0a06784e', 'log_7a41eb86-85ce-11e9-a6a6-966a0a06784e'),
('event_7bb9a5bd-85fc-11e9-a6a6-966a0a06784e', '1559565506.5574200', 'event', 'CROSS_SALE_OFFER_CREATED', 'char_7bb9a5be-85fc-11e9-a6a6-966a0a06784e', 'log_7bb9a5bf-85fc-11e9-a6a6-966a0a06784e'),
('event_7c7a5b98-843c-11e9-a6a6-966a0a06784e', '1559373093.2810700', 'event', 'CROSS_SALE_OFFER_DELETED', 'char_7c7a5b99-843c-11e9-a6a6-966a0a06784e', 'log_7c7a5b9a-843c-11e9-a6a6-966a0a06784e'),
('event_7cc60ced-839b-11e9-a6a6-966a0a06784e', '1559303944.8070700', 'event', 'CHARGE_SUCCEEDED', 'char_7cc60cee-839b-11e9-a6a6-966a0a06784e', 'log_7cc60cef-839b-11e9-a6a6-966a0a06784e'),
('event_7ce6ddf0-845e-11e9-a6a6-966a0a06784e', '1559387696.8809600', 'event', 'CHARGE_UPDATED', 'char_7ce6ddf1-845e-11e9-a6a6-966a0a06784e', 'log_7ce6ddf2-845e-11e9-a6a6-966a0a06784e'),
('event_7dc65055-85ec-11e9-a6a6-966a0a06784e', '1559558638.0478400', 'event', 'CROSS_SALE_OFFER_CREATED', 'char_7dc65056-85ec-11e9-a6a6-966a0a06784e', 'log_7dc65057-85ec-11e9-a6a6-966a0a06784e'),
('event_7ec1e0b9-797b-11e9-a6a6-966a0a06784e', '1558190692.6127500', 'event', 'PLAN_CREATED', 'char_7ec1e0ba-797b-11e9-a6a6-966a0a06784e', 'log_7ec1e0bb-797b-11e9-a6a6-966a0a06784e'),
('event_7f8c74e8-6002-11e9-bcdd-966a0a06784e', '1555389945.7644000', 'event', 'CUSTOMER_CREATED', 'char_7f8c74e9-6002-11e9-bcdd-966a0a06784e', 'log_7f8c74ea-6002-11e9-bcdd-966a0a06784e'),
('event_7f8c74ec-6002-11e9-bcdd-966a0a06784e', '1555389945.7787600', 'event', 'CUSTOMER_CARD_CREATED', 'char_7f8c74ed-6002-11e9-bcdd-966a0a06784e', 'log_7f8c74ee-6002-11e9-bcdd-966a0a06784e'),
('event_804df5ae-85bd-11e9-a6a6-966a0a06784e', '1559538455.9418500', 'event', 'CUSTOMER_DELETED', 'char_804df5af-85bd-11e9-a6a6-966a0a06784e', 'log_804df5b0-85bd-11e9-a6a6-966a0a06784e'),
('event_82892e2b-85d2-11e9-a6a6-966a0a06784e', '1559547479.2659100', 'event', 'CHARGE_SUCCEEDED', 'char_82892e2c-85d2-11e9-a6a6-966a0a06784e', 'log_82892e2d-85d2-11e9-a6a6-966a0a06784e'),
('event_834d4268-8479-11e9-a6a6-966a0a06784e', '1559399304.0300900', 'event', 'CHARGE_UPDATED', 'char_834d4269-8479-11e9-a6a6-966a0a06784e', 'log_834d426a-8479-11e9-a6a6-966a0a06784e'),
('event_834d426b-8479-11e9-a6a6-966a0a06784e', '1559399305.1913700', 'event', 'CHARGE_UPDATED', 'char_834d426c-8479-11e9-a6a6-966a0a06784e', 'log_834d426d-8479-11e9-a6a6-966a0a06784e'),
('event_84165558-837b-11e9-a6a6-966a0a06784e', '1559290213.1785500', 'event', 'CUSTOMER_DELETED', 'char_84165559-837b-11e9-a6a6-966a0a06784e', 'log_8416555a-837b-11e9-a6a6-966a0a06784e'),
('event_8423c146-82da-11e9-a6a6-966a0a06784e', '1559221064.2963000', 'event', 'CUSTOMER_CREATED', 'char_8423c147-82da-11e9-a6a6-966a0a06784e', 'log_8423c148-82da-11e9-a6a6-966a0a06784e'),
('event_8423c14b-82da-11e9-a6a6-966a0a06784e', '1559221065.5924100', 'event', 'CUSTOMER_CREATED', 'char_8423c14c-82da-11e9-a6a6-966a0a06784e', 'log_8423c14d-82da-11e9-a6a6-966a0a06784e'),
('event_858c0bd8-85f8-11e9-a6a6-966a0a06784e', '1559563805.0445700', 'event', 'CROSS_SALE_OFFER_UPDATED', 'char_858c0bd9-85f8-11e9-a6a6-966a0a06784e', 'log_858c0bda-85f8-11e9-a6a6-966a0a06784e'),
('event_88a3c802-82d9-11e9-a6a6-966a0a06784e', '1559220642.3489200', 'event', 'CUSTOMER_CREATED', 'char_88a3c803-82d9-11e9-a6a6-966a0a06784e', 'log_88a3c804-82d9-11e9-a6a6-966a0a06784e'),
('event_88d4483a-8479-11e9-a6a6-966a0a06784e', '1559399313.3035700', 'event', 'CHARGE_UPDATED', 'char_88d4483b-8479-11e9-a6a6-966a0a06784e', 'log_88d4483c-8479-11e9-a6a6-966a0a06784e'),
('event_88d767cb-8386-11e9-a6a6-966a0a06784e', '1559294945.6225100', 'event', 'CUSTOMER_CARD_CREATED', 'char_88d767cc-8386-11e9-a6a6-966a0a06784e', 'log_88d767cd-8386-11e9-a6a6-966a0a06784e'),
('event_8a0da911-85e8-11e9-a6a6-966a0a06784e', '1559556940.6608100', 'event', 'PLAN_CREATED', 'char_8a0da912-85e8-11e9-a6a6-966a0a06784e', 'log_8a0da913-85e8-11e9-a6a6-966a0a06784e'),
('event_8c7e70b5-85fa-11e9-a6a6-966a0a06784e', '1559564675.6973600', 'event', 'CROSS_SALE_OFFER_CREATED', 'char_8c7e70b6-85fa-11e9-a6a6-966a0a06784e', 'log_8c7e70b7-85fa-11e9-a6a6-966a0a06784e'),
('event_8d09e237-8472-11e9-a6a6-966a0a06784e', '1559396313.8947000', 'event', 'CROSS_SALE_OFFER_CREATED', 'char_8d09e238-8472-11e9-a6a6-966a0a06784e', 'log_8d09e239-8472-11e9-a6a6-966a0a06784e'),
('event_8d42311e-85e0-11e9-a6a6-966a0a06784e', '1559553510.0628600', 'event', 'CUSTOMER_CREATED', 'char_8d42311f-85e0-11e9-a6a6-966a0a06784e', 'log_8d423120-85e0-11e9-a6a6-966a0a06784e'),
('event_8e07db21-85e9-11e9-a6a6-966a0a06784e', '1559557376.8302900', 'event', 'PLAN_CREATED', 'char_8e07db22-85e9-11e9-a6a6-966a0a06784e', 'log_8e07db23-85e9-11e9-a6a6-966a0a06784e'),
('event_8e106baf-5f93-11e9-bcdd-966a0a06784e', '1555342295.9815300', 'event', 'CUSTOMER_CARD_CREATED', 'char_8e106bb0-5f93-11e9-bcdd-966a0a06784e', 'log_8e106bb1-5f93-11e9-bcdd-966a0a06784e'),
('event_8e5fa894-8479-11e9-a6a6-966a0a06784e', '1559399322.6055400', 'event', 'CUSTOMER_DELETED', 'char_8e5fa895-8479-11e9-a6a6-966a0a06784e', 'log_8e5fa896-8479-11e9-a6a6-966a0a06784e'),
('event_9088aa4e-845b-11e9-a6a6-966a0a06784e', '1559386441.3279900', 'event', 'CROSS_SALE_OFFER_DELETED', 'char_9088aa4f-845b-11e9-a6a6-966a0a06784e', 'log_9088aa50-845b-11e9-a6a6-966a0a06784e'),
('event_9278398c-8458-11e9-a6a6-966a0a06784e', '1559385156.0875800', 'event', 'CUSTOMER_CREATED', 'char_9278398d-8458-11e9-a6a6-966a0a06784e', 'log_9278398e-8458-11e9-a6a6-966a0a06784e'),
('event_92e3c92b-82aa-11e9-a6a6-966a0a06784e', '1559200473.2025100', 'event', 'CUSTOMER_SUBSCRIPTION_CREATED', 'char_92e3c92c-82aa-11e9-a6a6-966a0a06784e', 'log_92e3c92d-82aa-11e9-a6a6-966a0a06784e'),
('event_933f9a0d-5f91-11e9-bcdd-966a0a06784e', '1555341445.6856000', 'event', 'CUSTOMER_CARD_CREATED', 'char_933f9a0e-5f91-11e9-bcdd-966a0a06784e', 'log_933f9a0f-5f91-11e9-bcdd-966a0a06784e'),
('event_953c3b3e-85cd-11e9-a6a6-966a0a06784e', '1559545363.0104300', 'event', 'CUSTOMER_CREATED', 'char_953c3b3f-85cd-11e9-a6a6-966a0a06784e', 'log_953c3b40-85cd-11e9-a6a6-966a0a06784e'),
('event_961a437f-6060-11e9-bcdd-966a0a06784e', '1555430356.2971800', 'event', 'CUSTOMER_CARD_CREATED', 'char_961a4380-6060-11e9-bcdd-966a0a06784e', 'log_961a4381-6060-11e9-bcdd-966a0a06784e'),
('event_961a4383-6060-11e9-bcdd-966a0a06784e', '1555430356.3133600', 'event', 'CHARGE_SUCCEEDED', 'char_961a4384-6060-11e9-bcdd-966a0a06784e', 'log_961a4385-6060-11e9-bcdd-966a0a06784e'),
('event_966b324d-7af6-11e9-a6a6-966a0a06784e', '1558353511.5754200', 'event', 'CUSTOMER_SUBSCRIPTION_CREATED', 'char_966b324e-7af6-11e9-a6a6-966a0a06784e', 'log_966b324f-7af6-11e9-a6a6-966a0a06784e'),
('event_973f9d6d-8464-11e9-a6a6-966a0a06784e', '1559390318.0690100', 'event', 'CROSS_SALE_OFFER_CREATED', 'char_973f9d6e-8464-11e9-a6a6-966a0a06784e', 'log_973f9d6f-8464-11e9-a6a6-966a0a06784e'),
('event_98ac8772-797a-11e9-a6a6-966a0a06784e', '1558190306.5928300', 'event', 'CUSTOMER_UPDATED', 'char_98ac8773-797a-11e9-a6a6-966a0a06784e', 'log_98ac8774-797a-11e9-a6a6-966a0a06784e'),
('event_98f98391-85e3-11e9-a6a6-966a0a06784e', '1559554818.2101900', 'event', 'CUSTOMER_CARD_CREATED', 'char_98f98392-85e3-11e9-a6a6-966a0a06784e', 'log_98f98393-85e3-11e9-a6a6-966a0a06784e'),
('event_99842017-8437-11e9-a6a6-966a0a06784e', '1559370994.5223300', 'event', 'CROSS_SALE_OFFER_CREATED', 'char_99842018-8437-11e9-a6a6-966a0a06784e', 'log_99842019-8437-11e9-a6a6-966a0a06784e'),
('event_99e40206-836c-11e9-a6a6-966a0a06784e', '1559283807.3146600', 'event', 'CUSTOMER_CREATED', 'char_99e40207-836c-11e9-a6a6-966a0a06784e', 'log_99e40208-836c-11e9-a6a6-966a0a06784e'),
('event_99f12174-8214-11e9-a6a6-966a0a06784e', '1559136060.5245600', 'event', 'CHARGE_SUCCEEDED', 'char_99f12175-8214-11e9-a6a6-966a0a06784e', 'log_99f12176-8214-11e9-a6a6-966a0a06784e'),
('event_9b20268b-839d-11e9-a6a6-966a0a06784e', '1559304854.7266300', 'event', 'CROSS_SALE_OFFER_CREATED', 'char_9b20268c-839d-11e9-a6a6-966a0a06784e', 'log_9b20268d-839d-11e9-a6a6-966a0a06784e'),
('event_9cca4ff2-7979-11e9-a6a6-966a0a06784e', '1558189884.0021200', 'event', 'CUSTOMER_UPDATED', 'char_9cca4ff3-7979-11e9-a6a6-966a0a06784e', 'log_9cca4ff4-7979-11e9-a6a6-966a0a06784e'),
('event_9d86dff6-6002-11e9-bcdd-966a0a06784e', '1555389996.0601600', 'event', 'CUSTOMER_CREATED', 'char_9d86dff7-6002-11e9-bcdd-966a0a06784e', 'log_9d86dff8-6002-11e9-bcdd-966a0a06784e'),
('event_9d86dffa-6002-11e9-bcdd-966a0a06784e', '1555389996.0730800', 'event', 'CUSTOMER_CARD_CREATED', 'char_9d86dffb-6002-11e9-bcdd-966a0a06784e', 'log_9d86dffc-6002-11e9-bcdd-966a0a06784e'),
('event_9e28cf99-85e2-11e9-a6a6-966a0a06784e', '1559554397.4126500', 'event', 'CUSTOMER_CARD_CREATED', 'char_9e28cf9a-85e2-11e9-a6a6-966a0a06784e', 'log_9e28cf9b-85e2-11e9-a6a6-966a0a06784e'),
('event_9ee6a170-85bb-11e9-a6a6-966a0a06784e', '1559537648.2806700', 'event', 'CUSTOMER_UPDATED', 'char_9ee6a171-85bb-11e9-a6a6-966a0a06784e', 'log_9ee6a172-85bb-11e9-a6a6-966a0a06784e'),
('event_a0934404-85c2-11e9-a6a6-966a0a06784e', '1559540657.5668300', 'event', 'CUSTOMER_DELETED', 'char_a0934405-85c2-11e9-a6a6-966a0a06784e', 'log_a0934406-85c2-11e9-a6a6-966a0a06784e'),
('event_a0b2c17f-6058-11e9-bcdd-966a0a06784e', '1555426938.0997700', 'event', 'CUSTOMER_CARD_CREATED', 'char_a0b2c180-6058-11e9-bcdd-966a0a06784e', 'log_a0b2c181-6058-11e9-bcdd-966a0a06784e'),
('event_a0b2c183-6058-11e9-bcdd-966a0a06784e', '1555426938.1171000', 'event', 'CHARGE_SUCCEEDED', 'char_a0b2c184-6058-11e9-bcdd-966a0a06784e', 'log_a0b2c185-6058-11e9-bcdd-966a0a06784e'),
('event_a0d2ff69-85e0-11e9-a6a6-966a0a06784e', '1559553542.8889300', 'event', 'CUSTOMER_CARD_CREATED', 'char_a0d2ff6a-85e0-11e9-a6a6-966a0a06784e', 'log_a0d2ff6b-85e0-11e9-a6a6-966a0a06784e'),
('event_a22136a6-7aea-11e9-a6a6-966a0a06784e', '1558348377.2534500', 'event', 'CUSTOMER_UPDATED', 'char_a22136a7-7aea-11e9-a6a6-966a0a06784e', 'log_a22136a8-7aea-11e9-a6a6-966a0a06784e'),
('event_a62c07c8-838f-11e9-a6a6-966a0a06784e', '1559298860.2979900', 'event', 'CUSTOMER_CARD_UPDATE', 'char_a62c07c9-838f-11e9-a6a6-966a0a06784e', 'log_a62c07ca-838f-11e9-a6a6-966a0a06784e'),
('event_a786b7e0-85f5-11e9-a6a6-966a0a06784e', '1559562573.5618800', 'event', 'CHARGE_REFUNDED', 'char_a786b7e1-85f5-11e9-a6a6-966a0a06784e', 'log_a786b7e2-85f5-11e9-a6a6-966a0a06784e'),
('event_a939a5af-839b-11e9-a6a6-966a0a06784e', '1559304019.3864700', 'event', 'CROSS_SALE_OFFER_CREATED', 'char_a939a5b0-839b-11e9-a6a6-966a0a06784e', 'log_a939a5b1-839b-11e9-a6a6-966a0a06784e'),
('event_a97066ca-85df-11e9-a6a6-966a0a06784e', '1559553127.8429800', 'event', 'CHARGE_UPDATED', 'char_a97066cb-85df-11e9-a6a6-966a0a06784e', 'log_a97066cc-85df-11e9-a6a6-966a0a06784e'),
('event_aa83f3c4-8459-11e9-a6a6-966a0a06784e', '1559385625.9242700', 'event', 'PLAN_DELETED', 'char_aa83f3c5-8459-11e9-a6a6-966a0a06784e', 'log_aa83f3c6-8459-11e9-a6a6-966a0a06784e'),
('event_aa8c4558-8371-11e9-a6a6-966a0a06784e', '1559285982.7377000', 'event', 'CUSTOMER_DELETED', 'char_aa8c4559-8371-11e9-a6a6-966a0a06784e', 'log_aa8c455a-8371-11e9-a6a6-966a0a06784e'),
('event_aadab7c8-8379-11e9-a6a6-966a0a06784e', '1559289419.2285400', 'event', 'CUSTOMER_CREATED', 'char_aadab7c9-8379-11e9-a6a6-966a0a06784e', 'log_aadab7ca-8379-11e9-a6a6-966a0a06784e'),
('event_aae3c902-8477-11e9-a6a6-966a0a06784e', '1559398511.4542200', 'event', 'CUSTOMER_DELETED', 'char_aae3c903-8477-11e9-a6a6-966a0a06784e', 'log_aae3c904-8477-11e9-a6a6-966a0a06784e'),
('event_ab8d50d3-6058-11e9-bcdd-966a0a06784e', '1555426956.3092600', 'event', 'CUSTOMER_CARD_CREATED', 'char_ab8d50d4-6058-11e9-bcdd-966a0a06784e', 'log_ab8d50d5-6058-11e9-bcdd-966a0a06784e'),
('event_ab8d50d7-6058-11e9-bcdd-966a0a06784e', '1555426956.3258200', 'event', 'CHARGE_SUCCEEDED', 'char_ab8d50d8-6058-11e9-bcdd-966a0a06784e', 'log_ab8d50d9-6058-11e9-bcdd-966a0a06784e'),
('event_ac8a8c8d-8472-11e9-a6a6-966a0a06784e', '1559396366.7456500', 'event', 'CROSS_SALE_OFFER_CREATED', 'char_ac8a8c8e-8472-11e9-a6a6-966a0a06784e', 'log_ac8a8c8f-8472-11e9-a6a6-966a0a06784e'),
('event_ad25075e-85bb-11e9-a6a6-966a0a06784e', '1559537672.1776800', 'event', 'CUSTOMER_UPDATED', 'char_ad25075f-85bb-11e9-a6a6-966a0a06784e', 'log_ad250760-85bb-11e9-a6a6-966a0a06784e'),
('event_adc67977-839b-11e9-a6a6-966a0a06784e', '1559304027.0201700', 'event', 'CROSS_SALE_OFFER_CREATED', 'char_adc67978-839b-11e9-a6a6-966a0a06784e', 'log_adc67979-839b-11e9-a6a6-966a0a06784e'),
('event_af97cca4-8388-11e9-a6a6-966a0a06784e', '1559295869.6265900', 'event', 'CUSTOMER_CARD_DELETED', 'char_af97cca5-8388-11e9-a6a6-966a0a06784e', 'log_af97cca6-8388-11e9-a6a6-966a0a06784e'),
('event_afdbe55a-7af6-11e9-a6a6-966a0a06784e', '1558353554.2481100', 'event', 'CUSTOMER_DELETED', 'char_afdbe55b-7af6-11e9-a6a6-966a0a06784e', 'log_afdbe55c-7af6-11e9-a6a6-966a0a06784e'),
('event_b039ecd5-85e8-11e9-a6a6-966a0a06784e', '1559557004.7046200', 'event', 'PLAN_CREATED', 'char_b039ecd6-85e8-11e9-a6a6-966a0a06784e', 'log_b039ecd7-85e8-11e9-a6a6-966a0a06784e'),
('event_b07ca5de-85c6-11e9-a6a6-966a0a06784e', '1559542402.2534500', 'event', 'CUSTOMER_CREATED', 'char_b07ca5df-85c6-11e9-a6a6-966a0a06784e', 'log_b07ca5e0-85c6-11e9-a6a6-966a0a06784e'),
('event_b0c10afd-85d9-11e9-a6a6-966a0a06784e', '1559550563.1387100', 'event', 'CUSTOMER_CARD_CREATED', 'char_b0c10afe-85d9-11e9-a6a6-966a0a06784e', 'log_b0c10aff-85d9-11e9-a6a6-966a0a06784e'),
('event_b2020620-85be-11e9-a6a6-966a0a06784e', '1559538968.8270700', 'event', 'CUSTOMER_DELETED', 'char_b2020621-85be-11e9-a6a6-966a0a06784e', 'log_b2020622-85be-11e9-a6a6-966a0a06784e'),
('event_b251b8aa-8458-11e9-a6a6-966a0a06784e', '1559385209.5221300', 'event', 'CUSTOMER_CREATED', 'char_b251b8ab-8458-11e9-a6a6-966a0a06784e', 'log_b251b8ac-8458-11e9-a6a6-966a0a06784e'),
('event_b3f86194-8461-11e9-a6a6-966a0a06784e', '1559389077.7607000', 'event', 'CHARGE_UPDATED', 'char_b3f86195-8461-11e9-a6a6-966a0a06784e', 'log_b3f86196-8461-11e9-a6a6-966a0a06784e'),
('event_b4800df8-836c-11e9-a6a6-966a0a06784e', '1559283851.9536600', 'event', 'CUSTOMER_CREATED', 'char_b4800df9-836c-11e9-a6a6-966a0a06784e', 'log_b4800dfa-836c-11e9-a6a6-966a0a06784e'),
('event_b6706072-843c-11e9-a6a6-966a0a06784e', '1559373190.5235500', 'event', 'CROSS_SALE_OFFER_UPDATED', 'char_b6706073-843c-11e9-a6a6-966a0a06784e', 'log_b6706074-843c-11e9-a6a6-966a0a06784e'),
('event_b6f09d89-605f-11e9-bcdd-966a0a06784e', '1555429981.8911400', 'event', 'CUSTOMER_CARD_CREATED', 'char_b6f09d8a-605f-11e9-bcdd-966a0a06784e', 'log_b6f09d8b-605f-11e9-bcdd-966a0a06784e'),
('event_b6f09d8d-605f-11e9-bcdd-966a0a06784e', '1555429981.9066600', 'event', 'CHARGE_SUCCEEDED', 'char_b6f09d8e-605f-11e9-bcdd-966a0a06784e', 'log_b6f09d8f-605f-11e9-bcdd-966a0a06784e'),
('event_b7a8363a-85e1-11e9-a6a6-966a0a06784e', '1559554010.6904300', 'event', 'CHARGE_UPDATED', 'char_b7a8363b-85e1-11e9-a6a6-966a0a06784e', 'log_b7a8363c-85e1-11e9-a6a6-966a0a06784e'),
('event_b8f36661-7aea-11e9-a6a6-966a0a06784e', '1558348415.5432200', 'event', 'CUSTOMER_CARD_CREATED', 'char_b8f36662-7aea-11e9-a6a6-966a0a06784e', 'log_b8f36663-7aea-11e9-a6a6-966a0a06784e'),
('event_b9778717-7981-11e9-a6a6-966a0a06784e', '1558193368.0920700', 'event', 'CROSS_SALE_OFFER_CREATED', 'char_b9778718-7981-11e9-a6a6-966a0a06784e', 'log_b9778719-7981-11e9-a6a6-966a0a06784e'),
('event_b9f4046b-7aeb-11e9-a6a6-966a0a06784e', '1558348846.7260500', 'event', 'CUSTOMER_SUBSCRIPTION_CREATED', 'char_b9f4046c-7aeb-11e9-a6a6-966a0a06784e', 'log_b9f4046d-7aeb-11e9-a6a6-966a0a06784e'),
('event_b9ff7110-836c-11e9-a6a6-966a0a06784e', '1559283861.1782800', 'event', 'CUSTOMER_CREATED', 'char_b9ff7111-836c-11e9-a6a6-966a0a06784e', 'log_b9ff7112-836c-11e9-a6a6-966a0a06784e'),
('event_bba3dace-8473-11e9-a6a6-966a0a06784e', '1559396821.5696100', 'event', 'CROSS_SALE_OFFER_DELETED', 'char_bba3dacf-8473-11e9-a6a6-966a0a06784e', 'log_bba3dad0-8473-11e9-a6a6-966a0a06784e'),
('event_bc5f2577-846a-11e9-a6a6-966a0a06784e', '1559392957.3306300', 'event', 'PLAN_CREATED', 'char_bc5f2578-846a-11e9-a6a6-966a0a06784e', 'log_bc5f2579-846a-11e9-a6a6-966a0a06784e'),
('event_bd0495e4-82da-11e9-a6a6-966a0a06784e', '1559221159.7220500', 'event', 'CUSTOMER_CREATED', 'char_bd0495e5-82da-11e9-a6a6-966a0a06784e', 'log_bd0495e6-82da-11e9-a6a6-966a0a06784e'),
('event_bde0827e-836c-11e9-a6a6-966a0a06784e', '1559283867.6848200', 'event', 'CUSTOMER_CREATED', 'char_bde0827f-836c-11e9-a6a6-966a0a06784e', 'log_bde08280-836c-11e9-a6a6-966a0a06784e'),
('event_bde1e58c-85e1-11e9-a6a6-966a0a06784e', '1559554021.1346900', 'event', 'CUSTOMER_UPDATED', 'char_bde1e58d-85e1-11e9-a6a6-966a0a06784e', 'log_bde1e58e-85e1-11e9-a6a6-966a0a06784e'),
('event_bed3866c-845b-11e9-a6a6-966a0a06784e', '1559386518.9936400', 'event', 'CROSS_SALE_OFFER_DELETED', 'char_bed3866d-845b-11e9-a6a6-966a0a06784e', 'log_bed3866e-845b-11e9-a6a6-966a0a06784e'),
('event_bf05ab6c-85cd-11e9-a6a6-966a0a06784e', '1559545433.1145400', 'event', 'CUSTOMER_CREATED', 'char_bf05ab6d-85cd-11e9-a6a6-966a0a06784e', 'log_bf05ab6e-85cd-11e9-a6a6-966a0a06784e'),
('event_c06b74d0-85c3-11e9-a6a6-966a0a06784e', '1559541140.4897500', 'event', 'CUSTOMER_DELETED', 'char_c06b74d1-85c3-11e9-a6a6-966a0a06784e', 'log_c06b74d2-85c3-11e9-a6a6-966a0a06784e'),
('event_c11d22b2-8457-11e9-a6a6-966a0a06784e', '1559384804.8522700', 'event', 'CHARGE_SUCCEEDED', 'char_c11d22b3-8457-11e9-a6a6-966a0a06784e', 'log_c11d22b4-8457-11e9-a6a6-966a0a06784e'),
('event_c25ae470-8473-11e9-a6a6-966a0a06784e', '1559396832.8355500', 'event', 'CROSS_SALE_OFFER_DELETED', 'char_c25ae471-8473-11e9-a6a6-966a0a06784e', 'log_c25ae472-8473-11e9-a6a6-966a0a06784e');
INSERT INTO `event` (`event_id`, `created`, `objectType`, `type`, `data`, `log`) VALUES
('event_c3c38c08-85e1-11e9-a6a6-966a0a06784e', '1559554031.0021800', 'event', 'CHARGE_UPDATED', 'char_c3c38c09-85e1-11e9-a6a6-966a0a06784e', 'log_c3c38c0a-85e1-11e9-a6a6-966a0a06784e'),
('event_c4d23542-5f99-11e9-bcdd-966a0a06784e', '1555344964.8286500', 'event', 'CUSTOMER_CREATED', 'char_c4d23543-5f99-11e9-bcdd-966a0a06784e', 'log_c4d23544-5f99-11e9-bcdd-966a0a06784e'),
('event_c4d23546-5f99-11e9-bcdd-966a0a06784e', '1555344964.8415300', 'event', 'CUSTOMER_CARD_CREATED', 'char_c4d23547-5f99-11e9-bcdd-966a0a06784e', 'log_c4d23548-5f99-11e9-bcdd-966a0a06784e'),
('event_c5f4b8fc-85c4-11e9-a6a6-966a0a06784e', '1559541579.2746400', 'event', 'CUSTOMER_DELETED', 'char_c5f4b8fd-85c4-11e9-a6a6-966a0a06784e', 'log_c5f4b8fe-85c4-11e9-a6a6-966a0a06784e'),
('event_c723c2b1-839c-11e9-a6a6-966a0a06784e', '1559304499.0719300', 'event', 'CROSS_SALE_OFFER_CREATED', 'char_c723c2b2-839c-11e9-a6a6-966a0a06784e', 'log_c723c2b3-839c-11e9-a6a6-966a0a06784e'),
('event_c7cb775e-8477-11e9-a6a6-966a0a06784e', '1559398559.9488200', 'event', 'CUSTOMER_DELETED', 'char_c7cb775f-8477-11e9-a6a6-966a0a06784e', 'log_c7cb7760-8477-11e9-a6a6-966a0a06784e'),
('event_c8316ff0-5f8f-11e9-bcdd-966a0a06784e', '1555340675.5185000', 'event', 'CUSTOMER_CREATED', 'char_c8316ff1-5f8f-11e9-bcdd-966a0a06784e', 'log_c8316ff2-5f8f-11e9-bcdd-966a0a06784e'),
('event_c843993b-8479-11e9-a6a6-966a0a06784e', '1559399419.7336200', 'event', 'CROSS_SALE_OFFER_CREATED', 'char_c843993c-8479-11e9-a6a6-966a0a06784e', 'log_c843993d-8479-11e9-a6a6-966a0a06784e'),
('event_c8be2c18-85cf-11e9-a6a6-966a0a06784e', '1559546308.4163100', 'event', 'CUSTOMER_CREATED', 'char_c8be2c19-85cf-11e9-a6a6-966a0a06784e', 'log_c8be2c1a-85cf-11e9-a6a6-966a0a06784e'),
('event_c9ca38cc-603b-11e9-bcdd-966a0a06784e', '1555414551.6346800', 'event', 'CUSTOMER_CREATED', 'char_c9ca38cd-603b-11e9-bcdd-966a0a06784e', 'log_c9ca38ce-603b-11e9-bcdd-966a0a06784e'),
('event_cbc8c6b6-85be-11e9-a6a6-966a0a06784e', '1559539012.0726700', 'event', 'CUSTOMER_DELETED', 'char_cbc8c6b7-85be-11e9-a6a6-966a0a06784e', 'log_cbc8c6b8-85be-11e9-a6a6-966a0a06784e'),
('event_ccbf44aa-83a7-11e9-a6a6-966a0a06784e', '1559309232.9377300', 'event', 'PLAN_DELETED', 'char_ccbf44ab-83a7-11e9-a6a6-966a0a06784e', 'log_ccbf44ac-83a7-11e9-a6a6-966a0a06784e'),
('event_cdb3f67a-838f-11e9-a6a6-966a0a06784e', '1559298926.6199200', 'event', 'CUSTOMER_CARD_UPDATE', 'char_cdb3f67b-838f-11e9-a6a6-966a0a06784e', 'log_cdb3f67c-838f-11e9-a6a6-966a0a06784e'),
('event_cdf4cd5e-8479-11e9-a6a6-966a0a06784e', '1559399429.2795800', 'event', 'CUSTOMER_DELETED', 'char_cdf4cd5f-8479-11e9-a6a6-966a0a06784e', 'log_cdf4cd60-8479-11e9-a6a6-966a0a06784e'),
('event_cf65396a-6038-11e9-bcdd-966a0a06784e', '1555413272.5496400', 'event', 'CUSTOMER_CREATED', 'char_cf65396b-6038-11e9-bcdd-966a0a06784e', 'log_cf65396c-6038-11e9-bcdd-966a0a06784e'),
('event_cf65396e-6038-11e9-bcdd-966a0a06784e', '1555413272.5623100', 'event', 'CUSTOMER_CARD_CREATED', 'char_cf65396f-6038-11e9-bcdd-966a0a06784e', 'log_cf653970-6038-11e9-bcdd-966a0a06784e'),
('event_d119c624-8479-11e9-a6a6-966a0a06784e', '1559399434.5551400', 'event', 'CROSS_SALE_OFFER_DELETED', 'char_d119c625-8479-11e9-a6a6-966a0a06784e', 'log_d119c626-8479-11e9-a6a6-966a0a06784e'),
('event_d3639deb-797c-11e9-a6a6-966a0a06784e', '1558191264.1024600', 'event', 'CUSTOMER_SUBSCRIPTION_CREATED', 'char_d3639dec-797c-11e9-a6a6-966a0a06784e', 'log_d3639ded-797c-11e9-a6a6-966a0a06784e'),
('event_d4076806-8464-11e9-a6a6-966a0a06784e', '1559390420.0364500', 'event', 'CHARGE_REFUNDED', 'char_d4076807-8464-11e9-a6a6-966a0a06784e', 'log_d4076808-8464-11e9-a6a6-966a0a06784e'),
('event_d43ac982-85e5-11e9-a6a6-966a0a06784e', '1559555776.6195400', 'event', 'CHARGE_SUCCEEDED', 'char_d43ac983-85e5-11e9-a6a6-966a0a06784e', 'log_d43ac984-85e5-11e9-a6a6-966a0a06784e'),
('event_d49bed2a-85e8-11e9-a6a6-966a0a06784e', '1559557065.7408800', 'event', 'CHARGE_REFUNDED', 'char_d49bed2b-85e8-11e9-a6a6-966a0a06784e', 'log_d49bed2c-85e8-11e9-a6a6-966a0a06784e'),
('event_d54f49f1-839b-11e9-a6a6-966a0a06784e', '1559304093.3480700', 'event', 'CROSS_SALE_OFFER_CREATED', 'char_d54f49f2-839b-11e9-a6a6-966a0a06784e', 'log_d54f49f3-839b-11e9-a6a6-966a0a06784e'),
('event_d6628261-8604-11e9-a6a6-966a0a06784e', '1559569094.6341500', 'event', 'CHARGE_SUCCEEDED', 'char_d6628262-8604-11e9-a6a6-966a0a06784e', 'log_d6628263-8604-11e9-a6a6-966a0a06784e'),
('event_d6ae1507-8463-11e9-a6a6-966a0a06784e', '1559389994.9916100', 'event', 'CROSS_SALE_OFFER_CREATED', 'char_d6ae1508-8463-11e9-a6a6-966a0a06784e', 'log_d6ae1509-8463-11e9-a6a6-966a0a06784e'),
('event_d7c51db6-85e1-11e9-a6a6-966a0a06784e', '1559554064.5669500', 'event', 'CUSTOMER_UPDATED', 'char_d7c51db7-85e1-11e9-a6a6-966a0a06784e', 'log_d7c51db8-85e1-11e9-a6a6-966a0a06784e'),
('event_d9aaa266-82b9-11e9-a6a6-966a0a06784e', '1559207034.3913800', 'event', 'CUSTOMER_UPDATED', 'char_d9aaa267-82b9-11e9-a6a6-966a0a06784e', 'log_d9aaa268-82b9-11e9-a6a6-966a0a06784e'),
('event_da35495f-8604-11e9-a6a6-966a0a06784e', '1559569101.0473900', 'event', 'CHARGE_SUCCEEDED', 'char_da354960-8604-11e9-a6a6-966a0a06784e', 'log_da354961-8604-11e9-a6a6-966a0a06784e'),
('event_db84658d-6058-11e9-bcdd-966a0a06784e', '1555427036.7810000', 'event', 'CUSTOMER_CARD_CREATED', 'char_db84658e-6058-11e9-bcdd-966a0a06784e', 'log_db84658f-6058-11e9-bcdd-966a0a06784e'),
('event_db846591-6058-11e9-bcdd-966a0a06784e', '1555427036.7969900', 'event', 'CHARGE_SUCCEEDED', 'char_db846592-6058-11e9-bcdd-966a0a06784e', 'log_db846593-6058-11e9-bcdd-966a0a06784e'),
('event_de1bc0d5-846a-11e9-a6a6-966a0a06784e', '1559393013.9327400', 'event', 'PLAN_CREATED', 'char_de1bc0d6-846a-11e9-a6a6-966a0a06784e', 'log_de1bc0d7-846a-11e9-a6a6-966a0a06784e'),
('event_deb0c207-5f94-11e9-bcdd-966a0a06784e', '1555342860.7459600', 'event', 'CUSTOMER_CARD_CREATED', 'char_deb0c208-5f94-11e9-bcdd-966a0a06784e', 'log_deb0c209-5f94-11e9-bcdd-966a0a06784e'),
('event_df76d9f6-85bd-11e9-a6a6-966a0a06784e', '1559538615.5935200', 'event', 'CUSTOMER_DELETED', 'char_df76d9f7-85bd-11e9-a6a6-966a0a06784e', 'log_df76d9f8-85bd-11e9-a6a6-966a0a06784e'),
('event_dfc13c2a-85c3-11e9-a6a6-966a0a06784e', '1559541193.0612900', 'event', 'CUSTOMER_DELETED', 'char_dfc13c2b-85c3-11e9-a6a6-966a0a06784e', 'log_dfc13c2c-85c3-11e9-a6a6-966a0a06784e'),
('event_dfc9530e-82b9-11e9-a6a6-966a0a06784e', '1559207044.6586600', 'event', 'CUSTOMER_UPDATED', 'char_dfc9530f-82b9-11e9-a6a6-966a0a06784e', 'log_dfc95310-82b9-11e9-a6a6-966a0a06784e'),
('event_e0b953f2-82a9-11e9-a6a6-966a0a06784e', '1559200174.2928400', 'event', 'CHARGE_SUCCEEDED', 'char_e0b953f3-82a9-11e9-a6a6-966a0a06784e', 'log_e0b953f4-82a9-11e9-a6a6-966a0a06784e'),
('event_e13fc859-5f91-11e9-bcdd-966a0a06784e', '1555341576.5493600', 'event', 'CUSTOMER_CARD_CREATED', 'char_e13fc85a-5f91-11e9-bcdd-966a0a06784e', 'log_e13fc85b-5f91-11e9-bcdd-966a0a06784e'),
('event_e1889c11-797a-11e9-a6a6-966a0a06784e', '1558190428.8334100', 'event', 'CUSTOMER_CARD_CREATED', 'char_e1889c12-797a-11e9-a6a6-966a0a06784e', 'log_e1889c13-797a-11e9-a6a6-966a0a06784e'),
('event_e25c1ecc-601e-11e9-bcdd-966a0a06784e', '1555402137.4506200', 'event', 'CUSTOMER_CREATED', 'char_e25c1ecd-601e-11e9-bcdd-966a0a06784e', 'log_e25c1ece-601e-11e9-bcdd-966a0a06784e'),
('event_e25c1ed0-601e-11e9-bcdd-966a0a06784e', '1555402137.4668300', 'event', 'CUSTOMER_CARD_CREATED', 'char_e25c1ed1-601e-11e9-bcdd-966a0a06784e', 'log_e25c1ed2-601e-11e9-bcdd-966a0a06784e'),
('event_e2723d14-8476-11e9-a6a6-966a0a06784e', '1559398175.1657700', 'event', 'PLAN_DELETED', 'char_e2723d15-8476-11e9-a6a6-966a0a06784e', 'log_e2723d16-8476-11e9-a6a6-966a0a06784e'),
('event_e2b2442d-85e8-11e9-a6a6-966a0a06784e', '1559557089.3791500', 'event', 'PLAN_CREATED', 'char_e2b2442e-85e8-11e9-a6a6-966a0a06784e', 'log_e2b2442f-85e8-11e9-a6a6-966a0a06784e'),
('event_e429ae05-85ec-11e9-a6a6-966a0a06784e', '1559558809.8272200', 'event', 'CROSS_SALE_OFFER_CREATED', 'char_e429ae06-85ec-11e9-a6a6-966a0a06784e', 'log_e429ae07-85ec-11e9-a6a6-966a0a06784e'),
('event_e5a9b692-82d9-11e9-a6a6-966a0a06784e', '1559220798.4162800', 'event', 'CUSTOMER_CREATED', 'char_e5a9b693-82d9-11e9-a6a6-966a0a06784e', 'log_e5a9b694-82d9-11e9-a6a6-966a0a06784e'),
('event_e63015ec-85bc-11e9-a6a6-966a0a06784e', '1559538197.3769500', 'event', 'CUSTOMER_DELETED', 'char_e63015ed-85bc-11e9-a6a6-966a0a06784e', 'log_e63015ee-85bc-11e9-a6a6-966a0a06784e'),
('event_e654f3e2-8370-11e9-a6a6-966a0a06784e', '1559285653.5416400', 'event', 'CUSTOMER_DELETED', 'char_e654f3e3-8370-11e9-a6a6-966a0a06784e', 'log_e654f3e4-8370-11e9-a6a6-966a0a06784e'),
('event_e6a58842-8434-11e9-a6a6-966a0a06784e', '1559369835.4287500', 'event', 'CUSTOMER_SUBSCRIPTION_DELETED', 'char_e6a58843-8434-11e9-a6a6-966a0a06784e', 'log_e6a58844-8434-11e9-a6a6-966a0a06784e'),
('event_e6c10a4a-85c6-11e9-a6a6-966a0a06784e', '1559542493.2965100', 'event', 'CUSTOMER_CREATED', 'char_e6c10a4b-85c6-11e9-a6a6-966a0a06784e', 'log_e6c10a4c-85c6-11e9-a6a6-966a0a06784e'),
('event_e6e4045e-82b9-11e9-a6a6-966a0a06784e', '1559207056.5776500', 'event', 'CUSTOMER_UPDATED', 'char_e6e4045f-82b9-11e9-a6a6-966a0a06784e', 'log_e6e40460-82b9-11e9-a6a6-966a0a06784e'),
('event_e6f48315-846d-11e9-a6a6-966a0a06784e', '1559394317.2674200', 'event', 'CROSS_SALE_OFFER_CREATED', 'char_e6f48316-846d-11e9-a6a6-966a0a06784e', 'log_e6f48317-846d-11e9-a6a6-966a0a06784e'),
('event_e739b607-85e3-11e9-a6a6-966a0a06784e', '1559554949.4931300', 'event', 'CUSTOMER_CARD_CREATED', 'char_e739b608-85e3-11e9-a6a6-966a0a06784e', 'log_e739b609-85e3-11e9-a6a6-966a0a06784e'),
('event_e8245956-85e6-11e9-a6a6-966a0a06784e', '1559556239.5181100', 'event', 'CUSTOMER_DELETED', 'char_e8245957-85e6-11e9-a6a6-966a0a06784e', 'log_e8245958-85e6-11e9-a6a6-966a0a06784e'),
('event_e83d5e62-85cd-11e9-a6a6-966a0a06784e', '1559545502.2659900', 'event', 'CUSTOMER_CREATED', 'char_e83d5e63-85cd-11e9-a6a6-966a0a06784e', 'log_e83d5e64-85cd-11e9-a6a6-966a0a06784e'),
('event_e83d9a1d-8684-11e9-a6a6-966a0a06784e', '1559624100.1692400', 'event', 'CUSTOMER_CARD_CREATED', 'char_e83d9a1e-8684-11e9-a6a6-966a0a06784e', 'log_e83d9a1f-8684-11e9-a6a6-966a0a06784e'),
('event_ebdef570-85c9-11e9-a6a6-966a0a06784e', '1559543790.3710600', 'event', 'CUSTOMER_CREATED', 'char_ebdef571-85c9-11e9-a6a6-966a0a06784e', 'log_ebdef572-85c9-11e9-a6a6-966a0a06784e'),
('event_ebeacde2-846a-11e9-a6a6-966a0a06784e', '1559393037.0976200', 'event', 'CUSTOMER_CREATED', 'char_ebeacde3-846a-11e9-a6a6-966a0a06784e', 'log_ebeacde4-846a-11e9-a6a6-966a0a06784e'),
('event_ebeacde6-846a-11e9-a6a6-966a0a06784e', '1559393037.2220000', 'event', 'PLAN_CREATED', 'char_ebeacde7-846a-11e9-a6a6-966a0a06784e', 'log_ebeacde8-846a-11e9-a6a6-966a0a06784e'),
('event_ec212f3e-8214-11e9-a6a6-966a0a06784e', '1559136198.4159800', 'event', 'CHARGE_SUCCEEDED', 'char_ec212f3f-8214-11e9-a6a6-966a0a06784e', 'log_ec212f40-8214-11e9-a6a6-966a0a06784e'),
('event_ec7a9178-85cf-11e9-a6a6-966a0a06784e', '1559546368.3716700', 'event', 'CUSTOMER_CREATED', 'char_ec7a9179-85cf-11e9-a6a6-966a0a06784e', 'log_ec7a917a-85cf-11e9-a6a6-966a0a06784e'),
('event_ece2416f-8399-11e9-a6a6-966a0a06784e', '1559303273.9042500', 'event', 'CHARGE_SUCCEEDED', 'char_ece24170-8399-11e9-a6a6-966a0a06784e', 'log_ece24171-8399-11e9-a6a6-966a0a06784e'),
('event_ee4fdfa4-8457-11e9-a6a6-966a0a06784e', '1559384880.6821300', 'event', 'CHARGE_SUCCEEDED', 'char_ee4fdfa5-8457-11e9-a6a6-966a0a06784e', 'log_ee4fdfa6-8457-11e9-a6a6-966a0a06784e'),
('event_ee82a563-605e-11e9-bcdd-966a0a06784e', '1555429645.6268900', 'event', 'CUSTOMER_CARD_CREATED', 'char_ee82a564-605e-11e9-bcdd-966a0a06784e', 'log_ee82a565-605e-11e9-bcdd-966a0a06784e'),
('event_ee82a567-605e-11e9-bcdd-966a0a06784e', '1555429645.6550900', 'event', 'CHARGE_SUCCEEDED', 'char_ee82a568-605e-11e9-bcdd-966a0a06784e', 'log_ee82a569-605e-11e9-bcdd-966a0a06784e'),
('event_f000e583-85e0-11e9-a6a6-966a0a06784e', '1559553675.7298800', 'event', 'CUSTOMER_CARD_CREATED', 'char_f000e584-85e0-11e9-a6a6-966a0a06784e', 'log_f000e585-85e0-11e9-a6a6-966a0a06784e'),
('event_f01f6a18-603d-11e9-bcdd-966a0a06784e', '1555415474.9396700', 'event', 'CUSTOMER_CREATED', 'char_f01f6a19-603d-11e9-bcdd-966a0a06784e', 'log_f01f6a1a-603d-11e9-bcdd-966a0a06784e'),
('event_f01f6a1c-603d-11e9-bcdd-966a0a06784e', '1555415474.9537400', 'event', 'CUSTOMER_CARD_CREATED', 'char_f01f6a1d-603d-11e9-bcdd-966a0a06784e', 'log_f01f6a1e-603d-11e9-bcdd-966a0a06784e'),
('event_f1a0445f-7ad3-11e9-a6a6-966a0a06784e', '1558338632.2058300', 'event', 'CROSS_SALE_OFFER_CREATED', 'char_f1a04460-7ad3-11e9-a6a6-966a0a06784e', 'log_f1a04461-7ad3-11e9-a6a6-966a0a06784e'),
('event_f1e0f1be-8476-11e9-a6a6-966a0a06784e', '1559398201.0571600', 'event', 'CUSTOMER_DELETED', 'char_f1e0f1bf-8476-11e9-a6a6-966a0a06784e', 'log_f1e0f1c0-8476-11e9-a6a6-966a0a06784e'),
('event_f23ecb22-85c5-11e9-a6a6-966a0a06784e', '1559542083.0765500', 'event', 'CUSTOMER_DELETED', 'char_f23ecb23-85c5-11e9-a6a6-966a0a06784e', 'log_f23ecb24-85c5-11e9-a6a6-966a0a06784e'),
('event_f29b9304-8460-11e9-a6a6-966a0a06784e', '1559388753.3522300', 'event', 'CHARGE_UPDATED', 'char_f29b9305-8460-11e9-a6a6-966a0a06784e', 'log_f29b9306-8460-11e9-a6a6-966a0a06784e'),
('event_f3d63041-5f93-11e9-bcdd-966a0a06784e', '1555342466.7265400', 'event', 'CUSTOMER_CARD_CREATED', 'char_f3d63042-5f93-11e9-bcdd-966a0a06784e', 'log_f3d63043-5f93-11e9-bcdd-966a0a06784e'),
('event_f6732bb9-846a-11e9-a6a6-966a0a06784e', '1559393054.7697900', 'event', 'PLAN_CREATED', 'char_f6732bba-846a-11e9-a6a6-966a0a06784e', 'log_f6732bbb-846a-11e9-a6a6-966a0a06784e'),
('event_f68aad92-8460-11e9-a6a6-966a0a06784e', '1559388759.9522800', 'event', 'CHARGE_UPDATED', 'char_f68aad93-8460-11e9-a6a6-966a0a06784e', 'log_f68aad94-8460-11e9-a6a6-966a0a06784e'),
('event_f752917a-8476-11e9-a6a6-966a0a06784e', '1559398210.1903600', 'event', 'CUSTOMER_DELETED', 'char_f752917b-8476-11e9-a6a6-966a0a06784e', 'log_f752917c-8476-11e9-a6a6-966a0a06784e'),
('event_f7b64110-8465-11e9-a6a6-966a0a06784e', '1559390909.4019800', 'event', 'CUSTOMER_CREATED', 'char_f7b64111-8465-11e9-a6a6-966a0a06784e', 'log_f7b64112-8465-11e9-a6a6-966a0a06784e'),
('event_f7d12c31-797a-11e9-a6a6-966a0a06784e', '1558190466.2193000', 'event', 'CUSTOMER_CARD_CREATED', 'char_f7d12c32-797a-11e9-a6a6-966a0a06784e', 'log_f7d12c33-797a-11e9-a6a6-966a0a06784e'),
('event_f7f7d44e-5f9a-11e9-bcdd-966a0a06784e', '1555345480.1349500', 'event', 'CUSTOMER_CREATED', 'char_f7f7d44f-5f9a-11e9-bcdd-966a0a06784e', 'log_f7f7d450-5f9a-11e9-bcdd-966a0a06784e'),
('event_f7f7d452-5f9a-11e9-bcdd-966a0a06784e', '1555345480.1522400', 'event', 'CUSTOMER_CARD_CREATED', 'char_f7f7d453-5f9a-11e9-bcdd-966a0a06784e', 'log_f7f7d454-5f9a-11e9-bcdd-966a0a06784e'),
('event_f8625a48-8214-11e9-a6a6-966a0a06784e', '1559136218.9719100', 'event', 'CHARGE_SUCCEEDED', 'char_f8625a49-8214-11e9-a6a6-966a0a06784e', 'log_f8625a4a-8214-11e9-a6a6-966a0a06784e'),
('event_f8f19b71-7aee-11e9-a6a6-966a0a06784e', '1558350240.8936300', 'event', 'CUSTOMER_CARD_CREATED', 'char_f8f19b72-7aee-11e9-a6a6-966a0a06784e', 'log_f8f19b73-7aee-11e9-a6a6-966a0a06784e'),
('event_f9c674ba-8473-11e9-a6a6-966a0a06784e', '1559396925.8151300', 'event', 'CROSS_SALE_OFFER_DELETED', 'char_f9c674bb-8473-11e9-a6a6-966a0a06784e', 'log_f9c674bc-8473-11e9-a6a6-966a0a06784e'),
('event_f9eaab7c-845b-11e9-a6a6-966a0a06784e', '1559386618.1309100', 'event', 'CROSS_SALE_OFFER_DELETED', 'char_f9eaab7d-845b-11e9-a6a6-966a0a06784e', 'log_f9eaab7e-845b-11e9-a6a6-966a0a06784e'),
('event_fbdff998-85c8-11e9-a6a6-966a0a06784e', '1559543387.7246100', 'event', 'CUSTOMER_CREATED', 'char_fbdff999-85c8-11e9-a6a6-966a0a06784e', 'log_fbdff99a-85c8-11e9-a6a6-966a0a06784e'),
('event_fc2ddb0c-83a7-11e9-a6a6-966a0a06784e', '1559309312.5153300', 'event', 'PLAN_UPDATED', 'char_fc2ddb0d-83a7-11e9-a6a6-966a0a06784e', 'log_fc2ddb0e-83a7-11e9-a6a6-966a0a06784e'),
('event_fc6d8100-8465-11e9-a6a6-966a0a06784e', '1559390917.3128500', 'event', 'CUSTOMER_CREATED', 'char_fc6d8101-8465-11e9-a6a6-966a0a06784e', 'log_fc6d8102-8465-11e9-a6a6-966a0a06784e'),
('event_fcca4ba0-8473-11e9-a6a6-966a0a06784e', '1559396930.8734600', 'event', 'CROSS_SALE_OFFER_DELETED', 'char_fcca4ba1-8473-11e9-a6a6-966a0a06784e', 'log_fcca4ba2-8473-11e9-a6a6-966a0a06784e'),
('event_fd08a226-85d6-11e9-a6a6-966a0a06784e', '1559549402.6298400', 'event', 'CHARGE_SUCCEEDED', 'char_fd08a227-85d6-11e9-a6a6-966a0a06784e', 'log_fd08a228-85d6-11e9-a6a6-966a0a06784e'),
('event_ff8123e1-846a-11e9-a6a6-966a0a06784e', '1559393069.9609500', 'event', 'PLAN_CREATED', 'char_ff8123e2-846a-11e9-a6a6-966a0a06784e', 'log_ff8123e3-846a-11e9-a6a6-966a0a06784e'),
('event_ffd74470-85e1-11e9-a6a6-966a0a06784e', '1559554131.7955700', 'event', 'CUSTOMER_CREATED', 'char_ffd74471-85e1-11e9-a6a6-966a0a06784e', 'log_ffd74472-85e1-11e9-a6a6-966a0a06784e');

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE `log` (
  `log` varchar(255) DEFAULT NULL,
  `created` decimal(18,7) DEFAULT NULL,
  `method` varchar(20) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `status` int(3) DEFAULT NULL,
  `ip_address` varchar(20) DEFAULT NULL,
  `source` varchar(20) DEFAULT NULL,
  `request_body` mediumtext,
  `response_body` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `log`
--

INSERT INTO `log` (`log`, `created`, `method`, `url`, `status`, `ip_address`, `source`, `request_body`, `response_body`) VALUES
('log_bd0495e6-82da-11e9-a6a6-966a0a06784e', '1559221159.7220500', 'Post', '/api/v1/customer/create', 200, 'None', 'None', '{\'email\': \'agmayank007@gmail.com\', \'description\': \'asdasdd\', \'card\': 0, \'metadata\': 0}', '{\'id\': \'bd0495e3-82da-11e9-a6a6-966a0a06784e\', \'created\': 1559221159.7189748, \'objectType\': \'customer\', \'email\': \'agmayank007@gmail.com\', \'description\': \'asdasdd\', \'defaultCardId\': 0, \'metadata\': 0}'),
('log_aadab7ca-8379-11e9-a6a6-966a0a06784e', '1559289419.2285400', 'post', '/api/v1/customer/create', 200, 'None', 'None', '{\'email\': \'troy@gmail.com\', \'description\': 0, \'card\': 0, \'metadata\': 0}', '{\'id\': \'aadab7c7-8379-11e9-a6a6-966a0a06784e\', \'created\': 1559289419.225606, \'objectType\': \'customer\', \'email\': \'troy@gmail.com\', \'description\': 0, \'defaultCardId\': 0, \'metadata\': 0}'),
('log_8416555a-837b-11e9-a6a6-966a0a06784e', '1559290213.1785500', 'delete', '/api/v1/customers/delete', 200, 'None', 'None', '{\'customer_id\': \'6ef0ef5b-8379-11e9-a6a6-966a0a06784e\'}', '{\'id\': \'6ef0ef5b-8379-11e9-a6a6-966a0a06784e\'}'),
('log_23b45bca-837c-11e9-a6a6-966a0a06784e', '1559290480.9720400', 'update', '/api/v1/customer/update', 200, 'None', 'None', '{\'customer_id\': \'b9ff710f-836c-11e9-a6a6-966a0a06784e\', \'email\': \'toy@gmail.com\', \'description\': 0, \'defaultCardId\': 0, \'metadata\': 0, \'card\': 0}', '{\'id\': \'b9ff710f-836c-11e9-a6a6-966a0a06784e\', \'created\': \'1559283861.1745207\', \'objectType\': \'customer\', \'email\': \'toy@gmail.com\', \'description\': \'0\', \'defaultCardId\': \'0\'}'),
('log_88d767cd-8386-11e9-a6a6-966a0a06784e', '1559294945.6225100', 'update', '/api/v1/card/create', 200, 'None', 'None', '{\'customerId\': \'012be8a1-8372-11e9-a6a6-966a0a06784e\', \'card\': {\'id\': \'card_88d767ca-8386-11e9-a6a6-966a0a06784e\', \'created\': 1559294945.6186955, \'objectType\': \'card\', \'first6\': \'424242\', \'last4\': \'4242\', \'fingerprint\': \'4e346ebf37e7af576825c872c9adfa1aa9acdd8374f96bf2b3594ed9\', \'expMonth\': \'11\', \'expYear\': \'22\', \'cardholderName\': 0, \'customerId\': \'012be8a1-8372-11e9-a6a6-966a0a06784e\', \'brand\': \'Visa\', \'type\': \'type\', \'country\': \'country\', \'addressLine1\': 0, \'addressLine2\': 0, \'addressCity\': 0, \'addressState\': 0, \'addressZip\': 0, \'addressCountry\': 0, \'ipAddress\': 0, \'email\': 0, \'userAgent\': 0, \'acceptLanguage\': 0}, \'number\': \'4242424242424242\', \'exp_month\': \'11\', \'exp_year\': \'22\', \'cvc\': \'321\', \'cardholdername\': 0, \'addressLine1\': 0, \'addressLine2\': 0, \'addressCity\': 0, \'addressState\': 0, \'addressZip\': 0, \'addressCountry\': 0, \'ipAddress\': 0, \'email\': 0, \'userAgent\': 0, \'acceptLanguage\': 0}', '{\'id\': \'card_88d767ca-8386-11e9-a6a6-966a0a06784e\', \'created\': \'1559294945.6186955\', \'objectType\': \'card\', \'first6\': \'424242\', \'last4\': \'4242\', \'fingerprint\': \'4e346ebf37e7af576825c872c9adfa1aa9acdd8374f96bf2b3594ed9\', \'expMonth\': \'11\', \'expYear\': \'22\', \'cardholderName\': 0, \'customerId\': \'012be8a1-8372-11e9-a6a6-966a0a06784e\', \'brand\': \'Visa\', \'type\': \'type\', \'country\': \'country\'}'),
('log_2f1f2328-838b-11e9-a6a6-966a0a06784e', '1559296942.5776500', 'delete', '/api/v1/card/delete', 200, 'None', 'None', '{\'customer_id\': \'c4d23541-5f99-11e9-bcdd-966a0a06784e\', \'card_id\': \'card_c4d23545-5f99-11e9-bcdd-966a0a06784e\'}', '{\'card_id\': \'card_c4d23545-5f99-11e9-bcdd-966a0a06784e\'}'),
('log_39e6bf14-8390-11e9-a6a6-966a0a06784e', '1559299108.1465900', 'update', '/api/v1/card/update', 200, 'None', 'None', '{\'customer_id\': \'c8316fef-5f8f-11e9-bcdd-966a0a06784e\', \'card_id\': \'card_8e106bae-5f93-11e9-bcdd-966a0a06784e\', \'expMonth\': 0, \'expYear\': 0, \'addressCountry\': 0, \'addressCity\': 0, \'addressLine1\': 0, \'addressLine2\': 0, \'addressZip\': 0}', '{\'id\': \'card_8e106bae-5f93-11e9-bcdd-966a0a06784e\', \'created\': \'1555342295.9783600\', \'objectType\': \'card\', \'first6\': 424242, \'last4\': 4245, \'fingerprint\': \'08ad630afe58235e08a5d52924c69e09ca55c9e9b53517e742808708\', \'expMonth\': 12, \'expYear\': 25, \'cardholderName\': \'dadada\', \'customerId\': \'c8316fef-5f8f-11e9-bcdd-966a0a06784e\', \'brand\': \'None\', \'type\': \'type\', \'country\': \'country\'}'),
('log_7cc60cef-839b-11e9-a6a6-966a0a06784e', '1559303944.8070700', 'charge create', '/api/v1/charge/create', 200, 'None', 'None', '{\'amount\': 64.0, \'currency\': \'INR\', \'description\': \'asdasdsa\', \'customerId\': 0, \'card\': 0, \'number\': 0, \'exp_month\': 0, \'exp_year\': 0, \'cvc\': 0, \'cardholdername\': 0, \'captured\': 0, \'refunded\': 0, \'disputed\': 0, \'sh_name\': 0, \'sh_address1\': 0, \'sh_address2\': 0, \'sh_zip\': 0, \'sh_city\': 0, \'sh_state\': 0, \'sh_country\': 0, \'bil_name\': 0, \'bil_address1\': 0, \'bil_address2\': 0, \'bil_city\': 0, \'bil_state\': 0, \'bil_country\': 0, \'vat\': 0, \'metadata\': 0}', '{\'id\': \'7cc60cec-839b-11e9-a6a6-966a0a06784e\', \'created\': 1559303944.8036404, \'objectType\': \'charge\', \'amount\': 64.0, \'currency\': \'INR\', \'description\': \'asdasdsa\', \'card\': {\'id\': \'null\', \'created\': \'0\', \'objectType\': \'null\', \'first6\': \'0\', \'last4\': \'0\', \'fingerprint\': \'null\', \'expMonth\': \'0\', \'expYear\': \'0\', \'cardholderName\': \'null\', \'customerId\': 0, \'brand\': \'null\', \'type\': \'null\', \'country\': \'null\'}, \'captured\': 0, \'refunded\': 0, \'disputed\': 0}'),
('log_14f344a7-83a5-11e9-a6a6-966a0a06784e', '1559308065.5910300', 'plan_create', '/api/v1/plan/create', 200, 'None', 'None', '{\'amount\': \'64\', \'currency\': \'INR\', \'interval\': \'day\', \'name\': \'arfwdfa\', \'intervalCount\': 1, \'billingCycles\': \'null\', \'trialPeriodDays\': 0, \'recursTo\': 0, \'metadata\': 0}', '{\'id\': \'plan_14f344a4-83a5-11e9-a6a6-966a0a06784e\', \'created\': \'1559308065.5842200\', \'objectType\': \'plan\', \'amount\': 64.0, \'currency\': \'INR\', \'interval\': \'day\', \'intervalCount\': 1, \'name\': \'arfwdfa\', \'trialPeriodDays\': 0}'),
('log_ccbf44ac-83a7-11e9-a6a6-966a0a06784e', '1559309232.9377300', 'plan_delete', '/api/v1/plan/delete', 200, 'None', 'None', '{\'plan_id\': \'plan_14f344a4-83a5-11e9-a6a6-966a0a06784e\'}', '{\'plan_id\': \'plan_14f344a4-83a5-11e9-a6a6-966a0a06784e\'}'),
('log_543e7800-8431-11e9-a6a6-966a0a06784e', '1559368301.3231100', 'subscription_create', '/api/v1/subscription/create', 200, 'None', 'None', '{\'customer_id\': \'c8316fef-5f8f-11e9-bcdd-966a0a06784e\', \'planId\': \'plan_15879ebe-7af0-11e9-a6a6-966a0a06784e\', \'card_id\': 0, \'quantity\': \'54\', \'captureCharges\': 0, \'trialEnd\': 0, \'sh_name\': 0, \'sh_address1\': 0, \'sh_address2\': 0, \'sh_zip\': 0, \'sh_city\': 0, \'sh_state\': 0, \'sh_country\': 0, \'bil_name\': 0, \'bil_address1\': 0, \'bil_address2\': 0, \'bil_city\': 0, \'bil_state\': 0, \'bil_country\': 0, \'vat\': 0, \'metadata\': 0}', '{\'id\': \'sub_543e77fa-8431-11e9-a6a6-966a0a06784e\', \'created\': \'1559368301.3156200\', \'objectType\': \'subscription\', \'planId\': \'plan_15879ebe-7af0-11e9-a6a6-966a0a06784e\', \'customerId\': \'c8316fef-5f8f-11e9-bcdd-966a0a06784e\', \'quantity\': 54, \'status\': \'active\', \'start\': 1559368320.0, \'currentPeriodStart\': 1559368320.0, \'currentPeriodEnd\': 1559368320.0, \'cancelAtPeriodEnd\': 0}'),
('log_30e33329-8432-11e9-a6a6-966a0a06784e', '1559368671.5018700', 'subscription_create', '/api/v1/subscription/create', 200, 'None', 'None', '{\'customer_id\': \'c8316fef-5f8f-11e9-bcdd-966a0a06784e\', \'planId\': \'plan_15879ebe-7af0-11e9-a6a6-966a0a06784e\', \'card_id\': 0, \'quantity\': \'44\', \'captureCharges\': 0, \'trialEnd\': 0, \'sh_name\': 0, \'sh_address1\': 0, \'sh_address2\': 0, \'sh_zip\': 0, \'sh_city\': 0, \'sh_state\': 0, \'sh_country\': 0, \'bil_name\': 0, \'bil_address1\': 0, \'bil_address2\': 0, \'bil_city\': 0, \'bil_state\': 0, \'bil_country\': 0, \'vat\': 0, \'metadata\': 0}', '{\'id\': \'sub_30e33326-8432-11e9-a6a6-966a0a06784e\', \'created\': \'1559368671.4939900\', \'objectType\': \'subscription\', \'planId\': \'plan_15879ebe-7af0-11e9-a6a6-966a0a06784e\', \'customerId\': \'c8316fef-5f8f-11e9-bcdd-966a0a06784e\', \'quantity\': 44, \'status\': \'active\', \'start\': 1559368704.0, \'currentPeriodStart\': 1559368704.0, \'currentPeriodEnd\': 1559368704.0, \'cancelAtPeriodEnd\': 0}'),
('log_1a5f8e20-8433-11e9-a6a6-966a0a06784e', '1559369063.2181300', 'subscription_update', '/api/v1/subscription/update', 200, 'None', 'None', '{\'customer_id\': \'c8316fef-5f8f-11e9-bcdd-966a0a06784e\', \'subscriptionId\': \'sub_543e77fa-8431-11e9-a6a6-966a0a06784e\', \'planId\': \'plan_15879ebe-7af0-11e9-a6a6-966a0a06784e\', \'card_id\': 0, \'quantity\': 44, \'captureCharges\': 0, \'trialEnd\': 0, \'sh_name\': 0, \'sh_address1\': 0, \'sh_address2\': 0, \'sh_zip\': 0, \'sh_city\': 0, \'sh_state\': 0, \'sh_country\': 0, \'bil_name\': 0, \'bil_address1\': 0, \'bil_address2\': 0, \'bil_city\': 0, \'bil_state\': 0, \'bil_country\': 0, \'metadata\': 0}', '{\'id\': \'sub_543e77fa-8431-11e9-a6a6-966a0a06784e\', \'created\': \'1559368301.3156200\', \'objectType\': \'subscription\', \'planId\': \'plan_15879ebe-7af0-11e9-a6a6-966a0a06784e\', \'customerId\': \'c8316fef-5f8f-11e9-bcdd-966a0a06784e\', \'quantity\': 44, \'status\': \'active\', \'start\': 1559368320.0, \'currentPeriodStart\': 1559368320.0, \'currentPeriodEnd\': 1559368320.0, \'cancelAtPeriodEnd\': 0}'),
('log_e6a58844-8434-11e9-a6a6-966a0a06784e', '1559369835.4287500', 'subscription_delete', '/api/v1/subscription/delete', 200, 'None', 'None', '{\'customer_id\': \'c8316fef-5f8f-11e9-bcdd-966a0a06784e\', \'subscriptionId\': \'sub_543e77fa-8431-11e9-a6a6-966a0a06784e\', \'atPeriodEnd\': 0}', '{\'id\': \'sub_543e77fa-8431-11e9-a6a6-966a0a06784e\', \'created\': \'1559368301.3156200\', \'objectType\': \'subscription\', \'planId\': \'plan_15879ebe-7af0-11e9-a6a6-966a0a06784e\', \'customerId\': \'c8316fef-5f8f-11e9-bcdd-966a0a06784e\', \'quantity\': 44, \'status\': \'canceled\', \'start\': 1559368320.0, \'currentPeriodStart\': 1559368320.0, \'currentPeriodEnd\': 1559368320.0, \'canceledAt\': 0.0, \'endedAt\': 0.0, \'cancelAtPeriodEnd\': 0}'),
('log_45c8f162-8435-11e9-a6a6-966a0a06784e', '1559369995.0443400', 'plan_update', '/api/v1/plan/update', 200, 'None', 'None', '{\'plan_id\': \'plan_15879ebe-7af0-11e9-a6a6-966a0a06784e\', \'amount\': \'1234123\', \'currency\': 0, \'name\': 0, \'metadata\': 0}', '{\'id\': \'plan_15879ebe-7af0-11e9-a6a6-966a0a06784e\', \'created\': \'1558350718.3462000\', \'objectType\': \'plan\', \'amount\': 1234123.0, \'currency\': \'EUR\', \'interval\': \'hour\', \'intervalCount\': 1, \'name\': \'fwfwf\', \'trialPeriodDays\': 1}'),
('log_99842019-8437-11e9-a6a6-966a0a06784e', '1559370994.5223300', 'crosssale create', '/api/v1/crosssale/create', 200, 'None', 'None', '{\'amount\': \'12\', \'currency\': \'INR\', \'capture\': 0, \'planId\': 0, \'captureCharges\': 0, \'template\': \'qweqw\', \'title\': \'asdasd\', \'description\': 0, \'imageData\': 0, \'companyName\': \'qweqw\', \'companyLocation\': \'qweqwe\', \'termsAndConditionsUrl\': \'qweqw\', \'visibleForAllPartners\': 0, \'visibleForPartnerIds\': 0, \'metadata\': 0, \'partnerId\': 0}', '{\'id\': \'cso_99842016-8437-11e9-a6a6-966a0a06784e\', \'created\': \'1559370994.5152600\', \'objectType\': \'CrossSaleOffer\', \'charge\': {\'amount\': 12.0, \'currency\': \'INR\', \'capture\': 0}, \'template\': \'qweqw\', \'title\': \'asdasd\', \'description\': \'0\', \'imageUrl\': \'0\', \'companyName\': \'qweqw\', \'companyLocation\': \'qweqwe\', \'termsAndConditionsUrl\': \'qweqw\', \'visibleForAllPartners\': 0}'),
('log_4da664cb-8438-11e9-a6a6-966a0a06784e', '1559371296.7363900', 'crosssale create', '/api/v1/crosssale/create', 200, 'None', 'None', '{\'amount\': \'1223\', \'currency\': \'INR\', \'capture\': 0, \'planId\': \'plan_15879ebe-7af0-11e9-a6a6-966a0a06784e\', \'captureCharges\': 0, \'template\': \'qweqw\', \'title\': \'asdasd\', \'description\': 0, \'imageData\': 0, \'companyName\': \'qweqw\', \'companyLocation\': \'qweqwe\', \'termsAndConditionsUrl\': \'qweqw\', \'visibleForAllPartners\': 0, \'visibleForPartnerIds\': 0, \'metadata\': 0, \'partnerId\': 0}', '{\'id\': \'cso_4da664c8-8438-11e9-a6a6-966a0a06784e\', \'created\': \'1559371296.7297200\', \'objectType\': \'CrossSaleOffer\', \'charge\': {\'amount\': 1223.0, \'currency\': \'INR\', \'capture\': 0}, \'template\': \'qweqw\', \'title\': \'asdasd\', \'description\': \'0\', \'imageUrl\': \'0\', \'companyName\': \'qweqw\', \'companyLocation\': \'qweqwe\', \'termsAndConditionsUrl\': \'qweqw\', \'visibleForAllPartners\': 0}'),
('log_598f9357-8438-11e9-a6a6-966a0a06784e', '1559371316.7192800', 'crosssale create', '/api/v1/crosssale/create', 200, 'None', 'None', '{\'amount\': \'1223\', \'currency\': \'INR\', \'capture\': 0, \'planId\': \'plan_15879ebe-7af0-11e9-a6a6-966a0a06784e\', \'captureCharges\': 0, \'template\': \'qweqw\', \'title\': \'asdasd\', \'description\': 0, \'imageData\': 0, \'companyName\': \'qweqw\', \'companyLocation\': \'qweqwe\', \'termsAndConditionsUrl\': \'qweqw\', \'visibleForAllPartners\': 0, \'visibleForPartnerIds\': 0, \'metadata\': 0, \'partnerId\': 0}', '{\'id\': \'cso_598f9354-8438-11e9-a6a6-966a0a06784e\', \'created\': \'1559371316.7128300\', \'objectType\': \'CrossSaleOffer\', \'charge\': {\'amount\': 1223.0, \'currency\': \'INR\', \'capture\': 0}, \'template\': \'qweqw\', \'title\': \'asdasd\', \'description\': \'0\', \'imageUrl\': \'0\', \'companyName\': \'qweqw\', \'companyLocation\': \'qweqwe\', \'termsAndConditionsUrl\': \'qweqw\', \'visibleForAllPartners\': 0}'),
('log_60e841df-8438-11e9-a6a6-966a0a06784e', '1559371329.0422100', 'crosssale create', '/api/v1/crosssale/create', 200, 'None', 'None', '{\'amount\': \'1223\', \'currency\': \'INR\', \'capture\': 0, \'planId\': \'plan_15879ebe-7af0-11e9-a6a6-966a0a06784e\', \'captureCharges\': 0, \'template\': \'qweqw\', \'title\': \'asdasd\', \'description\': 0, \'imageData\': 0, \'companyName\': \'qweqw\', \'companyLocation\': \'qweqwe\', \'termsAndConditionsUrl\': \'qweqw\', \'visibleForAllPartners\': 0, \'visibleForPartnerIds\': 0, \'metadata\': 0, \'partnerId\': 0}', '{\'id\': \'cso_60e841dc-8438-11e9-a6a6-966a0a06784e\', \'created\': \'1559371329.0380700\', \'objectType\': \'CrossSaleOffer\', \'charge\': {\'amount\': 1223.0, \'currency\': \'INR\', \'capture\': 0}, \'template\': \'qweqw\', \'title\': \'asdasd\', \'description\': \'0\', \'imageUrl\': \'0\', \'companyName\': \'qweqw\', \'companyLocation\': \'qweqwe\', \'termsAndConditionsUrl\': \'qweqw\', \'visibleForAllPartners\': 0}'),
('log_73ebd1e3-8438-11e9-a6a6-966a0a06784e', '1559371360.9425500', 'crosssale create', '/api/v1/crosssale/create', 200, 'None', 'None', '{\'amount\': \'1223\', \'currency\': \'INR\', \'capture\': 0, \'planId\': \'plan_15879ebe-7af0-11e9-a6a6-966a0a06784e\', \'captureCharges\': 0, \'template\': \'qweqw\', \'title\': \'asdasd\', \'description\': 0, \'imageData\': 0, \'companyName\': \'qweqw\', \'companyLocation\': \'qweqwe\', \'termsAndConditionsUrl\': \'qweqw\', \'visibleForAllPartners\': 0, \'visibleForPartnerIds\': 0, \'metadata\': 0, \'partnerId\': 0}', '{\'id\': \'cso_73ebd1e0-8438-11e9-a6a6-966a0a06784e\', \'created\': \'1559371360.9381300\', \'objectType\': \'CrossSaleOffer\', \'charge\': {\'amount\': 1223.0, \'currency\': \'INR\', \'capture\': 0}, \'template\': \'qweqw\', \'title\': \'asdasd\', \'description\': \'0\', \'imageUrl\': \'0\', \'companyName\': \'qweqw\', \'companyLocation\': \'qweqwe\', \'termsAndConditionsUrl\': \'qweqw\', \'visibleForAllPartners\': 0}'),
('log_7c7a5b9a-843c-11e9-a6a6-966a0a06784e', '1559373093.2810700', 'crosssale_delete', '/api/v1/crosssale/delete', 200, 'None', 'None', '{\'crossSaleOfferId\': \'cso_73ebd1e0-8438-11e9-a6a6-966a0a06784e\'}', '{\'id\': \'cso_73ebd1e0-8438-11e9-a6a6-966a0a06784e\'}'),
('log_b6706074-843c-11e9-a6a6-966a0a06784e', '1559373190.5235500', 'crosssale_update', '/api/v1/crosssale/update', 200, 'None', 'None', '{\'crossSaleOfferId\': \'cso_60e841dc-8438-11e9-a6a6-966a0a06784e\', \'amount\': \'1223\', \'currency\': 0, \'capture\': 0, \'planId\': 0, \'captureCharges\': 0, \'template\': 0, \'title\': 0, \'description\': 0, \'imageData\': 0, \'companyName\': 0, \'companyLocation\': 0, \'termsAndConditionsUrl\': 0, \'visibleForAllPartners\': 0, \'visibleForPartnerIds\': 0, \'metadata\': 0, \'partnerId\': 0}', '{\'id\': \'cso_60e841dc-8438-11e9-a6a6-966a0a06784e\', \'created\': \'1559371329.0380700\', \'objectType\': \'CrossSaleOffer\', \'charge\': {\'amount\': 1223.0, \'currency\': \'INR\', \'capture\': 0}, \'template\': \'qweqw\', \'title\': \'asdasd\', \'description\': \'0\', \'imageUrl\': \'0\', \'companyName\': \'qweqw\', \'companyLocation\': \'qweqwe\', \'termsAndConditionsUrl\': \'qweqw\', \'visibleForAllPartners\': 0}'),
('log_c11d22b4-8457-11e9-a6a6-966a0a06784e', '1559384804.8522700', 'charge create', '/api/v1/charge/create', 200, 'None', 'None', '{\'amount\': 1234.0, \'currency\': \'AED\', \'description\': \'DFGHSTYSD\', \'customerId\': 0, \'card\': 0, \'number\': \'4012000100000007\', \'exp_month\': \'2\', \'exp_year\': \'2020\', \'cvc\': \'123\', \'cardholdername\': \'\', \'captured\': 0, \'refunded\': 0, \'disputed\': 0, \'sh_name\': \'sddsdsds\', \'sh_address1\': \'\', \'sh_address2\': \'\', \'sh_zip\': \'\', \'sh_city\': \'\', \'sh_state\': \'\', \'sh_country\': \'\', \'bil_name\': 0, \'bil_address1\': 0, \'bil_address2\': 0, \'bil_city\': 0, \'bil_state\': 0, \'bil_country\': 0, \'vat\': 0, \'metadata\': 0}', '{\'id\': \'c11d22b0-8457-11e9-a6a6-966a0a06784e\', \'created\': 1559384804.8467991, \'objectType\': \'charge\', \'amount\': 1234.0, \'currency\': \'AED\', \'description\': \'DFGHSTYSD\', \'card\': {\'id\': \'card_c11d22b1-8457-11e9-a6a6-966a0a06784e\', \'created\': 1559384804.8468945, \'objectType\': \'card\', \'first6\': \'401200\', \'last4\': \'0007\', \'fingerprint\': \'522fd11a5a880b14cbd7f2811c018d75d3e6db828fa3118aa693a6f1\', \'expMonth\': \'2\', \'expYear\': \'2020\', \'cardholderName\': \'\', \'customerId\': 0, \'brand\': \'Visa\', \'type\': \'type\', \'country\': \'country\'}, \'captured\': 0, \'refunded\': 0, \'disputed\': 0}'),
('log_ee4fdfa6-8457-11e9-a6a6-966a0a06784e', '1559384880.6821300', 'charge create', '/api/v1/charge/create', 200, 'None', 'None', '{\'amount\': 123456.0, \'currency\': \'RON\', \'description\': \'ERTASERT\', \'customerId\': 0, \'card\': 0, \'number\': \'4024007134364842\', \'exp_month\': \'2\', \'exp_year\': \'2024\', \'cvc\': \'123\', \'cardholdername\': \'SERTEART\', \'captured\': 0, \'refunded\': 0, \'disputed\': 0, \'sh_name\': \'sddsdsds\', \'sh_address1\': \'WEFRASER\', \'sh_address2\': \'DGHSDFYH\', \'sh_zip\': \'445745\', \'sh_city\': \'DFUYDFU\', \'sh_state\': \'FGHDFH\', \'sh_country\': \'DK\', \'bil_name\': 0, \'bil_address1\': 0, \'bil_address2\': 0, \'bil_city\': 0, \'bil_state\': 0, \'bil_country\': 0, \'vat\': 0, \'metadata\': 0}', '{\'id\': \'ee4fdfa2-8457-11e9-a6a6-966a0a06784e\', \'created\': 1559384880.6746378, \'objectType\': \'charge\', \'amount\': 123456.0, \'currency\': \'RON\', \'description\': \'ERTASERT\', \'card\': {\'id\': \'card_ee4fdfa3-8457-11e9-a6a6-966a0a06784e\', \'created\': 1559384880.6747026, \'objectType\': \'card\', \'first6\': \'402400\', \'last4\': \'4842\', \'fingerprint\': \'d50bb9e92e1ef4124781e0e6046e8be519bfd96461971f621c28fb82\', \'expMonth\': \'2\', \'expYear\': \'2024\', \'cardholderName\': \'SERTEART\', \'customerId\': 0, \'brand\': \'Visa\', \'type\': \'type\', \'country\': \'country\'}, \'captured\': 0, \'refunded\': 0, \'disputed\': 0}'),
('log_018908ac-8458-11e9-a6a6-966a0a06784e', '1559384912.9258900', 'charge_update', '/api/v1/charge/update', 200, 'None', 'None', '{\'chargeId\': \'ee4fdfa2-8457-11e9-a6a6-966a0a06784e\', \'customerId\': 0, \'description\': \'ERTASERTFDGHDFHSDYH\', \'dispute\': 0, \'fraud_status\': 0, \'fraud_score\': 0, \'sh_name\': 0, \'sh_address1\': 0, \'sh_address2\': 0, \'sh_zip\': 0, \'sh_city\': 0, \'sh_state\': 0, \'sh_country\': 0, \'bil_name\': 0, \'bil_address1\': 0, \'bil_address2\': 0, \'bil_city\': 0, \'bil_state\': 0, \'bil_country\': 0, \'vat\': 0, \'metadata\': 0}', '{\'id\': \'ee4fdfa2-8457-11e9-a6a6-966a0a06784e\', \'created\': \'1559384880.6746400\', \'objectType\': \'charge\', \'amount\': \'123456.0\', \'currency\': \'RON\', \'description\': \'ERTASERTFDGHDFHSDYH\', \'card\': {\'id\': \'card_ee4fdfa3-8457-11e9-a6a6-966a0a06784e\', \'created\': \'1559384880.6747000\', \'objectType\': \'card\', \'first6\': 402400, \'last4\': 4842, \'fingerprint\': \'d50bb9e92e1ef4124781e0e6046e8be519bfd96461971f621c28fb82\', \'expMonth\': 2, \'expYear\': 2024, \'cardholderName\': \'SERTEART\', \'customerId\': \'0\', \'brand\': \'Visa\', \'type\': \'type\', \'country\': \'country\'}, \'captured\': 0, \'refunded\': 0, \'disputed\': 0, \'refunded_amt\': \'None\', \'fraud_status\': None, \'fraud_score\': None}'),
('log_0393ddc0-8458-11e9-a6a6-966a0a06784e', '1559384916.3523100', 'charge_update', '/api/v1/charge/update', 200, 'None', 'None', '{\'chargeId\': \'ee4fdfa2-8457-11e9-a6a6-966a0a06784e\', \'customerId\': 0, \'description\': \'ERTASERTFDGHDFHSDYH\', \'dispute\': 0, \'fraud_status\': 0, \'fraud_score\': 0, \'sh_name\': 0, \'sh_address1\': 0, \'sh_address2\': 0, \'sh_zip\': 0, \'sh_city\': 0, \'sh_state\': 0, \'sh_country\': 0, \'bil_name\': 0, \'bil_address1\': 0, \'bil_address2\': 0, \'bil_city\': 0, \'bil_state\': 0, \'bil_country\': 0, \'vat\': 0, \'metadata\': 0}', '{\'id\': \'ee4fdfa2-8457-11e9-a6a6-966a0a06784e\', \'created\': \'1559384880.6746400\', \'objectType\': \'charge\', \'amount\': \'123456.0\', \'currency\': \'RON\', \'description\': \'ERTASERTFDGHDFHSDYH\', \'card\': {\'id\': \'card_ee4fdfa3-8457-11e9-a6a6-966a0a06784e\', \'created\': \'1559384880.6747000\', \'objectType\': \'card\', \'first6\': 402400, \'last4\': 4842, \'fingerprint\': \'d50bb9e92e1ef4124781e0e6046e8be519bfd96461971f621c28fb82\', \'expMonth\': 2, \'expYear\': 2024, \'cardholderName\': \'SERTEART\', \'customerId\': \'0\', \'brand\': \'Visa\', \'type\': \'type\', \'country\': \'country\'}, \'captured\': 0, \'refunded\': 0, \'disputed\': 0, \'refunded_amt\': \'None\', \'fraud_status\': None, \'fraud_score\': None}'),
('log_24337a92-8458-11e9-a6a6-966a0a06784e', '1559384971.0880800', 'post', '/api/v1/customer/create', 200, 'None', 'None', '{\'email\': \'vondelmort@gmail.com\', \'description\': \'vcbdf\', \'card\': 0, \'metadata\': 0}', '{\'id\': \'24337a8f-8458-11e9-a6a6-966a0a06784e\', \'created\': 1559384971.0854664, \'objectType\': \'customer\', \'email\': \'vondelmort@gmail.com\', \'description\': \'vcbdf\', \'defaultCardId\': 0, \'metadata\': 0}'),
('log_2fd186be-8458-11e9-a6a6-966a0a06784e', '1559384990.5785600', 'post', '/api/v1/customer/create', 200, 'None', 'None', '{\'email\': \'vondelmort@gmail.com\', \'description\': \'cxxxcxzxx\', \'card\': 0, \'metadata\': 0}', '{\'id\': \'2fd186bb-8458-11e9-a6a6-966a0a06784e\', \'created\': 1559384990.5762053, \'objectType\': \'customer\', \'email\': \'vondelmort@gmail.com\', \'description\': \'cxxxcxzxx\', \'defaultCardId\': 0, \'metadata\': 0}'),
('log_7907bd24-8458-11e9-a6a6-966a0a06784e', '1559385113.4051500', 'charge_refunded', '/api/v1/charge/refund', 200, 'None', 'None', '{\'chargeId\': \'ee4fdfa2-8457-11e9-a6a6-966a0a06784e\', \'amount\': \'123\'}', '{\'id\': \'ee4fdfa2-8457-11e9-a6a6-966a0a06784e\', \'created\': \'1559384880.6746400\', \'objectType\': \'charge\', \'amount\': 123456.0, \'currency\': \'RON\', \'description\': \'ERTASERTFDGHDFHSDYH\', \'card\': {\'id\': \'card_ee4fdfa3-8457-11e9-a6a6-966a0a06784e\', \'created\': \'1559384880.6747000\', \'objectType\': \'card\', \'first6\': 402400, \'last4\': 4842, \'fingerprint\': \'d50bb9e92e1ef4124781e0e6046e8be519bfd96461971f621c28fb82\', \'expMonth\': 2, \'expYear\': 2024, \'cardholderName\': \'SERTEART\', \'customerId\': \'0\', \'brand\': \'Visa\', \'type\': \'type\', \'country\': \'country\'}, \'captured\': 0, \'refunded\': 1, \'refunded_amt\': 123.0, \'disputed\': 0}'),
('log_9278398e-8458-11e9-a6a6-966a0a06784e', '1559385156.0875800', 'post', '/api/v1/customer/create', 200, 'None', 'None', '{\'email\': \'vondelmort@gmail.com\', \'description\': \'sample\', \'card\': 0, \'metadata\': 0}', '{\'id\': \'9278398b-8458-11e9-a6a6-966a0a06784e\', \'created\': 1559385156.0853581, \'objectType\': \'customer\', \'email\': \'vondelmort@gmail.com\', \'description\': \'sample\', \'defaultCardId\': 0, \'metadata\': 0}'),
('log_b251b8ac-8458-11e9-a6a6-966a0a06784e', '1559385209.5221300', 'post', '/api/v1/customer/create', 200, 'None', 'None', '{\'email\': \'sdfdfdf@gmail.com\', \'description\': \'xcxvdfdf\', \'card\': 0, \'metadata\': 0}', '{\'id\': \'b251b8a9-8458-11e9-a6a6-966a0a06784e\', \'created\': 1559385209.5200803, \'objectType\': \'customer\', \'email\': \'sdfdfdf@gmail.com\', \'description\': \'xcxvdfdf\', \'defaultCardId\': 0, \'metadata\': 0}'),
('log_aa83f3c6-8459-11e9-a6a6-966a0a06784e', '1559385625.9242700', 'plan_delete', '/api/v1/plan/delete', 200, 'None', 'None', '{\'plan_id\': \'plan_f82b285a-83a4-11e9-a6a6-966a0a06784e\'}', '{\'plan_id\': \'plan_f82b285a-83a4-11e9-a6a6-966a0a06784e\'}'),
('log_0a133738-845b-11e9-a6a6-966a0a06784e', '1559386215.7434900', 'crosssale_delete', '/api/v1/crosssale/delete', 200, 'None', 'None', '{\'crossSaleOfferId\': \'cso_adc67976-839b-11e9-a6a6-966a0a06784e\'}', '{\'id\': \'cso_adc67976-839b-11e9-a6a6-966a0a06784e\'}'),
('log_18b6bc10-845b-11e9-a6a6-966a0a06784e', '1559386240.3031700', 'crosssale_delete', '/api/v1/crosssale/delete', 200, 'None', 'None', '{\'crossSaleOfferId\': \'cso_60e841dc-8438-11e9-a6a6-966a0a06784e\'}', '{\'id\': \'cso_60e841dc-8438-11e9-a6a6-966a0a06784e\'}'),
('log_9088aa50-845b-11e9-a6a6-966a0a06784e', '1559386441.3279900', 'crosssale_delete', '/api/v1/crosssale/delete', 200, 'None', 'None', '{\'crossSaleOfferId\': \'cso_598f9354-8438-11e9-a6a6-966a0a06784e\'}', '{\'id\': \'cso_598f9354-8438-11e9-a6a6-966a0a06784e\'}'),
('log_bed3866e-845b-11e9-a6a6-966a0a06784e', '1559386518.9936400', 'crosssale_delete', '/api/v1/crosssale/delete', 200, 'None', 'None', '{\'crossSaleOfferId\': \'cso_99842016-8437-11e9-a6a6-966a0a06784e\'}', '{\'id\': \'cso_99842016-8437-11e9-a6a6-966a0a06784e\'}'),
('log_f9eaab7e-845b-11e9-a6a6-966a0a06784e', '1559386618.1309100', 'crosssale_delete', '/api/v1/crosssale/delete', 200, 'None', 'None', '{\'crossSaleOfferId\': \'cso_4da664c8-8438-11e9-a6a6-966a0a06784e\'}', '{\'id\': \'cso_4da664c8-8438-11e9-a6a6-966a0a06784e\'}'),
('log_133b8972-845c-11e9-a6a6-966a0a06784e', '1559386660.6039300', 'crosssale_delete', '/api/v1/crosssale/delete', 200, 'None', 'None', '{\'crossSaleOfferId\': \'cso_9b20268a-839d-11e9-a6a6-966a0a06784e\'}', '{\'id\': \'cso_9b20268a-839d-11e9-a6a6-966a0a06784e\'}'),
('log_26ea4f80-845c-11e9-a6a6-966a0a06784e', '1559386693.6261100', 'crosssale_delete', '/api/v1/crosssale/delete', 200, 'None', 'None', '{\'crossSaleOfferId\': \'cso_2b2b88ce-839d-11e9-a6a6-966a0a06784e\'}', '{\'id\': \'cso_2b2b88ce-839d-11e9-a6a6-966a0a06784e\'}'),
('log_3e16faa4-845d-11e9-a6a6-966a0a06784e', '1559387162.0031100', 'crosssale_delete', '/api/v1/crosssale/delete', 200, 'None', 'None', '{\'crossSaleOfferId\': \'cso_c723c2b0-839c-11e9-a6a6-966a0a06784e\'}', '{\'id\': \'cso_c723c2b0-839c-11e9-a6a6-966a0a06784e\'}'),
('log_78dc9d46-845e-11e9-a6a6-966a0a06784e', '1559387690.1030000', 'charge_update', '/api/v1/charge/update', 200, 'None', 'None', '{\'chargeId\': \'ee4fdfa2-8457-11e9-a6a6-966a0a06784e\', \'customerId\': 0, \'description\': \'ERTASERTFDGHDFHSDYH\', \'dispute\': 0, \'fraud_status\': 0, \'fraud_score\': 0, \'sh_name\': 0, \'sh_address1\': 0, \'sh_address2\': 0, \'sh_zip\': 0, \'sh_city\': 0, \'sh_state\': 0, \'sh_country\': 0, \'bil_name\': 0, \'bil_address1\': 0, \'bil_address2\': 0, \'bil_city\': 0, \'bil_state\': 0, \'bil_country\': 0, \'vat\': 0, \'metadata\': 0}', '{\'id\': \'ee4fdfa2-8457-11e9-a6a6-966a0a06784e\', \'created\': \'1559384880.6746400\', \'objectType\': \'charge\', \'amount\': \'123456.0\', \'currency\': \'RON\', \'description\': \'ERTASERTFDGHDFHSDYH\', \'card\': {\'id\': \'card_ee4fdfa3-8457-11e9-a6a6-966a0a06784e\', \'created\': \'1559384880.6747000\', \'objectType\': \'card\', \'first6\': 402400, \'last4\': 4842, \'fingerprint\': \'d50bb9e92e1ef4124781e0e6046e8be519bfd96461971f621c28fb82\', \'expMonth\': 2, \'expYear\': 2024, \'cardholderName\': \'SERTEART\', \'customerId\': \'0\', \'brand\': \'Visa\', \'type\': \'type\', \'country\': \'country\'}, \'captured\': 0, \'refunded\': 1, \'disputed\': 0, \'refunded_amt\': \'123.0\', \'fraud_status\': None, \'fraud_score\': None}'),
('log_7ce6ddf2-845e-11e9-a6a6-966a0a06784e', '1559387696.8809600', 'charge_update', '/api/v1/charge/update', 200, 'None', 'None', '{\'chargeId\': \'ee4fdfa2-8457-11e9-a6a6-966a0a06784e\', \'customerId\': 0, \'description\': \'ERTASERTFDGHDFHSDYH\', \'dispute\': 0, \'fraud_status\': 0, \'fraud_score\': 0, \'sh_name\': 0, \'sh_address1\': 0, \'sh_address2\': 0, \'sh_zip\': 0, \'sh_city\': 0, \'sh_state\': 0, \'sh_country\': 0, \'bil_name\': 0, \'bil_address1\': 0, \'bil_address2\': 0, \'bil_city\': 0, \'bil_state\': 0, \'bil_country\': 0, \'vat\': 0, \'metadata\': 0}', '{\'id\': \'ee4fdfa2-8457-11e9-a6a6-966a0a06784e\', \'created\': \'1559384880.6746400\', \'objectType\': \'charge\', \'amount\': \'123456.0\', \'currency\': \'RON\', \'description\': \'ERTASERTFDGHDFHSDYH\', \'card\': {\'id\': \'card_ee4fdfa3-8457-11e9-a6a6-966a0a06784e\', \'created\': \'1559384880.6747000\', \'objectType\': \'card\', \'first6\': 402400, \'last4\': 4842, \'fingerprint\': \'d50bb9e92e1ef4124781e0e6046e8be519bfd96461971f621c28fb82\', \'expMonth\': 2, \'expYear\': 2024, \'cardholderName\': \'SERTEART\', \'customerId\': \'0\', \'brand\': \'Visa\', \'type\': \'type\', \'country\': \'country\'}, \'captured\': 0, \'refunded\': 1, \'disputed\': 0, \'refunded_amt\': \'123.0\', \'fraud_status\': None, \'fraud_score\': None}'),
('log_f29b9306-8460-11e9-a6a6-966a0a06784e', '1559388753.3522300', 'charge_update', '/api/v1/charge/update', 200, 'None', 'None', '{\'chargeId\': \'ee4fdfa2-8457-11e9-a6a6-966a0a06784e\', \'customerId\': 0, \'description\': \'ERTASERTFDGHDFHSDYH\', \'dispute\': 0, \'fraud_status\': 0, \'fraud_score\': 0, \'sh_name\': 0, \'sh_address1\': 0, \'sh_address2\': 0, \'sh_zip\': 0, \'sh_city\': 0, \'sh_state\': 0, \'sh_country\': 0, \'bil_name\': 0, \'bil_address1\': 0, \'bil_address2\': 0, \'bil_city\': 0, \'bil_state\': 0, \'bil_country\': 0, \'vat\': 0, \'metadata\': 0}', '{\'id\': \'ee4fdfa2-8457-11e9-a6a6-966a0a06784e\', \'created\': \'1559384880.6746400\', \'objectType\': \'charge\', \'amount\': \'123456.0\', \'currency\': \'RON\', \'description\': \'ERTASERTFDGHDFHSDYH\', \'card\': {\'id\': \'card_ee4fdfa3-8457-11e9-a6a6-966a0a06784e\', \'created\': \'1559384880.6747000\', \'objectType\': \'card\', \'first6\': 402400, \'last4\': 4842, \'fingerprint\': \'d50bb9e92e1ef4124781e0e6046e8be519bfd96461971f621c28fb82\', \'expMonth\': 2, \'expYear\': 2024, \'cardholderName\': \'SERTEART\', \'customerId\': \'0\', \'brand\': \'Visa\', \'type\': \'type\', \'country\': \'country\'}, \'captured\': 0, \'refunded\': 1, \'disputed\': 0, \'refunded_amt\': \'123.0\', \'fraud_status\': None, \'fraud_score\': None}'),
('log_f68aad94-8460-11e9-a6a6-966a0a06784e', '1559388759.9522800', 'charge_update', '/api/v1/charge/update', 200, 'None', 'None', '{\'chargeId\': \'ee4fdfa2-8457-11e9-a6a6-966a0a06784e\', \'customerId\': 0, \'description\': \'cvcxvxc\', \'dispute\': 0, \'fraud_status\': 0, \'fraud_score\': 0, \'sh_name\': 0, \'sh_address1\': 0, \'sh_address2\': 0, \'sh_zip\': 0, \'sh_city\': 0, \'sh_state\': 0, \'sh_country\': 0, \'bil_name\': 0, \'bil_address1\': 0, \'bil_address2\': 0, \'bil_city\': 0, \'bil_state\': 0, \'bil_country\': 0, \'vat\': 0, \'metadata\': 0}', '{\'id\': \'ee4fdfa2-8457-11e9-a6a6-966a0a06784e\', \'created\': \'1559384880.6746400\', \'objectType\': \'charge\', \'amount\': \'123456.0\', \'currency\': \'RON\', \'description\': \'cvcxvxc\', \'card\': {\'id\': \'card_ee4fdfa3-8457-11e9-a6a6-966a0a06784e\', \'created\': \'1559384880.6747000\', \'objectType\': \'card\', \'first6\': 402400, \'last4\': 4842, \'fingerprint\': \'d50bb9e92e1ef4124781e0e6046e8be519bfd96461971f621c28fb82\', \'expMonth\': 2, \'expYear\': 2024, \'cardholderName\': \'SERTEART\', \'customerId\': \'0\', \'brand\': \'Visa\', \'type\': \'type\', \'country\': \'country\'}, \'captured\': 0, \'refunded\': 1, \'disputed\': 0, \'refunded_amt\': \'123.0\', \'fraud_status\': None, \'fraud_score\': None}'),
('log_5a51c59c-8461-11e9-a6a6-966a0a06784e', '1559388927.3516000', 'charge_update', '/api/v1/charge/update', 200, 'None', 'None', '{\'chargeId\': \'ee4fdfa2-8457-11e9-a6a6-966a0a06784e\', \'customerId\': 0, \'description\': \'cvcxvxczxcx\', \'dispute\': 0, \'fraud_status\': 0, \'fraud_score\': 0, \'sh_name\': 0, \'sh_address1\': 0, \'sh_address2\': 0, \'sh_zip\': 0, \'sh_city\': 0, \'sh_state\': 0, \'sh_country\': 0, \'bil_name\': 0, \'bil_address1\': 0, \'bil_address2\': 0, \'bil_city\': 0, \'bil_state\': 0, \'bil_country\': 0, \'vat\': 0, \'metadata\': 0}', '{\'id\': \'ee4fdfa2-8457-11e9-a6a6-966a0a06784e\', \'created\': \'1559384880.6746400\', \'objectType\': \'charge\', \'amount\': \'123456.0\', \'currency\': \'RON\', \'description\': \'cvcxvxczxcx\', \'card\': {\'id\': \'card_ee4fdfa3-8457-11e9-a6a6-966a0a06784e\', \'created\': \'1559384880.6747000\', \'objectType\': \'card\', \'first6\': 402400, \'last4\': 4842, \'fingerprint\': \'d50bb9e92e1ef4124781e0e6046e8be519bfd96461971f621c28fb82\', \'expMonth\': 2, \'expYear\': 2024, \'cardholderName\': \'SERTEART\', \'customerId\': \'0\', \'brand\': \'Visa\', \'type\': \'type\', \'country\': \'country\'}, \'captured\': 0, \'refunded\': 1, \'disputed\': 0, \'refunded_amt\': \'123.0\', \'fraud_status\': None, \'fraud_score\': None}'),
('log_b3f86196-8461-11e9-a6a6-966a0a06784e', '1559389077.7607000', 'charge_update', '/api/v1/charge/update', 200, 'None', 'None', '{\'chargeId\': \'ee4fdfa2-8457-11e9-a6a6-966a0a06784e\', \'customerId\': 0, \'description\': \'cvcxvxczxcx454646876587jhgjuh755475\', \'dispute\': 0, \'fraud_status\': 0, \'fraud_score\': 0, \'sh_name\': 0, \'sh_address1\': 0, \'sh_address2\': 0, \'sh_zip\': 0, \'sh_city\': 0, \'sh_state\': 0, \'sh_country\': 0, \'bil_name\': 0, \'bil_address1\': 0, \'bil_address2\': 0, \'bil_city\': 0, \'bil_state\': 0, \'bil_country\': 0, \'vat\': 0, \'metadata\': 0}', '{\'id\': \'ee4fdfa2-8457-11e9-a6a6-966a0a06784e\', \'created\': \'1559384880.6746400\', \'objectType\': \'charge\', \'amount\': \'123456.0\', \'currency\': \'RON\', \'description\': \'cvcxvxczxcx454646876587jhgjuh755475\', \'card\': {\'id\': \'card_ee4fdfa3-8457-11e9-a6a6-966a0a06784e\', \'created\': \'1559384880.6747000\', \'objectType\': \'card\', \'first6\': 402400, \'last4\': 4842, \'fingerprint\': \'d50bb9e92e1ef4124781e0e6046e8be519bfd96461971f621c28fb82\', \'expMonth\': 2, \'expYear\': 2024, \'cardholderName\': \'SERTEART\', \'customerId\': \'0\', \'brand\': \'Visa\', \'type\': \'type\', \'country\': \'country\'}, \'captured\': 0, \'refunded\': 1, \'disputed\': 0, \'refunded_amt\': \'123.0\', \'fraud_status\': None, \'fraud_score\': None}'),
('log_33cb9bf8-8463-11e9-a6a6-966a0a06784e', '1559389721.7123700', 'charge_refunded', '/api/v1/charge/refund', 200, 'None', 'None', '{\'chargeId\': \'ee4fdfa2-8457-11e9-a6a6-966a0a06784e\', \'amount\': \'123\'}', '{\'id\': \'ee4fdfa2-8457-11e9-a6a6-966a0a06784e\', \'created\': \'1559384880.6746400\', \'objectType\': \'charge\', \'amount\': 123456.0, \'currency\': \'RON\', \'description\': \'cvcxvxczxcx454646876587jhgjuh755475\', \'card\': {\'id\': \'card_ee4fdfa3-8457-11e9-a6a6-966a0a06784e\', \'created\': \'1559384880.6747000\', \'objectType\': \'card\', \'first6\': 402400, \'last4\': 4842, \'fingerprint\': \'d50bb9e92e1ef4124781e0e6046e8be519bfd96461971f621c28fb82\', \'expMonth\': 2, \'expYear\': 2024, \'cardholderName\': \'SERTEART\', \'customerId\': \'0\', \'brand\': \'Visa\', \'type\': \'type\', \'country\': \'country\'}, \'captured\': 0, \'refunded\': 1, \'refunded_amt\': 246.0, \'disputed\': 0}'),
('log_74e9ceb6-8463-11e9-a6a6-966a0a06784e', '1559389830.9622100', 'charge_refunded', '/api/v1/charge/refund', 200, 'None', 'None', '{\'chargeId\': \'ee4fdfa2-8457-11e9-a6a6-966a0a06784e\', \'amount\': \'1234\'}', '{\'id\': \'ee4fdfa2-8457-11e9-a6a6-966a0a06784e\', \'created\': \'1559384880.6746400\', \'objectType\': \'charge\', \'amount\': 123456.0, \'currency\': \'RON\', \'description\': \'cvcxvxczxcx454646876587jhgjuh755475\', \'card\': {\'id\': \'card_ee4fdfa3-8457-11e9-a6a6-966a0a06784e\', \'created\': \'1559384880.6747000\', \'objectType\': \'card\', \'first6\': 402400, \'last4\': 4842, \'fingerprint\': \'d50bb9e92e1ef4124781e0e6046e8be519bfd96461971f621c28fb82\', \'expMonth\': 2, \'expYear\': 2024, \'cardholderName\': \'SERTEART\', \'customerId\': \'0\', \'brand\': \'Visa\', \'type\': \'type\', \'country\': \'country\'}, \'captured\': 0, \'refunded\': 1, \'refunded_amt\': 1480.0, \'disputed\': 0}'),
('log_d6ae1509-8463-11e9-a6a6-966a0a06784e', '1559389994.9916100', 'crosssale create', '/api/v1/crosssale/create', 200, 'None', 'None', '{\'amount\': \'1212\', \'currency\': \'BDT\', \'capture\': \'true\', \'planId\': 0, \'captureCharges\': \'0\', \'template\': \'text_only\', \'title\': \'cxvvcv\', \'description\': \'cvbvb\', \'imageData\': \'\', \'companyName\': \'cbche\', \'companyLocation\': \'AI\', \'termsAndConditionsUrl\': \'https://securionpay.com/cross-sale-offers\', \'visibleForAllPartners\': 0, \'visibleForPartnerIds\': 0, \'metadata\': 0, \'partnerId\': 0}', '{\'id\': \'cso_d6ae1506-8463-11e9-a6a6-966a0a06784e\', \'created\': \'1559389994.9873400\', \'objectType\': \'CrossSaleOffer\', \'charge\': {\'amount\': 1212.0, \'currency\': \'BDT\', \'capture\': 0}, \'template\': \'text_only\', \'title\': \'cxvvcv\', \'description\': \'cvbvb\', \'imageUrl\': \'\', \'companyName\': \'cbche\', \'companyLocation\': \'AI\', \'termsAndConditionsUrl\': \'https://securionpay.com/cross-sale-offers\', \'visibleForAllPartners\': 0}'),
('log_973f9d6f-8464-11e9-a6a6-966a0a06784e', '1559390318.0690100', 'crosssale create', '/api/v1/crosssale/create', 200, 'None', 'None', '{\'amount\': \'121\', \'currency\': \'EUR\', \'capture\': \'true\', \'planId\': 0, \'captureCharges\': \'0\', \'template\': \'text_only\', \'title\': \'zxcx\', \'description\': \'adsdd\', \'imageData\': 0, \'companyName\': \'cdswaszx\', \'companyLocation\': \'CH\', \'termsAndConditionsUrl\': \'http://xcsdfsdfd\', \'visibleForAllPartners\': 0, \'visibleForPartnerIds\': 0, \'metadata\': 0, \'partnerId\': 0}', '{\'id\': \'cso_973f9d6c-8464-11e9-a6a6-966a0a06784e\', \'created\': \'1559390318.0636700\', \'objectType\': \'CrossSaleOffer\', \'charge\': {\'amount\': 121.0, \'currency\': \'EUR\', \'capture\': 0}, \'template\': \'text_only\', \'title\': \'zxcx\', \'description\': \'adsdd\', \'imageUrl\': \'0\', \'companyName\': \'cdswaszx\', \'companyLocation\': \'CH\', \'termsAndConditionsUrl\': \'http://xcsdfsdfd\', \'visibleForAllPartners\': 0}'),
('log_d4076808-8464-11e9-a6a6-966a0a06784e', '1559390420.0364500', 'charge_refunded', '/api/v1/charge/refund', 200, 'None', 'None', '{\'chargeId\': \'ee4fdfa2-8457-11e9-a6a6-966a0a06784e\', \'amount\': \'12197\'}', '{\'id\': \'ee4fdfa2-8457-11e9-a6a6-966a0a06784e\', \'created\': \'1559384880.6746400\', \'objectType\': \'charge\', \'amount\': 123456.0, \'currency\': \'RON\', \'description\': \'cvcxvxczxcx454646876587jhgjuh755475\', \'card\': {\'id\': \'card_ee4fdfa3-8457-11e9-a6a6-966a0a06784e\', \'created\': \'1559384880.6747000\', \'objectType\': \'card\', \'first6\': 402400, \'last4\': 4842, \'fingerprint\': \'d50bb9e92e1ef4124781e0e6046e8be519bfd96461971f621c28fb82\', \'expMonth\': 2, \'expYear\': 2024, \'cardholderName\': \'SERTEART\', \'customerId\': \'0\', \'brand\': \'Visa\', \'type\': \'type\', \'country\': \'country\'}, \'captured\': 0, \'refunded\': 1, \'refunded_amt\': 13677.0, \'disputed\': 0}'),
('log_f7b64112-8465-11e9-a6a6-966a0a06784e', '1559390909.4019800', 'post', '/api/v1/customer/create', 200, 'None', 'None', '{\'email\': \'admin@gmail.com\', \'description\': \'admin\', \'card\': 0, \'metadata\': 0}', '{\'id\': \'f7b6410f-8465-11e9-a6a6-966a0a06784e\', \'created\': 1559390909.3992605, \'objectType\': \'customer\', \'email\': \'admin@gmail.com\', \'description\': \'admin\', \'defaultCardId\': 0, \'metadata\': 0}'),
('log_fc6d8102-8465-11e9-a6a6-966a0a06784e', '1559390917.3128500', 'post', '/api/v1/customer/create', 200, 'None', 'None', '{\'email\': \'sdfdfdf@gmail.com\', \'description\': \'drtyeryre\', \'card\': 0, \'metadata\': 0}', '{\'id\': \'fc6d80ff-8465-11e9-a6a6-966a0a06784e\', \'created\': 1559390917.3110223, \'objectType\': \'customer\', \'email\': \'sdfdfdf@gmail.com\', \'description\': \'drtyeryre\', \'defaultCardId\': 0, \'metadata\': 0}'),
('log_1851aab4-8467-11e9-a6a6-966a0a06784e', '1559391393.6087400', 'charge create', '/api/v1/charge/create', 200, 'None', 'None', '{\'amount\': 233.0, \'currency\': \'ALL\', \'description\': \'xcvc\', \'customerId\': 0, \'card\': 0, \'number\': \'4024007134364842\', \'exp_month\': \'5\', \'exp_year\': \'2023\', \'cvc\': \'34\', \'cardholdername\': \'\', \'captured\': 0, \'refunded\': 0, \'disputed\': 0, \'sh_name\': \'sddsdsds\', \'sh_address1\': \'\', \'sh_address2\': \'\', \'sh_zip\': \'\', \'sh_city\': \'\', \'sh_state\': \'\', \'sh_country\': \'\', \'bil_name\': 0, \'bil_address1\': 0, \'bil_address2\': 0, \'bil_city\': 0, \'bil_state\': 0, \'bil_country\': 0, \'vat\': 0, \'metadata\': 0}', '{\'id\': \'1851aab0-8467-11e9-a6a6-966a0a06784e\', \'created\': 1559391393.6032374, \'objectType\': \'charge\', \'amount\': 233.0, \'currency\': \'ALL\', \'description\': \'xcvc\', \'card\': {\'id\': \'card_1851aab1-8467-11e9-a6a6-966a0a06784e\', \'created\': 1559391393.6032996, \'objectType\': \'card\', \'first6\': \'402400\', \'last4\': \'4842\', \'fingerprint\': \'d50bb9e92e1ef4124781e0e6046e8be519bfd96461971f621c28fb82\', \'expMonth\': \'5\', \'expYear\': \'2023\', \'cardholderName\': \'\', \'customerId\': 0, \'brand\': \'Visa\', \'type\': \'type\', \'country\': \'country\'}, \'captured\': 0, \'refunded\': 0, \'disputed\': 0}'),
('log_585352ca-8467-11e9-a6a6-966a0a06784e', '1559391500.9891900', 'post', '/api/v1/customer/create', 200, 'None', 'None', '{\'email\': \'sample@gmail.com\', \'description\': \'sample\', \'card\': 0, \'metadata\': 0}', '{\'id\': \'585352c7-8467-11e9-a6a6-966a0a06784e\', \'created\': 1559391500.986638, \'objectType\': \'customer\', \'email\': \'sample@gmail.com\', \'description\': \'sample\', \'defaultCardId\': 0, \'metadata\': 0}'),
('log_044054a2-8468-11e9-a6a6-966a0a06784e', '1559391789.4332000', 'post', '/api/v1/customer/create', 200, 'None', 'None', '{\'email\': \'rahul.kumar9961@gmail.com\', \'description\': \'zXcvb\', \'card\': 0, \'metadata\': 0}', '{\'id\': \'0440549f-8468-11e9-a6a6-966a0a06784e\', \'created\': 1559391789.430342, \'objectType\': \'customer\', \'email\': \'rahul.kumar9961@gmail.com\', \'description\': \'zXcvb\', \'defaultCardId\': 0, \'metadata\': 0}'),
('log_46585735-8468-11e9-a6a6-966a0a06784e', '1559391900.3217100', 'plan_create', '/api/v1/plan/create', 200, 'None', 'None', '{\'amount\': \'54\', \'currency\': \'AUD\', \'interval\': \'hour\', \'name\': \'Subhash\', \'intervalCount\': \'1\', \'billingCycles\': \'1\', \'trialPeriodDays\': \'1\', \'recursTo\': \'\', \'metadata\': 0}', '{\'id\': \'plan_46585732-8468-11e9-a6a6-966a0a06784e\', \'created\': \'1559391900.3172100\', \'objectType\': \'plan\', \'amount\': 54.0, \'currency\': \'AUD\', \'interval\': \'hour\', \'intervalCount\': 1, \'name\': \'Subhash\', \'trialPeriodDays\': 1}'),
('log_74016e8a-846a-11e9-a6a6-966a0a06784e', '1559392835.9165900', 'plan_delete', '/api/v1/plan/delete', 200, 'None', 'None', '{\'plan_id\': \'plan_46585732-8468-11e9-a6a6-966a0a06784e\'}', '{\'plan_id\': \'plan_46585732-8468-11e9-a6a6-966a0a06784e\'}'),
('log_bc5f2579-846a-11e9-a6a6-966a0a06784e', '1559392957.3306300', 'plan_create', '/api/v1/plan/create', 200, 'None', 'None', '{\'amount\': \'1\', \'currency\': \'AMD\', \'interval\': \'day\', \'name\': \'Rahul\', \'intervalCount\': \'1\', \'billingCycles\': \'1\', \'trialPeriodDays\': \'2\', \'recursTo\': \'\', \'metadata\': 0}', '{\'id\': \'plan_bc5f2576-846a-11e9-a6a6-966a0a06784e\', \'created\': \'1559392957.3263900\', \'objectType\': \'plan\', \'amount\': 1.0, \'currency\': \'AMD\', \'interval\': \'day\', \'intervalCount\': 1, \'name\': \'Rahul\', \'trialPeriodDays\': 2}'),
('log_de1bc0d7-846a-11e9-a6a6-966a0a06784e', '1559393013.9327400', 'plan_create', '/api/v1/plan/create', 200, 'None', 'None', '{\'amount\': \'212\', \'currency\': \'INR\', \'interval\': \'week\', \'name\': \'cxz\', \'intervalCount\': \'1\', \'billingCycles\': \'1\', \'trialPeriodDays\': \'1\', \'recursTo\': \'\', \'metadata\': 0}', '{\'id\': \'plan_de1bc0d4-846a-11e9-a6a6-966a0a06784e\', \'created\': \'1559393013.9272700\', \'objectType\': \'plan\', \'amount\': 212.0, \'currency\': \'INR\', \'interval\': \'week\', \'intervalCount\': 1, \'name\': \'cxz\', \'trialPeriodDays\': 1}'),
('log_ebeacde4-846a-11e9-a6a6-966a0a06784e', '1559393037.0976200', 'post', '/api/v1/customer/create', 200, 'None', 'None', '{\'email\': \'rahul.kumar9961@gmail.com\', \'description\': \'afgagag\', \'card\': 0, \'metadata\': 0}', '{\'id\': \'ebeacde1-846a-11e9-a6a6-966a0a06784e\', \'created\': 1559393037.0946631, \'objectType\': \'customer\', \'email\': \'rahul.kumar9961@gmail.com\', \'description\': \'afgagag\', \'defaultCardId\': 0, \'metadata\': 0}'),
('log_ebeacde8-846a-11e9-a6a6-966a0a06784e', '1559393037.2220000', 'plan_create', '/api/v1/plan/create', 200, 'None', 'None', '{\'amount\': \'1\', \'currency\': \'INR\', \'interval\': \'week\', \'name\': \'cvxcv\', \'intervalCount\': \'12\', \'billingCycles\': \'1\', \'trialPeriodDays\': \'11\', \'recursTo\': \'\', \'metadata\': 0}', '{\'id\': \'plan_ebeacde5-846a-11e9-a6a6-966a0a06784e\', \'created\': \'1559393037.2183300\', \'objectType\': \'plan\', \'amount\': 1.0, \'currency\': \'INR\', \'interval\': \'week\', \'intervalCount\': 12, \'name\': \'cvxcv\', \'trialPeriodDays\': 11}'),
('log_f6732bbb-846a-11e9-a6a6-966a0a06784e', '1559393054.7697900', 'plan_create', '/api/v1/plan/create', 200, 'None', 'None', '{\'amount\': \'1\', \'currency\': \'ALL\', \'interval\': \'day\', \'name\': \'wqww\', \'intervalCount\': \'1\', \'billingCycles\': \'1\', \'trialPeriodDays\': \'233\', \'recursTo\': \'\', \'metadata\': 0}', '{\'id\': \'plan_f6732bb8-846a-11e9-a6a6-966a0a06784e\', \'created\': \'1559393054.7654500\', \'objectType\': \'plan\', \'amount\': 1.0, \'currency\': \'ALL\', \'interval\': \'day\', \'intervalCount\': 1, \'name\': \'wqww\', \'trialPeriodDays\': 233}'),
('log_ff8123e3-846a-11e9-a6a6-966a0a06784e', '1559393069.9609500', 'plan_create', '/api/v1/plan/create', 200, 'None', 'None', '{\'amount\': \'65\', \'currency\': \'INR\', \'interval\': \'hour\', \'name\': \'cvc\', \'intervalCount\': \'4\', \'billingCycles\': \'44\', \'trialPeriodDays\': \'5\', \'recursTo\': \'\', \'metadata\': 0}', '{\'id\': \'plan_ff8123e0-846a-11e9-a6a6-966a0a06784e\', \'created\': \'1559393069.9565200\', \'objectType\': \'plan\', \'amount\': 65.0, \'currency\': \'INR\', \'interval\': \'hour\', \'intervalCount\': 4, \'name\': \'cvc\', \'trialPeriodDays\': 5}'),
('log_0aef97ff-846b-11e9-a6a6-966a0a06784e', '1559393089.1404600', 'plan_create', '/api/v1/plan/create', 200, 'None', 'None', '{\'amount\': \'43\', \'currency\': \'INR\', \'interval\': \'hour\', \'name\': \'dgfgfg\', \'intervalCount\': \'3434\', \'billingCycles\': \'2\', \'trialPeriodDays\': \'2\', \'recursTo\': \'\', \'metadata\': 0}', '{\'id\': \'plan_0aef97fc-846b-11e9-a6a6-966a0a06784e\', \'created\': \'1559393089.1353200\', \'objectType\': \'plan\', \'amount\': 43.0, \'currency\': \'INR\', \'interval\': \'hour\', \'intervalCount\': 3434, \'name\': \'dgfgfg\', \'trialPeriodDays\': 2}'),
('log_15ebb35f-846b-11e9-a6a6-966a0a06784e', '1559393107.5713900', 'plan_create', '/api/v1/plan/create', 200, 'None', 'None', '{\'amount\': \'2\', \'currency\': \'INR\', \'interval\': \'day\', \'name\': \'gfdgfh\', \'intervalCount\': \'1\', \'billingCycles\': \'1\', \'trialPeriodDays\': \'2\', \'recursTo\': \'\', \'metadata\': 0}', '{\'id\': \'plan_15ebb35c-846b-11e9-a6a6-966a0a06784e\', \'created\': \'1559393107.5647200\', \'objectType\': \'plan\', \'amount\': 2.0, \'currency\': \'INR\', \'interval\': \'day\', \'intervalCount\': 1, \'name\': \'gfdgfh\', \'trialPeriodDays\': 2}'),
('log_2a06ecf1-846b-11e9-a6a6-966a0a06784e', '1559393141.3013000', 'plan_create', '/api/v1/plan/create', 200, 'None', 'None', '{\'amount\': \'2\', \'currency\': \'INR\', \'interval\': \'day\', \'name\': \'xcv\', \'intervalCount\': \'1\', \'billingCycles\': \'3\', \'trialPeriodDays\': \'2\', \'recursTo\': \'\', \'metadata\': 0}', '{\'id\': \'plan_2a06ecee-846b-11e9-a6a6-966a0a06784e\', \'created\': \'1559393141.2975700\', \'objectType\': \'plan\', \'amount\': 2.0, \'currency\': \'INR\', \'interval\': \'day\', \'intervalCount\': 1, \'name\': \'xcv\', \'trialPeriodDays\': 2}'),
('log_3563d3c5-846b-11e9-a6a6-966a0a06784e', '1559393160.3654500', 'plan_create', '/api/v1/plan/create', 200, 'None', 'None', '{\'amount\': \'56789\', \'currency\': \'SDG\', \'interval\': \'hour\', \'name\': \'cvcv\', \'intervalCount\': \'2\', \'billingCycles\': \'1\', \'trialPeriodDays\': \'12\', \'recursTo\': \'\', \'metadata\': 0}', '{\'id\': \'plan_3563d3c2-846b-11e9-a6a6-966a0a06784e\', \'created\': \'1559393160.3613900\', \'objectType\': \'plan\', \'amount\': 56789.0, \'currency\': \'SDG\', \'interval\': \'hour\', \'intervalCount\': 2, \'name\': \'cvcv\', \'trialPeriodDays\': 12}');
INSERT INTO `log` (`log`, `created`, `method`, `url`, `status`, `ip_address`, `source`, `request_body`, `response_body`) VALUES
('log_40964813-846b-11e9-a6a6-966a0a06784e', '1559393179.1536400', 'plan_create', '/api/v1/plan/create', 200, 'None', 'None', '{\'amount\': \'2122\', \'currency\': \'DJF\', \'interval\': \'day\', \'name\': \'xcvxc\', \'intervalCount\': \'2\', \'billingCycles\': \'1\', \'trialPeriodDays\': \'1\', \'recursTo\': \'\', \'metadata\': 0}', '{\'id\': \'plan_40964810-846b-11e9-a6a6-966a0a06784e\', \'created\': \'1559393179.1470300\', \'objectType\': \'plan\', \'amount\': 2122.0, \'currency\': \'DJF\', \'interval\': \'day\', \'intervalCount\': 2, \'name\': \'xcvxc\', \'trialPeriodDays\': 1}'),
('log_4b99a3bd-846b-11e9-a6a6-966a0a06784e', '1559393197.6273600', 'plan_create', '/api/v1/plan/create', 200, 'None', 'None', '{\'amount\': \'3223\', \'currency\': \'DJF\', \'interval\': \'week\', \'name\': \'xcxvc\', \'intervalCount\': \'2\', \'billingCycles\': \'4\', \'trialPeriodDays\': \'4\', \'recursTo\': \'\', \'metadata\': 0}', '{\'id\': \'plan_4b99a3ba-846b-11e9-a6a6-966a0a06784e\', \'created\': \'1559393197.6239000\', \'objectType\': \'plan\', \'amount\': 3223.0, \'currency\': \'DJF\', \'interval\': \'week\', \'intervalCount\': 2, \'name\': \'xcxvc\', \'trialPeriodDays\': 4}'),
('log_6046f12b-846b-11e9-a6a6-966a0a06784e', '1559393232.3185500', 'plan_create', '/api/v1/plan/create', 200, 'None', 'None', '{\'amount\': \'2\', \'currency\': \'NAD\', \'interval\': \'week\', \'name\': \'xcxv\', \'intervalCount\': \'1\', \'billingCycles\': \'44\', \'trialPeriodDays\': \'3\', \'recursTo\': \'\', \'metadata\': 0}', '{\'id\': \'plan_6046f128-846b-11e9-a6a6-966a0a06784e\', \'created\': \'1559393232.3141300\', \'objectType\': \'plan\', \'amount\': 2.0, \'currency\': \'NAD\', \'interval\': \'week\', \'intervalCount\': 1, \'name\': \'xcxv\', \'trialPeriodDays\': 3}'),
('log_e6f48317-846d-11e9-a6a6-966a0a06784e', '1559394317.2674200', 'crosssale create', '/api/v1/crosssale/create', 200, 'None', 'None', '{\'amount\': \'2\', \'currency\': \'INR\', \'capture\': \'true\', \'planId\': 0, \'captureCharges\': \'0\', \'template\': \'text_only\', \'title\': \'titel\', \'description\': \'cvxcvc\', \'imageData\': \'\', \'companyName\': \'nmghfdsa\', \'companyLocation\': \'IN\', \'termsAndConditionsUrl\': \'https://securionpay.com/cross-sale\', \'visibleForAllPartners\': 0, \'visibleForPartnerIds\': 0, \'metadata\': 0, \'partnerId\': 0}', '{\'id\': \'cso_e6f48314-846d-11e9-a6a6-966a0a06784e\', \'created\': \'1559394317.2598200\', \'objectType\': \'CrossSaleOffer\', \'charge\': {\'amount\': 2.0, \'currency\': \'INR\', \'capture\': 0}, \'template\': \'text_only\', \'title\': \'titel\', \'description\': \'cvxcvc\', \'imageUrl\': \'\', \'companyName\': \'nmghfdsa\', \'companyLocation\': \'IN\', \'termsAndConditionsUrl\': \'https://securionpay.com/cross-sale\', \'visibleForAllPartners\': 0}'),
('log_8d09e239-8472-11e9-a6a6-966a0a06784e', '1559396313.8947000', 'crosssale create', '/api/v1/crosssale/create', 200, 'None', 'None', '{\'amount\': \'1\', \'currency\': \'AFN\', \'capture\': \'true\', \'planId\': 0, \'captureCharges\': \'0\', \'template\': \'text_only\', \'title\': \'cvcbv\', \'description\': \'cvb\', \'imageData\': \'\', \'companyName\': \'cxvcb\', \'companyLocation\': \'DZ\', \'termsAndConditionsUrl\': \'xcvcbvv\', \'visibleForAllPartners\': 0, \'visibleForPartnerIds\': 0, \'metadata\': 0, \'partnerId\': 0}', '{\'id\': \'cso_8d09e236-8472-11e9-a6a6-966a0a06784e\', \'created\': \'1559396313.8885400\', \'objectType\': \'CrossSaleOffer\', \'charge\': {\'amount\': 1.0, \'currency\': \'AFN\', \'capture\': 0}, \'template\': \'text_only\', \'title\': \'cvcbv\', \'description\': \'cvb\', \'imageUrl\': \'\', \'companyName\': \'cxvcb\', \'companyLocation\': \'DZ\', \'termsAndConditionsUrl\': \'xcvcbvv\', \'visibleForAllPartners\': 0}'),
('log_ac8a8c8f-8472-11e9-a6a6-966a0a06784e', '1559396366.7456500', 'crosssale create', '/api/v1/crosssale/create', 200, 'None', 'None', '{\'amount\': \'1221\', \'currency\': \'AOA\', \'capture\': \'true\', \'planId\': 0, \'captureCharges\': \'0\', \'template\': \'text_only\', \'title\': \'rtrtr\', \'description\': \'cxvcbv\', \'imageData\': \'\', \'companyName\': \'xcvxcvcv\', \'companyLocation\': \'AL\', \'termsAndConditionsUrl\': \'cvbvbbvv\', \'visibleForAllPartners\': 0, \'visibleForPartnerIds\': 0, \'metadata\': 0, \'partnerId\': 0}', '{\'id\': \'cso_ac8a8c8c-8472-11e9-a6a6-966a0a06784e\', \'created\': \'1559396366.7411000\', \'objectType\': \'CrossSaleOffer\', \'charge\': {\'amount\': 1221.0, \'currency\': \'AOA\', \'capture\': 0}, \'template\': \'text_only\', \'title\': \'rtrtr\', \'description\': \'cxvcbv\', \'imageUrl\': \'\', \'companyName\': \'xcvxcvcv\', \'companyLocation\': \'AL\', \'termsAndConditionsUrl\': \'cvbvbbvv\', \'visibleForAllPartners\': 0}'),
('log_421ee6be-8473-11e9-a6a6-966a0a06784e', '1559396617.6939400', 'crosssale_delete', '/api/v1/crosssale/delete', 200, 'None', 'None', '{\'crossSaleOfferId\': \'cso_ac8a8c8c-8472-11e9-a6a6-966a0a06784e\'}', '{\'id\': \'cso_ac8a8c8c-8472-11e9-a6a6-966a0a06784e\'}'),
('log_72cef902-8473-11e9-a6a6-966a0a06784e', '1559396699.3785200', 'crosssale_delete', '/api/v1/crosssale/delete', 200, 'None', 'None', '{\'crossSaleOfferId\': \'cso_8d09e236-8472-11e9-a6a6-966a0a06784e\'}', '{\'id\': \'cso_8d09e236-8472-11e9-a6a6-966a0a06784e\'}'),
('log_bba3dad0-8473-11e9-a6a6-966a0a06784e', '1559396821.5696100', 'crosssale_delete', '/api/v1/crosssale/delete', 200, 'None', 'None', '{\'crossSaleOfferId\': \'cso_a939a5ae-839b-11e9-a6a6-966a0a06784e\'}', '{\'id\': \'cso_a939a5ae-839b-11e9-a6a6-966a0a06784e\'}'),
('log_c25ae472-8473-11e9-a6a6-966a0a06784e', '1559396832.8355500', 'crosssale_delete', '/api/v1/crosssale/delete', 200, 'None', 'None', '{\'crossSaleOfferId\': \'cso_2d76c69a-839b-11e9-a6a6-966a0a06784e\'}', '{\'id\': \'cso_2d76c69a-839b-11e9-a6a6-966a0a06784e\'}'),
('log_f9c674bc-8473-11e9-a6a6-966a0a06784e', '1559396925.8151300', 'crosssale_delete', '/api/v1/crosssale/delete', 200, 'None', 'None', '{\'crossSaleOfferId\': \'cso_d6ae1506-8463-11e9-a6a6-966a0a06784e\'}', '{\'id\': \'cso_d6ae1506-8463-11e9-a6a6-966a0a06784e\'}'),
('log_fcca4ba2-8473-11e9-a6a6-966a0a06784e', '1559396930.8734600', 'crosssale_delete', '/api/v1/crosssale/delete', 200, 'None', 'None', '{\'crossSaleOfferId\': \'cso_e6f48314-846d-11e9-a6a6-966a0a06784e\'}', '{\'id\': \'cso_e6f48314-846d-11e9-a6a6-966a0a06784e\'}'),
('log_0cf1f88a-8475-11e9-a6a6-966a0a06784e', '1559397387.4737800', 'crosssale_delete', '/api/v1/crosssale/delete', 200, 'None', 'None', '{\'crossSaleOfferId\': \'cso_973f9d6c-8464-11e9-a6a6-966a0a06784e\'}', '{\'id\': \'cso_973f9d6c-8464-11e9-a6a6-966a0a06784e\'}'),
('log_32190180-8475-11e9-a6a6-966a0a06784e', '1559397449.8052900', 'crosssale_delete', '/api/v1/crosssale/delete', 200, 'None', 'None', '{\'crossSaleOfferId\': \'cso_1af2c39c-839c-11e9-a6a6-966a0a06784e\'}', '{\'id\': \'cso_1af2c39c-839c-11e9-a6a6-966a0a06784e\'}'),
('log_036d678a-8476-11e9-a6a6-966a0a06784e', '1559397801.0023900', 'crosssale_delete', '/api/v1/crosssale/delete', 200, 'None', 'None', '{\'crossSaleOfferId\': \'cso_f1a0445e-7ad3-11e9-a6a6-966a0a06784e\'}', '{\'id\': \'cso_f1a0445e-7ad3-11e9-a6a6-966a0a06784e\'}'),
('log_0fbf2690-8476-11e9-a6a6-966a0a06784e', '1559397821.6705800', 'crosssale_delete', '/api/v1/crosssale/delete', 200, 'None', 'None', '{\'crossSaleOfferId\': \'cso_d54f49f0-839b-11e9-a6a6-966a0a06784e\'}', '{\'id\': \'cso_d54f49f0-839b-11e9-a6a6-966a0a06784e\'}'),
('log_2a63c7e4-8476-11e9-a6a6-966a0a06784e', '1559397866.3703100', 'crosssale_delete', '/api/v1/crosssale/delete', 200, 'None', 'None', '{\'crossSaleOfferId\': \'cso_5aa6a276-839a-11e9-a6a6-966a0a06784e\'}', '{\'id\': \'cso_5aa6a276-839a-11e9-a6a6-966a0a06784e\'}'),
('log_318ff22c-8476-11e9-a6a6-966a0a06784e', '1559397878.4037100', 'crosssale_delete', '/api/v1/crosssale/delete', 200, 'None', 'None', '{\'crossSaleOfferId\': \'cso_0aa35b40-7ad8-11e9-a6a6-966a0a06784e\'}', '{\'id\': \'cso_0aa35b40-7ad8-11e9-a6a6-966a0a06784e\'}'),
('log_e2723d16-8476-11e9-a6a6-966a0a06784e', '1559398175.1657700', 'plan_delete', '/api/v1/plan/delete', 200, 'None', 'None', '{\'plan_id\': \'plan_6046f128-846b-11e9-a6a6-966a0a06784e\'}', '{\'plan_id\': \'plan_6046f128-846b-11e9-a6a6-966a0a06784e\'}'),
('log_f1e0f1c0-8476-11e9-a6a6-966a0a06784e', '1559398201.0571600', 'delete', '/api/v1/customers/delete', 200, 'None', 'None', '{\'customer_id\': \'ebeacde1-846a-11e9-a6a6-966a0a06784e\'}', '{\'id\': \'ebeacde1-846a-11e9-a6a6-966a0a06784e\'}'),
('log_f752917c-8476-11e9-a6a6-966a0a06784e', '1559398210.1903600', 'delete', '/api/v1/customers/delete', 200, 'None', 'None', '{\'customer_id\': \'585352c7-8467-11e9-a6a6-966a0a06784e\'}', '{\'id\': \'585352c7-8467-11e9-a6a6-966a0a06784e\'}'),
('log_07d6c20c-8477-11e9-a6a6-966a0a06784e', '1559398237.9003000', 'delete', '/api/v1/customers/delete', 200, 'None', 'None', '{\'customer_id\': \'fc6d80ff-8465-11e9-a6a6-966a0a06784e\'}', '{\'id\': \'fc6d80ff-8465-11e9-a6a6-966a0a06784e\'}'),
('log_11c00486-8477-11e9-a6a6-966a0a06784e', '1559398254.5283900', 'delete', '/api/v1/customers/delete', 200, 'None', 'None', '{\'customer_id\': \'0440549f-8468-11e9-a6a6-966a0a06784e\'}', '{\'id\': \'0440549f-8468-11e9-a6a6-966a0a06784e\'}'),
('log_147b2926-8477-11e9-a6a6-966a0a06784e', '1559398259.1102900', 'delete', '/api/v1/customers/delete', 200, 'None', 'None', '{\'customer_id\': \'b251b8a9-8458-11e9-a6a6-966a0a06784e\'}', '{\'id\': \'b251b8a9-8458-11e9-a6a6-966a0a06784e\'}'),
('log_26a67fc4-8477-11e9-a6a6-966a0a06784e', '1559398289.5933000', 'delete', '/api/v1/customers/delete', 200, 'None', 'None', '{\'customer_id\': \'9278398b-8458-11e9-a6a6-966a0a06784e\'}', '{\'id\': \'9278398b-8458-11e9-a6a6-966a0a06784e\'}'),
('log_4182232a-8477-11e9-a6a6-966a0a06784e', '1559398334.6536700', 'delete', '/api/v1/customers/delete', 200, 'None', 'None', '{\'customer_id\': \'f7b6410f-8465-11e9-a6a6-966a0a06784e\'}', '{\'id\': \'f7b6410f-8465-11e9-a6a6-966a0a06784e\'}'),
('log_48a0f140-8477-11e9-a6a6-966a0a06784e', '1559398346.5996200', 'charge_refunded', '/api/v1/charge/refund', 200, 'None', 'None', '{\'chargeId\': \'1851aab0-8467-11e9-a6a6-966a0a06784e\', \'amount\': \'10\'}', '{\'id\': \'1851aab0-8467-11e9-a6a6-966a0a06784e\', \'created\': \'1559391393.6032400\', \'objectType\': \'charge\', \'amount\': 233.0, \'currency\': \'ALL\', \'description\': \'xcvc\', \'card\': {\'id\': \'card_1851aab1-8467-11e9-a6a6-966a0a06784e\', \'created\': \'1559391393.6033000\', \'objectType\': \'card\', \'first6\': 402400, \'last4\': 4842, \'fingerprint\': \'d50bb9e92e1ef4124781e0e6046e8be519bfd96461971f621c28fb82\', \'expMonth\': 5, \'expYear\': 2023, \'cardholderName\': \'\', \'customerId\': \'0\', \'brand\': \'Visa\', \'type\': \'type\', \'country\': \'country\'}, \'captured\': 0, \'refunded\': 1, \'refunded_amt\': 10.0, \'disputed\': 0}'),
('log_531f8b5e-8477-11e9-a6a6-966a0a06784e', '1559398364.2064000', 'charge_refunded', '/api/v1/charge/refund', 200, 'None', 'None', '{\'chargeId\': \'1851aab0-8467-11e9-a6a6-966a0a06784e\', \'amount\': \'223\'}', '{\'id\': \'1851aab0-8467-11e9-a6a6-966a0a06784e\', \'created\': \'1559391393.6032400\', \'objectType\': \'charge\', \'amount\': 233.0, \'currency\': \'ALL\', \'description\': \'xcvc\', \'card\': {\'id\': \'card_1851aab1-8467-11e9-a6a6-966a0a06784e\', \'created\': \'1559391393.6033000\', \'objectType\': \'card\', \'first6\': 402400, \'last4\': 4842, \'fingerprint\': \'d50bb9e92e1ef4124781e0e6046e8be519bfd96461971f621c28fb82\', \'expMonth\': 5, \'expYear\': 2023, \'cardholderName\': \'\', \'customerId\': \'0\', \'brand\': \'Visa\', \'type\': \'type\', \'country\': \'country\'}, \'captured\': 0, \'refunded\': 1, \'refunded_amt\': 233.0, \'disputed\': 0}'),
('log_569c6bb2-8477-11e9-a6a6-966a0a06784e', '1559398370.0578900', 'delete', '/api/v1/customers/delete', 200, 'None', 'None', '{\'customer_id\': \'2fd186bb-8458-11e9-a6a6-966a0a06784e\'}', '{\'id\': \'2fd186bb-8458-11e9-a6a6-966a0a06784e\'}'),
('log_60da0120-8477-11e9-a6a6-966a0a06784e', '1559398387.2387400', 'delete', '/api/v1/customers/delete', 200, 'None', 'None', '{\'customer_id\': \'24337a8f-8458-11e9-a6a6-966a0a06784e\'}', '{\'id\': \'24337a8f-8458-11e9-a6a6-966a0a06784e\'}'),
('log_6661eae0-8477-11e9-a6a6-966a0a06784e', '1559398396.5180300', 'charge_refunded', '/api/v1/charge/refund', 200, 'None', 'None', '{\'chargeId\': \'c11d22b0-8457-11e9-a6a6-966a0a06784e\', \'amount\': \'111\'}', '{\'id\': \'c11d22b0-8457-11e9-a6a6-966a0a06784e\', \'created\': \'1559384804.8468000\', \'objectType\': \'charge\', \'amount\': 1234.0, \'currency\': \'AED\', \'description\': \'DFGHSTYSD\', \'card\': {\'id\': \'card_c11d22b1-8457-11e9-a6a6-966a0a06784e\', \'created\': \'1559384804.8468900\', \'objectType\': \'card\', \'first6\': 401200, \'last4\': 7, \'fingerprint\': \'522fd11a5a880b14cbd7f2811c018d75d3e6db828fa3118aa693a6f1\', \'expMonth\': 2, \'expYear\': 2020, \'cardholderName\': \'\', \'customerId\': \'0\', \'brand\': \'Visa\', \'type\': \'type\', \'country\': \'country\'}, \'captured\': 0, \'refunded\': 1, \'refunded_amt\': 111.0, \'disputed\': 0}'),
('log_aae3c904-8477-11e9-a6a6-966a0a06784e', '1559398511.4542200', 'delete', '/api/v1/customers/delete', 200, 'None', 'None', '{\'customer_id\': \'43131f8f-8379-11e9-a6a6-966a0a06784e\'}', '{\'id\': \'43131f8f-8379-11e9-a6a6-966a0a06784e\'}'),
('log_c7cb7760-8477-11e9-a6a6-966a0a06784e', '1559398559.9488200', 'delete', '/api/v1/customers/delete', 200, 'None', 'None', '{\'customer_id\': \'174f1359-8379-11e9-a6a6-966a0a06784e\'}', '{\'id\': \'174f1359-8379-11e9-a6a6-966a0a06784e\'}'),
('log_3226a5da-8478-11e9-a6a6-966a0a06784e', '1559398738.3848500', 'delete', '/api/v1/customers/delete', 200, 'None', 'None', '{\'customer_id\': \'d0b0d117-8378-11e9-a6a6-966a0a06784e\'}', '{\'id\': \'d0b0d117-8378-11e9-a6a6-966a0a06784e\'}'),
('log_4d89a876-8479-11e9-a6a6-966a0a06784e', '1559399213.8289100', 'charge_update', '/api/v1/charge/update', 200, 'None', 'None', '{\'chargeId\': \'1851aab0-8467-11e9-a6a6-966a0a06784e\', \'customerId\': 0, \'description\': \'xcvckhgkih\', \'dispute\': 0, \'fraud_status\': 0, \'fraud_score\': 0, \'sh_name\': 0, \'sh_address1\': 0, \'sh_address2\': 0, \'sh_zip\': 0, \'sh_city\': 0, \'sh_state\': 0, \'sh_country\': 0, \'bil_name\': 0, \'bil_address1\': 0, \'bil_address2\': 0, \'bil_city\': 0, \'bil_state\': 0, \'bil_country\': 0, \'vat\': 0, \'metadata\': 0}', '{\'id\': \'1851aab0-8467-11e9-a6a6-966a0a06784e\', \'created\': \'1559391393.6032400\', \'objectType\': \'charge\', \'amount\': \'233.0\', \'currency\': \'ALL\', \'description\': \'xcvckhgkih\', \'card\': {\'id\': \'card_1851aab1-8467-11e9-a6a6-966a0a06784e\', \'created\': \'1559391393.6033000\', \'objectType\': \'card\', \'first6\': 402400, \'last4\': 4842, \'fingerprint\': \'d50bb9e92e1ef4124781e0e6046e8be519bfd96461971f621c28fb82\', \'expMonth\': 5, \'expYear\': 2023, \'cardholderName\': \'\', \'customerId\': \'0\', \'brand\': \'Visa\', \'type\': \'type\', \'country\': \'country\'}, \'captured\': 0, \'refunded\': 1, \'disputed\': 0, \'refunded_amt\': \'233.0\', \'fraud_status\': None, \'fraud_score\': None}'),
('log_5e41310c-8479-11e9-a6a6-966a0a06784e', '1559399241.8752400', 'delete', '/api/v1/customers/delete', 200, 'None', 'None', '{\'customer_id\': \'50ff7f31-8378-11e9-a6a6-966a0a06784e\'}', '{\'id\': \'50ff7f31-8378-11e9-a6a6-966a0a06784e\'}'),
('log_606dee5c-8479-11e9-a6a6-966a0a06784e', '1559399245.5238900', 'charge_update', '/api/v1/charge/update', 200, 'None', 'None', '{\'chargeId\': \'e0b953f0-82a9-11e9-a6a6-966a0a06784e\', \'customerId\': 0, \'description\': \'Samples\', \'dispute\': 0, \'fraud_status\': 0, \'fraud_score\': 0, \'sh_name\': 0, \'sh_address1\': 0, \'sh_address2\': 0, \'sh_zip\': 0, \'sh_city\': 0, \'sh_state\': 0, \'sh_country\': 0, \'bil_name\': 0, \'bil_address1\': 0, \'bil_address2\': 0, \'bil_city\': 0, \'bil_state\': 0, \'bil_country\': 0, \'vat\': 0, \'metadata\': 0}', '{\'id\': \'e0b953f0-82a9-11e9-a6a6-966a0a06784e\', \'created\': \'1559200174.2859300\', \'objectType\': \'charge\', \'amount\': \'4323.0\', \'currency\': \'GEL\', \'description\': \'Samples\', \'card\': {\'id\': \'card_e0b953f1-82a9-11e9-a6a6-966a0a06784e\', \'created\': \'1559200174.2860400\', \'objectType\': \'card\', \'first6\': 402400, \'last4\': 8684, \'fingerprint\': \'317608417e7ab68b9291b33f8c7e9484ee8c503e7f53c967d067035e\', \'expMonth\': 7, \'expYear\': 2021, \'cardholderName\': \'subhash\', \'customerId\': \'0\', \'brand\': \'Visa\', \'type\': \'type\', \'country\': \'country\'}, \'captured\': 1, \'refunded\': 1, \'disputed\': 0, \'refunded_amt\': \'5617.0\', \'fraud_status\': None, \'fraud_score\': None}'),
('log_6461119c-8479-11e9-a6a6-966a0a06784e', '1559399252.1504800', 'charge_update', '/api/v1/charge/update', 200, 'None', 'None', '{\'chargeId\': \'1851aab0-8467-11e9-a6a6-966a0a06784e\', \'customerId\': 0, \'description\': \'ouyuio\', \'dispute\': 0, \'fraud_status\': 0, \'fraud_score\': 0, \'sh_name\': 0, \'sh_address1\': 0, \'sh_address2\': 0, \'sh_zip\': 0, \'sh_city\': 0, \'sh_state\': 0, \'sh_country\': 0, \'bil_name\': 0, \'bil_address1\': 0, \'bil_address2\': 0, \'bil_city\': 0, \'bil_state\': 0, \'bil_country\': 0, \'vat\': 0, \'metadata\': 0}', '{\'id\': \'1851aab0-8467-11e9-a6a6-966a0a06784e\', \'created\': \'1559391393.6032400\', \'objectType\': \'charge\', \'amount\': \'233.0\', \'currency\': \'ALL\', \'description\': \'ouyuio\', \'card\': {\'id\': \'card_1851aab1-8467-11e9-a6a6-966a0a06784e\', \'created\': \'1559391393.6033000\', \'objectType\': \'card\', \'first6\': 402400, \'last4\': 4842, \'fingerprint\': \'d50bb9e92e1ef4124781e0e6046e8be519bfd96461971f621c28fb82\', \'expMonth\': 5, \'expYear\': 2023, \'cardholderName\': \'\', \'customerId\': \'0\', \'brand\': \'Visa\', \'type\': \'type\', \'country\': \'country\'}, \'captured\': 0, \'refunded\': 1, \'disputed\': 0, \'refunded_amt\': \'233.0\', \'fraud_status\': None, \'fraud_score\': None}'),
('log_6461119f-8479-11e9-a6a6-966a0a06784e', '1559399252.6547700', 'charge_update', '/api/v1/charge/update', 200, 'None', 'None', '{\'chargeId\': \'1851aab0-8467-11e9-a6a6-966a0a06784e\', \'customerId\': 0, \'description\': \'ouyuio\', \'dispute\': 0, \'fraud_status\': 0, \'fraud_score\': 0, \'sh_name\': 0, \'sh_address1\': 0, \'sh_address2\': 0, \'sh_zip\': 0, \'sh_city\': 0, \'sh_state\': 0, \'sh_country\': 0, \'bil_name\': 0, \'bil_address1\': 0, \'bil_address2\': 0, \'bil_city\': 0, \'bil_state\': 0, \'bil_country\': 0, \'vat\': 0, \'metadata\': 0}', '{\'id\': \'1851aab0-8467-11e9-a6a6-966a0a06784e\', \'created\': \'1559391393.6032400\', \'objectType\': \'charge\', \'amount\': \'233.0\', \'currency\': \'ALL\', \'description\': \'ouyuio\', \'card\': {\'id\': \'card_1851aab1-8467-11e9-a6a6-966a0a06784e\', \'created\': \'1559391393.6033000\', \'objectType\': \'card\', \'first6\': 402400, \'last4\': 4842, \'fingerprint\': \'d50bb9e92e1ef4124781e0e6046e8be519bfd96461971f621c28fb82\', \'expMonth\': 5, \'expYear\': 2023, \'cardholderName\': \'\', \'customerId\': \'0\', \'brand\': \'Visa\', \'type\': \'type\', \'country\': \'country\'}, \'captured\': 0, \'refunded\': 1, \'disputed\': 0, \'refunded_amt\': \'233.0\', \'fraud_status\': None, \'fraud_score\': None}'),
('log_646111a2-8479-11e9-a6a6-966a0a06784e', '1559399252.9125800', 'charge_update', '/api/v1/charge/update', 200, 'None', 'None', '{\'chargeId\': \'1851aab0-8467-11e9-a6a6-966a0a06784e\', \'customerId\': 0, \'description\': \'ouyuio\', \'dispute\': 0, \'fraud_status\': 0, \'fraud_score\': 0, \'sh_name\': 0, \'sh_address1\': 0, \'sh_address2\': 0, \'sh_zip\': 0, \'sh_city\': 0, \'sh_state\': 0, \'sh_country\': 0, \'bil_name\': 0, \'bil_address1\': 0, \'bil_address2\': 0, \'bil_city\': 0, \'bil_state\': 0, \'bil_country\': 0, \'vat\': 0, \'metadata\': 0}', '{\'id\': \'1851aab0-8467-11e9-a6a6-966a0a06784e\', \'created\': \'1559391393.6032400\', \'objectType\': \'charge\', \'amount\': \'233.0\', \'currency\': \'ALL\', \'description\': \'ouyuio\', \'card\': {\'id\': \'card_1851aab1-8467-11e9-a6a6-966a0a06784e\', \'created\': \'1559391393.6033000\', \'objectType\': \'card\', \'first6\': 402400, \'last4\': 4842, \'fingerprint\': \'d50bb9e92e1ef4124781e0e6046e8be519bfd96461971f621c28fb82\', \'expMonth\': 5, \'expYear\': 2023, \'cardholderName\': \'\', \'customerId\': \'0\', \'brand\': \'Visa\', \'type\': \'type\', \'country\': \'country\'}, \'captured\': 0, \'refunded\': 1, \'disputed\': 0, \'refunded_amt\': \'233.0\', \'fraud_status\': None, \'fraud_score\': None}'),
('log_67f04b8e-8479-11e9-a6a6-966a0a06784e', '1559399258.1223100', 'charge_update', '/api/v1/charge/update', 200, 'None', 'None', '{\'chargeId\': \'1851aab0-8467-11e9-a6a6-966a0a06784e\', \'customerId\': 0, \'description\': \'Praveen\', \'dispute\': 0, \'fraud_status\': 0, \'fraud_score\': 0, \'sh_name\': 0, \'sh_address1\': 0, \'sh_address2\': 0, \'sh_zip\': 0, \'sh_city\': 0, \'sh_state\': 0, \'sh_country\': 0, \'bil_name\': 0, \'bil_address1\': 0, \'bil_address2\': 0, \'bil_city\': 0, \'bil_state\': 0, \'bil_country\': 0, \'vat\': 0, \'metadata\': 0}', '{\'id\': \'1851aab0-8467-11e9-a6a6-966a0a06784e\', \'created\': \'1559391393.6032400\', \'objectType\': \'charge\', \'amount\': \'233.0\', \'currency\': \'ALL\', \'description\': \'Praveen\', \'card\': {\'id\': \'card_1851aab1-8467-11e9-a6a6-966a0a06784e\', \'created\': \'1559391393.6033000\', \'objectType\': \'card\', \'first6\': 402400, \'last4\': 4842, \'fingerprint\': \'d50bb9e92e1ef4124781e0e6046e8be519bfd96461971f621c28fb82\', \'expMonth\': 5, \'expYear\': 2023, \'cardholderName\': \'\', \'customerId\': \'0\', \'brand\': \'Visa\', \'type\': \'type\', \'country\': \'country\'}, \'captured\': 0, \'refunded\': 1, \'disputed\': 0, \'refunded_amt\': \'233.0\', \'fraud_status\': None, \'fraud_score\': None}'),
('log_79aa2e94-8479-11e9-a6a6-966a0a06784e', '1559399287.8618500', 'charge_update', '/api/v1/charge/update', 200, 'None', 'None', '{\'chargeId\': \'1851aab0-8467-11e9-a6a6-966a0a06784e\', \'customerId\': 0, \'description\': \'Praveen Dagdi\', \'dispute\': 0, \'fraud_status\': 0, \'fraud_score\': 0, \'sh_name\': 0, \'sh_address1\': 0, \'sh_address2\': 0, \'sh_zip\': 0, \'sh_city\': 0, \'sh_state\': 0, \'sh_country\': 0, \'bil_name\': 0, \'bil_address1\': 0, \'bil_address2\': 0, \'bil_city\': 0, \'bil_state\': 0, \'bil_country\': 0, \'vat\': 0, \'metadata\': 0}', '{\'id\': \'1851aab0-8467-11e9-a6a6-966a0a06784e\', \'created\': \'1559391393.6032400\', \'objectType\': \'charge\', \'amount\': \'233.0\', \'currency\': \'ALL\', \'description\': \'Praveen Dagdi\', \'card\': {\'id\': \'card_1851aab1-8467-11e9-a6a6-966a0a06784e\', \'created\': \'1559391393.6033000\', \'objectType\': \'card\', \'first6\': 402400, \'last4\': 4842, \'fingerprint\': \'d50bb9e92e1ef4124781e0e6046e8be519bfd96461971f621c28fb82\', \'expMonth\': 5, \'expYear\': 2023, \'cardholderName\': \'\', \'customerId\': \'0\', \'brand\': \'Visa\', \'type\': \'type\', \'country\': \'country\'}, \'captured\': 0, \'refunded\': 1, \'disputed\': 0, \'refunded_amt\': \'233.0\', \'fraud_status\': None, \'fraud_score\': None}'),
('log_834d426a-8479-11e9-a6a6-966a0a06784e', '1559399304.0300900', 'charge_update', '/api/v1/charge/update', 200, 'None', 'None', '{\'chargeId\': \'1851aab0-8467-11e9-a6a6-966a0a06784e\', \'customerId\': 0, \'description\': \'Praveen Dagdi\', \'dispute\': 0, \'fraud_status\': 0, \'fraud_score\': 0, \'sh_name\': 0, \'sh_address1\': 0, \'sh_address2\': 0, \'sh_zip\': 0, \'sh_city\': 0, \'sh_state\': 0, \'sh_country\': 0, \'bil_name\': 0, \'bil_address1\': 0, \'bil_address2\': 0, \'bil_city\': 0, \'bil_state\': 0, \'bil_country\': 0, \'vat\': 0, \'metadata\': 0}', '{\'id\': \'1851aab0-8467-11e9-a6a6-966a0a06784e\', \'created\': \'1559391393.6032400\', \'objectType\': \'charge\', \'amount\': \'233.0\', \'currency\': \'ALL\', \'description\': \'Praveen Dagdi\', \'card\': {\'id\': \'card_1851aab1-8467-11e9-a6a6-966a0a06784e\', \'created\': \'1559391393.6033000\', \'objectType\': \'card\', \'first6\': 402400, \'last4\': 4842, \'fingerprint\': \'d50bb9e92e1ef4124781e0e6046e8be519bfd96461971f621c28fb82\', \'expMonth\': 5, \'expYear\': 2023, \'cardholderName\': \'\', \'customerId\': \'0\', \'brand\': \'Visa\', \'type\': \'type\', \'country\': \'country\'}, \'captured\': 0, \'refunded\': 1, \'disputed\': 0, \'refunded_amt\': \'233.0\', \'fraud_status\': None, \'fraud_score\': None}'),
('log_834d426d-8479-11e9-a6a6-966a0a06784e', '1559399305.1913700', 'charge_update', '/api/v1/charge/update', 200, 'None', 'None', '{\'chargeId\': \'e0b953f0-82a9-11e9-a6a6-966a0a06784e\', \'customerId\': 0, \'description\': \'Sample\', \'dispute\': 0, \'fraud_status\': 0, \'fraud_score\': 0, \'sh_name\': 0, \'sh_address1\': 0, \'sh_address2\': 0, \'sh_zip\': 0, \'sh_city\': 0, \'sh_state\': 0, \'sh_country\': 0, \'bil_name\': 0, \'bil_address1\': 0, \'bil_address2\': 0, \'bil_city\': 0, \'bil_state\': 0, \'bil_country\': 0, \'vat\': 0, \'metadata\': 0}', '{\'id\': \'e0b953f0-82a9-11e9-a6a6-966a0a06784e\', \'created\': \'1559200174.2859300\', \'objectType\': \'charge\', \'amount\': \'4323.0\', \'currency\': \'GEL\', \'description\': \'Sample\', \'card\': {\'id\': \'card_e0b953f1-82a9-11e9-a6a6-966a0a06784e\', \'created\': \'1559200174.2860400\', \'objectType\': \'card\', \'first6\': 402400, \'last4\': 8684, \'fingerprint\': \'317608417e7ab68b9291b33f8c7e9484ee8c503e7f53c967d067035e\', \'expMonth\': 7, \'expYear\': 2021, \'cardholderName\': \'subhash\', \'customerId\': \'0\', \'brand\': \'Visa\', \'type\': \'type\', \'country\': \'country\'}, \'captured\': 1, \'refunded\': 1, \'disputed\': 0, \'refunded_amt\': \'5617.0\', \'fraud_status\': None, \'fraud_score\': None}'),
('log_88d4483c-8479-11e9-a6a6-966a0a06784e', '1559399313.3035700', 'charge_update', '/api/v1/charge/update', 200, 'None', 'None', '{\'chargeId\': \'1851aab0-8467-11e9-a6a6-966a0a06784e\', \'customerId\': 0, \'description\': \'Praveen\', \'dispute\': 0, \'fraud_status\': 0, \'fraud_score\': 0, \'sh_name\': 0, \'sh_address1\': 0, \'sh_address2\': 0, \'sh_zip\': 0, \'sh_city\': 0, \'sh_state\': 0, \'sh_country\': 0, \'bil_name\': 0, \'bil_address1\': 0, \'bil_address2\': 0, \'bil_city\': 0, \'bil_state\': 0, \'bil_country\': 0, \'vat\': 0, \'metadata\': 0}', '{\'id\': \'1851aab0-8467-11e9-a6a6-966a0a06784e\', \'created\': \'1559391393.6032400\', \'objectType\': \'charge\', \'amount\': \'233.0\', \'currency\': \'ALL\', \'description\': \'Praveen\', \'card\': {\'id\': \'card_1851aab1-8467-11e9-a6a6-966a0a06784e\', \'created\': \'1559391393.6033000\', \'objectType\': \'card\', \'first6\': 402400, \'last4\': 4842, \'fingerprint\': \'d50bb9e92e1ef4124781e0e6046e8be519bfd96461971f621c28fb82\', \'expMonth\': 5, \'expYear\': 2023, \'cardholderName\': \'\', \'customerId\': \'0\', \'brand\': \'Visa\', \'type\': \'type\', \'country\': \'country\'}, \'captured\': 0, \'refunded\': 1, \'disputed\': 0, \'refunded_amt\': \'233.0\', \'fraud_status\': None, \'fraud_score\': None}'),
('log_8e5fa896-8479-11e9-a6a6-966a0a06784e', '1559399322.6055400', 'delete', '/api/v1/customers/delete', 200, 'None', 'None', '{\'customer_id\': \'2b0e3f47-8378-11e9-a6a6-966a0a06784e\'}', '{\'id\': \'2b0e3f47-8378-11e9-a6a6-966a0a06784e\'}'),
('log_c843993d-8479-11e9-a6a6-966a0a06784e', '1559399419.7336200', 'crosssale create', '/api/v1/crosssale/create', 200, 'None', 'None', '{\'amount\': \'12\', \'currency\': \'AFN\', \'capture\': \'true\', \'planId\': 0, \'captureCharges\': \'0\', \'template\': \'image_and_text\', \'title\': \'praveen\', \'description\': \'abhi\', \'imageData\': \'\', \'companyName\': \'tech\', \'companyLocation\': \'BS\', \'termsAndConditionsUrl\': \'hkkjjh\', \'visibleForAllPartners\': 0, \'visibleForPartnerIds\': 0, \'metadata\': 0, \'partnerId\': 0}', '{\'id\': \'cso_c843993a-8479-11e9-a6a6-966a0a06784e\', \'created\': \'1559399419.7294700\', \'objectType\': \'CrossSaleOffer\', \'charge\': {\'amount\': 12.0, \'currency\': \'AFN\', \'capture\': 0}, \'template\': \'image_and_text\', \'title\': \'praveen\', \'description\': \'abhi\', \'imageUrl\': \'\', \'companyName\': \'tech\', \'companyLocation\': \'BS\', \'termsAndConditionsUrl\': \'hkkjjh\', \'visibleForAllPartners\': 0}'),
('log_cdf4cd60-8479-11e9-a6a6-966a0a06784e', '1559399429.2795800', 'delete', '/api/v1/customers/delete', 200, 'None', 'None', '{\'customer_id\': \'0b7fe6d1-8372-11e9-a6a6-966a0a06784e\'}', '{\'id\': \'0b7fe6d1-8372-11e9-a6a6-966a0a06784e\'}'),
('log_d119c626-8479-11e9-a6a6-966a0a06784e', '1559399434.5551400', 'crosssale_delete', '/api/v1/crosssale/delete', 200, 'None', 'None', '{\'crossSaleOfferId\': \'cso_b9778716-7981-11e9-a6a6-966a0a06784e\'}', '{\'id\': \'cso_b9778716-7981-11e9-a6a6-966a0a06784e\'}'),
('log_193ad85a-847a-11e9-a6a6-966a0a06784e', '1559399555.5677300', 'delete', '/api/v1/customers/delete', 200, 'None', 'None', '{\'customer_id\': \'082e6c73-8372-11e9-a6a6-966a0a06784e\'}', '{\'id\': \'082e6c73-8372-11e9-a6a6-966a0a06784e\'}'),
('log_2bdec520-847a-11e9-a6a6-966a0a06784e', '1559399586.8408700', 'delete', '/api/v1/customers/delete', 200, 'None', 'None', '{\'customer_id\': \'b9ff710f-836c-11e9-a6a6-966a0a06784e\'}', '{\'id\': \'b9ff710f-836c-11e9-a6a6-966a0a06784e\'}'),
('log_9ee6a172-85bb-11e9-a6a6-966a0a06784e', '1559537648.2806700', 'update', '/api/v1/customer/update', 200, 'None', 'None', '{\'customer_id\': \'40c9c97b-82da-11e9-a6a6-966a0a06784e\', \'email\': \'agmayank007@gmail.com\', \'description\': \'abhivhfgvujfg\', \'defaultCardId\': 0, \'metadata\': 0, \'card\': 0}', '{\'id\': \'40c9c97b-82da-11e9-a6a6-966a0a06784e\', \'created\': \'1559220951.2961416\', \'objectType\': \'customer\', \'email\': \'agmayank007@gmail.com\', \'description\': \'abhivhfgvujfg\', \'defaultCardId\': \'0\'}'),
('log_ad250760-85bb-11e9-a6a6-966a0a06784e', '1559537672.1776800', 'update', '/api/v1/customer/update', 200, 'None', 'None', '{\'customer_id\': \'40c9c97b-82da-11e9-a6a6-966a0a06784e\', \'email\': \'agmayank007@gmail.com\', \'description\': \'bnkbjhikjh\', \'defaultCardId\': 0, \'metadata\': 0, \'card\': 0}', '{\'id\': \'40c9c97b-82da-11e9-a6a6-966a0a06784e\', \'created\': \'1559220951.2961416\', \'objectType\': \'customer\', \'email\': \'agmayank007@gmail.com\', \'description\': \'bnkbjhikjh\', \'defaultCardId\': \'0\'}'),
('log_e63015ee-85bc-11e9-a6a6-966a0a06784e', '1559538197.3769500', 'delete', '/api/v1/customers/delete', 200, 'None', 'None', '{\'customer_id\': \'012be8a1-8372-11e9-a6a6-966a0a06784e\'}', '{\'id\': \'012be8a1-8372-11e9-a6a6-966a0a06784e\'}'),
('log_4bfce2e4-85bd-11e9-a6a6-966a0a06784e', '1559538368.1690400', 'delete', '/api/v1/customers/delete', 200, 'None', 'None', '{\'customer_id\': \'bd0495e3-82da-11e9-a6a6-966a0a06784e\'}', '{\'id\': \'bd0495e3-82da-11e9-a6a6-966a0a06784e\'}'),
('log_804df5b0-85bd-11e9-a6a6-966a0a06784e', '1559538455.9418500', 'delete', '/api/v1/customers/delete', 200, 'None', 'None', '{\'customer_id\': \'40c9c97b-82da-11e9-a6a6-966a0a06784e\'}', '{\'id\': \'40c9c97b-82da-11e9-a6a6-966a0a06784e\'}'),
('log_df76d9f8-85bd-11e9-a6a6-966a0a06784e', '1559538615.5935200', 'delete', '/api/v1/customers/delete', 200, 'None', 'None', '{\'customer_id\': \'8423c145-82da-11e9-a6a6-966a0a06784e\'}', '{\'id\': \'8423c145-82da-11e9-a6a6-966a0a06784e\'}'),
('log_5cc44904-85be-11e9-a6a6-966a0a06784e', '1559538825.8161900', 'delete', '/api/v1/customers/delete', 200, 'None', 'None', '{\'customer_id\': \'48b4b209-600c-11e9-bcdd-966a0a06784e\'}', '{\'id\': \'48b4b209-600c-11e9-bcdd-966a0a06784e\'}'),
('log_b2020622-85be-11e9-a6a6-966a0a06784e', '1559538968.8270700', 'delete', '/api/v1/customers/delete', 200, 'None', 'None', '{\'customer_id\': \'c4d23541-5f99-11e9-bcdd-966a0a06784e\'}', '{\'id\': \'c4d23541-5f99-11e9-bcdd-966a0a06784e\'}'),
('log_cbc8c6b8-85be-11e9-a6a6-966a0a06784e', '1559539012.0726700', 'delete', '/api/v1/customers/delete', 200, 'None', 'None', '{\'customer_id\': \'b4800df7-836c-11e9-a6a6-966a0a06784e\'}', '{\'id\': \'b4800df7-836c-11e9-a6a6-966a0a06784e\'}'),
('log_1a81765a-85c0-11e9-a6a6-966a0a06784e', '1559539573.6419500', 'update', '/api/v1/customer/update', 200, 'None', 'None', '{\'customer_id\': \'e5a9b691-82d9-11e9-a6a6-966a0a06784e\', \'email\': \'agmayank007@gmail.com\', \'description\': \'vdsdsd\', \'defaultCardId\': 0, \'metadata\': 0, \'card\': 0}', '{\'id\': \'e5a9b691-82d9-11e9-a6a6-966a0a06784e\', \'created\': \'1559220798.4131842\', \'objectType\': \'customer\', \'email\': \'agmayank007@gmail.com\', \'description\': \'vdsdsd\', \'defaultCardId\': \'0\'}'),
('log_42449094-85c2-11e9-a6a6-966a0a06784e', '1559540499.3452500', 'delete', '/api/v1/customers/delete', 200, 'None', 'None', '{\'customer_id\': \'99e40205-836c-11e9-a6a6-966a0a06784e\'}', '{\'id\': \'99e40205-836c-11e9-a6a6-966a0a06784e\'}'),
('log_a0934406-85c2-11e9-a6a6-966a0a06784e', '1559540657.5668300', 'delete', '/api/v1/customers/delete', 200, 'None', 'None', '{\'customer_id\': \'6f3ec879-82da-11e9-a6a6-966a0a06784e\'}', '{\'id\': \'6f3ec879-82da-11e9-a6a6-966a0a06784e\'}'),
('log_4f706922-85c3-11e9-a6a6-966a0a06784e', '1559540950.9397600', 'delete', '/api/v1/customers/delete', 200, 'None', 'None', '{\'customer_id\': \'e25c1ecb-601e-11e9-bcdd-966a0a06784e\'}', '{\'id\': \'e25c1ecb-601e-11e9-bcdd-966a0a06784e\'}'),
('log_61a0952c-85c3-11e9-a6a6-966a0a06784e', '1559540981.4543300', 'delete', '/api/v1/customers/delete', 200, 'None', 'None', '{\'customer_id\': \'11b14df1-5f96-11e9-bcdd-966a0a06784e\'}', '{\'id\': \'11b14df1-5f96-11e9-bcdd-966a0a06784e\'}'),
('log_c06b74d2-85c3-11e9-a6a6-966a0a06784e', '1559541140.4897500', 'delete', '/api/v1/customers/delete', 200, 'None', 'None', '{\'customer_id\': \'8423c14a-82da-11e9-a6a6-966a0a06784e\'}', '{\'id\': \'8423c14a-82da-11e9-a6a6-966a0a06784e\'}'),
('log_dfc13c2c-85c3-11e9-a6a6-966a0a06784e', '1559541193.0612900', 'delete', '/api/v1/customers/delete', 200, 'None', 'None', '{\'customer_id\': \'e5a9b691-82d9-11e9-a6a6-966a0a06784e\'}', '{\'id\': \'e5a9b691-82d9-11e9-a6a6-966a0a06784e\'}'),
('log_c5f4b8fe-85c4-11e9-a6a6-966a0a06784e', '1559541579.2746400', 'delete', '/api/v1/customers/delete', 200, 'None', 'None', '{\'customer_id\': \'f7f7d44d-5f9a-11e9-bcdd-966a0a06784e\'}', '{\'id\': \'f7f7d44d-5f9a-11e9-bcdd-966a0a06784e\'}'),
('log_4fc85b26-85c5-11e9-a6a6-966a0a06784e', '1559541810.5096300', 'delete', '/api/v1/customers/delete', 200, 'None', 'None', '{\'customer_id\': \'0599be79-82da-11e9-a6a6-966a0a06784e\'}', '{\'id\': \'0599be79-82da-11e9-a6a6-966a0a06784e\'}'),
('log_f23ecb24-85c5-11e9-a6a6-966a0a06784e', '1559542083.0765500', 'delete', '/api/v1/customers/delete', 200, 'None', 'None', '{\'customer_id\': \'88a3c801-82d9-11e9-a6a6-966a0a06784e\'}', '{\'id\': \'88a3c801-82d9-11e9-a6a6-966a0a06784e\'}'),
('log_b07ca5e0-85c6-11e9-a6a6-966a0a06784e', '1559542402.2534500', 'post', '/api/v1/customer/create', 200, 'None', 'None', '{\'email\': \'sddff@gmail.com\', \'description\': \'sxxdcdecfevgv\', \'card\': 0, \'metadata\': 0}', '{\'id\': \'b07ca5dd-85c6-11e9-a6a6-966a0a06784e\', \'created\': 1559542402.249083, \'objectType\': \'customer\', \'email\': \'sddff@gmail.com\', \'description\': \'sxxdcdecfevgv\', \'defaultCardId\': 0, \'metadata\': 0}'),
('log_e6c10a4c-85c6-11e9-a6a6-966a0a06784e', '1559542493.2965100', 'post', '/api/v1/customer/create', 200, 'None', 'None', '{\'email\': \'erhee@yuiuile.com\', \'description\': \'ughijlk\', \'card\': 0, \'metadata\': 0}', '{\'id\': \'e6c10a49-85c6-11e9-a6a6-966a0a06784e\', \'created\': 1559542493.2942247, \'objectType\': \'customer\', \'email\': \'erhee@yuiuile.com\', \'description\': \'ughijlk\', \'defaultCardId\': 0, \'metadata\': 0}'),
('log_0e01c3bc-85c7-11e9-a6a6-966a0a06784e', '1559542559.1517900', 'post', '/api/v1/customer/create', 200, 'None', 'None', '{\'email\': \'bcnmbn@gretrgf.com\', \'description\': \'ehtrytyj\', \'card\': 0, \'metadata\': 0}', '{\'id\': \'0e01c3b9-85c7-11e9-a6a6-966a0a06784e\', \'created\': 1559542559.1494951, \'objectType\': \'customer\', \'email\': \'bcnmbn@gretrgf.com\', \'description\': \'ehtrytyj\', \'defaultCardId\': 0, \'metadata\': 0}'),
('log_fbdff99a-85c8-11e9-a6a6-966a0a06784e', '1559543387.7246100', 'post', '/api/v1/customer/create', 200, 'None', 'None', '{\'email\': \'ituyukidf@ituygikh.com\', \'description\': \'utyiui\', \'card\': 0, \'metadata\': 0}', '{\'id\': \'fbdff997-85c8-11e9-a6a6-966a0a06784e\', \'created\': 1559543387.7225292, \'objectType\': \'customer\', \'email\': \'ituyukidf@ituygikh.com\', \'description\': \'utyiui\', \'defaultCardId\': 0, \'metadata\': 0}'),
('log_23c1f6f2-85c9-11e9-a6a6-966a0a06784e', '1559543454.6373000', 'post', '/api/v1/customer/create', 200, 'None', 'None', '{\'email\': \'uoyiuoew@uhij.com\', \'description\': \'tuyiu\', \'card\': 0, \'metadata\': 0}', '{\'id\': \'23c1f6ef-85c9-11e9-a6a6-966a0a06784e\', \'created\': 1559543454.634732, \'objectType\': \'customer\', \'email\': \'uoyiuoew@uhij.com\', \'description\': \'tuyiu\', \'defaultCardId\': 0, \'metadata\': 0}'),
('log_ebdef572-85c9-11e9-a6a6-966a0a06784e', '1559543790.3710600', 'post', '/api/v1/customer/create', 200, 'None', 'None', '{\'email\': \'gfast@gmail.com\', \'description\': \'ertyrewty\', \'card\': 0, \'metadata\': 0}', '{\'id\': \'ebdef56f-85c9-11e9-a6a6-966a0a06784e\', \'created\': 1559543790.369037, \'objectType\': \'customer\', \'email\': \'gfast@gmail.com\', \'description\': \'ertyrewty\', \'defaultCardId\': 0, \'metadata\': 0}'),
('log_953c3b40-85cd-11e9-a6a6-966a0a06784e', '1559545363.0104300', 'post', '/api/v1/customer/create', 200, 'None', 'None', '{\'email\': \'xcv@gmail.com\', \'description\': \'gdfgfdghfd\', \'card\': 0, \'metadata\': 0}', '{\'id\': \'953c3b3d-85cd-11e9-a6a6-966a0a06784e\', \'created\': 1559545363.0055237, \'objectType\': \'customer\', \'email\': \'xcv@gmail.com\', \'description\': \'gdfgfdghfd\', \'defaultCardId\': 0, \'metadata\': 0}'),
('log_bf05ab6e-85cd-11e9-a6a6-966a0a06784e', '1559545433.1145400', 'post', '/api/v1/customer/create', 200, 'None', 'None', '{\'email\': \'xfxxf@gmail.com\', \'description\': \'xcvgcxvbcxvb\', \'card\': 0, \'metadata\': 0}', '{\'id\': \'bf05ab6b-85cd-11e9-a6a6-966a0a06784e\', \'created\': 1559545433.1121802, \'objectType\': \'customer\', \'email\': \'xfxxf@gmail.com\', \'description\': \'xcvgcxvbcxvb\', \'defaultCardId\': 0, \'metadata\': 0}'),
('log_e83d5e64-85cd-11e9-a6a6-966a0a06784e', '1559545502.2659900', 'post', '/api/v1/customer/create', 200, 'None', 'None', '{\'email\': \'fdgbfhfg@gmail.com\', \'description\': \'vbmvbm\', \'card\': 0, \'metadata\': 0}', '{\'id\': \'e83d5e61-85cd-11e9-a6a6-966a0a06784e\', \'created\': 1559545502.2637944, \'objectType\': \'customer\', \'email\': \'fdgbfhfg@gmail.com\', \'description\': \'vbmvbm\', \'defaultCardId\': 0, \'metadata\': 0}'),
('log_4434007e-85ce-11e9-a6a6-966a0a06784e', '1559545656.5549700', 'post', '/api/v1/customer/create', 200, 'None', 'None', '{\'email\': \'fsd@gmail.com\', \'description\': \'vcxvcxbvbcv\', \'card\': 0, \'metadata\': 0}', '{\'id\': \'4434007b-85ce-11e9-a6a6-966a0a06784e\', \'created\': 1559545656.5527976, \'objectType\': \'customer\', \'email\': \'fsd@gmail.com\', \'description\': \'vcxvcxbvbcv\', \'defaultCardId\': 0, \'metadata\': 0}'),
('log_7a41eb86-85ce-11e9-a6a6-966a0a06784e', '1559545747.2435000', 'post', '/api/v1/customer/create', 200, 'None', 'None', '{\'email\': \'vnvbnb@gmail.com\', \'description\': \'trtrrtrr\', \'card\': 0, \'metadata\': 0}', '{\'id\': \'7a41eb83-85ce-11e9-a6a6-966a0a06784e\', \'created\': 1559545747.2409778, \'objectType\': \'customer\', \'email\': \'vnvbnb@gmail.com\', \'description\': \'trtrrtrr\', \'defaultCardId\': 0, \'metadata\': 0}'),
('log_18910fc4-85cf-11e9-a6a6-966a0a06784e', '1559546012.8423600', 'post', '/api/v1/customer/create', 200, 'None', 'None', '{\'email\': \'cvbvcb@gmail.com\', \'description\': \'cvbcnvbn\', \'card\': 0, \'metadata\': 0}', '{\'id\': \'18910fc1-85cf-11e9-a6a6-966a0a06784e\', \'created\': 1559546012.8397675, \'objectType\': \'customer\', \'email\': \'cvbvcb@gmail.com\', \'description\': \'cvbcnvbn\', \'defaultCardId\': 0, \'metadata\': 0}'),
('log_c8be2c1a-85cf-11e9-a6a6-966a0a06784e', '1559546308.4163100', 'post', '/api/v1/customer/create', 200, 'None', 'None', '{\'email\': \'cxbvvcb@gmail.com\', \'description\': \'cvcxvcxb\', \'card\': 0, \'metadata\': 0}', '{\'id\': \'c8be2c17-85cf-11e9-a6a6-966a0a06784e\', \'created\': 1559546308.4142845, \'objectType\': \'customer\', \'email\': \'cxbvvcb@gmail.com\', \'description\': \'cvcxvcxb\', \'defaultCardId\': 0, \'metadata\': 0}'),
('log_ec7a917a-85cf-11e9-a6a6-966a0a06784e', '1559546368.3716700', 'post', '/api/v1/customer/create', 200, 'None', 'None', '{\'email\': \'dfgdf@gmail.com\', \'description\': \'cvbvbcfghf\', \'card\': 0, \'metadata\': 0}', '{\'id\': \'ec7a9177-85cf-11e9-a6a6-966a0a06784e\', \'created\': 1559546368.3692071, \'objectType\': \'customer\', \'email\': \'dfgdf@gmail.com\', \'description\': \'cvbvbcfghf\', \'defaultCardId\': 0, \'metadata\': 0}'),
('log_33be9673-85d2-11e9-a6a6-966a0a06784e', '1559547346.9294600', 'update', '/api/v1/card/create', 200, 'None', 'None', '{\'customerId\': \'ec7a9177-85cf-11e9-a6a6-966a0a06784e\', \'card\': {\'id\': \'card_33be9670-85d2-11e9-a6a6-966a0a06784e\', \'created\': 1559547346.9266684, \'objectType\': \'card\', \'first6\': \'402400\', \'last4\': \'1187\', \'fingerprint\': \'02eff1364cb2018c2a88f48c2d497ca482e634759353e48858b616cc\', \'expMonth\': \'5\', \'expYear\': \'2020\', \'cardholderName\': \'Subhsdh\', \'customerId\': \'ec7a9177-85cf-11e9-a6a6-966a0a06784e\', \'brand\': \'Visa\', \'type\': \'type\', \'country\': \'country\', \'addressLine1\': 0, \'addressLine2\': 0, \'addressCity\': 0, \'addressState\': 0, \'addressZip\': 0, \'addressCountry\': 0, \'ipAddress\': 0, \'email\': 0, \'userAgent\': 0, \'acceptLanguage\': 0}, \'number\': \'4024007114621187\', \'exp_month\': \'5\', \'exp_year\': \'2020\', \'cvc\': \'212\', \'cardholdername\': \'Subhsdh\', \'addressLine1\': 0, \'addressLine2\': 0, \'addressCity\': 0, \'addressState\': 0, \'addressZip\': 0, \'addressCountry\': 0, \'ipAddress\': 0, \'email\': 0, \'userAgent\': 0, \'acceptLanguage\': 0}', '{\'id\': \'card_33be9670-85d2-11e9-a6a6-966a0a06784e\', \'created\': \'1559547346.9266684\', \'objectType\': \'card\', \'first6\': \'402400\', \'last4\': \'1187\', \'fingerprint\': \'02eff1364cb2018c2a88f48c2d497ca482e634759353e48858b616cc\', \'expMonth\': \'5\', \'expYear\': \'2020\', \'cardholderName\': \'Subhsdh\', \'customerId\': \'ec7a9177-85cf-11e9-a6a6-966a0a06784e\', \'brand\': \'Visa\', \'type\': \'type\', \'country\': \'country\'}'),
('log_82892e2d-85d2-11e9-a6a6-966a0a06784e', '1559547479.2659100', 'charge create', '/api/v1/charge/create', 200, 'None', 'None', '{\'amount\': 234.0, \'currency\': \'AUD\', \'description\': \'cfgbfb\', \'customerId\': 0, \'card\': 0, \'number\': \'4024007155502486\', \'exp_month\': \'5\', \'exp_year\': \'2023\', \'cvc\': \'234\', \'cardholdername\': \'\', \'captured\': 0, \'refunded\': 0, \'disputed\': 0, \'sh_name\': \'sddsdsds\', \'sh_address1\': \'\', \'sh_address2\': \'\', \'sh_zip\': \'\', \'sh_city\': \'\', \'sh_state\': \'\', \'sh_country\': \'\', \'bil_name\': 0, \'bil_address1\': 0, \'bil_address2\': 0, \'bil_city\': 0, \'bil_state\': 0, \'bil_country\': 0, \'vat\': 0, \'metadata\': 0}', '{\'id\': \'82892e29-85d2-11e9-a6a6-966a0a06784e\', \'created\': 1559547479.2616482, \'objectType\': \'charge\', \'amount\': 234.0, \'currency\': \'AUD\', \'description\': \'cfgbfb\', \'card\': {\'id\': \'card_82892e2a-85d2-11e9-a6a6-966a0a06784e\', \'created\': 1559547479.261693, \'objectType\': \'card\', \'first6\': \'402400\', \'last4\': \'2486\', \'fingerprint\': \'3ab88ef8a417cd29b05431bfac1180db0b8224fdc06cdb82e4043ff3\', \'expMonth\': \'5\', \'expYear\': \'2023\', \'cardholderName\': \'\', \'customerId\': 0, \'brand\': \'Visa\', \'type\': \'type\', \'country\': \'country\'}, \'captured\': 0, \'refunded\': 0, \'disputed\': 0}'),
('log_fd08a228-85d6-11e9-a6a6-966a0a06784e', '1559549402.6298400', 'charge create', '/api/v1/charge/create', 200, 'None', 'None', '{\'amount\': 1222123324.0, \'currency\': \'AED\', \'description\': \'xzcvxzvcx\', \'customerId\': 0, \'card\': 0, \'number\': \'4024007118468684\', \'exp_month\': \'2\', \'exp_year\': \'2021\', \'cvc\': \'344\', \'cardholdername\': \'xcvxcvxcv\', \'captured\': 1, \'refunded\': 0, \'disputed\': 0, \'sh_name\': \'sddsdsds\', \'sh_address1\': \'jailhata\', \'sh_address2\': \'jailhata\', \'sh_zip\': \'822101\', \'sh_city\': \'Ranchi\', \'sh_state\': \'Jharkhand\', \'sh_country\': \'GR\', \'bil_name\': 0, \'bil_address1\': 0, \'bil_address2\': 0, \'bil_city\': 0, \'bil_state\': 0, \'bil_country\': 0, \'vat\': 0, \'metadata\': 0}', '{\'id\': \'fd08a224-85d6-11e9-a6a6-966a0a06784e\', \'created\': 1559549402.6229272, \'objectType\': \'charge\', \'amount\': 1222123324.0, \'currency\': \'AED\', \'description\': \'xzcvxzvcx\', \'card\': {\'id\': \'card_fd08a225-85d6-11e9-a6a6-966a0a06784e\', \'created\': 1559549402.6230073, \'objectType\': \'card\', \'first6\': \'402400\', \'last4\': \'8684\', \'fingerprint\': \'317608417e7ab68b9291b33f8c7e9484ee8c503e7f53c967d067035e\', \'expMonth\': \'2\', \'expYear\': \'2021\', \'cardholderName\': \'xcvxcvxcv\', \'customerId\': 0, \'brand\': \'Visa\', \'type\': \'type\', \'country\': \'country\'}, \'captured\': 1, \'refunded\': 0, \'disputed\': 0}'),
('log_23a2dbf4-85d9-11e9-a6a6-966a0a06784e', '1559550326.3824900', 'charge create', '/api/v1/charge/create', 200, 'None', 'None', '{\'amount\': 4355.0, \'currency\': \'EUR\', \'description\': \'dfgdf\', \'customerId\': 0, \'card\': 0, \'number\': \'4024007155502486\', \'exp_month\': \'1\', \'exp_year\': \'2024\', \'cvc\': \'454\', \'cardholdername\': \'dfgfgf\', \'captured\': 1, \'refunded\': 0, \'disputed\': 0, \'sh_name\': \'sddsdsds\', \'sh_address1\': \'WEFRASER\', \'sh_address2\': \'DGHSDFYH\', \'sh_zip\': \'445745\', \'sh_city\': \'DFUYDFU\', \'sh_state\': \'FGHDFH\', \'sh_country\': \'AX\', \'bil_name\': 0, \'bil_address1\': 0, \'bil_address2\': 0, \'bil_city\': 0, \'bil_state\': 0, \'bil_country\': 0, \'vat\': 0, \'metadata\': 0}', '{\'id\': \'23a2dbf0-85d9-11e9-a6a6-966a0a06784e\', \'created\': 1559550326.3785934, \'objectType\': \'charge\', \'amount\': 4355.0, \'currency\': \'EUR\', \'description\': \'dfgdf\', \'card\': {\'id\': \'card_23a2dbf1-85d9-11e9-a6a6-966a0a06784e\', \'created\': 1559550326.3786473, \'objectType\': \'card\', \'first6\': \'402400\', \'last4\': \'2486\', \'fingerprint\': \'3ab88ef8a417cd29b05431bfac1180db0b8224fdc06cdb82e4043ff3\', \'expMonth\': \'1\', \'expYear\': \'2024\', \'cardholderName\': \'dfgfgf\', \'customerId\': 0, \'brand\': \'Visa\', \'type\': \'type\', \'country\': \'country\'}, \'captured\': 1, \'refunded\': 0, \'disputed\': 0}'),
('log_60079b7a-85d9-11e9-a6a6-966a0a06784e', '1559550427.7040700', 'post', '/api/v1/customer/create', 200, 'None', 'None', '{\'email\': \'aks6dgheh382@gmail.com\', \'description\': \'gsdgsdfgs\', \'card\': 0, \'metadata\': 0}', '{\'id\': \'60079b77-85d9-11e9-a6a6-966a0a06784e\', \'created\': 1559550427.702078, \'objectType\': \'customer\', \'email\': \'aks6dgheh382@gmail.com\', \'description\': \'gsdgsdfgs\', \'defaultCardId\': 0, \'metadata\': 0}'),
('log_65ab7c0c-85d9-11e9-a6a6-966a0a06784e', '1559550437.1647100', 'charge_update', '/api/v1/charge/update', 200, 'None', 'None', '{\'chargeId\': \'23a2dbf0-85d9-11e9-a6a6-966a0a06784e\', \'customerId\': 0, \'description\': \'dfgdfsdfsdf\', \'dispute\': 0, \'fraud_status\': 0, \'fraud_score\': 0, \'sh_name\': 0, \'sh_address1\': 0, \'sh_address2\': 0, \'sh_zip\': 0, \'sh_city\': 0, \'sh_state\': 0, \'sh_country\': 0, \'bil_name\': 0, \'bil_address1\': 0, \'bil_address2\': 0, \'bil_city\': 0, \'bil_state\': 0, \'bil_country\': 0, \'vat\': 0, \'metadata\': 0}', '{\'id\': \'23a2dbf0-85d9-11e9-a6a6-966a0a06784e\', \'created\': \'1559550326.3785900\', \'objectType\': \'charge\', \'amount\': \'4355.0\', \'currency\': \'EUR\', \'description\': \'dfgdfsdfsdf\', \'card\': {\'id\': \'card_23a2dbf1-85d9-11e9-a6a6-966a0a06784e\', \'created\': \'1559550326.3786500\', \'objectType\': \'card\', \'first6\': 402400, \'last4\': 2486, \'fingerprint\': \'3ab88ef8a417cd29b05431bfac1180db0b8224fdc06cdb82e4043ff3\', \'expMonth\': 1, \'expYear\': 2024, \'cardholderName\': \'dfgfgf\', \'customerId\': \'0\', \'brand\': \'Visa\', \'type\': \'type\', \'country\': \'country\'}, \'captured\': 1, \'refunded\': 0, \'disputed\': 0, \'refunded_amt\': \'None\', \'fraud_status\': None, \'fraud_score\': None}'),
('log_b0c10aff-85d9-11e9-a6a6-966a0a06784e', '1559550563.1387100', 'update', '/api/v1/card/create', 200, 'None', 'None', '{\'customerId\': \'60079b77-85d9-11e9-a6a6-966a0a06784e\', \'card\': {\'id\': \'card_b0c10afc-85d9-11e9-a6a6-966a0a06784e\', \'created\': 1559550563.1351616, \'objectType\': \'card\', \'first6\': \'401200\', \'last4\': \'0007\', \'fingerprint\': \'522fd11a5a880b14cbd7f2811c018d75d3e6db828fa3118aa693a6f1\', \'expMonth\': \'5\', \'expYear\': \'2021\', \'cardholderName\': \'\', \'customerId\': \'60079b77-85d9-11e9-a6a6-966a0a06784e\', \'brand\': \'Visa\', \'type\': \'type\', \'country\': \'country\', \'addressLine1\': 0, \'addressLine2\': 0, \'addressCity\': 0, \'addressState\': 0, \'addressZip\': 0, \'addressCountry\': 0, \'ipAddress\': 0, \'email\': 0, \'userAgent\': 0, \'acceptLanguage\': 0}, \'number\': \'4012000100000007\', \'exp_month\': \'5\', \'exp_year\': \'2021\', \'cvc\': \'345\', \'cardholdername\': \'\', \'addressLine1\': 0, \'addressLine2\': 0, \'addressCity\': 0, \'addressState\': 0, \'addressZip\': 0, \'addressCountry\': 0, \'ipAddress\': 0, \'email\': 0, \'userAgent\': 0, \'acceptLanguage\': 0}', '{\'id\': \'card_b0c10afc-85d9-11e9-a6a6-966a0a06784e\', \'created\': \'1559550563.1351616\', \'objectType\': \'card\', \'first6\': \'401200\', \'last4\': \'0007\', \'fingerprint\': \'522fd11a5a880b14cbd7f2811c018d75d3e6db828fa3118aa693a6f1\', \'expMonth\': \'5\', \'expYear\': \'2021\', \'cardholderName\': \'\', \'customerId\': \'60079b77-85d9-11e9-a6a6-966a0a06784e\', \'brand\': \'Visa\', \'type\': \'type\', \'country\': \'country\'}');
INSERT INTO `log` (`log`, `created`, `method`, `url`, `status`, `ip_address`, `source`, `request_body`, `response_body`) VALUES
('log_18138bbe-85da-11e9-a6a6-966a0a06784e', '1559550736.4811500', 'charge_update', '/api/v1/charge/update', 200, 'None', 'None', '{\'chargeId\': \'23a2dbf0-85d9-11e9-a6a6-966a0a06784e\', \'customerId\': 0, \'description\': \'dfgdfs\', \'dispute\': 0, \'fraud_status\': 0, \'fraud_score\': 0, \'sh_name\': 0, \'sh_address1\': 0, \'sh_address2\': 0, \'sh_zip\': 0, \'sh_city\': 0, \'sh_state\': 0, \'sh_country\': 0, \'bil_name\': 0, \'bil_address1\': 0, \'bil_address2\': 0, \'bil_city\': 0, \'bil_state\': 0, \'bil_country\': 0, \'vat\': 0, \'metadata\': 0}', '{\'id\': \'23a2dbf0-85d9-11e9-a6a6-966a0a06784e\', \'created\': \'1559550326.3785900\', \'objectType\': \'charge\', \'amount\': \'4355.0\', \'currency\': \'EUR\', \'description\': \'dfgdfs\', \'card\': {\'id\': \'card_23a2dbf1-85d9-11e9-a6a6-966a0a06784e\', \'created\': \'1559550326.3786500\', \'objectType\': \'card\', \'first6\': 402400, \'last4\': 2486, \'fingerprint\': \'3ab88ef8a417cd29b05431bfac1180db0b8224fdc06cdb82e4043ff3\', \'expMonth\': 1, \'expYear\': 2024, \'cardholderName\': \'dfgfgf\', \'customerId\': \'0\', \'brand\': \'Visa\', \'type\': \'type\', \'country\': \'country\'}, \'captured\': 1, \'refunded\': 0, \'disputed\': 0, \'refunded_amt\': \'None\', \'fraud_status\': None, \'fraud_score\': None}'),
('log_22fcd10c-85da-11e9-a6a6-966a0a06784e', '1559550754.7871200', 'charge_update', '/api/v1/charge/update', 200, 'None', 'None', '{\'chargeId\': \'23a2dbf0-85d9-11e9-a6a6-966a0a06784e\', \'customerId\': 0, \'description\': \'dfgdfsvjhgj\', \'dispute\': 0, \'fraud_status\': 0, \'fraud_score\': 0, \'sh_name\': 0, \'sh_address1\': 0, \'sh_address2\': 0, \'sh_zip\': 0, \'sh_city\': 0, \'sh_state\': 0, \'sh_country\': 0, \'bil_name\': 0, \'bil_address1\': 0, \'bil_address2\': 0, \'bil_city\': 0, \'bil_state\': 0, \'bil_country\': 0, \'vat\': 0, \'metadata\': 0}', '{\'id\': \'23a2dbf0-85d9-11e9-a6a6-966a0a06784e\', \'created\': \'1559550326.3785900\', \'objectType\': \'charge\', \'amount\': \'4355.0\', \'currency\': \'EUR\', \'description\': \'dfgdfsvjhgj\', \'card\': {\'id\': \'card_23a2dbf1-85d9-11e9-a6a6-966a0a06784e\', \'created\': \'1559550326.3786500\', \'objectType\': \'card\', \'first6\': 402400, \'last4\': 2486, \'fingerprint\': \'3ab88ef8a417cd29b05431bfac1180db0b8224fdc06cdb82e4043ff3\', \'expMonth\': 1, \'expYear\': 2024, \'cardholderName\': \'dfgfgf\', \'customerId\': \'0\', \'brand\': \'Visa\', \'type\': \'type\', \'country\': \'country\'}, \'captured\': 1, \'refunded\': 0, \'disputed\': 0, \'refunded_amt\': \'None\', \'fraud_status\': None, \'fraud_score\': None}'),
('log_29cd6385-85da-11e9-a6a6-966a0a06784e', '1559550766.2223800', 'update', '/api/v1/card/create', 200, 'None', 'None', '{\'customerId\': \'60079b77-85d9-11e9-a6a6-966a0a06784e\', \'card\': {\'id\': \'card_29cd6382-85da-11e9-a6a6-966a0a06784e\', \'created\': 1559550766.220258, \'objectType\': \'card\', \'first6\': \'401200\', \'last4\': \'0007\', \'fingerprint\': \'522fd11a5a880b14cbd7f2811c018d75d3e6db828fa3118aa693a6f1\', \'expMonth\': \'9\', \'expYear\': \'2026\', \'cardholderName\': \'\', \'customerId\': \'60079b77-85d9-11e9-a6a6-966a0a06784e\', \'brand\': \'Visa\', \'type\': \'type\', \'country\': \'country\', \'addressLine1\': 0, \'addressLine2\': 0, \'addressCity\': 0, \'addressState\': 0, \'addressZip\': 0, \'addressCountry\': 0, \'ipAddress\': 0, \'email\': 0, \'userAgent\': 0, \'acceptLanguage\': 0}, \'number\': \'4012000100000007\', \'exp_month\': \'9\', \'exp_year\': \'2026\', \'cvc\': \'233\', \'cardholdername\': \'\', \'addressLine1\': 0, \'addressLine2\': 0, \'addressCity\': 0, \'addressState\': 0, \'addressZip\': 0, \'addressCountry\': 0, \'ipAddress\': 0, \'email\': 0, \'userAgent\': 0, \'acceptLanguage\': 0}', '{\'id\': \'card_29cd6382-85da-11e9-a6a6-966a0a06784e\', \'created\': \'1559550766.220258\', \'objectType\': \'card\', \'first6\': \'401200\', \'last4\': \'0007\', \'fingerprint\': \'522fd11a5a880b14cbd7f2811c018d75d3e6db828fa3118aa693a6f1\', \'expMonth\': \'9\', \'expYear\': \'2026\', \'cardholderName\': \'\', \'customerId\': \'60079b77-85d9-11e9-a6a6-966a0a06784e\', \'brand\': \'Visa\', \'type\': \'type\', \'country\': \'country\'}'),
('log_2f86fc90-85da-11e9-a6a6-966a0a06784e', '1559550775.8252800', 'charge_update', '/api/v1/charge/update', 200, 'None', 'None', '{\'chargeId\': \'23a2dbf0-85d9-11e9-a6a6-966a0a06784e\', \'customerId\': 0, \'description\': \'dfgdfs\', \'dispute\': 0, \'fraud_status\': 0, \'fraud_score\': 0, \'sh_name\': 0, \'sh_address1\': 0, \'sh_address2\': 0, \'sh_zip\': 0, \'sh_city\': 0, \'sh_state\': 0, \'sh_country\': 0, \'bil_name\': 0, \'bil_address1\': 0, \'bil_address2\': 0, \'bil_city\': 0, \'bil_state\': 0, \'bil_country\': 0, \'vat\': 0, \'metadata\': 0}', '{\'id\': \'23a2dbf0-85d9-11e9-a6a6-966a0a06784e\', \'created\': \'1559550326.3785900\', \'objectType\': \'charge\', \'amount\': \'4355.0\', \'currency\': \'EUR\', \'description\': \'dfgdfs\', \'card\': {\'id\': \'card_23a2dbf1-85d9-11e9-a6a6-966a0a06784e\', \'created\': \'1559550326.3786500\', \'objectType\': \'card\', \'first6\': 402400, \'last4\': 2486, \'fingerprint\': \'3ab88ef8a417cd29b05431bfac1180db0b8224fdc06cdb82e4043ff3\', \'expMonth\': 1, \'expYear\': 2024, \'cardholderName\': \'dfgfgf\', \'customerId\': \'0\', \'brand\': \'Visa\', \'type\': \'type\', \'country\': \'country\'}, \'captured\': 1, \'refunded\': 0, \'disputed\': 0, \'refunded_amt\': \'None\', \'fraud_status\': None, \'fraud_score\': None}'),
('log_34c2d919-85da-11e9-a6a6-966a0a06784e', '1559550784.6086500', 'update', '/api/v1/card/create', 200, 'None', 'None', '{\'customerId\': \'60079b77-85d9-11e9-a6a6-966a0a06784e\', \'card\': {\'id\': \'card_34c2d916-85da-11e9-a6a6-966a0a06784e\', \'created\': 1559550784.6061218, \'objectType\': \'card\', \'first6\': \'401200\', \'last4\': \'0007\', \'fingerprint\': \'522fd11a5a880b14cbd7f2811c018d75d3e6db828fa3118aa693a6f1\', \'expMonth\': \'4\', \'expYear\': \'2028\', \'cardholderName\': \'\', \'customerId\': \'60079b77-85d9-11e9-a6a6-966a0a06784e\', \'brand\': \'Visa\', \'type\': \'type\', \'country\': \'country\', \'addressLine1\': 0, \'addressLine2\': 0, \'addressCity\': 0, \'addressState\': 0, \'addressZip\': 0, \'addressCountry\': 0, \'ipAddress\': 0, \'email\': 0, \'userAgent\': 0, \'acceptLanguage\': 0}, \'number\': \'4012000100000007\', \'exp_month\': \'4\', \'exp_year\': \'2028\', \'cvc\': \'455\', \'cardholdername\': \'\', \'addressLine1\': 0, \'addressLine2\': 0, \'addressCity\': 0, \'addressState\': 0, \'addressZip\': 0, \'addressCountry\': 0, \'ipAddress\': 0, \'email\': 0, \'userAgent\': 0, \'acceptLanguage\': 0}', '{\'id\': \'card_34c2d916-85da-11e9-a6a6-966a0a06784e\', \'created\': \'1559550784.6061218\', \'objectType\': \'card\', \'first6\': \'401200\', \'last4\': \'0007\', \'fingerprint\': \'522fd11a5a880b14cbd7f2811c018d75d3e6db828fa3118aa693a6f1\', \'expMonth\': \'4\', \'expYear\': \'2028\', \'cardholderName\': \'\', \'customerId\': \'60079b77-85d9-11e9-a6a6-966a0a06784e\', \'brand\': \'Visa\', \'type\': \'type\', \'country\': \'country\'}'),
('log_3fb2991c-85da-11e9-a6a6-966a0a06784e', '1559550802.9546400', 'charge_update', '/api/v1/charge/update', 200, 'None', 'None', '{\'chargeId\': \'23a2dbf0-85d9-11e9-a6a6-966a0a06784e\', \'customerId\': 0, \'description\': \'dfgdfsdsf\', \'dispute\': 0, \'fraud_status\': 0, \'fraud_score\': 0, \'sh_name\': 0, \'sh_address1\': 0, \'sh_address2\': 0, \'sh_zip\': 0, \'sh_city\': 0, \'sh_state\': 0, \'sh_country\': 0, \'bil_name\': 0, \'bil_address1\': 0, \'bil_address2\': 0, \'bil_city\': 0, \'bil_state\': 0, \'bil_country\': 0, \'vat\': 0, \'metadata\': 0}', '{\'id\': \'23a2dbf0-85d9-11e9-a6a6-966a0a06784e\', \'created\': \'1559550326.3785900\', \'objectType\': \'charge\', \'amount\': \'4355.0\', \'currency\': \'EUR\', \'description\': \'dfgdfsdsf\', \'card\': {\'id\': \'card_23a2dbf1-85d9-11e9-a6a6-966a0a06784e\', \'created\': \'1559550326.3786500\', \'objectType\': \'card\', \'first6\': 402400, \'last4\': 2486, \'fingerprint\': \'3ab88ef8a417cd29b05431bfac1180db0b8224fdc06cdb82e4043ff3\', \'expMonth\': 1, \'expYear\': 2024, \'cardholderName\': \'dfgfgf\', \'customerId\': \'0\', \'brand\': \'Visa\', \'type\': \'type\', \'country\': \'country\'}, \'captured\': 1, \'refunded\': 0, \'disputed\': 0, \'refunded_amt\': \'None\', \'fraud_status\': None, \'fraud_score\': None}'),
('log_64758a66-85df-11e9-a6a6-966a0a06784e', '1559553012.1140500', 'charge_update', '/api/v1/charge/update', 200, 'None', 'None', '{\'chargeId\': \'23a2dbf0-85d9-11e9-a6a6-966a0a06784e\', \'customerId\': 0, \'description\': \'dfgdfsdsfsfd\', \'dispute\': 0, \'fraud_status\': 0, \'fraud_score\': 0, \'sh_name\': 0, \'sh_address1\': 0, \'sh_address2\': 0, \'sh_zip\': 0, \'sh_city\': 0, \'sh_state\': 0, \'sh_country\': 0, \'bil_name\': 0, \'bil_address1\': 0, \'bil_address2\': 0, \'bil_city\': 0, \'bil_state\': 0, \'bil_country\': 0, \'vat\': 0, \'metadata\': 0}', '{\'id\': \'23a2dbf0-85d9-11e9-a6a6-966a0a06784e\', \'created\': \'1559550326.3785900\', \'objectType\': \'charge\', \'amount\': \'4355.0\', \'currency\': \'EUR\', \'description\': \'dfgdfsdsfsfd\', \'card\': {\'id\': \'card_23a2dbf1-85d9-11e9-a6a6-966a0a06784e\', \'created\': \'1559550326.3786500\', \'objectType\': \'card\', \'first6\': 402400, \'last4\': 2486, \'fingerprint\': \'3ab88ef8a417cd29b05431bfac1180db0b8224fdc06cdb82e4043ff3\', \'expMonth\': 1, \'expYear\': 2024, \'cardholderName\': \'dfgfgf\', \'customerId\': \'0\', \'brand\': \'Visa\', \'type\': \'type\', \'country\': \'country\'}, \'captured\': 1, \'refunded\': 0, \'disputed\': 0, \'refunded_amt\': \'None\', \'fraud_status\': None, \'fraud_score\': None}'),
('log_7928b4d8-85df-11e9-a6a6-966a0a06784e', '1559553046.8424500', 'charge_update', '/api/v1/charge/update', 200, 'None', 'None', '{\'chargeId\': \'23a2dbf0-85d9-11e9-a6a6-966a0a06784e\', \'customerId\': 0, \'description\': \'dfgdfsdsfsfdqwe\', \'dispute\': 0, \'fraud_status\': 0, \'fraud_score\': 0, \'sh_name\': 0, \'sh_address1\': 0, \'sh_address2\': 0, \'sh_zip\': 0, \'sh_city\': 0, \'sh_state\': 0, \'sh_country\': 0, \'bil_name\': 0, \'bil_address1\': 0, \'bil_address2\': 0, \'bil_city\': 0, \'bil_state\': 0, \'bil_country\': 0, \'vat\': 0, \'metadata\': 0}', '{\'id\': \'23a2dbf0-85d9-11e9-a6a6-966a0a06784e\', \'created\': \'1559550326.3785900\', \'objectType\': \'charge\', \'amount\': \'4355.0\', \'currency\': \'EUR\', \'description\': \'dfgdfsdsfsfdqwe\', \'card\': {\'id\': \'card_23a2dbf1-85d9-11e9-a6a6-966a0a06784e\', \'created\': \'1559550326.3786500\', \'objectType\': \'card\', \'first6\': 402400, \'last4\': 2486, \'fingerprint\': \'3ab88ef8a417cd29b05431bfac1180db0b8224fdc06cdb82e4043ff3\', \'expMonth\': 1, \'expYear\': 2024, \'cardholderName\': \'dfgfgf\', \'customerId\': \'0\', \'brand\': \'Visa\', \'type\': \'type\', \'country\': \'country\'}, \'captured\': 1, \'refunded\': 0, \'disputed\': 0, \'refunded_amt\': \'None\', \'fraud_status\': None, \'fraud_score\': None}'),
('log_a97066cc-85df-11e9-a6a6-966a0a06784e', '1559553127.8429800', 'charge_update', '/api/v1/charge/update', 200, 'None', 'None', '{\'chargeId\': \'23a2dbf0-85d9-11e9-a6a6-966a0a06784e\', \'customerId\': 0, \'description\': \'zfsdf\', \'dispute\': 0, \'fraud_status\': 0, \'fraud_score\': 0, \'sh_name\': 0, \'sh_address1\': 0, \'sh_address2\': 0, \'sh_zip\': 0, \'sh_city\': 0, \'sh_state\': 0, \'sh_country\': 0, \'bil_name\': 0, \'bil_address1\': 0, \'bil_address2\': 0, \'bil_city\': 0, \'bil_state\': 0, \'bil_country\': 0, \'vat\': 0, \'metadata\': 0}', '{\'id\': \'23a2dbf0-85d9-11e9-a6a6-966a0a06784e\', \'created\': \'1559550326.3785900\', \'objectType\': \'charge\', \'amount\': \'4355.0\', \'currency\': \'EUR\', \'description\': \'zfsdf\', \'card\': {\'id\': \'card_23a2dbf1-85d9-11e9-a6a6-966a0a06784e\', \'created\': \'1559550326.3786500\', \'objectType\': \'card\', \'first6\': 402400, \'last4\': 2486, \'fingerprint\': \'3ab88ef8a417cd29b05431bfac1180db0b8224fdc06cdb82e4043ff3\', \'expMonth\': 1, \'expYear\': 2024, \'cardholderName\': \'dfgfgf\', \'customerId\': \'0\', \'brand\': \'Visa\', \'type\': \'type\', \'country\': \'country\'}, \'captured\': 1, \'refunded\': 0, \'disputed\': 0, \'refunded_amt\': \'None\', \'fraud_status\': None, \'fraud_score\': None}'),
('log_2acddba0-85e0-11e9-a6a6-966a0a06784e', '1559553344.8815100', 'charge_update', '/api/v1/charge/update', 200, 'None', 'None', '{\'chargeId\': \'23a2dbf0-85d9-11e9-a6a6-966a0a06784e\', \'customerId\': 0, \'description\': \'zfsdfwq\', \'dispute\': 0, \'fraud_status\': 0, \'fraud_score\': 0, \'sh_name\': 0, \'sh_address1\': 0, \'sh_address2\': 0, \'sh_zip\': 0, \'sh_city\': 0, \'sh_state\': 0, \'sh_country\': 0, \'bil_name\': 0, \'bil_address1\': 0, \'bil_address2\': 0, \'bil_city\': 0, \'bil_state\': 0, \'bil_country\': 0, \'vat\': 0, \'metadata\': 0}', '{\'id\': \'23a2dbf0-85d9-11e9-a6a6-966a0a06784e\', \'created\': \'1559550326.3785900\', \'objectType\': \'charge\', \'amount\': \'4355.0\', \'currency\': \'EUR\', \'description\': \'zfsdfwq\', \'card\': {\'id\': \'card_23a2dbf1-85d9-11e9-a6a6-966a0a06784e\', \'created\': \'1559550326.3786500\', \'objectType\': \'card\', \'first6\': 402400, \'last4\': 2486, \'fingerprint\': \'3ab88ef8a417cd29b05431bfac1180db0b8224fdc06cdb82e4043ff3\', \'expMonth\': 1, \'expYear\': 2024, \'cardholderName\': \'dfgfgf\', \'customerId\': \'0\', \'brand\': \'Visa\', \'type\': \'type\', \'country\': \'country\'}, \'captured\': 1, \'refunded\': 0, \'disputed\': 0, \'refunded_amt\': \'None\', \'fraud_status\': None, \'fraud_score\': None}'),
('log_69387274-85e0-11e9-a6a6-966a0a06784e', '1559553449.5988300', 'charge_update', '/api/v1/charge/update', 200, 'None', 'None', '{\'chargeId\': \'23a2dbf0-85d9-11e9-a6a6-966a0a06784e\', \'customerId\': 0, \'description\': \'zfsdfwqzxas\', \'dispute\': 0, \'fraud_status\': 0, \'fraud_score\': 0, \'sh_name\': 0, \'sh_address1\': 0, \'sh_address2\': 0, \'sh_zip\': 0, \'sh_city\': 0, \'sh_state\': 0, \'sh_country\': 0, \'bil_name\': 0, \'bil_address1\': 0, \'bil_address2\': 0, \'bil_city\': 0, \'bil_state\': 0, \'bil_country\': 0, \'vat\': 0, \'metadata\': 0}', '{\'id\': \'23a2dbf0-85d9-11e9-a6a6-966a0a06784e\', \'created\': \'1559550326.3785900\', \'objectType\': \'charge\', \'amount\': \'4355.0\', \'currency\': \'EUR\', \'description\': \'zfsdfwqzxas\', \'card\': {\'id\': \'card_23a2dbf1-85d9-11e9-a6a6-966a0a06784e\', \'created\': \'1559550326.3786500\', \'objectType\': \'card\', \'first6\': 402400, \'last4\': 2486, \'fingerprint\': \'3ab88ef8a417cd29b05431bfac1180db0b8224fdc06cdb82e4043ff3\', \'expMonth\': 1, \'expYear\': 2024, \'cardholderName\': \'dfgfgf\', \'customerId\': \'0\', \'brand\': \'Visa\', \'type\': \'type\', \'country\': \'country\'}, \'captured\': 1, \'refunded\': 0, \'disputed\': 0, \'refunded_amt\': \'None\', \'fraud_status\': None, \'fraud_score\': None}'),
('log_8d423120-85e0-11e9-a6a6-966a0a06784e', '1559553510.0628600', 'post', '/api/v1/customer/create', 200, 'None', 'None', '{\'email\': \'priyanertgwertwka@gmail.com\', \'description\': \'dtryhwreey\', \'card\': 0, \'metadata\': 0}', '{\'id\': \'8d42311d-85e0-11e9-a6a6-966a0a06784e\', \'created\': 1559553510.0606406, \'objectType\': \'customer\', \'email\': \'priyanertgwertwka@gmail.com\', \'description\': \'dtryhwreey\', \'defaultCardId\': 0, \'metadata\': 0}'),
('log_a0d2ff6b-85e0-11e9-a6a6-966a0a06784e', '1559553542.8889300', 'update', '/api/v1/card/create', 200, 'None', 'None', '{\'customerId\': \'8d42311d-85e0-11e9-a6a6-966a0a06784e\', \'card\': {\'id\': \'card_a0d2ff68-85e0-11e9-a6a6-966a0a06784e\', \'created\': 1559553542.8862941, \'objectType\': \'card\', \'first6\': \'402400\', \'last4\': \'4842\', \'fingerprint\': \'d50bb9e92e1ef4124781e0e6046e8be519bfd96461971f621c28fb82\', \'expMonth\': \'3\', \'expYear\': \'2023\', \'cardholderName\': \'\', \'customerId\': \'8d42311d-85e0-11e9-a6a6-966a0a06784e\', \'brand\': \'Visa\', \'type\': \'type\', \'country\': \'country\', \'addressLine1\': 0, \'addressLine2\': 0, \'addressCity\': 0, \'addressState\': 0, \'addressZip\': 0, \'addressCountry\': 0, \'ipAddress\': 0, \'email\': 0, \'userAgent\': 0, \'acceptLanguage\': 0}, \'number\': \'4024007134364842\', \'exp_month\': \'3\', \'exp_year\': \'2023\', \'cvc\': \'123\', \'cardholdername\': \'\', \'addressLine1\': 0, \'addressLine2\': 0, \'addressCity\': 0, \'addressState\': 0, \'addressZip\': 0, \'addressCountry\': 0, \'ipAddress\': 0, \'email\': 0, \'userAgent\': 0, \'acceptLanguage\': 0}', '{\'id\': \'card_a0d2ff68-85e0-11e9-a6a6-966a0a06784e\', \'created\': \'1559553542.8862941\', \'objectType\': \'card\', \'first6\': \'402400\', \'last4\': \'4842\', \'fingerprint\': \'d50bb9e92e1ef4124781e0e6046e8be519bfd96461971f621c28fb82\', \'expMonth\': \'3\', \'expYear\': \'2023\', \'cardholderName\': \'\', \'customerId\': \'8d42311d-85e0-11e9-a6a6-966a0a06784e\', \'brand\': \'Visa\', \'type\': \'type\', \'country\': \'country\'}'),
('log_f000e585-85e0-11e9-a6a6-966a0a06784e', '1559553675.7298800', 'update', '/api/v1/card/create', 200, 'None', 'None', '{\'customerId\': \'8d42311d-85e0-11e9-a6a6-966a0a06784e\', \'card\': {\'id\': \'card_f000e582-85e0-11e9-a6a6-966a0a06784e\', \'created\': 1559553675.7271388, \'objectType\': \'card\', \'first6\': \'402400\', \'last4\': \'8684\', \'fingerprint\': \'317608417e7ab68b9291b33f8c7e9484ee8c503e7f53c967d067035e\', \'expMonth\': \'4\', \'expYear\': \'2021\', \'cardholderName\': \'\', \'customerId\': \'8d42311d-85e0-11e9-a6a6-966a0a06784e\', \'brand\': \'Visa\', \'type\': \'type\', \'country\': \'country\', \'addressLine1\': 0, \'addressLine2\': 0, \'addressCity\': 0, \'addressState\': 0, \'addressZip\': 0, \'addressCountry\': 0, \'ipAddress\': 0, \'email\': 0, \'userAgent\': 0, \'acceptLanguage\': 0}, \'number\': \'4024007118468684\', \'exp_month\': \'4\', \'exp_year\': \'2021\', \'cvc\': \'123\', \'cardholdername\': \'\', \'addressLine1\': 0, \'addressLine2\': 0, \'addressCity\': 0, \'addressState\': 0, \'addressZip\': 0, \'addressCountry\': 0, \'ipAddress\': 0, \'email\': 0, \'userAgent\': 0, \'acceptLanguage\': 0}', '{\'id\': \'card_f000e582-85e0-11e9-a6a6-966a0a06784e\', \'created\': \'1559553675.7271388\', \'objectType\': \'card\', \'first6\': \'402400\', \'last4\': \'8684\', \'fingerprint\': \'317608417e7ab68b9291b33f8c7e9484ee8c503e7f53c967d067035e\', \'expMonth\': \'4\', \'expYear\': \'2021\', \'cardholderName\': \'\', \'customerId\': \'8d42311d-85e0-11e9-a6a6-966a0a06784e\', \'brand\': \'Visa\', \'type\': \'type\', \'country\': \'country\'}'),
('log_0a36365c-85e1-11e9-a6a6-966a0a06784e', '1559553719.6973300', 'charge_update', '/api/v1/charge/update', 200, 'None', 'None', '{\'chargeId\': \'23a2dbf0-85d9-11e9-a6a6-966a0a06784e\', \'customerId\': 0, \'description\': \'zfsdfwqzxaszxczx\', \'dispute\': 0, \'fraud_status\': 0, \'fraud_score\': 0, \'sh_name\': 0, \'sh_address1\': 0, \'sh_address2\': 0, \'sh_zip\': 0, \'sh_city\': 0, \'sh_state\': 0, \'sh_country\': 0, \'bil_name\': 0, \'bil_address1\': 0, \'bil_address2\': 0, \'bil_city\': 0, \'bil_state\': 0, \'bil_country\': 0, \'vat\': 0, \'metadata\': 0}', '{\'id\': \'23a2dbf0-85d9-11e9-a6a6-966a0a06784e\', \'created\': \'1559550326.3785900\', \'objectType\': \'charge\', \'amount\': \'4355.0\', \'currency\': \'EUR\', \'description\': \'zfsdfwqzxaszxczx\', \'card\': {\'id\': \'card_23a2dbf1-85d9-11e9-a6a6-966a0a06784e\', \'created\': \'1559550326.3786500\', \'objectType\': \'card\', \'first6\': 402400, \'last4\': 2486, \'fingerprint\': \'3ab88ef8a417cd29b05431bfac1180db0b8224fdc06cdb82e4043ff3\', \'expMonth\': 1, \'expYear\': 2024, \'cardholderName\': \'dfgfgf\', \'customerId\': \'0\', \'brand\': \'Visa\', \'type\': \'type\', \'country\': \'country\'}, \'captured\': 1, \'refunded\': 0, \'disputed\': 0, \'refunded_amt\': \'None\', \'fraud_status\': None, \'fraud_score\': None}'),
('log_5c7ead40-85e1-11e9-a6a6-966a0a06784e', '1559553857.7454100', 'update', '/api/v1/customer/update', 200, 'None', 'None', '{\'customer_id\': \'8d42311d-85e0-11e9-a6a6-966a0a06784e\', \'email\': \'priyanertgwertwka@gmail.com\', \'description\': \'weyw4ey6w4ty\', \'defaultCardId\': 0, \'metadata\': 0, \'card\': 0}', '{\'id\': \'8d42311d-85e0-11e9-a6a6-966a0a06784e\', \'created\': \'1559553510.0606406\', \'objectType\': \'customer\', \'email\': \'priyanertgwertwka@gmail.com\', \'description\': \'weyw4ey6w4ty\', \'defaultCardId\': \'0\'}'),
('log_65c0e350-85e1-11e9-a6a6-966a0a06784e', '1559553873.2788100', 'update', '/api/v1/customer/update', 200, 'None', 'None', '{\'customer_id\': \'8d42311d-85e0-11e9-a6a6-966a0a06784e\', \'email\': \'priyanertgwertwka@gmail.com\', \'description\': \'reuyheryuertyrthy\', \'defaultCardId\': 0, \'metadata\': 0, \'card\': 0}', '{\'id\': \'8d42311d-85e0-11e9-a6a6-966a0a06784e\', \'created\': \'1559553510.0606406\', \'objectType\': \'customer\', \'email\': \'priyanertgwertwka@gmail.com\', \'description\': \'reuyheryuertyrthy\', \'defaultCardId\': \'0\'}'),
('log_b7a8363c-85e1-11e9-a6a6-966a0a06784e', '1559554010.6904300', 'charge_update', '/api/v1/charge/update', 200, 'None', 'None', '{\'chargeId\': \'23a2dbf0-85d9-11e9-a6a6-966a0a06784e\', \'customerId\': 0, \'description\': \'zfsdfwqzxaszxczxzxcxz\', \'dispute\': 0, \'fraud_status\': 0, \'fraud_score\': 0, \'sh_name\': 0, \'sh_address1\': 0, \'sh_address2\': 0, \'sh_zip\': 0, \'sh_city\': 0, \'sh_state\': 0, \'sh_country\': 0, \'bil_name\': 0, \'bil_address1\': 0, \'bil_address2\': 0, \'bil_city\': 0, \'bil_state\': 0, \'bil_country\': 0, \'vat\': 0, \'metadata\': 0}', '{\'id\': \'23a2dbf0-85d9-11e9-a6a6-966a0a06784e\', \'created\': \'1559550326.3785900\', \'objectType\': \'charge\', \'amount\': \'4355.0\', \'currency\': \'EUR\', \'description\': \'zfsdfwqzxaszxczxzxcxz\', \'card\': {\'id\': \'card_23a2dbf1-85d9-11e9-a6a6-966a0a06784e\', \'created\': \'1559550326.3786500\', \'objectType\': \'card\', \'first6\': 402400, \'last4\': 2486, \'fingerprint\': \'3ab88ef8a417cd29b05431bfac1180db0b8224fdc06cdb82e4043ff3\', \'expMonth\': 1, \'expYear\': 2024, \'cardholderName\': \'dfgfgf\', \'customerId\': \'0\', \'brand\': \'Visa\', \'type\': \'type\', \'country\': \'country\'}, \'captured\': 1, \'refunded\': 0, \'disputed\': 0, \'refunded_amt\': \'None\', \'fraud_status\': None, \'fraud_score\': None}'),
('log_bde1e58e-85e1-11e9-a6a6-966a0a06784e', '1559554021.1346900', 'update', '/api/v1/customer/update', 200, 'None', 'None', '{\'customer_id\': \'8d42311d-85e0-11e9-a6a6-966a0a06784e\', \'email\': \'priyanertgwertwka@gmail.com\', \'description\': \'86i768\', \'defaultCardId\': 0, \'metadata\': 0, \'card\': 0}', '{\'id\': \'8d42311d-85e0-11e9-a6a6-966a0a06784e\', \'created\': \'1559553510.0606406\', \'objectType\': \'customer\', \'email\': \'priyanertgwertwka@gmail.com\', \'description\': \'86i768\', \'defaultCardId\': \'0\'}'),
('log_c3c38c0a-85e1-11e9-a6a6-966a0a06784e', '1559554031.0021800', 'charge_update', '/api/v1/charge/update', 200, 'None', 'None', '{\'chargeId\': \'23a2dbf0-85d9-11e9-a6a6-966a0a06784e\', \'customerId\': 0, \'description\': \'zfsdfwqz\', \'dispute\': 0, \'fraud_status\': 0, \'fraud_score\': 0, \'sh_name\': 0, \'sh_address1\': 0, \'sh_address2\': 0, \'sh_zip\': 0, \'sh_city\': 0, \'sh_state\': 0, \'sh_country\': 0, \'bil_name\': 0, \'bil_address1\': 0, \'bil_address2\': 0, \'bil_city\': 0, \'bil_state\': 0, \'bil_country\': 0, \'vat\': 0, \'metadata\': 0}', '{\'id\': \'23a2dbf0-85d9-11e9-a6a6-966a0a06784e\', \'created\': \'1559550326.3785900\', \'objectType\': \'charge\', \'amount\': \'4355.0\', \'currency\': \'EUR\', \'description\': \'zfsdfwqz\', \'card\': {\'id\': \'card_23a2dbf1-85d9-11e9-a6a6-966a0a06784e\', \'created\': \'1559550326.3786500\', \'objectType\': \'card\', \'first6\': 402400, \'last4\': 2486, \'fingerprint\': \'3ab88ef8a417cd29b05431bfac1180db0b8224fdc06cdb82e4043ff3\', \'expMonth\': 1, \'expYear\': 2024, \'cardholderName\': \'dfgfgf\', \'customerId\': \'0\', \'brand\': \'Visa\', \'type\': \'type\', \'country\': \'country\'}, \'captured\': 1, \'refunded\': 0, \'disputed\': 0, \'refunded_amt\': \'None\', \'fraud_status\': None, \'fraud_score\': None}'),
('log_d7c51db8-85e1-11e9-a6a6-966a0a06784e', '1559554064.5669500', 'update', '/api/v1/customer/update', 200, 'None', 'None', '{\'customer_id\': \'8d42311d-85e0-11e9-a6a6-966a0a06784e\', \'email\': \'priyanertgwertwka@gmail.com\', \'description\': \'sdtywerywerywertwqert\', \'defaultCardId\': 0, \'metadata\': 0, \'card\': 0}', '{\'id\': \'8d42311d-85e0-11e9-a6a6-966a0a06784e\', \'created\': \'1559553510.0606406\', \'objectType\': \'customer\', \'email\': \'priyanertgwertwka@gmail.com\', \'description\': \'sdtywerywerywertwqert\', \'defaultCardId\': \'0\'}'),
('log_ffd74472-85e1-11e9-a6a6-966a0a06784e', '1559554131.7955700', 'post', '/api/v1/customer/create', 200, 'None', 'None', '{\'email\': \'dsfsdfgdfhtdfhd@gmail.comsdfyts\', \'description\': \'dstsdtyyergh\', \'card\': 0, \'metadata\': 0}', '{\'id\': \'ffd7446f-85e1-11e9-a6a6-966a0a06784e\', \'created\': 1559554131.7946625, \'objectType\': \'customer\', \'email\': \'dsfsdfgdfhtdfhd@gmail.comsdfyts\', \'description\': \'dstsdtyyergh\', \'defaultCardId\': 0, \'metadata\': 0}'),
('log_2f216f45-85e2-11e9-a6a6-966a0a06784e', '1559554211.1363100', 'update', '/api/v1/card/create', 200, 'None', 'None', '{\'customerId\': \'8d42311d-85e0-11e9-a6a6-966a0a06784e\', \'card\': {\'id\': \'card_2f216f42-85e2-11e9-a6a6-966a0a06784e\', \'created\': 1559554211.1335797, \'objectType\': \'card\', \'first6\': \'402400\', \'last4\': \'4842\', \'fingerprint\': \'d50bb9e92e1ef4124781e0e6046e8be519bfd96461971f621c28fb82\', \'expMonth\': \'4\', \'expYear\': \'2022\', \'cardholderName\': \'\', \'customerId\': \'8d42311d-85e0-11e9-a6a6-966a0a06784e\', \'brand\': \'Visa\', \'type\': \'type\', \'country\': \'country\', \'addressLine1\': 0, \'addressLine2\': 0, \'addressCity\': 0, \'addressState\': 0, \'addressZip\': 0, \'addressCountry\': 0, \'ipAddress\': 0, \'email\': 0, \'userAgent\': 0, \'acceptLanguage\': 0}, \'number\': \'4024007134364842\', \'exp_month\': \'4\', \'exp_year\': \'2022\', \'cvc\': \'5685\', \'cardholdername\': \'\', \'addressLine1\': 0, \'addressLine2\': 0, \'addressCity\': 0, \'addressState\': 0, \'addressZip\': 0, \'addressCountry\': 0, \'ipAddress\': 0, \'email\': 0, \'userAgent\': 0, \'acceptLanguage\': 0}', '{\'id\': \'card_2f216f42-85e2-11e9-a6a6-966a0a06784e\', \'created\': \'1559554211.1335797\', \'objectType\': \'card\', \'first6\': \'402400\', \'last4\': \'4842\', \'fingerprint\': \'d50bb9e92e1ef4124781e0e6046e8be519bfd96461971f621c28fb82\', \'expMonth\': \'4\', \'expYear\': \'2022\', \'cardholderName\': \'\', \'customerId\': \'8d42311d-85e0-11e9-a6a6-966a0a06784e\', \'brand\': \'Visa\', \'type\': \'type\', \'country\': \'country\'}'),
('log_721392a1-85e2-11e9-a6a6-966a0a06784e', '1559554323.4528000', 'update', '/api/v1/card/create', 200, 'None', 'None', '{\'customerId\': \'8d42311d-85e0-11e9-a6a6-966a0a06784e\', \'card\': {\'id\': \'card_7213929e-85e2-11e9-a6a6-966a0a06784e\', \'created\': 1559554323.4500747, \'objectType\': \'card\', \'first6\': \'401200\', \'last4\': \'0007\', \'fingerprint\': \'522fd11a5a880b14cbd7f2811c018d75d3e6db828fa3118aa693a6f1\', \'expMonth\': \'8\', \'expYear\': \'2022\', \'cardholderName\': \'\', \'customerId\': \'8d42311d-85e0-11e9-a6a6-966a0a06784e\', \'brand\': \'Visa\', \'type\': \'type\', \'country\': \'country\', \'addressLine1\': 0, \'addressLine2\': 0, \'addressCity\': 0, \'addressState\': 0, \'addressZip\': 0, \'addressCountry\': 0, \'ipAddress\': 0, \'email\': 0, \'userAgent\': 0, \'acceptLanguage\': 0}, \'number\': \'4012000100000007\', \'exp_month\': \'8\', \'exp_year\': \'2022\', \'cvc\': \'2345\', \'cardholdername\': \'\', \'addressLine1\': 0, \'addressLine2\': 0, \'addressCity\': 0, \'addressState\': 0, \'addressZip\': 0, \'addressCountry\': 0, \'ipAddress\': 0, \'email\': 0, \'userAgent\': 0, \'acceptLanguage\': 0}', '{\'id\': \'card_7213929e-85e2-11e9-a6a6-966a0a06784e\', \'created\': \'1559554323.4500747\', \'objectType\': \'card\', \'first6\': \'401200\', \'last4\': \'0007\', \'fingerprint\': \'522fd11a5a880b14cbd7f2811c018d75d3e6db828fa3118aa693a6f1\', \'expMonth\': \'8\', \'expYear\': \'2022\', \'cardholderName\': \'\', \'customerId\': \'8d42311d-85e0-11e9-a6a6-966a0a06784e\', \'brand\': \'Visa\', \'type\': \'type\', \'country\': \'country\'}'),
('log_9e28cf9b-85e2-11e9-a6a6-966a0a06784e', '1559554397.4126500', 'update', '/api/v1/card/create', 200, 'None', 'None', '{\'customerId\': \'8d42311d-85e0-11e9-a6a6-966a0a06784e\', \'card\': {\'id\': \'card_9e28cf98-85e2-11e9-a6a6-966a0a06784e\', \'created\': 1559554397.4090474, \'objectType\': \'card\', \'first6\': \'402400\', \'last4\': \'8684\', \'fingerprint\': \'317608417e7ab68b9291b33f8c7e9484ee8c503e7f53c967d067035e\', \'expMonth\': \'4\', \'expYear\': \'2022\', \'cardholderName\': \'\', \'customerId\': \'8d42311d-85e0-11e9-a6a6-966a0a06784e\', \'brand\': \'Visa\', \'type\': \'type\', \'country\': \'country\', \'addressLine1\': 0, \'addressLine2\': 0, \'addressCity\': 0, \'addressState\': 0, \'addressZip\': 0, \'addressCountry\': 0, \'ipAddress\': 0, \'email\': 0, \'userAgent\': 0, \'acceptLanguage\': 0}, \'number\': \'4024007118468684\', \'exp_month\': \'4\', \'exp_year\': \'2022\', \'cvc\': \'3456\', \'cardholdername\': \'\', \'addressLine1\': 0, \'addressLine2\': 0, \'addressCity\': 0, \'addressState\': 0, \'addressZip\': 0, \'addressCountry\': 0, \'ipAddress\': 0, \'email\': 0, \'userAgent\': 0, \'acceptLanguage\': 0}', '{\'id\': \'card_9e28cf98-85e2-11e9-a6a6-966a0a06784e\', \'created\': \'1559554397.4090474\', \'objectType\': \'card\', \'first6\': \'402400\', \'last4\': \'8684\', \'fingerprint\': \'317608417e7ab68b9291b33f8c7e9484ee8c503e7f53c967d067035e\', \'expMonth\': \'4\', \'expYear\': \'2022\', \'cardholderName\': \'\', \'customerId\': \'8d42311d-85e0-11e9-a6a6-966a0a06784e\', \'brand\': \'Visa\', \'type\': \'type\', \'country\': \'country\'}'),
('log_00ea63dc-85e3-11e9-a6a6-966a0a06784e', '1559554563.0945800', 'charge_update', '/api/v1/charge/update', 200, 'None', 'None', '{\'chargeId\': \'23a2dbf0-85d9-11e9-a6a6-966a0a06784e\', \'customerId\': 0, \'description\': \'zfsdfwqzdsfd\', \'dispute\': 0, \'fraud_status\': 0, \'fraud_score\': 0, \'sh_name\': 0, \'sh_address1\': 0, \'sh_address2\': 0, \'sh_zip\': 0, \'sh_city\': 0, \'sh_state\': 0, \'sh_country\': 0, \'bil_name\': 0, \'bil_address1\': 0, \'bil_address2\': 0, \'bil_city\': 0, \'bil_state\': 0, \'bil_country\': 0, \'vat\': 0, \'metadata\': 0}', '{\'id\': \'23a2dbf0-85d9-11e9-a6a6-966a0a06784e\', \'created\': \'1559550326.3785900\', \'objectType\': \'charge\', \'amount\': \'4355.0\', \'currency\': \'EUR\', \'description\': \'zfsdfwqzdsfd\', \'card\': {\'id\': \'card_23a2dbf1-85d9-11e9-a6a6-966a0a06784e\', \'created\': \'1559550326.3786500\', \'objectType\': \'card\', \'first6\': 402400, \'last4\': 2486, \'fingerprint\': \'3ab88ef8a417cd29b05431bfac1180db0b8224fdc06cdb82e4043ff3\', \'expMonth\': 1, \'expYear\': 2024, \'cardholderName\': \'dfgfgf\', \'customerId\': \'0\', \'brand\': \'Visa\', \'type\': \'type\', \'country\': \'country\'}, \'captured\': 1, \'refunded\': 0, \'disputed\': 0, \'refunded_amt\': \'None\', \'fraud_status\': None, \'fraud_score\': None}'),
('log_086be235-85e3-11e9-a6a6-966a0a06784e', '1559554575.6911300', 'update', '/api/v1/card/create', 200, 'None', 'None', '{\'customerId\': \'8d42311d-85e0-11e9-a6a6-966a0a06784e\', \'card\': {\'id\': \'card_086be232-85e3-11e9-a6a6-966a0a06784e\', \'created\': 1559554575.687022, \'objectType\': \'card\', \'first6\': \'402400\', \'last4\': \'4842\', \'fingerprint\': \'d50bb9e92e1ef4124781e0e6046e8be519bfd96461971f621c28fb82\', \'expMonth\': \'5\', \'expYear\': \'2021\', \'cardholderName\': \'\', \'customerId\': \'8d42311d-85e0-11e9-a6a6-966a0a06784e\', \'brand\': \'Visa\', \'type\': \'type\', \'country\': \'country\', \'addressLine1\': 0, \'addressLine2\': 0, \'addressCity\': 0, \'addressState\': 0, \'addressZip\': 0, \'addressCountry\': 0, \'ipAddress\': 0, \'email\': 0, \'userAgent\': 0, \'acceptLanguage\': 0}, \'number\': \'4024007134364842\', \'exp_month\': \'5\', \'exp_year\': \'2021\', \'cvc\': \'2341\', \'cardholdername\': \'\', \'addressLine1\': 0, \'addressLine2\': 0, \'addressCity\': 0, \'addressState\': 0, \'addressZip\': 0, \'addressCountry\': 0, \'ipAddress\': 0, \'email\': 0, \'userAgent\': 0, \'acceptLanguage\': 0}', '{\'id\': \'card_086be232-85e3-11e9-a6a6-966a0a06784e\', \'created\': \'1559554575.687022\', \'objectType\': \'card\', \'first6\': \'402400\', \'last4\': \'4842\', \'fingerprint\': \'d50bb9e92e1ef4124781e0e6046e8be519bfd96461971f621c28fb82\', \'expMonth\': \'5\', \'expYear\': \'2021\', \'cardholderName\': \'\', \'customerId\': \'8d42311d-85e0-11e9-a6a6-966a0a06784e\', \'brand\': \'Visa\', \'type\': \'type\', \'country\': \'country\'}'),
('log_5186d925-85e3-11e9-a6a6-966a0a06784e', '1559554698.3405500', 'update', '/api/v1/card/create', 200, 'None', 'None', '{\'customerId\': \'8d42311d-85e0-11e9-a6a6-966a0a06784e\', \'card\': {\'id\': \'card_5186d922-85e3-11e9-a6a6-966a0a06784e\', \'created\': 1559554698.3374534, \'objectType\': \'card\', \'first6\': \'401200\', \'last4\': \'0007\', \'fingerprint\': \'522fd11a5a880b14cbd7f2811c018d75d3e6db828fa3118aa693a6f1\', \'expMonth\': \'4\', \'expYear\': \'2021\', \'cardholderName\': \'\', \'customerId\': \'8d42311d-85e0-11e9-a6a6-966a0a06784e\', \'brand\': \'Visa\', \'type\': \'type\', \'country\': \'country\', \'addressLine1\': 0, \'addressLine2\': 0, \'addressCity\': 0, \'addressState\': 0, \'addressZip\': 0, \'addressCountry\': 0, \'ipAddress\': 0, \'email\': 0, \'userAgent\': 0, \'acceptLanguage\': 0}, \'number\': \'4012000100000007\', \'exp_month\': \'4\', \'exp_year\': \'2021\', \'cvc\': \'4645\', \'cardholdername\': \'\', \'addressLine1\': 0, \'addressLine2\': 0, \'addressCity\': 0, \'addressState\': 0, \'addressZip\': 0, \'addressCountry\': 0, \'ipAddress\': 0, \'email\': 0, \'userAgent\': 0, \'acceptLanguage\': 0}', '{\'id\': \'card_5186d922-85e3-11e9-a6a6-966a0a06784e\', \'created\': \'1559554698.3374534\', \'objectType\': \'card\', \'first6\': \'401200\', \'last4\': \'0007\', \'fingerprint\': \'522fd11a5a880b14cbd7f2811c018d75d3e6db828fa3118aa693a6f1\', \'expMonth\': \'4\', \'expYear\': \'2021\', \'cardholderName\': \'\', \'customerId\': \'8d42311d-85e0-11e9-a6a6-966a0a06784e\', \'brand\': \'Visa\', \'type\': \'type\', \'country\': \'country\'}'),
('log_5186d928-85e3-11e9-a6a6-966a0a06784e', '1559554699.1887900', 'charge_refunded', '/api/v1/charge/refund', 200, 'None', 'None', '{\'chargeId\': \'23a2dbf0-85d9-11e9-a6a6-966a0a06784e\', \'amount\': \'4325\'}', '{\'id\': \'23a2dbf0-85d9-11e9-a6a6-966a0a06784e\', \'created\': \'1559550326.3785900\', \'objectType\': \'charge\', \'amount\': 4355.0, \'currency\': \'EUR\', \'description\': \'zfsdfwqzdsfd\', \'card\': {\'id\': \'card_23a2dbf1-85d9-11e9-a6a6-966a0a06784e\', \'created\': \'1559550326.3786500\', \'objectType\': \'card\', \'first6\': 402400, \'last4\': 2486, \'fingerprint\': \'3ab88ef8a417cd29b05431bfac1180db0b8224fdc06cdb82e4043ff3\', \'expMonth\': 1, \'expYear\': 2024, \'cardholderName\': \'dfgfgf\', \'customerId\': \'0\', \'brand\': \'Visa\', \'type\': \'type\', \'country\': \'country\'}, \'captured\': 1, \'refunded\': 1, \'refunded_amt\': 4325.0, \'disputed\': 0}'),
('log_98f98393-85e3-11e9-a6a6-966a0a06784e', '1559554818.2101900', 'update', '/api/v1/card/create', 200, 'None', 'None', '{\'customerId\': \'8d42311d-85e0-11e9-a6a6-966a0a06784e\', \'card\': {\'id\': \'card_98f98390-85e3-11e9-a6a6-966a0a06784e\', \'created\': 1559554818.2071939, \'objectType\': \'card\', \'first6\': \'401200\', \'last4\': \'0007\', \'fingerprint\': \'522fd11a5a880b14cbd7f2811c018d75d3e6db828fa3118aa693a6f1\', \'expMonth\': \'4\', \'expYear\': \'2027\', \'cardholderName\': \'\', \'customerId\': \'8d42311d-85e0-11e9-a6a6-966a0a06784e\', \'brand\': \'Visa\', \'type\': \'type\', \'country\': \'country\', \'addressLine1\': 0, \'addressLine2\': 0, \'addressCity\': 0, \'addressState\': 0, \'addressZip\': 0, \'addressCountry\': 0, \'ipAddress\': 0, \'email\': 0, \'userAgent\': 0, \'acceptLanguage\': 0}, \'number\': \'4012000100000007\', \'exp_month\': \'4\', \'exp_year\': \'2027\', \'cvc\': \'4577\', \'cardholdername\': \'\', \'addressLine1\': 0, \'addressLine2\': 0, \'addressCity\': 0, \'addressState\': 0, \'addressZip\': 0, \'addressCountry\': 0, \'ipAddress\': 0, \'email\': 0, \'userAgent\': 0, \'acceptLanguage\': 0}', '{\'id\': \'card_98f98390-85e3-11e9-a6a6-966a0a06784e\', \'created\': \'1559554818.2071939\', \'objectType\': \'card\', \'first6\': \'401200\', \'last4\': \'0007\', \'fingerprint\': \'522fd11a5a880b14cbd7f2811c018d75d3e6db828fa3118aa693a6f1\', \'expMonth\': \'4\', \'expYear\': \'2027\', \'cardholderName\': \'\', \'customerId\': \'8d42311d-85e0-11e9-a6a6-966a0a06784e\', \'brand\': \'Visa\', \'type\': \'type\', \'country\': \'country\'}'),
('log_e739b609-85e3-11e9-a6a6-966a0a06784e', '1559554949.4931300', 'update', '/api/v1/card/create', 200, 'None', 'None', '{\'customerId\': \'8d42311d-85e0-11e9-a6a6-966a0a06784e\', \'card\': {\'id\': \'card_e739b606-85e3-11e9-a6a6-966a0a06784e\', \'created\': 1559554949.4901664, \'objectType\': \'card\', \'first6\': \'402400\', \'last4\': \'1187\', \'fingerprint\': \'02eff1364cb2018c2a88f48c2d497ca482e634759353e48858b616cc\', \'expMonth\': \'6\', \'expYear\': \'2021\', \'cardholderName\': \'\', \'customerId\': \'8d42311d-85e0-11e9-a6a6-966a0a06784e\', \'brand\': \'Visa\', \'type\': \'type\', \'country\': \'country\', \'addressLine1\': 0, \'addressLine2\': 0, \'addressCity\': 0, \'addressState\': 0, \'addressZip\': 0, \'addressCountry\': 0, \'ipAddress\': 0, \'email\': 0, \'userAgent\': 0, \'acceptLanguage\': 0}, \'number\': \'4024007114621187\', \'exp_month\': \'6\', \'exp_year\': \'2021\', \'cvc\': \'3252\', \'cardholdername\': \'\', \'addressLine1\': 0, \'addressLine2\': 0, \'addressCity\': 0, \'addressState\': 0, \'addressZip\': 0, \'addressCountry\': 0, \'ipAddress\': 0, \'email\': 0, \'userAgent\': 0, \'acceptLanguage\': 0}', '{\'id\': \'card_e739b606-85e3-11e9-a6a6-966a0a06784e\', \'created\': \'1559554949.4901664\', \'objectType\': \'card\', \'first6\': \'402400\', \'last4\': \'1187\', \'fingerprint\': \'02eff1364cb2018c2a88f48c2d497ca482e634759353e48858b616cc\', \'expMonth\': \'6\', \'expYear\': \'2021\', \'cardholderName\': \'\', \'customerId\': \'8d42311d-85e0-11e9-a6a6-966a0a06784e\', \'brand\': \'Visa\', \'type\': \'type\', \'country\': \'country\'}'),
('log_0716ba85-85e4-11e9-a6a6-966a0a06784e', '1559555002.9506400', 'update', '/api/v1/card/create', 200, 'None', 'None', '{\'customerId\': \'8d42311d-85e0-11e9-a6a6-966a0a06784e\', \'card\': {\'id\': \'card_0716ba82-85e4-11e9-a6a6-966a0a06784e\', \'created\': 1559555002.947975, \'objectType\': \'card\', \'first6\': \'401200\', \'last4\': \'0007\', \'fingerprint\': \'522fd11a5a880b14cbd7f2811c018d75d3e6db828fa3118aa693a6f1\', \'expMonth\': \'8\', \'expYear\': \'2021\', \'cardholderName\': \'\', \'customerId\': \'8d42311d-85e0-11e9-a6a6-966a0a06784e\', \'brand\': \'Visa\', \'type\': \'type\', \'country\': \'country\', \'addressLine1\': 0, \'addressLine2\': 0, \'addressCity\': 0, \'addressState\': 0, \'addressZip\': 0, \'addressCountry\': 0, \'ipAddress\': 0, \'email\': 0, \'userAgent\': 0, \'acceptLanguage\': 0}, \'number\': \'4012000100000007\', \'exp_month\': \'8\', \'exp_year\': \'2021\', \'cvc\': \'3245\', \'cardholdername\': \'\', \'addressLine1\': 0, \'addressLine2\': 0, \'addressCity\': 0, \'addressState\': 0, \'addressZip\': 0, \'addressCountry\': 0, \'ipAddress\': 0, \'email\': 0, \'userAgent\': 0, \'acceptLanguage\': 0}', '{\'id\': \'card_0716ba82-85e4-11e9-a6a6-966a0a06784e\', \'created\': \'1559555002.947975\', \'objectType\': \'card\', \'first6\': \'401200\', \'last4\': \'0007\', \'fingerprint\': \'522fd11a5a880b14cbd7f2811c018d75d3e6db828fa3118aa693a6f1\', \'expMonth\': \'8\', \'expYear\': \'2021\', \'cardholderName\': \'\', \'customerId\': \'8d42311d-85e0-11e9-a6a6-966a0a06784e\', \'brand\': \'Visa\', \'type\': \'type\', \'country\': \'country\'}'),
('log_2c40b081-85e4-11e9-a6a6-966a0a06784e', '1559555065.3023500', 'update', '/api/v1/card/create', 200, 'None', 'None', '{\'customerId\': \'8d42311d-85e0-11e9-a6a6-966a0a06784e\', \'card\': {\'id\': \'card_2c40b07e-85e4-11e9-a6a6-966a0a06784e\', \'created\': 1559555065.2987242, \'objectType\': \'card\', \'first6\': \'401200\', \'last4\': \'0007\', \'fingerprint\': \'522fd11a5a880b14cbd7f2811c018d75d3e6db828fa3118aa693a6f1\', \'expMonth\': \'4\', \'expYear\': \'2023\', \'cardholderName\': \'\', \'customerId\': \'8d42311d-85e0-11e9-a6a6-966a0a06784e\', \'brand\': \'Visa\', \'type\': \'type\', \'country\': \'country\', \'addressLine1\': 0, \'addressLine2\': 0, \'addressCity\': 0, \'addressState\': 0, \'addressZip\': 0, \'addressCountry\': 0, \'ipAddress\': 0, \'email\': 0, \'userAgent\': 0, \'acceptLanguage\': 0}, \'number\': \'4012000100000007\', \'exp_month\': \'4\', \'exp_year\': \'2023\', \'cvc\': \'4763\', \'cardholdername\': \'\', \'addressLine1\': 0, \'addressLine2\': 0, \'addressCity\': 0, \'addressState\': 0, \'addressZip\': 0, \'addressCountry\': 0, \'ipAddress\': 0, \'email\': 0, \'userAgent\': 0, \'acceptLanguage\': 0}', '{\'id\': \'card_2c40b07e-85e4-11e9-a6a6-966a0a06784e\', \'created\': \'1559555065.2987242\', \'objectType\': \'card\', \'first6\': \'401200\', \'last4\': \'0007\', \'fingerprint\': \'522fd11a5a880b14cbd7f2811c018d75d3e6db828fa3118aa693a6f1\', \'expMonth\': \'4\', \'expYear\': \'2023\', \'cardholderName\': \'\', \'customerId\': \'8d42311d-85e0-11e9-a6a6-966a0a06784e\', \'brand\': \'Visa\', \'type\': \'type\', \'country\': \'country\'}'),
('log_33958888-85e4-11e9-a6a6-966a0a06784e', '1559555077.5988000', 'card_update', '/api/v1/card/update', 200, 'None', 'None', '{\'customer_id\': \'8d42311d-85e0-11e9-a6a6-966a0a06784e\', \'card_id\': \'card_2c40b07e-85e4-11e9-a6a6-966a0a06784e\', \'expMonth\': \'7\', \'expYear\': \'2020\', \'addressCountry\': 0, \'addressCity\': 0, \'addressLine1\': 0, \'addressLine2\': 0, \'addressZip\': 0}', '{\'id\': \'card_2c40b07e-85e4-11e9-a6a6-966a0a06784e\', \'created\': \'1559555065.2987200\', \'objectType\': \'card\', \'first6\': 401200, \'last4\': 7, \'fingerprint\': \'522fd11a5a880b14cbd7f2811c018d75d3e6db828fa3118aa693a6f1\', \'expMonth\': 7, \'expYear\': 2020, \'cardholderName\': \'\', \'customerId\': \'8d42311d-85e0-11e9-a6a6-966a0a06784e\', \'brand\': \'Visa\', \'type\': \'type\', \'country\': \'country\'}'),
('log_42411ddf-85e4-11e9-a6a6-966a0a06784e', '1559555102.2150700', 'update', '/api/v1/card/create', 200, 'None', 'None', '{\'customerId\': \'8d42311d-85e0-11e9-a6a6-966a0a06784e\', \'card\': {\'id\': \'card_42411ddc-85e4-11e9-a6a6-966a0a06784e\', \'created\': 1559555102.2113483, \'objectType\': \'card\', \'first6\': \'402400\', \'last4\': \'4842\', \'fingerprint\': \'d50bb9e92e1ef4124781e0e6046e8be519bfd96461971f621c28fb82\', \'expMonth\': \'2\', \'expYear\': \'2022\', \'cardholderName\': \'\', \'customerId\': \'8d42311d-85e0-11e9-a6a6-966a0a06784e\', \'brand\': \'Visa\', \'type\': \'type\', \'country\': \'country\', \'addressLine1\': 0, \'addressLine2\': 0, \'addressCity\': 0, \'addressState\': 0, \'addressZip\': 0, \'addressCountry\': 0, \'ipAddress\': 0, \'email\': 0, \'userAgent\': 0, \'acceptLanguage\': 0}, \'number\': \'4024007134364842\', \'exp_month\': \'2\', \'exp_year\': \'2022\', \'cvc\': \'7477\', \'cardholdername\': \'\', \'addressLine1\': 0, \'addressLine2\': 0, \'addressCity\': 0, \'addressState\': 0, \'addressZip\': 0, \'addressCountry\': 0, \'ipAddress\': 0, \'email\': 0, \'userAgent\': 0, \'acceptLanguage\': 0}', '{\'id\': \'card_42411ddc-85e4-11e9-a6a6-966a0a06784e\', \'created\': \'1559555102.2113483\', \'objectType\': \'card\', \'first6\': \'402400\', \'last4\': \'4842\', \'fingerprint\': \'d50bb9e92e1ef4124781e0e6046e8be519bfd96461971f621c28fb82\', \'expMonth\': \'2\', \'expYear\': \'2022\', \'cardholderName\': \'\', \'customerId\': \'8d42311d-85e0-11e9-a6a6-966a0a06784e\', \'brand\': \'Visa\', \'type\': \'type\', \'country\': \'country\'}'),
('log_589768f5-85e4-11e9-a6a6-966a0a06784e', '1559555139.6896400', 'update', '/api/v1/card/create', 200, 'None', 'None', '{\'customerId\': \'8d42311d-85e0-11e9-a6a6-966a0a06784e\', \'card\': {\'id\': \'card_589768f2-85e4-11e9-a6a6-966a0a06784e\', \'created\': 1559555139.6867921, \'objectType\': \'card\', \'first6\': \'402400\', \'last4\': \'8684\', \'fingerprint\': \'317608417e7ab68b9291b33f8c7e9484ee8c503e7f53c967d067035e\', \'expMonth\': \'1\', \'expYear\': \'2022\', \'cardholderName\': \'\', \'customerId\': \'8d42311d-85e0-11e9-a6a6-966a0a06784e\', \'brand\': \'Visa\', \'type\': \'type\', \'country\': \'country\', \'addressLine1\': 0, \'addressLine2\': 0, \'addressCity\': 0, \'addressState\': 0, \'addressZip\': 0, \'addressCountry\': 0, \'ipAddress\': 0, \'email\': 0, \'userAgent\': 0, \'acceptLanguage\': 0}, \'number\': \'4024007118468684\', \'exp_month\': \'1\', \'exp_year\': \'2022\', \'cvc\': \'4565\', \'cardholdername\': \'\', \'addressLine1\': 0, \'addressLine2\': 0, \'addressCity\': 0, \'addressState\': 0, \'addressZip\': 0, \'addressCountry\': 0, \'ipAddress\': 0, \'email\': 0, \'userAgent\': 0, \'acceptLanguage\': 0}', '{\'id\': \'card_589768f2-85e4-11e9-a6a6-966a0a06784e\', \'created\': \'1559555139.6867921\', \'objectType\': \'card\', \'first6\': \'402400\', \'last4\': \'8684\', \'fingerprint\': \'317608417e7ab68b9291b33f8c7e9484ee8c503e7f53c967d067035e\', \'expMonth\': \'1\', \'expYear\': \'2022\', \'cardholderName\': \'\', \'customerId\': \'8d42311d-85e0-11e9-a6a6-966a0a06784e\', \'brand\': \'Visa\', \'type\': \'type\', \'country\': \'country\'}'),
('log_d43ac984-85e5-11e9-a6a6-966a0a06784e', '1559555776.6195400', 'charge create', '/api/v1/charge/create', 200, 'None', 'None', '{\'amount\': 45.0, \'currency\': \'ALL\', \'description\': \'cxvxcvcv\', \'customerId\': 0, \'card\': 0, \'number\': \'4024007134364842\', \'exp_month\': \'5\', \'exp_year\': \'2024\', \'cvc\': \'121\', \'cardholdername\': \'subhashKr\', \'captured\': 1, \'refunded\': 0, \'disputed\': 0, \'sh_name\': \'sddsdsds\', \'sh_address1\': \'xzcdxz\', \'sh_address2\': \'xcxcdsc\', \'sh_zip\': \'123456\', \'sh_city\': \'jaipur\', \'sh_state\': \'sdfd\', \'sh_country\': \'AO\', \'bil_name\': 0, \'bil_address1\': 0, \'bil_address2\': 0, \'bil_city\': 0, \'bil_state\': 0, \'bil_country\': 0, \'vat\': 0, \'metadata\': 0}', '{\'id\': \'d43ac980-85e5-11e9-a6a6-966a0a06784e\', \'created\': 1559555776.6154046, \'objectType\': \'charge\', \'amount\': 45.0, \'currency\': \'ALL\', \'description\': \'cxvxcvcv\', \'card\': {\'id\': \'card_d43ac981-85e5-11e9-a6a6-966a0a06784e\', \'created\': 1559555776.6154876, \'objectType\': \'card\', \'first6\': \'402400\', \'last4\': \'4842\', \'fingerprint\': \'d50bb9e92e1ef4124781e0e6046e8be519bfd96461971f621c28fb82\', \'expMonth\': \'5\', \'expYear\': \'2024\', \'cardholderName\': \'subhashKr\', \'customerId\': 0, \'brand\': \'Visa\', \'type\': \'type\', \'country\': \'country\'}, \'captured\': 1, \'refunded\': 0, \'disputed\': 0}'),
('log_e8245958-85e6-11e9-a6a6-966a0a06784e', '1559556239.5181100', 'delete', '/api/v1/customers/delete', 200, 'None', 'None', '{\'customer_id\': \'ec7a9177-85cf-11e9-a6a6-966a0a06784e\'}', '{\'id\': \'ec7a9177-85cf-11e9-a6a6-966a0a06784e\'}'),
('log_8a0da913-85e8-11e9-a6a6-966a0a06784e', '1559556940.6608100', 'plan_create', '/api/v1/plan/create', 200, 'None', 'None', '{\'amount\': \'1\', \'currency\': \'INR\', \'interval\': \'hour\', \'name\': \'test\', \'intervalCount\': \'1\', \'billingCycles\': \'1\', \'trialPeriodDays\': \'1\', \'recursTo\': \'\', \'metadata\': 0}', '{\'id\': \'plan_8a0da910-85e8-11e9-a6a6-966a0a06784e\', \'created\': \'1559556940.6569900\', \'objectType\': \'plan\', \'amount\': 1.0, \'currency\': \'INR\', \'interval\': \'hour\', \'intervalCount\': 1, \'name\': \'test\', \'trialPeriodDays\': 1}'),
('log_b039ecd7-85e8-11e9-a6a6-966a0a06784e', '1559557004.7046200', 'plan_create', '/api/v1/plan/create', 200, 'None', 'None', '{\'amount\': \'12\', \'currency\': \'INR\', \'interval\': \'hour\', \'name\': \'test1\', \'intervalCount\': \'1\', \'billingCycles\': \'1\', \'trialPeriodDays\': \'1\', \'recursTo\': \'\', \'metadata\': 0}', '{\'id\': \'plan_b039ecd4-85e8-11e9-a6a6-966a0a06784e\', \'created\': \'1559557004.7005100\', \'objectType\': \'plan\', \'amount\': 12.0, \'currency\': \'INR\', \'interval\': \'hour\', \'intervalCount\': 1, \'name\': \'test1\', \'trialPeriodDays\': 1}'),
('log_d49bed2c-85e8-11e9-a6a6-966a0a06784e', '1559557065.7408800', 'charge_refunded', '/api/v1/charge/refund', 200, 'None', 'None', '{\'chargeId\': \'d43ac980-85e5-11e9-a6a6-966a0a06784e\', \'amount\': \'07\'}', '{\'id\': \'d43ac980-85e5-11e9-a6a6-966a0a06784e\', \'created\': \'1559555776.6154000\', \'objectType\': \'charge\', \'amount\': 45.0, \'currency\': \'ALL\', \'description\': \'cxvxcvcv\', \'card\': {\'id\': \'card_d43ac981-85e5-11e9-a6a6-966a0a06784e\', \'created\': \'1559555776.6154900\', \'objectType\': \'card\', \'first6\': 402400, \'last4\': 4842, \'fingerprint\': \'d50bb9e92e1ef4124781e0e6046e8be519bfd96461971f621c28fb82\', \'expMonth\': 5, \'expYear\': 2024, \'cardholderName\': \'subhashKr\', \'customerId\': \'0\', \'brand\': \'Visa\', \'type\': \'type\', \'country\': \'country\'}, \'captured\': 1, \'refunded\': 1, \'refunded_amt\': 7.0, \'disputed\': 0}'),
('log_e2b2442f-85e8-11e9-a6a6-966a0a06784e', '1559557089.3791500', 'plan_create', '/api/v1/plan/create', 200, 'None', 'None', '{\'amount\': \'3\', \'currency\': \'INR\', \'interval\': \'hour\', \'name\': \'sample\', \'intervalCount\': \'1\', \'billingCycles\': \'1\', \'trialPeriodDays\': \'1\', \'recursTo\': \'\', \'metadata\': 0}', '{\'id\': \'plan_e2b2442c-85e8-11e9-a6a6-966a0a06784e\', \'created\': \'1559557089.3752500\', \'objectType\': \'plan\', \'amount\': 3.0, \'currency\': \'INR\', \'interval\': \'hour\', \'intervalCount\': 1, \'name\': \'sample\', \'trialPeriodDays\': 1}');
INSERT INTO `log` (`log`, `created`, `method`, `url`, `status`, `ip_address`, `source`, `request_body`, `response_body`) VALUES
('log_02420c67-85e9-11e9-a6a6-966a0a06784e', '1559557142.3304100', 'plan_create', '/api/v1/plan/create', 200, 'None', 'None', '{\'amount\': \'4\', \'currency\': \'INR\', \'interval\': \'hour\', \'name\': \'sample1\', \'intervalCount\': \'1\', \'billingCycles\': \'2\', \'trialPeriodDays\': \'1\', \'recursTo\': \'\', \'metadata\': 0}', '{\'id\': \'plan_02420c64-85e9-11e9-a6a6-966a0a06784e\', \'created\': \'1559557142.3269200\', \'objectType\': \'plan\', \'amount\': 4.0, \'currency\': \'INR\', \'interval\': \'hour\', \'intervalCount\': 1, \'name\': \'sample1\', \'trialPeriodDays\': 1}'),
('log_2cc10c63-85e9-11e9-a6a6-966a0a06784e', '1559557213.6270300', 'plan_create', '/api/v1/plan/create', 200, 'None', 'None', '{\'amount\': \'32\', \'currency\': \'INR\', \'interval\': \'week\', \'name\': \'tesr2\', \'intervalCount\': \'1\', \'billingCycles\': \'1\', \'trialPeriodDays\': \'2\', \'recursTo\': \'\', \'metadata\': 0}', '{\'id\': \'plan_2cc10c60-85e9-11e9-a6a6-966a0a06784e\', \'created\': \'1559557213.6235500\', \'objectType\': \'plan\', \'amount\': 32.0, \'currency\': \'INR\', \'interval\': \'week\', \'intervalCount\': 1, \'name\': \'tesr2\', \'trialPeriodDays\': 2}'),
('log_4acfe643-85e9-11e9-a6a6-966a0a06784e', '1559557264.0568600', 'plan_create', '/api/v1/plan/create', 200, 'None', 'None', '{\'amount\': \'67\', \'currency\': \'GEL\', \'interval\': \'hour\', \'name\': \'sample3\', \'intervalCount\': \'2\', \'billingCycles\': \'1\', \'trialPeriodDays\': \'2\', \'recursTo\': \'\', \'metadata\': 0}', '{\'id\': \'plan_4acfe640-85e9-11e9-a6a6-966a0a06784e\', \'created\': \'1559557264.0524800\', \'objectType\': \'plan\', \'amount\': 67.0, \'currency\': \'GEL\', \'interval\': \'hour\', \'intervalCount\': 2, \'name\': \'sample3\', \'trialPeriodDays\': 2}'),
('log_8e07db23-85e9-11e9-a6a6-966a0a06784e', '1559557376.8302900', 'plan_create', '/api/v1/plan/create', 200, 'None', 'None', '{\'amount\': \'3\', \'currency\': \'INR\', \'interval\': \'month\', \'name\': \'testr6\', \'intervalCount\': \'4\', \'billingCycles\': \'3\', \'trialPeriodDays\': \'3\', \'recursTo\': \'\', \'metadata\': 0}', '{\'id\': \'plan_8e07db20-85e9-11e9-a6a6-966a0a06784e\', \'created\': \'1559557376.8265900\', \'objectType\': \'plan\', \'amount\': 3.0, \'currency\': \'INR\', \'interval\': \'month\', \'intervalCount\': 4, \'name\': \'testr6\', \'trialPeriodDays\': 3}'),
('log_1fcd5032-85ea-11e9-a6a6-966a0a06784e', '1559557621.3903700', 'plan_delete', '/api/v1/plan/delete', 200, 'None', 'None', '{\'plan_id\': \'plan_8e07db20-85e9-11e9-a6a6-966a0a06784e\'}', '{\'plan_id\': \'plan_8e07db20-85e9-11e9-a6a6-966a0a06784e\'}'),
('log_26bfcbea-85ea-11e9-a6a6-966a0a06784e', '1559557633.0458700', 'plan_delete', '/api/v1/plan/delete', 200, 'None', 'None', '{\'plan_id\': \'plan_4acfe640-85e9-11e9-a6a6-966a0a06784e\'}', '{\'plan_id\': \'plan_4acfe640-85e9-11e9-a6a6-966a0a06784e\'}'),
('log_0c53aecf-85eb-11e9-a6a6-966a0a06784e', '1559558018.2189100', 'charge create', '/api/v1/charge/create', 200, 'None', 'None', '{\'amount\': 1223.0, \'currency\': \'INR\', \'description\': \'testing...\', \'customerId\': \'60079b77-85d9-11e9-a6a6-966a0a06784e\', \'card\': 0, \'number\': 0, \'exp_month\': 0, \'exp_year\': 0, \'cvc\': 0, \'cardholdername\': 0, \'captured\': 0, \'refunded\': 0, \'disputed\': 0, \'sh_name\': 0, \'sh_address1\': 0, \'sh_address2\': 0, \'sh_zip\': 0, \'sh_city\': 0, \'sh_state\': 0, \'sh_country\': 0, \'bil_name\': 0, \'bil_address1\': 0, \'bil_address2\': 0, \'bil_city\': 0, \'bil_state\': 0, \'bil_country\': 0, \'vat\': 0, \'metadata\': 0}', '{\'id\': \'0c53aecc-85eb-11e9-a6a6-966a0a06784e\', \'created\': 1559558018.2150106, \'objectType\': \'charge\', \'amount\': 1223.0, \'currency\': \'INR\', \'description\': \'testing...\', \'card\': {\'id\': \'null\', \'created\': \'0\', \'objectType\': \'null\', \'first6\': \'0\', \'last4\': \'0\', \'fingerprint\': \'null\', \'expMonth\': \'0\', \'expYear\': \'0\', \'cardholderName\': \'null\', \'customerId\': \'60079b77-85d9-11e9-a6a6-966a0a06784e\', \'brand\': \'null\', \'type\': \'null\', \'country\': \'null\'}, \'captured\': 0, \'refunded\': 0, \'disputed\': 0}'),
('log_e429ae07-85ec-11e9-a6a6-966a0a06784e', '1559558809.8272200', 'crosssale create', '/api/v1/crosssale/create', 200, 'None', 'None', '{\'amount\': \'12\', \'currency\': \'INR\', \'capture\': \'true\', \'planId\': 0, \'captureCharges\': \'0\', \'template\': \'text_only\', \'title\': \'XXCV\', \'description\': \'SDFSDF\', \'imageData\': \'\', \'companyName\': \'SDFSD\', \'companyLocation\': \'VU\', \'termsAndConditionsUrl\': \'https://securionpay.com/cross-sale-offers\', \'visibleForAllPartners\': 0, \'visibleForPartnerIds\': 0, \'metadata\': 0, \'partnerId\': 0}', '{\'id\': \'cso_e429ae04-85ec-11e9-a6a6-966a0a06784e\', \'created\': \'1559558809.8225000\', \'objectType\': \'CrossSaleOffer\', \'charge\': {\'amount\': 12.0, \'currency\': \'INR\', \'capture\': 0}, \'template\': \'text_only\', \'title\': \'XXCV\', \'description\': \'SDFSDF\', \'imageUrl\': \'\', \'companyName\': \'SDFSD\', \'companyLocation\': \'VU\', \'termsAndConditionsUrl\': \'https://securionpay.com/cross-sale-offers\', \'visibleForAllPartners\': 0}'),
('log_a786b7e2-85f5-11e9-a6a6-966a0a06784e', '1559562573.5618800', 'charge_refunded', '/api/v1/charge/refund', 200, 'None', 'None', '{\'chargeId\': \'d43ac980-85e5-11e9-a6a6-966a0a06784e\', \'amount\': \'30\'}', '{\'id\': \'d43ac980-85e5-11e9-a6a6-966a0a06784e\', \'created\': \'1559555776.6154000\', \'objectType\': \'charge\', \'amount\': 45.0, \'currency\': \'ALL\', \'description\': \'cxvxcvcv\', \'card\': {\'id\': \'card_d43ac981-85e5-11e9-a6a6-966a0a06784e\', \'created\': \'1559555776.6154900\', \'objectType\': \'card\', \'first6\': 402400, \'last4\': 4842, \'fingerprint\': \'d50bb9e92e1ef4124781e0e6046e8be519bfd96461971f621c28fb82\', \'expMonth\': 5, \'expYear\': 2024, \'cardholderName\': \'subhashKr\', \'customerId\': \'0\', \'brand\': \'Visa\', \'type\': \'type\', \'country\': \'country\'}, \'captured\': 1, \'refunded\': 1, \'refunded_amt\': 37.0, \'disputed\': 0}'),
('log_858c0bda-85f8-11e9-a6a6-966a0a06784e', '1559563805.0445700', 'crosssale_update', '/api/v1/crosssale/update', 200, 'None', 'None', '{\'crossSaleOfferId\': \'cso_7dc65054-85ec-11e9-a6a6-966a0a06784e\', \'amount\': \'\', \'currency\': \'\', \'capture\': \'0\', \'planId\': \'plan_e2b2442c-85e8-11e9-a6a6-966a0a06784e\', \'captureCharges\': 0, \'template\': \'undefined\', \'title\': \'qwew\', \'description\': \'cvcbdf\', \'imageData\': \'\', \'companyName\': \'vee\', \'companyLocation\': \'KH\', \'termsAndConditionsUrl\': \'https://securionpay.com/cross-sale-offers/\', \'visibleForAllPartners\': 0, \'visibleForPartnerIds\': 0, \'metadata\': 0, \'partnerId\': 0}', '{\'id\': \'cso_7dc65054-85ec-11e9-a6a6-966a0a06784e\', \'created\': \'1559558638.0436600\', \'objectType\': \'CrossSaleOffer\', \'subscription\': {\'planId\': \'plan_e2b2442c-85e8-11e9-a6a6-966a0a06784e\', \'captureCharges\': 0}, \'template\': \'undefined\', \'title\': \'qwew\', \'description\': \'cvcbdf\', \'imageUrl\': \'\', \'companyName\': \'vee\', \'companyLocation\': \'KH\', \'termsAndConditionsUrl\': \'https://securionpay.com/cross-sale-offers/\', \'visibleForAllPartners\': 0}'),
('log_13b2f3ed-85f9-11e9-a6a6-966a0a06784e', '1559564043.5406400', 'crosssale create', '/api/v1/crosssale/create', 200, 'None', 'None', '{\'amount\': \'77\', \'currency\': \'UAH\', \'capture\': \'true\', \'planId\': 0, \'captureCharges\': \'0\', \'template\': \'text_only\', \'title\': \'cxvvc\', \'description\': \'xcvccvcvc\', \'imageData\': \'\', \'companyName\': \'xcvxcvsfd\', \'companyLocation\': \'AR\', \'termsAndConditionsUrl\': \'https://securionpay.com/cross-sale\', \'visibleForAllPartners\': 0, \'visibleForPartnerIds\': 0, \'metadata\': 0, \'partnerId\': 0}', '{\'id\': \'cso_13b2f3ea-85f9-11e9-a6a6-966a0a06784e\', \'created\': \'1559564043.5357700\', \'objectType\': \'CrossSaleOffer\', \'charge\': {\'amount\': 77.0, \'currency\': \'UAH\', \'capture\': 0}, \'template\': \'text_only\', \'title\': \'cxvvc\', \'description\': \'xcvccvcvc\', \'imageUrl\': \'\', \'companyName\': \'xcvxcvsfd\', \'companyLocation\': \'AR\', \'termsAndConditionsUrl\': \'https://securionpay.com/cross-sale\', \'visibleForAllPartners\': 0}'),
('log_8c7e70b7-85fa-11e9-a6a6-966a0a06784e', '1559564675.6973600', 'crosssale create', '/api/v1/crosssale/create', 200, 'None', 'None', '{\'amount\': \'1221212112121\', \'currency\': \'CDF\', \'capture\': \'true\', \'planId\': 0, \'captureCharges\': \'0\', \'template\': \'text_only\', \'title\': \'were\', \'description\': \'captured\', \'imageData\': \'\', \'companyName\': \'captured\', \'companyLocation\': \'VU\', \'termsAndConditionsUrl\': \'https://securionpay.com/cross-sale\', \'visibleForAllPartners\': 0, \'visibleForPartnerIds\': 0, \'metadata\': 0, \'partnerId\': 0}', '{\'id\': \'cso_8c7e70b4-85fa-11e9-a6a6-966a0a06784e\', \'created\': \'1559564675.6927200\', \'objectType\': \'CrossSaleOffer\', \'charge\': {\'amount\': 1221212110848.0, \'currency\': \'CDF\', \'capture\': 0}, \'template\': \'text_only\', \'title\': \'were\', \'description\': \'captured\', \'imageUrl\': \'\', \'companyName\': \'captured\', \'companyLocation\': \'VU\', \'termsAndConditionsUrl\': \'https://securionpay.com/cross-sale\', \'visibleForAllPartners\': 0}'),
('log_1cb27165-85fb-11e9-a6a6-966a0a06784e', '1559564917.6292700', 'crosssale create', '/api/v1/crosssale/create', 200, 'None', 'None', '{\'amount\': \'1\', \'currency\': \'AMD\', \'capture\': \'true\', \'planId\': 0, \'captureCharges\': \'0\', \'template\': \'text_only\', \'title\': \'etr\', \'description\': \'cbvn\', \'imageData\': \'\', \'companyName\': \'cxv\', \'companyLocation\': \'AS\', \'termsAndConditionsUrl\': \'https://securionpay.com/cross-sale\', \'visibleForAllPartners\': 0, \'visibleForPartnerIds\': 0, \'metadata\': 0, \'partnerId\': 0}', '{\'id\': \'cso_1cb27162-85fb-11e9-a6a6-966a0a06784e\', \'created\': \'1559564917.6253700\', \'objectType\': \'CrossSaleOffer\', \'charge\': {\'amount\': 1.0, \'currency\': \'AMD\', \'capture\': 0}, \'template\': \'text_only\', \'title\': \'etr\', \'description\': \'cbvn\', \'imageUrl\': \'\', \'companyName\': \'cxv\', \'companyLocation\': \'AS\', \'termsAndConditionsUrl\': \'https://securionpay.com/cross-sale\', \'visibleForAllPartners\': 0}'),
('log_7bb9a5bf-85fc-11e9-a6a6-966a0a06784e', '1559565506.5574200', 'crosssale create', '/api/v1/crosssale/create', 200, 'None', 'None', '{\'amount\': \'5674567\', \'currency\': \'BBD\', \'capture\': \'1\', \'planId\': 0, \'captureCharges\': \'0\', \'template\': \'image_and_text\', \'title\': \'fdghdfh\', \'description\': \'fryhrfy\', \'imageData\': \'\', \'companyName\': \'dftudfydf\', \'companyLocation\': \'AT\', \'termsAndConditionsUrl\': \'fdghdfhdfydfh\', \'visibleForAllPartners\': 0, \'visibleForPartnerIds\': 0, \'metadata\': 0, \'partnerId\': 0}', '{\'id\': \'cso_7bb9a5bc-85fc-11e9-a6a6-966a0a06784e\', \'created\': \'1559565506.5529100\', \'objectType\': \'CrossSaleOffer\', \'charge\': {\'amount\': 5674567.0, \'currency\': \'BBD\', \'capture\': 1}, \'template\': \'image_and_text\', \'title\': \'fdghdfh\', \'description\': \'fryhrfy\', \'imageUrl\': \'\', \'companyName\': \'dftudfydf\', \'companyLocation\': \'AT\', \'termsAndConditionsUrl\': \'fdghdfhdfydfh\', \'visibleForAllPartners\': 0}'),
('log_d6628263-8604-11e9-a6a6-966a0a06784e', '1559569094.6341500', 'charge create', '/api/v1/charge/create', 200, 'None', 'None', '{\'amount\': 1223.0, \'currency\': \'INR\', \'description\': \'testing...\', \'customerId\': \'60079b77-85d9-11e9-a6a6-966a0a06784e\', \'card\': 0, \'number\': 0, \'exp_month\': 0, \'exp_year\': 0, \'cvc\': 0, \'cardholdername\': 0, \'captured\': 0, \'refunded\': 0, \'disputed\': 0, \'sh_name\': 0, \'sh_address1\': 0, \'sh_address2\': 0, \'sh_zip\': 0, \'sh_city\': 0, \'sh_state\': 0, \'sh_country\': 0, \'bil_name\': 0, \'bil_address1\': 0, \'bil_address2\': 0, \'bil_city\': 0, \'bil_state\': 0, \'bil_country\': 0, \'vat\': 0, \'metadata\': 0}', '{\'id\': \'d6628260-8604-11e9-a6a6-966a0a06784e\', \'created\': 1559569094.63019, \'objectType\': \'charge\', \'amount\': 1223.0, \'currency\': \'INR\', \'description\': \'testing...\', \'card\': {\'id\': \'null\', \'created\': \'0\', \'objectType\': \'null\', \'first6\': \'0\', \'last4\': \'0\', \'fingerprint\': \'null\', \'expMonth\': \'0\', \'expYear\': \'0\', \'cardholderName\': \'null\', \'customerId\': \'60079b77-85d9-11e9-a6a6-966a0a06784e\', \'brand\': \'null\', \'type\': \'null\', \'country\': \'null\'}, \'captured\': 0, \'refunded\': 0, \'disputed\': 0}'),
('log_da354961-8604-11e9-a6a6-966a0a06784e', '1559569101.0473900', 'charge create', '/api/v1/charge/create', 200, 'None', 'None', '{\'amount\': 1223.0, \'currency\': \'INR\', \'description\': \'testing...\', \'customerId\': \'60079b77-85d9-11e9-a6a6-966a0a06784e\', \'card\': 0, \'number\': 0, \'exp_month\': 0, \'exp_year\': 0, \'cvc\': 0, \'cardholdername\': 0, \'captured\': 0, \'refunded\': 0, \'disputed\': 0, \'sh_name\': 0, \'sh_address1\': 0, \'sh_address2\': 0, \'sh_zip\': 0, \'sh_city\': 0, \'sh_state\': 0, \'sh_country\': 0, \'bil_name\': 0, \'bil_address1\': 0, \'bil_address2\': 0, \'bil_city\': 0, \'bil_state\': 0, \'bil_country\': 0, \'vat\': 0, \'metadata\': 0}', '{\'id\': \'da35495e-8604-11e9-a6a6-966a0a06784e\', \'created\': 1559569101.044072, \'objectType\': \'charge\', \'amount\': 1223.0, \'currency\': \'INR\', \'description\': \'testing...\', \'card\': {\'id\': \'null\', \'created\': \'0\', \'objectType\': \'null\', \'first6\': \'0\', \'last4\': \'0\', \'fingerprint\': \'null\', \'expMonth\': \'0\', \'expYear\': \'0\', \'cardholderName\': \'null\', \'customerId\': \'60079b77-85d9-11e9-a6a6-966a0a06784e\', \'brand\': \'null\', \'type\': \'null\', \'country\': \'null\'}, \'captured\': 0, \'refunded\': 0, \'disputed\': 0}'),
('log_2c0ba9d0-8684-11e9-a6a6-966a0a06784e', '1559623784.4280400', 'update', '/api/v1/customer/update', 200, 'None', 'None', '{\'customer_id\': \'c8be2c17-85cf-11e9-a6a6-966a0a06784e\', \'email\': \'cxbvvcb@gmail.com\', \'description\': \'vcvcvxc\', \'defaultCardId\': 0, \'metadata\': 0, \'card\': 0}', '{\'id\': \'c8be2c17-85cf-11e9-a6a6-966a0a06784e\', \'created\': \'1559546308.4142845\', \'objectType\': \'customer\', \'email\': \'cxbvvcb@gmail.com\', \'description\': \'vcvcvxc\', \'defaultCardId\': \'0\'}'),
('log_6ea401f3-8684-11e9-a6a6-966a0a06784e', '1559623896.1583300', 'update', '/api/v1/card/create', 200, 'None', 'None', '{\'customerId\': \'c8be2c17-85cf-11e9-a6a6-966a0a06784e\', \'card\': {\'id\': \'card_6ea401f0-8684-11e9-a6a6-966a0a06784e\', \'created\': 1559623896.155894, \'objectType\': \'card\', \'first6\': \'402400\', \'last4\': \'1187\', \'fingerprint\': \'02eff1364cb2018c2a88f48c2d497ca482e634759353e48858b616cc\', \'expMonth\': \'10\', \'expYear\': \'2026\', \'cardholderName\': \'test\', \'customerId\': \'c8be2c17-85cf-11e9-a6a6-966a0a06784e\', \'brand\': \'Visa\', \'type\': \'type\', \'country\': \'country\', \'addressLine1\': 0, \'addressLine2\': 0, \'addressCity\': 0, \'addressState\': 0, \'addressZip\': 0, \'addressCountry\': 0, \'ipAddress\': 0, \'email\': 0, \'userAgent\': 0, \'acceptLanguage\': 0}, \'number\': \'4024007114621187\', \'exp_month\': \'10\', \'exp_year\': \'2026\', \'cvc\': \'212\', \'cardholdername\': \'test\', \'addressLine1\': 0, \'addressLine2\': 0, \'addressCity\': 0, \'addressState\': 0, \'addressZip\': 0, \'addressCountry\': 0, \'ipAddress\': 0, \'email\': 0, \'userAgent\': 0, \'acceptLanguage\': 0}', '{\'id\': \'card_6ea401f0-8684-11e9-a6a6-966a0a06784e\', \'created\': \'1559623896.155894\', \'objectType\': \'card\', \'first6\': \'402400\', \'last4\': \'1187\', \'fingerprint\': \'02eff1364cb2018c2a88f48c2d497ca482e634759353e48858b616cc\', \'expMonth\': \'10\', \'expYear\': \'2026\', \'cardholderName\': \'test\', \'customerId\': \'c8be2c17-85cf-11e9-a6a6-966a0a06784e\', \'brand\': \'Visa\', \'type\': \'type\', \'country\': \'country\'}'),
('log_e83d9a1f-8684-11e9-a6a6-966a0a06784e', '1559624100.1692400', 'update', '/api/v1/card/create', 200, 'None', 'None', '{\'customerId\': \'c8be2c17-85cf-11e9-a6a6-966a0a06784e\', \'card\': {\'id\': \'card_e83d9a1c-8684-11e9-a6a6-966a0a06784e\', \'created\': 1559624100.1668, \'objectType\': \'card\', \'first6\': \'402400\', \'last4\': \'8684\', \'fingerprint\': \'317608417e7ab68b9291b33f8c7e9484ee8c503e7f53c967d067035e\', \'expMonth\': \'6\', \'expYear\': \'2022\', \'cardholderName\': \'yest1\', \'customerId\': \'c8be2c17-85cf-11e9-a6a6-966a0a06784e\', \'brand\': \'Visa\', \'type\': \'type\', \'country\': \'country\', \'addressLine1\': 0, \'addressLine2\': 0, \'addressCity\': 0, \'addressState\': 0, \'addressZip\': 0, \'addressCountry\': 0, \'ipAddress\': 0, \'email\': 0, \'userAgent\': 0, \'acceptLanguage\': 0}, \'number\': \'4024007118468684\', \'exp_month\': \'6\', \'exp_year\': \'2022\', \'cvc\': \'332\', \'cardholdername\': \'yest1\', \'addressLine1\': 0, \'addressLine2\': 0, \'addressCity\': 0, \'addressState\': 0, \'addressZip\': 0, \'addressCountry\': 0, \'ipAddress\': 0, \'email\': 0, \'userAgent\': 0, \'acceptLanguage\': 0}', '{\'id\': \'card_e83d9a1c-8684-11e9-a6a6-966a0a06784e\', \'created\': \'1559624100.1668\', \'objectType\': \'card\', \'first6\': \'402400\', \'last4\': \'8684\', \'fingerprint\': \'317608417e7ab68b9291b33f8c7e9484ee8c503e7f53c967d067035e\', \'expMonth\': \'6\', \'expYear\': \'2022\', \'cardholderName\': \'yest1\', \'customerId\': \'c8be2c17-85cf-11e9-a6a6-966a0a06784e\', \'brand\': \'Visa\', \'type\': \'type\', \'country\': \'country\'}');

-- --------------------------------------------------------

--
-- Table structure for table `loginlogs`
--

CREATE TABLE `loginlogs` (
  `login_id` varchar(255) DEFAULT NULL,
  `platform` varchar(255) DEFAULT NULL,
  `browser` varchar(255) DEFAULT NULL,
  `ipaddress` varchar(255) DEFAULT NULL,
  `type` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `loginlogs`
--

INSERT INTO `loginlogs` (`login_id`, `platform`, `browser`, `ipaddress`, `type`) VALUES
('neha', NULL, NULL, NULL, 'login'),
('neha', NULL, NULL, NULL, 'logout'),
('neha', NULL, NULL, NULL, 'login'),
('neha', NULL, NULL, NULL, 'login'),
('neha', NULL, NULL, NULL, 'login'),
('neha', NULL, NULL, NULL, 'login'),
('yoyo', NULL, NULL, NULL, 'login'),
('yoyo', NULL, NULL, NULL, 'login'),
('yoyo', NULL, NULL, NULL, 'login'),
('neha', NULL, NULL, NULL, 'login'),
('neha', NULL, NULL, NULL, 'login'),
('yoyoyo', NULL, NULL, NULL, 'login'),
('yoyo', NULL, NULL, NULL, 'login'),
('yoyo', NULL, NULL, NULL, 'login'),
('yoyo', NULL, NULL, NULL, 'login'),
('yoyoyo', NULL, NULL, NULL, 'login'),
('yoyoyo', NULL, NULL, NULL, 'login'),
('yoyo', NULL, NULL, NULL, 'login'),
('yoyo', NULL, NULL, NULL, 'login'),
('yoyoyo', NULL, NULL, NULL, 'login'),
('prem', NULL, NULL, NULL, 'login'),
('neha', NULL, NULL, NULL, 'login'),
('prem', NULL, NULL, NULL, 'logout'),
('prem', NULL, NULL, NULL, 'logout'),
('prem', NULL, NULL, NULL, 'login'),
('prem', NULL, NULL, NULL, 'logout'),
('prem', NULL, NULL, NULL, 'logout'),
('prem', NULL, NULL, NULL, 'login'),
('prem', NULL, NULL, NULL, 'logout'),
('prem', NULL, NULL, NULL, 'logout'),
('prem', NULL, NULL, NULL, 'login'),
('prem', NULL, NULL, NULL, 'logout'),
('prem', NULL, NULL, NULL, 'login'),
('prem', NULL, NULL, NULL, 'login'),
('prem', NULL, NULL, NULL, 'logout'),
('prem', NULL, NULL, NULL, 'login'),
('neha', NULL, NULL, NULL, 'login'),
('prem', NULL, NULL, NULL, 'login'),
('kl', NULL, NULL, NULL, 'login'),
('s11', NULL, NULL, NULL, 'login'),
('s11', NULL, NULL, NULL, 'logout'),
('selvan', NULL, NULL, NULL, 'login'),
('selvan', NULL, NULL, NULL, 'logout'),
('neha', NULL, NULL, NULL, 'login'),
('neha', NULL, NULL, NULL, 'logout'),
('selvan2', NULL, NULL, NULL, 'login'),
('selvan2', NULL, NULL, NULL, 'login'),
('prem', NULL, NULL, NULL, 'logout'),
('loki', NULL, NULL, NULL, 'login'),
('loki', NULL, NULL, NULL, 'login'),
('prem', NULL, NULL, NULL, 'login'),
('subh', NULL, NULL, NULL, 'login'),
('prem', NULL, NULL, NULL, 'login'),
('subh', NULL, NULL, NULL, 'logout'),
('prem', NULL, NULL, NULL, 'login'),
('prem', NULL, NULL, NULL, 'logout'),
('prem', NULL, NULL, NULL, 'logout'),
('prem', NULL, NULL, NULL, 'logout'),
('prem', NULL, NULL, NULL, 'login'),
('prem', NULL, NULL, NULL, 'logout'),
('prem', NULL, NULL, NULL, 'logout'),
('kl', NULL, NULL, NULL, 'logout'),
('prem', NULL, NULL, NULL, 'login'),
('prem', NULL, NULL, NULL, 'logout'),
('prem', NULL, NULL, NULL, 'logout'),
('prem', NULL, NULL, NULL, 'login'),
('prem', NULL, NULL, NULL, 'logout'),
('prem', NULL, NULL, NULL, 'login'),
('prem', NULL, NULL, NULL, 'logout'),
('prem', NULL, NULL, NULL, 'logout'),
('prem', NULL, NULL, NULL, 'login'),
('prem', NULL, NULL, NULL, 'login'),
('subh', NULL, NULL, NULL, 'login'),
('prem', NULL, NULL, NULL, 'login'),
('prem', NULL, NULL, NULL, 'login'),
('prem', NULL, NULL, NULL, 'logout'),
('prem', NULL, NULL, NULL, 'login'),
('leonardo', NULL, NULL, NULL, 'login');

-- --------------------------------------------------------

--
-- Table structure for table `merchant`
--

CREATE TABLE `merchant` (
  `username` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `secret_code` varchar(16) DEFAULT NULL,
  `countrycode` varchar(3) DEFAULT NULL,
  `phone` int(10) DEFAULT NULL,
  `Role` varchar(10) DEFAULT NULL,
  `isphone` tinyint(1) DEFAULT NULL,
  `isemail` tinyint(1) DEFAULT NULL,
  `isGA` tinyint(1) DEFAULT NULL,
  `pcode` varchar(6) DEFAULT NULL,
  `ecode` varchar(6) DEFAULT NULL,
  `isBanned` tinyint(1) DEFAULT NULL,
  `lockuntill` decimal(18,7) DEFAULT NULL,
  `referalid` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `merchant`
--

INSERT INTO `merchant` (`username`, `full_name`, `email`, `password`, `secret_code`, `countrycode`, `phone`, `Role`, `isphone`, `isemail`, `isGA`, `pcode`, `ecode`, `isBanned`, `lockuntill`, `referalid`) VALUES
('yoyo', 'yoyo', 'yoyo@gmail.com', '79356fe27d3ccad795bbbf22a0fda9e250a619dfe19655c0edc61757', 'TOYM6LOCTF7KC2MW', '+91', 96385274, 'merchent', 0, 0, 1, 'ljvdvi', 'efeymk', NULL, NULL, '0'),
('yoyoyo', 'yoyo', 'yoyoyo@gmail.com', '79356fe27d3ccad795bbbf22a0fda9e250a619dfe19655c0edc61757', '0', '+91', 96385274, 'merchent', 0, 0, 0, 'ehercs', 'doagxm', NULL, NULL, '0');

-- --------------------------------------------------------

--
-- Table structure for table `plan`
--

CREATE TABLE `plan` (
  `plan_id` varchar(41) NOT NULL,
  `created` decimal(18,7) DEFAULT NULL,
  `objectType` varchar(255) DEFAULT NULL,
  `amount` float(200,10) DEFAULT NULL,
  `currency` varchar(200) DEFAULT NULL,
  `intervals` varchar(200) DEFAULT NULL,
  `intervalCount` int(10) DEFAULT NULL,
  `billingCycles` varchar(200) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `trialPeriodDays` int(10) DEFAULT NULL,
  `recursTo` varchar(200) DEFAULT NULL,
  `metadata` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `plan`
--

INSERT INTO `plan` (`plan_id`, `created`, `objectType`, `amount`, `currency`, `intervals`, `intervalCount`, `billingCycles`, `name`, `trialPeriodDays`, `recursTo`, `metadata`) VALUES
('plan_02420c64-85e9-11e9-a6a6-966a0a06784e', '1559557142.3269200', 'plan', 4.0000000000, 'INR', 'hour', 1, '2', 'sample1', 1, '', '0'),
('plan_0aef97fc-846b-11e9-a6a6-966a0a06784e', '1559393089.1353200', 'plan', 43.0000000000, 'INR', 'hour', 3434, '2', 'dgfgfg', 2, '', '0'),
('plan_15879ebe-7af0-11e9-a6a6-966a0a06784e', '1558350718.3462000', 'plan', 1234123.0000000000, 'EUR', 'hour', 1, '1', 'fwfwf', 1, '', '0'),
('plan_15ebb35c-846b-11e9-a6a6-966a0a06784e', '1559393107.5647200', 'plan', 2.0000000000, 'INR', 'day', 1, '1', 'gfdgfh', 2, '', '0'),
('plan_2a06ecee-846b-11e9-a6a6-966a0a06784e', '1559393141.2975700', 'plan', 2.0000000000, 'INR', 'day', 1, '3', 'xcv', 2, '', '0'),
('plan_2cc10c60-85e9-11e9-a6a6-966a0a06784e', '1559557213.6235500', 'plan', 32.0000000000, 'INR', 'week', 1, '1', 'tesr2', 2, '', '0'),
('plan_3563d3c2-846b-11e9-a6a6-966a0a06784e', '1559393160.3613900', 'plan', 56789.0000000000, 'SDG', 'hour', 2, '1', 'cvcv', 12, '', '0'),
('plan_40964810-846b-11e9-a6a6-966a0a06784e', '1559393179.1470300', 'plan', 2122.0000000000, 'DJF', 'day', 2, '1', 'xcvxc', 1, '', '0'),
('plan_41872534-7af0-11e9-a6a6-966a0a06784e', '1558350792.1627500', 'plan', 2.0000000000, 'AED', 'hour', 6, '2', 'hello', 2, '', '0'),
('plan_4b99a3ba-846b-11e9-a6a6-966a0a06784e', '1559393197.6239000', 'plan', 3223.0000000000, 'DJF', 'week', 2, '4', 'xcxvc', 4, '', '0'),
('plan_8a0da910-85e8-11e9-a6a6-966a0a06784e', '1559556940.6569900', 'plan', 1.0000000000, 'INR', 'hour', 1, '1', 'test', 1, '', '0'),
('plan_b039ecd4-85e8-11e9-a6a6-966a0a06784e', '1559557004.7005100', 'plan', 12.0000000000, 'INR', 'hour', 1, '1', 'test1', 1, '', '0'),
('plan_bc5f2576-846a-11e9-a6a6-966a0a06784e', '1559392957.3263900', 'plan', 1.0000000000, 'AMD', 'day', 1, '1', 'Rahul', 2, '', '0'),
('plan_de1bc0d4-846a-11e9-a6a6-966a0a06784e', '1559393013.9272700', 'plan', 212.0000000000, 'INR', 'week', 1, '1', 'cxz', 1, '', '0'),
('plan_e2b2442c-85e8-11e9-a6a6-966a0a06784e', '1559557089.3752500', 'plan', 3.0000000000, 'INR', 'hour', 1, '1', 'sample', 1, '', '0'),
('plan_ebeacde5-846a-11e9-a6a6-966a0a06784e', '1559393037.2183300', 'plan', 1.0000000000, 'INR', 'week', 12, '1', 'cvxcv', 11, '', '0'),
('plan_f6732bb8-846a-11e9-a6a6-966a0a06784e', '1559393054.7654500', 'plan', 1.0000000000, 'ALL', 'day', 1, '1', 'wqww', 233, '', '0'),
('plan_ff8123e0-846a-11e9-a6a6-966a0a06784e', '1559393069.9565200', 'plan', 65.0000000000, 'INR', 'hour', 4, '44', 'cvc', 5, '', '0');

-- --------------------------------------------------------

--
-- Table structure for table `shipping`
--

CREATE TABLE `shipping` (
  `charge_id` varchar(36) NOT NULL,
  `sh_name` varchar(36) DEFAULT NULL,
  `sh_address1` varchar(255) DEFAULT NULL,
  `sh_address2` varchar(255) DEFAULT NULL,
  `sh_zip` float(6,0) DEFAULT NULL,
  `sh_city` varchar(255) DEFAULT NULL,
  `sh_state` varchar(41) DEFAULT NULL,
  `sh_country` varchar(255) DEFAULT NULL,
  `bil_name` varchar(36) DEFAULT NULL,
  `bil_address1` varchar(255) DEFAULT NULL,
  `bil_address2` varchar(255) DEFAULT NULL,
  `bil_zip` float(6,0) DEFAULT NULL,
  `bil_city` varchar(255) DEFAULT NULL,
  `bil_state` varchar(41) DEFAULT NULL,
  `bil_country` varchar(255) DEFAULT NULL,
  `vat` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shipping`
--

INSERT INTO `shipping` (`charge_id`, `sh_name`, `sh_address1`, `sh_address2`, `sh_zip`, `sh_city`, `sh_state`, `sh_country`, `bil_name`, `bil_address1`, `bil_address2`, `bil_zip`, `bil_city`, `bil_state`, `bil_country`, `vat`) VALUES
('0181c940-8215-11e9-a6a6-966a0a06784e', 'sddsdsds', 'F-103, first floor, amrapali plaza, amrapali circle, vaishali nagar, jaipur', 'zsdfsdf', 121212, 'jaipur', 'rajasthan', 'IN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('1835e4c8-8215-11e9-a6a6-966a0a06784e', 'sddsdsds', 'F-103, first floor, amrapali plaza, amrapali circle, vaishali nagar, jaipur', 'f', 302021, 'jaipur', 'Rajasthan', 'FK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('23a2dbf0-85d9-11e9-a6a6-966a0a06784e', 'sddsdsds', 'WEFRASER', 'DGHSDFYH', 445745, 'DFUYDFU', 'FGHDFH', 'AX', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('56fb42be-82a3-11e9-a6a6-966a0a06784e', 'sddsdsds', 'xzcdxz', 'xcxcdsc', 123456, 'jaipur', 'sdfd', 'IN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('99f12172-8214-11e9-a6a6-966a0a06784e', 'sddsdsds', 'F-103, first floor, amrapali plaza, amrapali circle, vaishali nagar, jaipur', 'zsdfsdf', 121212, 'jaipur', 'rajasthan', 'IN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('d43ac980-85e5-11e9-a6a6-966a0a06784e', 'sddsdsds', 'xzcdxz', 'xcxcdsc', 123456, 'jaipur', 'sdfd', 'AO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('e0b953f0-82a9-11e9-a6a6-966a0a06784e', 'sddsdsds', 'xzcdxz', 'xcxcdsc', 123456, 'jaipur', 'sdfd', 'AT', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('ec212f3c-8214-11e9-a6a6-966a0a06784e', 'sddsdsds', 'F-103, first floor, amrapali plaza, amrapali circle, vaishali nagar, jaipur', 'zsdfsdf', 121212, 'jaipur', 'rajasthan', 'IN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('ee4fdfa2-8457-11e9-a6a6-966a0a06784e', 'sddsdsds', 'WEFRASER', 'DGHSDFYH', 445745, 'DFUYDFU', 'FGHDFH', 'DK', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('f8625a46-8214-11e9-a6a6-966a0a06784e', 'sddsdsds', 'F-103, first floor, amrapali plaza, amrapali circle, vaishali nagar, jaipur', 'zsdfsdf', 121212, 'jaipur', 'rajasthan', 'IN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('fd08a224-85d6-11e9-a6a6-966a0a06784e', 'sddsdsds', 'jailhata', 'jailhata', 822101, 'Ranchi', 'Jharkhand', 'GR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subscription`
--

CREATE TABLE `subscription` (
  `sub_id` varchar(41) NOT NULL,
  `created` decimal(18,7) DEFAULT NULL,
  `objectType` varchar(255) DEFAULT NULL,
  `planId` varchar(200) DEFAULT NULL,
  `customer_id` varchar(200) DEFAULT NULL,
  `quantity` int(10) DEFAULT NULL,
  `captureCharges` tinyint(1) DEFAULT NULL,
  `status_trialing` varchar(200) DEFAULT NULL,
  `status_active` varchar(200) DEFAULT NULL,
  `status_past_due` varchar(200) DEFAULT NULL,
  `status_canceled` varchar(200) DEFAULT NULL,
  `status_unpaid` varchar(200) DEFAULT NULL,
  `remainingBillingCycles` int(41) DEFAULT NULL,
  `start` float(255,20) DEFAULT NULL,
  `currentPeriodStart` float(255,20) DEFAULT NULL,
  `currentPeriodEnd` float(255,20) DEFAULT NULL,
  `canceledAt` float(255,20) DEFAULT NULL,
  `endedAt` float(255,20) DEFAULT NULL,
  `trialStart` float(255,20) DEFAULT NULL,
  `trialEnd` float(255,20) DEFAULT NULL,
  `cancelAtPeriodEnd` tinyint(1) DEFAULT NULL,
  `sh_name` varchar(200) DEFAULT NULL,
  `sh_address1` varchar(200) DEFAULT NULL,
  `sh_address2` varchar(200) DEFAULT NULL,
  `sh_zip` int(6) DEFAULT NULL,
  `sh_city` varchar(20) DEFAULT NULL,
  `sh_state` varchar(20) DEFAULT NULL,
  `sh_country` varchar(20) DEFAULT NULL,
  `bil_name` varchar(200) DEFAULT NULL,
  `bil_address1` varchar(200) DEFAULT NULL,
  `bil_address2` varchar(200) DEFAULT NULL,
  `bil_zip` int(6) DEFAULT NULL,
  `bil_city` varchar(20) DEFAULT NULL,
  `bil_state` varchar(30) DEFAULT NULL,
  `bil_country` varchar(20) DEFAULT NULL,
  `vat` varchar(200) DEFAULT NULL,
  `metadata` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subscription`
--

INSERT INTO `subscription` (`sub_id`, `created`, `objectType`, `planId`, `customer_id`, `quantity`, `captureCharges`, `status_trialing`, `status_active`, `status_past_due`, `status_canceled`, `status_unpaid`, `remainingBillingCycles`, `start`, `currentPeriodStart`, `currentPeriodEnd`, `canceledAt`, `endedAt`, `trialStart`, `trialEnd`, `cancelAtPeriodEnd`, `sh_name`, `sh_address1`, `sh_address2`, `sh_zip`, `sh_city`, `sh_state`, `sh_country`, `bil_name`, `bil_address1`, `bil_address2`, `bil_zip`, `bil_city`, `bil_state`, `bil_country`, `vat`, `metadata`) VALUES
('sub_08a59240-7aec-11e9-a6a6-966a0a06784e', '1558348978.7451200', 'subscription', 'plan_691204be-797b-11e9-a6a6-966a0a06784e', 'f01f6a17-603d-11e9-bcdd-966a0a06784e', 9, 0, NULL, 'active', NULL, NULL, NULL, NULL, 1558348928.00000000000000000000, 1558348928.00000000000000000000, 1558348928.00000000000000000000, 0.00000000000000000000, 0.00000000000000000000, 0.00000000000000000000, 8.00000000000000000000, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('sub_30e33326-8432-11e9-a6a6-966a0a06784e', '1559368671.4939900', 'subscription', 'plan_15879ebe-7af0-11e9-a6a6-966a0a06784e', 'c8316fef-5f8f-11e9-bcdd-966a0a06784e', 44, 0, NULL, 'active', NULL, NULL, NULL, NULL, 1559368704.00000000000000000000, 1559368704.00000000000000000000, 1559368704.00000000000000000000, 0.00000000000000000000, 0.00000000000000000000, 0.00000000000000000000, 0.00000000000000000000, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('sub_543e77fa-8431-11e9-a6a6-966a0a06784e', '1559368301.3156200', 'subscription', 'plan_15879ebe-7af0-11e9-a6a6-966a0a06784e', 'c8316fef-5f8f-11e9-bcdd-966a0a06784e', 44, 0, NULL, 'canceled', NULL, NULL, NULL, NULL, 1559368320.00000000000000000000, 1559368320.00000000000000000000, 1559368320.00000000000000000000, 0.00000000000000000000, 0.00000000000000000000, 0.00000000000000000000, 0.00000000000000000000, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('sub_92e3c92a-82aa-11e9-a6a6-966a0a06784e', '1559200473.1964800', 'subscription', 'plan_15879ebe-7af0-11e9-a6a6-966a0a06784e', '48b4b209-600c-11e9-bcdd-966a0a06784e', 1, 0, NULL, 'active', NULL, NULL, NULL, NULL, 1559200512.00000000000000000000, 1559200512.00000000000000000000, 1559200512.00000000000000000000, 0.00000000000000000000, 0.00000000000000000000, 0.00000000000000000000, 1.00000000000000000000, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('sub_966b324c-7af6-11e9-a6a6-966a0a06784e', '1558353511.5663100', 'subscription', 'plan_41872534-7af0-11e9-a6a6-966a0a06784e', 'e25c1ecb-601e-11e9-bcdd-966a0a06784e', 1, 0, NULL, 'active', NULL, NULL, NULL, NULL, 1558353536.00000000000000000000, 1558353536.00000000000000000000, 1558353536.00000000000000000000, 0.00000000000000000000, 0.00000000000000000000, 0.00000000000000000000, 2.00000000000000000000, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('sub_b9f4046a-7aeb-11e9-a6a6-966a0a06784e', '1558348846.7192000', 'subscription', 'plan_691204be-797b-11e9-a6a6-966a0a06784e', 'f01f6a17-603d-11e9-bcdd-966a0a06784e', 5, 0, NULL, 'active', NULL, NULL, NULL, NULL, 1558348800.00000000000000000000, 1558348800.00000000000000000000, 1558348800.00000000000000000000, 0.00000000000000000000, 0.00000000000000000000, 0.00000000000000000000, 1.00000000000000000000, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0'),
('sub_d3639dea-797c-11e9-a6a6-966a0a06784e', '1558191264.0939400', 'subscription', 'plan_691204be-797b-11e9-a6a6-966a0a06784e', '77855b5f-6058-11e9-bcdd-966a0a06784e', 1, 0, NULL, 'active', NULL, NULL, NULL, NULL, 1558191232.00000000000000000000, 1558191232.00000000000000000000, 1558191232.00000000000000000000, 0.00000000000000000000, 0.00000000000000000000, 0.00000000000000000000, 1.00000000000000000000, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0');

-- --------------------------------------------------------

--
-- Table structure for table `token`
--

CREATE TABLE `token` (
  `id` varchar(41) NOT NULL,
  `created` decimal(18,7) DEFAULT NULL,
  `objectType` varchar(255) DEFAULT NULL,
  `first6` int(6) DEFAULT NULL,
  `last4` int(6) DEFAULT NULL,
  `fingerprint` varchar(255) DEFAULT NULL,
  `expMonth` int(2) DEFAULT NULL,
  `expYear` int(2) DEFAULT NULL,
  `brand` varchar(10) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `cardholderName` varchar(20) DEFAULT NULL,
  `addressLine1` varchar(200) DEFAULT NULL,
  `addressLine2` varchar(200) DEFAULT NULL,
  `addressCity` varchar(200) DEFAULT NULL,
  `addressState` varchar(200) DEFAULT NULL,
  `addressZip` int(6) DEFAULT NULL,
  `addressCountry` varchar(20) DEFAULT NULL,
  `used` tinyint(1) DEFAULT NULL,
  `card_id` varchar(41) DEFAULT NULL,
  `ipAddress` varchar(20) DEFAULT NULL,
  `ipCountry` varchar(20) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `userAgent` varchar(200) DEFAULT NULL,
  `acceptLanguage` varchar(20) DEFAULT NULL,
  `3D_currency` varchar(10) DEFAULT NULL,
  `3D_enrolled` tinyint(1) DEFAULT NULL,
  `3D_liabilityShift` varchar(41) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `upload`
--

CREATE TABLE `upload` (
  `file_id` varchar(41) NOT NULL,
  `created` decimal(18,7) DEFAULT NULL,
  `objectType` varchar(255) DEFAULT NULL,
  `purpose` varchar(30) DEFAULT NULL,
  `size` int(10) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `url` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `username` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `secret_code` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`username`, `full_name`, `email`, `password`, `secret_code`) VALUES
('Test', 'Test', 'test@gmail.com', 'a7470858e79c282bc2f6adfd831b132672dfd1224c1e78cbf5bcd057', 'T4SVHDOJAJTX2P5Q'),
('Sample', 'Sample', 'sample@gmail.com', 'a7470858e79c282bc2f6adfd831b132672dfd1224c1e78cbf5bcd057', 'VJNG3GAEVLALSL5W'),
('neha', 'nehaagrawal', 'nehakumari@gmail.com', 'a7470858e79c282bc2f6adfd831b132672dfd1224c1e78cbf5bcd057', 'A74BWAAWUR7W5ZJW'),
('Praveen', 'Praveen Dagdi', 'techkopra@gmail.com', 'f8cdb04495ded47615258f9dc6a3f4707fd2405434fefc3cbf4ef4e6', 'JYQU7JWN4NCEC7FL'),
('prem', 'tytui', 'serawatpremchand143@gmail.com', 'a7470858e79c282bc2f6adfd831b132672dfd1224c1e78cbf5bcd057', 'YG72NIJRXA7ODDR4'),
('yoyo', 'yoyo', 'yoyo@gmail.com', 'b8958cbb6b9f374802dcf7645a79406e569f65b0ad53a4ef0999b491', 'YWSPJ5TNTTA4FE2O'),
('praveend', 'praveendagdi', 'techkopra1@gmail.com', '48dc583cf97265a7d482dea5b814005f015d1f45d1cf924bf3d0198b', 'RNFIRSZCH2OSNIYU'),
('kl', 'Test', 'aks6382@gmail.com', '7e6a4309ddf6e8866679f61ace4f621b0e3455ebac2e831a60f13cd1', 'AM7UKMCEQ5LHU3DD'),
('shobs', 'shobhit', 'shobhit@techkopra.com', 'e60aa5fd61ecbf3f4c10e21b69463b292099c57634a83fb34dfb6024', 'ZQ4TWMBE7AFGXHA4'),
('qw', 'asass', 'avfddf@gmail.com', 'ca34f2eba636dc12aa23d640f75b7aa0ea3aa9169809cbb4a133792e', 'Z2DWFXLTV6S6PF5Q'),
('er', 'xcdssd', 'asds@gmail.com', '99fb2f48c6af4761f904fc85f95eb56190e5d40b1f44ec3a9c1fa319', 'SUCS5VOJXW3J2ONF'),
('xcxv', 'hgfhgg', 'xdwsad@gmail.com', '573e4bb0feb7b77f2c66dbd6d74d014414d5faed66323f79e0390c46', 'U4BMZMAYEAYNC4JC'),
('as', 'adsd', 'asasad@gmail.com', '1fddb98583faa011c20fd2fdc5cf7cfe381a2f4f0ce33ee04d11c2b2', 'D5RAD5NKOB2B27YC'),
('s11', 'shobs', 'shobhit.techkopra@gmail.com', '475e16b00182c8548b96bf271728fdd676966e59b6e5ff80b44fd679', 'BJHZEYQQ2NJKXWLA'),
('selvan', 'selvan r', 'selvan@auricom.com.my', '90e1a91e18c42e30c60d2a78007207590e1e2a52a00dd9e6f4f7a9a2', 'CHUVPJVFBA2KJETB'),
('selvan2', 'selvan2', 'selvan@pylon-i.com', '1473b9d634b8dd84bff6c26a7c1013f0e6b72c144cefcda02bfadc10', 'GT5M66OFUD7PNSOD'),
('loki', 'loki', 'loki@gmail.com', '5a2fbee33fd775ad37848488ad1c332b73f432c907e21095f48a89e6', '2ZE3DOVTKTZZPZY6'),
('subh', 'Subhash Kumhar', 'aks@gmail.com', 'e4b648bea3c03fb2e4db4b1d8c3ba131e21028ee6e1759e1b025d664', 'SHOZU7DLTJAJS3NT'),
('lucifer', 'lucifer moorningstar', 'lucifer@gmail.com', '2df0bb75e2749fe693e0ecdf1c11cee3cae8eb985f116b3a32c5e876', 'KMKGKX63SKUGEQ2X'),
('leonardo', 'leonardo decaprio', 'leonardo@gmail.com', '57df1f7312a8ed17c15bc9d445a4818bcc91609d9d85d0854bc5b4a7', 'VU3CN2ZIR7EGQS3V');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blacklist`
--
ALTER TABLE `blacklist`
  ADD PRIMARY KEY (`black_id`);

--
-- Indexes for table `cards`
--
ALTER TABLE `cards`
  ADD PRIMARY KEY (`card_id`);

--
-- Indexes for table `charge`
--
ALTER TABLE `charge`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `credit`
--
ALTER TABLE `credit`
  ADD PRIMARY KEY (`credit_id`);

--
-- Indexes for table `CrossSaleOffer`
--
ALTER TABLE `CrossSaleOffer`
  ADD PRIMARY KEY (`cso_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data`
--
ALTER TABLE `data`
  ADD PRIMARY KEY (`data_id`);

--
-- Indexes for table `deleted_blacklist`
--
ALTER TABLE `deleted_blacklist`
  ADD PRIMARY KEY (`black_id`);

--
-- Indexes for table `deleted_cards`
--
ALTER TABLE `deleted_cards`
  ADD PRIMARY KEY (`card_id`);

--
-- Indexes for table `deleted_CrossSaleOffer`
--
ALTER TABLE `deleted_CrossSaleOffer`
  ADD PRIMARY KEY (`cso_id`);

--
-- Indexes for table `deleted_customers`
--
ALTER TABLE `deleted_customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deleted_plan`
--
ALTER TABLE `deleted_plan`
  ADD PRIMARY KEY (`plan_id`);

--
-- Indexes for table `disputes`
--
ALTER TABLE `disputes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`event_id`);

--
-- Indexes for table `plan`
--
ALTER TABLE `plan`
  ADD PRIMARY KEY (`plan_id`);

--
-- Indexes for table `shipping`
--
ALTER TABLE `shipping`
  ADD PRIMARY KEY (`charge_id`);

--
-- Indexes for table `subscription`
--
ALTER TABLE `subscription`
  ADD PRIMARY KEY (`sub_id`);

--
-- Indexes for table `token`
--
ALTER TABLE `token`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `upload`
--
ALTER TABLE `upload`
  ADD PRIMARY KEY (`file_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
