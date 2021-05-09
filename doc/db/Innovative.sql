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

 Date: 09/05/2021 19:49:47
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_bis_news
-- ----------------------------
DROP TABLE IF EXISTS `t_bis_news`;
CREATE TABLE `t_bis_news`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '新闻标题',
  `date` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '发布日期',
  `publisher` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '发布者',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '新闻内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_bis_news
-- ----------------------------
INSERT INTO `t_bis_news` VALUES (1, '习近平和母亲：两代共产党人的“约定”', '20200508', '央视网新闻 企鹅号', '习近平的母亲齐心，是抗日战争初期在太行烽火中投身革命并加入中国共产党，而后奔赴延安的八路军女战士。  习仲勋对妻子也赞赏有加，他曾对子女说：“你妈妈是个优秀的共产党员！”  重言传、重身教，教知识、育品德，母亲的言传身教，为习近平树立了榜样。');

-- ----------------------------
-- Table structure for t_bis_project
-- ----------------------------
DROP TABLE IF EXISTS `t_bis_project`;
CREATE TABLE `t_bis_project`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '项目名',
  `overview` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '项目概述',
  `projectyear` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '项目年份',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '项目状态',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '项目内容',
  `fileid` int(11) NULL DEFAULT NULL COMMENT '项目文档id',
  `fileurl` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '项目文档url',
  `declarant` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '申报者',
  `declarestatus` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '申报状态',
  `auditor` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '审核老师',
  `auditstatus` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '审核状态',
  `appraise` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '评价',
  `adviser` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '指导老师',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '项目管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_bis_project
