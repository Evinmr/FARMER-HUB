/*
SQLyog Community v12.4.0 (64 bit)
MySQL - 5.6.12-log : Database - farmerstore
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`farmerstore` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `farmerstore`;

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `auth_group` */

insert  into `auth_group`(`id`,`name`) values 
(2,'hub');

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `auth_group_permissions` */

insert  into `auth_group_permissions`(`id`,`group_id`,`permission_id`) values 
(3,2,2),
(4,2,35);

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values 
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can add permission',2,'add_permission'),
(5,'Can change permission',2,'change_permission'),
(6,'Can delete permission',2,'delete_permission'),
(7,'Can add group',3,'add_group'),
(8,'Can change group',3,'change_group'),
(9,'Can delete group',3,'delete_group'),
(10,'Can add user',4,'add_user'),
(11,'Can change user',4,'change_user'),
(12,'Can delete user',4,'delete_user'),
(13,'Can add content type',5,'add_contenttype'),
(14,'Can change content type',5,'change_contenttype'),
(15,'Can delete content type',5,'delete_contenttype'),
(16,'Can add session',6,'add_session'),
(17,'Can change session',6,'change_session'),
(18,'Can delete session',6,'delete_session'),
(19,'Can add buyerregister',7,'add_buyerregister'),
(20,'Can change buyerregister',7,'change_buyerregister'),
(21,'Can delete buyerregister',7,'delete_buyerregister'),
(22,'Can add sellerregister',8,'add_sellerregister'),
(23,'Can change sellerregister',8,'change_sellerregister'),
(24,'Can delete sellerregister',8,'delete_sellerregister'),
(25,'Can add categories',9,'add_categories'),
(26,'Can change categories',9,'change_categories'),
(27,'Can delete categories',9,'delete_categories'),
(28,'Can add productdetails',10,'add_productdetails'),
(29,'Can change productdetails',10,'change_productdetails'),
(30,'Can delete productdetails',10,'delete_productdetails'),
(31,'Can add cart',11,'add_cart'),
(32,'Can change cart',11,'change_cart'),
(33,'Can delete cart',11,'delete_cart'),
(34,'Can add booking',12,'add_booking'),
(35,'Can change booking',12,'change_booking'),
(36,'Can delete booking',12,'delete_booking'),
(37,'Can add personaldetails',13,'add_personaldetails'),
(38,'Can change personaldetails',13,'change_personaldetails'),
(39,'Can delete personaldetails',13,'delete_personaldetails'),
(40,'Can add wishlist',14,'add_wishlist'),
(41,'Can change wishlist',14,'change_wishlist'),
(42,'Can delete wishlist',14,'delete_wishlist'),
(43,'Can add feedback',15,'add_feedback'),
(44,'Can change feedback',15,'change_feedback'),
(45,'Can delete feedback',15,'delete_feedback');

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `auth_user` */

insert  into `auth_user`(`id`,`password`,`last_login`,`is_superuser`,`username`,`first_name`,`last_name`,`email`,`is_staff`,`is_active`,`date_joined`) values 
(1,'pbkdf2_sha256$100000$qgxpoSMv9row$FZJA/ZOKrzNG/26WPw6HU/nfMODUHAujcRA+TcgYB5I=','2026-07-09 04:16:32.961108',1,'admin','','','',1,1,'2026-06-26 04:51:19.689305'),
(2,'pbkdf2_sha256$100000$avfDm5t7g0Zc$8dUhMSzTv/LtsvpUrRpW3uPYlWLVVBD8GiYfAv2o3wY=','2026-07-09 06:03:29.986486',0,'abhijith@gmail','abhijith','','abhijith@gmail',0,1,'2026-06-26 05:01:07.295654'),
(3,'pbkdf2_sha256$100000$0Wk5wLjzSgEb$zkV6nfD0HN4VAGbM9ye4rJSaJ75tI+/yINKOanExBmg=','2026-07-09 05:06:19.255761',0,'athul@gmail.com','athul','','athul@gmail.com',0,1,'2026-06-26 05:04:00.460956'),
(5,'pbkdf2_sha256$100000$JN3uiMPdikix$N3ti2vnO1iVRkkmoq7mINXtA8B3Ol1gcDF99sBEWeAY=','2026-07-09 04:19:15.728586',0,'urgeojith@gmail.com','geojith','ur','urgeojith@gmail.com',1,1,'2026-07-09 04:18:13.000000');

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `auth_user_groups` */

