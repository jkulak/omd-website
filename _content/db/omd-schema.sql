SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `hhbd_omd` DEFAULT CHARACTER SET utf8 COLLATE utf8_polish_ci ;
USE `hhbd_omd`;

-- -----------------------------------------------------
-- Table `hhbd_omd`.`CATEGORIES`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hhbd_omd`.`CATEGORIES` ;

CREATE  TABLE IF NOT EXISTS `hhbd_omd`.`CATEGORIES` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(45) NOT NULL ,
  `added` DATETIME NULL ,
  `addedby` INT NULL ,
  `updated` DATETIME NULL ,
  `updatedby` INT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hhbd_omd`.`ARTICLES`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hhbd_omd`.`ARTICLES` ;

CREATE  TABLE IF NOT EXISTS `hhbd_omd`.`ARTICLES` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `title` VARCHAR(100) NULL ,
  `lead` VARCHAR(500) NULL ,
  `content` VARCHAR(10000) NULL ,
  `added` DATETIME NULL ,
  `addedby` INT NULL ,
  `updated` DATETIME NULL ,
  `updatedby` INT NULL ,
  `activate` DATETIME NULL ,
  `deactivate` DATETIME NULL ,
  `status` ENUM('enabled','disabled','test') NOT NULL DEFAULT 'disabled' ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hhbd_omd`.`CATEGORIES_has_ARTICLES`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hhbd_omd`.`CATEGORIES_has_ARTICLES` ;

CREATE  TABLE IF NOT EXISTS `hhbd_omd`.`CATEGORIES_has_ARTICLES` (
  `CATEGORIES_id` INT NOT NULL ,
  `ARTICLES_id` INT NOT NULL ,
  PRIMARY KEY (`CATEGORIES_id`, `ARTICLES_id`) ,
  INDEX `fk_CATEGORIES_has_ARTICLES_CATEGORIES` (`CATEGORIES_id` ASC) ,
  INDEX `fk_CATEGORIES_has_ARTICLES_ARTICLES` (`ARTICLES_id` ASC) ,
  CONSTRAINT `fk_CATEGORIES_has_ARTICLES_CATEGORIES`
    FOREIGN KEY (`CATEGORIES_id` )
    REFERENCES `hhbd_omd`.`CATEGORIES` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CATEGORIES_has_ARTICLES_ARTICLES`
    FOREIGN KEY (`ARTICLES_id` )
    REFERENCES `hhbd_omd`.`ARTICLES` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
