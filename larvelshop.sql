/*
 Navicat Premium Data Transfer

 Source Server         : docker
 Source Server Type    : MySQL
 Source Server Version : 80012
 Source Host           : mysql:3307
 Source Schema         : larvelshop

 Target Server Type    : MySQL
 Target Server Version : 80012
 File Encoding         : 65001

 Date: 19/12/2019 17:18:40
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_menu`;
CREATE TABLE `admin_menu`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `order` int(11) NOT NULL DEFAULT 0,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `permission` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_menu
-- ----------------------------
INSERT INTO `admin_menu` VALUES (1, 0, 1, '首页', 'fa-bar-chart', '/', NULL, NULL, '2019-04-20 16:46:24');
INSERT INTO `admin_menu` VALUES (2, 0, 6, '系统管理', 'fa-tasks', NULL, NULL, NULL, '2019-04-20 16:46:38');
INSERT INTO `admin_menu` VALUES (3, 2, 7, '管理员', 'fa-users', 'auth/users', NULL, NULL, '2019-04-20 16:47:04');
INSERT INTO `admin_menu` VALUES (4, 2, 8, '角色', 'fa-user', 'auth/roles', NULL, NULL, '2019-04-20 16:46:05');
INSERT INTO `admin_menu` VALUES (5, 2, 9, '权限', 'fa-ban', 'auth/permissions', NULL, NULL, '2019-04-20 16:46:46');
INSERT INTO `admin_menu` VALUES (6, 2, 10, '菜单', 'fa-bars', 'auth/menu', NULL, NULL, '2019-04-20 16:46:52');
INSERT INTO `admin_menu` VALUES (7, 2, 11, '操作日志', 'fa-history', 'auth/logs', NULL, NULL, '2019-04-20 16:46:58');
INSERT INTO `admin_menu` VALUES (8, 0, 3, '商品管理', 'fa-cubes', '/products', NULL, '2019-04-20 16:44:59', '2019-04-20 16:50:34');
INSERT INTO `admin_menu` VALUES (9, 0, 2, '用户管理', 'fa-users', '/users', NULL, '2019-04-20 16:45:14', '2019-04-20 16:50:34');
INSERT INTO `admin_menu` VALUES (10, 0, 4, '订单管理', 'fa-rmb', '/orders', NULL, '2019-04-20 16:45:25', '2019-04-20 16:45:45');
INSERT INTO `admin_menu` VALUES (11, 0, 5, '优惠券管理', 'fa-tags', '/coupon_codes', NULL, '2019-04-20 16:45:39', '2019-04-20 16:45:45');

-- ----------------------------
-- Table structure for admin_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `admin_operation_log`;
CREATE TABLE `admin_operation_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `admin_operation_log_user_id_index`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_operation_log
-- ----------------------------
INSERT INTO `admin_operation_log` VALUES (1, 1, 'admin/auth/login', 'POST', '172.20.0.1', '{\"username\":\"admin\",\"password\":\"admin\",\"remember\":\"1\",\"_token\":\"7hHKq22LoUIRaMhrJJazF4GROPBGl8HwR8BG3WnD\"}', '2019-08-08 09:58:15', '2019-08-08 09:58:15');
INSERT INTO `admin_operation_log` VALUES (2, 1, 'admin/products', 'GET', '172.20.0.1', '[]', '2019-08-08 09:58:15', '2019-08-08 09:58:15');
INSERT INTO `admin_operation_log` VALUES (3, 1, 'admin/products', 'GET', '172.20.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-08-08 09:58:20', '2019-08-08 09:58:20');
INSERT INTO `admin_operation_log` VALUES (4, 1, 'admin/products', 'GET', '172.20.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-08-08 09:58:23', '2019-08-08 09:58:23');
INSERT INTO `admin_operation_log` VALUES (5, 1, 'admin/products/3/edit', 'GET', '172.20.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-08-08 09:58:28', '2019-08-08 09:58:28');
INSERT INTO `admin_operation_log` VALUES (6, 1, 'admin/products', 'GET', '172.20.0.1', '[]', '2019-08-08 09:58:47', '2019-08-08 09:58:47');
INSERT INTO `admin_operation_log` VALUES (7, 1, 'admin/products/3/edit', 'GET', '172.20.0.1', '[]', '2019-08-08 12:13:53', '2019-08-08 12:13:53');
INSERT INTO `admin_operation_log` VALUES (8, 1, 'admin/products/3', 'PUT', '172.20.0.1', '{\"title\":\"laborum\",\"description\":\"<p>Omnis suscipit sint neque corrupti.<\\/p>\",\"on_sale\":\"1\",\"skus\":{\"7\":{\"title\":\"dicta\",\"description\":\"Et enim maiores corporis reiciendis necessitatibus sit odio.\",\"price\":\"1786.00\",\"stock\":\"7631\",\"id\":\"7\",\"_remove_\":\"0\"},\"8\":{\"title\":\"ipsum\",\"description\":\"Vitae tempore atque odio at minus.\",\"price\":\"6057.00\",\"stock\":\"25706\",\"id\":\"8\",\"_remove_\":\"0\"},\"9\":{\"title\":\"culpa\",\"description\":\"Quia consequatur dolor non numquam quia qui error et.\",\"price\":\"6990.00\",\"stock\":\"69401\",\"id\":\"9\",\"_remove_\":\"0\"}},\"_token\":\"FAoX18rsZfTEUTfUM4qeVQt2Q1ARXn4Nqw6nrxKk\",\"_method\":\"PUT\"}', '2019-08-08 12:14:05', '2019-08-08 12:14:05');
INSERT INTO `admin_operation_log` VALUES (9, 1, 'admin/products', 'GET', '172.20.0.1', '[]', '2019-08-08 12:14:05', '2019-08-08 12:14:05');
INSERT INTO `admin_operation_log` VALUES (10, 1, 'admin/products/1/edit', 'GET', '172.20.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-08-08 12:14:09', '2019-08-08 12:14:09');
INSERT INTO `admin_operation_log` VALUES (11, 1, 'admin/products/1', 'PUT', '172.20.0.1', '{\"title\":\"cum\",\"description\":\"<p>Placeat vero voluptates debitis velit dolorum dicta modi.<\\/p>\",\"on_sale\":\"1\",\"skus\":{\"1\":{\"title\":\"eveniet\",\"description\":\"Illum ad itaque beatae at.\",\"price\":\"4917.00\",\"stock\":\"20149\",\"id\":\"1\",\"_remove_\":\"0\"},\"2\":{\"title\":\"neque\",\"description\":\"Qui voluptatum suscipit totam voluptatem voluptatem et est.\",\"price\":\"8224.00\",\"stock\":\"74667\",\"id\":\"2\",\"_remove_\":\"0\"},\"3\":{\"title\":\"sit\",\"description\":\"A qui hic quod aliquam dolore impedit dolores.\",\"price\":\"6875.00\",\"stock\":\"7362\",\"id\":\"3\",\"_remove_\":\"0\"}},\"_token\":\"FAoX18rsZfTEUTfUM4qeVQt2Q1ARXn4Nqw6nrxKk\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.larvelshop.com\\/admin\\/products\"}', '2019-08-08 12:14:19', '2019-08-08 12:14:19');
INSERT INTO `admin_operation_log` VALUES (12, 1, 'admin/products', 'GET', '172.20.0.1', '[]', '2019-08-08 12:14:19', '2019-08-08 12:14:19');
INSERT INTO `admin_operation_log` VALUES (13, 1, 'admin/products/1/edit', 'GET', '172.20.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-08-08 12:14:21', '2019-08-08 12:14:21');
INSERT INTO `admin_operation_log` VALUES (14, 1, 'admin/products/1/edit', 'GET', '172.20.0.1', '[]', '2019-08-08 12:14:41', '2019-08-08 12:14:41');
INSERT INTO `admin_operation_log` VALUES (15, 1, 'admin/products/1/edit', 'GET', '172.20.0.1', '[]', '2019-08-08 12:30:16', '2019-08-08 12:30:16');
INSERT INTO `admin_operation_log` VALUES (16, 1, 'admin/products/1', 'PUT', '172.20.0.1', '{\"title\":\"cum\",\"description\":\"<p>Placeat vero voluptates debitis velit dolorum dicta modi.<\\/p>\",\"on_sale\":\"1\",\"skus\":{\"1\":{\"title\":\"eveniet\",\"description\":\"Illum ad itaque beatae at.\",\"price\":\"4917.00\",\"stock\":\"20149\",\"id\":\"1\",\"_remove_\":\"0\"},\"2\":{\"title\":\"neque\",\"description\":\"Qui voluptatum suscipit totam voluptatem voluptatem et est.\",\"price\":\"8224.00\",\"stock\":\"74667\",\"id\":\"2\",\"_remove_\":\"0\"},\"3\":{\"title\":\"sit\",\"description\":\"A qui hic quod aliquam dolore impedit dolores.\",\"price\":\"6875.00\",\"stock\":\"7362\",\"id\":\"3\",\"_remove_\":\"0\"}},\"_token\":\"FAoX18rsZfTEUTfUM4qeVQt2Q1ARXn4Nqw6nrxKk\",\"_method\":\"PUT\"}', '2019-08-08 12:30:35', '2019-08-08 12:30:35');
INSERT INTO `admin_operation_log` VALUES (17, 1, 'admin/products', 'GET', '172.20.0.1', '[]', '2019-08-08 12:30:36', '2019-08-08 12:30:36');
INSERT INTO `admin_operation_log` VALUES (18, 1, 'admin/products/1/edit', 'GET', '172.20.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-08-08 12:30:38', '2019-08-08 12:30:38');
INSERT INTO `admin_operation_log` VALUES (19, 1, 'admin/products/1', 'PUT', '172.20.0.1', '{\"title\":\"cum\",\"description\":\"<p>Placeat vero voluptates debitis velit dolorum dicta modi.<\\/p>\",\"on_sale\":\"1\",\"skus\":{\"1\":{\"title\":\"eveniet\",\"description\":\"Illum ad itaque beatae at.\",\"price\":\"4917.00\",\"stock\":\"20149\",\"id\":\"1\",\"_remove_\":\"0\"},\"2\":{\"title\":\"neque\",\"description\":\"Qui voluptatum suscipit totam voluptatem voluptatem et est.\",\"price\":\"8224.00\",\"stock\":\"74667\",\"id\":\"2\",\"_remove_\":\"0\"},\"3\":{\"title\":\"sit\",\"description\":\"A qui hic quod aliquam dolore impedit dolores.\",\"price\":\"6875.00\",\"stock\":\"7362\",\"id\":\"3\",\"_remove_\":\"0\"}},\"_token\":\"FAoX18rsZfTEUTfUM4qeVQt2Q1ARXn4Nqw6nrxKk\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/www.larvelshop.com\\/admin\\/products\"}', '2019-08-08 12:31:04', '2019-08-08 12:31:04');
INSERT INTO `admin_operation_log` VALUES (20, 1, 'admin/products', 'GET', '172.20.0.1', '[]', '2019-08-08 12:31:04', '2019-08-08 12:31:04');
INSERT INTO `admin_operation_log` VALUES (21, 1, 'admin/products/1/edit', 'GET', '172.20.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-08-08 12:31:06', '2019-08-08 12:31:06');
INSERT INTO `admin_operation_log` VALUES (22, 1, 'admin', 'GET', '172.25.0.1', '[]', '2019-12-17 08:56:11', '2019-12-17 08:56:11');
INSERT INTO `admin_operation_log` VALUES (23, 1, 'admin', 'GET', '172.25.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-12-17 08:56:13', '2019-12-17 08:56:13');
INSERT INTO `admin_operation_log` VALUES (24, 1, 'admin/users', 'GET', '172.25.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-12-17 08:56:16', '2019-12-17 08:56:16');
INSERT INTO `admin_operation_log` VALUES (25, 1, 'admin/products', 'GET', '172.25.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-12-17 08:56:18', '2019-12-17 08:56:18');
INSERT INTO `admin_operation_log` VALUES (26, 1, 'admin/products/create', 'GET', '172.25.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-12-17 08:56:21', '2019-12-17 08:56:21');
INSERT INTO `admin_operation_log` VALUES (27, 1, 'admin/products', 'GET', '172.25.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-12-17 08:58:45', '2019-12-17 08:58:45');
INSERT INTO `admin_operation_log` VALUES (28, 1, 'admin/orders', 'GET', '172.25.0.1', '{\"_pjax\":\"#pjax-container\"}', '2019-12-17 08:58:47', '2019-12-17 08:58:47');

-- ----------------------------
-- Table structure for admin_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_permissions`;
CREATE TABLE `admin_permissions`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `http_path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_permissions_name_unique`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_permissions
-- ----------------------------
INSERT INTO `admin_permissions` VALUES (1, 'All permission', '*', '', '*', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (2, 'Dashboard', 'dashboard', 'GET', '/', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (3, 'Login', 'auth.login', '', '/auth/login\r\n/auth/logout', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (4, 'User setting', 'auth.setting', 'GET,PUT', '/auth/setting', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (5, 'Auth management', 'auth.management', '', '/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (6, '用户管理', 'users', '', '/users*', '2019-04-20 16:49:46', '2019-04-20 16:49:46');
INSERT INTO `admin_permissions` VALUES (7, '商品管理', 'products', '', '/products*', '2019-04-20 16:50:02', '2019-04-20 16:50:02');
INSERT INTO `admin_permissions` VALUES (8, '订单管理', 'orders', '', '/orders*', '2019-04-20 16:50:15', '2019-04-20 16:50:15');
INSERT INTO `admin_permissions` VALUES (9, '优惠券管理', 'coupon_codes', '', '/coupon_codes*', '2019-04-20 16:50:26', '2019-04-20 16:50:26');

-- ----------------------------
-- Table structure for admin_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_menu`;
CREATE TABLE `admin_role_menu`  (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `admin_role_menu_role_id_menu_id_index`(`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_role_menu
-- ----------------------------
INSERT INTO `admin_role_menu` VALUES (1, 2, NULL, NULL);

-- ----------------------------
-- Table structure for admin_role_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_permissions`;
CREATE TABLE `admin_role_permissions`  (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `admin_role_permissions_role_id_permission_id_index`(`role_id`, `permission_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_role_permissions
-- ----------------------------
INSERT INTO `admin_role_permissions` VALUES (1, 1, NULL, NULL);
INSERT INTO `admin_role_permissions` VALUES (2, 2, NULL, NULL);
INSERT INTO `admin_role_permissions` VALUES (2, 3, NULL, NULL);
INSERT INTO `admin_role_permissions` VALUES (2, 4, NULL, NULL);
INSERT INTO `admin_role_permissions` VALUES (2, 6, NULL, NULL);
INSERT INTO `admin_role_permissions` VALUES (2, 7, NULL, NULL);
INSERT INTO `admin_role_permissions` VALUES (2, 8, NULL, NULL);
INSERT INTO `admin_role_permissions` VALUES (2, 9, NULL, NULL);

-- ----------------------------
-- Table structure for admin_role_users
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_users`;
CREATE TABLE `admin_role_users`  (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `admin_role_users_role_id_user_id_index`(`role_id`, `user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_role_users
-- ----------------------------
INSERT INTO `admin_role_users` VALUES (1, 1, NULL, NULL);
INSERT INTO `admin_role_users` VALUES (2, 2, NULL, NULL);

-- ----------------------------
-- Table structure for admin_roles
-- ----------------------------
DROP TABLE IF EXISTS `admin_roles`;
CREATE TABLE `admin_roles`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_roles_name_unique`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_roles
-- ----------------------------
INSERT INTO `admin_roles` VALUES (1, 'Administrator', 'administrator', '2019-04-20 16:43:06', '2019-04-20 16:43:06');
INSERT INTO `admin_roles` VALUES (2, '运营', 'operator', '2019-04-20 16:51:17', '2019-04-20 16:51:17');

-- ----------------------------
-- Table structure for admin_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_user_permissions`;
CREATE TABLE `admin_user_permissions`  (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `admin_user_permissions_user_id_permission_id_index`(`user_id`, `permission_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for admin_users
-- ----------------------------
DROP TABLE IF EXISTS `admin_users`;
CREATE TABLE `admin_users`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_users_username_unique`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_users
-- ----------------------------
INSERT INTO `admin_users` VALUES (1, 'admin', '$2a$10$D6b3G/eyn.f/OmLecvTWpuS04.vWwbJQGA327O9txAivH.IshFp7i', 'Administrator', NULL, 'VIJXnRySG1UzYg2ydP7jzWV1A8oR7J8GEiTvDuMxD7SWxCxhbyFLyCFvc8JM', '2019-04-20 16:43:06', '2019-04-20 16:43:06');
INSERT INTO `admin_users` VALUES (2, 'operator', '$2y$10$pYRpY9bu/pXhusY5uT5jquu9nk0qmnqeOKU8Eujp1aEC2MzjlWirS', '运营', NULL, NULL, '2019-04-20 16:51:32', '2019-04-20 16:51:32');

-- ----------------------------
-- Table structure for cart_items
-- ----------------------------
DROP TABLE IF EXISTS `cart_items`;
CREATE TABLE `cart_items`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_sku_id` bigint(20) UNSIGNED NOT NULL,
  `amount` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cart_items_user_id_foreign`(`user_id`) USING BTREE,
  INDEX `cart_items_product_sku_id_foreign`(`product_sku_id`) USING BTREE,
  CONSTRAINT `cart_items_product_sku_id_foreign` FOREIGN KEY (`product_sku_id`) REFERENCES `product_skus` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `cart_items_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cart_items
-- ----------------------------
INSERT INTO `cart_items` VALUES (1, 1, 10, 1);

-- ----------------------------
-- Table structure for coupon_codes
-- ----------------------------
DROP TABLE IF EXISTS `coupon_codes`;
CREATE TABLE `coupon_codes`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` decimal(8, 2) NOT NULL,
  `total` int(10) UNSIGNED NOT NULL,
  `used` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `min_amount` decimal(10, 2) NOT NULL,
  `not_before` datetime(0) NULL DEFAULT NULL,
  `not_after` datetime(0) NULL DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `coupon_codes_code_unique`(`code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of coupon_codes
-- ----------------------------
INSERT INTO `coupon_codes` VALUES (1, 'aut est qui', 'DGSNE3RQIQ08FZJM', 'fixed', 57.00, 1000, 0, 57.01, NULL, NULL, 1, '2019-08-08 09:56:08', '2019-08-08 09:56:08');
INSERT INTO `coupon_codes` VALUES (2, 'atque repellat voluptas', 'XXZB41ALAHNA4TPA', 'fixed', 74.00, 1000, 0, 74.01, NULL, NULL, 1, '2019-08-08 09:56:08', '2019-08-08 09:56:08');
INSERT INTO `coupon_codes` VALUES (3, 'ipsam ipsa sequi', 'PFXNXBGSFLATLQDZ', 'fixed', 175.00, 1000, 0, 175.01, NULL, NULL, 1, '2019-08-08 09:56:08', '2019-08-08 09:56:08');
INSERT INTO `coupon_codes` VALUES (4, 'repudiandae fugiat nemo', 'OH72UQHGXINLBFVU', 'fixed', 43.00, 1000, 0, 43.01, NULL, NULL, 1, '2019-08-08 09:56:08', '2019-08-08 09:56:08');
INSERT INTO `coupon_codes` VALUES (5, 'voluptatem odit dicta', 'QTULJMKB4DGNCTD9', 'fixed', 33.00, 1000, 0, 33.01, NULL, NULL, 1, '2019-08-08 09:56:08', '2019-08-08 09:56:08');
INSERT INTO `coupon_codes` VALUES (6, 'rerum sit ea', 'AC5D0XKFK8CPPHZQ', 'fixed', 17.00, 1000, 0, 17.01, NULL, NULL, 1, '2019-08-08 09:56:08', '2019-08-08 09:56:08');
INSERT INTO `coupon_codes` VALUES (7, 'qui libero rerum', 'ICKAFU7KZY6PF64E', 'fixed', 45.00, 1000, 0, 45.01, NULL, NULL, 1, '2019-08-08 09:56:08', '2019-08-08 09:56:08');
INSERT INTO `coupon_codes` VALUES (8, 'est velit nulla', 'EEYAYLN1DKXX5VGX', 'percent', 6.00, 1000, 0, 520.00, NULL, NULL, 1, '2019-08-08 09:56:08', '2019-08-08 09:56:08');
INSERT INTO `coupon_codes` VALUES (9, 'et sed quo', 'IBBWE7CZFRXWHQB2', 'fixed', 62.00, 1000, 0, 62.01, NULL, NULL, 1, '2019-08-08 09:56:08', '2019-08-08 09:56:08');
INSERT INTO `coupon_codes` VALUES (10, 'ut corporis quasi', 'OZQMLPFFMNPPHWE1', 'fixed', 134.00, 1000, 0, 134.01, NULL, NULL, 1, '2019-08-08 09:56:08', '2019-08-08 09:56:08');
INSERT INTO `coupon_codes` VALUES (11, 'laborum molestiae ut', '8VXORB3GZVVYVENK', 'fixed', 171.00, 1000, 0, 171.01, NULL, NULL, 1, '2019-08-08 09:56:08', '2019-08-08 09:56:08');
INSERT INTO `coupon_codes` VALUES (12, 'quae ex in', 'RWHNL2FYLCQNCAAE', 'fixed', 164.00, 1000, 0, 164.01, NULL, NULL, 1, '2019-08-08 09:56:08', '2019-08-08 09:56:08');
INSERT INTO `coupon_codes` VALUES (13, 'quae minus est', 'FLRY8IQXOZL1UH46', 'fixed', 93.00, 1000, 0, 93.01, NULL, NULL, 1, '2019-08-08 09:56:08', '2019-08-08 09:56:08');
INSERT INTO `coupon_codes` VALUES (14, 'sunt necessitatibus consequatur', 'G3MEIVF71RMQDDUV', 'percent', 41.00, 1000, 0, 366.00, NULL, NULL, 1, '2019-08-08 09:56:08', '2019-08-08 09:56:08');
INSERT INTO `coupon_codes` VALUES (15, 'ut sed ut', '38ZR0R2WQZHM6AJM', 'percent', 41.00, 1000, 0, 853.00, NULL, NULL, 1, '2019-08-08 09:56:08', '2019-08-08 09:56:08');
INSERT INTO `coupon_codes` VALUES (16, 'labore delectus debitis', 'INQXXCEKVE6ZZ5ZE', 'fixed', 134.00, 1000, 0, 134.01, NULL, NULL, 1, '2019-08-08 09:56:08', '2019-08-08 09:56:08');
INSERT INTO `coupon_codes` VALUES (17, 'aut eos labore', 'NBE4IJKKMWYG7VYV', 'percent', 18.00, 1000, 16, 0.00, NULL, NULL, 1, '2019-08-08 09:56:08', '2019-08-08 09:56:08');
INSERT INTO `coupon_codes` VALUES (18, 'aspernatur magni cumque', 'CJM5VLYOALMZRYMO', 'percent', 26.00, 1000, 0, 891.00, NULL, NULL, 1, '2019-08-08 09:56:08', '2019-08-08 09:56:08');
INSERT INTO `coupon_codes` VALUES (19, 'qui sint nihil', 'WSVKPOMO8SAGYOEW', 'percent', 2.00, 1000, 7, 0.00, NULL, NULL, 1, '2019-08-08 09:56:08', '2019-08-08 09:56:08');
INSERT INTO `coupon_codes` VALUES (20, 'quia sed asperiores', 'K4BNVDTPSPKR6HU3', 'fixed', 26.00, 1000, 0, 26.01, NULL, NULL, 1, '2019-08-08 09:56:08', '2019-08-08 09:56:08');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2016_01_04_173148_create_admin_tables', 1);
INSERT INTO `migrations` VALUES (4, '2019_04_18_151103_create_user_addresses_table', 1);
INSERT INTO `migrations` VALUES (5, '2019_04_19_140959_create_products_table', 1);
INSERT INTO `migrations` VALUES (6, '2019_04_19_141004_create_product_skus_table', 1);
INSERT INTO `migrations` VALUES (7, '2019_04_19_144405_create_user_favorite_products_table', 1);
INSERT INTO `migrations` VALUES (8, '2019_04_19_145538_create_cart_items_table', 1);
INSERT INTO `migrations` VALUES (9, '2019_04_20_004100_create_orders_table', 1);
INSERT INTO `migrations` VALUES (10, '2019_04_20_004106_create_order_items_table', 1);
INSERT INTO `migrations` VALUES (11, '2019_04_20_081020_create_coupon_codes_table', 1);
INSERT INTO `migrations` VALUES (12, '2019_04_20_081104_orders_add_coupon_code_id', 1);

-- ----------------------------
-- Table structure for order_items
-- ----------------------------
DROP TABLE IF EXISTS `order_items`;
CREATE TABLE `order_items`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `product_sku_id` bigint(20) UNSIGNED NOT NULL,
  `amount` int(10) UNSIGNED NOT NULL COMMENT '购买数量',
  `price` decimal(10, 2) NOT NULL,
  `rating` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '评价分数',
  `review` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '评价内容',
  `reviewed_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `order_items_order_id_foreign`(`order_id`) USING BTREE,
  INDEX `order_items_product_id_foreign`(`product_id`) USING BTREE,
  INDEX `order_items_product_sku_id_foreign`(`product_sku_id`) USING BTREE,
  CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `order_items_product_sku_id_foreign` FOREIGN KEY (`product_sku_id`) REFERENCES `product_skus` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 197 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_items
-- ----------------------------
INSERT INTO `order_items` VALUES (1, 1, 6, 16, 1, 452.00, 4, 'Totam id veniam ea quidem non ut temporibus veniam.', '2019-08-02 10:42:42');
INSERT INTO `order_items` VALUES (2, 1, 6, 16, 5, 452.00, 4, 'Totam id veniam ea quidem non ut temporibus veniam.', '2019-08-02 10:42:42');
INSERT INTO `order_items` VALUES (3, 2, 17, 50, 2, 8549.00, 2, 'Odit voluptatum nesciunt voluptatem non laudantium.', '2019-08-04 08:17:44');
INSERT INTO `order_items` VALUES (4, 2, 23, 67, 5, 6938.00, 2, 'Odit voluptatum nesciunt voluptatem non laudantium.', '2019-08-04 08:17:44');
INSERT INTO `order_items` VALUES (5, 2, 26, 78, 2, 7889.00, 2, 'Odit voluptatum nesciunt voluptatem non laudantium.', '2019-08-04 08:17:44');
INSERT INTO `order_items` VALUES (6, 3, 8, 22, 5, 3063.00, 1, 'Aliquam nihil et facilis quasi ut.', '2019-08-02 16:06:00');
INSERT INTO `order_items` VALUES (7, 4, 18, 52, 5, 9260.00, NULL, NULL, NULL);
INSERT INTO `order_items` VALUES (8, 5, 12, 34, 4, 4912.00, 5, 'Harum autem in tenetur sit nam dolorum officia.', '2019-08-07 01:32:12');
INSERT INTO `order_items` VALUES (9, 5, 30, 88, 3, 7010.00, 5, 'Harum autem in tenetur sit nam dolorum officia.', '2019-08-07 01:32:12');
INSERT INTO `order_items` VALUES (10, 5, 2, 4, 3, 3026.00, 5, 'Harum autem in tenetur sit nam dolorum officia.', '2019-08-07 01:32:12');
INSERT INTO `order_items` VALUES (11, 6, 21, 62, 1, 6575.00, 5, 'Ab atque sapiente omnis quibusdam facilis veritatis.', '2019-08-06 01:38:39');
INSERT INTO `order_items` VALUES (12, 6, 25, 73, 2, 8041.00, 5, 'Ab atque sapiente omnis quibusdam facilis veritatis.', '2019-08-06 01:38:39');
INSERT INTO `order_items` VALUES (13, 6, 25, 74, 2, 9755.00, 5, 'Ab atque sapiente omnis quibusdam facilis veritatis.', '2019-08-06 01:38:39');
INSERT INTO `order_items` VALUES (14, 7, 29, 85, 1, 7156.00, 2, 'Ea rerum occaecati id autem magnam.', '2019-08-04 23:48:32');
INSERT INTO `order_items` VALUES (15, 7, 6, 17, 2, 2018.00, 2, 'Ea rerum occaecati id autem magnam.', '2019-08-04 23:48:32');
INSERT INTO `order_items` VALUES (16, 7, 21, 62, 2, 6575.00, 2, 'Ea rerum occaecati id autem magnam.', '2019-08-04 23:48:32');
INSERT INTO `order_items` VALUES (17, 8, 20, 60, 2, 9639.00, NULL, NULL, NULL);
INSERT INTO `order_items` VALUES (18, 8, 15, 43, 1, 3650.00, NULL, NULL, NULL);
INSERT INTO `order_items` VALUES (19, 8, 2, 5, 1, 9241.00, NULL, NULL, NULL);
INSERT INTO `order_items` VALUES (20, 9, 2, 5, 2, 9241.00, 5, 'A animi necessitatibus qui minima molestiae est deleniti.', '2019-08-03 17:10:54');
INSERT INTO `order_items` VALUES (21, 9, 9, 25, 2, 6658.00, 5, 'A animi necessitatibus qui minima molestiae est deleniti.', '2019-08-03 17:10:54');
INSERT INTO `order_items` VALUES (22, 9, 19, 55, 2, 4786.00, 5, 'A animi necessitatibus qui minima molestiae est deleniti.', '2019-08-03 17:10:54');
INSERT INTO `order_items` VALUES (23, 10, 22, 66, 5, 9108.00, 1, 'Est et fugiat ipsa doloremque deserunt et beatae aliquid.', '2019-07-31 14:52:28');
INSERT INTO `order_items` VALUES (24, 10, 10, 30, 1, 7351.00, 1, 'Est et fugiat ipsa doloremque deserunt et beatae aliquid.', '2019-07-31 14:52:28');
INSERT INTO `order_items` VALUES (25, 11, 2, 6, 1, 6556.00, 2, 'Natus voluptatum tempore mollitia omnis id.', '2019-08-04 07:10:34');
INSERT INTO `order_items` VALUES (26, 12, 21, 63, 4, 5763.00, NULL, NULL, NULL);
INSERT INTO `order_items` VALUES (27, 13, 2, 6, 2, 6556.00, 3, 'Perferendis qui sint id sed.', '2019-07-29 13:08:53');
INSERT INTO `order_items` VALUES (28, 14, 9, 26, 5, 4025.00, NULL, NULL, NULL);
INSERT INTO `order_items` VALUES (29, 15, 20, 60, 1, 9639.00, 3, 'Natus sapiente nisi et sed impedit minima veniam est.', '2019-08-07 07:25:12');
INSERT INTO `order_items` VALUES (30, 16, 19, 57, 4, 1210.00, 5, 'Debitis dolorem qui placeat voluptatem non.', '2019-08-08 08:48:38');
INSERT INTO `order_items` VALUES (31, 16, 20, 58, 3, 7259.00, 5, 'Debitis dolorem qui placeat voluptatem non.', '2019-08-08 08:48:38');
INSERT INTO `order_items` VALUES (32, 17, 6, 16, 4, 452.00, 5, 'Quidem eum iure dignissimos et minima ex aliquam.', '2019-08-03 22:24:23');
INSERT INTO `order_items` VALUES (33, 18, 4, 10, 2, 277.00, NULL, NULL, NULL);
INSERT INTO `order_items` VALUES (34, 18, 23, 67, 4, 6938.00, NULL, NULL, NULL);
INSERT INTO `order_items` VALUES (35, 18, 17, 50, 4, 8549.00, NULL, NULL, NULL);
INSERT INTO `order_items` VALUES (36, 19, 1, 2, 5, 8224.00, 4, 'Quidem harum quisquam non labore doloremque.', '2019-08-07 22:08:39');
INSERT INTO `order_items` VALUES (37, 19, 9, 26, 2, 4025.00, 2, 'Quidem harum quisquam non labore doloremque.', '2019-08-07 22:08:39');
INSERT INTO `order_items` VALUES (38, 20, 8, 23, 4, 8970.00, 1, 'Incidunt velit sit omnis sit vitae.', '2019-07-18 19:47:28');
INSERT INTO `order_items` VALUES (39, 20, 15, 43, 4, 3650.00, 1, 'Incidunt velit sit omnis sit vitae.', '2019-07-18 19:47:28');
INSERT INTO `order_items` VALUES (40, 21, 14, 40, 4, 3287.00, NULL, NULL, NULL);
INSERT INTO `order_items` VALUES (41, 22, 21, 63, 4, 5763.00, 4, 'Itaque iusto at temporibus.', '2019-08-06 16:42:44');
INSERT INTO `order_items` VALUES (42, 22, 4, 12, 4, 1981.00, 4, 'Itaque iusto at temporibus.', '2019-08-06 16:42:44');
INSERT INTO `order_items` VALUES (43, 23, 8, 23, 4, 8970.00, 2, 'Explicabo eveniet accusantium est perspiciatis eos quod.', '2019-07-22 14:34:43');
INSERT INTO `order_items` VALUES (44, 23, 17, 49, 5, 4122.00, 2, 'Explicabo eveniet accusantium est perspiciatis eos quod.', '2019-07-22 14:34:43');
INSERT INTO `order_items` VALUES (45, 23, 6, 18, 2, 6832.00, 2, 'Explicabo eveniet accusantium est perspiciatis eos quod.', '2019-07-22 14:34:43');
INSERT INTO `order_items` VALUES (46, 24, 7, 20, 3, 3156.00, 1, 'Culpa et qui nihil blanditiis voluptate quia.', '2019-07-25 04:29:40');
INSERT INTO `order_items` VALUES (47, 24, 3, 9, 5, 6990.00, 1, 'Culpa et qui nihil blanditiis voluptate quia.', '2019-07-25 04:29:40');
INSERT INTO `order_items` VALUES (48, 24, 25, 74, 2, 9755.00, 1, 'Culpa et qui nihil blanditiis voluptate quia.', '2019-07-25 04:29:40');
INSERT INTO `order_items` VALUES (49, 25, 20, 59, 3, 9674.00, 4, 'Aspernatur qui perferendis ducimus rerum nihil.', '2019-07-24 08:54:08');
INSERT INTO `order_items` VALUES (50, 25, 27, 79, 1, 9789.00, 4, 'Aspernatur qui perferendis ducimus rerum nihil.', '2019-07-24 08:54:08');
INSERT INTO `order_items` VALUES (51, 25, 2, 6, 3, 6556.00, 4, 'Aspernatur qui perferendis ducimus rerum nihil.', '2019-07-24 08:54:08');
INSERT INTO `order_items` VALUES (52, 26, 23, 67, 4, 6938.00, 4, 'Et inventore dolorem amet mollitia.', '2019-07-29 22:25:15');
INSERT INTO `order_items` VALUES (53, 26, 6, 18, 1, 6832.00, 4, 'Et inventore dolorem amet mollitia.', '2019-07-29 22:25:15');
INSERT INTO `order_items` VALUES (54, 27, 21, 62, 1, 6575.00, NULL, NULL, NULL);
INSERT INTO `order_items` VALUES (55, 27, 11, 32, 5, 6301.00, NULL, NULL, NULL);
INSERT INTO `order_items` VALUES (56, 27, 28, 82, 5, 1529.00, NULL, NULL, NULL);
INSERT INTO `order_items` VALUES (57, 28, 14, 42, 3, 7366.00, 1, 'Aspernatur tenetur aut libero a culpa.', '2019-08-07 12:54:15');
INSERT INTO `order_items` VALUES (58, 28, 11, 33, 2, 648.00, 1, 'Aspernatur tenetur aut libero a culpa.', '2019-08-07 12:54:15');
INSERT INTO `order_items` VALUES (59, 29, 21, 62, 1, 6575.00, 3, 'In iusto officiis inventore distinctio.', '2019-07-30 22:14:33');
INSERT INTO `order_items` VALUES (60, 29, 11, 31, 4, 6295.00, 3, 'In iusto officiis inventore distinctio.', '2019-07-30 22:14:33');
INSERT INTO `order_items` VALUES (61, 29, 2, 5, 5, 9241.00, 3, 'In iusto officiis inventore distinctio.', '2019-07-30 22:14:33');
INSERT INTO `order_items` VALUES (62, 30, 3, 8, 5, 6057.00, 1, 'Incidunt quo aut quam.', '2019-08-07 00:28:28');
INSERT INTO `order_items` VALUES (63, 31, 3, 8, 3, 6057.00, 3, 'Eligendi aut fugit sint perferendis maiores.', '2019-07-31 15:10:15');
INSERT INTO `order_items` VALUES (64, 32, 25, 74, 3, 9755.00, 2, 'Repellendus veniam et adipisci unde a repellendus blanditiis.', '2019-07-24 04:39:45');
INSERT INTO `order_items` VALUES (65, 33, 5, 15, 4, 121.00, 1, 'Labore est non reprehenderit.', '2019-08-01 06:00:00');
INSERT INTO `order_items` VALUES (66, 34, 19, 55, 1, 4786.00, 2, 'Id earum nisi incidunt id non tempore quisquam.', '2019-07-26 01:07:30');
INSERT INTO `order_items` VALUES (67, 34, 21, 62, 4, 6575.00, 2, 'Id earum nisi incidunt id non tempore quisquam.', '2019-07-26 01:07:30');
INSERT INTO `order_items` VALUES (68, 34, 16, 46, 1, 4247.00, 2, 'Id earum nisi incidunt id non tempore quisquam.', '2019-07-26 01:07:30');
INSERT INTO `order_items` VALUES (69, 35, 24, 71, 4, 3817.00, NULL, NULL, NULL);
INSERT INTO `order_items` VALUES (70, 35, 3, 8, 3, 6057.00, NULL, NULL, NULL);
INSERT INTO `order_items` VALUES (71, 36, 4, 12, 4, 1981.00, NULL, NULL, NULL);
INSERT INTO `order_items` VALUES (72, 37, 17, 50, 1, 8549.00, 5, 'Ipsam enim optio voluptas qui.', '2019-07-13 05:54:15');
INSERT INTO `order_items` VALUES (73, 38, 12, 36, 3, 6473.00, 4, 'Autem delectus mollitia enim maxime dolorem.', '2019-08-06 22:45:32');
INSERT INTO `order_items` VALUES (74, 39, 12, 34, 5, 4912.00, NULL, NULL, NULL);
INSERT INTO `order_items` VALUES (75, 39, 7, 19, 4, 3905.00, NULL, NULL, NULL);
INSERT INTO `order_items` VALUES (76, 39, 22, 64, 2, 8797.00, NULL, NULL, NULL);
INSERT INTO `order_items` VALUES (77, 40, 13, 39, 4, 541.00, 1, 'Quod et alias exercitationem ut illum quos sunt.', '2019-08-08 01:33:34');
INSERT INTO `order_items` VALUES (78, 41, 16, 48, 2, 3485.00, NULL, NULL, NULL);
INSERT INTO `order_items` VALUES (79, 41, 9, 25, 3, 6658.00, NULL, NULL, NULL);
INSERT INTO `order_items` VALUES (80, 41, 3, 8, 3, 6057.00, NULL, NULL, NULL);
INSERT INTO `order_items` VALUES (81, 42, 23, 68, 2, 6367.00, 4, 'Ipsum eveniet adipisci animi et facilis.', '2019-08-06 18:34:11');
INSERT INTO `order_items` VALUES (82, 42, 4, 12, 2, 1981.00, 4, 'Ipsum eveniet adipisci animi et facilis.', '2019-08-06 18:34:11');
INSERT INTO `order_items` VALUES (83, 43, 10, 30, 3, 7351.00, NULL, NULL, NULL);
INSERT INTO `order_items` VALUES (84, 43, 12, 34, 4, 4912.00, NULL, NULL, NULL);
INSERT INTO `order_items` VALUES (85, 43, 4, 11, 4, 1218.00, NULL, NULL, NULL);
INSERT INTO `order_items` VALUES (86, 44, 7, 21, 3, 8607.00, 1, 'Tempora aliquam fuga vero vero in iste perferendis.', '2019-08-03 04:38:57');
INSERT INTO `order_items` VALUES (87, 44, 14, 42, 4, 7366.00, 1, 'Tempora aliquam fuga vero vero in iste perferendis.', '2019-08-03 04:38:57');
INSERT INTO `order_items` VALUES (88, 45, 14, 40, 3, 3287.00, NULL, NULL, NULL);
INSERT INTO `order_items` VALUES (89, 45, 22, 65, 2, 1365.00, NULL, NULL, NULL);
INSERT INTO `order_items` VALUES (90, 45, 27, 79, 1, 9789.00, NULL, NULL, NULL);
INSERT INTO `order_items` VALUES (91, 46, 12, 36, 1, 6473.00, 1, 'Ipsam occaecati dolor est vel saepe et.', '2019-08-05 23:13:33');
INSERT INTO `order_items` VALUES (92, 46, 16, 46, 5, 4247.00, 1, 'Ipsam occaecati dolor est vel saepe et.', '2019-08-05 23:13:33');
INSERT INTO `order_items` VALUES (93, 46, 8, 24, 1, 9495.00, 1, 'Ipsam occaecati dolor est vel saepe et.', '2019-08-05 23:13:33');
INSERT INTO `order_items` VALUES (94, 47, 15, 45, 1, 8314.00, NULL, NULL, NULL);
INSERT INTO `order_items` VALUES (95, 47, 30, 89, 5, 6469.00, NULL, NULL, NULL);
INSERT INTO `order_items` VALUES (96, 48, 23, 68, 3, 6367.00, NULL, NULL, NULL);
INSERT INTO `order_items` VALUES (97, 48, 26, 77, 1, 5768.00, NULL, NULL, NULL);
INSERT INTO `order_items` VALUES (98, 49, 23, 67, 3, 6938.00, 4, 'Quia sit provident suscipit consequatur et voluptates.', '2019-08-05 20:07:09');
INSERT INTO `order_items` VALUES (99, 49, 21, 61, 3, 9191.00, 4, 'Quia sit provident suscipit consequatur et voluptates.', '2019-08-05 20:07:09');
INSERT INTO `order_items` VALUES (100, 50, 10, 28, 5, 453.00, 2, 'Excepturi ut autem iste atque.', '2019-07-26 18:44:44');
INSERT INTO `order_items` VALUES (101, 50, 1, 2, 2, 8224.00, 2, 'Excepturi ut autem iste atque.', '2019-07-26 18:44:44');
INSERT INTO `order_items` VALUES (102, 51, 23, 69, 3, 8582.00, NULL, NULL, NULL);
INSERT INTO `order_items` VALUES (103, 51, 2, 4, 3, 3026.00, NULL, NULL, NULL);
INSERT INTO `order_items` VALUES (104, 52, 1, 2, 3, 8224.00, 5, 'Placeat voluptas est reprehenderit voluptas sunt repellat facilis.', '2019-08-04 02:34:40');
INSERT INTO `order_items` VALUES (105, 52, 16, 48, 1, 3485.00, 5, 'Placeat voluptas est reprehenderit voluptas sunt repellat facilis.', '2019-08-04 02:34:40');
INSERT INTO `order_items` VALUES (106, 53, 4, 12, 1, 1981.00, 3, 'Inventore aperiam sequi et.', '2019-07-19 12:45:57');
INSERT INTO `order_items` VALUES (107, 53, 17, 51, 1, 7580.00, 3, 'Inventore aperiam sequi et.', '2019-07-19 12:45:57');
INSERT INTO `order_items` VALUES (108, 53, 14, 41, 2, 4323.00, 3, 'Inventore aperiam sequi et.', '2019-07-19 12:45:57');
INSERT INTO `order_items` VALUES (109, 54, 12, 34, 1, 4912.00, NULL, NULL, NULL);
INSERT INTO `order_items` VALUES (110, 54, 9, 26, 4, 4025.00, NULL, NULL, NULL);
INSERT INTO `order_items` VALUES (111, 54, 18, 53, 1, 9069.00, NULL, NULL, NULL);
INSERT INTO `order_items` VALUES (112, 55, 15, 44, 3, 8448.00, 5, 'Aut maiores libero perferendis id vel error similique.', '2019-07-31 04:34:02');
INSERT INTO `order_items` VALUES (113, 55, 18, 53, 4, 9069.00, 5, 'Aut maiores libero perferendis id vel error similique.', '2019-07-31 04:34:02');
INSERT INTO `order_items` VALUES (114, 55, 6, 16, 4, 452.00, 5, 'Aut maiores libero perferendis id vel error similique.', '2019-07-31 04:34:02');
INSERT INTO `order_items` VALUES (115, 56, 29, 85, 4, 7156.00, NULL, NULL, NULL);
INSERT INTO `order_items` VALUES (116, 56, 20, 58, 5, 7259.00, NULL, NULL, NULL);
INSERT INTO `order_items` VALUES (117, 56, 10, 30, 2, 7351.00, NULL, NULL, NULL);
INSERT INTO `order_items` VALUES (118, 57, 27, 79, 4, 9789.00, 4, 'Amet ut culpa reprehenderit eum.', '2019-07-21 07:38:19');
INSERT INTO `order_items` VALUES (119, 58, 4, 10, 3, 277.00, 5, 'Magni et ea sequi quo at laudantium sequi.', '2019-07-14 17:29:41');
INSERT INTO `order_items` VALUES (120, 58, 8, 22, 5, 3063.00, 5, 'Magni et ea sequi quo at laudantium sequi.', '2019-07-14 17:29:41');
INSERT INTO `order_items` VALUES (121, 59, 6, 16, 5, 452.00, 1, 'Et ut sint modi iste molestiae ut.', '2019-08-06 02:21:56');
INSERT INTO `order_items` VALUES (122, 59, 9, 27, 1, 7643.00, 1, 'Et ut sint modi iste molestiae ut.', '2019-08-06 02:21:56');
INSERT INTO `order_items` VALUES (123, 60, 24, 72, 3, 1336.00, 5, 'Sed ratione sequi sint dolorem dolor ut aut.', '2019-07-27 06:32:30');
INSERT INTO `order_items` VALUES (124, 61, 10, 29, 3, 2288.00, 4, 'Quo et voluptas magnam nisi non.', '2019-08-02 13:16:35');
INSERT INTO `order_items` VALUES (125, 62, 5, 15, 4, 121.00, 5, 'Quia at quidem eligendi ut est.', '2019-08-06 07:39:56');
INSERT INTO `order_items` VALUES (126, 62, 6, 16, 3, 452.00, 5, 'Quia at quidem eligendi ut est.', '2019-08-06 07:39:56');
INSERT INTO `order_items` VALUES (127, 63, 7, 19, 3, 3905.00, 2, 'Et fugiat voluptatum impedit earum.', '2019-08-04 15:55:45');
INSERT INTO `order_items` VALUES (128, 63, 19, 57, 5, 1210.00, 2, 'Et fugiat voluptatum impedit earum.', '2019-08-04 15:55:45');
INSERT INTO `order_items` VALUES (129, 63, 2, 4, 5, 3026.00, 2, 'Et fugiat voluptatum impedit earum.', '2019-08-04 15:55:45');
INSERT INTO `order_items` VALUES (130, 64, 7, 19, 5, 3905.00, 4, 'Reprehenderit ipsum debitis veritatis voluptates quasi error.', '2019-08-05 02:30:33');
INSERT INTO `order_items` VALUES (131, 65, 4, 10, 5, 277.00, NULL, NULL, NULL);
INSERT INTO `order_items` VALUES (132, 65, 11, 31, 4, 6295.00, NULL, NULL, NULL);
INSERT INTO `order_items` VALUES (133, 66, 4, 11, 2, 1218.00, 5, 'Perspiciatis repudiandae occaecati quia atque aut ut.', '2019-07-30 21:23:10');
INSERT INTO `order_items` VALUES (134, 66, 29, 86, 2, 3744.00, 5, 'Perspiciatis repudiandae occaecati quia atque aut ut.', '2019-07-30 21:23:10');
INSERT INTO `order_items` VALUES (135, 67, 26, 78, 1, 7889.00, 3, 'Enim accusantium sed voluptatem mollitia.', '2019-07-30 15:32:23');
INSERT INTO `order_items` VALUES (136, 67, 2, 4, 1, 3026.00, 3, 'Enim accusantium sed voluptatem mollitia.', '2019-07-30 15:32:23');
INSERT INTO `order_items` VALUES (137, 68, 12, 36, 2, 6473.00, 4, 'Perspiciatis quo nostrum necessitatibus.', '2019-07-28 02:08:19');
INSERT INTO `order_items` VALUES (138, 68, 30, 89, 5, 6469.00, 4, 'Perspiciatis quo nostrum necessitatibus.', '2019-07-28 02:08:19');
INSERT INTO `order_items` VALUES (139, 68, 16, 48, 5, 3485.00, 4, 'Perspiciatis quo nostrum necessitatibus.', '2019-07-28 02:08:19');
INSERT INTO `order_items` VALUES (140, 69, 16, 46, 3, 4247.00, 1, 'Ut quia qui repellendus quam.', '2019-08-04 05:48:12');
INSERT INTO `order_items` VALUES (141, 69, 15, 45, 3, 8314.00, 1, 'Ut quia qui repellendus quam.', '2019-08-04 05:48:12');
INSERT INTO `order_items` VALUES (142, 69, 25, 75, 5, 2504.00, 1, 'Ut quia qui repellendus quam.', '2019-08-04 05:48:12');
INSERT INTO `order_items` VALUES (143, 70, 8, 22, 2, 3063.00, 1, 'Amet quia est ex.', '2019-08-07 21:46:17');
INSERT INTO `order_items` VALUES (144, 70, 7, 19, 2, 3905.00, 1, 'Amet quia est ex.', '2019-08-07 21:46:17');
INSERT INTO `order_items` VALUES (145, 70, 28, 83, 2, 2309.00, 1, 'Amet quia est ex.', '2019-08-07 21:46:17');
INSERT INTO `order_items` VALUES (146, 71, 11, 32, 2, 6301.00, 3, 'Aut placeat architecto odit repellat.', '2019-08-01 01:46:20');
INSERT INTO `order_items` VALUES (147, 72, 4, 12, 5, 1981.00, 4, 'Occaecati in animi omnis aliquid.', '2019-07-18 02:15:44');
INSERT INTO `order_items` VALUES (148, 72, 14, 41, 5, 4323.00, 4, 'Occaecati in animi omnis aliquid.', '2019-07-18 02:15:44');
INSERT INTO `order_items` VALUES (149, 72, 6, 18, 3, 6832.00, 4, 'Occaecati in animi omnis aliquid.', '2019-07-18 02:15:44');
INSERT INTO `order_items` VALUES (150, 73, 21, 63, 3, 5763.00, NULL, NULL, NULL);
INSERT INTO `order_items` VALUES (151, 73, 14, 41, 1, 4323.00, NULL, NULL, NULL);
INSERT INTO `order_items` VALUES (152, 74, 18, 54, 3, 780.00, NULL, NULL, NULL);
INSERT INTO `order_items` VALUES (153, 74, 9, 25, 2, 6658.00, NULL, NULL, NULL);
INSERT INTO `order_items` VALUES (154, 74, 8, 24, 1, 9495.00, NULL, NULL, NULL);
INSERT INTO `order_items` VALUES (155, 75, 3, 9, 4, 6990.00, 4, 'Ut reiciendis non nulla voluptatibus ducimus.', '2019-07-25 15:06:29');
INSERT INTO `order_items` VALUES (156, 75, 23, 67, 3, 6938.00, 4, 'Ut reiciendis non nulla voluptatibus ducimus.', '2019-07-25 15:06:29');
INSERT INTO `order_items` VALUES (157, 76, 29, 85, 3, 7156.00, 5, 'Non iusto necessitatibus distinctio rem a accusamus.', '2019-07-31 02:23:42');
INSERT INTO `order_items` VALUES (158, 77, 10, 30, 1, 7351.00, 3, 'Sed hic aut ad veritatis sunt.', '2019-07-28 13:06:03');
INSERT INTO `order_items` VALUES (159, 78, 9, 27, 1, 7643.00, 4, 'Aut ducimus suscipit itaque impedit impedit inventore sit.', '2019-07-26 02:37:31');
INSERT INTO `order_items` VALUES (160, 79, 19, 56, 2, 6038.00, 4, 'Et molestiae aut nemo eligendi a voluptatem repellendus.', '2019-08-03 00:29:33');
INSERT INTO `order_items` VALUES (161, 80, 24, 70, 5, 3391.00, 3, 'Dignissimos sed provident temporibus reiciendis ut eum.', '2019-07-27 13:14:39');
INSERT INTO `order_items` VALUES (162, 80, 1, 2, 4, 8224.00, 3, 'Dignissimos sed provident temporibus reiciendis ut eum.', '2019-07-27 13:14:39');
INSERT INTO `order_items` VALUES (163, 81, 11, 31, 2, 6295.00, 3, 'Earum pariatur aspernatur dolorum ex natus quia quae.', '2019-08-04 14:59:52');
INSERT INTO `order_items` VALUES (164, 81, 27, 79, 3, 9789.00, 3, 'Earum pariatur aspernatur dolorum ex natus quia quae.', '2019-08-04 14:59:52');
INSERT INTO `order_items` VALUES (165, 82, 20, 59, 5, 9674.00, 4, 'Non vitae aperiam molestias vel consequatur expedita.', '2019-08-01 21:44:48');
INSERT INTO `order_items` VALUES (166, 83, 19, 56, 5, 6038.00, 4, 'Perspiciatis non totam ut.', '2019-07-25 10:40:22');
INSERT INTO `order_items` VALUES (167, 83, 18, 54, 5, 780.00, 4, 'Perspiciatis non totam ut.', '2019-07-25 10:40:22');
INSERT INTO `order_items` VALUES (168, 83, 8, 23, 1, 8970.00, 4, 'Perspiciatis non totam ut.', '2019-07-25 10:40:22');
INSERT INTO `order_items` VALUES (169, 84, 10, 28, 2, 453.00, 3, 'Quae cumque rem hic sint id.', '2019-08-08 01:16:26');
INSERT INTO `order_items` VALUES (170, 85, 18, 53, 4, 9069.00, 1, 'Et iste a voluptatem qui similique ut.', '2019-07-16 08:48:11');
INSERT INTO `order_items` VALUES (171, 85, 18, 52, 4, 9260.00, 1, 'Et iste a voluptatem qui similique ut.', '2019-07-16 08:48:11');
INSERT INTO `order_items` VALUES (172, 86, 5, 15, 4, 121.00, 2, 'Quis dolor rerum incidunt eveniet placeat iusto ullam.', '2019-08-06 09:15:33');
INSERT INTO `order_items` VALUES (173, 86, 5, 15, 4, 121.00, 2, 'Quis dolor rerum incidunt eveniet placeat iusto ullam.', '2019-08-06 09:15:33');
INSERT INTO `order_items` VALUES (174, 86, 26, 77, 2, 5768.00, 2, 'Quis dolor rerum incidunt eveniet placeat iusto ullam.', '2019-08-06 09:15:33');
INSERT INTO `order_items` VALUES (175, 87, 8, 22, 3, 3063.00, NULL, NULL, NULL);
INSERT INTO `order_items` VALUES (176, 88, 12, 35, 4, 8743.00, 1, 'Esse cupiditate aperiam qui.', '2019-08-07 17:49:52');
INSERT INTO `order_items` VALUES (177, 89, 21, 61, 3, 9191.00, 4, 'Sit officiis quibusdam sed soluta iure minus.', '2019-08-03 17:57:23');
INSERT INTO `order_items` VALUES (178, 89, 20, 59, 3, 9674.00, 4, 'Sit officiis quibusdam sed soluta iure minus.', '2019-08-03 17:57:23');
INSERT INTO `order_items` VALUES (179, 90, 12, 35, 1, 8743.00, 2, 'Temporibus mollitia consequatur distinctio delectus harum eius officia.', '2019-08-06 06:44:42');
INSERT INTO `order_items` VALUES (180, 90, 7, 19, 4, 3905.00, 2, 'Temporibus mollitia consequatur distinctio delectus harum eius officia.', '2019-08-06 06:44:42');
INSERT INTO `order_items` VALUES (181, 91, 13, 37, 1, 5298.00, 5, 'Optio molestiae illum corporis et sed vel.', '2019-07-26 03:34:26');
INSERT INTO `order_items` VALUES (182, 92, 15, 43, 1, 3650.00, 1, 'Et facere nam harum commodi voluptas et id.', '2019-08-04 22:16:31');
INSERT INTO `order_items` VALUES (183, 92, 1, 1, 4, 4917.00, 1, 'Et facere nam harum commodi voluptas et id.', '2019-08-04 22:16:31');
INSERT INTO `order_items` VALUES (184, 93, 27, 81, 3, 2777.00, 2, 'Aut id earum ipsa.', '2019-07-31 05:44:28');
INSERT INTO `order_items` VALUES (185, 94, 18, 54, 4, 780.00, NULL, NULL, NULL);
INSERT INTO `order_items` VALUES (186, 95, 9, 27, 2, 7643.00, NULL, NULL, NULL);
INSERT INTO `order_items` VALUES (187, 96, 17, 49, 3, 4122.00, 1, 'Unde ut sapiente aut voluptatem numquam dolores et.', '2019-07-26 11:31:42');
INSERT INTO `order_items` VALUES (188, 96, 18, 52, 2, 9260.00, 1, 'Unde ut sapiente aut voluptatem numquam dolores et.', '2019-07-26 11:31:42');
INSERT INTO `order_items` VALUES (189, 97, 14, 41, 4, 4323.00, 1, 'Quia occaecati corrupti aut corrupti blanditiis aperiam repellendus.', '2019-08-04 16:28:20');
INSERT INTO `order_items` VALUES (190, 98, 7, 20, 4, 3156.00, NULL, NULL, NULL);
INSERT INTO `order_items` VALUES (191, 99, 22, 64, 5, 8797.00, 3, 'Earum impedit vel nobis eum.', '2019-08-07 04:34:34');
INSERT INTO `order_items` VALUES (192, 99, 20, 58, 5, 7259.00, 3, 'Earum impedit vel nobis eum.', '2019-08-07 04:34:34');
INSERT INTO `order_items` VALUES (193, 99, 13, 37, 3, 5298.00, 3, 'Earum impedit vel nobis eum.', '2019-08-07 04:34:34');
INSERT INTO `order_items` VALUES (194, 100, 6, 16, 5, 452.00, 1, 'Reprehenderit libero esse consequatur.', '2019-07-28 12:12:14');
INSERT INTO `order_items` VALUES (195, 100, 7, 20, 3, 3156.00, 1, 'Reprehenderit libero esse consequatur.', '2019-07-28 12:12:14');
INSERT INTO `order_items` VALUES (196, 100, 5, 15, 3, 121.00, 1, 'Reprehenderit libero esse consequatur.', '2019-07-28 12:12:14');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_amount` decimal(10, 2) NOT NULL,
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `paid_at` datetime(0) NULL DEFAULT NULL,
  `coupon_code_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `payment_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `payment_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `refund_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `refund_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `closed` tinyint(1) NOT NULL DEFAULT 0,
  `reviewed` tinyint(1) NOT NULL DEFAULT 0,
  `ship_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `ship_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `extra` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `orders_no_unique`(`no`) USING BTREE,
  UNIQUE INDEX `orders_refund_no_unique`(`refund_no`) USING BTREE,
  INDEX `orders_user_id_foreign`(`user_id`) USING BTREE,
  INDEX `orders_coupon_code_id_foreign`(`coupon_code_id`) USING BTREE,
  CONSTRAINT `orders_coupon_code_id_foreign` FOREIGN KEY (`coupon_code_id`) REFERENCES `coupon_codes` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1, '20190808095608815740', 37, '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u82cf\\u5dde\\u5e02\\u76f8\\u57ce\\u533a\\u7b2c54\\u8857\\u9053\\u7b2c563\\u53f7\",\"zip\":176400,\"contact_name\":\"\\u9f99\\u6587\\u5f6c\",\"contact_phone\":\"15593697432\"}', 2712.00, 'Quasi autem qui porro nobis mollitia quas.', '2019-07-29 07:46:55', NULL, 'alipay', '3d12e822-3328-3cc4-bfc2-f2f15ca3c5ec', 'pending', NULL, 0, 1, 'delivered', '{\"express_company\":\"\\u521b\\u4ebf\\u7f51\\u7edc\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"8d4370f2-5260-31bb-a7ca-a60ca256f586\"}', '[]', '2019-08-08 09:56:09', '2019-08-08 09:56:09');
INSERT INTO `orders` VALUES (2, '20190808095608999067', 64, '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u5357\\u4eac\\u5e02\\u6d66\\u53e3\\u533a\\u7b2c75\\u8857\\u9053\\u7b2c444\\u53f7\",\"zip\":533700,\"contact_name\":\"\\u8d3e\\u6dd1\\u82f1\",\"contact_phone\":\"15396724097\"}', 67566.00, 'Architecto quo cupiditate sit tempora sit totam.', '2019-07-23 03:05:39', NULL, 'wechat', '1861b072-8843-3741-8a9a-50ccf49d3fa3', 'pending', NULL, 0, 1, 'pending', NULL, '[]', '2019-08-08 09:56:09', '2019-08-08 09:56:10');
INSERT INTO `orders` VALUES (3, '20190808095609526450', 33, '{\"address\":\"\\u6cb3\\u5317\\u7701\\u77f3\\u5bb6\\u5e84\\u5e02\\u957f\\u5b89\\u533a\\u7b2c75\\u8857\\u9053\\u7b2c776\\u53f7\",\"zip\":213800,\"contact_name\":\"\\u4e25\\u6dd1\\u82f1\",\"contact_phone\":\"15702061732\"}', 15315.00, 'Nobis tenetur atque consequatur voluptatibus nihil.', '2019-07-21 07:36:19', NULL, 'wechat', '28057b40-76e8-3360-ac68-f42117b540d4', 'pending', NULL, 0, 1, 'pending', NULL, '[]', '2019-08-08 09:56:09', '2019-08-08 09:56:10');
INSERT INTO `orders` VALUES (4, '20190808095609215575', 79, '{\"address\":\"\\u6cb3\\u5317\\u7701\\u77f3\\u5bb6\\u5e84\\u5e02\\u957f\\u5b89\\u533a\\u7b2c81\\u8857\\u9053\\u7b2c407\\u53f7\",\"zip\":618500,\"contact_name\":\"\\u4f4d\\u6625\\u6885\",\"contact_phone\":\"13726002260\"}', 46300.00, 'Laboriosam suscipit vitae hic accusantium dolorem quas officia.', '2019-07-25 17:51:05', NULL, 'wechat', '700f84f7-731d-370d-9365-ec449f2f68a9', 'pending', NULL, 0, 0, 'delivered', '{\"express_company\":\"\\u65f6\\u7a7a\\u76d2\\u6570\\u5b57\\u7f51\\u7edc\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"15d0d1d1-962a-3c51-b119-b9643076ea18\"}', '[]', '2019-08-08 09:56:09', '2019-08-08 09:56:10');
INSERT INTO `orders` VALUES (5, '20190808095609706417', 15, '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u5357\\u4eac\\u5e02\\u6d66\\u53e3\\u533a\\u7b2c99\\u8857\\u9053\\u7b2c198\\u53f7\",\"zip\":503100,\"contact_name\":\"\\u683e\\u5f3a\",\"contact_phone\":\"15375800268\"}', 49756.00, 'Aut dolorum deserunt architecto.', '2019-08-06 03:18:20', NULL, 'alipay', '210f0455-678a-3297-bfd9-3b0a67db2483', 'pending', NULL, 0, 1, 'received', '{\"express_company\":\"\\u6613\\u52a8\\u529b\\u4fe1\\u606f\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"2aac2e24-fe3d-3cd5-8cde-8da83edfaeac\"}', '[]', '2019-08-08 09:56:09', '2019-08-08 09:56:10');
INSERT INTO `orders` VALUES (6, '20190808095609791012', 63, '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u5357\\u4eac\\u5e02\\u6d66\\u53e3\\u533a\\u7b2c48\\u8857\\u9053\\u7b2c683\\u53f7\",\"zip\":607100,\"contact_name\":\"\\u675c\\u6bc5\",\"contact_phone\":\"18057968093\"}', 42167.00, 'Rerum odit est veniam praesentium.', '2019-08-05 12:11:09', NULL, 'alipay', 'a19128f7-d017-3f0c-b6ee-47f0af233592', 'pending', NULL, 0, 1, 'pending', NULL, '[]', '2019-08-08 09:56:09', '2019-08-08 09:56:10');
INSERT INTO `orders` VALUES (7, '20190808095609107585', 27, '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u82cf\\u5dde\\u5e02\\u76f8\\u57ce\\u533a\\u7b2c20\\u8857\\u9053\\u7b2c859\\u53f7\",\"zip\":298300,\"contact_name\":\"\\u67f3\\u5065\",\"contact_phone\":\"13993534176\"}', 24342.00, 'Quasi pariatur eum velit deleniti dolor harum.', '2019-08-03 06:49:14', NULL, 'alipay', 'aad93e91-21af-37da-a59c-495cb98fdafe', 'pending', NULL, 0, 1, 'pending', NULL, '[]', '2019-08-08 09:56:09', '2019-08-08 09:56:10');
INSERT INTO `orders` VALUES (8, '20190808095609804922', 65, '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u5357\\u4eac\\u5e02\\u6d66\\u53e3\\u533a\\u7b2c0\\u8857\\u9053\\u7b2c246\\u53f7\",\"zip\":756900,\"contact_name\":\"\\u5ec9\\u51e4\\u5170\",\"contact_phone\":\"17051305797\"}', 32169.00, 'Velit voluptas magni quaerat velit minima necessitatibus enim ipsum.', '2019-07-27 17:12:12', NULL, 'alipay', 'd5a41dbf-1a3e-3afe-81ed-f2c2d0907ef3', 'pending', NULL, 0, 0, 'pending', NULL, '[]', '2019-08-08 09:56:09', '2019-08-08 09:56:10');
INSERT INTO `orders` VALUES (9, '20190808095609524313', 94, '{\"address\":\"\\u5e7f\\u4e1c\\u7701\\u6df1\\u5733\\u5e02\\u798f\\u7530\\u533a\\u7b2c78\\u8857\\u9053\\u7b2c384\\u53f7\",\"zip\":226900,\"contact_name\":\"\\u7530\\u6b22\",\"contact_phone\":\"13088468226\"}', 41370.00, 'Praesentium sequi repellendus ea voluptas fugit labore.', '2019-07-22 18:12:24', NULL, 'alipay', '5d4d5e2c-9f92-347f-b441-6825609d338a', 'pending', NULL, 0, 1, 'pending', NULL, '[]', '2019-08-08 09:56:09', '2019-08-08 09:56:10');
INSERT INTO `orders` VALUES (10, '20190808095609548088', 51, '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u82cf\\u5dde\\u5e02\\u76f8\\u57ce\\u533a\\u7b2c35\\u8857\\u9053\\u7b2c232\\u53f7\",\"zip\":622400,\"contact_name\":\"\\u8463\\u5229\",\"contact_phone\":\"17754298247\"}', 43370.62, 'Et veniam ipsa voluptatibus.', '2019-07-23 15:25:55', 17, 'alipay', 'fdc3a5b3-eae3-39fc-93aa-fdcb58325eee', 'pending', NULL, 0, 1, 'pending', NULL, '[]', '2019-08-08 09:56:09', '2019-08-08 09:56:10');
INSERT INTO `orders` VALUES (11, '20190808095609573156', 72, '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u5357\\u4eac\\u5e02\\u6d66\\u53e3\\u533a\\u7b2c57\\u8857\\u9053\\u7b2c127\\u53f7\",\"zip\":77400,\"contact_name\":\"\\u621a\\u677e\",\"contact_phone\":\"18032803140\"}', 6556.00, 'Eligendi velit itaque sunt consequatur molestiae ad.', '2019-07-26 09:29:12', NULL, 'alipay', '9c232b74-d67b-3021-ab97-40def11533cb', 'pending', NULL, 0, 1, 'received', '{\"express_company\":\"\\u96e8\\u6797\\u6728\\u98ce\\u8ba1\\u7b97\\u673a\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"58f8215b-215d-3e30-8151-9f3fbdea2000\"}', '[]', '2019-08-08 09:56:09', '2019-08-08 09:56:10');
INSERT INTO `orders` VALUES (12, '20190808095609706512', 29, '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u82cf\\u5dde\\u5e02\\u76f8\\u57ce\\u533a\\u7b2c91\\u8857\\u9053\\u7b2c449\\u53f7\",\"zip\":541300,\"contact_name\":\"\\u9976\\u6842\\u8363\",\"contact_phone\":\"17004599551\"}', 23052.00, 'Sed corporis ut natus non non.', '2019-07-17 13:32:56', NULL, 'wechat', '219c70c3-ad66-35e9-963c-e8913cffe0e7', 'pending', NULL, 0, 0, 'received', '{\"express_company\":\"\\u6069\\u608c\\u4f20\\u5a92\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"7f4db3d7-9cee-304b-a35a-f9bd0f99ebbc\"}', '[]', '2019-08-08 09:56:09', '2019-08-08 09:56:10');
INSERT INTO `orders` VALUES (13, '20190808095609750794', 81, '{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u4e1c\\u57ce\\u533a\\u7b2c13\\u8857\\u9053\\u7b2c801\\u53f7\",\"zip\":721900,\"contact_name\":\"\\u683e\\u6210\",\"contact_phone\":\"18827412667\"}', 10751.84, 'Earum sit enim cumque dicta.', '2019-07-22 21:54:37', 17, 'alipay', 'd1ebdacf-3dc9-34dd-814b-fb78174d50a5', 'pending', NULL, 0, 1, 'delivered', '{\"express_company\":\"\\u6bd5\\u535a\\u8bda\\u4fe1\\u606f\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"2740a440-aba4-352d-af8b-e4faa7df3183\"}', '[]', '2019-08-08 09:56:09', '2019-08-08 09:56:10');
INSERT INTO `orders` VALUES (14, '20190808095609929645', 36, '{\"address\":\"\\u5e7f\\u4e1c\\u7701\\u6df1\\u5733\\u5e02\\u798f\\u7530\\u533a\\u7b2c57\\u8857\\u9053\\u7b2c665\\u53f7\",\"zip\":698400,\"contact_name\":\"\\u853a\\u632f\\u56fd\",\"contact_phone\":\"15256886134\"}', 20125.00, 'Blanditiis quaerat ipsa quos mollitia ea quos.', '2019-07-11 18:50:50', NULL, 'alipay', '14ccfa61-ec22-3894-a0c6-ca280c306570', 'pending', NULL, 0, 0, 'pending', NULL, '[]', '2019-08-08 09:56:09', '2019-08-08 09:56:10');
INSERT INTO `orders` VALUES (15, '20190808095609839879', 96, '{\"address\":\"\\u6cb3\\u5317\\u7701\\u77f3\\u5bb6\\u5e84\\u5e02\\u957f\\u5b89\\u533a\\u7b2c74\\u8857\\u9053\\u7b2c630\\u53f7\",\"zip\":568400,\"contact_name\":\"\\u66fe\\u9f99\",\"contact_phone\":\"17090134884\"}', 9639.00, 'Similique iusto dolor occaecati corporis repellendus.', '2019-07-25 06:52:29', NULL, 'alipay', '6f0986e2-c7da-369b-aac9-1601bd6bcbd8', 'pending', NULL, 0, 1, 'delivered', '{\"express_company\":\"\\u540c\\u5174\\u4e07\\u70b9\\u7f51\\u7edc\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"5f87e554-1058-3b8d-97ad-222d971a8825\"}', '[]', '2019-08-08 09:56:09', '2019-08-08 09:56:10');
INSERT INTO `orders` VALUES (16, '20190808095609656595', 55, '{\"address\":\"\\u5e7f\\u4e1c\\u7701\\u6df1\\u5733\\u5e02\\u798f\\u7530\\u533a\\u7b2c46\\u8857\\u9053\\u7b2c337\\u53f7\",\"zip\":468400,\"contact_name\":\"\\u590f\\u6842\\u82f1\",\"contact_phone\":\"18228907835\"}', 26617.00, 'Voluptas sed numquam autem ipsum et ducimus.', '2019-08-06 16:52:35', NULL, 'wechat', 'e06cc0c9-5151-34c6-a18a-b3747abeccdc', 'pending', NULL, 0, 1, 'received', '{\"express_company\":\"\\u6602\\u6b4c\\u4fe1\\u606f\\u7f51\\u7edc\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"70bf19d4-1d2e-3746-81b3-84aab792d1bb\"}', '[]', '2019-08-08 09:56:09', '2019-08-08 09:56:10');
INSERT INTO `orders` VALUES (17, '20190808095609277624', 46, '{\"address\":\"\\u5e7f\\u4e1c\\u7701\\u6df1\\u5733\\u5e02\\u798f\\u7530\\u533a\\u7b2c98\\u8857\\u9053\\u7b2c205\\u53f7\",\"zip\":45300,\"contact_name\":\"\\u738b\\u6d01\",\"contact_phone\":\"17754262368\"}', 1808.00, 'Veritatis aut quos eos blanditiis.', '2019-07-10 04:48:48', NULL, 'wechat', 'a920de26-fa9c-3ff8-9a6e-eb509192a65d', 'pending', NULL, 0, 1, 'pending', NULL, '[]', '2019-08-08 09:56:09', '2019-08-08 09:56:10');
INSERT INTO `orders` VALUES (18, '20190808095609972697', 23, '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u82cf\\u5dde\\u5e02\\u76f8\\u57ce\\u533a\\u7b2c97\\u8857\\u9053\\u7b2c198\\u53f7\",\"zip\":134900,\"contact_name\":\"\\u4e1b\\u9e4f\",\"contact_phone\":\"15280042955\"}', 62502.00, 'Vitae dolorum vel in vitae rerum.', '2019-07-12 10:43:55', NULL, 'alipay', '32c57ccc-74f5-386c-b8b3-396009941df2', 'pending', NULL, 0, 0, 'pending', NULL, '[]', '2019-08-08 09:56:09', '2019-08-08 09:56:10');
INSERT INTO `orders` VALUES (19, '20190808095609251278', 18, '{\"address\":\"\\u6cb3\\u5317\\u7701\\u77f3\\u5bb6\\u5e84\\u5e02\\u957f\\u5b89\\u533a\\u7b2c36\\u8857\\u9053\\u7b2c836\\u53f7\",\"zip\":582400,\"contact_name\":\"\\u6c5f\\u7434\",\"contact_phone\":\"17796048239\"}', 49170.00, 'Quo quos quia aut quaerat ut suscipit.', '2019-07-31 07:46:21', NULL, 'alipay', 'c2d54e45-063b-3a71-92d5-a7cf36a5db4a', 'pending', NULL, 0, 1, 'pending', NULL, '[]', '2019-08-08 09:56:09', '2019-08-08 09:56:10');
INSERT INTO `orders` VALUES (20, '20190808095609706003', 71, '{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u4e1c\\u57ce\\u533a\\u7b2c64\\u8857\\u9053\\u7b2c573\\u53f7\",\"zip\":288600,\"contact_name\":\"\\u90b8\\u6021\",\"contact_phone\":\"18614302621\"}', 50480.00, 'Ut architecto velit aut repellat.', '2019-07-15 10:14:12', NULL, 'wechat', '3933eb04-acb2-3356-9481-6d7e992a811c', 'success', 'e993447b4022445d847b73dc68b77f0c', 0, 1, 'received', '{\"express_company\":\"\\u65b0\\u5b87\\u9f99\\u4fe1\\u606f\\u7f51\\u7edc\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"4308ad5b-2b88-328c-bfe3-8bbac8e243f1\"}', '{\"refund_reason\":\"Animi sint consequatur accusamus consectetur.\"}', '2019-08-08 09:56:09', '2019-08-08 09:56:10');
INSERT INTO `orders` VALUES (21, '20190808095609882258', 6, '{\"address\":\"\\u5e7f\\u4e1c\\u7701\\u6df1\\u5733\\u5e02\\u798f\\u7530\\u533a\\u7b2c8\\u8857\\u9053\\u7b2c944\\u53f7\",\"zip\":74700,\"contact_name\":\"\\u6b27\\u9633\\u82f1\",\"contact_phone\":\"17193017324\"}', 13148.00, 'Saepe maxime corrupti voluptas consequatur voluptatem distinctio libero.', '2019-07-13 22:55:48', NULL, 'wechat', '6864cb26-55a4-3cd6-9431-3a88f250f9f4', 'pending', NULL, 0, 0, 'delivered', '{\"express_company\":\"\\u5bcc\\u7f73\\u7f51\\u7edc\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"39f1436e-f6d8-322d-8d55-2a34d68e5990\"}', '[]', '2019-08-08 09:56:09', '2019-08-08 09:56:10');
INSERT INTO `orders` VALUES (22, '20190808095609463046', 27, '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u82cf\\u5dde\\u5e02\\u76f8\\u57ce\\u533a\\u7b2c20\\u8857\\u9053\\u7b2c859\\u53f7\",\"zip\":298300,\"contact_name\":\"\\u67f3\\u5065\",\"contact_phone\":\"13993534176\"}', 25400.32, 'Quasi cumque non earum culpa.', '2019-07-17 11:36:00', 17, 'wechat', '5b9f6ae1-b131-32fe-acff-df61490edbcd', 'success', '1d783b9d79e442658eb855e234149772', 0, 1, 'received', '{\"express_company\":\"\\u6570\\u5b57100\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"5d23f62d-6752-3f3d-b665-6aebb9c0331c\"}', '{\"refund_reason\":\"Consequatur doloribus molestiae placeat sit.\"}', '2019-08-08 09:56:09', '2019-08-08 09:56:10');
INSERT INTO `orders` VALUES (23, '20190808095609763506', 30, '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u5357\\u4eac\\u5e02\\u6d66\\u53e3\\u533a\\u7b2c61\\u8857\\u9053\\u7b2c257\\u53f7\",\"zip\":37800,\"contact_name\":\"\\u9676\\u6631\\u7136\",\"contact_phone\":\"17005811075\"}', 70154.00, 'Ducimus quidem hic ipsa qui ducimus eum veritatis.', '2019-07-10 09:40:03', NULL, 'wechat', 'ba522062-81c3-31f4-a549-174cdb9e2a84', 'pending', NULL, 0, 1, 'delivered', '{\"express_company\":\"\\u5546\\u8f6f\\u51a0\\u8054\\u7f51\\u7edc\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"441591eb-54cf-3814-a292-4a68276d4dc9\"}', '[]', '2019-08-08 09:56:09', '2019-08-08 09:56:10');
INSERT INTO `orders` VALUES (24, '20190808095609320727', 12, '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u82cf\\u5dde\\u5e02\\u76f8\\u57ce\\u533a\\u7b2c10\\u8857\\u9053\\u7b2c357\\u53f7\",\"zip\":822400,\"contact_name\":\"\\u83ab\\u5b66\\u660e\",\"contact_phone\":\"18488001435\"}', 63928.00, 'Quia occaecati assumenda voluptatem excepturi enim sint soluta.', '2019-07-18 18:07:42', NULL, 'wechat', '0753235b-ca12-33eb-bd1f-e1c1afa0affa', 'pending', NULL, 0, 1, 'pending', NULL, '[]', '2019-08-08 09:56:09', '2019-08-08 09:56:10');
INSERT INTO `orders` VALUES (25, '20190808095609138709', 15, '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u5357\\u4eac\\u5e02\\u6d66\\u53e3\\u533a\\u7b2c99\\u8857\\u9053\\u7b2c198\\u53f7\",\"zip\":503100,\"contact_name\":\"\\u683e\\u5f3a\",\"contact_phone\":\"15375800268\"}', 58479.00, 'Illo enim quia et tenetur enim.', '2019-07-19 10:35:42', NULL, 'wechat', '3224cdb8-3184-305e-8106-1cf278b1e743', 'pending', NULL, 0, 1, 'received', '{\"express_company\":\"\\u60e0\\u6d3e\\u56fd\\u9645\\u516c\\u53f8\\u4fe1\\u606f\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"abc21af6-2f7a-3ae0-8180-06bdbc401a93\"}', '[]', '2019-08-08 09:56:09', '2019-08-08 09:56:10');
INSERT INTO `orders` VALUES (26, '20190808095609164609', 1, '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u5357\\u4eac\\u5e02\\u6d66\\u53e3\\u533a\\u7b2c23\\u8857\\u9053\\u7b2c351\\u53f7\",\"zip\":167600,\"contact_name\":\"\\u6bd5\\u51e4\\u5170\",\"contact_phone\":\"18406911894\"}', 34584.00, 'Nostrum asperiores alias doloremque consequatur voluptas.', '2019-07-27 01:30:37', NULL, 'wechat', '55ced4c5-c65c-38bf-99a3-cfffa69cafc8', 'pending', NULL, 0, 1, 'pending', NULL, '[]', '2019-08-08 09:56:09', '2019-08-08 09:56:10');
INSERT INTO `orders` VALUES (27, '20190808095609803242', 65, '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u5357\\u4eac\\u5e02\\u6d66\\u53e3\\u533a\\u7b2c0\\u8857\\u9053\\u7b2c246\\u53f7\",\"zip\":756900,\"contact_name\":\"\\u5ec9\\u51e4\\u5170\",\"contact_phone\":\"17051305797\"}', 37494.50, 'Aut dolor possimus numquam earum.', '2019-07-27 03:23:05', 17, 'wechat', '194e1620-fb63-3643-b4b7-ff68e2825d08', 'pending', NULL, 0, 0, 'received', '{\"express_company\":\"\\u5357\\u5eb7\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"3f4d4076-fecd-3033-a747-848bf9cbf93a\"}', '[]', '2019-08-08 09:56:09', '2019-08-08 09:56:10');
INSERT INTO `orders` VALUES (28, '20190808095609708065', 8, '{\"address\":\"\\u6cb3\\u5317\\u7701\\u77f3\\u5bb6\\u5e84\\u5e02\\u957f\\u5b89\\u533a\\u7b2c80\\u8857\\u9053\\u7b2c284\\u53f7\",\"zip\":185400,\"contact_name\":\"\\u4f59\\u9f99\",\"contact_phone\":\"18721083693\"}', 23394.00, 'Explicabo dolor omnis ex error facilis aspernatur.', '2019-07-24 14:08:39', NULL, 'alipay', 'c2e20a29-e35a-3b26-8211-a709409f5125', 'pending', NULL, 0, 1, 'delivered', '{\"express_company\":\"\\u521b\\u4ebf\\u7f51\\u7edc\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"96f0887a-d333-37a0-ba93-45d821ad18bc\"}', '[]', '2019-08-08 09:56:09', '2019-08-08 09:56:10');
INSERT INTO `orders` VALUES (29, '20190808095609558535', 71, '{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u4e1c\\u57ce\\u533a\\u7b2c64\\u8857\\u9053\\u7b2c573\\u53f7\",\"zip\":288600,\"contact_name\":\"\\u90b8\\u6021\",\"contact_phone\":\"18614302621\"}', 77960.00, 'Quam ex pariatur reprehenderit corporis similique temporibus consectetur.', '2019-07-20 10:51:12', NULL, 'wechat', '3d5dad7f-18da-34ba-ba20-25a3f1929acd', 'pending', NULL, 0, 1, 'delivered', '{\"express_company\":\"\\u6d66\\u534e\\u4f17\\u57ce\\u4fe1\\u606f\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"433bc23e-f796-3a54-a3f5-40b2be32544a\"}', '[]', '2019-08-08 09:56:09', '2019-08-08 09:56:10');
INSERT INTO `orders` VALUES (30, '20190808095609177121', 13, '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u5357\\u4eac\\u5e02\\u6d66\\u53e3\\u533a\\u7b2c74\\u8857\\u9053\\u7b2c581\\u53f7\",\"zip\":162100,\"contact_name\":\"\\u4e54\\u6dd1\\u82f1\",\"contact_phone\":\"18319930195\"}', 30285.00, 'Quam alias quisquam ea itaque sapiente error quae.', '2019-08-06 11:57:24', NULL, 'wechat', '30d0e179-cdda-3265-bcf7-1f629aa3bbff', 'pending', NULL, 0, 1, 'delivered', '{\"express_company\":\"\\u4e07\\u8fc5\\u7535\\u8111\\u4f20\\u5a92\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"5e048c6e-d673-3bcf-98cc-83dd8b34a2e6\"}', '[]', '2019-08-08 09:56:09', '2019-08-08 09:56:10');
INSERT INTO `orders` VALUES (31, '20190808095609529766', 84, '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u82cf\\u5dde\\u5e02\\u76f8\\u57ce\\u533a\\u7b2c28\\u8857\\u9053\\u7b2c718\\u53f7\",\"zip\":672800,\"contact_name\":\"\\u55bb\\u6842\\u829d\",\"contact_phone\":\"18806623922\"}', 18171.00, 'Beatae in autem et dolor voluptate necessitatibus.', '2019-07-29 09:37:47', NULL, 'wechat', 'da3864ba-6c2e-38f2-b0f9-035fc27f6c5d', 'pending', NULL, 0, 1, 'pending', NULL, '[]', '2019-08-08 09:56:09', '2019-08-08 09:56:10');
INSERT INTO `orders` VALUES (32, '20190808095609583200', 35, '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u82cf\\u5dde\\u5e02\\u76f8\\u57ce\\u533a\\u7b2c81\\u8857\\u9053\\u7b2c570\\u53f7\",\"zip\":134300,\"contact_name\":\"\\u9879\\u5e06\",\"contact_phone\":\"14765033313\"}', 23997.30, 'Perspiciatis laborum voluptas fugit.', '2019-07-18 04:17:21', 17, 'alipay', 'b82ca525-7792-3316-be6d-e7217d94c5ef', 'pending', NULL, 0, 1, 'pending', NULL, '[]', '2019-08-08 09:56:09', '2019-08-08 09:56:10');
INSERT INTO `orders` VALUES (33, '20190808095609425455', 36, '{\"address\":\"\\u5e7f\\u4e1c\\u7701\\u6df1\\u5733\\u5e02\\u798f\\u7530\\u533a\\u7b2c57\\u8857\\u9053\\u7b2c665\\u53f7\",\"zip\":698400,\"contact_name\":\"\\u853a\\u632f\\u56fd\",\"contact_phone\":\"15256886134\"}', 484.00, 'Officiis debitis dolore animi illo dolorem quos.', '2019-07-09 10:54:53', NULL, 'alipay', 'd89fd5e0-0ad1-33ee-a1f3-8a9f838ca754', 'pending', NULL, 0, 1, 'received', '{\"express_company\":\"\\u7f51\\u65b0\\u6052\\u5929\\u7f51\\u7edc\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"94787afa-fdb4-3d53-aaf5-ac25c02dd671\"}', '[]', '2019-08-08 09:56:09', '2019-08-08 09:56:10');
INSERT INTO `orders` VALUES (34, '20190808095609381499', 31, '{\"address\":\"\\u5e7f\\u4e1c\\u7701\\u6df1\\u5733\\u5e02\\u798f\\u7530\\u533a\\u7b2c24\\u8857\\u9053\\u7b2c635\\u53f7\",\"zip\":552400,\"contact_name\":\"\\u5b98\\u6b23\",\"contact_phone\":\"18242164096\"}', 35333.00, 'Veniam aut tempora consequatur labore ipsum enim cum.', '2019-07-18 17:45:45', NULL, 'wechat', '51ce5c98-4763-3aa7-91a5-7183565c6e37', 'pending', NULL, 0, 1, 'received', '{\"express_company\":\"\\u6d77\\u521b\\u7f51\\u7edc\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"64f11733-f323-39a4-aeea-2ac7bb430f55\"}', '[]', '2019-08-08 09:56:09', '2019-08-08 09:56:10');
INSERT INTO `orders` VALUES (35, '20190808095609479910', 95, '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u5357\\u4eac\\u5e02\\u6d66\\u53e3\\u533a\\u7b2c22\\u8857\\u9053\\u7b2c791\\u53f7\",\"zip\":824600,\"contact_name\":\"\\u7ae5\\u654f\\u9759\",\"contact_phone\":\"18268077775\"}', 33439.00, 'Eligendi asperiores ea temporibus.', '2019-07-17 16:33:46', NULL, 'wechat', '2a7150b5-24f1-3081-988c-4e22922feb03', 'pending', NULL, 0, 0, 'delivered', '{\"express_company\":\"\\u83ca\\u98ce\\u516c\\u53f8\\u7f51\\u7edc\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"1ca7801a-fec8-3bd9-8eac-8740d80ed81b\"}', '[]', '2019-08-08 09:56:09', '2019-08-08 09:56:11');
INSERT INTO `orders` VALUES (36, '20190808095609640615', 82, '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u82cf\\u5dde\\u5e02\\u76f8\\u57ce\\u533a\\u7b2c87\\u8857\\u9053\\u7b2c327\\u53f7\",\"zip\":317300,\"contact_name\":\"\\u7545\\u745c\",\"contact_phone\":\"15133731674\"}', 7924.00, 'Est expedita praesentium debitis.', '2019-07-18 11:08:16', NULL, 'wechat', 'f1a5b15e-65fd-337a-9f67-0de602f2d31a', 'pending', NULL, 0, 0, 'pending', NULL, '[]', '2019-08-08 09:56:09', '2019-08-08 09:56:11');
INSERT INTO `orders` VALUES (37, '20190808095609749128', 83, '{\"address\":\"\\u5e7f\\u4e1c\\u7701\\u6df1\\u5733\\u5e02\\u798f\\u7530\\u533a\\u7b2c71\\u8857\\u9053\\u7b2c429\\u53f7\",\"zip\":797000,\"contact_name\":\"\\u6234\\u667a\\u52c7\",\"contact_phone\":\"15669584492\"}', 8549.00, 'Nemo porro ut aspernatur soluta facilis velit odio.', '2019-07-11 12:54:58', NULL, 'wechat', '7a25e472-85ca-3f62-ad86-421d386735f6', 'pending', NULL, 0, 1, 'received', '{\"express_company\":\"\\u534e\\u8fdc\\u8f6f\\u4ef6\\u4fe1\\u606f\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"43e53723-9240-311c-9325-3f8f984db0a1\"}', '[]', '2019-08-08 09:56:09', '2019-08-08 09:56:11');
INSERT INTO `orders` VALUES (38, '20190808095609009647', 30, '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u5357\\u4eac\\u5e02\\u6d66\\u53e3\\u533a\\u7b2c64\\u8857\\u9053\\u7b2c389\\u53f7\",\"zip\":77100,\"contact_name\":\"\\u8d39\\u5f6c\",\"contact_phone\":\"13794990848\"}', 19419.00, 'Ducimus expedita iusto voluptas est sit consectetur ut.', '2019-08-01 19:06:11', NULL, 'wechat', '229907a9-f959-35ea-89cd-f2a4834236bc', 'pending', NULL, 0, 1, 'received', '{\"express_company\":\"\\u6d77\\u521b\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"ec405f7d-0a16-3a96-b7f1-0505c7b19b14\"}', '[]', '2019-08-08 09:56:09', '2019-08-08 09:56:11');
INSERT INTO `orders` VALUES (39, '20190808095609243866', 47, '{\"address\":\"\\u6cb3\\u5317\\u7701\\u77f3\\u5bb6\\u5e84\\u5e02\\u957f\\u5b89\\u533a\\u7b2c83\\u8857\\u9053\\u7b2c833\\u53f7\",\"zip\":577000,\"contact_name\":\"\\u59ec\\u6021\",\"contact_phone\":\"18280701128\"}', 47374.68, 'Qui porro accusantium velit ut ipsum.', '2019-07-29 12:10:44', 17, 'wechat', '24150976-2ac5-328f-a98c-e6b53e15178d', 'pending', NULL, 0, 0, 'received', '{\"express_company\":\"\\u98de\\u6d77\\u79d1\\u6280\\u7f51\\u7edc\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"c9db054a-34dc-3081-a660-333836bb099c\"}', '[]', '2019-08-08 09:56:09', '2019-08-08 09:56:11');
INSERT INTO `orders` VALUES (40, '20190808095609293831', 100, '{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u4e1c\\u57ce\\u533a\\u7b2c81\\u8857\\u9053\\u7b2c859\\u53f7\",\"zip\":587200,\"contact_name\":\"\\u82d7\\u79c0\\u4e91\",\"contact_phone\":\"17017031507\"}', 2164.00, 'Maxime ea expedita dignissimos.', '2019-08-02 21:23:11', NULL, 'alipay', '02977c91-028e-34f8-af49-d4bd279e0d23', 'pending', NULL, 0, 1, 'pending', NULL, '[]', '2019-08-08 09:56:09', '2019-08-08 09:56:11');
INSERT INTO `orders` VALUES (41, '20190808095609624669', 51, '{\"address\":\"\\u5e7f\\u4e1c\\u7701\\u6df1\\u5733\\u5e02\\u798f\\u7530\\u533a\\u7b2c21\\u8857\\u9053\\u7b2c25\\u53f7\",\"zip\":542600,\"contact_name\":\"\\u6210\\u660e\\u971e\",\"contact_phone\":\"13717020877\"}', 45115.00, 'Ipsam magnam quaerat quod blanditiis.', '2019-07-31 06:14:51', NULL, 'alipay', 'a08511f1-00cc-33a8-8eb3-091c7e20a091', 'pending', NULL, 0, 0, 'pending', NULL, '[]', '2019-08-08 09:56:09', '2019-08-08 09:56:11');
INSERT INTO `orders` VALUES (42, '20190808095609428806', 26, '{\"address\":\"\\u5e7f\\u4e1c\\u7701\\u6df1\\u5733\\u5e02\\u798f\\u7530\\u533a\\u7b2c3\\u8857\\u9053\\u7b2c672\\u53f7\",\"zip\":724100,\"contact_name\":\"\\u5409\\u56fd\\u5e86\",\"contact_phone\":\"17032261875\"}', 16696.00, 'Laborum nulla qui ut molestiae officia repudiandae.', '2019-07-26 13:46:42', NULL, 'wechat', '8a152cb3-992b-3d8d-8a3d-74d3ab8d65ac', 'pending', NULL, 0, 1, 'received', '{\"express_company\":\"\\u534e\\u8fdc\\u8f6f\\u4ef6\\u4fe1\\u606f\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"e136112d-22f5-37a7-a178-ddac5c228dd2\"}', '[]', '2019-08-08 09:56:09', '2019-08-08 09:56:11');
INSERT INTO `orders` VALUES (43, '20190808095609370376', 26, '{\"address\":\"\\u5e7f\\u4e1c\\u7701\\u6df1\\u5733\\u5e02\\u798f\\u7530\\u533a\\u7b2c3\\u8857\\u9053\\u7b2c672\\u53f7\",\"zip\":724100,\"contact_name\":\"\\u5409\\u56fd\\u5e86\",\"contact_phone\":\"17032261875\"}', 46573.00, 'Neque facilis beatae ducimus id libero amet optio rem.', '2019-07-12 00:39:21', NULL, 'wechat', '9244c9d6-46cd-380d-841a-11d123e33638', 'pending', NULL, 0, 0, 'pending', NULL, '[]', '2019-08-08 09:56:09', '2019-08-08 09:56:11');
INSERT INTO `orders` VALUES (44, '20190808095609390373', 47, '{\"address\":\"\\u6cb3\\u5317\\u7701\\u77f3\\u5bb6\\u5e84\\u5e02\\u957f\\u5b89\\u533a\\u7b2c83\\u8857\\u9053\\u7b2c833\\u53f7\",\"zip\":577000,\"contact_name\":\"\\u59ec\\u6021\",\"contact_phone\":\"18280701128\"}', 54179.30, 'Fuga aut ut dicta eligendi dolor ipsam.', '2019-07-25 00:30:41', 19, 'wechat', 'd7e1da5b-41dd-3e87-b5d0-259a9efc3880', 'pending', NULL, 0, 1, 'pending', NULL, '[]', '2019-08-08 09:56:09', '2019-08-08 09:56:11');
INSERT INTO `orders` VALUES (45, '20190808095609186080', 57, '{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u4e1c\\u57ce\\u533a\\u7b2c96\\u8857\\u9053\\u7b2c799\\u53f7\",\"zip\":585000,\"contact_name\":\"\\u4efb\\u79c0\\u82f1\",\"contact_phone\":\"17848394779\"}', 22380.00, 'Qui ea dolor assumenda porro deleniti quos.', '2019-07-19 07:19:37', NULL, 'wechat', '839007ea-ce3c-3335-ad4a-43304cf9e760', 'pending', NULL, 0, 0, 'delivered', '{\"express_company\":\"\\u827e\\u63d0\\u79d1\\u4fe1\\u4fe1\\u606f\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"333b5672-8419-39da-bd8f-25dbc086db9c\"}', '[]', '2019-08-08 09:56:09', '2019-08-08 09:56:11');
INSERT INTO `orders` VALUES (46, '20190808095609271767', 19, '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u82cf\\u5dde\\u5e02\\u76f8\\u57ce\\u533a\\u7b2c73\\u8857\\u9053\\u7b2c380\\u53f7\",\"zip\":221400,\"contact_name\":\"\\u5d7a\\u51e4\\u82f1\",\"contact_phone\":\"14740083431\"}', 37203.00, 'Quibusdam et culpa eaque veniam et.', '2019-07-23 11:58:24', NULL, 'alipay', '51991325-f08d-3843-a4dd-a93217f2b0ac', 'pending', NULL, 0, 1, 'delivered', '{\"express_company\":\"\\u5bcc\\u7f73\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"9cdb793f-f939-3abf-8867-81cc12a1fe65\"}', '[]', '2019-08-08 09:56:09', '2019-08-08 09:56:11');
INSERT INTO `orders` VALUES (47, '20190808095609231674', 29, '{\"address\":\"\\u5e7f\\u4e1c\\u7701\\u6df1\\u5733\\u5e02\\u798f\\u7530\\u533a\\u7b2c38\\u8857\\u9053\\u7b2c533\\u53f7\",\"zip\":335800,\"contact_name\":\"\\u63ed\\u8d85\",\"contact_phone\":\"15625409543\"}', 33340.38, 'Praesentium necessitatibus at sint ad debitis.', '2019-07-19 01:09:19', 17, 'wechat', 'acd49922-7181-3075-bce6-11fd56ca18eb', 'pending', NULL, 0, 0, 'received', '{\"express_company\":\"\\u5357\\u5eb7\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"50cc07e4-d1cf-3095-9141-d58829df28df\"}', '[]', '2019-08-08 09:56:09', '2019-08-08 09:56:11');
INSERT INTO `orders` VALUES (48, '20190808095609658944', 49, '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u82cf\\u5dde\\u5e02\\u76f8\\u57ce\\u533a\\u7b2c55\\u8857\\u9053\\u7b2c672\\u53f7\",\"zip\":293300,\"contact_name\":\"\\u664b\\u82b3\",\"contact_phone\":\"18820497042\"}', 24869.00, 'Officiis doloribus at soluta vitae sapiente nam molestiae.', '2019-07-20 09:32:36', NULL, 'alipay', '3f753496-f41a-3b05-8542-e148365b6339', 'pending', NULL, 0, 0, 'pending', NULL, '[]', '2019-08-08 09:56:09', '2019-08-08 09:56:11');
INSERT INTO `orders` VALUES (49, '20190808095609389232', 81, '{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u4e1c\\u57ce\\u533a\\u7b2c13\\u8857\\u9053\\u7b2c801\\u53f7\",\"zip\":721900,\"contact_name\":\"\\u683e\\u6210\",\"contact_phone\":\"18827412667\"}', 48387.00, 'In error fugit occaecati eum.', '2019-08-01 21:13:51', NULL, 'alipay', '0cb5af24-7832-37d9-98fd-95186c3806cb', 'pending', NULL, 0, 1, 'received', '{\"express_company\":\"\\u946b\\u535a\\u817e\\u98de\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"82cc2ee6-a8c2-3833-9069-f0c34203ee87\"}', '[]', '2019-08-08 09:56:09', '2019-08-08 09:56:11');
INSERT INTO `orders` VALUES (50, '20190808095609408101', 12, '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u82cf\\u5dde\\u5e02\\u76f8\\u57ce\\u533a\\u7b2c34\\u8857\\u9053\\u7b2c742\\u53f7\",\"zip\":32700,\"contact_name\":\"\\u90b5\\u5fd7\\u6587\",\"contact_phone\":\"15795748794\"}', 18713.00, 'Velit dolorem nesciunt sunt quos.', '2019-07-21 17:12:00', NULL, 'wechat', '4224c6be-5659-33e0-9c85-c94e4159243b', 'success', '969267666b904a16866703b065441ee7', 0, 1, 'pending', NULL, '{\"refund_reason\":\"Et ipsam consequatur aut rerum deleniti atque.\"}', '2019-08-08 09:56:09', '2019-08-08 09:56:11');
INSERT INTO `orders` VALUES (51, '20190808095609296608', 6, '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u82cf\\u5dde\\u5e02\\u76f8\\u57ce\\u533a\\u7b2c87\\u8857\\u9053\\u7b2c625\\u53f7\",\"zip\":143500,\"contact_name\":\"\\u97e9\\u6960\",\"contact_phone\":\"15058072188\"}', 34824.00, 'Rerum qui id natus qui rerum porro.', '2019-07-21 16:12:34', NULL, 'wechat', '692d812a-a21a-3313-934b-ba92c514c11d', 'pending', NULL, 0, 0, 'delivered', '{\"express_company\":\"\\u7ef4\\u65fa\\u660e\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"fe34e663-1173-39b8-a5cc-97bd0bd0eae0\"}', '[]', '2019-08-08 09:56:09', '2019-08-08 09:56:11');
INSERT INTO `orders` VALUES (52, '20190808095609250343', 30, '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u82cf\\u5dde\\u5e02\\u76f8\\u57ce\\u533a\\u7b2c16\\u8857\\u9053\\u7b2c483\\u53f7\",\"zip\":94900,\"contact_name\":\"\\u9093\\u946b\",\"contact_phone\":\"18281213018\"}', 28157.00, 'Accusantium eos quis est molestiae doloremque.', '2019-07-11 09:21:22', NULL, 'wechat', '918065cd-1b39-3df6-85df-339adef435cc', 'pending', NULL, 0, 1, 'received', '{\"express_company\":\"\\u660e\\u817e\\u4f20\\u5a92\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"3046c32e-c4fa-3b9b-972f-05710b9eea9f\"}', '[]', '2019-08-08 09:56:09', '2019-08-08 09:56:11');
INSERT INTO `orders` VALUES (53, '20190808095609917564', 69, '{\"address\":\"\\u6cb3\\u5317\\u7701\\u77f3\\u5bb6\\u5e84\\u5e02\\u957f\\u5b89\\u533a\\u7b2c4\\u8857\\u9053\\u7b2c495\\u53f7\",\"zip\":283000,\"contact_name\":\"\\u4e25\\u745e\",\"contact_phone\":\"17012775161\"}', 14929.74, 'Assumenda et natus nam nulla vel id.', '2019-07-16 18:42:50', 17, 'alipay', 'f10127a1-75be-3ca4-8f05-a734d1899867', 'pending', NULL, 0, 1, 'pending', NULL, '[]', '2019-08-08 09:56:09', '2019-08-08 09:56:11');
INSERT INTO `orders` VALUES (54, '20190808095609101916', 68, '{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u4e1c\\u57ce\\u533a\\u7b2c89\\u8857\\u9053\\u7b2c171\\u53f7\",\"zip\":665200,\"contact_name\":\"\\u5415\\u6377\",\"contact_phone\":\"17050236759\"}', 30081.00, 'Sunt et non accusantium.', '2019-07-12 10:29:00', NULL, 'wechat', '2450110d-c630-3f42-8c86-db16b968aca3', 'pending', NULL, 0, 0, 'pending', NULL, '[]', '2019-08-08 09:56:09', '2019-08-08 09:56:11');
INSERT INTO `orders` VALUES (55, '20190808095609090141', 23, '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u82cf\\u5dde\\u5e02\\u76f8\\u57ce\\u533a\\u7b2c97\\u8857\\u9053\\u7b2c198\\u53f7\",\"zip\":134900,\"contact_name\":\"\\u4e1b\\u9e4f\",\"contact_phone\":\"15280042955\"}', 52010.96, 'Voluptatibus hic animi non sit sunt est.', '2019-07-15 20:43:13', 17, 'alipay', 'd0086199-a0f3-3d6c-8080-f8be78a8750c', 'pending', NULL, 0, 1, 'pending', NULL, '[]', '2019-08-08 09:56:09', '2019-08-08 09:56:11');
INSERT INTO `orders` VALUES (56, '20190808095609881963', 81, '{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u4e1c\\u57ce\\u533a\\u7b2c13\\u8857\\u9053\\u7b2c801\\u53f7\",\"zip\":721900,\"contact_name\":\"\\u683e\\u6210\",\"contact_phone\":\"18827412667\"}', 79621.00, 'Id fugiat illo provident ratione sit aut.', '2019-07-26 02:14:28', NULL, 'wechat', '1f653c84-03a3-399c-9fa8-0b1dcc66ceb4', 'pending', NULL, 0, 0, 'received', '{\"express_company\":\"\\u51cc\\u4e91\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"65f620a2-a2e9-3597-a215-f183aef45edd\"}', '[]', '2019-08-08 09:56:09', '2019-08-08 09:56:11');
INSERT INTO `orders` VALUES (57, '20190808095609988496', 2, '{\"address\":\"\\u5e7f\\u4e1c\\u7701\\u6df1\\u5733\\u5e02\\u798f\\u7530\\u533a\\u7b2c96\\u8857\\u9053\\u7b2c729\\u53f7\",\"zip\":543200,\"contact_name\":\"\\u6c64\\u6d69\",\"contact_phone\":\"18225019462\"}', 38372.88, 'Corrupti dicta voluptatum velit mollitia aperiam illo.', '2019-07-10 04:47:31', 19, 'alipay', '9be40651-8629-3787-ab22-6d57b0cba033', 'pending', NULL, 0, 1, 'delivered', '{\"express_company\":\"\\u53cc\\u654f\\u7535\\u5b50\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"82de271a-1142-3a3e-9487-9be75c1e136c\"}', '[]', '2019-08-08 09:56:09', '2019-08-08 09:56:11');
INSERT INTO `orders` VALUES (58, '20190808095609943365', 80, '{\"address\":\"\\u5e7f\\u4e1c\\u7701\\u6df1\\u5733\\u5e02\\u798f\\u7530\\u533a\\u7b2c7\\u8857\\u9053\\u7b2c351\\u53f7\",\"zip\":668200,\"contact_name\":\"\\u534e\\u99a8\\u4e88\",\"contact_phone\":\"18803946917\"}', 16146.00, 'Eius laudantium exercitationem qui sint omnis.', '2019-07-14 05:33:59', NULL, 'wechat', '372eca1b-a992-3d21-a889-7176e17889f7', 'pending', NULL, 0, 1, 'pending', NULL, '[]', '2019-08-08 09:56:09', '2019-08-08 09:56:11');
INSERT INTO `orders` VALUES (59, '20190808095609878182', 2, '{\"address\":\"\\u5e7f\\u4e1c\\u7701\\u6df1\\u5733\\u5e02\\u798f\\u7530\\u533a\\u7b2c96\\u8857\\u9053\\u7b2c729\\u53f7\",\"zip\":543200,\"contact_name\":\"\\u6c64\\u6d69\",\"contact_phone\":\"18225019462\"}', 9903.00, 'Minus est vel beatae vel reiciendis.', '2019-08-05 11:54:20', NULL, 'wechat', '4652749e-e76d-30de-8e08-836771cc67fb', 'pending', NULL, 0, 1, 'pending', NULL, '[]', '2019-08-08 09:56:09', '2019-08-08 09:56:11');
INSERT INTO `orders` VALUES (60, '20190808095609088969', 85, '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u82cf\\u5dde\\u5e02\\u76f8\\u57ce\\u533a\\u7b2c67\\u8857\\u9053\\u7b2c842\\u53f7\",\"zip\":86500,\"contact_name\":\"\\u5d7a\\u660e\",\"contact_phone\":\"15162535585\"}', 4008.00, 'Fugiat et aut nulla est.', '2019-07-24 07:03:55', NULL, 'wechat', 'a00fa5ce-7dfe-3656-894d-4671c5f3ac26', 'pending', NULL, 0, 1, 'pending', NULL, '[]', '2019-08-08 09:56:09', '2019-08-08 09:56:11');
INSERT INTO `orders` VALUES (61, '20190808095609357647', 48, '{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u4e1c\\u57ce\\u533a\\u7b2c38\\u8857\\u9053\\u7b2c982\\u53f7\",\"zip\":774800,\"contact_name\":\"\\u5b59\\u654f\",\"contact_phone\":\"17017041355\"}', 5628.48, 'Rem sint corrupti deserunt sapiente.', '2019-07-27 04:32:06', 17, 'alipay', '817f9f93-23eb-38d2-8f1e-929f882f00c7', 'pending', NULL, 0, 1, 'delivered', '{\"express_company\":\"\\u5408\\u8054\\u7535\\u5b50\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"feff93fa-fd44-367d-b045-a6e1a2ea5955\"}', '[]', '2019-08-08 09:56:09', '2019-08-08 09:56:11');
INSERT INTO `orders` VALUES (62, '20190808095609374563', 46, '{\"address\":\"\\u5e7f\\u4e1c\\u7701\\u6df1\\u5733\\u5e02\\u798f\\u7530\\u533a\\u7b2c98\\u8857\\u9053\\u7b2c205\\u53f7\",\"zip\":45300,\"contact_name\":\"\\u738b\\u6d01\",\"contact_phone\":\"17754262368\"}', 1803.20, 'Asperiores quod accusantium dolore natus sapiente distinctio omnis.', '2019-07-31 23:46:51', 19, 'wechat', '2865eda1-9fba-30b9-b1ce-6e739b27a90e', 'success', 'e00f5743d00642fdac7b17e86670de3c', 0, 1, 'pending', NULL, '{\"refund_reason\":\"Recusandae nemo et consequatur reiciendis eligendi cumque.\"}', '2019-08-08 09:56:09', '2019-08-08 09:56:11');
INSERT INTO `orders` VALUES (63, '20190808095609828698', 13, '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u5357\\u4eac\\u5e02\\u6d66\\u53e3\\u533a\\u7b2c74\\u8857\\u9053\\u7b2c581\\u53f7\",\"zip\":162100,\"contact_name\":\"\\u4e54\\u6dd1\\u82f1\",\"contact_phone\":\"18319930195\"}', 26973.90, 'Rerum aliquid quas doloremque ex.', '2019-08-04 03:15:59', 17, 'alipay', '93e983ee-036e-3873-a0ed-799f53ee7236', 'pending', NULL, 0, 1, 'delivered', '{\"express_company\":\"\\u98de\\u6d77\\u79d1\\u6280\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"073e87a3-b2d8-332d-9d9c-f64e43864d9c\"}', '[]', '2019-08-08 09:56:09', '2019-08-08 09:56:11');
INSERT INTO `orders` VALUES (64, '20190808095609293680', 43, '{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u4e1c\\u57ce\\u533a\\u7b2c84\\u8857\\u9053\\u7b2c924\\u53f7\",\"zip\":333600,\"contact_name\":\"\\u6556\\u6885\",\"contact_phone\":\"17186502061\"}', 19525.00, 'Perspiciatis consequatur dolorum assumenda quis repellendus.', '2019-08-03 11:49:17', NULL, 'alipay', '76842da5-dd4c-32ad-9e61-de771744581d', 'pending', NULL, 0, 1, 'received', '{\"express_company\":\"\\u592a\\u6781\\u7f51\\u7edc\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"196779a3-b8f2-380d-b0e5-daf503d9c9e9\"}', '[]', '2019-08-08 09:56:09', '2019-08-08 09:56:12');
INSERT INTO `orders` VALUES (65, '20190808095609147717', 67, '{\"address\":\"\\u5e7f\\u4e1c\\u7701\\u6df1\\u5733\\u5e02\\u798f\\u7530\\u533a\\u7b2c99\\u8857\\u9053\\u7b2c128\\u53f7\",\"zip\":748700,\"contact_name\":\"\\u5eb7\\u946b\",\"contact_phone\":\"15249459824\"}', 21783.30, 'Blanditiis sit doloribus itaque voluptate suscipit delectus repudiandae.', '2019-07-16 17:49:58', 17, 'alipay', '62634477-9a09-393b-9ee1-bbc6e4b50bbc', 'pending', NULL, 0, 0, 'pending', NULL, '[]', '2019-08-08 09:56:09', '2019-08-08 09:56:12');
INSERT INTO `orders` VALUES (66, '20190808095609621979', 95, '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u5357\\u4eac\\u5e02\\u6d66\\u53e3\\u533a\\u7b2c22\\u8857\\u9053\\u7b2c791\\u53f7\",\"zip\":824600,\"contact_name\":\"\\u7ae5\\u654f\\u9759\",\"contact_phone\":\"18268077775\"}', 9924.00, 'Porro minus iusto ea deleniti fuga sunt quae doloribus.', '2019-07-12 23:48:46', NULL, 'alipay', '93ab416d-309f-3fa1-b847-16d1a8966895', 'pending', NULL, 0, 1, 'pending', NULL, '[]', '2019-08-08 09:56:09', '2019-08-08 09:56:12');
INSERT INTO `orders` VALUES (67, '20190808095609946082', 41, '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u5357\\u4eac\\u5e02\\u6d66\\u53e3\\u533a\\u7b2c55\\u8857\\u9053\\u7b2c589\\u53f7\",\"zip\":627600,\"contact_name\":\"\\u77bf\\u745c\",\"contact_phone\":\"14743083670\"}', 10915.00, 'Eos eum vel dolorem animi est velit cum est.', '2019-07-29 11:04:32', NULL, 'wechat', '623c307e-d8a9-3ace-839e-c52a09beeda9', 'pending', NULL, 0, 1, 'received', '{\"express_company\":\"\\u9e3f\\u777f\\u601d\\u535a\\u7f51\\u7edc\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"723e0101-b35f-38f8-9f1f-b8777daf87f6\"}', '[]', '2019-08-08 09:56:09', '2019-08-08 09:56:12');
INSERT INTO `orders` VALUES (68, '20190808095609949060', 4, '{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u4e1c\\u57ce\\u533a\\u7b2c31\\u8857\\u9053\\u7b2c106\\u53f7\",\"zip\":441700,\"contact_name\":\"\\u5411\\u65ed\",\"contact_phone\":\"17087789621\"}', 62716.00, 'Reprehenderit exercitationem quaerat magni voluptatum fuga fugit dolorum.', '2019-07-18 16:13:30', NULL, 'wechat', 'e40a30e7-387b-331e-9739-57f46e15a874', 'pending', NULL, 0, 1, 'received', '{\"express_company\":\"\\u7acb\\u4fe1\\u7535\\u5b50\\u4f20\\u5a92\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"a209c341-0c57-3b5e-926c-d2bc99dbb04c\"}', '[]', '2019-08-08 09:56:09', '2019-08-08 09:56:12');
INSERT INTO `orders` VALUES (69, '20190808095609201800', 75, '{\"address\":\"\\u5e7f\\u4e1c\\u7701\\u6df1\\u5733\\u5e02\\u798f\\u7530\\u533a\\u7b2c99\\u8857\\u9053\\u7b2c857\\u53f7\",\"zip\":96700,\"contact_name\":\"\\u4f5f\\u6dd1\\u82f1\",\"contact_phone\":\"18490842089\"}', 50203.00, 'Dolor et qui consequatur impedit non consequuntur quisquam.', '2019-07-18 07:58:28', NULL, 'alipay', '7e4b62e7-f7f4-30ad-8edf-90c86df1afb1', 'pending', NULL, 0, 1, 'pending', NULL, '[]', '2019-08-08 09:56:09', '2019-08-08 09:56:12');
INSERT INTO `orders` VALUES (70, '20190808095609792971', 10, '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u5357\\u4eac\\u5e02\\u6d66\\u53e3\\u533a\\u7b2c64\\u8857\\u9053\\u7b2c70\\u53f7\",\"zip\":206400,\"contact_name\":\"\\u848b\\u814a\\u6885\",\"contact_phone\":\"15574414568\"}', 18554.00, 'Dolores aperiam eum ut et est.', '2019-08-06 10:18:08', NULL, 'wechat', '4d50f231-b523-3237-8704-ce1142cecaeb', 'pending', NULL, 0, 1, 'received', '{\"express_company\":\"\\u8bfa\\u4f9d\\u66fc\\u8f6f\\u4ef6\\u4f20\\u5a92\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"0a2e87b4-0e92-3e2f-be03-443bd989d1f1\"}', '[]', '2019-08-08 09:56:09', '2019-08-08 09:56:12');
INSERT INTO `orders` VALUES (71, '20190808095609765180', 6, '{\"address\":\"\\u6cb3\\u5317\\u7701\\u77f3\\u5bb6\\u5e84\\u5e02\\u957f\\u5b89\\u533a\\u7b2c93\\u8857\\u9053\\u7b2c778\\u53f7\",\"zip\":833000,\"contact_name\":\"\\u76d6\\u6b63\\u5e73\",\"contact_phone\":\"18956687119\"}', 12602.00, 'Autem nisi quae aut sit facere placeat est.', '2019-07-10 14:32:12', NULL, 'wechat', '68122107-e036-34a9-b292-9c00911d04f1', 'pending', NULL, 0, 1, 'delivered', '{\"express_company\":\"\\u7fa4\\u82f1\\u4fe1\\u606f\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"0b3c48b9-5dad-3f0b-9a69-0a6bf585b04f\"}', '[]', '2019-08-08 09:56:09', '2019-08-08 09:56:12');
INSERT INTO `orders` VALUES (72, '20190808095609232038', 91, '{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u4e1c\\u57ce\\u533a\\u7b2c70\\u8857\\u9053\\u7b2c480\\u53f7\",\"zip\":655500,\"contact_name\":\"\\u6e29\\u632f\\u56fd\",\"contact_phone\":\"17193368109\"}', 52016.00, 'Quod ad sint eum cum autem necessitatibus odio.', '2019-07-15 05:40:47', NULL, 'wechat', '62234c5a-2c28-3bea-99cc-8c4704f9be38', 'success', 'b2068ed89f96464e83a297bd9bccc079', 0, 1, 'pending', NULL, '{\"refund_reason\":\"Amet quia omnis ab dignissimos.\"}', '2019-08-08 09:56:09', '2019-08-08 09:56:12');
INSERT INTO `orders` VALUES (73, '20190808095609989617', 19, '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u82cf\\u5dde\\u5e02\\u76f8\\u57ce\\u533a\\u7b2c73\\u8857\\u9053\\u7b2c380\\u53f7\",\"zip\":221400,\"contact_name\":\"\\u5d7a\\u51e4\\u82f1\",\"contact_phone\":\"14740083431\"}', 17721.84, 'Ducimus nulla aut animi natus.', '2019-07-25 09:51:23', 17, 'wechat', '7fcf53a6-b41b-345d-aa2b-2502775e7d6f', 'pending', NULL, 0, 0, 'pending', NULL, '[]', '2019-08-08 09:56:09', '2019-08-08 09:56:12');
INSERT INTO `orders` VALUES (74, '20190808095609893551', 83, '{\"address\":\"\\u5e7f\\u4e1c\\u7701\\u6df1\\u5733\\u5e02\\u798f\\u7530\\u533a\\u7b2c71\\u8857\\u9053\\u7b2c429\\u53f7\",\"zip\":797000,\"contact_name\":\"\\u6234\\u667a\\u52c7\",\"contact_phone\":\"15669584492\"}', 25151.00, 'Hic facilis minus temporibus veritatis porro et nesciunt.', '2019-07-10 03:48:54', NULL, 'alipay', '2a12f5bf-72c3-3b36-9200-4df1217ddf1b', 'pending', NULL, 0, 0, 'pending', NULL, '[]', '2019-08-08 09:56:09', '2019-08-08 09:56:12');
INSERT INTO `orders` VALUES (75, '20190808095609697837', 62, '{\"address\":\"\\u6cb3\\u5317\\u7701\\u77f3\\u5bb6\\u5e84\\u5e02\\u957f\\u5b89\\u533a\\u7b2c35\\u8857\\u9053\\u7b2c565\\u53f7\",\"zip\":694700,\"contact_name\":\"\\u6210\\u5fd7\\u6587\",\"contact_phone\":\"18078705827\"}', 47798.52, 'Quae ipsam aliquam odit dignissimos dignissimos sit qui.', '2019-07-18 08:37:44', 19, 'wechat', 'dd772f4b-bdb2-3156-86b8-377493a335ea', 'pending', NULL, 0, 1, 'pending', NULL, '[]', '2019-08-08 09:56:09', '2019-08-08 09:56:12');
INSERT INTO `orders` VALUES (76, '20190808095609126642', 36, '{\"address\":\"\\u5e7f\\u4e1c\\u7701\\u6df1\\u5733\\u5e02\\u798f\\u7530\\u533a\\u7b2c57\\u8857\\u9053\\u7b2c665\\u53f7\",\"zip\":698400,\"contact_name\":\"\\u853a\\u632f\\u56fd\",\"contact_phone\":\"15256886134\"}', 21038.64, 'Sequi omnis quas ducimus ut ipsa totam itaque non.', '2019-07-13 19:13:18', 19, 'alipay', 'a56c5f1b-9281-309b-bcdd-06543f3069b9', 'pending', NULL, 0, 1, 'received', '{\"express_company\":\"\\u51cc\\u4e91\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"ac0d4df4-5c98-36aa-9eb8-502fca4659d8\"}', '[]', '2019-08-08 09:56:09', '2019-08-08 09:56:12');
INSERT INTO `orders` VALUES (77, '20190808095609277839', 50, '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u5357\\u4eac\\u5e02\\u6d66\\u53e3\\u533a\\u7b2c50\\u8857\\u9053\\u7b2c165\\u53f7\",\"zip\":267800,\"contact_name\":\"\\u9676\\u7389\\u82f1\",\"contact_phone\":\"18922516852\"}', 7351.00, 'Quia nostrum omnis repellendus id.', '2019-07-18 16:17:03', NULL, 'wechat', 'f714d188-e32e-3517-bced-f018cc2c2954', 'pending', NULL, 0, 1, 'received', '{\"express_company\":\"\\u827e\\u63d0\\u79d1\\u4fe1\\u4f20\\u5a92\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"d8790d64-8d6d-3578-9d99-12d2083d72ca\"}', '[]', '2019-08-08 09:56:09', '2019-08-08 09:56:12');
INSERT INTO `orders` VALUES (78, '20190808095609273784', 94, '{\"address\":\"\\u5e7f\\u4e1c\\u7701\\u6df1\\u5733\\u5e02\\u798f\\u7530\\u533a\\u7b2c38\\u8857\\u9053\\u7b2c206\\u53f7\",\"zip\":773800,\"contact_name\":\"\\u94b1\\u4e91\",\"contact_phone\":\"15101501378\"}', 6267.26, 'Voluptatem deleniti a sint ad a ducimus.', '2019-07-21 07:29:24', 17, 'wechat', 'a9798404-eaf9-3ef6-8ada-3e727448f6d9', 'pending', NULL, 0, 1, 'delivered', '{\"express_company\":\"\\u4e5d\\u65b9\\u4fe1\\u606f\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"b56ac9a1-de55-3808-9d04-121c98ea94bf\"}', '[]', '2019-08-08 09:56:09', '2019-08-08 09:56:12');
INSERT INTO `orders` VALUES (79, '20190808095609464428', 7, '{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u4e1c\\u57ce\\u533a\\u7b2c13\\u8857\\u9053\\u7b2c205\\u53f7\",\"zip\":524800,\"contact_name\":\"\\u9879\\u6021\",\"contact_phone\":\"15042097139\"}', 12076.00, 'Saepe deserunt praesentium quaerat aspernatur.', '2019-07-28 19:31:19', NULL, 'alipay', 'ef5fab05-6f7a-3dcf-9e2a-08a5c7b47cc0', 'pending', NULL, 0, 1, 'pending', NULL, '[]', '2019-08-08 09:56:09', '2019-08-08 09:56:12');
INSERT INTO `orders` VALUES (80, '20190808095609692345', 15, '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u5357\\u4eac\\u5e02\\u6d66\\u53e3\\u533a\\u7b2c99\\u8857\\u9053\\u7b2c198\\u53f7\",\"zip\":503100,\"contact_name\":\"\\u683e\\u5f3a\",\"contact_phone\":\"15375800268\"}', 49851.00, 'Voluptatem quam qui sunt voluptate voluptas.', '2019-07-22 14:52:38', NULL, 'alipay', '9169a59f-0353-3f78-abf7-2a7c181ca78d', 'pending', NULL, 0, 1, 'pending', NULL, '[]', '2019-08-08 09:56:09', '2019-08-08 09:56:12');
INSERT INTO `orders` VALUES (81, '20190808095609147398', 49, '{\"address\":\"\\u5e7f\\u4e1c\\u7701\\u6df1\\u5733\\u5e02\\u798f\\u7530\\u533a\\u7b2c8\\u8857\\u9053\\u7b2c382\\u53f7\",\"zip\":504600,\"contact_name\":\"\\u82df\\u4f26\",\"contact_phone\":\"18114420184\"}', 41957.00, 'Dolor totam autem ut unde assumenda voluptatem necessitatibus qui.', '2019-08-02 01:14:38', NULL, 'alipay', '4f6a71ca-18f7-368d-94d1-51d44354795e', 'pending', NULL, 0, 1, 'delivered', '{\"express_company\":\"\\u5546\\u8f6f\\u51a0\\u8054\\u4f20\\u5a92\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"a348b466-c7c1-33bf-ba42-e70bf0c3e7b6\"}', '[]', '2019-08-08 09:56:09', '2019-08-08 09:56:12');
INSERT INTO `orders` VALUES (82, '20190808095609852739', 54, '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u82cf\\u5dde\\u5e02\\u76f8\\u57ce\\u533a\\u7b2c38\\u8857\\u9053\\u7b2c112\\u53f7\",\"zip\":353400,\"contact_name\":\"\\u5d7a\\u4e3d\\u4e3d\",\"contact_phone\":\"13199901230\"}', 48370.00, 'Dolorum consequatur inventore quod totam qui.', '2019-07-14 08:37:26', NULL, 'alipay', '730ae67e-518c-343a-8de6-fb09f84df1dd', 'pending', NULL, 0, 1, 'delivered', '{\"express_company\":\"\\u521b\\u4ebf\\u4fe1\\u606f\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"dc503714-3068-382c-826e-9f5cf069f440\"}', '[]', '2019-08-08 09:56:09', '2019-08-08 09:56:12');
INSERT INTO `orders` VALUES (83, '20190808095609589954', 18, '{\"address\":\"\\u6cb3\\u5317\\u7701\\u77f3\\u5bb6\\u5e84\\u5e02\\u957f\\u5b89\\u533a\\u7b2c36\\u8857\\u9053\\u7b2c836\\u53f7\",\"zip\":582400,\"contact_name\":\"\\u6c5f\\u7434\",\"contact_phone\":\"17796048239\"}', 43060.00, 'Non adipisci ut illo nostrum.', '2019-07-24 11:22:10', NULL, 'wechat', '1cf72b3f-7c84-3de6-93cc-e4d3673d5841', 'pending', NULL, 0, 1, 'received', '{\"express_company\":\"\\u946b\\u535a\\u817e\\u98de\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"d518626f-b8cd-3299-843a-59591f450064\"}', '[]', '2019-08-08 09:56:09', '2019-08-08 09:56:12');
INSERT INTO `orders` VALUES (84, '20190808095609497755', 78, '{\"address\":\"\\u5e7f\\u4e1c\\u7701\\u6df1\\u5733\\u5e02\\u798f\\u7530\\u533a\\u7b2c31\\u8857\\u9053\\u7b2c327\\u53f7\",\"zip\":184700,\"contact_name\":\"\\u690d\\u4e3d\",\"contact_phone\":\"13998959611\"}', 906.00, 'Odit maiores ipsa et suscipit quod eligendi assumenda.', '2019-08-05 16:15:27', NULL, 'alipay', 'f4a58843-4a29-31a2-b93c-09252eda2532', 'pending', NULL, 0, 1, 'pending', NULL, '[]', '2019-08-08 09:56:09', '2019-08-08 09:56:12');
INSERT INTO `orders` VALUES (85, '20190808095609565078', 80, '{\"address\":\"\\u5e7f\\u4e1c\\u7701\\u6df1\\u5733\\u5e02\\u798f\\u7530\\u533a\\u7b2c7\\u8857\\u9053\\u7b2c351\\u53f7\",\"zip\":668200,\"contact_name\":\"\\u534e\\u99a8\\u4e88\",\"contact_phone\":\"18803946917\"}', 60119.12, 'Illo quaerat quia reiciendis possimus.', '2019-07-10 19:10:30', 17, 'wechat', 'f554fd93-a22d-329e-a11a-b9e2b33661de', 'pending', NULL, 0, 1, 'delivered', '{\"express_company\":\"\\u7ef4\\u6d9b\\u7f51\\u7edc\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"de280fd1-a652-3a8c-b0e6-a112f38951c6\"}', '[]', '2019-08-08 09:56:09', '2019-08-08 09:56:12');
INSERT INTO `orders` VALUES (86, '20190808095609120749', 25, '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u5357\\u4eac\\u5e02\\u6d66\\u53e3\\u533a\\u7b2c67\\u8857\\u9053\\u7b2c504\\u53f7\",\"zip\":408300,\"contact_name\":\"\\u5deb\\u91d1\\u51e4\",\"contact_phone\":\"14745508866\"}', 12504.00, 'A omnis soluta fugiat repellat omnis.', '2019-07-10 19:04:57', NULL, 'wechat', 'fd3050df-0aff-31be-9507-f584c7f19e97', 'pending', NULL, 0, 1, 'pending', NULL, '[]', '2019-08-08 09:56:09', '2019-08-08 09:56:12');
INSERT INTO `orders` VALUES (87, '20190808095609120515', 39, '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u5357\\u4eac\\u5e02\\u6d66\\u53e3\\u533a\\u7b2c64\\u8857\\u9053\\u7b2c434\\u53f7\",\"zip\":661500,\"contact_name\":\"\\u59dc\\u96ea\\u6885\",\"contact_phone\":\"13741715628\"}', 9189.00, 'Saepe quia tempora sint voluptas veritatis.', '2019-07-27 17:03:26', NULL, 'alipay', '70fbe8a6-9356-3bf0-87a4-c37754523227', 'pending', NULL, 0, 0, 'delivered', '{\"express_company\":\"\\u6d4e\\u5357\\u4ebf\\u6b21\\u5143\\u7f51\\u7edc\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"789b9647-dc05-3751-9bc2-866aff455ccf\"}', '[]', '2019-08-08 09:56:09', '2019-08-08 09:56:12');
INSERT INTO `orders` VALUES (88, '20190808095609552390', 62, '{\"address\":\"\\u6cb3\\u5317\\u7701\\u77f3\\u5bb6\\u5e84\\u5e02\\u957f\\u5b89\\u533a\\u7b2c35\\u8857\\u9053\\u7b2c565\\u53f7\",\"zip\":694700,\"contact_name\":\"\\u6210\\u5fd7\\u6587\",\"contact_phone\":\"18078705827\"}', 34272.56, 'Nihil iure neque quo.', '2019-08-03 08:25:25', 19, 'wechat', '069b06f4-0956-3989-bf0a-5c69393fe8dc', 'pending', NULL, 0, 1, 'delivered', '{\"express_company\":\"\\u94f6\\u5609\\u7f51\\u7edc\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"3a6727fc-95d2-3729-9318-2b108c623db4\"}', '[]', '2019-08-08 09:56:09', '2019-08-08 09:56:12');
INSERT INTO `orders` VALUES (89, '20190808095609853211', 15, '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u5357\\u4eac\\u5e02\\u6d66\\u53e3\\u533a\\u7b2c99\\u8857\\u9053\\u7b2c198\\u53f7\",\"zip\":503100,\"contact_name\":\"\\u683e\\u5f3a\",\"contact_phone\":\"15375800268\"}', 56595.00, 'Expedita sed voluptas eos est accusantium.', '2019-07-24 12:40:11', NULL, 'wechat', '0249d70e-f08d-3c6f-8e3e-b65acd7cfa04', 'pending', NULL, 0, 1, 'pending', NULL, '[]', '2019-08-08 09:56:09', '2019-08-08 09:56:12');
INSERT INTO `orders` VALUES (90, '20190808095609471877', 86, '{\"address\":\"\\u5e7f\\u4e1c\\u7701\\u6df1\\u5733\\u5e02\\u798f\\u7530\\u533a\\u7b2c7\\u8857\\u9053\\u7b2c766\\u53f7\",\"zip\":172300,\"contact_name\":\"\\u66fe\\u6b23\",\"contact_phone\":\"15912219116\"}', 24363.00, 'Porro nostrum repellendus omnis sed eos qui fuga.', '2019-07-09 20:43:57', NULL, 'wechat', '1323a137-8426-3786-b708-b972b68b9a6c', 'pending', NULL, 0, 1, 'pending', NULL, '[]', '2019-08-08 09:56:09', '2019-08-08 09:56:12');
INSERT INTO `orders` VALUES (91, '20190808095609321915', 70, '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u82cf\\u5dde\\u5e02\\u76f8\\u57ce\\u533a\\u7b2c82\\u8857\\u9053\\u7b2c16\\u53f7\",\"zip\":831200,\"contact_name\":\"\\u55bb\\u519b\",\"contact_phone\":\"13015258338\"}', 5298.00, 'Occaecati ea occaecati ex deserunt exercitationem.', '2019-07-21 13:59:04', NULL, 'alipay', 'c3c694a2-e5fe-3cbb-8907-e2116f8e8099', 'pending', NULL, 0, 1, 'received', '{\"express_company\":\"\\u601d\\u4f18\\u7f51\\u7edc\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"a875e878-9bda-3b3d-9995-71dcd05b027e\"}', '[]', '2019-08-08 09:56:09', '2019-08-08 09:56:12');
INSERT INTO `orders` VALUES (92, '20190808095609218069', 56, '{\"address\":\"\\u6cb3\\u5317\\u7701\\u77f3\\u5bb6\\u5e84\\u5e02\\u957f\\u5b89\\u533a\\u7b2c10\\u8857\\u9053\\u7b2c162\\u53f7\",\"zip\":634600,\"contact_name\":\"\\u4efb\\u6842\\u8363\",\"contact_phone\":\"15117035795\"}', 22851.64, 'Minus quo corrupti dolorum qui necessitatibus non at possimus.', '2019-07-23 06:46:32', 19, 'alipay', 'ca257e91-1acb-37a5-9dd7-a2a4ebc00215', 'pending', NULL, 0, 1, 'delivered', '{\"express_company\":\"\\u4e5d\\u65b9\\u4fe1\\u606f\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"c4b98922-8f9d-3580-8681-55d4705d1811\"}', '[]', '2019-08-08 09:56:09', '2019-08-08 09:56:12');
INSERT INTO `orders` VALUES (93, '20190808095609924254', 91, '{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u4e1c\\u57ce\\u533a\\u7b2c70\\u8857\\u9053\\u7b2c480\\u53f7\",\"zip\":655500,\"contact_name\":\"\\u6e29\\u632f\\u56fd\",\"contact_phone\":\"17193368109\"}', 8331.00, 'Quam illum repellendus temporibus vel nam.', '2019-07-20 05:52:58', NULL, 'alipay', '304ab83e-b613-3990-b612-040d0808295e', 'pending', NULL, 0, 1, 'pending', NULL, '[]', '2019-08-08 09:56:09', '2019-08-08 09:56:12');
INSERT INTO `orders` VALUES (94, '20190808095609578763', 26, '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u82cf\\u5dde\\u5e02\\u76f8\\u57ce\\u533a\\u7b2c65\\u8857\\u9053\\u7b2c172\\u53f7\",\"zip\":575600,\"contact_name\":\"\\u515a\\u6d69\",\"contact_phone\":\"18621190723\"}', 3120.00, 'Reiciendis temporibus et aut amet sunt sunt rerum.', '2019-07-19 17:30:29', NULL, 'alipay', '34746211-23a8-39ac-9717-bc2b94373f99', 'success', '273163dbd4d549c08197b516eb41ecc7', 0, 0, 'pending', NULL, '{\"refund_reason\":\"Ex aliquid quo consequatur minima molestiae quo nostrum.\"}', '2019-08-08 09:56:09', '2019-08-08 09:56:12');
INSERT INTO `orders` VALUES (95, '20190808095609906673', 32, '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u82cf\\u5dde\\u5e02\\u76f8\\u57ce\\u533a\\u7b2c8\\u8857\\u9053\\u7b2c478\\u53f7\",\"zip\":793600,\"contact_name\":\"\\u8d39\\u6d0b\",\"contact_phone\":\"15501303185\"}', 12534.52, 'Qui reprehenderit sapiente quod omnis sit voluptatum qui eligendi.', '2019-07-17 05:36:27', 17, 'alipay', '8d084156-506f-3449-9fdc-6c86965d5977', 'pending', NULL, 0, 0, 'delivered', '{\"express_company\":\"\\u8d8b\\u52bf\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"0a7b3b32-9070-3718-8cce-efbf80c20178\"}', '[]', '2019-08-08 09:56:09', '2019-08-08 09:56:12');
INSERT INTO `orders` VALUES (96, '20190808095609259239', 72, '{\"address\":\"\\u5e7f\\u4e1c\\u7701\\u6df1\\u5733\\u5e02\\u798f\\u7530\\u533a\\u7b2c69\\u8857\\u9053\\u7b2c571\\u53f7\",\"zip\":694300,\"contact_name\":\"\\u7c73\\u6587\",\"contact_phone\":\"18729500391\"}', 30886.00, 'Eius et ad corporis sit iste.', '2019-07-25 14:24:52', NULL, 'wechat', '121fe723-c0b4-3bd0-a7ac-99aec26f0f83', 'pending', NULL, 0, 1, 'delivered', '{\"express_company\":\"\\u4e2d\\u5efa\\u521b\\u4e1a\\u7f51\\u7edc\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"aab9d22c-5326-3947-81fb-6422039e0810\"}', '[]', '2019-08-08 09:56:09', '2019-08-08 09:56:12');
INSERT INTO `orders` VALUES (97, '20190808095609744845', 42, '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u82cf\\u5dde\\u5e02\\u76f8\\u57ce\\u533a\\u7b2c41\\u8857\\u9053\\u7b2c620\\u53f7\",\"zip\":122100,\"contact_name\":\"\\u8983\\u5fd7\\u65b0\",\"contact_phone\":\"17191162137\"}', 17292.00, 'Non odit magni autem voluptatem reiciendis est.', '2019-08-02 02:21:22', NULL, 'alipay', '75b4b729-01c9-37a9-b28d-0b41cb282858', 'pending', NULL, 0, 1, 'delivered', '{\"express_company\":\"\\u6613\\u52a8\\u529b\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"6a7ca847-72b9-3c96-9283-277b5da61c6b\"}', '[]', '2019-08-08 09:56:09', '2019-08-08 09:56:12');
INSERT INTO `orders` VALUES (98, '20190808095609259131', 44, '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u82cf\\u5dde\\u5e02\\u76f8\\u57ce\\u533a\\u7b2c66\\u8857\\u9053\\u7b2c955\\u53f7\",\"zip\":645400,\"contact_name\":\"\\u91d1\\u82f1\",\"contact_phone\":\"13517966775\"}', 12624.00, 'Impedit reiciendis aliquid aut vel sint distinctio soluta.', '2019-07-31 23:04:42', NULL, 'wechat', '63f345d6-9124-3996-aa49-9d3845da3f60', 'pending', NULL, 0, 0, 'delivered', '{\"express_company\":\"\\u6cf0\\u9e92\\u9e9f\\u7f51\\u7edc\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"859008a6-2fcc-3dd2-b955-584da5f52853\"}', '[]', '2019-08-08 09:56:09', '2019-08-08 09:56:12');
INSERT INTO `orders` VALUES (99, '20190808095609739223', 81, '{\"address\":\"\\u5e7f\\u4e1c\\u7701\\u6df1\\u5733\\u5e02\\u798f\\u7530\\u533a\\u7b2c91\\u8857\\u9053\\u7b2c33\\u53f7\",\"zip\":22400,\"contact_name\":\"\\u8def\\u5fd7\\u5f3a\",\"contact_phone\":\"17055634650\"}', 96174.00, 'Fugit est expedita vel sed quisquam.', '2019-07-31 09:32:23', NULL, 'wechat', '8a6b14b8-737d-3d1d-b537-89cc78f331e2', 'pending', NULL, 0, 1, 'delivered', '{\"express_company\":\"\\u65f6\\u523b\\u4f20\\u5a92\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"4ec618d6-ba0d-3a3f-ba0c-fa2258f28085\"}', '[]', '2019-08-08 09:56:09', '2019-08-08 09:56:13');
INSERT INTO `orders` VALUES (100, '20190808095609740503', 17, '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u82cf\\u5dde\\u5e02\\u76f8\\u57ce\\u533a\\u7b2c36\\u8857\\u9053\\u7b2c719\\u53f7\",\"zip\":401700,\"contact_name\":\"\\u865e\\u6842\\u8363\",\"contact_phone\":\"15978126633\"}', 12091.00, 'Sunt tenetur at quidem.', '2019-07-20 12:14:44', NULL, 'alipay', '0c99a43f-65cc-39cd-b5f0-af63d544cedf', 'pending', NULL, 0, 1, 'received', '{\"express_company\":\"\\u8fea\\u6469\\u7f51\\u7edc\\u6709\\u9650\\u516c\\u53f8\",\"express_no\":\"73336922-01c7-3666-a2df-3d0c9fc4e0dd\"}', '[]', '2019-08-08 09:56:09', '2019-08-08 09:56:13');

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for product_skus
-- ----------------------------
DROP TABLE IF EXISTS `product_skus`;
CREATE TABLE `product_skus`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10, 2) NOT NULL,
  `stock` int(10) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `product_skus_product_id_foreign`(`product_id`) USING BTREE,
  CONSTRAINT `product_skus_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 91 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_skus
-- ----------------------------
INSERT INTO `product_skus` VALUES (1, 'eveniet', 'Illum ad itaque beatae at.', 4917.00, 20149, 1, '2019-08-08 09:56:07', '2019-08-08 09:56:07');
INSERT INTO `product_skus` VALUES (2, 'neque', 'Qui voluptatum suscipit totam voluptatem voluptatem et est.', 8224.00, 74667, 1, '2019-08-08 09:56:07', '2019-08-08 09:56:07');
INSERT INTO `product_skus` VALUES (3, 'sit', 'A qui hic quod aliquam dolore impedit dolores.', 6875.00, 7362, 1, '2019-08-08 09:56:07', '2019-08-08 09:56:07');
INSERT INTO `product_skus` VALUES (4, 'totam', 'Earum nesciunt dolore molestias placeat at est.', 3026.00, 89655, 2, '2019-08-08 09:56:07', '2019-08-08 09:56:07');
INSERT INTO `product_skus` VALUES (5, 'labore', 'Dicta asperiores ut assumenda ad aut.', 9241.00, 80528, 2, '2019-08-08 09:56:07', '2019-08-08 09:56:07');
INSERT INTO `product_skus` VALUES (6, 'earum', 'Corporis vel voluptatibus consectetur expedita earum.', 6556.00, 99539, 2, '2019-08-08 09:56:07', '2019-08-08 09:56:07');
INSERT INTO `product_skus` VALUES (7, 'dicta', 'Et enim maiores corporis reiciendis necessitatibus sit odio.', 1786.00, 7631, 3, '2019-08-08 09:56:07', '2019-08-08 09:56:07');
INSERT INTO `product_skus` VALUES (8, 'ipsum', 'Vitae tempore atque odio at minus.', 6057.00, 25706, 3, '2019-08-08 09:56:07', '2019-08-08 09:56:07');
INSERT INTO `product_skus` VALUES (9, 'culpa', 'Quia consequatur dolor non numquam quia qui error et.', 6990.00, 69401, 3, '2019-08-08 09:56:07', '2019-08-08 09:56:07');
INSERT INTO `product_skus` VALUES (10, 'doloremque', 'Expedita rerum ut magnam.', 277.00, 32757, 4, '2019-08-08 09:56:07', '2019-08-08 09:56:07');
INSERT INTO `product_skus` VALUES (11, 'atque', 'Sed ut expedita est omnis fugit totam.', 1218.00, 82826, 4, '2019-08-08 09:56:07', '2019-08-08 09:56:07');
INSERT INTO `product_skus` VALUES (12, 'at', 'Sunt libero explicabo libero.', 1981.00, 76130, 4, '2019-08-08 09:56:07', '2019-08-08 09:56:07');
INSERT INTO `product_skus` VALUES (13, 'reiciendis', 'Libero autem corporis id sint.', 9937.00, 52390, 5, '2019-08-08 09:56:07', '2019-08-08 09:56:07');
INSERT INTO `product_skus` VALUES (14, 'rerum', 'Eius dolor corporis delectus et aut vero.', 8555.00, 86625, 5, '2019-08-08 09:56:07', '2019-08-08 09:56:07');
INSERT INTO `product_skus` VALUES (15, 'magnam', 'Impedit rerum quod corporis natus.', 121.00, 20860, 5, '2019-08-08 09:56:07', '2019-08-08 09:56:07');
INSERT INTO `product_skus` VALUES (16, 'et', 'In facilis rerum tenetur inventore omnis.', 452.00, 75312, 6, '2019-08-08 09:56:07', '2019-08-08 09:56:07');
INSERT INTO `product_skus` VALUES (17, 'rerum', 'Facilis et sed distinctio ducimus in beatae sapiente.', 2018.00, 61313, 6, '2019-08-08 09:56:07', '2019-08-08 09:56:07');
INSERT INTO `product_skus` VALUES (18, 'modi', 'Minus consequuntur doloremque placeat velit perferendis optio fugiat.', 6832.00, 90577, 6, '2019-08-08 09:56:07', '2019-08-08 09:56:07');
INSERT INTO `product_skus` VALUES (19, 'id', 'Temporibus est ut velit aliquam blanditiis rerum sed adipisci.', 3905.00, 17695, 7, '2019-08-08 09:56:07', '2019-08-08 09:56:07');
INSERT INTO `product_skus` VALUES (20, 'ut', 'Non laborum molestiae eos.', 3156.00, 51562, 7, '2019-08-08 09:56:07', '2019-08-08 09:56:07');
INSERT INTO `product_skus` VALUES (21, 'nesciunt', 'Dolore fugit quia est aut similique accusamus enim.', 8607.00, 60453, 7, '2019-08-08 09:56:07', '2019-08-08 09:56:07');
INSERT INTO `product_skus` VALUES (22, 'eum', 'Et aliquam id earum soluta aut dolor.', 3063.00, 30190, 8, '2019-08-08 09:56:07', '2019-08-08 09:56:07');
INSERT INTO `product_skus` VALUES (23, 'debitis', 'Sed quia nostrum dignissimos facere.', 8970.00, 95347, 8, '2019-08-08 09:56:07', '2019-08-08 09:56:07');
INSERT INTO `product_skus` VALUES (24, 'laudantium', 'Placeat suscipit error ipsa impedit id illo inventore voluptates.', 9495.00, 4332, 8, '2019-08-08 09:56:07', '2019-08-08 09:56:07');
INSERT INTO `product_skus` VALUES (25, 'distinctio', 'Vel et nihil voluptatum ducimus aut.', 6658.00, 75915, 9, '2019-08-08 09:56:07', '2019-08-08 09:56:07');
INSERT INTO `product_skus` VALUES (26, 'nesciunt', 'Ullam atque exercitationem sapiente illum iure facilis.', 4025.00, 72737, 9, '2019-08-08 09:56:07', '2019-08-08 09:56:07');
INSERT INTO `product_skus` VALUES (27, 'et', 'Sit voluptate sit quaerat cum omnis.', 7643.00, 34838, 9, '2019-08-08 09:56:07', '2019-08-08 09:56:07');
INSERT INTO `product_skus` VALUES (28, 'sunt', 'Et est voluptatem repellendus autem laudantium occaecati consectetur.', 453.00, 69040, 10, '2019-08-08 09:56:07', '2019-08-08 09:56:07');
INSERT INTO `product_skus` VALUES (29, 'ipsa', 'Nobis neque unde sequi voluptates quo aut.', 2288.00, 96915, 10, '2019-08-08 09:56:07', '2019-08-08 09:56:07');
INSERT INTO `product_skus` VALUES (30, 'recusandae', 'Itaque ratione sed reprehenderit soluta.', 7351.00, 18969, 10, '2019-08-08 09:56:07', '2019-08-08 09:56:07');
INSERT INTO `product_skus` VALUES (31, 'quis', 'Odio saepe quam sed et perferendis.', 6295.00, 65942, 11, '2019-08-08 09:56:07', '2019-08-08 09:56:07');
INSERT INTO `product_skus` VALUES (32, 'rerum', 'Consequatur facere qui commodi molestiae minima dicta nulla.', 6301.00, 65242, 11, '2019-08-08 09:56:07', '2019-08-08 09:56:07');
INSERT INTO `product_skus` VALUES (33, 'sunt', 'Quasi ut praesentium vel dignissimos voluptate ullam.', 648.00, 34954, 11, '2019-08-08 09:56:07', '2019-08-08 09:56:07');
INSERT INTO `product_skus` VALUES (34, 'repudiandae', 'Explicabo natus ipsum sed eos.', 4912.00, 38448, 12, '2019-08-08 09:56:07', '2019-08-08 09:56:07');
INSERT INTO `product_skus` VALUES (35, 'illum', 'Fugiat id fugiat ut ut eum qui modi laboriosam.', 8743.00, 48390, 12, '2019-08-08 09:56:07', '2019-08-08 09:56:07');
INSERT INTO `product_skus` VALUES (36, 'exercitationem', 'A voluptatem possimus provident qui ea.', 6473.00, 74464, 12, '2019-08-08 09:56:07', '2019-08-08 09:56:07');
INSERT INTO `product_skus` VALUES (37, 'perspiciatis', 'Qui dicta odit reiciendis porro rerum minus est.', 5298.00, 33171, 13, '2019-08-08 09:56:07', '2019-08-08 09:56:07');
INSERT INTO `product_skus` VALUES (38, 'a', 'Et odio omnis voluptatum laudantium ex qui ut.', 1292.00, 91404, 13, '2019-08-08 09:56:07', '2019-08-08 09:56:07');
INSERT INTO `product_skus` VALUES (39, 'officia', 'Ratione et ducimus voluptatem officiis repellat illum qui recusandae.', 541.00, 53260, 13, '2019-08-08 09:56:07', '2019-08-08 09:56:07');
INSERT INTO `product_skus` VALUES (40, 'soluta', 'Molestias veritatis natus ex.', 3287.00, 3906, 14, '2019-08-08 09:56:07', '2019-08-08 09:56:07');
INSERT INTO `product_skus` VALUES (41, 'voluptate', 'Voluptas illum accusamus quia tempora voluptate.', 4323.00, 34035, 14, '2019-08-08 09:56:07', '2019-08-08 09:56:07');
INSERT INTO `product_skus` VALUES (42, 'deleniti', 'Inventore aliquam optio ea atque error.', 7366.00, 74338, 14, '2019-08-08 09:56:07', '2019-08-08 09:56:07');
INSERT INTO `product_skus` VALUES (43, 'dolorem', 'Corrupti repellat in libero excepturi.', 3650.00, 20357, 15, '2019-08-08 09:56:07', '2019-08-08 09:56:07');
INSERT INTO `product_skus` VALUES (44, 'est', 'Consequuntur laboriosam delectus animi exercitationem sed laborum.', 8448.00, 8401, 15, '2019-08-08 09:56:07', '2019-08-08 09:56:07');
INSERT INTO `product_skus` VALUES (45, 'rem', 'Totam fuga at itaque mollitia eos.', 8314.00, 94816, 15, '2019-08-08 09:56:07', '2019-08-08 09:56:07');
INSERT INTO `product_skus` VALUES (46, 'impedit', 'Animi molestiae qui sit nobis nihil.', 4247.00, 71943, 16, '2019-08-08 09:56:07', '2019-08-08 09:56:07');
INSERT INTO `product_skus` VALUES (47, 'omnis', 'Quia necessitatibus aliquam illum nisi.', 2639.00, 74042, 16, '2019-08-08 09:56:07', '2019-08-08 09:56:07');
INSERT INTO `product_skus` VALUES (48, 'ex', 'Deleniti sint recusandae commodi expedita ipsa.', 3485.00, 9423, 16, '2019-08-08 09:56:07', '2019-08-08 09:56:07');
INSERT INTO `product_skus` VALUES (49, 'voluptates', 'At quisquam iusto odio aut architecto.', 4122.00, 84820, 17, '2019-08-08 09:56:07', '2019-08-08 09:56:07');
INSERT INTO `product_skus` VALUES (50, 'deleniti', 'Delectus deserunt facere dolor eum autem.', 8549.00, 57818, 17, '2019-08-08 09:56:07', '2019-08-08 09:56:07');
INSERT INTO `product_skus` VALUES (51, 'quia', 'Corporis id eos minima ut iusto laborum et.', 7580.00, 11916, 17, '2019-08-08 09:56:07', '2019-08-08 09:56:07');
INSERT INTO `product_skus` VALUES (52, 'minus', 'Fuga laboriosam labore sint omnis.', 9260.00, 91349, 18, '2019-08-08 09:56:07', '2019-08-08 09:56:07');
INSERT INTO `product_skus` VALUES (53, 'veritatis', 'Sed dolorum est ex adipisci dolor quas inventore.', 9069.00, 47154, 18, '2019-08-08 09:56:07', '2019-08-08 09:56:07');
INSERT INTO `product_skus` VALUES (54, 'adipisci', 'In sed consequatur nisi laborum dolorem rem culpa.', 780.00, 4519, 18, '2019-08-08 09:56:07', '2019-08-08 09:56:07');
INSERT INTO `product_skus` VALUES (55, 'alias', 'Architecto repellendus cum blanditiis velit et laudantium voluptatem.', 4786.00, 28628, 19, '2019-08-08 09:56:07', '2019-08-08 09:56:07');
INSERT INTO `product_skus` VALUES (56, 'exercitationem', 'Maiores maiores inventore est earum accusamus.', 6038.00, 78204, 19, '2019-08-08 09:56:07', '2019-08-08 09:56:07');
INSERT INTO `product_skus` VALUES (57, 'omnis', 'Voluptatem ipsam cumque voluptatibus corporis.', 1210.00, 12838, 19, '2019-08-08 09:56:07', '2019-08-08 09:56:07');
INSERT INTO `product_skus` VALUES (58, 'ipsum', 'Quae velit architecto ut consequatur omnis consectetur nesciunt explicabo.', 7259.00, 73202, 20, '2019-08-08 09:56:07', '2019-08-08 09:56:07');
INSERT INTO `product_skus` VALUES (59, 'necessitatibus', 'Rerum facilis voluptatem sed veniam.', 9674.00, 35204, 20, '2019-08-08 09:56:07', '2019-08-08 09:56:07');
INSERT INTO `product_skus` VALUES (60, 'sit', 'Aliquid laborum totam omnis itaque consequatur ducimus.', 9639.00, 62948, 20, '2019-08-08 09:56:07', '2019-08-08 09:56:07');
INSERT INTO `product_skus` VALUES (61, 'aut', 'Laboriosam id dolorum porro.', 9191.00, 98777, 21, '2019-08-08 09:56:07', '2019-08-08 09:56:07');
INSERT INTO `product_skus` VALUES (62, 'amet', 'Perferendis id sed cumque.', 6575.00, 18903, 21, '2019-08-08 09:56:07', '2019-08-08 09:56:07');
INSERT INTO `product_skus` VALUES (63, 'non', 'Non omnis neque enim voluptatem aspernatur temporibus.', 5763.00, 8626, 21, '2019-08-08 09:56:07', '2019-08-08 09:56:07');
INSERT INTO `product_skus` VALUES (64, 'doloribus', 'Unde illo sequi sint voluptatibus.', 8797.00, 69615, 22, '2019-08-08 09:56:07', '2019-08-08 09:56:07');
INSERT INTO `product_skus` VALUES (65, 'aut', 'Quos et laudantium iure suscipit aut.', 1365.00, 62425, 22, '2019-08-08 09:56:07', '2019-08-08 09:56:07');
INSERT INTO `product_skus` VALUES (66, 'in', 'Non sed adipisci enim voluptatem qui eos ipsam.', 9108.00, 20259, 22, '2019-08-08 09:56:08', '2019-08-08 09:56:08');
INSERT INTO `product_skus` VALUES (67, 'optio', 'Totam tempora molestias dolorum voluptatem quam iusto et.', 6938.00, 13647, 23, '2019-08-08 09:56:08', '2019-08-08 09:56:08');
INSERT INTO `product_skus` VALUES (68, 'rerum', 'Id quo ut fugit.', 6367.00, 60345, 23, '2019-08-08 09:56:08', '2019-08-08 09:56:08');
INSERT INTO `product_skus` VALUES (69, 'quasi', 'Expedita ipsum nulla iure et minus eum nulla nihil.', 8582.00, 48348, 23, '2019-08-08 09:56:08', '2019-08-08 09:56:08');
INSERT INTO `product_skus` VALUES (70, 'ut', 'Amet distinctio autem ut ea quod.', 3391.00, 72699, 24, '2019-08-08 09:56:08', '2019-08-08 09:56:08');
INSERT INTO `product_skus` VALUES (71, 'quia', 'Delectus pariatur magnam dolor quam.', 3817.00, 6227, 24, '2019-08-08 09:56:08', '2019-08-08 09:56:08');
INSERT INTO `product_skus` VALUES (72, 'quas', 'Sit non assumenda occaecati fugiat voluptatum fugit voluptatem voluptas.', 1336.00, 50563, 24, '2019-08-08 09:56:08', '2019-08-08 09:56:08');
INSERT INTO `product_skus` VALUES (73, 'nemo', 'Hic aperiam molestias eaque voluptatem eos natus aut.', 8041.00, 73631, 25, '2019-08-08 09:56:08', '2019-08-08 09:56:08');
INSERT INTO `product_skus` VALUES (74, 'quia', 'Alias dolores eligendi numquam in.', 9755.00, 69128, 25, '2019-08-08 09:56:08', '2019-08-08 09:56:08');
INSERT INTO `product_skus` VALUES (75, 'exercitationem', 'Dolorem totam assumenda aut laborum vel tenetur odit.', 2504.00, 50665, 25, '2019-08-08 09:56:08', '2019-08-08 09:56:08');
INSERT INTO `product_skus` VALUES (76, 'quo', 'Iusto aut debitis sed fugiat.', 1202.00, 77648, 26, '2019-08-08 09:56:08', '2019-08-08 09:56:08');
INSERT INTO `product_skus` VALUES (77, 'doloremque', 'Sed totam sit deleniti.', 5768.00, 43760, 26, '2019-08-08 09:56:08', '2019-08-08 09:56:08');
INSERT INTO `product_skus` VALUES (78, 'error', 'Qui quo illum cum maxime hic labore aut.', 7889.00, 8552, 26, '2019-08-08 09:56:08', '2019-08-08 09:56:08');
INSERT INTO `product_skus` VALUES (79, 'nobis', 'Aut voluptas et autem natus nobis et.', 9789.00, 43222, 27, '2019-08-08 09:56:08', '2019-08-08 09:56:08');
INSERT INTO `product_skus` VALUES (80, 'illum', 'Veniam animi asperiores in et non soluta.', 9772.00, 1285, 27, '2019-08-08 09:56:08', '2019-08-08 09:56:08');
INSERT INTO `product_skus` VALUES (81, 'consectetur', 'Tenetur quisquam cumque a sunt natus est aut.', 2777.00, 20116, 27, '2019-08-08 09:56:08', '2019-08-08 09:56:08');
INSERT INTO `product_skus` VALUES (82, 'voluptatem', 'Corrupti dolorem doloribus fuga iusto dolorem magnam quos.', 1529.00, 27905, 28, '2019-08-08 09:56:08', '2019-08-08 09:56:08');
INSERT INTO `product_skus` VALUES (83, 'molestiae', 'Commodi eaque at perferendis.', 2309.00, 55860, 28, '2019-08-08 09:56:08', '2019-08-08 09:56:08');
INSERT INTO `product_skus` VALUES (84, 'minus', 'Quas praesentium nisi error sapiente soluta.', 8978.00, 57963, 28, '2019-08-08 09:56:08', '2019-08-08 09:56:08');
INSERT INTO `product_skus` VALUES (85, 'dolorem', 'Odio cum aut consequatur molestiae impedit.', 7156.00, 42087, 29, '2019-08-08 09:56:08', '2019-08-08 09:56:08');
INSERT INTO `product_skus` VALUES (86, 'modi', 'Qui ut libero et sequi.', 3744.00, 37321, 29, '2019-08-08 09:56:08', '2019-08-08 09:56:08');
INSERT INTO `product_skus` VALUES (87, 'est', 'Eum fugiat aut laboriosam at.', 6933.00, 53390, 29, '2019-08-08 09:56:08', '2019-08-08 09:56:08');
INSERT INTO `product_skus` VALUES (88, 'reprehenderit', 'Similique cupiditate et non consectetur qui necessitatibus.', 7010.00, 90958, 30, '2019-08-08 09:56:08', '2019-08-08 09:56:08');
INSERT INTO `product_skus` VALUES (89, 'molestiae', 'Et laboriosam voluptas molestias dolorum autem repellendus.', 6469.00, 237, 30, '2019-08-08 09:56:08', '2019-08-08 09:56:08');
INSERT INTO `product_skus` VALUES (90, 'beatae', 'Iste totam atque soluta molestias rem blanditiis amet.', 5738.00, 14574, 30, '2019-08-08 09:56:08', '2019-08-08 09:56:08');

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `on_sale` tinyint(1) NOT NULL DEFAULT 1,
  `rating` double(8, 2) NOT NULL DEFAULT 5.00,
  `sold_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `review_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `price` decimal(10, 2) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (1, 'cum', '<p>Placeat vero voluptates debitis velit dolorum dicta modi.</p>', 'images/e50994368946a713c6fd954def3be8f8.png', 1, 2.60, 18, 5, 4917.00, '2019-08-08 09:56:06', '2019-08-08 12:31:04');
INSERT INTO `products` VALUES (2, 'consequatur', 'Explicabo eum accusamus id atque enim harum fugiat.', 'https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/uYEHCJ1oRp.jpg', 1, 3.38, 26, 10, 3026.00, '2019-08-08 09:56:06', '2019-08-08 09:56:13');
INSERT INTO `products` VALUES (3, 'laborum', '<p>Omnis suscipit sint neque corrupti.</p>', 'images/653cf1af1f4b7462659cb1edb4f73140.png', 1, 2.25, 23, 6, 1786.00, '2019-08-08 09:56:06', '2019-08-08 12:14:05');
INSERT INTO `products` VALUES (4, 'voluptatem', 'Totam voluptate eius nihil aut.', 'https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/nIvBAQO5Pj.jpg', 1, 4.17, 32, 10, 277.00, '2019-08-08 09:56:06', '2019-08-08 09:56:13');
INSERT INTO `products` VALUES (5, 'necessitatibus', 'Assumenda ullam et laudantium accusantium repellendus eaque.', 'https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/XrtIwzrxj7.jpg', 1, 2.20, 19, 5, 121.00, '2019-08-08 09:56:06', '2019-08-08 09:56:13');
INSERT INTO `products` VALUES (6, 'minima', 'Nihil maxime deserunt consequatur sint.', 'https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/XrtIwzrxj7.jpg', 1, 3.36, 35, 11, 452.00, '2019-08-08 09:56:06', '2019-08-08 09:56:13');
INSERT INTO `products` VALUES (7, 'sit', 'Sunt et nulla aliquid animi.', 'https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/pa7DrV43Mw.jpg', 1, 1.71, 31, 9, 3156.00, '2019-08-08 09:56:06', '2019-08-08 09:56:13');
INSERT INTO `products` VALUES (8, 'sed', 'Alias sit non eligendi ut magnam nobis debitis harum.', 'https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/7kG1HekGK6.jpg', 1, 2.14, 26, 9, 3063.00, '2019-08-08 09:56:06', '2019-08-08 09:56:13');
INSERT INTO `products` VALUES (9, 'illum', 'Quam quia placeat et exercitationem esse aliquam.', 'https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/2JMRaFwRpo.jpg', 1, 3.00, 22, 9, 4025.00, '2019-08-08 09:56:06', '2019-08-08 09:56:13');
INSERT INTO `products` VALUES (10, 'rerum', 'Et eius illum eveniet.', 'https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/XrtIwzrxj7.jpg', 1, 2.60, 17, 7, 453.00, '2019-08-08 09:56:06', '2019-08-08 09:56:13');
INSERT INTO `products` VALUES (11, 'cum', 'Nemo quia voluptatem beatae.', 'https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/XrtIwzrxj7.jpg', 1, 2.50, 19, 6, 648.00, '2019-08-08 09:56:06', '2019-08-08 09:56:13');
INSERT INTO `products` VALUES (12, 'repudiandae', 'Vel ullam molestiae nemo laboriosam accusamus.', 'https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/uYEHCJ1oRp.jpg', 1, 2.83, 25, 9, 4912.00, '2019-08-08 09:56:06', '2019-08-08 09:56:13');
INSERT INTO `products` VALUES (13, 'doloremque', 'Quisquam modi eos cum beatae quia maiores.', 'https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/82Wf2sg8gM.jpg', 1, 3.00, 8, 3, 541.00, '2019-08-08 09:56:06', '2019-08-08 09:56:13');
INSERT INTO `products` VALUES (14, 'nihil', 'Voluptatum quo commodi pariatur laudantium inventore.', 'https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/1B3n0ATKrn.jpg', 1, 2.00, 26, 8, 3287.00, '2019-08-08 09:56:06', '2019-08-08 09:56:13');
INSERT INTO `products` VALUES (15, 'suscipit', 'Dolores dolores qui hic sunt consequatur repellat.', 'https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/r3BNRe4zXG.jpg', 1, 2.00, 13, 6, 3650.00, '2019-08-08 09:56:06', '2019-08-08 09:56:13');
INSERT INTO `products` VALUES (16, 'inventore', 'Iusto ut nobis perspiciatis autem adipisci voluptatem ullam.', 'https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/C0bVuKB2nt.jpg', 1, 2.60, 17, 6, 2639.00, '2019-08-08 09:56:06', '2019-08-08 09:56:13');
INSERT INTO `products` VALUES (17, 'voluptatum', 'Suscipit sed eveniet incidunt atque.', 'https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/7kG1HekGK6.jpg', 1, 2.60, 16, 6, 4122.00, '2019-08-08 09:56:06', '2019-08-08 09:56:13');
INSERT INTO `products` VALUES (18, 'et', 'Assumenda et est labore ut rerum neque.', 'https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/nIvBAQO5Pj.jpg', 1, 2.40, 32, 9, 780.00, '2019-08-08 09:56:06', '2019-08-08 09:56:13');
INSERT INTO `products` VALUES (19, 'libero', 'Placeat error a totam.', 'https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/uYEHCJ1oRp.jpg', 1, 3.67, 19, 6, 1210.00, '2019-08-08 09:56:06', '2019-08-08 09:56:13');
INSERT INTO `products` VALUES (20, 'quis', 'Modi provident magni quos sed ad.', 'https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/1B3n0ATKrn.jpg', 1, 3.83, 27, 8, 7259.00, '2019-08-08 09:56:06', '2019-08-08 09:56:13');
INSERT INTO `products` VALUES (21, 'voluptatibus', 'Aut rerum hic possimus quisquam nihil repellat cumque sapiente.', 'https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/7kG1HekGK6.jpg', 1, 3.43, 26, 10, 5763.00, '2019-08-08 09:56:06', '2019-08-08 09:56:13');
INSERT INTO `products` VALUES (22, 'modi', 'Architecto libero ullam ut consequuntur voluptatem omnis.', 'https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/r3BNRe4zXG.jpg', 1, 2.00, 14, 4, 1365.00, '2019-08-08 09:56:06', '2019-08-08 09:56:13');
INSERT INTO `products` VALUES (23, 'est', 'Nostrum blanditiis non voluptatem sit.', 'https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/7kG1HekGK6.jpg', 1, 3.60, 27, 8, 6367.00, '2019-08-08 09:56:06', '2019-08-08 09:56:13');
INSERT INTO `products` VALUES (24, 'quasi', 'Quibusdam esse in mollitia.', 'https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/C0bVuKB2nt.jpg', 1, 4.00, 12, 3, 1336.00, '2019-08-08 09:56:06', '2019-08-08 09:56:13');
INSERT INTO `products` VALUES (25, 'quod', 'Et est consequatur consequatur quia.', 'https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/XrtIwzrxj7.jpg', 1, 2.80, 14, 5, 2504.00, '2019-08-08 09:56:06', '2019-08-08 09:56:13');
INSERT INTO `products` VALUES (26, 'dolorum', 'Quibusdam explicabo exercitationem cum aliquid sit delectus architecto.', 'https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/2JMRaFwRpo.jpg', 1, 2.33, 6, 4, 1202.00, '2019-08-08 09:56:06', '2019-08-08 09:56:13');
INSERT INTO `products` VALUES (27, 'impedit', 'Velit distinctio eos esse nihil dicta quo architecto impedit.', 'https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/r3BNRe4zXG.jpg', 1, 3.25, 12, 5, 2777.00, '2019-08-08 09:56:06', '2019-08-08 09:56:13');
INSERT INTO `products` VALUES (28, 'quis', 'Deserunt minima neque dolores sunt harum quo.', 'https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/r3BNRe4zXG.jpg', 1, 1.00, 7, 2, 1529.00, '2019-08-08 09:56:07', '2019-08-08 09:56:13');
INSERT INTO `products` VALUES (29, 'dolor', 'In quibusdam dolor illo ut.', 'https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/7kG1HekGK6.jpg', 1, 4.00, 10, 4, 3744.00, '2019-08-08 09:56:07', '2019-08-08 09:56:13');
INSERT INTO `products` VALUES (30, 'praesentium', 'Sunt voluptatem iste atque harum.', 'https://iocaffcdn.phphub.org/uploads/images/201806/01/5320/2JMRaFwRpo.jpg', 1, 4.50, 13, 3, 5738.00, '2019-08-08 09:56:07', '2019-08-08 09:56:13');

-- ----------------------------
-- Table structure for user_addresses
-- ----------------------------
DROP TABLE IF EXISTS `user_addresses`;
CREATE TABLE `user_addresses`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `province` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `district` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `zip` int(10) UNSIGNED NOT NULL,
  `contact_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_used_at` datetime(0) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_addresses_user_id_foreign`(`user_id`) USING BTREE,
  CONSTRAINT `user_addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 183 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_addresses
-- ----------------------------
INSERT INTO `user_addresses` VALUES (1, 1, '河北省', '石家庄市', '长安区', '第97街道第976号', 468700, '冀凤英', '13648655506', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (2, 1, '江苏省', '南京市', '浦口区', '第23街道第351号', 167600, '毕凤兰', '18406911894', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (3, 1, '广东省', '深圳市', '福田区', '第82街道第854号', 582300, '蓝慧', '18950419917', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (4, 2, '广东省', '深圳市', '福田区', '第96街道第729号', 543200, '汤浩', '18225019462', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (5, 3, '江苏省', '苏州市', '相城区', '第23街道第790号', 843600, '宁阳', '15839497890', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (6, 4, '北京市', '市辖区', '东城区', '第31街道第106号', 441700, '向旭', '17087789621', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (7, 5, '河北省', '石家庄市', '长安区', '第42街道第367号', 757000, '凌杨', '14788782206', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (8, 5, '江苏省', '苏州市', '相城区', '第44街道第818号', 774800, '郜春梅', '17195813626', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (9, 5, '广东省', '深圳市', '福田区', '第46街道第291号', 166900, '洪楼', '15548041273', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (10, 6, '河北省', '石家庄市', '长安区', '第93街道第778号', 833000, '盖正平', '18956687119', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (11, 6, '广东省', '深圳市', '福田区', '第8街道第944号', 74700, '欧阳英', '17193017324', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (12, 6, '江苏省', '苏州市', '相城区', '第87街道第625号', 143500, '韩楠', '15058072188', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (13, 7, '北京市', '市辖区', '东城区', '第13街道第205号', 524800, '项怡', '15042097139', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (14, 8, '北京市', '市辖区', '东城区', '第76街道第678号', 554000, '向桂花', '13333070176', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (15, 8, '河北省', '石家庄市', '长安区', '第80街道第284号', 185400, '余龙', '18721083693', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (16, 9, '河北省', '石家庄市', '长安区', '第69街道第41号', 263500, '项旭', '17081025965', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (17, 9, '江苏省', '南京市', '浦口区', '第96街道第42号', 71900, '梅淑珍', '17188479252', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (18, 10, '江苏省', '南京市', '浦口区', '第64街道第70号', 206400, '蒋腊梅', '15574414568', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (19, 11, '江苏省', '南京市', '浦口区', '第21街道第388号', 318800, '卓毅', '18827045528', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (20, 11, '江苏省', '南京市', '浦口区', '第97街道第651号', 122900, '扬玉华', '17082835470', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (21, 11, '河北省', '石家庄市', '长安区', '第30街道第716号', 725600, '邱玉华', '17895306332', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (22, 12, '江苏省', '苏州市', '相城区', '第34街道第742号', 32700, '邵志文', '15795748794', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (23, 12, '江苏省', '苏州市', '相城区', '第10街道第357号', 822400, '莫学明', '18488001435', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (24, 12, '广东省', '深圳市', '福田区', '第49街道第432号', 352800, '白晧', '17006784445', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (25, 13, '江苏省', '南京市', '浦口区', '第74街道第581号', 162100, '乔淑英', '18319930195', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (26, 14, '北京市', '市辖区', '东城区', '第47街道第902号', 227900, '谢秀荣', '18372869027', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (27, 14, '江苏省', '苏州市', '相城区', '第72街道第860号', 475700, '纪鹰', '13015538805', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (28, 14, '北京市', '市辖区', '东城区', '第96街道第720号', 396900, '戚超', '18417899360', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (29, 15, '江苏省', '南京市', '浦口区', '第99街道第198号', 503100, '栾强', '15375800268', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (30, 16, '河北省', '石家庄市', '长安区', '第76街道第909号', 282200, '康秀芳', '17093690072', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (31, 16, '北京市', '市辖区', '东城区', '第47街道第802号', 505100, '解捷', '17099497974', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (32, 17, '江苏省', '苏州市', '相城区', '第36街道第719号', 401700, '虞桂荣', '15978126633', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (33, 17, '北京市', '市辖区', '东城区', '第8街道第509号', 822600, '向阳', '18736767730', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (34, 17, '北京市', '市辖区', '东城区', '第21街道第842号', 314200, '龙智勇', '13662986595', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (35, 18, '河北省', '石家庄市', '长安区', '第36街道第836号', 582400, '江琴', '17796048239', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (36, 18, '河北省', '石家庄市', '长安区', '第48街道第405号', 425400, '关春梅', '15773912359', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (37, 19, '河北省', '石家庄市', '长安区', '第8街道第542号', 45200, '司桂香', '18859105302', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (38, 19, '江苏省', '苏州市', '相城区', '第73街道第380号', 221400, '嵺凤英', '14740083431', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (39, 20, '江苏省', '苏州市', '相城区', '第22街道第699号', 585400, '辛翔', '18106138607', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (40, 21, '江苏省', '南京市', '浦口区', '第75街道第326号', 301600, '马翼', '13104920995', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (41, 21, '广东省', '深圳市', '福田区', '第26街道第113号', 796200, '翁华', '18097936681', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (42, 21, '广东省', '深圳市', '福田区', '第3街道第924号', 403700, '贺东', '17181191828', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (43, 22, '北京市', '市辖区', '东城区', '第47街道第990号', 387200, '聂红', '18514156069', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (44, 22, '江苏省', '南京市', '浦口区', '第63街道第758号', 145800, '殷文君', '13539873510', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (45, 23, '江苏省', '苏州市', '相城区', '第97街道第198号', 134900, '丛鹏', '15280042955', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (46, 24, '江苏省', '苏州市', '相城区', '第68街道第517号', 158000, '金博涛', '14735450127', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (47, 25, '江苏省', '南京市', '浦口区', '第67街道第504号', 408300, '巫金凤', '14745508866', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (48, 26, '江苏省', '南京市', '浦口区', '第96街道第872号', 102200, '向旭', '13103945536', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (49, 26, '广东省', '深圳市', '福田区', '第3街道第672号', 724100, '吉国庆', '17032261875', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (50, 26, '江苏省', '苏州市', '相城区', '第65街道第172号', 575600, '党浩', '18621190723', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (51, 27, '江苏省', '苏州市', '相城区', '第20街道第859号', 298300, '柳健', '13993534176', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (52, 28, '北京市', '市辖区', '东城区', '第44街道第718号', 702400, '成怡', '13470371318', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (53, 28, '北京市', '市辖区', '东城区', '第59街道第74号', 104500, '曹瑞', '17073572951', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (54, 29, '江苏省', '南京市', '浦口区', '第44街道第703号', 306200, '闵志强', '17175132230', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (55, 29, '广东省', '深圳市', '福田区', '第38街道第533号', 335800, '揭超', '15625409543', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (56, 29, '江苏省', '苏州市', '相城区', '第91街道第449号', 541300, '饶桂荣', '17004599551', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (57, 30, '江苏省', '苏州市', '相城区', '第16街道第483号', 94900, '邓鑫', '18281213018', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (58, 30, '江苏省', '南京市', '浦口区', '第64街道第389号', 77100, '费彬', '13794990848', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (59, 30, '江苏省', '南京市', '浦口区', '第61街道第257号', 37800, '陶昱然', '17005811075', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (60, 31, '广东省', '深圳市', '福田区', '第24街道第635号', 552400, '官欣', '18242164096', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (61, 32, '广东省', '深圳市', '福田区', '第71街道第603号', 74200, '祁燕', '13958405087', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (62, 32, '北京市', '市辖区', '东城区', '第86街道第301号', 327400, '纪敏', '15298662313', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (63, 32, '江苏省', '苏州市', '相城区', '第8街道第478号', 793600, '费洋', '15501303185', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (64, 33, '河北省', '石家庄市', '长安区', '第75街道第776号', 213800, '严淑英', '15702061732', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (65, 34, '江苏省', '南京市', '浦口区', '第15街道第25号', 541700, '尹桂芝', '13728376407', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (66, 35, '江苏省', '苏州市', '相城区', '第81街道第570号', 134300, '项帆', '14765033313', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (67, 36, '广东省', '深圳市', '福田区', '第57街道第665号', 698400, '蔺振国', '15256886134', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (68, 37, '江苏省', '苏州市', '相城区', '第54街道第563号', 176400, '龙文彬', '15593697432', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (69, 38, '江苏省', '南京市', '浦口区', '第40街道第196号', 466900, '商博涛', '13852486477', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (70, 38, '广东省', '深圳市', '福田区', '第6街道第898号', 127400, '韩瑞', '17098086592', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (71, 39, '江苏省', '南京市', '浦口区', '第64街道第434号', 661500, '姜雪梅', '13741715628', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (72, 40, '江苏省', '苏州市', '相城区', '第93街道第310号', 383600, '傅军', '18772261773', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (73, 41, '江苏省', '南京市', '浦口区', '第55街道第589号', 627600, '瞿瑜', '14743083670', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (74, 41, '江苏省', '南京市', '浦口区', '第67街道第922号', 137400, '钱金凤', '13952957034', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (75, 42, '江苏省', '苏州市', '相城区', '第41街道第620号', 122100, '覃志新', '17191162137', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (76, 43, '北京市', '市辖区', '东城区', '第84街道第924号', 333600, '敖梅', '17186502061', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (77, 44, '江苏省', '南京市', '浦口区', '第56街道第132号', 428800, '丛桂芳', '15933379481', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (78, 44, '江苏省', '苏州市', '相城区', '第66街道第955号', 645400, '金英', '13517966775', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (79, 44, '北京市', '市辖区', '东城区', '第87街道第849号', 821200, '傅芬', '17059810139', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (80, 45, '江苏省', '南京市', '浦口区', '第39街道第886号', 302600, '牟依琳', '13743560856', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (81, 45, '广东省', '深圳市', '福田区', '第51街道第588号', 693900, '颜宁', '18103799425', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (82, 46, '广东省', '深圳市', '福田区', '第98街道第205号', 45300, '王洁', '17754262368', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (83, 47, '河北省', '石家庄市', '长安区', '第83街道第833号', 577000, '姬怡', '18280701128', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (84, 47, '河北省', '石家庄市', '长安区', '第46街道第669号', 843500, '丁瑞', '15188992662', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (85, 48, '北京市', '市辖区', '东城区', '第38街道第982号', 774800, '孙敏', '17017041355', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (86, 49, '江苏省', '苏州市', '相城区', '第55街道第672号', 293300, '晋芳', '18820497042', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (87, 49, '广东省', '深圳市', '福田区', '第8街道第382号', 504600, '苟伦', '18114420184', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (88, 50, '江苏省', '南京市', '浦口区', '第50街道第165号', 267800, '陶玉英', '18922516852', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (89, 50, '北京市', '市辖区', '东城区', '第6街道第418号', 494000, '闵帆', '18136132690', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (90, 51, '广东省', '深圳市', '福田区', '第21街道第25号', 542600, '成明霞', '13717020877', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (91, 51, '江苏省', '苏州市', '相城区', '第35街道第232号', 622400, '董利', '17754298247', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (92, 52, '江苏省', '苏州市', '相城区', '第87街道第152号', 483800, '习凤英', '17189410531', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (93, 52, '北京市', '市辖区', '东城区', '第81街道第499号', 397000, '董致远', '18234428648', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (94, 53, '北京市', '市辖区', '东城区', '第52街道第648号', 536700, '僧腊梅', '13503409306', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (95, 54, '江苏省', '苏州市', '相城区', '第38街道第112号', 353400, '嵺丽丽', '13199901230', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (96, 54, '北京市', '市辖区', '东城区', '第40街道第351号', 165300, '高燕', '18664240019', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (97, 55, '广东省', '深圳市', '福田区', '第46街道第337号', 468400, '夏桂英', '18228907835', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (98, 56, '北京市', '市辖区', '东城区', '第97街道第687号', 47600, '范峰', '17073855781', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (99, 56, '河北省', '石家庄市', '长安区', '第10街道第162号', 634600, '任桂荣', '15117035795', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (100, 57, '北京市', '市辖区', '东城区', '第96街道第799号', 585000, '任秀英', '17848394779', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (101, 57, '江苏省', '南京市', '浦口区', '第72街道第674号', 377200, '杨国庆', '15633551302', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (102, 58, '广东省', '深圳市', '福田区', '第97街道第590号', 11300, '傅怡', '18569925478', NULL, '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `user_addresses` VALUES (103, 58, '河北省', '石家庄市', '长安区', '第33街道第402号', 557200, '侯冬梅', '15199145906', NULL, '2019-08-08 09:56:06', '2019-08-08 09:56:06');
INSERT INTO `user_addresses` VALUES (104, 59, '广东省', '深圳市', '福田区', '第76街道第306号', 78500, '荆琴', '17093733564', NULL, '2019-08-08 09:56:06', '2019-08-08 09:56:06');
INSERT INTO `user_addresses` VALUES (105, 59, '江苏省', '苏州市', '相城区', '第61街道第89号', 261700, '习洋', '15011295907', NULL, '2019-08-08 09:56:06', '2019-08-08 09:56:06');
INSERT INTO `user_addresses` VALUES (106, 60, '广东省', '深圳市', '福田区', '第59街道第898号', 477500, '连欣', '17091485925', NULL, '2019-08-08 09:56:06', '2019-08-08 09:56:06');
INSERT INTO `user_addresses` VALUES (107, 60, '江苏省', '苏州市', '相城区', '第40街道第805号', 792300, '柏哲彦', '17753303607', NULL, '2019-08-08 09:56:06', '2019-08-08 09:56:06');
INSERT INTO `user_addresses` VALUES (108, 60, '江苏省', '苏州市', '相城区', '第11街道第892号', 108000, '龚丹丹', '13374644823', NULL, '2019-08-08 09:56:06', '2019-08-08 09:56:06');
INSERT INTO `user_addresses` VALUES (109, 61, '江苏省', '南京市', '浦口区', '第40街道第550号', 541400, '卜丽娟', '15037858529', NULL, '2019-08-08 09:56:06', '2019-08-08 09:56:06');
INSERT INTO `user_addresses` VALUES (110, 61, '北京市', '市辖区', '东城区', '第13街道第545号', 251800, '裴昱然', '17191323565', NULL, '2019-08-08 09:56:06', '2019-08-08 09:56:06');
INSERT INTO `user_addresses` VALUES (111, 62, '河北省', '石家庄市', '长安区', '第35街道第565号', 694700, '成志文', '18078705827', NULL, '2019-08-08 09:56:06', '2019-08-08 09:56:06');
INSERT INTO `user_addresses` VALUES (112, 63, '江苏省', '南京市', '浦口区', '第48街道第683号', 607100, '杜毅', '18057968093', NULL, '2019-08-08 09:56:06', '2019-08-08 09:56:06');
INSERT INTO `user_addresses` VALUES (113, 63, '北京市', '市辖区', '东城区', '第89街道第56号', 772600, '卢明', '13963774542', NULL, '2019-08-08 09:56:06', '2019-08-08 09:56:06');
INSERT INTO `user_addresses` VALUES (114, 64, '江苏省', '南京市', '浦口区', '第75街道第444号', 533700, '贾淑英', '15396724097', NULL, '2019-08-08 09:56:06', '2019-08-08 09:56:06');
INSERT INTO `user_addresses` VALUES (115, 65, '江苏省', '南京市', '浦口区', '第0街道第246号', 756900, '廉凤兰', '17051305797', NULL, '2019-08-08 09:56:06', '2019-08-08 09:56:06');
INSERT INTO `user_addresses` VALUES (116, 66, '江苏省', '苏州市', '相城区', '第36街道第685号', 706300, '娄欣', '15682216244', NULL, '2019-08-08 09:56:06', '2019-08-08 09:56:06');
INSERT INTO `user_addresses` VALUES (117, 66, '北京市', '市辖区', '东城区', '第62街道第488号', 761500, '项文娟', '15991169180', NULL, '2019-08-08 09:56:06', '2019-08-08 09:56:06');
INSERT INTO `user_addresses` VALUES (118, 66, '江苏省', '南京市', '浦口区', '第13街道第894号', 523300, '倪萍', '18623295182', NULL, '2019-08-08 09:56:06', '2019-08-08 09:56:06');
INSERT INTO `user_addresses` VALUES (119, 67, '江苏省', '南京市', '浦口区', '第78街道第947号', 512900, '韩荣', '13628051871', NULL, '2019-08-08 09:56:06', '2019-08-08 09:56:06');
INSERT INTO `user_addresses` VALUES (120, 67, '广东省', '深圳市', '福田区', '第99街道第128号', 748700, '康鑫', '15249459824', NULL, '2019-08-08 09:56:06', '2019-08-08 09:56:06');
INSERT INTO `user_addresses` VALUES (121, 68, '北京市', '市辖区', '东城区', '第89街道第171号', 665200, '吕捷', '17050236759', NULL, '2019-08-08 09:56:06', '2019-08-08 09:56:06');
INSERT INTO `user_addresses` VALUES (122, 69, '河北省', '石家庄市', '长安区', '第4街道第495号', 283000, '严瑞', '17012775161', NULL, '2019-08-08 09:56:06', '2019-08-08 09:56:06');
INSERT INTO `user_addresses` VALUES (123, 70, '河北省', '石家庄市', '长安区', '第30街道第958号', 622800, '牟晶', '17090968140', NULL, '2019-08-08 09:56:06', '2019-08-08 09:56:06');
INSERT INTO `user_addresses` VALUES (124, 70, '江苏省', '苏州市', '相城区', '第82街道第16号', 831200, '喻军', '13015258338', NULL, '2019-08-08 09:56:06', '2019-08-08 09:56:06');
INSERT INTO `user_addresses` VALUES (125, 71, '北京市', '市辖区', '东城区', '第64街道第573号', 288600, '邸怡', '18614302621', NULL, '2019-08-08 09:56:06', '2019-08-08 09:56:06');
INSERT INTO `user_addresses` VALUES (126, 72, '江苏省', '南京市', '浦口区', '第57街道第127号', 77400, '戚松', '18032803140', NULL, '2019-08-08 09:56:06', '2019-08-08 09:56:06');
INSERT INTO `user_addresses` VALUES (127, 72, '广东省', '深圳市', '福田区', '第69街道第571号', 694300, '米文', '18729500391', NULL, '2019-08-08 09:56:06', '2019-08-08 09:56:06');
INSERT INTO `user_addresses` VALUES (128, 73, '河北省', '石家庄市', '长安区', '第73街道第909号', 137600, '盛娟', '18297042528', NULL, '2019-08-08 09:56:06', '2019-08-08 09:56:06');
INSERT INTO `user_addresses` VALUES (129, 73, '江苏省', '南京市', '浦口区', '第55街道第316号', 351700, '卞晨', '18151063585', NULL, '2019-08-08 09:56:06', '2019-08-08 09:56:06');
INSERT INTO `user_addresses` VALUES (130, 74, '江苏省', '南京市', '浦口区', '第28街道第754号', 204700, '明英', '18772421656', NULL, '2019-08-08 09:56:06', '2019-08-08 09:56:06');
INSERT INTO `user_addresses` VALUES (131, 74, '北京市', '市辖区', '东城区', '第56街道第787号', 242400, '沉佳', '14531850354', NULL, '2019-08-08 09:56:06', '2019-08-08 09:56:06');
INSERT INTO `user_addresses` VALUES (132, 74, '江苏省', '苏州市', '相城区', '第79街道第613号', 261300, '项嘉俊', '18351749988', NULL, '2019-08-08 09:56:06', '2019-08-08 09:56:06');
INSERT INTO `user_addresses` VALUES (133, 75, '江苏省', '南京市', '浦口区', '第62街道第682号', 714500, '冯瑜', '18260600633', NULL, '2019-08-08 09:56:06', '2019-08-08 09:56:06');
INSERT INTO `user_addresses` VALUES (134, 75, '广东省', '深圳市', '福田区', '第99街道第857号', 96700, '佟淑英', '18490842089', NULL, '2019-08-08 09:56:06', '2019-08-08 09:56:06');
INSERT INTO `user_addresses` VALUES (135, 76, '河北省', '石家庄市', '长安区', '第62街道第601号', 631200, '冯嘉', '17086428653', NULL, '2019-08-08 09:56:06', '2019-08-08 09:56:06');
INSERT INTO `user_addresses` VALUES (136, 76, '北京市', '市辖区', '东城区', '第61街道第341号', 374700, '莫哲彦', '15651681654', NULL, '2019-08-08 09:56:06', '2019-08-08 09:56:06');
INSERT INTO `user_addresses` VALUES (137, 77, '江苏省', '南京市', '浦口区', '第19街道第642号', 324200, '保欣', '17048742796', NULL, '2019-08-08 09:56:06', '2019-08-08 09:56:06');
INSERT INTO `user_addresses` VALUES (138, 78, '广东省', '深圳市', '福田区', '第31街道第327号', 184700, '植丽', '13998959611', NULL, '2019-08-08 09:56:06', '2019-08-08 09:56:06');
INSERT INTO `user_addresses` VALUES (139, 78, '江苏省', '苏州市', '相城区', '第40街道第723号', 125800, '顾冬梅', '18417147382', NULL, '2019-08-08 09:56:06', '2019-08-08 09:56:06');
INSERT INTO `user_addresses` VALUES (140, 79, '河北省', '石家庄市', '长安区', '第81街道第407号', 618500, '位春梅', '13726002260', NULL, '2019-08-08 09:56:06', '2019-08-08 09:56:06');
INSERT INTO `user_addresses` VALUES (141, 79, '北京市', '市辖区', '东城区', '第52街道第585号', 811000, '欧超', '17198605694', NULL, '2019-08-08 09:56:06', '2019-08-08 09:56:06');
INSERT INTO `user_addresses` VALUES (142, 79, '北京市', '市辖区', '东城区', '第51街道第306号', 17800, '涂洪', '18257853525', NULL, '2019-08-08 09:56:06', '2019-08-08 09:56:06');
INSERT INTO `user_addresses` VALUES (143, 80, '广东省', '深圳市', '福田区', '第7街道第351号', 668200, '华馨予', '18803946917', NULL, '2019-08-08 09:56:06', '2019-08-08 09:56:06');
INSERT INTO `user_addresses` VALUES (144, 81, '广东省', '深圳市', '福田区', '第91街道第33号', 22400, '路志强', '17055634650', NULL, '2019-08-08 09:56:06', '2019-08-08 09:56:06');
INSERT INTO `user_addresses` VALUES (145, 81, '江苏省', '苏州市', '相城区', '第9街道第556号', 398700, '芦明', '14751413019', NULL, '2019-08-08 09:56:06', '2019-08-08 09:56:06');
INSERT INTO `user_addresses` VALUES (146, 81, '北京市', '市辖区', '东城区', '第13街道第801号', 721900, '栾成', '18827412667', NULL, '2019-08-08 09:56:06', '2019-08-08 09:56:06');
INSERT INTO `user_addresses` VALUES (147, 82, '江苏省', '苏州市', '相城区', '第87街道第327号', 317300, '畅瑜', '15133731674', NULL, '2019-08-08 09:56:06', '2019-08-08 09:56:06');
INSERT INTO `user_addresses` VALUES (148, 82, '北京市', '市辖区', '东城区', '第49街道第757号', 201800, '项桂芬', '13835469438', NULL, '2019-08-08 09:56:06', '2019-08-08 09:56:06');
INSERT INTO `user_addresses` VALUES (149, 83, '广东省', '深圳市', '福田区', '第71街道第429号', 797000, '戴智勇', '15669584492', NULL, '2019-08-08 09:56:06', '2019-08-08 09:56:06');
INSERT INTO `user_addresses` VALUES (150, 84, '江苏省', '苏州市', '相城区', '第28街道第718号', 672800, '喻桂芝', '18806623922', NULL, '2019-08-08 09:56:06', '2019-08-08 09:56:06');
INSERT INTO `user_addresses` VALUES (151, 85, '江苏省', '苏州市', '相城区', '第67街道第842号', 86500, '嵺明', '15162535585', NULL, '2019-08-08 09:56:06', '2019-08-08 09:56:06');
INSERT INTO `user_addresses` VALUES (152, 86, '江苏省', '苏州市', '相城区', '第1街道第139号', 322400, '喻杰', '17084475098', NULL, '2019-08-08 09:56:06', '2019-08-08 09:56:06');
INSERT INTO `user_addresses` VALUES (153, 86, '广东省', '深圳市', '福田区', '第7街道第766号', 172300, '曾欣', '15912219116', NULL, '2019-08-08 09:56:06', '2019-08-08 09:56:06');
INSERT INTO `user_addresses` VALUES (154, 86, '江苏省', '苏州市', '相城区', '第83街道第789号', 674900, '翟丽丽', '18304780329', NULL, '2019-08-08 09:56:06', '2019-08-08 09:56:06');
INSERT INTO `user_addresses` VALUES (155, 87, '河北省', '石家庄市', '长安区', '第13街道第47号', 466400, '曾海燕', '15700172012', NULL, '2019-08-08 09:56:06', '2019-08-08 09:56:06');
INSERT INTO `user_addresses` VALUES (156, 87, '江苏省', '南京市', '浦口区', '第47街道第118号', 491900, '简智敏', '18310611223', NULL, '2019-08-08 09:56:06', '2019-08-08 09:56:06');
INSERT INTO `user_addresses` VALUES (157, 88, '广东省', '深圳市', '福田区', '第0街道第261号', 757100, '符楠', '13560667448', NULL, '2019-08-08 09:56:06', '2019-08-08 09:56:06');
INSERT INTO `user_addresses` VALUES (158, 89, '河北省', '石家庄市', '长安区', '第41街道第448号', 517000, '温志文', '13486411498', NULL, '2019-08-08 09:56:06', '2019-08-08 09:56:06');
INSERT INTO `user_addresses` VALUES (159, 90, '江苏省', '苏州市', '相城区', '第0街道第666号', 496400, '常正豪', '18574577138', NULL, '2019-08-08 09:56:06', '2019-08-08 09:56:06');
INSERT INTO `user_addresses` VALUES (160, 90, '河北省', '石家庄市', '长安区', '第60街道第152号', 284800, '鞠子安', '13605499373', NULL, '2019-08-08 09:56:06', '2019-08-08 09:56:06');
INSERT INTO `user_addresses` VALUES (161, 90, '江苏省', '苏州市', '相城区', '第82街道第500号', 696500, '古鹰', '18925582382', NULL, '2019-08-08 09:56:06', '2019-08-08 09:56:06');
INSERT INTO `user_addresses` VALUES (162, 91, '江苏省', '苏州市', '相城区', '第15街道第656号', 467800, '童平', '13954496915', NULL, '2019-08-08 09:56:06', '2019-08-08 09:56:06');
INSERT INTO `user_addresses` VALUES (163, 91, '北京市', '市辖区', '东城区', '第70街道第480号', 655500, '温振国', '17193368109', NULL, '2019-08-08 09:56:06', '2019-08-08 09:56:06');
INSERT INTO `user_addresses` VALUES (164, 92, '河北省', '石家庄市', '长安区', '第92街道第920号', 728500, '谷欣', '13580701791', NULL, '2019-08-08 09:56:06', '2019-08-08 09:56:06');
INSERT INTO `user_addresses` VALUES (165, 92, '江苏省', '苏州市', '相城区', '第14街道第192号', 795600, '游磊', '17010351694', NULL, '2019-08-08 09:56:06', '2019-08-08 09:56:06');
INSERT INTO `user_addresses` VALUES (166, 92, '江苏省', '南京市', '浦口区', '第71街道第849号', 843300, '盖楠', '18611142716', NULL, '2019-08-08 09:56:06', '2019-08-08 09:56:06');
INSERT INTO `user_addresses` VALUES (167, 93, '北京市', '市辖区', '东城区', '第86街道第660号', 11800, '黎婕', '15877486908', NULL, '2019-08-08 09:56:06', '2019-08-08 09:56:06');
INSERT INTO `user_addresses` VALUES (168, 93, '江苏省', '苏州市', '相城区', '第37街道第181号', 721000, '周峰', '15207468114', NULL, '2019-08-08 09:56:06', '2019-08-08 09:56:06');
INSERT INTO `user_addresses` VALUES (169, 94, '广东省', '深圳市', '福田区', '第65街道第720号', 373800, '庄桂兰', '17087871553', NULL, '2019-08-08 09:56:06', '2019-08-08 09:56:06');
INSERT INTO `user_addresses` VALUES (170, 94, '广东省', '深圳市', '福田区', '第78街道第384号', 226900, '田欢', '13088468226', NULL, '2019-08-08 09:56:06', '2019-08-08 09:56:06');
INSERT INTO `user_addresses` VALUES (171, 94, '广东省', '深圳市', '福田区', '第38街道第206号', 773800, '钱云', '15101501378', NULL, '2019-08-08 09:56:06', '2019-08-08 09:56:06');
INSERT INTO `user_addresses` VALUES (172, 95, '江苏省', '南京市', '浦口区', '第22街道第791号', 824600, '童敏静', '18268077775', NULL, '2019-08-08 09:56:06', '2019-08-08 09:56:06');
INSERT INTO `user_addresses` VALUES (173, 96, '河北省', '石家庄市', '长安区', '第74街道第630号', 568400, '曾龙', '17090134884', NULL, '2019-08-08 09:56:06', '2019-08-08 09:56:06');
INSERT INTO `user_addresses` VALUES (174, 96, '北京市', '市辖区', '东城区', '第93街道第969号', 375500, '倪小红', '18854072691', NULL, '2019-08-08 09:56:06', '2019-08-08 09:56:06');
INSERT INTO `user_addresses` VALUES (175, 97, '江苏省', '南京市', '浦口区', '第95街道第976号', 48800, '卞冰冰', '13832247606', NULL, '2019-08-08 09:56:06', '2019-08-08 09:56:06');
INSERT INTO `user_addresses` VALUES (176, 98, '北京市', '市辖区', '东城区', '第44街道第560号', 294200, '池杨', '14542478202', NULL, '2019-08-08 09:56:06', '2019-08-08 09:56:06');
INSERT INTO `user_addresses` VALUES (177, 98, '河北省', '石家庄市', '长安区', '第98街道第242号', 367000, '庞丽华', '14574058213', NULL, '2019-08-08 09:56:06', '2019-08-08 09:56:06');
INSERT INTO `user_addresses` VALUES (178, 99, '广东省', '深圳市', '福田区', '第32街道第990号', 623000, '仲伟', '18874707512', NULL, '2019-08-08 09:56:06', '2019-08-08 09:56:06');
INSERT INTO `user_addresses` VALUES (179, 99, '江苏省', '苏州市', '相城区', '第15街道第958号', 457900, '党瑞', '15947436972', NULL, '2019-08-08 09:56:06', '2019-08-08 09:56:06');
INSERT INTO `user_addresses` VALUES (180, 100, '江苏省', '苏州市', '相城区', '第13街道第724号', 416900, '曲佳', '13668165863', NULL, '2019-08-08 09:56:06', '2019-08-08 09:56:06');
INSERT INTO `user_addresses` VALUES (181, 100, '江苏省', '南京市', '浦口区', '第29街道第168号', 818400, '甘慧', '15958850367', NULL, '2019-08-08 09:56:06', '2019-08-08 09:56:06');
INSERT INTO `user_addresses` VALUES (182, 100, '北京市', '市辖区', '东城区', '第81街道第859号', 587200, '苗秀云', '17017031507', NULL, '2019-08-08 09:56:06', '2019-08-08 09:56:06');

-- ----------------------------
-- Table structure for user_favorite_products
-- ----------------------------
DROP TABLE IF EXISTS `user_favorite_products`;
CREATE TABLE `user_favorite_products`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_favorite_products_user_id_foreign`(`user_id`) USING BTREE,
  INDEX `user_favorite_products_product_id_foreign`(`product_id`) USING BTREE,
  CONSTRAINT `user_favorite_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `user_favorite_products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_favorite_products
-- ----------------------------
INSERT INTO `user_favorite_products` VALUES (1, 1, 15, '2019-12-17 08:53:22', '2019-12-17 08:53:22');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp(0) NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 127 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, '秦子安', 'sint_distinctio@example.com', '2019-08-08 09:56:04', '$2a$10$D6b3G/eyn.f/OmLecvTWpuS04.vWwbJQGA327O9txAivH.IshFp7i', 'QQa7ISHqARPTToOXbVqdPgZF1PclIjH0W61NpAO7K3TwVMRqMLwfi9WJkoSX', '2019-08-08 09:56:04', '2019-08-08 09:56:04');
INSERT INTO `users` VALUES (2, '徐桂芳', 'odio_quia@example.com', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'T7l1hK9d5B', '2019-08-08 09:56:04', '2019-08-08 09:56:04');
INSERT INTO `users` VALUES (3, '程致远', 'unde45@example.com', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'bkVw9kdYlh', '2019-08-08 09:56:04', '2019-08-08 09:56:04');
INSERT INTO `users` VALUES (4, '钟致远', 'qid@example.org', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'wTRXtqWlsC', '2019-08-08 09:56:04', '2019-08-08 09:56:04');
INSERT INTO `users` VALUES (5, '夏捷', 'qui.ipsum@example.com', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'PTuGtxMZ0d', '2019-08-08 09:56:04', '2019-08-08 09:56:04');
INSERT INTO `users` VALUES (6, '武雪', 'xfacere@example.com', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'EDCxQbgJxh', '2019-08-08 09:56:04', '2019-08-08 09:56:04');
INSERT INTO `users` VALUES (7, '全玉兰', 'molestiae.vel@example.net', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'x7wFZrQgVN', '2019-08-08 09:56:04', '2019-08-08 09:56:04');
INSERT INTO `users` VALUES (8, '臧颖', 'fugiat_odio@example.com', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Yzbytc9ivF', '2019-08-08 09:56:04', '2019-08-08 09:56:04');
INSERT INTO `users` VALUES (9, '扬君', 'sapiente_debitis@example.com', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '4NcUcksLYY', '2019-08-08 09:56:04', '2019-08-08 09:56:04');
INSERT INTO `users` VALUES (10, '明振国', 'iusto.dignissimos@example.net', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'e3JmHVu9Zm', '2019-08-08 09:56:04', '2019-08-08 09:56:04');
INSERT INTO `users` VALUES (11, '韦欣', 'repellat_expedita@example.net', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'r3djlmjUXW', '2019-08-08 09:56:04', '2019-08-08 09:56:04');
INSERT INTO `users` VALUES (12, '巫晨', 'mut@example.net', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '4bpvg2hn4D', '2019-08-08 09:56:04', '2019-08-08 09:56:04');
INSERT INTO `users` VALUES (13, '蓝丽娟', 'maxime62@example.com', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'FycU707qCa', '2019-08-08 09:56:04', '2019-08-08 09:56:04');
INSERT INTO `users` VALUES (14, '邹梅', 'voluptatibus_animi@example.net', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Ndc7u6bt1j', '2019-08-08 09:56:04', '2019-08-08 09:56:04');
INSERT INTO `users` VALUES (15, '荆子安', 'tvoluptatem@example.com', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '0PWA4msqeT', '2019-08-08 09:56:04', '2019-08-08 09:56:04');
INSERT INTO `users` VALUES (16, '余俊', 'wquo@example.org', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'F9USwSK8QI', '2019-08-08 09:56:04', '2019-08-08 09:56:04');
INSERT INTO `users` VALUES (17, '莫坤', 'rcumque@example.com', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '5DfQZsvYt5', '2019-08-08 09:56:04', '2019-08-08 09:56:04');
INSERT INTO `users` VALUES (18, '简红', 'sunt_sapiente@example.net', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'G7ezQ8zCbt', '2019-08-08 09:56:04', '2019-08-08 09:56:04');
INSERT INTO `users` VALUES (19, '乐秀云', 'repudiandae35@example.org', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'KTBFNRTSbD', '2019-08-08 09:56:04', '2019-08-08 09:56:04');
INSERT INTO `users` VALUES (20, '陶秀云', 'veritatis.autem@example.com', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Dy7sKsFbJG', '2019-08-08 09:56:04', '2019-08-08 09:56:04');
INSERT INTO `users` VALUES (21, '屈国庆', 'excepturi_facere@example.com', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '6ej9XlPQAw', '2019-08-08 09:56:04', '2019-08-08 09:56:04');
INSERT INTO `users` VALUES (22, '苑晨', 'fesse@example.com', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'bgiEYFy782', '2019-08-08 09:56:04', '2019-08-08 09:56:04');
INSERT INTO `users` VALUES (23, '黄红', 'tea@example.com', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'lwKzTXeke5', '2019-08-08 09:56:04', '2019-08-08 09:56:04');
INSERT INTO `users` VALUES (24, '穆鹏', 'qui.consequatur@example.org', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'poLRNtbWKQ', '2019-08-08 09:56:04', '2019-08-08 09:56:04');
INSERT INTO `users` VALUES (25, '樊彬', 'molestiae_et@example.net', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'nASTJyjUN2', '2019-08-08 09:56:04', '2019-08-08 09:56:04');
INSERT INTO `users` VALUES (26, '辛云', 'delectus.tempore@example.org', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'c5Ca160rQf', '2019-08-08 09:56:04', '2019-08-08 09:56:04');
INSERT INTO `users` VALUES (27, '杜玉英', 'omnis17@example.org', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'gU7d0NwDNS', '2019-08-08 09:56:04', '2019-08-08 09:56:04');
INSERT INTO `users` VALUES (28, '尤雪', 'et.officiis@example.net', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'XqgqJhtkpT', '2019-08-08 09:56:04', '2019-08-08 09:56:04');
INSERT INTO `users` VALUES (29, '保娟', 'perspiciatis_in@example.org', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'kaELMXkE4A', '2019-08-08 09:56:04', '2019-08-08 09:56:04');
INSERT INTO `users` VALUES (30, '郎华', 'iste_quod@example.net', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'yFlzNiCxN9', '2019-08-08 09:56:04', '2019-08-08 09:56:04');
INSERT INTO `users` VALUES (31, '翁全安', 'excepturi16@example.com', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '4dKXdk0Vnm', '2019-08-08 09:56:04', '2019-08-08 09:56:04');
INSERT INTO `users` VALUES (32, '薄华', 'odit_id@example.net', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'TPny4Uj2KC', '2019-08-08 09:56:04', '2019-08-08 09:56:04');
INSERT INTO `users` VALUES (33, '易晧', 'atque67@example.org', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'CtuboNu7Cm', '2019-08-08 09:56:04', '2019-08-08 09:56:04');
INSERT INTO `users` VALUES (34, '廉飞', 'commodi_tenetur@example.net', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'CaJOr9V6RU', '2019-08-08 09:56:04', '2019-08-08 09:56:04');
INSERT INTO `users` VALUES (35, '路帆', 'vitae_dolor@example.org', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '3dfn1hqNGl', '2019-08-08 09:56:04', '2019-08-08 09:56:04');
INSERT INTO `users` VALUES (36, '万鹰', 'excepturi_qui@example.org', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'JLnVcDr7QL', '2019-08-08 09:56:04', '2019-08-08 09:56:04');
INSERT INTO `users` VALUES (37, '盛君', 'at.voluptatem@example.com', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'IjEY3vbBZt', '2019-08-08 09:56:04', '2019-08-08 09:56:04');
INSERT INTO `users` VALUES (38, '白兰英', 'eligendi.iure@example.org', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'MPvQ4sCOkF', '2019-08-08 09:56:04', '2019-08-08 09:56:04');
INSERT INTO `users` VALUES (39, '穆志新', 'impedit18@example.net', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'H3iCLmbEA6', '2019-08-08 09:56:04', '2019-08-08 09:56:04');
INSERT INTO `users` VALUES (40, '党玉英', 'leum@example.org', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'S1g42dIkW1', '2019-08-08 09:56:04', '2019-08-08 09:56:04');
INSERT INTO `users` VALUES (41, '娄振国', 'aut09@example.org', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'nFwxnMUmNr', '2019-08-08 09:56:04', '2019-08-08 09:56:04');
INSERT INTO `users` VALUES (42, '房斌', 'nisi17@example.net', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'nP3JkBsWB9', '2019-08-08 09:56:04', '2019-08-08 09:56:04');
INSERT INTO `users` VALUES (43, '高宁', 'zeius@example.org', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'gND8kibrmL', '2019-08-08 09:56:04', '2019-08-08 09:56:04');
INSERT INTO `users` VALUES (44, '时建国', 'ut95@example.org', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'HBBBAMrvwn', '2019-08-08 09:56:04', '2019-08-08 09:56:04');
INSERT INTO `users` VALUES (45, '房松', 'labore.ut@example.org', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'FJOQp7mt5P', '2019-08-08 09:56:04', '2019-08-08 09:56:04');
INSERT INTO `users` VALUES (46, '强璐', 'baspernatur@example.org', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'rJZYkZRXCb', '2019-08-08 09:56:04', '2019-08-08 09:56:04');
INSERT INTO `users` VALUES (47, '岳莹', 'neque_ea@example.org', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'bzsZz0Moud', '2019-08-08 09:56:04', '2019-08-08 09:56:04');
INSERT INTO `users` VALUES (48, '贾娜', 'nvoluptate@example.com', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '6xncEvl4Ob', '2019-08-08 09:56:04', '2019-08-08 09:56:04');
INSERT INTO `users` VALUES (49, '贾玉梅', 'eos.vitae@example.org', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'bftrK6Tdys', '2019-08-08 09:56:04', '2019-08-08 09:56:04');
INSERT INTO `users` VALUES (50, '保玲', 'deleniti36@example.org', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'FomNscWywp', '2019-08-08 09:56:04', '2019-08-08 09:56:04');
INSERT INTO `users` VALUES (51, '晏丹丹', 'corrupti_laudantium@example.com', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '1TDv43xWwT', '2019-08-08 09:56:04', '2019-08-08 09:56:04');
INSERT INTO `users` VALUES (52, '谈红霞', 'genim@example.net', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Y9feuS9Vj2', '2019-08-08 09:56:04', '2019-08-08 09:56:04');
INSERT INTO `users` VALUES (53, '黄智敏', 'mmolestias@example.com', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '3Y6GWQeH0l', '2019-08-08 09:56:04', '2019-08-08 09:56:04');
INSERT INTO `users` VALUES (54, '艾志明', 'aliquam_deleniti@example.com', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'wk7QDwh6pe', '2019-08-08 09:56:04', '2019-08-08 09:56:04');
INSERT INTO `users` VALUES (55, '颜萍', 'nmolestiae@example.com', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '9Yg9oV76Ho', '2019-08-08 09:56:04', '2019-08-08 09:56:04');
INSERT INTO `users` VALUES (56, '屠芬', 'qui.numquam@example.org', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Ymmm10lfSB', '2019-08-08 09:56:04', '2019-08-08 09:56:04');
INSERT INTO `users` VALUES (57, '韩峰', 'aut.omnis@example.org', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'iqeD8Akf9j', '2019-08-08 09:56:04', '2019-08-08 09:56:04');
INSERT INTO `users` VALUES (58, '罗辉', 'ut18@example.org', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '6gCiKQbAeR', '2019-08-08 09:56:04', '2019-08-08 09:56:04');
INSERT INTO `users` VALUES (59, '保博涛', 'mollitia_quidem@example.org', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'YXclUXO9E0', '2019-08-08 09:56:04', '2019-08-08 09:56:04');
INSERT INTO `users` VALUES (60, '嵺冰冰', 'nobis88@example.com', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'jEffNyZfE7', '2019-08-08 09:56:04', '2019-08-08 09:56:04');
INSERT INTO `users` VALUES (61, '季海燕', 'et23@example.com', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'YC4F30ctjO', '2019-08-08 09:56:04', '2019-08-08 09:56:04');
INSERT INTO `users` VALUES (62, '孙杨', 'jin@example.org', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'FBxe4RgavP', '2019-08-08 09:56:04', '2019-08-08 09:56:04');
INSERT INTO `users` VALUES (63, '敖建平', 'perferendis.nostrum@example.net', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'WDrIZSEH0F', '2019-08-08 09:56:04', '2019-08-08 09:56:04');
INSERT INTO `users` VALUES (64, '邱玉梅', 'orerum@example.net', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'YAhkHL042I', '2019-08-08 09:56:04', '2019-08-08 09:56:04');
INSERT INTO `users` VALUES (65, '饶瑜', 'eaque49@example.net', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'j2g93nfTM0', '2019-08-08 09:56:04', '2019-08-08 09:56:04');
INSERT INTO `users` VALUES (66, '盛哲', 'ydolores@example.net', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'BWmAkGOCec', '2019-08-08 09:56:04', '2019-08-08 09:56:04');
INSERT INTO `users` VALUES (67, '詹志明', 'facilis48@example.com', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'S0966E3Xin', '2019-08-08 09:56:04', '2019-08-08 09:56:04');
INSERT INTO `users` VALUES (68, '邓秀华', 'quibusdam.voluptas@example.com', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'hwXtZKxB66', '2019-08-08 09:56:04', '2019-08-08 09:56:04');
INSERT INTO `users` VALUES (69, '颜瑜', 'aspernatur_saepe@example.org', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'nIoaH5dqmO', '2019-08-08 09:56:04', '2019-08-08 09:56:04');
INSERT INTO `users` VALUES (70, '甘磊', 'dolorem65@example.org', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'XAPUM9fkvG', '2019-08-08 09:56:04', '2019-08-08 09:56:04');
INSERT INTO `users` VALUES (71, '应志强', 'mincidunt@example.net', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '0XsKwCCztE', '2019-08-08 09:56:04', '2019-08-08 09:56:04');
INSERT INTO `users` VALUES (72, '隋玉英', 'similique_sunt@example.net', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'YwdmRCOx7r', '2019-08-08 09:56:04', '2019-08-08 09:56:04');
INSERT INTO `users` VALUES (73, '全瑶', 'expedita.dolores@example.com', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ZCceSeGkUT', '2019-08-08 09:56:04', '2019-08-08 09:56:04');
INSERT INTO `users` VALUES (74, '迟芬', 'aspernatur_aut@example.com', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '4YzztFl1It', '2019-08-08 09:56:04', '2019-08-08 09:56:04');
INSERT INTO `users` VALUES (75, '娄超', 'yfuga@example.net', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'hTTgfmL6PG', '2019-08-08 09:56:04', '2019-08-08 09:56:04');
INSERT INTO `users` VALUES (76, '郁欢', 'vero48@example.org', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'nFydoMRFcS', '2019-08-08 09:56:04', '2019-08-08 09:56:04');
INSERT INTO `users` VALUES (77, '谭成', 'fugit.sed@example.org', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'leASHTTs3J', '2019-08-08 09:56:04', '2019-08-08 09:56:04');
INSERT INTO `users` VALUES (78, '商宁', 'qui_et@example.org', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'xGzSNNBZ7a', '2019-08-08 09:56:04', '2019-08-08 09:56:04');
INSERT INTO `users` VALUES (79, '戚明霞', 'ea.nulla@example.com', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '8ztms0d2yq', '2019-08-08 09:56:04', '2019-08-08 09:56:04');
INSERT INTO `users` VALUES (80, '蔡志强', 'est_in@example.org', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'YtgIl46WRS', '2019-08-08 09:56:04', '2019-08-08 09:56:04');
INSERT INTO `users` VALUES (81, '向翼', 'yimpedit@example.org', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'lXlm4o2EsM', '2019-08-08 09:56:04', '2019-08-08 09:56:04');
INSERT INTO `users` VALUES (82, '党兵', 'kitaque@example.net', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'LSYP8Mw480', '2019-08-08 09:56:04', '2019-08-08 09:56:04');
INSERT INTO `users` VALUES (83, '邬兵', 'rerum_sint@example.net', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'wgpCwDHJYm', '2019-08-08 09:56:04', '2019-08-08 09:56:04');
INSERT INTO `users` VALUES (84, '陈瑶', 'nemo44@example.com', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'XHnEWnP3hs', '2019-08-08 09:56:04', '2019-08-08 09:56:04');
INSERT INTO `users` VALUES (85, '党金凤', 'enulla@example.net', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'qRw8tNd1mc', '2019-08-08 09:56:04', '2019-08-08 09:56:04');
INSERT INTO `users` VALUES (86, '易馨予', 'dolor23@example.org', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'tnxgZ8aXIS', '2019-08-08 09:56:04', '2019-08-08 09:56:04');
INSERT INTO `users` VALUES (87, '纪浩', 'ut58@example.org', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Inb8CKeAb7', '2019-08-08 09:56:04', '2019-08-08 09:56:04');
INSERT INTO `users` VALUES (88, '林桂芳', 'litaque@example.com', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'RYAHEjoKRt', '2019-08-08 09:56:04', '2019-08-08 09:56:04');
INSERT INTO `users` VALUES (89, '栗东', 'necessitatibus66@example.com', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'MnwR8fJPcM', '2019-08-08 09:56:04', '2019-08-08 09:56:04');
INSERT INTO `users` VALUES (90, '薛晨', 'ducimus86@example.net', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '93flu02wrO', '2019-08-08 09:56:04', '2019-08-08 09:56:04');
INSERT INTO `users` VALUES (91, '穆阳', 'saepe40@example.org', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'yffYBEUDQx', '2019-08-08 09:56:04', '2019-08-08 09:56:04');
INSERT INTO `users` VALUES (92, '向萍', 'waspernatur@example.net', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Vsfg2cbpT1', '2019-08-08 09:56:04', '2019-08-08 09:56:04');
INSERT INTO `users` VALUES (93, '苑兵', 'ratione.numquam@example.com', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'C0tfUXzqq8', '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `users` VALUES (94, '鲍晶', 'est_tempore@example.com', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'AEdoYbZpFA', '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `users` VALUES (95, '嵺楠', 'accusantium28@example.net', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'y3amw8Nwbw', '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `users` VALUES (96, '简全安', 'ureiciendis@example.com', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'lZ9CKjXLQw', '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `users` VALUES (97, '游智敏', 'quis46@example.com', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '98Bg79THfR', '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `users` VALUES (98, '苟建军', 'corrupti62@example.org', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'vUYXro4OXQ', '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `users` VALUES (99, '来红梅', 'gnostrum@example.com', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'JUX8gpL2x3', '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `users` VALUES (100, '关超', 'imaxime@example.com', '2019-08-08 09:56:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '2rBTp5njRF', '2019-08-08 09:56:05', '2019-08-08 09:56:05');
INSERT INTO `users` VALUES (123, 'jfghfh', 'hfdsg@qq.com', NULL, '$2y$10$cNA9WeJuEduE.2gM0MTEj.SZ5VytUZBt.Jk//DSlG6Rz8lK9HcCSe', NULL, '2019-12-18 07:54:40', '2019-12-18 07:54:40');
INSERT INTO `users` VALUES (124, 'fjdj', 'dfjgfdj@qq.com', NULL, '$2y$10$9hF2WNjf/GZQQlJthbN2q.3tJza46avMCiI7DabVFjB3MwvmjVhri', NULL, '2019-12-18 07:56:44', '2019-12-18 07:56:44');
INSERT INTO `users` VALUES (125, 'gsah', 'fdhhs@qq.com', NULL, '$2y$10$AhPXF0HH9nR58U27Lp03LeTmsX6i5MfxmpAi4pygf/ooSFHRjOL5W', NULL, '2019-12-18 08:01:32', '2019-12-18 08:01:32');
INSERT INTO `users` VALUES (126, 'hgffdj', 'gfjgf@qq.com', NULL, '$2y$10$ufG4YbjMhz.VlN00tQsH6.Kp9twybLhH/qwhp65HVDWUsPaW52ROG', NULL, '2019-12-18 08:01:59', '2019-12-18 08:01:59');

SET FOREIGN_KEY_CHECKS = 1;
