/*
Navicat MySQL Data Transfer

Source Server         : 本机
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : dfyoi-admin

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-01-04 17:04:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sysdept
-- ----------------------------
DROP TABLE IF EXISTS `sysdept`;
CREATE TABLE `sysdept` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) DEFAULT NULL,
  `fullName` varchar(300) DEFAULT NULL,
  `contactPerson` varchar(3) DEFAULT NULL,
  `contactTel` varchar(15) DEFAULT NULL,
  `address` varchar(30) DEFAULT NULL,
  `descr` varchar(255) DEFAULT NULL,
  `orderNumber` int(11) DEFAULT NULL,
  `lft` int(11) DEFAULT NULL,
  `rgt` int(255) DEFAULT NULL,
  `level` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sysdept
-- ----------------------------
INSERT INTO `sysdept` VALUES ('77', '邯郸市连邦软件', '', '', '', '', '', null, '9', '14', '0');
INSERT INTO `sysdept` VALUES ('82', '商务部', '', '', '', '', '', null, '12', '13', '1');
INSERT INTO `sysdept` VALUES ('83', '行政部', '', '', '', '', '', null, '10', '11', '1');
INSERT INTO `sysdept` VALUES ('84', '北京盛世政通', '', '', '', '', '', null, '1', '8', '0');
INSERT INTO `sysdept` VALUES ('85', '软件研发部', '', '', '', '', '', null, '2', '3', '1');
INSERT INTO `sysdept` VALUES ('87', '公共资源交易部', '', '', '', '', '', null, '4', '5', '1');
INSERT INTO `sysdept` VALUES ('89', '邯郸盛世政通', '', '', '', '', '', null, '15', '18', '0');
INSERT INTO `sysdept` VALUES ('90', '初三党', null, '从第三', '从第三', '', '', null, '16', '17', '1');
INSERT INTO `sysdept` VALUES ('109', '总经理办公室', null, '', '', '', '', null, '6', '7', '1');

-- ----------------------------
-- Table structure for sysdict
-- ----------------------------
DROP TABLE IF EXISTS `sysdict`;
CREATE TABLE `sysdict` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `sym` varchar(255) DEFAULT NULL,
  `descr` varchar(255) DEFAULT NULL,
  `orderNumber` int(11) DEFAULT NULL,
  `lft` int(11) DEFAULT NULL,
  `rgt` int(255) DEFAULT NULL,
  `level` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sysdict
-- ----------------------------
INSERT INTO `sysdict` VALUES ('5', '学历', '', 'XL', '', null, '1', '14', '0');
INSERT INTO `sysdict` VALUES ('6', '高中及以下', '高中及以下', 'XL_GZJYX', '', null, '2', '3', '1');
INSERT INTO `sysdict` VALUES ('7', '专科', '专科', 'XL_ZK', '', null, '4', '5', '1');
INSERT INTO `sysdict` VALUES ('8', '本科', '本科', 'XL_BK', '', null, '6', '7', '1');
INSERT INTO `sysdict` VALUES ('9', '研究生', '研究生', 'XL_YJS', '', null, '8', '9', '1');
INSERT INTO `sysdict` VALUES ('10', '硕士', '硕士', 'XL_SS', '', null, '10', '11', '1');
INSERT INTO `sysdict` VALUES ('11', '博士', '博士', 'XL_BS', '', null, '12', '13', '1');
INSERT INTO `sysdict` VALUES ('12', '友情链接', '友情链接', 'YQLJ', '', null, '15', '20', '0');
INSERT INTO `sysdict` VALUES ('13', '新闻媒体网', '新闻媒体网', 'YQLJ_XWMTW', '', null, '18', '19', '1');
INSERT INTO `sysdict` VALUES ('15', 'Banner', 'Banner', 'YQLJ_BANNER', '', null, '16', '17', '1');

-- ----------------------------
-- Table structure for sysfile
-- ----------------------------
DROP TABLE IF EXISTS `sysfile`;
CREATE TABLE `sysfile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `flag` varchar(255) DEFAULT NULL,
  `fileType` varchar(255) DEFAULT NULL,
  `fileSize` int(11) DEFAULT NULL,
  `fileUrl` varchar(255) DEFAULT NULL,
  `filePath` varchar(255) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `parentId` int(11) DEFAULT NULL,
  `personId` int(11) DEFAULT NULL,
  `personName` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sysfile
-- ----------------------------
INSERT INTO `sysfile` VALUES ('1', '111', '1', null, null, null, null, null, '0', '3', '11');
INSERT INTO `sysfile` VALUES ('2', '222', '1', null, null, null, null, null, '0', '3', '张三丰');
INSERT INTO `sysfile` VALUES ('3', '333', '1', null, null, null, null, null, '0', '3', '张三丰');
INSERT INTO `sysfile` VALUES ('4', '444', '1', null, null, null, null, null, '0', '3', '张三丰');

-- ----------------------------
-- Table structure for sysperson
-- ----------------------------
DROP TABLE IF EXISTS `sysperson`;
CREATE TABLE `sysperson` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(5) DEFAULT NULL,
  `sex` int(1) DEFAULT NULL,
  `nation` varchar(50) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `idCard` varchar(20) DEFAULT NULL,
  `educational` varchar(6) DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `zipCode` varchar(10) DEFAULT NULL,
  `post` varchar(20) DEFAULT NULL,
  `descr` varchar(255) DEFAULT NULL,
  `deptId` int(11) DEFAULT NULL,
  `deptName` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sysperson
-- ----------------------------
INSERT INTO `sysperson` VALUES ('3', '张三丰', '1', '', '2017-10-05', '', '', '高中及以下', '', '', '', '', '', '81', '市场部');
INSERT INTO `sysperson` VALUES ('4', '1212', '1', '', null, '', '', '高中及以下', '', '', '', '', '', '84', '北京盛世政通软件发展有限公司');
INSERT INTO `sysperson` VALUES ('5', '张三', '1', '', null, '', '', '高中及以下', '', '', '', '', '', '84', '北京盛世政通软件发展有限公司');

-- ----------------------------
-- Table structure for syspower
-- ----------------------------
DROP TABLE IF EXISTS `syspower`;
CREATE TABLE `syspower` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `sym` varchar(255) DEFAULT NULL,
  `powerType` int(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `icon` varchar(20) DEFAULT NULL,
  `openType` int(1) DEFAULT NULL,
  `stts` int(1) DEFAULT NULL,
  `descr` varchar(255) DEFAULT NULL,
  `lft` int(11) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of syspower
-- ----------------------------
INSERT INTO `syspower` VALUES ('4', '系统管理', 'XTGL', '0', '', 'fa fa-sun-o', '0', '0', '', '1', '16', '0');
INSERT INTO `syspower` VALUES ('6', '网站管理', 'WZGL', '0', '', 'fa fa-file-o', '0', '0', '', '17', '24', '0');
INSERT INTO `syspower` VALUES ('7', '机构管理', 'XTGL_JGGL', '0', 'sysDept/index', 'fa fa-file-o', '0', '0', '', '2', '3', '1');
INSERT INTO `syspower` VALUES ('8', '角色管理', 'XTGL_JSGL', '0', 'sysRole/index', 'fa fa-file-o', '0', '0', '', '4', '5', '1');
INSERT INTO `syspower` VALUES ('9', '功能权限', 'XTGL_GNQX', '0', 'sysPower/index', 'fa fa-file-o', '0', '0', '', '6', '7', '1');
INSERT INTO `syspower` VALUES ('10', '人员管理', 'XTGL_RYGL', '0', 'sysPerson/index', 'fa fa-file-o', '0', '0', '', '8', '9', '1');
INSERT INTO `syspower` VALUES ('11', '用户管理', 'XTGL_YHGL', '0', 'sysUser/index', 'fa fa-file-o', '0', '0', '', '10', '11', '1');
INSERT INTO `syspower` VALUES ('12', '新闻列表', 'WZGL_XWLB', '0', 'webNews/index?sym=xwlb', 'fa fa-file-o', '0', '0', '', '22', '23', '1');
INSERT INTO `syspower` VALUES ('13', '单篇文档', 'WZGL_DPWD', '0', 'webNews/saveBySym?sym=dbwz', 'fa fa-file-o', '0', '0', '', '20', '21', '1');
INSERT INTO `syspower` VALUES ('14', '文件管理', 'XTGL_WJGL', '0', 'sysFile/index', 'fa fa-file-o', '1', '0', '', '12', '13', '1');
INSERT INTO `syspower` VALUES ('15', '数据字典', 'XTGL_SHZD', '0', 'sysDict/index', 'fa fa-file-o', '0', '0', '', '14', '15', '1');
INSERT INTO `syspower` VALUES ('16', '友情链接', 'WZGL_YQLJ', '0', 'webFriendLink/index', 'fa fa-file-o', '0', '0', '', '18', '19', '1');

-- ----------------------------
-- Table structure for sysrole
-- ----------------------------
DROP TABLE IF EXISTS `sysrole`;
CREATE TABLE `sysrole` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `sym` varchar(20) DEFAULT NULL,
  `orderNumber` int(11) DEFAULT NULL,
  `descr` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sysrole
-- ----------------------------
INSERT INTO `sysrole` VALUES ('5', '超级管理员', 'CJGLY', '1', '啥权限都有哈');
INSERT INTO `sysrole` VALUES ('6', '办公人员', 'BGRY', '2', '只有办公权限');

-- ----------------------------
-- Table structure for sysrolepower
-- ----------------------------
DROP TABLE IF EXISTS `sysrolepower`;
CREATE TABLE `sysrolepower` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `powerSym` varchar(50) DEFAULT NULL,
  `roleSym` varchar(50) DEFAULT NULL,
  `powerName` varchar(255) DEFAULT NULL,
  `roleName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sysrolepower
-- ----------------------------
INSERT INTO `sysrolepower` VALUES ('28', 'XTGL', 'CJGLY', '系统管理', '超级管理员');
INSERT INTO `sysrolepower` VALUES ('29', 'XTGL_JGGL', 'CJGLY', '机构管理', '超级管理员');
INSERT INTO `sysrolepower` VALUES ('35', 'XTGL_JSGL', 'CJGLY', '角色管理', '超级管理员');
INSERT INTO `sysrolepower` VALUES ('36', 'XTGL_GNQX', 'CJGLY', '功能权限', '超级管理员');
INSERT INTO `sysrolepower` VALUES ('37', 'XTGL_RYGL', 'CJGLY', '人员管理', '超级管理员');
INSERT INTO `sysrolepower` VALUES ('38', 'XTGL_YHGL', 'CJGLY', '用户管理', '超级管理员');
INSERT INTO `sysrolepower` VALUES ('40', 'WZGL', 'CJGLY', '网站管理', '超级管理员');
INSERT INTO `sysrolepower` VALUES ('41', 'WZGL_XWLB', 'CJGLY', '新闻列表', '超级管理员');
INSERT INTO `sysrolepower` VALUES ('42', 'WZGL_DPWD', 'CJGLY', '单篇文档', '超级管理员');
INSERT INTO `sysrolepower` VALUES ('43', 'XTGL_WJGL', 'CJGLY', '文件管理', '超级管理员');
INSERT INTO `sysrolepower` VALUES ('44', 'XTGL_SHZD', 'CJGLY', '数据字典', '超级管理员');
INSERT INTO `sysrolepower` VALUES ('50', 'WZGL', 'BGRY', '网站管理', '办公人员');
INSERT INTO `sysrolepower` VALUES ('51', 'WZGL_XWLB', 'BGRY', '新闻列表', '办公人员');
INSERT INTO `sysrolepower` VALUES ('52', 'WZGL_DPWD', 'BGRY', '单篇文档', '办公人员');
INSERT INTO `sysrolepower` VALUES ('53', 'WZGL_YQLJ', 'BGRY', '友情链接', '办公人员');
INSERT INTO `sysrolepower` VALUES ('54', 'WZGL_YQLJ', 'CJGLY', '友情链接', '超级管理员');

-- ----------------------------
-- Table structure for sysuser
-- ----------------------------
DROP TABLE IF EXISTS `sysuser`;
CREATE TABLE `sysuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(30) DEFAULT NULL,
  `userPwd` varchar(32) DEFAULT NULL,
  `roleSym` varchar(11) DEFAULT NULL,
  `roleName` varchar(50) DEFAULT NULL,
  `personId` int(11) DEFAULT NULL,
  `personName` varchar(5) DEFAULT NULL,
  `deptId` int(11) DEFAULT NULL,
  `deptName` varchar(255) DEFAULT NULL,
  `stts` int(255) DEFAULT NULL,
  `descr` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sysuser
-- ----------------------------
INSERT INTO `sysuser` VALUES ('1', 'sysadmin', 'e531245b04ddbae066d3c2b9fb1af988', 'CJGLY', '超级管理员', '3', '张三丰', '81', '市场部', '0', '');
INSERT INTO `sysuser` VALUES ('5', 'admin', '9aa75c4d70930277f59d117ce19188b0', 'CJGLY', '超级管理员', '4', '1212', '84', '北京盛世政通软件发展有限公司', '0', '');

-- ----------------------------
-- Table structure for webfriendlink
-- ----------------------------
DROP TABLE IF EXISTS `webfriendlink`;
CREATE TABLE `webfriendlink` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `sym` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `keyWords` varchar(255) DEFAULT NULL,
  `linkType` varchar(255) DEFAULT NULL,
  `linkFlag` varchar(255) DEFAULT NULL,
  `descr` varchar(255) DEFAULT NULL,
  `stts` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of webfriendlink
-- ----------------------------
INSERT INTO `webfriendlink` VALUES ('2', '百度搜索', 'http://www.baidu.com', 'baidu', '', null, '文字链接', '新闻媒体网', '', null);

-- ----------------------------
-- Table structure for webnews
-- ----------------------------
DROP TABLE IF EXISTS `webnews`;
CREATE TABLE `webnews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `sym` varchar(255) DEFAULT NULL,
  `publishDate` datetime(6) DEFAULT NULL,
  `createDate` datetime(6) DEFAULT NULL,
  `createPersonName` varchar(255) DEFAULT NULL,
  `createUserName` varchar(255) DEFAULT NULL,
  `createDeptId` int(11) DEFAULT NULL,
  `createDeptName` varchar(255) DEFAULT NULL,
  `imgUrl` varchar(255) DEFAULT NULL,
  `imgPath` varchar(255) DEFAULT NULL,
  `content` text,
  `clickCount` int(11) DEFAULT NULL,
  `stts` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of webnews
-- ----------------------------
INSERT INTO `webnews` VALUES ('9', '大厅简介', 'dbwz', '2017-10-24 13:39:03.000000', null, '张三丰', '', null, '', '', '', '<p>长治城区政务服务中心大厅简介</p>', null, null);
INSERT INTO `webnews` VALUES ('11', '123', 'xwlb', '2017-12-18 09:32:28.000000', null, '张三丰', '', null, '', 'file/image/20171218/20171218093559681.png', '', '<p>13213<br/></p>', null, null);
