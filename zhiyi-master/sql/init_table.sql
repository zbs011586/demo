/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50723
 Source Host           : localhost:3306
 Source Schema         : shadow_test

 Target Server Type    : MySQL
 Target Server Version : 50723
 File Encoding         : 65001

 Date: 28/05/2019 10:40:31
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_content
-- ----------------------------
DROP TABLE IF EXISTS `t_content`;
CREATE TABLE `t_content`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长的ID',
  `content_id` int(11) NOT NULL COMMENT '关键词ID',
  `title` varchar (255)  CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`Id`, `content_id`) USING BTREE,
  UNIQUE INDEX `content_id`(`content_id`) USING BTREE,
  FULLTEXT INDEX `content`(`content`) WITH PARSER `ngram`
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_content_location_rel
-- ----------------------------
DROP TABLE IF EXISTS `t_content_location_rel`;
CREATE TABLE `t_content_location_rel`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长的ID',
  `content_id` int(11) NOT NULL COMMENT '关键词ID',
  `province_id` int(2) NULL DEFAULT NULL COMMENT '省份ID',
  `city_id` int(2) NULL DEFAULT NULL COMMENT '市ID',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`Id`) USING BTREE,
  UNIQUE INDEX `content_id_provine_id_city_id`(`content_id`, `province_id`, `city_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_key
-- ----------------------------
DROP TABLE IF EXISTS `t_key`;
CREATE TABLE `t_key`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长的ID',
  `key_id` int(11) NOT NULL COMMENT '关键词ID',
  `key` varchar(0) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '关键词',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`Id`, `key_id`) USING BTREE,
  UNIQUE INDEX `key_id`(`key_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_key_content_rel
-- ----------------------------
DROP TABLE IF EXISTS `t_key_content_rel`;
CREATE TABLE `t_key_content_rel`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长的ID',
  `key_id` int(11) NOT NULL COMMENT '关键词ID',
  `content_id` int(11) NOT NULL COMMENT '内容ID',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`Id`) USING BTREE,
  UNIQUE INDEX `key_id_and_content_id`(`key_id`, `content_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_key_search_record
-- ----------------------------
DROP TABLE IF EXISTS `t_key_search_record`;
CREATE TABLE `t_key_search_record`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长的ID',
  `key_id` int(11) NOT NULL COMMENT '关键字ID',
  `times` int(11) NOT NULL DEFAULT 0 COMMENT '搜索次数',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_key_similar
-- ----------------------------
DROP TABLE IF EXISTS `t_key_similar`;
CREATE TABLE `t_key_similar`  (
  `Id` int(11) NOT NULL COMMENT '自增长的ID',
  `key_id` int(11) NOT NULL COMMENT '关键词ID',
  `similar_key_id` int(11) NULL DEFAULT NULL COMMENT '相似的关键词Id',
  `similarity` int(3) NULL DEFAULT NULL COMMENT '相似度（0-100）分，查询时会根据相似度查询关联的词',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`Id`, `key_id`) USING BTREE,
  UNIQUE INDEX `key_id_and_similar_key_id`(`key_id`, `similar_key_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_permission`;
CREATE TABLE `t_permission`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长的ID',
  `permmision_id` int(3) NOT NULL COMMENT '权限ID',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限名',
  `description` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限描述',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限访问路径',
  `perms` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `parent_id` int(3) NOT NULL COMMENT '父级权限ID',
  `type` int(1) NOT NULL COMMENT '类型  0-目录 1-菜单 2-按钮',
  `order_num` int(3) NOT NULL COMMENT '排序',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `status` int(1) NOT NULL COMMENT '状态：1有效；2删除',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`Id`, `permmision_id`) USING BTREE,
  UNIQUE INDEX `permission_id`(`permmision_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长的ID',
  `role_id` int(3) NOT NULL COMMENT '角色ID',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名',
  `description` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色描述',
  `status` int(1) NOT NULL COMMENT '状态：1有效；2删除',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`Id`, `role_id`) USING BTREE,
  UNIQUE INDEX `role_id`(`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_role_permission_rel
-- ----------------------------
DROP TABLE IF EXISTS `t_role_permission_rel`;
CREATE TABLE `t_role_permission_rel`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长的ID',
  `role_id` int(3) NOT NULL COMMENT '角色ID',
  `permission_id` int(3) NOT NULL COMMENT '权限ID',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`Id`) USING BTREE,
  UNIQUE INDEX `role_id_and_permission_id`(`role_id`, `permission_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_search_result_record
-- ----------------------------
DROP TABLE IF EXISTS `t_search_result_record`;
CREATE TABLE `t_search_result_record`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长的ID',
  `key_id` int(11) NULL DEFAULT NULL COMMENT '关键字ID',
  `key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关键字',
  `content_id` int(11) NULL DEFAULT NULL COMMENT '内容ID',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长的ID',
  `user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户的UUID，全局唯一',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱，如果需要邮箱登录，此字段必须有值',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电话',
  `sex` int(1) NOT NULL COMMENT '性别',
  `age` int(2) NOT NULL COMMENT '年龄',
  `status` int(1) NOT NULL DEFAULT 0 COMMENT '状态 1-正常  -1-限制 0-未激活',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`Id`, `user_id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id`) USING BTREE,
  UNIQUE INDEX `user_name`(`user_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;


DROP TABLE IF EXISTS `t_account`;
CREATE TABLE `t_account`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长的ID',
  `user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户的UUID，全局唯一',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码，加密方式：加盐哈希',
  `salt` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '加密盐值',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电话',
  `status` int(1) NOT NULL DEFAULT 0 COMMENT '状态 1-正常  -1-限制 0-未激活',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`Id`, `user_id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id`) USING BTREE,
  UNIQUE INDEX `user_name`(`user_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;


-- ----------------------------
-- Table structure for t_user_ext
-- ----------------------------
DROP TABLE IF EXISTS `t_user_ext`;
CREATE TABLE `t_user_ext`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长的ID',
  `user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户的UUID，全局唯一',
  `province_id` int(2) NULL DEFAULT NULL COMMENT '省份ID',
  `province` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份',
  `city_id` int(2) UNSIGNED NULL DEFAULT NULL COMMENT '市ID',
  `city` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '市',
  `district_id` int(3) NULL DEFAULT NULL COMMENT '区ID',
  `district` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '区',
  `address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `position` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职位',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`Id`, `user_id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_login_record
-- ----------------------------
DROP TABLE IF EXISTS `t_user_login_record`;
CREATE TABLE `t_user_login_record`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长的ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `time` datetime(0) NOT NULL COMMENT '登录时间',
  `ip` int(2) NULL DEFAULT NULL COMMENT '登录IP',
  `type` int(1) NOT NULL DEFAULT 0 COMMENT '登录类型  0-登录   1-退出',
  `browser` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '浏览器类型',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_role_rel
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role_rel`;
CREATE TABLE `t_user_role_rel`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长的ID',
  `user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  `role_id` int(3) NOT NULL COMMENT '角色ID',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`Id`) USING BTREE,
  UNIQUE INDEX `user_id_and_role_id`(`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_search_record
-- ----------------------------
DROP TABLE IF EXISTS `t_user_search_record`;
CREATE TABLE `t_user_search_record`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长的ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `key_id` int(11) NOT NULL COMMENT '关键字ID',
  `key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '关键字',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
