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
-- Table `DB_TERM_PROJECT`.`company`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_TERM_PROJECT`.`company` (
  `organization_name` VARCHAR(150) NOT NULL,
  PRIMARY KEY (`organization_name`))
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
  `organization_name` VARCHAR(150) NOT NULL,
  PRIMARY KEY (`launch_id`),
  UNIQUE INDEX `id` (`launch_id` ASC) VISIBLE,
  INDEX `launch_site` (`launch_site_id` ASC) VISIBLE,
  INDEX `fk_launch_company1_idx` (`organization_name` ASC) VISIBLE,
  CONSTRAINT `launch_ibfk_1`
    FOREIGN KEY (`launch_site_id`)
    REFERENCES `DB_TERM_PROJECT`.`launch_site` (`launch_site_id`),
  CONSTRAINT `fk_launch_company1`
    FOREIGN KEY (`organization_name`)
    REFERENCES `DB_TERM_PROJECT`.`company` (`organization_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `DB_TERM_PROJECT`.`located_in`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_TERM_PROJECT`.`located_in` (
  `country_name` VARCHAR(20) NOT NULL,
  `organization_name` VARCHAR(150) NOT NULL,
  INDEX `country` (`country_name` ASC) VISIBLE,
  INDEX `fk_located_in_company1_idx` (`organization_name` ASC) VISIBLE,
  CONSTRAINT `fk_located_in_company1`
    FOREIGN KEY (`organization_name`)
    REFERENCES `DB_TERM_PROJECT`.`company` (`organization_name`),
  CONSTRAINT `located_in_ibfk_1`
    FOREIGN KEY (`country_name`)
    REFERENCES `DB_TERM_PROJECT`.`country` (`country_name`))
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
  `expected_life` DOUBLE(1,1) NULL DEFAULT NULL,
  `launch_mass` SMALLINT NULL DEFAULT NULL,
  `class_of_orbit` VARCHAR(20) NOT NULL,
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
  `organization_name` VARCHAR(150) NOT NULL,
  INDEX `satellite` (`cospar_no` ASC) VISIBLE,
  INDEX `fk_operates_company1_idx` (`organization_name` ASC) VISIBLE,
  CONSTRAINT `operates_ibfk_1`
    FOREIGN KEY (`cospar_no`)
    REFERENCES `DB_TERM_PROJECT`.`satellite` (`cospar_no`),
  CONSTRAINT `fk_operates_company1`
    FOREIGN KEY (`organization_name`)
    REFERENCES `DB_TERM_PROJECT`.`company` (`organization_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `DB_TERM_PROJECT`.`satellite_purpose`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_TERM_PROJECT`.`satellite_purpose` (
  `purpose_id` VARCHAR(45) NOT NULL,
  `purpose` VARCHAR(150) NULL DEFAULT NULL,
  PRIMARY KEY (`purpose_id`),
  UNIQUE INDEX `purpose_id_UNIQUE` (`purpose_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `DB_TERM_PROJECT`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_TERM_PROJECT`.`users` (
  `user_id` VARCHAR(45) NOT NULL,
  `users_category` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `user_id_UNIQUE` (`user_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `DB_TERM_PROJECT`.`satellite_has`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_TERM_PROJECT`.`satellite_has` (
  `user_id` VARCHAR(45) NOT NULL,
  `purpose_purpose_id` VARCHAR(45) NOT NULL,
  `cospar_no` VARCHAR(20) NOT NULL,
  INDEX `fk_satellite_has_users1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_satellite_has_satellite_purpose1_idx` (`purpose_purpose_id` ASC) VISIBLE,
  INDEX `fk_satellite_has_satellite1_idx` (`cospar_no` ASC) VISIBLE,
  CONSTRAINT `fk_satellite_has_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `DB_TERM_PROJECT`.`users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_satellite_has_satellite_purpose1`
    FOREIGN KEY (`purpose_purpose_id`)
    REFERENCES `DB_TERM_PROJECT`.`satellite_purpose` (`purpose_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_satellite_has_satellite1`
    FOREIGN KEY (`cospar_no`)
    REFERENCES `DB_TERM_PROJECT`.`satellite` (`cospar_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

