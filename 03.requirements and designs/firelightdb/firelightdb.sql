-- MySQL Script generated by MySQL Workbench
-- 03/10/16 11:18:38
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema firelightdb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema firelightdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `firelightdb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `firelightdb` ;

-- -----------------------------------------------------
-- Table `firelightdb`.`FL_USER`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `firelightdb`.`FL_USER` ;

CREATE TABLE IF NOT EXISTS `firelightdb`.`FL_USER` (
  `USERID` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '',
  `USERNO` VARCHAR(11) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NOT NULL COMMENT '',
  `FIRSTNAME` VARCHAR(75) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NOT NULL COMMENT '',
  `LASTNAME` VARCHAR(75) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NOT NULL COMMENT '',
  `DOB` DATE NULL COMMENT '',
  `GENDER` ENUM('MR', 'MS', 'OTHER') NULL COMMENT '',
  `PHONE` VARCHAR(20) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NOT NULL COMMENT '',
  `EMAIL` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NOT NULL COMMENT '',
  `PASSWORD` CHAR(32) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NOT NULL COMMENT '',
  `PASSWORDCFM` CHAR(32) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NOT NULL COMMENT '',
  `SECURITYNO` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NULL COMMENT '',
  `SECURITYNOCFM` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NULL COMMENT '',
  `AVATAR` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NULL COMMENT '',
  `NICKNAME` VARCHAR(75) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NULL COMMENT '',
  `PID` VARCHAR(20) NULL COMMENT '',
  `PIDON` DATE NULL COMMENT '',
  `PIDPLACE` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NULL COMMENT '',
  `ADDRESS` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NULL COMMENT '',
  `RETIREDON` DATETIME NULL COMMENT '',
  `UPDATECOUNTER` INT(11) NULL COMMENT '',
  `CREATEDBY` BIGINT(20) NOT NULL COMMENT '',
  `MODIFIEDBY` BIGINT(20) NOT NULL COMMENT '',
  `CREATEDON` DATETIME NOT NULL COMMENT '',
  `MODIFIEDON` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '',
  PRIMARY KEY (`USERID`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `firelightdb`.`FL_ROLE`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `firelightdb`.`FL_ROLE` ;

CREATE TABLE IF NOT EXISTS `firelightdb`.`FL_ROLE` (
  `ROLEID` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '',
  `ROLENAME` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NULL COMMENT '',
  `DISPORDER` SMALLINT NULL COMMENT '',
  `DISPFLAG` BIT NULL COMMENT '',
  `UPDATECOUNTER` INT(11) NULL COMMENT '',
  PRIMARY KEY (`ROLEID`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `firelightdb`.`FL_USERROLE`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `firelightdb`.`FL_USERROLE` ;

CREATE TABLE IF NOT EXISTS `firelightdb`.`FL_USERROLE` (
  `USERID` BIGINT(20) NOT NULL COMMENT '',
  `ROLEID` BIGINT(20) NOT NULL COMMENT '',
  PRIMARY KEY (`USERID`, `ROLEID`)  COMMENT '',
  INDEX `fk_FL_USER_has_FL_ROLE_FL_ROLE1_idx` (`ROLEID` ASC)  COMMENT '',
  INDEX `fk_FL_USER_has_FL_ROLE_FL_USER_idx` (`USERID` ASC)  COMMENT '',
  CONSTRAINT `fk_FL_USER_has_FL_ROLE_FL_USER`
    FOREIGN KEY (`USERID`)
    REFERENCES `firelightdb`.`FL_USER` (`USERID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FL_USER_has_FL_ROLE_FL_ROLE1`
    FOREIGN KEY (`ROLEID`)
    REFERENCES `firelightdb`.`FL_ROLE` (`ROLEID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `firelightdb`.`FL_RIGHT`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `firelightdb`.`FL_RIGHT` ;

