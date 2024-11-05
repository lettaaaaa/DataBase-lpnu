SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema UklonDB
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS UklonDB;

CREATE SCHEMA IF NOT EXISTS UklonDB DEFAULT CHARACTER SET utf8mb3;

USE UklonDB;

-- -----------------------------------------------------
-- Table UklonDB.Ratings
-- -----------------------------------------------------
DROP TABLE IF EXISTS uklondb.ratings;

CREATE TABLE IF NOT EXISTS uklondb.ratings (
  idRatings INT NOT NULL AUTO_INCREMENT,
  rating FLOAT NULL DEFAULT NULL,
  review VARCHAR(255) NULL DEFAULT NULL,
  rating_date DATE NULL DEFAULT NULL,
  PRIMARY KEY (idRatings)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table UklonDB.Driver
-- -----------------------------------------------------
DROP TABLE IF EXISTS uklondb.driver;

CREATE TABLE IF NOT EXISTS uklondb.driver (
  idDriver INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(45) NOT NULL,
  phone_number VARCHAR(15) NOT NULL UNIQUE,
  licence_number VARCHAR(45) NOT NULL UNIQUE,
  Ratings_idRatings INT NOT NULL,
  PRIMARY KEY (idDriver),
  FOREIGN KEY (Ratings_idRatings) REFERENCES uklondb.ratings (idRatings) ON DELETE CASCADE
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table UklonDB.User
-- -----------------------------------------------------
DROP TABLE IF EXISTS UklonDB.User;

CREATE TABLE IF NOT EXISTS UklonDB.User (
  idUser INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(45) NOT NULL,
  phone_number VARCHAR(45) NOT NULL UNIQUE,
  PRIMARY KEY (idUser)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table UklonDB.Car
-- -----------------------------------------------------
DROP TABLE IF EXISTS UklonDB.Car;

CREATE TABLE IF NOT EXISTS UklonDB.Car (
  idCars INT NOT NULL AUTO_INCREMENT,
  brand VARCHAR(45) NOT NULL,
  model VARCHAR(45) NOT NULL,
  plate_number VARCHAR(45) NOT NULL UNIQUE,
  seats INT NOT NULL,
  Driver_idDriver INT NOT NULL,
  PRIMARY KEY (idCars),
  FOREIGN KEY (Driver_idDriver) REFERENCES uklondb.driver (idDriver) ON DELETE CASCADE
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table UklonDB.Rout
-- -----------------------------------------------------
DROP TABLE IF EXISTS UklonDB.Rout;

CREATE TABLE IF NOT EXISTS UklonDB.Rout (
  idRout INT NOT NULL AUTO_INCREMENT,
  start_location VARCHAR(45) NOT NULL,
  end_location VARCHAR(45) NOT NULL,
  distance FLOAT NOT NULL,
  PRIMARY KEY (idRout)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table UklonDB.Payments
-- -----------------------------------------------------
DROP TABLE IF EXISTS UklonDB.Payments;

CREATE TABLE IF NOT EXISTS UklonDB.Payments (
  idPayments INT NOT NULL AUTO_INCREMENT,
  amount FLOAT NOT NULL,
  payment_date DATE NOT NULL,
  payment_status VARCHAR(45) NOT NULL,
  PRIMARY KEY (idPayments)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table UklonDB.Ride_Fare
-- -----------------------------------------------------
DROP TABLE IF EXISTS UklonDB.Ride_Fare;

CREATE TABLE IF NOT EXISTS UklonDB.Ride_Fare (
  idRide_Fare INT NOT NULL AUTO_INCREMENT,
  base_fare FLOAT NOT NULL,
  distance_fare FLOAT NOT NULL,
  total_fare FLOAT NOT NULL,
  PRIMARY KEY (idRide_Fare)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table UklonDB.Trip
-- -----------------------------------------------------
DROP TABLE IF EXISTS UklonDB.Trip;

CREATE TABLE IF NOT EXISTS UklonDB.Trip (
  idTrip INT NOT NULL AUTO_INCREMENT,
  start_time DATETIME NOT NULL,
  end_time DATETIME NOT NULL,
  status VARCHAR(45) NOT NULL,
  User_idUser INT NOT NULL,
  Driver_idDriver INT NOT NULL,
  Rout_idRout INT NOT NULL,
  Payments_idPayments INT NOT NULL,
  Ride_Fare_idRide_Fare INT NOT NULL,
  PRIMARY KEY (idTrip),
  FOREIGN KEY (User_idUser) REFERENCES UklonDB.User (idUser) ON DELETE CASCADE,
  FOREIGN KEY (Driver_idDriver) REFERENCES UklonDB.Driver (idDriver) ON DELETE CASCADE,
  FOREIGN KEY (Rout_idRout) REFERENCES UklonDB.Rout (idRout) ON DELETE CASCADE,
  FOREIGN KEY (Payments_idPayments) REFERENCES UklonDB.Payments (idPayments) ON DELETE CASCADE,
  FOREIGN KEY (Ride_Fare_idRide_Fare) REFERENCES UklonDB.Ride_Fare (idRide_Fare) ON DELETE CASCADE
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table UklonDB.Review
-- -----------------------------------------------------
DROP TABLE IF EXISTS UklonDB.Review;

CREATE TABLE IF NOT EXISTS UklonDB.Review (
  idReviews INT NOT NULL AUTO_INCREMENT,
  rating FLOAT NOT NULL,
  comment VARCHAR(255) NOT NULL,
  created_at DATE NOT NULL,
  Driver_idDriver INT NOT NULL,
  PRIMARY KEY (idReviews),
  FOREIGN KEY (Driver_idDriver) REFERENCES UklonDB.Driver (idDriver) ON DELETE CASCADE
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table UklonDB.Rout_has_User
-- -----------------------------------------------------
DROP TABLE IF EXISTS UklonDB.Rout_has_User;

CREATE TABLE IF NOT EXISTS UklonDB.Rout_has_User (
  Rout_idRout INT NOT NULL,
  User_idUser INT NOT NULL,
  PRIMARY KEY (Rout_idRout, User_idUser),
  FOREIGN KEY (Rout_idRout) REFERENCES UklonDB.Rout (idRout) ON DELETE CASCADE,
  FOREIGN KEY (User_idUser) REFERENCES UklonDB.User (idUser) ON DELETE CASCADE
) ENGINE = InnoDB;

-- Удаляем ненужные индексы, так как уникальные ключи уже созданы для полей.
