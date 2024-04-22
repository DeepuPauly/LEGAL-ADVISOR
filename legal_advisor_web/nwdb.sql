/*
SQLyog Community v13.0.1 (64 bit)
MySQL - 8.0.33 : Database - legal_advisor
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`legal_advisor` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `legal_advisor`;

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
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
(25,'Can add advocate_table',7,'add_advocate_table'),
(26,'Can change advocate_table',7,'change_advocate_table'),
(27,'Can delete advocate_table',7,'delete_advocate_table'),
(28,'Can view advocate_table',7,'view_advocate_table'),
(29,'Can add booking_table',8,'add_booking_table'),
(30,'Can change booking_table',8,'change_booking_table'),
(31,'Can delete booking_table',8,'delete_booking_table'),
(32,'Can view booking_table',8,'view_booking_table'),
(33,'Can add case',9,'add_case'),
(34,'Can change case',9,'change_case'),
(35,'Can delete case',9,'delete_case'),
(36,'Can view case',9,'view_case'),
(37,'Can add case_type_table',10,'add_case_type_table'),
(38,'Can change case_type_table',10,'change_case_type_table'),
(39,'Can delete case_type_table',10,'delete_case_type_table'),
(40,'Can view case_type_table',10,'view_case_type_table'),
(41,'Can add enquiry',11,'add_enquiry'),
(42,'Can change enquiry',11,'change_enquiry'),
(43,'Can delete enquiry',11,'delete_enquiry'),
(44,'Can view enquiry',11,'view_enquiry'),
(45,'Can add login_table',12,'add_login_table'),
(46,'Can change login_table',12,'change_login_table'),
(47,'Can delete login_table',12,'delete_login_table'),
(48,'Can view login_table',12,'view_login_table'),
(49,'Can add user_table',13,'add_user_table'),
(50,'Can change user_table',13,'change_user_table'),
(51,'Can delete user_table',13,'delete_user_table'),
(52,'Can view user_table',13,'view_user_table'),
(53,'Can add schedule_table',14,'add_schedule_table'),
(54,'Can change schedule_table',14,'change_schedule_table'),
(55,'Can delete schedule_table',14,'delete_schedule_table'),
(56,'Can view schedule_table',14,'view_schedule_table'),
(57,'Can add payment',15,'add_payment'),
(58,'Can change payment',15,'change_payment'),
(59,'Can delete payment',15,'delete_payment'),
(60,'Can view payment',15,'view_payment'),
(61,'Can add feedback_table',16,'add_feedback_table'),
(62,'Can change feedback_table',16,'change_feedback_table'),
(63,'Can delete feedback_table',16,'delete_feedback_table'),
(64,'Can view feedback_table',16,'view_feedback_table'),
(65,'Can add entry_level_staff_table',17,'add_entry_level_staff_table'),
(66,'Can change entry_level_staff_table',17,'change_entry_level_staff_table'),
(67,'Can delete entry_level_staff_table',17,'delete_entry_level_staff_table'),
(68,'Can view entry_level_staff_table',17,'view_entry_level_staff_table'),
(69,'Can add daily_report',18,'add_daily_report'),
(70,'Can change daily_report',18,'change_daily_report'),
(71,'Can delete daily_report',18,'delete_daily_report'),
(72,'Can view daily_report',18,'view_daily_report'),
(73,'Can add complains_table',19,'add_complains_table'),
(74,'Can change complains_table',19,'change_complains_table'),
(75,'Can delete complains_table',19,'delete_complains_table'),
(76,'Can view complains_table',19,'view_complains_table'),
(77,'Can add chat_table',20,'add_chat_table'),
(78,'Can change chat_table',20,'change_chat_table'),
(79,'Can delete chat_table',20,'delete_chat_table'),
(80,'Can view chat_table',20,'view_chat_table'),
(81,'Can add case_report',21,'add_case_report'),
(82,'Can change case_report',21,'change_case_report'),
(83,'Can delete case_report',21,'delete_case_report'),
(84,'Can view case_report',21,'view_case_report'),
(85,'Can add case_note',22,'add_case_note'),
(86,'Can change case_note',22,'change_case_note'),
(87,'Can delete case_note',22,'delete_case_note'),
(88,'Can view case_note',22,'view_case_note'),
(89,'Can add allocation',23,'add_allocation'),
(90,'Can change allocation',23,'change_allocation'),
(91,'Can delete allocation',23,'delete_allocation'),
(92,'Can view allocation',23,'view_allocation');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user` */

