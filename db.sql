/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 5.7.9 : Database - legal_advisor
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`legal_advisor` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `legal_advisor`;

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=93 DEFAULT CHARSET=latin1;

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `auth_user` */

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_user_id_6a12ed8b` (`user_id`),
  KEY `auth_user_groups_group_id_97559544` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `auth_user_groups` */

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`),
  KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

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
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `django_admin_log` */

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values 
(1,'admin','logentry'),
(2,'auth','permission'),
(3,'auth','group'),
(4,'auth','user'),
(5,'contenttypes','contenttype'),
(6,'sessions','session'),
(7,'legel','advocate_table'),
(8,'legel','booking_table'),
(9,'legel','case'),
(10,'legel','case_type_table'),
(11,'legel','enquiry'),
(12,'legel','login_table'),
(13,'legel','user_table'),
(14,'legel','schedule_table'),
(15,'legel','payment'),
(16,'legel','feedback_table'),
(17,'legel','entry_level_staff_table'),
(18,'legel','daily_report'),
(19,'legel','complains_table'),
(20,'legel','chat_table'),
(21,'legel','case_report'),
(22,'legel','case_note'),
(23,'legel','allocation');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values 
(1,'contenttypes','0001_initial','2024-03-08 19:07:45.799779'),
(2,'auth','0001_initial','2024-03-08 19:07:49.639459'),
(3,'admin','0001_initial','2024-03-08 19:07:52.682200'),
(4,'admin','0002_logentry_remove_auto_add','2024-03-08 19:07:53.380637'),
(5,'admin','0003_logentry_add_action_flag_choices','2024-03-08 19:07:53.418146'),
(6,'contenttypes','0002_remove_content_type_name','2024-03-08 19:07:53.719078'),
(7,'auth','0002_alter_permission_name_max_length','2024-03-08 19:07:53.861385'),
(8,'auth','0003_alter_user_email_max_length','2024-03-08 19:07:54.084238'),
(9,'auth','0004_alter_user_username_opts','2024-03-08 19:07:54.115337'),
(10,'auth','0005_alter_user_last_login_null','2024-03-08 19:07:54.434644'),
(11,'auth','0006_require_contenttypes_0002','2024-03-08 19:07:54.450143'),
(12,'auth','0007_alter_validators_add_error_messages','2024-03-08 19:07:54.498719'),
(13,'auth','0008_alter_user_username_max_length','2024-03-08 19:07:54.664445'),
(14,'auth','0009_alter_user_last_name_max_length','2024-03-08 19:07:54.799118'),
(15,'auth','0010_alter_group_name_max_length','2024-03-08 19:07:55.250789'),
(16,'auth','0011_update_proxy_permissions','2024-03-08 19:07:55.267109'),
(17,'legel','0001_initial','2024-03-08 19:08:00.527631'),
(18,'legel','0002_alter_booking_table_status','2024-03-08 19:08:04.577573'),
(19,'legel','0003_remove_booking_table_user','2024-03-08 19:08:04.866464'),
(20,'legel','0004_enquiry_user','2024-03-08 19:08:05.182530'),
(21,'legel','0005_auto_20240113_1510','2024-03-08 19:08:05.978437'),
(22,'legel','0006_advocate_table_image','2024-03-08 19:08:06.313034'),
(23,'legel','0007_auto_20240309_0036','2024-03-08 19:08:10.618879'),
(24,'sessions','0001_initial','2024-03-08 19:08:10.840254');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `django_session` */

/*Table structure for table `legel_advocate_table` */

DROP TABLE IF EXISTS `legel_advocate_table`;

CREATE TABLE `legel_advocate_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `gender` varchar(60) NOT NULL,
  `place` varchar(70) NOT NULL,
  `post` varchar(70) NOT NULL,
  `pin` bigint(20) NOT NULL,
  `qualification` varchar(50) NOT NULL,
  `experience` varchar(50) NOT NULL,
  `phone` bigint(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `CASETYPE_id` int(11) NOT NULL,
  `login_id` int(11) NOT NULL,
  `idproof` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `legel_advocate_table_CASETYPE_id_077a8ae4` (`CASETYPE_id`),
  KEY `legel_advocate_table_login_id_d655f8e5` (`login_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `legel_advocate_table` */

insert  into `legel_advocate_table`(`id`,`first_name`,`last_name`,`gender`,`place`,`post`,`pin`,`qualification`,`experience`,`phone`,`email`,`CASETYPE_id`,`login_id`,`idproof`,`image`) values 
(1,'rohan','sam','male','kollam','456789',123443,'llb','2',8330234522,'rohan@gmail.com',1,3,'background1.jpg','card1.png');

/*Table structure for table `legel_allocation` */

DROP TABLE IF EXISTS `legel_allocation`;

