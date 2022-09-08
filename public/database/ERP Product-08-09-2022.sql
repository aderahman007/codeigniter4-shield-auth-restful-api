/*
SQLyog Professional v12.5.1 (32 bit)
MySQL - 10.4.22-MariaDB : Database - erp
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`erp` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `erp`;

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `id` varchar(50) NOT NULL DEFAULT '',
  `aliasid` char(30) NOT NULL DEFAULT '',
  `name` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(200) NOT NULL DEFAULT '',
  `productgroup` char(30) NOT NULL DEFAULT '',
  `defunit` char(10) NOT NULL DEFAULT '',
  `groupunit` char(10) NOT NULL DEFAULT '',
  `supplier` char(30) NOT NULL DEFAULT '',
  `category` tinyint(4) DEFAULT 0 COMMENT '0=INVENTORY, 1=SERVICE',
  `factory` char(30) NOT NULL DEFAULT '',
  `brand` char(5) NOT NULL DEFAULT '',
  `costprice` double NOT NULL DEFAULT 0,
  `purchasedisc` double NOT NULL DEFAULT 0,
  `purchasetax` double NOT NULL DEFAULT 0,
  `netpurchase` double NOT NULL DEFAULT 0,
  `salesprice1` double NOT NULL DEFAULT 0,
  `salesprice2` double NOT NULL DEFAULT 0,
  `salesprice3` double NOT NULL DEFAULT 0,
  `salesprice4` double NOT NULL DEFAULT 0,
  `salesprice5` double NOT NULL DEFAULT 0,
  `salesprice6` double NOT NULL DEFAULT 0,
  `salesprice7` double NOT NULL DEFAULT 0,
  `salesdiscqty1` double NOT NULL DEFAULT 0,
  `salesdiscprice1` double NOT NULL DEFAULT 0,
  `salesdiscqty2` double NOT NULL DEFAULT 0,
  `salesdiscprice2` double NOT NULL DEFAULT 0,
  `salesdiscqty3` double NOT NULL DEFAULT 0,
  `salesdiscprice3` double NOT NULL DEFAULT 0,
  `usesn` smallint(6) NOT NULL DEFAULT 1,
  `minimum` double NOT NULL DEFAULT 0,
  `maximum` double NOT NULL DEFAULT 0,
  `minimumreorder` double NOT NULL DEFAULT 0,
  `defaultreorder` double NOT NULL DEFAULT 0,
  `salesdisc` varchar(50) NOT NULL DEFAULT '',
  `taxtype` tinyint(4) NOT NULL DEFAULT 0,
  `author` char(30) NOT NULL DEFAULT '',
  `dwidth` double NOT NULL DEFAULT 0,
  `dheight` double NOT NULL DEFAULT 0,
  `dlength` double NOT NULL DEFAULT 0,
  `weight` double NOT NULL DEFAULT 0,
  `salesdiscrules` varchar(200) NOT NULL DEFAULT '',
  `salesmancommrules` varchar(200) NOT NULL DEFAULT '',
  `salesproductrewardrules` varchar(200) NOT NULL,
  `salespointrewardrules` varchar(200) NOT NULL,
  `servicedoercommrules` varchar(200) NOT NULL DEFAULT '',
  `inventoryacc` char(30) NOT NULL DEFAULT '',
  `taxacc` char(30) NOT NULL DEFAULT '',
  `cogsacc` char(30) NOT NULL DEFAULT '',
  `salesacc` char(30) NOT NULL DEFAULT '',
  `salesdiscacc` char(30) NOT NULL DEFAULT '',
  `salesreturnacc` char(30) NOT NULL DEFAULT '',
  `consignrevenueacc` char(30) NOT NULL DEFAULT '',
  `consignexpenseacc` char(30) NOT NULL DEFAULT '',
  `isactive` smallint(6) NOT NULL DEFAULT 1,
  `usercreate` char(16) NOT NULL DEFAULT '',
  `useredit` char(16) NOT NULL DEFAULT '',
  `updatetimestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `image` blob DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `defunit` (`defunit`),
  KEY `productgroup` (`productgroup`),
  KEY `groupunit` (`groupunit`),
  KEY `supplier` (`supplier`),
  KEY `brand` (`brand`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`defunit`) REFERENCES `units` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `product_ibfk_2` FOREIGN KEY (`productgroup`) REFERENCES `productgroup` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `product_ibfk_3` FOREIGN KEY (`groupunit`) REFERENCES `units` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `product_ibfk_4` FOREIGN KEY (`supplier`) REFERENCES `supplier` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `product_ibfk_5` FOREIGN KEY (`brand`) REFERENCES `productbrand` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `product` */

/*Table structure for table `productbrand` */

DROP TABLE IF EXISTS `productbrand`;

