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
CREATE SCHEMA IF NOT EXISTS `DB_TERM_PROJECT` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `DB_TERM_PROJECT` ;

-- -----------------------------------------------------
-- Table `DB_TERM_PROJECT`.`launch_contractor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_TERM_PROJECT`.`launch_contractor` (
  `launch_contractor_id` INT NOT NULL AUTO_INCREMENT,
  `contractor_name` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`launch_contractor_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `DB_TERM_PROJECT`.`operator`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_TERM_PROJECT`.`operator` (
  `operator_id` INT NOT NULL AUTO_INCREMENT,
  `operator_name` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`operator_id`),
  UNIQUE INDEX `operator_id` (`operator_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `DB_TERM_PROJECT`.`company`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_TERM_PROJECT`.`company` (
  `organization_id` INT NOT NULL AUTO_INCREMENT,
  `organization_name` VARCHAR(20) NOT NULL,
  `launch_contractor_id` INT NOT NULL,
  `operator_id` INT NOT NULL,
  PRIMARY KEY (`organization_id`),
  INDEX `launch_contractor` (`launch_contractor_id` ASC) VISIBLE,
  INDEX `operator_name` (`operator_id` ASC) VISIBLE,
  CONSTRAINT `company_ibfk_1`
    FOREIGN KEY (`launch_contractor_id`)
    REFERENCES `DB_TERM_PROJECT`.`launch_contractor` (`launch_contractor_id`),
  CONSTRAINT `company_ibfk_2`
    FOREIGN KEY (`operator_id`)
    REFERENCES `DB_TERM_PROJECT`.`operator` (`operator_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `DB_TERM_PROJECT`.`country`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_TERM_PROJECT`.`country` (
  `country_name` VARCHAR(20) NOT NULL,
  `population` INT NOT NULL,
  `gdp` DOUBLE(1,1) NOT NULL,
  `education_ratio` FLOAT NULL DEFAULT NULL,
  PRIMARY KEY (`country_name`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `DB_TERM_PROJECT`.`launch_site`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_TERM_PROJECT`.`launch_site` (
  `launch_site_id` INT NOT NULL AUTO_INCREMENT,
  `launch_site_name` VARCHAR(20) NULL DEFAULT NULL,
  `country_name` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`launch_site_id`),
  UNIQUE INDEX `launch_site_id` (`launch_site_id` ASC) VISIBLE,
  INDEX `country_name` (`country_name` ASC) VISIBLE,
  CONSTRAINT `launch_site_ibfk_1`
    FOREIGN KEY (`country_name`)
    REFERENCES `DB_TERM_PROJECT`.`country` (`country_name`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `DB_TERM_PROJECT`.`launch`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_TERM_PROJECT`.`launch` (
  `launch_id` INT NOT NULL AUTO_INCREMENT,
  `launch_date` DATE NOT NULL,
  `launch_vehical` VARCHAR(20) NOT NULL,
  `launch_site_id` INT NOT NULL,
  `launch_contractor_id` INT NOT NULL,
  PRIMARY KEY (`launch_id`),
  UNIQUE INDEX `id` (`launch_id` ASC) VISIBLE,
  INDEX `launch_site` (`launch_site_id` ASC) VISIBLE,
  INDEX `launch_contractor` (`launch_contractor_id` ASC) VISIBLE,
  CONSTRAINT `launch_ibfk_1`
    FOREIGN KEY (`launch_site_id`)
    REFERENCES `DB_TERM_PROJECT`.`launch_site` (`launch_site_id`),
  CONSTRAINT `launch_ibfk_2`
    FOREIGN KEY (`launch_contractor_id`)
    REFERENCES `DB_TERM_PROJECT`.`launch_contractor` (`launch_contractor_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `DB_TERM_PROJECT`.`located_in`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_TERM_PROJECT`.`located_in` (
  `country_name` VARCHAR(20) NOT NULL,
  `organization_id` INT NOT NULL,
  INDEX `country` (`country_name` ASC) VISIBLE,
  INDEX `fk_located_in_company1_idx` (`organization_id` ASC) VISIBLE,
  CONSTRAINT `located_in_ibfk_1`
    FOREIGN KEY (`country_name`)
    REFERENCES `DB_TERM_PROJECT`.`country` (`country_name`),
  CONSTRAINT `fk_located_in_company1`
    FOREIGN KEY (`organization_id`)
    REFERENCES `DB_TERM_PROJECT`.`company` (`organization_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `DB_TERM_PROJECT`.`satellite`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_TERM_PROJECT`.`satellite` (
  `cospar_no` VARCHAR(20) NOT NULL,
  `satellite_name` VARCHAR(20) NULL DEFAULT NULL,
  `alt_name` VARCHAR(50) NULL DEFAULT NULL,
  `type_of_orbit` VARCHAR(20) NULL DEFAULT NULL,
  `class_of_orbit` VARCHAR(20) NOT NULL,
  `expected_life` DOUBLE(1,1) NULL DEFAULT NULL,
  `launch_mass` SMALLINT NULL DEFAULT NULL,
  `launch_id` INT NOT NULL,
  PRIMARY KEY (`cospar_no`),
  INDEX `launch_id` (`launch_id` ASC) VISIBLE,
  CONSTRAINT `satellite_ibfk_1`
    FOREIGN KEY (`launch_id`)
    REFERENCES `DB_TERM_PROJECT`.`launch` (`launch_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `DB_TERM_PROJECT`.`operates`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_TERM_PROJECT`.`operates` (
  `cospar_no` VARCHAR(20) NOT NULL,
  `operator_id` INT NOT NULL,
  INDEX `satellite` (`cospar_no` ASC) VISIBLE,
  INDEX `fk_operates_operator1_idx` (`operator_id` ASC) VISIBLE,
  CONSTRAINT `operates_ibfk_1`
    FOREIGN KEY (`cospar_no`)
    REFERENCES `DB_TERM_PROJECT`.`satellite` (`cospar_no`),
  CONSTRAINT `fk_operates_operator1`
    FOREIGN KEY (`operator_id`)
    REFERENCES `DB_TERM_PROJECT`.`operator` (`operator_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `DB_TERM_PROJECT`.`satellite_purpose`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_TERM_PROJECT`.`satellite_purpose` (
  `purpose` VARCHAR(150) NULL DEFAULT NULL,
  `cospar_no` VARCHAR(20) NOT NULL,
  INDEX `satellite_id` (`cospar_no` ASC) VISIBLE,
  CONSTRAINT `satellite_purpose_ibfk_1`
    FOREIGN KEY (`cospar_no`)
    REFERENCES `DB_TERM_PROJECT`.`satellite` (`cospar_no`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `DB_TERM_PROJECT`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_TERM_PROJECT`.`users` (
  `users_category` VARCHAR(20) NULL DEFAULT NULL,
  `cospar_no` VARCHAR(20) NOT NULL,
  INDEX `satellite_id` (`cospar_no` ASC) VISIBLE,
  CONSTRAINT `users_ibfk_1`
    FOREIGN KEY (`cospar_no`)
    REFERENCES `DB_TERM_PROJECT`.`satellite` (`cospar_no`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