insert  into `auth_user_groups`(`id`,`user_id`,`group_id`) values 
(2,5,2);

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

/*Data for the table `django_admin_log` */

insert  into `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) values 
(1,'2026-06-26 05:05:52.700022','1','athul',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',8,1),
(2,'2026-06-26 05:10:02.010900','1','Fruits',1,'[{\"added\": {}}]',9,1),
(3,'2026-06-26 05:10:13.557980','2','veg',1,'[{\"added\": {}}]',9,1),
(4,'2026-06-26 05:12:56.491682','1','Apple/kg',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',10,1),
(5,'2026-07-01 15:31:11.062952','2','Ladyfinger',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',10,1),
(6,'2026-07-08 06:28:24.397743','1','hub',1,'[{\"added\": {}}]',3,1),
(7,'2026-07-08 06:29:38.094107','4','urgeojith@gmail.com',1,'[{\"added\": {}}]',4,1),
(8,'2026-07-08 06:30:13.201715','4','urgeojith@gmail.com',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\", \"email\", \"is_staff\", \"groups\"]}}]',4,1),
(9,'2026-07-08 06:31:01.368967','1','hub',2,'[]',3,1),
(10,'2026-07-08 06:31:35.962875','4','urgeojith@gmail.com',2,'[{\"changed\": {\"fields\": [\"user_permissions\"]}}]',4,1),
(11,'2026-07-08 06:34:30.417135','1','hub',2,'[]',3,1),
(12,'2026-07-08 06:34:58.516705','4','urgeojith@gmail.com',2,'[]',4,1),
(13,'2026-07-09 04:16:04.879783','1','hub',3,'',3,1),
(14,'2026-07-09 04:16:47.615433','4','urgeojith@gmail.com',3,'',4,1),
(15,'2026-07-09 04:17:35.827235','2','hub',1,'[{\"added\": {}}]',3,1),
(16,'2026-07-09 04:18:13.751201','5','urgeojith@gmail.com',1,'[{\"added\": {}}]',4,1),
(17,'2026-07-09 04:19:04.057132','5','urgeojith@gmail.com',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\", \"email\", \"is_staff\", \"groups\"]}}]',4,1),
(18,'2026-07-09 04:26:18.623685','1','Booking object (1)',2,'[{\"changed\": {\"fields\": [\"delivery_status\"]}}]',12,5),
(19,'2026-07-09 04:37:09.153006','1','Booking object (1)',2,'[{\"changed\": {\"fields\": [\"delivery_status\"]}}]',12,5);

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values 
(1,'admin','logentry'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'auth','user'),
(5,'contenttypes','contenttype'),
(12,'myapp','booking'),
(7,'myapp','buyerregister'),
(11,'myapp','cart'),
(9,'myapp','categories'),
(15,'myapp','feedback'),
(13,'myapp','personaldetails'),
(10,'myapp','productdetails'),
(8,'myapp','sellerregister'),
(14,'myapp','wishlist'),
(6,'sessions','session');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values 
(1,'contenttypes','0001_initial','2026-06-26 04:49:49.502944'),
(2,'auth','0001_initial','2026-06-26 04:49:50.043342'),
(3,'admin','0001_initial','2026-06-26 04:49:50.174974'),
(4,'admin','0002_logentry_remove_auto_add','2026-06-26 04:49:50.185457'),
(5,'contenttypes','0002_remove_content_type_name','2026-06-26 04:49:50.276920'),
(6,'auth','0002_alter_permission_name_max_length','2026-06-26 04:49:50.312610'),
(7,'auth','0003_alter_user_email_max_length','2026-06-26 04:49:50.351362'),
(8,'auth','0004_alter_user_username_opts','2026-06-26 04:49:50.366960'),
(9,'auth','0005_alter_user_last_login_null','2026-06-26 04:49:50.413554'),
(10,'auth','0006_require_contenttypes_0002','2026-06-26 04:49:50.417431'),
(11,'auth','0007_alter_validators_add_error_messages','2026-06-26 04:49:50.424405'),
(12,'auth','0008_alter_user_username_max_length','2026-06-26 04:49:50.466149'),
(13,'auth','0009_alter_user_last_name_max_length','2026-06-26 04:49:50.512370'),
(14,'myapp','0001_initial','2026-06-26 04:49:50.588663'),
(15,'myapp','0002_buyerregister_phone','2026-06-26 04:49:50.632056'),
(16,'myapp','0003_sellerregister','2026-06-26 04:49:50.712216'),
(17,'myapp','0004_buyerregister_address','2026-06-26 04:49:50.759523'),
(18,'myapp','0005_catagories_product_details','2026-06-26 04:49:50.915642'),
(19,'myapp','0006_auto_20260626_1019','2026-06-26 04:49:51.006270'),
(20,'sessions','0001_initial','2026-06-26 04:49:51.046201'),
(21,'myapp','0007_auto_20260701_1113','2026-07-01 05:43:31.853689'),
(22,'myapp','0008_booking_personaldetails','2026-07-06 05:41:10.640737'),
(23,'myapp','0009_auto_20260707_0956','2026-07-07 04:26:44.709452'),
(24,'myapp','0010_auto_20260707_0958','2026-07-07 04:29:09.345959'),
(25,'myapp','0011_feedback','2026-07-08 05:00:36.529044');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `django_session` */

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values 
('cbh3grr0hym2othp6vr50ydklmd0zhl5','NWZjZDJmZDRmY2FlNDMzZGM1ZTU4Y2I3NzBiOGJlMmNjNWI3YWU4NDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ZjdmZTM0NDk5MDZkM2M1OTMwOTA1NjA5ZTRhZjg3ZWM5ZjhlNWI2In0=','2026-07-13 04:58:49.738069'),
('f9fdantqzrkfndlu0agaatnplylv4y45','NWZjZDJmZDRmY2FlNDMzZGM1ZTU4Y2I3NzBiOGJlMmNjNWI3YWU4NDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5ZjdmZTM0NDk5MDZkM2M1OTMwOTA1NjA5ZTRhZjg3ZWM5ZjhlNWI2In0=','2026-07-23 06:03:29.992533'),
('gkdotisu85r9ranu2xostza9bm1o0jkw','YmM4YzI1ZDU2MmZjZGRjOGQyZDA5ZDY2NWMzN2RlOGY2ODJiYWE0NTp7Il9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxZTg1NTJkNGNiZWEzYzc3MjE2ZjViYzI4MTMxNDYwOGVlOTQxNGMwIn0=','2026-07-23 04:19:15.740090');

/*Table structure for table `myapp_booking` */

DROP TABLE IF EXISTS `myapp_booking`;

CREATE TABLE `myapp_booking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) NOT NULL,
  `amount` double NOT NULL,
  `status` varchar(50) NOT NULL,
  `delivery_status` varchar(100) NOT NULL,
  `buyer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_booking_buyer_id_a0757f49_fk_myapp_buyerregister_id` (`buyer_id`),
  KEY `myapp_booking_product_id_34d8ddba_fk_myapp_productdetails_id` (`product_id`),
  KEY `myapp_booking_seller_id_833703c9_fk_myapp_sellerregister_id` (`seller_id`),
  CONSTRAINT `myapp_booking_buyer_id_a0757f49_fk_myapp_buyerregister_id` FOREIGN KEY (`buyer_id`) REFERENCES `myapp_buyerregister` (`id`),
  CONSTRAINT `myapp_booking_product_id_34d8ddba_fk_myapp_productdetails_id` FOREIGN KEY (`product_id`) REFERENCES `myapp_productdetails` (`id`),
  CONSTRAINT `myapp_booking_seller_id_833703c9_fk_myapp_sellerregister_id` FOREIGN KEY (`seller_id`) REFERENCES `myapp_sellerregister` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_booking` */

insert  into `myapp_booking`(`id`,`quantity`,`amount`,`status`,`delivery_status`,`buyer_id`,`product_id`,`seller_id`) values 
(1,15,600,'Paid','Delivered',1,2,1);

/*Table structure for table `myapp_buyerregister` */

DROP TABLE IF EXISTS `myapp_buyerregister`;

CREATE TABLE `myapp_buyerregister` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `phone` bigint(20) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_buyerregister_user_id_0a8d6b6a_fk_auth_user_id` (`user_id`),
  CONSTRAINT `myapp_buyerregister_user_id_0a8d6b6a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_buyerregister` */