insert  into `auth_user`(`id`,`password`,`last_login`,`is_superuser`,`username`,`first_name`,`last_name`,`email`,`is_staff`,`is_active`,`date_joined`) values 
(1,'pbkdf2_sha256$260000$FfQLaztnEmIAzZSoqfM2NI$JA+70dm1a5BeAD7XZQvd3imYIiTxCRceFAfnSZVDqLo=','2024-02-29 07:24:52.568357',1,'admin','','','admin@gmail.com',1,1,'2024-01-07 12:09:58.800380');

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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values 
(1,'admin','logentry'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'auth','user'),
(5,'contenttypes','contenttype'),
(7,'legel','advocate_table'),
(23,'legel','allocation'),
(8,'legel','booking_table'),
(9,'legel','case'),
(22,'legel','case_note'),
(21,'legel','case_report'),
(10,'legel','case_type_table'),
(20,'legel','chat_table'),
(19,'legel','complains_table'),
(18,'legel','daily_report'),
(11,'legel','enquiry'),
(17,'legel','entry_level_staff_table'),
(16,'legel','feedback_table'),
(12,'legel','login_table'),
(15,'legel','payment'),
(14,'legel','schedule_table'),
(13,'legel','user_table'),
(6,'sessions','session');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values 
(1,'contenttypes','0001_initial','2023-12-09 07:46:16.803401'),
(2,'auth','0001_initial','2023-12-09 07:46:17.274071'),
(3,'admin','0001_initial','2023-12-09 07:46:17.389214'),
(4,'admin','0002_logentry_remove_auto_add','2023-12-09 07:46:17.404848'),
(5,'admin','0003_logentry_add_action_flag_choices','2023-12-09 07:46:17.420479'),
(6,'contenttypes','0002_remove_content_type_name','2023-12-09 07:46:17.517117'),
(7,'auth','0002_alter_permission_name_max_length','2023-12-09 07:46:17.563358'),
(8,'auth','0003_alter_user_email_max_length','2023-12-09 07:46:17.581861'),
(9,'auth','0004_alter_user_username_opts','2023-12-09 07:46:17.587373'),
(10,'auth','0005_alter_user_last_login_null','2023-12-09 07:46:17.649193'),
(11,'auth','0006_require_contenttypes_0002','2023-12-09 07:46:17.657581'),
(12,'auth','0007_alter_validators_add_error_messages','2023-12-09 07:46:17.660462'),
(13,'auth','0008_alter_user_username_max_length','2023-12-09 07:46:17.708510'),
(14,'auth','0009_alter_user_last_name_max_length','2023-12-09 07:46:17.770121'),
(15,'auth','0010_alter_group_name_max_length','2023-12-09 07:46:17.787713'),
(16,'auth','0011_update_proxy_permissions','2023-12-09 07:46:17.787713'),
(17,'auth','0012_alter_user_first_name_max_length','2023-12-09 07:46:17.849506'),
(18,'legel','0001_initial','2023-12-09 07:46:19.290458'),
(19,'sessions','0001_initial','2023-12-09 07:46:19.328860'),
(20,'legel','0002_alter_booking_table_status','2023-12-09 08:31:35.712725'),
(21,'legel','0003_remove_booking_table_user','2024-01-05 11:35:17.756624'),
(22,'legel','0004_enquiry_user','2024-01-06 10:32:32.164288'),
(23,'legel','0005_auto_20240113_1510','2024-01-13 09:41:22.700362'),
(24,'legel','0006_advocate_table_image','2024-01-13 10:42:43.006621');

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
('9exmpqlwbetbwln0mqz8cp1o9svugiux','.eJxVjjsOgzAQRO_iOrK8GP9Sps8ZLO96HZMgkDBUUe4ekCiS9s3M07xFTNta49Z4iUMWVwHi8ssw0YunI8jPND1mSfO0LgPKoyLPtMn7nHm8nd0_QU2t7uuuoNFsVQhknfLBON_15JW2Oyw9AmtPiNl6qyEY0A6YDEFRymTWZZeOx78OPl-25Dlk:1rebOb:Kz0u3AGwZLHw1xPEl7ARh_8Bq2BOOqPKdSiIwMMA52Y','2024-03-11 13:51:53.008363'),
('erqle2fzx5jug8leuyc9naiwobtdl0a3','eyJjaWQiOjF9:1rBvCD:L3me406xmI7da0Cwr6OfczykbMwxBa3QnlEfVx03Z7M','2023-12-23 11:08:33.787241'),
('g0zd30co9k9o66kropbm23s6yutlwyvi','.eJxVjjsOgzAQRO_iOrK8LP6lTJ8zWPZ6HZMgkDBUUe4ekCiS9s3M07xFiNtaw9Z4CUMWVwHi8stSpBdPR5CfcXrMkuZpXYYkj4o80ybvc-bxdnb_BDW2uq-7kjSyUd6Tscp5bV3Xk1Nodlj6BIyOUsrGGQSvAS0waYKilM6MZZeOxz_4fAF9yjky:1rOaFG:LhVaRf9kz3YZbuiedm7rcCVJZUnP45x4FuMD2UxRtFk','2024-01-27 09:24:02.619031'),
('gs1pctnux8jf7c5el4h2wbci6leaw4fg','eyJsaWQiOjMsIkFEVl9pZCI6MTEsImFpZCI6OCwiZXFpZCI6MX0:1rMQvr:0VZFvC358cF8etqxAe9ssbKaByV6rFGir9u0Ss1oqJY','2024-01-21 11:03:07.627969'),
('jph7c2fgsq0dkcftrd8tgu4qywuhji2g','.eJyrVsrJTFGyMtZRcnQJiwcxLXSUEqG0r587WMjQFMxWsjLXUUoGC-gopRZCGcUg2rQWAM-JE2U:1rMPkh:V9pOZ9kKouGxij25rjDG6Ne7DnezzD1xuU7757O1DoM','2024-01-21 09:47:31.591370'),
('p1p25poy4n211duw92m8q9zxswb75spf','.eJyrVkrOTFGyMtJRKobSOSDaWEcpEUQbGtQCAKVJCUQ:1rLhbS:2DxlyWfUxsphN0Agm30KCczPiwxmQXlfGm4PttvKJ8c','2024-01-19 10:39:02.191965'),
('qx4nf0yftevual71qo8iu09ryrsip1qn','.eJxVjr0OwyAQg9-FOUJcDgh07J5niOA4StookfIzVX33BilDO1myP1t-iyEcexmOjddhTOImQDS_Xgz04rkG6RnmxyJpmfd1jLIi8ko32S-Jp_vF_g2UsJWz3eZokK3ynmynnDedazU5hfY0s47A6CjGZJ1F8AawAyZDkJUyiTGfo1P9h40IVUF_vooRO3E:1rOc85:C28G90iXVGzMWntEstdbTFtC9AFHzDA2FyRQbs1lmmM','2024-01-27 11:24:45.015230');

