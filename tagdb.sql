-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema tagdb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema tagdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `tagdb` DEFAULT CHARACTER SET utf8 ;
USE `tagdb` ;

-- -----------------------------------------------------
-- Table `tagdb`.`Series`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tagdb`.`Series` (
  `id` INT NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tagdb`.`Character`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tagdb`.`Character` (
  `id` INT NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `Series_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Character_Series_idx` (`Series_id` ASC),
  CONSTRAINT `fk_Character_Series`
    FOREIGN KEY (`Series_id`)
    REFERENCES `tagdb`.`Series` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tagdb`.`URL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tagdb`.`URL` (
  `id` INT NOT NULL,
  `link` VARCHAR(250) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tagdb`.`URL_has_Character`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tagdb`.`URL_has_Character` (
  `URL_id` INT NOT NULL,
  `Character_id` INT NOT NULL,
  PRIMARY KEY (`URL_id`, `Character_id`),
  INDEX `fk_URL_has_Character_Character1_idx` (`Character_id` ASC),
  INDEX `fk_URL_has_Character_URL1_idx` (`URL_id` ASC),
  CONSTRAINT `fk_URL_has_Character_URL1`
    FOREIGN KEY (`URL_id`)
    REFERENCES `tagdb`.`URL` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_URL_has_Character_Character1`
    FOREIGN KEY (`Character_id`)
    REFERENCES `tagdb`.`Character` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tagdb`.`Log`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tagdb`.`Log` (
  `id` INT NOT NULL,
  `date` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
