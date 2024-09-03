/*
SQLyog Community Edition- MySQL GUI v7.15 
MySQL - 5.5.29 : Database - jobportal
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`jobportal` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `jobportal`;

/*Table structure for table `application` */

DROP TABLE IF EXISTS `application`;

CREATE TABLE `application` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `dob` varchar(100) DEFAULT NULL,
  `mob` varchar(100) DEFAULT NULL,
  `altermob` varchar(100) DEFAULT NULL,
  `qualification` varchar(100) DEFAULT NULL,
  `hdegree` varchar(100) DEFAULT NULL,
  `percentage` varchar(100) DEFAULT NULL,
  `poutyear` varchar(100) DEFAULT NULL,
  `resume` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `recruiter` varchar(100) DEFAULT NULL,
  `cname` varchar(100) DEFAULT NULL,
  `jrole` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `application` */

insert  into `application`(`id`,`name`,`email`,`dob`,`mob`,`altermob`,`qualification`,`hdegree`,`percentage`,`poutyear`,`resume`,`status`,`recruiter`,`cname`,`jrole`) values (7,'munna','munna@gmail.com','2023-03-27','8639966858','8639966858','B.tech','B.tech','75','2016','2.docx','Accepted','chotu@gmail.com','capgemini','Software Engineer');

/*Table structure for table `courses` */

DROP TABLE IF EXISTS `courses`;

CREATE TABLE `courses` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `cname` varchar(100) DEFAULT NULL,
  `link` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `courses` */

/*Table structure for table `jobs` */

DROP TABLE IF EXISTS `jobs`;

CREATE TABLE `jobs` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `requirments` text,
  `cname` varchar(100) DEFAULT NULL,
  `jobrole` varchar(100) DEFAULT NULL,
  `package` varchar(100) DEFAULT NULL,
  `cdetails` varchar(100) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `jobs` */

insert  into `jobs`(`id`,`requirments`,`cname`,`jobrole`,`package`,`cdetails`,`username`) values (8,'html css','capgemini','Software Engineer','5 lakh','1.docx','chotu@gmail.com'),(9,'html css','capgemini','Software Engineer','6 lakh','1.docx','chotu@gmail.com');

/*Table structure for table `recruiter` */

DROP TABLE IF EXISTS `recruiter`;

CREATE TABLE `recruiter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `jobrole` varchar(100) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `cmobile` varchar(100) DEFAULT NULL,
  `pmobile` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `icard` text,
  `status` varchar(100) DEFAULT 'pending',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `recruiter` */

insert  into `recruiter`(`id`,`username`,`password`,`name`,`jobrole`,`company`,`cmobile`,`pmobile`,`address`,`icard`,`status`) values (5,'chotu@gmail.com','123','chotu','hr','capgemini','8639966858','8639966858','hyderabad','img1.svg','Pending');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `gender` varchar(100) DEFAULT NULL,
  `college` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `icard` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `user` */

insert  into `user`(`id`,`username`,`password`,`name`,`gender`,`college`,`address`,`icard`,`status`) values (7,'munna@gmail.com','123','munna','Male','8639966858','hyd','2.docx','Pending');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