CREATE TABLE IF NOT EXISTS `firelightdb`.`FL_RIGHT` (
  `RIGHTID` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '',
  `RIGHTNAME` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NULL COMMENT '',
  `DISPORDER` SMALLINT NULL COMMENT '',
  `DISPFLAG` BIT NULL COMMENT '',
  `UPDATECOUNTER` INT(11) NULL COMMENT '',
  PRIMARY KEY (`RIGHTID`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `firelightdb`.`FL_ROLERIGHT`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `firelightdb`.`FL_ROLERIGHT` ;

CREATE TABLE IF NOT EXISTS `firelightdb`.`FL_ROLERIGHT` (
  `ROLEID` BIGINT(20) NOT NULL COMMENT '',
  `RIGHTID` BIGINT(20) NOT NULL COMMENT '',
  PRIMARY KEY (`ROLEID`, `RIGHTID`)  COMMENT '',
  INDEX `fk_FL_ROLE_has_FL_RIGHT_FL_RIGHT1_idx` (`RIGHTID` ASC)  COMMENT '',
  INDEX `fk_FL_ROLE_has_FL_RIGHT_FL_ROLE1_idx` (`ROLEID` ASC)  COMMENT '',
  CONSTRAINT `fk_FL_ROLE_has_FL_RIGHT_FL_ROLE1`
    FOREIGN KEY (`ROLEID`)
    REFERENCES `firelightdb`.`FL_ROLE` (`ROLEID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FL_ROLE_has_FL_RIGHT_FL_RIGHT1`
    FOREIGN KEY (`RIGHTID`)
    REFERENCES `firelightdb`.`FL_RIGHT` (`RIGHTID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `firelightdb`.`FL_MENU`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `firelightdb`.`FL_MENU` ;

CREATE TABLE IF NOT EXISTS `firelightdb`.`FL_MENU` (
  `MENUID` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '',
  `MENUNAME` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NULL COMMENT '',
  `BASEMENUID` BIGINT(20) NULL DEFAULT NULL COMMENT '',
  `DISPFLAG` BIT NULL COMMENT '',
  `DISPORDER` SMALLINT NULL COMMENT '',
  `UPDATECOUNTER` INT(11) NULL COMMENT '',
  PRIMARY KEY (`MENUID`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `firelightdb`.`FL_ARTICLE`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `firelightdb`.`FL_ARTICLE` ;

CREATE TABLE IF NOT EXISTS `firelightdb`.`FL_ARTICLE` (
  `ARTICLEID` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '',
  `ARTICLENO` VARCHAR(11) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NOT NULL COMMENT '',
  `AVATAR` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NULL COMMENT '',
  `TITLE` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NULL COMMENT '',
  `DESCRIPTION` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NULL COMMENT '',
  `CONTENT` BLOB NULL COMMENT '',
  `MENUID` BIGINT(20) NOT NULL COMMENT '',
  `UPDATECOUNTER` INT(11) NULL COMMENT '',
  `CREATEDBY` BIGINT(20) NOT NULL COMMENT '',
  `MODIFIEDBY` BIGINT(20) NOT NULL COMMENT '',
  `CREATEDON` DATETIME NOT NULL COMMENT '',
  `MODIFIEDON` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '',
  PRIMARY KEY (`ARTICLEID`)  COMMENT '',
  INDEX `fk_FL_ARTICLE_FL_MENU1_idx` (`MENUID` ASC)  COMMENT '',
  CONSTRAINT `fk_FL_ARTICLE_FL_MENU1`
    FOREIGN KEY (`MENUID`)
    REFERENCES `firelightdb`.`FL_MENU` (`MENUID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `firelightdb`.`FL_ARTICLEFLOW`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `firelightdb`.`FL_ARTICLEFLOW` ;

CREATE TABLE IF NOT EXISTS `firelightdb`.`FL_ARTICLEFLOW` (
  `ARTFLOWID` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '',
  `ARTICLEID` BIGINT(20) NOT NULL COMMENT '',
  `STATUS` TINYINT NULL COMMENT 'STATUS\n0: TEMP\n1: DONE\n2: WAITING\n3: DENIED\n4: APPROVED\n5: PUBLIC\n6: DEL',
  `APPROVEDBY` BIGINT(20) NULL COMMENT '',
  `APPROVEDON` DATETIME NULL COMMENT '',
  `IMPFLG` BIT NULL COMMENT '',
  `PUBLICON` DATETIME NULL COMMENT '',
  `UPDATECOUNTER` INT(11) NULL COMMENT '',
  `CREATEDBY` BIGINT(20) NOT NULL COMMENT '',
  `CREATEDON` DATETIME NOT NULL COMMENT '',
  `MODIFIEDBY` BIGINT(20) NOT NULL COMMENT '',
  `MODIFIEDON` TIMESTAMP NOT NULL COMMENT '',
  PRIMARY KEY (`ARTFLOWID`)  COMMENT '',
  INDEX `fk_FL_ARTICLEFLOW_FL_ARTICLE1_idx` (`ARTICLEID` ASC)  COMMENT '',
  CONSTRAINT `fk_FL_ARTICLEFLOW_FL_ARTICLE1`
    FOREIGN KEY (`ARTICLEID`)
    REFERENCES `firelightdb`.`FL_ARTICLE` (`ARTICLEID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `firelightdb`.`FL_TAG`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `firelightdb`.`FL_TAG` ;

CREATE TABLE IF NOT EXISTS `firelightdb`.`FL_TAG` (
  `TAGID` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '',
  `TAGNAME` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NULL COMMENT '',
  `UPDATECOUNTER` INT(11) NULL COMMENT '',
  PRIMARY KEY (`TAGID`)  COMMENT '',
  INDEX `TAGNAME` (`TAGNAME` ASC)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `firelightdb`.`FL_ARTICLETAG`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `firelightdb`.`FL_ARTICLETAG` ;

CREATE TABLE IF NOT EXISTS `firelightdb`.`FL_ARTICLETAG` (
  `ARTICLEID` BIGINT(20) NOT NULL COMMENT '',
  `TAGID` BIGINT(20) NOT NULL COMMENT '',
  PRIMARY KEY (`ARTICLEID`, `TAGID`)  COMMENT '',
  INDEX `fk_FL_ARTICLE_has_FL_TAG_FL_TAG1_idx` (`TAGID` ASC)  COMMENT '',
  INDEX `fk_FL_ARTICLE_has_FL_TAG_FL_ARTICLE1_idx` (`ARTICLEID` ASC)  COMMENT '',
  CONSTRAINT `fk_FL_ARTICLE_has_FL_TAG_FL_ARTICLE1`
    FOREIGN KEY (`ARTICLEID`)
    REFERENCES `firelightdb`.`FL_ARTICLE` (`ARTICLEID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FL_ARTICLE_has_FL_TAG_FL_TAG1`
    FOREIGN KEY (`TAGID`)
    REFERENCES `firelightdb`.`FL_TAG` (`TAGID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `firelightdb`.`FL_COMMENT`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `firelightdb`.`FL_COMMENT` ;

CREATE TABLE IF NOT EXISTS `firelightdb`.`FL_COMMENT` (
  `COMMENTID` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '',
  `ACCOUNT` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NULL COMMENT '',
  `EMAIL` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NULL COMMENT '',
  `NAME` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NULL COMMENT '',
  `CONTENT` TEXT CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NULL COMMENT '',
  `ARTICLEID` BIGINT(20) NOT NULL COMMENT '',
  `FIRSTCOMMENTID` BIGINT(20) NULL COMMENT '',
  `DISPFLAG` BIT NULL COMMENT '',
  `UPDATECOUNTER` INT(11) NULL COMMENT '',
  `CREATEDON` DATETIME NULL COMMENT '',
  `MODIFIEDON` TIMESTAMP NULL COMMENT '',
  PRIMARY KEY (`COMMENTID`)  COMMENT '',
  INDEX `fk_FL_COMMENT_FL_ARTICLE1_idx` (`ARTICLEID` ASC)  COMMENT '',
  CONSTRAINT `fk_FL_COMMENT_FL_ARTICLE1`
    FOREIGN KEY (`ARTICLEID`)
    REFERENCES `firelightdb`.`FL_ARTICLE` (`ARTICLEID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `firelightdb`.`FL_SHARE`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `firelightdb`.`FL_SHARE` ;

CREATE TABLE IF NOT EXISTS `firelightdb`.`FL_SHARE` (
  `SHAREID` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '',
  `ACCOUNT` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NULL COMMENT '',
  `ARTICLEID` BIGINT(20) NOT NULL COMMENT '',
  `COUNTER` BIGINT NULL COMMENT '',
  `CREATEDON` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT '',
  PRIMARY KEY (`SHAREID`)  COMMENT '',
  INDEX `fk_FL_SHARE_FL_ARTICLE1_idx` (`ARTICLEID` ASC)  COMMENT '',
  CONSTRAINT `fk_FL_SHARE_FL_ARTICLE1`
    FOREIGN KEY (`ARTICLEID`)
    REFERENCES `firelightdb`.`FL_ARTICLE` (`ARTICLEID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `firelightdb`.`FL_LIKE`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `firelightdb`.`FL_LIKE` ;

CREATE TABLE IF NOT EXISTS `firelightdb`.`FL_LIKE` (
  `LIKEID` BIGINT(20) NOT NULL COMMENT '',
  `ACCOUNT` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_general_ci' NULL COMMENT '',
  `ARTICLEID` BIGINT(20) NOT NULL COMMENT '',
  `COUNTER` BIGINT NULL COMMENT '',
  `CREATEDON` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT '',
  PRIMARY KEY (`LIKEID`)  COMMENT '',
  INDEX `fk_FL_LIKE_FL_ARTICLE1_idx` (`ARTICLEID` ASC)  COMMENT '',
  CONSTRAINT `fk_FL_LIKE_FL_ARTICLE1`
    FOREIGN KEY (`ARTICLEID`)
    REFERENCES `firelightdb`.`FL_ARTICLE` (`ARTICLEID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `firelightdb` ;

-- -----------------------------------------------------
-- Placeholder table for view `firelightdb`.`V_USER_ROLE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `firelightdb`.`V_USER_ROLE` (`EMAIL` INT, `PASSWORD` INT, `ROLENAME` INT);

-- -----------------------------------------------------
-- View `firelightdb`.`V_USER_ROLE`
-- -----------------------------------------------------
DROP VIEW IF EXISTS `firelightdb`.`V_USER_ROLE` ;
DROP TABLE IF EXISTS `firelightdb`.`V_USER_ROLE`;
USE `firelightdb`;
CREATE  OR REPLACE VIEW `V_USER_ROLE` AS SELECT P1.EMAIL, P1.PASSWORD, P2.ROLENAME FROM FL_USERROLE P3 INNER JOIN FL_USER P1 ON P1.USERID = P3.USERID INNER JOIN FL_ROLE P2 ON P2.ROLEID = P3.ROLEID;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
