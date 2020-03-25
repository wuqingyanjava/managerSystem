/*
Navicat MySQL Data Transfer

Source Server         : 腾讯云服务器
Source Server Version : 50644
Source Host           : 148.70.237.248:3306
Source Database       : potato

Target Server Type    : MYSQL
Target Server Version : 50644
File Encoding         : 65001

Date: 2020-03-25 17:10:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `menu_name` varchar(32) NOT NULL COMMENT '菜单名称',
  `path` varchar(64) DEFAULT NULL COMMENT '路径',
  `menu_type` smallint(2) NOT NULL COMMENT '类型:0:目录,1:菜单,2:按钮',
  `icon` varchar(32) DEFAULT NULL COMMENT '菜单图标',
  `create_uid` int(11) NOT NULL COMMENT '创建者ID',
  `update_uid` int(11) NOT NULL COMMENT '修改者ID',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `status` smallint(2) NOT NULL COMMENT '状态 0：禁用 1：正常',
  `router` varchar(64) DEFAULT NULL COMMENT '路由',
  `alias` varchar(64) DEFAULT NULL COMMENT '别名',
  `sn_num` int(3) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8 COMMENT='菜单表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '0', '系统管理', '', '1', 'layui-icon-set', '1', '1', '2018-11-27 14:52:10', '2019-06-12 14:08:09', '0', null, '', '1');
INSERT INTO `sys_menu` VALUES ('23', '1', '用户管理', 'views/user/index.html', '2', 'layui-icon-username', '1', '1', '2018-11-27 15:10:32', '2018-12-12 15:39:18', '0', 'user', 'sys:user:list', '0');
INSERT INTO `sys_menu` VALUES ('24', '1', '角色管理', 'views/role/index.html', '2', 'layui-icon-face-surprised', '1', '1', '2018-11-27 15:16:59', '2019-06-27 11:22:28', '0', 'role', 'sys:role:list', '1');
INSERT INTO `sys_menu` VALUES ('25', '1', '菜单管理', 'views/menu/index.html', '2', 'layui-icon-template', '1', '1', '2018-11-27 15:17:59', '2019-06-27 11:22:37', '0', 'menu', 'sys:menu:list', '2');
INSERT INTO `sys_menu` VALUES ('26', '1', 'API资源管理', 'views/resource/index.html', '2', 'layui-icon-read', '1', '1', '2018-11-27 15:18:31', '2019-06-27 11:22:45', '0', 'resource', 'sys:resource:list', '3');
INSERT INTO `sys_menu` VALUES ('27', '26', '刷新资源', '', '3', 'layui-icon-refresh-3', '1', '1', '2018-11-27 15:19:15', '2018-12-12 15:35:14', '0', null, 'sys:resource:refresh', '0');
INSERT INTO `sys_menu` VALUES ('28', '25', '添加', '', '3', 'layui-icon-add-circle-fine', '1', '1', '2018-11-27 15:20:06', '2018-12-12 15:45:47', '0', null, 'sys:menu:add', '0');
INSERT INTO `sys_menu` VALUES ('29', '25', '修改', '', '3', 'layui-icon-senior', '1', '1', '2018-11-27 15:20:27', '2018-12-12 15:36:51', '0', null, 'sys:menu:edit', '0');
INSERT INTO `sys_menu` VALUES ('30', '25', '删除', '', '3', 'layui-icon-close', '1', '1', '2018-11-27 15:21:14', '2018-12-12 15:35:49', '0', null, 'sys:menu:delete', '0');
INSERT INTO `sys_menu` VALUES ('31', '24', '添加', '', '3', 'layui-icon-add-circle-fine', '1', '1', '2018-11-27 15:20:06', '2019-06-19 10:44:24', '0', null, 'sys:role:add', '0');
INSERT INTO `sys_menu` VALUES ('32', '24', '修改', '', '3', 'layui-icon-senior', '1', '1', '2018-11-27 15:20:27', '2018-12-12 15:44:19', '0', null, 'sys:role:edit', '0');
INSERT INTO `sys_menu` VALUES ('33', '24', '删除', '', '3', 'layui-icon-close', '1', '1', '2018-11-27 15:21:14', '2018-12-12 15:36:07', '0', null, 'sys:role:delete', '0');
INSERT INTO `sys_menu` VALUES ('34', '23', '添加', '', '3', 'layui-icon-add-circle-fine', '1', '23', '2018-11-27 15:20:06', '2019-06-04 19:04:10', '0', null, 'sys:user:add', '0');
INSERT INTO `sys_menu` VALUES ('35', '23', '修改', '', '3', 'layui-icon-senior', '1', '1', '2018-11-27 15:20:27', '2018-12-12 15:39:36', '0', null, 'sys:user:edit', '0');
INSERT INTO `sys_menu` VALUES ('36', '23', '重置密码', '', '3', 'layui-icon-fire', '1', '1', '2018-11-27 15:21:14', '2018-12-12 15:38:48', '0', null, 'sys:user:resetpwd', '0');
INSERT INTO `sys_menu` VALUES ('42', '24', '菜单授权', null, '3', 'layui-icon-auz', '1', '1', '2018-12-08 23:58:42', '2018-12-12 15:41:52', '0', null, 'sys:role:perm', '0');
INSERT INTO `sys_menu` VALUES ('49', '26', '添加资源', null, '3', null, '1', '1', '2019-06-19 14:46:58', '2019-06-27 13:57:38', '1', null, 'sys:resource:add', '0');
INSERT INTO `sys_menu` VALUES ('50', '26', '修改', null, '3', null, '1', '1', '2019-06-19 16:09:56', '2019-06-27 13:57:39', '1', null, 'sys:source:edit', '0');
INSERT INTO `sys_menu` VALUES ('51', '26', '删除', null, '3', null, '1', '1', '2019-06-19 16:10:13', '2019-06-27 13:57:40', '1', null, 'sys:source:delete', '0');
INSERT INTO `sys_menu` VALUES ('52', '0', '小程序管理', '', '1', 'layui-icon-login-wechat', '1', '1', '2019-06-19 17:30:30', '2019-06-27 11:31:57', '0', '', '', '2');
INSERT INTO `sys_menu` VALUES ('53', '52', '广告管理', 'views/advert/index.html', '2', null, '1', '1', '2019-06-19 17:35:59', '2019-06-26 09:52:56', '0', 'wxapp', 'wx:advert:list', '0');
INSERT INTO `sys_menu` VALUES ('54', '53', '添加广告', null, '3', null, '1', '1', '2019-06-19 18:25:56', '2019-06-19 18:32:57', '0', null, 'wx:advert:add', '0');
INSERT INTO `sys_menu` VALUES ('55', '52', '文章管理', 'views/article/index.html', '2', null, '1', '1', '2019-06-20 20:46:21', '2019-06-28 09:59:07', '0', 'article', 'wxapp:article:list', '2');
INSERT INTO `sys_menu` VALUES ('56', '0', '资源管理', null, '1', 'layui-icon-404', '1', '1', '2019-06-20 20:52:50', '2019-06-27 14:00:11', '0', null, null, '3');
INSERT INTO `sys_menu` VALUES ('57', '52', '用户管理', null, '2', null, '1', '1', '2019-06-20 20:54:48', '2019-06-27 10:57:14', '0', null, 'wxapp:user:list', '3');
INSERT INTO `sys_menu` VALUES ('58', '56', '音乐管理', 'views/music/index.html', '2', null, '1', '1', '2019-06-26 09:54:59', '2020-01-02 11:21:21', '0', 'music', 'source:music:list', '0');
INSERT INTO `sys_menu` VALUES ('59', '58', '添加', null, '3', null, '1', '1', '2019-06-26 10:05:09', '2019-06-26 10:09:37', '0', null, 'source:music:add', '0');
INSERT INTO `sys_menu` VALUES ('60', '58', '修改', null, '3', null, '1', '1', '2019-06-26 10:11:13', '2019-06-26 10:11:13', '0', null, 'source:music:edit', '0');
INSERT INTO `sys_menu` VALUES ('61', '58', '删除', null, '3', null, '1', '1', '2019-06-26 10:11:54', '2019-06-26 10:12:40', '0', null, 'source:music:delete', '0');
INSERT INTO `sys_menu` VALUES ('62', '53', '修改', null, '3', null, '1', '1', '2019-06-26 15:53:56', '2019-06-26 15:53:56', '0', null, 'wx:advert:edit', '0');
INSERT INTO `sys_menu` VALUES ('63', '53', '删除', null, '3', null, '1', '1', '2019-06-26 15:54:26', '2019-06-26 15:54:26', '0', null, 'wx:advert:delete', '0');
INSERT INTO `sys_menu` VALUES ('65', '0', '首页', '', '1', 'layui-icon-rate-half', '1', '1', '2019-06-27 10:11:26', '2019-06-27 10:20:58', '0', '', null, '0');
INSERT INTO `sys_menu` VALUES ('66', '65', '看板', 'console.html', '2', null, '1', '1', '2019-06-27 10:18:18', '2019-06-27 10:18:18', '0', 'console', 'console', '0');
INSERT INTO `sys_menu` VALUES ('67', '56', '视频管理', 'views/video/index.html', '2', null, '1', '1', '2019-06-27 11:27:31', '2019-06-27 15:46:20', '0', 'video', 'source:video:list', '1');
INSERT INTO `sys_menu` VALUES ('68', '67', '添加', null, '3', null, '1', '1', '2019-06-27 15:47:03', '2019-06-27 15:47:03', '0', null, 'source:video:add', '1');
INSERT INTO `sys_menu` VALUES ('69', '67', '修改', null, '3', null, '1', '1', '2019-06-27 15:47:37', '2019-06-27 15:47:37', '0', null, 'source:video:edit', '2');
INSERT INTO `sys_menu` VALUES ('70', '67', '删除', null, '3', null, '1', '1', '2019-06-27 15:48:07', '2019-06-27 15:48:07', '0', null, 'source:video:delete', '3');
INSERT INTO `sys_menu` VALUES ('71', '65', '贪吃蛇', 'snake.html', '2', null, '1', '1', '2019-06-27 17:21:40', '2019-06-27 17:21:40', '0', 'snake', null, '2');
INSERT INTO `sys_menu` VALUES ('72', '55', '添加', null, '3', null, '1', '1', '2019-06-28 09:54:57', '2019-06-28 09:54:57', '0', null, 'wx:article:add', '1');
INSERT INTO `sys_menu` VALUES ('73', '55', '修改', null, '3', null, '1', '1', '2019-06-28 09:55:35', '2019-06-28 09:56:09', '0', null, 'wx:article:edit', '2');
INSERT INTO `sys_menu` VALUES ('74', '55', '删除', null, '3', null, '1', '1', '2019-06-28 09:56:45', '2019-06-28 09:56:45', '0', null, 'wx:article:delete', '3');
INSERT INTO `sys_menu` VALUES ('75', '65', '扫狗', '/views/scanlei/scanlei.html', '2', null, '1', '1', '2020-01-08 15:54:17', '2020-01-08 15:54:17', '0', 'scanlei', null, '3');

-- ----------------------------
-- Table structure for sys_menu_resource
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu_resource`;
CREATE TABLE `sys_menu_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) DEFAULT NULL COMMENT '菜单ID',
  `resource_id` varchar(32) DEFAULT NULL COMMENT '资源ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=utf8 COMMENT='菜单资源关系表';

-- ----------------------------
-- Records of sys_menu_resource
-- ----------------------------
INSERT INTO `sys_menu_resource` VALUES ('70', '27', 'f45f1b577d72dcd86b84c6f033682b53');
INSERT INTO `sys_menu_resource` VALUES ('72', '30', 'f15f7b01ffe7166b05c3984c9b967837');
INSERT INTO `sys_menu_resource` VALUES ('73', '33', '6692d9d95184977f82d3252de2f5eac7');
INSERT INTO `sys_menu_resource` VALUES ('74', '29', 'a11e2191656cb199bea1defb17758411');
INSERT INTO `sys_menu_resource` VALUES ('75', '29', '6fd51f02b724c137a08c28587f48d7f3');
INSERT INTO `sys_menu_resource` VALUES ('76', '29', '2c654f1264fc85ac80516245672f3c47');
INSERT INTO `sys_menu_resource` VALUES ('77', '29', 'a5529264d2645996c83bba2e961d0ec3');
INSERT INTO `sys_menu_resource` VALUES ('85', '36', '7baa5b852bc92715d7aa503c0a0d8925');
INSERT INTO `sys_menu_resource` VALUES ('87', '23', '579e469e8ac850de1ca0adc54d01acba');
INSERT INTO `sys_menu_resource` VALUES ('88', '23', 'b4770c0fe93fce7e829463328c800f20');
INSERT INTO `sys_menu_resource` VALUES ('89', '35', '30386fd7b8a4feb9c59861e63537acde');
INSERT INTO `sys_menu_resource` VALUES ('90', '35', '8a3b4dc05867f5946235ba5fbc492b76');
INSERT INTO `sys_menu_resource` VALUES ('93', '42', 'a826bca352908155da4ca6702edfa2ed');
INSERT INTO `sys_menu_resource` VALUES ('94', '42', '30218613e987e464b13e0c0b8721aec5');
INSERT INTO `sys_menu_resource` VALUES ('95', '34', 'a71cb59835c613f39bd936deb20cdd27');
INSERT INTO `sys_menu_resource` VALUES ('96', '34', 'd9d6f7163b313b950710a637682354d1');
INSERT INTO `sys_menu_resource` VALUES ('97', '32', 'eaee955f405f6b96beab5136bfa3e29b');
INSERT INTO `sys_menu_resource` VALUES ('98', '32', 'd9d6f7163b313b950710a637682354d1');
INSERT INTO `sys_menu_resource` VALUES ('99', '28', '8cb1442c7814f65ce0d796e1ef93c715');
INSERT INTO `sys_menu_resource` VALUES ('100', '28', 'a5529264d2645996c83bba2e961d0ec3');
INSERT INTO `sys_menu_resource` VALUES ('101', '28', '2c654f1264fc85ac80516245672f3c47');
INSERT INTO `sys_menu_resource` VALUES ('103', '31', 'd82de0a17f2c63106f98eb2f88d166e9');
INSERT INTO `sys_menu_resource` VALUES ('111', '53', '0c7f18138705b67b83773f60295a4ca1');
INSERT INTO `sys_menu_resource` VALUES ('112', '53', '342791ff851a4167af8abdd9e36b861d');
INSERT INTO `sys_menu_resource` VALUES ('113', '53', '6577904643f0253b54070559179829be');
INSERT INTO `sys_menu_resource` VALUES ('114', '53', 'faa8eefdec51055ffd95b817b41fe11a');
INSERT INTO `sys_menu_resource` VALUES ('115', '53', '01f3ff4caca9b1651b738b7225f6371f');
INSERT INTO `sys_menu_resource` VALUES ('122', '59', '7961c441a0bec1dc7bc449920d7d2946');
INSERT INTO `sys_menu_resource` VALUES ('123', '60', '19d52bf39c9023d0fe99c6d3aa80bf05');
INSERT INTO `sys_menu_resource` VALUES ('125', '61', 'bd133fd7ecbe05441f86986d7e24c16d');
INSERT INTO `sys_menu_resource` VALUES ('126', '62', 'cb434c4502a4da8dc6ef803e3a6b7a8a');
INSERT INTO `sys_menu_resource` VALUES ('127', '63', '01f3ff4caca9b1651b738b7225f6371f');
INSERT INTO `sys_menu_resource` VALUES ('130', '24', '04972e9f8e65b0364d9862687666da36');
INSERT INTO `sys_menu_resource` VALUES ('131', '25', '6d1170346960aa8922b9b4d08a5bf71b');
INSERT INTO `sys_menu_resource` VALUES ('132', '25', '30218613e987e464b13e0c0b8721aec5');
INSERT INTO `sys_menu_resource` VALUES ('133', '26', '829a851334028a6e47b59f8dea0cf7cb');
INSERT INTO `sys_menu_resource` VALUES ('134', '67', '5a0b97283a202763af4cfc4c3e3ba652');
INSERT INTO `sys_menu_resource` VALUES ('135', '67', 'e05da313ac6a1e7e0cedadc758163358');
INSERT INTO `sys_menu_resource` VALUES ('136', '67', 'fb8eb1e33ddd79b59cc29f326c65fa29');
INSERT INTO `sys_menu_resource` VALUES ('137', '68', 'e05da313ac6a1e7e0cedadc758163358');
INSERT INTO `sys_menu_resource` VALUES ('138', '69', 'bc25fab36d4004828bf75339fe90a881');
INSERT INTO `sys_menu_resource` VALUES ('139', '69', 'e94de6a4e9da84e2e0c62c3211d9eaa1');
INSERT INTO `sys_menu_resource` VALUES ('140', '70', '167f96bfe1d9d2325ccc3b35fde0363d');
INSERT INTO `sys_menu_resource` VALUES ('143', '72', '0a90a197804d3af7b54cb9e0cd5e3379');
INSERT INTO `sys_menu_resource` VALUES ('145', '73', '59111b730e52b336439b55cd56da620b');
INSERT INTO `sys_menu_resource` VALUES ('146', '73', '988e7b4f7d121469b9414fc4734f731f');
INSERT INTO `sys_menu_resource` VALUES ('147', '74', 'f113609cdbb1016cf9da3115facb03cf');
INSERT INTO `sys_menu_resource` VALUES ('148', '55', '14998ea4e3052fd946de65fd27e2f2b8');
INSERT INTO `sys_menu_resource` VALUES ('149', '55', 'f306d17534a7175ed51a4e66e9361413');
INSERT INTO `sys_menu_resource` VALUES ('150', '58', 'c16967faeaa63e096a51d996290df77c');
INSERT INTO `sys_menu_resource` VALUES ('151', '58', 'c3b8630c9e730c29ba30f3cebaddde39');
INSERT INTO `sys_menu_resource` VALUES ('152', '58', '2f52a3f5e6f2af11174d197da9ade6ab');

-- ----------------------------
-- Table structure for sys_resource
-- ----------------------------
DROP TABLE IF EXISTS `sys_resource`;
CREATE TABLE `sys_resource` (
  `id` varchar(32) NOT NULL,
  `resource_name` varchar(32) NOT NULL COMMENT '资源名称',
  `mapping` varchar(64) NOT NULL COMMENT '路径映射',
  `method` varchar(6) NOT NULL COMMENT '请求方式',
  `auth_type` smallint(2) NOT NULL COMMENT '权限认证类型',
  `update_time` datetime DEFAULT NULL,
  `perm` varchar(68) NOT NULL COMMENT '权限标识',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资源表';

-- ----------------------------
-- Records of sys_resource
-- ----------------------------
INSERT INTO `sys_resource` VALUES ('01e7421934220817e42d4fae6a8a4ce3', '小程序查询所有文章(分页)', '/article/wxAppArticle', 'GET', '2', '2020-03-25 16:51:51', 'GET:/article/wxAppArticle');
INSERT INTO `sys_resource` VALUES ('01f3ff4caca9b1651b738b7225f6371f', '删除广告', '/advert/{id}', 'DELETE', '3', '2020-03-25 16:51:51', 'DELETE:/advert/{id}');
INSERT INTO `sys_resource` VALUES ('04972e9f8e65b0364d9862687666da36', '查询所有角色(分页)', '/roles', 'GET', '3', '2020-03-25 16:51:51', 'GET:/roles');
INSERT INTO `sys_resource` VALUES ('0a90a197804d3af7b54cb9e0cd5e3379', '添加文章', '/article', 'POST', '3', '2020-03-25 16:51:51', 'POST:/article');
INSERT INTO `sys_resource` VALUES ('0c7f18138705b67b83773f60295a4ca1', '添加广告', '/advert', 'POST', '3', '2020-03-25 16:51:51', 'POST:/advert');
INSERT INTO `sys_resource` VALUES ('14998ea4e3052fd946de65fd27e2f2b8', '设置文章状态', '/article/{id}/status', 'PUT', '3', '2020-03-25 16:51:51', 'PUT:/article/{id}/status');
INSERT INTO `sys_resource` VALUES ('14a1c1e610301988e07aa0bcdc6cf508', '查询单个资源', '/resources/{id}', 'GET', '2', '2020-03-25 16:51:51', 'GET:/resources/{id}');
INSERT INTO `sys_resource` VALUES ('167f96bfe1d9d2325ccc3b35fde0363d', '删除视频', '/video/{id}', 'DELETE', '3', '2020-03-25 16:51:51', 'DELETE:/video/{id}');
INSERT INTO `sys_resource` VALUES ('19d52bf39c9023d0fe99c6d3aa80bf05', '修改音乐', '/music/{id}', 'PUT', '3', '2020-03-25 16:51:51', 'PUT:/music/{id}');
INSERT INTO `sys_resource` VALUES ('1e49cd39037ccb69d7d4fe5a556772fe', '设置视频状态', '/video/{id}/status', 'PUT', '3', '2020-03-25 16:51:51', 'PUT:/video/{id}/status');
INSERT INTO `sys_resource` VALUES ('29c4c75326ecf3a82f815c43b0085b2f', '修改账户信息', '/account/info', 'PUT', '1', '2020-03-25 16:51:51', 'PUT:/account/info');
INSERT INTO `sys_resource` VALUES ('2c654f1264fc85ac80516245672f3c47', '查询父级菜单(下拉框)', '/menus/combos', 'GET', '3', '2020-03-25 16:51:51', 'GET:/menus/combos');
INSERT INTO `sys_resource` VALUES ('2f52a3f5e6f2af11174d197da9ade6ab', '查询单个音乐', '/music/{id}', 'GET', '3', '2020-03-25 16:51:51', 'GET:/music/{id}');
INSERT INTO `sys_resource` VALUES ('30218613e987e464b13e0c0b8721aec5', '查询所有菜单', '/menus', 'GET', '3', '2020-03-25 16:51:51', 'GET:/menus');
INSERT INTO `sys_resource` VALUES ('30386fd7b8a4feb9c59861e63537acde', '修改用户', '/users/{id}', 'PUT', '3', '2020-03-25 16:51:51', 'PUT:/users/{id}');
INSERT INTO `sys_resource` VALUES ('342791ff851a4167af8abdd9e36b861d', '添加广告', '/advert', 'POST', '1', '2019-06-19 17:51:30', 'POST:/advert');
INSERT INTO `sys_resource` VALUES ('3ae42391ca3abe20c5cca35f4427cf9c', '获取账户按钮', '/account/buttons/aliases', 'GET', '1', '2020-03-25 16:51:51', 'GET:/account/buttons/aliases');
INSERT INTO `sys_resource` VALUES ('3f0c8ecb9431dcd547dae8428c1ab13d', '修改资源', '/resources/{id}', 'PUT', '2', '2020-03-25 16:51:51', 'PUT:/resources/{id}');
INSERT INTO `sys_resource` VALUES ('3f92d2fbc7334b803ec1513ebcfcb812', '上传音乐封面图片', '/music/uploadImg', 'POST', '2', '2020-03-25 16:51:51', 'POST:/music/uploadImg');
INSERT INTO `sys_resource` VALUES ('579e469e8ac850de1ca0adc54d01acba', '查询所有用户', '/users', 'GET', '3', '2020-03-25 16:51:51', 'GET:/users');
INSERT INTO `sys_resource` VALUES ('59111b730e52b336439b55cd56da620b', '修改文章', '/article/{id}', 'PUT', '3', '2020-03-25 16:51:51', 'PUT:/article/{id}');
INSERT INTO `sys_resource` VALUES ('5a0b97283a202763af4cfc4c3e3ba652', '查询所有视频(分页)', '/video', 'GET', '3', '2020-03-25 16:51:51', 'GET:/video');
INSERT INTO `sys_resource` VALUES ('61a337c7c1b57c98717737ec871bc284', '上传音频', '/music/upload', 'POST', '2', '2020-03-25 16:51:51', 'POST:/music/upload');
INSERT INTO `sys_resource` VALUES ('6577904643f0253b54070559179829be', '查询单个广告', '/advert/{id}', 'GET', '3', '2020-03-25 16:51:51', 'GET:/advert/{id}');
INSERT INTO `sys_resource` VALUES ('6692d9d95184977f82d3252de2f5eac7', '删除角色', '/roles/{id}', 'DELETE', '3', '2020-03-25 16:51:51', 'DELETE:/roles/{id}');
INSERT INTO `sys_resource` VALUES ('67190dc75f02a44c99fbce5d5224ea17', '小程序查询所有视频(分页)', '/video/wxAppVideo', 'GET', '2', '2020-03-25 16:51:51', 'GET:/video/wxAppVideo');
INSERT INTO `sys_resource` VALUES ('6ab0f8a49671e489f11a1bef2fcaf102', '清除Token', '/account/token', 'DELETE', '1', '2020-03-25 16:51:51', 'DELETE:/account/token');
INSERT INTO `sys_resource` VALUES ('6d1170346960aa8922b9b4d08a5bf71b', '设置菜单状态', '/menus/{id}/status', 'PUT', '3', '2020-03-25 16:51:51', 'PUT:/menus/{id}/status');
INSERT INTO `sys_resource` VALUES ('6fd51f02b724c137a08c28587f48d7f3', '查询单个菜单', '/menus/{id}', 'GET', '3', '2020-03-25 16:51:51', 'GET:/menus/{id}');
INSERT INTO `sys_resource` VALUES ('740b8b20a13e3833286a25151c12966e', '添加资源', '/resources/create', 'POST', '2', '2020-03-25 16:51:51', 'POST:/resources/create');
INSERT INTO `sys_resource` VALUES ('7961c441a0bec1dc7bc449920d7d2946', '添加音乐', '/music', 'POST', '3', '2020-03-25 16:51:51', 'POST:/music');
INSERT INTO `sys_resource` VALUES ('7baa5b852bc92715d7aa503c0a0d8925', '重置用户密码', '/users/{id}/password', 'PUT', '3', '2020-03-25 16:51:51', 'PUT:/users/{id}/password');
INSERT INTO `sys_resource` VALUES ('829a851334028a6e47b59f8dea0cf7cb', '查询所有资源(分页)', '/resources', 'GET', '3', '2020-03-25 16:51:51', 'GET:/resources');
INSERT INTO `sys_resource` VALUES ('839ba732cd105a891226b2af1349d1aa', '小程序查询所有音乐(分页)', '/music/wxAppmusic', 'GET', '2', '2020-03-25 16:51:51', 'GET:/music/wxAppmusic');
INSERT INTO `sys_resource` VALUES ('8423cdb39460750de4d5585328550cc3', '查询所有文章', '/article/articles', 'GET', '3', '2020-03-25 16:51:51', 'GET:/article/articles');
INSERT INTO `sys_resource` VALUES ('842e33410b5a97b6c797e4782c97a90e', '获取Token', '/account/token', 'POST', '2', '2020-03-25 16:51:51', 'POST:/account/token');
INSERT INTO `sys_resource` VALUES ('8a3b4dc05867f5946235ba5fbc492b76', '查询单个用户', '/users/{id}', 'GET', '3', '2020-03-25 16:51:51', 'GET:/users/{id}');
INSERT INTO `sys_resource` VALUES ('8cb1442c7814f65ce0d796e1ef93c715', '添加菜单', '/menus', 'POST', '3', '2020-03-25 16:51:51', 'POST:/menus');
INSERT INTO `sys_resource` VALUES ('982803fc834e82cbb2ac1b93f2a47690', '查询单个角色', '/roles/{id}', 'GET', '3', '2020-03-25 16:51:51', 'GET:/roles/{id}');
INSERT INTO `sys_resource` VALUES ('988e7b4f7d121469b9414fc4734f731f', '查询单个文章', '/article/{id}', 'GET', '3', '2020-03-25 16:51:51', 'GET:/article/{id}');
INSERT INTO `sys_resource` VALUES ('a11e2191656cb199bea1defb17758411', '修改菜单', '/menus/{id}', 'PUT', '3', '2020-03-25 16:51:51', 'PUT:/menus/{id}');
INSERT INTO `sys_resource` VALUES ('a3dfc0a8a2a202e0ee029a733c1e7e16', '查询背景音乐', '/music/background', 'GET', '2', '2020-03-25 16:51:51', 'GET:/music/background');
INSERT INTO `sys_resource` VALUES ('a5529264d2645996c83bba2e961d0ec3', '查询所有资源', '/resources/resources', 'GET', '3', '2020-03-25 16:51:51', 'GET:/resources/resources');
INSERT INTO `sys_resource` VALUES ('a71cb59835c613f39bd936deb20cdd27', '创建用户', '/users', 'POST', '3', '2020-03-25 16:51:51', 'POST:/users');
INSERT INTO `sys_resource` VALUES ('a80ac63337c8c6c86c2e7917a138863e', '上传歌词', '/music/uploadLrc', 'POST', '2', '2020-03-25 16:51:51', 'POST:/music/uploadLrc');
INSERT INTO `sys_resource` VALUES ('a826bca352908155da4ca6702edfa2ed', '修改角色菜单', '/roles/{id}/menus', 'PUT', '3', '2020-03-25 16:51:51', 'PUT:/roles/{id}/menus');
INSERT INTO `sys_resource` VALUES ('aa2ad32bf65347564e57a383ee1cd15b', '设置广告状态', '/advert/{id}/status', 'PUT', '3', '2020-03-25 16:51:51', 'PUT:/advert/{id}/status');
INSERT INTO `sys_resource` VALUES ('abc748a558055052262454cc3bb4e38c', '上传图片', '/advert/uploadFtp', 'POST', '2', '2020-03-25 16:51:51', 'POST:/advert/uploadFtp');
INSERT INTO `sys_resource` VALUES ('b4770c0fe93fce7e829463328c800f20', '设置用户状态', '/users/{id}/status', 'PUT', '3', '2020-03-25 16:51:51', 'PUT:/users/{id}/status');
INSERT INTO `sys_resource` VALUES ('bc25fab36d4004828bf75339fe90a881', '修改视频', '/video/{id}', 'PUT', '3', '2020-03-25 16:51:51', 'PUT:/video/{id}');
INSERT INTO `sys_resource` VALUES ('bd133fd7ecbe05441f86986d7e24c16d', '删除音乐', '/music/{id}', 'DELETE', '3', '2020-03-25 16:51:51', 'DELETE:/music/{id}');
INSERT INTO `sys_resource` VALUES ('c16967faeaa63e096a51d996290df77c', '查询所有音乐(分页)', '/music', 'GET', '3', '2020-03-25 16:51:51', 'GET:/music');
INSERT INTO `sys_resource` VALUES ('c2db9729dcd4a7d703e45411bb445dfd', '修改密码', '/account/password', 'PUT', '1', '2020-03-25 16:51:51', 'PUT:/account/password');
INSERT INTO `sys_resource` VALUES ('c3b8630c9e730c29ba30f3cebaddde39', '设置音乐状态', '/music/{id}/status', 'PUT', '3', '2020-03-25 16:51:51', 'PUT:/music/{id}/status');
INSERT INTO `sys_resource` VALUES ('c92c23866f4a14dca8506d93a2fe5877', '上传图片', '/advert/upload', 'POST', '2', '2020-03-25 16:51:51', 'POST:/advert/upload');
INSERT INTO `sys_resource` VALUES ('cb434c4502a4da8dc6ef803e3a6b7a8a', '修改广告', '/advert/{id}', 'PUT', '3', '2020-03-25 16:51:51', 'PUT:/advert/{id}');
INSERT INTO `sys_resource` VALUES ('d329e999a56d4d6e71c7de1de474459c', '删除资源', '/resources/{id}', 'DELETE', '2', '2020-03-25 16:51:51', 'DELETE:/resources/{id}');
INSERT INTO `sys_resource` VALUES ('d81bffa6ffd70cc443703820b5a95e8d', '获取账户菜单', '/account/menus', 'GET', '1', '2020-03-25 16:51:51', 'GET:/account/menus');
INSERT INTO `sys_resource` VALUES ('d82de0a17f2c63106f98eb2f88d166e9', '添加角色', '/roles', 'POST', '3', '2020-03-25 16:51:51', 'POST:/roles');
INSERT INTO `sys_resource` VALUES ('d9d6f7163b313b950710a637682354d1', '查询所有角色', '/roles/roles', 'GET', '3', '2020-03-25 16:51:51', 'GET:/roles/roles');
INSERT INTO `sys_resource` VALUES ('da3205d35f0297745168013c0a32ba5e', '查询所有音乐', '/music/musics', 'GET', '3', '2020-03-25 16:51:51', 'GET:/music/musics');
INSERT INTO `sys_resource` VALUES ('e05da313ac6a1e7e0cedadc758163358', '添加视频', '/video', 'POST', '3', '2020-03-25 16:51:51', 'POST:/video');
INSERT INTO `sys_resource` VALUES ('e32deab6d556ac95202d78f07a74c244', '查询所有广告', '/advert/adverts', 'GET', '2', '2020-03-25 16:51:51', 'GET:/advert/adverts');
INSERT INTO `sys_resource` VALUES ('e78940daf86b9ac5563d539e8802429c', '获取账户详情', '/account/info', 'GET', '1', '2020-03-25 16:51:51', 'GET:/account/info');
INSERT INTO `sys_resource` VALUES ('e94de6a4e9da84e2e0c62c3211d9eaa1', '查询单个视频', '/video/{id}', 'GET', '3', '2020-03-25 16:51:51', 'GET:/video/{id}');
INSERT INTO `sys_resource` VALUES ('eaee955f405f6b96beab5136bfa3e29b', '修改角色', '/roles/{id}', 'PUT', '3', '2020-03-25 16:51:51', 'PUT:/roles/{id}');
INSERT INTO `sys_resource` VALUES ('f113609cdbb1016cf9da3115facb03cf', '删除文章', '/article/{id}', 'DELETE', '3', '2020-03-25 16:51:51', 'DELETE:/article/{id}');
INSERT INTO `sys_resource` VALUES ('f15f7b01ffe7166b05c3984c9b967837', '删除菜单', '/menus/{id}', 'DELETE', '3', '2020-03-25 16:51:51', 'DELETE:/menus/{id}');
INSERT INTO `sys_resource` VALUES ('f306d17534a7175ed51a4e66e9361413', '查询所有文章(分页)', '/article', 'GET', '3', '2020-03-25 16:51:51', 'GET:/article');
INSERT INTO `sys_resource` VALUES ('f45f1b577d72dcd86b84c6f033682b53', '刷新资源', '/resources', 'PUT', '3', '2020-03-25 16:51:51', 'PUT:/resources');
INSERT INTO `sys_resource` VALUES ('f98df9f072f58e6ac742b0290afb4da5', '上传图片', '/article/upload', 'POST', '2', '2020-03-25 16:51:51', 'POST:/article/upload');
INSERT INTO `sys_resource` VALUES ('faa8eefdec51055ffd95b817b41fe11a', '查询所有音乐(分页)', '/advert', 'GET', '3', '2020-03-25 16:51:51', 'GET:/advert');
INSERT INTO `sys_resource` VALUES ('fb8eb1e33ddd79b59cc29f326c65fa29', '查询所有视频', '/video/videos', 'GET', '3', '2020-03-25 16:51:51', 'GET:/video/videos');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '角色名称',
  `create_uid` int(11) NOT NULL COMMENT '创建者ID',
  `update_uid` int(11) NOT NULL COMMENT '修改者ID',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `remark` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '超级管理员', '1', '1', '2018-11-12 15:59:43', '2018-11-12 15:59:47', '超级管理员');
INSERT INTO `sys_role` VALUES ('2', '普通管理员', '1', '1', '2018-11-12 16:00:17', '2018-11-12 16:00:19', '普通管理员');
INSERT INTO `sys_role` VALUES ('3', '小程序管理员', '24', '24', '2019-06-20 21:07:54', '2019-06-20 21:07:54', '管理小程序');
INSERT INTO `sys_role` VALUES ('4', '游客浏览', '1', '1', '2019-06-21 15:34:41', '2019-06-27 14:01:51', '游客浏览用');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `menu_id` int(11) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=859 DEFAULT CHARSET=utf8 COMMENT='角色菜单关系表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('391', '2', '1');
INSERT INTO `sys_role_menu` VALUES ('392', '2', '26');
INSERT INTO `sys_role_menu` VALUES ('393', '2', '27');
INSERT INTO `sys_role_menu` VALUES ('394', '2', '52');
INSERT INTO `sys_role_menu` VALUES ('395', '2', '53');
INSERT INTO `sys_role_menu` VALUES ('466', '3', '52');
INSERT INTO `sys_role_menu` VALUES ('467', '3', '53');
INSERT INTO `sys_role_menu` VALUES ('468', '3', '54');
INSERT INTO `sys_role_menu` VALUES ('469', '3', '55');
INSERT INTO `sys_role_menu` VALUES ('470', '3', '57');
INSERT INTO `sys_role_menu` VALUES ('471', '4', '1');
INSERT INTO `sys_role_menu` VALUES ('472', '4', '23');
INSERT INTO `sys_role_menu` VALUES ('473', '4', '34');
INSERT INTO `sys_role_menu` VALUES ('474', '4', '24');
INSERT INTO `sys_role_menu` VALUES ('475', '4', '31');
INSERT INTO `sys_role_menu` VALUES ('476', '4', '25');
INSERT INTO `sys_role_menu` VALUES ('477', '4', '28');
INSERT INTO `sys_role_menu` VALUES ('478', '4', '26');
INSERT INTO `sys_role_menu` VALUES ('479', '4', '27');
INSERT INTO `sys_role_menu` VALUES ('480', '4', '52');
INSERT INTO `sys_role_menu` VALUES ('481', '4', '53');
INSERT INTO `sys_role_menu` VALUES ('482', '4', '54');
INSERT INTO `sys_role_menu` VALUES ('483', '4', '55');
INSERT INTO `sys_role_menu` VALUES ('484', '4', '57');
INSERT INTO `sys_role_menu` VALUES ('485', '4', '56');
INSERT INTO `sys_role_menu` VALUES ('817', '1', '1');
INSERT INTO `sys_role_menu` VALUES ('818', '1', '23');
INSERT INTO `sys_role_menu` VALUES ('819', '1', '34');
INSERT INTO `sys_role_menu` VALUES ('820', '1', '35');
INSERT INTO `sys_role_menu` VALUES ('821', '1', '36');
INSERT INTO `sys_role_menu` VALUES ('822', '1', '24');
INSERT INTO `sys_role_menu` VALUES ('823', '1', '31');
INSERT INTO `sys_role_menu` VALUES ('824', '1', '32');
INSERT INTO `sys_role_menu` VALUES ('825', '1', '33');
INSERT INTO `sys_role_menu` VALUES ('826', '1', '42');
INSERT INTO `sys_role_menu` VALUES ('827', '1', '25');
INSERT INTO `sys_role_menu` VALUES ('828', '1', '28');
INSERT INTO `sys_role_menu` VALUES ('829', '1', '29');
INSERT INTO `sys_role_menu` VALUES ('830', '1', '30');
INSERT INTO `sys_role_menu` VALUES ('831', '1', '26');
INSERT INTO `sys_role_menu` VALUES ('832', '1', '27');
INSERT INTO `sys_role_menu` VALUES ('833', '1', '49');
INSERT INTO `sys_role_menu` VALUES ('834', '1', '50');
INSERT INTO `sys_role_menu` VALUES ('835', '1', '51');
INSERT INTO `sys_role_menu` VALUES ('836', '1', '52');
INSERT INTO `sys_role_menu` VALUES ('837', '1', '53');
INSERT INTO `sys_role_menu` VALUES ('838', '1', '54');
INSERT INTO `sys_role_menu` VALUES ('839', '1', '62');
INSERT INTO `sys_role_menu` VALUES ('840', '1', '63');
INSERT INTO `sys_role_menu` VALUES ('841', '1', '55');
INSERT INTO `sys_role_menu` VALUES ('842', '1', '72');
INSERT INTO `sys_role_menu` VALUES ('843', '1', '73');
INSERT INTO `sys_role_menu` VALUES ('844', '1', '74');
INSERT INTO `sys_role_menu` VALUES ('845', '1', '57');
INSERT INTO `sys_role_menu` VALUES ('846', '1', '56');
INSERT INTO `sys_role_menu` VALUES ('847', '1', '58');
INSERT INTO `sys_role_menu` VALUES ('848', '1', '59');
INSERT INTO `sys_role_menu` VALUES ('849', '1', '60');
INSERT INTO `sys_role_menu` VALUES ('850', '1', '61');
INSERT INTO `sys_role_menu` VALUES ('851', '1', '67');
INSERT INTO `sys_role_menu` VALUES ('852', '1', '68');
INSERT INTO `sys_role_menu` VALUES ('853', '1', '69');
INSERT INTO `sys_role_menu` VALUES ('854', '1', '70');
INSERT INTO `sys_role_menu` VALUES ('855', '1', '65');
INSERT INTO `sys_role_menu` VALUES ('856', '1', '66');
INSERT INTO `sys_role_menu` VALUES ('857', '1', '71');
INSERT INTO `sys_role_menu` VALUES ('858', '1', '75');

-- ----------------------------
-- Table structure for sys_role_resource
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_resource`;
CREATE TABLE `sys_role_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `resource_id` varchar(32) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色资源关系表';

-- ----------------------------
-- Records of sys_role_resource
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(50) NOT NULL COMMENT '用户名',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(11) DEFAULT NULL COMMENT '手机',
  `status` smallint(2) NOT NULL COMMENT '状态 0：禁用 1：正常',
  `create_uid` int(11) NOT NULL COMMENT '创建者ID',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `login_name` varchar(16) NOT NULL COMMENT '登陆名',
  `password` varchar(64) NOT NULL COMMENT '密码',
  `ip` varchar(32) DEFAULT NULL COMMENT 'IP地址',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='系统用户表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'Crown', 'caratacus@qq.com', '13712345678', '0', '1', '2018-11-05 17:19:05', '2020-03-25 17:04:55', 'crown', '$apr1$crown$WQ2TEXVPUJ8l6N6gm0CGv.', '117.155.50.234');
INSERT INTO `sys_user` VALUES ('24', '土豆叔叔', '1406188535@qq.com', '18871469960', '0', '1', '2019-06-20 21:02:27', '2019-06-21 17:11:15', 'wuqingyan', '$apr1$wuqingya$AS4hH0QRmY8ftaULLozgA/', '113.57.174.18');
INSERT INTO `sys_user` VALUES ('25', '小可爱', '1406188535@qq.com', '18871469960', '0', '24', '2019-06-20 21:05:06', '2019-06-20 21:05:09', 'xiaokeai', '$apr1$xiaokeai$gI8sqsWbtYFT8G9jQCD/z.', null);
INSERT INTO `sys_user` VALUES ('26', 'visitor', '14061835@qq.com', '13872199875', '0', '1', '2019-06-21 16:54:41', '2019-06-21 17:10:49', 'visitor', '$apr1$visitor$BFQFrdPAgYoTaEM/wWwdh1', '113.57.174.18');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL COMMENT '用户ID',
  `role_id` int(11) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8 COMMENT='系统用户角色关系表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('24', '18', '2');
INSERT INTO `sys_user_role` VALUES ('50', '19', '2');
INSERT INTO `sys_user_role` VALUES ('54', '23', '1');
INSERT INTO `sys_user_role` VALUES ('55', '24', '1');
INSERT INTO `sys_user_role` VALUES ('56', '25', '1');
INSERT INTO `sys_user_role` VALUES ('58', '1', '1');
INSERT INTO `sys_user_role` VALUES ('59', '26', '4');

-- ----------------------------
-- Table structure for t_advert
-- ----------------------------
DROP TABLE IF EXISTS `t_advert`;
CREATE TABLE `t_advert` (
  `id` varchar(32) NOT NULL COMMENT '广告id',
  `advert_name` varchar(32) NOT NULL COMMENT '广告名称',
  `status` smallint(2) NOT NULL DEFAULT '1' COMMENT '状态 0：禁用 1：正常',
  `pic_url` varchar(200) DEFAULT NULL COMMENT '图片地址',
  `link_url` varchar(100) DEFAULT NULL COMMENT '广告链接',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `create_uid` int(11) NOT NULL COMMENT '创建人id',
  `update_uid` int(11) NOT NULL COMMENT '更新人id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_advert
-- ----------------------------
INSERT INTO `t_advert` VALUES ('087e8c46746fe046a68b39769c078efd', '露娜呀', '0', 'http://148.70.237.248:8888/upload/advertImg/1577958728461.jpg', null, '2019-06-27 09:12:41', '2020-01-02 17:52:16', '1', '1');
INSERT INTO `t_advert` VALUES ('e6aa3066355de00ab809c29eda307dfc', '一家人', '0', 'http://148.70.237.248:80/upload/advertImg/1577958969193.png', 'http://www.baidu.com', '2019-06-26 15:12:35', '2020-01-02 17:56:11', '1', '1');

-- ----------------------------
-- Table structure for t_article
-- ----------------------------
DROP TABLE IF EXISTS `t_article`;
CREATE TABLE `t_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_name` varchar(32) NOT NULL COMMENT '文章标题',
  `author` varchar(32) NOT NULL COMMENT '作者',
  `status` smallint(2) NOT NULL DEFAULT '1' COMMENT '状态 0：禁用 1：正常',
  `content` varchar(2000) DEFAULT NULL COMMENT '文章内容',
  `type` smallint(2) NOT NULL DEFAULT '1' COMMENT '文章类型 0：资讯 1：公告',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `create_uid` int(11) NOT NULL COMMENT '创建人id',
  `update_uid` int(11) NOT NULL COMMENT '更新人id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_article
-- ----------------------------
INSERT INTO `t_article` VALUES ('18', '致小可爱的一封信', 'Crown', '0', '<p style=\"text-align: center;\"><b>致小可爱的一封信</b></p><p style=\"text-align: center;\">小可爱你可真棒，玩王者好厉害</p><p style=\"text-align: center;\">加油，我在黄金等你<img src=\"http://localhost:8088/assets/libs/layui/images/face/63.gif\" alt=\"[给力]\"></p><p style=\"text-align: center;\"><img src=\"http://148.70.237.248:8888/assets/upload/1561711604164.png\" alt=\"undefined\"><br></p>', '1', '2019-06-28 10:42:54', '2019-06-28 16:46:46', '1', '1');
INSERT INTO `t_article` VALUES ('20', '说尺子', 'Crown', '0', '<div><p style=\"text-align: center; \"><b>&nbsp;说尺子&nbsp; &nbsp;</b></p><p>&nbsp; &nbsp; &nbsp; 从100分到98分，挨一顿揍；从55分到61分，得一个吻。这看似荒诞不经的故事，却常常发生在我们身边，许多人看来，前者退步了挨揍是天经地义，后者进步了得吻是理所当然。</p><p>&nbsp; &nbsp; &nbsp; 我们常说，要一把尺子量到底。在现实生活中，应当说尺子是最公平的，但拿在不同人的手里，去度量不同的人，就会出现不同的结果。我们习惯了妈妈在厨房中的忙碌，一日三餐总是准时吃到可口的饭菜，可当有一天，我们回家面对着干锅冷灶的时候，却首先想到的是无饭可吃，沮丧之余，面露愠色，甚至开口责备，完全忽略了她累了病了，撑不住了，连烧口开水的力气也没有了；而我们的爸爸偶尔下一次厨房，煮一碗面，却能让一家人感到万分知足。惯性，使我们的尺子变得富有弹性，却无法丈量出爱的深远。<br></p><p>&nbsp; &nbsp; &nbsp; 每个单位都良莠不齐，有干的有看的，也有捣乱的，总有一些秃子混在和尚之中滥竽充数。奇怪的是干的永远在干，看的一直在看，而干得越多失误也越多，得到的批评也越多，而那些看客，偶尔偷机取巧做做样子，就会名利双收。甚至那些捣乱的，变得乖巧一些，就会让领导和一席众人皆大欢喜，心满意足。惰性，使我们的尺子带了偏见，就再也无法凝聚众人的力量。<br></p><p>&nbsp; &nbsp; &nbsp; 大家还记得北方小城那位舍粥的大嫂吗？每到冬天她就半夜起来，熬上满满的三锅热粥，免费送给寒风中瑟缩的清洁工、穷苦人和乞丐，数年如一日，不曾间断。而当有一天，一位老汉从中吃出了一粒沙子，顿时将一碗热粥泼在大嫂的身上，而领粥的人，也瞬间划分为两大阵营：有人说老汉不该撒野，也有人指责大嫂不该掺沙子。薄情，让我们的尺子扭曲，冷了多少善良的心。 </p><p>&nbsp; &nbsp; 开县一辆满载了19名乘客的中巴，突遇险情，一头栽进深达五米的水塘。当地村民金有树跳进冰冷刺骨的水中，砸开车窗将19名乘客全部救出，自己却因长时间冷水的浸泡患上肺病，举债治疗数月，告借无门，不得不离开医院，病死家中。19名幸存者无一人去医院探视，更无人为他送行。金有树临死前写下一封信，第一句话就是：“我救了19人的命，现在谁来救我的命。”冷漠，让我们的尺子訇然寸断，留下无尽的遗憾。<br></p><p>&nbsp; &nbsp; &nbsp;每个人心里都有一把尺子。我们用它来衡量别人，更要时常度量自己。这个世界，应当有这样一把尺子，于情充满温暖，于理凸显公平，于法彰显正义，时时刻刻闪耀着人性的光辉。只要坚持从我做起，从一点一滴做起，苛责自我，宽厚待人，星星之火，势必燎原，人间终会洒满阳光，洒满爱</p></div>', '0', '2019-06-28 16:51:44', '2019-06-28 16:51:44', '1', '1');

-- ----------------------------
-- Table structure for t_music
-- ----------------------------
DROP TABLE IF EXISTS `t_music`;
CREATE TABLE `t_music` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `music_name` varchar(32) NOT NULL COMMENT '音乐名称',
  `status` smallint(2) NOT NULL DEFAULT '1' COMMENT '状态 0：禁用 1：正常',
  `pic_url` varchar(200) DEFAULT NULL COMMENT '图片地址',
  `music_url` varchar(1000) DEFAULT NULL COMMENT '音乐地址',
  `author` varchar(100) DEFAULT NULL COMMENT '音乐作者',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `create_uid` int(11) NOT NULL COMMENT '创建人id',
  `update_uid` int(11) NOT NULL COMMENT '更新人id',
  `lrc` varchar(200) DEFAULT NULL COMMENT '歌词url',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_music
-- ----------------------------
INSERT INTO `t_music` VALUES ('1', '给你宇宙', '0', 'http://148.70.237.248:8888/upload/musicImg/1578274293281.png', 'http://148.70.237.248:8888/upload/1578274283241.mp3', '脸红的思春期', '2020-01-06 09:31:35', '2020-01-06 09:35:18', '1', '1', 'http://148.70.237.248:8888/upload/lrc/1578274516637.lrc');
INSERT INTO `t_music` VALUES ('2', 'MY BOO', '0', 'http://148.70.237.248:8888/upload/musicImg/1578125693223.png', 'http://148.70.237.248:8888/upload/1578125678812.mp3', '刘聪KEY.L,$CC731', '2020-01-06 09:14:18', '2020-01-06 09:14:18', '1', '1', 'http://148.70.237.248:8888/upload/lrc/1578125688053.lrc');
INSERT INTO `t_music` VALUES ('3', '将故事写成我们', '0', 'http://148.70.237.248:8888/upload/musicImg/1578127311875.png', 'http://148.70.237.248:8888/upload/jgs.mp3', '林俊杰', '2019-12-31 20:52:48', '2020-01-06 09:22:07', '1', '1', 'http://148.70.237.248:8888/upload/lrc/1578127315657.lrc');
INSERT INTO `t_music` VALUES ('4', '没钥匙的锁', '0', 'http://148.70.237.248:8888/upload/musicImg/1578628182262.png', 'http://148.70.237.248:8888/upload/1578628174113.mp3', '刘聪KEY.L,$CC731', '2020-01-10 11:54:29', '2020-01-10 11:54:29', '1', '1', 'http://148.70.237.248:8888/upload/lrc/1578628319173.txt');
INSERT INTO `t_music` VALUES ('26', '好想爱这个世界啊', '0', 'http://148.70.237.248:8888/upload/musicImg/1585127323160.png', 'http://148.70.237.248:8888/upload/loveworld.mp3', '华晨宇', '2019-12-31 16:55:40', '2020-03-25 17:09:17', '1', '1', 'http://148.70.237.248:8888/upload/lrc/lovelrc.lrc');
INSERT INTO `t_music` VALUES ('27', '我是如此相信', '0', 'http://y.gtimg.cn/music/photo_new/T002R300x300M000001hGx1Z0so1YX.jpg', 'http://148.70.237.248:8888/upload/jaybeilve.mp3', '周杰伦', '2019-12-31 20:32:57', '2020-01-02 16:15:28', '1', '1', 'http://148.70.237.248:8888/upload/lrc/xiangxin.lrc');
INSERT INTO `t_music` VALUES ('28', '华生', '0', 'http://148.70.237.248:8888/upload/musicImg/1577957066767.jpg', 'http://148.70.237.248:8888/upload/hs.mp3', '陈绮贞', '2019-12-31 20:35:57', '2020-01-02 17:24:28', '1', '1', 'http://148.70.237.248:8888/upload/lrc/1577957061761.lrc');
INSERT INTO `t_music` VALUES ('29', '爱如潮水live', '0', 'http://p2.music.126.net/ouTRvQM_RwU5uBtuWrXO7A==/112150186034075.jpg?param=300x300', 'http://148.70.237.248:8888/upload/arcs.mp3', '张学友', '2019-12-31 20:36:23', '2020-01-02 17:10:14', '1', '1', 'http://148.70.237.248:8888/upload/lrc/1577955951567.lrc');
INSERT INTO `t_music` VALUES ('30', '像风一样', '0', 'http://148.70.237.248:8888/upload/musicImg/1578127560912.png', 'http://148.70.237.248:8888/upload/xfyy.mp3', 'Seiwen', '2019-12-31 20:37:12', '2020-01-06 09:23:05', '1', '1', 'http://148.70.237.248:8888/upload/lrc/1578127498146.lrc');
INSERT INTO `t_music` VALUES ('31', '半岛铁盒', '0', 'http://148.70.237.248:8888/upload/musicImg/1578127061028.png', 'http://148.70.237.248:8888/upload/bdth.mp3', '刘瑞琦', '2019-12-31 20:38:16', '2020-01-06 09:19:42', '1', '1', 'http://148.70.237.248:8888/upload/lrc/1578127051474.lrc');
INSERT INTO `t_music` VALUES ('32', '说好不哭', '0', 'http://148.70.237.248:8888/upload/musicImg/1578126726961.png', 'http://148.70.237.248:8888/upload/bk.mp3', '周杰伦', '2019-12-31 20:39:33', '2020-01-06 09:18:55', '1', '1', 'http://148.70.237.248:8888/upload/lrc/1578126884134.lrc');
INSERT INTO `t_music` VALUES ('33', '水星记', '0', 'http://148.70.237.248:8888/upload/musicImg/1577956692706.jpg', 'http://148.70.237.248:8888/upload/sxj.mp3', '郭顶', '2019-12-31 20:47:04', '2020-01-02 17:18:16', '1', '1', 'http://148.70.237.248:8888/upload/lrc/1577956606113.lrc');
INSERT INTO `t_music` VALUES ('34', '句号', '0', 'http://148.70.237.248:8888/upload/musicImg/1578127151347.png', 'http://148.70.237.248:8888/upload/jh.mp3', '邓紫棋', '2019-12-31 20:47:24', '2020-01-06 09:20:32', '1', '1', 'http://148.70.237.248:8888/upload/lrc/1578127146052.lrc');
INSERT INTO `t_music` VALUES ('35', '蜜蜂', '0', null, 'http://148.70.237.248:8888/upload/mf.mp3', '万岁爷', '2019-12-31 20:47:50', '2020-01-06 09:29:29', '1', '1', 'http://148.70.237.248:8888/upload/lrc/1578274162888.lrc');
INSERT INTO `t_music` VALUES ('37', '倒带', '0', 'http://148.70.237.248:8888/upload/musicImg/1578128066293.png', 'http://148.70.237.248:8888/upload/daodai.mp3', '蔡依林', '2019-12-31 21:02:57', '2020-01-06 09:26:13', '1', '1', 'http://148.70.237.248:8888/upload/lrc/1578128061150.lrc');
INSERT INTO `t_music` VALUES ('38', '聊表心意', '0', 'http://148.70.237.248:8888/upload/musicImg/1578128251522.png', 'http://148.70.237.248:8888/upload/lbxy.mp3', '薛子谦/刘惜君', '2019-12-31 21:03:30', '2020-01-06 09:27:56', '1', '1', 'http://148.70.237.248:8888/upload/lrc/1578128246192.lrc');
INSERT INTO `t_music` VALUES ('39', '恋爱的犀牛', '0', 'http://148.70.237.248:8888/upload/musicImg/1578128156461.png', 'http://148.70.237.248:8888/upload/lianai.mp3', '黄雨篱', '2019-12-31 21:04:16', '2020-01-06 09:27:03', '1', '1', 'http://148.70.237.248:8888/upload/lrc/1578128151927.lrc');
INSERT INTO `t_music` VALUES ('40', '云烟成雨', '0', 'http://148.70.237.248:8888/upload/musicImg/1578127983821.png', 'http://148.70.237.248:8888/upload/yycy.mp3', '房东的猫', '2019-12-31 21:04:52', '2020-01-06 09:25:32', '1', '1', 'http://148.70.237.248:8888/upload/lrc/1578127979685.lrc');
INSERT INTO `t_music` VALUES ('41', '知足', '0', 'http://p1.music.126.net/_B1Fn_Z1WxHzqGLzLZDf-w==/109951163263882447.jpg?param=300x300', 'http://148.70.237.248:8888/upload/zz.mp3', '五月天', '2019-12-31 21:09:05', '2020-01-02 16:15:49', '1', '1', 'http://148.70.237.248:8888/upload/lrc/zjax.lrc');
INSERT INTO `t_music` VALUES ('42', '如约而至', '0', 'http://148.70.237.248:8888/upload/musicImg/1578127879027.png', 'http://148.70.237.248:8888/upload/ryez.mp3', '许嵩', '2019-12-31 21:09:34', '2020-01-06 09:24:44', '1', '1', 'http://148.70.237.248:8888/upload/lrc/1578127874240.lrc');
INSERT INTO `t_music` VALUES ('43', '宝贝', '0', 'http://148.70.237.248:8888/upload/musicImg/yunge.jpg', 'http://148.70.237.248:8888/upload/baobei.m4a', '云哥', '2019-12-31 21:09:50', '2020-01-06 09:33:54', '1', '1', null);
INSERT INTO `t_music` VALUES ('44', '年少有为', '0', 'http://148.70.237.248:8888/upload/musicImg/chao.jpg', 'http://148.70.237.248:8888/upload/nsyw.mp3', '李荣浩', '2019-12-31 21:14:31', '2020-01-02 16:17:00', '1', '1', 'http://148.70.237.248:8888/upload/lrc/nsyw.lrc');
INSERT INTO `t_music` VALUES ('45', '杰迷', '0', 'http://148.70.237.248:8888/upload/musicImg/1578127797406.jpg', 'http://148.70.237.248:8888/upload/jm.mp3', '诌念慈', '2019-12-31 21:15:01', '2020-01-06 09:23:54', '1', '1', 'http://148.70.237.248:8888/upload/lrc/1578127786564.lrc');
INSERT INTO `t_music` VALUES ('47', 'あの頃～ジンジンバオヂュオニー～', '0', 'http://148.70.237.248:8888/upload/musicImg/wanghong.jpg', 'http://148.70.237.248:8888/upload/1577952238214.mp3', 'whiteeeen', '2020-01-02 16:05:08', '2020-01-06 09:28:36', '1', '1', 'http://148.70.237.248:8888/upload/lrc/1578128294836.lrc');
INSERT INTO `t_music` VALUES ('48', '林俊杰串烧弹唱', '0', 'http://148.70.237.248:8888/upload/musicImg/1577961843346.jpg', 'http://148.70.237.248:8888/upload/1577961854879.mp3', '爱在西元前', '2020-01-02 18:46:06', '2020-01-02 18:46:06', '1', '1', null);
INSERT INTO `t_music` VALUES ('49', '下山', '0', 'http://148.70.237.248:8888/upload/musicImg/1578109487378.png', 'http://148.70.237.248:8888/upload/1578109333674.mp3', '等什么君', '2020-01-04 11:44:52', '2020-01-04 11:44:52', '1', '1', 'http://148.70.237.248:8888/upload/lrc/1578109359146.lrc');
INSERT INTO `t_music` VALUES ('50', '野狼disco', '0', 'http://148.70.237.248:8888/upload/musicImg/1578109827490.png', 'http://148.70.237.248:8888/upload/1578109682834.mp3', '宝石gem', '2020-01-04 11:50:31', '2020-01-04 11:50:31', '1', '1', 'http://148.70.237.248:8888/upload/lrc/1578109701786.lrc');
INSERT INTO `t_music` VALUES ('51', '出山', '0', null, 'http://148.70.237.248:8888/upload/1578116628393.mp3', '刘至佳', '2020-01-04 13:44:34', '2020-01-04 13:44:34', '1', '1', 'http://148.70.237.248:8888/upload/lrc/1578116638907.lrc');
INSERT INTO `t_music` VALUES ('52', '骄兵', '0', 'http://148.70.237.248:8888/upload/musicImg/1578117372717.png', 'http://148.70.237.248:8888/upload/1578117359553.mp3', '万岁爷', '2020-01-04 13:56:26', '2020-01-04 13:56:26', '1', '1', 'http://148.70.237.248:8888/upload/lrc/1578117366547.lrc');
INSERT INTO `t_music` VALUES ('53', '我爱他', '0', 'http://148.70.237.248:8888/upload/musicImg/1578125327270.png', 'http://148.70.237.248:8888/upload/1578125311230.mp3', '王小帅', '2020-01-06 09:09:55', '2020-01-06 09:09:55', '1', '1', 'http://148.70.237.248:8888/upload/lrc/1578125319586.lrc');
INSERT INTO `t_music` VALUES ('54', '大碗宽面', '0', 'http://148.70.237.248:8888/upload/musicImg/1578125555438.png', 'http://148.70.237.248:8888/upload/1578125542088.mp3', '吴亦凡', '2020-01-06 09:12:17', '2020-01-06 09:12:17', '1', '1', 'http://148.70.237.248:8888/upload/lrc/1578125549261.lrc');
INSERT INTO `t_music` VALUES ('56', '生活因你而火热', '0', 'http://148.70.237.248:8888/upload/musicImg/1578126266907.png', 'http://148.70.237.248:8888/upload/1578126254440.mp3', '新裤子', '2020-01-06 09:17:09', '2020-01-06 09:17:09', '1', '1', 'http://148.70.237.248:8888/upload/lrc/1578126260649.lrc');
INSERT INTO `t_music` VALUES ('57', 'Illusionary Daytime', '0', 'http://148.70.237.248:8888/upload/musicImg/1578450430666.png', 'http://148.70.237.248:8888/upload/1578447939879.mp3', 'Shirfine', '2020-01-08 09:46:12', '2020-01-08 13:13:47', '1', '1', 'http://148.70.237.248:8888/upload/lrc/1578460423331.lrc');
INSERT INTO `t_music` VALUES ('58', 'River Flows in You', '0', null, 'http://148.70.237.248:8888/upload/1578460965306.mp3', 'Yiruma', '2020-01-08 13:20:04', '2020-01-08 13:22:50', '1', '1', null);
INSERT INTO `t_music` VALUES ('59', '秋的思念', '0', null, 'http://148.70.237.248:8888/upload/1578460895212.mp3', '赵海洋', '2020-01-08 13:21:41', '2020-01-08 13:21:41', '1', '1', null);
INSERT INTO `t_music` VALUES ('60', '空心', '0', 'http://148.70.237.248:8888/upload/musicImg/1578461686617.png', 'http://148.70.237.248:8888/upload/1578461675888.mp3', '冯提莫', '2020-01-08 13:34:48', '2020-01-08 13:34:48', '1', '1', 'http://148.70.237.248:8888/upload/lrc/1578461550095.lrc');
INSERT INTO `t_music` VALUES ('62', '寒鸦少年', '0', 'http://148.70.237.248:8888/upload/musicImg/1585127341504.png', 'http://148.70.237.248:8888/upload/1585127128288.mp3', '华晨宇', '2020-03-25 17:09:05', '2020-03-25 17:09:05', '1', '1', 'http://148.70.237.248:8888/upload/lrc/1585127144539.lrc');

-- ----------------------------
-- Table structure for t_video
-- ----------------------------
DROP TABLE IF EXISTS `t_video`;
CREATE TABLE `t_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `video_name` varchar(32) NOT NULL COMMENT '视频名称',
  `status` smallint(2) NOT NULL DEFAULT '1' COMMENT '状态 0：禁用 1：正常',
  `video_url` varchar(1000) DEFAULT NULL COMMENT '视频地址',
  `source` varchar(20) DEFAULT NULL COMMENT '视频来源',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `create_uid` int(11) NOT NULL COMMENT '创建人id',
  `update_uid` int(11) NOT NULL COMMENT '更新人id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_video
-- ----------------------------
INSERT INTO `t_video` VALUES ('17', '娜可露露五杀', '0', 'http://148.70.237.248:8888/assets/myself/waner.mp4', '服务器', '2019-06-27 15:48:37', '2019-06-27 16:39:00', '1', '1');
INSERT INTO `t_video` VALUES ('18', '刺客伍六七第二季-PV', '0', '//player.bilibili.com/player.html?aid=54684112&cid=95657502&page=1', '哔哩哔哩', '2019-06-27 16:42:10', '2019-06-27 19:20:06', '1', '1');

-- ----------------------------
-- Table structure for WARNING
-- ----------------------------
DROP TABLE IF EXISTS `WARNING`;
CREATE TABLE `WARNING` (
  `id` int(11) NOT NULL,
  `warning` text COLLATE utf8_unicode_ci,
  `Bitcoin_Address` text COLLATE utf8_unicode_ci,
  `Email` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of WARNING
-- ----------------------------
