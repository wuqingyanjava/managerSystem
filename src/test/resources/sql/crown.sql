
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 COMMENT='菜单表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '0', '系统管理', '', '1', 'layui-icon-set', '1', '1', '2018-11-27 14:52:10', '2019-06-12 14:08:09', '0', null, '');
INSERT INTO `sys_menu` VALUES ('23', '1', '用户管理', 'views/user/index.html', '2', 'layui-icon-username', '1', '1', '2018-11-27 15:10:32', '2018-12-12 15:39:18', '0', 'user', 'sys:user:list');
INSERT INTO `sys_menu` VALUES ('24', '1', '角色管理', 'views/role/index.html', '2', 'layui-icon-face-surprised', '1', '1', '2018-11-27 15:16:59', '2018-12-12 15:40:03', '0', 'role', 'sys:role:list');
INSERT INTO `sys_menu` VALUES ('25', '1', '菜单管理', 'views/menu/index.html', '2', 'layui-icon-template', '1', '1', '2018-11-27 15:17:59', '2018-12-12 15:37:35', '0', 'menu', 'sys:menu:list');
INSERT INTO `sys_menu` VALUES ('26', '1', '资源管理', 'views/resource/index.html', '2', 'layui-icon-read', '1', '1', '2018-11-27 15:18:31', '2019-06-19 10:46:49', '0', 'resource', 'sys:resource:list');
INSERT INTO `sys_menu` VALUES ('27', '26', '刷新资源', '', '3', 'layui-icon-refresh-3', '1', '1', '2018-11-27 15:19:15', '2018-12-12 15:35:14', '0', null, 'sys:resource:refresh');
INSERT INTO `sys_menu` VALUES ('28', '25', '添加', '', '3', 'layui-icon-add-circle-fine', '1', '1', '2018-11-27 15:20:06', '2018-12-12 15:45:47', '0', null, 'sys:menu:add');
INSERT INTO `sys_menu` VALUES ('29', '25', '修改', '', '3', 'layui-icon-senior', '1', '1', '2018-11-27 15:20:27', '2018-12-12 15:36:51', '0', null, 'sys:menu:edit');
INSERT INTO `sys_menu` VALUES ('30', '25', '删除', '', '3', 'layui-icon-close', '1', '1', '2018-11-27 15:21:14', '2018-12-12 15:35:49', '0', null, 'sys:menu:delete');
INSERT INTO `sys_menu` VALUES ('31', '24', '添加', '', '3', 'layui-icon-add-circle-fine', '1', '1', '2018-11-27 15:20:06', '2019-06-19 10:44:24', '0', null, 'sys:role:add');
INSERT INTO `sys_menu` VALUES ('32', '24', '修改', '', '3', 'layui-icon-senior', '1', '1', '2018-11-27 15:20:27', '2018-12-12 15:44:19', '0', null, 'sys:role:edit');
INSERT INTO `sys_menu` VALUES ('33', '24', '删除', '', '3', 'layui-icon-close', '1', '1', '2018-11-27 15:21:14', '2018-12-12 15:36:07', '0', null, 'sys:role:delete');
INSERT INTO `sys_menu` VALUES ('34', '23', '添加', '', '3', 'layui-icon-add-circle-fine', '1', '23', '2018-11-27 15:20:06', '2019-06-04 19:04:10', '0', null, 'sys:user:add');
INSERT INTO `sys_menu` VALUES ('35', '23', '修改', '', '3', 'layui-icon-senior', '1', '1', '2018-11-27 15:20:27', '2018-12-12 15:39:36', '0', null, 'sys:user:edit');
INSERT INTO `sys_menu` VALUES ('36', '23', '重置密码', '', '3', 'layui-icon-fire', '1', '1', '2018-11-27 15:21:14', '2018-12-12 15:38:48', '0', null, 'sys:user:resetpwd');
INSERT INTO `sys_menu` VALUES ('42', '24', '菜单授权', null, '3', 'layui-icon-auz', '1', '1', '2018-12-08 23:58:42', '2018-12-12 15:41:52', '0', null, 'sys:role:perm');
INSERT INTO `sys_menu` VALUES ('49', '26', '添加资源', null, '3', null, '1', '1', '2019-06-19 14:46:58', '2019-06-19 14:46:58', '0', null, 'sys:resource:add');
INSERT INTO `sys_menu` VALUES ('50', '26', '修改', null, '3', null, '1', '1', '2019-06-19 16:09:56', '2019-06-19 16:09:56', '0', null, 'sys:source:edit');
INSERT INTO `sys_menu` VALUES ('51', '26', '删除', null, '3', null, '1', '1', '2019-06-19 16:10:13', '2019-06-19 16:10:13', '0', null, 'sys:source:delete');
INSERT INTO `sys_menu` VALUES ('52', '0', '小程序管理', 'views/wxapp/index.html', '1', 'layui-icon-login-wechat', '1', '1', '2019-06-19 17:30:30', '2019-06-19 17:33:40', '0', 'wxapp', 'wxapp:manage');
INSERT INTO `sys_menu` VALUES ('53', '52', '广告管理', 'views/wxapp/index.html', '2', null, '1', '1', '2019-06-19 17:35:59', '2019-06-19 17:35:59', '0', 'wxapp', 'wx:advert:list');
INSERT INTO `sys_menu` VALUES ('54', '53', '添加广告', null, '3', null, '1', '1', '2019-06-19 18:25:56', '2019-06-19 18:32:57', '0', null, 'wx:advert:add');

