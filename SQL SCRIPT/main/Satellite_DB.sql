-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema DB_TERM_PROJECT
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema DB_TERM_PROJECT
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `DB_TERM_PROJECT` DEFAULT CHARACTER SET utf8mb4;
USE `DB_TERM_PROJECT` ;

-- -----------------------------------------------------
-- Table `DB_TERM_PROJECT`.`company`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_TERM_PROJECT`.`company` (
  `organization_name` VARCHAR(300) NOT NULL,
  PRIMARY KEY (`organization_name`),
  UNIQUE INDEX `organization_name_UNIQUE` (`organization_name` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `DB_TERM_PROJECT`.`country`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_TERM_PROJECT`.`country` (
  `country_name` VARCHAR(20) NOT NULL,
  `population(2021)` INT NULL,
  `gdp(USD, 2021)` INT NULL,
  `education_index(2018)` FLOAT NULL DEFAULT NULL,
  `literacy_rate(2021)` DECIMAL(3,1) NULL,
  PRIMARY KEY (`country_name`),
  UNIQUE INDEX `country_name_UNIQUE` (`country_name` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `DB_TERM_PROJECT`.`launch_site`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_TERM_PROJECT`.`launch_site` (
  `launch_site_id` INT NOT NULL,
  `launch_site_name` VARCHAR(150) NOT NULL,
  `country_name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`launch_site_id`),
  UNIQUE INDEX `launch_site_id` (`launch_site_id` ASC),
  INDEX `country_name` (`country_name` ASC) ,
  UNIQUE INDEX `country_name_UNIQUE` (`country_name` ASC) ,
  UNIQUE INDEX `launch_site_name_UNIQUE` (`launch_site_name` ASC) ,
  CONSTRAINT `launch_site_ibfk_1`
    FOREIGN KEY (`country_name`)
    REFERENCES `DB_TERM_PROJECT`.`country` (`country_name`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `DB_TERM_PROJECT`.`satellite`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_TERM_PROJECT`.`satellite` (
  `cospar_no` VARCHAR(20) NOT NULL,
  `satellite_name` VARCHAR(50) NULL DEFAULT NULL,
  `alt_name` VARCHAR(250) NULL DEFAULT NULL,
  `type_of_orbit` VARCHAR(150) NULL DEFAULT NULL,
  `class_of_orbit` VARCHAR(50) NULL,
  `expected_life` DOUBLE(1,1) NULL DEFAULT NULL,
  `launch_mass` INT NULL DEFAULT NULL,
  PRIMARY KEY (`cospar_no`),
  UNIQUE INDEX `cospar_no_UNIQUE` (`cospar_no` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `DB_TERM_PROJECT`.`launch`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_TERM_PROJECT`.`launch` (
  `launch_date` DATE NOT NULL,
  `launch_vehical` VARCHAR(50) NOT NULL,
  `launch_site_id` INT NOT NULL,
  `organization_name` VARCHAR(300) NOT NULL,
  `cospar_no` VARCHAR(20) NOT NULL,
  INDEX `launch_site` (`launch_site_id` ASC) ,
  INDEX `fk_launch_company1_idx` (`organization_name` ASC),
  INDEX `fk_launch_satellite1_idx` (`cospar_no` ASC) ,
  UNIQUE INDEX `cospar_no_UNIQUE` (`cospar_no` ASC) ,
  UNIQUE INDEX `organization_name_UNIQUE` (`organization_name` ASC) ,
  UNIQUE INDEX `launch_site_id_UNIQUE` (`launch_site_id` ASC) ,
  CONSTRAINT `fk_launch_company1`
    FOREIGN KEY (`organization_name`)
    REFERENCES `DB_TERM_PROJECT`.`company` (`organization_name`),
  CONSTRAINT `launch_ibfk_1`
    FOREIGN KEY (`launch_site_id`)
    REFERENCES `DB_TERM_PROJECT`.`launch_site` (`launch_site_id`),
  CONSTRAINT `fk_launch_satellite1`
    FOREIGN KEY (`cospar_no`)
    REFERENCES `DB_TERM_PROJECT`.`satellite` (`cospar_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `DB_TERM_PROJECT`.`located_in`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_TERM_PROJECT`.`located_in` (
  `country_name` VARCHAR(20) NOT NULL,
  `organization_name` VARCHAR(300) NOT NULL,
  INDEX `country` (`country_name` ASC) ,
  INDEX `fk_located_in_company1_idx` (`organization_name` ASC) ,
  CONSTRAINT `fk_located_in_company1`
    FOREIGN KEY (`organization_name`)
    REFERENCES `DB_TERM_PROJECT`.`company` (`organization_name`),
  CONSTRAINT `located_in_ibfk_1`
    FOREIGN KEY (`country_name`)
    REFERENCES `DB_TERM_PROJECT`.`country` (`country_name`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `DB_TERM_PROJECT`.`operates`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_TERM_PROJECT`.`operates` (
  `cospar_no` VARCHAR(20) NOT NULL,
  `organization_name` VARCHAR(300) NULL,
  INDEX `satellite` (`cospar_no` ASC) ,
  INDEX `fk_operates_company1_idx` (`organization_name` ASC) ,
  CONSTRAINT `fk_operates_company1`
    FOREIGN KEY (`organization_name`)
    REFERENCES `DB_TERM_PROJECT`.`company` (`organization_name`),
  CONSTRAINT `operates_ibfk_1`
    FOREIGN KEY (`cospar_no`)
    REFERENCES `DB_TERM_PROJECT`.`satellite` (`cospar_no`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `DB_TERM_PROJECT`.`satellite_purpose`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_TERM_PROJECT`.`satellite_purpose` (
  `purpose_id` INT NOT NULL,
  `purpose` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`purpose_id`),
  UNIQUE INDEX `purpose_id_UNIQUE` (`purpose_id` ASC),
  UNIQUE INDEX `purpose_UNIQUE` (`purpose` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `DB_TERM_PROJECT`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_TERM_PROJECT`.`users` (
  `user_id` INT NOT NULL,
  `users_category` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `user_id_UNIQUE` (`user_id` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `DB_TERM_PROJECT`.`satellite_has`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_TERM_PROJECT`.`satellite_has` (
  `user_id` INT NOT NULL,
  `purpose_purpose_id` INT NOT NULL,
  `cospar_no` VARCHAR(20) NOT NULL,
  INDEX `fk_satellite_has_users1_idx` (`user_id` ASC),
  INDEX `fk_satellite_has_satellite_purpose1_idx` (`purpose_purpose_id` ASC) ,
  INDEX `fk_satellite_has_satellite1_idx` (`cospar_no` ASC) ,
  CONSTRAINT `fk_satellite_has_satellite1`
    FOREIGN KEY (`cospar_no`)
    REFERENCES `DB_TERM_PROJECT`.`satellite` (`cospar_no`),
  CONSTRAINT `fk_satellite_has_satellite_purpose1`
    FOREIGN KEY (`purpose_purpose_id`)
    REFERENCES `DB_TERM_PROJECT`.`satellite_purpose` (`purpose_id`),
  CONSTRAINT `fk_satellite_has_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `DB_TERM_PROJECT`.`users` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
