-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema MER_EX2.A
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema MER_EX2.A
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `MER_EX2.A` ;
USE `MER_EX2.A` ;

-- -----------------------------------------------------
-- Table `MER_EX2.A`.`PACIENT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER_EX2.A`.`PACIENT` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `NOM` VARCHAR(20) NOT NULL,
  `COGNOM` VARCHAR(50) NOT NULL,
  `DNI` VARCHAR(9) NULL,
  `TELEFON` INT(13) NULL,
  `ADRESA` VARCHAR(200) NULL,
  `Num_SS` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER_EX2.A`.`CONSULTA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER_EX2.A`.`CONSULTA` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `ID_PACIENT` INT NOT NULL,
  `ID_METGA` INT(100) NOT NULL,
  `DATA` DATE NULL,
  `UBICACIO` VARCHAR(100) NOT NULL,
  `EDIFICI` VARCHAR(100) NOT NULL,
  `PLANTA` VARCHAR(100) NOT NULL,
  `DIAGNOSTIC` TEXT(5000) NOT NULL,
  `METGE_Nº_COLEGIAT` INT(10) NOT NULL,
  `PACIENT_ID` INT NULL,
  `METGE_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_CONSULTA_PACIENT_idx` (`PACIENT_ID` ASC) VISIBLE,
  INDEX `fk_CONSULTA_METGE1_idx` (`METGE_ID` ASC) VISIBLE,
  CONSTRAINT `fk_CONSULTA_PACIENT`
    FOREIGN KEY (`PACIENT_ID`)
    REFERENCES `MER_EX2.A`.`PACIENT` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CONSULTA_METGE1`
    FOREIGN KEY (`METGE_ID`)
    REFERENCES `MER_EX2.A`.`METGE` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER_EX2.A`.`METGE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER_EX2.A`.`METGE` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `NOM` VARCHAR(20) NOT NULL,
  `COGNOM` VARCHAR(50) NOT NULL,
  `TELEFON` VARCHAR(13) NULL,
  `DNI` VARCHAR(9) NOT NULL,
  `ESPECIALITAT` VARCHAR(100) NOT NULL,
  `CARREC` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER_EX2.A`.`PACIENT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER_EX2.A`.`PACIENT` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `NOM` VARCHAR(20) NOT NULL,
  `COGNOM` VARCHAR(50) NOT NULL,
  `DNI` VARCHAR(9) NULL,
  `TELEFON` INT(13) NULL,
  `ADRESA` VARCHAR(200) NULL,
  `Num_SS` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER_EX2.A`.`METGE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER_EX2.A`.`METGE` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `NOM` VARCHAR(20) NOT NULL,
  `COGNOM` VARCHAR(50) NOT NULL,
  `TELEFON` VARCHAR(13) NULL,
  `DNI` VARCHAR(9) NOT NULL,
  `ESPECIALITAT` VARCHAR(100) NOT NULL,
  `CARREC` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER_EX2.A`.`CONSULTA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER_EX2.A`.`CONSULTA` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `ID_PACIENT` INT NOT NULL,
  `ID_METGA` INT(100) NOT NULL,
  `DATA` DATE NULL,
  `UBICACIO` VARCHAR(100) NOT NULL,
  `EDIFICI` VARCHAR(100) NOT NULL,
  `PLANTA` VARCHAR(100) NOT NULL,
  `DIAGNOSTIC` TEXT(5000) NOT NULL,
  `METGE_Nº_COLEGIAT` INT(10) NOT NULL,
  `PACIENT_ID` INT NULL,
  `METGE_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_CONSULTA_PACIENT_idx` (`PACIENT_ID` ASC) VISIBLE,
  INDEX `fk_CONSULTA_METGE1_idx` (`METGE_ID` ASC) VISIBLE,
  CONSTRAINT `fk_CONSULTA_PACIENT`
    FOREIGN KEY (`PACIENT_ID`)
    REFERENCES `MER_EX2.A`.`PACIENT` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CONSULTA_METGE1`
    FOREIGN KEY (`METGE_ID`)
    REFERENCES `MER_EX2.A`.`METGE` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER_EX2.A`.`Tipus de Tarifes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER_EX2.A`.`Tipus de Tarifes` (
  `DIA DE L’ESPECTADOR` INT NOT NULL,
  `FESTIU` VARCHAR(45) NULL,
  `JUBILAT` VARCHAR(45) NULL,
  `FIETS PETITS` VARCHAR(45) NULL,
  PRIMARY KEY (`DIA DE L’ESPECTADOR`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER_EX2.A`.`Tarifa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER_EX2.A`.`Tarifa` (
  `CINE` INT NOT NULL,
  `TIPUS` VARCHAR(45) NULL,
  `PREUS` VARCHAR(45) NULL,
  PRIMARY KEY (`CINE`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER_EX2.A`.`Cine`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER_EX2.A`.`Cine` (
  `NOM` INT NOT NULL,
  `ADREÇA` VARCHAR(45) NULL,
  `TELEFON` VARCHAR(45) NULL,
  `POBLACIO` VARCHAR(45) NULL,
  `NOMBRE DE SALES` VARCHAR(45) NULL,
  PRIMARY KEY (`NOM`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER_EX2.A`.`Pelicula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER_EX2.A`.`Pelicula` (
  `TITOL` INT NOT NULL,
  `CLASIFICACIO` VARCHAR(45) NULL,
  `GENERE` VARCHAR(45) NULL,
  `DIRECTOR` VARCHAR(45) NULL,
  `DURADA` VARCHAR(45) NULL,
  PRIMARY KEY (`TITOL`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER_EX2.A`.`Projecio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER_EX2.A`.`Projecio` (
  `CINE` INT NOT NULL,
  `PELICULA` VARCHAR(45) NULL,
  `DATA` VARCHAR(45) NULL,
  `HORA` VARCHAR(45) NULL,
  PRIMARY KEY (`CINE`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER_EX2.A`.`INFO_ALUMNE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER_EX2.A`.`INFO_ALUMNE` (
  `DNI` INT NOT NULL,
  `NOM` VARCHAR(45) NULL,
  `COGNOM` VARCHAR(45) NULL,
  `EMAIL` VARCHAR(45) NULL,
  `TELEFON` VARCHAR(45) NULL,
  `ADREÇA` VARCHAR(45) NULL,
  PRIMARY KEY (`DNI`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER_EX2.A`.`DEPARTAMENT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER_EX2.A`.`DEPARTAMENT` (
  `NOM` INT NOT NULL,
  `ASSIGNATURA` VARCHAR(45) NULL,
  `CREDITS` VARCHAR(45) NULL,
  `DEPARTAMENT` VARCHAR(45) NULL,
  `PROFESOR` VARCHAR(45) NULL,
  PRIMARY KEY (`NOM`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER_EX2.A`.`Matricula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER_EX2.A`.`Matricula` (
  `DATA` INT NOT NULL,
  `ALUMNE` VARCHAR(45) NULL,
  `ASSIGNATURA` VARCHAR(45) NULL,
  PRIMARY KEY (`DATA`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER_EX2.A`.`Profesor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER_EX2.A`.`Profesor` (
  `DNI` INT NOT NULL,
  `NOM` VARCHAR(45) NULL,
  `COGNOM` VARCHAR(45) NULL,
  `TITULACIO` VARCHAR(45) NULL,
  `DEPARTAMENT` VARCHAR(45) NULL,
  `ESCAPDEPARTAMENT` VARCHAR(45) NULL,
  PRIMARY KEY (`DNI`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