/*Table structure for table `legel_advocate_table` */

DROP TABLE IF EXISTS `legel_advocate_table`;

CREATE TABLE `legel_advocate_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `gender` varchar(60) NOT NULL,
  `place` varchar(70) NOT NULL,
  `post` varchar(70) NOT NULL,
  `pin` bigint NOT NULL,
  `qualification` varchar(50) NOT NULL,
  `experience` varchar(50) NOT NULL,
  `phone` bigint NOT NULL,
  `email` varchar(50) NOT NULL,
  `CASETYPE_id` bigint NOT NULL,
  `login_id` bigint NOT NULL,
  `idproof` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `legel_advocate_table_CASETYPE_id_077a8ae4_fk_legel_cas` (`CASETYPE_id`),
  KEY `legel_advocate_table_login_id_d655f8e5_fk_legel_login_table_id` (`login_id`),
  CONSTRAINT `legel_advocate_table_CASETYPE_id_077a8ae4_fk_legel_cas` FOREIGN KEY (`CASETYPE_id`) REFERENCES `legel_case_type_table` (`id`),
  CONSTRAINT `legel_advocate_table_login_id_d655f8e5_fk_legel_login_table_id` FOREIGN KEY (`login_id`) REFERENCES `legel_login_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `legel_advocate_table` */

