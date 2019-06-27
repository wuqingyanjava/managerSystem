/*
Navicat MySQL Data Transfer

Source Server         : 腾讯云服务器
Source Server Version : 50644
Source Host           : 148.70.237.248:3306
Source Database       : potato

Target Server Type    : MYSQL
Target Server Version : 50644
File Encoding         : 65001

Date: 2019-06-27 10:58:00
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
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8 COMMENT='菜单表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '0', '系统管理', '', '1', 'layui-icon-set', '1', '1', '2018-11-27 14:52:10', '2019-06-12 14:08:09', '0', null, '', '1');
INSERT INTO `sys_menu` VALUES ('23', '1', '用户管理', 'views/user/index.html', '2', 'layui-icon-username', '1', '1', '2018-11-27 15:10:32', '2018-12-12 15:39:18', '0', 'user', 'sys:user:list', '0');
INSERT INTO `sys_menu` VALUES ('24', '1', '角色管理', 'views/role/index.html', '2', 'layui-icon-face-surprised', '1', '1', '2018-11-27 15:16:59', '2018-12-12 15:40:03', '0', 'role', 'sys:role:list', '0');
INSERT INTO `sys_menu` VALUES ('25', '1', '菜单管理', 'views/menu/index.html', '2', 'layui-icon-template', '1', '1', '2018-11-27 15:17:59', '2018-12-12 15:37:35', '0', 'menu', 'sys:menu:list', '0');
INSERT INTO `sys_menu` VALUES ('26', '1', 'API资源管理', 'views/resource/index.html', '2', 'layui-icon-read', '1', '1', '2018-11-27 15:18:31', '2019-06-26 09:56:25', '0', 'resource', 'sys:resource:list', '0');
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
INSERT INTO `sys_menu` VALUES ('49', '26', '添加资源', null, '3', null, '1', '1', '2019-06-19 14:46:58', '2019-06-19 14:46:58', '0', null, 'sys:resource:add', '0');
INSERT INTO `sys_menu` VALUES ('50', '26', '修改', null, '3', null, '1', '1', '2019-06-19 16:09:56', '2019-06-19 16:09:56', '0', null, 'sys:source:edit', '0');
INSERT INTO `sys_menu` VALUES ('51', '26', '删除', null, '3', null, '1', '1', '2019-06-19 16:10:13', '2019-06-19 16:10:13', '0', null, 'sys:source:delete', '0');
INSERT INTO `sys_menu` VALUES ('52', '0', '小程序管理', 'views/wxapp/index.html', '1', 'layui-icon-login-wechat', '1', '1', '2019-06-19 17:30:30', '2019-06-27 10:06:37', '0', 'wxapp', 'wxapp:manage', '2');
INSERT INTO `sys_menu` VALUES ('53', '52', '广告管理', 'views/advert/index.html', '2', null, '1', '1', '2019-06-19 17:35:59', '2019-06-26 09:52:56', '0', 'wxapp', 'wx:advert:list', '0');
INSERT INTO `sys_menu` VALUES ('54', '53', '添加广告', null, '3', null, '1', '1', '2019-06-19 18:25:56', '2019-06-19 18:32:57', '0', null, 'wx:advert:add', '0');
INSERT INTO `sys_menu` VALUES ('55', '52', '文章管理', null, '2', null, '1', '1', '2019-06-20 20:46:21', '2019-06-27 10:57:32', '0', null, 'wxapp:article:list', '2');
INSERT INTO `sys_menu` VALUES ('56', '0', '资源管理', null, '2', 'layui-icon-404', '1', '1', '2019-06-20 20:52:50', '2019-06-26 10:04:34', '0', null, null, '3');
INSERT INTO `sys_menu` VALUES ('57', '52', '用户管理', null, '2', null, '1', '1', '2019-06-20 20:54:48', '2019-06-27 10:57:14', '0', null, 'wxapp:user:list', '3');
INSERT INTO `sys_menu` VALUES ('58', '56', '音乐管理', 'views/music/index.html', '2', null, '1', '1', '2019-06-26 09:54:59', '2019-06-27 10:07:51', '0', 'music', 'source:music:list', '0');
INSERT INTO `sys_menu` VALUES ('59', '58', '添加', null, '3', null, '1', '1', '2019-06-26 10:05:09', '2019-06-26 10:09:37', '0', null, 'source:music:add', '0');
INSERT INTO `sys_menu` VALUES ('60', '58', '修改', null, '3', null, '1', '1', '2019-06-26 10:11:13', '2019-06-26 10:11:13', '0', null, 'source:music:edit', '0');
INSERT INTO `sys_menu` VALUES ('61', '58', '删除', null, '3', null, '1', '1', '2019-06-26 10:11:54', '2019-06-26 10:12:40', '0', null, 'source:music:delete', '0');
INSERT INTO `sys_menu` VALUES ('62', '53', '修改', null, '3', null, '1', '1', '2019-06-26 15:53:56', '2019-06-26 15:53:56', '0', null, 'wx:advert:edit', '0');
INSERT INTO `sys_menu` VALUES ('63', '53', '删除', null, '3', null, '1', '1', '2019-06-26 15:54:26', '2019-06-26 15:54:26', '0', null, 'wx:advert:delete', '0');
INSERT INTO `sys_menu` VALUES ('65', '0', '首页', 'console.html', '1', 'layui-icon-rate-half', '1', '1', '2019-06-27 10:11:26', '2019-06-27 10:20:58', '0', 'console', null, '0');
INSERT INTO `sys_menu` VALUES ('66', '65', '看板', 'console.html', '2', null, '1', '1', '2019-06-27 10:18:18', '2019-06-27 10:18:18', '0', 'console', 'console', '0');

-- ----------------------------
-- Table structure for sys_menu_resource
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu_resource`;
CREATE TABLE `sys_menu_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) DEFAULT NULL COMMENT '菜单ID',
  `resource_id` varchar(32) DEFAULT NULL COMMENT '资源ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8 COMMENT='菜单资源关系表';

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
INSERT INTO `sys_menu_resource` VALUES ('80', '25', '6d1170346960aa8922b9b4d08a5bf71b');
INSERT INTO `sys_menu_resource` VALUES ('81', '25', '30218613e987e464b13e0c0b8721aec5');
INSERT INTO `sys_menu_resource` VALUES ('85', '36', '7baa5b852bc92715d7aa503c0a0d8925');
INSERT INTO `sys_menu_resource` VALUES ('87', '23', '579e469e8ac850de1ca0adc54d01acba');
INSERT INTO `sys_menu_resource` VALUES ('88', '23', 'b4770c0fe93fce7e829463328c800f20');
INSERT INTO `sys_menu_resource` VALUES ('89', '35', '30386fd7b8a4feb9c59861e63537acde');
INSERT INTO `sys_menu_resource` VALUES ('90', '35', '8a3b4dc05867f5946235ba5fbc492b76');
INSERT INTO `sys_menu_resource` VALUES ('91', '24', '04972e9f8e65b0364d9862687666da36');
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
INSERT INTO `sys_menu_resource` VALUES ('117', '26', '829a851334028a6e47b59f8dea0cf7cb');
INSERT INTO `sys_menu_resource` VALUES ('122', '59', '7961c441a0bec1dc7bc449920d7d2946');
INSERT INTO `sys_menu_resource` VALUES ('123', '60', '19d52bf39c9023d0fe99c6d3aa80bf05');
INSERT INTO `sys_menu_resource` VALUES ('125', '61', 'bd133fd7ecbe05441f86986d7e24c16d');
INSERT INTO `sys_menu_resource` VALUES ('126', '62', 'cb434c4502a4da8dc6ef803e3a6b7a8a');
INSERT INTO `sys_menu_resource` VALUES ('127', '63', '01f3ff4caca9b1651b738b7225f6371f');
INSERT INTO `sys_menu_resource` VALUES ('128', '58', 'c16967faeaa63e096a51d996290df77c');
INSERT INTO `sys_menu_resource` VALUES ('129', '58', 'c3b8630c9e730c29ba30f3cebaddde39');

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
INSERT INTO `sys_resource` VALUES ('01f3ff4caca9b1651b738b7225f6371f', '删除广告', '/advert/{id}', 'DELETE', '3', '2019-06-27 10:55:06', 'DELETE:/advert/{id}');
INSERT INTO `sys_resource` VALUES ('04972e9f8e65b0364d9862687666da36', '查询所有角色(分页)', '/roles', 'GET', '3', '2019-06-27 10:55:06', 'GET:/roles');
INSERT INTO `sys_resource` VALUES ('0c7f18138705b67b83773f60295a4ca1', '添加广告', '/advert', 'POST', '3', '2019-06-27 10:55:06', 'POST:/advert');
INSERT INTO `sys_resource` VALUES ('14a1c1e610301988e07aa0bcdc6cf508', '查询单个资源', '/resources/{id}', 'GET', '2', '2019-06-27 10:55:06', 'GET:/resources/{id}');
INSERT INTO `sys_resource` VALUES ('19d52bf39c9023d0fe99c6d3aa80bf05', '修改音乐', '/music/{id}', 'PUT', '3', '2019-06-27 10:55:06', 'PUT:/music/{id}');
INSERT INTO `sys_resource` VALUES ('29c4c75326ecf3a82f815c43b0085b2f', '修改账户信息', '/account/info', 'PUT', '1', '2019-06-27 10:55:06', 'PUT:/account/info');
INSERT INTO `sys_resource` VALUES ('2c654f1264fc85ac80516245672f3c47', '查询父级菜单(下拉框)', '/menus/combos', 'GET', '3', '2019-06-27 10:55:06', 'GET:/menus/combos');
INSERT INTO `sys_resource` VALUES ('2f52a3f5e6f2af11174d197da9ade6ab', '查询单个音乐', '/music/{id}', 'GET', '3', '2019-06-27 10:55:06', 'GET:/music/{id}');
INSERT INTO `sys_resource` VALUES ('30218613e987e464b13e0c0b8721aec5', '查询所有菜单', '/menus', 'GET', '3', '2019-06-27 10:55:06', 'GET:/menus');
INSERT INTO `sys_resource` VALUES ('30386fd7b8a4feb9c59861e63537acde', '修改用户', '/users/{id}', 'PUT', '3', '2019-06-27 10:55:06', 'PUT:/users/{id}');
INSERT INTO `sys_resource` VALUES ('342791ff851a4167af8abdd9e36b861d', '添加广告', '/advert', 'POST', '1', '2019-06-19 17:51:30', 'POST:/advert');
INSERT INTO `sys_resource` VALUES ('3ae42391ca3abe20c5cca35f4427cf9c', '获取账户按钮', '/account/buttons/aliases', 'GET', '1', '2019-06-27 10:55:06', 'GET:/account/buttons/aliases');
INSERT INTO `sys_resource` VALUES ('3f0c8ecb9431dcd547dae8428c1ab13d', '修改资源', '/resources/{id}', 'PUT', '2', '2019-06-27 10:55:06', 'PUT:/resources/{id}');
INSERT INTO `sys_resource` VALUES ('579e469e8ac850de1ca0adc54d01acba', '查询所有用户', '/users', 'GET', '3', '2019-06-27 10:55:06', 'GET:/users');
INSERT INTO `sys_resource` VALUES ('6577904643f0253b54070559179829be', '查询单个广告', '/advert/{id}', 'GET', '3', '2019-06-27 10:55:06', 'GET:/advert/{id}');
INSERT INTO `sys_resource` VALUES ('6692d9d95184977f82d3252de2f5eac7', '删除角色', '/roles/{id}', 'DELETE', '3', '2019-06-27 10:55:06', 'DELETE:/roles/{id}');
INSERT INTO `sys_resource` VALUES ('6ab0f8a49671e489f11a1bef2fcaf102', '清除Token', '/account/token', 'DELETE', '1', '2019-06-27 10:55:06', 'DELETE:/account/token');
INSERT INTO `sys_resource` VALUES ('6d1170346960aa8922b9b4d08a5bf71b', '设置菜单状态', '/menus/{id}/status', 'PUT', '3', '2019-06-27 10:55:06', 'PUT:/menus/{id}/status');
INSERT INTO `sys_resource` VALUES ('6fd51f02b724c137a08c28587f48d7f3', '查询单个菜单', '/menus/{id}', 'GET', '3', '2019-06-27 10:55:06', 'GET:/menus/{id}');
INSERT INTO `sys_resource` VALUES ('740b8b20a13e3833286a25151c12966e', '添加资源', '/resources/create', 'POST', '2', '2019-06-27 10:55:06', 'POST:/resources/create');
INSERT INTO `sys_resource` VALUES ('7961c441a0bec1dc7bc449920d7d2946', '添加音乐', '/music', 'POST', '3', '2019-06-27 10:55:06', 'POST:/music');
INSERT INTO `sys_resource` VALUES ('7baa5b852bc92715d7aa503c0a0d8925', '重置用户密码', '/users/{id}/password', 'PUT', '3', '2019-06-27 10:55:06', 'PUT:/users/{id}/password');
INSERT INTO `sys_resource` VALUES ('829a851334028a6e47b59f8dea0cf7cb', '查询所有资源(分页)', '/resources', 'GET', '3', '2019-06-27 10:55:06', 'GET:/resources');
INSERT INTO `sys_resource` VALUES ('839ba732cd105a891226b2af1349d1aa', '小程序查询所有音乐(分页)', '/music/wxAppmusic', 'GET', '2', '2019-06-27 10:55:06', 'GET:/music/wxAppmusic');
INSERT INTO `sys_resource` VALUES ('842e33410b5a97b6c797e4782c97a90e', '获取Token', '/account/token', 'POST', '2', '2019-06-27 10:55:06', 'POST:/account/token');
INSERT INTO `sys_resource` VALUES ('8a3b4dc05867f5946235ba5fbc492b76', '查询单个用户', '/users/{id}', 'GET', '3', '2019-06-27 10:55:06', 'GET:/users/{id}');
INSERT INTO `sys_resource` VALUES ('8cb1442c7814f65ce0d796e1ef93c715', '添加菜单', '/menus', 'POST', '3', '2019-06-27 10:55:06', 'POST:/menus');
INSERT INTO `sys_resource` VALUES ('982803fc834e82cbb2ac1b93f2a47690', '查询单个角色', '/roles/{id}', 'GET', '3', '2019-06-27 10:55:06', 'GET:/roles/{id}');
INSERT INTO `sys_resource` VALUES ('a11e2191656cb199bea1defb17758411', '修改菜单', '/menus/{id}', 'PUT', '3', '2019-06-27 10:55:06', 'PUT:/menus/{id}');
INSERT INTO `sys_resource` VALUES ('a3dfc0a8a2a202e0ee029a733c1e7e16', '查询背景音乐', '/music/background', 'GET', '2', '2019-06-27 10:55:06', 'GET:/music/background');
INSERT INTO `sys_resource` VALUES ('a5529264d2645996c83bba2e961d0ec3', '查询所有资源', '/resources/resources', 'GET', '3', '2019-06-27 10:55:06', 'GET:/resources/resources');
INSERT INTO `sys_resource` VALUES ('a71cb59835c613f39bd936deb20cdd27', '创建用户', '/users', 'POST', '3', '2019-06-27 10:55:06', 'POST:/users');
INSERT INTO `sys_resource` VALUES ('a826bca352908155da4ca6702edfa2ed', '修改角色菜单', '/roles/{id}/menus', 'PUT', '3', '2019-06-27 10:55:06', 'PUT:/roles/{id}/menus');
INSERT INTO `sys_resource` VALUES ('aa2ad32bf65347564e57a383ee1cd15b', '设置广告状态', '/advert/{id}/status', 'PUT', '3', '2019-06-27 10:55:06', 'PUT:/advert/{id}/status');
INSERT INTO `sys_resource` VALUES ('abc748a558055052262454cc3bb4e38c', '上传图片', '/advert/uploadFtp', 'POST', '2', '2019-06-27 10:55:06', 'POST:/advert/uploadFtp');
INSERT INTO `sys_resource` VALUES ('b4770c0fe93fce7e829463328c800f20', '设置用户状态', '/users/{id}/status', 'PUT', '3', '2019-06-27 10:55:06', 'PUT:/users/{id}/status');
INSERT INTO `sys_resource` VALUES ('bd133fd7ecbe05441f86986d7e24c16d', '删除音乐', '/music/{id}', 'DELETE', '3', '2019-06-27 10:55:06', 'DELETE:/music/{id}');
INSERT INTO `sys_resource` VALUES ('c16967faeaa63e096a51d996290df77c', '查询所有音乐(分页)', '/music', 'GET', '3', '2019-06-27 10:55:06', 'GET:/music');
INSERT INTO `sys_resource` VALUES ('c2db9729dcd4a7d703e45411bb445dfd', '修改密码', '/account/password', 'PUT', '1', '2019-06-27 10:55:06', 'PUT:/account/password');
INSERT INTO `sys_resource` VALUES ('c3b8630c9e730c29ba30f3cebaddde39', '设置音乐状态', '/music/{id}/status', 'PUT', '3', '2019-06-27 10:55:06', 'PUT:/music/{id}/status');
INSERT INTO `sys_resource` VALUES ('c92c23866f4a14dca8506d93a2fe5877', '上传图片', '/advert/upload', 'POST', '2', '2019-06-27 10:55:06', 'POST:/advert/upload');
INSERT INTO `sys_resource` VALUES ('cb434c4502a4da8dc6ef803e3a6b7a8a', '修改广告', '/advert/{id}', 'PUT', '3', '2019-06-27 10:55:06', 'PUT:/advert/{id}');
INSERT INTO `sys_resource` VALUES ('d329e999a56d4d6e71c7de1de474459c', '删除资源', '/resources/{id}', 'DELETE', '2', '2019-06-27 10:55:06', 'DELETE:/resources/{id}');
INSERT INTO `sys_resource` VALUES ('d81bffa6ffd70cc443703820b5a95e8d', '获取账户菜单', '/account/menus', 'GET', '1', '2019-06-27 10:55:06', 'GET:/account/menus');
INSERT INTO `sys_resource` VALUES ('d82de0a17f2c63106f98eb2f88d166e9', '添加角色', '/roles', 'POST', '3', '2019-06-27 10:55:06', 'POST:/roles');
INSERT INTO `sys_resource` VALUES ('d9d6f7163b313b950710a637682354d1', '查询所有角色', '/roles/roles', 'GET', '3', '2019-06-27 10:55:06', 'GET:/roles/roles');
INSERT INTO `sys_resource` VALUES ('da3205d35f0297745168013c0a32ba5e', '查询所有音乐', '/music/musics', 'GET', '3', '2019-06-27 10:55:06', 'GET:/music/musics');
INSERT INTO `sys_resource` VALUES ('e32deab6d556ac95202d78f07a74c244', '查询所有广告', '/advert/adverts', 'GET', '3', '2019-06-27 10:55:06', 'GET:/advert/adverts');
INSERT INTO `sys_resource` VALUES ('e78940daf86b9ac5563d539e8802429c', '获取账户详情', '/account/info', 'GET', '1', '2019-06-27 10:55:06', 'GET:/account/info');
INSERT INTO `sys_resource` VALUES ('eaee955f405f6b96beab5136bfa3e29b', '修改角色', '/roles/{id}', 'PUT', '3', '2019-06-27 10:55:06', 'PUT:/roles/{id}');
INSERT INTO `sys_resource` VALUES ('f15f7b01ffe7166b05c3984c9b967837', '删除菜单', '/menus/{id}', 'DELETE', '3', '2019-06-27 10:55:06', 'DELETE:/menus/{id}');
INSERT INTO `sys_resource` VALUES ('f45f1b577d72dcd86b84c6f033682b53', '刷新资源', '/resources', 'PUT', '3', '2019-06-27 10:55:06', 'PUT:/resources');
INSERT INTO `sys_resource` VALUES ('faa8eefdec51055ffd95b817b41fe11a', '查询所有音乐(分页)', '/advert', 'GET', '3', '2019-06-27 10:55:06', 'GET:/advert');

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '超级管理员', '1', '1', '2018-11-12 15:59:43', '2018-11-12 15:59:47', '超级管理员');
INSERT INTO `sys_role` VALUES ('2', '普通管理员', '1', '1', '2018-11-12 16:00:17', '2018-11-12 16:00:19', '普通管理员');
INSERT INTO `sys_role` VALUES ('3', '小程序管理员', '24', '24', '2019-06-20 21:07:54', '2019-06-20 21:07:54', '管理小程序');
INSERT INTO `sys_role` VALUES ('4', '游客浏览', '1', '1', '2019-06-21 15:34:41', '2019-06-21 15:34:41', null);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `menu_id` int(11) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=667 DEFAULT CHARSET=utf8 COMMENT='角色菜单关系表';

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
INSERT INTO `sys_role_menu` VALUES ('634', '1', '1');
INSERT INTO `sys_role_menu` VALUES ('635', '1', '23');
INSERT INTO `sys_role_menu` VALUES ('636', '1', '34');
INSERT INTO `sys_role_menu` VALUES ('637', '1', '35');
INSERT INTO `sys_role_menu` VALUES ('638', '1', '36');
INSERT INTO `sys_role_menu` VALUES ('639', '1', '24');
INSERT INTO `sys_role_menu` VALUES ('640', '1', '31');
INSERT INTO `sys_role_menu` VALUES ('641', '1', '32');
INSERT INTO `sys_role_menu` VALUES ('642', '1', '33');
INSERT INTO `sys_role_menu` VALUES ('643', '1', '42');
INSERT INTO `sys_role_menu` VALUES ('644', '1', '25');
INSERT INTO `sys_role_menu` VALUES ('645', '1', '28');
INSERT INTO `sys_role_menu` VALUES ('646', '1', '29');
INSERT INTO `sys_role_menu` VALUES ('647', '1', '30');
INSERT INTO `sys_role_menu` VALUES ('648', '1', '26');
INSERT INTO `sys_role_menu` VALUES ('649', '1', '27');
INSERT INTO `sys_role_menu` VALUES ('650', '1', '49');
INSERT INTO `sys_role_menu` VALUES ('651', '1', '50');
INSERT INTO `sys_role_menu` VALUES ('652', '1', '51');
INSERT INTO `sys_role_menu` VALUES ('653', '1', '52');
INSERT INTO `sys_role_menu` VALUES ('654', '1', '53');
INSERT INTO `sys_role_menu` VALUES ('655', '1', '54');
INSERT INTO `sys_role_menu` VALUES ('656', '1', '62');
INSERT INTO `sys_role_menu` VALUES ('657', '1', '63');
INSERT INTO `sys_role_menu` VALUES ('658', '1', '55');
INSERT INTO `sys_role_menu` VALUES ('659', '1', '57');
INSERT INTO `sys_role_menu` VALUES ('660', '1', '56');
INSERT INTO `sys_role_menu` VALUES ('661', '1', '58');
INSERT INTO `sys_role_menu` VALUES ('662', '1', '59');
INSERT INTO `sys_role_menu` VALUES ('663', '1', '60');
INSERT INTO `sys_role_menu` VALUES ('664', '1', '61');
INSERT INTO `sys_role_menu` VALUES ('665', '1', '65');
INSERT INTO `sys_role_menu` VALUES ('666', '1', '66');

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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COMMENT='系统用户表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'Crown', 'caratacus@qq.com', '13712345678', '0', '1', '2018-11-05 17:19:05', '2019-06-27 10:57:39', 'crown', '$apr1$crown$WQ2TEXVPUJ8l6N6gm0CGv.', '0:0:0:0:0:0:0:1');
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
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COMMENT='系统用户角色关系表';

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
INSERT INTO `t_advert` VALUES ('087e8c46746fe046a68b39769c078efd', '露娜呀', '0', 'assets/upload/1561597958467.jpg', null, '2019-06-27 09:12:41', '2019-06-27 09:14:35', '1', '1');
INSERT INTO `t_advert` VALUES ('e6aa3066355de00ab809c29eda307dfc', '上官婉儿呀', '0', 'assets/upload/1561597930356.jpg', 'http://www.baidu.com', '2019-06-26 15:12:35', '2019-06-27 09:14:23', '1', '1');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_music
-- ----------------------------
INSERT INTO `t_music` VALUES ('1', '回到过去', '0', null, 'http://dl.stream.qqmusic.qq.com/M500003rxgIM2eOFSF.mp3?vkey=056C839F0EA03478D616BC8B1B867130CFCFFA99BF695EB4A7B64A3834D731E2D4BA8CA74ECE5A8949B66F5114FED85C5BE00E050A274CC5&guid=5150825362&fromtag=1', '周杰伦', '2019-06-26 10:10:04', '2019-06-27 10:55:51', '1', '1');
