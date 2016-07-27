/*
SQLyog Ultimate v11.27 (32 bit)
MySQL - 5.6.22 : Database - znblog
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`znblog` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `znblog`;

/*Table structure for table `lesson_eval` */

CREATE TABLE `lesson_eval` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lesson_plan_id` int(11) DEFAULT NULL COMMENT '用于关联记录,和课程计划表关联',
  `eval_des` varchar(5000) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `state` char(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学员对课程的评价，匿名制度';

/*Data for the table `lesson_eval` */

/*Table structure for table `lessons` */

CREATE TABLE `lessons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lesson_name` varchar(100) DEFAULT NULL,
  `lesson_type` char(30) DEFAULT NULL,
  `lesson_des` varchar(1000) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `is_cycle` char(1) DEFAULT NULL COMMENT 'Y:可重复 N：不可重复',
  `state` char(2) DEFAULT NULL COMMENT '0可选 1不可选',
  `notes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8 COMMENT='存放所有课程信息';

/*Data for the table `lessons` */

insert  into `lessons`(`id`,`lesson_name`,`lesson_type`,`lesson_des`,`create_time`,`update_time`,`is_cycle`,`state`,`notes`) values (1,'设计模式','通用','讲述关于编程或设计中，关于该领域内设计模式的应用，题材不限','2015-08-22 14:15:19',NULL,'Y','0',NULL),(2,'Memcached','数据库','讲述Memcached原理与实践运用','2015-08-22 14:15:19',NULL,'N','0',NULL),(3,'Redis','数据库','讲述Redis的存储原理及实践运用','2015-08-22 14:15:19',NULL,'N','0',NULL),(4,'Nginx','后端','讲述Nginx特点原理与实践应用','2015-08-22 14:15:19',NULL,'N','0',NULL),(5,'Mysql','数据库','讲述Mysql数据库原理、优化、应用技巧等','2015-08-22 14:15:19',NULL,'Y','0',NULL),(7,'guava','后端','讲述guava的快速入门与使用技巧','2015-08-22 14:15:19',NULL,'N','0',NULL),(8,'分布式文件存储','后端','介绍流行的分布式文件存储系统、讲述基本原理、重点剖析某一款的实践应用','2015-08-22 14:15:19',NULL,'Y','0',NULL),(9,'varnish','后端','讲述varnish的原理与应用技巧','2015-08-22 14:15:19',NULL,'N','0',NULL),(10,'NodeJs','前端','讲述NodeJs的原理、快速入门、实际应用','2015-08-22 14:15:19',NULL,'N','0',NULL),(11,'Linux','后端','介绍Linux系统内核、文件系统、进程管理等方面','2015-08-22 14:15:19',NULL,'N','0',NULL),(12,'网页视觉设计','设计','讲述网页视觉设计常用技巧与实践案例应用','2015-08-22 14:15:19',NULL,'N','1',NULL),(13,'Adobe Illustrator','设计','讲述adobe illustrator快速入门与使用技巧','2015-08-22 14:15:19',NULL,'N','1',NULL),(14,'adobe Photoshop','设计','讲述adobe Photoshop快速入门与使用技巧','2015-08-22 14:15:19',NULL,'N','0',NULL),(15,'色彩原理','设计','讲述色彩基本知识，色彩搭配技巧，如：色彩色音采集重构，创意速写，二维剪影等','2015-08-22 14:15:19',NULL,'N','1',NULL),(16,'maven','后端','介绍maven原理与实践运用','2015-08-22 14:15:19',NULL,'N','1',NULL),(17,'Tomcat','后端','讲述Tomcat原理与实践应用技巧','2015-08-22 14:15:19',NULL,'N','0',NULL),(18,'SpringMvc','后端','讲述SpringMvc的核心原理与使用技巧','2015-08-22 14:15:19',NULL,'N','0',NULL),(19,'Shrio','后端','讲述Shrio核心原理与使用技巧','2015-08-22 14:15:19',NULL,'N','0',NULL),(20,'Active MQ','后端','讲述Active MQ核心原理与使用技巧','2015-08-22 14:15:19',NULL,'N','0',NULL),(21,'MongoDB','数据库','讲述MongoDB数据库存储原理与实践运用','2015-08-22 14:15:19',NULL,'N','0',NULL),(22,'NoSQL','数据库','讲述NoSQL数据库种类、区别、应用场景等','2015-08-22 14:15:19',NULL,'N','0',NULL),(23,'HTTP','网络','讲述HTTP协议原理与实践应用','2015-08-22 14:15:19',NULL,'N','0',NULL),(24,'TCP/IP','网络','讲述TCP/IP协议原理与实践应用','2015-08-22 14:15:19',NULL,'N','1',NULL),(25,'java优化','后端','讲述java开发过程中的优化技巧','2015-08-22 14:15:19',NULL,'Y','0',NULL),(26,'Docker','运维','介绍Docker快速入门与实际应用','2015-08-22 14:15:19',NULL,'N','0',NULL),(27,'jQuery','前端','jquery开发框架原理与实际应用','2015-08-22 14:15:19',NULL,'N','0',NULL),(28,'Angularjs','前端','介绍Angularjs快速入门及实践应用','2015-08-22 14:15:19',NULL,'N','1',NULL),(29,'CSS3','前端','CSS3开发原理与技巧','2015-08-22 14:15:19',NULL,'N','0',NULL),(30,'BootStrap','前端','介绍BootStrap框架开发技巧，以及如何通过源码扩展自己的应用','2015-08-22 14:15:19',NULL,'N','1',NULL),(31,'BootStrapTable','前端','介绍BootStrapTable框架的开发技巧，着重介绍它实现原理，以及如何扩展自己应用','2015-08-22 14:15:19',NULL,'N','0',NULL),(32,'负载均衡','后端','介绍常用负载均衡技术与原理，实践运用场景分析','2015-08-22 14:15:19',NULL,'N','1',NULL),(33,'JVM','后端','讲述JVM原理与优化技巧','2015-08-22 14:15:19',NULL,'N','1',NULL),(34,'Android开发','移动','Android开发的快速入门','2015-08-22 14:15:19',NULL,'N','0',NULL),(35,'IOS开发','移动','IOS开发快速入门','2015-08-22 14:15:19',NULL,'N','0',NULL),(36,'PPT设计','通用','讲述PPT设计的一些技巧','2015-08-22 14:15:19',NULL,'Y','0',NULL),(37,'经济学','通用','可以讲述经济学相关的任何知识，但要求有明确表达的主题','2015-08-22 14:15:19',NULL,'Y','0',NULL),(38,'哲学','通用','可以讲述哲学相关的任何知识，但要求有明确表达的主题','2015-08-22 14:15:19',NULL,'N','1',NULL),(39,'历史学','通用','可以讲述关于历史学相关的任何知识，但要求必须有自己独特观点与表达的主题','2015-08-22 14:15:19',NULL,'Y','0',NULL),(40,'心理学','通用','可以讲述心理学相关的任何知识，必须要有自己的主题，还需要一定互动和测试','2015-08-22 14:15:19',NULL,'N','0',NULL),(41,'远程调用','后端','讲述远程调用的原理与某项具体技术实践应用','2015-08-22 14:15:19',NULL,'Y','0',NULL),(42,'Intellij IDEA','后端','讲述IDEA的快速入门配置，常用技巧，各种环境下开发实践，以及重构等功能','2015-08-22 14:15:19',NULL,'N','0',NULL),(43,'highchart','后端','介绍highchart原理与使用技巧','2015-08-22 14:15:19',NULL,'N','1',NULL),(44,'单点登录','后端','介绍单点登录常用知识，以及某项具体实现框架的原理与实践应用','2015-08-22 14:15:19',NULL,'N','1',NULL),(45,'javascript','前端','介绍javascript语言开发技巧与规范','2015-08-24 15:38:22',NULL,'N','0',NULL),(46,'前端重构','前端','前端整理优化','2015-08-27 16:12:45',NULL,'N','0',NULL),(47,'网页适配','前端','讲述网页适配基础知识与基本实践应用','2015-08-27 16:13:37',NULL,'N','1',NULL),(48,'css选择器','前端','css选择器说明及使用','2015-08-27 16:15:12',NULL,'N','1',NULL),(49,'网站性能指南','通用','描述你所在岗位（角度）的网站性能优化，不论你是前端，后端，运维，网络，移动，设计，测试。应该都有自己的理解。按你的理解出发就可以了','2015-08-31 13:26:48',NULL,'Y','0',NULL),(50,'密码学','后端','描述密码学的加密解密相关理论','2015-08-31 20:08:19',NULL,'N','1',NULL),(51,'网络安全','运维','从网络协议，服务器等网络为主角度来阐述安全性知识','2015-09-01 20:58:02',NULL,'N','0',NULL),(52,'系统安全','后端','从开发语言，脚本，系统框架等角度为主阐述安全知识','2015-09-01 20:58:53',NULL,'N','1',NULL),(53,'服务集群与优化','后端','从web，服务，数据库等层面讲述如何集群化，实现分布式应用，以及具体某一层的实现方案与优化策略','2015-09-01 21:01:28',NULL,'Y','0',NULL),(54,'云计算','运维','每个互联网人心中都有一个大数据和云计算，讲述你的云计算','2015-09-01 21:06:31',NULL,'N','0',NULL),(55,'系统集成','运维','讲述如何将系统的各个部分集成，形成一个高可用，高性能，可扩展，可伸缩的系统','2015-09-01 21:06:34',NULL,'N','0',NULL),(56,'计算机网络知识','运维','讲述万维网组成与网络基础知识','2015-09-01 21:09:13',NULL,'N','0',NULL),(57,'Lucene','后端','讲述Lucene的快速入门与基本原理','2015-09-01 21:10:32',NULL,'N','1',NULL),(58,'分布式系统架构与设计','后端','讲述分布式系统架构的基本知识和基础实践','2015-09-01 21:11:28',NULL,'N','0',NULL),(59,'ZooKeeper','后端','讲述ZooKeeper快速入门与基础知识','2015-09-01 21:12:42',NULL,'N','0',NULL),(63,'移动应用测试','移动','讲述移动端的测试方法与技巧','2015-09-02 11:08:34',NULL,'N','0',NULL),(64,'AppleWatch开发入门','移动','讲述AppleWatch原理与开发实践','2015-09-02 11:48:31',NULL,'N','0',NULL),(65,'SQLite在移动开发中的应用','移动','讲述SQLite数据库工作原理与实践应用','2015-09-02 11:49:19',NULL,'N','0',NULL),(66,'Excel高级运用','通用','讲解Excel表格设计的方法与高级功能实践运用如：VBA运用、表格自动运算、各种图形自动生成','2015-09-02 11:50:54',NULL,'Y','0',NULL),(69,'HTML5','前端','讲解HTML5实战开发技巧与应用','2015-09-02 14:14:49',NULL,'N','0',NULL),(70,'版本控制','后端','讲解SVN，GIT,CVS等版本控制工具的使用，包括服务端，客户端的搭建，还有其基本原理','2015-09-06 13:57:09',NULL,'N','1',NULL),(71,'网络相关知识','运维','讲述互联网组成原理或常用网络设备或基本组网方式等','2015-11-04 20:33:04',NULL,'N','0',NULL),(72,'产品原型绘制技巧','产品','讲述产品原型的绘制工具使用技巧，原型图设计与绘制技巧','2016-02-24 16:23:57',NULL,'N','0',NULL),(73,'PRD/BRD/MRD的编写技巧','产品','讲述应该怎么去编写PRD/BRD/MRD文档','2016-02-24 16:24:59',NULL,'N','0',NULL),(74,'用户体验','产品','讲述用户体验相关知识','2016-02-24 16:25:41',NULL,'Y','0',NULL),(75,'数据分析','产品','讲述数据分析相关知识','2016-02-24 16:34:21',NULL,'N','0',NULL),(76,'产品开发流程','产品','讲述产品开发规范与流程','2016-02-24 16:34:59',NULL,'N','0',NULL),(77,'产品运营管理','产品','讲述产品运营推广相关知识','2016-02-24 16:36:00',NULL,'N','0',NULL),(78,'移动端测试','测试','讲述移动端测试技巧','2016-02-24 17:24:42',NULL,'Y','0',NULL),(79,'测试用例分类与编写技巧','测试','讲述测试用例的分类与编写技巧','2016-02-24 17:25:24',NULL,'N','0',NULL),(80,'自动化测试','测试','讲述各终端自动化测试相关技巧','2016-02-24 17:25:58',NULL,'Y','0',NULL),(81,'性能测试','测试','讲述常见压力测试与性能测试技巧','2016-02-24 17:26:37',NULL,'Y','0',NULL),(82,'测试环境的集成与搭建技巧','测试','讲述常见测试环境的集成与搭建技巧','2016-02-24 17:28:52',NULL,'N','0',NULL),(83,'软件测试技术概论','测试','讲述测试技术中的试理论，方法，流程，文档写作，测试工具，自动测试','2016-02-24 17:29:31',NULL,'N','0',NULL),(84,'测试编程技巧','测试','讲述测试人员某门语言的编程技巧','2016-02-24 17:31:20',NULL,'Y','0',NULL),(85,'天文学','通用','讲述天文学相关知识','2016-02-25 16:25:10',NULL,'N','0',NULL);