insert  into `legel_advocate_table`(`id`,`first_name`,`last_name`,`gender`,`place`,`post`,`pin`,`qualification`,`experience`,`phone`,`email`,`CASETYPE_id`,`login_id`,`idproof`,`image`) values 
(13,'akhilee','raj','male','calicut','kakkodi',673611,'llb','3',8888788898,'akhil@',6,21,'Screenshot (1).png','Screenshot (15).png'),
(14,'abdu','rahman','male','vennad','kappad',776753,'LLb','5years',8788878864,'adby@gmail.com',6,25,'Screenshot (1).png','Screenshot (15).png'),
(15,'abdu','rahman','male','vennad','kappad',776753,'LLb','5years',8788878864,'adby@gmail.com',6,26,'Screenshot (1).png','Screenshot (15).png'),
(16,'FIDA','FATHIMA','male','hh','khg',463655,'kjk','6',9180892967,'ffidafathima9656@gmail.com',6,27,'Screenshot (5).png','Screenshot (15).png');

/*Table structure for table `legel_allocation` */

DROP TABLE IF EXISTS `legel_allocation`;

CREATE TABLE `legel_allocation` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `status` varchar(100) NOT NULL,
  `advocate_id` bigint NOT NULL,
  `booking_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `legel_allocation_advocate_id_94a51a90_fk_legel_advocate_table_id` (`advocate_id`),
  KEY `legel_allocation_booking_id_2d201df3_fk_legel_booking_table_id` (`booking_id`),
  CONSTRAINT `legel_allocation_advocate_id_94a51a90_fk_legel_advocate_table_id` FOREIGN KEY (`advocate_id`) REFERENCES `legel_advocate_table` (`id`),
  CONSTRAINT `legel_allocation_booking_id_2d201df3_fk_legel_booking_table_id` FOREIGN KEY (`booking_id`) REFERENCES `legel_booking_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `legel_allocation` */

insert  into `legel_allocation`(`id`,`date`,`status`,`advocate_id`,`booking_id`) values 
(3,'2024-01-09','allocate',13,5),
(4,'2024-02-29','allocate',16,6);

/*Table structure for table `legel_booking_table` */

DROP TABLE IF EXISTS `legel_booking_table`;

CREATE TABLE `legel_booking_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `booking_date` date NOT NULL,
  `status` varchar(100) NOT NULL,
  `current_date` date NOT NULL,
  `ADVOCATE_id` bigint NOT NULL,
  `CASE_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `legel_booking_table_CASE_id_fad4ffd5_fk_legel_case_id` (`CASE_id`),
  KEY `legel_booking_table_ADVOCATE_id_98baed14_fk_legel_adv` (`ADVOCATE_id`),
  CONSTRAINT `legel_booking_table_ADVOCATE_id_98baed14_fk_legel_adv` FOREIGN KEY (`ADVOCATE_id`) REFERENCES `legel_advocate_table` (`id`),
  CONSTRAINT `legel_booking_table_CASE_id_fad4ffd5_fk_legel_case_id` FOREIGN KEY (`CASE_id`) REFERENCES `legel_case` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `legel_booking_table` */

insert  into `legel_booking_table`(`id`,`booking_date`,`status`,`current_date`,`ADVOCATE_id`,`CASE_id`) values 
(5,'2024-01-09','pending','2024-01-09',13,1),
(6,'2024-05-06','Accepted','2024-02-29',16,2),
(7,'2024-04-01','pending','2024-02-29',13,3),
(8,'2025-09-08','pending','2024-02-29',13,4);

/*Table structure for table `legel_case` */

DROP TABLE IF EXISTS `legel_case`;