-- ----------------------------
-- Table structure for sys_menu_resource
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu_resource`;
CREATE TABLE `sys_menu_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) DEFAULT NULL COMMENT '菜单ID',
  `resource_id` varchar(32) DEFAULT NULL COMMENT '资源ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8 COMMENT='菜单资源关系表';

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
INSERT INTO `sys_menu_resource` VALUES ('106', '26', '829a851334028a6e47b59f8dea0cf7cb');

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
INSERT INTO `sys_resource` VALUES ('04972e9f8e65b0364d9862687666da36', '查询所有角色(分页)', '/roles', 'GET', '3', '2019-06-19 18:41:29', 'GET:/roles');
INSERT INTO `sys_resource` VALUES ('14a1c1e610301988e07aa0bcdc6cf508', '查询单个资源', '/resources/{id}', 'GET', '2', '2019-06-19 18:41:29', 'GET:/resources/{id}');
INSERT INTO `sys_resource` VALUES ('29c4c75326ecf3a82f815c43b0085b2f', '修改账户信息', '/account/info', 'PUT', '1', '2019-06-19 18:41:29', 'PUT:/account/info');
INSERT INTO `sys_resource` VALUES ('2c654f1264fc85ac80516245672f3c47', '查询父级菜单(下拉框)', '/menus/combos', 'GET', '3', '2019-06-19 18:41:29', 'GET:/menus/combos');
INSERT INTO `sys_resource` VALUES ('30218613e987e464b13e0c0b8721aec5', '查询所有菜单', '/menus', 'GET', '3', '2019-06-19 18:41:29', 'GET:/menus');
INSERT INTO `sys_resource` VALUES ('30386fd7b8a4feb9c59861e63537acde', '修改用户', '/users/{id}', 'PUT', '3', '2019-06-19 18:41:29', 'PUT:/users/{id}');
INSERT INTO `sys_resource` VALUES ('342791ff851a4167af8abdd9e36b861d', '添加广告', '/advert', 'POST', '1', '2019-06-19 17:51:30', 'POST:/advert');
INSERT INTO `sys_resource` VALUES ('3ae42391ca3abe20c5cca35f4427cf9c', '获取账户按钮', '/account/buttons/aliases', 'GET', '1', '2019-06-19 18:41:29', 'GET:/account/buttons/aliases');
INSERT INTO `sys_resource` VALUES ('3f0c8ecb9431dcd547dae8428c1ab13d', '修改资源', '/resources/{id}', 'PUT', '2', '2019-06-19 18:41:29', 'PUT:/resources/{id}');
INSERT INTO `sys_resource` VALUES ('579e469e8ac850de1ca0adc54d01acba', '查询所有用户', '/users', 'GET', '3', '2019-06-19 18:41:29', 'GET:/users');
INSERT INTO `sys_resource` VALUES ('6692d9d95184977f82d3252de2f5eac7', '删除角色', '/roles/{id}', 'DELETE', '3', '2019-06-19 18:41:29', 'DELETE:/roles/{id}');
INSERT INTO `sys_resource` VALUES ('6ab0f8a49671e489f11a1bef2fcaf102', '清除Token', '/account/token', 'DELETE', '1', '2019-06-19 18:41:29', 'DELETE:/account/token');
INSERT INTO `sys_resource` VALUES ('6d1170346960aa8922b9b4d08a5bf71b', '设置菜单状态', '/menus/{id}/status', 'PUT', '3', '2019-06-19 18:41:29', 'PUT:/menus/{id}/status');
INSERT INTO `sys_resource` VALUES ('6fd51f02b724c137a08c28587f48d7f3', '查询单个菜单', '/menus/{id}', 'GET', '3', '2019-06-19 18:41:29', 'GET:/menus/{id}');
INSERT INTO `sys_resource` VALUES ('740b8b20a13e3833286a25151c12966e', '添加资源', '/resources/create', 'POST', '2', '2019-06-19 18:41:29', 'POST:/resources/create');
INSERT INTO `sys_resource` VALUES ('7baa5b852bc92715d7aa503c0a0d8925', '重置用户密码', '/users/{id}/password', 'PUT', '3', '2019-06-19 18:41:29', 'PUT:/users/{id}/password');
INSERT INTO `sys_resource` VALUES ('829a851334028a6e47b59f8dea0cf7cb', '查询所有资源(分页)', '/resources', 'GET', '3', '2019-06-19 18:41:29', 'GET:/resources');
INSERT INTO `sys_resource` VALUES ('842e33410b5a97b6c797e4782c97a90e', '获取Token', '/account/token', 'POST', '2', '2019-06-19 18:41:29', 'POST:/account/token');
INSERT INTO `sys_resource` VALUES ('8a3b4dc05867f5946235ba5fbc492b76', '查询单个用户', '/users/{id}', 'GET', '3', '2019-06-19 18:41:29', 'GET:/users/{id}');
INSERT INTO `sys_resource` VALUES ('8cb1442c7814f65ce0d796e1ef93c715', '添加菜单', '/menus', 'POST', '3', '2019-06-19 18:41:29', 'POST:/menus');
INSERT INTO `sys_resource` VALUES ('982803fc834e82cbb2ac1b93f2a47690', '查询单个角色', '/roles/{id}', 'GET', '3', '2019-06-19 18:41:29', 'GET:/roles/{id}');
INSERT INTO `sys_resource` VALUES ('a11e2191656cb199bea1defb17758411', '修改菜单', '/menus/{id}', 'PUT', '3', '2019-06-19 18:41:29', 'PUT:/menus/{id}');
INSERT INTO `sys_resource` VALUES ('a5529264d2645996c83bba2e961d0ec3', '查询所有资源', '/resources/resources', 'GET', '3', '2019-06-19 18:41:29', 'GET:/resources/resources');
INSERT INTO `sys_resource` VALUES ('a71cb59835c613f39bd936deb20cdd27', '创建用户', '/users', 'POST', '3', '2019-06-19 18:41:29', 'POST:/users');
INSERT INTO `sys_resource` VALUES ('a826bca352908155da4ca6702edfa2ed', '修改角色菜单', '/roles/{id}/menus', 'PUT', '3', '2019-06-19 18:41:29', 'PUT:/roles/{id}/menus');
INSERT INTO `sys_resource` VALUES ('b4770c0fe93fce7e829463328c800f20', '设置用户状态', '/users/{id}/status', 'PUT', '3', '2019-06-19 18:41:29', 'PUT:/users/{id}/status');
INSERT INTO `sys_resource` VALUES ('c2db9729dcd4a7d703e45411bb445dfd', '修改密码', '/account/password', 'PUT', '1', '2019-06-19 18:41:29', 'PUT:/account/password');
INSERT INTO `sys_resource` VALUES ('d329e999a56d4d6e71c7de1de474459c', '删除资源', '/resources/{id}', 'DELETE', '2', '2019-06-19 18:41:29', 'DELETE:/resources/{id}');
INSERT INTO `sys_resource` VALUES ('d81bffa6ffd70cc443703820b5a95e8d', '获取账户菜单', '/account/menus', 'GET', '1', '2019-06-19 18:41:29', 'GET:/account/menus');
INSERT INTO `sys_resource` VALUES ('d82de0a17f2c63106f98eb2f88d166e9', '添加角色', '/roles', 'POST', '3', '2019-06-19 18:41:29', 'POST:/roles');
INSERT INTO `sys_resource` VALUES ('d9d6f7163b313b950710a637682354d1', '查询所有角色', '/roles/roles', 'GET', '3', '2019-06-19 18:41:29', 'GET:/roles/roles');
INSERT INTO `sys_resource` VALUES ('e78940daf86b9ac5563d539e8802429c', '获取账户详情', '/account/info', 'GET', '1', '2019-06-19 18:41:29', 'GET:/account/info');
INSERT INTO `sys_resource` VALUES ('eaee955f405f6b96beab5136bfa3e29b', '修改角色', '/roles/{id}', 'PUT', '3', '2019-06-19 18:41:29', 'PUT:/roles/{id}');
INSERT INTO `sys_resource` VALUES ('f15f7b01ffe7166b05c3984c9b967837', '删除菜单', '/menus/{id}', 'DELETE', '3', '2019-06-19 18:41:29', 'DELETE:/menus/{id}');
INSERT INTO `sys_resource` VALUES ('f45f1b577d72dcd86b84c6f033682b53', '刷新资源', '/resources', 'PUT', '3', '2019-06-19 18:41:29', 'PUT:/resources');

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

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `menu_id` int(11) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=418 DEFAULT CHARSET=utf8 COMMENT='角色菜单关系表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('391', '2', '1');
INSERT INTO `sys_role_menu` VALUES ('392', '2', '26');
INSERT INTO `sys_role_menu` VALUES ('393', '2', '27');
INSERT INTO `sys_role_menu` VALUES ('394', '2', '52');
INSERT INTO `sys_role_menu` VALUES ('395', '2', '53');
INSERT INTO `sys_role_menu` VALUES ('396', '1', '1');
INSERT INTO `sys_role_menu` VALUES ('397', '1', '23');
INSERT INTO `sys_role_menu` VALUES ('398', '1', '34');
INSERT INTO `sys_role_menu` VALUES ('399', '1', '35');
INSERT INTO `sys_role_menu` VALUES ('400', '1', '36');
INSERT INTO `sys_role_menu` VALUES ('401', '1', '24');
INSERT INTO `sys_role_menu` VALUES ('402', '1', '31');
INSERT INTO `sys_role_menu` VALUES ('403', '1', '32');
INSERT INTO `sys_role_menu` VALUES ('404', '1', '33');
INSERT INTO `sys_role_menu` VALUES ('405', '1', '42');
INSERT INTO `sys_role_menu` VALUES ('406', '1', '25');
INSERT INTO `sys_role_menu` VALUES ('407', '1', '28');
INSERT INTO `sys_role_menu` VALUES ('408', '1', '29');
INSERT INTO `sys_role_menu` VALUES ('409', '1', '30');
INSERT INTO `sys_role_menu` VALUES ('410', '1', '26');
INSERT INTO `sys_role_menu` VALUES ('411', '1', '27');
INSERT INTO `sys_role_menu` VALUES ('412', '1', '49');
INSERT INTO `sys_role_menu` VALUES ('413', '1', '50');
INSERT INTO `sys_role_menu` VALUES ('414', '1', '51');
INSERT INTO `sys_role_menu` VALUES ('415', '1', '52');
INSERT INTO `sys_role_menu` VALUES ('416', '1', '53');
INSERT INTO `sys_role_menu` VALUES ('417', '1', '54');

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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='系统用户表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'Crown', 'caratacus@qq.com', '13712345678', '0', '1', '2018-11-05 17:19:05', '2019-06-19 18:33:05', 'crown', '$apr1$crown$WQ2TEXVPUJ8l6N6gm0CGv.', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_user` VALUES ('18', 'crown1', '11@qq.com', '13718867899', '0', '1', '2018-11-19 18:56:19', '2018-12-12 15:28:18', 'crown1', '$apr1$crown1$NsepppGmlSjqtwPTlaLb1/', '0:0:0:0:0:0:0:1');
INSERT INTO `sys_user` VALUES ('19', 'crown2', '13878929833@163.com', '13878929833', '1', '18', '2018-12-10 15:25:57', '2018-12-10 15:25:57', 'crown2', '$apr1$crown2$R/8LgZ.REDrXB3jlpyglI0', null);
INSERT INTO `sys_user` VALUES ('23', '吴清棪', 'wuqingyandemo@sina.cn', '18871469960', '0', '1', '2019-06-04 18:49:31', '2019-06-04 18:54:16', 'wuqy', '$apr1$wuqy$e3IHXAYEhvEY5P90WNgU81', '0:0:0:0:0:0:0:1');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL COMMENT '用户ID',
  `role_id` int(11) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 COMMENT='系统用户角色关系表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('24', '18', '2');
INSERT INTO `sys_user_role` VALUES ('49', '1', '1');
INSERT INTO `sys_user_role` VALUES ('50', '19', '2');
INSERT INTO `sys_user_role` VALUES ('54', '23', '1');

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
