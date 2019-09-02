-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- 主机： 127.0.0.1:3306
-- 生成日期： 2019-09-02 09:37:16
-- 服务器版本： 5.7.24
-- PHP 版本： 7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `hc_resources`
--

-- --------------------------------------------------------

--
-- 表的结构 `access`
--

DROP TABLE IF EXISTS `access`;
CREATE TABLE IF NOT EXISTS `access` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '名称',
  `remark` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '菜单显示名称',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '菜单/按钮',
  `url` varchar(150) COLLATE utf8_bin DEFAULT NULL COMMENT '访问地址',
  `update_time` datetime NOT NULL,
  `delete_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `access`
--

INSERT INTO `access` (`id`, `name`, `remark`, `type`, `url`, `update_time`, `delete_time`) VALUES
(1, 'list_resources', '查看自定义菜单列表', 0, NULL, '2019-08-14 06:52:59', NULL),
(2, 'add_resources_1', '添加一级菜单', 1, '/admin/resources/add', '2019-08-14 07:18:12', NULL),
(3, 'add_resources_2', '添加二级菜单', 1, '/admin/resources/add', '2019-08-14 07:27:44', NULL),
(4, 'add_resources_3', '添加三级菜单', 1, '/admin/resources/add', '2019-08-14 07:28:00', NULL),
(5, 'edit_resources_1', '编辑一级菜单', 1, '/admin/resources/edit', '2019-08-14 07:28:31', NULL),
(6, 'edit_resources_2', '编辑二级菜单', 1, '/admin/resources/edit', '2019-08-14 07:28:48', NULL),
(7, 'edit_resources_3', '编辑三级菜单', 1, '/admin/resources/edit', '2019-08-14 07:28:57', NULL),
(8, 'delete_resources_1', '删除一级菜单', 1, '/admin/resources/delete', '2019-08-14 07:29:18', NULL),
(9, 'delete_resources_2', '删除二级菜单', 1, '/admin/resources/delete', '2019-08-14 07:29:33', NULL),
(10, 'delete_resources_3', '删除三级菜单', 1, '/admin/resources/delete', '2019-08-14 07:29:41', NULL),
(11, 'list_user', '查看所有成员', 0, NULL, '2019-08-14 07:31:48', NULL),
(12, 'assign_role', '为成员分配角色', 1, '/admin/role/assignToUser', '2019-08-14 07:46:20', NULL),
(13, 'assign_resources_user', '为成员分配权限', 1, '/admin/resources/assignToUser', '2019-08-14 07:47:18', NULL),
(14, 'edit_user', '编辑成员信息', 1, '/admin/user/update', '2019-08-14 07:48:08', NULL),
(15, 'delete_user', '删除成员', 1, '/admin/user/delete', '2019-08-14 07:49:16', NULL),
(16, 'list_role', '查看所有角色信息', 0, NULL, '2019-08-14 07:53:02', NULL),
(17, 'edit_role', '编辑角色信息', 1, '/admin/role/edit', '2019-08-14 07:53:48', NULL),
(18, 'delete_role', '删除角色信息', 1, '/admin/role/delete', '2019-08-14 07:54:04', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_no` int(11) NOT NULL COMMENT '工号',
  `user_name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '用户名',
  `email` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '邮箱',
  `password` char(32) COLLATE utf8_bin DEFAULT NULL COMMENT '密码',
  `department` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '部门',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用',
  `super` tinyint(1) NOT NULL DEFAULT '0' COMMENT '超级管理员',
  `last_login` datetime DEFAULT NULL COMMENT '最后登录时间',
  `update_time` datetime NOT NULL,
  `delete_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `admin`
--

