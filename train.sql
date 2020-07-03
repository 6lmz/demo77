/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : train

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 04/07/2020 01:50:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (13, 'Can add user', 4, 'add_user');
INSERT INTO `auth_permission` VALUES (14, 'Can change user', 4, 'change_user');
INSERT INTO `auth_permission` VALUES (15, 'Can delete user', 4, 'delete_user');
INSERT INTO `auth_permission` VALUES (16, 'Can view user', 4, 'view_user');
INSERT INTO `auth_permission` VALUES (17, 'Can add content type', 5, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (18, 'Can change content type', 5, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (19, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (20, 'Can view content type', 5, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (21, 'Can add session', 6, 'add_session');
INSERT INTO `auth_permission` VALUES (22, 'Can change session', 6, 'change_session');
INSERT INTO `auth_permission` VALUES (23, 'Can delete session', 6, 'delete_session');
INSERT INTO `auth_permission` VALUES (24, 'Can view session', 6, 'view_session');
INSERT INTO `auth_permission` VALUES (25, 'Can add buy info', 7, 'add_buyinfo');
INSERT INTO `auth_permission` VALUES (26, 'Can change buy info', 7, 'change_buyinfo');
INSERT INTO `auth_permission` VALUES (27, 'Can delete buy info', 7, 'delete_buyinfo');
INSERT INTO `auth_permission` VALUES (28, 'Can view buy info', 7, 'view_buyinfo');
INSERT INTO `auth_permission` VALUES (29, 'Can add train info', 8, 'add_traininfo');
INSERT INTO `auth_permission` VALUES (30, 'Can change train info', 8, 'change_traininfo');
INSERT INTO `auth_permission` VALUES (31, 'Can delete train info', 8, 'delete_traininfo');
INSERT INTO `auth_permission` VALUES (32, 'Can view train info', 8, 'view_traininfo');
INSERT INTO `auth_permission` VALUES (33, 'Can add user', 9, 'add_user');
INSERT INTO `auth_permission` VALUES (34, 'Can change user', 9, 'change_user');
INSERT INTO `auth_permission` VALUES (35, 'Can delete user', 9, 'delete_user');
INSERT INTO `auth_permission` VALUES (36, 'Can view user', 9, 'view_user');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `first_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq`(`user_id`, `group_id`) USING BTREE,
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq`(`user_id`, `permission_id`) USING BTREE,
  INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_auth_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (7, 'front', 'buyinfo');
INSERT INTO `django_content_type` VALUES (8, 'front', 'traininfo');
INSERT INTO `django_content_type` VALUES (9, 'front', 'user');
INSERT INTO `django_content_type` VALUES (6, 'sessions', 'session');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2019-12-15 03:28:31.585108');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2019-12-15 03:28:34.827443');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2019-12-15 03:28:47.218256');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2019-12-15 03:28:49.983858');
INSERT INTO `django_migrations` VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2019-12-15 03:28:50.148418');
INSERT INTO `django_migrations` VALUES (6, 'contenttypes', '0002_remove_content_type_name', '2019-12-15 03:28:51.954586');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0002_alter_permission_name_max_length', '2019-12-15 03:28:53.395758');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0003_alter_user_email_max_length', '2019-12-15 03:28:54.482823');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0004_alter_user_username_opts', '2019-12-15 03:28:54.553673');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0005_alter_user_last_login_null', '2019-12-15 03:28:55.358481');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0006_require_contenttypes_0002', '2019-12-15 03:28:55.411339');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0007_alter_validators_add_error_messages', '2019-12-15 03:28:55.468189');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0008_alter_user_username_max_length', '2019-12-15 03:28:56.638058');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0009_alter_user_last_name_max_length', '2019-12-15 03:28:57.950549');
INSERT INTO `django_migrations` VALUES (15, 'auth', '0010_alter_group_name_max_length', '2019-12-15 03:28:59.670948');
INSERT INTO `django_migrations` VALUES (16, 'auth', '0011_update_proxy_permissions', '2019-12-15 03:28:59.738766');
INSERT INTO `django_migrations` VALUES (17, 'front', '0001_initial', '2019-12-15 03:29:01.963813');
INSERT INTO `django_migrations` VALUES (18, 'sessions', '0001_initial', '2019-12-15 03:29:02.733756');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('b74tiq1go9x2ceilp4a8iqws85xcz59d', 'MDVmNGUyMjQ2Y2FmZjYwM2FmZmM1YzVkYmI3NmJmODliMGQ4NGE4Zjp7InVuYW1lIjoicXEifQ==', '2020-01-06 02:42:16.830596');

-- ----------------------------
-- Table structure for front_buyinfo
-- ----------------------------
DROP TABLE IF EXISTS `front_buyinfo`;
CREATE TABLE `front_buyinfo`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tdata` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tno` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `startCity` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `startTime` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `arrCity` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `arrTime` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `seatSum` bigint(20) NOT NULL,
  `price` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of front_buyinfo
-- ----------------------------
INSERT INTO `front_buyinfo` VALUES (1, 'zz', '2019-12-17', 'D453', '成都', '07:12', '上海', '19:33', 1000, 1700);
INSERT INTO `front_buyinfo` VALUES (2, 'zz', '2019-12-17', 'D453', '成都', '07:12', '上海', '19:33', 1000, 1700);
INSERT INTO `front_buyinfo` VALUES (3, 'zz', '2019-12-17', 'G163', '成都', '07:50', '上海', '19:23', 1000, 1700);
INSERT INTO `front_buyinfo` VALUES (4, 'zz', '2019-12-17', 'D453', '成都', '07:12', '上海', '19:33', 1000, 1700);
INSERT INTO `front_buyinfo` VALUES (5, 'zz', '2019-12-17', 'D453', '成都', '07:12', '上海', '19:33', 1000, 1700);
INSERT INTO `front_buyinfo` VALUES (6, 'zz', '2019-12-17', 'D453', '成都', '07:12', '上海', '19:33', 1000, 1700);
INSERT INTO `front_buyinfo` VALUES (7, 'zz', '2019-12-17', 'G134', '成都', '10:12', '上海', '21:43', 1000, 1700);
INSERT INTO `front_buyinfo` VALUES (8, 'zz', '2019-12-14', 'G123', '成都', '08:00', '上海', '23:23', 1200, 700);
INSERT INTO `front_buyinfo` VALUES (9, 'zz', '2019-12-17', 'G123', '成都', '08:00', '北京', '23:23', 1200, 700);
INSERT INTO `front_buyinfo` VALUES (10, 'zz', '2019-12-17', 'G123', '成都', '08:00', '北京', '23:23', 1200, 700);
INSERT INTO `front_buyinfo` VALUES (11, 'zz', '2019-12-17', 'G123', '成都', '08:00', '北京', '23:23', 1200, 700);
INSERT INTO `front_buyinfo` VALUES (12, 'zz', '2019-12-17', 'G123', '成都', '08:00', '北京', '23:23', 1200, 700);
INSERT INTO `front_buyinfo` VALUES (13, 'zz', '2019-12-17', 'G123', '成都', '08:00', '北京', '23:23', 1200, 700);
INSERT INTO `front_buyinfo` VALUES (14, 'zz', '2019-12-17', 'G123', '成都', '08:00', '北京', '23:23', 1200, 700);
INSERT INTO `front_buyinfo` VALUES (15, 'zz', '2019-12-17', 'G123', '成都', '08:00', '北京', '23:23', 1200, 700);
INSERT INTO `front_buyinfo` VALUES (16, 'zz', '2019-12-17', 'K123', '成都', '08:00', '上海', '23:23', 2000, 700);
INSERT INTO `front_buyinfo` VALUES (17, 'zz', '2019-12-17', 'G134', '成都', '10:12', '上海', '21:43', 1000, 1700);
INSERT INTO `front_buyinfo` VALUES (18, 'zz', '2019-12-14', 'G123', '成都', '08:00', '上海', '23:23', 1200, 700);
INSERT INTO `front_buyinfo` VALUES (19, 'zz', '2019-12-14', 'G123', '成都', '08:00', '上海', '23:23', 1200, 700);
INSERT INTO `front_buyinfo` VALUES (20, 'zz', '2019-12-14', 'G123', '成都', '08:00', '上海', '18:23', 1200, 1100);

-- ----------------------------
-- Table structure for front_traininfo
-- ----------------------------
DROP TABLE IF EXISTS `front_traininfo`;
CREATE TABLE `front_traininfo`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tdata` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tno` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `startCity` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `arrCity` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `startTime` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `arrTime` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `seatSum` bigint(20) NOT NULL,
  `ticketStill` bigint(20) NOT NULL,
  `ticketBuy` bigint(20) NOT NULL,
  `price` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of front_traininfo
-- ----------------------------
INSERT INTO `front_traininfo` VALUES (2, '2019-12-14', 'G123', '成都', '上海', '09：23', '18：12', 1200, 1000, 200, 800);
INSERT INTO `front_traininfo` VALUES (3, '2019-12-14', 'K123', '成都', '上海', '08:00', '18:23', 900, 600, 300, 1100);
INSERT INTO `front_traininfo` VALUES (4, '2019-12-14', 'G123', '成都', '上海', '08:00', '23:23', 1200, 798, 402, 700);
INSERT INTO `front_traininfo` VALUES (6, '2019-12-14', 'K163', '成都', '上海', '07:00', '22:23', 2000, 500, 1500, 700);
INSERT INTO `front_traininfo` VALUES (7, '2019-12-14', 'G163', '成都', '上海', '07:50', '19:23', 1000, 500, 500, 1700);
INSERT INTO `front_traininfo` VALUES (8, '2019-12-14', 'G1623', '成都', '上海', '09:30', '21:23', 1000, 500, 500, 1700);
INSERT INTO `front_traininfo` VALUES (9, '2019-12-14', 'G134', '成都', '上海', '10:12', '21:43', 1000, 500, 500, 1700);
INSERT INTO `front_traininfo` VALUES (10, '2019-12-14', 'D453', '成都', '上海', '07:12', '19:33', 1000, 500, 500, 1700);
INSERT INTO `front_traininfo` VALUES (12, '2019-12-17', 'G134', '成都', '上海', '10:12', '21:43', 1000, 498, 502, 1700);
INSERT INTO `front_traininfo` VALUES (13, '2019-12-17', 'G1623', '成都', '上海', '09:30', '21:23', 1000, 500, 500, 1700);
INSERT INTO `front_traininfo` VALUES (14, '2019-12-17', 'G163', '成都', '上海', '07:50', '19:23', 1000, 499, 500, 1700);
INSERT INTO `front_traininfo` VALUES (15, '2019-12-17', 'K123', '成都', '上海', '08:00', '23:23', 2000, 799, 1201, 700);
INSERT INTO `front_traininfo` VALUES (16, '2019-12-17', 'G123', '成都', '上海', '08:00', '23:23', 1200, 800, 400, 700);
INSERT INTO `front_traininfo` VALUES (17, '2019-12-17', 'G123', '成都', '北京', '08:00', '23:23', 1200, 793, 407, 700);
INSERT INTO `front_traininfo` VALUES (18, '2019-12-17', 'K123', '成都', '北京', '08:00', '23:23', 2000, 800, 1200, 700);
INSERT INTO `front_traininfo` VALUES (19, '2019-12-14', 'G123', '成都', '北京', '08:00', '18:23', 1200, 800, 400, 1100);
INSERT INTO `front_traininfo` VALUES (20, '2019-12-14', 'K163', '成都', '北京', '07:00', '22:23', 2000, 500, 1500, 700);
INSERT INTO `front_traininfo` VALUES (21, '2019-12-14', 'G163', '成都', '北京', '07:50', '19:23', 1000, 500, 500, 1700);
INSERT INTO `front_traininfo` VALUES (22, '2019-12-28', 'G148', '北京', '上海', '09：21', '15：11', 1000, 700, 300, 700);
INSERT INTO `front_traininfo` VALUES (23, '2019-12-28', 'D1683', '北京', '上海', '09：23', '15：10', 1000, 800, 200, 700);
INSERT INTO `front_traininfo` VALUES (24, '2019-12-20', 'D897', '北京', '上海', '09：23', '15：10', 1000, 700, 300, 600);
INSERT INTO `front_traininfo` VALUES (25, '2019-12-20', 'D897', '北京', '上海', '09：23', '15：10', 1000, 700, 300, 600);
INSERT INTO `front_traininfo` VALUES (26, '2019-12-20', 'D897', '北京', '上海', '09：23', '15：10', 1000, 700, 300, 600);
INSERT INTO `front_traininfo` VALUES (27, '2019-12-28', 'D7865', '成都', '北京', '09：00', '16：23', 1000, 300, 700, 900);
INSERT INTO `front_traininfo` VALUES (28, '2019-12-14', 'D324', '成都', '北京', '09：11', '23：10', 1200, 1000, 200, 900);

-- ----------------------------
-- Table structure for front_user
-- ----------------------------
DROP TABLE IF EXISTS `front_user`;
CREATE TABLE `front_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ismanage` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `uname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `rname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sex` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `identity` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of front_user
-- ----------------------------
INSERT INTO `front_user` VALUES (1, 'yes', 'qq', '潇洒', '男', '234123199005233453', '12343235676', '111111');
INSERT INTO `front_user` VALUES (3, 'yes', 'xx', '惹人烦', '男', '234543199005234567', '12365478967', '111111');
INSERT INTO `front_user` VALUES (4, 'no', 'zz', '单个', '男', '234323199806245673', '14323456768', '111111');
INSERT INTO `front_user` VALUES (5, 'yes', 'll', '难道', '男', '362156198704237654', '12345676898', '111111');
INSERT INTO `front_user` VALUES (6, 'yes', 'ee', '啊啊设计费', '男', '475323199902172343', '18231234325', '111111');
INSERT INTO `front_user` VALUES (7, 'no', 'yy', '撒返回', '男', '521234199905231234', '12834543213', '111111');
INSERT INTO `front_user` VALUES (8, 'no', '00', '打飞机', '男', '234217199004231232', '12743212345', '111111');

SET FOREIGN_KEY_CHECKS = 1;
