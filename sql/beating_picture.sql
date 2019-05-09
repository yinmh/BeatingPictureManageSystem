/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : beating_picture

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2019-05-07 11:53:31
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for boos
-- ----------------------------
DROP TABLE IF EXISTS `boos`;
CREATE TABLE `boos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `area_id` int(11) DEFAULT NULL,
  `blood` bigint(20) DEFAULT NULL,
  `attack` int(11) DEFAULT NULL,
  `g_exp` bigint(20) DEFAULT NULL,
  `coin` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of boos
-- ----------------------------

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------

-- ----------------------------
-- Table structure for desingation
-- ----------------------------
DROP TABLE IF EXISTS `desingation`;
CREATE TABLE `desingation` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '积分（战斗力）',
  `name` varchar(255) DEFAULT NULL,
  `integral` bigint(20) DEFAULT '0' COMMENT '积分',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of desingation
-- ----------------------------
INSERT INTO `desingation` VALUES ('1', '斗图小白', '500');
INSERT INTO `desingation` VALUES ('2', '斗图新秀', '1000');
INSERT INTO `desingation` VALUES ('3', '斗图侠士', '1500');
INSERT INTO `desingation` VALUES ('4', '斗图勇士', '2600');
INSERT INTO `desingation` VALUES ('5', '斗图强者', '5000');
INSERT INTO `desingation` VALUES ('6', '斗图高手', '10000');
INSERT INTO `desingation` VALUES ('7', '斗图王者', '18000');
INSERT INTO `desingation` VALUES ('8', '神一样的存在', '25000');
INSERT INTO `desingation` VALUES ('9', '你就是爸爸', '50000');
INSERT INTO `desingation` VALUES ('10', '无上限了', '10000000');

-- ----------------------------
-- Table structure for head_img
-- ----------------------------
DROP TABLE IF EXISTS `head_img`;
CREATE TABLE `head_img` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `head_img_path` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of head_img
-- ----------------------------
INSERT INTO `head_img` VALUES ('1', './image/head/1.jpg');
INSERT INTO `head_img` VALUES ('2', './image/head/2.jpg');
INSERT INTO `head_img` VALUES ('3', './image/head/3.jpg');
INSERT INTO `head_img` VALUES ('4', './image/head/4.jpg');
INSERT INTO `head_img` VALUES ('5', './image/head/5.jpg');
INSERT INTO `head_img` VALUES ('6', './image/head/6.jpg');
INSERT INTO `head_img` VALUES ('7', './image/head/7.jpg');

-- ----------------------------
-- Table structure for manager
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of manager
-- ----------------------------

-- ----------------------------
-- Table structure for manager_role
-- ----------------------------
DROP TABLE IF EXISTS `manager_role`;
CREATE TABLE `manager_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `manager_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of manager_role
-- ----------------------------

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL COMMENT 'url路径',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------

-- ----------------------------
-- Table structure for picture
-- ----------------------------
DROP TABLE IF EXISTS `picture`;
CREATE TABLE `picture` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `picture_path` varchar(255) DEFAULT NULL,
  `picture_name` varchar(255) DEFAULT NULL,
  `harm` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of picture
-- ----------------------------
INSERT INTO `picture` VALUES ('1', './image/picture/21.jpg', '图片1', '1000');
INSERT INTO `picture` VALUES ('2', './image/picture/22.jpg', '图片2', '2000');
INSERT INTO `picture` VALUES ('3', './image/picture/23.jpg', '图片3', '3000');
INSERT INTO `picture` VALUES ('4', './image/picture/24.jpg', '图片4', '4000');
INSERT INTO `picture` VALUES ('5', './image/picture/25.jpg', '图片5', '5000');
INSERT INTO `picture` VALUES ('6', './image/picture/26.jpg', '图片6', '6000');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `discount` float(12,0) DEFAULT '1',
  `status` int(11) DEFAULT '1',
  `picture_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------