/*Table structure for table `lessons_plan` */

CREATE TABLE `lessons_plan` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lesson_name` varchar(100) DEFAULT NULL COMMENT '和课程表的名字对应，不是最后培训课程的名字。一般这个名字范围有些大',
  `lesson_title` varchar(255) DEFAULT NULL COMMENT '本次课程具体的名字，由讲师自己填写的',
  `lesson_des` varchar(1000) DEFAULT NULL COMMENT '讲师自己介绍本次课程主要内容，培训受众等',
  `lesson_time` date DEFAULT NULL,
  `lesson_teacher` varchar(50) DEFAULT NULL,
  `lesson_grade` char(1) DEFAULT NULL COMMENT '不及格，及格，中等，良好，优秀',
  `lesson_score` float DEFAULT NULL COMMENT '听众给讲师打的分数，总分10分，这里取平均分.去除一个最高分去除一个最低分，剩余求平均分',
  `lesson_place` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `state` char(2) DEFAULT NULL COMMENT '0：未开讲 1：已开讲',
  `notes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8 COMMENT='存放生成的具体课程计划';

/*Data for the table `lessons_plan` */

insert  into `lessons_plan`(`id`,`lesson_name`,`lesson_title`,`lesson_des`,`lesson_time`,`lesson_teacher`,`lesson_grade`,`lesson_score`,`lesson_place`,`create_time`,`update_time`,`state`,`notes`) values (3,'版本控制','分布式版本控制之美','分布式版本控制之美','2015-09-23','陈怿辉','中',7.4,'公司会议室','2015-08-24 15:40:50',NULL,'1',NULL),(4,'highchart','highcharts浅析','highcharts浅析','2015-10-14','范海波','及',6.6,'公司会议室','2015-08-24 15:41:27',NULL,'1',NULL),(5,'单点登录','cas单点登陆','','2015-11-04','程清骏','中',7.1,'公司会议室','2015-08-24 15:42:34',NULL,'1',NULL),(54,'远程调用','远程调用之WebService','带你探究WS的本质，带你领略CXF风骚。课程受众为具有一定编程思想和基础的学员','2015-08-26','酉明','中',8.1,'公司会议室','2015-09-01 21:40:13',NULL,'1',NULL),(61,'密码学','非严肃密码学','','2015-11-18','邬一平','良',8.1,'公司会议室','2015-09-02 11:52:27',NULL,'1',NULL),(67,'JVM','解密JAVA跨平台之谜','待定','2015-10-28','冯小雄','良',8.8,'公司会议室','2015-09-02 12:18:08',NULL,'1',NULL),(68,'哲学','巴神思考人生','','2015-12-09','胡正根',NULL,6.2,'公司会议室','2015-09-02 12:20:06',NULL,'1',NULL),(71,'Adobe Illustrator','Adobe Illustrator之图标设计','','2015-12-09','吴清正',NULL,8,'公司会议室','2015-09-02 12:26:48',NULL,'1',NULL),(72,'历史学','三国札记','主题：带你梦回三国 适合人群： 学历小学以上 对历史感兴趣的 在工作生活中以史为鉴的','2015-11-11','徐澜','良',8.2,'公司会议室','2015-09-02 15:02:15',NULL,'1',NULL),(73,'Angularjs','浅析AngularJS','','2015-11-25','吴学文',NULL,6.5,'公司会议室','2015-09-02 15:07:50',NULL,'1',NULL),(85,'网站性能指南','网站性能指南','主题：从移动开发人员的角度讲述Web性能优化 适合人群：任何对web性能优化有兴趣的人 工作中涉及到性能优化的人','2015-11-11','倪小宁','中',7,'公司会议室','2015-09-06 09:03:03',NULL,'1',NULL),(88,'css选择器','待定','待补充','2015-12-16','康鹏',NULL,7.1,'公司会议室','2015-11-04 20:36:42',NULL,'1',NULL),(90,'PPT设计','PPT术与道','主题：带你进入高效能，高品质的PPT制作之道 适合人群： 想提高自己PPT制作水平 对PPT制作感兴趣的 在工作中需要使用到PPT的','2015-07-25','邱晓敏',NULL,9.5,'公司会议室','2015-11-24 10:35:21',NULL,'1',NULL),(94,'TCP/IP','待定','待补充','0000-00-00','程清骏',NULL,NULL,NULL,'2015-11-24 12:05:45',NULL,'0',NULL),(98,'Linux','待定','待补充','0000-00-00','范海波',NULL,NULL,NULL,'2015-11-24 12:23:24',NULL,'0',NULL),(99,'Lucene','待定','',NULL,'陈怿辉',NULL,NULL,NULL,'2015-11-24 12:25:42',NULL,'0',NULL),(100,'系统安全','待定','',NULL,'李晶晶',NULL,NULL,NULL,'2015-11-25 18:10:18',NULL,'0',NULL),(103,'负载均衡','待定','待补充',NULL,'邬一平',NULL,NULL,NULL,'2015-11-25 18:11:02',NULL,'0',NULL),(104,'前端重构','待定','待补充',NULL,'胡正根',NULL,NULL,NULL,'2015-11-25 18:18:00',NULL,'0',NULL),(105,'网络相关知识','待定','待补充','0000-00-00','李晶晶',NULL,NULL,NULL,NULL,NULL,'0',NULL),(106,'网页适配','待定','待补充',NULL,'酉明',NULL,NULL,NULL,'2015-12-23 16:09:40',NULL,'0',NULL),(111,'移动端测试','待定','待补充',NULL,'仲伟斌',NULL,NULL,NULL,'2016-02-24 18:32:10',NULL,'0',NULL),(114,'maven','待定','待补充',NULL,'吴二玮',NULL,NULL,NULL,'2016-02-24 18:42:36',NULL,'0',NULL),(116,'BootStrap','待定','待补充',NULL,'王善波',NULL,NULL,NULL,'2016-02-24 18:44:23',NULL,'0',NULL),(117,'远程调用','待定','待补充',NULL,'徐阳',NULL,NULL,NULL,'2016-03-03 18:33:44',NULL,'0',NULL);

