-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema MER2C
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema MER2C
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `MER2C` ;
USE `MER2C` ;

-- -----------------------------------------------------
-- Table `MER2C`.`Asignatura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER2C`.`Asignatura` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(45) NOT NULL,
  `Descripcio` VARCHAR(45) NULL,
  `Criteri.de.avaluacio` VARCHAR(45) NULL,
  `obj` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER2C`.`Matricula_asignatura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER2C`.`Matricula_asignatura` (
  `ID` INT NOT NULL,
  `Nom` VARCHAR(45) NOT NULL,
  `AULA` VARCHAR(45) NULL,
  `CALENDARI` VARCHAR(45) NULL,
  `Asignatura_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Matricula_asignatura_Asignatura_idx` (`Asignatura_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Matricula_asignatura_Asignatura`
    FOREIGN KEY (`Asignatura_ID`)
    REFERENCES `MER2C`.`Asignatura` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER2C`.`Matricula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER2C`.`Matricula` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `DATA` DATETIME NULL,
  `Nivell` VARCHAR(45) NULL,
  `Crus` VARCHAR(45) NULL,
  `Grup` VARCHAR(45) NULL,
  `Matricula_asignatura_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Matricula_Matricula_asignatura1_idx` (`Matricula_asignatura_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Matricula_Matricula_asignatura1`
    FOREIGN KEY (`Matricula_asignatura_ID`)
    REFERENCES `MER2C`.`Matricula_asignatura` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER2C`.`Alumne`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER2C`.`Alumne` (
  `Expedient` INT NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(45) NOT NULL,
  `Cognom` VARCHAR(45) NOT NULL,
  `DNI` VARCHAR(9) NOT NULL,
  `Telefon` VARCHAR(13) NULL,
  `Correu` VARCHAR(45) NULL,
  `Fecha_de_Naciment` VARCHAR(45) NULL,
  `Matricula_ID` INT NOT NULL,
  PRIMARY KEY (`Expedient`),
  INDEX `fk_Alumne_Matricula1_idx` (`Matricula_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Alumne_Matricula1`
    FOREIGN KEY (`Matricula_ID`)
    REFERENCES `MER2C`.`Matricula` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER2C`.`Departament`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER2C`.`Departament` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(45) NOT NULL,
  `Cognom` VARCHAR(45) NOT NULL,
  `Ubicacio` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MER2C`.`Profesorat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MER2C`.`Profesorat` (
  `NIF` INT NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(45) NOT NULL,
  `Cognom` VARCHAR(45) NOT NULL,
  `Correu` VARCHAR(45) NULL,
  `Telefon` VARCHAR(45) NULL,
  `Asignatura_ID` INT NOT NULL,
  `Departament_ID` INT NOT NULL,
  PRIMARY KEY (`NIF`),
  INDEX `fk_Profesorat_Asignatura1_idx` (`Asignatura_ID` ASC) VISIBLE,
  INDEX `fk_Profesorat_Departament1_idx` (`Departament_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Profesorat_Asignatura1`
    FOREIGN KEY (`Asignatura_ID`)
    REFERENCES `MER2C`.`Asignatura` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Profesorat_Departament1`
    FOREIGN KEY (`Departament_ID`)
    REFERENCES `MER2C`.`Departament` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
