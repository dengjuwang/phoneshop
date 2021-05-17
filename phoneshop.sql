/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 80020
Source Host           : localhost:3306
Source Database       : phoneshop

Target Server Type    : MYSQL
Target Server Version : 80020
File Encoding         : 65001

Date: 2021-05-04 13:59:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for app_admin
-- ----------------------------
DROP TABLE IF EXISTS `app_admin`;
CREATE TABLE `app_admin` (
  `admin_name` varchar(32) NOT NULL,
  `admin_pwd` varchar(32) NOT NULL,
  PRIMARY KEY (`admin_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of app_admin
-- ----------------------------
INSERT INTO `app_admin` VALUES ('admin', '123');
INSERT INTO `app_admin` VALUES ('admin1', '123');
INSERT INTO `app_admin` VALUES ('admin2', '123456');
INSERT INTO `app_admin` VALUES ('admin5', 'aaaa');
INSERT INTO `app_admin` VALUES ('admin7', '123');

-- ----------------------------
-- Table structure for app_advertise
-- ----------------------------
DROP TABLE IF EXISTS `app_advertise`;
CREATE TABLE `app_advertise` (
  `adv_id` int NOT NULL AUTO_INCREMENT,
  `adv_pic` varchar(100) NOT NULL,
  `adv_link` varchar(128) NOT NULL,
  PRIMARY KEY (`adv_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of app_advertise
-- ----------------------------

-- ----------------------------
-- Table structure for app_comment
-- ----------------------------
DROP TABLE IF EXISTS `app_comment`;
CREATE TABLE `app_comment` (
  `com_id` int NOT NULL AUTO_INCREMENT,
  `com_content` varchar(128) NOT NULL,
  `com_name_id` varchar(32) NOT NULL,
  `com_proid_id` int NOT NULL,
  PRIMARY KEY (`com_id`),
  KEY `app_comme_com_name_id_3b82eca8ef99b683_fk_app_userinfo_user_name` (`com_name_id`),
  KEY `app_comment_com_proid_id_716b37118d85bf05_fk_app_product_pro_id` (`com_proid_id`),
  CONSTRAINT `app_comme_com_name_id_3b82eca8ef99b683_fk_app_userinfo_user_name` FOREIGN KEY (`com_name_id`) REFERENCES `app_userinfo` (`user_name`),
  CONSTRAINT `app_comment_com_proid_id_716b37118d85bf05_fk_app_product_pro_id` FOREIGN KEY (`com_proid_id`) REFERENCES `app_product` (`pro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of app_comment
-- ----------------------------

-- ----------------------------
-- Table structure for app_favorite
-- ----------------------------
DROP TABLE IF EXISTS `app_favorite`;
CREATE TABLE `app_favorite` (
  `fav_id` int NOT NULL AUTO_INCREMENT,
  `fav_time` datetime(6) NOT NULL,
  `fav_pro_id` int NOT NULL,
  `user_name_id` varchar(32) NOT NULL,
  PRIMARY KEY (`fav_id`),
  KEY `app_favorite_fav_pro_id_4774e3a2bbb64db0_fk_app_product_pro_id` (`fav_pro_id`),
  KEY `app_favor_user_name_id_91bc9f274eec951_fk_app_userinfo_user_name` (`user_name_id`),
  CONSTRAINT `app_favor_user_name_id_91bc9f274eec951_fk_app_userinfo_user_name` FOREIGN KEY (`user_name_id`) REFERENCES `app_userinfo` (`user_name`),
  CONSTRAINT `app_favorite_fav_pro_id_4774e3a2bbb64db0_fk_app_product_pro_id` FOREIGN KEY (`fav_pro_id`) REFERENCES `app_product` (`pro_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of app_favorite
-- ----------------------------
INSERT INTO `app_favorite` VALUES ('19', '2021-04-08 03:21:33.834768', '21', 'aaa');

-- ----------------------------
-- Table structure for app_order
-- ----------------------------
DROP TABLE IF EXISTS `app_order`;
CREATE TABLE `app_order` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `order_time` datetime(6) NOT NULL,
  `order_bz` varchar(32) NOT NULL,
  `order_pro_id` int NOT NULL,
  `order_state_id` int NOT NULL,
  `user_name_id` varchar(32) NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `app_order_order_pro_id_1fcd02b9c61151cc_fk_app_product_pro_id` (`order_pro_id`),
  KEY `app_order_order_state_id_1343cdfa32c0ac19_fk_app_state_state_num` (`order_state_id`),
  KEY `app_orde_user_name_id_14eab91d33214bb1_fk_app_userinfo_user_name` (`user_name_id`),
  CONSTRAINT `app_orde_user_name_id_14eab91d33214bb1_fk_app_userinfo_user_name` FOREIGN KEY (`user_name_id`) REFERENCES `app_userinfo` (`user_name`),
  CONSTRAINT `app_order_order_pro_id_1fcd02b9c61151cc_fk_app_product_pro_id` FOREIGN KEY (`order_pro_id`) REFERENCES `app_product` (`pro_id`),
  CONSTRAINT `app_order_order_state_id_1343cdfa32c0ac19_fk_app_state_state_num` FOREIGN KEY (`order_state_id`) REFERENCES `app_state` (`state_num`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of app_order
-- ----------------------------
INSERT INTO `app_order` VALUES ('2', '2021-04-23 07:00:19.630214', '无', '11', '2', 'aaa');
INSERT INTO `app_order` VALUES ('3', '2021-04-08 06:52:32.509473', '无', '10', '2', 'djw');
INSERT INTO `app_order` VALUES ('4', '2021-04-05 14:42:03.242939', '无', '11', '1', 'djw');
INSERT INTO `app_order` VALUES ('5', '2021-04-08 06:52:22.841377', '无', '22', '2', 'djw');
INSERT INTO `app_order` VALUES ('7', '2021-04-16 02:23:37.425356', '无', '3', '2', 'qq646918449');
INSERT INTO `app_order` VALUES ('8', '2021-04-16 02:23:44.792217', '无', '22', '2', 'qq646918449');

-- ----------------------------
-- Table structure for app_prodeploy
-- ----------------------------
DROP TABLE IF EXISTS `app_prodeploy`;
CREATE TABLE `app_prodeploy` (
  `prode_id` int NOT NULL AUTO_INCREMENT,
  `prode_color` varchar(32) NOT NULL,
  `pro_ram` varchar(32) NOT NULL,
  `prode_price` int NOT NULL,
  `prode_proid_id` int NOT NULL,
  PRIMARY KEY (`prode_id`),
  KEY `app_prodep_prode_proid_id_6ae55c9664fbbd68_fk_app_product_pro_id` (`prode_proid_id`),
  CONSTRAINT `app_prodep_prode_proid_id_6ae55c9664fbbd68_fk_app_product_pro_id` FOREIGN KEY (`prode_proid_id`) REFERENCES `app_product` (`pro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of app_prodeploy
-- ----------------------------

-- ----------------------------
-- Table structure for app_product
-- ----------------------------
DROP TABLE IF EXISTS `app_product`;
CREATE TABLE `app_product` (
  `pro_id` int NOT NULL AUTO_INCREMENT,
  `pro_name` varchar(32) NOT NULL,
  `pro_description` varchar(108) NOT NULL,
  `pro_img` varchar(100) NOT NULL,
  `pro_price` int NOT NULL,
  `pro_type_id` int NOT NULL,
  PRIMARY KEY (`pro_id`),
  KEY `app_product_pro_type_id_7c47d257d741b0c4_fk_app_ptype_ptype_id` (`pro_type_id`),
  CONSTRAINT `app_product_pro_type_id_7c47d257d741b0c4_fk_app_ptype_ptype_id` FOREIGN KEY (`pro_type_id`) REFERENCES `app_ptype` (`ptype_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of app_product
-- ----------------------------
INSERT INTO `app_product` VALUES ('3', '小米10Ultra', '骁龙865|120W快充|120HZ', 'mi1.png', '5499', '3');
INSERT INTO `app_product` VALUES ('5', '小米11Ultra', '骁龙888|1.12GN2|67W快充', 'mi2.webp', '5999', '3');
INSERT INTO `app_product` VALUES ('6', '小米11 Pro', '1.12GN2|2K微曲面', 'mi3.webp', '4999', '3');
INSERT INTO `app_product` VALUES ('7', '小米MIX FOLD', '折叠大屏|液态镜头', 'mi4.webp', '9999', '3');
INSERT INTO `app_product` VALUES ('8', '小米11青春版', '轻薄', 'mi5.webp', '2299', '3');
INSERT INTO `app_product` VALUES ('9', '黑鲨4PRO', '120W快充', 'mi6.webp', '3999', '3');
INSERT INTO `app_product` VALUES ('10', '黑鲨4', '升降肩键', 'mi6.webp', '2499', '3');
INSERT INTO `app_product` VALUES ('11', '小米10s', '哈曼卡顿双扬声器', 'mi8.webp', '3299', '3');
INSERT INTO `app_product` VALUES ('12', 'Redmi K40 Pro', '骁龙888', 'mi9.webp', '2799', '3');
INSERT INTO `app_product` VALUES ('13', 'Redmi K40', '骁龙870', 'mi9.webp', '1999', '3');
INSERT INTO `app_product` VALUES ('14', '华为MATE40', '麒麟9000', 'hua1.png', '4999', '2');
INSERT INTO `app_product` VALUES ('15', '华为P40 pro', '麒麟990', 'hua2.png', '5299', '2');
INSERT INTO `app_product` VALUES ('16', '华为MATE30 pro', '麒麟990', 'hua3.png', '4899', '2');
INSERT INTO `app_product` VALUES ('17', '华为NOVA8', '麒麟810', 'hua4.png', '2999', '2');
INSERT INTO `app_product` VALUES ('18', '华为畅想20SE', '天机800U', 'hua5.png', '1999', '2');
INSERT INTO `app_product` VALUES ('19', '华为mate40保时捷', '麒麟810', 'hua6.png', '11999', '2');
INSERT INTO `app_product` VALUES ('20', '华为NOVA8 Pro', '麒麟810', 'hua7.png', '3999', '2');
INSERT INTO `app_product` VALUES ('21', '华为畅想10', '麒麟810', 'hua8.png', '1699', '2');
INSERT INTO `app_product` VALUES ('22', '华为MATE40 pro', '3D结构光', 'hua1.png', '6999', '2');
INSERT INTO `app_product` VALUES ('23', '华为NOVA7', '麒麟810', 'hua4.png', '3599', '2');
INSERT INTO `app_product` VALUES ('24', 'oppo findx3', '骁龙870', 'op1.png', '4499', '4');
INSERT INTO `app_product` VALUES ('25', 'oppo findx3 pro', '骁龙888', 'op1.png', '5499', '4');
INSERT INTO `app_product` VALUES ('26', 'oppo k7X', '骁龙765g', 'op2.png', '1699', '4');
INSERT INTO `app_product` VALUES ('27', 'oppo reno5', '天机800U', 'op4.png', '2999', '4');
INSERT INTO `app_product` VALUES ('28', 'oppo reno5 pro', '天机1000+', 'op4.png', '3999', '4');
INSERT INTO `app_product` VALUES ('29', 'oppo reno5 pro+', '骁龙865', 'op4.png', '4999', '4');
INSERT INTO `app_product` VALUES ('30', 'oppo k7', '骁龙780', 'op3.png', '1299', '4');

-- ----------------------------
-- Table structure for app_ptype
-- ----------------------------
DROP TABLE IF EXISTS `app_ptype`;
CREATE TABLE `app_ptype` (
  `ptype_id` int NOT NULL AUTO_INCREMENT,
  `ptype_name` varchar(32) NOT NULL,
  PRIMARY KEY (`ptype_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of app_ptype
-- ----------------------------
INSERT INTO `app_ptype` VALUES ('1', '苹果');
INSERT INTO `app_ptype` VALUES ('2', '华为');
INSERT INTO `app_ptype` VALUES ('3', '小米');
INSERT INTO `app_ptype` VALUES ('4', 'oppo');
INSERT INTO `app_ptype` VALUES ('5', 'vivo');
INSERT INTO `app_ptype` VALUES ('6', '三星');
INSERT INTO `app_ptype` VALUES ('7', '其他');

-- ----------------------------
-- Table structure for app_state
-- ----------------------------
DROP TABLE IF EXISTS `app_state`;
CREATE TABLE `app_state` (
  `state_num` int NOT NULL,
  `state_name` varchar(32) NOT NULL,
  PRIMARY KEY (`state_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of app_state
-- ----------------------------
INSERT INTO `app_state` VALUES ('1', '等待发货');
INSERT INTO `app_state` VALUES ('2', '已发货');
INSERT INTO `app_state` VALUES ('3', '已完成');

-- ----------------------------
-- Table structure for app_userinfo
-- ----------------------------
DROP TABLE IF EXISTS `app_userinfo`;
CREATE TABLE `app_userinfo` (
  `user_name` varchar(32) NOT NULL,
  `user_pwd` varchar(32) NOT NULL,
  `user_addr` varchar(32) NOT NULL,
  `user_zip` int NOT NULL,
  `user_phone` bigint DEFAULT NULL,
  `user_turename` varchar(32) NOT NULL,
  `user_sex` varchar(32) NOT NULL,
  `user_email` varchar(32) NOT NULL,
  PRIMARY KEY (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of app_userinfo
-- ----------------------------
INSERT INTO `app_userinfo` VALUES ('aaa', 'aaa', 'aaa', '111', '139', 'll', '男', '111');
INSERT INTO `app_userinfo` VALUES ('djw', '123', 'aaa', '111', '111', '11', '男', '111');
INSERT INTO `app_userinfo` VALUES ('djwaaa', '123456', 'aaaaaaaaaaaa', '214121', '13913587231', 'Juwang Deng', '男', '646918449@qq.com');
INSERT INTO `app_userinfo` VALUES ('qq646918449', 'www.baidu.com', '无', '214121', '13913587231', 'Juwang Deng', '男', '646918449@qq.com');

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_p_permission_id_27076ed9cf8915f_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_p_permission_id_27076ed9cf8915f_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permission_group_id_4aa5799c2f540a36_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  CONSTRAINT `auth__content_type_id_5a1fed7e5bbf5968_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('5', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('8', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('9', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can add user', '4', 'add_user');
INSERT INTO `auth_permission` VALUES ('11', 'Can change user', '4', 'change_user');
INSERT INTO `auth_permission` VALUES ('12', 'Can delete user', '4', 'delete_user');
INSERT INTO `auth_permission` VALUES ('13', 'Can add content type', '5', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('14', 'Can change content type', '5', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete content type', '5', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('16', 'Can add session', '6', 'add_session');
INSERT INTO `auth_permission` VALUES ('17', 'Can change session', '6', 'change_session');
INSERT INTO `auth_permission` VALUES ('18', 'Can delete session', '6', 'delete_session');
INSERT INTO `auth_permission` VALUES ('19', 'Can add userinfo', '7', 'add_userinfo');
INSERT INTO `auth_permission` VALUES ('20', 'Can change userinfo', '7', 'change_userinfo');
INSERT INTO `auth_permission` VALUES ('21', 'Can delete userinfo', '7', 'delete_userinfo');
INSERT INTO `auth_permission` VALUES ('22', 'Can add admin', '8', 'add_admin');
INSERT INTO `auth_permission` VALUES ('23', 'Can change admin', '8', 'change_admin');
INSERT INTO `auth_permission` VALUES ('24', 'Can delete admin', '8', 'delete_admin');
INSERT INTO `auth_permission` VALUES ('25', 'Can add ptype', '9', 'add_ptype');
INSERT INTO `auth_permission` VALUES ('26', 'Can change ptype', '9', 'change_ptype');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete ptype', '9', 'delete_ptype');
INSERT INTO `auth_permission` VALUES ('28', 'Can add product', '10', 'add_product');
INSERT INTO `auth_permission` VALUES ('29', 'Can change product', '10', 'change_product');
INSERT INTO `auth_permission` VALUES ('30', 'Can delete product', '10', 'delete_product');
INSERT INTO `auth_permission` VALUES ('31', 'Can add prodeploy', '11', 'add_prodeploy');
INSERT INTO `auth_permission` VALUES ('32', 'Can change prodeploy', '11', 'change_prodeploy');
INSERT INTO `auth_permission` VALUES ('33', 'Can delete prodeploy', '11', 'delete_prodeploy');
INSERT INTO `auth_permission` VALUES ('34', 'Can add state', '12', 'add_state');
INSERT INTO `auth_permission` VALUES ('35', 'Can change state', '12', 'change_state');
INSERT INTO `auth_permission` VALUES ('36', 'Can delete state', '12', 'delete_state');
INSERT INTO `auth_permission` VALUES ('37', 'Can add order', '13', 'add_order');
INSERT INTO `auth_permission` VALUES ('38', 'Can change order', '13', 'change_order');
INSERT INTO `auth_permission` VALUES ('39', 'Can delete order', '13', 'delete_order');
INSERT INTO `auth_permission` VALUES ('40', 'Can add comment', '14', 'add_comment');
INSERT INTO `auth_permission` VALUES ('41', 'Can change comment', '14', 'change_comment');
INSERT INTO `auth_permission` VALUES ('42', 'Can delete comment', '14', 'delete_comment');
INSERT INTO `auth_permission` VALUES ('43', 'Can add favorite', '15', 'add_favorite');
INSERT INTO `auth_permission` VALUES ('44', 'Can change favorite', '15', 'change_favorite');
INSERT INTO `auth_permission` VALUES ('45', 'Can delete favorite', '15', 'delete_favorite');
INSERT INTO `auth_permission` VALUES ('46', 'Can add advertise', '16', 'add_advertise');
INSERT INTO `auth_permission` VALUES ('47', 'Can change advertise', '16', 'change_advertise');
INSERT INTO `auth_permission` VALUES ('48', 'Can delete advertise', '16', 'delete_advertise');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) DEFAULT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES ('1', 'pbkdf2_sha256$20000$iPissLBblCol$jzGRydBnSOYt+en2lKBpJrfqcqIB7afPRsD+LVD1GBI=', '2021-05-04 05:24:02.438059', '1', 'admin', '', '', '123@qq.com', '1', '1', '2021-05-04 05:23:33.725806');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_34c8082ea6076b60_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_34c8082ea6076b60_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_5fe5a8728ae5306_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_u_permission_id_3325322bc21bde2a_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_u_permission_id_3325322bc21bde2a_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissi_user_id_48ba6c058789d5c5_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `djang_content_type_id_20724376ac848a1a_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_18cf158410566fdb_fk_auth_user_id` (`user_id`),
  CONSTRAINT `djang_content_type_id_20724376ac848a1a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_18cf158410566fdb_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_5d4b80d07a3c942c_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('8', 'app', 'admin');
INSERT INTO `django_content_type` VALUES ('16', 'app', 'advertise');
INSERT INTO `django_content_type` VALUES ('14', 'app', 'comment');
INSERT INTO `django_content_type` VALUES ('15', 'app', 'favorite');
INSERT INTO `django_content_type` VALUES ('13', 'app', 'order');
INSERT INTO `django_content_type` VALUES ('11', 'app', 'prodeploy');
INSERT INTO `django_content_type` VALUES ('10', 'app', 'product');
INSERT INTO `django_content_type` VALUES ('9', 'app', 'ptype');
INSERT INTO `django_content_type` VALUES ('12', 'app', 'state');
INSERT INTO `django_content_type` VALUES ('7', 'app', 'userinfo');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('4', 'auth', 'user');
INSERT INTO `django_content_type` VALUES ('5', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('6', 'sessions', 'session');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2021-04-03 12:24:06.803207');
INSERT INTO `django_migrations` VALUES ('2', 'auth', '0001_initial', '2021-04-03 12:24:07.273947');
INSERT INTO `django_migrations` VALUES ('3', 'admin', '0001_initial', '2021-04-03 12:24:07.400608');
INSERT INTO `django_migrations` VALUES ('4', 'app', '0001_initial', '2021-04-03 12:24:08.612367');
INSERT INTO `django_migrations` VALUES ('5', 'contenttypes', '0002_remove_content_type_name', '2021-04-03 12:24:08.734042');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0002_alter_permission_name_max_length', '2021-04-03 12:24:08.799866');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0003_alter_user_email_max_length', '2021-04-03 12:24:08.901594');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0004_alter_user_username_opts', '2021-04-03 12:24:08.917551');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0005_alter_user_last_login_null', '2021-04-03 12:24:08.978415');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0006_require_contenttypes_0002', '2021-04-03 12:24:08.983375');
INSERT INTO `django_migrations` VALUES ('11', 'sessions', '0001_initial', '2021-04-03 12:24:09.030268');
INSERT INTO `django_migrations` VALUES ('12', 'app', '0002_auto_20210405_1100', '2021-04-05 03:01:09.383614');
INSERT INTO `django_migrations` VALUES ('13', 'app', '0003_auto_20210415_1357', '2021-04-15 05:57:50.402903');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('0k8crzon3pd2vg8khwfle2yxyqiy53kl', 'NGJlMzNkYTk2ZGE5MmNjNTM4Yzg1N2QxZDFiODZkYzAwMmNiN2U1Nzp7InVzZXJuYW1lIjoiZGp3IiwiYWRtaW51c2VyIjoiYWRtaW4iLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZDgwNzc5M2YwN2ZkYTczYjE2NjY1ZDJmNThlMTNmNWUwZTllMjU0MCJ9', '2021-05-18 05:24:02.441478');
