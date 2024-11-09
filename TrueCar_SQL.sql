/*
SQLyog Community v13.0.1 (64 bit)
MySQL - 8.0.33 : Database - tc
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`tc` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `tc`;

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values 
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can view log entry',1,'view_logentry'),
(5,'Can add permission',2,'add_permission'),
(6,'Can change permission',2,'change_permission'),
(7,'Can delete permission',2,'delete_permission'),
(8,'Can view permission',2,'view_permission'),
(9,'Can add group',3,'add_group'),
(10,'Can change group',3,'change_group'),
(11,'Can delete group',3,'delete_group'),
(12,'Can view group',3,'view_group'),
(13,'Can add user',4,'add_user'),
(14,'Can change user',4,'change_user'),
(15,'Can delete user',4,'delete_user'),
(16,'Can view user',4,'view_user'),
(17,'Can add content type',5,'add_contenttype'),
(18,'Can change content type',5,'change_contenttype'),
(19,'Can delete content type',5,'delete_contenttype'),
(20,'Can view content type',5,'view_contenttype'),
(21,'Can add session',6,'add_session'),
(22,'Can change session',6,'change_session'),
(23,'Can delete session',6,'delete_session'),
(24,'Can view session',6,'view_session'),
(25,'Can add login_table',7,'add_login_table'),
(26,'Can change login_table',7,'change_login_table'),
(27,'Can delete login_table',7,'delete_login_table'),
(28,'Can view login_table',7,'view_login_table'),
(29,'Can add product_table',8,'add_product_table'),
(30,'Can change product_table',8,'change_product_table'),
(31,'Can delete product_table',8,'delete_product_table'),
(32,'Can view product_table',8,'view_product_table'),
(33,'Can add user_table',9,'add_user_table'),
(34,'Can change user_table',9,'change_user_table'),
(35,'Can delete user_table',9,'delete_user_table'),
(36,'Can view user_table',9,'view_user_table'),
(37,'Can add staff_table',10,'add_staff_table'),
(38,'Can change staff_table',10,'change_staff_table'),
(39,'Can delete staff_table',10,'delete_staff_table'),
(40,'Can view staff_table',10,'view_staff_table'),
(41,'Can add product_images',11,'add_product_images'),
(42,'Can change product_images',11,'change_product_images'),
(43,'Can delete product_images',11,'delete_product_images'),
(44,'Can view product_images',11,'view_product_images'),
(45,'Can add testdrive_booking',12,'add_testdrive_booking'),
(46,'Can change testdrive_booking',12,'change_testdrive_booking'),
(47,'Can delete testdrive_booking',12,'delete_testdrive_booking'),
(48,'Can view testdrive_booking',12,'view_testdrive_booking'),
(49,'Can add product_booking',13,'add_product_booking'),
(50,'Can change product_booking',13,'change_product_booking'),
(51,'Can delete product_booking',13,'delete_product_booking'),
(52,'Can view product_booking',13,'view_product_booking'),
(53,'Can add feedback',14,'add_feedback'),
(54,'Can change feedback',14,'change_feedback'),
(55,'Can delete feedback',14,'delete_feedback'),
(56,'Can view feedback',14,'view_feedback'),
(57,'Can add complaint',15,'add_complaint'),
(58,'Can change complaint',15,'change_complaint'),
(59,'Can delete complaint',15,'delete_complaint'),
(60,'Can view complaint',15,'view_complaint'),
(61,'Can add category_table',16,'add_category_table'),
(62,'Can change category_table',16,'change_category_table'),
(63,'Can delete category_table',16,'delete_category_table'),
(64,'Can view category_table',16,'view_category_table'),
(65,'Can add bodytype',17,'add_bodytype'),
(66,'Can change bodytype',17,'change_bodytype'),
(67,'Can delete bodytype',17,'delete_bodytype'),
(68,'Can view bodytype',17,'view_bodytype');

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user` */

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user_groups` */

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_admin_log` */

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values 
(1,'admin','logentry'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'auth','user'),
(5,'contenttypes','contenttype'),
(6,'sessions','session'),
(17,'TC','bodytype'),
(16,'TC','category_table'),
(15,'TC','complaint'),
(14,'TC','feedback'),
(7,'TC','login_table'),
(13,'TC','product_booking'),
(11,'TC','product_images'),
(8,'TC','product_table'),
(10,'TC','staff_table'),
(12,'TC','testdrive_booking'),
(9,'TC','user_table');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values 
(1,'TC','0001_initial','2024-09-22 15:35:50.707777'),
(2,'contenttypes','0001_initial','2024-09-22 15:35:50.750979'),
(3,'auth','0001_initial','2024-09-22 15:35:51.190214'),
(4,'admin','0001_initial','2024-09-22 15:35:51.323168'),
(5,'admin','0002_logentry_remove_auto_add','2024-09-22 15:35:51.331694'),
(6,'admin','0003_logentry_add_action_flag_choices','2024-09-22 15:35:51.331694'),
(7,'contenttypes','0002_remove_content_type_name','2024-09-22 15:35:51.394210'),
(8,'auth','0002_alter_permission_name_max_length','2024-09-22 15:35:51.441484'),
(9,'auth','0003_alter_user_email_max_length','2024-09-22 15:35:51.483867'),
(10,'auth','0004_alter_user_username_opts','2024-09-22 15:35:51.495291'),
(11,'auth','0005_alter_user_last_login_null','2024-09-22 15:35:51.539339'),
(12,'auth','0006_require_contenttypes_0002','2024-09-22 15:35:51.542337'),
(13,'auth','0007_alter_validators_add_error_messages','2024-09-22 15:35:51.552653'),
(14,'auth','0008_alter_user_username_max_length','2024-09-22 15:35:51.605192'),
(15,'auth','0009_alter_user_last_name_max_length','2024-09-22 15:35:51.657003'),
(16,'auth','0010_alter_group_name_max_length','2024-09-22 15:35:51.677860'),
(17,'auth','0011_update_proxy_permissions','2024-09-22 15:35:51.689833'),
(18,'auth','0012_alter_user_first_name_max_length','2024-09-22 15:35:51.740833'),
(19,'sessions','0001_initial','2024-09-22 15:35:51.770116'),
(20,'TC','0002_product_table_body_type','2024-10-06 12:38:38.256356'),
(21,'TC','0003_product_images','2024-10-10 10:41:18.645611'),
(22,'TC','0004_testdrive_booking','2024-10-20 06:44:09.166529'),
(23,'TC','0005_testdrive_booking_status','2024-10-20 06:44:47.261000'),
(24,'TC','0006_product_booking','2024-10-20 10:22:50.042763'),
(25,'TC','0007_feedback','2024-10-25 05:59:24.109958'),
(26,'TC','0008_complaint','2024-10-25 08:39:02.131892'),
(27,'TC','0009_alter_product_table_service','2024-10-27 11:54:42.529256'),
(28,'TC','0010_alter_product_table_details','2024-10-27 11:59:28.597246'),
(29,'TC','0011_product_booking_reson','2024-10-27 12:25:15.772040'),
(30,'TC','0012_category_table','2024-11-09 08:53:23.242548'),
(31,'TC','0013_bodytype','2024-11-09 09:17:28.362340'),
(32,'TC','0014_alter_product_booking_status','2024-11-09 09:51:30.676174');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_session` */

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values 
('5pi6fekqrovqdibed6sosahhh403q4wt','eyJsaWQiOjJ9:1szvLa:CSDz3-HoFJYBapfcSRa0sz3mwg8LOlNQVsV5wMtTjLA','2024-10-27 09:57:10.784197'),
('9cqo9wy4nbk0h65m8lvfst8427an0h5x','eyJsaWQiOjEsImlkIjozfQ:1ssY7s:OFy5-xMtmgBMVuNcIzq2Y6rf3aKouNV0Eh67nUHc4yE','2024-10-07 01:44:32.750443'),
('9zgrcr7n3o4qfxu062vhirs0fr4zkbnq','eyJsaWQiOjF9:1ssYAu:ED6PS4Cy9KpTmng-DseVcl6Fd5Wdqxn_ZCz0Prz0Ziw','2024-10-07 01:47:40.621098'),
('euu10mie2zu6a5ud85o3g14aoij47977','.eJyrVsrJTFGyMtJRKgDRSkaGSjpKRQhmQWJlfGJufmleCUjEwMAAKAaSNdRRSgKrslCqBQB1EBHq:1t9j93:QzhvM8EhtU-mjwDUoK2QCPv1Tqa3yrZcI4veSoXGJ6M','2024-11-23 10:56:45.931644'),
('oe9leicny8p7zn6sdwe70fyviarnhyix','eyJsaWQiOjIsInBpZCI6IjE2In0:1t2PLH:dcowedeZsx575MM5DBc5mDiHM18xJ4f_oBLsMr9KyDk','2024-11-03 06:23:07.151020'),
('ooow6n3eou7yr5brma4zaijj80xfyuad','eyJsaWQiOjcsImlkIjoyLCJwaWQiOjE1fQ:1szv15:Ze1fhizH8CZwc2gaifvfPsaneDzlapXP3cDzu23WSgA','2024-10-27 09:35:59.199914'),
('zx4f289hbna8cgokhl7v2xycih9m299f','.eJyrVsrJTFGyMtJRKgDRSkaGSjpKRQhmQWJlfGJufmleCUjEwMBAqRYAZ6EN7Q:1t9jAs:98rBeoJnm8Z-ohTvu43o1fEWhacf7Twm7tPQeNMkv3I','2024-11-23 10:58:38.699893');

/*Table structure for table `tc_bodytype` */

DROP TABLE IF EXISTS `tc_bodytype`;

CREATE TABLE `tc_bodytype` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `tc_bodytype` */

insert  into `tc_bodytype`(`id`,`name`) values 
(1,'MINI XUV');

/*Table structure for table `tc_category_table` */

DROP TABLE IF EXISTS `tc_category_table`;

CREATE TABLE `tc_category_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `tc_category_table` */