-- ----------------------------
INSERT INTO `t_bis_project` VALUES (1, '悟空传', '该项目为电影创业项目', '2020', 'succeed', '该书讲述了悲剧英雄孙悟空以及唐僧等人对命运的抗争，作者以现代人的角度重新解读《西游记》的某些情节，通篇弥漫的是思考。', 47, '/files/upload/business/project/20210509170700272.doc', 'student', '已申报未反馈', 'expert', 'succeed', '这是一个非常好的项目 值得推荐', NULL);
INSERT INTO `t_bis_project` VALUES (2, '美团', '当前，美团战略聚焦Food+Platform，正以“吃”为核心，建设生活服务业从需求侧到供给侧的多层次科技服务平台', '2020', 'wait', '美团的使命是“帮大家吃得更好，生活更好”。作为中国领先的生活服务电子商务平台，公司拥有美团、大众点评、美团外卖等消费者熟知App，服务涵盖餐饮、外卖、生鲜零售、打车、共享单车、酒店旅游、电影、休闲娱乐等200多个品类，业务覆盖全国2800个县区市。', NULL, NULL, 'student', NULL, NULL, NULL, NULL, 'teacher');

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
) ENGINE = InnoDB AUTO_INCREMENT = 169 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sec_menu
-- ----------------------------
INSERT INTO `t_sec_menu` VALUES (153, '权限管理', '权限管理', NULL, '', NULL, 2, 'users', 'valid', '02');
INSERT INTO `t_sec_menu` VALUES (155, '系统管理', '系统管理', NULL, '', NULL, 1, 'desktop', 'valid', '01');
INSERT INTO `t_sec_menu` VALUES (156, '字典管理', '字典管理', 155, 'sys_dict', '/sys/dict/index', 1, NULL, 'valid', '0101');
INSERT INTO `t_sec_menu` VALUES (157, '代码生成', '代码生成', 155, 'sys_code', '/sys/code/index', 2, NULL, 'valid', '0102');
INSERT INTO `t_sec_menu` VALUES (158, '账户管理', '账户管理', 153, 'sec_manager', '/sec/manager/index', NULL, NULL, 'valid', '0202');
INSERT INTO `t_sec_menu` VALUES (159, '用户管理', '用户管理', 153, 'sec_user', '/sec/user/index', NULL, NULL, 'valid', '0203');
INSERT INTO `t_sec_menu` VALUES (161, '菜单管理', '菜单管理', 153, 'sec_menu', '/sec/menu/index', NULL, NULL, 'valid', '0204');
INSERT INTO `t_sec_menu` VALUES (162, '角色管理', '菜单管理', 153, 'sec_role', '/sec/role/index', NULL, NULL, 'valid', '0201');
INSERT INTO `t_sec_menu` VALUES (163, '文件管理', '文件管理', 155, 'sys_xfile', '/sys/xfile/index', NULL, NULL, 'valid', '0103');
INSERT INTO `t_sec_menu` VALUES (165, '业务模块', '自定义业务模块', NULL, '', NULL, NULL, 'inbox', 'valid', '03');
INSERT INTO `t_sec_menu` VALUES (167, '项目管理', '项目管理', 165, 'business_project', '/business/project/index', NULL, NULL, 'valid', '0301');
INSERT INTO `t_sec_menu` VALUES (168, '新闻管理', '新闻资讯管理', 165, 'business_news', '/business/news/index', NULL, NULL, 'valid', '0302');

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
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sec_role_privilege
-- ----------------------------
INSERT INTO `t_sec_role_privilege` VALUES (15, 4, '菜单管理', 'sec_menu', 'edit|delete|create|list');
INSERT INTO `t_sec_role_privilege` VALUES (26, 4, '管理员管理', 'sec_manager', 'delete|create|list|edit');
INSERT INTO `t_sec_role_privilege` VALUES (36, 4, '角色管理', 'sec_role', 'edit|delete|create|list');
INSERT INTO `t_sec_role_privilege` VALUES (37, 5, '项目管理', 'business_project', 'edit|delete|create|list');
INSERT INTO `t_sec_role_privilege` VALUES (38, 6, '项目管理', 'business_project', 'edit|delete|create|list');
INSERT INTO `t_sec_role_privilege` VALUES (39, 8, '项目管理', 'business_project', 'edit|delete|create|list');
INSERT INTO `t_sec_role_privilege` VALUES (40, 4, '新闻资讯管理', 'business_news', 'edit|delete|create|list');
INSERT INTO `t_sec_role_privilege` VALUES (42, 4, '项目管理', 'business_project', 'edit|delete|create|list');

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
  `create_date` datetime(0) NULL DEFAULT NULL,
  `status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `birthday` datetime(0) NULL DEFAULT NULL,
  `province` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_login_name`(`login_name`) USING BTREE,
  UNIQUE INDEX `unique_email`(`email`) USING BTREE,
  UNIQUE INDEX `unique_mobile`(`mobile`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 96 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sec_user
-- ----------------------------
INSERT INTO `t_sec_user` VALUES (52, 'admin', 'e10adc3949ba59abbe56e057f20f883e', '管理员', 'admin', 'status', '12345678911', NULL, '2018-04-19 13:30:57', 'valid', '2018-04-18 16:00:00', NULL);
INSERT INTO `t_sec_user` VALUES (54, 'student', 'e10adc3949ba59abbe56e057f20f883e', '学生', 'admin', '', '13366442927', NULL, '2018-04-27 16:16:38', 'valid', '2013-03-06 16:00:00', NULL);
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
  `create_date` datetime(0) NULL DEFAULT NULL,
  `is_deleted` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sys_xfile
-- ----------------------------
INSERT INTO `t_sys_xfile` VALUES (40, '20210508224901740.jpg', 'D:/workspace/IdeaProjects/Innovative/src/main/resources/static/files/upload/business/project/20210508224901740.jpg', '春兰.jpg', '/files/upload/business/project/20210508224901740.jpg', 178724, 52, '.jpg', '2021-05-08 14:49:20', NULL);
INSERT INTO `t_sys_xfile` VALUES (41, '20210508232904934.pdf', 'D:/workspace/IdeaProjects/Innovative/src/main/resources/static/files/upload/business/project/20210508232904934.pdf', '28道ZooKeeper面试题-已转档.pdf', '/files/upload/business/project/20210508232904934.pdf', 1590348, 52, '.pdf', '2021-05-08 15:29:49', NULL);
INSERT INTO `t_sys_xfile` VALUES (42, '20210508233400586.jpg', 'D:/workspace/IdeaProjects/Innovative/src/main/resources/static/files/upload/business/project/20210508233400586.jpg', '春兰.jpg', '/files/upload/business/project/20210508233400586.jpg', 178724, 52, '.jpg', '2021-05-08 15:34:05', NULL);
INSERT INTO `t_sys_xfile` VALUES (43, '2021050823370454.pdf', 'D:/workspace/IdeaProjects/Innovative/src/main/resources/static/files/upload/business/project/2021050823370454.pdf', '28道ZooKeeper面试题-已转档.pdf', '/files/upload/business/project/2021050823370454.pdf', 1590348, 52, '.pdf', '2021-05-08 15:37:46', NULL);
INSERT INTO `t_sys_xfile` VALUES (44, '20210508234401738.jpg', 'D:/workspace/IdeaProjects/Innovative/src/main/resources/static/files/upload/business/project/20210508234401738.jpg', '春兰.jpg', '/files/upload/business/project/20210508234401738.jpg', 178724, 52, '.jpg', '2021-05-08 15:44:18', NULL);
INSERT INTO `t_sys_xfile` VALUES (45, '20210508234905236.jpg', 'D:/workspace/IdeaProjects/Innovative/src/main/resources/static/files/upload/business/project/20210508234905236.jpg', '梅花.jpg', '/files/upload/business/project/20210508234905236.jpg', 122744, 52, '.jpg', '2021-05-08 15:49:52', NULL);
INSERT INTO `t_sys_xfile` VALUES (46, '20210508235204311.jpg', 'D:/workspace/IdeaProjects/Innovative/src/main/resources/static/files/upload/business/project/20210508235204311.jpg', '月季花.jpg', '/files/upload/business/project/20210508235204311.jpg', 54314, 52, '.jpg', '2021-05-08 15:52:43', NULL);
INSERT INTO `t_sys_xfile` VALUES (47, '20210509170700272.doc', 'D:/workspace/IdeaProjects/Innovative/src/main/resources/static/files/upload/business/project/20210509170700272.doc', '杜舒蕾毕业设计.doc', '/files/upload/business/project/20210509170700272.doc', 2285807, 54, '.doc', '2021-05-09 09:07:03', NULL);

SET FOREIGN_KEY_CHECKS = 1;
