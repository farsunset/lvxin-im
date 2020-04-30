
create database lvxin_db;

CREATE TABLE `t_lvxin_cimsession` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account` varchar(32) NOT NULL COMMENT '用户账号',
  `nid` varchar(255) DEFAULT NULL COMMENT '长连接ID',
  `deviceId` varchar(64) NOT NULL COMMENT '用户设备ID',
  `channel` varchar(32) NOT NULL COMMENT '用户终端类型',
  `host` varchar(15) NOT NULL COMMENT '服务器IP',
  `deviceModel` varchar(64) NOT NULL COMMENT '用户设备型号',
  `clientVersion` varchar(32) DEFAULT NULL COMMENT '客户端版本',
  `systemVersion` varchar(32) NOT NULL COMMENT '客户端系统版本',
  `longitude` double DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `apns` int(11) NOT NULL COMMENT 'apns状态 0关闭 1开启',
  `state` int(11) NOT NULL COMMENT '连接状态 0在线，1离线',
  `bindTime` bigint(20) NOT NULL COMMENT '连接创建时间戳',
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_ACCOUNT_UNIQUE` (`account`) USING HASH
) ENGINE=InnoDB  CHARSET=utf8;

CREATE TABLE `t_lvxin_comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account` varchar(32) DEFAULT NULL,
  `content` varchar(320) DEFAULT NULL,
  `reply` varchar(32) DEFAULT NULL,
  `sourceId` varchar(32) DEFAULT NULL,
  `targetId` bigint(20) DEFAULT NULL,
  `type` varchar(2) DEFAULT NULL,
  `timestamp` bigint(13) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_TARGET_ID` (`targetId`) USING HASH
) ENGINE=InnoDB CHARSET=utf8mb4;

CREATE TABLE `t_lvxin_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(200) DEFAULT NULL,
  `domain` varchar(32) DEFAULT NULL,
  `name` varchar(32) NOT NULL,
  `value` varchar(2000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB CHARSET=utf8mb4;

CREATE TABLE `t_lvxin_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category` varchar(16) DEFAULT NULL,
  `founder` varchar(32) NOT NULL,
  `name` varchar(16) NOT NULL,
  `summary` varchar(200) DEFAULT NULL,
  `timestamp` bigint(13) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FOUNDER` (`founder`) USING HASH
) ENGINE=InnoDB CHARSET=utf8mb4;

CREATE TABLE `t_lvxin_group_member` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account` varchar(32) DEFAULT NULL,
  `groupId` bigint(20) DEFAULT NULL,
  `host` varchar(255) DEFAULT NULL,
  `timestamp` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_GROUP_ID` (`groupId`) USING BTREE,
  KEY `IDX_ACCOUNT` (`account`) USING HASH
) ENGINE=InnoDB CHARSET=utf8;

CREATE TABLE `t_lvxin_manager` (
  `account` varchar(20) NOT NULL,
  `name` varchar(16) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  `state` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`account`)
) ENGINE=InnoDB CHARSET=utf8;

CREATE TABLE `t_lvxin_message` (
  `id` bigint(20) NOT NULL,
  `action` varchar(255) NOT NULL,
  `content` varchar(3200) DEFAULT NULL,
  `extra` varchar(1000) DEFAULT NULL,
  `format` varchar(2) DEFAULT NULL,
  `receiver` varchar(64) NOT NULL,
  `sender` varchar(64) NOT NULL,
  `state` varchar(2) NOT NULL,
  `timestamp` bigint(20) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_SENDER` (`sender`) USING HASH,
  KEY `IDX_RECEIVER` (`receiver`) USING HASH
) ENGINE=InnoDB CHARSET=utf8mb4 ;

CREATE TABLE `t_lvxin_microapp` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(64) NOT NULL,
  `color` varchar(10) DEFAULT NULL,
  `name` varchar(20) NOT NULL,
  `url` varchar(320) NOT NULL,
  `sort` int(11) DEFAULT NULL,
  `timestamp` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_CODE` (`code`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `t_lvxin_microserver` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account` varchar(32) NOT NULL,
  `greet` varchar(320) DEFAULT NULL,
  `name` varchar(20) NOT NULL,
  `url` varchar(320) DEFAULT NULL,
  `website` varchar(320) DEFAULT NULL,
  `description` varchar(320) DEFAULT NULL,
  `state` varchar(2) NOT NULL,
  `timestamp` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_ACCOUNT` (`account`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

CREATE TABLE `t_lvxin_microserver_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account` varchar(32) DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `content` varchar(1024) DEFAULT NULL,
  `fid` bigint(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB CHARSET=utf8;

CREATE TABLE `t_lvxin_moment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account` varchar(32) NOT NULL,
  `content` varchar(2000) DEFAULT NULL,
  `extra` varchar(1000) DEFAULT NULL,
  `text` varchar(1000) NOT NULL,
  `type` varchar(2) DEFAULT NULL,
  `timestamp` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_ACCOUNT` (`account`) USING HASH,
  KEY `IDX_TIMESTAMP` (`timestamp`) USING BTREE
) ENGINE=InnoDB CHARSET=utf8mb4;

CREATE TABLE `t_lvxin_moment_rule` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `source` varchar(32) NOT NULL,
  `target` varchar(32) NOT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_SOURCE` (`source`) USING HASH,
  KEY `IDX_TARGET` (`target`) USING HASH
) ENGINE=InnoDB  CHARSET=utf8;

CREATE TABLE `t_lvxin_organization` (
  `code` varchar(32) NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `parentCode` varchar(32) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB CHARSET=utf8;

CREATE TABLE `t_lvxin_subscriber` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account` varchar(32) NOT NULL,
  `target` varchar(32) NOT NULL,
  `timestamp` varchar(13) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_ACCOUNT` (`account`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `t_lvxin_tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account` varchar(1024) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `source` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB CHARSET=utf8mb4;

CREATE TABLE `t_lvxin_user` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `account` varchar(20) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `motto` varchar(200) DEFAULT NULL,
  `name` varchar(16) DEFAULT NULL,
  `code` varchar(20) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `grade` int(11) DEFAULT NULL,
  `feature` varchar(32) DEFAULT NULL,
  `state` varchar(1) DEFAULT NULL,
  `timestamp` bigint(13) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_ACCOUNT` (`account`) USING HASH
) ENGINE=InnoDB CHARSET=utf8mb4;

