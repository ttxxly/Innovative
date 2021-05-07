/*
 Navicat Premium Data Transfer

 Source Server         : localhost_mysql
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : innovative

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 07/05/2021 14:52:07
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_bis_project
-- ----------------------------
DROP TABLE IF EXISTS `t_bis_project`;
CREATE TABLE `t_bis_project`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `overview` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `cycle` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_sec_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_sec_menu`;
CREATE TABLE `t_sec_menu`  (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DESCRIPTION` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PARENT_ID` bigint(20) NULL DEFAULT NULL,
  `PRIVILEGE_CODE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `URL` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `order_sn` int(11) NULL DEFAULT NULL,
  `ICON` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `code` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE INDEX `unique_code`(`code`) USING BTREE,
  INDEX `FK_psv09uu72jp7gwbch9sgm0pm6`(`PARENT_ID`) USING BTREE,
  CONSTRAINT `FK_psv09uu72jp7gwbch9sgm0pm6` FOREIGN KEY (`PARENT_ID`) REFERENCES `t_sec_menu` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 168 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sec_menu
-- ----------------------------
INSERT INTO `t_sec_menu` VALUES (153, '权限管理', '权限管理', NULL, '', NULL, 2, 'users', 'valid', '02');
INSERT INTO `t_sec_menu` VALUES (155, '系统管理', '系统管理', NULL, '', NULL, 1, 'desktop', 'valid', '01');
INSERT INTO `t_sec_menu` VALUES (156, '字典管理', '字典管理', 155, 'sys_dict', '/sys/dict/index', 1, NULL, 'valid', '0101');
INSERT INTO `t_sec_menu` VALUES (157, '代码生成', '代码生成', 155, 'sys_code', '/sys/code/index', 2, NULL, 'valid', '0102');
INSERT INTO `t_sec_menu` VALUES (158, '管理员管理', '管理员管理', 153, 'sec_manager', '/sec/manager/index', NULL, NULL, 'valid', '0202');
INSERT INTO `t_sec_menu` VALUES (159, '用户管理', '用户管理', 153, 'sec_user', '/sec/user/index', NULL, NULL, 'valid', '0203');
INSERT INTO `t_sec_menu` VALUES (161, '菜单管理', '菜单管理', 153, 'sec_menu', '/sec/menu/index', NULL, NULL, 'valid', '0204');
INSERT INTO `t_sec_menu` VALUES (162, '角色管理', '菜单管理', 153, 'sec_role', '/sec/role/index', NULL, NULL, 'valid', '0201');
INSERT INTO `t_sec_menu` VALUES (163, '文件管理', '文件管理', 155, 'sys_xfile', '/sys/xfile/index', NULL, NULL, 'valid', '0103');
INSERT INTO `t_sec_menu` VALUES (165, '业务模块', '自定义业务模块', NULL, '', NULL, NULL, 'inbox', 'valid', '03');
INSERT INTO `t_sec_menu` VALUES (167, '项目管理', '项目管理', 165, 'business_project', '/business/project/index', NULL, NULL, 'valid', '0301');

-- ----------------------------
-- Table structure for t_sec_role
-- ----------------------------
DROP TABLE IF EXISTS `t_sec_role`;
CREATE TABLE `t_sec_role`  (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `CODE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编码',
  `DESCRIPTION` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE INDEX `uni_code`(`CODE`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sec_role
-- ----------------------------
INSERT INTO `t_sec_role` VALUES (4, 'role_admin', 'role_admin', '管理员', 'valid');
INSERT INTO `t_sec_role` VALUES (5, 'role_expert', 'role_expert', '评审专家', 'valid');
INSERT INTO `t_sec_role` VALUES (6, 'role_teacher', 'role_teacher', '教师', 'valid');
INSERT INTO `t_sec_role` VALUES (8, 'role_stu', 'role_stu', '学生', 'valid');

-- ----------------------------
-- Table structure for t_sec_role_privilege
-- ----------------------------
DROP TABLE IF EXISTS `t_sec_role_privilege`;
CREATE TABLE `t_sec_role_privilege`  (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ROLE_ID` bigint(20) NULL DEFAULT NULL,
  `PRIVILEGE_TITLE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PRIVILEGE_CODE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `FUNCTION_LIST` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK_37slprxb3e2ygav598e3yeawt`(`ROLE_ID`) USING BTREE,
  CONSTRAINT `FK_37slprxb3e2ygav598e3yeawt` FOREIGN KEY (`ROLE_ID`) REFERENCES `t_sec_role` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sec_role_privilege
-- ----------------------------
INSERT INTO `t_sec_role_privilege` VALUES (15, 4, '菜单管理', 'sec_menu', 'edit|delete|create|list');
INSERT INTO `t_sec_role_privilege` VALUES (26, 4, '管理员管理', 'sec_manager', 'delete|create|list|edit');
INSERT INTO `t_sec_role_privilege` VALUES (32, 6, '用户管理', 'sec_user', 'deletelist');
INSERT INTO `t_sec_role_privilege` VALUES (34, 4, 't_bis_project管理', 'null_project', 'edit|delete|create|list');
INSERT INTO `t_sec_role_privilege` VALUES (35, 4, 't_bis_project管理', 'business_project', 'edit|delete|create|list');
INSERT INTO `t_sec_role_privilege` VALUES (36, 4, '角色管理', 'sec_role', 'edit|delete|create|list');
INSERT INTO `t_sec_role_privilege` VALUES (37, 5, '项目管理', 'business_project', 'edit|delete|create|list');
INSERT INTO `t_sec_role_privilege` VALUES (38, 6, '项目管理', 'business_project', 'edit|delete|create|list');
INSERT INTO `t_sec_role_privilege` VALUES (39, 8, '项目管理', 'business_project', 'edit|delete|create|list');

-- ----------------------------
-- Table structure for t_sec_test
-- ----------------------------
DROP TABLE IF EXISTS `t_sec_test`;
CREATE TABLE `t_sec_test`  (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `CODE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编码',
  `DESCRIPTION` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE INDEX `uni_code`(`CODE`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_sec_user
-- ----------------------------
DROP TABLE IF EXISTS `t_sec_user`;
CREATE TABLE `t_sec_user`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `login_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_type` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mobile` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_date` datetime(0) NULL,
  `status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `birthday` datetime(0) NULL DEFAULT NULL,
  `province` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_login_name`(`login_name`) USING BTREE,
  UNIQUE INDEX `unique_email`(`email`) USING BTREE,
  UNIQUE INDEX `unique_mobile`(`mobile`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 94 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sec_user
-- ----------------------------
INSERT INTO `t_sec_user` VALUES (52, 'admin', 'e10adc3949ba59abbe56e057f20f883e', '管理员', 'admin', 'status', '12345678911', NULL, '2018-04-19 13:30:57', 'valid', '2018-04-18 16:00:00', NULL);
INSERT INTO `t_sec_user` VALUES (54, 'student', 'e10adc3949ba59abbe56e057f20f883e', '学生', 'admin', '', '13366442927', NULL, '2018-04-27 16:16:38', 'valid', '2013-03-06 16:00:00', '');
INSERT INTO `t_sec_user` VALUES (74, 'teacher', 'e10adc3949ba59abbe56e057f20f883e', '评审老师', 'admin', 'zhangsan@126.com', '13966442927', NULL, '2018-05-07 14:42:55', 'valid', '2021-05-05 16:00:00', '');
INSERT INTO `t_sec_user` VALUES (89, 'system', '54b53072540eeeb8f8e9343e71f28176', '系统管理员', 'admin', 'sdfsdf@qq.com', '15982213227', NULL, '2021-05-06 10:53:03', 'valid', '2021-05-03 16:00:00', NULL);
INSERT INTO `t_sec_user` VALUES (91, 'expert', 'e10adc3949ba59abbe56e057f20f883e', '评审专家', 'admin', 'sdfsdfs@qq.com', '159822ss13227', NULL, '2021-05-06 10:56:06', 'valid', '2021-05-02 16:00:00', 'shandong');

-- ----------------------------
-- Table structure for t_sec_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_sec_user_role`;
CREATE TABLE `t_sec_user_role`  (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USER_ID` bigint(20) NOT NULL,
  `ROLE_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户角色' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sec_user_role
-- ----------------------------
INSERT INTO `t_sec_user_role` VALUES (1, 58, 6);
INSERT INTO `t_sec_user_role` VALUES (2, 89, 4);
INSERT INTO `t_sec_user_role` VALUES (3, 89, 8);
INSERT INTO `t_sec_user_role` VALUES (4, 52, 4);
INSERT INTO `t_sec_user_role` VALUES (5, 54, 8);
INSERT INTO `t_sec_user_role` VALUES (6, 74, 6);
INSERT INTO `t_sec_user_role` VALUES (7, 91, 5);

-- ----------------------------
-- Table structure for t_sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_dict`;
CREATE TABLE `t_sys_dict`  (
  `id` int(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `group_code` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `code` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `detail` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sn` int(8) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sys_dict
-- ----------------------------
INSERT INTO `t_sys_dict` VALUES (5, 'gender', '男', 'man', 'invalid', NULL, NULL);
INSERT INTO `t_sys_dict` VALUES (6, 'gender', '女', 'woman', 'valid', NULL, NULL);
INSERT INTO `t_sys_dict` VALUES (7, 'province', '山东', 'shandong', 'valid', NULL, 1);
INSERT INTO `t_sys_dict` VALUES (8, 'province', '河南', 'henan', 'valid', NULL, 2);
INSERT INTO `t_sys_dict` VALUES (9, 'province', '河北', 'hebei', 'valid', NULL, 3);

-- ----------------------------
-- Table structure for t_sys_xfile
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_xfile`;
CREATE TABLE `t_sys_xfile`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `file_realname` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `file_path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `file_title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `file_size` bigint(16) NULL DEFAULT NULL,
  `user_id` bigint(16) NULL DEFAULT NULL,
  `extension_name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_date` datetime(0) NULL,
  `is_deleted` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
