-- phpMyAdmin SQL Dump
-- version 3.0.1.1
-- http://www.phpmyadmin.net
--
-- �������汾: 5.1.29
-- PHP �汾: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- --------------------------------------------------------

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `username` varchar(20) NOT NULL DEFAULT '',
  `password` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `admin` VALUES ('a', 'a'); 

CREATE TABLE IF NOT EXISTS `t_userInfo` (
  `user_name` varchar(30)  NOT NULL COMMENT 'user_name',
  `password` varchar(30)  NOT NULL COMMENT '��¼����',
  `name` varchar(20)  NOT NULL COMMENT '����',
  `gender` varchar(4)  NOT NULL COMMENT '�Ա�',
  `birthDate` varchar(20)  NULL COMMENT '��������',
  `userPhoto` varchar(60)  NOT NULL COMMENT '�û���Ƭ',
  `telephone` varchar(20)  NOT NULL COMMENT '��ϵ�绰',
  `email` varchar(50)  NOT NULL COMMENT '����',
  `address` varchar(80)  NULL COMMENT '��ͥ��ַ',
  `regTime` varchar(20)  NULL COMMENT 'ע��ʱ��',
  PRIMARY KEY (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `t_incomeType` (
  `typeId` int(11) NOT NULL AUTO_INCREMENT COMMENT '����id',
  `typeName` varchar(20)  NOT NULL COMMENT '��������',
  PRIMARY KEY (`typeId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_income` (
  `incomeId` int(11) NOT NULL AUTO_INCREMENT COMMENT '����id',
  `incomeTypeObj` int(11) NOT NULL COMMENT '��������',
  `incomeFrom` varchar(50)  NOT NULL COMMENT '������Դ',
  `payWayObj` int(11) NOT NULL COMMENT '֧����ʽ',
  `payAccount` varchar(20)  NOT NULL COMMENT '֧���˺�',
  `incomeMoney` float NOT NULL COMMENT '������',
  `incomeDate` varchar(20)  NULL COMMENT '��������',
  `userObj` varchar(30)  NOT NULL COMMENT '�����û�',
  `incomeMemo` varchar(800)  NULL COMMENT '���뱸ע',
  PRIMARY KEY (`incomeId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_expendType` (
  `expendTypeId` int(11) NOT NULL AUTO_INCREMENT COMMENT '֧������id',
  `expendTypeName` varchar(20)  NOT NULL COMMENT '֧����������',
  PRIMARY KEY (`expendTypeId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_expend` (
  `expendId` int(11) NOT NULL AUTO_INCREMENT COMMENT '֧��id',
  `exprendTypeObj` int(11) NOT NULL COMMENT '֧������',
  `expendPurpose` varchar(60)  NOT NULL COMMENT '֧����;',
  `payWayObj` int(11) NOT NULL COMMENT '֧����ʽ',
  `payAccount` varchar(20)  NOT NULL COMMENT '֧���˺�',
  `expendMoney` float NOT NULL COMMENT '֧�����',
  `expendDate` varchar(20)  NULL COMMENT '֧������',
  `userObj` varchar(30)  NOT NULL COMMENT '֧���û�',
  `expendMemo` varchar(20)  NULL COMMENT '֧����ע',
  PRIMARY KEY (`expendId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_payWay` (
  `payWayId` int(11) NOT NULL AUTO_INCREMENT COMMENT '֧����ʽid',
  `payWayName` varchar(20)  NOT NULL COMMENT '֧����ʽ����',
  PRIMARY KEY (`payWayId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `t_notice` (
  `noticeId` int(11) NOT NULL AUTO_INCREMENT COMMENT '����id',
  `title` varchar(80)  NOT NULL COMMENT '����',
  `content` varchar(5000)  NOT NULL COMMENT '��������',
  `publishDate` varchar(20)  NULL COMMENT '����ʱ��',
  PRIMARY KEY (`noticeId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

ALTER TABLE t_income ADD CONSTRAINT FOREIGN KEY (incomeTypeObj) REFERENCES t_incomeType(typeId);
ALTER TABLE t_income ADD CONSTRAINT FOREIGN KEY (payWayObj) REFERENCES t_payWay(payWayId);
ALTER TABLE t_income ADD CONSTRAINT FOREIGN KEY (userObj) REFERENCES t_userInfo(user_name);
ALTER TABLE t_expend ADD CONSTRAINT FOREIGN KEY (exprendTypeObj) REFERENCES t_expendType(expendTypeId);
ALTER TABLE t_expend ADD CONSTRAINT FOREIGN KEY (payWayObj) REFERENCES t_payWay(payWayId);
ALTER TABLE t_expend ADD CONSTRAINT FOREIGN KEY (userObj) REFERENCES t_userInfo(user_name);


