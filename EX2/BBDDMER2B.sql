-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema MER2B
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema MER2B
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `MER2B` ;
USE `MER2B` ;

-- -----------------------------------------------------
-- Table `MER2B`.`Tarifa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER2B`.`Tarifa` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `NOM` VARCHAR(45) NULL,
  `PREU` VARCHAR(45) NULL,
  `Descripcio` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER2B`.`Projecions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER2B`.`Projecions` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Sala` VARCHAR(45) NULL DEFAULT '',
  `Horari inici` VARCHAR(45) NULL,
  `Horari fi` VARCHAR(45) NULL,
  `CINE_NIF` INT(9) NULL,
  `Tarifa_ID` INT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Projecions_Tarifa1_idx` (`Tarifa_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Projecions_Tarifa1`
    FOREIGN KEY (`Tarifa_ID`)
    REFERENCES `MER2B`.`Tarifa` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER2B`.`Cine`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER2B`.`Cine` (
  `NIF` INT(9) NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Ubicacio` VARCHAR(45) NULL,
  `NºSales` VARCHAR(45) NULL,
  `Horari` VARCHAR(45) NULL,
  `Telefon` VARCHAR(45) NULL,
  PRIMARY KEY (`NIF`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER2B`.`pel·lícula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER2B`.`pel·lícula` (
  `ISBN` INT(20) NOT NULL,
  `NOM` VARCHAR(45) NULL,
  `DIRECTOR` VARCHAR(45) NULL,
  `Protagonista` VARCHAR(45) NULL,
  `Actor Secundari` VARCHAR(45) NULL,
  `Projecions_ID` INT NULL,
  PRIMARY KEY (`ISBN`),
  INDEX `fk_pel·lícula_Projecions1_idx` (`Projecions_ID` ASC) VISIBLE,
  CONSTRAINT `fk_pel·lícula_Projecions1`
    FOREIGN KEY (`Projecions_ID`)
    REFERENCES `MER2B`.`Projecions` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
