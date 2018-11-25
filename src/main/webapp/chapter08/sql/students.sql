/*
 Navicat MySQL Data Transfer

 Source Server         : root_mysql
 Source Server Type    : MySQL
 Source Server Version : 80011
 Source Host           : localhost:3306
 Source Schema         : students

 Target Server Type    : MySQL
 Target Server Version : 80011
 File Encoding         : 65001

 Date: 25/11/2018 13:35:00
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for stu
-- ----------------------------
DROP TABLE IF EXISTS `stu`;
CREATE TABLE `stu`  (
  `stu_sno` varchar(6) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL DEFAULT '',
  `stu_name` varchar(6) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  `stu_tel` varchar(11) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  PRIMARY KEY (`stu_sno`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = gbk COLLATE = gbk_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stu
-- ----------------------------
INSERT INTO `stu` VALUES ('1002', '陆洋', '3333343');
INSERT INTO `stu` VALUES ('1003', '欧阳一', '23432434');
INSERT INTO `stu` VALUES ('1004', '孙利', '88888888');
INSERT INTO `stu` VALUES ('1005', '沃尔沃', '23432443');
INSERT INTO `stu` VALUES ('1006', '刘芳', '34343433');
INSERT INTO `stu` VALUES ('1007', '瓦房店', '34343434');
INSERT INTO `stu` VALUES ('1008', '温热额', '34343434');
INSERT INTO `stu` VALUES ('1009', '绽放的', '23432433');
INSERT INTO `stu` VALUES ('1010', '离散的', '34343434');
INSERT INTO `stu` VALUES ('1011', '发光飞', '23232323');
INSERT INTO `stu` VALUES ('1012', '熟练度', '77777777');
INSERT INTO `stu` VALUES ('1013', '马红红', '1111222');
INSERT INTO `stu` VALUES ('1015', '欧阳美', '2345');
INSERT INTO `stu` VALUES ('1016', '李飞', '2345');

-- ----------------------------
-- Procedure structure for adds
-- ----------------------------
DROP PROCEDURE IF EXISTS `adds`;
delimiter ;;
CREATE PROCEDURE `adds`(IN `sno` varchar(6),IN `sname` varchar(6),IN `tel` varchar(11),OUT `result` varchar(10))
BEGIN
insert into stu(stu_sno,stu_name,stu_tel) values(sno,sname,tel);
if ROW_COUNT()>0 THEN
set result='添加成功！';
ELSE
set result='添加失败';
end if;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for adds2
-- ----------------------------
DROP PROCEDURE IF EXISTS `adds2`;
delimiter ;;
CREATE PROCEDURE `adds2`(IN `sno` varchar(6),IN `sname` varchar(6),IN `tel` varchar(10),OUT `result` varchar(11))
BEGIN
	# if语句跟有then，有end if，而且，分号不能忘记
	insert into stu values(sno,sname,tel);
	IF(ROW_COUNT() > 0)then
	set result='添加成功';
	ELSE
	set result='添加失败';
	END IF;
	
	

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for delete_sno_
-- ----------------------------
DROP PROCEDURE IF EXISTS `delete_sno_`;
delimiter ;;
CREATE PROCEDURE `delete_sno_`(IN sno varchar(6), OUT result varchar(10))
BEGIn
delete from stu where stu_sno=sno;
if(row_count()>0) then
set result='success';
else 
set result='failure';
end if;
end
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