INSERT INTO `admin` (`id`, `user_no`, `user_name`, `email`, `password`, `department`, `status`, `super`, `last_login`, `update_time`, `delete_time`) VALUES
(1, 10000001, '巴拉巴拉小魔仙', 'balabala@abc.com', 'e10adc3949ba59abbe56e057f20f883e', '部门一', 1, 0, NULL, '2019-08-22 01:44:31', NULL),
(2, 10000000, '超管', 'admin@abc.com', 'e10adc3949ba59abbe56e057f20f883e', '总部', 1, 1, NULL, '2019-08-20 00:00:00', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `admin_access`
--

DROP TABLE IF EXISTS `admin_access`;
CREATE TABLE IF NOT EXISTS `admin_access` (
  `admin_id` int(11) NOT NULL,
  `access_id` int(11) NOT NULL,
  `theme_id` int(11) NOT NULL,
  KEY `admin_id` (`admin_id`),
  KEY `access_id` (`access_id`),
  KEY `theme_id` (`theme_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `admin_access`
--

INSERT INTO `admin_access` (`admin_id`, `access_id`, `theme_id`) VALUES
(1, 3, 2),
(1, 4, 2),
(1, 6, 2),
(1, 7, 2),
(1, 9, 2),
(1, 10, 2),
(1, 1, 1),
(1, 18, 1),
(1, 17, 1),
(1, 16, 1),
(1, 15, 1),
(1, 13, 1),
(1, 14, 1),
(1, 11, 1),
(1, 12, 1);

-- --------------------------------------------------------

--
-- 表的结构 `admin_role`
--

DROP TABLE IF EXISTS `admin_role`;
CREATE TABLE IF NOT EXISTS `admin_role` (
  `admin_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  KEY `admin_id` (`admin_id`),
  KEY `role_id` (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `admin_role`
--

INSERT INTO `admin_role` (`admin_id`, `role_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `admin_theme`
--

DROP TABLE IF EXISTS `admin_theme`;
CREATE TABLE IF NOT EXISTS `admin_theme` (
  `admin_id` int(11) NOT NULL,
  `theme_id` int(11) NOT NULL,
  KEY `admin_id` (`admin_id`),
  KEY `theme_id` (`theme_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `admin_theme`
--

INSERT INTO `admin_theme` (`admin_id`, `theme_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `resources`
--

DROP TABLE IF EXISTS `resources`;
CREATE TABLE IF NOT EXISTS `resources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL,
  `theme_id` int(11) NOT NULL COMMENT '主题ID',
  `menu_title` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '菜单显示名称',
  `url` varchar(250) COLLATE utf8_bin DEFAULT NULL COMMENT '资源链接',
  `back_url` varchar(250) COLLATE utf8_bin DEFAULT NULL COMMENT '备用链接',
  `type` smallint(6) NOT NULL COMMENT '一级/二级/三级菜单',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用',
  `public` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否公开',
  `user_id` int(11) NOT NULL COMMENT '创建者ID',
  `resources_order` smallint(6) NOT NULL DEFAULT '0' COMMENT '排序',
  `open_type` int(11) NOT NULL DEFAULT '0' COMMENT '当前窗口/新窗口',
  `origin` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '来源',
  `back_origin` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '备用地址来源',
  `verify` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否需要登录',
  `verify_id` int(11) DEFAULT NULL COMMENT '登录账号',
  `remark` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `update_time` datetime NOT NULL COMMENT '修改日期',
  `delete_time` datetime DEFAULT NULL COMMENT '软删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `resources`
--

INSERT INTO `resources` (`id`, `pid`, `theme_id`, `menu_title`, `url`, `back_url`, `type`, `status`, `public`, `user_id`, `resources_order`, `open_type`, `origin`, `back_origin`, `verify`, `verify_id`, `remark`, `update_time`, `delete_time`) VALUES
(1, 0, 1, '考勤', '', '', 1, 1, 0, 2, 0, 0, 'Tableau', 'Tableau', 0, NULL, NULL, '2019-08-23 03:58:52', NULL),
(2, 0, 1, '人事', '', '', 1, 1, 0, 2, 0, 0, 'Tableau', 'Tableau', 0, NULL, NULL, '2019-08-23 06:11:18', NULL),
(3, 0, 1, '销售', '', '', 1, 1, 0, 2, 0, 0, 'Tableau', 'Tableau', 0, NULL, NULL, '2019-08-23 06:13:20', NULL),
(4, 0, 1, '安保', '', '', 1, 1, 0, 2, 0, 0, 'Tableau', 'Tableau', 0, NULL, NULL, '2019-08-23 06:18:48', NULL),
(9, 1, 1, '出差', '', '', 2, 1, 0, 2, 0, 0, 'Tableau', 'Tableau', 0, NULL, NULL, '2019-08-23 06:33:57', NULL),
(8, 1, 1, '请假', '', '', 2, 1, 0, 2, 0, 0, 'Tableau', 'Tableau', 0, NULL, NULL, '2019-08-23 06:33:52', NULL),
(10, 1, 1, '加班', '', '', 2, 1, 0, 2, 0, 0, 'Tableau', 'Tableau', 0, NULL, NULL, '2019-08-23 06:34:04', NULL),
(11, 2, 1, '转正', '', '', 2, 1, 0, 2, 0, 0, 'Tableau', 'Tableau', 0, NULL, NULL, '2019-08-23 06:35:47', NULL),
(12, 2, 1, '调动', '', '', 2, 1, 0, 2, 0, 0, 'Tableau', 'Tableau', 0, NULL, NULL, '2019-08-23 06:35:53', '2019-08-23 09:40:27'),
(13, 2, 1, '离职', '', '', 2, 1, 0, 2, 0, 0, 'Tableau', 'Tableau', 0, NULL, NULL, '2019-08-23 06:36:00', NULL),
(14, 9, 1, '出差记录', '', '', 3, 1, 0, 2, 0, 0, 'Tableau', 'Tableau', 0, NULL, NULL, '2019-08-23 06:37:05', NULL),
(15, 9, 1, '出差申请', '', '', 3, 1, 0, 2, 0, 0, 'Tableau', 'Tableau', 0, NULL, NULL, '2019-08-23 06:37:10', NULL),
(16, 9, 1, '出差报告', '', '', 3, 0, 0, 2, 0, 0, 'Tableau', 'Tableau', 0, NULL, NULL, '2019-08-23 06:37:40', NULL),
(17, 8, 1, '可用假期查询', '', '', 3, 1, 0, 2, 0, 0, 'Tableau', 'Tableau', 0, NULL, NULL, '2019-08-23 06:39:18', NULL),
(18, 8, 1, '请休假申请', '', '', 3, 1, 0, 2, 0, 0, 'Tableau', 'Tableau', 0, NULL, NULL, '2019-08-23 06:39:30', NULL),
(19, 8, 1, '销假申请', '', '', 3, 1, 0, 2, 0, 0, 'Tableau', 'Tableau', 0, NULL, NULL, '2019-08-23 06:39:43', NULL),
(20, 3, 1, '售前', '', '', 2, 1, 0, 2, 0, 0, 'Tableau', 'Tableau', 0, NULL, NULL, '2019-08-23 08:43:59', NULL),
(21, 3, 1, '售后', '', '', 2, 1, 0, 2, 0, 0, 'Tableau', 'Tableau', 0, NULL, NULL, '2019-08-23 08:44:24', NULL),
(22, 3, 1, '客户', '', '', 2, 1, 0, 2, 0, 0, 'Tableau', 'Tableau', 0, NULL, NULL, '2019-08-23 08:55:09', NULL),
(23, 22, 1, '新客户统计', 'https://www.sina.com.cn/', '', 3, 1, 1, 2, 0, 0, '其他系统', 'Tableau', 0, NULL, NULL, '2019-08-23 09:26:18', NULL),
(24, 22, 1, '老客户统计', 'https://www.baidu.com/', '', 3, 1, 1, 2, 0, 0, '其他系统', 'Tableau', 0, NULL, NULL, '2019-08-23 08:56:39', NULL),
(27, 20, 1, '售前培训', 'https://cn.vuejs.org/v2/guide/team.html', '', 3, 1, 0, 2, 0, 0, 'Tableau', 'Tableau', 0, NULL, NULL, '2019-08-27 11:23:20', NULL),
(26, 20, 1, '售前统计', 'https://cn.vuejs.org', '', 3, 1, 0, 2, 0, 0, 'Tableau', 'Tableau', 0, NULL, NULL, '2019-08-27 11:22:50', NULL),
(28, 21, 1, '售后培训', 'https://cn.vuejs.org/v2/guide/team.html', '', 3, 1, 0, 2, 0, 0, 'Tableau', 'Tableau', 0, NULL, NULL, '2019-08-27 11:23:30', NULL),
(29, 11, 1, '转正申请', 'https://developers.weixin.qq.com/miniprogram/dev/api/', '', 3, 1, 0, 1, 0, 0, 'Tableau', 'Tableau', 0, NULL, NULL, '2019-08-29 02:06:36', NULL),
(30, 13, 1, '离职申请', 'https://man.linuxde.net/', '', 3, 1, 0, 1, 0, 0, 'Tableau', 'Tableau', 0, NULL, NULL, '2019-08-29 02:07:00', NULL),
(31, 13, 1, '离职人员记录', 'https://translate.google.cn/', '', 3, 1, 0, 1, 0, 0, 'Tableau', 'Tableau', 0, NULL, NULL, '2019-08-29 02:07:19', NULL),
(32, 4, 1, '人员访问', '', '', 2, 1, 0, 1, 0, 0, 'Tableau', 'Tableau', 0, NULL, NULL, '2019-08-29 02:12:00', NULL),
(33, 4, 1, '巡更', '', '', 2, 1, 0, 1, 0, 0, 'Tableau', 'Tableau', 0, NULL, NULL, '2019-08-29 02:13:11', NULL),
(34, 32, 1, '人员访问登记', 'https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Array', '', 3, 1, 0, 1, 0, 0, 'Tableau', 'Tableau', 0, NULL, NULL, '2019-08-29 02:13:38', NULL),
(35, 32, 1, '黑名单', 'http://es6.ruanyifeng.com/#docs/intro', '', 3, 1, 0, 1, 0, 0, 'Tableau', 'Tableau', 0, NULL, NULL, '2019-08-29 02:13:57', NULL),
(36, 33, 1, '巡更记录', 'http://es6.ruanyifeng.com/#docs/intro', '', 3, 1, 0, 1, 0, 0, 'Tableau', 'Tableau', 0, NULL, NULL, '2019-08-29 02:14:19', NULL),
(37, 33, 1, '巡更排班', 'https://github.com/demopark/sequelize-docs-Zh-CN', '', 3, 1, 0, 1, 0, 0, 'Tableau', 'Tableau', 0, NULL, NULL, '2019-08-29 02:14:40', NULL),
(38, 0, 1, '财务', '', '', 1, 1, 0, 1, 0, 0, 'Tableau', 'Tableau', 0, NULL, NULL, '2019-08-29 07:27:31', NULL),
(39, 38, 1, '借款', '', '', 2, 1, 0, 1, 0, 0, 'Tableau', 'Tableau', 0, NULL, NULL, '2019-08-29 07:27:53', NULL),
(40, 38, 1, '收款', '', '', 2, 1, 0, 1, 0, 0, 'Tableau', 'Tableau', 0, NULL, NULL, '2019-08-29 07:28:03', NULL),
(41, 39, 1, '借款流程说明', 'https://www.slimframework.com/', '', 3, 1, 0, 1, 0, 0, 'Tableau', 'Tableau', 0, NULL, NULL, '2019-08-29 07:28:36', NULL),
(42, 39, 1, '借款记录', 'https://www.kancloud.cn/manual/thinkphp5_1/353946', '', 3, 1, 0, 1, 0, 0, 'Tableau', 'Tableau', 0, NULL, NULL, '2019-08-29 07:28:56', NULL),
(43, 39, 1, '申请还款', 'https://threejs.org/docs/#api/zh/core/Object3D', '', 3, 1, 0, 1, 0, 0, 'Tableau', 'Tableau', 0, NULL, NULL, '2019-08-29 07:29:29', NULL),
(44, 40, 1, '收款流程说明', 'http://www.ruanyifeng.com/blog/2016/10/npm_scripts.html', '', 3, 1, 0, 1, 0, 0, 'Tableau', 'Tableau', 0, NULL, NULL, '2019-08-29 07:29:55', NULL),
(45, 40, 1, '收款记录', 'https://blog.csdn.net/lv18092081172/article/details/52081859', '', 3, 1, 0, 1, 0, 0, 'Tableau', 'Tableau', 0, NULL, NULL, '2019-08-29 07:30:11', NULL),
(46, 3, 1, '销售合同', '', '', 2, 1, 0, 1, 0, 0, 'Tableau', 'Tableau', 0, NULL, NULL, '2019-08-29 07:32:50', NULL),
(47, 46, 1, '销售合同统计', 'https://www.freecodecamp.cn/challenges/return-largest-numbers-in-arrays', '', 3, 1, 0, 1, 0, 0, 'Tableau', 'Tableau', 0, NULL, NULL, '2019-08-29 07:33:28', NULL),
(48, 46, 1, '大金额合同管理', 'https://querylist.cc/', '', 3, 1, 0, 1, 0, 0, 'Tableau', 'Tableau', 0, NULL, NULL, '2019-08-29 07:33:54', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `theme_id` int(11) NOT NULL COMMENT '所属主题ID',
  `role_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '角色名称',
  `role_desc` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '角色描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用',
  `role_group` tinyint(1) NOT NULL DEFAULT '0' COMMENT '前/后台角色',
  `remark` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `update_time` datetime NOT NULL,
  `delete_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `role`
--

INSERT INTO `role` (`id`, `theme_id`, `role_name`, `role_desc`, `status`, `role_group`, `remark`, `update_time`, `delete_time`) VALUES
(9, 1, '普通', '增加、修改、删除用户', 1, 1, NULL, '2019-09-02 00:15:17', NULL),
(3, 1, '考勤专员', '管理考勤业务', 1, 0, NULL, '2019-08-26 05:50:19', NULL),
(4, 1, '招聘专员', '管理招聘、入职', 1, 0, NULL, '2019-08-26 05:51:13', NULL),
(5, 1, 'HR经理', '统管人资事务', 1, 0, NULL, '2019-08-26 05:51:35', NULL),
(6, 1, '销售专员', '负责售前、售后', 1, 0, NULL, '2019-08-27 11:14:58', NULL),
(7, 1, '保安队长', '负责安保，巡逻', 1, 0, NULL, '2019-08-29 02:15:09', NULL),
(8, 1, '销售经理', '主管销售所有相关事务', 1, 0, NULL, '2019-08-29 07:32:16', NULL),
(11, 1, '超级管理员', '所有权限', 1, 1, NULL, '2019-08-30 06:20:32', NULL),
(12, 1, '一级管理员', '添加一级菜单、二级菜单、三级菜单', 1, 1, NULL, '2019-09-02 00:15:58', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `role_access`
--

DROP TABLE IF EXISTS `role_access`;
CREATE TABLE IF NOT EXISTS `role_access` (
  `role_id` int(11) NOT NULL,
  `access_id` int(11) NOT NULL,
  KEY `role_id` (`role_id`),
  KEY `access_id` (`access_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `role_access`
--

INSERT INTO `role_access` (`role_id`, `access_id`) VALUES
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(9, 1),
(9, 15),
(9, 14),
(9, 13),
(9, 12),
(9, 16),
(9, 17),
(9, 18),
(9, 11),
(11, 1),
(11, 2),
(11, 3),
(11, 4),
(11, 5),
(11, 6),
(11, 7),
(11, 8),
(11, 9),
(11, 10),
(11, 11),
(11, 12),
(11, 13),
(11, 14),
(11, 15),
(11, 16),
(11, 17),
(11, 18),
(12, 1),
(12, 2),
(12, 3),
(12, 4),
(12, 5),
(12, 6),
(12, 7),
(12, 8),
(12, 10),
(12, 9);

-- --------------------------------------------------------

--
-- 表的结构 `role_resources`
--

DROP TABLE IF EXISTS `role_resources`;
CREATE TABLE IF NOT EXISTS `role_resources` (
  `resources_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  KEY `resources_id` (`resources_id`),
  KEY `role_id` (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `role_resources`
--

INSERT INTO `role_resources` (`resources_id`, `role_id`) VALUES
(29, 4),
(11, 4),
(2, 4),
(31, 4),
(30, 4),
(13, 4),
(1, 3),
(19, 3),
(18, 3),
(17, 3),
(8, 3),
(3, 6),
(28, 6),
(21, 6),
(4, 7),
(32, 7),
(34, 7),
(35, 7),
(33, 7),
(36, 7),
(37, 7),
(1, 5),
(9, 5),
(14, 5),
(15, 5),
(16, 5),
(8, 5),
(17, 5),
(18, 5),
(19, 5),
(10, 5),
(2, 5),
(11, 5),
(29, 5),
(13, 5),
(30, 5),
(31, 5),
(3, 8),
(20, 8),
(27, 8),
(26, 8),
(21, 8),
(28, 8),
(22, 8),
(23, 8),
(24, 8),
(46, 8),
(47, 8),
(48, 8),
(26, 6),
(27, 6),
(20, 6);

-- --------------------------------------------------------

--
-- 表的结构 `theme`
--

DROP TABLE IF EXISTS `theme`;
CREATE TABLE IF NOT EXISTS `theme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `theme_name` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '主题名称',
  `department` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '部门',
  `manager` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '管理员ID',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用',
  `remark` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `update_time` datetime NOT NULL,
  `delete_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `theme`
--

INSERT INTO `theme` (`id`, `theme_name`, `department`, `manager`, `status`, `remark`, `update_time`, `delete_time`) VALUES
(1, '主题一', '部门一', '1', 1, NULL, '2019-08-21 07:11:40', NULL),
(2, '主题二', '部门二', '1', 1, NULL, '2019-08-21 07:14:49', NULL),
(3, '主题三', '部门三', '1', 1, NULL, '2019-08-21 07:15:00', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_no` int(11) NOT NULL COMMENT '工号',
  `user_name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '用户名',
  `email` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '邮箱',
  `password` char(32) COLLATE utf8_bin DEFAULT NULL COMMENT '密码',
  `department` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '部门',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用',
  `last_login` datetime DEFAULT NULL COMMENT '最后登录时间',
  `update_time` datetime NOT NULL,
  `delete_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`id`, `user_no`, `user_name`, `email`, `password`, `department`, `status`, `last_login`, `update_time`, `delete_time`) VALUES
(2, 10000001, 'biu~ 巴拉巴拉小魔仙', 'balabala@abc.com', 'e10adc3949ba59abbe56e057f20f883e', '部门一', 1, NULL, '2019-08-22 07:35:40', NULL),
(3, 10000002, '咻咻~', 'xiuxiu@abc.com', 'e10adc3949ba59abbe56e057f20f883e', '开发部', 1, NULL, '2019-08-30 02:10:31', NULL),
(4, 10000003, '哗啦哗啦~', 'hualahuala@abc.com', 'e10adc3949ba59abbe56e057f20f883e', '人事部', 1, NULL, '2019-08-26 08:23:59', NULL),
(5, 10000000, '猫王！', 'cat@abc.com', 'e10adc3949ba59abbe56e057f20f883e', '人事部', 1, NULL, '2019-08-28 02:52:09', NULL),
(6, 10000004, '销售老王', 'wang@abc.com', 'e10adc3949ba59abbe56e057f20f883e', '采购部', 1, NULL, '2019-08-29 07:35:20', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `user_resources`
--

DROP TABLE IF EXISTS `user_resources`;
CREATE TABLE IF NOT EXISTS `user_resources` (
  `user_id` int(11) NOT NULL,
  `resources_id` int(11) NOT NULL,
  KEY `user_id` (`user_id`),
  KEY `resources_id` (`resources_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `user_resources`
--

INSERT INTO `user_resources` (`user_id`, `resources_id`) VALUES
(3, 13),
(3, 29),
(3, 11),
(3, 2),
(3, 10),
(3, 19),
(2, 33),
(2, 32),
(2, 4),
(2, 1),
(2, 37),
(2, 34),
(2, 24),
(2, 23),
(2, 22),
(2, 28),
(2, 21),
(3, 18),
(3, 17),
(3, 8),
(3, 16),
(3, 15),
(3, 14),
(3, 9),
(3, 1),
(2, 26),
(2, 27),
(2, 20),
(2, 3),
(2, 10),
(2, 16),
(2, 15),
(2, 14),
(2, 9),
(3, 30),
(3, 31),
(3, 4),
(3, 32),
(3, 34),
(3, 35),
(3, 33),
(3, 36),
(3, 37);

-- --------------------------------------------------------

--
-- 表的结构 `user_role`
--

DROP TABLE IF EXISTS `user_role`;
CREATE TABLE IF NOT EXISTS `user_role` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  KEY `user_id` (`user_id`),
  KEY `role_id` (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `user_role`
--

INSERT INTO `user_role` (`user_id`, `role_id`) VALUES
(2, 7),
(3, 7),
(3, 5),
(2, 6);

-- --------------------------------------------------------

--
-- 表的结构 `user_theme`
--

DROP TABLE IF EXISTS `user_theme`;
CREATE TABLE IF NOT EXISTS `user_theme` (
  `user_id` int(11) NOT NULL,
  `theme_id` int(11) NOT NULL,
  KEY `user_id` (`user_id`),
  KEY `theme_id` (`theme_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `user_theme`
--

INSERT INTO `user_theme` (`user_id`, `theme_id`) VALUES
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