CREATE TABLE `legel_case` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `case` varchar(100) NOT NULL,
  `case_details` varchar(100) NOT NULL,
  `file` varchar(100) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `legel_case_user_id_2f53dc68_fk_legel_user_table_id` (`user_id`),
  CONSTRAINT `legel_case_user_id_2f53dc68_fk_legel_user_table_id` FOREIGN KEY (`user_id`) REFERENCES `legel_user_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `legel_case` */

insert  into `legel_case`(`id`,`case`,`case_details`,`file`,`user_id`) values 
(1,'case1','gjwhjhs','bjhj',1),
(2,'aasddfg','qedf','IMG-20230610-WA0017.jpg',1),
(3,'fsshi','gg2','Screenshot_2024-02-27-21-35-04-501_com.android.chrome.jpg',1),
(4,'dff','dff','IMG-20240229-WA0006.jpg',1);

/*Table structure for table `legel_case_note` */

DROP TABLE IF EXISTS `legel_case_note`;

CREATE TABLE `legel_case_note` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `notes` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `CASE_id` bigint NOT NULL,
  `advocate_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `legel_case_note_CASE_id_c0ed764e_fk_legel_case_id` (`CASE_id`),
  KEY `legel_case_note_advocate_id_2624bcef_fk_legel_advocate_table_id` (`advocate_id`),
  CONSTRAINT `legel_case_note_advocate_id_2624bcef_fk_legel_advocate_table_id` FOREIGN KEY (`advocate_id`) REFERENCES `legel_advocate_table` (`id`),
  CONSTRAINT `legel_case_note_CASE_id_c0ed764e_fk_legel_case_id` FOREIGN KEY (`CASE_id`) REFERENCES `legel_case` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `legel_case_note` */

insert  into `legel_case_note`(`id`,`notes`,`date`,`CASE_id`,`advocate_id`) values 
(3,'qwertyuio','2024-02-26',1,13),
(4,'qwertyui','2024-02-29',2,16),
(6,'qfghjk','2024-02-29',2,16);

/*Table structure for table `legel_case_report` */

DROP TABLE IF EXISTS `legel_case_report`;

CREATE TABLE `legel_case_report` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `report` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `advocate_id` bigint NOT NULL,
  `case_id_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `legel_case_report_advocate_id_c11fe17f_fk_legel_adv` (`advocate_id`),
  KEY `legel_case_report_case_id_id_72767fe6_fk_legel_case_id` (`case_id_id`),
  CONSTRAINT `legel_case_report_advocate_id_c11fe17f_fk_legel_adv` FOREIGN KEY (`advocate_id`) REFERENCES `legel_advocate_table` (`id`),
  CONSTRAINT `legel_case_report_case_id_id_72767fe6_fk_legel_case_id` FOREIGN KEY (`case_id_id`) REFERENCES `legel_case` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `legel_case_report` */

insert  into `legel_case_report`(`id`,`report`,`date`,`advocate_id`,`case_id_id`) values 
(3,'hearing con','2024-01-13',13,1),
(4,'Serial No_s7Jd0g5.txt','2024-02-29',16,2),
(5,'Serial No_mMLNzKJ.txt','2024-02-29',16,2);

/*Table structure for table `legel_case_type_table` */

DROP TABLE IF EXISTS `legel_case_type_table`;

CREATE TABLE `legel_case_type_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `case_type` varchar(100) NOT NULL,
  `details` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `legel_case_type_table` */

insert  into `legel_case_type_table`(`id`,`case_type`,`details`) values 
(6,'ipc 305','public violence');

/*Table structure for table `legel_chat_table` */

DROP TABLE IF EXISTS `legel_chat_table`;

CREATE TABLE `legel_chat_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `message` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `time` time(6) NOT NULL,
  `from_id_id` bigint NOT NULL,
  `to_id_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `legel_chat_table_from_id_id_53ebe250_fk_legel_login_table_id` (`from_id_id`),
  KEY `legel_chat_table_to_id_id_132426dc_fk_legel_login_table_id` (`to_id_id`),
  CONSTRAINT `legel_chat_table_from_id_id_53ebe250_fk_legel_login_table_id` FOREIGN KEY (`from_id_id`) REFERENCES `legel_login_table` (`id`),
  CONSTRAINT `legel_chat_table_to_id_id_132426dc_fk_legel_login_table_id` FOREIGN KEY (`to_id_id`) REFERENCES `legel_login_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `legel_chat_table` */

insert  into `legel_chat_table`(`id`,`message`,`date`,`time`,`from_id_id`,`to_id_id`) values 
(1,'hi','2024-02-29','10:22:08.269215',4,21),
(2,'heyyy','2024-02-29','10:23:00.000000',21,4),
(3,'hii','2024-02-29','13:28:40.436349',27,4),
(4,'heee','2024-02-29','13:29:00.000000',4,27),
(5,'hi','2024-02-29','14:19:58.989194',27,29),
(6,'hii','2024-02-29','14:38:12.360338',4,27);

/*Table structure for table `legel_complains_table` */

DROP TABLE IF EXISTS `legel_complains_table`;

CREATE TABLE `legel_complains_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `complains` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `reply` varchar(100) NOT NULL,
  `LOGIN_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `legel_complains_table_LOGIN_id_bddd034f_fk_legel_login_table_id` (`LOGIN_id`),
  CONSTRAINT `legel_complains_table_LOGIN_id_bddd034f_fk_legel_login_table_id` FOREIGN KEY (`LOGIN_id`) REFERENCES `legel_login_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `legel_complains_table` */

