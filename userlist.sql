/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50731
Source Host           : localhost:3306
Source Database       : userlist

Target Server Type    : MYSQL
Target Server Version : 50731
File Encoding         : 65001

Date: 2020-12-07 15:12:54
*/

SET FOREIGN_KEY_CHECKS=0;
CREATE DATABASE userlist;
USE userlist;
-- ----------------------------
-- Table structure for mainmenu
-- ----------------------------
DROP TABLE IF EXISTS `mainmenu`;
CREATE TABLE `mainmenu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mainFile` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mainmenu
-- ----------------------------
INSERT INTO `mainmenu` VALUES ('1', '首页');
INSERT INTO `mainmenu` VALUES ('2', '商品管理');
INSERT INTO `mainmenu` VALUES ('3', '订单管理');
INSERT INTO `mainmenu` VALUES ('4', '财务管理');
INSERT INTO `mainmenu` VALUES ('5', '报关管理');
INSERT INTO `mainmenu` VALUES ('6', '数据维护');
INSERT INTO `mainmenu` VALUES ('7', '系统管理');

-- ----------------------------
-- Table structure for smenu
-- ----------------------------
DROP TABLE IF EXISTS `smenu`;
CREATE TABLE `smenu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sFile` varchar(255) DEFAULT NULL,
  `f_id` int(11) NOT NULL,
  `Link` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `f_id` (`f_id`),
  CONSTRAINT `smenu_ibfk_1` FOREIGN KEY (`f_id`) REFERENCES `mainmenu` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of smenu
-- ----------------------------
INSERT INTO `smenu` VALUES ('1', '订单导入', '3', 'https://www.baidu.com/');
INSERT INTO `smenu` VALUES ('2', '订单总览', '3', 'https://www.taobao.com/');
INSERT INTO `smenu` VALUES ('3', '订单审核', '3', 'https://www.bilibili.com/');
INSERT INTO `smenu` VALUES ('4', '添加商品', '2', 'javascript:;');
INSERT INTO `smenu` VALUES ('5', '删除商品', '2', 'javascript:;');
INSERT INTO `smenu` VALUES ('6', '修改商品', '2', 'javascript:;');
INSERT INTO `smenu` VALUES ('7', '财务支出', '4', 'javascript:;');
INSERT INTO `smenu` VALUES ('8', '财务收入', '4', 'javascript:;');
INSERT INTO `smenu` VALUES ('9', '财务统计', '4', 'javascript:;');
INSERT INTO `smenu` VALUES ('10', '税收', '5', 'javascript:;');
INSERT INTO `smenu` VALUES ('11', '出口', '5', 'javascript:;');
INSERT INTO `smenu` VALUES ('12', '丢失', '5', 'javascript:;');
INSERT INTO `smenu` VALUES ('13', '数据查询', '6', 'javascript:;');
INSERT INTO `smenu` VALUES ('14', '数据修改', '6', 'javascript:;');
INSERT INTO `smenu` VALUES ('15', '数据删除', '6', 'javascript:;');
INSERT INTO `smenu` VALUES ('16', '系统更新', '7', 'javascript:;');
INSERT INTO `smenu` VALUES ('17', '系统缴费', '7', 'javascript:;');
INSERT INTO `smenu` VALUES ('19', '订单报警', '3', 'javascript:;');
INSERT INTO `smenu` VALUES ('20', '退订订单', '3', 'http://www.baidu.com');

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) NOT NULL,
  `userPwd` varchar(255) NOT NULL,
  `jurisdiction` varchar(255) DEFAULT NULL,
  `realName` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('1', 'admin', 'admin', '管理员', '徐辉', '内蒙古乌海', '1234567@163.com');
INSERT INTO `tb_user` VALUES ('64', 'Ruby', '123456', '用户', '瑞比', '吉林长春', '88562437@qq.com');