insert  into `tc_category_table`(`id`,`name`) values 
(5,'xxx');

/*Table structure for table `tc_complaint` */

DROP TABLE IF EXISTS `tc_complaint`;

CREATE TABLE `tc_complaint` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `comaplaint` varchar(300) NOT NULL,
  `date` date NOT NULL,
  `reply` varchar(200) NOT NULL,
  `USER_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `TC_complaint_USER_id_8ad821b3_fk_TC_user_table_id` (`USER_id`),
  CONSTRAINT `TC_complaint_USER_id_8ad821b3_fk_TC_user_table_id` FOREIGN KEY (`USER_id`) REFERENCES `tc_user_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `tc_complaint` */

insert  into `tc_complaint`(`id`,`comaplaint`,`date`,`reply`,`USER_id`) values 
(1,'vsdgffdsufh','2024-10-25','its k',2),
(2,'JJJ','2024-10-25','good work',2),
(3,'qwertyuio','2024-10-25','http://127.0.0.1:8001/sdfghj',2),
(5,'very BAD\r\n','2024-10-27','pending',2),
(7,'qwerty','2024-11-09','pending',13),
(8,'sdjfoidsgfyu','2024-11-09','pending',13);

/*Table structure for table `tc_feedback` */

DROP TABLE IF EXISTS `tc_feedback`;