insert  into `legel_complains_table`(`id`,`complains`,`date`,`reply`,`LOGIN_id`) values 
(1,'baddd','2023-12-09','ok',1),
(2,'goog','2023-12-09','nn',1),
(3,'not working.......','2024-02-26','pending',21),
(4,'not working ','2024-02-29','pending',4),
(5,'qwertyu','2024-02-29','pending',27),
(6,'not wertyu','2024-02-29','pending',27),
(7,'thvcbn','2024-02-29','pending',4);

/*Table structure for table `legel_daily_report` */

DROP TABLE IF EXISTS `legel_daily_report`;

CREATE TABLE `legel_daily_report` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `report` varchar(100) NOT NULL,
  `details` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `advocate_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `legel_daily_report_advocate_id_ec8eec70_fk_legel_adv` (`advocate_id`),
  CONSTRAINT `legel_daily_report_advocate_id_ec8eec70_fk_legel_adv` FOREIGN KEY (`advocate_id`) REFERENCES `legel_advocate_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `legel_daily_report` */

/*Table structure for table `legel_enquiry` */

DROP TABLE IF EXISTS `legel_enquiry`;

CREATE TABLE `legel_enquiry` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `enquiry` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `reply` varchar(100) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `legel_enquiry_user_id_15f84d9e_fk_legel_user_table_id` (`user_id`),
  CONSTRAINT `legel_enquiry_user_id_15f84d9e_fk_legel_user_table_id` FOREIGN KEY (`user_id`) REFERENCES `legel_user_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `legel_enquiry` */

insert  into `legel_enquiry`(`id`,`enquiry`,`date`,`reply`,`user_id`) values 
(1,'jhgfd','2024-01-06','saf',1),
(2,'qwryy','2024-02-29','pending',1);

/*Table structure for table `legel_entry_level_staff_table` */

DROP TABLE IF EXISTS `legel_entry_level_staff_table`;

CREATE TABLE `legel_entry_level_staff_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `place` varchar(50) NOT NULL,
  `post` varchar(50) NOT NULL,
  `pin` bigint NOT NULL,
  `gender` varchar(50) NOT NULL,
  `phone` bigint NOT NULL,
  `email` varchar(80) NOT NULL,
  `login_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `legel_entry_level_st_login_id_8d946f65_fk_legel_log` (`login_id`),
  CONSTRAINT `legel_entry_level_st_login_id_8d946f65_fk_legel_log` FOREIGN KEY (`login_id`) REFERENCES `legel_login_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `legel_entry_level_staff_table` */

insert  into `legel_entry_level_staff_table`(`id`,`name`,`place`,`post`,`pin`,`gender`,`phone`,`email`,`login_id`) values 
(8,'salam','kochi','kakkodi',673611,'male',7777777777,'salam@gmail.com',24);

/*Table structure for table `legel_feedback_table` */

DROP TABLE IF EXISTS `legel_feedback_table`;

