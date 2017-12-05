-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`City`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`City` (
  `name` VARCHAR(45) NOT NULL,
  `country` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`name`),
  UNIQUE INDEX `idCountry_UNIQUE` (`name` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`Maneger`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Maneger` (
  `name` VARCHAR(45) NOT NULL,
  `age` INT(11) NULL DEFAULT NULL,
  `nationality` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`name`),
  UNIQUE INDEX `mname_UNIQUE` (`name` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`Team`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Team` (
  `id` INT(11) NOT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `maneger` VARCHAR(45) NOT NULL,
  `City_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`, `maneger`, `City_name`),
  UNIQUE INDEX `tname_UNIQUE` (`id` ASC),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC),
  INDEX `fk_Team_Maneger1_idx` (`maneger` ASC),
  INDEX `fk_Team_City1_idx` (`City_name` ASC),
  CONSTRAINT `fk_Team_City1`
    FOREIGN KEY (`City_name`)
    REFERENCES `mydb`.`City` (`name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Team_Maneger1`
    FOREIGN KEY (`maneger`)
    REFERENCES `mydb`.`Maneger` (`name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`Player`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Player` (
  `name` VARCHAR(45) NOT NULL,
  `age` INT(11) NULL DEFAULT NULL,
  `nationality` VARCHAR(45) NULL DEFAULT NULL,
  `Team_id` INT(11) NOT NULL,
  PRIMARY KEY (`name`, `Team_id`),
  UNIQUE INDEX `pname_UNIQUE` (`name` ASC),
  INDEX `fk_Player_Team1_idx` (`Team_id` ASC),
  CONSTRAINT `fk_Player_Team1`
    FOREIGN KEY (`Team_id`)
    REFERENCES `mydb`.`Team` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`Position`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Position` (
  `pos_code` VARCHAR(45) NOT NULL,
  `position` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`pos_code`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`Player_has_Position`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Player_has_Position` (
  `Player_name` VARCHAR(45) NOT NULL,
  `Position_pos_code` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Player_name`, `Position_pos_code`),
  INDEX `fk_Player_has_Position_Position1_idx` (`Position_pos_code` ASC),
  INDEX `fk_Player_has_Position_Player_idx` (`Player_name` ASC),
  CONSTRAINT `fk_Player_has_Position_Player`
    FOREIGN KEY (`Player_name`)
    REFERENCES `mydb`.`Player` (`name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Player_has_Position_Position1`
    FOREIGN KEY (`Position_pos_code`)
    REFERENCES `mydb`.`Position` (`pos_code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`title`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`title` (
  `id` INT(11) NOT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`Team_has_title`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Team_has_title` (
  `Team_id` INT(11) NOT NULL,
  `title_id` INT(11) NOT NULL,
  `num_title` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`Team_id`, `title_id`),
  INDEX `fk_Team_has_title_title1_idx` (`title_id` ASC),
  INDEX `fk_Team_has_title_Team1_idx` (`Team_id` ASC),
  CONSTRAINT `fk_Team_has_title_Team1`
    FOREIGN KEY (`Team_id`)
    REFERENCES `mydb`.`Team` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Team_has_title_title1`
    FOREIGN KEY (`title_id`)
    REFERENCES `mydb`.`title` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
