-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- 主机： 127.0.0.1:3306
-- 生成日期： 2019-08-23 09:48:43
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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

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
(1, 4, 1),
(1, 7, 1),
(1, 10, 1),
(1, 3, 2),
(1, 4, 2),
(1, 6, 2),
(1, 7, 2),
(1, 9, 2),
(1, 10, 2);

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
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

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
(24, 22, 1, '老客户统计', 'https://www.baidu.com/', '', 3, 1, 1, 2, 0, 0, '其他系统', 'Tableau', 0, NULL, NULL, '2019-08-23 08:56:39', NULL);

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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `role`
--

INSERT INTO `role` (`id`, `theme_id`, `role_name`, `role_desc`, `status`, `role_group`, `remark`, `update_time`, `delete_time`) VALUES
(1, 1, '主题一后台角色一', NULL, 1, 1, NULL, '2019-08-21 07:36:53', NULL),
(2, 1, '主题一后台角色二', NULL, 1, 1, NULL, '2019-08-21 07:37:05', NULL);

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
(1, 9);

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

-- --------------------------------------------------------

--
-- 表的结构 `theme`
--

DROP TABLE IF EXISTS `theme`;
CREATE TABLE IF NOT EXISTS `theme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `theme_name` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '主题名称',
  `department` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '部门',
  `manager_id` int(11) NOT NULL COMMENT '管理员ID',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用',
  `remark` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `update_time` datetime NOT NULL,
  `delete_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `theme`
--

INSERT INTO `theme` (`id`, `theme_name`, `department`, `manager_id`, `status`, `remark`, `update_time`, `delete_time`) VALUES
(1, '主题一', '部门一', 1, 1, NULL, '2019-08-21 07:11:40', NULL),
(2, '主题二', '部门二', 1, 1, NULL, '2019-08-21 07:14:49', NULL),
(3, '主题三', '部门三', 1, 1, NULL, '2019-08-21 07:15:00', NULL);

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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`id`, `user_no`, `user_name`, `email`, `password`, `department`, `status`, `last_login`, `update_time`, `delete_time`) VALUES
(2, 10000001, 'biu~ 巴拉巴拉小魔仙', 'balabala@abc.com', 'e10adc3949ba59abbe56e057f20f883e', '部门一', 1, NULL, '2019-08-22 07:35:40', NULL);

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
(2, 1);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
