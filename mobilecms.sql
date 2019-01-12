# Host: localhost  (Version: 5.5.53)
# Date: 2019-01-12 18:05:09
# Generator: MySQL-Front 5.3  (Build 4.234)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "cms_access"
#

DROP TABLE IF EXISTS `cms_access`;
CREATE TABLE `cms_access` (
  `role_id` int(5) NOT NULL,
  `node_id` int(5) NOT NULL,
  KEY `role_id` (`role_id`),
  KEY `node_id` (`node_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "cms_access"
#

/*!40000 ALTER TABLE `cms_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_access` ENABLE KEYS */;

#
# Structure for table "cms_ad"
#

DROP TABLE IF EXISTS `cms_ad`;
CREATE TABLE `cms_ad` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `board_id` smallint(5) NOT NULL,
  `type` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `url` varchar(255) NOT NULL,
  `code` text NOT NULL,
  `start_time` int(10) NOT NULL,
  `end_time` int(10) NOT NULL,
  `clicks` int(10) NOT NULL DEFAULT '0',
  `add_time` int(10) NOT NULL,
  `ordid` int(10) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `board_id` (`board_id`,`start_time`,`end_time`,`status`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

#
# Data for table "cms_ad"
#

/*!40000 ALTER TABLE `cms_ad` DISABLE KEYS */;
INSERT INTO `cms_ad` VALUES (6,6,'code','phonegap中文网','http://www.phonegap100.com','<script type=\\\"text/javascript\\\">alimama_pid=\\\"mm_30949159_3378420_11349182\\\";alimama_width=950;alimama_height=90;</script><script src=\\\"http://a.alimama.cn/inf.js\\\" type=\\\"text/javascript\\\"></script>',1333595088,1365217491,104,1333681516,1,1),(7,5,'image','凡客','','512ad36e181c5.png',1333683143,1365219146,11,1333683151,2,0),(9,5,'text','测试','http://192.168.1.51/wegou_news/uc_client','测试广告',1360598400,1361462400,0,1361773236,0,1);
/*!40000 ALTER TABLE `cms_ad` ENABLE KEYS */;

#
# Structure for table "cms_adboard"
#

DROP TABLE IF EXISTS `cms_adboard`;
CREATE TABLE `cms_adboard` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `type` varchar(20) NOT NULL,
  `width` smallint(5) NOT NULL,
  `height` smallint(5) NOT NULL,
  `description` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

#
# Data for table "cms_adboard"
#

/*!40000 ALTER TABLE `cms_adboard` DISABLE KEYS */;
INSERT INTO `cms_adboard` VALUES (4,'详细页横幅','banner',950,100,'',1),(5,'详细页右侧','banner',226,226,'',1),(6,'首页下方横幅','banner',960,100,'',1);
/*!40000 ALTER TABLE `cms_adboard` ENABLE KEYS */;

#
# Structure for table "cms_admin"
#

DROP TABLE IF EXISTS `cms_admin`;
CREATE TABLE `cms_admin` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `add_time` int(10) DEFAULT NULL,
  `last_time` int(10) DEFAULT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `role_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Data for table "cms_admin"
#

/*!40000 ALTER TABLE `cms_admin` DISABLE KEYS */;
INSERT INTO `cms_admin` VALUES (1,'admin','21232f297a57a5a743894a0e4a801fc3',1546501219,NULL,1,1);
/*!40000 ALTER TABLE `cms_admin` ENABLE KEYS */;

#
# Structure for table "cms_answer"
#

DROP TABLE IF EXISTS `cms_answer`;
CREATE TABLE `cms_answer` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `aname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "cms_answer"
#

/*!40000 ALTER TABLE `cms_answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_answer` ENABLE KEYS */;

#
# Structure for table "cms_article"
#

DROP TABLE IF EXISTS `cms_article`;
CREATE TABLE `cms_article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cate_id` tinyint(4) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `orig` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `abst` varchar(255) NOT NULL,
  `info` mediumtext NOT NULL,
  `add_time` datetime NOT NULL,
  `ordid` tinyint(4) NOT NULL,
  `is_hot` tinyint(1) NOT NULL DEFAULT '0',
  `is_best` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-待审核 1-已审核',
  `seo_title` varchar(255) NOT NULL,
  `seo_keys` varchar(255) NOT NULL,
  `seo_desc` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `is_best` (`is_best`),
  KEY `add_time` (`add_time`),
  KEY `cate_id` (`cate_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Data for table "cms_article"
#

/*!40000 ALTER TABLE `cms_article` DISABLE KEYS */;
INSERT INTO `cms_article` VALUES (1,5,'题目管理','asf','5c2ee2b849543.png','asdf','asdf','asdf','2019-01-04 12:36:08',3,1,0,1,'','','');
/*!40000 ALTER TABLE `cms_article` ENABLE KEYS */;

#
# Structure for table "cms_article_cate"
#

DROP TABLE IF EXISTS `cms_article_cate`;
CREATE TABLE `cms_article_cate` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `alias` varchar(50) NOT NULL,
  `pid` smallint(4) unsigned NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `article_nums` int(10) unsigned NOT NULL,
  `sort_order` smallint(4) unsigned NOT NULL,
  `seo_title` varchar(255) NOT NULL,
  `seo_keys` varchar(255) NOT NULL,
  `seo_desc` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

#
# Data for table "cms_article_cate"
#

/*!40000 ALTER TABLE `cms_article_cate` DISABLE KEYS */;
INSERT INTO `cms_article_cate` VALUES (1,'网站信息','sites',11,1,4,4,'','',''),(5,'新手入门','rumen',11,1,3,2,'','',''),(9,'热门活动','activity',10,1,6,5,'网站在线帮助说明','111111111111111111111','2222222222222222'),(10,'资讯活动','news',0,1,2,1,'网站资讯','',''),(11,'网站帮助','sites',0,0,1,0,'','','');
/*!40000 ALTER TABLE `cms_article_cate` ENABLE KEYS */;

#
# Structure for table "cms_flink"
#

DROP TABLE IF EXISTS `cms_flink`;
CREATE TABLE `cms_flink` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cate_id` smallint(4) NOT NULL DEFAULT '1',
  `img` varchar(255) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `url` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `ordid` smallint(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

#
# Data for table "cms_flink"
#

/*!40000 ALTER TABLE `cms_flink` DISABLE KEYS */;
INSERT INTO `cms_flink` VALUES (1,1,'4f8ceab7e6f6c.jpg','phonegap100','http://www.phonegap100.com',1,1);
/*!40000 ALTER TABLE `cms_flink` ENABLE KEYS */;

#
# Structure for table "cms_flink_cate"
#

DROP TABLE IF EXISTS `cms_flink_cate`;
CREATE TABLE `cms_flink_cate` (
  `id` smallint(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

#
# Data for table "cms_flink_cate"
#

/*!40000 ALTER TABLE `cms_flink_cate` DISABLE KEYS */;
INSERT INTO `cms_flink_cate` VALUES (1,'友情链接'),(2,'合作伙伴');
/*!40000 ALTER TABLE `cms_flink_cate` ENABLE KEYS */;

#
# Structure for table "cms_group"
#

DROP TABLE IF EXISTS `cms_group`;
CREATE TABLE `cms_group` (
  `id` smallint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `title` varchar(50) NOT NULL,
  `create_time` int(11) unsigned NOT NULL,
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `sort` (`sort`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

#
# Data for table "cms_group"
#

/*!40000 ALTER TABLE `cms_group` DISABLE KEYS */;
INSERT INTO `cms_group` VALUES (1,'system','系统设置',1222841259,1222841259,1,6),(4,'article','内容管理',1222841259,1222841259,1,3),(8,'member','会员管理',0,0,1,4),(9,'home','起始页',0,1341386748,1,0),(27,'seller','商家管理',1340586215,0,0,1),(29,'question','题目管理',1546569532,0,1,5);
/*!40000 ALTER TABLE `cms_group` ENABLE KEYS */;

#
# Structure for table "cms_nav"
#

DROP TABLE IF EXISTS `cms_nav`;
CREATE TABLE `cms_nav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `alias` varchar(50) NOT NULL,
  `url` varchar(255) NOT NULL,
  `sort_order` smallint(4) NOT NULL,
  `system` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1-系统 0-自定义',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '导航位置1-顶部 2-底部',
  `in_site` tinyint(1) NOT NULL COMMENT '1-本站内 0-站外',
  `is_show` tinyint(1) NOT NULL DEFAULT '1',
  `seo_title` varchar(255) NOT NULL,
  `seo_keys` text NOT NULL,
  `seo_desc` text NOT NULL,
  `items_cate_id` int(11) DEFAULT NULL COMMENT '//分类id',
  PRIMARY KEY (`id`),
  KEY `is_show` (`is_show`),
  KEY `type` (`type`),
  KEY `sort_order` (`sort_order`),
  KEY `alias` (`alias`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

#
# Data for table "cms_nav"
#

/*!40000 ALTER TABLE `cms_nav` DISABLE KEYS */;
INSERT INTO `cms_nav` VALUES (1,'发现','search','',1,1,1,1,1,'','','',0),(2,'母婴','album','',2,1,1,1,1,'','','',0),(3,'搞笑','promo','',3,1,1,1,1,'','','',0),(4,'返现商家','seller','',4,1,1,1,1,'','','',NULL),(5,'视频','exchange_goods','',5,1,1,1,0,'','','',NULL),(6,'杂谈','xiezi','',8,0,1,1,1,'','','',2),(7,'帮助中心','bangzhu','http://bbs.phonegap100.com',0,0,1,0,0,'','','',0);
/*!40000 ALTER TABLE `cms_nav` ENABLE KEYS */;

#
# Structure for table "cms_node"
#

DROP TABLE IF EXISTS `cms_node`;
CREATE TABLE `cms_node` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `module` varchar(255) NOT NULL,
  `module_name` varchar(50) NOT NULL,
  `action` varchar(255) NOT NULL,
  `action_name` varchar(50) DEFAULT NULL,
  `data` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  `remark` varchar(255) DEFAULT NULL,
  `sort` smallint(6) unsigned NOT NULL DEFAULT '0',
  `auth_type` tinyint(1) NOT NULL DEFAULT '0',
  `group_id` tinyint(3) unsigned DEFAULT '0',
  `often` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-不常用 1-常用',
  `is_show` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-不常用 1-常用',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `module` (`module`),
  KEY `auth_type` (`auth_type`),
  KEY `is_show` (`is_show`),
  KEY `group_id` (`group_id`),
  KEY `sort` (`sort`)
) ENGINE=MyISAM AUTO_INCREMENT=163 DEFAULT CHARSET=utf8;

#
# Data for table "cms_node"
#

/*!40000 ALTER TABLE `cms_node` DISABLE KEYS */;
INSERT INTO `cms_node` VALUES (1,'Node','菜单管理','','','',1,'',0,0,1,0,0),(2,'Node','菜单管理','index','菜单列表','',1,'',0,1,1,0,0),(3,'Node','菜单管理','add','添加菜单','',1,'',0,2,1,0,0),(4,'Node','菜单管理','edit','编辑菜单','',1,'',0,2,1,0,0),(5,'Node','菜单管理','delete','删除菜单','',1,'',0,2,1,0,0),(6,'Role','角色管理','','','',1,'',370,0,1,0,0),(7,'Role','角色管理','index','角色管理','',1,'',0,1,1,0,0),(8,'Role','角色管理','add','添加角色','',1,'',0,2,1,0,0),(9,'Role','角色管理','edit','编辑角色','',1,'',0,2,1,0,0),(10,'Role','角色管理','delete','删除角色','',1,'',0,2,1,0,0),(11,'Role','角色管理','auth','角色授权','',1,'',0,2,1,0,0),(12,'Admin','管理员管理','','','',1,'',380,0,1,0,0),(13,'Admin','管理员管理','index','管理员列表','',1,'',0,1,1,0,0),(14,'Admin','管理员管理','add','添加管理员','',1,'',0,2,1,0,0),(15,'Admin','管理员管理','edit','编辑管理员','',1,'',0,2,1,0,0),(16,'Admin','管理员管理','delete','删除管理员','',1,'',0,2,1,0,0),(50,'Setting','网站设置','','','',1,'',399,0,1,0,0),(51,'Setting','网站设置','index','网站设置','',1,'',0,1,1,0,0),(99,'Flink','友情链接','','','',1,'',98,0,4,0,0),(100,'Flink','友情链接','index','友情链接列表','',1,'',0,1,4,0,0),(101,'Article','资讯管理','','','',1,'',100,0,4,0,0),(102,'Article','资讯管理','index','资讯列表','',1,'',0,1,4,0,0),(103,'Article','资讯管理','add','添加资讯','',1,'',0,1,4,0,0),(104,'ArticleCate','资讯分类','','','',1,'',99,0,4,0,0),(105,'Article','资讯管理','edit','编辑资讯','',1,'',0,2,4,0,0),(106,'Article','资讯管理','delete','删除资讯','',1,'',0,2,4,0,0),(107,'ArticleCate','资讯分类','index','分类列表','',1,'',0,1,4,0,0),(108,'ArticleCate','资讯分类','add','添加分类','',1,'',0,2,4,0,0),(109,'ArticleCate','资讯分类','edit','编辑分类','',1,'',0,2,4,0,0),(110,'ArticleCate','资讯分类','delete','删除分类','',1,'',0,2,4,0,0),(121,'Nav','导航管理','','','',1,'',2,0,4,0,0),(122,'Nav','导航管理','index','导航列表','',1,'',0,1,4,0,0),(123,'Nav','导航管理','add','添加导航','',1,'',0,2,4,0,0),(124,'Nav','导航管理','edit','编辑导航','',1,'',0,2,4,0,0),(125,'Nav','导航管理','delete','删除导航','',1,'',0,2,4,0,0),(126,'Public','起始页','','','',1,'',0,0,9,0,0),(127,'Public','起始页','main','后台首页','',1,'',0,1,9,0,0),(128,'Group','菜单分类管理','','','',1,'菜单分类管理',10,0,1,0,0),(129,'Group','菜单分类管理','index','分类列表','',1,'',0,1,1,0,0),(130,'Group','菜单分类管理','add','增加分类','',1,'',0,2,1,0,0),(131,'Group','菜单分类管理','edit','编辑分类','',1,'',0,2,1,0,0),(132,'Group','菜单分类管理','delete','删除分类','',1,'',0,2,1,0,0),(135,'SellerCate','商家分类管理','','','',1,'',0,0,27,0,0),(136,'SellerCate','商家分类管理','index','分类列表','',1,'',0,1,27,0,0),(137,'SellerCate','商家分类管理','add','增加分类','',1,'',0,2,27,0,0),(138,'SellerCate','商家分类管理','edit','编辑分类','',1,'',0,2,27,0,0),(139,'SellerCate','商家分类管理','delete','删除分类','',1,'',0,2,27,0,0),(140,'SellerList','商家管理','','','',1,'',0,0,27,0,0),(141,'SellerList','商家管理','index','商家列表','',1,'',0,1,27,0,0),(142,'SellerList','商家管理','add','增加商家','',1,'',0,2,27,0,0),(143,'SellerList','商家管理','edit','编辑商家','',1,'',0,2,27,0,0),(144,'SellerList','商家管理','delete','删除商家','',1,'',0,2,27,0,0),(145,'Adboard','广告位置','','','',1,'',0,0,4,0,0),(146,'Adboard','广告位置','index','广告位置','',1,'',0,1,4,0,0),(147,'Adboard','广告位置','add','添加广告位置','',1,'',0,2,4,0,0),(148,'Adboard','广告位置','edit','编辑广告位置','',1,'',0,2,4,0,0),(149,'Adboard','广告位置','delete','删除广告位置','',1,'',0,2,4,0,0),(150,'Ad','广告管理','','','',1,'',0,0,4,0,0),(151,'Ad','广告管理','index','广告列表','',1,'',0,1,4,0,0),(152,'Ad','广告位置','add','添加广告','',1,'',0,2,4,0,0),(153,'Ad','广告位置','edit','编辑广告','',1,'',0,2,4,0,0),(154,'Ad','广告位置','delete','删除广告','',1,'',0,2,4,0,0),(155,'User','会员管理','','','',1,'',0,0,8,0,0),(156,'User','会员管理','index','会员列表','',1,'',0,1,8,0,0),(158,'Question','题目管理','','','',1,'',0,0,29,0,0),(159,'Question','题目管理','add','添加题目','',1,'',0,2,29,0,0),(160,'Question','题目管理','edit','编辑题目','',1,'',0,2,29,0,0),(161,'Question','题目管理','delete','删除题目','',1,'',0,2,29,0,0),(162,'Question','题目管理','index','题目列表','',1,'',0,1,29,0,0);
/*!40000 ALTER TABLE `cms_node` ENABLE KEYS */;

#
# Structure for table "cms_question"
#

DROP TABLE IF EXISTS `cms_question`;
CREATE TABLE `cms_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `qname` varchar(255) NOT NULL DEFAULT '' COMMENT '问题名称',
  `cate_id` varchar(255) DEFAULT NULL,
  `ans_id` varchar(255) DEFAULT NULL,
  `status` tinyint(3) DEFAULT '1',
  `add_time` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

#
# Data for table "cms_question"
#

/*!40000 ALTER TABLE `cms_question` DISABLE KEYS */;
INSERT INTO `cms_question` VALUES (1,'你是最红伟的好友？','1','28',1,'2019-01-12 15:21:34'),(2,'人生本无错，错的是什么时间相遇','2','34',1,'2019-01-12 15:28:55'),(3,'人生本无错，错的是什么时间相遇','2','3',1,'2019-01-12 17:58:41'),(4,'人生本无错，错的是什么时间相遇','2','59',1,'2019-01-12 17:58:51'),(5,'你是最红伟的好友？','1','98',1,'2019-01-12 17:59:39'),(6,'你是最红伟的好友？','1','7',1,'2019-01-12 18:00:23');
/*!40000 ALTER TABLE `cms_question` ENABLE KEYS */;

#
# Structure for table "cms_question_answer"
#

DROP TABLE IF EXISTS `cms_question_answer`;
CREATE TABLE `cms_question_answer` (
  `ans_id` int(11) NOT NULL AUTO_INCREMENT,
  `ans_name` varchar(255) DEFAULT NULL,
  `q_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ans_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='选项表';

#
# Data for table "cms_question_answer"
#

/*!40000 ALTER TABLE `cms_question_answer` DISABLE KEYS */;
INSERT INTO `cms_question_answer` VALUES (1,'哈哈哈','1'),(2,'不用客气','1'),(3,'昨日','2'),(4,'今日','2'),(5,'明日','2'),(6,'昨日','3'),(7,'今日','3'),(8,'明日','3'),(9,'昨日','4'),(10,'今日','4'),(11,'明日','4'),(12,'哈哈哈','5'),(13,'不用客气','5'),(14,'哈哈哈','6'),(15,'不用客气','6');
/*!40000 ALTER TABLE `cms_question_answer` ENABLE KEYS */;

#
# Structure for table "cms_question_cate"
#

DROP TABLE IF EXISTS `cms_question_cate`;
CREATE TABLE `cms_question_cate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `state` enum('Y','N') DEFAULT NULL,
  `pid` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

#
# Data for table "cms_question_cate"
#

/*!40000 ALTER TABLE `cms_question_cate` DISABLE KEYS */;
INSERT INTO `cms_question_cate` VALUES (1,'自定义','Y',0),(2,'生活类','Y',0),(3,'爱好类','Y',0);
/*!40000 ALTER TABLE `cms_question_cate` ENABLE KEYS */;

#
# Structure for table "cms_role"
#

DROP TABLE IF EXISTS `cms_role`;
CREATE TABLE `cms_role` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `status` tinyint(1) unsigned DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `create_time` int(11) unsigned NOT NULL,
  `update_time` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

#
# Data for table "cms_role"
#

/*!40000 ALTER TABLE `cms_role` DISABLE KEYS */;
INSERT INTO `cms_role` VALUES (1,'管理员',1,'管理员1',1208784792,1254325558),(2,'编辑',1,'编辑',1208784792,1254325558);
/*!40000 ALTER TABLE `cms_role` ENABLE KEYS */;

#
# Structure for table "cms_seller_cate"
#

DROP TABLE IF EXISTS `cms_seller_cate`;
CREATE TABLE `cms_seller_cate` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `cid` int(8) NOT NULL,
  `name` varchar(200) NOT NULL,
  `count` int(8) NOT NULL,
  `seller_status` int(1) NOT NULL DEFAULT '1',
  `status` int(1) NOT NULL,
  `sort` int(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  KEY `index_status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=123 DEFAULT CHARSET=utf8;

#
# Data for table "cms_seller_cate"
#

/*!40000 ALTER TABLE `cms_seller_cate` DISABLE KEYS */;
INSERT INTO `cms_seller_cate` VALUES (101,1,'图书音像',15,1,1,10),(102,2,'手机数码',19,1,1,10),(103,3,'电脑笔记本',15,1,1,10),(104,4,'服装服饰',85,1,1,10),(105,5,'化妆美容',41,1,1,10),(106,6,'综合百货',22,1,1,10),(107,7,'户外休闲',3,0,1,10),(108,8,'家用电器',19,1,1,10),(109,9,'居家生活',24,1,1,10),(110,10,'母婴用品',14,1,1,10),(111,11,'办公用品',6,0,1,10),(112,12,'玩具礼品',6,0,1,10),(113,13,'数字卡软件',2,0,1,10),(114,14,'药品保健',8,1,1,10),(115,15,'钟表眼镜',17,1,1,10),(116,16,'旅游订票',1,0,1,10),(117,17,'汽车用品',7,0,1,10),(118,18,'饰品配饰',31,1,1,10),(119,19,'成人保健',6,0,1,10),(120,20,'宠物用品',1,0,1,10),(121,21,'箱包皮具',29,1,1,10),(122,22,'食品饮料',31,1,1,10);
/*!40000 ALTER TABLE `cms_seller_cate` ENABLE KEYS */;

#
# Structure for table "cms_seller_list"
#

DROP TABLE IF EXISTS `cms_seller_list`;
CREATE TABLE `cms_seller_list` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `sid` int(8) NOT NULL,
  `cate_id` int(8) NOT NULL,
  `name` varchar(200) NOT NULL,
  `site_logo` varchar(200) DEFAULT NULL,
  `net_logo` varchar(200) NOT NULL,
  `recommend` int(1) NOT NULL,
  `click_url` varchar(400) NOT NULL,
  `sort` int(6) NOT NULL,
  `description` varchar(200) NOT NULL,
  `freeshipment` int(1) NOT NULL,
  `installment` int(1) NOT NULL,
  `has_invoice` int(1) NOT NULL,
  `cash_back_rate` varchar(64) NOT NULL,
  `status` int(1) NOT NULL,
  `update_time` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_status` (`status`),
  KEY `index_recommend` (`recommend`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

#
# Data for table "cms_seller_list"
#

/*!40000 ALTER TABLE `cms_seller_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_seller_list` ENABLE KEYS */;

#
# Structure for table "cms_seller_list_cate"
#

DROP TABLE IF EXISTS `cms_seller_list_cate`;
CREATE TABLE `cms_seller_list_cate` (
  `list_id` int(11) NOT NULL,
  `cate_id` int(11) NOT NULL,
  KEY `list_id` (`list_id`),
  KEY `cate_id` (`cate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "cms_seller_list_cate"
#

/*!40000 ALTER TABLE `cms_seller_list_cate` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_seller_list_cate` ENABLE KEYS */;

#
# Structure for table "cms_setting"
#

DROP TABLE IF EXISTS `cms_setting`;
CREATE TABLE `cms_setting` (
  `name` varchar(100) NOT NULL,
  `data` text NOT NULL,
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "cms_setting"
#

/*!40000 ALTER TABLE `cms_setting` DISABLE KEYS */;
INSERT INTO `cms_setting` VALUES ('site_name','移动后台管理系统'),('site_title','移动后台管理系统'),('site_keyword','MobileCms移动后台管理系统，phonegap100.com'),('site_description','MobileCms是一款移动互联网软件后台管理系统，由phonegap100.com 提供'),('site_status','1'),('site_icp','京ICP备88888888号'),('statistics_code',''),('closed_reason','升级'),('site_domain','http://localhost/wego25'),('weibo_url','http://www.weibo.com'),('qqzone_url',''),('douban_url',''),('attachment_size','3145728'),('template','default'),('taobao_app_key','12504724'),('qq_app_key',''),('qq_app_Secret',''),('sina_app_key','100308089'),('sina_app_Secret','25ee4d31ca98edea230885985e1cf2e1'),('taobao_app_secret','9d6877190386092d4288dcae32811081'),('url_model','0'),('attachment_path','data/uploads'),('client_hash',''),('attachment_type','jpg,gif,png,jpeg'),('miao_appkey','1003336'),('miao_appsecret','0847c5008f99150de65fad8e8ec342fa'),('mail_smtp','smtp.163.com'),('mail_username','ho1000003@163.com\r\nho1000004@163.com\r\nho1000005@163.com\r\nhml100000@163.com'),('mail_password','PassWord01!'),('mail_port','25'),('mail_fromname','MobileCms'),('check_code','1'),('comment_time','10'),('site_share','<meta property=\\\"qc:admins\\\" content=\\\"271503564761116217636\\\" />'),('ban_sipder','youdaobot|bingbot'),('ban_ip','192.168.1.50'),('site_logo','./data/setting/5c2dd4835f717.png'),('article_count','10'),('html_suffix','.html'),('mail_username','ho1000003@163.com\r\nho1000004@163.com\r\nho1000005@163.com\r\nhml100000@163.com'),('mail_receive_username',''),('mail_content','<body style=\\\"margin: 10px;\\\">\r\n<div align=\\\"center\\\"><img src=\\\"http://www.phonegap100.com/static/image/common/logo.png\\\"></div><br>\r\n<br>\r\n <h3>欢迎使用 树根cms 此系统由phonegap中文网 <a href=\\\"http://www.phonegap100.com\\\" target=\\\"_blank\\\">phonegap100.com</a>提供 </h3>\r\n<br>\r\n\r\n在使用中遇到任何问题，请到phonegap中文网提出，感谢大家对此程序的支持，我们的qq群：295402925\r\n\r\n</body>'),('mail_title','欢迎使用树根cms，这是一封感谢信');
/*!40000 ALTER TABLE `cms_setting` ENABLE KEYS */;
