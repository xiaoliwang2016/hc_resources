-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- 主机： 127.0.0.1:3306
-- 生成日期： 2019-08-09 09:41:04
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
  `pid` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '名称',
  `menu_name` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '菜单显示名称',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '菜单/按钮',
  `level` tinyint(4) DEFAULT NULL COMMENT '一级/二级菜单',
  `url` varchar(150) COLLATE utf8_bin DEFAULT NULL COMMENT '访问地址',
  `update_time` datetime NOT NULL,
  `delete_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

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
  `type` smallint(6) NOT NULL COMMENT '一级/二级/三级菜单',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用',
  `public` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否公开',
  `user_id` int(11) NOT NULL COMMENT '创建者ID',
  `resources_order` smallint(6) NOT NULL DEFAULT '0' COMMENT '排序',
  `open_type` int(11) NOT NULL DEFAULT '0' COMMENT '当前窗口/新窗口',
  `origin` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '来源',
  `verify` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否需要登录',
  `verify_id` int(11) DEFAULT NULL COMMENT '登录账号',
  `remark` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `update_time` datetime NOT NULL COMMENT '修改日期',
  `delete_time` datetime DEFAULT NULL COMMENT '软删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

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
  `super` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为超管',
  `user_group` tinyint(4) NOT NULL COMMENT '前/后/前后台用户',
  `last_login` datetime DEFAULT NULL COMMENT '最后登录时间',
  `update_time` datetime NOT NULL,
  `delete_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- 表的结构 `user_access`
--

DROP TABLE IF EXISTS `user_access`;
CREATE TABLE IF NOT EXISTS `user_access` (
  `user_id` int(11) NOT NULL,
  `access_id` int(11) NOT NULL,
  KEY `user_id` (`user_id`),
  KEY `access_id` (`access_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