insert  into `myapp_buyerregister`(`id`,`name`,`email`,`password`,`user_id`,`phone`,`address`) values 
(1,'abhijith','abhijith@gmail','1234',2,NULL,'ehehe house. thrissur');

/*Table structure for table `myapp_cart` */

DROP TABLE IF EXISTS `myapp_cart`;

CREATE TABLE `myapp_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) NOT NULL,
  `total_amount` double NOT NULL,
  `buyer_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `seller_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `myapp_cart_product_id_buyer_id_6dd2d6df_uniq` (`product_id`,`buyer_id`),
  KEY `myapp_cart_buyer_id_2628b7b0_fk_myapp_buyerregister_id` (`buyer_id`),
  KEY `myapp_cart_seller_id_f6d98533_fk_myapp_sellerregister_id` (`seller_id`),
  CONSTRAINT `myapp_cart_buyer_id_2628b7b0_fk_myapp_buyerregister_id` FOREIGN KEY (`buyer_id`) REFERENCES `myapp_buyerregister` (`id`),
  CONSTRAINT `myapp_cart_product_id_8e7aeeb3_fk_myapp_productdetails_id` FOREIGN KEY (`product_id`) REFERENCES `myapp_productdetails` (`id`),
  CONSTRAINT `myapp_cart_seller_id_f6d98533_fk_myapp_sellerregister_id` FOREIGN KEY (`seller_id`) REFERENCES `myapp_sellerregister` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_cart` */