CREATE TABLE `tc_feedback` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `feedback` varchar(200) NOT NULL,
  `PRODUCT_id` bigint NOT NULL,
  `USER_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `TC_feedback_PRODUCT_id_f0232943_fk_TC_product_table_id` (`PRODUCT_id`),
  KEY `TC_feedback_USER_id_2573fc74_fk_TC_user_table_id` (`USER_id`),
  CONSTRAINT `TC_feedback_PRODUCT_id_f0232943_fk_TC_product_table_id` FOREIGN KEY (`PRODUCT_id`) REFERENCES `tc_product_table` (`id`),
  CONSTRAINT `TC_feedback_USER_id_2573fc74_fk_TC_user_table_id` FOREIGN KEY (`USER_id`) REFERENCES `tc_user_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `tc_feedback` */

insert  into `tc_feedback`(`id`,`feedback`,`PRODUCT_id`,`USER_id`) values 
(1,'jjjjjjjjjjjj',16,2),
(2,'good ',18,2),
(3,'seflkjeojf',16,2),
(7,'good',17,1),
(8,'good work',17,1),
(9,'good work',17,1);

/*Table structure for table `tc_login_table` */

DROP TABLE IF EXISTS `tc_login_table`;

CREATE TABLE `tc_login_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `type` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `tc_login_table` */

insert  into `tc_login_table`(`id`,`username`,`password`,`type`) values 
(1,'admin','123','admin'),
(2,'hadiyavp7@gmail.com','hadiya','user'),
(3,'lumna','123','staff'),
(4,'anju','123','staff'),
(6,'vappa','8129530479','staff'),
(7,'anugrahrs@gmail.com','123','user'),
(8,'asdfg@gmail.com','123456789','user'),
(9,'','','user'),
(10,'hudha@gmail.com','123','user'),
(11,'asdfg@Gmail.com','123rtyu','user'),
(12,'hudha@gmail.com','qwertyuio','user'),
(13,'hadiyavp7@gmail.com','1234','user'),
(14,'kjhkujh@gmail.com','lkjiohj','user'),
(15,'lubna123@gmail.com','Lumna@123','user'),
(16,'tonysunny1@gmail.com','Tonysunny1','user'),
(17,'rishna12@gmail.com','Rishana123','user'),
(18,'lumnac1@gmail.com','Lumna123','user'),
(19,'lum','9895559837','staff'),
(20,'lkjhgfds','9987685434','staff'),
(21,'lkjhgfds','9987685434','staff'),
(22,'thehzi12@gmail.com','Thehzi@123','user');

/*Table structure for table `tc_product_booking` */

DROP TABLE IF EXISTS `tc_product_booking`;

CREATE TABLE `tc_product_booking` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `status` varchar(2000) NOT NULL,
  `PRODUCT_id` bigint NOT NULL,
  `USER_id` bigint NOT NULL,
  `reson` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `TC_product_booking_PRODUCT_id_17022af7_fk_TC_product_table_id` (`PRODUCT_id`),
  KEY `TC_product_booking_USER_id_ee18e1bc_fk_TC_user_table_id` (`USER_id`),
  CONSTRAINT `TC_product_booking_PRODUCT_id_17022af7_fk_TC_product_table_id` FOREIGN KEY (`PRODUCT_id`) REFERENCES `tc_product_table` (`id`),
  CONSTRAINT `TC_product_booking_USER_id_ee18e1bc_fk_TC_user_table_id` FOREIGN KEY (`USER_id`) REFERENCES `tc_user_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `tc_product_booking` */

