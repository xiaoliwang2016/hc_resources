-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- 主机： 127.0.0.1:3306
-- 生成日期： 2019-09-27 10:24:43
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
(5, 'edit_resources', '编辑菜单', 1, '/admin/resources/edit', '2019-08-14 07:28:31', NULL),
(8, 'delete_resources', '删除菜单', 1, '/admin/resources/delete', '2019-08-14 07:29:18', NULL),
(11, 'list_user', '查看所有成员', 0, NULL, '2019-08-14 07:31:48', NULL),
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
  `user_no` char(8) COLLATE utf8_bin NOT NULL COMMENT '工号',
  `user_name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '用户名',
  `department_desc` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `company` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `company_desc` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `job` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `job_desc` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '邮箱',
  `department` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '部门',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用',
  `super` tinyint(1) NOT NULL DEFAULT '0' COMMENT '超级管理员',
  `last_login` datetime DEFAULT NULL COMMENT '最后登录时间',
  `update_time` datetime DEFAULT NULL,
  `delete_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `admin`
--

INSERT INTO `admin` (`id`, `user_no`, `user_name`, `department_desc`, `company`, `company_desc`, `job`, `job_desc`, `email`, `department`, `status`, `super`, `last_login`, `update_time`, `delete_time`) VALUES
(1, 'admin', '超级管理员', NULL, NULL, NULL, NULL, NULL, NULL, '', 1, 1, NULL, NULL, NULL),
(2, '10105', '代青', '人力资源中心', '1000', '虎彩印艺股份有限公司', '20100086', '薪酬福利经理', NULL, '0', 1, 0, NULL, '2019-09-11 01:35:36', NULL),
(3, '9034021', '何帅', NULL, '1020', '山东虎彩泰山印刷有限公司', '20700064', '翻版设计', NULL, '10700040', 1, 0, NULL, '2019-09-18 07:22:56', NULL);

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
(2, 5, 3),
(2, 4, 3),
(2, 3, 3),
(2, 2, 3),
(2, 1, 3),
(2, 8, 3);

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
(2, 2),
(2, 3),
(3, 6);

-- --------------------------------------------------------

--
-- 表的结构 `employee`
--

