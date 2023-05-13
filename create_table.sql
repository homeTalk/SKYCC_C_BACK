-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema dajungdb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema dajungdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `dajungdb` DEFAULT CHARACTER SET utf8 ;
USE `dajungdb` ;

-- -----------------------------------------------------
-- Table `dajungdb`.`family`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dajungdb`.`family` (
  `idfamily` INT NOT NULL,
  `family_name` VARCHAR(45) NULL,
  `invitation_code` INT NULL,
  PRIMARY KEY (`idfamily`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dajungdb`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dajungdb`.`user` (
  `iduser` INT NOT NULL,
  `user_name` VARCHAR(45) NULL,
  `family` INT NULL,
  `birthday` DATE NULL,
  PRIMARY KEY (`iduser`),
  INDEX `idFamily_idx` (`family` ASC) VISIBLE,
  CONSTRAINT `idFamily`
    FOREIGN KEY (`family`)
    REFERENCES `dajungdb`.`family` (`idfamily`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dajungdb`.`mission_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dajungdb`.`mission_type` (
  `idmission_type` INT NOT NULL,
  `category` VARCHAR(45) NULL,
  PRIMARY KEY (`idmission_type`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dajungdb`.`Anniversary`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dajungdb`.`Anniversary` (
  `idAnniversary` INT NOT NULL,
  `family` INT NULL,
  `anniversary_category` VARCHAR(45) NULL,
  `anniversary_date` DATE NULL,
  `Anniversarycol` VARCHAR(45) NULL,
  `participants` INT NULL,
  PRIMARY KEY (`idAnniversary`),
  INDEX `family_idx` (`family` ASC) VISIBLE,
  CONSTRAINT `fk_family`
    FOREIGN KEY (`family`)
    REFERENCES `dajungdb`.`family` (`idfamily`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dajungdb`.`character`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dajungdb`.`character` (
  `idcharacter` INT NOT NULL,
  `family` INT NULL,
  `state` VARCHAR(45) NULL,
  `item_wearing` INT NULL,
  PRIMARY KEY (`idcharacter`),
  INDEX `idfamily_idx` (`family` ASC) VISIBLE,
  CONSTRAINT `fk_character_family`
    FOREIGN KEY (`family`)
    REFERENCES `dajungdb`.`family` (`idfamily`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dajungdb`.`item_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dajungdb`.`item_type` (
  `iditem_type` INT NOT NULL,
  `item_name` VARCHAR(45) NULL,
  `desc` VARCHAR(45) NULL,
  PRIMARY KEY (`iditem_type`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dajungdb`.`inventory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dajungdb`.`inventory` (
  `idinventory` INT NOT NULL,
  `iditem` INT NULL,
  `family` INT NULL,
  PRIMARY KEY (`idinventory`),
  INDEX `iditem_type_idx` (`iditem` ASC) VISIBLE,
  INDEX `idfamily_idx` (`family` ASC) VISIBLE,
  CONSTRAINT `fk_iditem_type`
    FOREIGN KEY (`iditem`)
    REFERENCES `dajungdb`.`item_type` (`iditem_type`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_idfamily`
    FOREIGN KEY (`family`)
    REFERENCES `dajungdb`.`family` (`idfamily`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dajungdb`.`mission`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dajungdb`.`mission` (
  `idmission` INT NOT NULL,
  `family` INT NULL,
  `mission_date` DATE NULL,
  `mission_type` INT NULL,
  PRIMARY KEY (`idmission`),
  INDEX `idfamily_idx` (`family` ASC) VISIBLE,
  INDEX `idmission_idx` (`mission_type` ASC) VISIBLE,
  CONSTRAINT `fk1_idfamily`
    FOREIGN KEY (`family`)
    REFERENCES `dajungdb`.`family` (`idfamily`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk1_idmission`
    FOREIGN KEY (`mission_type`)
    REFERENCES `dajungdb`.`mission_type` (`idmission_type`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dajungdb`.`indiv_mission`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dajungdb`.`indiv_mission` (
  `idindiv_mission` INT NOT NULL,
  `iduser` INT NULL,
  `idmission` INT NULL,
  `time` TIME NULL,
  `finish` TINYINT(1) NULL,
  PRIMARY KEY (`idindiv_mission`),
  INDEX `iduser_idx` (`iduser` ASC) VISIBLE,
  INDEX `idmission_idx` (`idmission` ASC) VISIBLE,
  CONSTRAINT `iduser`
    FOREIGN KEY (`iduser`)
    REFERENCES `dajungdb`.`user` (`iduser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idmission`
    FOREIGN KEY (`idmission`)
    REFERENCES `dajungdb`.`mission` (`idmission`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dajungdb`.`mission_question`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dajungdb`.`mission_question` (
  `idmission_question` INT NOT NULL,
  `desc` VARCHAR(100) NULL,
  `mission_type` INT NULL,
  PRIMARY KEY (`idmission_question`),
  INDEX `mission_type_idx` (`mission_type` ASC) VISIBLE,
  CONSTRAINT `mission_type`
    FOREIGN KEY (`mission_type`)
    REFERENCES `dajungdb`.`mission_type` (`idmission_type`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dajungdb`.`mission_answer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dajungdb`.`mission_answer` (
  `idmission_answer` INT NOT NULL,
  `idmission` INT NULL,
  `answer1` VARCHAR(45) NULL,
  `answer2` VARCHAR(45) NULL,
  PRIMARY KEY (`idmission_answer`),
  INDEX `idindiv_mission_idx` (`idmission` ASC) VISIBLE,
  CONSTRAINT `idindiv_mission`
    FOREIGN KEY (`idmission`)
    REFERENCES `dajungdb`.`indiv_mission` (`idindiv_mission`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
