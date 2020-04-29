/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 8.0.16 : Database - nongzi
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`nongzi` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `nongzi`;

/*Table structure for table `account` */

DROP TABLE IF EXISTS `account`;

CREATE TABLE `account` (
  `m_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_id` int(11) DEFAULT NULL,
  `m_time` date DEFAULT NULL,
  `m_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '充值/消费/提现',
  `m_amoney` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`m_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `account` */

insert  into `account`(`m_id`,`u_id`,`m_time`,`m_type`,`m_amoney`) values (1,1,'2018-03-05','消费','-100'),(2,1,'2018-03-06','提现','-100'),(3,1,'2018-03-07','充值','+100');

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `ad_id` int(11) NOT NULL AUTO_INCREMENT,
  `ad_username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ad_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ad_id`) USING BTREE,
  KEY `roleIdpre` (`role_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `admin` */

insert  into `admin`(`ad_id`,`ad_username`,`ad_password`,`role_id`) values (1,'客服','123456',2),(2,'zuidaima','111111',1);

/*Table structure for table `admin_child_menu` */

DROP TABLE IF EXISTS `admin_child_menu`;

CREATE TABLE `admin_child_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `child_menu_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `parentid` int(11) DEFAULT NULL,
  `child_menu_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `admin_child_menu` */

insert  into `admin_child_menu`(`id`,`child_menu_name`,`parentid`,`child_menu_url`) values (1,'用户管理',2,'/admin/people/user'),(2,'管理员管理',2,'/admin/people/admin'),(3,'订单管理',4,'/admin/order/list'),(4,'上传图片',3,'/admin/picture/show'),(5,'农资管理',6,'/admin/product/list'),(6,'饼图统计',5,'/admin/chart/show'),(7,'个人信息',1,'/admin/info/profile');

/*Table structure for table `admin_menu` */

DROP TABLE IF EXISTS `admin_menu`;

CREATE TABLE `admin_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `admin_menu` */

insert  into `admin_menu`(`id`,`menu_name`) values (1,'个人信息'),(2,'人员管理'),(3,'图片管理'),(4,'订单管理'),(5,'图表统计'),(6,'农资管理');

/*Table structure for table `comment` */

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
  `e_id` int(11) NOT NULL AUTO_INCREMENT,
  `e_parentId` int(11) DEFAULT NULL COMMENT '追评',
  `s_id` int(11) DEFAULT NULL,
  `u_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `e_pictureName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '上传的图片名字',
  `e_type` int(11) DEFAULT NULL COMMENT '1=好评，0，-1差评',
  `e_score` int(11) DEFAULT NULL COMMENT '评分',
  `info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '评语',
  `e_date` date DEFAULT NULL COMMENT '评价日期',
  PRIMARY KEY (`e_id`) USING BTREE,
  KEY `u_idpre` (`u_id`) USING BTREE,
  KEY `s_idpre` (`s_id`) USING BTREE,
  CONSTRAINT `s_idpre` FOREIGN KEY (`s_id`) REFERENCES `productinfo` (`s_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `u_idpre` FOREIGN KEY (`u_id`) REFERENCES `userinfo` (`u_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `comment` */

/*Table structure for table `integral` */

DROP TABLE IF EXISTS `integral`;

CREATE TABLE `integral` (
  `i_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_id` int(11) DEFAULT NULL COMMENT '用户id',
  `i_number` int(11) DEFAULT NULL COMMENT '获得积分',
  `i_time` date DEFAULT NULL COMMENT '操作时间',
  `i_dese` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`i_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `integral` */

insert  into `integral`(`i_id`,`u_id`,`i_number`,`i_time`,`i_dese`) values (1,1,6,'2018-03-01','每天登录送积分'),(2,1,5,'2018-02-28','每天登录送积分'),(3,1,4,'2018-02-27','每天登录送积分'),(4,1,3,'2018-03-02','每天登录送积分'),(5,1,2,'2018-03-03','每天登录送积分'),(6,1,1,'2018-03-04','每天登录送积分'),(7,1,7,'2018-03-25','每天登录送积分'),(8,1,8,'2018-03-24','每天登录送积分'),(9,1,9,'2018-03-23','每天登录送积分'),(10,1,10,'2018-03-22','每天登录送积分'),(11,1,11,'2018-03-21','每天登录送积分');

/*Table structure for table `order` */

DROP TABLE IF EXISTS `order`;

CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `o_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '订单编号',
  `u_id` int(11) DEFAULT NULL,
  `e_id` int(11) DEFAULT NULL COMMENT '操作员ID',
  `o_time` date DEFAULT NULL,
  `o_type` int(11) DEFAULT NULL COMMENT '-1:未发货；1:完成，0：已发货',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `order` */

insert  into `order`(`id`,`o_id`,`u_id`,`e_id`,`o_time`,`o_type`) values (84,'201803272559',12,2,'2018-03-27',1),(125,'201811024234',17,1,'2018-11-02',0),(126,'201811045281',18,2,'2018-11-04',0),(127,'201904041033',19,NULL,'2019-04-04',-2),(128,'201907241577',20,NULL,'2019-07-24',-2),(129,'201908251855',20,NULL,'2019-08-25',-2);

/*Table structure for table `orderdetail` */

DROP TABLE IF EXISTS `orderdetail`;

CREATE TABLE `orderdetail` (
  `d_id` int(11) NOT NULL AUTO_INCREMENT,
  `o_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `s_id` int(11) DEFAULT NULL,
  `o_num` int(11) DEFAULT NULL,
  `o_money` double DEFAULT NULL,
  PRIMARY KEY (`d_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=160 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `orderdetail` */

insert  into `orderdetail`(`d_id`,`o_id`,`s_id`,`o_num`,`o_money`) values (94,'201803272559',20,2,10),(154,'201811024234',26,1,16),(155,'201811024234',25,1,1),(156,'201811045281',82,2,10),(157,'201904041033',26,1,16),(158,'201907241577',82,2,10),(159,'201908251855',41,1,16);

/*Table structure for table `permission` */

DROP TABLE IF EXISTS `permission`;

CREATE TABLE `permission` (
  `perid` int(11) NOT NULL AUTO_INCREMENT,
  `pname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `parentid` int(11) DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `isparent` int(11) DEFAULT NULL,
  `ismenu` int(11) DEFAULT NULL,
  PRIMARY KEY (`perid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `permission` */

insert  into `permission`(`perid`,`pname`,`parentid`,`url`,`isparent`,`ismenu`) values (1,'管理员管理',0,'/snack/admin/user/mainToAdmin',1,1),(2,'管理员添加',1,'/snack/admin/user/addNewAdmin',0,1),(3,'管理员删除',1,'/snack/admin/user/delAdminById',0,1),(4,'管理员修改',1,'/snack/admin/user/updateGoAdminById',0,1),(6,'用户管理',0,'/snack/admin/user/mainToUserinfo',1,1),(9,'用户删除',6,'/snack/admin/user/delUserinfoById',0,1),(10,'用户修改',6,'/snack/admin/user/updateGoUserinfoById',0,1),(13,'订单管理',0,'/snack/admin/order/mainToAdminOrder',1,1),(14,'订单修改',13,'/snack/admin/order/updateSelectAdminOrder',0,1),(15,'订单删除',13,'/snack/admin/order/deleteAdminOrder',0,1),(16,'详情修改',13,'/snack/admin/order/updateSelectAdminOrderDetial',0,1),(17,'详情删除',13,'/snack/admin/order/deleteOrderdetail',0,1),(19,'图片管理',0,'/snack/admin/img/mainToAdminImg',1,1),(20,'上传图片',19,'/snack/admin/img/upload',0,1),(21,'农资管理',0,'/snack/admin/snackinfo/mainToAdminSnackinfo',0,1),(22,'农资上架',21,'/snack/admin/snackinfo/addAdminSnack',0,1),(23,'农资删除',21,'/snack/admin/snackinfo/delAdminUserinfo',0,1),(24,'农资修改',21,'/snack/admin/snackinfo/selectAdminUserinfoBysId',0,1),(25,'个人信息',0,'/admin/user/mainToAdminuser',1,1),(26,'确认发货',13,'/snack/admin/order/userOrderConfirm',0,1);

/*Table structure for table `productinfo` */

DROP TABLE IF EXISTS `productinfo`;

CREATE TABLE `productinfo` (
  `s_id` int(11) NOT NULL AUTO_INCREMENT,
  `s_batch` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '批次好=生产日期+2位随机数',
  `s_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `s_price` double DEFAULT NULL,
  `s_discount` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '折扣',
  `s_pictureUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `s_brand` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '品牌',
  `s_place` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '产地',
  `s_Imported` int(1) DEFAULT NULL COMMENT '是否进口',
  `s_score` int(11) DEFAULT NULL COMMENT '积分',
  `s_pDate` date DEFAULT NULL COMMENT '生产日期',
  `s_qDate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '保质期',
  `state` int(11) DEFAULT NULL COMMENT '1---上架，0---草稿，-1--下架',
  `s_createDate` date DEFAULT NULL COMMENT '上架时间',
  `s_dese` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '详情',
  `s_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `s_number` int(11) DEFAULT NULL COMMENT '数量',
  PRIMARY KEY (`s_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `productinfo` */

insert  into `productinfo`(`s_id`,`s_batch`,`s_name`,`s_price`,`s_discount`,`s_pictureUrl`,`s_brand`,`s_place`,`s_Imported`,`s_score`,`s_pDate`,`s_qDate`,`state`,`s_createDate`,`s_dese`,`s_type`,`s_number`) values (20,'201803273550','杀草农药',10,'10','草甘膦.jpg','草甘膦','浙江',1,NULL,'2018-03-15','12',1,'2018-03-27','很好喝','农药类',344),(21,'201803276547','小田膜',20,'9','农膜5.jpg','小膜','江苏',1,NULL,'2019-04-04','12',1,'2018-03-27','好用','其他',999),(23,'201803271694','水溶化肥',100,'8','水溶肥.jpg','水溶肥','山东',1,NULL,'2018-03-14','12',1,'2018-03-27','11','化肥类',250),(24,'201803272746','木棉',100,'5','种子10（木棉）.jpg','大木棉','山东',0,NULL,'2018-03-14','12',1,'2018-03-27','精品','种子类',9992),(25,'201804174136','大蒜种子',10,'1','种子.png','暂无','广东',0,NULL,'2019-04-03','12',1,'2018-04-17','无任何转基因成分','种子类',200),(26,'201804172196','种子2',20,'8','种子.jpg','暂无','上海',0,NULL,'2018-04-17','12',1,'2018-04-17','无毒无害','种子类',100),(27,'201804171833','大豆',10,'7','种子2.jpg','暂无','天津',0,NULL,'2018-04-17','12',1,'2018-04-17','快速生长','种子类',1200),(28,'201804174852','扁豆',10,'10','种子3.jpg','1','海南',0,NULL,'2019-04-03','18',1,'2018-04-17','、1','种子类',1212),(29,'201804171022','白谷',10,'8','种子4.jpg','1','北京',1,NULL,'2018-04-17','12',1,'2018-04-17','1','种子类',2231),(30,'201804172485','樟树',10,'8','种子5（樟树）.jpg','香樟树','浙江',1,NULL,'2018-04-17','12',1,'2018-04-17','1','种子类',23133),(31,'201804172109','向日葵',20,'8','种子6（向日葵）.jpg','小葵花','浙江',0,NULL,'2018-04-18','12',1,'2018-04-17','1','种子类',1000),(32,'201804174170','杜葵',10,'10','种子7.jpg','葵葵','浙江',0,NULL,'2018-04-19','12',1,'2018-04-17','1','种子类',10000),(33,'201804173272','大麻',20,'8','种子8（大麻）.jpg','enk','泰国',0,NULL,'2018-04-02','12',1,'2018-04-17','精选','种子类',10000),(34,'201804175107','杉木种子',20,'6','种子9（杉木）.jpg','良品杉木','浙江',1,NULL,'2019-04-03','12',1,'2018-04-17','够够的','种子类',1022),(39,'201804178495','壮苗肥化肥',200,'10','化肥1.jpg','壮苗肥','浙江',0,NULL,'2019-04-04','12',1,'2018-04-17','壮苗肥好用','化肥类',200),(40,'201804171216','有机肥料',20,'6','化肥2.jpg','壮苗肥','浙江',1,NULL,'2019-04-04','12',1,'2018-04-17','1','化肥类',10000),(41,'201804171172','精品化肥',20,'8','化肥4.jpg','SHILAI','浙江',0,NULL,'2019-04-04','12',1,'2018-04-17','1','化肥类',100),(42,'201804177856','铃酸钾胺',20,'6','化肥5.jpg','金典','浙江',0,NULL,'2019-04-04','12',1,'2018-04-17','1','化肥类',1000),(43,'201804172550','复合肥',20,'4','化肥6.jpg','籽源','浙江',0,NULL,'2019-04-04','12',1,'2018-04-17','1','化肥类',10000),(44,'201804179981','早收化肥',30,'6','化肥8.jpg','早收','上海',0,NULL,'2019-04-04','12',1,'2018-04-17','1','化肥类',100),(45,'201804177197','壮苗肥化肥',30,'9','化肥3.jpg','壮苗肥','浙江',0,NULL,'2019-04-04','12',1,'2018-04-17','1','化肥类',100),(46,'201804175915','复合化肥',10,'8','化肥7.jpg','1','北京',1,NULL,'2018-04-14','12',1,'2018-04-17','化肥','化肥类',100),(51,'201804171818','黄金梨化肥',30,'9','化肥9.jpg','黄金梨','天津',0,NULL,'2019-04-04','12',1,'2018-04-17','1','化肥类',2),(52,'201804177621','控制化肥',20,'8','控制肥.jpg','中泰','福建',1,NULL,'2018-03-20','12',1,'2018-04-17','1','化肥类',250),(53,'201804176052','百草枯农药',10,'9','百草枯.jpg','百草枯','上海',0,NULL,'2018-04-19','12',1,'2018-04-17','1','农药类',100),(54,'201804176090','氟铃酮农药',30,'8','氟铃酮.jpg','氟铃酮','青州',0,NULL,'2018-03-07','12',1,'2018-04-17','2112','农药类',100),(55,'201804177963','啵乐乐',10,'9','农药1.jpg','敌敌畏','上海',0,NULL,'2019-04-04','12',1,'2018-04-17','1','农药类',230),(56,'201804177044','有机硅',20,'6','农药2.jpg','暂无','上海',1,NULL,'2018-04-19','12',1,'2018-04-17','1','农药类',199),(61,'201804176104','敌百虫农药',20,'8','农药3.jpg','敌百虫','太原',0,NULL,'2018-04-19','12',1,'2018-04-17','1','农药类',200),(62,'201804171606','杀菌素',10,'8','乙基多杀菌素.jpg','乙基多杀菌素','上海',0,NULL,'2019-04-04','12',1,'2018-04-17','准杀菌种','农药类',120),(63,'201804172259','甘蔗钻心虫',10,'10','专杀甘蔗钻心虫.jpg','专杀牌','杭州',0,NULL,'2018-04-17','12',1,'2018-04-17','甘蔗虫','农药类',10000),(66,'201804177256','百草枯',20,'8','4.jpg','旺旺','浙江',0,NULL,'2018-04-19','12',1,'2018-04-17','好吃的椰汁','农药类',10000),(67,'201804177149','青州优品膜',20,'8','农膜3.jpg','优品膜','山东',0,NULL,'2019-04-04','12',1,'2018-04-17','好用','其他',10000),(68,'201804172033','大厂膜',10,'5','农膜4.jpg','旺旺','浙江',0,NULL,'2018-04-17','12',1,'2018-04-17','好用实惠','其他',10000),(81,'201807029034','最代码牛币',21,'1','1.png','东北膜','山东',0,NULL,'2019-04-04','12',1,'2018-07-02','最代码','其他',100),(82,'201811042918','杀扑膦农药',100,'1','1.jpg','杀扑膦','北京',0,NULL,'2019-04-04','1',1,'2018-11-04','最代码','农药类',98);

/*Table structure for table `receiptinfo` */

DROP TABLE IF EXISTS `receiptinfo`;

CREATE TABLE `receiptinfo` (
  `r_id` int(11) NOT NULL AUTO_INCREMENT,
  `o_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `o_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `o_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `o_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`r_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `receiptinfo` */

insert  into `receiptinfo`(`r_id`,`o_id`,`o_name`,`o_phone`,`o_address`) values (90,'201803272559','哈哈','110110110110','浙江大学'),(131,'201811024234','学猫叫','15868526202','浙江杭州'),(132,'201811045281','zui','13520109202','999qq.com'),(133,'201904041033','冯子潇','15352517266','江苏省天津市上海县北京区'),(134,'201907241577','大哥','17731241241','上海'),(135,'201908251855','最代码','13520109202','zuidaima.com');

/*Table structure for table `record` */

DROP TABLE IF EXISTS `record`;

CREATE TABLE `record` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `s_id` int(11) DEFAULT NULL,
  `recordDate` date DEFAULT NULL,
  `recordNumber` int(11) DEFAULT NULL,
  PRIMARY KEY (`record_id`) USING BTREE,
  KEY `s_idfk` (`s_id`) USING BTREE,
  CONSTRAINT `s_idfk` FOREIGN KEY (`s_id`) REFERENCES `productinfo` (`s_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `record` */

insert  into `record`(`record_id`,`s_id`,`recordDate`,`recordNumber`) values (13,20,'2018-02-16',2),(14,23,'2018-03-27',4),(15,20,'2018-03-27',6),(16,20,'2018-03-27',2),(17,23,'2018-03-27',1),(18,21,'2018-03-27',1),(19,20,'2018-03-27',2),(20,21,'2018-03-27',1),(21,24,'2018-03-27',3),(22,23,'2018-03-28',1),(23,21,'2018-03-28',10),(24,21,'2018-03-28',1),(25,20,'2018-03-28',1),(26,24,'2018-03-28',1),(27,24,'2018-03-28',1),(28,23,'2018-03-31',1),(29,23,'2018-04-01',1),(30,20,'2018-04-01',6),(31,24,'2018-04-01',3),(32,20,'2018-04-01',1),(33,23,'2018-04-01',1),(34,62,'2018-04-01',4),(35,27,'2018-04-01',5),(36,45,'2018-04-01',3),(37,51,'2018-04-17',4),(38,34,'2018-04-17',4),(39,26,'2018-04-01',8),(40,30,'2018-04-01',10),(41,51,'2018-04-30',3),(42,33,'2018-04-30',4),(43,26,'2018-04-30',3),(44,56,'2018-04-30',1),(45,26,'2018-10-25',1),(46,26,'2018-10-25',10),(47,26,'2018-10-25',22),(48,34,'2018-10-25',6),(49,26,'2018-11-04',1),(50,25,'2018-11-04',1),(51,82,'2019-04-04',2);

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `role_info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `role` */

insert  into `role`(`role_id`,`role_name`,`role_info`) values (1,'超级管理员','系统最高权限者'),(2,'普通管理员','管理发货'),(3,'小角色','无权限');

/*Table structure for table `rolepermission` */

DROP TABLE IF EXISTS `rolepermission`;

CREATE TABLE `rolepermission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `perid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `rolepermission` */

insert  into `rolepermission`(`id`,`role_id`,`perid`) values (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,6),(6,1,9),(7,1,10),(8,1,13),(9,1,14),(10,1,15),(11,1,16),(12,1,17),(13,1,19),(14,1,20),(15,1,21),(16,1,22),(17,1,23),(18,1,24),(19,2,1),(20,2,6),(21,2,13),(22,2,14),(23,2,15),(24,2,16),(25,2,17),(26,2,19),(27,2,21),(28,2,25),(29,1,25),(30,3,1),(31,3,6),(32,3,13),(33,3,19),(34,3,21),(35,3,25),(36,1,26),(37,2,26);

/*Table structure for table `userinfo` */

DROP TABLE IF EXISTS `userinfo`;

CREATE TABLE `userinfo` (
  `u_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_realname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '真实姓名',
  `u_username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户名',
  `u_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '密码',
  `u_money` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '钱包金额',
  `u_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '手机号',
  `u_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '邮箱',
  `u_sex` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '性别',
  `u_resgistDate` date DEFAULT NULL COMMENT '出生日期',
  `u_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '地址',
  `u_score` int(11) DEFAULT NULL COMMENT '积分总数',
  PRIMARY KEY (`u_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `userinfo` */

insert  into `userinfo`(`u_id`,`u_realname`,`u_username`,`u_password`,`u_money`,`u_phone`,`u_email`,`u_sex`,`u_resgistDate`,`u_address`,`u_score`) values (17,'哈哈','测试','123456','9983.0','15810100256','761695@qq.com','男','2019-04-04','浙江',NULL),(18,'王子潇','wangzixiao','123456','11091.0','185521456729','123@qq.com','男','2019-04-04','泰国',1),(19,'子潇','zixiao','123456','9984.0','15377328641','111@qq.com','男','2019-04-04','天上人间',NULL),(20,'最代码','zuidaima','123456','9964.0','15712821882','123@qq.com','男','2019-07-24','太空',NULL);

/* Procedure structure for procedure `haha` */

/*!50003 DROP PROCEDURE IF EXISTS  `haha` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `haha`(in a int,in b int)
BEGIN
set @x=0;
set @x =a+b;
SELECT @x as num;
end */$$
DELIMITER ;

/* Procedure structure for procedure `jk` */

/*!50003 DROP PROCEDURE IF EXISTS  `jk` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `jk`()
BEGIN
 SELECT * from admin;
end */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
