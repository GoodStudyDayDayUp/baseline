/*
SQLyog Professional v12.08 (64 bit)
MySQL - 5.5.36 : Database - opos
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`opos` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `opos`;

/*Table structure for table `chapter` */

DROP TABLE IF EXISTS `chapter`;

CREATE TABLE `chapter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `praise` int(11) NOT NULL DEFAULT '0',
  `parentId` int(11) DEFAULT NULL,
  `uId` int(11) DEFAULT NULL,
  `content` varchar(1000) NOT NULL,
  `isEnd` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `parentId` (`parentId`),
  KEY `uId` (`uId`),
  CONSTRAINT `chapter_ibfk_1` FOREIGN KEY (`parentId`) REFERENCES `chapter` (`id`),
  CONSTRAINT `chapter_ibfk_2` FOREIGN KEY (`uId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `chapter` */

/*Table structure for table `draft` */

DROP TABLE IF EXISTS `draft`;

CREATE TABLE `draft` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uId` int(11) NOT NULL,
  `content` varchar(1000) NOT NULL,
  `parentId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uId` (`uId`),
  KEY `parentId` (`parentId`),
  CONSTRAINT `draft_ibfk_2` FOREIGN KEY (`parentId`) REFERENCES `chapter` (`id`),
  CONSTRAINT `draft_ibfk_1` FOREIGN KEY (`uId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `draft` */

/*Table structure for table `order` */

DROP TABLE IF EXISTS `order`;

CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `chapterId` int(11) NOT NULL,
  `uId` int(11) NOT NULL,
  `maxPrice` int(11) NOT NULL,
  `endTime` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `chapterId` (`chapterId`),
  KEY `uId` (`uId`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`chapterId`) REFERENCES `chapter` (`id`),
  CONSTRAINT `order_ibfk_2` FOREIGN KEY (`uId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `order` */

/*Table structure for table `story` */

DROP TABLE IF EXISTS `story`;

CREATE TABLE `story` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typeId` int(11) NOT NULL,
  `rootId` int(11) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `typeId` (`typeId`),
  KEY `rootId` (`rootId`),
  CONSTRAINT `story_ibfk_1` FOREIGN KEY (`typeId`) REFERENCES `type` (`id`),
  CONSTRAINT `story_ibfk_2` FOREIGN KEY (`rootId`) REFERENCES `chapter` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `story` */

/*Table structure for table `type` */

DROP TABLE IF EXISTS `type`;

CREATE TABLE `type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `type` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(15) NOT NULL,
  `password` varchar(15) NOT NULL,
  `sex` tinyint(1) NOT NULL,
  `point` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

/*Table structure for table `utc` */

DROP TABLE IF EXISTS `utc`;

CREATE TABLE `utc` (
  `uId` int(11) NOT NULL,
  `chapterId` int(11) NOT NULL,
  KEY `uId` (`uId`),
  KEY `chapterId` (`chapterId`),
  CONSTRAINT `utc_ibfk_1` FOREIGN KEY (`uId`) REFERENCES `user` (`id`),
  CONSTRAINT `utc_ibfk_2` FOREIGN KEY (`chapterId`) REFERENCES `chapter` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `utc` */

/*Table structure for table `uts` */

DROP TABLE IF EXISTS `uts`;

CREATE TABLE `uts` (
  `uId` int(11) NOT NULL,
  `storyId` int(11) NOT NULL,
  KEY `uId` (`uId`),
  KEY `storyId` (`storyId`),
  CONSTRAINT `uts_ibfk_1` FOREIGN KEY (`uId`) REFERENCES `user` (`id`),
  CONSTRAINT `uts_ibfk_2` FOREIGN KEY (`storyId`) REFERENCES `story` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `uts` */

/*Table structure for table `utu` */

DROP TABLE IF EXISTS `utu`;

CREATE TABLE `utu` (
  `uId` int(11) NOT NULL,
  `fanId` int(11) NOT NULL,
  KEY `uId` (`uId`),
  KEY `fanId` (`fanId`),
  CONSTRAINT `utu_ibfk_1` FOREIGN KEY (`uId`) REFERENCES `user` (`id`),
  CONSTRAINT `utu_ibfk_2` FOREIGN KEY (`fanId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `utu` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
