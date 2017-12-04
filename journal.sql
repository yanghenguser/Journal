/*
SQLyog Professional v12.08 (64 bit)
MySQL - 5.7.17 : Database - journal
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`journal` /*!40100 DEFAULT CHARACTER SET utf8 */;

/*Table structure for table `adminuser` */

DROP TABLE IF EXISTS `adminuser`;

CREATE TABLE `adminuser` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `psw` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Table structure for table `j_position` */

DROP TABLE IF EXISTS `j_position`;

CREATE TABLE `j_position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `province_id` bigint(20) unsigned NOT NULL,
  `province_name` char(64) NOT NULL,
  `city_id` bigint(20) unsigned NOT NULL,
  `city_name` char(64) NOT NULL,
  `county_id` bigint(20) unsigned NOT NULL,
  `county_name` char(64) NOT NULL,
  `town_id` bigint(20) unsigned NOT NULL,
  `town_name` char(64) NOT NULL,
  `village_id` bigint(20) unsigned NOT NULL,
  `village_name` char(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `village_id` (`village_id`)
) ENGINE=InnoDB AUTO_INCREMENT=600229 DEFAULT CHARSET=utf8 COMMENT='省市县镇村数据';

/*Table structure for table `j_position_city` */

DROP TABLE IF EXISTS `j_position_city`;

CREATE TABLE `j_position_city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `province_id` int(10) unsigned NOT NULL COMMENT '地级市id',
  `city_id` bigint(20) unsigned NOT NULL COMMENT '县级市id',
  `city_name` char(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `city_id` (`city_id`),
  KEY `province_id` (`province_id`)
) ENGINE=InnoDB AUTO_INCREMENT=346 DEFAULT CHARSET=utf8 COMMENT='县级市数据库';

/*Table structure for table `j_position_county` */

DROP TABLE IF EXISTS `j_position_county`;

CREATE TABLE `j_position_county` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '地级市主键ID',
  `city_id` bigint(20) unsigned NOT NULL COMMENT '地级市id',
  `county_id` bigint(20) unsigned NOT NULL COMMENT '县级id',
  `county_name` char(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `county_id` (`county_id`),
  KEY `city_id` (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2857 DEFAULT CHARSET=utf8 COMMENT='地区市数据库';

/*Table structure for table `j_position_provice` */

DROP TABLE IF EXISTS `j_position_provice`;

CREATE TABLE `j_position_provice` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `provice_id` int(11) unsigned NOT NULL COMMENT '省份id、省份编号',
  `provice_name` char(32) NOT NULL COMMENT '省份名称',
  PRIMARY KEY (`id`),
  UNIQUE KEY `provice_id` (`provice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COMMENT='省份数据库';

/*Table structure for table `j_position_town` */

DROP TABLE IF EXISTS `j_position_town`;

CREATE TABLE `j_position_town` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `county_id` bigint(20) unsigned NOT NULL COMMENT '县级市id',
  `town_id` bigint(20) unsigned NOT NULL COMMENT '镇id',
  `town_name` char(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `town_id` (`town_id`),
  KEY `county_id` (`county_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43855 DEFAULT CHARSET=utf8 COMMENT='镇数据库';

/*Table structure for table `j_position_village` */

DROP TABLE IF EXISTS `j_position_village`;

CREATE TABLE `j_position_village` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `town_id` bigint(20) unsigned NOT NULL COMMENT '镇id',
  `village_id` bigint(20) unsigned NOT NULL COMMENT '村id--唯一',
  `village_name` char(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `village_id` (`village_id`),
  KEY `town_id` (`town_id`)
) ENGINE=InnoDB AUTO_INCREMENT=693338 DEFAULT CHARSET=utf8 COMMENT='省市县镇村数据';

/*Table structure for table `newspaper` */

DROP TABLE IF EXISTS `newspaper`;

CREATE TABLE `newspaper` (
  `newsid` int(5) NOT NULL AUTO_INCREMENT,
  `newsnum` int(8) NOT NULL,
  `newsname` varchar(50) NOT NULL,
  `newsclass` int(8) NOT NULL,
  `press` varchar(100) DEFAULT NULL COMMENT '出版社',
  `publish` varchar(100) DEFAULT NULL COMMENT '出版周期',
  `quarterly` float NOT NULL COMMENT '季度报价',
  `content` text COMMENT '内容介绍',
  `piclocation` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`newsid`),
  KEY `forclassname` (`newsclass`),
  CONSTRAINT `forclassname` FOREIGN KEY (`newsclass`) REFERENCES `newspaperclass` (`classnum`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;

/*Table structure for table `newspaperclass` */

DROP TABLE IF EXISTS `newspaperclass`;

CREATE TABLE `newspaperclass` (
  `classnum` int(8) NOT NULL AUTO_INCREMENT,
  `classname` varchar(50) NOT NULL,
  PRIMARY KEY (`classnum`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Table structure for table `orderall` */

DROP TABLE IF EXISTS `orderall`;

CREATE TABLE `orderall` (
  `orderid` varchar(100) NOT NULL,
  `userid` int(5) NOT NULL,
  `allprice` float NOT NULL,
  `state` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`orderid`),
  KEY `user` (`userid`),
  CONSTRAINT `user` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `orderinfo` */

DROP TABLE IF EXISTS `orderinfo`;

CREATE TABLE `orderinfo` (
  `infoid` int(5) NOT NULL AUTO_INCREMENT,
  `orderid` varchar(100) DEFAULT NULL,
  `newsid` int(5) DEFAULT NULL,
  `ordernum` int(8) DEFAULT NULL,
  `ordermouth` int(5) DEFAULT NULL,
  `price` float DEFAULT NULL,
  PRIMARY KEY (`infoid`),
  KEY `order` (`orderid`),
  KEY `news` (`newsid`),
  CONSTRAINT `news` FOREIGN KEY (`newsid`) REFERENCES `newspaper` (`newsid`),
  CONSTRAINT `order` FOREIGN KEY (`orderid`) REFERENCES `orderall` (`orderid`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

/*Table structure for table `swf_area` */

DROP TABLE IF EXISTS `swf_area`;

CREATE TABLE `swf_area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL,
  `sort` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3412 DEFAULT CHARSET=utf8;

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `userid` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `psw` varchar(200) NOT NULL,
  `realname` varchar(20) DEFAULT NULL,
  `idcard` char(18) DEFAULT NULL,
  `phone` varchar(13) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