DROP TABLE IF EXISTS `employee`;
CREATE TABLE IF NOT EXISTS `employee` (
  `PERNR` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '工号',
  `COME_DATE` date DEFAULT NULL COMMENT '入职日期',
  `LEAVE_DATE` date DEFAULT NULL COMMENT '离职日期',
  `SNAME` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '姓名',
  `ABKRS` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '工资范围',
  `ABKRS_DESC` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '工资范围名称',
  `ANSVH` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '计薪方式',
  `ANSVH_DESC` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '计薪方式名称',
  `KOSTL` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '成本中心',
  `KOSTL_DESC` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '成本中心名称',
  `ZZ_POSLV` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '职级',
  `ZZ_POSLV_DESC` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '职级名称',
  `ZZ_ZWXZ` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '职衔',
  `ZZ_ZWXZ_DESC` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '职衔名称',
  `ZZ_YWXZ` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '人工成本归集',
  `ZZ_YWXZ_DESC` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '人工成本归集名称',
  `PERSG` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '员工组',
  `PERSG_DESC` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '员工组名称',
  `PERSK` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '员工子组',
  `PERSK_DESC` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '员工子组名称',
  `VDSK1` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '工作所在地',
  `VDSK1_DESC` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '工作所在地名称',
  `BTRTL` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '人事子范围',
  `BTRTL_DESC` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '人事子范围名称',
  `BUKRS` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '公司',
  `BUKRS_DESC` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '公司名称',
  `WERKS` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '人事范围',
  `WERKS_DESC` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '人事范围名称',
  `PLANS` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '职位',
  `PLANS_DESC` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '职位名称',
  `ORGEH` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '组织单位',
  `ORGEH_DESC` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '组织单位名称',
  `STELL` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '职务',
  `STELL_DESC` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '职务名称',
  `ZZ_SJDW` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '中心',
  `ZZ_SJDW_DESC` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '中心名称',
  `ZZ_SIJI` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '部门',
  `ZZ_SIJI_DESC` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '部门名称',
  `DATA_SOURCE` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '数据源',
  `DATA_SOURCE_ACCOUNT` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'ETL源端账户',
  `ETL_CREATE_DATE` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'ETL数据创建时间',
  `ETL_LASTUP_DATE` datetime DEFAULT NULL COMMENT '最后更新ETL数据修改时间',
  PRIMARY KEY (`PERNR`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='数据仓库员工信息表';

--
-- 转存表中的数据 `employee`
--

INSERT INTO `employee` (`PERNR`, `COME_DATE`, `LEAVE_DATE`, `SNAME`, `ABKRS`, `ABKRS_DESC`, `ANSVH`, `ANSVH_DESC`, `KOSTL`, `KOSTL_DESC`, `ZZ_POSLV`, `ZZ_POSLV_DESC`, `ZZ_ZWXZ`, `ZZ_ZWXZ_DESC`, `ZZ_YWXZ`, `ZZ_YWXZ_DESC`, `PERSG`, `PERSG_DESC`, `PERSK`, `PERSK_DESC`, `VDSK1`, `VDSK1_DESC`, `BTRTL`, `BTRTL_DESC`, `BUKRS`, `BUKRS_DESC`, `WERKS`, `WERKS_DESC`, `PLANS`, `PLANS_DESC`, `ORGEH`, `ORGEH_DESC`, `STELL`, `STELL_DESC`, `ZZ_SJDW`, `ZZ_SJDW_DESC`, `ZZ_SIJI`, `ZZ_SIJI_DESC`, `DATA_SOURCE`, `DATA_SOURCE_ACCOUNT`, `ETL_CREATE_DATE`, `ETL_LASTUP_DATE`) VALUES
('9034021', '2013-05-06', '9999-12-31', '何帅', '鲁3', NULL, '2', NULL, '1020301002', NULL, 'E', NULL, 'T21', NULL, '1', NULL, 'A', NULL, 'Z2', NULL, '1020', NULL, '1020', NULL, '1020', '山东虎彩泰山印刷有限公司', '1020', '1020', '20700064', '翻版设计', '10700042', '技术处', '30700039', '翻版设计', '0', '印前管理部', '10700040', NULL, NULL, NULL, NULL, NULL),
('9060479', '2017-12-29', '9999-12-31', '邓志雄', '莞1', NULL, '1', NULL, '1000101402', NULL, 'C', NULL, 'P41', NULL, '2', NULL, 'A', NULL, 'Z3', NULL, '1000', NULL, '1000', NULL, '1000', '虎彩印艺股份有限公司', '1000', '1000', '50094640', '资深企业架构师', '50094626', '信息管理部', '50094639', '资深企业架构师', '10100037', '信息管理部', '50094626', '信息与数字化中心', NULL, NULL, NULL, NULL),
('9068050', '2019-08-02', '9999-12-31', '王园', '莞3', NULL, '1', NULL, '1000301004', NULL, 'F', NULL, 'O32', NULL, '1', NULL, 'A', NULL, 'Z6', NULL, '1002', NULL, '1002', NULL, '1000', '虎彩印艺股份有限公司', '1002', '1000', '20300944', '发外彩盒QA', '10300025', '外协板块', '30300160', '发外彩盒QA', '0', '品管部', '10300020', NULL, NULL, NULL, NULL, NULL),
('10105', '2001-05-30', '9999-12-31', '代青', '莞1', NULL, '1', NULL, '1000101301', NULL, 'C', NULL, 'P41', NULL, '2', NULL, 'A', NULL, 'Z3', NULL, '1000', NULL, '1000', NULL, '1000', '虎彩印艺股份有限公司', '1000', '1000', '20100086', '薪酬福利经理', '10100026', '人力资源中心', '30100072', '薪酬福利经理', '10100026', NULL, '0', '人力资源中心', NULL, NULL, NULL, NULL),
('9057088', '2017-07-01', '9999-12-31', '张保全', '津1', NULL, '1', NULL, '1090101001', NULL, 'B', NULL, 'M31', NULL, '2', NULL, 'A', NULL, 'Z2', NULL, '1090', NULL, '1090', NULL, '1090', '东莞虎彩三维科技有限公司', '1090', '1090', '25001500', '技术总监', '50096302', '3D创意设计部', '35000657', '技术总监', '0', '3D创意设计部', '50096302', NULL, NULL, NULL, NULL, NULL),
('40297', '2004-07-30', '9999-12-31', '侯文斌', '莞3', NULL, '1', NULL, '1000301007', NULL, 'D', NULL, 'T31', NULL, '2', NULL, 'A', NULL, 'Z2', NULL, '1002', NULL, '1002', NULL, '1000', '虎彩印艺股份有限公司', '1002', '1000', '20300036', '内销产品工程师', '10300006', '内销产品板块', '30300024', '内销产品工程师', '0', '技术部', '10300003', NULL, NULL, NULL, NULL, NULL),
('9048750', '2016-02-25', '9999-12-31', '杨健恒', '绍3', NULL, '1', NULL, '1010101004', NULL, 'G', NULL, 'A21', NULL, '2', NULL, 'A', NULL, 'Z5', NULL, '1010', NULL, '1010', NULL, '1010', '绍兴虎彩激光材料科技有限公司', '1010', '1010', '20620650', '厨师', '10600031', '绍兴虎彩总务处', '30600325', '厨师', '0', '绍兴虎彩人力资源部', '10600030', NULL, NULL, NULL, NULL, NULL),
('9034587', '2013-08-02', '9999-12-31', '凌华胜', '莞3', NULL, '1', NULL, '1000301002', NULL, 'E', NULL, 'O42', NULL, '1', NULL, 'A', NULL, 'Z6', NULL, '1002', NULL, '1002', NULL, '1000', '虎彩印艺股份有限公司', '1002', '1000', '20300458', '雕版师', '10300019', '自烫板块', '30300122', '雕版师', '0', '印后部', '10300017', NULL, NULL, NULL, NULL, NULL),
('9030539', '2012-06-20', '9999-12-31', '王陈光', '莞3', NULL, '3', NULL, '1000302212', NULL, 'F', NULL, 'O31', NULL, '1', NULL, 'A', NULL, 'Z6', NULL, '1002', NULL, '1002', NULL, '1000', '虎彩印艺股份有限公司', '1002', '1000', '20300407', '过胶机长', '10300019', '自烫板块', '30300116', '过胶机长', '0', '印后部', '10300017', NULL, NULL, NULL, NULL, NULL),
('9068325', '2019-09-02', '9999-12-31', '徐立法', '鲁3', NULL, '3', NULL, '1020302002', NULL, 'G', NULL, 'O21', NULL, '1', NULL, 'A', NULL, 'Z6', NULL, '1020', NULL, '1020', NULL, '1020', '山东虎彩泰山印刷有限公司', '1020', '1020', '20700120', '八色机副手', '10700051', '印刷车间', '30700071', '八色机副手', '0', '生产部', '10700050', NULL, NULL, NULL, NULL, NULL),
('9068244', '2019-09-01', '9999-12-31', '王官宏', '影3', NULL, '1', NULL, '3000301001', NULL, 'Z', NULL, 'Z11', NULL, '4', NULL, 'G', NULL, 'Z8', NULL, '3000', NULL, '3000', NULL, '3000', '广东虎彩影像有限公司', '3000', '3000', '25001057', '实习生', '12100150', '影像生产部', '35000387', '实习生', '0', '影像生产部', '12100150', NULL, NULL, NULL, NULL, NULL),
('9068332', '2019-09-03', '9999-12-31', '陈双', '莞3', NULL, '1', NULL, '1000302214', NULL, 'G', NULL, 'O21', NULL, '1', NULL, 'A', NULL, 'Z6', NULL, '1002', NULL, '1002', NULL, '1000', '虎彩印艺股份有限公司', '1002', '1000', '25001457', '劳务工', '10300027', '装配处', '35000627', '劳务工', '0', '装配处', '10300027', NULL, NULL, NULL, NULL, NULL),
('9038874', '2014-06-24', '9999-12-31', '侯晓泰', '莞3', NULL, '3', NULL, '1000302104', NULL, 'E', NULL, 'O41', NULL, '1', NULL, 'A', NULL, 'Z6', NULL, '1002', NULL, '1002', NULL, '1000', '虎彩印艺股份有限公司', '1002', '1000', '20300150', '高级胶印助手', '10300014', '胶印板块', '30300069', '高级胶印助手', '0', '印刷部', '10300013', NULL, NULL, NULL, NULL, NULL),
('9068280', '2019-09-02', '9999-12-31', '何国味', '莞5', NULL, '1', NULL, '1000303001', NULL, 'Z', NULL, 'Z11', NULL, '4', NULL, 'G', NULL, 'Z8', NULL, '1006', NULL, '1006', NULL, '1000', '虎彩印艺股份有限公司', '1006', '1000', '25001524', '实习生', '10300028', '数码包装部', '30100225', '实习生', '0', NULL, '0', NULL, NULL, NULL, NULL, NULL),
('9068329', '2019-09-03', '9999-12-31', '辛虹', '莞3', NULL, '1', NULL, '1000302214', NULL, 'G', NULL, 'O21', NULL, '1', NULL, 'C', NULL, 'Z6', NULL, '1002', NULL, '1002', NULL, '1000', '虎彩印艺股份有限公司', '1002', '1000', '25001454', '劳务工', '10300027', '装配处', '35000627', '劳务工', '0', '装配处', '10300027', NULL, NULL, NULL, NULL, NULL),
('9059421', '2017-11-28', '9999-12-31', '黄英财', '影3', NULL, '3', NULL, '3000302025', NULL, 'E', NULL, 'O41', NULL, '1', NULL, 'A', NULL, 'Z6', NULL, '3000', NULL, '3000', NULL, '3000', '广东虎彩影像有限公司', '3000', '3000', '22110063', 'Hpindgo印刷机长', '12100154', '个性影像板块', '32100112', 'Hpindgo印刷机长', '0', '影像生产部', '12100150', NULL, NULL, NULL, NULL, NULL),
('9030197', '2012-05-08', '9999-12-31', '尹念桃', '莞4', NULL, '1', NULL, '1000101108', NULL, 'G', NULL, 'A21', NULL, '2', NULL, 'A', NULL, 'Z5', NULL, '1000', NULL, '1000', NULL, '1000', '虎彩印艺股份有限公司', '1000', '1000', '20100145', '厨工', '10100032', '总务处', '30100108', '厨工', '10100026', '人力资源共享服务部', '10100031', '人力资源中心', NULL, NULL, NULL, NULL),
('991319', '2009-02-10', '9999-12-31', '律光军', '鲁3', NULL, '3', NULL, '1020301006', NULL, 'F', NULL, 'O32', NULL, '1', NULL, 'A', NULL, 'Z6', NULL, '1020', NULL, '1020', NULL, '1020', '山东虎彩泰山印刷有限公司', '1020', '1020', '20700160', '手啤机', '10700052', '印后车间', '30700089', '手啤机', '0', '生产部', '10700050', NULL, NULL, NULL, NULL, NULL),
('960001', '1989-01-01', '9999-12-31', '陈成稳', '莞1', NULL, '1', NULL, '1000101102', NULL, 'A', NULL, 'M41', NULL, '2', NULL, 'A', NULL, 'Z1', NULL, '1000', NULL, '1000', NULL, '1000', '虎彩印艺股份有限公司', '1000', '1000', '20100000', '董事长', '1', '虎彩印艺股份有限公司', '30100000', '董事长', '0', NULL, '0', NULL, NULL, NULL, NULL, NULL),
('9039575', '2014-07-21', '9999-12-31', '陈海波', '莞1', NULL, '1', NULL, '1000101303', NULL, 'C', NULL, 'M21', NULL, '2', NULL, 'A', NULL, 'Z1', NULL, '1000', NULL, '1000', NULL, '1000', '虎彩印艺股份有限公司', '1000', '1000', '20100103', '招聘部经理', '10100030', '招聘部', '30100083', '招聘部经理', '10100026', '招聘部', '10100030', '人力资源中心', NULL, NULL, NULL, NULL),
('9065716', '2018-10-01', '9999-12-31', '陈亮', '亚2', NULL, '3', NULL, '3040302003', NULL, 'E', NULL, 'T21', NULL, '1', NULL, 'A', NULL, 'Z2', NULL, '3040', NULL, '3040', NULL, '3040', '三亚鲜檬摄影有限公司', '3040', '3040', '22500065', '摄影师', '12500004', '摄化部', '32500017', '摄影师', '0', '摄化部', '12500004', NULL, NULL, NULL, NULL, NULL),
('9022439', '2010-12-02', '9999-12-31', '朱本林', '莞5', NULL, '3', NULL, '1000302214', NULL, 'F', NULL, 'O21', NULL, '1', NULL, 'A', NULL, 'Z6', NULL, '1002', NULL, '1002', NULL, '1000', '虎彩印艺股份有限公司', '1002', '1000', '25000842', '手啤手烫机长', '10300027', '装配处', '35000341', '手啤手烫机长', '0', '装配处', '10300027', NULL, NULL, NULL, NULL, NULL),
('9039450', '2014-07-07', '9999-12-31', '刘响玲', '莞2', NULL, '3', NULL, '1060102002', NULL, 'D', NULL, 'T31', NULL, '1', NULL, 'A', NULL, 'Z2', NULL, '1060', NULL, '1060', NULL, '1060', '虎彩印艺股份有限公司东莞分公司', '1060', '1060', '25000003', '高级设计师', '50095308', '茶+日化组', '50095314', '高级设计师', '0', '设计部', '11100001', NULL, NULL, NULL, NULL, NULL),
('9022387', '2010-11-30', '9999-12-31', '严士来', '莞3', NULL, '1', NULL, '1000301007', NULL, 'D', NULL, 'T31', NULL, '2', NULL, 'A', NULL, 'Z2', NULL, '1002', NULL, '1002', NULL, '1000', '虎彩印艺股份有限公司', '1002', '1000', '20300043', '外销产品工程师', '10300007', '外销产品板块', '30300026', '外销产品工程师', '0', '技术部', '10300003', NULL, NULL, NULL, NULL, NULL),
('9065587', '2018-11-01', '9999-12-31', '彭贺龙', '莞1', NULL, '1', NULL, '1000101401', NULL, 'D', NULL, 'P31', NULL, '2', NULL, 'A', NULL, 'Z3', NULL, '1000', NULL, '1000', NULL, '1000', '虎彩印艺股份有限公司', '1000', '1000', '25000785', '高级数据工程师', '50095628', '数据开发部', '35000327', '高级数据工程师', '10100037', '数据开发部', '50095628', '信息与数字化中心', NULL, NULL, NULL, NULL),
('9067857', '2019-07-08', '9999-12-31', '魏雨柔', '莞4', NULL, '1', NULL, '1000101850', NULL, 'F', NULL, 'C11', NULL, '3', NULL, 'A', NULL, 'Z7', NULL, '1000', NULL, '1000', NULL, '1000', '虎彩印艺股份有限公司', '1000', '1000', '20100436', '大学生储备', '10100016', '品牌IP部', '30100226', '大学生储备', '0', '品牌IP部', '10100016', NULL, NULL, NULL, NULL, NULL),
('9067879', '2019-07-08', '9999-12-31', '王迎港', '传2', NULL, '1', NULL, '2030201001', NULL, 'F', NULL, 'C11', NULL, '3', NULL, 'A', NULL, 'Z7', NULL, '2030', NULL, '2030', NULL, '2030', '北京虎彩文化传播有限公司', '2030', '2030', '25001176', '大学生储备', '11700001', '总监办', '31400023', '大学生储备', '0', '总监办', '11700001', NULL, NULL, NULL, NULL, NULL),
('9067821', '2019-07-08', '9999-12-31', '莫宗儒', '莞4', NULL, '1', NULL, '1000101401', NULL, 'F', NULL, 'C11', NULL, '3', NULL, 'A', NULL, 'Z7', NULL, '1000', NULL, '1000', NULL, '1000', '虎彩印艺股份有限公司', '1000', '1000', '25001134', '大学生储备', '10100037', '信息与数字化中心', '30100226', '大学生储备', '10100037', NULL, '0', '信息与数字化中心', NULL, NULL, NULL, NULL),
('9062686', '2018-04-23', '9999-12-31', '佘卫丽', '莞1', NULL, '1', NULL, '1000101407', NULL, 'D', NULL, 'P31', NULL, '2', NULL, 'A', NULL, 'Z3', NULL, '1000', NULL, '1000', NULL, '1000', '虎彩印艺股份有限公司', '1000', '1000', '50094737', '高级软件开发工程师', '50094632', '系统开发组', '50094731', '高级软件开发工程师', '10100037', '创新研发部', '50094630', '信息与数字化中心', NULL, NULL, NULL, NULL),
('9044819', '2015-06-23', '9999-12-31', '詹洁锦', '广2', NULL, '1', NULL, '3030201003', NULL, 'D', NULL, 'P31', NULL, '2', NULL, 'A', NULL, 'Z3', NULL, '3030', NULL, '3030', NULL, '3030', '广州虎彩网络科技有限公司', '3030', '3030', '22400033', '高级设计师', '12400090', '设计部', '32400030', '高级设计师', '0', '设计部', '12400090', NULL, NULL, NULL, NULL, NULL),
('9056778', '2017-07-10', '9999-12-31', '黄建雄', '广2', NULL, '1', NULL, '3000201005', NULL, 'E', NULL, 'P21', NULL, '2', NULL, 'A', NULL, 'Z3', NULL, '3030', NULL, '3000', NULL, '3000', '广东虎彩影像有限公司', '3000', '3000', '50095017', '运营专员', '50095001', '檬粉俱乐部板块', '50095015', '运营专员', '0', '粉丝运营部', '50094946', NULL, NULL, NULL, NULL, NULL),
('9066176', '2018-11-27', '9999-12-31', '陈梓淇', '影2', NULL, '1', NULL, '3000201202', NULL, 'E', NULL, 'S31', NULL, '1', NULL, 'A', NULL, 'Z4', NULL, '3000', NULL, '3000', NULL, '3000', '广东虎彩影像有限公司', '3000', '3000', '50094926', '店员', '50094860', '西坪店', '50094925', '店员', '0', '新零售渠道', '12100090', NULL, NULL, NULL, NULL, NULL),
('9059369', '2017-11-23', '9999-12-31', '李振猛', '莞5', NULL, '3', NULL, '1000302214', NULL, 'F', NULL, 'O21', NULL, '1', NULL, 'A', NULL, 'Z6', NULL, '1002', NULL, '1002', NULL, '1000', '虎彩印艺股份有限公司', '1002', '1000', '25000842', '手啤手烫机长', '10300027', '装配处', '35000341', '手啤手烫机长', '0', '装配处', '10300027', NULL, NULL, NULL, NULL, NULL),
('9067364', '2019-03-12', '9999-12-31', '陈琨', '传2', NULL, '1', NULL, '2030201601', NULL, 'E', NULL, 'A42', NULL, '1', NULL, 'A', NULL, 'Z5', NULL, '2030', NULL, '2030', NULL, '2030', '北京虎彩文化传播有限公司', '2030', '2030', '21700045', '物流专员', '11700005', '物流客服部', '31700017', '物流专员', '0', '物流客服部', '11700005', NULL, NULL, NULL, NULL, NULL),
('9067370', '2019-03-11', '9999-12-31', '张炎平', '绍3', NULL, '1', NULL, '1010101004', NULL, 'E', NULL, 'P21', NULL, '2', NULL, 'A', NULL, 'Z3', NULL, '1010', NULL, '1010', NULL, '1010', '绍兴虎彩激光材料科技有限公司', '1010', '1010', '25000485', '招聘专员', '10600030', '绍兴虎彩人力资源部', '30600312', '招聘专员', '0', '绍兴虎彩人力资源部', '10600030', NULL, NULL, NULL, NULL, NULL),
('980123', '1998-09-07', '9999-12-31', '李萍', '莞3', NULL, '3', NULL, '1000302211', NULL, 'F', NULL, 'O31', NULL, '1', NULL, 'A', NULL, 'Z6', NULL, '1002', NULL, '1002', NULL, '1000', '虎彩印艺股份有限公司', '1002', '1000', '20300358', '糊盒机长', '10300019', '自烫板块', '30300108', '糊盒机长', '0', '印后部', '10300017', NULL, NULL, NULL, NULL, NULL),
('9059772', '2017-12-11', '9999-12-31', '刘敏', '影2', NULL, '1', NULL, '3000102003', NULL, 'E', NULL, 'T21', NULL, '2', NULL, 'A', NULL, 'Z2', NULL, '3000', NULL, '3000', NULL, '3000', '广东虎彩影像有限公司', '3000', '3000', '22100052', '助理拍摄工程师', '12100050', '摄影研发部', '32100033', '助理拍摄工程师', '0', '摄影研发部', '12100050', NULL, NULL, NULL, NULL, NULL),
('9057853', '2017-09-08', '9999-12-31', '张友高', '莞3', NULL, '1', NULL, '1000301002', NULL, 'G', NULL, 'O31', NULL, '1', NULL, 'A', NULL, 'Z6', NULL, '1002', NULL, '1002', NULL, '1000', '虎彩印艺股份有限公司', '1002', '1000', '20300467', '3D印刷助手', '10300019', '自烫板块', '30300126', '3D印刷助手', '0', '印后部', '10300017', NULL, NULL, NULL, NULL, NULL),
('9064046', '2018-07-23', '9999-12-31', '旷乐', '莞1', NULL, '1', NULL, '1000101202', NULL, 'C', NULL, 'P41', NULL, '2', NULL, 'A', NULL, 'Z3', NULL, '1000', NULL, '1000', NULL, '1000', '虎彩印艺股份有限公司', '1000', '1000', '25000868', '资深财务核算会计', '50095650', '经营核算模块', '35000347', '资深财务核算会计', '10100033', '东莞会计部', '50095569', '财务中心', NULL, NULL, NULL, NULL),
('50120', '2005-06-29', '9999-12-31', '李奎', '莞1', NULL, '3', NULL, '1000201199', NULL, 'D', NULL, 'S41', NULL, '1', NULL, 'A', NULL, 'Z4', NULL, '1000', NULL, '1005', NULL, '1000', '虎彩印艺股份有限公司', '1005', '1000', '20100327', '业务员', '10100046', '营销中心烟包组', '30100178', '业务员', '10100045', NULL, '0', '营销中心', NULL, NULL, NULL, NULL),
('9039522', '2014-07-18', '9999-12-31', '任文燕', '莞1', NULL, '1', NULL, '1000201001', NULL, 'D', NULL, 'M11', NULL, '2', NULL, 'A', NULL, 'Z1', NULL, '1000', NULL, '1005', NULL, '1000', '虎彩印艺股份有限公司', '1005', '1000', '20100347', '外销订单管理主任', '10100050', '业务发展部', '30100185', '外销订单管理主任', '10100045', '业务发展部', '10100050', '营销中心', NULL, NULL, NULL, NULL),
('9067930', '2019-07-17', '9999-12-31', '杨洋', '莞4', NULL, '3', NULL, '1000201004', NULL, 'F', NULL, 'T11', NULL, '1', NULL, 'A', NULL, 'Z2', NULL, '1000', NULL, '1005', NULL, '1000', '虎彩印艺股份有限公司', '1005', '1000', '25000111', '设计师', '50095340', '设计部3D+IT设计组', '35000016', '设计师', '10100045', '营销中心设计部', '50095335', '营销中心', NULL, NULL, NULL, NULL),
('9067157', '2019-02-20', '9999-12-31', '刘圆圆', '莞1', NULL, '1', NULL, '1000101405', NULL, 'C', NULL, 'P41', NULL, '2', NULL, 'A', NULL, 'Z3', NULL, '1000', NULL, '1000', NULL, '1000', '虎彩印艺股份有限公司', '1000', '1000', '50094696', '资深产品需求分析师', '50094629', '财务与供应链系统部', '50094695', '资深产品需求分析师', '10100037', '财务与供应链系统部', '50094629', '信息与数字化中心', NULL, NULL, NULL, NULL),
('9030158', '2012-05-03', '9999-12-31', '刘海林', '莞1', NULL, '3', NULL, '1000201004', NULL, 'D', NULL, 'T31', NULL, '1', NULL, 'A', NULL, 'Z2', NULL, '1000', NULL, '1005', NULL, '1000', '虎彩印艺股份有限公司', '1005', '1000', '25000063', 'CTP工程师', '50095337', '设计部工艺组', '35000006', 'CTP工程师', '10100045', '营销中心设计部', '50095335', '营销中心', NULL, NULL, NULL, NULL),
('9054826', '2017-03-27', '9999-12-31', '罗从瑞', '莞4', NULL, '1', NULL, '1000301003', NULL, 'D', NULL, 'T31', NULL, '2', NULL, 'A', NULL, 'Z2', NULL, '1002', NULL, '1002', NULL, '1000', '虎彩印艺股份有限公司', '1002', '1000', '25000747', '包装设备工程师', '10300010', '包装设备管理部', '35000313', '包装设备工程师', '0', '包装设备管理部', '10300010', NULL, NULL, NULL, NULL, NULL),
('9063231', '2018-06-05', '9999-12-31', '李超', '鲁3', NULL, '3', NULL, '1020302200', NULL, 'F', NULL, 'O32', NULL, '1', NULL, 'A', NULL, 'Z6', NULL, '1020', NULL, '1020', NULL, '1020', '山东虎彩泰山印刷有限公司', '1020', '1020', '50093124', '装配制作员（F级）', '10700053', '装配车间', '50093123', '装配制作员（F级）', '0', '生产部', '10700050', NULL, NULL, NULL, NULL, NULL),
('9031715', '2012-10-16', '9999-12-31', '冯英兰', '绍3', NULL, '3', NULL, '1010302115', NULL, 'F', NULL, 'O32', NULL, '1', NULL, 'A', NULL, 'Z6', NULL, '1010', NULL, '1010', NULL, '1010', '绍兴虎彩激光材料科技有限公司', '1010', '1010', '20680333', '横切机长', '10600097', '绍兴虎彩横切工序', '30600826', '横切机长', '0', '绍兴虎彩生产部', '10600090', NULL, NULL, NULL, NULL, NULL),
('9050866', '2016-08-17', '9999-12-31', '付泽江', '绍3', NULL, '1', NULL, '1010101004', NULL, 'G', NULL, 'A21', NULL, '2', NULL, 'A', NULL, 'Z5', NULL, '1010', NULL, '1010', NULL, '1010', '绍兴虎彩激光材料科技有限公司', '1010', '1010', '20620651', '厨师', '10600031', '绍兴虎彩总务处', '30600325', '厨师', '0', '绍兴虎彩人力资源部', '10600030', NULL, NULL, NULL, NULL, NULL),
('9063367', '2018-06-19', '9999-12-31', '黄海飞', '津1', NULL, '1', NULL, '1090302001', NULL, 'E', NULL, 'T21', NULL, '2', NULL, 'A', NULL, 'Z2', NULL, '1090', NULL, '1090', NULL, '1090', '东莞虎彩三维科技有限公司', '1090', '1090', '22700012', '荣彩3D制版技工', '12700003', '制版组', '32700006', '荣彩3D制版技工', '0', '运营部', '12700001', NULL, NULL, NULL, NULL, NULL),
('9051042', '2016-09-07', '9999-12-31', '王良', '鲁3', NULL, '3', NULL, '3020101001', NULL, 'G', NULL, 'O21', NULL, '1', NULL, 'A', NULL, 'Z6', NULL, '3020', NULL, '3020', NULL, '3020', '虎彩影像山东分公司', '3020', '3020', '25000224', '手工上壳员', '12300000', '山东影像', '35000070', '手工上壳员', '0', NULL, '0', NULL, NULL, NULL, NULL, NULL),
('9044596', '2015-06-18', '9999-12-31', '李生元', '青3', NULL, '1', NULL, '1000202002', NULL, 'D', NULL, 'T31', NULL, '2', NULL, 'A', NULL, 'Z2', NULL, '1030', NULL, '1004', NULL, '1000', '虎彩印艺股份有限公司', '1004', '1000', '20500029', '产品工程师', '10500007', '营销部', '30500019', '产品工程师', '10500000', '营销部', '10500007', '市场中心', NULL, NULL, NULL, NULL),
('9066235', '2018-11-22', '9999-12-31', '王三能', '亚2', NULL, '3', NULL, '?', NULL, 'E', NULL, 'T21', NULL, '1', NULL, 'F', NULL, 'Z2', NULL, '3040', NULL, '3040', NULL, '3040', '三亚鲜檬摄影有限公司', '3040', '3040', '99999999', NULL, '12500004', '摄化部', '0', NULL, '0', '摄化部', '12500004', NULL, NULL, NULL, NULL, NULL),
('9066240', '2018-11-27', '9999-12-31', '许彩霞', '亚2', NULL, '3', NULL, '?', NULL, 'E', NULL, 'S31', NULL, '1', NULL, 'F', NULL, 'Z4', NULL, '3040', NULL, '3040', NULL, '3040', '三亚鲜檬摄影有限公司', '3040', '3040', '99999999', NULL, '12500005', '门市部', '0', NULL, '0', '门市部', '12500005', NULL, NULL, NULL, NULL, NULL),
('9063064', '2018-05-21', '9999-12-31', '吴振伟', '莞1', NULL, '1', NULL, '1000101406', NULL, 'D', NULL, 'P31', NULL, '2', NULL, 'A', NULL, 'Z3', NULL, '1000', NULL, '1000', NULL, '1000', '虎彩印艺股份有限公司', '1000', '1000', '50094821', 'DBA', '50094635', '流程优化与组织支持板块', '50094820', 'DBA', '10100037', '公共服务部', '50094631', '信息与数字化中心', NULL, NULL, NULL, NULL),
('9029376', '2012-02-22', '9999-12-31', '李小红', '莞3', NULL, '2', NULL, '1000302214', NULL, 'F', NULL, 'A31', NULL, '1', NULL, 'A', NULL, 'Z5', NULL, '1002', NULL, '1002', NULL, '1000', '虎彩印艺股份有限公司', '1002', '1000', '20300599', '彩盒组长', '10300027', '装配处', '30300172', '彩盒组长', '0', '装配处', '10300027', NULL, NULL, NULL, NULL, NULL),
('9067309', '2019-03-06', '9999-12-31', '胡亚军', '云2', NULL, '3', NULL, '2000302012', NULL, 'G', NULL, 'O21', NULL, '1', NULL, 'A', NULL, 'Z6', NULL, '2000', NULL, '2000', NULL, '2000', '广东虎彩云印刷有限公司', '2000', '2000', '21410027', '防损包装员', '11400015', '图书出版板块', '31400036', '防损包装员', '0', '出版生产部', '11400012', NULL, NULL, NULL, NULL, NULL),
('9067611', '2019-05-20', '9999-12-31', '孙明阳', '京3', NULL, '1', NULL, '2020301005', NULL, 'Z', NULL, 'Z11', NULL, '4', NULL, 'G', NULL, 'Z8', NULL, '2020', NULL, '2020', NULL, '2020', '北京京华虎彩印刷有限公司', '2020', '2020', '21600171', '实习生', '11600005', '生产部', '31600021', '实习生', '0', '生产部', '11600005', NULL, NULL, NULL, NULL, NULL),
('9058194', '2017-09-26', '9999-12-31', '杨闻果', '莞3', NULL, '3', NULL, '1000302106', NULL, 'F', NULL, 'O31', NULL, '1', NULL, 'A', NULL, 'Z6', NULL, '1002', NULL, '1002', NULL, '1000', '虎彩印艺股份有限公司', '1002', '1000', '20300180', '胶印副手', '10300014', '胶印板块', '30300071', '胶印副手', '0', '印刷部', '10300013', NULL, NULL, NULL, NULL, NULL),
('990102', '1995-08-23', '9999-12-31', '王吉银', '云4', NULL, '1', NULL, '2000101003', NULL, 'B', NULL, 'M31', NULL, '2', NULL, 'A', NULL, 'Z1', NULL, '2020', NULL, '2000', NULL, '2000', '广东虎彩云印刷有限公司', '2000', '2000', '25000291', '生产总监', '50095414', '出版总监办', '35000155', '生产总监', '0', '出版总监办', '50095414', NULL, NULL, NULL, NULL, NULL),
('9068319', '2019-09-02', '9999-12-31', '冯宏旺', '莞4', NULL, '1', NULL, '1000101301', NULL, 'Z', NULL, 'Z11', NULL, '4', NULL, 'G', NULL, 'Z8', NULL, '1000', NULL, '1000', NULL, '1000', '虎彩印艺股份有限公司', '1000', '1000', '25001249', '实习生', '10100026', '人力资源中心', '30100225', '实习生', '10100026', NULL, '0', '人力资源中心', NULL, NULL, NULL, NULL),
('9055113', '2017-04-19', '9999-12-31', '罗立华', '绍3', NULL, '1', NULL, '1010301003', NULL, 'F', NULL, 'T11', NULL, '1', NULL, 'A', NULL, 'Z2', NULL, '1010', NULL, '1010', NULL, '1010', '绍兴虎彩激光材料科技有限公司', '1010', '1010', '20650801', '检测员', '50095632', '检测中心', '30600508', '检测员', '0', '绍兴虎彩品管部', '10600060', NULL, NULL, NULL, NULL, NULL),
('9067925', '2019-07-17', '9999-12-31', '夏睿', '影2', NULL, '1', NULL, '3000201005', NULL, 'D', NULL, 'P31', NULL, '2', NULL, 'A', NULL, 'Z3', NULL, '3000', NULL, '3000', NULL, '3000', '广东虎彩影像有限公司', '3000', '3000', '50095034', '高级线上活动策划专员', '50095004', '活动策划板块', '50095033', '线上活动策划专员', '0', '粉丝运营部', '50094946', NULL, NULL, NULL, NULL, NULL),
('9050556', '2016-07-19', '9999-12-31', '鱼洪涛', '莞3', NULL, '1', NULL, '1000301008', NULL, 'F', NULL, 'A31', NULL, '1', NULL, 'A', NULL, 'Z5', NULL, '1002', NULL, '1002', NULL, '1000', '虎彩印艺股份有限公司', '1002', '1000', '20300089', '半成品仓管员', '50095627', '仓储处', '30300046', '半成品仓管员', '0', '生产计划部', '10300008', NULL, NULL, NULL, NULL, NULL),
('9063794', '2018-07-09', '9999-12-31', '刘渝', '莞4', NULL, '1', NULL, '1000202003', NULL, 'E', NULL, 'A42', NULL, '2', NULL, 'A', NULL, 'Z5', NULL, '1004', NULL, '1004', NULL, '1000', '虎彩印艺股份有限公司', '1004', '1000', '25000663', '商务客服专员', '10500003', '平台运营部', '35000269', '商务客服专员', '10500000', '平台运营部', '10500003', '市场中心', NULL, NULL, NULL, NULL),
('9066583', '2018-12-27', '9999-12-31', '刘浩锋', '莞1', NULL, '1', NULL, '1000101404', NULL, 'D', NULL, 'P31', NULL, '2', NULL, 'A', NULL, 'Z3', NULL, '1000', NULL, '1000', NULL, '1000', '虎彩印艺股份有限公司', '1000', '1000', '50094691', '高级产品需求分析师', '50094628', '出版系统部', '50094687', '高级产品需求分析师', '10100037', '出版系统部', '50094628', '信息与数字化中心', NULL, NULL, NULL, NULL),
('50326', '2005-11-23', '9999-12-31', '马先铎', '莞1', NULL, '1', NULL, '1000101109', NULL, 'A', NULL, 'M42', NULL, '2', NULL, 'A', NULL, 'Z1', NULL, '1004', NULL, '1004', NULL, '1000', '虎彩印艺股份有限公司', '1004', '1000', '25001219', '包装事业二部副总裁', '14000000', '包装事业二部', '35000461', '包装事业二部副总裁', '0', NULL, '0', NULL, NULL, NULL, NULL, NULL),
('9067685', '2019-06-14', '9999-12-31', '曾丽娟', '云1', NULL, '1', NULL, '2000101012', NULL, 'E', NULL, 'T21', NULL, '1', NULL, 'A', NULL, 'Z2', NULL, '2000', NULL, '2000', NULL, '2000', '广东虎彩云印刷有限公司', '2000', '2000', '21400058', '印前处理员', '11400011', '东莞处理处', '31400021', '印前处理员', '0', '出版印前中心', '11400008', NULL, NULL, NULL, NULL, NULL),
('9068002', '2019-07-22', '9999-12-31', '韩凯', '安1', NULL, '3', NULL, '?', NULL, 'D', NULL, 'M11', NULL, '1', NULL, 'A', NULL, 'Z4', NULL, '3050', NULL, '3050', NULL, '3050', '泰安市鲜檬摄影服务有限公司', '3050', '3050', '22600052', '销售部主任', '12600040', '销售部', '32600014', '销售部主任', '0', '销售部', '12600040', NULL, NULL, NULL, NULL, NULL),
('9067910', '2019-07-15', '9999-12-31', '邓前辉', '莞3', NULL, '1', NULL, '1000101502', NULL, 'F', NULL, 'C11', NULL, '3', NULL, 'A', NULL, 'Z7', NULL, '1002', NULL, '1002', NULL, '1000', '虎彩印艺股份有限公司', '1002', '1000', '20301014', '大学生储备', '10300001', '厂长办', '30300302', '大学生储备', '0', '厂长办', '10300001', NULL, NULL, NULL, NULL, NULL),
('9067312', '2019-03-06', '9999-12-31', '严芝辰', '莞5', NULL, '2', NULL, '1000304017', NULL, 'G', NULL, 'O21', NULL, '1', NULL, 'A', NULL, 'Z6', NULL, '1006', NULL, '1006', NULL, '1000', '虎彩印艺股份有限公司', '1006', '1000', '20300899', '产线制作员', '10300036', '装配板块', '30300266', '产线制作员', '0', '生产部', '10300034', NULL, NULL, NULL, NULL, NULL),
('9032357', '2012-12-18', '9999-12-31', '陈全贵', '莞5', NULL, '1', NULL, '1000301011', NULL, 'G', NULL, 'O21', NULL, '1', NULL, 'A', NULL, 'Z6', NULL, '1002', NULL, '1002', NULL, '1000', '虎彩印艺股份有限公司', '1002', '1000', '25000115', '彩盒打样员', '10300027', '装配处', '30300168', '彩盒打样员', '0', '装配处', '10300027', NULL, NULL, NULL, NULL, NULL),
('9045024', '2015-07-13', '9999-12-31', '范福芬', '莞5', NULL, '1', NULL, '1000303002', NULL, 'F', NULL, 'O32', NULL, '1', NULL, 'A', NULL, 'Z6', NULL, '1006', NULL, '1006', NULL, '1000', '虎彩印艺股份有限公司', '1006', '1000', '20300761', 'OQA', '10300031', '品质板块', '30300194', 'OQA', '0', '印前管理部', '10300029', NULL, NULL, NULL, NULL, NULL),
('9063522', '2018-06-27', '9999-12-31', '文雅', '莞4', NULL, '1', NULL, '1000101105', NULL, 'E', NULL, 'P21', NULL, '2', NULL, 'A', NULL, 'Z3', NULL, '1000', NULL, '1000', NULL, '1000', '虎彩印艺股份有限公司', '1000', '1000', '50093179', 'IT项目采购专员', '10100012', '采购板块', '50093177', 'IT项目采购专员', '0', '采购管理部', '10100011', NULL, NULL, NULL, NULL, NULL),
('9063259', '2018-06-07', '9999-12-31', '孙凤珍', '鲁3', NULL, '3', NULL, '1020302200', NULL, 'F', NULL, 'O32', NULL, '1', NULL, 'A', NULL, 'Z6', NULL, '1020', NULL, '1020', NULL, '1020', '山东虎彩泰山印刷有限公司', '1020', '1020', '20700176', '手工组长', '10700053', '装配车间', '30700095', '手工组长', '0', '生产部', '10700050', NULL, NULL, NULL, NULL, NULL),
('9052063', '2016-11-21', '9999-12-31', '黄锡清', '莞3', NULL, '3', NULL, '1000301004', NULL, 'G', NULL, 'O31', NULL, '1', NULL, 'A', NULL, 'Z6', NULL, '1002', NULL, '1002', NULL, '1000', '虎彩印艺股份有限公司', '1002', '1000', '20300573', '自动检测机助手', '10300023', '质检板块', '30300152', '自动检测机助手', '0', '品管部', '10300020', NULL, NULL, NULL, NULL, NULL),
('9052564', '2016-12-02', '9999-12-31', '井奎', '鲁3', NULL, '1', NULL, '1020301003', NULL, 'E', NULL, 'O41', NULL, '1', NULL, 'A', NULL, 'Z6', NULL, '1020', NULL, '1020', NULL, '1020', '山东虎彩泰山印刷有限公司', '1020', '1020', '20700077', 'QA', '10700043', '品管处', '30700045', 'QA', '0', '印前管理部', '10700040', NULL, NULL, NULL, NULL, NULL),
('9024885', '2011-05-19', '2019-09-26', '孙丞', '鲁3', NULL, '3', NULL, '1020302110', NULL, 'F', NULL, 'O32', NULL, '1', NULL, 'A', NULL, 'Z6', NULL, '1020', NULL, '1020', NULL, '1020', '山东虎彩泰山印刷有限公司', '1020', '1020', '20700164', '糊盒机机长', '10700052', '印后车间', '30700092', '糊盒机机长', '0', '生产部', '10700050', NULL, NULL, NULL, NULL, NULL),
('9054200', '2017-02-23', '9999-12-31', '罗锐杰', '莞3', NULL, '3', NULL, '1000302102', NULL, 'F', NULL, 'O31', NULL, '1', NULL, 'A', NULL, 'Z6', NULL, '1002', NULL, '1002', NULL, '1000', '虎彩印艺股份有限公司', '1002', '1000', '20300177', '胶印副手', '10300014', '胶印板块', '30300071', '胶印副手', '0', '印刷部', '10300013', NULL, NULL, NULL, NULL, NULL),
('9067924', '2019-07-17', '9999-12-31', '徐晓波', '青3', NULL, '1', NULL, '1030301011', NULL, 'D', NULL, 'M11', NULL, '2', NULL, 'A', NULL, 'Z1', NULL, '1030', NULL, '1030', NULL, '1030', '青海虎彩印刷有限公司', '1030', '1030', '20800161', '装配主任', '10800042', '装配板块', '30800424', '装配主任', '0', '生产部', '10800040', NULL, NULL, NULL, NULL, NULL),
('9064301', '2018-08-10', '9999-12-31', '张朋利', '绍3', NULL, '1', NULL, '3010302028', NULL, 'G', NULL, 'O21', NULL, '1', NULL, 'A', NULL, 'Z6', NULL, '3010', NULL, '3010', NULL, '3010', '虎彩影像绍兴分公司', '3010', '3010', '22200195', '琉璃制作员', '12200010', '影像绍兴分公司影像生产部', '32200020', '琉璃制作员', '0', '影像绍兴分公司影像生产部', '12200010', NULL, NULL, NULL, NULL, NULL),
('9054745', '2017-03-20', '9999-12-31', '赵会华', '绍3', NULL, '1', NULL, '2010301001', NULL, 'G', NULL, 'O21', NULL, '1', NULL, 'A', NULL, 'Z6', NULL, '2010', NULL, '2010', NULL, '2010', '广东虎彩云印刷有限公司绍兴分公司', '2010', '2010', '21500061', '防损包装员', '11500010', '出版绍兴分公司出版生产部', '31500006', '防损包装员', '0', '出版绍兴分公司出版生产部', '11500010', NULL, NULL, NULL, NULL, NULL),
('9067399', '2019-03-25', '9999-12-31', '张薇', '影2', NULL, '3', NULL, '3000201202', NULL, 'E', NULL, 'S31', NULL, '1', NULL, 'A', NULL, 'Z4', NULL, '3000', NULL, '3000', NULL, '3000', '广东虎彩影像有限公司', '3000', '3000', '50094929', '水吧师', '50094860', '西坪店', '50094928', '水吧师', '0', '新零售渠道', '12100090', NULL, NULL, NULL, NULL, NULL),
('9056651', '2017-07-07', '9999-12-31', '刘晓清', '莞4', NULL, '1', NULL, '1000301006', NULL, 'E', NULL, 'P21', NULL, '2', NULL, 'A', NULL, 'Z3', NULL, '1002', NULL, '1002', NULL, '1000', '虎彩印艺股份有限公司', '1002', '1000', '20300061', 'MC专员', '10300008', '生产计划部', '30300031', 'MC专员', '0', '生产计划部', '10300008', NULL, NULL, NULL, NULL, NULL),
('9057100', '2017-07-27', '9999-12-31', '邓奕沛', '莞3', NULL, '1', NULL, '1000301005', NULL, 'E', NULL, 'T21', NULL, '2', NULL, 'A', NULL, 'Z2', NULL, '1002', NULL, '1002', NULL, '1000', '虎彩印艺股份有限公司', '1002', '1000', '20300475', '技术代表', '10300021', '检测中心', '30300132', '技术代表', '0', '品管部', '10300020', NULL, NULL, NULL, NULL, NULL),
('9057958', '2017-09-13', '9999-12-31', '卢移玉', '莞3', NULL, '2', NULL, '1000302214', NULL, 'G', NULL, 'O21', NULL, '1', NULL, 'A', NULL, 'Z6', NULL, '1002', NULL, '1002', NULL, '1000', '虎彩印艺股份有限公司', '1002', '1000', '20300655', '彩盒手工制作员', '10300027', '装配处', '30300183', '彩盒手工制作员', '0', '装配处', '10300027', NULL, NULL, NULL, NULL, NULL),
('9067110', '2019-02-14', '9999-12-31', '李群庆', '莞3', NULL, '2', NULL, '1000302214', NULL, 'G', NULL, 'O21', NULL, '1', NULL, 'A', NULL, 'Z6', NULL, '1002', NULL, '1002', NULL, '1000', '虎彩印艺股份有限公司', '1002', '1000', '20300627', '彩盒手工制作员', '10300027', '装配处', '30300183', '彩盒手工制作员', '0', '装配处', '10300027', NULL, NULL, NULL, NULL, NULL),
('9067616', '2019-05-20', '9999-12-31', '任家义', '京3', NULL, '1', NULL, '2020301005', NULL, 'Z', NULL, 'Z11', NULL, '4', NULL, 'G', NULL, 'Z8', NULL, '2020', NULL, '2020', NULL, '2020', '北京京华虎彩印刷有限公司', '2020', '2020', '21600176', '实习生', '11600005', '生产部', '31600021', '实习生', '0', '生产部', '11600005', NULL, NULL, NULL, NULL, NULL),
('9067414', '2019-03-26', '9999-12-31', '荣惠影', '京2', NULL, '2', NULL, '2020301006', NULL, 'F', NULL, 'O32', NULL, '1', NULL, 'A', NULL, 'Z6', NULL, '2020', NULL, '2020', NULL, '2020', '北京京华虎彩印刷有限公司', '2020', '2020', '21600080', '好利用胶订助手', '11600010', '生产部胶装板块', '31600043', '好利用胶订助手', '0', '生产部', '11600005', NULL, NULL, NULL, NULL, NULL),
('4284', '2004-12-16', '9999-12-31', '李宏伟', '青3', NULL, '1', NULL, '1030101006', NULL, 'D', NULL, 'A51', NULL, '2', NULL, 'A', NULL, 'Z5', NULL, '1030', NULL, '1030', NULL, '1030', '青海虎彩印刷有限公司', '1030', '1030', '20800119', '总务外事专员', '10800031', '总务处', '30800308', '总务外事专员', '0', '人力资源部', '10800030', NULL, NULL, NULL, NULL, NULL),
('6005', '2006-02-16', '9999-12-31', '刘海霞', '青3', NULL, '1', NULL, '1030301014', NULL, 'E', NULL, 'P21', NULL, '2', NULL, 'A', NULL, 'Z3', NULL, '1030', NULL, '1030', NULL, '1030', '青海虎彩印刷有限公司', '1030', '1030', '20800246', 'MC', '10800055', '计划板块', '30800514', 'MC', '0', '印前管理部', '10800050', NULL, NULL, NULL, NULL, NULL),
('9067633', '2019-05-21', '9999-12-31', '伍志', '搜2', NULL, '1', NULL, '2050201301', NULL, 'B', NULL, 'M31', NULL, '2', NULL, 'A', NULL, 'Z1', NULL, '2050', NULL, '2050', NULL, '2050', '北京搜书文化传播有限公司', '2050', '2050', '25000473', '出版总监', '11900002', '出版中心', '35000232', '出版总监', '0', '出版中心', '11900002', NULL, NULL, NULL, NULL, NULL),
('9021832', '2010-11-03', '9999-12-31', '何新华', '莞3', NULL, '3', NULL, '1000302203', NULL, 'E', NULL, 'O42', NULL, '1', NULL, 'A', NULL, 'Z6', NULL, '1002', NULL, '1002', NULL, '1000', '虎彩印艺股份有限公司', '1002', '1000', '20300309', '自啤机长', '10300018', '自啤板块', '30300101', '自啤机长', '0', '印后部', '10300017', NULL, NULL, NULL, NULL, NULL),
('41205', '2004-12-07', '9999-12-31', '厉祖刚', '绍3', NULL, '3', NULL, '1010301001', NULL, 'E', NULL, 'O41', NULL, '1', NULL, 'A', NULL, 'Z6', NULL, '1010', NULL, '1010', NULL, '1010', '绍兴虎彩激光材料科技有限公司', '1010', '1010', '20680630', '配料工艺师', '10600090', '绍兴虎彩生产部', '30600852', '配料工艺师', '0', '绍兴虎彩生产部', '10600090', NULL, NULL, NULL, NULL, NULL),
('9068120', '2019-08-13', '9999-12-31', '和倩', '莞1', NULL, '3', NULL, '1000201004', NULL, 'D', NULL, 'T31', NULL, '1', NULL, 'A', NULL, 'Z2', NULL, '1000', NULL, '1000', NULL, '1000', '虎彩印艺股份有限公司', '1000', '1000', '25000072', '高级设计师', '50095339', '设计部冷烫设计组', '35000012', '高级设计师', '10100045', '营销中心设计部', '50095335', '营销中心', NULL, NULL, NULL, NULL),
('70741', '2007-06-15', '9999-12-31', '吴灼', '莞3', NULL, '3', NULL, '1000302108', NULL, 'E', NULL, 'O41', NULL, '1', NULL, 'A', NULL, 'Z6', NULL, '1002', NULL, '1002', NULL, '1000', '虎彩印艺股份有限公司', '1002', '1000', '20300256', '单凹机长', '10300015', '丝印板块', '30300087', '单凹机长', '0', '印刷部', '10300013', NULL, NULL, NULL, NULL, NULL),
('9030313', '2012-05-17', '9999-12-31', '徐鑫文', '莞3', NULL, '1', NULL, '1000301007', NULL, 'D', NULL, 'T31', NULL, '2', NULL, 'A', NULL, 'Z2', NULL, '1002', NULL, '1002', NULL, '1000', '虎彩印艺股份有限公司', '1002', '1000', '20300032', '烟包产品工程师', '10300005', '烟包产品板块', '30300022', '烟包产品工程师', '0', '技术部', '10300003', NULL, NULL, NULL, NULL, NULL),
('9068326', '2019-09-03', '9999-12-31', '封思伊', '莞3', NULL, '1', NULL, '1000301004', NULL, 'F', NULL, 'O32', NULL, '1', NULL, 'A', NULL, 'Z6', NULL, '1002', NULL, '1002', NULL, '1000', '虎彩印艺股份有限公司', '1002', '1000', '20300510', 'OQA', '10300023', '质检板块', '30300144', 'OQA', '0', '品管部', '10300020', NULL, NULL, NULL, NULL, NULL),
('40644', '2004-12-01', '9999-12-31', '龙飞', '莞1', NULL, '3', NULL, '1040101002', NULL, 'C', NULL, 'S51', NULL, '2', NULL, 'A', NULL, 'Z4', NULL, '1040', NULL, '1040', NULL, '1040', '虎彩印刷国际有限公司', '1040', '1040', '20400002', '业务经理', '10900000', '虎彩国际印刷有限公司', '30900002', '业务经理', '0', NULL, '0', NULL, NULL, NULL, NULL, NULL),
('9068245', '2019-09-01', '9999-12-31', '唐万敏', '影3', NULL, '1', NULL, '3000301001', NULL, 'Z', NULL, 'Z11', NULL, '4', NULL, 'G', NULL, 'Z8', NULL, '3000', NULL, '3000', NULL, '3000', '广东虎彩影像有限公司', '3000', '3000', '25001056', '实习生', '12100150', '影像生产部', '35000387', '实习生', '0', '影像生产部', '12100150', NULL, NULL, NULL, NULL, NULL),
('9068281', '2019-09-02', '9999-12-31', '周正旭', '莞5', NULL, '1', NULL, '1000303001', NULL, 'Z', NULL, 'Z11', NULL, '4', NULL, 'G', NULL, 'Z8', NULL, '1006', NULL, '1006', NULL, '1000', '虎彩印艺股份有限公司', '1006', '1000', '25001523', '实习生', '10300028', '数码包装部', '30100225', '实习生', '0', NULL, '0', NULL, NULL, NULL, NULL, NULL),
('9068338', '2019-09-03', '9999-12-31', '宋少恒', '莞3', NULL, '2', NULL, '1000302214', NULL, 'G', NULL, 'O21', NULL, '1', NULL, 'A', NULL, 'Z6', NULL, '1002', NULL, '1002', NULL, '1000', '虎彩印艺股份有限公司', '1002', '1000', '20300685', '彩盒手工制作员', '10300027', '装配处', '30300183', '彩盒手工制作员', '0', '装配处', '10300027', NULL, NULL, NULL, NULL, NULL),
('9068330', '2019-09-03', '9999-12-31', '赵付学', '莞3', NULL, '1', NULL, '1000302214', NULL, 'G', NULL, 'O21', NULL, '1', NULL, 'C', NULL, 'Z6', NULL, '1002', NULL, '1002', NULL, '1000', '虎彩印艺股份有限公司', '1002', '1000', '25001454', '劳务工', '10300027', '装配处', '35000627', '劳务工', '0', '装配处', '10300027', NULL, NULL, NULL, NULL, NULL),
('73285', '2007-09-24', '9999-12-31', '朱雪影', '莞2', NULL, '3', NULL, '1060102001', NULL, 'D', NULL, 'T31', NULL, '2', NULL, 'A', NULL, 'Z2', NULL, '1060', NULL, '1060', NULL, '1060', '虎彩印艺股份有限公司东莞分公司', '1060', '1060', '21100055', '设备调试工程师', '11100006', '装配IE组', '31100016', '设备调试工程师', '0', '研发部', '11100005', NULL, NULL, NULL, NULL, NULL),
('80017', '2008-01-05', '9999-12-31', '吴展', '莞3', NULL, '2', NULL, '1000301004', NULL, 'G', NULL, 'O21', NULL, '1', NULL, 'A', NULL, 'Z6', NULL, '1002', NULL, '1002', NULL, '1000', '虎彩印艺股份有限公司', '1002', '1000', '20300554', '打带员', '10300023', '质检板块', '30300148', '打带员', '0', '品管部', '10300020', NULL, NULL, NULL, NULL, NULL),
('80901', '2008-09-01', '9999-12-31', '潘广飞', '绍3', NULL, '3', NULL, '1010302111', NULL, 'E', NULL, 'O41', NULL, '1', NULL, 'A', NULL, 'Z6', NULL, '1010', NULL, '1010', NULL, '1010', '绍兴虎彩激光材料科技有限公司', '1010', '1010', '20680212', '复合机长', '10600093', '绍兴虎彩复合工序', '30600822', '复合机长', '0', '绍兴虎彩生产部', '10600090', NULL, NULL, NULL, NULL, NULL),
('9067937', '2019-07-18', '9999-12-31', '李健伟', '莞1', NULL, '1', NULL, '1000101404', NULL, 'D', NULL, 'P31', NULL, '2', NULL, 'A', NULL, 'Z3', NULL, '1000', NULL, '1000', NULL, '1000', '虎彩印艺股份有限公司', '1000', '1000', '25001223', '高级产品需求分析师', '50094628', '出版系统部', '50094687', '高级产品需求分析师', '10100037', '出版系统部', '50094628', '信息与数字化中心', NULL, NULL, NULL, NULL),
('9045933', '2015-08-10', '9999-12-31', '苏振飞', '影3', NULL, '3', NULL, '3000302016', NULL, 'F', NULL, 'O32', NULL, '1', NULL, 'A', NULL, 'Z6', NULL, '3000', NULL, '3000', NULL, '3000', '广东虎彩影像有限公司', '3000', '3000', '22110118', '胶装机长', '12100154', '个性影像板块', '32100136', '胶装机长', '0', '影像生产部', '12100150', NULL, NULL, NULL, NULL, NULL),
('9049841', '2016-06-03', '9999-12-31', '朱琳琳', '鲁3', NULL, '1', NULL, '1020101003', NULL, 'E', NULL, 'P21', NULL, '2', NULL, 'A', NULL, 'Z3', NULL, '1020', NULL, '1020', NULL, '1020', '山东虎彩泰山印刷有限公司', '1020', '1020', '20700039', '劳资兼标准成本会计', '10700030', '财务部', '30700022', '劳资兼标准成本会计', '0', '财务部', '10700030', NULL, NULL, NULL, NULL, NULL),
('9050011', '2016-06-22', '9999-12-31', '任锡银', '鲁3', NULL, '1', NULL, '1020101002', NULL, 'E', NULL, 'A42', NULL, '2', NULL, 'A', NULL, 'Z5', NULL, '1020', NULL, '1020', NULL, '1020', '山东虎彩泰山印刷有限公司', '1020', '1020', '20700011', '跟单', '10700010', '总经办', '30700007', '跟单', '0', '总经办', '10700010', NULL, NULL, NULL, NULL, NULL),
('9065253', '2018-10-12', '9999-12-31', '徐礼飞', '亚2', NULL, '3', NULL, '3040302003', NULL, 'F', NULL, 'T11', NULL, '1', NULL, 'A', NULL, 'Z2', NULL, '3040', NULL, '3040', NULL, '3040', '三亚鲜檬摄影有限公司', '3040', '3040', '22500095', '摄影助理', '12500004', '摄化部', '32500018', '摄影助理', '0', '摄化部', '12500004', NULL, NULL, NULL, NULL, NULL),
('9018632', '2010-05-27', '9999-12-31', '孙海虎', '鲁3', NULL, '1', NULL, '1020101006', NULL, 'G', NULL, 'A21', NULL, '2', NULL, 'A', NULL, 'Z5', NULL, '1020', NULL, '1020', NULL, '1020', '山东虎彩泰山印刷有限公司', '1020', '1020', '20700024', '保安员', '10700021', '总务处', '30700015', '保安员', '0', '人力资源部', '10700020', NULL, NULL, NULL, NULL, NULL),
('9021559', '2010-09-27', '9999-12-31', '张燕', '青3', NULL, '1', NULL, '1030301003', NULL, 'E', NULL, 'A41', NULL, '2', NULL, 'A', NULL, 'Z5', NULL, '1030', NULL, '1030', NULL, '1030', '青海虎彩印刷有限公司', '1030', '1030', '20800265', '高级仓管员', '10800052', '仓储板块', '30800529', '高级仓管员', '0', '印前管理部', '10800050', NULL, NULL, NULL, NULL, NULL),
('9039475', '2014-07-07', '9999-12-31', '黄玲芳', '搜2', NULL, '3', NULL, '2050201101', NULL, 'D', NULL, 'P31', NULL, '1', NULL, 'A', NULL, 'Z3', NULL, '2050', NULL, '2050', NULL, '2050', '北京搜书文化传播有限公司', '2050', '2050', '21900018', '高级电商运营专员', '11900005', '平台运营板块', '31900006', '高级电商运营专员', '0', '渠道运营中心', '50095654', NULL, NULL, NULL, NULL, NULL),
('9067447', '2019-04-01', '9999-12-31', '秦江宁', '安3', NULL, '3', NULL, '3000201401', NULL, 'E', NULL, 'T21', NULL, '1', NULL, 'A', NULL, 'Z2', NULL, '3050', NULL, '3000', NULL, '3000', '广东虎彩影像有限公司', '3000', '3000', '22100077', '修片员', '12100060', '修片中心', '32100038', '修片员', '0', '修片中心', '12100060', NULL, NULL, NULL, NULL, NULL),
('9032455', '2012-12-31', '9999-12-31', '张甜甜', '鲁3', NULL, '1', NULL, '1020301001', NULL, 'E', NULL, 'P21', NULL, '2', NULL, 'A', NULL, 'Z3', NULL, '1020', NULL, '1020', NULL, '1020', '山东虎彩泰山印刷有限公司', '1020', '1020', '25001085', '发外PC', '10700041', '计划管理处', '30700149', '发外PC', '0', '印前管理部', '10700040', NULL, NULL, NULL, NULL, NULL),
('9065270', '2018-10-16', '9999-12-31', '蒋彬', '莞5', NULL, '2', NULL, '1000304017', NULL, 'G', NULL, 'O21', NULL, '1', NULL, 'A', NULL, 'Z6', NULL, '1006', NULL, '1006', NULL, '1000', '虎彩印艺股份有限公司', '1006', '1000', '20300890', '产线制作员', '10300036', '装配板块', '30300266', '产线制作员', '0', '生产部', '10300034', NULL, NULL, NULL, NULL, NULL),
('9066600', '2018-12-30', '9999-12-31', '宝玉奇', '京2', NULL, '2', NULL, '2020301006', NULL, 'F', NULL, 'O32', NULL, '1', NULL, 'A', NULL, 'Z6', NULL, '2020', NULL, '2020', NULL, '2020', '北京京华虎彩印刷有限公司', '2020', '2020', '21600061', 'HKL', '11600010', '生产部胶装板块', '31600040', 'HKL', '0', '生产部', '11600005', NULL, NULL, NULL, NULL, NULL),
('9062751', '2018-04-24', '9999-12-31', '孔莹盈', '广2', NULL, '1', NULL, '3030201003', NULL, 'D', NULL, 'P31', NULL, '2', NULL, 'A', NULL, 'Z3', NULL, '3030', NULL, '3030', NULL, '3030', '广州虎彩网络科技有限公司', '3030', '3030', '22400034', '高级设计师', '12400090', '设计部', '32400030', '高级设计师', '0', '设计部', '12400090', NULL, NULL, NULL, NULL, NULL),
('9029482', '2012-02-27', '9999-12-31', '司晓东', '青3', NULL, '3', NULL, '1030301005', NULL, 'F', NULL, 'O31', NULL, '1', NULL, 'A', NULL, 'Z6', NULL, '1030', NULL, '1030', NULL, '1030', '青海虎彩印刷有限公司', '1030', '1030', '20800268', '过胶机助手', '10800041', '生产板块', '30800532', '过胶机助手', '0', '生产部', '10800040', NULL, NULL, NULL, NULL, NULL),
('9066595', '2019-01-03', '9999-12-31', '孙来军', '京3', NULL, '1', NULL, '2020101001', NULL, 'E', NULL, 'A41', NULL, '2', NULL, 'A', NULL, 'Z5', NULL, '2020', NULL, '2020', NULL, '2020', '北京京华虎彩印刷有限公司', '2020', '2020', '25000264', '司机', '50095407', '京华虎彩总务', '35000135', '司机', '0', '京华虎彩总务', '50095407', NULL, NULL, NULL, NULL, NULL),
('9047423', '2015-10-20', '9999-12-31', '唐冲', '莞1', NULL, '1', NULL, '1000101202', NULL, 'C', NULL, 'M21', NULL, '2', NULL, 'A', NULL, 'Z1', NULL, '1000', NULL, '1000', NULL, '1000', '虎彩印艺股份有限公司', '1000', '1000', '25000693', '东莞会计部经理', '50095569', '东莞会计部', '35000287', '东莞会计部经理', '10100033', '东莞会计部', '50095569', '财务中心', NULL, NULL, NULL, NULL),
('9067832', '2019-07-08', '9999-12-31', '邱书杰', '莞4', NULL, '1', NULL, '1000201004', NULL, 'F', NULL, 'C11', NULL, '3', NULL, 'A', NULL, 'Z7', NULL, '1000', NULL, '1005', NULL, '1000', '虎彩印艺股份有限公司', '1005', '1000', '25000109', '大学生储备', '50095335', '营销中心设计部', '35000019', '大学生储备', '10100045', '营销中心设计部', '50095335', '营销中心', NULL, NULL, NULL, NULL),
('9068309', '2019-09-02', '9999-12-31', '毛涟滨', '莞4', NULL, '1', NULL, '1000101301', NULL, 'Z', NULL, 'Z11', NULL, '4', NULL, 'G', NULL, 'Z8', NULL, '1000', NULL, '1000', NULL, '1000', '虎彩印艺股份有限公司', '1000', '1000', '25001249', '实习生', '10100026', '人力资源中心', '30100225', '实习生', '10100026', NULL, '0', '人力资源中心', NULL, NULL, NULL, NULL),
('9067896', '2019-07-11', '9999-12-31', '林少芳', '影2', NULL, '1', NULL, '3000101003', NULL, 'E', NULL, 'P21', NULL, '2', NULL, 'A', NULL, 'Z3', NULL, '3000', NULL, '3000', NULL, '3000', '广东虎彩影像有限公司', '3000', '3000', '22100159', '费用资产会计', '50095429', '东莞组', '32100069', '费用资产会计', '0', '财务部', '12100130', NULL, NULL, NULL, NULL, NULL),
('9068112', '2019-08-12', '9999-12-31', '植嘉萍', '莞3', NULL, '1', NULL, '1000301004', NULL, 'Z', NULL, 'Z11', NULL, '4', NULL, 'G', NULL, 'Z8', NULL, '1002', NULL, '1002', NULL, '1000', '虎彩印艺股份有限公司', '1002', '1000', '25001309', '实习生（T）', '10300020', '品管部', '30300300', '实习生（T）', '0', '品管部', '10300020', NULL, NULL, NULL, NULL, NULL),
('9068304', '2019-09-02', '9999-12-31', '吴子敬', '莞4', NULL, '1', NULL, '1000101301', NULL, 'Z', NULL, 'Z11', NULL, '4', NULL, 'G', NULL, 'Z8', NULL, '1000', NULL, '1000', NULL, '1000', '虎彩印艺股份有限公司', '1000', '1000', '25001249', '实习生', '10100026', '人力资源中心', '30100225', '实习生', '10100026', NULL, '0', '人力资源中心', NULL, NULL, NULL, NULL),
('9057691', '2017-08-10', '9999-12-31', '杨文花', '青3', NULL, '1', NULL, '1030101003', NULL, 'E', NULL, 'P31', NULL, '2', NULL, 'A', NULL, 'Z3', NULL, '1030', NULL, '1030', NULL, '1030', '青海虎彩印刷有限公司', '1030', '1030', '20800286', '总账会计', '10800020', '财务部', '30800546', '总账会计', '0', '财务部', '10800020', NULL, NULL, NULL, NULL, NULL),
('9064273', '2018-08-08', '9999-12-31', '孙慧', '鲁3', NULL, '1', NULL, '1020301003', NULL, 'E', NULL, 'O41', NULL, '1', NULL, 'A', NULL, 'Z6', NULL, '1020', NULL, '1020', NULL, '1020', '山东虎彩泰山印刷有限公司', '1020', '1020', '20700081', 'QA', '10700043', '品管处', '30700045', 'QA', '0', '印前管理部', '10700040', NULL, NULL, NULL, NULL, NULL),
('9055796', '2017-05-19', '9999-12-31', '王林', '广2', NULL, '1', NULL, '3030201002', NULL, 'F', NULL, 'S21', NULL, '1', NULL, 'A', NULL, 'Z4', NULL, '3030', NULL, '3030', NULL, '3030', '广州虎彩网络科技有限公司', '3030', '3030', '22400071', '官网售前客服', '12400100', '客服部', '32400035', '官网售前客服', '0', '客服部', '12400100', NULL, NULL, NULL, NULL, NULL),
('9068191', '2019-08-27', '9999-12-31', '黄美容', '莞3', NULL, '2', NULL, '1000302214', NULL, 'G', NULL, 'O21', NULL, '1', NULL, 'A', NULL, 'Z6', NULL, '1002', NULL, '1002', NULL, '1000', '虎彩印艺股份有限公司', '1002', '1000', '20300694', '彩盒手工制作员', '10300027', '装配处', '30300183', '彩盒手工制作员', '0', '装配处', '10300027', NULL, NULL, NULL, NULL, NULL),
('9056721', '2017-07-10', '9999-12-31', '罗兴明', '莞4', NULL, '1', NULL, '1000101202', NULL, 'E', NULL, 'P21', NULL, '2', NULL, 'A', NULL, 'Z3', NULL, '1000', NULL, '1000', NULL, '1000', '虎彩印艺股份有限公司', '1000', '1000', '25000856', '东莞分公司财务会计', '50095649', '成本运营模块', '30100125', '东莞分公司财务会计', '10100033', '东莞会计部', '50095569', '财务中心', NULL, NULL, NULL, NULL),
('9068078', '2019-08-08', '9999-12-31', '刘绍建', '莞1', NULL, '1', NULL, '1000101407', NULL, 'D', NULL, 'P31', NULL, '2', NULL, 'A', NULL, 'Z3', NULL, '1000', NULL, '1000', NULL, '1000', '虎彩印艺股份有限公司', '1000', '1000', '25001244', '高级软件开发工程师', '50094632', '系统开发组', '50094731', '高级软件开发工程师', '10100037', '创新研发部', '50094630', '信息与数字化中心', NULL, NULL, NULL, NULL),
('9067911', '2019-07-12', '9999-12-31', '魏永志', '青3', NULL, '1', NULL, '?', NULL, 'F', NULL, 'C11', NULL, '3', NULL, 'A', NULL, 'Z7', NULL, '1030', NULL, '1030', NULL, '1030', '青海虎彩印刷有限公司', '1030', '1030', '25001180', '大学生储备', '0', NULL, '0', NULL, '0', NULL, '0', NULL, NULL, NULL, NULL, NULL),
('9067132', '2019-02-16', '9999-12-31', '周姣秀', '莞3', NULL, '2', NULL, '1000304017', NULL, 'G', NULL, 'O21', NULL, '1', NULL, 'A', NULL, 'Z6', NULL, '1006', NULL, '1006', NULL, '1000', '虎彩印艺股份有限公司', '1006', '1000', '20300918', '产线制作员', '10300036', '装配板块', '30300266', '产线制作员', '0', '生产部', '10300034', NULL, NULL, NULL, NULL, NULL),
('9068042', '2019-08-01', '9999-12-31', '袁敏', '莞1', NULL, '1', NULL, '1000101105', NULL, 'C', NULL, 'P41', NULL, '2', NULL, 'A', NULL, 'Z3', NULL, '1000', NULL, '1000', NULL, '1000', '虎彩印艺股份有限公司', '1000', '1000', '25001214', '资深供应商管理专员', '10100014', '供应商管理板块', '30100042', '资深供应商管理专员', '0', '采购管理部', '10100011', NULL, NULL, NULL, NULL, NULL),
('9051398', '2016-10-11', '9999-12-31', '何江洪', '绍1', NULL, '1', NULL, '1010102001', NULL, 'C', NULL, 'T41', NULL, '2', NULL, 'A', NULL, 'Z2', NULL, '1010', NULL, '1010', NULL, '1010', '绍兴虎彩激光材料科技有限公司', '1010', '1010', '20640101', '研发组长', '10600070', '绍兴虎彩研发部', '30600901', '研发组长', '0', '绍兴虎彩研发部', '10600070', NULL, NULL, NULL, NULL, NULL),
('61117', '2006-07-15', '9999-12-31', '李佰明', '绍1', NULL, '1', NULL, '1010201005', NULL, 'C', NULL, 'S51', NULL, '1', NULL, 'A', NULL, 'Z4', NULL, '1010', NULL, '1010', NULL, '1010', '绍兴虎彩激光材料科技有限公司', '1010', '1010', '20670100', '大客户经理', '10600020', '绍兴虎彩营销部', '30600701', '大客户经理', '0', '绍兴虎彩营销部', '10600020', NULL, NULL, NULL, NULL, NULL),
('9034516', '2013-07-27', '9999-12-31', '施文', '鲁3', NULL, '1', NULL, '3020101001', NULL, 'E', NULL, 'P21', NULL, '2', NULL, 'A', NULL, 'Z3', NULL, '3020', NULL, '3020', NULL, '3020', '虎彩影像山东分公司', '3020', '3020', '25000149', 'PMC', '12300000', '山东影像', '35000054', 'PMC', '0', NULL, '0', NULL, NULL, NULL, NULL, NULL),
('9054915', '2017-04-06', '9999-12-31', '莫达麟', '莞3', NULL, '1', NULL, '1000301004', NULL, 'E', NULL, 'T21', NULL, '2', NULL, 'A', NULL, 'Z2', NULL, '1002', NULL, '1002', NULL, '1000', '虎彩印艺股份有限公司', '1002', '1000', '20300587', '制程QE助理工程师', '10300024', '品控板块', '30300155', '制程QE助理工程师', '0', '品管部', '10300020', NULL, NULL, NULL, NULL, NULL),
('9054444', '2017-03-01', '9999-12-31', '周乐勤', '影2', NULL, '1', NULL, '3000201102', NULL, 'E', NULL, 'S41', NULL, '1', NULL, 'A', NULL, 'Z4', NULL, '3000', NULL, '3000', NULL, '3000', '广东虎彩影像有限公司', '3000', '3000', '22100036', '华南业务代表', '12100080', '影楼销售部', '32100021', '华南业务代表', '0', '影楼销售部', '12100080', NULL, NULL, NULL, NULL, NULL),
('9055224', '2017-04-27', '9999-12-31', '应伟', '绍3', NULL, '3', NULL, '1010302111', NULL, 'G', NULL, 'O21', NULL, '1', NULL, 'A', NULL, 'Z6', NULL, '1010', NULL, '1010', NULL, '1010', '绍兴虎彩激光材料科技有限公司', '1010', '1010', '20680251', '复合工', '10600093', '绍兴虎彩复合工序', '30600824', '复合工', '0', '绍兴虎彩生产部', '10600090', NULL, NULL, NULL, NULL, NULL),
('9055874', '2017-06-02', '9999-12-31', '陶泽云', '莞3', NULL, '1', NULL, '1000301001', NULL, 'H', NULL, 'A11', NULL, '1', NULL, 'A', NULL, 'Z5', NULL, '1002', NULL, '1002', NULL, '1000', '虎彩印艺股份有限公司', '1002', '1000', '20300210', '清洁工', '10300014', '胶印板块', '30300075', '清洁工', '0', '印刷部', '10300013', NULL, NULL, NULL, NULL, NULL),
('9065698', '2018-10-17', '9999-12-31', '田聪', '亚2', NULL, '3', NULL, '?', NULL, 'F', NULL, 'T11', NULL, '1', NULL, 'A', NULL, 'Z2', NULL, '3040', NULL, '3040', NULL, '3040', '三亚鲜檬摄影有限公司', '3040', '3040', '99999999', NULL, '12500004', '摄化部', '0', NULL, '0', '摄化部', '12500004', NULL, NULL, NULL, NULL, NULL),
('9056282', '2017-06-21', '9999-12-31', '赵波', '莞3', NULL, '3', NULL, '1000302109', NULL, 'E', NULL, 'O41', NULL, '1', NULL, 'A', NULL, 'Z6', NULL, '1002', NULL, '1002', NULL, '1000', '虎彩印艺股份有限公司', '1002', '1000', '20300221', '喷码机长', '10300014', '胶印板块', '30300081', '喷码机长', '0', '印刷部', '10300013', NULL, NULL, NULL, NULL, NULL),
('9056371', '2017-06-26', '9999-12-31', '叶清华', '莞4', NULL, '1', NULL, '1000101108', NULL, 'G', NULL, 'A21', NULL, '2', NULL, 'A', NULL, 'Z5', NULL, '1000', NULL, '1000', NULL, '1000', '虎彩印艺股份有限公司', '1000', '1000', '20100152', '厨工', '10100032', '总务处', '30100108', '厨工', '10100026', '人力资源共享服务部', '10100031', '人力资源中心', NULL, NULL, NULL, NULL),
('9043698', '2015-04-10', '9999-12-31', '王鑫', '绍3', NULL, '1', NULL, '2010302004', NULL, 'E', NULL, 'O42', NULL, '1', NULL, 'A', NULL, 'Z6', NULL, '2010', NULL, '2010', NULL, '2010', '广东虎彩云印刷有限公司绍兴分公司', '2010', '2010', '21500070', '胶装机机长', '11500010', '出版绍兴分公司出版生产部', '31500007', '胶装机机长', '0', '出版绍兴分公司出版生产部', '11500010', NULL, NULL, NULL, NULL, NULL),
('9046060', '2015-08-14', '9999-12-31', '姚银钟', '京2', NULL, '2', NULL, '2020301006', NULL, 'E', NULL, 'O42', NULL, '1', NULL, 'A', NULL, 'Z6', NULL, '2020', NULL, '2020', NULL, '2020', '北京京华虎彩印刷有限公司', '2020', '2020', '21600062', '好利用09胶钉机', '11600010', '生产部胶装板块', '31600041', '好利用09胶钉机', '0', '生产部', '11600005', NULL, NULL, NULL, NULL, NULL),
('9067241', '2019-02-27', '9999-12-31', '段建英', '莞3', NULL, '2', NULL, '1000302214', NULL, 'G', NULL, 'O21', NULL, '1', NULL, 'A', NULL, 'Z6', NULL, '1002', NULL, '1002', NULL, '1000', '虎彩印艺股份有限公司', '1002', '1000', '20300639', '彩盒手工制作员', '10300027', '装配处', '30300183', '彩盒手工制作员', '0', '装配处', '10300027', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employee` (`PERNR`, `COME_DATE`, `LEAVE_DATE`, `SNAME`, `ABKRS`, `ABKRS_DESC`, `ANSVH`, `ANSVH_DESC`, `KOSTL`, `KOSTL_DESC`, `ZZ_POSLV`, `ZZ_POSLV_DESC`, `ZZ_ZWXZ`, `ZZ_ZWXZ_DESC`, `ZZ_YWXZ`, `ZZ_YWXZ_DESC`, `PERSG`, `PERSG_DESC`, `PERSK`, `PERSK_DESC`, `VDSK1`, `VDSK1_DESC`, `BTRTL`, `BTRTL_DESC`, `BUKRS`, `BUKRS_DESC`, `WERKS`, `WERKS_DESC`, `PLANS`, `PLANS_DESC`, `ORGEH`, `ORGEH_DESC`, `STELL`, `STELL_DESC`, `ZZ_SJDW`, `ZZ_SJDW_DESC`, `ZZ_SIJI`, `ZZ_SIJI_DESC`, `DATA_SOURCE`, `DATA_SOURCE_ACCOUNT`, `ETL_CREATE_DATE`, `ETL_LASTUP_DATE`) VALUES
('991199', '2008-02-26', '9999-12-31', '李凯', '云4', NULL, '1', NULL, '?', NULL, 'D', NULL, 'P31', NULL, '2', NULL, 'A', NULL, 'Z3', NULL, '2020', NULL, '2000', NULL, '2000', '广东虎彩云印刷有限公司', '2000', '2000', '25000283', '高级采购专员', '50095411', '出版调度管理部', '35000147', '高级采购专员', '0', '出版调度管理部', '50095411', NULL, NULL, NULL, NULL, NULL),
('9067277', '2019-03-04', '9999-12-31', '刘冬霞', '影2', NULL, '1', NULL, '3000201002', NULL, 'E', NULL, 'A41', NULL, '2', NULL, 'A', NULL, 'Z5', NULL, '3000', NULL, '3000', NULL, '3000', '广东虎彩影像有限公司', '3000', '3000', '50095180', '售后客服', '12100040', '客服部', '50095177', '售后客服', '0', '客服部', '12100040', NULL, NULL, NULL, NULL, NULL),
('9064547', '2018-09-03', '9999-12-31', '莫文轩', '莞4', NULL, '1', NULL, '1000101403', NULL, 'E', NULL, 'P21', NULL, '2', NULL, 'A', NULL, 'Z3', NULL, '1000', NULL, '1000', NULL, '1000', '虎彩印艺股份有限公司', '1000', '1000', '50094678', '运维工程师', '50094627', '影像与包装系统部', '50094676', '运维工程师', '10100037', '影像与包装系统部', '50094627', '信息与数字化中心', NULL, NULL, NULL, NULL),
('9064889', '2018-09-27', '9999-12-31', '岳光娥', '鲁3', NULL, '1', NULL, '1020301003', NULL, 'E', NULL, 'A42', NULL, '1', NULL, 'A', NULL, 'Z5', NULL, '1020', NULL, '1020', NULL, '1020', '山东虎彩泰山印刷有限公司', '1020', '1020', '20700073', '生产统计兼品质分析员', '10700043', '品管处', '30700042', '生产统计兼品质分析员', '0', '印前管理部', '10700040', NULL, NULL, NULL, NULL, NULL),
('9067626', '2019-05-20', '9999-12-31', '回权洪', '京3', NULL, '1', NULL, '2020301005', NULL, 'Z', NULL, 'Z11', NULL, '4', NULL, 'G', NULL, 'Z8', NULL, '2020', NULL, '2020', NULL, '2020', '北京京华虎彩印刷有限公司', '2020', '2020', '21600172', '实习生', '11600005', '生产部', '31600021', '实习生', '0', '生产部', '11600005', NULL, NULL, NULL, NULL, NULL),
('9036214', '2012-04-23', '9999-12-31', '刘长寿', '云4', NULL, '1', NULL, '2020301001', NULL, 'C', NULL, 'M21', NULL, '2', NULL, 'A', NULL, 'Z1', NULL, '2020', NULL, '2020', NULL, '2020', '北京京华虎彩印刷有限公司', '2020', '2020', '25000714', '出版设备管理部经理', '50095556', '出版设备管理部（京华）', '35000299', '出版设备管理部经理', '0', '出版设备管理部（京华）', '50095556', NULL, NULL, NULL, NULL, NULL),
('6604', '2006-11-14', '9999-12-31', '王恒山', '青3', NULL, '1', NULL, '1030301003', NULL, 'E', NULL, 'A41', NULL, '1', NULL, 'A', NULL, 'Z5', NULL, '1030', NULL, '1030', NULL, '1030', '青海虎彩印刷有限公司', '1030', '1030', '20800229', '仓管员', '10800052', '仓储板块', '30800502', '仓管员', '0', '印前管理部', '10800050', NULL, NULL, NULL, NULL, NULL),
('81075', '2008-05-12', '9999-12-31', '詹兴艳', '莞3', NULL, '3', NULL, '1000302105', NULL, 'D', NULL, 'O51', NULL, '1', NULL, 'A', NULL, 'Z6', NULL, '1002', NULL, '1002', NULL, '1000', '虎彩印艺股份有限公司', '1002', '1000', '20300143', '胶印机长', '10300014', '胶印板块', '30300068', '胶印机长', '0', '印刷部', '10300013', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `link`
--

DROP TABLE IF EXISTS `link`;
CREATE TABLE IF NOT EXISTS `link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resources_id` int(11) NOT NULL,
  `url` varchar(250) COLLATE utf8_bin NOT NULL COMMENT '地址',
  `origin` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '来源',
  `verify` tinyint(1) DEFAULT '0' COMMENT '是否需要登录',
  `verify_account` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '登录账号',
  PRIMARY KEY (`id`),
  KEY `resources_id` (`resources_id`)
) ENGINE=MyISAM AUTO_INCREMENT=68 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `link`
--

INSERT INTO `link` (`id`, `resources_id`, `url`, `origin`, `verify`, `verify_account`) VALUES
(59, 24, 'https://www.baidu.com', '', 0, ''),
(45, 10, 'http://192.172.1.240/#/site/HC_Tableau_Server/views/_31/sheet0', 'Tableau', 1, 'admin'),
(44, 9, 'https://www.taobao.com', '', 0, 'admin'),
(57, 22, '', 'Tableau', 0, ''),
(42, 8, 'https://www.jd.com', '', 0, 'admin'),
(56, 21, 'https://cn.vuejs.org/v2/api/#Vue-nextTick', '', 0, ''),
(36, 4, 'https://sina.com.cn', 'Tableau', 1, 'admin'),
(37, 4, 'https://www.souhu.com', 'Tableau', 1, 'admin'),
(38, 4, 'https://www.qq.com', '', 0, ''),
(39, 6, 'https://www.sina.com.cn', '', 0, ''),
(40, 6, 'https://www.baidu.com', '', 0, ''),
(41, 7, 'https://translate.google.cn/#view=home&op=translate&sl=en&tl=zh-CN&text=ASSERTIONasds', 'Tableau', 0, ''),
(43, 8, 'http://192.172.1.240/#/site/HC_Tableau_Server/views/_25/sheet0', 'Tableau', 1, 'admin'),
(47, 12, 'http://192.172.1.240/#/site/HC_Tableau_Server/views/_25/sheet0', 'Tableau', 1, 'admin'),
(48, 13, 'http://192.172.1.240/#/site/HC_Tableau_Server/views/_48/sheet0', 'Tableau', 1, 'admin'),
(61, 26, '', 'Tableau', 0, ''),
(60, 25, '', 'Tableau', 0, ''),
(52, 17, 'http://192.172.1.240/#/site/HC_Tableau_Server/views/_25/sheet0', 'Tableau', 1, 'admin'),
(53, 18, 'http://192.172.1.240/#/site/HC_Tableau_Server/views/HR_0/HR', 'Tableau', 1, 'admin'),
(58, 23, '', 'Tableau', 0, ''),
(55, 20, 'http://192.172.1.240/#/site/HC_Tableau_Server/views/_31/sheet0', 'Tableau', 1, 'admin'),
(62, 27, 'https://www.baidu.com', '', 0, ''),
(63, 28, 'https://www.sina.com.cn', '', 0, ''),
(64, 29, '', 'Tableau', 0, ''),
(65, 30, 'https://developers.weixin.qq.com/miniprogram/dev/api/', '', 0, ''),
(66, 31, 'http://192.172.1.240/#/site/HC_Tableau_Server/views/_25/sheet0', 'Tableau', 1, 'admin'),
(67, 32, 'www.baidu.com', '', 0, '');

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
  `status` tinyint(1) DEFAULT '1' COMMENT '是否启用',
  `public` tinyint(1) DEFAULT '0' COMMENT '是否公开',
  `user_id` int(11) DEFAULT NULL COMMENT '创建者ID',
  `resources_order` smallint(6) DEFAULT '0' COMMENT '排序',
  `open_type` int(11) DEFAULT '0' COMMENT '当前窗口/新窗口',
  `remark` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `update_time` datetime NOT NULL COMMENT '修改日期',
  `delete_time` datetime DEFAULT NULL COMMENT '软删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `resources`
--

INSERT INTO `resources` (`id`, `pid`, `theme_id`, `menu_title`, `type`, `status`, `public`, `user_id`, `resources_order`, `open_type`, `remark`, `update_time`, `delete_time`) VALUES
(2, 0, 2, '考勤', 1, 1, 1, 1, 4, 0, NULL, '2019-09-16 00:13:30', NULL),
(3, 2, 2, '签卡', 2, 1, 1, 1, 0, 0, NULL, '2019-09-14 08:51:54', NULL),
(4, 3, 2, '查看打卡记录', 3, 1, 1, 1, 0, 0, NULL, '2019-09-15 02:14:19', '2019-09-15 02:57:55'),
(6, -1, 2, '首页', 0, 1, 1, 1, 0, 0, NULL, '2019-09-15 04:02:06', NULL),
(7, 3, 2, '补卡', 3, 1, 1, 1, 0, 0, NULL, '2019-09-15 02:32:24', '2019-09-15 02:34:53'),
(8, 3, 2, '日常打卡记录', 3, 1, 1, 1, 2, 0, NULL, '2019-09-16 00:03:33', NULL),
(9, 3, 2, '异常打卡记录', 3, 1, 1, 1, 4, 0, NULL, '2019-09-16 00:16:09', NULL),
(10, 3, 2, '补签', 3, 1, 1, 1, 3, 0, NULL, '2019-09-16 00:03:35', NULL),
(11, 2, 2, '请假', 2, 1, 0, 1, 1, 0, NULL, '2019-09-16 00:07:31', NULL),
(12, 11, 2, '休假申请', 3, 1, 0, 1, 0, 0, NULL, '2019-09-15 03:02:36', NULL),
(13, 11, 2, '假期余额查询', 3, 1, 0, 1, 1, 0, NULL, '2019-09-16 00:37:18', NULL),
(14, 0, 2, '人事', 1, 1, 0, 1, 3, 0, NULL, '2019-09-16 00:13:09', NULL),
(15, 14, 2, '人事变动', 2, 1, 0, 1, 0, 0, NULL, '2019-09-15 03:04:13', '2019-09-15 03:04:23'),
(16, 14, 2, '入职', 2, 1, 0, 1, 0, 0, NULL, '2019-09-15 03:04:31', NULL),
(17, 16, 2, '入职流程', 3, 1, 0, 1, 0, 0, NULL, '2019-09-15 03:04:44', NULL),
(18, 16, 2, '入职申请', 3, 1, 0, 1, 0, 0, NULL, '2019-09-15 08:39:09', NULL),
(19, 14, 2, '离职', 2, 1, 0, 1, 0, 0, NULL, '2019-09-15 03:05:14', NULL),
(20, 19, 2, '离职人员', 3, 1, 0, 1, 0, 0, NULL, '2019-09-15 03:45:03', NULL),
(21, 19, 2, '离职报告', 3, 1, 0, 2, 0, 0, NULL, '2019-09-18 01:06:29', NULL),
(22, 0, 3, '财务', 1, 1, 0, 1, 0, 0, NULL, '2019-09-16 00:57:15', NULL),
(23, 22, 3, '发票申报', 2, 1, 0, 1, 0, 0, NULL, '2019-09-17 00:21:36', NULL),
(24, 23, 3, '发票申报流程', 3, 1, 0, 1, 0, 0, NULL, '2019-09-17 00:21:42', NULL),
(25, 0, 4, '考勤', 1, 1, 1, 1, 0, 0, NULL, '2019-09-17 08:24:50', NULL),
(26, 25, 4, '打卡', 2, 1, 1, 1, 0, 0, NULL, '2019-09-17 08:24:56', NULL),
(27, 26, 4, '查看打卡记录', 3, 1, 1, 1, 0, 0, NULL, '2019-09-17 08:25:16', NULL),
(28, 26, 4, '补卡', 3, 1, 1, 1, 0, 0, NULL, '2019-09-17 08:25:47', NULL),
(29, 25, 4, '请假', 2, 1, 1, 1, 0, 0, NULL, '2019-09-17 09:09:27', NULL),
(30, 29, 4, '请假申请流程', 3, 1, 0, 1, 0, 0, NULL, '2019-09-17 09:10:35', NULL),
(31, 19, 2, '离职申请', 3, 1, 0, 1, 0, 0, NULL, '2019-09-18 02:21:58', NULL),
(32, 29, 4, '休假申请', 3, 1, 0, 1, 0, 0, NULL, '2019-09-18 02:41:41', NULL);

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
(1, 2, '考勤专员', '', 1, 0, NULL, '2019-09-22 07:10:04', NULL);

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

--
-- 转存表中的数据 `role_resources`
--

INSERT INTO `role_resources` (`resources_id`, `role_id`) VALUES
(2, 1),
(11, 1),
(13, 1),
(12, 1),
(3, 1),
(9, 1),
(10, 1),
(8, 1);

-- --------------------------------------------------------

--
-- 表的结构 `theme`
--

DROP TABLE IF EXISTS `theme`;
CREATE TABLE IF NOT EXISTS `theme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `theme_name` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '主题名称',
  `department` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '部门',
  `manager` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '管理员名称',
  `manager_id` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '管理员工号',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用',
  `remark` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `update_time` datetime DEFAULT NULL,
  `delete_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `theme`
--

INSERT INTO `theme` (`id`, `theme_name`, `department`, `manager`, `manager_id`, `status`, `remark`, `update_time`, `delete_time`) VALUES
(1, '系统默认', NULL, '超级管理员', 'admin', 1, NULL, '2019-09-10 07:08:40', NULL),
(2, '虎彩印刷-东莞', '人力资源中心', '代青', '10105', 1, NULL, '2019-09-10 07:08:40', NULL),
(3, '虎彩印艺-深圳', '信息与数字化中心', '邓志雄', '9060479', 1, NULL, '2019-09-16 00:47:57', NULL),
(4, '虎彩印艺-广州', '营销中心', '李奎', '50120', 1, NULL, '2019-09-17 08:21:03', NULL),
(6, '虎彩印艺-山东', '未知', '何帅', '9034021', 1, NULL, '2019-09-18 07:22:56', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_no` char(8) COLLATE utf8_bin NOT NULL COMMENT '工号',
  `user_name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '用户名',
  `department_desc` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `company` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `company_desc` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `job` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `job_desc` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '邮箱',
  `password` char(32) COLLATE utf8_bin DEFAULT NULL COMMENT '密码',
  `department` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '部门',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用',
  `admin` tinyint(1) NOT NULL DEFAULT '0' COMMENT '管理员 -- 可以查看所有主题下所有链接',
  `last_login` datetime DEFAULT NULL COMMENT '最后登录时间',
  `update_time` datetime DEFAULT NULL,
  `delete_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`id`, `user_no`, `user_name`, `department_desc`, `company`, `company_desc`, `job`, `job_desc`, `email`, `password`, `department`, `status`, `admin`, `last_login`, `update_time`, `delete_time`) VALUES
(1, 'admin', '超级管理员', NULL, NULL, NULL, NULL, NULL, NULL, '202cb962ac59075b964b07152d234b70', NULL, 1, 1, NULL, NULL, NULL),
(2, '10105', '代青', '人力资源中心', '1000', '虎彩印艺股份有限公司', '20100086', '薪酬福利经理', NULL, 'e10adc3949ba59abbe56e057f20f883e', '0', 1, 0, NULL, '2019-09-11 01:35:22', NULL),
(3, '9060479', '邓志雄', '信息与数字化中心', '1000', '虎彩印艺股份有限公司', '50094640', '资深企业架构师', NULL, '202cb962ac59075b964b07152d234b70', '50094626', 1, 0, NULL, '2019-09-16 02:55:36', NULL),
(5, '50120', '李奎', '营销中心', '1000', '虎彩印艺股份有限公司', '20100327', '业务员', NULL, 'e10adc3949ba59abbe56e057f20f883e', '0', 1, 0, NULL, '2019-09-17 08:16:59', NULL),
(6, '6005', '刘海霞', NULL, '1030', '青海虎彩印刷有限公司', '20800246', 'MC', NULL, 'e10adc3949ba59abbe56e057f20f883e', '10800050', 1, 0, NULL, '2019-09-18 03:56:03', NULL),
(7, '9034021', '何帅', NULL, '1020', '山东虎彩泰山印刷有限公司', '20700064', '翻版设计', NULL, 'e10adc3949ba59abbe56e057f20f883e', '10700040', 1, 0, NULL, '2019-09-18 07:22:56', NULL),
(8, '40297', '侯文斌', NULL, '1000', '虎彩印艺股份有限公司', '20300036', '内销产品工程师', NULL, '202cb962ac59075b964b07152d234b70', '10300003', 1, 0, NULL, '2019-09-26 12:32:52', NULL);

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
(3, 8),
(3, 10),
(3, 9),
(3, 3),
(3, 12),
(3, 13),
(3, 11),
(3, 2),
(2, 25),
(2, 30),
(2, 29);

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
(3, 1);

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
(2, 2),
(2, 3),
(3, 3),
(5, 4),
(2, 4),
(3, 2),
(7, 6);

-- --------------------------------------------------------

--
-- 表的结构 `verify_account`
--

DROP TABLE IF EXISTS `verify_account`;
CREATE TABLE IF NOT EXISTS `verify_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(45) COLLATE utf8_bin NOT NULL,
  `password` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `theme_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='权限校验账号管理表';

--
-- 转存表中的数据 `verify_account`
--

INSERT INTO `verify_account` (`id`, `account`, `password`, `admin_id`, `theme_id`) VALUES
(1, 'admin', 'Phl09065587..', 1, 2);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
