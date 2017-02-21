/*
Navicat MySQL Data Transfer

Source Server         : ali
Source Server Version : 50633
Source Host           : 121.40.156.206:3306
Source Database       : businessFBI_app

Target Server Type    : MYSQL
Target Server Version : 50633
File Encoding         : 65001

Date: 2017-02-20 10:48:07
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `administrator`
-- ----------------------------
DROP TABLE IF EXISTS `administrator`;
CREATE TABLE `administrator` (
  `uId` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，表ID',
  `user_name` varchar(45) NOT NULL COMMENT '管理员名称',
  `password` varchar(45) NOT NULL COMMENT '管理员密码',
  `permission` varchar(1) NOT NULL COMMENT '管理员权限',
  PRIMARY KEY (`uId`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of administrator
-- ----------------------------

-- ----------------------------
-- Table structure for `adver_content_now`
-- ----------------------------
DROP TABLE IF EXISTS `adver_content_now`;
CREATE TABLE `adver_content_now` (
  `aId` int(11) NOT NULL COMMENT '主键，表ID',
  `description` char(50) NOT NULL COMMENT '描述',
  `width` int(11) DEFAULT NULL COMMENT '广告图宽度',
  `height` int(11) DEFAULT NULL COMMENT '广告图高度',
  `img_path` char(100) DEFAULT NULL COMMENT '图片地址',
  `relate_admin` int(11) DEFAULT NULL COMMENT '添加图片的管理员ID',
  `publish_time` date DEFAULT NULL COMMENT '发布时间',
  `title` varchar(100) DEFAULT NULL COMMENT '广告图名称',
  `link_url` varchar(200) DEFAULT NULL COMMENT '广告图连接',
  `ad_type` int(11) DEFAULT NULL COMMENT '广告类型，value=0:carousel slide(轮播)',
  PRIMARY KEY (`aId`),
  KEY `relate_admin` (`relate_admin`),
  CONSTRAINT `adver_content_now_ibfk_1` FOREIGN KEY (`relate_admin`) REFERENCES `administrator` (`uId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of adver_content_now
-- ----------------------------

-- ----------------------------
-- Table structure for `adver_product_now`
-- ----------------------------
DROP TABLE IF EXISTS `adver_product_now`;
CREATE TABLE `adver_product_now` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，表ID',
  `feature` varchar(100) DEFAULT NULL COMMENT '推广平台特点',
  `related_admin` int(11) DEFAULT NULL COMMENT '审核的管理员ID',
  `sort_value` float DEFAULT NULL COMMENT '推广平台的得分',
  `product_id` int(11) DEFAULT NULL COMMENT '推广平台ID',
  `publish_time` date DEFAULT NULL COMMENT '发布时间',
  `idx` int(11) DEFAULT NULL COMMENT '推广平台顺序',
  PRIMARY KEY (`id`),
  KEY `adver_admin_fk` (`related_admin`),
  KEY `adver_pro_now` (`product_id`),
  CONSTRAINT `adver_product_now_ibfk_1` FOREIGN KEY (`related_admin`) REFERENCES `administrator` (`uId`),
  CONSTRAINT `adver_product_now_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `platform` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of adver_product_now
-- ----------------------------

-- ----------------------------
-- Table structure for `bank_eval`
-- ----------------------------
DROP TABLE IF EXISTS `bank_eval`;
CREATE TABLE `bank_eval` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bank_id` int(11) NOT NULL,
  `release_score` double DEFAULT NULL COMMENT '发行能力',
  `profit_score` double DEFAULT NULL COMMENT '收益能力',
  `risk_score` double DEFAULT NULL COMMENT '风控能力',
  `product_rich_score` double DEFAULT NULL COMMENT '产品丰富性能力',
  `info_disclosure_score` double DEFAULT NULL COMMENT '信息披露规范性 ',
  `evaluate_score` double DEFAULT NULL COMMENT '评估问卷测度',
  `total_score` double DEFAULT NULL COMMENT '综合性理财能力',
  `create_time` date NOT NULL,
  `update_time` date NOT NULL,
  `is_delete` int(11) NOT NULL,
  `start_date` date DEFAULT NULL COMMENT '统计起始时间',
  `end_date` date DEFAULT NULL COMMENT '统计结束时间',
  PRIMARY KEY (`id`),
  KEY `eval_bank_id_idx` (`bank_id`),
  CONSTRAINT `eval_bank_id` FOREIGN KEY (`bank_id`) REFERENCES `bank_plat` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='银行评价信息';

-- ----------------------------
-- Records of bank_eval
-- ----------------------------

-- ----------------------------
-- Table structure for `bank_eval_copy`
-- ----------------------------
DROP TABLE IF EXISTS `bank_eval_copy`;
CREATE TABLE `bank_eval_copy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bank_id` int(11) DEFAULT NULL,
  `person_survival_scale` double DEFAULT NULL COMMENT '个人发行能力  存续规模',
  `person_survival_scale_rate` double DEFAULT NULL COMMENT '个人发行能力  存续规模增长率',
  `person_daily_product` double DEFAULT NULL COMMENT '个人发行能力 日均在售产品',
  `agency_survival_scale` double DEFAULT NULL COMMENT '机构发行能力 存续规模',
  `agency_survival_scale_rate` double DEFAULT NULL COMMENT '机构发行能力 存续规模增长率',
  `peer_survival_scale` double DEFAULT NULL COMMENT '同业发行能力 存续规模',
  `peer_survival_scale_rate` double DEFAULT NULL COMMENT '同业发行能力 存续规模增长率',
  `release_score` double DEFAULT NULL COMMENT '发行能力总得分',
  `person_expect` double DEFAULT NULL COMMENT '预期收益型-个人',
  `agency_expect` double DEFAULT NULL COMMENT '预期收益型-机构',
  `peer_expect` double DEFAULT NULL COMMENT '预期收益型-同业',
  `value_type` double DEFAULT NULL COMMENT '净值型',
  `star_rate` double DEFAULT NULL COMMENT '星级评定',
  `profit_score` double DEFAULT NULL COMMENT '收益能力总得分',
  `profit_product` double DEFAULT NULL COMMENT '产品收益实现得分',
  `risk_provision` double DEFAULT NULL COMMENT '是否设置风险拨备',
  `risk_manage` double DEFAULT NULL COMMENT '风险管理流程设计、措施及手段',
  `risk_adjust` double DEFAULT NULL COMMENT '风险事件调整(扣分项)',
  `risk_score` double DEFAULT NULL COMMENT '风控能力总得分',
  `limit_type` double DEFAULT NULL COMMENT '期限类型',
  PRIMARY KEY (`id`),
  KEY `eval_bank_id_idx` (`bank_id`),
  CONSTRAINT `copy_eval_bank_id` FOREIGN KEY (`bank_id`) REFERENCES `bank_plat` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='银行评价信息------暂时备用';

-- ----------------------------
-- Records of bank_eval_copy
-- ----------------------------

-- ----------------------------
-- Table structure for `bank_info`
-- ----------------------------
DROP TABLE IF EXISTS `bank_info`;
CREATE TABLE `bank_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bank_id` int(11) NOT NULL COMMENT '银行id,外键',
  `start_date` date DEFAULT NULL COMMENT '统计起始时间',
  `end_date` date DEFAULT NULL COMMENT '统计结束时间',
  `total_profit` double DEFAULT NULL COMMENT '净利润总额(以亿为单位)',
  `total_equity` double DEFAULT NULL COMMENT '股东权益总额(以亿为单位)',
  `bad_asset` double DEFAULT NULL COMMENT '不良资产',
  `bad_loan_rate` double DEFAULT NULL COMMENT '不良贷款率(百分比)',
  `total_provision` double DEFAULT NULL COMMENT '总拨备(以亿为单位)',
  `loss_asset` double DEFAULT NULL COMMENT '资产减值损失(以亿为单位)',
  `total_asset` double DEFAULT NULL COMMENT '总资产(以亿为单位)',
  `total_deposit` double DEFAULT NULL COMMENT '存款总额(以亿为单位)',
  `total_loan` double DEFAULT NULL COMMENT '贷款总额(以亿为单位)',
  `total_other` double DEFAULT NULL COMMENT '同业及其他金融机构存放款项总额(以亿为单位)',
  `income` double DEFAULT NULL COMMENT '营业收入(以亿为单位)',
  `interest_income` double DEFAULT NULL COMMENT '利息净收入',
  `commission` double DEFAULT NULL COMMENT '手续费和佣金净收入',
  `stockholder_num` int(11) DEFAULT NULL COMMENT '股东数',
  `create_time` date NOT NULL,
  `update_time` date NOT NULL,
  `is_delete` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bank_info_bank_id_idx` (`bank_id`),
  CONSTRAINT `bank_info_bank_id` FOREIGN KEY (`bank_id`) REFERENCES `bank_plat` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='银行详细信息';

-- ----------------------------
-- Records of bank_info
-- ----------------------------

-- ----------------------------
-- Table structure for `bank_plat`
-- ----------------------------
DROP TABLE IF EXISTS `bank_plat`;
CREATE TABLE `bank_plat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plat_id` int(11) NOT NULL COMMENT '平台id，外键',
  `type` int(11) DEFAULT NULL COMMENT '银行类型',
  `is_listed` int(11) DEFAULT NULL COMMENT '是否上市',
  `create_time` date NOT NULL,
  `update_time` date NOT NULL,
  `is_delete` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `plat_id_UNIQUE` (`plat_id`),
  KEY `bank_plat_id_idx` (`plat_id`),
  KEY `bank_type_idx` (`type`),
  CONSTRAINT `bank_plat_id` FOREIGN KEY (`plat_id`) REFERENCES `platform` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `bank_type` FOREIGN KEY (`type`) REFERENCES `bank_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='银行基础信息';

-- ----------------------------
-- Records of bank_plat
-- ----------------------------

-- ----------------------------
-- Table structure for `bank_product`
-- ----------------------------
DROP TABLE IF EXISTS `bank_product`;
CREATE TABLE `bank_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bank_id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL COMMENT '产品名称',
  `product_num` varchar(45) DEFAULT NULL COMMENT '产品代号',
  `period_num` int(11) DEFAULT NULL COMMENT '期数',
  `profit_type` varchar(100) DEFAULT NULL COMMENT '收益类型（产品类型（是否保本））',
  `limit_day` int(11) DEFAULT NULL COMMENT '产品期限(以天为单位)',
  `start_date` date DEFAULT NULL COMMENT '募集开始日',
  `end_date` date DEFAULT NULL COMMENT '募集结束日',
  `deadline` date DEFAULT NULL COMMENT '产品到期',
  `disbank` varchar(100) DEFAULT NULL COMMENT '发售银行---分行',
  `start_money` int(11) DEFAULT NULL COMMENT '起购金额（最低认购额）(以元为单位)',
  `add_money` int(11) DEFAULT NULL COMMENT '递增金额（最低追加额）',
  `limit_money` int(11) DEFAULT NULL COMMENT '认购上限',
  `area` varchar(100) DEFAULT NULL COMMENT '销售区域',
  `channel` varchar(100) DEFAULT NULL COMMENT '销售渠道',
  `is_transfer` int(11) DEFAULT NULL COMMENT '是否可转让 0 否 1 是',
  `customer` varchar(100) DEFAULT NULL COMMENT '目标客户',
  `state` int(11) DEFAULT NULL COMMENT '产品状态:0 在售 1 待销售 2 已成立 3 开放期  4 已销售',
  `risk_rank` int(11) DEFAULT NULL COMMENT '风险等级(1 2 3 4 5)  谨慎型产品(R1)、稳健型产品(R2)、平衡型产品(R3)、进取型产品(R4)、激进型产品(R5)',
  `issue_size` int(11) DEFAULT NULL COMMENT '发行规模(以元为单位)',
  `expect_profit_year` double DEFAULT NULL COMMENT '预期年化收益',
  `pub_time` date DEFAULT NULL COMMENT '成立日期（创建时间）',
  `notice` varchar(100) DEFAULT NULL COMMENT '签约前告知书',
  `trade` varchar(100) DEFAULT NULL COMMENT '网上交易服务协议',
  `customer_info` varchar(100) DEFAULT NULL COMMENT '客户权益须知',
  `manual` varchar(100) DEFAULT NULL COMMENT '产品说明书',
  `create_time` date NOT NULL,
  `update_time` date NOT NULL,
  `is_delete` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_rel_bank_idx` (`bank_id`),
  CONSTRAINT `product_rel_bank` FOREIGN KEY (`bank_id`) REFERENCES `bank_plat` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='银行理财产品标的';

-- ----------------------------
-- Records of bank_product
-- ----------------------------

-- ----------------------------
-- Table structure for `bank_type`
-- ----------------------------
DROP TABLE IF EXISTS `bank_type`;
CREATE TABLE `bank_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL COMMENT '描述',
  `create_time` date NOT NULL,
  `update_time` date NOT NULL,
  `is_delete` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='银行类型';

-- ----------------------------
-- Records of bank_type
-- ----------------------------

-- ----------------------------
-- Table structure for `businessman`
-- ----------------------------
DROP TABLE IF EXISTS `businessman`;
CREATE TABLE `businessman` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `com_stru_id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL COMMENT '高管姓名',
  `img_dir` varchar(100) DEFAULT NULL COMMENT '高管照片',
  `des` text COMMENT '高管简介',
  `img` varchar(255) DEFAULT NULL COMMENT '图片地址',
  `post` varchar(50) DEFAULT NULL COMMENT '高管职务',
  `sex` int(4) DEFAULT NULL COMMENT '性别',
  `age` int(10) DEFAULT NULL COMMENT '年龄',
  `education` int(1) DEFAULT NULL COMMENT '最高学历0. 其他；1. 本科；2.硕士（含MBA）；3. 博士；4. 博士后；5.EMBA',
  `school_type` int(4) DEFAULT NULL COMMENT '0. 其他； 1. 普通院校；2. 985和211院校或3.国外知名院校',
  `school` varchar(50) DEFAULT NULL COMMENT '毕业院校1',
  `school_type2` int(4) DEFAULT NULL COMMENT '0. 其他； 1. 普通院校；2. 985和211院校或3.国外知名院校',
  `school2` varchar(50) DEFAULT NULL COMMENT '毕业院校2',
  `has_professional_certificate` int(2) DEFAULT NULL COMMENT '有职业资格证书 ,0.无 1.有 ',
  `professional_certificate` varchar(100) DEFAULT NULL COMMENT '职业资格证书',
  `work_experience` int(4) DEFAULT NULL COMMENT '工作年限 ,0.其他；1.低于5年；2.五至十年（含）；3.十年至十五年；4.十五至二十年；5.二十年以上',
  `enterprise_type` int(4) DEFAULT NULL COMMENT '此前工作企业类型,0. 其他；1.普通企业：2. 知名大型企业；3. 政府机关及事业单位（包含学校）',
  `enterprise_field` int(4) DEFAULT NULL COMMENT '此前工作企业领域, 0.其他；1.快速消费品；2.互联网计算机；3.金融；4.管理咨询；5.房地产；6.会计师事务所；',
  `has_management_work` int(4) DEFAULT NULL COMMENT '是否从事过管理工作 0.其他；1.有中层管理经验；2. 有高管经验',
  `other` varchar(500) DEFAULT NULL COMMENT '其他加分项',
  `create_time` date NOT NULL,
  `update_time` date NOT NULL,
  `is_delete` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `businessman_company_structure_id_idx` (`com_stru_id`),
  CONSTRAINT `businessman_company_structure_id` FOREIGN KEY (`com_stru_id`) REFERENCES `company_structure` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='企业高管表';

-- ----------------------------
-- Records of businessman
-- ----------------------------

-- ----------------------------
-- Table structure for `city`
-- ----------------------------
DROP TABLE IF EXISTS `city`;
CREATE TABLE `city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL COMMENT '城市名称',
  `province` int(11) NOT NULL COMMENT '城市对应省份',
  `product_num` int(11) DEFAULT NULL COMMENT '平台数量',
  `create_time` date NOT NULL,
  `update_time` date NOT NULL,
  `is_delete` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `city_province_idx` (`province`),
  CONSTRAINT `city_province` FOREIGN KEY (`province`) REFERENCES `province` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='城市信息';

-- ----------------------------
-- Records of city
-- ----------------------------

-- ----------------------------
-- Table structure for `company`
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` date NOT NULL,
  `update_time` date NOT NULL,
  `is_delete` int(11) NOT NULL,
  `name` varchar(150) NOT NULL COMMENT '【工商】注册公司名称',
  `artificial_person` varchar(150) DEFAULT NULL COMMENT '【工商】法人',
  `type` varchar(150) DEFAULT NULL COMMENT '【工商】公司类型',
  `registered_capital` double DEFAULT NULL COMMENT '【工商】注册资本[varchar改为double]',
  `contributed_capital` double DEFAULT NULL COMMENT '【工商】实缴资本',
  `registered_address` varchar(100) DEFAULT NULL COMMENT '【工商】注册地址',
  `opening_date` date DEFAULT NULL COMMENT '【工商】注册时间',
  `approved_date` date DEFAULT NULL COMMENT '【工商】核准时间',
  `registration_authority` varchar(150) DEFAULT NULL COMMENT '【工商】注册机构',
  `has_annual_report` int(11) DEFAULT NULL COMMENT '【工商】是否有年报',
  `business_licence` varchar(150) DEFAULT NULL COMMENT '【工商】工商号',
  `licence_img` varchar(255) DEFAULT NULL COMMENT '工商号证',
  `institutional_framework` varchar(150) DEFAULT NULL COMMENT '【工商】机构号',
  `institutional_img` varchar(255) DEFAULT NULL COMMENT '机构号证',
  `tax_registration_num` varchar(150) DEFAULT NULL COMMENT '【工商】税号',
  `tax_img` varchar(255) DEFAULT NULL COMMENT '税务证',
  `business_scope` text COMMENT '经营范围',
  `registered_capital_change` text COMMENT '注册资本 变更',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公司信息表-工商信息';

-- ----------------------------
-- Records of company
-- ----------------------------

-- ----------------------------
-- Table structure for `company_structure`
-- ----------------------------
DROP TABLE IF EXISTS `company_structure`;
CREATE TABLE `company_structure` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `staff_nuk` int(11) DEFAULT NULL COMMENT '员工数量',
  `branch_num` int(11) DEFAULT NULL COMMENT '运营部数量',
  `company_struc` text COMMENT '公司组织架构（？）',
  `credit_institution` varchar(45) DEFAULT NULL COMMENT '增信机构（？）',
  `create_time` date DEFAULT NULL,
  `update_time` date DEFAULT NULL,
  `is_delete` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `company_id_UNIQUE` (`company_id`),
  CONSTRAINT `structure_company_id` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='组织结构（公司表）';

-- ----------------------------
-- Records of company_structure
-- ----------------------------

-- ----------------------------
-- Table structure for `everyday_plat_visit`
-- ----------------------------
DROP TABLE IF EXISTS `everyday_plat_visit`;
CREATE TABLE `everyday_plat_visit` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，表ID',
  `pId` int(11) NOT NULL DEFAULT '0' COMMENT '平台Id',
  `num_click` int(11) DEFAULT '0' COMMENT '总点击次数',
  `num_change` int(11) NOT NULL DEFAULT '0' COMMENT '相比较上次是增加还是减少，>0增加；<0减少',
  `last_update` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`Id`),
  KEY `pId` (`pId`),
  KEY `last_update` (`num_click`,`last_update`),
  CONSTRAINT `everyday_plat_visit_ibfk_1` FOREIGN KEY (`pId`) REFERENCES `platform` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8 COMMENT='每日统计表';

-- ----------------------------
-- Records of everyday_plat_visit
-- ----------------------------

-- ----------------------------
-- Table structure for `everymonth_plat_visit`
-- ----------------------------
DROP TABLE IF EXISTS `everymonth_plat_visit`;
CREATE TABLE `everymonth_plat_visit` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，表ID',
  `pId` int(11) NOT NULL DEFAULT '0' COMMENT '平台Id',
  `num_click` int(11) NOT NULL DEFAULT '0' COMMENT '总点击次数',
  `num_change` int(11) NOT NULL DEFAULT '0' COMMENT '相比较上次是增加还是减少，>0增加；<0减少',
  `last_update` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`Id`),
  KEY `pId` (`pId`),
  KEY `last_update` (`last_update`,`num_click`),
  CONSTRAINT `everymonth_plat_visit_ibfk_1` FOREIGN KEY (`pId`) REFERENCES `platform` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8 COMMENT='每月统计表';

-- ----------------------------
-- Records of everymonth_plat_visit
-- ----------------------------

-- ----------------------------
-- Table structure for `everyweek_plat_visit`
-- ----------------------------
DROP TABLE IF EXISTS `everyweek_plat_visit`;
CREATE TABLE `everyweek_plat_visit` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，表ID',
  `pId` int(11) NOT NULL DEFAULT '0' COMMENT '平台Id',
  `num_click` int(11) DEFAULT '0' COMMENT '总点击次数',
  `num_change` int(11) NOT NULL DEFAULT '0' COMMENT '相比较上次的变化量',
  `last_update` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`Id`),
  KEY `pId` (`pId`),
  KEY `last_update` (`last_update`,`num_click`),
  CONSTRAINT `everyweek_plat_visit_ibfk_1` FOREIGN KEY (`pId`) REFERENCES `platform` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8 COMMENT='每周统计表';

-- ----------------------------
-- Records of everyweek_plat_visit
-- ----------------------------

-- ----------------------------
-- Table structure for `exposure`
-- ----------------------------
DROP TABLE IF EXISTS `exposure`;
CREATE TABLE `exposure` (
  `eid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，表ID',
  `title` varchar(255) DEFAULT NULL COMMENT '曝光标题',
  `product_name` varchar(255) DEFAULT NULL COMMENT '曝光的平台名',
  `product_url` varchar(255) DEFAULT NULL COMMENT '曝光的平台URL',
  `content` mediumtext COMMENT '曝光的内容',
  `agree_cnt` int(11) DEFAULT '0' COMMENT '用户点赞数，管理员可编辑初始值',
  `comment_cnt` int(11) DEFAULT '0' COMMENT '用户评论数',
  `click_cnt` int(11) DEFAULT '0' COMMENT '曝光点击数，管理员可编辑初始值',
  `created_date` timestamp NULL DEFAULT NULL COMMENT '作者创建曝光的时间',
  `last_update` timestamp NULL DEFAULT NULL COMMENT '作者上一次更新的时间',
  `last_comment_editor` varchar(255) DEFAULT NULL,
  `last_comment` timestamp NULL DEFAULT NULL COMMENT '最后的评论者发布评论的时间',
  `checked_date` timestamp NULL DEFAULT NULL COMMENT '内容编辑或管理员最后审核的时间',
  `author_id` int(255) NOT NULL COMMENT '相关作者ID，一般不能为空',
  `admin_id` int(11) DEFAULT NULL COMMENT '审核人员的ID，可以为空',
  `state` int(11) DEFAULT '0' COMMENT '审核状态：0-未审核；1-审核通过；-1-审核不通过；2-作者关闭该曝光贴',
  `hot_value` double DEFAULT '0' COMMENT '后台根据点击率、评论数等信息计算出的热度值',
  PRIMARY KEY (`eid`),
  KEY `exposure_author_fk` (`author_id`),
  KEY `exposure_admin_fk` (`admin_id`),
  CONSTRAINT `exposure_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `administrator` (`uId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `exposure_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `user_information` (`uId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of exposure
-- ----------------------------

-- ----------------------------
-- Table structure for `exposure_rel_product`
-- ----------------------------
DROP TABLE IF EXISTS `exposure_rel_product`;
CREATE TABLE `exposure_rel_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，表ID',
  `pid` int(11) NOT NULL COMMENT '平台ID，外键PID',
  `eid` int(11) NOT NULL COMMENT '曝光ID，外键EID',
  PRIMARY KEY (`id`),
  KEY `proucture_ex` (`pid`),
  KEY `expose_product` (`eid`),
  CONSTRAINT `exposure_rel_product_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `exposure` (`eid`),
  CONSTRAINT `exposure_rel_product_ibfk_2` FOREIGN KEY (`pid`) REFERENCES `platform` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of exposure_rel_product
-- ----------------------------

-- ----------------------------
-- Table structure for `exposure_user_agree`
-- ----------------------------
DROP TABLE IF EXISTS `exposure_user_agree`;
CREATE TABLE `exposure_user_agree` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户曝光点赞表ID',
  `user_id` int(11) NOT NULL COMMENT '点赞用户的ID，不能为空，也即用户登录以后才能点赞',
  `created_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '用户点赞的时间，默认记录创建的时间',
  `exposure_id` int(11) NOT NULL COMMENT '曝光ID，外键EID',
  PRIMARY KEY (`id`),
  KEY `exposure_user_agree_fk` (`user_id`),
  KEY `exposure_id_fk` (`exposure_id`),
  CONSTRAINT `exposure_user_agree_ibfk_1` FOREIGN KEY (`exposure_id`) REFERENCES `exposure` (`eid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `exposure_user_agree_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user_information` (`uId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of exposure_user_agree
-- ----------------------------

-- ----------------------------
-- Table structure for `exposure_user_comment`
-- ----------------------------
DROP TABLE IF EXISTS `exposure_user_comment`;
CREATE TABLE `exposure_user_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '曝光评论表的ID',
  `user_id` int(11) NOT NULL COMMENT '评论者的ID，默认不能为空，要求用户登录后才能评论',
  `created_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '评论者评论的时间，默认为记录产生的时间',
  `content` varchar(500) DEFAULT NULL COMMENT '评论内容',
  `exposure_id` int(11) NOT NULL COMMENT '曝光ID，外键EID',
  PRIMARY KEY (`id`),
  KEY `exposure_user_comment_fk` (`user_id`),
  KEY `exposure_id_fk2` (`exposure_id`),
  CONSTRAINT `exposure_user_comment_ibfk_1` FOREIGN KEY (`exposure_id`) REFERENCES `exposure` (`eid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `exposure_user_comment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user_information` (`uId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=186 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of exposure_user_comment
-- ----------------------------

-- ----------------------------
-- Table structure for `finance_association`
-- ----------------------------
DROP TABLE IF EXISTS `finance_association`;
CREATE TABLE `finance_association` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL COMMENT '公司id,外键',
  `name` varchar(50) NOT NULL COMMENT '金融协会名字',
  PRIMARY KEY (`id`),
  KEY `finance_company_id_idx` (`company_id`),
  CONSTRAINT `finance_company_id` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='金融协会';

-- ----------------------------
-- Records of finance_association
-- ----------------------------

-- ----------------------------
-- Table structure for `hot_news_approval`
-- ----------------------------
DROP TABLE IF EXISTS `hot_news_approval`;
CREATE TABLE `hot_news_approval` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，表ID',
  `nId` int(11) NOT NULL COMMENT '热门新闻ID',
  `hotpoint` float DEFAULT NULL COMMENT '热度值',
  `isCheck` varchar(1) DEFAULT '0' COMMENT '是否经过审核',
  `related_admin` int(11) DEFAULT NULL COMMENT '审核管理员ID',
  `publish_time` datetime DEFAULT NULL COMMENT '发布时间',
  `idx` int(11) DEFAULT NULL COMMENT '热门新闻顺序',
  PRIMARY KEY (`id`),
  KEY `nId_hot_idx` (`nId`),
  KEY `admin_hot_idx` (`related_admin`),
  CONSTRAINT `hot_news_approval_ibfk_1` FOREIGN KEY (`related_admin`) REFERENCES `administrator` (`uId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `hot_news_approval_ibfk_2` FOREIGN KEY (`nId`) REFERENCES `news` (`nId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hot_news_approval
-- ----------------------------

-- ----------------------------
-- Table structure for `hot_product_approval`
-- ----------------------------
DROP TABLE IF EXISTS `hot_product_approval`;
CREATE TABLE `hot_product_approval` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，表ID',
  `pId` int(11) NOT NULL COMMENT '平台ID，外键PID',
  `hotpoint` int(11) DEFAULT NULL COMMENT '热度值',
  `isCheck` varchar(1) DEFAULT '0' COMMENT '是否审核，1是审核通过，0是审核不通过',
  `related_admin` int(11) DEFAULT NULL COMMENT '审核管理员ID',
  `publish_time` datetime DEFAULT NULL COMMENT '发布时间',
  `idx` int(11) DEFAULT NULL COMMENT '热门新闻顺序，数字越小越前面',
  PRIMARY KEY (`id`),
  KEY `pId_hot_idx` (`pId`),
  KEY `admin_hot_product_idx` (`related_admin`),
  CONSTRAINT `hot_product_approval_ibfk_1` FOREIGN KEY (`related_admin`) REFERENCES `administrator` (`uId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `hot_product_approval_ibfk_2` FOREIGN KEY (`pId`) REFERENCES `platform` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hot_product_approval
-- ----------------------------

-- ----------------------------
-- Table structure for `news`
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `nId` int(11) NOT NULL AUTO_INCREMENT COMMENT '新闻id',
  `title` varchar(500) DEFAULT NULL COMMENT '新闻标题',
  `abstracts` longtext COMMENT '新闻摘要',
  `author` varchar(45) DEFAULT NULL COMMENT '新闻作者',
  `category_id` int(11) DEFAULT NULL COMMENT '0-行业 1-政策 2-平台 3-数据 4-观点 5-曝光台 6-理财 7-研究 8-国外',
  `content` text COMMENT '新闻内容',
  `create_date` datetime DEFAULT NULL COMMENT '新闻创建日期',
  `source_site` varchar(100) DEFAULT NULL COMMENT '新闻来源',
  `indexed` int(1) NOT NULL DEFAULT '0' COMMENT '0未索引, 1已索引',
  PRIMARY KEY (`nId`),
  KEY `category` (`category_id`),
  CONSTRAINT `news_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `news_category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=66168 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news
-- ----------------------------

-- ----------------------------
-- Table structure for `news_approval`
-- ----------------------------
DROP TABLE IF EXISTS `news_approval`;
CREATE TABLE `news_approval` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，表ID',
  `nId` int(11) NOT NULL DEFAULT '0' COMMENT '新闻id',
  `isCheck` int(11) DEFAULT '0' COMMENT '是否审核',
  `related_admin` int(11) DEFAULT NULL COMMENT '审核的管理员',
  `polarity` int(1) DEFAULT '0' COMMENT '极性；0中性；-1负面；+1正面',
  `isrecom` int(11) DEFAULT '0' COMMENT '是否推荐',
  `click_times` int(11) DEFAULT '0' COMMENT '点击次数',
  PRIMARY KEY (`id`),
  UNIQUE KEY `nId_UNIQUE` (`nId`),
  KEY `nId_approval_idx` (`nId`),
  KEY `admin_approval_idx` (`related_admin`),
  KEY `FKC4BA8A2F55D89DB9` (`nId`),
  CONSTRAINT `news_approval_ibfk_1` FOREIGN KEY (`nId`) REFERENCES `news` (`nId`),
  CONSTRAINT `news_approval_ibfk_2` FOREIGN KEY (`related_admin`) REFERENCES `administrator` (`uId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=88783 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news_approval
-- ----------------------------

-- ----------------------------
-- Table structure for `news_category`
-- ----------------------------
DROP TABLE IF EXISTS `news_category`;
CREATE TABLE `news_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) DEFAULT NULL COMMENT '新闻类别名称',
  `father_name` varchar(255) DEFAULT NULL COMMENT '新闻类别父类名称',
  `pinyin` varchar(255) DEFAULT NULL COMMENT '新闻拼音',
  `priority` int(255) DEFAULT NULL COMMENT '新闻类别优先级，数字越大父类在页面最前面',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news_category
-- ----------------------------

-- ----------------------------
-- Table structure for `p2p_loan`
-- ----------------------------
DROP TABLE IF EXISTS `p2p_loan`;
CREATE TABLE `p2p_loan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `p2p_id` int(11) NOT NULL COMMENT 'p2p平台id，外键',
  `create_time` date NOT NULL,
  `update_time` date NOT NULL,
  `is_delete` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL COMMENT '产品名称',
  `amount` int(11) DEFAULT NULL COMMENT '借款金额(以分为单位)',
  `interest_rate` double DEFAULT NULL COMMENT '年化收益',
  `start_time` date DEFAULT NULL COMMENT '开标时间',
  `limit_time` int(11) DEFAULT NULL COMMENT '期限(以天为单位)',
  `schedule` double DEFAULT NULL COMMENT '进度',
  `firstday_interest` date DEFAULT NULL COMMENT '起息日',
  `mode_of_payment` varchar(50) DEFAULT NULL COMMENT '还款方式',
  `purchase_amount` int(11) DEFAULT NULL COMMENT '起购金额',
  `limit_amount` int(11) DEFAULT NULL COMMENT '限购金额',
  `dock_product` varchar(200) DEFAULT NULL COMMENT '对接产品',
  `protection_means` varchar(200) DEFAULT NULL COMMENT '保障方式',
  `is_transfer` int(11) DEFAULT NULL COMMENT '能否转让',
  `state` int(11) DEFAULT NULL COMMENT '借款状态',
  `product_url` varchar(200) DEFAULT NULL COMMENT '产品链接',
  `des` text COMMENT '产品说明',
  `protocol` varchar(200) DEFAULT NULL COMMENT '协议',
  PRIMARY KEY (`id`),
  KEY `p2p_loan_p2p_id_idx` (`p2p_id`),
  CONSTRAINT `p2p_loan_p2p_id` FOREIGN KEY (`p2p_id`) REFERENCES `p2p_plat` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='p2p标的表';

-- ----------------------------
-- Records of p2p_loan
-- ----------------------------

-- ----------------------------
-- Table structure for `p2p_plat`
-- ----------------------------
DROP TABLE IF EXISTS `p2p_plat`;
CREATE TABLE `p2p_plat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plat_id` int(11) NOT NULL,
  `is_auto_bid` int(11) DEFAULT NULL COMMENT '是否支持自动投标',
  `is_equitable_assignment` int(11) DEFAULT NULL COMMENT '是否支持债权转让',
  `manage_fee` varchar(150) DEFAULT NULL COMMENT '【费用】管理费',
  `manage_fee_detail` longtext COMMENT '【费用】管理费详情',
  `prepaid_fee` varchar(150) DEFAULT NULL COMMENT '【费用】充值费',
  `prepaid_fee_detail` longtext COMMENT '【费用】充值费详情',
  `cash_withdrawal_fee` varchar(150) DEFAULT NULL COMMENT '【费用】提现费',
  `cash_withdrawal_fee_detail` longtext COMMENT '【费用】提现费详情',
  `vip_fee` varchar(150) DEFAULT NULL COMMENT '【费用】VIP费',
  `transfer_fee` varchar(150) DEFAULT NULL COMMENT '【费用】转让费',
  `mode_of_payment` varchar(200) DEFAULT NULL COMMENT '支付方式',
  `create_time` date NOT NULL,
  `update_time` date NOT NULL,
  `is_delete` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `plat_id_UNIQUE` (`plat_id`),
  CONSTRAINT `p2p_plat_id` FOREIGN KEY (`plat_id`) REFERENCES `platform` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of p2p_plat
-- ----------------------------

-- ----------------------------
-- Table structure for `partner_rel_product`
-- ----------------------------
DROP TABLE IF EXISTS `partner_rel_product`;
CREATE TABLE `partner_rel_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL COMMENT '公司id,外键',
  `name` varchar(255) NOT NULL COMMENT '合作伙伴名称',
  `style` varchar(255) DEFAULT NULL COMMENT '合作伙伴企业类型',
  PRIMARY KEY (`id`),
  KEY `partner_company_id_idx` (`company_id`),
  CONSTRAINT `partner_company_id` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公司合作伙伴';

-- ----------------------------
-- Records of partner_rel_product
-- ----------------------------

-- ----------------------------
-- Table structure for `phone_validate`
-- ----------------------------
DROP TABLE IF EXISTS `phone_validate`;
CREATE TABLE `phone_validate` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，表ID',
  `phone` varchar(15) NOT NULL COMMENT '手机号码',
  `validate` varchar(5) NOT NULL COMMENT '验证码',
  `ip` varchar(50) DEFAULT NULL COMMENT 'IP地址',
  `create_time` datetime DEFAULT NULL COMMENT '发送短信的时间',
  `expire_time` datetime DEFAULT NULL COMMENT '时效时间',
  `is_use` int(2) DEFAULT NULL COMMENT '是否使用',
  `using_time` datetime DEFAULT NULL COMMENT '使用时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of phone_validate
-- ----------------------------

-- ----------------------------
-- Table structure for `plat_app`
-- ----------------------------
DROP TABLE IF EXISTS `plat_app`;
CREATE TABLE `plat_app` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL COMMENT '【技术保障】APP 名字',
  `ios_address` varchar(500) DEFAULT NULL COMMENT '【技术保障】IOS APP下载地址',
  `android_address` varchar(500) DEFAULT NULL COMMENT '【技术保障】安卓APP下载地址',
  `ios_code_url` varchar(500) DEFAULT NULL COMMENT '【技术保障】IOS 应用下载路径生成地址（二维码）',
  `android_code_url` varchar(500) DEFAULT NULL COMMENT '【技术保障】安卓 应用下载路径生成地址（二维码）',
  `logo` varchar(500) DEFAULT NULL COMMENT '【技术保障】APP的LOGO图片',
  `is_ios` int(11) DEFAULT NULL COMMENT '【技术保障】是否有安卓APP',
  `is_android` int(11) DEFAULT NULL COMMENT '【技术保障】是否有IOS APP',
  `plat_id` int(11) NOT NULL,
  `create_time` date NOT NULL,
  `update_time` date NOT NULL,
  `is_delete` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `plat_id_UNIQUE` (`plat_id`),
  CONSTRAINT `app_plat_id` FOREIGN KEY (`plat_id`) REFERENCES `platform` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='APP表';

-- ----------------------------
-- Records of plat_app
-- ----------------------------

-- ----------------------------
-- Table structure for `plat_contact`
-- ----------------------------
DROP TABLE IF EXISTS `plat_contact`;
CREATE TABLE `plat_contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `plat_id` int(11) NOT NULL COMMENT '平台id,外键',
  `address` varchar(500) DEFAULT NULL COMMENT '【联系方式】地址 （多个地址用#####分割）',
  `phone_400` varchar(45) DEFAULT NULL COMMENT '【联系方式】400电话',
  `phone` varchar(100) DEFAULT NULL COMMENT '【联系方式】电话',
  `fax` varchar(100) DEFAULT NULL COMMENT '【联系方式】传真',
  `email` varchar(100) DEFAULT NULL COMMENT '【联系方式】email',
  `weibo` varchar(150) DEFAULT NULL COMMENT '微博自媒体',
  `wechat` varchar(100) DEFAULT NULL COMMENT '微信公众号',
  `create_time` date DEFAULT NULL,
  `update_time` date DEFAULT NULL,
  `is_delete` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `plat_id_UNIQUE` (`plat_id`),
  UNIQUE KEY `create_time_UNIQUE` (`create_time`),
  UNIQUE KEY `update_time_UNIQUE` (`update_time`),
  UNIQUE KEY `is_delete_UNIQUE` (`is_delete`),
  CONSTRAINT `contact_plat_id` FOREIGN KEY (`plat_id`) REFERENCES `platform` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='平台联系方式';

-- ----------------------------
-- Records of plat_contact
-- ----------------------------

-- ----------------------------
-- Table structure for `plat_rel_tag`
-- ----------------------------
DROP TABLE IF EXISTS `plat_rel_tag`;
CREATE TABLE `plat_rel_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plat_id` int(11) NOT NULL COMMENT '平台id,外键',
  `tag_id` int(11) NOT NULL COMMENT '标签id,外键',
  `create_time` date NOT NULL,
  `update_time` date NOT NULL,
  `is_delete` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `plat_rel_tag_platId_idx` (`plat_id`),
  KEY `plat_rel_tag_tagId_idx` (`tag_id`),
  CONSTRAINT `plat_rel_tag_platId` FOREIGN KEY (`plat_id`) REFERENCES `platform` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `plat_rel_tag_tagId` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='平台相关tag';

-- ----------------------------
-- Records of plat_rel_tag
-- ----------------------------

-- ----------------------------
-- Table structure for `plat_state`
-- ----------------------------
DROP TABLE IF EXISTS `plat_state`;
CREATE TABLE `plat_state` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(45) NOT NULL,
  `create_time` date NOT NULL,
  `update_time` date NOT NULL,
  `is_delete` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of plat_state
-- ----------------------------

-- ----------------------------
-- Table structure for `plat_web`
-- ----------------------------
DROP TABLE IF EXISTS `plat_web`;
CREATE TABLE `plat_web` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plat_id` int(11) NOT NULL COMMENT '平台id,外键',
  `description` text COMMENT '网站简介',
  `web_url` varchar(100) DEFAULT NULL COMMENT '网站地址',
  `logo_url` varchar(100) DEFAULT NULL COMMENT 'logo地址',
  `name` varchar(500) DEFAULT NULL COMMENT '【备案】备案域名',
  `date` date DEFAULT NULL COMMENT '【备案】备案时间',
  `company_type` varchar(150) DEFAULT NULL COMMENT '【备案】公司类型',
  `company_name` varchar(150) DEFAULT NULL COMMENT '【备案】备案公司',
  `ICP` varchar(150) DEFAULT NULL COMMENT '【备案】ICP号',
  `create_time` date NOT NULL,
  `update_time` date NOT NULL,
  `is_delete` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `plat_id_UNIQUE` (`plat_id`),
  CONSTRAINT `web_plat_id` FOREIGN KEY (`plat_id`) REFERENCES `platform` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='平台网站表';

-- ----------------------------
-- Records of plat_web
-- ----------------------------

-- ----------------------------
-- Table structure for `platform`
-- ----------------------------
DROP TABLE IF EXISTS `platform`;
CREATE TABLE `platform` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type` int(11) NOT NULL COMMENT '平台类型（p2p,银行理财,基金,保险……）',
  `name` varchar(50) NOT NULL COMMENT '平台名称',
  `name_before` varchar(50) DEFAULT NULL COMMENT '曾用名',
  `state` int(11) NOT NULL COMMENT '平台状态ID，外键(plat_state)',
  `start_time` date DEFAULT NULL COMMENT '上线时间',
  `end_time` date DEFAULT NULL COMMENT '跑路企业倒闭时间',
  `province` int(11) DEFAULT NULL COMMENT '省份ID，外键省份ID',
  `city` int(11) DEFAULT NULL COMMENT '城市ID，外键城市ID',
  `create_time` date NOT NULL,
  `update_time` date NOT NULL,
  `is_delete` int(11) NOT NULL,
  `company` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `state_plat_state_idx` (`state`),
  KEY `province_province_idx` (`province`),
  KEY `city_city_idx` (`city`),
  KEY `platform_company_idx` (`company`),
  CONSTRAINT `city_city` FOREIGN KEY (`city`) REFERENCES `city` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `platform_company` FOREIGN KEY (`company`) REFERENCES `company` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `province_province` FOREIGN KEY (`province`) REFERENCES `province` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `state_plat_state` FOREIGN KEY (`state`) REFERENCES `plat_state` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='平台基础信息表';

-- ----------------------------
-- Records of platform
-- ----------------------------

-- ----------------------------
-- Table structure for `product_dynamic`
-- ----------------------------
DROP TABLE IF EXISTS `product_dynamic`;
CREATE TABLE `product_dynamic` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，表ID',
  `pId` int(11) NOT NULL COMMENT '外键PID',
  `total_turnover` float(11,0) DEFAULT NULL COMMENT '累计成交量',
  `total_turnover_day` float(11,0) DEFAULT NULL COMMENT '累计成交量（日）',
  `total_turnover_week` float(11,0) DEFAULT NULL COMMENT '累计成交量（周）',
  `total_turnover_month` float(11,0) DEFAULT NULL COMMENT '累计成交量（月）',
  `total_unrepay_amount` float(11,0) DEFAULT NULL COMMENT '累计待还金额',
  `avg_interest_rate` float(11,0) DEFAULT NULL COMMENT '平均利率',
  `avg_interest_rate_day` float(11,0) DEFAULT NULL COMMENT '平均利率（日）',
  `avg_interest_rate_week` float(11,0) DEFAULT NULL COMMENT '平均利率（周）',
  `avg_interest_rate_month` float(11,0) DEFAULT NULL COMMENT '平均利率（月）',
  `total_investment` int(11) DEFAULT NULL COMMENT '累计投资人数',
  `total_investment_day` int(11) DEFAULT NULL COMMENT '累计投资人数（日）',
  `total_investment_week` int(11) DEFAULT NULL COMMENT '累计投资人数（周）',
  `total_investment_month` int(11) DEFAULT NULL COMMENT '累计投资人数（月）',
  `total_borrower` int(11) DEFAULT NULL COMMENT '累计借款人数',
  `total_borrower_day` int(11) DEFAULT NULL COMMENT '累计借款人数（日）',
  `total_borrower_week` int(11) DEFAULT NULL COMMENT '累计借款人数（周）',
  `total_borrower_month` int(11) DEFAULT NULL COMMENT '累计借款人数（月）',
  `avg_repay_period` float(11,0) DEFAULT NULL COMMENT '平均借款期限',
  `avg_repay_period_day` float(11,0) DEFAULT NULL COMMENT '平均借款期限（日）',
  `avg_repay_period_week` float(11,0) DEFAULT NULL COMMENT '平均借款期限（周）',
  `avg_repay_period_month` float(11,0) DEFAULT NULL COMMENT '平均借款期限（月）',
  `ivestment_amount_per_person` float(11,0) DEFAULT NULL COMMENT '人均投资金额',
  `ivestment_amount_per_person_day` float(11,0) DEFAULT NULL COMMENT '人均投资金额（日）',
  `ivestment_amount_per_person_week` float(11,0) DEFAULT NULL COMMENT '人均投资金额（周）',
  `ivestment_amount_per_person_month` float(11,0) DEFAULT NULL COMMENT '人均投资金额（月）',
  `borrow_amount_per_person` float(11,0) DEFAULT NULL COMMENT '人均借款金额',
  `borrow_amount_per_person_day` float(11,0) DEFAULT NULL COMMENT '人均借款金额（日）',
  `borrow_amount_per_person_week` float(11,0) DEFAULT NULL COMMENT '人均借款金额（周）',
  `borrow_amount_per_person_month` float(11,0) DEFAULT NULL COMMENT '人均借款金额（月）',
  `topten_rate` float(11,2) DEFAULT NULL COMMENT '前十大土豪',
  `topten_borrow` float(11,2) DEFAULT NULL COMMENT '前十大借款人',
  `time_weight_amount` float(11,0) DEFAULT NULL COMMENT '时间加权成交量',
  `time_weight_amount_day` float(11,0) DEFAULT NULL COMMENT '时间加权成交量（日）',
  `time_weight_amount_week` float(11,0) DEFAULT NULL COMMENT '时间加权成交量（周）',
  `time_weight_amount_month` float(11,0) DEFAULT NULL COMMENT '时间加权成交量（月）',
  `borrow_amount` int(11) DEFAULT NULL COMMENT '累计借款标数',
  `borrow_amount_day` int(11) DEFAULT NULL COMMENT '累计借款标数（日）',
  `borrow_amount_week` int(11) DEFAULT NULL COMMENT '累计借款标数（周）',
  `borrow_amount_month` int(11) DEFAULT NULL COMMENT '累计借款标数（月）',
  `time_for_full_bid` float(11,2) DEFAULT NULL COMMENT '平均满标用时',
  `time_for_full_bid_day` float(11,2) DEFAULT NULL COMMENT '平均满标用时（日）',
  `time_for_full_bid_week` float(11,2) DEFAULT NULL COMMENT '平均满标用时（周）',
  `time_for_full_bid_month` float(11,2) DEFAULT NULL COMMENT '平均满标用时（月）',
  `month_net_income` float(11,0) DEFAULT NULL COMMENT '近 30 日资金净流入',
  `accounted_revenue_in_60_days` float(11,2) DEFAULT NULL COMMENT '未来60日待还',
  `capital_lever` float(11,2) DEFAULT NULL COMMENT '资金杠杆',
  `service_time` int(11) DEFAULT NULL COMMENT '运营时间（至今为止的运营时间天数）',
  `update_date` date NOT NULL COMMENT '最新更新时间',
  PRIMARY KEY (`id`),
  KEY `pid_dynamic_idx` (`pId`),
  CONSTRAINT `product_dynamic_ibfk_1` FOREIGN KEY (`pId`) REFERENCES `platform` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=174801 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_dynamic
-- ----------------------------

-- ----------------------------
-- Table structure for `product_news_relate`
-- ----------------------------
DROP TABLE IF EXISTS `product_news_relate`;
CREATE TABLE `product_news_relate` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，表ID',
  `pId` int(11) NOT NULL COMMENT '平台表外键pid',
  `nId` int(11) NOT NULL COMMENT '新闻表外键nid',
  PRIMARY KEY (`id`),
  KEY `pId_relate_idx` (`pId`),
  KEY `nId_relate_idx` (`nId`),
  CONSTRAINT `product_news_relate_ibfk_1` FOREIGN KEY (`nId`) REFERENCES `news` (`nId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `product_news_relate_ibfk_2` FOREIGN KEY (`pId`) REFERENCES `platform` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=46426 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_news_relate
-- ----------------------------

-- ----------------------------
-- Table structure for `product_third_eval`
-- ----------------------------
DROP TABLE IF EXISTS `product_third_eval`;
CREATE TABLE `product_third_eval` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，表ID',
  `pId` int(11) NOT NULL COMMENT '平台ID',
  `development_rate` float DEFAULT NULL COMMENT '发展指数',
  `mobility` float DEFAULT NULL COMMENT '流动性',
  `turnover` float DEFAULT NULL COMMENT '成交量',
  `benefit` float DEFAULT NULL COMMENT '营收',
  `dispersion` float DEFAULT NULL COMMENT '分散度',
  `update_date` date DEFAULT NULL COMMENT '更新时间',
  `popularity` float DEFAULT NULL COMMENT '人气',
  `transparency` float DEFAULT NULL COMMENT '透明度',
  PRIMARY KEY (`id`),
  KEY `pid_third_idx` (`pId`),
  CONSTRAINT `product_third_eval_ibfk_1` FOREIGN KEY (`pId`) REFERENCES `platform` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11940 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_third_eval
-- ----------------------------

-- ----------------------------
-- Table structure for `product_trend`
-- ----------------------------
DROP TABLE IF EXISTS `product_trend`;
CREATE TABLE `product_trend` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，表ID',
  `pId` int(11) NOT NULL COMMENT '平台ID',
  `date` date NOT NULL COMMENT '当前指标数据发生的日期',
  `turnover` float(11,0) DEFAULT NULL COMMENT '成交额[元]，当日成交量',
  `interest_rate` float(11,0) DEFAULT NULL COMMENT '利率[%]，网站借贷项目的当日平均利率',
  `investment_amount` float(11,0) DEFAULT NULL COMMENT '人均投资金额',
  `borrow_amount` float(11,0) DEFAULT NULL COMMENT '人均借款金额',
  `num_investment` int(11) DEFAULT NULL COMMENT '投资人数[人]，当日参与过投资的人数',
  `num_borrower` int(11) DEFAULT NULL COMMENT '借款人数[人]，当日发布过借贷项目的人数',
  `average_loan_period` float(11,0) DEFAULT NULL COMMENT '平均借款期限',
  `loan_bid` int(11) DEFAULT NULL COMMENT '借款标数',
  `time_for_full_bid` float(11,0) DEFAULT '0' COMMENT '满标用时',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=474013 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_trend
-- ----------------------------

-- ----------------------------
-- Table structure for `province`
-- ----------------------------
DROP TABLE IF EXISTS `province`;
CREATE TABLE `province` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL COMMENT '省份名称',
  `plat_num` int(11) DEFAULT NULL COMMENT '平台数量',
  `gdp` double DEFAULT NULL COMMENT '国内生产总值',
  `create_time` date NOT NULL,
  `update_time` date NOT NULL,
  `is_delete` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='省份信息表';

-- ----------------------------
-- Records of province
-- ----------------------------

-- ----------------------------
-- Table structure for `report`
-- ----------------------------
DROP TABLE IF EXISTS `report`;
CREATE TABLE `report` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，表ID',
  `create_time` datetime DEFAULT NULL COMMENT '报告创建时间',
  `title` varchar(100) DEFAULT NULL COMMENT '报告标题',
  `content` mediumtext COMMENT '报告内容',
  `update_time` datetime DEFAULT NULL COMMENT '报告更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of report
-- ----------------------------

-- ----------------------------
-- Table structure for `report_file`
-- ----------------------------
DROP TABLE IF EXISTS `report_file`;
CREATE TABLE `report_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，表ID',
  `fileName` varchar(255) DEFAULT NULL COMMENT '报告文件路径名称',
  `name` varchar(255) DEFAULT NULL COMMENT '报告文件名称',
  `rId` int(11) NOT NULL COMMENT '报告ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FKF14779A742BAB3DE` (`rId`),
  CONSTRAINT `report_file_ibfk_1` FOREIGN KEY (`rId`) REFERENCES `report` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of report_file
-- ----------------------------

-- ----------------------------
-- Table structure for `safe_cert`
-- ----------------------------
DROP TABLE IF EXISTS `safe_cert`;
CREATE TABLE `safe_cert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL COMMENT '安全认证名称',
  `type` int(11) NOT NULL COMMENT '安全认证类型 0.信用检测 1.技术检测 2.工商网监网警',
  `logo` varchar(100) DEFAULT NULL COMMENT '安全认证LOGO',
  `score` int(11) DEFAULT NULL COMMENT '安全认证分数',
  `create_time` date NOT NULL,
  `update_time` date NOT NULL,
  `is_delete` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='安全认证';

-- ----------------------------
-- Records of safe_cert
-- ----------------------------

-- ----------------------------
-- Table structure for `safe_rel_web`
-- ----------------------------
DROP TABLE IF EXISTS `safe_rel_web`;
CREATE TABLE `safe_rel_web` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `web_id` int(11) NOT NULL COMMENT '网站id',
  `safe_id` int(11) NOT NULL COMMENT '安全认证id',
  `create_time` date NOT NULL,
  `update_time` date NOT NULL,
  `is_delete` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `safe_rel_web_web_idx` (`web_id`),
  KEY `safe_rel_web_safe_idx` (`safe_id`),
  CONSTRAINT `safe_rel_web_safe` FOREIGN KEY (`safe_id`) REFERENCES `safe_cert` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `safe_rel_web_web` FOREIGN KEY (`web_id`) REFERENCES `plat_web` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of safe_rel_web
-- ----------------------------

-- ----------------------------
-- Table structure for `security_p2p`
-- ----------------------------
DROP TABLE IF EXISTS `security_p2p`;
CREATE TABLE `security_p2p` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `p2p_id` int(11) NOT NULL COMMENT 'p2p平台id，外键',
  `tender_security` varchar(150) DEFAULT NULL COMMENT '【安全保障】投标保障',
  `security_mode` varchar(400) DEFAULT NULL COMMENT '【安全保障】保障模式',
  `security_mode_url` varchar(200) DEFAULT NULL COMMENT '【安全保障】保障模式页面',
  `emergency_funds` text COMMENT '【安全保障】风险准备金',
  `guarantee_institutions` varchar(500) DEFAULT NULL COMMENT '【安全保障】担保机构',
  `risk_reserve_init` double DEFAULT NULL COMMENT '风险准备金初始',
  `risk_reserve_rule` text COMMENT '风险准备金拨备规则',
  `risk_reserve_institution` text COMMENT '风险准备金存管机构',
  `third_payment_institution` text COMMENT '第三方支付机构',
  `trust_funds` varchar(200) DEFAULT NULL COMMENT '【安全保障】资金存管',
  `custodian_institution` varchar(500) DEFAULT NULL COMMENT '【安全保障】资金托管',
  `trust_funds_tuo` varchar(255) DEFAULT NULL COMMENT '存管机构',
  `custodian_institution_tuo` text COMMENT '托管机构',
  `create_time` date NOT NULL,
  `update_time` date NOT NULL,
  `is_delete` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `p2p_id_UNIQUE` (`p2p_id`),
  KEY `security_p2p_id_idx` (`p2p_id`),
  CONSTRAINT `security_p2p_id` FOREIGN KEY (`p2p_id`) REFERENCES `p2p_plat` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='p2p平台安全保障';

-- ----------------------------
-- Records of security_p2p
-- ----------------------------

-- ----------------------------
-- Table structure for `sensitive_word`
-- ----------------------------
DROP TABLE IF EXISTS `sensitive_word`;
CREATE TABLE `sensitive_word` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，表ID',
  `word` varchar(45) NOT NULL COMMENT '敏感词',
  PRIMARY KEY (`id`),
  UNIQUE KEY `word_UNIQUE` (`word`)
) ENGINE=InnoDB AUTO_INCREMENT=2213 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sensitive_word
-- ----------------------------

-- ----------------------------
-- Table structure for `stockholder`
-- ----------------------------
DROP TABLE IF EXISTS `stockholder`;
CREATE TABLE `stockholder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL COMMENT '公司id,外键',
  `type` varchar(50) DEFAULT NULL COMMENT '股东类型',
  `name` varchar(200) DEFAULT NULL COMMENT '股东名称',
  `certificate_type` varchar(100) DEFAULT NULL COMMENT '证件类型',
  `certificate` varchar(400) DEFAULT NULL COMMENT '股东证件号',
  `occupies_compared` varchar(160) DEFAULT NULL COMMENT '占比',
  `registered_capital` varchar(160) DEFAULT NULL COMMENT '注册资本',
  `des` varchar(255) DEFAULT NULL COMMENT '持股比例5%以上的股东成员简历',
  `position` varchar(100) DEFAULT NULL COMMENT '股东职位',
  `create_time` date NOT NULL,
  `update_time` date NOT NULL,
  `is_delete` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `stockholder_company_idx` (`company_id`),
  CONSTRAINT `stockholder_company` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公司股东表';

-- ----------------------------
-- Records of stockholder
-- ----------------------------

-- ----------------------------
-- Table structure for `tag`
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL COMMENT 'tag名称',
  `create_time` date NOT NULL,
  `update_time` date NOT NULL,
  `is_delete` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='tag表';

-- ----------------------------
-- Records of tag
-- ----------------------------

-- ----------------------------
-- Table structure for `third_report`
-- ----------------------------
DROP TABLE IF EXISTS `third_report`;
CREATE TABLE `third_report` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，表ID',
  `link` varchar(100) DEFAULT NULL COMMENT '第三方报告网址链接',
  `title` varchar(500) DEFAULT NULL COMMENT '第三方报告标题',
  `create_time` datetime DEFAULT NULL COMMENT '第三方报告创建日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of third_report
-- ----------------------------

-- ----------------------------
-- Table structure for `user_attention_product`
-- ----------------------------
DROP TABLE IF EXISTS `user_attention_product`;
CREATE TABLE `user_attention_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，表ID',
  `pId` int(11) NOT NULL COMMENT '平台ID，外键PID',
  `uId` int(11) NOT NULL COMMENT '用户ID，外键UID',
  PRIMARY KEY (`id`),
  KEY `pId_idx` (`pId`),
  KEY `uId_idx` (`uId`),
  CONSTRAINT `user_attention_product_ibfk_1` FOREIGN KEY (`uId`) REFERENCES `user_information` (`uId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `user_attention_product_ibfk_2` FOREIGN KEY (`pId`) REFERENCES `platform` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=158 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_attention_product
-- ----------------------------

-- ----------------------------
-- Table structure for `user_information`
-- ----------------------------
DROP TABLE IF EXISTS `user_information`;
CREATE TABLE `user_information` (
  `uId` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，用户表ID',
  `user_name` varchar(45) NOT NULL COMMENT '用户名',
  `password` varchar(45) NOT NULL COMMENT '密码',
  `user_dsp_name` varchar(45) DEFAULT NULL COMMENT '真实姓名',
  `sex` varchar(1) DEFAULT NULL COMMENT '性别，0-表示男，1-表示女，2-表示保密',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `phone` varchar(45) NOT NULL COMMENT '手机',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `status` int(11) DEFAULT '0' COMMENT '用户状态；1-有效用户；2-冻结用户',
  `user_type` int(1) NOT NULL DEFAULT '0' COMMENT '用户类型0为普通用户1为平台用户',
  `imgPath` varchar(200) DEFAULT NULL COMMENT '头像路径',
  `createtime` datetime DEFAULT NULL COMMENT '注册时间',
  `level` int(1) DEFAULT '0' COMMENT '权限：0为普通用户 1为有权访问信批',
  PRIMARY KEY (`uId`),
  UNIQUE KEY `user_name` (`user_name`) USING BTREE,
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=178 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_information
-- ----------------------------

-- ----------------------------
-- Table structure for `warning_info_mail`
-- ----------------------------
DROP TABLE IF EXISTS `warning_info_mail`;
CREATE TABLE `warning_info_mail` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，表id',
  `admin_id` int(11) DEFAULT NULL COMMENT '操作的管理员id',
  `user_id` int(11) NOT NULL COMMENT '用户ID，外键UID',
  `send_time` datetime DEFAULT NULL COMMENT '推送时间',
  `content` varchar(200) DEFAULT NULL COMMENT '曝光内容',
  `reason` varchar(100) DEFAULT NULL COMMENT '曝光理由',
  `is_read` int(11) DEFAULT '0' COMMENT '是否已读，0-not read ; 1-already read',
  PRIMARY KEY (`id`),
  KEY `admin_id` (`admin_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `warning_info_mail_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `administrator` (`uId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `warning_info_mail_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user_information` (`uId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=275 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of warning_info_mail
-- ----------------------------
