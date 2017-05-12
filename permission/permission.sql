CREATE TABLE `portal_employee_role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '员工id',
  `role_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '角色id',
  `effect_startdate` char(8) NOT NULL DEFAULT '00000000' COMMENT '服务开始日期',
  `effect_enddate` char(8) NOT NULL DEFAULT '99999999' COMMENT '服务结束时间',
  `creator_id` int(11) NOT NULL DEFAULT '0' COMMENT '当前维护人员ID',
  `org_id` int(11) NOT NULL DEFAULT '0' COMMENT '当前维护人所在部门',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifytime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `deleteflag` tinyint(3) NOT NULL DEFAULT '0' COMMENT '逻辑删除标识',
  PRIMARY KEY (`id`),
  KEY `index_employee_role_employee_id` (`employee_id`,`deleteflag`)
) ENGINE=MyISAM AUTO_INCREMENT=46005 DEFAULT CHARSET=utf8mb4 COMMENT='用户角色分配表'

CREATE TABLE `portal_role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '分类信息id，role_category表id',
  `name` varchar(32) NOT NULL COMMENT '角色名字',
  `type` tinyint(3) NOT NULL DEFAULT '0' COMMENT '角色类型[APPEND_ROLE:0:附加角色;FUNCTIONS_ROLE:1:职能角色]',
  `memo` varchar(256) DEFAULT '' COMMENT '角色中文备注',
  `creator_id` int(11) NOT NULL DEFAULT '0' COMMENT '当前维护人员ID',
  `org_id` int(11) NOT NULL DEFAULT '0' COMMENT '当前维护人所在部门',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifytime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `deleteflag` tinyint(3) NOT NULL DEFAULT '0' COMMENT '逻辑删除标识',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_NAME` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=451 DEFAULT CHARSET=utf8mb4 COMMENT='角色定义表'

CREATE TABLE `portal_role_category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '分类名称',
  `memo` varchar(500) NOT NULL DEFAULT '' COMMENT '备注',
  `creator_id` int(11) NOT NULL DEFAULT '0' COMMENT '当前维护人员ID',
  `org_id` int(11) NOT NULL DEFAULT '0' COMMENT '当前维护人所在部门',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifytime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `deleteflag` tinyint(3) NOT NULL DEFAULT '0' COMMENT '逻辑删除标识',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COMMENT='角色分类表'

CREATE TABLE `portal_position_role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `position_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '岗位id',
  `role_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '角色id',
  `creator_id` int(11) NOT NULL DEFAULT '0' COMMENT '当前维护人员ID',
  `org_id` int(11) NOT NULL DEFAULT '0' COMMENT '当前维护人所在部门',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifytime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `deleteflag` tinyint(3) NOT NULL DEFAULT '0' COMMENT '逻辑删除标识',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21772 DEFAULT CHARSET=utf8mb4 COMMENT='ehr岗位对应默认权限关系表'

CREATE TABLE `portal_position` (
  `id` int(11) unsigned NOT NULL,
  `name` varchar(128) NOT NULL DEFAULT '' COMMENT '职位名称',
  `shortname` varchar(128) NOT NULL DEFAULT '' COMMENT '职位简称',
  `parent_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '父岗位id',
  `position_type` varchar(32) NOT NULL DEFAULT '' COMMENT '职位类型',
  `position_channel` varchar(32) NOT NULL DEFAULT '' COMMENT '职位通道',
  `position_level` varchar(32) NOT NULL DEFAULT '' COMMENT '职级',
  `position_levelname` varchar(32) NOT NULL DEFAULT '' COMMENT '职级名称',
  `order_idx` int(11) NOT NULL DEFAULT '0' COMMENT '排列序号',
  `close_flag` tinyint(2) NOT NULL DEFAULT '0' COMMENT '封存标志[OPEN:0:解封;CLOSED:1:封存]',
  `creator_id` int(11) NOT NULL DEFAULT '0' COMMENT '当前维护人员ID',
  `org_id` int(11) NOT NULL DEFAULT '0' COMMENT '当前维护人所在部门',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifytime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `deleteflag` tinyint(3) NOT NULL DEFAULT '0' COMMENT '逻辑删除标识',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='ehr对应职级岗位表'

CREATE TABLE `portal_role_permission` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(11) unsigned NOT NULL COMMENT '角色id',
  `permission_id` int(11) unsigned NOT NULL COMMENT '权限id',
  `level` tinyint(3) NOT NULL COMMENT '权限定义级别[SYSTEM:1:系统级;ORG_AND_SUB:2:部门及子部门;ORG:3:部门级;USER_AND_SUB:4:用户及下属级;USER:5:用户级;SUBUSER_AND_MAINTENTANCE:6:下属及维护级;MAINTENTANCE:7:维护级;CUSTOM:8:自定义]',
  `creator_id` int(11) NOT NULL DEFAULT '0' COMMENT '当前维护人员ID',
  `org_id` int(11) NOT NULL DEFAULT '0' COMMENT '当前维护人所在部门',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifytime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `deleteflag` tinyint(3) NOT NULL DEFAULT '0' COMMENT '逻辑删除标识',
  PRIMARY KEY (`id`),
  KEY `index_role_permission_role_id` (`role_id`,`deleteflag`),
  KEY `idx_role_permission_id` (`permission_id`,`id`,`deleteflag`)
) ENGINE=MyISAM AUTO_INCREMENT=292954 DEFAULT CHARSET=utf8mb4 COMMENT='角色权限关系表'

CREATE TABLE `portal_permission` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(256) NOT NULL COMMENT '权限code',
  `memo` varchar(256) NOT NULL DEFAULT '' COMMENT '权限中文备注',
  `domains` varchar(512) NOT NULL DEFAULT '' COMMENT '隶属域名(多个逗号隔开)',
  `access_count` int(11) NOT NULL DEFAULT '0' COMMENT '使用次数',
  `last_access_time` char(14) NOT NULL DEFAULT '00000000000000' COMMENT '最后使用时间',
  `project_name` varchar(40) NOT NULL DEFAULT '' COMMENT '隶属系统',
  `permission_group` varchar(40) NOT NULL DEFAULT '' COMMENT '隶属权限组',
  `creator_id` int(11) NOT NULL DEFAULT '0' COMMENT '创建者id',
  `org_id` int(11) NOT NULL DEFAULT '0' COMMENT '所属部门',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifytime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleteflag` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1228 DEFAULT CHARSET=utf8mb4 COMMENT='权限编码表'