/*Table structure for table `lessons_type` */

CREATE TABLE `lessons_type` (
  `id` int(11) NOT NULL,
  `type_des` varchar(255) DEFAULT NULL,
  `state` char(2) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `lessons_type` */

/*Table structure for table `user_base` */

CREATE TABLE `user_base` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(20) DEFAULT NULL COMMENT '用户登录的账号名称',
  `user_pwd` varchar(20) DEFAULT NULL,
  `sex` char(1) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `introduce` varchar(2000) DEFAULT NULL,
  `addr` varchar(255) DEFAULT NULL,
  `qq` char(12) DEFAULT NULL,
  `mail` varchar(50) DEFAULT NULL,
  `wx_id` varchar(50) DEFAULT NULL,
  `real_name` varchar(50) DEFAULT NULL,
  `choose_num` int(11) DEFAULT NULL COMMENT '剩余选课次数',
  `identity` varchar(50) DEFAULT NULL COMMENT '讲师身份类型，不同身份能选到课可能会有所区别',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `state` char(2) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='用户基本信息表';

/*Data for the table `user_base` */

insert  into `user_base`(`id`,`user_name`,`user_pwd`,`sex`,`birthday`,`introduce`,`addr`,`qq`,`mail`,`wx_id`,`real_name`,`choose_num`,`identity`,`create_time`,`update_time`,`state`,`notes`) values (1,'chengqingjun','chengqingjun',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'程清骏',1,'后端',NULL,NULL,NULL,NULL),(2,'chenyihui','chenyihui',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'陈怿辉',0,'后端',NULL,NULL,NULL,NULL),(3,'fanhaibo','fanhaibo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'范海波',0,'后端',NULL,NULL,NULL,NULL),(4,'fengxiaoxiong','fengxiaoxiong',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'冯小雄',0,'后端',NULL,NULL,NULL,NULL),(5,'huzhenggen','huzhenggen',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'胡正根',0,'前端',NULL,NULL,NULL,NULL),(6,'nixiaoning','nixiaoning',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'倪小宁',0,'移动',NULL,NULL,NULL,NULL),(7,'qiuxiaomin','qiuxiaomin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'邱晓敏',0,'后端',NULL,NULL,NULL,NULL),(12,'wuqingzheng','wuqingzheng',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'吴清正',0,'移动',NULL,NULL,NULL,NULL),(13,'wuxuewen','wuxuewen',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'吴学文',0,'后端',NULL,NULL,NULL,NULL),(14,'wuyiping','wuyiping',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'邬一平',0,'移动',NULL,NULL,NULL,NULL),(15,'xulan','xulan',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'徐澜',0,'运维',NULL,NULL,NULL,NULL),(16,'youming','youming',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'酉明',0,'后端',NULL,NULL,NULL,NULL),(18,'kangpeng','kangpeng',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'康鹏',0,'移动',NULL,NULL,NULL,NULL),(20,'lijingjing','lijingjing',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'李晶晶',0,'运维',NULL,NULL,NULL,NULL),(21,'zhongweibin','zhongweibin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'仲伟斌',0,'测试',NULL,NULL,NULL,NULL),(22,'wangshanbo','wangshanbo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'王善波',1,'前端',NULL,NULL,NULL,NULL),(23,'wuerwei','wuerwei',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'吴二玮',0,'产品',NULL,NULL,NULL,NULL),(24,'xuyang','xuyang',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'徐阳',1,'产品',NULL,NULL,NULL,NULL);

/*Table structure for table `zn_article` */

CREATE TABLE `zn_article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Pcategory` int(10) unsigned DEFAULT '0' COMMENT '文章父类型，0表示没有父类型',
  `category` int(10) unsigned DEFAULT NULL COMMENT '文章类型',
  `imgUrl` varchar(50) DEFAULT NULL COMMENT '文章配图',
  `title` varchar(50) DEFAULT NULL COMMENT '文章标题',
  `secondTitle` varchar(50) DEFAULT NULL COMMENT '文章副标题',
  `summary` varchar(500) DEFAULT NULL COMMENT '文章摘要或导读',
  `content` text COMMENT '文章内容',
  `postTime` datetime DEFAULT NULL COMMENT '发布时间',
  `author` varchar(30) DEFAULT NULL COMMENT '作者',
  `commentCount` int(10) unsigned DEFAULT NULL COMMENT '评论次数',
  `readCount` int(10) unsigned DEFAULT NULL COMMENT '阅读次数',
  `smCount` int(10) DEFAULT NULL,
  `lastUpdateTime` datetime DEFAULT NULL COMMENT '最后一次更新时间',
  `accountId` int(10) DEFAULT NULL,
  `accountName` varchar(40) DEFAULT NULL,
  `lastAccountId` int(10) DEFAULT NULL,
  `lastAccountName` varchar(40) DEFAULT NULL,
  `relPersonId` int(8) DEFAULT NULL,
  `relPersonName` varchar(40) DEFAULT NULL,
  `relCompanyId` int(8) DEFAULT NULL,
  `relCompanyName` varchar(40) DEFAULT NULL,
  `notes` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `zn_article` */

/*Table structure for table `zn_comment` */

CREATE TABLE `zn_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content` varchar(500) DEFAULT NULL COMMENT '评论内容',
  `accountId` int(10) unsigned DEFAULT NULL COMMENT '评论者',
  `accountName` varchar(40) DEFAULT NULL,
  `postTime` datetime DEFAULT NULL COMMENT '评论发布时间',
  `articleId` int(10) DEFAULT NULL COMMENT '评论文章的ID',
  `forId` int(10) DEFAULT NULL COMMENT '针对哪个回复的ID',
  `notes` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `zn_comment` */

/*Table structure for table `zn_lessons` */

CREATE TABLE `zn_lessons` (
  `id` int(11) NOT NULL DEFAULT '0',
  `lesson_name` varchar(100) DEFAULT NULL,
  `lesson_type` char(30) DEFAULT NULL,
  `lesson_des` varchar(1000) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `is_cycle` char(1) DEFAULT NULL COMMENT 'Y:可重复 N：不可重复',
  `state` char(2) DEFAULT NULL COMMENT '0可选 1不可选',
  `notes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `zn_lessons` */

insert  into `zn_lessons`(`id`,`lesson_name`,`lesson_type`,`lesson_des`,`create_time`,`update_time`,`is_cycle`,`state`,`notes`) values (1,'设计模式','通用','讲述关于编程或设计中，关于该领域内设计模式的应用，题材不限','2015-08-22 14:15:19',NULL,'Y','0',NULL),(2,'Memcached','数据库','讲述Memcached原理与实践运用','2015-08-22 14:15:19',NULL,'N','0',NULL),(3,'Redis','数据库','讲述Redis的存储原理及实践运用','2015-08-22 14:15:19',NULL,'N','0',NULL),(4,'Nginx','后端','讲述Nginx特点原理与实践应用','2015-08-22 14:15:19',NULL,'N','0',NULL),(5,'Mysql','数据库','讲述Mysql数据库原理、优化、应用技巧等','2015-08-22 14:15:19',NULL,'Y','0',NULL),(7,'guava','后端','讲述guava的快速入门与使用技巧','2015-08-22 14:15:19',NULL,'N','0',NULL),(8,'分布式文件存储','后端','介绍流行的分布式文件存储系统、讲述基本原理、重点剖析某一款的实践应用','2015-08-22 14:15:19',NULL,'Y','0',NULL),(9,'varnish','后端','讲述varnish的原理与应用技巧','2015-08-22 14:15:19',NULL,'N','0',NULL),(10,'NodeJs','前端','讲述NodeJs的原理、快速入门、实际应用','2015-08-22 14:15:19',NULL,'N','0',NULL),(11,'Linux','后端','介绍Linux系统内核、文件系统、进程管理等方面','2015-08-22 14:15:19',NULL,'N','0',NULL),(12,'网页视觉设计','设计','讲述网页视觉设计常用技巧与实践案例应用','2015-08-22 14:15:19',NULL,'N','1',NULL),(13,'Adobe Illustrator','设计','讲述adobe illustrator快速入门与使用技巧','2015-08-22 14:15:19',NULL,'N','1',NULL),(14,'adobe Photoshop','设计','讲述adobe Photoshop快速入门与使用技巧','2015-08-22 14:15:19',NULL,'N','0',NULL),(15,'色彩原理','设计','讲述色彩基本知识，色彩搭配技巧，如：色彩色音采集重构，创意速写，二维剪影等','2015-08-22 14:15:19',NULL,'N','1',NULL),(16,'maven','后端','介绍maven原理与实践运用','2015-08-22 14:15:19',NULL,'N','1',NULL),(17,'Tomcat','后端','讲述Tomcat原理与实践应用技巧','2015-08-22 14:15:19',NULL,'N','0',NULL),(18,'SpringMvc','后端','讲述SpringMvc的核心原理与使用技巧','2015-08-22 14:15:19',NULL,'N','0',NULL),(19,'Shrio','后端','讲述Shrio核心原理与使用技巧','2015-08-22 14:15:19',NULL,'N','0',NULL),(20,'Active MQ','后端','讲述Active MQ核心原理与使用技巧','2015-08-22 14:15:19',NULL,'N','0',NULL),(21,'MongoDB','数据库','讲述MongoDB数据库存储原理与实践运用','2015-08-22 14:15:19',NULL,'N','0',NULL),(22,'NoSQL','数据库','讲述NoSQL数据库种类、区别、应用场景等','2015-08-22 14:15:19',NULL,'N','0',NULL),(23,'HTTP','网络','讲述HTTP协议原理与实践应用','2015-08-22 14:15:19',NULL,'N','0',NULL),(24,'TCP/IP','网络','讲述TCP/IP协议原理与实践应用','2015-08-22 14:15:19',NULL,'N','1',NULL),(25,'java优化','后端','讲述java开发过程中的优化技巧','2015-08-22 14:15:19',NULL,'Y','0',NULL),(26,'Docker','运维','介绍Docker快速入门与实际应用','2015-08-22 14:15:19',NULL,'N','0',NULL),(27,'jQuery','前端','jquery开发框架原理与实际应用','2015-08-22 14:15:19',NULL,'N','0',NULL),(28,'Angularjs','前端','介绍Angularjs快速入门及实践应用','2015-08-22 14:15:19',NULL,'N','1',NULL),(29,'CSS3','前端','CSS3开发原理与技巧','2015-08-22 14:15:19',NULL,'N','0',NULL),(30,'BootStrap','前端','介绍BootStrap框架开发技巧，以及如何通过源码扩展自己的应用','2015-08-22 14:15:19',NULL,'N','1',NULL),(31,'BootStrapTable','前端','介绍BootStrapTable框架的开发技巧，着重介绍它实现原理，以及如何扩展自己应用','2015-08-22 14:15:19',NULL,'N','0',NULL),(32,'负载均衡','后端','介绍常用负载均衡技术与原理，实践运用场景分析','2015-08-22 14:15:19',NULL,'N','1',NULL),(33,'JVM','后端','讲述JVM原理与优化技巧','2015-08-22 14:15:19',NULL,'N','1',NULL),(34,'Android开发','移动','Android开发的快速入门','2015-08-22 14:15:19',NULL,'N','0',NULL),(35,'IOS开发','移动','IOS开发快速入门','2015-08-22 14:15:19',NULL,'N','0',NULL),(36,'PPT设计','通用','讲述PPT设计的一些技巧','2015-08-22 14:15:19',NULL,'Y','0',NULL),(37,'经济学','通用','可以讲述经济学相关的任何知识，但要求有明确表达的主题','2015-08-22 14:15:19',NULL,'Y','0',NULL),(38,'哲学','通用','可以讲述哲学相关的任何知识，但要求有明确表达的主题','2015-08-22 14:15:19',NULL,'N','1',NULL),(39,'历史学','通用','可以讲述关于历史学相关的任何知识，但要求必须有自己独特观点与表达的主题','2015-08-22 14:15:19',NULL,'Y','0',NULL),(40,'心理学','通用','可以讲述心理学相关的任何知识，必须要有自己的主题，还需要一定互动和测试','2015-08-22 14:15:19',NULL,'N','0',NULL),(41,'远程调用','后端','讲述远程调用的原理与某项具体技术实践应用','2015-08-22 14:15:19',NULL,'Y','0',NULL),(42,'Intellij IDEA','后端','讲述IDEA的快速入门配置，常用技巧，各种环境下开发实践，以及重构等功能','2015-08-22 14:15:19',NULL,'N','0',NULL),(43,'highchart','后端','介绍highchart原理与使用技巧','2015-08-22 14:15:19',NULL,'N','1',NULL),(44,'单点登录','后端','介绍单点登录常用知识，以及某项具体实现框架的原理与实践应用','2015-08-22 14:15:19',NULL,'N','1',NULL),(45,'javascript','前端','介绍javascript语言开发技巧与规范','2015-08-24 15:38:22',NULL,'N','0',NULL),(46,'前端重构','前端','前端整理优化','2015-08-27 16:12:45',NULL,'N','0',NULL),(47,'网页适配','前端','讲述网页适配基础知识与基本实践应用','2015-08-27 16:13:37',NULL,'N','1',NULL),(48,'css选择器','前端','css选择器说明及使用','2015-08-27 16:15:12',NULL,'N','1',NULL),(49,'网站性能指南','通用','描述你所在岗位（角度）的网站性能优化，不论你是前端，后端，运维，网络，移动，设计，测试。应该都有自己的理解。按你的理解出发就可以了','2015-08-31 13:26:48',NULL,'Y','0',NULL),(50,'密码学','后端','描述密码学的加密解密相关理论','2015-08-31 20:08:19',NULL,'N','1',NULL),(51,'网络安全','运维','从网络协议，服务器等网络为主角度来阐述安全性知识','2015-09-01 20:58:02',NULL,'N','0',NULL),(52,'系统安全','后端','从开发语言，脚本，系统框架等角度为主阐述安全知识','2015-09-01 20:58:53',NULL,'N','1',NULL),(53,'服务集群与优化','后端','从web，服务，数据库等层面讲述如何集群化，实现分布式应用，以及具体某一层的实现方案与优化策略','2015-09-01 21:01:28',NULL,'Y','0',NULL),(54,'云计算','运维','每个互联网人心中都有一个大数据和云计算，讲述你的云计算','2015-09-01 21:06:31',NULL,'N','0',NULL),(55,'系统集成','运维','讲述如何将系统的各个部分集成，形成一个高可用，高性能，可扩展，可伸缩的系统','2015-09-01 21:06:34',NULL,'N','0',NULL),(56,'计算机网络知识','运维','讲述万维网组成与网络基础知识','2015-09-01 21:09:13',NULL,'N','0',NULL),(57,'Lucene','后端','讲述Lucene的快速入门与基本原理','2015-09-01 21:10:32',NULL,'N','1',NULL),(58,'分布式系统架构与设计','后端','讲述分布式系统架构的基本知识和基础实践','2015-09-01 21:11:28',NULL,'N','0',NULL),(59,'ZooKeeper','后端','讲述ZooKeeper快速入门与基础知识','2015-09-01 21:12:42',NULL,'N','0',NULL),(63,'移动应用测试','移动','讲述移动端的测试方法与技巧','2015-09-02 11:08:34',NULL,'N','0',NULL),(64,'AppleWatch开发入门','移动','讲述AppleWatch原理与开发实践','2015-09-02 11:48:31',NULL,'N','0',NULL),(65,'SQLite在移动开发中的应用','移动','讲述SQLite数据库工作原理与实践应用','2015-09-02 11:49:19',NULL,'N','0',NULL),(66,'Excel高级运用','通用','讲解Excel表格设计的方法与高级功能实践运用如：VBA运用、表格自动运算、各种图形自动生成','2015-09-02 11:50:54',NULL,'Y','0',NULL),(69,'HTML5','前端','讲解HTML5实战开发技巧与应用','2015-09-02 14:14:49',NULL,'N','0',NULL),(70,'版本控制','后端','讲解SVN，GIT,CVS等版本控制工具的使用，包括服务端，客户端的搭建，还有其基本原理','2015-09-06 13:57:09',NULL,'N','1',NULL),(71,'网络相关知识','运维','讲述互联网组成原理或常用网络设备或基本组网方式等','2015-11-04 20:33:04',NULL,'N','0',NULL),(72,'产品原型绘制技巧','产品','讲述产品原型的绘制工具使用技巧，原型图设计与绘制技巧','2016-02-24 16:23:57',NULL,'N','0',NULL),(73,'PRD/BRD/MRD的编写技巧','产品','讲述应该怎么去编写PRD/BRD/MRD文档','2016-02-24 16:24:59',NULL,'N','0',NULL),(74,'用户体验','产品','讲述用户体验相关知识','2016-02-24 16:25:41',NULL,'Y','0',NULL),(75,'数据分析','产品','讲述数据分析相关知识','2016-02-24 16:34:21',NULL,'N','0',NULL),(76,'产品开发流程','产品','讲述产品开发规范与流程','2016-02-24 16:34:59',NULL,'N','0',NULL),(77,'产品运营管理','产品','讲述产品运营推广相关知识','2016-02-24 16:36:00',NULL,'N','0',NULL),(78,'移动端测试','测试','讲述移动端测试技巧','2016-02-24 17:24:42',NULL,'Y','0',NULL),(79,'测试用例分类与编写技巧','测试','讲述测试用例的分类与编写技巧','2016-02-24 17:25:24',NULL,'N','0',NULL),(80,'自动化测试','测试','讲述各终端自动化测试相关技巧','2016-02-24 17:25:58',NULL,'Y','0',NULL),(81,'性能测试','测试','讲述常见压力测试与性能测试技巧','2016-02-24 17:26:37',NULL,'Y','0',NULL),(82,'测试环境的集成与搭建技巧','测试','讲述常见测试环境的集成与搭建技巧','2016-02-24 17:28:52',NULL,'N','0',NULL),(83,'软件测试技术概论','测试','讲述测试技术中的试理论，方法，流程，文档写作，测试工具，自动测试','2016-02-24 17:29:31',NULL,'N','0',NULL),(84,'测试编程技巧','测试','讲述测试人员某门语言的编程技巧','2016-02-24 17:31:20',NULL,'Y','0',NULL),(85,'天文学','通用','讲述天文学相关知识','2016-02-25 16:25:10',NULL,'N','0',NULL);

/*Table structure for table `zn_lessons_plan` */

CREATE TABLE `zn_lessons_plan` (
  `id` int(11) unsigned NOT NULL DEFAULT '0',
  `lesson_name` varchar(100) DEFAULT NULL COMMENT '和课程表的名字对应，不是最后培训课程的名字。一般这个名字范围有些大',
  `lesson_title` varchar(255) DEFAULT NULL COMMENT '本次课程具体的名字，由讲师自己填写的',
  `lesson_des` varchar(1000) DEFAULT NULL COMMENT '讲师自己介绍本次课程主要内容，培训受众等',
  `lesson_time` date DEFAULT NULL,
  `lesson_teacher` varchar(50) DEFAULT NULL,
  `lesson_grade` char(1) DEFAULT NULL COMMENT '不及格，及格，中等，良好，优秀',
  `lesson_score` float DEFAULT NULL COMMENT '听众给讲师打的分数，总分10分，这里取平均分.去除一个最高分去除一个最低分，剩余求平均分',
  `lesson_place` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `state` char(2) DEFAULT NULL COMMENT '0：未开讲 1：已开讲',
  `notes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `zn_lessons_plan` */

insert  into `zn_lessons_plan`(`id`,`lesson_name`,`lesson_title`,`lesson_des`,`lesson_time`,`lesson_teacher`,`lesson_grade`,`lesson_score`,`lesson_place`,`create_time`,`update_time`,`state`,`notes`) values (3,'版本控制','分布式版本控制之美','分布式版本控制之美','2015-09-23','陈怿辉','中',7.4,'公司会议室','2015-08-24 15:40:50',NULL,'1',NULL),(4,'highchart','highcharts浅析','highcharts浅析','2015-10-14','范海波','及',6.6,'公司会议室','2015-08-24 15:41:27',NULL,'1',NULL),(5,'单点登录','cas单点登陆','','2015-11-04','程清骏','中',7.1,'公司会议室','2015-08-24 15:42:34',NULL,'1',NULL),(54,'远程调用','远程调用之WebService','带你探究WS的本质，带你领略CXF风骚。课程受众为具有一定编程思想和基础的学员','2015-08-26','酉明','中',8.1,'公司会议室','2015-09-01 21:40:13',NULL,'1',NULL),(61,'密码学','非严肃密码学','','2015-11-18','邬一平','良',8.1,'公司会议室','2015-09-02 11:52:27',NULL,'1',NULL),(67,'JVM','解密JAVA跨平台之谜','待定','2015-10-28','冯小雄','良',8.8,'公司会议室','2015-09-02 12:18:08',NULL,'1',NULL),(68,'哲学','巴神思考人生','','2015-12-09','胡正根',NULL,6.2,'公司会议室','2015-09-02 12:20:06',NULL,'1',NULL),(71,'Adobe Illustrator','Adobe Illustrator之图标设计','','2015-12-09','吴清正',NULL,8,'公司会议室','2015-09-02 12:26:48',NULL,'1',NULL),(72,'历史学','三国札记','主题：带你梦回三国 适合人群： 学历小学以上 对历史感兴趣的 在工作生活中以史为鉴的','2015-11-11','徐澜','良',8.2,'公司会议室','2015-09-02 15:02:15',NULL,'1',NULL),(73,'Angularjs','浅析AngularJS','','2015-11-25','吴学文',NULL,6.5,'公司会议室','2015-09-02 15:07:50',NULL,'1',NULL),(85,'网站性能指南','网站性能指南','主题：从移动开发人员的角度讲述Web性能优化 适合人群：任何对web性能优化有兴趣的人 工作中涉及到性能优化的人','2015-11-11','倪小宁','中',7,'公司会议室','2015-09-06 09:03:03',NULL,'1',NULL),(88,'css选择器','待定','待补充','2015-12-16','康鹏',NULL,7.1,'公司会议室','2015-11-04 20:36:42',NULL,'1',NULL),(90,'PPT设计','PPT术与道','主题：带你进入高效能，高品质的PPT制作之道 适合人群： 想提高自己PPT制作水平 对PPT制作感兴趣的 在工作中需要使用到PPT的','2015-07-25','邱晓敏',NULL,9.5,'公司会议室','2015-11-24 10:35:21',NULL,'1',NULL),(94,'TCP/IP','待定','待补充','0000-00-00','程清骏',NULL,NULL,NULL,'2015-11-24 12:05:45',NULL,'0',NULL),(98,'Linux','待定','待补充','0000-00-00','范海波',NULL,NULL,NULL,'2015-11-24 12:23:24',NULL,'0',NULL),(99,'Lucene','待定','',NULL,'陈怿辉',NULL,NULL,NULL,'2015-11-24 12:25:42',NULL,'0',NULL),(100,'系统安全','待定','',NULL,'李晶晶',NULL,NULL,NULL,'2015-11-25 18:10:18',NULL,'0',NULL),(103,'负载均衡','待定','待补充',NULL,'邬一平',NULL,NULL,NULL,'2015-11-25 18:11:02',NULL,'0',NULL),(104,'前端重构','待定','待补充',NULL,'胡正根',NULL,NULL,NULL,'2015-11-25 18:18:00',NULL,'0',NULL),(105,'网络相关知识','待定','待补充','0000-00-00','李晶晶',NULL,NULL,NULL,NULL,NULL,'0',NULL),(106,'网页适配','待定','待补充',NULL,'酉明',NULL,NULL,NULL,'2015-12-23 16:09:40',NULL,'0',NULL),(111,'移动端测试','待定','待补充',NULL,'仲伟斌',NULL,NULL,NULL,'2016-02-24 18:32:10',NULL,'0',NULL),(114,'maven','待定','待补充',NULL,'吴二玮',NULL,NULL,NULL,'2016-02-24 18:42:36',NULL,'0',NULL),(116,'BootStrap','待定','待补充',NULL,'王善波',NULL,NULL,NULL,'2016-02-24 18:44:23',NULL,'0',NULL),(117,'远程调用','待定','待补充',NULL,'徐阳',NULL,NULL,NULL,'2016-03-03 18:33:44',NULL,'0',NULL);

/*Table structure for table `zn_user_base` */

CREATE TABLE `zn_user_base` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `userName` varchar(40) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `nickName` varchar(40) DEFAULT NULL COMMENT '昵称 花名 网名',
  `sex` tinyint(1) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `qq` varchar(20) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `imgUrl` varchar(50) DEFAULT NULL COMMENT '头像',
  `permission` int(10) unsigned DEFAULT '0' COMMENT '权限 类型 1 admin 超管 2 normal 普通注册用户 3 editer 编辑'',',
  `loginTime` datetime DEFAULT NULL,
  `loginIp` varchar(40) DEFAULT NULL,
  `lastLoginTime` datetime DEFAULT NULL,
  `lastLoginIp` varchar(40) DEFAULT NULL,
  `GMTCreat` datetime DEFAULT NULL,
  `GMTExpire` datetime DEFAULT NULL,
  `notes` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `zn_user_base` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
