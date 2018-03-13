-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 06, 2018 at 09:09 PM
-- Server version: 10.1.8-MariaDB
-- PHP Version: 5.5.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Description` text NOT NULL,
  `parent` int(11) NOT NULL,
  `Ordering` int(11) DEFAULT NULL,
  `Visibility` tinyint(4) NOT NULL DEFAULT '0',
  `Allow_Comment` tinyint(4) NOT NULL DEFAULT '0',
  `Allow_Ads` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`ID`, `Name`, `Description`, `parent`, `Ordering`, `Visibility`, `Allow_Comment`, `Allow_Ads`) VALUES
(2, 'Infinix', 'Infinix china company', 0, 2, 0, 0, 0),
(3, 'Sony', 'Sony company', 0, 3, 0, 0, 0),
(4, 'Apple', 'USA COMPANY', 0, 1, 0, 0, 0),
(5, 'Huawei', 'Huawei company', 0, 4, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `c_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `status` tinyint(4) NOT NULL,
  `comment_date` date NOT NULL,
  `item_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`c_id`, `comment`, `status`, `comment_date`, `item_id`, `user_id`) VALUES
(1, 'good phone ', 1, '2018-02-06', 45, 2),
(2, 'very expansive', 1, '2018-02-06', 43, 5),
(3, 'curvature design ', 1, '2018-02-06', 38, 1),
(4, 'amazing phone', 1, '2018-02-06', 40, 4),
(5, 'badd ^_^', 1, '2018-02-06', 21, 3),
(6, 'very good battery ', 1, '2018-02-06', 22, 6);

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `Item_ID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Description` text NOT NULL,
  `Price` double NOT NULL,
  `Add_Date` date NOT NULL,
  `Country_Made` varchar(255) NOT NULL,
  `Image` varchar(255) NOT NULL,
  `Status` varchar(255) NOT NULL,
  `Rating` smallint(6) NOT NULL,
  `Approve` tinyint(4) NOT NULL DEFAULT '0',
  `Cat_ID` int(11) NOT NULL,
  `Member_ID` int(11) NOT NULL,
  `tags` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`Item_ID`, `Name`, `Description`, `Price`, `Add_Date`, `Country_Made`, `Image`, `Status`, `Rating`, `Approve`, `Cat_ID`, `Member_ID`, `tags`) VALUES
(19, 'Infinix Zero 5 X603 Dual SIM', ' 64GB, 6GB RAM, The Infinix Zero 5 X603 Dual SIM supports 4G LTE network to always keep you in the loop with blistering-fast data communication rate. The 5.98inch display of the device is a stunning canvas filled with brilliant ', 5400, '2018-02-06', 'china', 'img/zero5.jpg', '1', 0, 0, 2, 2, 'discount'),
(20, 'Infinix X571 Note 4 Pro', 'Technical Specifications: Display Display Size: 5.7 inches Display Resolution: 1920 x 1080 pixels Display Type: IPS capacitive touchscreen, 16M colors Camera Back Camera: 13 Megapixel, up to 4160 x 3120-pixel pictures, LED flash Video: Yes, 1080p@30fps Front Camera: 8 Megapixel, up to 3264 ', 3700, '2018-02-06', 'china', 'img/note4.jpg', '1', 0, 1, 2, 1, 'discount'),
(21, 'Infinix X571 Note 4 Pro Gold 32 GB', 'Technical Specifications: Display Display Size: 5.7 inches Display Resolution: 1920 x 1080 pixels Display Type: IPS capacitive touchscreen, 16M colors Camera Back Camera: 13 Megapixel, up to 4160 x 3120-pixel pictures, LED flash Video: Yes, 1080p@30fps Front Camera: 8 Megapixel, up to 3264 ', 3740, '2018-02-06', 'china', 'img/note44.jpg', '1', 0, 1, 2, 3, ''),
(22, 'Infinix Hot 5 Lite Dual Sim', 'Dirac Stereo Widening >Enjoy more enthralling auditory feast INFINIX HOT5 Lite With the aid of the Dirac Stereo Widening technology creates realistic entertainment with high-impact audio & video. 4000mAh large battery The 4000mAh high capacity battery combined with the energy-', 1660, '2018-02-06', 'china', 'img/hot5.jpg', '1', 0, 1, 2, 4, ''),
(35, 'Huawei g8', 'Experience the most interesting smartphone features with the Huawei G8 smartphone. This gold colored smartphone is integrated with a powerful Qualcomm MSM8939 Snapdragon 615 1.5GHz plus 1.2GHz Octa Core processor, the Android Lollipop 5.1 operating system, and a 3GB RAM module, which together constitute its primary, steadfast internal components', 4120, '2018-02-06', 'china', 'img/1160997458_item_XXL_9448337_10532048.jpg', '1', 0, 0, 5, 5, 'DIscount'),
(38, 'Huawei Y5 2017 Dual SIM', 'Huawei Y5 2017 smartphone boasts an Easy Key feature. This Huawei Y5 mobile boasts a large onboard storage capacity of 16GB. Designed to impress, the Huawei Y5 2017 Dual SIM smartphone has a soft curvature design that gives it an elegant look. The Huawei Y5 Dual SIM smartphone has an 8MP rear camera that lets you click amazing pictures, while the 5MP front camera ', 1980, '2018-02-06', 'china', 'img/1327530452_item_XL_23299070_33123718.jpg', '1', 0, 1, 5, 6, ''),
(39, 'Huawei GR3 2017 Dual Sim', 'Huawei GR 3 Dual SIM phone runs on an Android 7 Nougat operating system. Buy this Dual SIM Huawei smartphone at Souq.com.Huawei GR3 Dual SIM 2017 keeps up with your fast paced lifestyle and delivers incredible performance on all fronts. Flaunting a white color, it looks great ', 3450, '2018-02-06', 'china', 'img/1311006248_item_XXL_22066800_29343338.jpg', '1', 0, 1, 5, 5, ''),
(40, 'Huawei P10 Plus VKY-L29 Dual Sim ', 'Huawei P10 Plus smartphone delivers consistent performance for every day. This smartphone has a large 5.5inch display.The Huawei VKY L29P10 Plus Dual SIM smartphone delivers amazing performance and keeps up with your busy lifestyle. Flaunting a graphite black finish, this smartphone exudes a sophisticated look. The large 5.5inch screen with 2K display renders ultra bright, vivid', 12400, '2018-02-06', 'china', 'img/1322753924_item_XL_22257526_29960507.jpg', '1', 0, 1, 5, 5, ''),
(41, 'Apple iPhone SE', 'The Apple iPhone SE sports a sleek gold body and cutting edge components that make it a great device for conducting all your daily tasks effortlessly. An integrated rear 12MP iSight camera and the front facing FaceTime camera of this device have the power to click true to life photos and 4K videos', 7500, '2018-02-06', 'USA', 'img/426100698_item_XXL_10432920_13467078.jpg', '1', 0, 1, 4, 5, ''),
(42, 'Apple iPhone 6 ', 'Apple iPhone 6 smartphone. Announced Sep 2014. Features 4.7″ LED-backlit IPS LCD display, Apple A8 chipset, 8 MP primary camera, 1.2 MP front camera, 1810 mAh battery, 128 GB storage, 1000 MB RAM', 7000, '2018-02-06', 'USA', 'img/1.jpg', '1', 0, 1, 4, 5, ''),
(43, 'Apple iPhone X', 'Apple iPhone X features an entire screen design. This iPhone X introduces the all new Face ID function. Apple introduces the most powerful and brand-new iPhone X that features an entire screen display body. The device has a 5.8inch Super Retina Display. Powered by the A11 Bionic, which is the smartest and powerful chip ever that lets your CPU perform up to 600 billion operations', 22850, '2018-02-06', 'USA', 'img/752238568_6.jpg', '1', 0, 1, 4, 5, ''),
(44, 'Sony Xperia Z5 Dual Sim', '  The Sony Xperia Z5 Dual SIM smartphone is a state of the art gadget that lets you do so much more than just calling and messaging. Straight lines and a bold black finish dominate the phone’s design. The phone is equipped with a 23MP rear camera, which lets you shoot high quality photos. The 5x zoom comes with Clear Image Zoom technology that enables you to bring objects', 5000, '2018-02-06', 'ITALY', 'img/14372614_item_XL_8991813_9263558.jpg', '1', 0, 0, 3, 5, ''),
(45, 'Sony Xperia Z5 Dual Sim', 'The Sony Xperia Z5 Dual Sim is an advanced phone that takes the concept of multitasking to the next level. Its design elements include straight lines and a sparkling gold finish. Boasting a 23MP rear camera, this phone is capable of capturing lifelike pictures. The 5x zoom features the all new Clear Image Zoom technology, which brings subjects located far away closer to your line', 5300, '2018-02-06', 'ITALY', 'img/268044965_item_L_8991853_9263647.jpg', '1', 0, 1, 3, 5, 'DIscount'),
(46, 'Sony Xperia XA Dual SIM', '  This Sony Xperia XA is an uber stylish, 4G, dual SIM smartphone for all your photography needs. It sports an elegant white color and features a cool looking slate design. You can take this smartphone on holidays and capture some beautiful snaps using it&#39;s integrated 13MP camera or click stunning selfies with its 8MP front facing snapper. Both these cameras come enhanced with Sony’s', 3230, '2018-02-06', 'ITALY', 'img/631878676_item_XL_10194604_13193540.jpg', '1', 0, 1, 3, 5, ''),
(47, 'Sony Xperia XA Dual SIM', '  This Sony Xperia XA is an uber stylish, 4G, dual SIM smartphone for all your photography needs. It sports an elegant white color and features a cool looking slate design. You can take this smartphone on holidays and capture some beautiful snaps using it&#39;s integrated 13MP camera or click stunning selfies with its 8MP front facing snapper. Both these cameras come enhanced with Sony’s', 3230, '2018-02-06', 'ITALY', 'img/400927106_item_XL_10194604_13193540.jpg', '1', 0, 0, 3, 5, '');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UserID` int(11) NOT NULL COMMENT 'To Identify User',
  `Username` varchar(255) NOT NULL COMMENT 'Username To Login',
  `Password` varchar(255) NOT NULL COMMENT 'Password To Login',
  `Email` varchar(255) NOT NULL,
  `FullName` varchar(255) NOT NULL,
  `GroupID` int(11) NOT NULL DEFAULT '0' COMMENT 'Identify User Group',
  `TrustStatus` int(11) NOT NULL DEFAULT '0' COMMENT 'Seller Rank',
  `RegStatus` int(11) NOT NULL DEFAULT '0' COMMENT 'User Approval',
  `Date` date NOT NULL,
  `avatar` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserID`, `Username`, `Password`, `Email`, `FullName`, `GroupID`, `TrustStatus`, `RegStatus`, `Date`, `avatar`) VALUES
(1, 'nada', '7c222fb2927d828af22f592134e8932480637c0d', 'nada@gmail', 'nadadahab', 1, 0, 1, '2018-02-05', '1191808214_409662557_img.png'),
(2, 'nadadahab', '24da84724b0e3b096581904fe8f81d656891a662', 'nadadahab906@gmail.com', '', 0, 0, 0, '2018-02-02', ''),
(3, 'mostafa', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'mostafa@gmail', 'mostafa ahmed', 0, 0, 1, '2018-02-02', '704989672_409662557_img.png'),
(4, 'marwa', '601f1889667efaebb33b8c12572835da3f027f78', 'marwa@gmail.com', 'Marwa ayman', 0, 0, 1, '0000-00-00', ''),
(5, 'Maii', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'Mai@gmail.com', 'Mai Nasr', 0, 0, 1, '2018-02-05', '997089404_1.jpg'),
(6, 'mohamed', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'mohamed@gmail.com', 'mohamed ahmed', 0, 0, 1, '2018-02-05', '745697737_409662557_img.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Name` (`Name`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`c_id`),
  ADD KEY `items_comment` (`item_id`),
  ADD KEY `comment_user` (`user_id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`Item_ID`),
  ADD KEY `member_1` (`Member_ID`),
  ADD KEY `cat_1` (`Cat_ID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserID`),
  ADD UNIQUE KEY `Username` (`Username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `c_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `Item_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'To Identify User', AUTO_INCREMENT=39;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comment_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `items_comment` FOREIGN KEY (`item_id`) REFERENCES `items` (`Item_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `cat_1` FOREIGN KEY (`Cat_ID`) REFERENCES `categories` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `member_1` FOREIGN KEY (`Member_ID`) REFERENCES `users` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
