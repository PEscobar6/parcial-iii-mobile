-- MySQL Script generated by MySQL Workbench
-- Sat Nov 26 00:57:10 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema academia_qbayes
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `academia_qbayes` ;

-- -----------------------------------------------------
-- Schema academia_qbayes
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `academia_qbayes` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `academia_qbayes` ;

-- -----------------------------------------------------
-- Table `academia_qbayes`.`roles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `academia_qbayes`.`roles` ;

CREATE TABLE IF NOT EXISTS `academia_qbayes`.`roles` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `rol` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `academia_qbayes`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `academia_qbayes`.`users` ;

CREATE TABLE IF NOT EXISTS `academia_qbayes`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_rol` INT NOT NULL,
  `code` VARCHAR(50) NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  `lastname` VARCHAR(50) NOT NULL,
  `cel_number` VARCHAR(15) NOT NULL,
  `email` VARCHAR(25) NOT NULL,
  `dni` VARCHAR(15) NOT NULL,
  `password` VARCHAR(200) NOT NULL,
  `creation_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `status` TINYINT NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  INDEX `fk_users_roles_idx` (`id_rol` ASC) VISIBLE,
  CONSTRAINT `fk_users_roles`
    FOREIGN KEY (`id_rol`)
    REFERENCES `academia_qbayes`.`roles` (`id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `academia_qbayes`.`area`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `academia_qbayes`.`area` ;

CREATE TABLE IF NOT EXISTS `academia_qbayes`.`area` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `area` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `academia_qbayes`.`course`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `academia_qbayes`.`course` ;

CREATE TABLE IF NOT EXISTS `academia_qbayes`.`course` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_area` INT NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_course_area1_idx` (`id_area` ASC) VISIBLE,
  CONSTRAINT `fk_course_area1`
    FOREIGN KEY (`id_area`)
    REFERENCES `academia_qbayes`.`area` (`id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `academia_qbayes`.`questionary`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `academia_qbayes`.`questionary` ;

CREATE TABLE IF NOT EXISTS `academia_qbayes`.`questionary` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_course` INT NOT NULL,
  `code` VARCHAR(50) NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  `creation_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `status` TINYINT NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  INDEX `fk_questionary_course1_idx` (`id_course` ASC) VISIBLE,
  CONSTRAINT `fk_questionary_course1`
    FOREIGN KEY (`id_course`)
    REFERENCES `academia_qbayes`.`course` (`id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `academia_qbayes`.`questions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `academia_qbayes`.`questions` ;

CREATE TABLE IF NOT EXISTS `academia_qbayes`.`questions` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `code` VARCHAR(50) NOT NULL,
  `type` TINYINT NOT NULL,
  `options` JSON NOT NULL,
  `description` TEXT NOT NULL,
  `images` JSON NOT NULL,
  `creation_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` TINYINT NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `academia_qbayes`.`quiz_questions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `academia_qbayes`.`quiz_questions` ;

CREATE TABLE IF NOT EXISTS `academia_qbayes`.`quiz_questions` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_questionary` INT NOT NULL,
  `id_question` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_quiz_questions_questionary1_idx` (`id_questionary` ASC) VISIBLE,
  INDEX `fk_quiz_questions_questions1_idx` (`id_question` ASC) VISIBLE,
  CONSTRAINT `fk_quiz_questions_questionary1`
    FOREIGN KEY (`id_questionary`)
    REFERENCES `academia_qbayes`.`questionary` (`id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_quiz_questions_questions1`
    FOREIGN KEY (`id_question`)
    REFERENCES `academia_qbayes`.`questions` (`id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `academia_qbayes`.`rooms`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `academia_qbayes`.`rooms` ;

CREATE TABLE IF NOT EXISTS `academia_qbayes`.`rooms` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_questionary` INT NOT NULL,
  `admin` INT NOT NULL,
  `code` VARCHAR(40) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `description` VARCHAR(45) NOT NULL,
  `image` VARCHAR(50) NOT NULL,
  `status` TINYINT NOT NULL,
  `time_limit` TIME NOT NULL,
  `open_up` TIMESTAMP NOT NULL,
  `creation_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_rooms_questionary1_idx` (`id_questionary` ASC) VISIBLE,
  INDEX `fk_rooms_users1_idx` (`admin` ASC) VISIBLE,
  CONSTRAINT `fk_rooms_questionary1`
    FOREIGN KEY (`id_questionary`)
    REFERENCES `academia_qbayes`.`questionary` (`id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_rooms_users1`
    FOREIGN KEY (`admin`)
    REFERENCES `academia_qbayes`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `academia_qbayes`.`audit_room`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `academia_qbayes`.`audit_room` ;

CREATE TABLE IF NOT EXISTS `academia_qbayes`.`audit_room` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_room` INT NOT NULL,
  `id_user` INT NOT NULL,
  `time_login` TIMESTAMP NOT NULL,
  `finish_time` TIMESTAMP NOT NULL,
  `ip` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_audit_room_rooms1_idx` (`id_room` ASC) VISIBLE,
  INDEX `fk_audit_room_users1_idx` (`id_user` ASC) VISIBLE,
  CONSTRAINT `fk_audit_room_rooms1`
    FOREIGN KEY (`id_room`)
    REFERENCES `academia_qbayes`.`rooms` (`id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_audit_room_users1`
    FOREIGN KEY (`id_user`)
    REFERENCES `academia_qbayes`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;