CREATE TABLE `legel_feedback_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `feedback` varchar(100) NOT NULL,
  `rating` double NOT NULL,
  `date` date NOT NULL,
  `advocate_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `legel_feedback_table_advocate_id_d7e4b018_fk_legel_adv` (`advocate_id`),
  KEY `legel_feedback_table_user_id_a70b7128_fk_legel_user_table_id` (`user_id`),
  CONSTRAINT `legel_feedback_table_advocate_id_d7e4b018_fk_legel_adv` FOREIGN KEY (`advocate_id`) REFERENCES `legel_advocate_table` (`id`),
  CONSTRAINT `legel_feedback_table_user_id_a70b7128_fk_legel_user_table_id` FOREIGN KEY (`user_id`) REFERENCES `legel_user_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `legel_feedback_table` */

insert  into `legel_feedback_table`(`id`,`feedback`,`rating`,`date`,`advocate_id`,`user_id`) values 
(3,'good',4.5,'2024-02-26',13,1),
(4,'good experience',4.5,'2024-02-29',16,2),
(5,'dgbbb',2.5,'2024-02-29',13,2),
(6,'thhjj.',2.5,'2024-02-29',16,2);

/*Table structure for table `legel_login_table` */

DROP TABLE IF EXISTS `legel_login_table`;

CREATE TABLE `legel_login_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `legel_login_table` */

insert  into `legel_login_table`(`id`,`username`,`password`,`type`) values 
(1,'admin','admin','admin'),
(3,'entrystaff','staff1','entry_staff'),
(4,'user','user','user'),
(19,'raniroy','rani123','entry_staff'),
(20,'rajubhai','raju123','entry_staff'),
(21,'advocate','advocate','advocate'),
(22,'szdsf','sdfdg','advocate'),
(23,'raniroy','rani123','entry_staff'),
(24,'salam','salam1','entry_staff'),
(25,'abdu','abdu12','advocate'),
(26,'abdu123','abdu1','advocate'),
(27,'ad1','ad','advocate'),
(29,'athi','1234','user');

/*Table structure for table `legel_payment` */

DROP TABLE IF EXISTS `legel_payment`;

CREATE TABLE `legel_payment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `amount` int NOT NULL,
  `date` date NOT NULL,
  `booking_date_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `legel_payment_booking_date_id_a13efad3_fk_legel_booking_table_id` (`booking_date_id`),
  CONSTRAINT `legel_payment_booking_date_id_a13efad3_fk_legel_booking_table_id` FOREIGN KEY (`booking_date_id`) REFERENCES `legel_booking_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `legel_payment` */

insert  into `legel_payment`(`id`,`amount`,`date`,`booking_date_id`) values 
(5,2000,'2024-01-09',5),
(6,2000,'2024-02-29',8);

/*Table structure for table `legel_schedule_table` */

DROP TABLE IF EXISTS `legel_schedule_table`;

CREATE TABLE `legel_schedule_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `from_time` time(6) NOT NULL,
  `to_time` time(6) NOT NULL,
  `day` date NOT NULL,
  `Advocate_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `legel_schedule_table_Advocate_id_d27414bb_fk_legel_adv` (`Advocate_id`),
  CONSTRAINT `legel_schedule_table_Advocate_id_d27414bb_fk_legel_adv` FOREIGN KEY (`Advocate_id`) REFERENCES `legel_advocate_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `legel_schedule_table` */

insert  into `legel_schedule_table`(`id`,`from_time`,`to_time`,`day`,`Advocate_id`) values 
(18,'15:59:00.000000','15:00:00.000000','2024-01-09',13),
(19,'10:57:00.000000','15:03:00.000000','2024-01-09',16);

/*Table structure for table `legel_user_table` */

DROP TABLE IF EXISTS `legel_user_table`;

CREATE TABLE `legel_user_table` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `gender` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `place` varchar(100) NOT NULL,
  `post` varchar(100) NOT NULL,
  `pin` bigint NOT NULL,
  `email` varchar(100) NOT NULL,
  `login_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `legel_user_table_login_id_8200cfbc_fk_legel_login_table_id` (`login_id`),
  CONSTRAINT `legel_user_table_login_id_8200cfbc_fk_legel_login_table_id` FOREIGN KEY (`login_id`) REFERENCES `legel_login_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `legel_user_table` */

insert  into `legel_user_table`(`id`,`firstname`,`lastname`,`gender`,`phone`,`place`,`post`,`pin`,`email`,`login_id`) values 
(1,'aju','h','male','3546','njh','fhj',454,'gfhga',4),
(2,'athira','k','female','9639639633','calicut','calicut',789078,'anju3@gmail.com',29);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
