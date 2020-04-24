-- 项目数据库sql语句
CREATE DATABASE nongzi;
USE nongzi;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure fo`nongzi`r account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account`  (
  `m_id` INT(11) NOT NULL AUTO_INCREMENT,
  `u_id` INT(11) DEFAULT NULL,
  `m_time` DATE DEFAULT NULL,
  `m_type` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '充值/消费/提现',
  `m_amoney` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`m_id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES (1, 1, '2018-03-05', '消费', '-100');
INSERT INTO `account` VALUES (2, 1, '2018-03-06', '提现', '-100');
INSERT INTO `account` VALUES (3, 1, '2018-03-07', '充值', '+100');

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `ad_id` INT(11) NOT NULL AUTO_INCREMENT,
  `ad_username` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ad_password` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `role_id` INT(11) DEFAULT NULL,
  PRIMARY KEY (`ad_id`) USING BTREE,
  INDEX `roleIdpre`(`role_id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, '客服', '123456', 2);
INSERT INTO `admin` VALUES (2, 'zuidaima', '111111', 1);

-- ----------------------------
-- Table structure for admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_menu`;
CREATE TABLE `admin_menu`  (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `menu_name` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of admin_menu
-- ----------------------------
INSERT INTO `admin_menu` VALUES (1, '个人信息');
INSERT INTO `admin_menu` VALUES (2, '人员管理');
INSERT INTO `admin_menu` VALUES (3, '图片管理');
INSERT INTO `admin_menu` VALUES (4, '订单管理');
INSERT INTO `admin_menu` VALUES (5, '图表统计');
INSERT INTO `admin_menu` VALUES (6, '农资管理');

-- ----------------------------
-- Table structure for admin_menu_child
-- ----------------------------
DROP TABLE IF EXISTS `admin_child_menu`;
CREATE TABLE `admin_menu_child`  (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `child_menu_name` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `parentid` INT(11) DEFAULT NULL,
  `child_menu_url` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of admin_menu_child
-- ----------------------------
INSERT INTO `admin_menu_child` VALUES (1, '用户管理', 2, '/admin/user/mainToUserinfo');
INSERT INTO `admin_menu_child` VALUES (2, '管理员管理', 2, '/admin/user/mainToAdmin');
INSERT INTO `admin_menu_child` VALUES (3, '订单管理', 4, '/admin/order/mainToAdminOrder');
INSERT INTO `admin_menu_child` VALUES (4, '上传图片', 3, '/admin/img/mainToAdminImg');
INSERT INTO `admin_menu_child` VALUES (5, '农资管理', 6, '/admin/snackinfo/mainToAdminSnackinfo');
INSERT INTO `admin_menu_child` VALUES (6, '饼图统计', 5, '/admin/map/mainToPieMap');
INSERT INTO `admin_menu_child` VALUES (7, '个人信息', 1, '/user/mainToAdminuser');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `e_id` INT(11) NOT NULL AUTO_INCREMENT,
  `e_parentId` INT(11) DEFAULT NULL COMMENT '追评',
  `s_id` INT(11) DEFAULT NULL,
  `u_id` INT(11) DEFAULT NULL COMMENT '用户ID',
  `e_pictureName` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '上传的图片名字',
  `e_type` INT(11) DEFAULT NULL COMMENT '1=好评，0，-1差评',
  `e_score` INT(11) DEFAULT NULL COMMENT '评分',
  `info` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '评语',
  `e_date` DATE DEFAULT NULL COMMENT '评价日期',
  PRIMARY KEY (`e_id`) USING BTREE,
  INDEX `u_idpre`(`u_id`) USING BTREE,
  INDEX `s_idpre`(`s_id`) USING BTREE,
  CONSTRAINT `s_idpre` FOREIGN KEY (`s_id`) REFERENCES `snackinfo` (`s_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `u_idpre` FOREIGN KEY (`u_id`) REFERENCES `userinfo` (`u_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = INNODB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for integral
-- ----------------------------
DROP TABLE IF EXISTS `integral`;
CREATE TABLE `integral`  (
  `i_id` INT(11) NOT NULL AUTO_INCREMENT,
  `u_id` INT(11) DEFAULT NULL COMMENT '用户id',
  `i_number` INT(11) DEFAULT NULL COMMENT '获得积分',
  `i_time` DATE DEFAULT NULL COMMENT '操作时间',
  `i_dese` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`i_id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of integral
-- ----------------------------
INSERT INTO `integral` VALUES (1, 1, 6, '2018-03-01', '每天登录送积分');
INSERT INTO `integral` VALUES (2, 1, 5, '2018-02-28', '每天登录送积分');
INSERT INTO `integral` VALUES (3, 1, 4, '2018-02-27', '每天登录送积分');
INSERT INTO `integral` VALUES (4, 1, 3, '2018-03-02', '每天登录送积分');
INSERT INTO `integral` VALUES (5, 1, 2, '2018-03-03', '每天登录送积分');
INSERT INTO `integral` VALUES (6, 1, 1, '2018-03-04', '每天登录送积分');
INSERT INTO `integral` VALUES (7, 1, 7, '2018-03-25', '每天登录送积分');
INSERT INTO `integral` VALUES (8, 1, 8, '2018-03-24', '每天登录送积分');
INSERT INTO `integral` VALUES (9, 1, 9, '2018-03-23', '每天登录送积分');
INSERT INTO `integral` VALUES (10, 1, 10, '2018-03-22', '每天登录送积分');
INSERT INTO `integral` VALUES (11, 1, 11, '2018-03-21', '每天登录送积分');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `o_id` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '订单编号',
  `u_id` INT(11) DEFAULT NULL,
  `e_id` INT(11) DEFAULT NULL COMMENT '操作员ID',
  `o_time` DATE DEFAULT NULL,
  `o_type` INT(11) DEFAULT NULL COMMENT '-1:未发货；1:完成，0：已发货',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 130 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES (84, '201803272559', 12, 2, '2018-03-27', 1);
INSERT INTO `order` VALUES (125, '201811024234', 17, 1, '2018-11-02', 0);
INSERT INTO `order` VALUES (126, '201811045281', 18, 2, '2018-11-04', 0);
INSERT INTO `order` VALUES (127, '201904041033', 19, NULL, '2019-04-04', -2);
INSERT INTO `order` VALUES (128, '201907241577', 20, NULL, '2019-07-24', -2);
INSERT INTO `order` VALUES (129, '201908251855', 20, NULL, '2019-08-25', -2);

-- ----------------------------
-- Table structure for orderdetail
-- ----------------------------
DROP TABLE IF EXISTS `orderdetail`;
CREATE TABLE `orderdetail`  (
  `d_id` INT(11) NOT NULL AUTO_INCREMENT,
  `o_id` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `s_id` INT(11) DEFAULT NULL,
  `o_num` INT(11) DEFAULT NULL,
  `o_money` DOUBLE DEFAULT NULL,
  PRIMARY KEY (`d_id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 160 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of orderdetail
-- ----------------------------
INSERT INTO `orderdetail` VALUES (94, '201803272559', 20, 2, 10);
INSERT INTO `orderdetail` VALUES (154, '201811024234', 26, 1, 16);
INSERT INTO `orderdetail` VALUES (155, '201811024234', 25, 1, 1);
INSERT INTO `orderdetail` VALUES (156, '201811045281', 82, 2, 10);
INSERT INTO `orderdetail` VALUES (157, '201904041033', 26, 1, 16);
INSERT INTO `orderdetail` VALUES (158, '201907241577', 82, 2, 10);
INSERT INTO `orderdetail` VALUES (159, '201908251855', 41, 1, 16);

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission`  (
  `perid` INT(11) NOT NULL AUTO_INCREMENT,
  `pname` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `parentid` INT(11) DEFAULT NULL,
  `url` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `isparent` INT(11) DEFAULT NULL,
  `ismenu` INT(11) DEFAULT NULL,
  PRIMARY KEY (`perid`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES (1, '管理员管理', 0, '/snack/admin/user/mainToAdmin', 1, 1);
INSERT INTO `permission` VALUES (2, '管理员添加', 1, '/snack/admin/user/addNewAdmin', 0, 1);
INSERT INTO `permission` VALUES (3, '管理员删除', 1, '/snack/admin/user/delAdminById', 0, 1);
INSERT INTO `permission` VALUES (4, '管理员修改', 1, '/snack/admin/user/updateGoAdminById', 0, 1);
INSERT INTO `permission` VALUES (6, '用户管理', 0, '/snack/admin/user/mainToUserinfo', 1, 1);
INSERT INTO `permission` VALUES (9, '用户删除', 6, '/snack/admin/user/delUserinfoById', 0, 1);
INSERT INTO `permission` VALUES (10, '用户修改', 6, '/snack/admin/user/updateGoUserinfoById', 0, 1);
INSERT INTO `permission` VALUES (13, '订单管理', 0, '/snack/admin/order/mainToAdminOrder', 1, 1);
INSERT INTO `permission` VALUES (14, '订单修改', 13, '/snack/admin/order/updateSelectAdminOrder', 0, 1);
INSERT INTO `permission` VALUES (15, '订单删除', 13, '/snack/admin/order/deleteAdminOrder', 0, 1);
INSERT INTO `permission` VALUES (16, '详情修改', 13, '/snack/admin/order/updateSelectAdminOrderDetial', 0, 1);
INSERT INTO `permission` VALUES (17, '详情删除', 13, '/snack/admin/order/deleteOrderdetail', 0, 1);
INSERT INTO `permission` VALUES (19, '图片管理', 0, '/snack/admin/img/mainToAdminImg', 1, 1);
INSERT INTO `permission` VALUES (20, '上传图片', 19, '/snack/admin/img/upload', 0, 1);
INSERT INTO `permission` VALUES (21, '农资管理', 0, '/snack/admin/snackinfo/mainToAdminSnackinfo', 0, 1);
INSERT INTO `permission` VALUES (22, '农资上架', 21, '/snack/admin/snackinfo/addAdminSnack', 0, 1);
INSERT INTO `permission` VALUES (23, '农资删除', 21, '/snack/admin/snackinfo/delAdminUserinfo', 0, 1);
INSERT INTO `permission` VALUES (24, '农资修改', 21, '/snack/admin/snackinfo/selectAdminUserinfoBysId', 0, 1);
INSERT INTO `permission` VALUES (25, '个人信息', 0, '/admin/user/mainToAdminuser', 1, 1);
INSERT INTO `permission` VALUES (26, '确认发货', 13, '/snack/admin/order/userOrderConfirm', 0, 1);

-- ----------------------------
-- Table structure for receiptinfo
-- ----------------------------
DROP TABLE IF EXISTS `receiptinfo`;
CREATE TABLE `receiptinfo`  (
  `r_id` INT(11) NOT NULL AUTO_INCREMENT,
  `o_id` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `o_name` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `o_phone` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `o_address` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`r_id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 136 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of receiptinfo
-- ----------------------------
INSERT INTO `receiptinfo` VALUES (90, '201803272559', '哈哈', '110110110110', '浙江大学');
INSERT INTO `receiptinfo` VALUES (131, '201811024234', '学猫叫', '15868526202', '浙江杭州');
INSERT INTO `receiptinfo` VALUES (132, '201811045281', 'zui', '13520109202', '999qq.com');
INSERT INTO `receiptinfo` VALUES (133, '201904041033', '冯子潇', '15352517266', '江苏省天津市上海县北京区');
INSERT INTO `receiptinfo` VALUES (134, '201907241577', '大哥', '17731241241', '上海');
INSERT INTO `receiptinfo` VALUES (135, '201908251855', '最代码', '13520109202', 'zuidaima.com');

-- ----------------------------
-- Table structure for record
-- ----------------------------
DROP TABLE IF EXISTS `record`;
CREATE TABLE `record`  (
  `record_id` INT(11) NOT NULL AUTO_INCREMENT,
  `s_id` INT(11) DEFAULT NULL,
  `recordDate` DATE DEFAULT NULL,
  `recordNumber` INT(11) DEFAULT NULL,
  PRIMARY KEY (`record_id`) USING BTREE,
  INDEX `s_idfk`(`s_id`) USING BTREE,
  CONSTRAINT `s_idfk` FOREIGN KEY (`s_id`) REFERENCES `snackinfo` (`s_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = INNODB AUTO_INCREMENT = 52 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of record
-- ----------------------------
INSERT INTO `record` VALUES (13, 20, '2018-02-16', 2);
INSERT INTO `record` VALUES (14, 23, '2018-03-27', 4);
INSERT INTO `record` VALUES (15, 20, '2018-03-27', 6);
INSERT INTO `record` VALUES (16, 20, '2018-03-27', 2);
INSERT INTO `record` VALUES (17, 23, '2018-03-27', 1);
INSERT INTO `record` VALUES (18, 21, '2018-03-27', 1);
INSERT INTO `record` VALUES (19, 20, '2018-03-27', 2);
INSERT INTO `record` VALUES (20, 21, '2018-03-27', 1);
INSERT INTO `record` VALUES (21, 24, '2018-03-27', 3);
INSERT INTO `record` VALUES (22, 23, '2018-03-28', 1);
INSERT INTO `record` VALUES (23, 21, '2018-03-28', 10);
INSERT INTO `record` VALUES (24, 21, '2018-03-28', 1);
INSERT INTO `record` VALUES (25, 20, '2018-03-28', 1);
INSERT INTO `record` VALUES (26, 24, '2018-03-28', 1);
INSERT INTO `record` VALUES (27, 24, '2018-03-28', 1);
INSERT INTO `record` VALUES (28, 23, '2018-03-31', 1);
INSERT INTO `record` VALUES (29, 23, '2018-04-01', 1);
INSERT INTO `record` VALUES (30, 20, '2018-04-01', 6);
INSERT INTO `record` VALUES (31, 24, '2018-04-01', 3);
INSERT INTO `record` VALUES (32, 20, '2018-04-01', 1);
INSERT INTO `record` VALUES (33, 23, '2018-04-01', 1);
INSERT INTO `record` VALUES (34, 62, '2018-04-01', 4);
INSERT INTO `record` VALUES (35, 27, '2018-04-01', 5);
INSERT INTO `record` VALUES (36, 45, '2018-04-01', 3);
INSERT INTO `record` VALUES (37, 51, '2018-04-17', 4);
INSERT INTO `record` VALUES (38, 34, '2018-04-17', 4);
INSERT INTO `record` VALUES (39, 26, '2018-04-01', 8);
INSERT INTO `record` VALUES (40, 30, '2018-04-01', 10);
INSERT INTO `record` VALUES (41, 51, '2018-04-30', 3);
INSERT INTO `record` VALUES (42, 33, '2018-04-30', 4);
INSERT INTO `record` VALUES (43, 26, '2018-04-30', 3);
INSERT INTO `record` VALUES (44, 56, '2018-04-30', 1);
INSERT INTO `record` VALUES (45, 26, '2018-10-25', 1);
INSERT INTO `record` VALUES (46, 26, '2018-10-25', 10);
INSERT INTO `record` VALUES (47, 26, '2018-10-25', 22);
INSERT INTO `record` VALUES (48, 34, '2018-10-25', 6);
INSERT INTO `record` VALUES (49, 26, '2018-11-04', 1);
INSERT INTO `record` VALUES (50, 25, '2018-11-04', 1);
INSERT INTO `record` VALUES (51, 82, '2019-04-04', 2);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `role_id` INT(11) NOT NULL AUTO_INCREMENT,
  `role_name` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `role_info` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '超级管理员', '系统最高权限者');
INSERT INTO `role` VALUES (2, '普通管理员', '管理发货');
INSERT INTO `role` VALUES (3, '小角色', '无权限');

-- ----------------------------
-- Table structure for rolepermission
-- ----------------------------
DROP TABLE IF EXISTS `rolepermission`;
CREATE TABLE `rolepermission`  (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `role_id` INT(11) DEFAULT NULL,
  `perid` INT(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 38 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of rolepermission
-- ----------------------------
INSERT INTO `rolepermission` VALUES (1, 1, 1);
INSERT INTO `rolepermission` VALUES (2, 1, 2);
INSERT INTO `rolepermission` VALUES (3, 1, 3);
INSERT INTO `rolepermission` VALUES (4, 1, 4);
INSERT INTO `rolepermission` VALUES (5, 1, 6);
INSERT INTO `rolepermission` VALUES (6, 1, 9);
INSERT INTO `rolepermission` VALUES (7, 1, 10);
INSERT INTO `rolepermission` VALUES (8, 1, 13);
INSERT INTO `rolepermission` VALUES (9, 1, 14);
INSERT INTO `rolepermission` VALUES (10, 1, 15);
INSERT INTO `rolepermission` VALUES (11, 1, 16);
INSERT INTO `rolepermission` VALUES (12, 1, 17);
INSERT INTO `rolepermission` VALUES (13, 1, 19);
INSERT INTO `rolepermission` VALUES (14, 1, 20);
INSERT INTO `rolepermission` VALUES (15, 1, 21);
INSERT INTO `rolepermission` VALUES (16, 1, 22);
INSERT INTO `rolepermission` VALUES (17, 1, 23);
INSERT INTO `rolepermission` VALUES (18, 1, 24);
INSERT INTO `rolepermission` VALUES (19, 2, 1);
INSERT INTO `rolepermission` VALUES (20, 2, 6);
INSERT INTO `rolepermission` VALUES (21, 2, 13);
INSERT INTO `rolepermission` VALUES (22, 2, 14);
INSERT INTO `rolepermission` VALUES (23, 2, 15);
INSERT INTO `rolepermission` VALUES (24, 2, 16);
INSERT INTO `rolepermission` VALUES (25, 2, 17);
INSERT INTO `rolepermission` VALUES (26, 2, 19);
INSERT INTO `rolepermission` VALUES (27, 2, 21);
INSERT INTO `rolepermission` VALUES (28, 2, 25);
INSERT INTO `rolepermission` VALUES (29, 1, 25);
INSERT INTO `rolepermission` VALUES (30, 3, 1);
INSERT INTO `rolepermission` VALUES (31, 3, 6);
INSERT INTO `rolepermission` VALUES (32, 3, 13);
INSERT INTO `rolepermission` VALUES (33, 3, 19);
INSERT INTO `rolepermission` VALUES (34, 3, 21);
INSERT INTO `rolepermission` VALUES (35, 3, 25);
INSERT INTO `rolepermission` VALUES (36, 1, 26);
INSERT INTO `rolepermission` VALUES (37, 2, 26);

-- ----------------------------
-- Table structure for snackinfo
-- ----------------------------
DROP TABLE IF EXISTS `productinfo`;
CREATE TABLE `snackinfo`  (
  `s_id` INT(11) NOT NULL AUTO_INCREMENT,
  `s_batch` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '批次好=生产日期+2位随机数',
  `s_name` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `s_price` DOUBLE DEFAULT NULL,
  `s_discount` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '折扣',
  `s_pictureUrl` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `s_brand` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '品牌',
  `s_place` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '产地',
  `s_Imported` INT(1) DEFAULT NULL COMMENT '是否进口',
  `s_score` INT(11) DEFAULT NULL COMMENT '积分',
  `s_pDate` DATE DEFAULT NULL COMMENT '生产日期',
  `s_qDate` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '保质期',
  `state` INT(11) DEFAULT NULL COMMENT '1---上架，0---草稿，-1--下架',
  `s_createDate` DATE DEFAULT NULL COMMENT '上架时间',
  `s_dese` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '详情',
  `s_type` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `s_number` INT(11) DEFAULT NULL COMMENT '数量',
  PRIMARY KEY (`s_id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 83 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of snackinfo
-- ----------------------------
INSERT INTO `snackinfo` VALUES (20, '201803273550', '杀草农药', 10, '10', '草甘膦.jpg', '草甘膦', '浙江', 1, NULL, '2018-03-15', '12', 1, '2018-03-27', '很好喝', '农药类', 344);
INSERT INTO `snackinfo` VALUES (21, '201803276547', '小田膜', 20, '9', '农膜5.jpg', '小膜', '江苏', 1, NULL, '2019-04-04', '12', 1, '2018-03-27', '好用', '其他', 999);
INSERT INTO `snackinfo` VALUES (23, '201803271694', '水溶化肥', 100, '8', '水溶肥.jpg', '水溶肥', '山东', 1, NULL, '2018-03-14', '12', 1, '2018-03-27', '11', '化肥类', 250);
INSERT INTO `snackinfo` VALUES (24, '201803272746', '木棉', 100, '5', '种子10（木棉）.jpg', '大木棉', '山东', 0, NULL, '2018-03-14', '12', 1, '2018-03-27', '精品', '种子类', 9992);
INSERT INTO `snackinfo` VALUES (25, '201804174136', '大蒜种子', 10, '1', '种子.png', '暂无', '广东', 0, NULL, '2019-04-03', '12', 1, '2018-04-17', '无任何转基因成分', '种子类', 200);
INSERT INTO `snackinfo` VALUES (26, '201804172196', '种子2', 20, '8', '种子.jpg', '暂无', '上海', 0, NULL, '2018-04-17', '12', 1, '2018-04-17', '无毒无害', '种子类', 100);
INSERT INTO `snackinfo` VALUES (27, '201804171833', '大豆', 10, '7', '种子2.jpg', '暂无', '天津', 0, NULL, '2018-04-17', '12', 1, '2018-04-17', '快速生长', '种子类', 1200);
INSERT INTO `snackinfo` VALUES (28, '201804174852', '扁豆', 10, '10', '种子3.jpg', '1', '海南', 0, NULL, '2019-04-03', '18', 1, '2018-04-17', '、1', '种子类', 1212);
INSERT INTO `snackinfo` VALUES (29, '201804171022', '白谷', 10, '8', '种子4.jpg', '1', '北京', 1, NULL, '2018-04-17', '12', 1, '2018-04-17', '1', '种子类', 2231);
INSERT INTO `snackinfo` VALUES (30, '201804172485', '樟树', 10, '8', '种子5（樟树）.jpg', '香樟树', '浙江', 1, NULL, '2018-04-17', '12', 1, '2018-04-17', '1', '种子类', 23133);
INSERT INTO `snackinfo` VALUES (31, '201804172109', '向日葵', 20, '8', '种子6（向日葵）.jpg', '小葵花', '浙江', 0, NULL, '2018-04-18', '12', 1, '2018-04-17', '1', '种子类', 1000);
INSERT INTO `snackinfo` VALUES (32, '201804174170', '杜葵', 10, '10', '种子7.jpg', '葵葵', '浙江', 0, NULL, '2018-04-19', '12', 1, '2018-04-17', '1', '种子类', 10000);
INSERT INTO `snackinfo` VALUES (33, '201804173272', '大麻', 20, '8', '种子8（大麻）.jpg', 'enk', '泰国', 0, NULL, '2018-04-02', '12', 1, '2018-04-17', '精选', '种子类', 10000);
INSERT INTO `snackinfo` VALUES (34, '201804175107', '杉木种子', 20, '6', '种子9（杉木）.jpg', '良品杉木', '浙江', 1, NULL, '2019-04-03', '12', 1, '2018-04-17', '够够的', '种子类', 1022);
INSERT INTO `snackinfo` VALUES (39, '201804178495', '壮苗肥化肥', 200, '10', '化肥1.jpg', '壮苗肥', '浙江', 0, NULL, '2019-04-04', '12', 1, '2018-04-17', '壮苗肥好用', '化肥类', 200);
INSERT INTO `snackinfo` VALUES (40, '201804171216', '有机肥料', 20, '6', '化肥2.jpg', '壮苗肥', '浙江', 1, NULL, '2019-04-04', '12', 1, '2018-04-17', '1', '化肥类', 10000);
INSERT INTO `snackinfo` VALUES (41, '201804171172', '精品化肥', 20, '8', '化肥4.jpg', 'SHILAI', '浙江', 0, NULL, '2019-04-04', '12', 1, '2018-04-17', '1', '化肥类', 100);
INSERT INTO `snackinfo` VALUES (42, '201804177856', '铃酸钾胺', 20, '6', '化肥5.jpg', '金典', '浙江', 0, NULL, '2019-04-04', '12', 1, '2018-04-17', '1', '化肥类', 1000);
INSERT INTO `snackinfo` VALUES (43, '201804172550', '复合肥', 20, '4', '化肥6.jpg', '籽源', '浙江', 0, NULL, '2019-04-04', '12', 1, '2018-04-17', '1', '化肥类', 10000);
INSERT INTO `snackinfo` VALUES (44, '201804179981', '早收化肥', 30, '6', '化肥8.jpg', '早收', '上海', 0, NULL, '2019-04-04', '12', 1, '2018-04-17', '1', '化肥类', 100);
INSERT INTO `snackinfo` VALUES (45, '201804177197', '壮苗肥化肥', 30, '9', '化肥3.jpg', '壮苗肥', '浙江', 0, NULL, '2019-04-04', '12', 1, '2018-04-17', '1', '化肥类', 100);
INSERT INTO `snackinfo` VALUES (46, '201804175915', '复合化肥', 10, '8', '化肥7.jpg', '1', '北京', 1, NULL, '2018-04-14', '12', 1, '2018-04-17', '化肥', '化肥类', 100);
INSERT INTO `snackinfo` VALUES (51, '201804171818', '黄金梨化肥', 30, '9', '化肥9.jpg', '黄金梨', '天津', 0, NULL, '2019-04-04', '12', 1, '2018-04-17', '1', '化肥类', 2);
INSERT INTO `snackinfo` VALUES (52, '201804177621', '控制化肥', 20, '8', '控制肥.jpg', '中泰', '福建', 1, NULL, '2018-03-20', '12', 1, '2018-04-17', '1', '化肥类', 250);
INSERT INTO `snackinfo` VALUES (53, '201804176052', '百草枯农药', 10, '9', '百草枯.jpg', '百草枯', '上海', 0, NULL, '2018-04-19', '12', 1, '2018-04-17', '1', '农药类', 100);
INSERT INTO `snackinfo` VALUES (54, '201804176090', '氟铃酮农药', 30, '8', '氟铃酮.jpg', '氟铃酮', '青州', 0, NULL, '2018-03-07', '12', 1, '2018-04-17', '2112', '农药类', 100);
INSERT INTO `snackinfo` VALUES (55, '201804177963', '啵乐乐', 10, '9', '农药1.jpg', '敌敌畏', '上海', 0, NULL, '2019-04-04', '12', 1, '2018-04-17', '1', '农药类', 230);
INSERT INTO `snackinfo` VALUES (56, '201804177044', '有机硅', 20, '6', '农药2.jpg', '暂无', '上海', 1, NULL, '2018-04-19', '12', 1, '2018-04-17', '1', '农药类', 199);
INSERT INTO `snackinfo` VALUES (61, '201804176104', '敌百虫农药', 20, '8', '农药3.jpg', '敌百虫', '太原', 0, NULL, '2018-04-19', '12', 1, '2018-04-17', '1', '农药类', 200);
INSERT INTO `snackinfo` VALUES (62, '201804171606', '杀菌素', 10, '8', '乙基多杀菌素.jpg', '乙基多杀菌素', '上海', 0, NULL, '2019-04-04', '12', 1, '2018-04-17', '准杀菌种', '农药类', 120);
INSERT INTO `snackinfo` VALUES (63, '201804172259', '甘蔗钻心虫', 10, '10', '专杀甘蔗钻心虫.jpg', '专杀牌', '杭州', 0, NULL, '2018-04-17', '12', 1, '2018-04-17', '甘蔗虫', '农药类', 10000);
INSERT INTO `snackinfo` VALUES (66, '201804177256', '百草枯', 20, '8', '4.jpg', '旺旺', '浙江', 0, NULL, '2018-04-19', '12', 1, '2018-04-17', '好吃的椰汁', '农药类', 10000);
INSERT INTO `snackinfo` VALUES (67, '201804177149', '青州优品膜', 20, '8', '农膜3.jpg', '优品膜', '山东', 0, NULL, '2019-04-04', '12', 1, '2018-04-17', '好用', '其他', 10000);
INSERT INTO `snackinfo` VALUES (68, '201804172033', '大厂膜', 10, '5', '农膜4.jpg', '旺旺', '浙江', 0, NULL, '2018-04-17', '12', 1, '2018-04-17', '好用实惠', '其他', 10000);
INSERT INTO `snackinfo` VALUES (81, '201807029034', '最代码牛币', 21, '1', '1.png', '东北膜', '山东', 0, NULL, '2019-04-04', '12', 1, '2018-07-02', '最代码', '其他', 100);
INSERT INTO `snackinfo` VALUES (82, '201811042918', '杀扑膦农药', 100, '1', '1.jpg', '杀扑膦', '北京', 0, NULL, '2019-04-04', '1', 1, '2018-11-04', '最代码', '农药类', 98);

-- ----------------------------
-- Table structure for userinfo
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo`  (
  `u_id` INT(11) NOT NULL AUTO_INCREMENT,
  `u_realname` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '真实姓名',
  `u_username` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户名',
  `u_password` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '密码',
  `u_money` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '钱包金额',
  `u_phone` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '手机号',
  `u_email` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '邮箱',
  `u_sex` CHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '性别',
  `u_resgistDate` DATE DEFAULT NULL COMMENT '出生日期',
  `u_address` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '地址',
  `u_score` INT(11) DEFAULT NULL COMMENT '积分总数',
  PRIMARY KEY (`u_id`) USING BTREE
) ENGINE = INNODB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO `userinfo` VALUES (17, '哈哈', '测试', '123456', '9983.0', '15810100256', '761695@qq.com', '男', '2019-04-04', '浙江', NULL);
INSERT INTO `userinfo` VALUES (18, '王子潇', 'wangzixiao', '123456', '11091.0', '185521456729', '123@qq.com', '男', '2019-04-04', '泰国', 1);
INSERT INTO `userinfo` VALUES (19, '子潇', 'zixiao', '123456', '9984.0', '15377328641', '111@qq.com', '男', '2019-04-04', '天上人间', NULL);
INSERT INTO `userinfo` VALUES (20, '最代码', 'zuidaima', '123456', '9964.0', '15712821882', '123@qq.com', '男', '2019-07-24', '太空', NULL);

-- ----------------------------
-- Procedure structure for haha
-- ----------------------------
DROP PROCEDURE IF EXISTS `haha`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `haha`(IN a INT,IN b INT)
BEGIN
SET @x=0;
SET @x =a+b;
SELECT @x AS num;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for jk
-- ----------------------------
DROP PROCEDURE IF EXISTS `jk`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `jk`()
BEGIN
 SELECT * FROM admin;
END
;;
DELIMITER ;

SET FOREIGN_KEY_CHECKS = 1;
