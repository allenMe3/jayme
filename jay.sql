/*
 Navicat Premium Data Transfer

 Source Server         : 本地数据库连接
 Source Server Type    : MySQL
 Source Server Version : 50527
 Source Host           : localhost:3306
 Source Schema         : jay

 Target Server Type    : MySQL
 Target Server Version : 50527
 File Encoding         : 65001

 Date: 06/05/2020 10:19:03
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for j_banner
-- ----------------------------
DROP TABLE IF EXISTS `j_banner`;
CREATE TABLE `j_banner`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `src` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sort` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of j_banner
-- ----------------------------
INSERT INTO `j_banner` VALUES (1, 'http://localhost:3000/image/banner/1.jpg', '#', 1);
INSERT INTO `j_banner` VALUES (2, 'http://localhost:3000/image/banner/2.jpg', '#', 2);
INSERT INTO `j_banner` VALUES (3, 'http://localhost:3000/image/banner/3.jpg', '#', 3);
INSERT INTO `j_banner` VALUES (4, 'http://localhost:3000/image/banner/4.jpg', '#', 4);

-- ----------------------------
-- Table structure for j_collect
-- ----------------------------
DROP TABLE IF EXISTS `j_collect`;
CREATE TABLE `j_collect`  (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `comment_id` int(11) NOT NULL,
  `re_name` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `user_name` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `comment_id`(`comment_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of j_collect
-- ----------------------------
INSERT INTO `j_collect` VALUES (7, 33, 'jam', 'aaa', '测试5', '2020-04-10 10:25:52');
INSERT INTO `j_collect` VALUES (8, 31, 'aaa', 'aaa', '测试2', '2020-04-10 10:26:35');
INSERT INTO `j_collect` VALUES (9, 29, 'aaa', 'aaa', '测试2', '2020-04-10 16:36:16');
INSERT INTO `j_collect` VALUES (25, 37, 'my', 'my', '123', '2020-04-19 14:57:41');
INSERT INTO `j_collect` VALUES (26, 39, 'my', 'my', '测试', '2020-04-20 19:53:55');
INSERT INTO `j_collect` VALUES (29, 40, 'abc', 'abc', 'cs', '2020-04-21 13:07:23');
INSERT INTO `j_collect` VALUES (33, 35, 'jam', 'my', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', '2020-04-21 13:37:41');
INSERT INTO `j_collect` VALUES (34, 43, 'my', 'my', 'ceshi', '2020-04-28 09:52:23');
INSERT INTO `j_collect` VALUES (35, 44, 'ceshi', 'ceshi', 'ceshi', '2020-04-28 10:08:18');

-- ----------------------------
-- Table structure for j_comment
-- ----------------------------
DROP TABLE IF EXISTS `j_comment`;
CREATE TABLE `j_comment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `re_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `comment_id` int(11) DEFAULT NULL,
  `user_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `content` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of j_comment
-- ----------------------------
INSERT INTO `j_comment` VALUES (1, 'aaa', 32, 'aaa', '测试1', '2020-03-24 14:14:42');
INSERT INTO `j_comment` VALUES (2, 'aaa', 32, 'jam', '测试2', '2020-03-25 15:36:47');
INSERT INTO `j_comment` VALUES (3, 'aaa', 32, 'jam', '测试3', '2020-03-25 15:39:29');
INSERT INTO `j_comment` VALUES (4, 'jam', 33, 'jam', '测试1', '2020-03-25 15:40:59');
INSERT INTO `j_comment` VALUES (5, 'aaa', 32, 'jam', '测试4', '2020-03-26 10:37:58');
INSERT INTO `j_comment` VALUES (6, 'jam', 33, 'aaa', '测试2', '2020-03-27 14:33:39');
INSERT INTO `j_comment` VALUES (11, 'jam', 33, 'aaa', '113', '2020-04-10 16:07:02');
INSERT INTO `j_comment` VALUES (12, 'aaa', 32, 'aaa', '123', '2020-04-10 16:07:41');
INSERT INTO `j_comment` VALUES (13, 'aaa', 31, 'aaa', '测试', '2020-04-11 09:36:54');
INSERT INTO `j_comment` VALUES (14, 'jam', 33, 'jam', '芜湖', '2020-04-11 16:24:20');
INSERT INTO `j_comment` VALUES (15, 'jam', 33, 'jam', '123', '2020-04-11 16:25:13');
INSERT INTO `j_comment` VALUES (16, 'aaa', 36, 'jam', '123', '2020-04-11 16:30:08');
INSERT INTO `j_comment` VALUES (17, 'aaa', 36, 'jam', '234', '2020-04-11 16:31:04');
INSERT INTO `j_comment` VALUES (18, 'jam', 35, 'jam', '撒地方', '2020-04-11 16:33:40');
INSERT INTO `j_comment` VALUES (19, 'aaa', 36, 'jam', '222', '2020-04-12 09:29:50');
INSERT INTO `j_comment` VALUES (20, 'aaa', 36, 'jam', '33', '2020-04-12 09:46:23');
INSERT INTO `j_comment` VALUES (21, 'my', 37, 'my', '123', '2020-04-12 16:44:32');
INSERT INTO `j_comment` VALUES (22, 'aaa', 36, 'aaa', '123', '2020-04-13 10:31:22');
INSERT INTO `j_comment` VALUES (23, 'my', 38, 'my', '123', '2020-04-13 12:34:12');
INSERT INTO `j_comment` VALUES (24, 'my', 38, 'my', '222', '2020-04-13 12:35:18');
INSERT INTO `j_comment` VALUES (25, 'my', 38, 'my', '333', '2020-04-13 12:48:22');
INSERT INTO `j_comment` VALUES (26, 'my', 38, 'my', '444', '2020-04-13 12:49:07');
INSERT INTO `j_comment` VALUES (27, 'my', 37, 'my', '123', '2020-04-16 11:06:08');
INSERT INTO `j_comment` VALUES (28, 'my', 39, 'my', '测试', '2020-04-20 19:50:15');
INSERT INTO `j_comment` VALUES (29, 'aaa', 40, 'abc', 'cs', '2020-04-21 12:28:18');
INSERT INTO `j_comment` VALUES (30, 'aaa', 40, 'abc', '11', '2020-04-21 12:32:40');
INSERT INTO `j_comment` VALUES (31, 'aaa', 40, 'abc', '11', '2020-04-21 12:35:20');
INSERT INTO `j_comment` VALUES (32, 'abc', 40, 'my', 'eihei', '2020-04-22 10:29:37');
INSERT INTO `j_comment` VALUES (33, 'my', 42, 'my', 'ceshi', '2020-04-24 15:30:15');
INSERT INTO `j_comment` VALUES (34, 'my', 42, 'my', 'tongzhi', '2020-04-24 15:32:44');
INSERT INTO `j_comment` VALUES (35, 'ceshi', 44, 'ceshi', 'huifu', '2020-04-28 10:08:14');

-- ----------------------------
-- Table structure for j_commentlist
-- ----------------------------
DROP TABLE IF EXISTS `j_commentlist`;
CREATE TABLE `j_commentlist`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_cout` int(255) DEFAULT NULL,
  `user_name` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `likeit` int(255) DEFAULT NULL,
  `content` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of j_commentlist
-- ----------------------------
INSERT INTO `j_commentlist` VALUES (28, 0, 'aaa', 0, '测试1', '2020-03-24 13:19:42');
INSERT INTO `j_commentlist` VALUES (29, 0, 'aaa', 0, '测试2', '2020-03-24 13:20:28');
INSERT INTO `j_commentlist` VALUES (31, 1, 'aaa', 0, '测试2', '2020-03-24 13:37:03');
INSERT INTO `j_commentlist` VALUES (32, 5, 'aaa', 0, '测试4', '2020-03-24 13:43:35');
INSERT INTO `j_commentlist` VALUES (33, 4, 'jam', 0, '测试5', '2020-03-24 13:59:34');
INSERT INTO `j_commentlist` VALUES (35, 1, 'jam', 1, 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', '2020-04-11 14:42:58');
INSERT INTO `j_commentlist` VALUES (36, 4, 'aaa', 14, '123', '2020-04-11 15:01:48');
INSERT INTO `j_commentlist` VALUES (37, 2, 'my', 2, '123', '2020-04-12 16:44:21');
INSERT INTO `j_commentlist` VALUES (38, 4, 'my', 5, 'aa', '2020-04-13 10:43:24');
INSERT INTO `j_commentlist` VALUES (39, NULL, 'my', 2, '测试', '2020-04-20 19:50:06');
INSERT INTO `j_commentlist` VALUES (40, NULL, 'abc', 3, 'cs', '2020-04-21 12:28:11');
INSERT INTO `j_commentlist` VALUES (41, NULL, 'my', 0, 'ceshi', '2020-04-24 15:02:01');
INSERT INTO `j_commentlist` VALUES (42, NULL, 'my', 0, 'ceshi', '2020-04-24 15:07:18');
INSERT INTO `j_commentlist` VALUES (43, NULL, 'my', 1, 'ceshi', '2020-04-28 09:52:19');
INSERT INTO `j_commentlist` VALUES (44, NULL, 'ceshi', 1, 'ceshi', '2020-04-28 10:08:02');

-- ----------------------------
-- Table structure for j_honor
-- ----------------------------
DROP TABLE IF EXISTS `j_honor`;
CREATE TABLE `j_honor`  (
  `id` int(11) NOT NULL,
  `content` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of j_honor
-- ----------------------------
INSERT INTO `j_honor` VALUES (1, '2017 华语金曲奖致敬香港回归20周年颁奖盛典”“年度最佳国语专辑” 周杰伦的床边故事 （获奖）');
INSERT INTO `j_honor` VALUES (2, '2016 第3届QQ音乐年度盛典 QQ音乐年度巅峰人气歌手 （获奖）');
INSERT INTO `j_honor` VALUES (3, '2016 第3届QQ音乐年度盛典 年度最具影响力演唱会 （获奖）');
INSERT INTO `j_honor` VALUES (4, '2016 第3届QQ音乐年度盛典 年度音乐全能艺人 （获奖）');
INSERT INTO `j_honor` VALUES (5, '2015 第19届全球华语榜中榜 华语乐坛跨时代实力创作人 （获奖）');
INSERT INTO `j_honor` VALUES (6, '2015 第2届QQ音乐年度盛典 最佳全能艺人 （获奖）');
INSERT INTO `j_honor` VALUES (7, '2015 第2届QQ音乐年度盛典 年度最畅销数字专辑 （获奖）');
INSERT INTO `j_honor` VALUES (8, '2015 第19届全球华语榜中榜 亚洲影响力最受欢迎全能艺人 （获奖）');
INSERT INTO `j_honor` VALUES (9, '2014 第一届 QQ音乐年度盛典港台最受欢迎男歌手 （获奖）');
INSERT INTO `j_honor` VALUES (10, '2014 第八届 无线音乐盛典咪咕汇年度最佳人气王 周杰伦 （获奖）');
INSERT INTO `j_honor` VALUES (11, '2014 第一届 QQ音乐年度盛典最佳影视原声带 《天台》电影原声带 （获奖）');
INSERT INTO `j_honor` VALUES (12, '2014 第一届 QQ音乐年度盛典最佳全能艺人 （获奖）');
INSERT INTO `j_honor` VALUES (13, '2014 第36届 香港十大中文金曲 优秀流行国语歌曲奖（银奖） 《红尘客栈》 （获奖）');
INSERT INTO `j_honor` VALUES (14, '2014 第八届 无线音乐盛典咪咕汇年度最畅销十大金曲奖 《红尘客栈》 （获奖）');
INSERT INTO `j_honor` VALUES (15, '2013 第7届 中国移动无线音乐咪咕汇 年度最佳歌手 十二新作 （获奖）');
INSERT INTO `j_honor` VALUES (16, '2013 第7届 中国移动无线音乐咪咕汇 年度最畅销专辑 十二新作 （获奖）');
INSERT INTO `j_honor` VALUES (17, '2012 第8届 中国金唱片奖 数字音乐演员 （获奖）');
INSERT INTO `j_honor` VALUES (18, '2012 HITO流行音乐奖 年度华语歌曲 水手怕水 （获奖） ）');
INSERT INTO `j_honor` VALUES (19, '2012 第11届雪碧中国原创音乐流行榜优秀合唱歌曲 天地一斗 （获奖）');
INSERT INTO `j_honor` VALUES (20, '2012 第11届雪碧中国原创音乐流行榜 港台地区歌曲 惊叹号 （获奖）');
INSERT INTO `j_honor` VALUES (21, '2012 HITO最受欢迎全球华语歌手 （获奖）');
INSERT INTO `j_honor` VALUES (22, '2012 第11届雪碧中国原创音乐流行榜优秀专辑 惊叹号 （获奖）');
INSERT INTO `j_honor` VALUES (23, '2011 Music Radio中国TOP排行榜 港台地区年度最佳歌手 （获奖）');
INSERT INTO `j_honor` VALUES (24, '2011 第17届 Channel V第17届全球华语榜中榜 12530无线音乐年度奖 （获奖）');
INSERT INTO `j_honor` VALUES (25, '2011 北京流行音乐中歌榜 年度最佳歌手 （获奖）');
INSERT INTO `j_honor` VALUES (26, '2011 兔年春晚我最喜爱的春节联欢晚会评选 歌舞类三等奖 兰亭序 （获奖）');
INSERT INTO `j_honor` VALUES (27, '2011 第22届 台湾金曲奖 年度最佳国语歌手 年度最佳国语专辑 跨时代 （获奖）');
INSERT INTO `j_honor` VALUES (28, '2011 加拿大、美国电台 推崇奖 （获奖）');
INSERT INTO `j_honor` VALUES (29, '2011 新加坡E乐大赏 E乐最佳歌手 E乐最佳作词 雨下一整晚 （获奖）');
INSERT INTO `j_honor` VALUES (30, '2011 中华音乐人交流协会 年度10大优良专辑、年度10大优良歌曲 跨时代,阿爸 （获奖）');
INSERT INTO `j_honor` VALUES (31, '2011 香港IFPI 国语流行音乐最受欢迎音像 跨时代 （获奖）');
INSERT INTO `j_honor` VALUES (32, '2011 雪碧中国原创音乐流行榜 港台地区歌曲 超人不会飞 （获奖）');
INSERT INTO `j_honor` VALUES (33, '2011 全球流行音乐金榜 年度最佳专辑 跨时代 （获奖）');
INSERT INTO `j_honor` VALUES (34, '2011 第5届 中国移动无线音乐咪咕汇 人气歌手 畅销歌曲 烟花易冷 （获奖）');
INSERT INTO `j_honor` VALUES (35, '2010 第16届 Channel V第16届全球华语榜中榜 12530无线音乐年度奖 （获奖）');
INSERT INTO `j_honor` VALUES (36, '2010 第10届 全球华语歌曲排行榜 年度20大歌曲 超人不会飞 （获奖）');
INSERT INTO `j_honor` VALUES (37, '2010 北京流行音乐中歌榜 港台地区年度最佳专辑 （获奖）');
INSERT INTO `j_honor` VALUES (38, '2010 雪碧中国原创音乐流行榜 港台地区歌曲 说好的幸福呢 （获奖）');
INSERT INTO `j_honor` VALUES (39, '2010 音乐飙榜 年度最佳专辑 华语年度歌曲 超人不会飞 （获奖）');
INSERT INTO `j_honor` VALUES (40, '2010 新加坡金曲奖 年度专辑 跨时代 （获奖）');
INSERT INTO `j_honor` VALUES (41, '2009 第7届 Music Radio中国TOP排行榜 中国TOP30歌曲 （获奖）');
INSERT INTO `j_honor` VALUES (42, '2009 第4届 KKBOX数位音乐风云榜年度20大华语歌曲冠军 说好的幸福呢 （获奖）');
INSERT INTO `j_honor` VALUES (43, '2009 北京流行音乐中歌榜 年度最受欢迎歌手 年度最佳创作歌手 年度最佳制作人 魔杰座) （获奖）');
INSERT INTO `j_honor` VALUES (44, '2009 雪碧榜中国原创音乐流行榜 港台地区歌曲 稻香 （获奖）');
INSERT INTO `j_honor` VALUES (45, '2009 中华音乐人交流协会 年度10大专辑 魔杰座 （获奖）');
INSERT INTO `j_honor` VALUES (46, '2009 中华音乐人交流协会年度10大单曲 （获奖）');
INSERT INTO `j_honor` VALUES (47, '2009 港台地区优秀专辑 魔杰座 （获奖）');
INSERT INTO `j_honor` VALUES (48, '2008 HITO流行音乐奖 HITO创作歌手 HITO亚洲传媒歌手 HITO年度10大歌曲 不能说的秘密) （获奖）');
INSERT INTO `j_honor` VALUES (49, '2008 MTV百大歌曲排行榜 百大歌曲前10强 不能说的秘密 （获奖）');
INSERT INTO `j_honor` VALUES (50, '2008 雪碧中国原创音乐流行榜 港台地区歌曲 菊花台 （获奖）');
INSERT INTO `j_honor` VALUES (51, '2008 第2届 中国移动无线音乐咪咕汇 年度最高销量歌手 年度畅销季度歌曲 迷迭香 （获奖）');
INSERT INTO `j_honor` VALUES (52, '2008 第19届 台湾金曲奖 最佳歌曲 我很忙 （获奖）');
INSERT INTO `j_honor` VALUES (53, '2008 第3届 KKBOX数位音乐风云榜 年度风云歌手 年度最佳男歌手 年度风云10大歌曲 不能说的秘密 （获奖）');
INSERT INTO `j_honor` VALUES (54, '2008 第6届 Music Radio中国TOP排行榜 年度最佳唱片 年度畅销歌手 年度最佳创作歌手 （获奖）');
INSERT INTO `j_honor` VALUES (55, '2007 中华音乐人交流协会 年度10大优良专辑 依然范特西 （获奖）');
INSERT INTO `j_honor` VALUES (56, '2007 第44届 台湾金马奖 年度台湾杰出电影 不能说的秘密 （获奖）');
INSERT INTO `j_honor` VALUES (57, '2007 第18届 台湾金曲奖 最佳制作人 霍元甲 （获奖）');
INSERT INTO `j_honor` VALUES (58, '2007 第26届 香港金像奖 最佳原创电影歌曲 菊花台 （获奖）');
INSERT INTO `j_honor` VALUES (59, '2007 第7届 蒙牛酸酸乳音乐风云榜 最佳歌曲 千里之外 （获奖）');
INSERT INTO `j_honor` VALUES (60, '2007 第10届 上海电影节 魅力中国最受欢迎华人影星 （获奖）');
INSERT INTO `j_honor` VALUES (61, '2006 香港IFPI 10大销量国语唱片 11月的萧邦 （获奖）');
INSERT INTO `j_honor` VALUES (62, '2006 第12届 Channel V第12届全球华语榜中榜 最佳歌手 最受欢迎歌手 最佳创作歌手 最受欢迎音乐录影带 （获奖）');
INSERT INTO `j_honor` VALUES (63, '2006 第8届 CCTV MTV音乐盛典 亚太地区杰出艺人奖 （获奖）');
INSERT INTO `j_honor` VALUES (64, '2006 第25届 香港金像奖 最佳新人 头文字D （获奖）2006 第25届 香港金像奖 最佳新人 头文字D （获奖）');
INSERT INTO `j_honor` VALUES (65, '2006 第25届 香港金像奖 最佳新人 头文字D （获奖）');
INSERT INTO `j_honor` VALUES (66, '2006 第1届 华众曲宠TVBS华语金曲榜 最佳专辑 11月的萧邦 （获奖）');
INSERT INTO `j_honor` VALUES (67, '2006 第1届 KKBOX线上音乐风云榜 年度10大歌曲 夜曲 （获奖）');
INSERT INTO `j_honor` VALUES (68, '2006 第6届 事音乐风云榜 三地连颁华语地区最佳歌手 三地连颁华语地区最佳专辑 11月的萧邦 （获奖）');
INSERT INTO `j_honor` VALUES (69, '2006 中华音乐人交流协会 年度10大优良专辑 11月的萧邦 （获奖）');
INSERT INTO `j_honor` VALUES (70, '2006 HITO流行音乐奖 最受欢迎歌手 HITO10大华语歌曲 夜曲 （获奖）');
INSERT INTO `j_honor` VALUES (71, '2005 第16届 台湾金曲奖 （获奖）');
INSERT INTO `j_honor` VALUES (72, '2005 第12届 中国歌曲排行榜 年度最受欢迎歌手 年度最受欢迎歌曲 七里香 （获奖）');
INSERT INTO `j_honor` VALUES (73, '2005 中华音乐人交流协会 年度10大优良专辑 七里香 （获奖）');
INSERT INTO `j_honor` VALUES (74, '2005 第12届 东方风云榜颁奖盛典 华语乐坛最受欢迎歌手 （获奖）');
INSERT INTO `j_honor` VALUES (75, '2005 ETFM联播网公主与战士票选活动 娱乐圈最佳战士代表 （获奖）');
INSERT INTO `j_honor` VALUES (76, '2005 第11届 10大电视广告 最受欢迎明星电视广告 （获奖）');
INSERT INTO `j_honor` VALUES (77, '2005 MTV亚洲音乐奖 港台地区最受欢迎歌手 （获奖）');
INSERT INTO `j_honor` VALUES (78, '2005 香港IFPI 10大销量国语唱片 七里香 （获奖）');
INSERT INTO `j_honor` VALUES (79, '2005 HITO流行音乐奖 HITO最佳歌手 HITO10大最爱DJ专辑 HITO创作歌手 七里香 （获奖）');
INSERT INTO `j_honor` VALUES (80, '2005 第5届 全球华语歌曲排行榜 港台地区杰出艺人 年度25大歌曲 七里香 （获奖）');
INSERT INTO `j_honor` VALUES (81, '2005 中华音乐人年度10大专辑和单曲 年度10大专辑 七里香 （获奖）');
INSERT INTO `j_honor` VALUES (82, '2005 第3届 Music Radio中国TOP排行榜 年度歌曲 七里香 （获奖）');
INSERT INTO `j_honor` VALUES (83, '2005 上海F1赛车场 中国赛车运动推广贡献奖 （获奖）');
INSERT INTO `j_honor` VALUES (84, '2005 Channel V第11届全球华语榜中榜 最佳歌手 最受欢迎歌手 最佳歌曲 七里香 （获奖）');
INSERT INTO `j_honor` VALUES (85, '2005 新城劲爆颁奖典礼新城劲爆创作专辑 11月的萧邦 （获奖）');
INSERT INTO `j_honor` VALUES (86, '2005 香港电台10大中文金曲 10大歌曲 七里香 （获奖）');
INSERT INTO `j_honor` VALUES (87, '2005 MTV华语地区 年度10大男女歌手 （获奖）');
INSERT INTO `j_honor` VALUES (88, '2005 第5届 百事音乐风云榜 港台地区最受欢迎歌手 港台地区10大歌曲 （获奖）');
INSERT INTO `j_honor` VALUES (89, '2004 第15届 台湾金曲奖 最佳流行音乐演唱专辑 叶惠美 （获奖）');
INSERT INTO `j_honor` VALUES (90, '2004 第11届 届中国歌曲排行榜 港台地区最受欢迎歌手 港台地区最受欢迎歌曲 东风破 （获奖）');
INSERT INTO `j_honor` VALUES (91, '2004 MusicIn中国TOP排行榜 台港地区年度歌曲 东风破 （获奖）');
INSERT INTO `j_honor` VALUES (92, '2004 第3届 日本MTV音乐录影带奖 入围最佳BUZZASIA港台艺人 （获奖）');
INSERT INTO `j_honor` VALUES (93, '2004 第4届 全球华语歌曲排行榜 最受欢迎歌手 最受欢迎创作歌手 （获奖）');
INSERT INTO `j_honor` VALUES (94, '2004 莱卡Channel Young风尚颁奖典礼 风尚音乐成就奖 （获奖）');
INSERT INTO `j_honor` VALUES (95, '2004 第4届 华语音乐传媒奖 10大国语唱片 叶惠美 （获奖）');
INSERT INTO `j_honor` VALUES (96, '2004 第4届 百事音乐风云榜 港台地区最受欢迎歌手 港台地区最佳制作人 港台地区最佳专辑 叶惠美) （获奖）\r\n2004 第4届 百事音乐风云榜 港台地区最受欢迎歌手 港台地区最佳制作人 港台地区最佳专辑 叶惠美) （获奖）\r\n2004 第4届 百事音乐风云榜 港台地区最受欢迎歌手 港台地区最佳制作人 港台地区最佳专辑 叶惠美) （获奖）\r\n2004 第4届 百事音乐风云榜 港台地区最受欢迎歌手 港台地区最佳制作人 港台地区最佳专辑 叶惠美) （获奖）');
INSERT INTO `j_honor` VALUES (97, '2004 幽浮劲碟排行榜 《七里香》销量、播歌、票选总成绩冠军 七里香 （获奖）');
INSERT INTO `j_honor` VALUES (98, '2004 第10届 0大电视广告 最受欢迎明星电视广告 One 2 Free （获奖）');
INSERT INTO `j_honor` VALUES (99, '2004 新城国语力颁奖典礼 新城国语力亚洲创作歌手 （获奖）');
INSERT INTO `j_honor` VALUES (100, '2004 HITO流行音乐奖 HITO亚洲传媒推荐专辑 HITO华语歌曲 HITO最受欢迎歌手 HITO歌手 （获奖）');
INSERT INTO `j_honor` VALUES (101, '2004 新加坡金曲奖 最受欢迎歌手 最佳专辑制作人 叶惠美 （获奖）');
INSERT INTO `j_honor` VALUES (102, '2004 香港商业电台叱咤乐坛流行榜 叱咤乐坛制作人金奖 （获奖）');
INSERT INTO `j_honor` VALUES (103, '2004 MTV亚洲音乐奖 港台地区最受欢迎歌手 （获奖）');
INSERT INTO `j_honor` VALUES (104, '2004 中华音乐人交流协会 10大优良专辑 叶惠美 （获奖）');
INSERT INTO `j_honor` VALUES (105, '2004 香港IFPI 10大销量国语唱片 叶惠美、寻找周杰伦EP （获奖）');
INSERT INTO `j_honor` VALUES (106, '2004 香港TVB8 最佳作曲 七里香 （获奖）');
INSERT INTO `j_honor` VALUES (107, '2003 MTV音乐电台 港台地区最佳歌手 （获奖）');
INSERT INTO `j_honor` VALUES (108, '2003 第3届 中国音乐风云榜暨10大金曲颁奖典礼 年度风云人物 最佳制作人 （获奖）');
INSERT INTO `j_honor` VALUES (109, '2003 第3届 华语流行音乐传媒奖 （获奖）');
INSERT INTO `j_honor` VALUES (110, '2003 第9届 Channel V第9届全球华语音乐榜中榜 最佳创作歌手 （获奖）');
INSERT INTO `j_honor` VALUES (111, '2003 香港商业电台叱咤乐坛流行榜 叱咤乐坛制作人银奖 （获奖）');
INSERT INTO `j_honor` VALUES (112, '2003 第9届 10大电视广告 最受欢迎明星电视广告 （获奖）');
INSERT INTO `j_honor` VALUES (113, '2003 HITO流行音乐奖 HITO歌手 HITO华语歌曲 暗号 （获奖）');
INSERT INTO `j_honor` VALUES (114, '2003 MuchIn中国TOP排行榜 年度最佳专辑 年度最佳创作10大金曲 （获奖）');
INSERT INTO `j_honor` VALUES (115, '2003 第3届 全球华语歌曲排行榜 最受欢迎歌手 （获奖）');
INSERT INTO `j_honor` VALUES (116, '2003 新城电台颁奖典礼 亚洲创作歌手 亚洲歌手 （获奖）');
INSERT INTO `j_honor` VALUES (117, '2003 香港IFPI 10大销量国语唱片 八度空间 （获奖）');
INSERT INTO `j_honor` VALUES (118, '2003 香港10大劲歌金曲 最受欢迎华语歌曲金奖 （获奖）');
INSERT INTO `j_honor` VALUES (119, '2003 第2届 MTV亚洲音乐颁奖典礼 港台地区最受欢迎歌手 （获奖）');
INSERT INTO `j_honor` VALUES (120, '2003 G-Music风云榜白金音乐奖 白金专辑 八度空间 （获奖）');
INSERT INTO `j_honor` VALUES (121, '2003 第14届 台湾金曲奖 （获奖）');
INSERT INTO `j_honor` VALUES (122, '2003 新加坡金曲奖 年度畅销歌手 （获奖）');
INSERT INTO `j_honor` VALUES (123, '2003 香港电台10大中文金曲 年度最高销量歌手 （获奖）');
INSERT INTO `j_honor` VALUES (124, '2002 第13届 台湾金曲奖 最佳流行音乐演唱专辑: 范特西 （获奖）');
INSERT INTO `j_honor` VALUES (125, '2002 第8届 Channel V第8届全球华语音乐榜中榜 TOP 20 Hits （获奖）');
INSERT INTO `j_honor` VALUES (126, '2002 第2届 全球华语歌曲排行榜 最佳专辑 最佳制作人 最佳创作歌手 （获奖）');
INSERT INTO `j_honor` VALUES (127, '2002 第2届 MTV封神榜音乐奖台北流行音乐节 20大人气歌手 （获奖）');
INSERT INTO `j_honor` VALUES (128, '2002 第1届 MTV日本音乐录影带奖 （获奖）');
INSERT INTO `j_honor` VALUES (129, '2002 新加坡金曲奖 亚太地区最受推崇歌手 年度最佳畅销专辑 （获奖）');
INSERT INTO `j_honor` VALUES (130, '2002 香港商业电台叱咤乐坛流行榜 叱咤乐坛生力军歌手金奖 （获奖）');
INSERT INTO `j_honor` VALUES (131, '2002 香港电台10大中文金曲 最有前途新人金奖 （获奖）');
INSERT INTO `j_honor` VALUES (132, '2002 香港10大劲歌金曲 最受欢迎华语歌曲金奖 开不了口 （获奖）');
INSERT INTO `j_honor` VALUES (133, '2002 新城劲爆颁奖典礼 新城劲爆华语歌曲 星晴 （获奖）');
INSERT INTO `j_honor` VALUES (134, '2002 中华音乐人交流协会 年度十大专辑 范特西 （获奖）');
INSERT INTO `j_honor` VALUES (135, '2002 香港IFPI 10大销量国语唱片 （获奖）');
INSERT INTO `j_honor` VALUES (136, '2002 马来西亚金曲奖 10大歌曲 爱在西元前 （获奖）');
INSERT INTO `j_honor` VALUES (137, '2002 香港TVB8 最佳作曲 开不了口 （获奖）');
INSERT INTO `j_honor` VALUES (138, '2001 第12届 台湾金曲奖 最佳流行音乐演唱专辑 Jay （获奖）');
INSERT INTO `j_honor` VALUES (139, '2001 第1届 MTV风神榜音乐奖台北流行音乐节 10大人气歌手 新加坡金曲 最佳新人 （获奖）');
INSERT INTO `j_honor` VALUES (140, '2001 第1届 全球华语歌曲排行榜 港台地区歌曲 星晴 （获奖）');
INSERT INTO `j_honor` VALUES (141, '2001 中华音乐人交流协会 年度10大歌曲 香港TVB8 年度歌曲 星晴 （获奖）');
INSERT INTO `j_honor` VALUES (142, '2001 第1届 金曲红人颁奖典礼 10大华语歌曲 黑色幽默 （获奖）');
INSERT INTO `j_honor` VALUES (143, '【电影奖项】');
INSERT INTO `j_honor` VALUES (144, '2013 第56届 亚太影展最佳原创电影音乐 天台爱情 （获奖）');
INSERT INTO `j_honor` VALUES (145, '2011 第20届 美国MTV电影奖最佳新人奖提名 青蜂侠 （提名）');
INSERT INTO `j_honor` VALUES (146, '2011 第48届台湾电影金马奖 最佳原创电影歌曲 阿爸（阿爸） （提名）');
INSERT INTO `j_honor` VALUES (147, '2010 第3届 《手机报电影爱好者》金π奖 读者最喜爱的男演员 （获奖）');
INSERT INTO `j_honor` VALUES (148, '2008 第45届 台湾电影金马奖最佳原创电影歌曲提名 周大侠 （获奖）');
INSERT INTO `j_honor` VALUES (149, '2008 第27届香港电影金像奖 最佳亚洲电影 不能说的秘密 （提名）');
INSERT INTO `j_honor` VALUES (150, '2008 第29届大众电影百花奖 最佳男配角 满城尽带黄金甲 （提名）');
INSERT INTO `j_honor` VALUES (151, '2007 第16届上海影评人奖 最佳男演员 满城尽带黄金甲 （获奖）');
INSERT INTO `j_honor` VALUES (152, '2007 第26届香港电影金像奖 最佳原创电影歌曲 菊花台（满城尽带黄金甲） （获奖）');
INSERT INTO `j_honor` VALUES (153, '2007 第26届香港电影金像奖 最佳原创电影歌曲 霍元甲（霍元甲） （提名）');
INSERT INTO `j_honor` VALUES (154, '2007 第44届 台湾电影金马奖杰出电影 不能说的秘密 （获奖）');
INSERT INTO `j_honor` VALUES (155, '2007 第44届 台湾电影金马奖最佳视觉 不能说的秘密 （获奖）');
INSERT INTO `j_honor` VALUES (156, '2006 第25届香港电影金像奖 最佳原创电影歌曲 漂移（头文字D） （提名）');
INSERT INTO `j_honor` VALUES (157, '2006 第42届台湾电影金马奖 最佳原创电影歌曲 漂移（头文字D） （提名');
INSERT INTO `j_honor` VALUES (158, '2006 第42届 台湾电影金马奖最佳新人 头文字D （获奖）');
INSERT INTO `j_honor` VALUES (159, '2006 第25届 香港电影金像奖最佳新人 头文字D （获奖）');

-- ----------------------------
-- Table structure for j_jay
-- ----------------------------
DROP TABLE IF EXISTS `j_jay`;
CREATE TABLE `j_jay`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of j_jay
-- ----------------------------
INSERT INTO `j_jay` VALUES (1, '1997年9月，周杰伦在母亲的鼓励下报名参加了台北星光电视台的娱乐节目《超级新人王》，并在节目中邀人演唱了自己创作的歌曲《梦有翅膀》。当主持人吴宗宪看到这首歌曲的曲谱后，就邀请周杰伦到阿尔发音乐公司担任音乐助理。', 1);
INSERT INTO `j_jay` VALUES (2, '1998年，咻比嘟哗餐厅驻唱。', 2);
INSERT INTO `j_jay` VALUES (3, '1999年12月，吴宗宪与周杰伦约定十天时间，如果能写出50首歌，帮他从中选出10首出唱片。周杰伦马上创作，十天时间，周杰伦拿出了五十首歌，每一首都写得漂漂亮亮，谱得工工整整。', 3);
INSERT INTO `j_jay` VALUES (4, '2000年11月，发行首张个人专辑《Jay》，并包办全部歌曲的作曲、和声编写以及监制工作。其中主打歌曲《星晴》获得第24届十大中文金曲优秀国语歌曲金奖。', 4);
INSERT INTO `j_jay` VALUES (5, '2001年 ，发行专辑《范特西》，逐步奠定周杰伦华语乐坛领军地位', 5);
INSERT INTO `j_jay` VALUES (6, '2002年，参演个人首部电视剧《星情花园》；7月，发行专辑《八度空间》，除了包办专辑中所有歌曲的作曲外，他还担任专辑的制作人；同年，获得第1届MTV日本音乐录影带大奖亚洲最杰出艺人奖、第2届全球华语歌曲排行榜最受欢迎创作歌手、第9届新加坡金曲奖亚太最受推崇男歌手等奖项。', 6);
INSERT INTO `j_jay` VALUES (7, '2002年4月，个人欧洲版EP－《双截棍（欧版EP）》在欧洲发行。', 7);
INSERT INTO `j_jay` VALUES (8, '2003年2月，成为美国《时代周刊》亚洲版的封面人物”，该杂志赞许他为“新一代的亚洲音乐天王”。周杰伦是继王菲、张惠妹之后，第3位出现在著名的《时代》杂志封面的华人歌手，也是唯一的一位华人男歌手。；7月16日，周杰伦专辑《叶惠美》中的主打歌曲《以父之名》在超过50家电台首播，并有8亿人收听，而主打歌首播的当日也被这些电台定为“周杰伦日”；7月31日，发行专辑《叶惠美》，他不仅包办了所有歌曲的作曲，还担任专辑的制作人和造型师，该专辑于次年获得第15届金曲奖最佳流行音乐演唱专辑奖、第4届全球华语歌曲排行榜颁奖典礼年度最受欢迎专辑等奖项。专辑主打歌曲《东风破》是周杰伦具有代表性的中国风作品之一，而他亦凭借这首歌曲获得第四届华语音乐传媒大奖最佳作曲人奖。', 8);
INSERT INTO `j_jay` VALUES (9, '2004年1月21日，首次登上央视春晚舞台，并演唱歌曲《龙拳》；3月，在第4届音乐风云榜中，获得台湾地区最受欢迎男歌手、年度风云大奖、年度港台及海外华人最佳制作人等奖项；8月，发行融合Hip-hop、R&B、古典音乐等曲风的专辑《七里香》，周杰伦也凭借这张专辑获得第16届世界音乐大奖中国区最畅销艺人奖，而专辑同名主打歌《七里香》则获得第27届十大中文金曲优秀流行国语歌曲奖金奖、第5届全球华语歌曲排行榜年度25大金曲等奖项；同年，根据世界最权威的国际唱片业协会(IFPI)数据，周杰伦唱片年度销量世界排名42，成为21世纪唯一进世界前50名的华人歌手。周杰伦也首次获得世界音乐大奖大中华区最畅销艺人。', 9);
INSERT INTO `j_jay` VALUES (10, '2005年1月11日，在第11届全球华语榜中榜颁奖盛典中，获得港台最佳男歌手、港台最受欢迎男歌手、港台最佳创作歌手等奖项；4月，凭借专辑《七里香》入围第16届台湾金曲奖最佳作曲人奖、最佳国语男演唱人奖、最佳流行音乐演唱专辑奖；6月23日，首次担任男主角的电影《头文字D》上映，并凭借该片获得第42届台湾电影金马奖最佳新演员奖、第25届香港电影金像奖最佳新人奖；11月，发行专辑《十一月的萧邦》，并包办了专辑中所有歌曲的作曲以及专辑的造型设计。', 10);
INSERT INTO `j_jay` VALUES (11, '2006年1月20日，发行EP《霍元甲》，主打歌《霍元甲》是李连杰主演的同名电影的主题曲；9月，发行专辑《依然范特西》，该专辑延续了周杰伦以往的音乐风格，并融合了中国风、RAP等曲风，其中与费玉清合唱的中国风歌曲《千里之外》获得第13届全球华语音乐榜中榜年度最佳歌曲奖、第29届十大中文金曲全国最受欢迎中文歌曲奖等奖项； 该专辑发行后以5.34%的销售份额位列台湾五大唱片排行榜第一位，并获得中华音乐人交流协会年度十大优良专辑、IFPI香港唱片销量大奖最高销量国语唱片等奖项；12月，发行EP《黄金甲》；12月14日，周杰伦主演的古装动作片《满城尽带黄金甲》在中国内地上映，并凭借该片获得第16届上海影评人奖最佳男演员；同年，获得世界音乐大奖中国区最畅销艺人奖。', 11);
INSERT INTO `j_jay` VALUES (12, '2007年2月，首度担任导演并自导自演爱情片《不能说的秘密》，该片上映后获得第44届台湾电影金马奖年度台湾杰出电影、第27届香港电影金像奖最佳亚洲电影提名等奖项；4月，成立杰威尔音乐有限公司；6月，凭借单曲《霍元甲》获得第18届台湾金曲奖最佳单曲制作人奖；11月2日，发行专辑《我很忙》，并在专辑中首次尝试美式乡村风格；而周杰伦也于次年凭借专辑中的中国风歌曲《青花瓷》获得第19届台湾金曲奖最佳作曲人奖以及最佳年度歌曲奖；同年，周杰伦完成“THEONE”、“无与伦比”两次世界巡回演唱会，先后在美国康州、内华达州、加拿大、日本东京、新加坡、马来西亚、泰国、香港、台湾、大陆各地区举办多场次个人演唱会。', 12);
INSERT INTO `j_jay` VALUES (13, '2008年1月10日，周杰伦自导自演的爱情文艺片《不能说的秘密》在韩国上映；2月16日，在日本武道馆连开两场演唱会，成为继邓丽君、王菲之后第三位在武道馆开唱的华人歌手；7月，凭借专辑《不能说的秘密电影原声带》获得第19届金曲奖演奏类最佳专辑制作人奖；10月15日，发行专辑《魔杰座》，该专辑融合了嘻哈、民谣等曲风，发行一星期在亚洲的销量突破100万张；11月，凭借专辑《我很忙》第四次获得世界音乐大奖中国区最畅销艺人奖，并成为首位连续三届获得该奖项的华人歌手；同年，主演爱情喜剧片《大灌篮》。并于当年，成为了继艺人王力宏、张惠妹、金城武、F4后，美国新闻网第5位CNNTalkAsia采访的对象。', 13);
INSERT INTO `j_jay` VALUES (14, '2008年5·12汶川地震，周杰伦捐款总额超过4200万人民币，全台湾艺人最多，并将个人演唱会改为赈灾演唱会，亲自弹奏《蜗牛》等励志歌曲，高喊“汶川加油！”；同年，美国《FastCompany》杂志评选“全球百大创意人”(The100MostCreativePeopleinBusiness)，他与LadyGaga、jay-z成为“唯三”入榜歌手，同时也是唯一亚洲歌手。', 14);
INSERT INTO `j_jay` VALUES (15, '2009年6月，在第20届台湾金曲奖颁奖典礼上获得年度最佳歌曲奖、年度最佳音乐录影带、年度最佳国语男歌手三个奖项；7月，周杰伦澳洲巡演，悉尼演唱会票房空降美国公告牌（Billboard）第二，力压世界R＆B天后碧昂斯，成为当年全球单场演唱会票房收入第二的好成绩，也打破了华人在澳洲开唱票房最高纪录；同年，美国CNN评选亚洲最有影响力的25位人物，周杰伦入围并被形容为 “非凡艺人”；', 15);
INSERT INTO `j_jay` VALUES (16, '2009年，周杰伦完成第三次“2007—2009世界巡回演唱会”，已先后在美国洛杉矶、拉斯维加斯、康涅狄格州、加拿大多伦多、温哥华、澳大利亚、日本东京、新加坡、马来西亚、泰国、香港、澳门、台湾、大陆各地区举办多场个人演唱会。', 16);
INSERT INTO `j_jay` VALUES (17, '2010年5月18日，发行专辑《跨时代》，并包办专辑中全部歌曲的作曲和制作；该专辑于次年获得第22届台湾金曲奖最佳国语专辑奖、中国原创音乐流行榜最优秀专辑等奖项，而周杰伦也凭借该专辑获得金曲奖最佳国语男歌手奖；6月，入选美国杂志《Fast Company》评出的“全球百大创意人物”，并且成为首位入榜的华人男歌手；8月，在一项名为“全球歌曲下载量最高歌手”（2008年年初至2010年8月10日）的调查中，周杰伦的歌曲下载量排名全球第三；12月，编号为257248的小行星被命名为“周杰伦星”，而周杰伦也创作了以这颗小行星为题材的歌曲《爱的飞行日记》；12月30日，美国古柏第奴(Cupertino)市长黄少雄，为纪念周杰伦对华人音乐的贡献， 将订本世纪第一个十年最后一天为古柏蒂奴市的“周杰伦日”；同年，执导科幻剧《熊猫人》，并为该剧创作了《熊猫人》、《爱情引力》等歌曲。', 17);
INSERT INTO `j_jay` VALUES (18, '2011年，周杰伦以《青蜂侠》进军好莱坞，美国知名电影网站“screencrave”评选出十大最值得期待的新秀演员。将以《青蜂侠》进军海外市场的周杰伦，成为西方媒体眼中的“潜力股”，不仅顺利跻身十强，还成为榜单上唯一一名亚洲演员代表。2月，周杰伦与NBA篮球巨星科比代言雪碧广告，周杰伦创作主题曲《天地一斗》与科比合拍MV，于2011年2月21日 在美国加州洛杉矶首发。歌曲的下载收入将全部捐赠给中国希望工程（已筹得超过200万善款）。4月21日，美国《时代周刊》评选了“全球年度最具影响力人物100强”，周杰伦位列第二名；5月13日，入围第22届台湾金曲奖最佳专辑制作人奖、最佳年度歌曲、最佳作曲人奖等奖项；11月11日，发行专辑《惊叹号！》；该专辑融合了重金属摇滚、嘻哈、R&B、jazz等音乐风格，并首次引入电子舞曲。', 18);
INSERT INTO `j_jay` VALUES (19, '2012年5月，位列福布斯中国名人榜第一名；9月22日，在新加坡F1赛道举办演唱会，成为首位在F1演出的华人歌手；12月28日，发行专辑《十二新作》，该专辑包括了中国风、RAP、蓝调、R&B、Jazz等曲风，主打歌曲《红尘客栈》获得第13届全球华语歌曲排行榜二十大金曲、第36届香港十大中文金曲优秀流行国语歌曲银奖等奖项；同年，周杰伦亲自前往他所捐助的湖南省汨罗市智峰乡希望小学考察善款落实情况，与孩子们互动，亲自弹奏《稻香》励志歌曲，和同学们一起打篮球。', 19);
INSERT INTO `j_jay` VALUES (20, '2013年5月17日 “魔天伦”世界巡回演唱会在上海奔驰文化中心启动。6月1日周杰伦配音《十万个冷笑话》第9、10集太乙真人；7月11日，周杰伦信主后首部自导自演的新片《天台》首映。周导所属的台北新生命小组教会Jesus Fashion舞团于7月10日 在《天台》首映会上演“天台歌武秀”，吸引媒体与民众注意。该片也受大陆名导张艺谋好评。', 20);
INSERT INTO `j_jay` VALUES (21, '2014年12月10日，发行首张个人数字音乐专辑《哎呦，不错哦》，成为首位发行数字音乐专辑的华人歌手；该专辑发行后获得第二届QQ音乐年度盛典“年度畅销数字专辑”奖，专辑中的歌曲《鞋子特大号》获得第5届全球流行音乐金榜年度二十大金曲奖。', 21);
INSERT INTO `j_jay` VALUES (22, '2015年，加盟第四季《中国好声音》担任导师。', 22);
INSERT INTO `j_jay` VALUES (23, '2016年1月6日，与派伟俊合唱《功夫熊猫3》电影全球主题曲；5月，周杰伦发行演唱会专辑《周杰伦魔天伦世界巡回演唱会》；6月1日，为电影《惊天魔盗团2》创作的主题曲《Now You See Me》发布；6月24日，发行融合古典、摇滚、嘻哈等曲风的数字专辑《周杰伦的床边故事》；同日，参演的好莱坞电影《惊天魔盗团2》在中国内地上映；同年，举行“地表最强”世界巡回演唱会；7月15日起，担任浙江卫视音乐评论节目《中国新歌声》的导师；12月23日起，由周杰伦自编自导的文艺片《不能说的秘密》而改编的同名音乐剧在北京天桥艺术中心举行全球首演，该音乐剧的作曲、作词、原著故事均由周杰伦完成。', 23);
INSERT INTO `j_jay` VALUES (24, '2017年1月6日，周杰伦监制的爱情电影《一万公里的约定》在中国内地上映；1月13日，在江苏卫视推出的科学类真人秀节目《最强大脑第四季》中担任嘉宾；6月4日，获得Hito年度最佳男歌手；随后，加盟原创专业音乐节目《中国新歌声第二季》。8月9日，其专辑《周杰伦的床边故事》获得“2017华语金曲奖”颁发的“年度最佳国语专辑”奖。', 24);

-- ----------------------------
-- Table structure for j_music
-- ----------------------------
DROP TABLE IF EXISTS `j_music`;
CREATE TABLE `j_music`  (
  `id` int(11) NOT NULL,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `src` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of j_music
-- ----------------------------
INSERT INTO `j_music` VALUES (1, '本草纲目', 'http://localhost:3000/music/本草纲目 - 周杰伦.flac', 'http://localhost:3000/music/img/依然范特西.jpg');
INSERT INTO `j_music` VALUES (2, '我是如此相信', 'http://localhost:3000/music/我是如此相信  - 周杰伦.flac', 'http://localhost:3000/music/img/我是如此相信.jpg');
INSERT INTO `j_music` VALUES (3, '给我一首歌的时间', 'http://localhost:3000/music/给我一首歌的时间 - 周杰伦.flac', 'http://localhost:3000/music/img/魔杰座.jpg');
INSERT INTO `j_music` VALUES (4, '不能说的秘密', 'http://localhost:3000/music/不能说的秘密 - 周杰伦.flac', 'http://localhost:3000/music/img/不能说的秘密.jpg');
INSERT INTO `j_music` VALUES (5, '等你下课', 'http://localhost:3000/music/等你下课(with 杨瑞代) - 周杰伦.flac', 'http://localhost:3000/music/img/等你下课.jpg');
INSERT INTO `j_music` VALUES (6, '稻香', 'http://localhost:3000/music/稻香 - 周杰伦.flac', 'http://localhost:3000/music/img/魔杰座.jpg');
INSERT INTO `j_music` VALUES (7, '烟花易冷', 'http://localhost:3000/music/烟花易冷 - 周杰伦.flac', 'http://localhost:3000/music/img/跨时代.jpg');
INSERT INTO `j_music` VALUES (8, '止战之殇', 'http://localhost:3000/music/止战之殇 - 周杰伦.flac', 'http://localhost:3000/music/img/七里香.jpg');
INSERT INTO `j_music` VALUES (9, '一路向北', 'http://localhost:3000/music/一路向北 (电影《头文字Ｄ》插曲) - 周杰伦.flac', 'http://localhost:3000/music/img/十一月的萧邦.jpg');
INSERT INTO `j_music` VALUES (10, '我不配', 'http://localhost:3000/music/我不配 - 周杰伦.flac', 'http://localhost:3000/music/img/我很忙.jpg');

-- ----------------------------
-- Table structure for j_news
-- ----------------------------
DROP TABLE IF EXISTS `j_news`;
CREATE TABLE `j_news`  (
  `id` int(255) NOT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of j_news
-- ----------------------------
INSERT INTO `j_news` VALUES (1, '魔術跟音樂都是世界的語言 請期待明天的周遊記 維也納之旅 Magic and music are mediums of universal communication. Stay tuned for tomorrow’s new episode of J-Style Trip on Netflix — Vienna! #jstyletrip #theinvincible #vienna', 'http://localhost:3000/image/newsImg/1.jpg', '2020-04-17 23:45:52');
INSERT INTO `j_news` VALUES (2, 'The King of All Games J-Style TripNew episode every week on Netflix', 'http://localhost:3000/image/newsImg/4.jpg', '2020-04-16 15:44:11');
INSERT INTO `j_news` VALUES (3, '再送一張  It’s been too long since I’ve last posted a selfie. Time for a shave? Do you think that looks like a “heart” in the background? ', 'http://localhost:3000/image/newsImg/2.jpg', '2020-04-15 18:42:31');
INSERT INTO `j_news` VALUES (4, '太久沒自拍 送給大家一張鬍子沒刮的照片', 'http://localhost:3000/image/newsImg/3.jpg', '2020-04-15 14:21:37');

-- ----------------------------
-- Table structure for j_user
-- ----------------------------
DROP TABLE IF EXISTS `j_user`;
CREATE TABLE `j_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `signature` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '个人签名',
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录密码',
  `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '手机号',
  `sign` int(32) DEFAULT NULL COMMENT '累计签到',
  `sign_time` datetime DEFAULT NULL COMMENT '签到日期',
  `register_time` datetime NOT NULL COMMENT '注册日期',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of j_user
-- ----------------------------
INSERT INTO `j_user` VALUES (1, NULL, 'tom', '6d6cd63284be4a47ba7aec4a3458939a95dcbdd5cd0438f23d7457099b4b917c', '13807798787', 0, NULL, '2020-01-03 15:12:34');
INSERT INTO `j_user` VALUES (3, NULL, 'jack', '6d6cd63284be4a47ba7aec4a3458939a95dcbdd5cd0438f23d7457099b4b917c', '13607778987', 0, NULL, '2020-01-03 15:15:33');
INSERT INTO `j_user` VALUES (4, NULL, 'kaka', '89d2d5dc1ed755b40523a68f392736b34f986a14306a631d3f8e9ba39234d060', '13604577887', 0, NULL, '2020-01-03 16:18:45');
INSERT INTO `j_user` VALUES (5, NULL, 'aaa', '36acf017ea0974457577506ef75268ac93ed6d61864ee994f438b63916ed1736', '12345678910', 6, '2020-04-13 00:00:00', '2020-02-19 10:10:40');
INSERT INTO `j_user` VALUES (6, NULL, 'aaaa', '6d6cd63284be4a47ba7aec4a3458939a95dcbdd5cd0438f23d7457099b4b917c', '12345678901', 0, NULL, '2020-02-19 10:23:03');
INSERT INTO `j_user` VALUES (7, NULL, 'asd', '36acf017ea0974457577506ef75268ac93ed6d61864ee994f438b63916ed1736', '12345678901', 0, NULL, '2020-02-20 09:42:53');
INSERT INTO `j_user` VALUES (8, NULL, 'jam', '36acf017ea0974457577506ef75268ac93ed6d61864ee994f438b63916ed1736', '12345678910', 0, NULL, '2020-03-24 13:59:20');
INSERT INTO `j_user` VALUES (9, NULL, 'qwe', '6d6cd63284be4a47ba7aec4a3458939a95dcbdd5cd0438f23d7457099b4b917c', '12345678910', 0, NULL, '2020-04-09 13:48:21');
INSERT INTO `j_user` VALUES (10, NULL, 'qwer', '36acf017ea0974457577506ef75268ac93ed6d61864ee994f438b63916ed1736', '12345678901', 0, NULL, '2020-04-09 13:52:00');
INSERT INTO `j_user` VALUES (11, '强啊霸哥', 'my', '955279769602763ebccd83d9ed5b976d0d1e6092fad03017aa8fd9c3a7c9fc45', '18278454149', 10, '2020-04-27 00:00:00', '2020-04-12 10:38:30');
INSERT INTO `j_user` VALUES (14, NULL, 'mine', '955279769602763ebccd83d9ed5b976d0d1e6092fad03017aa8fd9c3a7c9fc45', '12345678910', 0, NULL, '2020-04-16 21:16:30');
INSERT INTO `j_user` VALUES (17, NULL, 'yy', '36acf017ea0974457577506ef75268ac93ed6d61864ee994f438b63916ed1736', '12345678910', 0, NULL, '2020-04-19 16:09:24');
INSERT INTO `j_user` VALUES (18, NULL, 'cs', '36acf017ea0974457577506ef75268ac93ed6d61864ee994f438b63916ed1736', '19874563201', 0, NULL, '2020-04-20 19:48:38');
INSERT INTO `j_user` VALUES (20, '强啊霸哥', 'abc', '36acf017ea0974457577506ef75268ac93ed6d61864ee994f438b63916ed1736', '18278454149', 3, '2020-04-21 00:00:00', '2020-04-21 12:24:50');
INSERT INTO `j_user` VALUES (21, NULL, 'new', '36acf017ea0974457577506ef75268ac93ed6d61864ee994f438b63916ed1736', '18278454149', 0, NULL, '2020-04-24 14:56:43');
INSERT INTO `j_user` VALUES (22, NULL, 'news', '36acf017ea0974457577506ef75268ac93ed6d61864ee994f438b63916ed1736', '18659874598', 0, NULL, '2020-04-24 15:08:21');
INSERT INTO `j_user` VALUES (23, NULL, 'ne', '36acf017ea0974457577506ef75268ac93ed6d61864ee994f438b63916ed1736', '18974582469', 0, NULL, '2020-04-24 15:09:51');
INSERT INTO `j_user` VALUES (24, NULL, 'ke', 'dc6308375a172433c617a17895c543b68cecf400d8eaa16adc401b71f0459205', '18549635465', 0, NULL, '2020-04-27 10:49:24');
INSERT INTO `j_user` VALUES (25, 'qianming', 'ceshi', '6d6cd63284be4a47ba7aec4a3458939a95dcbdd5cd0438f23d7457099b4b917c', '18254978546', 0, NULL, '2020-04-28 10:07:23');

SET FOREIGN_KEY_CHECKS = 1;