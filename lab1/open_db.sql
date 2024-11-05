-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema UklonDB
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `UklonDB` ;

-- -----------------------------------------------------
-- Schema UklonDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `UklonDB` DEFAULT CHARACTER SET utf8 ;
SHOW WARNINGS;
USE `UklonDB` ;

-- -----------------------------------------------------
-- Table `Ratings`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Ratings` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Ratings` (
  `idRatings` INT NOT NULL AUTO_INCREMENT,
  `rating` FLOAT NULL,
  `review` VARCHAR(45) NULL,
  `rating_date` DATE NULL,
  PRIMARY KEY (`idRatings`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Driver`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Driver` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Driver` (
  `idDriver` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `rating` FLOAT NULL,
  `phone_number` INT NOT NULL,
  `licence_number` VARCHAR(45) NOT NULL,
  `Ratings_idRatings` INT NOT NULL,
  PRIMARY KEY (`idDriver`, `Ratings_idRatings`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Car`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Car` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Car` (
  `idCars` INT NOT NULL AUTO_INCREMENT,
  `brand` VARCHAR(45) NOT NULL,
  `model` VARCHAR(45) NOT NULL,
  `plate_number` VARCHAR(45) NOT NULL,
  `seats` VARCHAR(45) NOT NULL,
  `Driver_idDriver` INT NOT NULL,
  PRIMARY KEY (`idCars`, `Driver_idDriver`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `User`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `User` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `User` (
  `idUser` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `phone_number` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idUser`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Rout`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Rout` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Rout` (
  `idRoures` INT NOT NULL AUTO_INCREMENT,
  `start_location` VARCHAR(45) NOT NULL,
  `end_location` VARCHAR(45) NOT NULL,
  `distance` FLOAT NOT NULL,
  PRIMARY KEY (`idRoures`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Payments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Payments` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Payments` (
  `idPayments` INT NOT NULL AUTO_INCREMENT,
  `amount` FLOAT NOT NULL,
  `payment_date` DATE NOT NULL,
  `payment_status` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idPayments`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Ride_Fare`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Ride_Fare` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Ride_Fare` (
  `idRide_Fare` INT NOT NULL AUTO_INCREMENT,
  `base_fare` FLOAT NOT NULL,
  `distance_fare` FLOAT NOT NULL,
  `total_fare` FLOAT NOT NULL,
  PRIMARY KEY (`idRide_Fare`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Trip`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Trip` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Trip` (
  `idTrip` INT NOT NULL AUTO_INCREMENT,
  `start_time` TIME NOT NULL,
  `end_time` TIME NOT NULL,
  `status` VARCHAR(45) NOT NULL,
  `User_idUser` INT NOT NULL,
  `Driver_idDriver` INT NOT NULL,
  `Driver_Ratings_idRatings` INT NOT NULL,
  `Rout_idRoures` INT NOT NULL,
  `Payments_idPayments` INT NOT NULL,
  `Ride_Fare_idRide_Fare` INT NOT NULL,
  PRIMARY KEY (`idTrip`, `User_idUser`, `Driver_idDriver`, `Driver_Ratings_idRatings`, `Rout_idRoures`, `Payments_idPayments`, `Ride_Fare_idRide_Fare`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Rout_has_User`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Rout_has_User` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Rout_has_User` (
  `Rout_idRoures` INT NOT NULL,
  `User_idUser` INT NOT NULL,
  PRIMARY KEY (`Rout_idRoures`, `User_idUser`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Review`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Review` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Review` (
  `idReviews` INT NOT NULL,
  `rating` FLOAT NOT NULL,
  `comment` VARCHAR(45) NOT NULL,
  `created_at` DATE NOT NULL,
  `Driver_idDriver` INT NOT NULL,
  `Driver_Ratings_idRatings` INT NOT NULL,
  PRIMARY KEY (`idReviews`, `Driver_idDriver`, `Driver_Ratings_idRatings`))
ENGINE = InnoDB;

SHOW WARNINGS;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
