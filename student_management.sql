/*
 Navicat Premium Data Transfer

 Source Server         : 段国磊1
 Source Server Type    : MySQL
 Source Server Version : 50738
 Source Host           : localhost:3306
 Source Schema         : student_management

 Target Server Type    : MySQL
 Target Server Version : 50738
 File Encoding         : 65001

 Date: 19/06/2024 17:10:31
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
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

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
) ENGINE = InnoDB AUTO_INCREMENT = 65 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `auth_permission` VALUES (25, 'Can add invitesign', 7, 'add_invitesign');
INSERT INTO `auth_permission` VALUES (26, 'Can change invitesign', 7, 'change_invitesign');
INSERT INTO `auth_permission` VALUES (27, 'Can delete invitesign', 7, 'delete_invitesign');
INSERT INTO `auth_permission` VALUES (28, 'Can view invitesign', 7, 'view_invitesign');
INSERT INTO `auth_permission` VALUES (29, 'Can add student', 8, 'add_student');
INSERT INTO `auth_permission` VALUES (30, 'Can change student', 8, 'change_student');
INSERT INTO `auth_permission` VALUES (31, 'Can delete student', 8, 'delete_student');
INSERT INTO `auth_permission` VALUES (32, 'Can view student', 8, 'view_student');
INSERT INTO `auth_permission` VALUES (33, 'Can add course_user', 9, 'add_course_user');
INSERT INTO `auth_permission` VALUES (34, 'Can change course_user', 9, 'change_course_user');
INSERT INTO `auth_permission` VALUES (35, 'Can delete course_user', 9, 'delete_course_user');
INSERT INTO `auth_permission` VALUES (36, 'Can view course_user', 9, 'view_course_user');
INSERT INTO `auth_permission` VALUES (37, 'Can add course', 10, 'add_course');
INSERT INTO `auth_permission` VALUES (38, 'Can change course', 10, 'change_course');
INSERT INTO `auth_permission` VALUES (39, 'Can delete course', 10, 'delete_course');
INSERT INTO `auth_permission` VALUES (40, 'Can view course', 10, 'view_course');
INSERT INTO `auth_permission` VALUES (41, 'Can add userinfo', 11, 'add_userinfo');
INSERT INTO `auth_permission` VALUES (42, 'Can change userinfo', 11, 'change_userinfo');
INSERT INTO `auth_permission` VALUES (43, 'Can delete userinfo', 11, 'delete_userinfo');
INSERT INTO `auth_permission` VALUES (44, 'Can view userinfo', 11, 'view_userinfo');
INSERT INTO `auth_permission` VALUES (45, 'Can add course_cords', 12, 'add_course_cords');
INSERT INTO `auth_permission` VALUES (46, 'Can change course_cords', 12, 'change_course_cords');
INSERT INTO `auth_permission` VALUES (47, 'Can delete course_cords', 12, 'delete_course_cords');
INSERT INTO `auth_permission` VALUES (48, 'Can view course_cords', 12, 'view_course_cords');
INSERT INTO `auth_permission` VALUES (49, 'Can add course_ sign', 13, 'add_course_sign');
INSERT INTO `auth_permission` VALUES (50, 'Can change course_ sign', 13, 'change_course_sign');
INSERT INTO `auth_permission` VALUES (51, 'Can delete course_ sign', 13, 'delete_course_sign');
INSERT INTO `auth_permission` VALUES (52, 'Can view course_ sign', 13, 'view_course_sign');
INSERT INTO `auth_permission` VALUES (53, 'Can add teacher', 14, 'add_teacher');
INSERT INTO `auth_permission` VALUES (54, 'Can change teacher', 14, 'change_teacher');
INSERT INTO `auth_permission` VALUES (55, 'Can delete teacher', 14, 'delete_teacher');
INSERT INTO `auth_permission` VALUES (56, 'Can view teacher', 14, 'view_teacher');
INSERT INTO `auth_permission` VALUES (57, 'Can add manager', 15, 'add_manager');
INSERT INTO `auth_permission` VALUES (58, 'Can change manager', 15, 'change_manager');
INSERT INTO `auth_permission` VALUES (59, 'Can delete manager', 15, 'delete_manager');
INSERT INTO `auth_permission` VALUES (60, 'Can view manager', 15, 'view_manager');
INSERT INTO `auth_permission` VALUES (61, 'Can add student_waring', 16, 'add_student_waring');
INSERT INTO `auth_permission` VALUES (62, 'Can change student_waring', 16, 'change_student_waring');
INSERT INTO `auth_permission` VALUES (63, 'Can delete student_waring', 16, 'delete_student_waring');
INSERT INTO `auth_permission` VALUES (64, 'Can view student_waring', 16, 'view_student_waring');

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
  `first_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES (1, 'pbkdf2_sha256$720000$joXpgpKsdsFqdRLORiXWKs$sLDGek7KUDuLdDWT64wWdm0dGh3SdRS9nuWpQEFakqk=', '2024-03-31 16:33:15.100784', 1, 'admin', '', '', '3197083782@qq.com', 1, 1, '2024-03-31 16:16:37.905543');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq`(`user_id`, `group_id`) USING BTREE,
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq`(`user_id`, `permission_id`) USING BTREE,
  INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

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
-- Records of django_admin_log
-- ----------------------------

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
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (6, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (10, 'web', 'course');
INSERT INTO `django_content_type` VALUES (12, 'web', 'course_cords');
INSERT INTO `django_content_type` VALUES (13, 'web', 'course_sign');
INSERT INTO `django_content_type` VALUES (9, 'web', 'course_user');
INSERT INTO `django_content_type` VALUES (7, 'web', 'invitesign');
INSERT INTO `django_content_type` VALUES (15, 'web', 'manager');
INSERT INTO `django_content_type` VALUES (8, 'web', 'student');
INSERT INTO `django_content_type` VALUES (16, 'web', 'student_waring');
INSERT INTO `django_content_type` VALUES (14, 'web', 'teacher');
INSERT INTO `django_content_type` VALUES (11, 'web', 'userinfo');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2024-03-31 14:07:41.450433');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2024-03-31 14:07:41.761775');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2024-03-31 14:07:41.828182');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2024-03-31 14:07:41.833199');
INSERT INTO `django_migrations` VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2024-03-31 14:07:41.838199');
INSERT INTO `django_migrations` VALUES (6, 'contenttypes', '0002_remove_content_type_name', '2024-03-31 14:07:41.892446');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0002_alter_permission_name_max_length', '2024-03-31 14:07:41.924450');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0003_alter_user_email_max_length', '2024-03-31 14:07:41.960312');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0004_alter_user_username_opts', '2024-03-31 14:07:41.966329');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0005_alter_user_last_login_null', '2024-03-31 14:07:41.994164');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0006_require_contenttypes_0002', '2024-03-31 14:07:41.995837');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0007_alter_validators_add_error_messages', '2024-03-31 14:07:42.000434');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0008_alter_user_username_max_length', '2024-03-31 14:07:42.032797');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0009_alter_user_last_name_max_length', '2024-03-31 14:07:42.065964');
INSERT INTO `django_migrations` VALUES (15, 'auth', '0010_alter_group_name_max_length', '2024-03-31 14:07:42.096028');
INSERT INTO `django_migrations` VALUES (16, 'auth', '0011_update_proxy_permissions', '2024-03-31 14:07:42.101054');
INSERT INTO `django_migrations` VALUES (17, 'auth', '0012_alter_user_first_name_max_length', '2024-03-31 14:07:42.132345');
INSERT INTO `django_migrations` VALUES (18, 'sessions', '0001_initial', '2024-03-31 14:07:42.154111');
INSERT INTO `django_migrations` VALUES (19, 'web', '0001_initial', '2024-03-31 18:10:12.588643');
INSERT INTO `django_migrations` VALUES (20, 'web', '0002_alter_teacher_college_alter_teacher_sex', '2024-03-31 21:31:38.974732');
INSERT INTO `django_migrations` VALUES (21, 'web', '0003_invitesign_allow_count_invitesign_count', '2024-03-31 21:37:18.223233');
INSERT INTO `django_migrations` VALUES (22, 'web', '0004_student_email_teacher_email', '2024-03-31 21:40:46.613662');
INSERT INTO `django_migrations` VALUES (23, 'web', '0005_alter_student_sex_alter_teacher_sex_and_more', '2024-04-01 11:46:38.081552');
INSERT INTO `django_migrations` VALUES (24, 'web', '0006_alter_student_sex_alter_teacher_sex', '2024-04-01 13:24:21.345409');
INSERT INTO `django_migrations` VALUES (25, 'web', '0007_manager_sex_teacher_profession_alter_student_sex_and_more', '2024-04-01 13:24:21.453743');
INSERT INTO `django_migrations` VALUES (26, 'web', '0008_remove_course_desc', '2024-04-01 15:21:17.710995');
INSERT INTO `django_migrations` VALUES (27, 'web', '0009_remove_course_day_remove_course_semester_and_more', '2024-04-01 16:16:05.161378');
INSERT INTO `django_migrations` VALUES (28, 'web', '0010_alter_course_join_counts', '2024-04-01 16:48:12.387668');
INSERT INTO `django_migrations` VALUES (29, 'web', '0011_course_sign_course_alter_course_sign_end_datetime', '2024-04-02 09:55:07.827099');
INSERT INTO `django_migrations` VALUES (30, 'web', '0012_alter_course_cords_sign_and_more', '2024-04-02 11:57:01.194216');
INSERT INTO `django_migrations` VALUES (31, 'web', '0013_alter_course_cords_course_sign', '2024-04-02 12:38:37.897520');
INSERT INTO `django_migrations` VALUES (32, 'web', '0014_alter_course_cords_course_sign', '2024-04-02 13:30:05.753983');
INSERT INTO `django_migrations` VALUES (33, 'web', '0015_student_waring', '2024-04-02 13:46:31.596359');
INSERT INTO `django_migrations` VALUES (34, 'web', '0016_alter_course_sign_course', '2024-04-03 23:23:05.661344');
INSERT INTO `django_migrations` VALUES (35, 'web', '0017_student_waring_course_alter_student_classes_and_more', '2024-04-03 23:23:05.722093');
INSERT INTO `django_migrations` VALUES (36, 'web', '0018_alter_student_waring_course', '2024-04-03 23:23:05.989865');
INSERT INTO `django_migrations` VALUES (37, 'web', '0019_alter_course_sign_course', '2024-04-03 23:23:06.142749');
INSERT INTO `django_migrations` VALUES (38, 'web', '0020_remove_student_waring_course', '2024-04-03 23:23:06.353794');
INSERT INTO `django_migrations` VALUES (39, 'web', '0021_student_waring_course', '2024-04-03 23:25:10.749900');
INSERT INTO `django_migrations` VALUES (40, 'web', '0022_course_user_danger_counts', '2024-04-05 10:29:02.988873');
INSERT INTO `django_migrations` VALUES (41, 'web', '0023_course_sign_code_alter_course_sign_loaction', '2024-04-08 18:25:31.226801');
INSERT INTO `django_migrations` VALUES (42, 'web', '0024_alter_course_sign_code_alter_course_sign_distance', '2024-04-08 19:11:08.186938');

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
INSERT INTO `django_session` VALUES ('0izn8jzcml211x2iw3b2e8pehlq9bock', 'eyJjYXB0Y2hfY29kZSI6Ik9hZk1oIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MH0:1rr7po:kDxBTxDQvOAV_h4soXQ7kZgpoNZlFQQ7D68l10l3vKU', '2024-04-01 10:56:44.646448');
INSERT INTO `django_session` VALUES ('0o2bazryvn86x42pj53p8yhmaf174e60', 'eyJjYXB0Y2hfY29kZSI6InZvWnQ2IiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MH0:1rsDhH:-iMjUxZgY81vzIx1kvygjv2Mm5vlClAQv-CNXVIvDHM', '2024-04-04 11:24:27.069974');
INSERT INTO `django_session` VALUES ('1w9sg2vedd38o3sntmcbp5ig6uhmaezo', 'eyJjYXB0Y2hfY29kZSI6IlpuY01tIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MCwidXNlcl9pZCI6NywibGV2ZWwiOjN9:1rs0Ql:H7tCqx6eYVVtfRTG_b5G61BmmAQu0Qyt7A3lHOKfx3I', '2024-04-03 21:14:31.921614');
INSERT INTO `django_session` VALUES ('1zt55eglkq78bttglm0qkx4oomuh1eju', 'eyJjYXB0Y2hfY29kZSI6IjllV3pvIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MH0:1sJqdH:qVz-nnOrmL0_zHzr-yAIbe2BCdb4JjmlegQ5yWLlGrw', '2024-06-19 16:26:31.008963');
INSERT INTO `django_session` VALUES ('2borzf3xzjfbi7kdbbe6xc134ywthys7', 'eyJjYXB0Y2hfY29kZSI6Ijd4ek5RIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MCwidXNlcl9pZCI6NywibGV2ZWwiOjN9:1rs015:ILPpV3BEyaBcmyaP7F7uNHmmh3ZTTOKL7FRB31DD-hw', '2024-04-03 20:47:59.236639');
INSERT INTO `django_session` VALUES ('38yjcfgpy33eyao5z3ri1dnq31u0xakl', 'eyJjYXB0Y2hfY29kZSI6IkZxY0dZIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MCwidXNlcl9pZCI6NywibGV2ZWwiOjN9:1rsIWZ:PM_3gvgWlZPS0kf9lppJiScXK3DCbI3OmHnxBzw_HYQ', '2024-04-04 16:33:43.411648');
INSERT INTO `django_session` VALUES ('3fiyr0yjobtqu1ut5o9fgn9unsf9tkti', 'eyJjYXB0Y2hfY29kZSI6Ilk3OGpmIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MCwidXNlcl9pZCI6NywibGV2ZWwiOjN9:1rrp1n:B2IoHmqOKEGRz-vCG2fxz79_aCj8CyuhhT-Rt6YBVp8', '2024-04-03 09:03:59.083421');
INSERT INTO `django_session` VALUES ('44mxf3axh4cnmbv2pw4ipchukcdylgbj', 'eyJjYXB0Y2hfY29kZSI6IkxSSW03IiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MH0:1rquBR:I1BYPg9P4G02WnafsfHy7xQ3d2QQrl16QYfUH4wU4pE', '2024-03-31 20:22:09.036049');
INSERT INTO `django_session` VALUES ('4b8lzwrnj482r29cryj289xafjwnle5h', 'eyJjYXB0Y2hfY29kZSI6InFiNUtSIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MH0:1rsDZV:9bqFYYqdvXkA5HSjfvqFs136nPpNQi9HBtUmCqZvAJ0', '2024-04-04 11:16:25.380964');
INSERT INTO `django_session` VALUES ('50esjhiz1yt3zcjx261e0iabcaodthj0', 'eyJfc2Vzc2lvbl9leHBpcnkiOjYwLCJjYXB0Y2hfY29kZSI6Ilc3elBDIiwidXNlcl9pZCI6NywibGV2ZWwiOjN9:1rrrPZ:qGTsm12cqiIV0vDEn_UK6y1Dfmo4tFCbxvo7WfeUC_w', '2024-04-03 11:36:41.199676');
INSERT INTO `django_session` VALUES ('5larlnnw1oxwep3dc9sq9xsrc5l07n5j', 'eyJjYXB0Y2hfY29kZSI6IkVyVmFBIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MH0:1rsBnJ:94mBdUlRkQTQGyjFqL9aKnRuuZWBkoz6aq7TKi0Cg7Q', '2024-04-04 09:22:33.247623');
INSERT INTO `django_session` VALUES ('5lyu6i8gw1pr05ripa29yp5wgwp1d73t', 'eyJjYXB0Y2hfY29kZSI6Im9RUzIzIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MH0:1sJpmF:NONVPH4evBXcfT9e7Fv9pklz0G06w6odffS1UK5XmOM', '2024-06-19 15:31:43.328757');
INSERT INTO `django_session` VALUES ('5x31yxthrpjbtvcquvicrvof6fmhzlqs', '.eJzFkEtPwzAQhP9K5XObxLHjmB65c-REqmrttZtAHshuTlX-O3bTA_QBCCH1tJK_2fHOHMgWxn29Hb1x2wbJmlCy_PymQL-ZPgJ8hX43JHro965RSZQkJ-qTpwFN-3jSfjGowddhW1PMLGc2xwdWaF0oAdJKlLwsQWmhEYxAk1lLlTZFQTkKTQEZilwIlCyadqYfffB6OVSkh85UZL2oSFWNUgE_Dk3DKLjUYQgmZRwlZxVZBmETTp9XLPiFhZWvG9PiCtr9LOhiCB8lFz-URX40y1l5aeaiWQw7o9G1M0kBu6ZPYxdpxOnMAfH5piTAk0w5A6jd2KnrJ_1D6Gm5-GvQaROhaTAymmX5NS-j-Y0roolf6WH3TWU7N4zvP3Q2a-5e2q-CnlfGzh_otCHTB4qrHlk:1rqqct:tcUxsUJnCmCGyn3VkldqmIypewDI0qkZF-kYguQ3Ynw', '2024-04-14 16:33:15.156260');
INSERT INTO `django_session` VALUES ('6lmcset77c84nugtlfws668srq9gv5y9', 'eyJjYXB0Y2hfY29kZSI6IjRtS3dLIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MCwidXNlcl9pZCI6NywibGV2ZWwiOjN9:1rsfaV:C19cDfHiFagXewGfW-4IGei8-JvEU_FXIqy0vOrwDoE', '2024-04-05 17:11:19.853412');
INSERT INTO `django_session` VALUES ('6oa6msiclyxqylavz3olwog7yhr7tghh', 'eyJjYXB0Y2hfY29kZSI6IkphdmpHIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MH0:1rsD6D:a-PE0O06a3Xt_rFjFMiOSQIsCsU1oHoPbfr1S8mM7qg', '2024-04-04 10:46:09.179538');
INSERT INTO `django_session` VALUES ('6oyk59st7qgfa7s3t58lr60t23pf8nq8', 'eyJjYXB0Y2hfY29kZSI6IkhpenkyIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MCwidXNlcl9pZCI6NywibGV2ZWwiOjN9:1rrzUR:7i43n_-pwDzXTFkMNUXtjS0FBHGnt_T8zH3ij-iTPa8', '2024-04-03 20:14:15.296802');
INSERT INTO `django_session` VALUES ('6uedgvlf0xew0vk6m00xh3fnzyupdyar', '.eJxNzL0KwyAYheF7ObNDQqoBb6JLR0GMfqGCNJJPS6T03vMzlC4H3mc4H3iXi39avwSCRrs_JEPAMjHH5WVpy3Ft0KoTqEyrjQF6FEj0pgQ9HJqDK3Q5Bvy6tHweXuX-OJZ0uqlyUsrUUfazqUrNt2Pl1OG7AzFVMEA:1rs0Ay:AT4tFu-7o2c_-4r60Q9UpXPF6M2WW96JOC4MmKoItl8', '2024-04-03 20:58:12.296015');
INSERT INTO `django_session` VALUES ('6yecy54s6z76xwguayun5abyw0723h8r', 'eyJjYXB0Y2hfY29kZSI6IndRa055IiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MCwidXNlcl9pZCI6NywibGV2ZWwiOjN9:1rryzs:YVC4klRnBThAG0iRYOTwSs8ehuvki_iFSATs6c4P_UI', '2024-04-03 19:42:40.345518');
INSERT INTO `django_session` VALUES ('76cg3tleufz58s2z7zl8vcvijjwa183b', 'eyJjYXB0Y2hfY29kZSI6IlZnZkFNIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MH0:1rsD9Z:W-kmxE2UDsAt6IknihpaDCXSS8cQxdY9jUA0TfNMh58', '2024-04-04 10:49:37.055573');
INSERT INTO `django_session` VALUES ('7dv7j7vindcun1flwjro2m5xpj48758r', 'eyJjYXB0Y2hfY29kZSI6ImJ3ZTVoIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MH0:1rrACi:cn5dbr1zb4IpQPZSqBAfgbPy8dA-9_HxHTwRk_1js4s', '2024-04-01 13:28:32.910867');
INSERT INTO `django_session` VALUES ('7hq6ztx1wcc0gj1wovz1mwrj9z011yay', 'eyJjYXB0Y2hfY29kZSI6IjhGTlh0IiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MCwidXNlcl9pZCI6NywibGV2ZWwiOjN9:1rrzSN:VlpISXQCeHemluT9gMYJs4FuRax4DEV4bMJZ-VzVa58', '2024-04-03 20:12:07.523184');
INSERT INTO `django_session` VALUES ('7wa3nuhtj3chu2p2fax4hhtisyjmxsyg', '.eJxNzLEKwyAUheF3ObODNI0NvkDmho6CGL0lgjQStTSEvHtqhtLlwP8NZ4M1MdtJ29kRJIb-MdzBoBOl5OeXpk_0ywopOENJtGjvIG8Mgd4UIJuvRmcynY4Ov85rrIdnmT_2OVRXpeO8UaW90FUVIZ5125FjPwATSC_W:1rs0KO:CP9GtMVSuVI8fmd1Ws_zEMBOmVsswTB7fnhZGrQU7rY', '2024-04-03 21:07:56.691908');
INSERT INTO `django_session` VALUES ('7yutbsrtz81z8rhshofn1339sm87xuvg', 'eyJjYXB0Y2hfY29kZSI6InE3WlFXIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MH0:1rsF9D:pnK9MQujO7d4mwikvgZHE1CA5-kuCQCwZSBbsifBeq8', '2024-04-04 12:57:23.301724');
INSERT INTO `django_session` VALUES ('835yxc1ujk48z4oebo7r9g6m3wzyv712', '.eJxNzL0KwyAYheF7ObODhNQWx1xBho6C-POFCJJI1LZSeu9NMpQuB95nOG84k4qbtVs9QWJo4_MOBp0p57Auml4pbA1ScIaaadPBQ_YMkR4UIbtdkzeFTkeHX5eWjsOzzB-HEg9X9WYnUvVquFVViKnf92I5Pl9DVDDW:1rrGoN:TSXwZYOIFvFQcvegP3-e_aP5pFIt9y1I5gZDA30_MDo', '2024-04-01 20:31:51.211680');
INSERT INTO `django_session` VALUES ('8b3njk5b4tj77jorm1tukfflwpnqkhis', 'eyJjYXB0Y2hfY29kZSI6ImZwRml4IiwiX3Nlc3Npb25fZXhwaXJ5Ijo4NjQwMCwidXNlcl9pZCI6MSwibGV2ZWwiOjF9:1sJpnw:U0TGVw1M99zqn-vLUxhEAr4TPvAvtH3wti4r4SK8bTk', '2024-06-20 15:32:28.752564');
INSERT INTO `django_session` VALUES ('92yylfmvxh77g5yrfqdujvdnnt6pw1va', 'eyJjYXB0Y2hfY29kZSI6Ikk0YzduIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MCwidXNlcl9pZCI6NywibGV2ZWwiOjN9:1rrrZv:UAsZIFpjSgSzgYIaxOldJx_I4y3Uc8pHX-1UbeRNang', '2024-04-03 11:47:23.909589');
INSERT INTO `django_session` VALUES ('a953l1n1kldcd9bkwttngbpypkytfgzw', 'eyJjYXB0Y2hfY29kZSI6Ikd1TGdFIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MCwidXNlcl9pZCI6MX0:1rquMd:XdvHHpJxDcoxfd4AQIwARjaF8fDGLdqsGmWnxHevXTg', '2024-03-31 20:33:43.073807');
INSERT INTO `django_session` VALUES ('ad2r4gm4d8bt0jw9eu7wpffrh879htos', 'eyJyZWdpc3Rlcl9sZXZlbCI6MywiX3Nlc3Npb25fZXhwaXJ5Ijo2MCwiY2FwdGNoX2NvZGUiOiJRSkZFQiJ9:1rsBox:V1NVrYRWX8kv8IjRI7O5LxelHDSIrReqEm3kVmoI2_A', '2024-04-04 09:24:15.738271');
INSERT INTO `django_session` VALUES ('agofbqo5rmnrogorljhwry070viq4uyi', 'eyJjYXB0Y2hfY29kZSI6IjFjQU9vIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MH0:1rrAB0:FVqUlxl7KUrDwCQzMrYXfPebKwHbkUjDtPfXCk6hA5c', '2024-04-01 13:26:46.715534');
INSERT INTO `django_session` VALUES ('akyaxfb1evnlwzt0w3yj4gr7fcp6yqvs', '.eJxNzEsKwyAUheG9nLEDKcYGF9BVCOLjhkqlkVwtDaV7z2NQOjnwf4PzQfS1xbuLcyIYcBluDwg4JuY8Px29a15WGC0FOtPicoJRAoVeVGAuu9bkG50OhV-3tR6HZ_k_zq0cbvsYJrL96mWwXetJ7TsEie8GO6Mwxw:1rrJOB:FQ4XfzyEiqJYUpplfKH8Ii-F6e_-AoUwho67OAuoI3Q', '2024-04-01 23:16:59.565035');
INSERT INTO `django_session` VALUES ('avw1nn92q1lukj9ute9kvj16cb55wgoq', 'eyJjYXB0Y2hfY29kZSI6IkVMUEZDIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MH0:1rquU5:skQfJ2K4yKWX5C0YUH2maHLy2Op-te29lOMy_fGgl7w', '2024-03-31 20:41:25.725652');
INSERT INTO `django_session` VALUES ('awmciio0mehrfd1b8avpkz4luqmfj23j', 'eyJjYXB0Y2hfY29kZSI6InNNdFVVIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MH0:1rsCvO:NvU8G02sQWv0ifzlz2tQcKdr9w2zj8CbL7MyV7Xk6Cw', '2024-04-04 10:34:58.308769');
INSERT INTO `django_session` VALUES ('b4xso4foyfhhowxfi7e4fe3oey2cjppb', 'eyJjYXB0Y2hfY29kZSI6InRWNm4xIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MH0:1rqrlh:thobxDtJyRkdlDVNP8DK3Zok2aga4ZNN8fgSJo7Tm8I', '2024-03-31 17:47:25.893887');
INSERT INTO `django_session` VALUES ('b76lrxkh7x9q25sem8c15dgos5ff5o4a', 'eyJjYXB0Y2hfY29kZSI6IlZ0ZzMxIiwiX3Nlc3Npb25fZXhwaXJ5Ijo4NjQwMCwidXNlcl9pZCI6NCwibGV2ZWwiOjJ9:1s760z:Q62MQ_ByLtoT83IiZlbRZC5LTDN8UivVp3dL9yTF7uw', '2024-05-16 12:13:17.564436');
INSERT INTO `django_session` VALUES ('bfb1v2eojnejmptccl20d4mk43eszgfo', '.eJxNjU0KwyAQhe8yaxdCqkk9R7ILiNUJHZAqUUNCyd2jgUJ37328ny-U6ExGTQ4UdMB-Ph8RK7md-cOUfeNzkUI85yKQD1XL5dHIi9ekTpgShY_GPdJ6gJKcgTUx27e2wbX2tISR2mjC9X7uGXjc0IPqzgsXkzA4:1rrxAB:NxO9NmkWUl9bcfIJgMCbvX1e84a0GpaI9OYeXD_7kak', '2024-04-03 17:45:11.335873');
INSERT INTO `django_session` VALUES ('bjaufbiheawf0drwr4cc3rmverkwyokn', 'eyJjYXB0Y2hfY29kZSI6Ind2RHo5IiwiX3Nlc3Npb25fZXhwaXJ5Ijo4NjQwMDAsInVzZXJfaWQiOjQsImxldmVsIjoyfQ:1rrAGA:JqHffuSOlTzL4wFwGrq_YytZq5c-Wu3thQXY_WNKyy8', '2024-04-11 13:31:06.970530');
INSERT INTO `django_session` VALUES ('bjkdm5jqv0w12gvzec1tzqv6kh4l788w', 'eyJjYXB0Y2hfY29kZSI6Im9abmU4IiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MH0:1rsF6F:RcuTZkO73r14uVuVXi5aILUc9cYndrDdNRuq_BYrLlM', '2024-04-04 12:54:19.543703');
INSERT INTO `django_session` VALUES ('c13b29jxpfmtgred1ikmk829y93ouuws', '.eJxNzL0KwyAYheF7ObODNNUE50y9BkGsfqWCJBI1P5Tee2uG0uXA-wznBWdTcU_jZk9Q2G5iHMBgMuUc5snQnsJyQEnOUDMtJnioniHSShGq-2ryttDp6PHrcqR2eJb941Bic10HzjtdxYWuukr5aCvuHO8PBHMvtw:1rrrp0:48qHuLMaH22NMvqkH4ociGHzIBEILlsrAF65TGoCmek', '2024-04-03 12:02:58.706402');
INSERT INTO `django_session` VALUES ('ce0agtn9w6fu4s7jx90leexntiidhhxx', 'eyJjYXB0Y2hfY29kZSI6Im5neWVoIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MCwidXNlcl9pZCI6NywibGV2ZWwiOjN9:1rrpwY:RP-SBNYjhhm3B_SWXBHWTnXlMxfvSIpZRNYv7KqNg50', '2024-04-03 10:02:38.478290');
INSERT INTO `django_session` VALUES ('cf3wwbverfcbx0ehjqit5kt0w7nj4255', '.eJxNzMsKwjAUhOF3mXUWodQoWfocgZDLqR4IJjSJtYjvbtuFuBn4v8W8EVxp4W5DjgSN5cr5BgFbqVbOD0uvwvMKraRArzRbjtCjQKInJehh0xJdo8Mx4NdtLfvhUe6PuaXdTb_4iUw_O-lNV2oatz15ic8XVIsw-A:1rrGlc:N0gBPttw9Qd_o3i9ANlltVI_MVvj7ahbdU2Dvqflwe4', '2024-04-01 20:29:00.922715');
INSERT INTO `django_session` VALUES ('cjl638zdjzq3cgcbo8hoi0972c2lh0um', 'eyJjYXB0Y2hfY29kZSI6IkhTTXRmIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MCwidXNlcl9pZCI6NywibGV2ZWwiOjN9:1rtnrY:1JEf-qZttiEdHKQZ5fkMKcLPWF7t_SoDTKnTmFzP9WE', '2024-04-08 20:13:36.643272');
INSERT INTO `django_session` VALUES ('cmuokvgs67t76o795uk7z6v1xpoq0t96', 'eyJjYXB0Y2hfY29kZSI6IjhjOHhyIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MH0:1rquEd:GhqhkBDJ5g4eahyrbCdlQ_u_N1OfXmKsfQsxByQM4Rk', '2024-03-31 20:25:27.047202');
INSERT INTO `django_session` VALUES ('csckrd9kv54ij8mxgijk8igpvq0gj205', 'eyJjYXB0Y2hfY29kZSI6IjFhRW5EIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MCwibGV2ZWwiOjJ9:1rqv9D:0dKBy5z62O2F-S4SAeP5IlMjf6bzGXUToPveOFvDsO8', '2024-03-31 21:23:55.933310');
INSERT INTO `django_session` VALUES ('cty3zvi5n6255spkef28rkvcqgju1lhb', 'eyJjYXB0Y2hfY29kZSI6InVQTzJXIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MCwidXNlcl9pZCI6NywibGV2ZWwiOjN9:1rs0OC:4vA5cpCHh9Tg5mbsv0FEZbDzUtLvqMBCSM-7VKmJjcw', '2024-04-03 21:11:52.123724');
INSERT INTO `django_session` VALUES ('cxukxgoc9xp2knx74jtl8b0dzn4giche', 'eyJjYXB0Y2hfY29kZSI6ImFUS1hzIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MCwidXNlcl9pZCI6MSwibGV2ZWwiOjF9:1rr7wX:WYX1FMMQeCM6L5_v11VhTtsujJn8BKiKgtPoBn-CcSE', '2024-04-01 11:03:41.229876');
INSERT INTO `django_session` VALUES ('d1hmr4ianblsr41xtc9ifgen5empo8sa', 'eyJsZXZlbCI6MiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MCwiY2FwdGNoX2NvZGUiOiI4d0JNdSJ9:1rqsOo:lAN_YqkrjHC5m1YvCfSGJTjDwrlrKA8WPfLd8oWTkLc', '2024-03-31 18:27:50.697471');
INSERT INTO `django_session` VALUES ('detgdhu1hethe3ohoafjte9qnelk0sdf', '.eJwVzE0KwyAURtG9fGMHtpg0uJCOBIn6JIKt4k9oCdl7zOTOzj1g19zspm1yBImpvHcHBl2p1pC-mn45lD_kgzP0SkUHBykYIu0UIZ8MPpXPkAO10OI9UX0xnlR_rdyoPs9ejE6G47wADXAjsg:1rrGKG:1vJYgQ3AQ9VlMOoJITnEOTa52eIqHL-izs3ZWv0t0PI', '2024-04-01 19:59:54.130844');
INSERT INTO `django_session` VALUES ('dgr2tl235r56j33rgso1eut876fwrqua', '.eJxNzLEKwyAUheF3ObODNI0pPkOHbl0EMXpLL0gjUUNDybunZihdDvzfcD7wLhX_tH4KBA2-3u4jBGymnHl6WXonnldoJQVqptlygB4EIi0UobuvpuAKHY4Bvy5raodHuT_mEpubepGyM7U_0dlUpR5t-1Fi2wEqPjAD:1rrxJ4:kR4pMPDd-JG_BXO7nZG8O6TgR7vsi6-33KWNcEMncP0', '2024-04-03 17:54:22.211520');
INSERT INTO `django_session` VALUES ('djt5u9cimmlgxroiq51e2i7yklltxc4k', 'eyJjYXB0Y2hfY29kZSI6ImhxSDgzIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MH0:1rsBp8:ADLDF53qyrF2Qyyapk4fG5Q-Pb6wp69UcBK1fwC9I5k', '2024-04-04 09:24:26.556205');
INSERT INTO `django_session` VALUES ('dyidux97xfyvbnjeegr86eolee387vzr', '.eJxNzLEOwiAUheF3OTMDsYKGt3BxIiEI10hC7E2BamP67pUOxuUk_zecD4LnGh4ujJFgcHkpvkLAFSoljU9Hb07TAqOlQCs0uRRhTgKZZsoww1c5-kq7Q-PXdeF-uJf_41Rzd9vOUg62qQMdbdP63lfdJNYNLHkwBw:1rrwqk:DkNNAiY_Nzwg_s6nnx3Ze7TaatULnkM6KFErsrauB10', '2024-04-03 17:25:06.831036');
INSERT INTO `django_session` VALUES ('dzomoeml8zzinim2soh8n31t79u4ofqk', 'eyJjYXB0Y2hfY29kZSI6ImlWZkJhIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MCwidXNlcl9pZCI6NywibGV2ZWwiOjN9:1rrrku:0xucPUZ_8jWrVFiCOqMNc7c3NQqKWeYpR7gEV_etces', '2024-04-03 11:58:44.913046');
INSERT INTO `django_session` VALUES ('e23yr2xek11bbyfkjcbeiwnc777drncv', 'eyJjYXB0Y2hfY29kZSI6ImlqbEdBIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MH0:1rqrVS:GhRzJq6C_Wd6LJWr6hZQbo46jQ6zl12_en1dlaS1Qzk', '2024-03-31 17:30:38.186420');
INSERT INTO `django_session` VALUES ('ea96o2eqy04ejktdidtg0z1ajv1pjsbo', 'eyJjYXB0Y2hfY29kZSI6ImFzZDV6IiwiX3Nlc3Npb25fZXhwaXJ5Ijo4NjQwMCwidXNlcl9pZCI6NCwibGV2ZWwiOjJ9:1rsEBP:HMQ6SGje8tQC3gx0HqVQeOWy8D3Z4YvXdaHlKia-DC4', '2024-04-05 11:54:35.453238');
INSERT INTO `django_session` VALUES ('ef2gtyc2f4y6lhyxr24882tc2kz1nl1n', '.eJxNzLEKwyAUheF3ObODNI0Jzn2B7oIYvSWCNBK1RErePTFD6XLg_4bzhTUx21nbxREktvp4VjDoRCn55a1pi36tkIIzlESr9g5yYAj0oQDZnRqdyXQ5Bvw619gOrzJ_7HNorsrIeadKf6O7KkK82vYTx34ASyIwRA:1rrwwK:U8v7SZhPQvuIZTjawavd3vSAIGfEitciDozZmtMaMoM', '2024-04-03 17:30:52.170635');
INSERT INTO `django_session` VALUES ('ega84ttotgdj154i5n661t09udcdsd8j', 'eyJjYXB0Y2hfY29kZSI6IkYxbGNWIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MH0:1rqrgh:FbcI0hNIkSFabviIwGHfk98-6-54kPWS8sNhk_xoYzA', '2024-03-31 17:42:15.634719');
INSERT INTO `django_session` VALUES ('eihlqejew9zfs30s92ux6wreihwsq4gf', '.eJxNzEEKwyAUhOG7zNqFJNUU972FIFZfqGCrRC0JIXdvzaJ0M_B_i9nhbK7uYVzyBAWxptsTDKZQKSG9DK05LBuU5Ayt0GKCh5oYIr0pQo1fzd5WOh0Tfl233A_Psn8cauyu25XzUTcx0EU3Kee-4s5xfAAyDjAT:1rrwy5:N3_q9dK4iWVUg4vHri5Izlia3EuP8tctqVzxz30-CsA', '2024-04-03 17:32:41.750736');
INSERT INTO `django_session` VALUES ('ekfsdhzrynlb8cn2h9d3412c4ex29y98', '.eJzFkEtPwzAQhP9K5XObxLHjmB65c-REqmrttZtAHshuTlX-O3bTA_QBCCH1tJK_2fHOHMgWxn29Hb1x2wbJmlCy_PymQL-ZPgJ8hX43JHro965RSZQkJ-qTpwFN-3jSfjGowddhW1PMLGc2xwdWaF0oAdJKlLwsQWmhEYxAk1lLlTZFQTkKTQEZilwIlCyadqYfffB6OVSkh85UZL2oSFWNUgE_Dk3DKLjUYQgmZRwlZxVZBmETTp9XLPiFhZWvG9PiCtr9LOhiCB8lFz-URX40y1l5aeaiWQw7o9G1M0kBu6ZPYxdpxOnMAfH5piTAk0w5A6jd2KnrJ_1D6Gm5-GvQaROhaTAymmX5NS-j-Y0roolf6WH3TWU7N4zvP3Q2a-5e2q-CnlfGzh_otCHTB4qrHlk:1rqqUY:Q7uhXyfJ7gaxnE_jR-f-5RPC8olQSBST6SPvdhwH-uI', '2024-04-14 16:24:38.892509');
INSERT INTO `django_session` VALUES ('euhkzutmr0kx9ntq1nqww8ynyimzvwpr', '.eJxNzL0KwyAYheF7ObODNK0prhlK70EQf75QQRqJGhJC7j0_Q-ly4H2Gs8KZVNxHu8ETJOjdvSwYdKacw_DVNKcwLpCCM9RMow4esmWINFGEbA5N3hS6HDf8uizpPLzK_HEo8XRVn7YnVVvDrapC9PdjH5Zj2wEmrDCe:1rsIQ5:Azo1Z-C3I6JdsuRrJ6DejtDTx8kHOzaq5Q776NwrcG8', '2024-04-04 16:27:01.975934');
INSERT INTO `django_session` VALUES ('f76xksw4s08bajiuafr381r4o6gyoj8j', 'eyJjYXB0Y2hfY29kZSI6InZ0a0lrIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MH0:1rr6eh:kSEnhbwe4tXJnmqhVxhkXTo5yC2uYC9Qhj_lvLg5oIM', '2024-04-01 09:41:11.535358');
INSERT INTO `django_session` VALUES ('fcoufwkmuj2b3u711gtqefu8og5yggzb', '.eJxNjU0KwyAQhe8yaxdpUifBbW9RBDE6oYI0ErU0Cbl7NFDo5sH7eD875GB1IuUsCGiB_XxaAxVyOf2HXfKVy8xHRJl7fptkRpzuRfnYlKSKFKOb34q-wS0rCGwYGB2SeSkz29p-Dt32qKORluu5Z-DpQx5Ed5wa1C_9:1rsInV:EHrR_M42hAT7NWhXA0jfee6_ugZXT5JBwQR2UwkTPho', '2024-04-04 16:51:13.741010');
INSERT INTO `django_session` VALUES ('fpt9dsl8qb9qviaf89osotv1scsthnvp', 'eyJjYXB0Y2hfY29kZSI6IldBeTdOIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MH0:1sJrBO:BiovajbymrXhTgCT_tZGpGjJUVxMjNb6k2g4Y7zarl8', '2024-06-19 17:01:46.185521');
INSERT INTO `django_session` VALUES ('gpn9kjyrvivy79ioi8w29hvoos25acfd', 'eyJjYXB0Y2hfY29kZSI6ImZtY1FlIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MCwidXNlcl9pZCI6NywibGV2ZWwiOjN9:1rtnv1:failqk_Hv3zbTsiVrU8-aLHn9gONIliY_LkQPfwFBuQ', '2024-04-08 20:17:11.352845');
INSERT INTO `django_session` VALUES ('gz2tjjb91uqwa0nbwv9nh474ivamcxqq', '.eJxNzM0KhCAYheF7OWsXMjUWXosg_nyVICWpQxFz71MthjYH3mdxDjiTipu0WzxBgrp-dGDQmXIOy6xpS2HdIRvBOUPNtOrgIVuGSB-KkK9TkzeFbkeDf5c9XZd3mQeHEi9XtbcDqdoZblUVYmjPfVuO7w9tnDEC:1rrSvI:Do3a87zKTlV9pXWmB_exHk9_yvY44IMX6Y0Vot6-ngc', '2024-04-02 10:26:48.234065');
INSERT INTO `django_session` VALUES ('h91h06f2f8puucewycxnnydoqyrbspf4', 'eyJjYXB0Y2hfY29kZSI6IldLUEhuIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MH0:1rsDMz:B280yQGuI9TY-79Oy1RHKZx-NsFYdazmZeCrzmplID0', '2024-04-04 11:03:29.085549');
INSERT INTO `django_session` VALUES ('hbzx275yj1uao1zogrzz5dlsuo2ypq9c', 'eyJjYXB0Y2hfY29kZSI6IlZmV3FYIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MCwibGV2ZWwiOjJ9:1rqvRg:YM2Y_PFUe3px4DSdYO74S8zVAq4z3KTZNRWvQfhFeqU', '2024-03-31 21:43:00.464843');
INSERT INTO `django_session` VALUES ('i51mvdnqh1mk22gouwkn4n2kikm6ldvr', 'eyJjYXB0Y2hfY29kZSI6IlVyZ3hCIiwiX3Nlc3Npb25fZXhwaXJ5Ijo4NjQwMCwidXNlcl9pZCI6NCwibGV2ZWwiOjJ9:1sJqZ4:n0DaFeG2wmEMRMOpcPm09hHwLaJ_Gtbw3bdiduU7LOE', '2024-06-20 16:21:10.283848');
INSERT INTO `django_session` VALUES ('iairwxuzorg9dxj2bb44cbwws8bucpme', '.eJxNzMsOwiAUhOF3mTULkhZUHkQ3TQjCMSUhlnDpReO7W7ow7ub_FvOGNbHYUdvJERTScn3dwKAz5eynp6Y1-rRBSc5QMyXtHdSJIdBMAarbNTpT6HB0-HXZYjs8yvyxL6H5UKUQl6EK4ud9y0ff5M7x-QJULjBh:1rrx5O:nUBqoW1joMRu1nl8e_ySQZwhTvMM4aExc-G2mmXwtm0', '2024-04-03 17:40:14.840769');
INSERT INTO `django_session` VALUES ('iczt89p3apf6vqcrdwn23utkkunbn5tq', 'eyJjYXB0Y2hfY29kZSI6IjBTWW9jIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MH0:1rqvyW:udYGWu4GbcUY5b7f4OCH8HpOnA1Q8zA5C2P4XwfQex4', '2024-03-31 22:16:56.062955');
INSERT INTO `django_session` VALUES ('io493ffrq4abuimvf53kmzhtt8g9w7gr', 'eyJjYXB0Y2hfY29kZSI6IjNrU2JtIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MH0:1rquT6:mUoNnQRNXHXUVjrWMHDmMrkWAH_B_cFKFAepVUzc_uo', '2024-03-31 20:40:24.508633');
INSERT INTO `django_session` VALUES ('ioearmv1n9rpezoc75z45z3slo4ttmo6', 'eyJjYXB0Y2hfY29kZSI6ImsyWjhWIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MH0:1rrnrK:7tDopn8YxNt9PZj1gv85HseKl7TbXukrZPIbYLyxR2A', '2024-04-03 07:49:06.316774');
INSERT INTO `django_session` VALUES ('itijlim9yv60aw3n88r2nyi6puo32vve', 'eyJyZWdpc3Rlcl9sZXZlbCI6MywiX3Nlc3Npb25fZXhwaXJ5Ijo2MCwiY2FwdGNoX2NvZGUiOiJETzd0QSJ9:1rsDeh:ZokkoZFhIe1RTpK3FbcPBVMaKyruEuuzgIMcLHSEGik', '2024-04-04 11:21:47.749808');
INSERT INTO `django_session` VALUES ('j39n85wwfidwi1b0guf5qn8yqxhxsmgq', 'eyJjYXB0Y2hfY29kZSI6Ilo0N2dlIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MCwidXNlcl9pZCI6NywibGV2ZWwiOjN9:1rrzpG:jncsCIWYCySBa3t3jAqPe6HdtnsXy3GQMOLj30x7kR8', '2024-04-03 20:35:46.830037');
INSERT INTO `django_session` VALUES ('jcha79iznuo26gd69edndn41lvrerpe4', 'eyJjYXB0Y2hfY29kZSI6InBIQ1JEIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MH0:1rr79i:-DTrKrNV2xkJIoslLFD-jWdaujm7PQdwDzHWFV-NUFM', '2024-04-01 10:13:14.160734');
INSERT INTO `django_session` VALUES ('johp6sp3dcugqxijvntf834in8zx4p3b', 'eyJjYXB0Y2hfY29kZSI6InV3UFNqIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MH0:1rt0ty:xKm-AvD_edi2SmlWFsQsSarSyXljl5i9XIPDFI-RTmQ', '2024-04-06 15:56:50.446194');
INSERT INTO `django_session` VALUES ('k03i6bp0gmlwkvfb63s0en52aywrorgq', '.eJxNzLEOwiAUheF3OTMDRkFlc3HxFZoQCrcpCbGkgLZp-u6WDqbb-b_hLLAmZttrOziCwuv76J9g0IlS8sNb0xT9OENJzlASjdo7qCtDoA8FqPOm0ZlMu-OEf-c51sO9zIF9DtWbIoW4N0UQv21bdpcqLcf6AyOtMAA:1sJqzK:YtTz1cAXTbgwHboy-dz3TI-qg6RA-godgo6HOFxVJIM', '2024-06-19 16:49:18.491478');
INSERT INTO `django_session` VALUES ('kigesgb8vbqne605y6wxwhxz3k7jtz06', 'eyJjYXB0Y2hfY29kZSI6IlVCY0doIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MH0:1rsDLS:E-SD7BGqn_EjQ2aLgoZkoASOrTeNEZV30NMk9vMYgwk', '2024-04-04 11:01:54.004136');
INSERT INTO `django_session` VALUES ('kxlc3bch8atayk5wkdg1mhsiiqtdqyui', 'eyJjYXB0Y2hfY29kZSI6IldCTEtEIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MCwidXNlcl9pZCI6NywibGV2ZWwiOjN9:1rsIUH:-d9Q0g1rc70s7-c-fmf9jH5nZGNsKv_hguB9hNyZbCc', '2024-04-04 16:31:21.004632');
INSERT INTO `django_session` VALUES ('mfmqt3vt3dp0hrcogcfcnr0g273etjdy', '.eJxNzEEKwyAUhOG7zNqFkGgSL9BlLxAQqy_0gTQStTSU3r0xi9Ld_N9i3vAuFX-3fg0EgwsPVwkBmylnXh-WXom3HUZLgZppsxxgBoFIT4ow3aEpuEKno8evy57a4Vnuj7nE5nPVSk1zVSTHY-ulb3KT-HwB_s4vuA:1rsIlW:FZxqrCecvju76UZEFrhSZtmQcwGuFUbqayLkIXmQ07o', '2024-04-04 16:49:10.337406');
INSERT INTO `django_session` VALUES ('mu6jjz0g8elyjxsexgvjkc2zwwifkkjw', 'eyJjYXB0Y2hfY29kZSI6IkJRU3E1IiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MH0:1rr7AY:B7sXQlTHGBLjMG9wxQoyyZ5TjsfpTa74L4nsF4yMy8k', '2024-04-01 10:14:06.662148');
INSERT INTO `django_session` VALUES ('neqn8lgxw9a4ytkl1kkwwot6w9guu1md', 'eyJjYXB0Y2hfY29kZSI6IkFTQ2piIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MH0:1rqu6D:jGWUnbQ9Is3j9EbCQY8q25VB-JN7AuNtAuqdBP11STk', '2024-03-31 20:16:45.572917');
INSERT INTO `django_session` VALUES ('nk8jga58zvc8zobhn8d3z44x6aafvmf2', 'eyJjYXB0Y2hfY29kZSI6Im1pdVBPIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MCwibGV2ZWwiOjJ9:1rqv5a:buEhF6_lQFW0zAs69qMO1XziKEObiZtkquhoNj48MVA', '2024-03-31 21:20:10.511546');
INSERT INTO `django_session` VALUES ('nkh48qee9zm2vgu86r1g2vbx2odv3t5h', 'eyJjYXB0Y2hfY29kZSI6IlhpaG05IiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MH0:1rqv7O:Abo9H3QL_Kjr4IHUkCKZQSXq9ilfbpyEJChq_TQnsTQ', '2024-03-31 21:22:02.914513');
INSERT INTO `django_session` VALUES ('noxahysdjfrapkongbsn8pxlkkvmuwcb', 'eyJjYXB0Y2hfY29kZSI6IjJSZjMxIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MCwidXNlcl9pZCI6MSwibGV2ZWwiOjF9:1rr7VM:JM5wuWztlMhuBIA5bFXC35G9syU6F2Q5aipUBkm1sGM', '2024-04-01 10:35:36.173280');
INSERT INTO `django_session` VALUES ('nqmjl6kc4x7m1y1ci97fps6zqrodtbst', 'eyJjYXB0Y2hfY29kZSI6IkVtVTRzIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MCwidXNlcl9pZCI6NywibGV2ZWwiOjN9:1rrpzn:ealsZUhko177LuUCfOpUTFh3Ba4Rq_85nE4msHm3qV8', '2024-04-03 10:05:59.493504');
INSERT INTO `django_session` VALUES ('nxsm6vfqsht535oi715pg6dg2h2t4xlp', 'eyJjYXB0Y2hfY29kZSI6InVpWkVXIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MH0:1rsDFP:aJ8bYTDQ0e-noznT6LoQ3k7FkrvUTdEipioCOmQm8Is', '2024-04-04 10:55:39.258114');
INSERT INTO `django_session` VALUES ('o79gg30hbmdsmflngpv352en65brjks0', 'eyJjYXB0Y2hfY29kZSI6Inc0dnNDIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MH0:1rquqQ:wP7Pj8VNV_KjG7Je5_FV2X-iTZ3bi-alXKCb162tWRk', '2024-03-31 21:04:30.098116');
INSERT INTO `django_session` VALUES ('ovz6mcct8o6ay4pz3f6etqfks4mab4py', 'eyJjYXB0Y2hfY29kZSI6IlZRNmtHIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MH0:1rqtpH:-WijfNA_Gsu1zRrmooSNOqNr6AoMS0DCWRp-9nZVIVU', '2024-03-31 19:59:15.557322');
INSERT INTO `django_session` VALUES ('p3qgg696xbjf90dnn35wyzp241uocz2e', 'eyJjYXB0Y2hfY29kZSI6Im1lTGt5IiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MCwibGV2ZWwiOjJ9:1rqvO3:eJEWKVOY71PCQ3fefOfSheHGrJa6jNeYyHHzFJ_-ifQ', '2024-03-31 21:39:15.966788');
INSERT INTO `django_session` VALUES ('p947ac7x2kpzfk652lhgfur72769hztx', 'eyJjYXB0Y2hfY29kZSI6ImRkQ1JsIiwiX3Nlc3Npb25fZXhwaXJ5Ijo4NjQwMCwidXNlcl9pZCI6NywibGV2ZWwiOjN9:1rsCLN:GQhskWiR4D_9HpR39ayEuyrEWJn4wFaSdKnAgJJ4AHU', '2024-04-05 09:56:45.756770');
INSERT INTO `django_session` VALUES ('pfpkvn4400yw97hl8y552gl1s9ima6en', 'eyJjYXB0Y2hfY29kZSI6ImpoREpaIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MCwibGV2ZWwiOjJ9:1rquQy:RW2rimp8zVKxWsejWOiojZJEiWlqTENbDxg4PML_R-w', '2024-03-31 20:38:12.202413');
INSERT INTO `django_session` VALUES ('pfya78qrnkxre86u2jp6ur9z3muod2np', '.eJxNzE0KwyAYhOG7zNqFkNQE1zmGIP58IRKJErU0lN69SRalm4H3WcwbzuTqFu2SJ0hMy7gmMOhCpYS0aXrlsB-QgjO0QrsOHnJgiPSkCNmdmr2pdDs6_Loe-Tq8y_xxqPFy1UY7k2qD4VY1Ieb-3Ifl-HwBOLMwww:1rsIh7:Fmyc2j5kE7cMN45LjXkNBDoDEZW0XQwoHelWChrFFAA', '2024-04-04 16:44:37.625052');
INSERT INTO `django_session` VALUES ('psf9ipqcy6l4fmde8z12nv57mppuyzbp', 'eyJjYXB0Y2hfY29kZSI6IndSQTV5IiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MCwidXNlcl9pZCI6MywibGV2ZWwiOjEsInJlZ2lzdGVyX2xldmVsIjozfQ:1rrnol:pWzOIw8Kgww33h2LEV5tOZ8TszYRvXtl3PnrW2M1pWs', '2024-04-03 07:46:27.086467');
INSERT INTO `django_session` VALUES ('pt8u1wmbck8epoqp04cotz4yc4h3ueeh', 'eyJjYXB0Y2hfY29kZSI6IlNPRGl1IiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MH0:1rrzqy:E2dXaUBgbbvNRL8dUlOZQJgOiQ-AZL4IZAYA_mWukks', '2024-04-03 20:37:32.608846');
INSERT INTO `django_session` VALUES ('q82ch0l3jbim8y90txu2rzhtymkojimp', '.eJxNzEEOgyAUhOG7zJoFiUKVfW9hQig8UxKiRKCRNL274sJ0N_-3mC-sidm-tV0dQaE-5RzAoBOl5NdF0x79VqEkZyiJNu0d1IMh0IcCVHdqdCbT5ehwd66xHV5l_tjn0HwqUohxKoL4cG45901eHL8DLqowFw:1rrz9B:a_aFBDk0gsHZJvkSKpR7uy0hQxnCz6xBGYVTMk0h0Es', '2024-04-03 19:52:17.619085');
INSERT INTO `django_session` VALUES ('qmnw6sdvb5o46ugdqnmhsg4dlb7xji1t', 'eyJjYXB0Y2hfY29kZSI6IkFVVVh0IiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MCwidXNlcl9pZCI6NywibGV2ZWwiOjN9:1rrzmg:OJe4UQOa3rfagnSLDfV70ypJxp1Pd--Yu_0W9-CxULA', '2024-04-03 20:33:06.684921');
INSERT INTO `django_session` VALUES ('qpboppxe6y1ehpz9kedy2nwa0ti6tmbz', 'eyJjYXB0Y2hfY29kZSI6ImVsclBiIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MH0:1rqueW:Aa57bg4QdmQlKe0l5ZVu-HTjwfGOR93p1Saw6DvKy0c', '2024-03-31 20:52:12.046628');
INSERT INTO `django_session` VALUES ('qxcrnd35e3mfyedjpalwxxi9x3x53nnc', 'eyJjYXB0Y2hfY29kZSI6ImlGdndDIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MCwidXNlcl9pZCI6NywibGV2ZWwiOjN9:1rrzyl:2aVhV5NO6K7B1VgmP6HM8LZOAXf-0U5c1wHnn3rWVSg', '2024-04-03 20:45:35.761740');
INSERT INTO `django_session` VALUES ('r5k3obtav95ogms6kvzobmyq0ww3v548', '.eJxNzEEOgyAUhOG7zJoFiUJbTtKFCUF4TTFEiEBT03h3xYXpbv5vMT9Yk4p9axsdQWF6jtGCQWfK2cdZ0zf5ZYWSnKFmWrR3UDeGQB8KUN2hyZlCp6PD1WVN7fAs88e-hOZDlUI8hiqI348tX32TkWPbAUbYMEc:1rrxMi:NgUimAE8W7C7_tGoAgcXCdK_tY8ahkIoxAEaA1H2-C0', '2024-04-03 17:58:08.556622');
INSERT INTO `django_session` VALUES ('rbe0zq3glkd4cda1061qmnq31i95iea3', 'eyJyZWdpc3Rlcl9sZXZlbCI6MywiX3Nlc3Npb25fZXhwaXJ5Ijo2MCwiY2FwdGNoX2NvZGUiOiJYaFZ0aCJ9:1rsDgg:-9ySePLlsr4eqsc25iBB0Hzuc0OtniCxOcvqP9_FskI', '2024-04-04 11:23:50.876626');
INSERT INTO `django_session` VALUES ('rbum0scynw897i6vnrojpgw3sft20gjl', 'eyJjYXB0Y2hfY29kZSI6Im83dlBRIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MH0:1rqsPJ:cdE0RzKFr1SP-rqJfEd_FDxJk8QFSRxE5J_CQ9173bQ', '2024-03-31 18:28:21.770450');
INSERT INTO `django_session` VALUES ('s0nb0i05cbf7kkqm045zi8z2qfgtqqeq', 'eyJjYXB0Y2hfY29kZSI6ImF6OVB4IiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MH0:1rqrt7:KrE5QpwE9-OIPRZjE1EruBUwuV9t3aROdFP6NJZPxoY', '2024-03-31 17:55:05.410050');
INSERT INTO `django_session` VALUES ('s0vd26lddyp0qzie9zmz6gtbuxxpi0c8', 'eyJjYXB0Y2hfY29kZSI6IlhEOWNsIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MH0:1sJqZI:5n27jH7xvYox023i7eYEZhPeo1TnAGmRtfxRy87n_tY', '2024-06-19 16:22:24.124112');
INSERT INTO `django_session` VALUES ('s3vb8z7020h05n63e8s8h876jco2gl8t', 'eyJjYXB0Y2hfY29kZSI6IlBRaWdRIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MH0:1rsBsd:b-DASbh6ulvTxGxfZtoelzfwLDXkqZ0gvJWVX3XCjns', '2024-04-04 09:28:03.429819');
INSERT INTO `django_session` VALUES ('s4ovwai3ojmct9yjr3rrxum9146tnuxa', 'eyJjYXB0Y2hfY29kZSI6ImJOTkM1IiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MH0:1rqrZD:BwejW0XaV5TKhrLCARDcdntQHKkCSmFQWYmJvBtGKSc', '2024-03-31 17:34:31.966875');
INSERT INTO `django_session` VALUES ('s703mtbici9be6jymqs4s6jwwvvsc7xv', 'eyJjYXB0Y2hfY29kZSI6InpRTk83IiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MH0:1rqunR:PXgy4CsarlbvNikiiSFnnoi9FTcIk2W5UHwzq9vQeHM', '2024-03-31 21:01:25.769908');
INSERT INTO `django_session` VALUES ('shysqu794n2ih1kfws2t2wtkxk2dcjkt', '.eJxNzLEKwyAUheF3ObODNI0Jbn2FzIJYvSGCJBK9paH03VszlC4H_m84L3iXq1-s3wJB4zZNrCBgC5USt9XSM8f9gFZSgAvtNgboQSDRgxJ099UcXKXTMeDX9cjt8Cz3x7Gm5oZHKTvD_YWuhpWa2_Z3ifcHEwAv1Q:1rrx2L:OpVyh9tL8bXhHG1vjEgt0yyHIfKUZ1yTUb3xK_nRsP8', '2024-04-03 17:37:05.463800');
INSERT INTO `django_session` VALUES ('sypcj4h9yhjnag3p236xt7wgf3k40y9w', '.eJxNzLEKwyAUheF3ObNDQusV3Dt16i6I0RsqSCNRQ0PpuzfJELoc-L_hfOBdrv5p_RQYGur2CHcI2MKlxOll-Z3jvEJTJ9AKzzYGaCWQeOEEfdk0B1f5cBDOrmveD49yfxxr2t00ORCZpmQ_mkY0XreVQ4fvDw1sL_s:1rtm95:cR-yMo6kkNtHnyZSgg2_3sZqs7iccfytxGbx8xeIVoA', '2024-04-08 18:23:35.837254');
INSERT INTO `django_session` VALUES ('t48mk7142vdensbzelqz1n0bf2vz7ibr', 'eyJjYXB0Y2hfY29kZSI6IkU0b2JLIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MH0:1rrA9q:5PICXW1LHoAT3pxNS_3JSTL_gcBKh2RWWYvcXnxDMYQ', '2024-04-01 13:25:34.809512');
INSERT INTO `django_session` VALUES ('tedpbfws9a0cz1cgytvir88gbrzhs4dy', 'eyJjYXB0Y2hfY29kZSI6IkJGZ1kwIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MH0:1rsDb0:TS7IqjcokzS5iZf1O901OTx1TVmZuu4iuHtBOIs8EVI', '2024-04-04 11:17:58.293580');
INSERT INTO `django_session` VALUES ('tlg5mdu6r06t89fo9087ofydycs6xj5r', 'eyJjYXB0Y2hfY29kZSI6IncyeUZ3IiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MH0:1rsDXr:6a-vkL32iUNjEsgK2D0nP0dfN7zR26UAsIxmbfKOpN4', '2024-04-04 11:14:43.959812');
INSERT INTO `django_session` VALUES ('u7hoz840qrub2g9d1ziru6q3ljqut25j', '.eJxNzEEOgyAUhOG7zJoFRqEtWxNPYUIQXlMSUolAo2m8e8WF6W7-bzFfWBOzfWk7O4JC0_TDCgadKCU_vzWt0S8blOQMJdGivYO6MQT6UIBqD43OZDodLa7OW6yHZ5k_9jlUH4sU4jEWQfx-bPnsqkwc-w_8HC-0:1rrzOL:bgGUlhWpPFmHDXh3c4Jf4KTAQCC7NbEhigwO7F8PLZY', '2024-04-03 20:07:57.863035');
INSERT INTO `django_session` VALUES ('u89l1yo40scmx7c4p304z1vehkol3h1g', 'eyJjYXB0Y2hfY29kZSI6IkFTOWdZIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MCwidXNlcl9pZCI6NywibGV2ZWwiOjN9:1rrzuh:mJeAIEPl9XBYN8zXcd0qw0usksw2-y1mEkooXDeyAFI', '2024-04-03 20:41:23.541289');
INSERT INTO `django_session` VALUES ('udr6y2igw4i733wcuv961xbz37ql2p45', 'eyJjYXB0Y2hfY29kZSI6Im03cjlRIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MCwidXNlcl9pZCI6NywibGV2ZWwiOjN9:1rsZdL:LzX0KF8qIlP-FRFakugUbqlRUSO8evcteB3-XOtmJRg', '2024-04-05 10:49:51.786718');
INSERT INTO `django_session` VALUES ('v71j0oht8z8zn3iiya3nn7hgf7of79ev', '.eJxNzMsKgzAUhOF3mXUWwWoseZCuAiGXIw2EGjxJUaTvXnVRuhn4v8XsCK7U8LRhjgQNVo9hhYBlYk7zy9Ja0rJB35SUAo1psSlC9wKZ3pShu0NLdJUuh8Kv61bOy6vcH6eaTzft7icybXTSm6bU1B87eInPF3W1MRM:1rsFvj:fgzwMflUN10uCAlsj5bMQnOdsNAX_19CzB5r5pbL4-Q', '2024-04-04 14:46:31.616741');
INSERT INTO `django_session` VALUES ('vlibhi23i69l8rvrjjto9mis96ry71m3', 'eyJjYXB0Y2hfY29kZSI6IjNxOEM1IiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MH0:1rqrk0:Y9-L7Ie3XRoRrkYDPTqeuC9emQpCd1fJrInj0WHrRrQ', '2024-03-31 17:45:40.921711');
INSERT INTO `django_session` VALUES ('w5tdzq4yxppjy6uok7pefslexxj7dtbh', 'eyJjYXB0Y2hfY29kZSI6IjdHbnV0IiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MH0:1rsCF2:zBawgpg7sHoj6mR7EBVOz-ck1LDo3ahEIbMnh_TxvCE', '2024-04-04 09:51:12.314847');
INSERT INTO `django_session` VALUES ('wdp7l7elx6211423sfke2vwcz9legayo', 'eyJjYXB0Y2hfY29kZSI6Ijh5S2pmIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MH0:1sJqII:0sUo0karkSkuyymfTXXYDFMUQbR5j4C1cYewS9VWPS0', '2024-06-19 16:04:50.827568');
INSERT INTO `django_session` VALUES ('wf68wxqazxzjdyoya0tjosoq1y195e52', 'eyJjYXB0Y2hfY29kZSI6IlBBV2Z0IiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MH0:1rsCd5:AYQIo0u6-kh5PDfmjC8qhwRQ-OvDAIcsLWRQ5m1QhcM', '2024-04-04 10:16:03.632692');
INSERT INTO `django_session` VALUES ('wi0o1cbfv0nydasodb4w3cxd3sj3x66d', 'eyJjYXB0Y2hfY29kZSI6IkFaRHM1IiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MH0:1rrA7z:B0by4CAGeI_bzeLL2hFlzhxSIuvGFc1z-8ybQtBR5Os', '2024-04-01 13:23:39.235277');
INSERT INTO `django_session` VALUES ('widcy55wpv8jlvdyrwdsq9r4p5w9n3i2', '.eJxNzEsKwyAUheG9nLEDG1Jb3EA3IYiPGypII7naJpTuvUkGIZMD_zc4XwRXanjaMEaCxvy4fBgClok5jS9Lc0nTAq2kQGOabIrQvUCmN2XobtUSXaXd0eHoupTtcC934lTz5qbd_UCm3Zz0pik19OtevcTvD0VUMNo:1rrGiJ:arQnjxrEGN1x7QtAfySmY2WHVcwKU4elPwFtynVjjOQ', '2024-04-01 20:25:35.208315');
INSERT INTO `django_session` VALUES ('wmbm6cga6msl94bti2eiww9illzvnx7x', '.eJxNzL0KgzAYheF7OXOGUG0qGV16Cx0CIT-fGAw1mKRUSu-96lBcDrzPcD5wJhU3ajd7gsTU9_cHGHSmnMP81PROYVkhG8E5Q8206OAhW4ZIL4qQl02TN4UOR4N_lzXtl0eZE4cSd1e1swOpejPcqirE0G57tRzfH2W5MPI:1rsIyl:wp-yq5LT6uL4H0VvRkdQYp5RKJ3YtXyewO1eL8kEo80', '2024-04-04 18:01:51.174949');
INSERT INTO `django_session` VALUES ('wtg7v2b0ziwbrjxu084nbhosvfvdnbqw', 'eyJjYXB0Y2hfY29kZSI6IklzNHZ3IiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MCwidXNlcl9pZCI6NywibGV2ZWwiOjN9:1rrpu7:SD7Qf92RGzf3u5X_f8pmu9CE_rkaZiBm5-ZYG6E7CqI', '2024-04-03 10:00:07.012756');
INSERT INTO `django_session` VALUES ('wwd2d82r2hw380u1djjab5n16bu1kqfr', '.eJxNzLEOgyAUheF3OTMDpgUrD9G5gwlBuEYSUolAU2N8d8Wh6Xb-bzgbrInZTtrOjqDQDs_xBQadKCU_vzV9o19WKMkZSqJFewfVMgT6UIC6nRqdyXQ5Gvw6r7EeXmX-2OdQvS9SiK4vgvjj3HK8Vxk49gMdQi_0:1rrzZp:00nbVib9da3vULpMNzeGh_Ee5Jg-DeQssTkGiRVXrM0', '2024-04-03 20:19:49.601690');
INSERT INTO `django_session` VALUES ('wxc4gcno3cigne6un2x15hvijeiju78u', 'eyJjYXB0Y2hfY29kZSI6IjV4ZFl2IiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MH0:1rrzvi:TFfLA8xAKnG_ZGdScqCsFRVvGLSjOSSmKe125qNkTeY', '2024-04-03 20:42:26.673670');
INSERT INTO `django_session` VALUES ('wxd5vy0qr05kbvb30nc2bnpijf4sxatv', 'eyJjYXB0Y2hfY29kZSI6IkJBa0FiIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MCwidXNlcl9pZCI6NywibGV2ZWwiOjN9:1rsZes:qDhPS38Grenn9rvQdGqMkFrHEL1ArJCeUnnG9_06Vbo', '2024-04-05 10:51:26.413079');
INSERT INTO `django_session` VALUES ('wxuekuwhdsb9uo26ryuzlp77sfzq1dij', 'eyJjYXB0Y2hfY29kZSI6IkpSZlBXIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MCwidXNlcl9pZCI6NywibGV2ZWwiOjN9:1rrox9:JYY6zElA65h739J7dIb1Tjy1leNXPwIXV8Z-RWgyifc', '2024-04-03 08:59:11.186173');
INSERT INTO `django_session` VALUES ('x3fe1so7jzg5ob1i1yobgc040wknqlrk', '.eJyrViotSEksSY3PTFGyUjJR0oHxSyoLUoEiYF4iknBmSQ5IPKbUIiktNabUPNEgKabUzCzNBEiaJhkAVSYnFpQkZ8Qn56eAFEY6mfp5AEXji1OLizPz8-JTKwoyiyqVrIzNDAyAxhanFoHtNtFRykktS81RsjKqBQCMZDDL:1rrJVf:_cQDN4HQLiIThuz7Ue6QmTrNfXrMB_i925372MLkeo4', '2024-04-02 00:23:43.776504');
INSERT INTO `django_session` VALUES ('x8igjkl285njbkym39qez4zgvzg7y4um', 'eyJjYXB0Y2hfY29kZSI6InNrcWo3IiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MCwidXNlcl9pZCI6NywibGV2ZWwiOjN9:1rrpnR:gZReKMTaISTQoyAgFA_LkpgH3C8s7lLK8wiXC_wG34U', '2024-04-03 09:53:13.284555');
INSERT INTO `django_session` VALUES ('xbakbo66h0ryyv527v8kqx9bs4xxtrtm', 'eyJjYXB0Y2hfY29kZSI6IjhTVFRRIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MH0:1rr7kD:p8ztDIxLKaP2biuay0LWP7XC5uAmU5GzUHI9I1rfwx4', '2024-04-01 10:50:57.417504');
INSERT INTO `django_session` VALUES ('y28utks253pej8gd7ai7n183xg6q55vg', 'eyJsZXZlbCI6MiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MCwiY2FwdGNoX2NvZGUiOiJucWRxbyJ9:1rquyO:GP8sJkBfuhwAmSDf2st-xn4Wx7NQUoGZkL5zH3yJLAw', '2024-03-31 21:12:44.555305');
INSERT INTO `django_session` VALUES ('yg69oz2ld26wd7li61o890ejgbmbgiux', 'eyJjYXB0Y2hfY29kZSI6IkhlVEpNIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MCwidXNlcl9pZCI6NywibGV2ZWwiOjN9:1rrq5O:HN5xPOdKC2Getlnr834ZhfF-hHla7EAjwlk1pBIQjo0', '2024-04-03 10:11:46.778640');
INSERT INTO `django_session` VALUES ('ysl2xnx54nm5iui7zzcvntfkp8nx6dbe', 'eyJjYXB0Y2hfY29kZSI6IjQ4MkFlIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MCwidXNlcl9pZCI6NywibGV2ZWwiOjN9:1rsffZ:oh5LdmCKQropnexTaAsdjdE8aUhi8pWL5wpECbARkBk', '2024-04-05 17:16:33.832621');
INSERT INTO `django_session` VALUES ('ytka5pkhkgea9m8dg8c2cjyonx21yebb', 'eyJjYXB0Y2hfY29kZSI6IkRXaFZCIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MCwidXNlcl9pZCI6NywibGV2ZWwiOjN9:1rrrMW:7bHNt5JkEsnygfhdeYXlLbbV3Qgu4IfmuPzOUxDqtps', '2024-04-03 11:33:32.416332');
INSERT INTO `django_session` VALUES ('yw3tnoz7mxzdphess7mbe3jstc4pekjx', '.eJxNzEEKwyAUBNC7zNqFNNU2niEnKAGx-ksESSRq2lB692oWpbuZNzBvWBOznbRdHEHhOYjbCQw6UUp-mTW9ol93qE5yzlASrdo7qAtDoI1CHapGZzIdjg6_nvfYLo9m_tjn0HwsUoh-LIL4tWb5ODe5c3y-U_0wOA:1rrxbB:cE0dYz6U8h5GiiT1O-_pfj3jwYzSxzJQslaiyq7OHto', '2024-04-03 19:12:05.279264');
INSERT INTO `django_session` VALUES ('zi4p1w70np2fw0q7mylkt2z87gwx1e2d', 'eyJjYXB0Y2hfY29kZSI6IlQ3c0pwIiwiX3Nlc3Npb25fZXhwaXJ5Ijo2MH0:1rqreN:rsqMRJ7uRbb31tYwgs6nXXKhUIW_p51edGQe_Vm85ZE', '2024-03-31 17:39:51.060541');

-- ----------------------------
-- Table structure for web_course
-- ----------------------------
DROP TABLE IF EXISTS `web_course`;
CREATE TABLE `web_course`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `counts` int(11) NOT NULL,
  `join_counts` int(11) NOT NULL,
  `classroom` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_datetime` datetime(6) NOT NULL,
  `teacher_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `web_course_teacher_id_e065965c_fk_web_teacher_id`(`teacher_id`) USING BTREE,
  CONSTRAINT `web_course_teacher_id_e065965c_fk_web_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `web_teacher` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of web_course
-- ----------------------------
INSERT INTO `web_course` VALUES (2, '数学', 10, 2, '西北101', '2024-04-01 16:40:58.515347', 2);
INSERT INTO `web_course` VALUES (3, '离散数学', 8, 3, '中心101', '2024-04-01 17:02:08.293704', 2);
INSERT INTO `web_course` VALUES (4, '计算机', 10, 3, '中心120', '2024-04-01 18:29:55.104896', 2);
INSERT INTO `web_course` VALUES (6, '习近平思想', 6, 2, '教学区300', '2024-04-02 09:24:21.646438', 2);
INSERT INTO `web_course` VALUES (8, '英语', 100, 1, '西北210', '2024-04-05 14:55:47.491029', 1);

-- ----------------------------
-- Table structure for web_course_cords
-- ----------------------------
DROP TABLE IF EXISTS `web_course_cords`;
CREATE TABLE `web_course_cords`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sign` int(11) NOT NULL,
  `create_datetime` datetime(6) NOT NULL,
  `course_sign_id` bigint(20) NULL DEFAULT NULL,
  `student_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `web_course_cords_student_id_31f56a83_fk_web_student_id`(`student_id`) USING BTREE,
  INDEX `web_course_cords_course_sign_id_fe4cdc54_fk_web_course_sign_id`(`course_sign_id`) USING BTREE,
  CONSTRAINT `web_course_cords_course_sign_id_fe4cdc54_fk_web_course_sign_id` FOREIGN KEY (`course_sign_id`) REFERENCES `web_course_sign` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `web_course_cords_student_id_31f56a83_fk_web_student_id` FOREIGN KEY (`student_id`) REFERENCES `web_student` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of web_course_cords
-- ----------------------------
INSERT INTO `web_course_cords` VALUES (4, 1, '2024-04-02 12:39:00.000000', 4, 1);
INSERT INTO `web_course_cords` VALUES (8, 1, '2024-04-02 18:35:30.221688', 7, 2);
INSERT INTO `web_course_cords` VALUES (9, 1, '2024-04-05 13:13:42.293061', 14, 1);
INSERT INTO `web_course_cords` VALUES (10, 1, '2024-04-08 19:20:30.861402', 21, 1);
INSERT INTO `web_course_cords` VALUES (11, 1, '2024-06-19 16:38:41.183608', 24, 1);
INSERT INTO `web_course_cords` VALUES (12, 1, '2024-06-19 16:44:53.755436', 24, 2);

-- ----------------------------
-- Table structure for web_course_sign
-- ----------------------------
DROP TABLE IF EXISTS `web_course_sign`;
CREATE TABLE `web_course_sign`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_datetime` datetime(6) NOT NULL,
  `end_datetime` datetime(6) NOT NULL,
  `sign_counts` int(11) NOT NULL,
  `loaction` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `distance` int(11) NULL DEFAULT NULL,
  `creator_id` bigint(20) NOT NULL,
  `course_id` bigint(20) NOT NULL,
  `code` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `web_course_sign_creator_id_3b37af19_fk_web_teacher_id`(`creator_id`) USING BTREE,
  INDEX `web_course_sign_course_id_9b604bac_fk_web_course_id`(`course_id`) USING BTREE,
  CONSTRAINT `web_course_sign_creator_id_3b37af19_fk_web_teacher_id` FOREIGN KEY (`creator_id`) REFERENCES `web_teacher` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of web_course_sign
-- ----------------------------
INSERT INTO `web_course_sign` VALUES (4, '2024-04-02 12:18:03.313703', '2024-04-02 15:00:00.000000', 1, '25.02053,98.49097', 100, 2, 2, NULL);
INSERT INTO `web_course_sign` VALUES (5, '2024-04-02 14:19:23.075949', '2024-04-02 16:00:00.000000', 0, '25.02053,98.49097', 200, 2, 4, NULL);
INSERT INTO `web_course_sign` VALUES (6, '2024-04-02 14:42:33.232610', '2024-04-02 17:00:00.000000', 0, '25.02053,98.49097', 100, 2, 4, NULL);
INSERT INTO `web_course_sign` VALUES (7, '2024-04-02 18:33:23.599365', '2024-04-02 21:00:00.000000', 1, '25.02053,98.49097', 100, 2, 4, NULL);
INSERT INTO `web_course_sign` VALUES (8, '2024-04-03 17:37:41.170437', '2024-04-02 17:00:00.000000', 0, '25.02053,98.49097', 100, 2, 4, NULL);
INSERT INTO `web_course_sign` VALUES (11, '2024-04-04 09:30:22.827933', '2024-04-04 14:00:00.000000', 0, '25.02053,98.49097', 100, 2, 6, NULL);
INSERT INTO `web_course_sign` VALUES (12, '2024-04-05 12:24:55.361530', '2024-04-05 15:00:00.000000', 0, '23.39849,104.21504', 100, 2, 2, NULL);
INSERT INTO `web_course_sign` VALUES (13, '2024-04-05 12:25:13.374906', '2024-04-05 13:00:00.000000', 0, '23.39849,104.21504', 100, 2, 2, NULL);
INSERT INTO `web_course_sign` VALUES (14, '2024-04-05 12:25:30.292999', '2024-04-05 15:00:00.000000', 1, '25.02053,98.49097', 100, 2, 2, NULL);
INSERT INTO `web_course_sign` VALUES (16, '2024-04-05 15:51:48.832225', '2024-04-05 18:00:00.000000', 0, '25.02053,98.49097', 100, 2, 2, NULL);
INSERT INTO `web_course_sign` VALUES (17, '2024-04-05 16:10:08.284661', '2024-04-05 18:00:00.000000', 0, '23.39849,104.21504', 100, 1, 8, NULL);
INSERT INTO `web_course_sign` VALUES (18, '2024-04-05 16:10:22.612033', '2024-04-05 17:00:00.000000', 0, '23.39849,104.21504', 100, 1, 8, NULL);
INSERT INTO `web_course_sign` VALUES (19, '2024-04-05 16:28:49.353923', '2024-04-05 17:00:00.000000', 0, '25.02053,98.49097', 100, 2, 3, NULL);
INSERT INTO `web_course_sign` VALUES (20, '2024-04-05 16:30:18.574241', '2024-04-05 18:00:00.000000', 0, '25.02053,98.49097', 100, 1, 8, NULL);
INSERT INTO `web_course_sign` VALUES (21, '2024-04-08 19:13:31.648601', '2024-04-08 21:00:00.000000', 1, NULL, NULL, 2, 2, 'ghks');
INSERT INTO `web_course_sign` VALUES (22, '2024-06-19 16:18:49.478207', '2024-06-19 17:00:00.000000', 0, '24.88554,102.82147', 100, 2, 3, NULL);
INSERT INTO `web_course_sign` VALUES (23, '2024-06-19 16:36:07.185978', '2024-06-19 17:00:00.000000', 0, NULL, NULL, 2, 6, 'aaaa');
INSERT INTO `web_course_sign` VALUES (24, '2024-06-19 16:38:23.544653', '2024-06-19 17:00:00.000000', 2, NULL, NULL, 2, 4, 'aaaa');
INSERT INTO `web_course_sign` VALUES (25, '2024-06-19 16:39:55.354342', '2024-06-19 17:00:00.000000', 0, NULL, NULL, 2, 3, '1111');

-- ----------------------------
-- Table structure for web_course_user
-- ----------------------------
DROP TABLE IF EXISTS `web_course_user`;
CREATE TABLE `web_course_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_datetime` datetime(6) NOT NULL,
  `course_id` bigint(20) NOT NULL,
  `joiner_id` bigint(20) NOT NULL,
  `danger_counts` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `web_course_user_course_id_2c51071a_fk_web_course_id`(`course_id`) USING BTREE,
  INDEX `web_course_user_joiner_id_e2837c41_fk_web_student_id`(`joiner_id`) USING BTREE,
  CONSTRAINT `web_course_user_course_id_2c51071a_fk_web_course_id` FOREIGN KEY (`course_id`) REFERENCES `web_course` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `web_course_user_joiner_id_e2837c41_fk_web_student_id` FOREIGN KEY (`joiner_id`) REFERENCES `web_student` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of web_course_user
-- ----------------------------
INSERT INTO `web_course_user` VALUES (3, '2024-04-04 13:08:21.000000', 4, 2, 3);
INSERT INTO `web_course_user` VALUES (4, '2024-04-02 13:15:47.000000', 2, 2, 1);
INSERT INTO `web_course_user` VALUES (17, '2024-04-02 18:40:00.732909', 3, 2, 0);
INSERT INTO `web_course_user` VALUES (19, '2024-04-02 18:40:04.199740', 6, 2, 0);
INSERT INTO `web_course_user` VALUES (21, '2024-04-04 11:35:47.678149', 6, 5, 0);
INSERT INTO `web_course_user` VALUES (22, '2024-04-04 11:35:50.200145', 4, 5, 3);
INSERT INTO `web_course_user` VALUES (23, '2024-04-04 15:34:53.901284', 3, 1, 1);
INSERT INTO `web_course_user` VALUES (25, '2024-04-05 12:21:53.131510', 3, 5, 0);
INSERT INTO `web_course_user` VALUES (26, '2024-04-05 12:21:54.376330', 2, 5, 1);
INSERT INTO `web_course_user` VALUES (27, '2024-04-05 16:41:57.882180', 8, 1, 0);
INSERT INTO `web_course_user` VALUES (28, '2024-06-19 16:37:38.903849', 4, 1, 0);

-- ----------------------------
-- Table structure for web_invitesign
-- ----------------------------
DROP TABLE IF EXISTS `web_invitesign`;
CREATE TABLE `web_invitesign`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sign` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_datetime` datetime(6) NOT NULL,
  `level` smallint(6) NOT NULL,
  `allow_count` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of web_invitesign
-- ----------------------------
INSERT INTO `web_invitesign` VALUES (3, 'b4ce4266e9a6f1b0519d4a1d1ba4c0cf', '2024-03-31 21:37:57.663801', 2, 10, 2);
INSERT INTO `web_invitesign` VALUES (4, 'e63e2dd8c110bdba0a8bef3d179a1ada', '2024-03-31 21:37:58.247373', 3, 10, 0);
INSERT INTO `web_invitesign` VALUES (5, '3e5894f0e6381efd63f1c45b92a51f1a', '2024-04-03 07:44:09.176347', 2, 10, 0);
INSERT INTO `web_invitesign` VALUES (6, '381c951cbd11e762d7bc8a89c9d8fe32', '2024-04-03 07:44:09.526847', 3, 10, 3);
INSERT INTO `web_invitesign` VALUES (7, '7174f682345fffefa6461d5606aadd3b', '2024-04-04 09:22:44.636520', 2, 10, 1);
INSERT INTO `web_invitesign` VALUES (8, 'b31f06b1e664f6e1d512330a380716ef', '2024-04-04 09:22:45.504828', 3, 10, 1);
INSERT INTO `web_invitesign` VALUES (9, '09f186483ebaa9251fe70810e22b8ba8', '2024-04-04 11:19:58.512152', 2, 3, 0);
INSERT INTO `web_invitesign` VALUES (11, 'ee9fbd21b4b49806c1faf952ae8974d7', '2024-04-05 09:54:25.382979', 2, 3, 0);
INSERT INTO `web_invitesign` VALUES (12, '325ff597bed7421e2bebccfb329551fa', '2024-04-05 09:54:25.422308', 3, 3, 1);

-- ----------------------------
-- Table structure for web_manager
-- ----------------------------
DROP TABLE IF EXISTS `web_manager`;
CREATE TABLE `web_manager`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  `sex` smallint(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `web_manager_user_id_c1f312c8_fk_web_userinfo_id`(`user_id`) USING BTREE,
  CONSTRAINT `web_manager_user_id_c1f312c8_fk_web_userinfo_id` FOREIGN KEY (`user_id`) REFERENCES `web_userinfo` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of web_manager
-- ----------------------------
INSERT INTO `web_manager` VALUES (1, '管理员1号', '31970799883782@qq.com', 7, 1);
INSERT INTO `web_manager` VALUES (2, '段国磊', '3197083782@qq.com', 17, 1);

-- ----------------------------
-- Table structure for web_student
-- ----------------------------
DROP TABLE IF EXISTS `web_student`;
CREATE TABLE `web_student`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` smallint(6) NULL DEFAULT NULL,
  `classes` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `college` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  `email` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `web_student_user_id_be50c480_fk_web_userinfo_id`(`user_id`) USING BTREE,
  CONSTRAINT `web_student_user_id_be50c480_fk_web_userinfo_id` FOREIGN KEY (`user_id`) REFERENCES `web_userinfo` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of web_student
-- ----------------------------
INSERT INTO `web_student` VALUES (1, '段生全', 1, '计科一班', '信息工程与自动化学院', 1, '122101@qq.com');
INSERT INTO `web_student` VALUES (2, '杨大', 1, '计科3班', '信息工程与自动化学院', 3, '31973207ewe99883782@qq.com');
INSERT INTO `web_student` VALUES (3, '老王', 1, NULL, NULL, 14, NULL);
INSERT INTO `web_student` VALUES (5, '张大海', NULL, NULL, NULL, 16, NULL);
INSERT INTO `web_student` VALUES (6, '老王', NULL, NULL, NULL, 18, NULL);

-- ----------------------------
-- Table structure for web_student_waring
-- ----------------------------
DROP TABLE IF EXISTS `web_student_waring`;
CREATE TABLE `web_student_waring`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `status` smallint(6) NOT NULL,
  `create_datetime` datetime(6) NOT NULL,
  `creator_id` bigint(20) NOT NULL,
  `student_id` bigint(20) NOT NULL,
  `course_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `web_student_waring_creator_id_04a9594f_fk_web_userinfo_id`(`creator_id`) USING BTREE,
  INDEX `web_student_waring_student_id_de8a4392_fk_web_student_id`(`student_id`) USING BTREE,
  INDEX `web_student_waring_course_id_d099ad15_fk_web_course_id`(`course_id`) USING BTREE,
  CONSTRAINT `web_student_waring_course_id_d099ad15_fk_web_course_id` FOREIGN KEY (`course_id`) REFERENCES `web_course` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `web_student_waring_creator_id_04a9594f_fk_web_userinfo_id` FOREIGN KEY (`creator_id`) REFERENCES `web_userinfo` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `web_student_waring_student_id_de8a4392_fk_web_student_id` FOREIGN KEY (`student_id`) REFERENCES `web_student` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of web_student_waring
-- ----------------------------
INSERT INTO `web_student_waring` VALUES (41, 1, '2024-04-05 12:06:18.359471', 7, 1, 4);
INSERT INTO `web_student_waring` VALUES (42, 1, '2024-04-03 12:15:20.000000', 7, 5, 4);
INSERT INTO `web_student_waring` VALUES (43, 1, '2024-04-05 12:25:34.649166', 4, 1, 2);
INSERT INTO `web_student_waring` VALUES (44, 1, '2024-04-05 12:40:52.016541', 17, 1, 4);
INSERT INTO `web_student_waring` VALUES (45, 2, '2024-06-19 16:19:32.455200', 4, 5, 2);
INSERT INTO `web_student_waring` VALUES (46, 2, '2024-06-19 16:19:33.342842', 4, 2, 2);
INSERT INTO `web_student_waring` VALUES (47, 2, '2024-06-19 16:40:09.575883', 4, 1, 3);

-- ----------------------------
-- Table structure for web_teacher
-- ----------------------------
DROP TABLE IF EXISTS `web_teacher`;
CREATE TABLE `web_teacher`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` smallint(6) NULL DEFAULT NULL,
  `college` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  `email` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `profession` smallint(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `web_teacher_user_id_41512d2a_fk_web_userinfo_id`(`user_id`) USING BTREE,
  CONSTRAINT `web_teacher_user_id_41512d2a_fk_web_userinfo_id` FOREIGN KEY (`user_id`) REFERENCES `web_userinfo` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of web_teacher
-- ----------------------------
INSERT INTO `web_teacher` VALUES (1, '张璐', 2, '信息工程与自动化学院', 5, 'duangsassauolei@outlook.com', 3);
INSERT INTO `web_teacher` VALUES (2, '张三', 1, '信息工程与自动化学院', 4, 'duanguolei@outlook.com', 3);

-- ----------------------------
-- Table structure for web_userinfo
-- ----------------------------
DROP TABLE IF EXISTS `web_userinfo`;
CREATE TABLE `web_userinfo`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `idnumber` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mobile_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `level` smallint(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of web_userinfo
-- ----------------------------
INSERT INTO `web_userinfo` VALUES (1, '202010328', '17387397142', '123456', 1);
INSERT INTO `web_userinfo` VALUES (3, '20240001', '15770289601', '123456', 1);
INSERT INTO `web_userinfo` VALUES (4, '20240002', '19098399219', '123456', 2);
INSERT INTO `web_userinfo` VALUES (5, '20240003', '18090892190', '123456', 2);
INSERT INTO `web_userinfo` VALUES (7, '0001', '19098290921', '123456', 3);
INSERT INTO `web_userinfo` VALUES (8, '20240004', '19098232032', '123456', 2);
INSERT INTO `web_userinfo` VALUES (10, '20240010', '19098290908', '123456', 2);
INSERT INTO `web_userinfo` VALUES (11, '20240011', '19098290911', '123456', 2);
INSERT INTO `web_userinfo` VALUES (12, '20240020', '19098290900', '123456', 2);
INSERT INTO `web_userinfo` VALUES (13, '202400020', '19098290930', '123456', 2);
INSERT INTO `web_userinfo` VALUES (14, '20240007', '19098290901', '666666', 1);
INSERT INTO `web_userinfo` VALUES (15, '202400111', '19098290988', '123456', 1);
INSERT INTO `web_userinfo` VALUES (16, '20230230230', '17387397109', '123456', 1);
INSERT INTO `web_userinfo` VALUES (17, '0002', '17387397140', '123456', 3);
INSERT INTO `web_userinfo` VALUES (18, '20241000', '17387397008', '123456', 1);

SET FOREIGN_KEY_CHECKS = 1;