insert  into `tc_product_booking`(`id`,`date`,`status`,`PRODUCT_id`,`USER_id`,`reson`) values 
(1,'2024-09-05','Rejected',16,1,'i dont like'),
(2,'2024-10-20','Rejected',16,1,'asdfghjk'),
(3,'2024-10-21','Return',18,1,'i dont like'),
(4,'2024-10-25','Return',17,1,'ASDFGHJKL'),
(5,'2024-10-27','Return',22,1,'engine complaints'),
(6,'2024-10-27','Rejected - damage on product',19,1,'sdfghj'),
(7,'2024-11-09','booked',17,1,'na'),
(8,'2024-11-09','booked',18,1,'na'),
(9,'2024-11-09','Rejected - dont return on color issue',23,1,'i dont like color');

/*Table structure for table `tc_product_images` */

DROP TABLE IF EXISTS `tc_product_images`;

CREATE TABLE `tc_product_images` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image` varchar(100) NOT NULL,
  `PRODUCT_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `TC_product_images_PRODUCT_id_f9e99b96_fk_TC_product_table_id` (`PRODUCT_id`),
  CONSTRAINT `TC_product_images_PRODUCT_id_f9e99b96_fk_TC_product_table_id` FOREIGN KEY (`PRODUCT_id`) REFERENCES `tc_product_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `tc_product_images` */

insert  into `tc_product_images`(`id`,`image`,`PRODUCT_id`) values 
(12,'i103_wIUHj2X.jpg',16),
(13,'i104_DLrOYVJ.jpeg',16),
(14,'i102_LjnbAwG.jpg',16),
(15,'i101_6Dcm75Q.jpg',16),
(16,'BREZZA1.jpg',17),
(17,'BREZZA2.jpg',17),
(18,'BREZZA3.jpg',17),
(19,'BREZZA_FIHSBbT.png',17),
(20,'WhatsApp_Image_2024-10-04_at_6.08.06_PM.jpeg',18),
(21,'WhatsApp_Image_2024-10-04_at_6.08.06_PM_BaHIiRC.jpeg',18),
(22,'WhatsApp_Image_2024-10-04_at_6.08.06_PM_9MqTaP2.jpeg',18),
(23,'INNOVA_OAsG6Yy.jpg',19),
(24,'INNOVA_v2o5tX1.jpg',19),
(25,'BALENO_6AWqXBW.jpg',20),
(26,'BALENO_nmWqlBF.jpg',20),
(27,'BALENO_rRY7j8q.jpg',20),
(28,'BALENO_wHE4322.jpg',21),
(29,'BALENO_tzxT6Fp.jpg',21),
(30,'KIA_66sa78o.jfif',22),
(31,'KIA_nn8ZDfq.jfif',22),
(32,'KIA_1EOAfIG.jfif',22),
(33,'KIA_fIXlRam.jfif',22);

/*Table structure for table `tc_product_table` */

DROP TABLE IF EXISTS `tc_product_table`;

CREATE TABLE `tc_product_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `model` int NOT NULL,
  `year` int NOT NULL,
  `image` varchar(100) NOT NULL,
  `company` varchar(50) NOT NULL,
  `details` longtext NOT NULL,
  `history` varchar(50) NOT NULL,
  `service` longtext NOT NULL,
  `warranty` varchar(50) NOT NULL,
  `color` varchar(50) NOT NULL,
  `fuel` varchar(50) NOT NULL,
  `km` varchar(50) NOT NULL,
  `manul` varchar(50) NOT NULL,
  `owner` varchar(50) NOT NULL,
  `battary` varchar(50) NOT NULL,
  `price` int NOT NULL,
  `body_type` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `tc_product_table` */

