CREATE SCHEMA `projecto_sql` ;
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema projecto_sql
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema projecto_sql
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `projecto_sql` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `projecto_sql` ;

-- -----------------------------------------------------
-- Table `projecto_sql`.`actor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projecto_sql`.`actor` (
  `actor_id` INT NOT NULL,
  `complete_name` VARCHAR(45) NULL DEFAULT NULL,
  `year_update` INT NULL DEFAULT NULL,
  `Mes_update` INT NULL DEFAULT NULL,
  `Dia_update` INT NULL DEFAULT NULL,
  PRIMARY KEY (`actor_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `projecto_sql`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projecto_sql`.`category` (
  `category_id` INT NOT NULL,
  `category_name` TEXT NULL DEFAULT NULL,
  `year_update` INT NULL DEFAULT NULL,
  `Mes_update` BIGINT NULL DEFAULT NULL,
  `Dia_update` INT NULL DEFAULT NULL,
  PRIMARY KEY (`category_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `projecto_sql`.`language`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projecto_sql`.`language` (
  `language_id` INT NOT NULL,
  `language_sp` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`language_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `projecto_sql`.`film`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projecto_sql`.`film` (
  `film_id` INT NOT NULL,
  `language_id` INT NULL DEFAULT NULL,
  `title` TEXT NULL DEFAULT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `release_year` INT NULL DEFAULT NULL,
  `language_sp` TEXT NULL DEFAULT NULL,
  `rental_duration` INT NULL DEFAULT NULL,
  `rental_rate` DOUBLE NULL DEFAULT NULL,
  `replacement_cost` DOUBLE NULL DEFAULT NULL,
  `rating` TEXT NULL DEFAULT NULL,
  `special_features` TEXT NULL DEFAULT NULL,
  `year_update` INT NULL DEFAULT NULL,
  `Mes_update` BIGINT NULL DEFAULT NULL,
  `Dia_update` INT NULL DEFAULT NULL,
  PRIMARY KEY (`film_id`),
  INDEX `language_id INT_idx` (`language_id` ASC) VISIBLE,
  CONSTRAINT `language_id INT`
    FOREIGN KEY (`language_id`)
    REFERENCES `projecto_sql`.`language` (`language_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `projecto_sql`.`inventory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projecto_sql`.`inventory` (
  `inventory_id` INT NOT NULL,
  `film_id` INT NULL DEFAULT NULL,
  `store_id` INT NOT NULL,
  `year_update` INT NULL DEFAULT NULL,
  `Mes_update` INT NULL DEFAULT NULL,
  `Dia_update` INT NULL DEFAULT NULL,
  PRIMARY KEY (`inventory_id`, `store_id`),
  INDEX `film_id INT_idx` (`film_id` ASC) VISIBLE,
  CONSTRAINT `film_id INT`
    FOREIGN KEY (`film_id`)
    REFERENCES `projecto_sql`.`film` (`film_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `projecto_sql`.`old_hdd`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projecto_sql`.`old_hdd` (
  `category_id` INT NULL,
  `film_id` INT NULL DEFAULT NULL,
  `actor_id` INT NULL DEFAULT NULL,
  `complete_name` VARCHAR(45) NULL DEFAULT NULL,
  `title` TEXT NULL DEFAULT NULL,
  `release_year` INT NULL DEFAULT NULL,
  INDEX `category_id_idx` (`category_id` ASC) VISIBLE,
  INDEX `film_id INT_idx` (`film_id` ASC) VISIBLE,
  INDEX `actor_id INT_idx` (`actor_id` ASC) VISIBLE,
  CONSTRAINT `category_id INT`
    FOREIGN KEY (`category_id`)
    REFERENCES `projecto_sql`.`category` (`category_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `film_id INT`
    FOREIGN KEY (`film_id`)
    REFERENCES `projecto_sql`.`film` (`film_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `actor_id INT`
    FOREIGN KEY (`actor_id`)
    REFERENCES `projecto_sql`.`actor` (`actor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `projecto_sql`.`rental`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projecto_sql`.`rental` (
  `rental_id` INT NOT NULL,
  `inventory_id` INT NULL DEFAULT NULL,
  `customer_id` INT NOT NULL,
  `staff_id` INT NOT NULL,
  `Mes_rental` INT NULL DEFAULT NULL,
  `Dia_rental` INT NULL DEFAULT NULL,
  `Hora_rental` INT NULL DEFAULT NULL,
  `Mes_return` INT NULL DEFAULT NULL,
  `Dia_return` INT NULL DEFAULT NULL,
  `Hora_return` INT NULL DEFAULT NULL,
  `rental_new_inventory_id` INT NOT NULL,
  PRIMARY KEY (`rental_id`, `staff_id`, `customer_id`, `rental_new_inventory_id`),
  INDEX `inventory_id INT_idx` (`inventory_id` ASC) VISIBLE,
  CONSTRAINT `inventory_id INT`
    FOREIGN KEY (`inventory_id`)
    REFERENCES `projecto_sql`.`inventory` (`inventory_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