CREATE TABLE `productbrand` (
  `id` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(45) NOT NULL DEFAULT '',
  `usercreate` char(16) NOT NULL DEFAULT '',
  `useredit` char(16) NOT NULL DEFAULT '',
  `updatetimestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `productbrand` */

/*Table structure for table `productgroup` */

DROP TABLE IF EXISTS `productgroup`;

CREATE TABLE `productgroup` (
  `id` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(100) NOT NULL DEFAULT '',
  `parent` char(30) NOT NULL DEFAULT '',
  `isgroup` smallint(6) NOT NULL DEFAULT 0,
  `salesdiscrules` varchar(200) NOT NULL DEFAULT '',
  `salesmancommrules` varchar(200) NOT NULL DEFAULT '',
  `salesproductrewardrules` varchar(200) NOT NULL,
  `salespointrewardrules` varchar(200) NOT NULL,
  `servicedoercommrules` varchar(200) NOT NULL DEFAULT '',
  `inventoryacc` char(30) NOT NULL DEFAULT '',
  `taxacc` char(30) NOT NULL DEFAULT '',
  `cogsacc` char(30) DEFAULT '',
  `salesacc` char(30) NOT NULL DEFAULT '',
  `salesdiscacc` char(30) NOT NULL DEFAULT '',
  `salesreturnacc` char(30) NOT NULL DEFAULT '',
  `consignrevenueacc` char(30) NOT NULL DEFAULT '',
  `consignexpenseacc` char(30) NOT NULL DEFAULT '',
  `usercreate` char(16) NOT NULL DEFAULT '',
  `useredit` char(16) NOT NULL DEFAULT '',
  `updatetimestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `productgroup` */

/*Table structure for table `supplier` */

DROP TABLE IF EXISTS `supplier`;

CREATE TABLE `supplier` (
  `id` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(100) NOT NULL DEFAULT '',
  `suppliergroup` char(30) NOT NULL DEFAULT '',
  `address` varchar(200) NOT NULL DEFAULT '',
  `telephone` varchar(50) NOT NULL DEFAULT '',
  `faximile` varchar(50) NOT NULL DEFAULT '',
  `mobilephone` varchar(50) NOT NULL DEFAULT '',
  `category` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=PERSONAL, 1=COMPANY',
  `contactperson` varchar(100) NOT NULL DEFAULT '',
  `religion` int(10) unsigned NOT NULL DEFAULT 0,
  `birthdate` datetime DEFAULT NULL,
  `sex` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=MALE, 1=FEMALE',
  `email` varchar(100) NOT NULL DEFAULT '',
  `website` varchar(100) NOT NULL DEFAULT '',
  `country` char(3) NOT NULL DEFAULT '',
  `creditlimit` double NOT NULL DEFAULT 0,
  `registerdate` datetime DEFAULT NULL,
  `activeuntil` datetime NOT NULL DEFAULT '2099-12-31 00:00:00',
  `taxid` varchar(50) NOT NULL DEFAULT '',
  `isactive` smallint(6) NOT NULL DEFAULT 1,
  `payableacc` char(30) NOT NULL DEFAULT '',
  `downpaymentacc` char(30) NOT NULL DEFAULT '',
  `rewardacc` char(30) NOT NULL,
  `purchasediscacc` char(30) NOT NULL DEFAULT '',
  `gainlosspayableacc` char(30) NOT NULL DEFAULT '',
  `termofpayment` varchar(30) NOT NULL DEFAULT '' COMMENT '2/10, n/30\nCOD (Cash On Delivery)',
  `usercreate` char(16) NOT NULL DEFAULT '',
  `useredit` char(16) NOT NULL DEFAULT '',
  `updatetimestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `image` blob DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `suppliergroup` (`suppliergroup`),
  CONSTRAINT `supplier_ibfk_1` FOREIGN KEY (`suppliergroup`) REFERENCES `suppliergroup` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `supplier` */

/*Table structure for table `suppliergroup` */

DROP TABLE IF EXISTS `suppliergroup`;

CREATE TABLE `suppliergroup` (
  `id` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(100) NOT NULL DEFAULT '',
  `parent` char(30) NOT NULL DEFAULT '',
  `isgroup` smallint(6) NOT NULL DEFAULT 0,
  `payableacc` char(30) NOT NULL DEFAULT '',
  `downpaymentacc` char(30) NOT NULL DEFAULT '',
  `rewardacc` char(30) NOT NULL DEFAULT '',
  `purchasediscacc` char(30) NOT NULL DEFAULT '',
  `gainlosspayableacc` char(30) NOT NULL DEFAULT '',
  `usercreate` char(16) NOT NULL DEFAULT '',
  `useredit` char(16) NOT NULL DEFAULT '',
  `updatetimestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `suppliergroup` */

/*Table structure for table `units` */

DROP TABLE IF EXISTS `units`;

CREATE TABLE `units` (
  `id` varchar(50) NOT NULL DEFAULT '',
  `unit` varchar(10) NOT NULL,
  `quantity` double NOT NULL DEFAULT 1,
  `qtyfrom` char(10) NOT NULL DEFAULT '',
  `description` varchar(50) NOT NULL DEFAULT '',
  `usercreate` char(16) NOT NULL DEFAULT '',
  `useredit` char(16) NOT NULL DEFAULT '',
  `updatetimestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `units` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