insert  into `tc_product_table`(`id`,`name`,`model`,`year`,`image`,`company`,`details`,`history`,`service`,`warranty`,`color`,`fuel`,`km`,`manul`,`owner`,`battary`,`price`,`body_type`) values 
(16,'i10',2022,2022,'2024-10-13.jpg','HYUNDAI','GOOD CONDITION','NO ACCIDENT','COMPANY SEVICE','5 YEARS','RED','PETROL','27000','MANUAL','SECOND','50.0%',750000,'crossover'),
(17,'BREZZA',2017,2017,'BREZZA_DMD8RtS.png','SUZUKI','NICE CAR','ONE ACCIDENT','ONE FREE SERVICE','6 MONTH','YELLOW','PETROL','12000','MANUAL','SINGLE','85%',100000,'suv'),
(18,'VOLKSWAGEN',2019,2018,'WhatsApp Image 2024-10-04 at 6.08.06 PM_XPCtgFm.jpeg','VOLKSWAGEN','GOOD','NO AACIDENT','COMPANY SEVICE','1 YEARS','RED','DIESEL','25000','MANUAL','SECOND','80%',510000,'crossover'),
(19,'FORTUNER',2019,2018,'INNOVA_7QNudLH.jpg','TOYOTA','NICE','NO AACIDENT','COMPANY SEVICE','2 YEARS','BLACK','DIESEL','25000','MANUAL','SECOND','80%',140000,'suv'),
(20,'BALENO',2016,2016,'BALENO_ZMZiBJb.jpg','SUZUKI','GOOD','ONE ACCIDENT','COMPANY','6 MONTHS','BLUE','PETROL','10000','MANUAL','THIRD OWNER','78%',600000,'suv'),
(21,'BALENO',2015,2016,'2024-10-14.jpg','SUZUKI','good','ONE ACCIDENT','COMPANY','6 MONTHS','BLUE','PETROL','10000','MANUAL','THIRD OWNER','78%',600000,'sedan'),
(22,'KIA',2016,2016,'2024-10-27.jpg','KIA','NICE','ONE ACCIDENT','COMPANY','6 MONTHS','WHITE','PETROL','10000','MANUAL','THIRD OWNER','78%',600000,'sedan'),
(23,'KIA SELTOS',2019,2019,'2024-10-27.jpg','KIA',' It was introduced in mid-2019 and is positioned between the smaller Stonic, Soul, or Sonet and the larger Sportage in Kia\'s global SUV lineup',' No accident , Perfect condition','Engine Oil, Oil Filter , Wheel Alignment, All other services ','5 Years',' Imperial Blue','PETROL','25000','MANUAL','SINGLE','92%',1500000,'suv'),
(24,'KIA SELTOS',2019,2019,'seltosimperialblue.jpg','KIA',' It was introduced in mid-2019 and is positioned between the smaller Stonic, Soul, or Sonet and the larger Sportage in Kia\'s global SUV lineup',' No accident , Perfect condition','COMPAN Y SERVICE','5 Years',' Imperial Blue','PETROL','25000','MANUAL','SINGLE','92%',1500000,'suv');

/*Table structure for table `tc_staff_table` */

DROP TABLE IF EXISTS `tc_staff_table`;