insert  into `myapp_cart`(`id`,`quantity`,`total_amount`,`buyer_id`,`product_id`,`seller_id`) values 
(6,1,40,1,2,1);

/*Table structure for table `myapp_categories` */

DROP TABLE IF EXISTS `myapp_categories`;

CREATE TABLE `myapp_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_categories` */

insert  into `myapp_categories`(`id`,`category`) values 
(1,'Fruits'),
(2,'veg');

/*Table structure for table `myapp_feedback` */

DROP TABLE IF EXISTS `myapp_feedback`;

CREATE TABLE `myapp_feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment` longtext NOT NULL,
  `rating` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `buyer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_feedback_buyer_id_ef6fe43b_fk_myapp_buyerregister_id` (`buyer_id`),
  KEY `myapp_feedback_product_id_46b583ed_fk_myapp_productdetails_id` (`product_id`),
  CONSTRAINT `myapp_feedback_buyer_id_ef6fe43b_fk_myapp_buyerregister_id` FOREIGN KEY (`buyer_id`) REFERENCES `myapp_buyerregister` (`id`),
  CONSTRAINT `myapp_feedback_product_id_46b583ed_fk_myapp_productdetails_id` FOREIGN KEY (`product_id`) REFERENCES `myapp_productdetails` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_feedback` */

insert  into `myapp_feedback`(`id`,`comment`,`rating`,`created_at`,`buyer_id`,`product_id`) values 
(1,'good',3,'2026-07-08 05:57:31.149383',1,2);

/*Table structure for table `myapp_personaldetails` */

DROP TABLE IF EXISTS `myapp_personaldetails`;

CREATE TABLE `myapp_personaldetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `email` varchar(254) NOT NULL,
  `address` longtext NOT NULL,
  `country` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `pin` int(11) NOT NULL,
  `amount` double NOT NULL,
  `buyer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_personaldetail_buyer_id_76b94ac1_fk_myapp_buy` (`buyer_id`),
  KEY `myapp_personaldetail_product_id_46935521_fk_myapp_pro` (`product_id`),
  KEY `myapp_personaldetail_seller_id_1a92ba61_fk_myapp_sel` (`seller_id`),
  CONSTRAINT `myapp_personaldetail_buyer_id_76b94ac1_fk_myapp_buy` FOREIGN KEY (`buyer_id`) REFERENCES `myapp_buyerregister` (`id`),
  CONSTRAINT `myapp_personaldetail_product_id_46935521_fk_myapp_pro` FOREIGN KEY (`product_id`) REFERENCES `myapp_productdetails` (`id`),
  CONSTRAINT `myapp_personaldetail_seller_id_1a92ba61_fk_myapp_sel` FOREIGN KEY (`seller_id`) REFERENCES `myapp_sellerregister` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_personaldetails` */

insert  into `myapp_personaldetails`(`id`,`quantity`,`firstname`,`lastname`,`email`,`address`,`country`,`state`,`pin`,`amount`,`buyer_id`,`product_id`,`seller_id`) values 
(1,15,'evin','mr','mre82757@gmail.com','Melath house , nedupuzha P.O , Thrissur','United States','Kerala',680007,600,1,2,1);

/*Table structure for table `myapp_productdetails` */

DROP TABLE IF EXISTS `myapp_productdetails`;

CREATE TABLE `myapp_productdetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(100) DEFAULT NULL,
  `product_description` varchar(2000) DEFAULT NULL,
  `price` bigint(20) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `status` varchar(50) NOT NULL,
  `category_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_product_detail_seller_id_e20a93b1_fk_myapp_sel` (`seller_id`),
  KEY `myapp_product_detail_category_id_d907151a_fk_myapp_cat` (`category_id`),
  CONSTRAINT `myapp_product_detail_category_id_d907151a_fk_myapp_cat` FOREIGN KEY (`category_id`) REFERENCES `myapp_categories` (`id`),
  CONSTRAINT `myapp_product_detail_seller_id_e20a93b1_fk_myapp_sel` FOREIGN KEY (`seller_id`) REFERENCES `myapp_sellerregister` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_productdetails` */

insert  into `myapp_productdetails`(`id`,`product_name`,`product_description`,`price`,`quantity`,`image`,`status`,`category_id`,`seller_id`) values 
(1,'Apple/kg','good for health',150,105,'media/apples-on-a-tree-branch.webp','Approved',1,1),
(2,'Ladyfinger','good for ',40,88,'media/ladyfinger.jpg','Approved',2,1);

/*Table structure for table `myapp_sellerregister` */

DROP TABLE IF EXISTS `myapp_sellerregister`;

CREATE TABLE `myapp_sellerregister` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  `phone` bigint(20) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `password` varchar(8) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `status` varchar(10) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_sellerregister_user_id_6d5f57cf_fk_auth_user_id` (`user_id`),
  CONSTRAINT `myapp_sellerregister_user_id_6d5f57cf_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_sellerregister` */

insert  into `myapp_sellerregister`(`id`,`name`,`email`,`phone`,`address`,`password`,`image`,`status`,`user_id`) values 
(1,'athul','athul@gmail.com',8943171980,'hsudfhafj house','123','','Approved',3);

/*Table structure for table `myapp_wishlist` */

DROP TABLE IF EXISTS `myapp_wishlist`;

CREATE TABLE `myapp_wishlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_wishlist_product_id_85e36668_fk_myapp_productdetails_id` (`product_id`),
  KEY `myapp_wishlist_user_id_3f5af099` (`user_id`),
  CONSTRAINT `myapp_wishlist_product_id_85e36668_fk_myapp_productdetails_id` FOREIGN KEY (`product_id`) REFERENCES `myapp_productdetails` (`id`),
  CONSTRAINT `myapp_wishlist_user_id_3f5af099_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_wishlist` */

insert  into `myapp_wishlist`(`id`,`product_id`,`user_id`) values 
(7,2,2);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