-- ----------------------------
-- Table structure for rank
-- ----------------------------
DROP TABLE IF EXISTS `rank`;
CREATE TABLE `rank` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rank_name` varchar(128) NOT NULL,
  `exp` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rank
-- ----------------------------
INSERT INTO `rank` VALUES ('1', '1级', '1000');
INSERT INTO `rank` VALUES ('2', '2级', '1500');
INSERT INTO `rank` VALUES ('3', '3级', '2200');
INSERT INTO `rank` VALUES ('4', '4级', '2900');
INSERT INTO `rank` VALUES ('5', '5级', '3500');
INSERT INTO `rank` VALUES ('6', '6级', '4300');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------

-- ----------------------------
-- Table structure for role_menu
-- ----------------------------
DROP TABLE IF EXISTS `role_menu`;
CREATE TABLE `role_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `menu_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_menu
-- ----------------------------

-- ----------------------------
-- Table structure for roll_img
-- ----------------------------
DROP TABLE IF EXISTS `roll_img`;
CREATE TABLE `roll_img` (
  `id` int(11) NOT NULL,
  `roll_img_path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of roll_img
-- ----------------------------

-- ----------------------------
-- Table structure for sign
-- ----------------------------
DROP TABLE IF EXISTS `sign`;
CREATE TABLE `sign` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `get_coin` int(11) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sign
-- ----------------------------
INSERT INTO `sign` VALUES ('0', '星期天', '100', '&#xe756;');
INSERT INTO `sign` VALUES ('1', '星期一', '100', '&#xe608;');
INSERT INTO `sign` VALUES ('2', '星期二', '100', '&#xe650;');
INSERT INTO `sign` VALUES ('3', '星期三', '100', '&#xe67a;');
INSERT INTO `sign` VALUES ('4', '星期四', '100', '&#xe6af;');
INSERT INTO `sign` VALUES ('5', '星期五', '100', '&#xe62e;');
INSERT INTO `sign` VALUES ('6', '星期六', '100', '&#xe735;');

-- ----------------------------
-- Table structure for upload_picture
-- ----------------------------
DROP TABLE IF EXISTS `upload_picture`;
CREATE TABLE `upload_picture` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `picture_name` varchar(255) DEFAULT NULL,
  `upload_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of upload_picture
-- ----------------------------
INSERT INTO `upload_picture` VALUES ('11', '14', 'AC48904E0F77F8B72D78A452D4560C0D.jpg', '2019-05-01 21:44:51');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` int(2) DEFAULT '1',
  `create_time` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('5', 'admin', '10:c337a74dccbbe8e9ddf62c2e39f8b26b3f76f02cd6cc102c:e2b0eeb9b6f7a68d2a0e85c5f0ead24c8608bc5eeff914fd', '1', null);

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `head_img_id` int(11) NOT NULL,
  `coin` bigint(20) DEFAULT '0',
  `power` int(11) DEFAULT '3000',
  `designation_id` int(11) DEFAULT '1',
  `rank_id` int(11) NOT NULL DEFAULT '1',
  `user_id` int(11) NOT NULL,
  `gold_money` bigint(20) DEFAULT '0',
  `integral` int(11) DEFAULT '0',
  `sex` varchar(255) DEFAULT NULL,
  `role_name` varchar(255) DEFAULT NULL,
  `signed` int(11) DEFAULT NULL,
  `h_exp` bigint(20) DEFAULT '0',
  `rewarded` int(11) DEFAULT '1',
  `attack` int(11) DEFAULT NULL,
  `defense` int(11) DEFAULT NULL,
  `hit` int(11) DEFAULT NULL,
  `miss` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('14', '3', '101899', '6666666', '5', '2', '5', '999999', '44299', '男', 'ADMIN', '1', '400', '1', null, null, null, null);

-- ----------------------------
-- Table structure for user_picture
-- ----------------------------
DROP TABLE IF EXISTS `user_picture`;
CREATE TABLE `user_picture` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `picture_id` int(11) NOT NULL,
  `get_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_picture
-- ----------------------------

-- ----------------------------
-- Table structure for user_rank
-- ----------------------------
DROP TABLE IF EXISTS `user_rank`;
CREATE TABLE `user_rank` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `rank_id` int(11) NOT NULL,
  `having_exp` bigint(20) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_rank
-- ----------------------------