CREATE TABLE `legel_allocation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `status` varchar(100) NOT NULL,
  `advocate_id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `legel_allocation_advocate_id_94a51a90` (`advocate_id`),
  KEY `legel_allocation_booking_id_2d201df3` (`booking_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `legel_allocation` */

/*Table structure for table `legel_booking_table` */

DROP TABLE IF EXISTS `legel_booking_table`;

CREATE TABLE `legel_booking_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_date` date NOT NULL,
  `status` varchar(100) NOT NULL,
  `current_date` date NOT NULL,
  `ADVOCATE_id` int(11) NOT NULL,
  `CASE_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `legel_booking_table_ADVOCATE_id_98baed14` (`ADVOCATE_id`),
  KEY `legel_booking_table_CASE_id_fad4ffd5` (`CASE_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `legel_booking_table` */

/*Table structure for table `legel_case` */

DROP TABLE IF EXISTS `legel_case`;

CREATE TABLE `legel_case` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `case` varchar(100) NOT NULL,
  `case_details` varchar(100) NOT NULL,
  `file` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `legel_case_user_id_2f53dc68` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `legel_case` */

/*Table structure for table `legel_case_note` */

DROP TABLE IF EXISTS `legel_case_note`;

CREATE TABLE `legel_case_note` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notes` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `CASE_id` int(11) NOT NULL,
  `advocate_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `legel_case_note_CASE_id_c0ed764e` (`CASE_id`),
  KEY `legel_case_note_advocate_id_2624bcef` (`advocate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `legel_case_note` */

/*Table structure for table `legel_case_report` */

DROP TABLE IF EXISTS `legel_case_report`;

CREATE TABLE `legel_case_report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `report` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `advocate_id` int(11) NOT NULL,
  `case_id_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `legel_case_report_advocate_id_c11fe17f` (`advocate_id`),
  KEY `legel_case_report_case_id_id_72767fe6` (`case_id_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `legel_case_report` */

/*Table structure for table `legel_case_type_table` */

DROP TABLE IF EXISTS `legel_case_type_table`;

CREATE TABLE `legel_case_type_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `case_type` varchar(100) NOT NULL,
  `details` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `legel_case_type_table` */

insert  into `legel_case_type_table`(`id`,`case_type`,`details`) values 
(1,'moshanam','big crime');

/*Table structure for table `legel_chat_table` */

DROP TABLE IF EXISTS `legel_chat_table`;

CREATE TABLE `legel_chat_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `time` time(6) NOT NULL,
  `from_id_id` bigint(20) NOT NULL,
  `to_id_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `legel_chat_table_from_id_id_53ebe250` (`from_id_id`),
  KEY `legel_chat_table_to_id_id_132426dc` (`to_id_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `legel_chat_table` */

/*Table structure for table `legel_complains_table` */

DROP TABLE IF EXISTS `legel_complains_table`;

CREATE TABLE `legel_complains_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `complains` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `reply` varchar(100) NOT NULL,
  `LOGIN_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `legel_complains_table_LOGIN_id_bddd034f` (`LOGIN_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `legel_complains_table` */

insert  into `legel_complains_table`(`id`,`complains`,`date`,`reply`,`LOGIN_id`) values 
(1,'redtfyhtgh','2024-03-09','pending',3);

/*Table structure for table `legel_daily_report` */

DROP TABLE IF EXISTS `legel_daily_report`;

CREATE TABLE `legel_daily_report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `report` varchar(100) NOT NULL,
  `details` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `advocate_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `legel_daily_report_advocate_id_ec8eec70` (`advocate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `legel_daily_report` */

/*Table structure for table `legel_enquiry` */

DROP TABLE IF EXISTS `legel_enquiry`;

CREATE TABLE `legel_enquiry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enquiry` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `reply` varchar(100) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `legel_enquiry_user_id_15f84d9e` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `legel_enquiry` */

/*Table structure for table `legel_entry_level_staff_table` */

DROP TABLE IF EXISTS `legel_entry_level_staff_table`;

CREATE TABLE `legel_entry_level_staff_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `place` varchar(50) NOT NULL,
  `post` varchar(50) NOT NULL,
  `pin` bigint(20) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `phone` bigint(20) NOT NULL,
  `email` varchar(80) NOT NULL,
  `login_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `legel_entry_level_staff_table_login_id_8d946f65` (`login_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `legel_entry_level_staff_table` */

insert  into `legel_entry_level_staff_table`(`id`,`name`,`place`,`post`,`pin`,`gender`,`phone`,`email`,`login_id`) values 
(1,'ram','kollam','gvhb',456789,'male',2134123456,'ram@gmail.com',2);

/*Table structure for table `legel_feedback_table` */

DROP TABLE IF EXISTS `legel_feedback_table`;

CREATE TABLE `legel_feedback_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `feedback` varchar(100) NOT NULL,
  `rating` double NOT NULL,
  `date` date NOT NULL,
  `advocate_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `legel_feedback_table_advocate_id_d7e4b018` (`advocate_id`),
  KEY `legel_feedback_table_user_id_a70b7128` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `legel_feedback_table` */

/*Table structure for table `legel_login_table` */

DROP TABLE IF EXISTS `legel_login_table`;

CREATE TABLE `legel_login_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `legel_login_table` */

insert  into `legel_login_table`(`id`,`username`,`password`,`type`) values 
(1,'admin','admin','admin'),
(2,'ram','ram','entry_staff'),
(3,'rohan','rohan','advocate');

/*Table structure for table `legel_payment` */

DROP TABLE IF EXISTS `legel_payment`;

CREATE TABLE `legel_payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` int(11) NOT NULL,
  `date` date NOT NULL,
  `booking_date_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `legel_payment_booking_date_id_a13efad3` (`booking_date_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `legel_payment` */

/*Table structure for table `legel_schedule_table` */

DROP TABLE IF EXISTS `legel_schedule_table`;

CREATE TABLE `legel_schedule_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_time` time(6) NOT NULL,
  `to_time` time(6) NOT NULL,
  `day` date NOT NULL,
  `Advocate_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `legel_schedule_table_Advocate_id_d27414bb` (`Advocate_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `legel_schedule_table` */

insert  into `legel_schedule_table`(`id`,`from_time`,`to_time`,`day`,`Advocate_id`) values 
(1,'01:00:00.000000','02:00:00.000000','2024-03-10',1);

/*Table structure for table `legel_user_table` */

DROP TABLE IF EXISTS `legel_user_table`;

CREATE TABLE `legel_user_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `gender` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `place` varchar(100) NOT NULL,
  `post` varchar(100) NOT NULL,
  `pin` bigint(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `login_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `legel_user_table_login_id_8200cfbc` (`login_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `legel_user_table` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