CREATE TABLE `tc_staff_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `place` varchar(100) NOT NULL,
  `pin` int NOT NULL,
  `post` varchar(50) NOT NULL,
  `phone` bigint NOT NULL,
  `image` varchar(100) NOT NULL,
  `login_ID_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `TC_staff_table_login_ID_id_dfe440be_fk_TC_login_table_id` (`login_ID_id`),
  CONSTRAINT `TC_staff_table_login_ID_id_dfe440be_fk_TC_login_table_id` FOREIGN KEY (`login_ID_id`) REFERENCES `tc_login_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `tc_staff_table` */

insert  into `tc_staff_table`(`id`,`name`,`place`,`pin`,`post`,`phone`,`image`,`login_ID_id`) values 
(1,'LUMNA CM','EDAVANNA',676541,'EDAVANNA',9895559837,'WhatsApp Image 2024-10-07 at 11.07.04 AM.jpeg',3),
(2,'ANJU','PALAKKAD',679552,'ANGADI',7902501918,'WhatsApp Image 2024-10-07 at 11.09.59 AM_FfGK2eU.jpeg',4),
(3,'ABHINAND V','PATTAMBI',679303,'PATTAMBI',8129530479,'WhatsApp Image 2024-10-07 at 11.08.47 AM.jpeg',6),
(6,'RISHANA','asdfghj',123456,'qwertyui',9987685434,'WhatsApp Image 2024-10-07 at 11.19.19 AM_sVqUj11.jpeg',21);

/*Table structure for table `tc_testdrive_booking` */

DROP TABLE IF EXISTS `tc_testdrive_booking`;

CREATE TABLE `tc_testdrive_booking` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `time` time(6) NOT NULL,
  `PRODUCT_id` bigint NOT NULL,
  `USER_id` bigint NOT NULL,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `TC_testdrive_booking_PRODUCT_id_d5945038_fk_TC_product_table_id` (`PRODUCT_id`),
  KEY `TC_testdrive_booking_USER_id_f08ea9dd_fk_TC_user_table_id` (`USER_id`),
  CONSTRAINT `TC_testdrive_booking_PRODUCT_id_d5945038_fk_TC_product_table_id` FOREIGN KEY (`PRODUCT_id`) REFERENCES `tc_product_table` (`id`),
  CONSTRAINT `TC_testdrive_booking_USER_id_f08ea9dd_fk_TC_user_table_id` FOREIGN KEY (`USER_id`) REFERENCES `tc_user_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `tc_testdrive_booking` */

insert  into `tc_testdrive_booking`(`id`,`date`,`time`,`PRODUCT_id`,`USER_id`,`status`) values 
(1,'2024-10-29','12:25:00.000000',17,1,'Booked'),
(2,'2024-10-22','14:53:00.000000',21,1,'Booked'),
(3,'2024-10-31','15:22:00.000000',17,1,'Booked'),
(4,'2024-10-23','12:58:00.000000',17,1,'Booked'),
(5,'2024-10-31','15:22:00.000000',23,1,'Booked'),
(6,'2024-11-20','11:21:00.000000',23,1,'Booked'),
(7,'2024-11-09','12:00:00.000000',21,1,'Booked'),
(8,'2024-11-11','08:00:00.000000',21,1,'Booked'),
(9,'2024-11-11','09:00:00.000000',21,2,'Booked'),
(10,'2024-11-11','10:00:00.000000',21,2,'Booked'),
(11,'2024-11-11','11:00:00.000000',21,2,'Booked'),
(12,'2024-11-11','01:00:00.000000',20,2,'Booked');

/*Table structure for table `tc_user_table` */

DROP TABLE IF EXISTS `tc_user_table`;

CREATE TABLE `tc_user_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `place` varchar(100) NOT NULL,
  `pin` int NOT NULL,
  `post` varchar(50) NOT NULL,
  `phone` bigint NOT NULL,
  `image` varchar(100) NOT NULL,
  `LOGIN_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `TC_user_table_LOGIN_id_097a8519_fk_TC_login_table_id` (`LOGIN_id`),
  CONSTRAINT `TC_user_table_LOGIN_id_097a8519_fk_TC_login_table_id` FOREIGN KEY (`LOGIN_id`) REFERENCES `tc_login_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `tc_user_table` */

insert  into `tc_user_table`(`id`,`name`,`place`,`pin`,`post`,`phone`,`image`,`LOGIN_id`) values 
(1,'HADIYA VP','OTHAYI',676541,'PERAKAMANNA',8589074009,'WhatsApp Image 2024-10-13 at 12.52.02 PM_A72FyTN.jpeg',2),
(2,'ANUGRAH RS','KOZHIKODE',765432,'KOZHIKODE',9889765643,'WhatsApp Image 2024-10-13 at 12.56.59 PM.jpeg',7),
(10,'TONY SUNNY','EDAVANNA',676541,'EDAVANNA',9876854643,'KIA_TCsc527.jfif',16),
(13,'THEHZI','EDAPPAL',676541,'PERUMPADAPP',6234569801,'WhatsApp Image 2024-10-27 at 1.27.11 PM.jpeg',22);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
