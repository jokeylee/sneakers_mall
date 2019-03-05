/*
 Navicat MySQL Data Transfer

 Source Server         : a
 Source Server Type    : MySQL
 Source Server Version : 50723
 Source Host           : localhost:3306
 Source Schema         : makeorder

 Target Server Type    : MySQL
 Target Server Version : 50723
 File Encoding         : 65001

 Date: 05/03/2019 18:48:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tag_weight` bigint(20) NOT NULL,
  `class_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, 'Nike', 1000, '品牌');
INSERT INTO `category` VALUES (2, '红色', 1000, '颜色');
INSERT INTO `category` VALUES (3, '38', 1000, '尺寸');
INSERT INTO `category` VALUES (4, 'adidas', 998, '品牌');
INSERT INTO `category` VALUES (5, '蓝色', 998, '颜色');
INSERT INTO `category` VALUES (6, '39', 998, '尺寸');

-- ----------------------------
-- Table structure for class_list
-- ----------------------------
DROP TABLE IF EXISTS `class_list`;
CREATE TABLE `class_list`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `class_weight` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of class_list
-- ----------------------------
INSERT INTO `class_list` VALUES (1, '品牌', 1000);
INSERT INTO `class_list` VALUES (2, '颜色', 998);
INSERT INTO `class_list` VALUES (3, '尺寸', 996);

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail`  (
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `product_price` decimal(10, 0) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `order_amount` decimal(10, 0) NOT NULL,
  `product_icon` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime(0) NOT NULL,
  PRIMARY KEY (`order_id`, `product_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_detail
-- ----------------------------
INSERT INTO `order_detail` VALUES (486, 16, 'adidas', 322, 1, 322, '../upload/pro_image/下载 (3).jpg', '2019-03-05 17:30:49');
INSERT INTO `order_detail` VALUES (487, 16, 'adidas', 322, 1, 322, '../upload/pro_image/下载 (3).jpg', '2019-03-05 17:34:15');
INSERT INTO `order_detail` VALUES (488, 16, 'adidas', 322, 1, 322, '../upload/pro_image/下载 (3).jpg', '2019-03-05 17:34:16');
INSERT INTO `order_detail` VALUES (489, 16, 'adidas', 322, 1, 322, '../upload/pro_image/下载 (3).jpg', '2019-03-05 17:34:26');
INSERT INTO `order_detail` VALUES (490, 16, 'adidas', 322, 1, 322, '../upload/pro_image/下载 (3).jpg', '2019-03-05 17:34:32');
INSERT INTO `order_detail` VALUES (491, 16, 'adidas', 322, 1, 322, '../upload/pro_image/下载 (3).jpg', '2019-03-05 17:36:10');
INSERT INTO `order_detail` VALUES (492, 16, 'adidas', 322, 1, 322, '../upload/pro_image/下载 (3).jpg', '2019-03-05 17:38:12');
INSERT INTO `order_detail` VALUES (493, 16, 'adidas', 644, 2, 644, '../upload/pro_image/下载 (3).jpg', '2019-03-05 17:38:33');
INSERT INTO `order_detail` VALUES (494, 16, 'adidas', 322, 1, 322, '../upload/pro_image/下载 (3).jpg', '2019-03-05 17:38:43');

-- ----------------------------
-- Table structure for orderlist
-- ----------------------------
DROP TABLE IF EXISTS `orderlist`;
CREATE TABLE `orderlist`  (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_address` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `order_amount` decimal(10, 0) NOT NULL,
  `order_status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime(0) NOT NULL,
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 495 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orderlist
-- ----------------------------
INSERT INTO `orderlist` VALUES (486, 2, 'jokey', '18706735516', 'China', 322, '0', '2019-03-05 17:30:49');
INSERT INTO `orderlist` VALUES (487, 2, 'jokey', '18706735516', 'China', 322, '0', '2019-03-05 17:34:15');
INSERT INTO `orderlist` VALUES (488, 2, 'jokey', '18706735516', 'China', 322, '0', '2019-03-05 17:34:16');
INSERT INTO `orderlist` VALUES (489, 2, 'jokey', '18706735516', 'China', 322, '0', '2019-03-05 17:34:26');
INSERT INTO `orderlist` VALUES (490, 2, 'jokey', '18706735516', 'China', 322, '0', '2019-03-05 17:34:32');
INSERT INTO `orderlist` VALUES (491, 2, 'jokey', '18706735516', 'China', 322, '0', '2019-03-05 17:36:10');
INSERT INTO `orderlist` VALUES (492, 2, 'jokey', '18706735516', 'China', 322, '0', '2019-03-05 17:38:12');
INSERT INTO `orderlist` VALUES (493, 2, 'jokey', '18706735516', 'China', 644, '0', '2019-03-05 17:38:33');
INSERT INTO `orderlist` VALUES (494, 2, 'jokey', '18706735516', 'China', 322, '0', '2019-03-05 17:38:43');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` decimal(10, 0) NOT NULL,
  `description` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `icon` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (15, 'nike2', 333, 'nike2', '../upload/pro_image/images (8).jpg');
INSERT INTO `product` VALUES (16, 'adidas', 322, 'adidas', '../upload/pro_image/下载 (3).jpg');

-- ----------------------------
-- Table structure for product_tag
-- ----------------------------
DROP TABLE IF EXISTS `product_tag`;
CREATE TABLE `product_tag`  (
  `product_id` int(11) NOT NULL,
  `class_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tag_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  INDEX `product_id`(`product_id`) USING BTREE,
  INDEX `class_name`(`class_name`) USING BTREE,
  INDEX `tag_name`(`tag_name`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_tag
-- ----------------------------
INSERT INTO `product_tag` VALUES (15, '品牌', 'Nike');
INSERT INTO `product_tag` VALUES (15, '颜色', '红色');
INSERT INTO `product_tag` VALUES (15, '尺寸', '38');
INSERT INTO `product_tag` VALUES (16, '品牌', 'adidas');
INSERT INTO `product_tag` VALUES (16, '颜色', '蓝色');
INSERT INTO `product_tag` VALUES (16, '尺寸', '39');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `passwd` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_grant` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 47 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '139', 'China', '男', 'admin', '管理员');
INSERT INTO `user` VALUES (2, 'jokey', '18706735516', 'China', '男', 'jokey', '用户');

SET FOREIGN_KEY_CHECKS = 1;
