-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Client` (
  `DNI` INT NOT NULL,
  `NOM` VARCHAR(45) NULL,
  `COGNOM` VARCHAR(45) NULL,
  `ADREÇA` VARCHAR(45) NULL,
  `TELEFON` VARCHAR(45) NULL,
  `VIP` VARCHAR(45) NULL,
  PRIMARY KEY (`DNI`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Tipus_Polissa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tipus_Polissa` (
  `ID` INT NOT NULL,
  `Tipus_Polissa` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Venedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Venedor` (
  `DNI` INT NOT NULL,
  `NOM` VARCHAR(45) NULL,
  `COGNOM` VARCHAR(45) NULL,
  `TELEFON` VARCHAR(45) NULL,
  `Dir` VARCHAR(45) NULL,
  PRIMARY KEY (`DNI`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Polissa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Polissa` (
  `NUM_Polissa` INT NOT NULL,
  `DATA_Contractacio` VARCHAR(45) NULL,
  `Preu_Anual` VARCHAR(45) NULL,
  `Tipus_Pagament` VARCHAR(45) NULL,
  `Tipus_Polissa_ID` INT NOT NULL,
  `Client_DNI` INT NOT NULL,
  `Venedor_DNI` INT NOT NULL,
  PRIMARY KEY (`NUM_Polissa`),
  INDEX `fk_Polissa_Tipus_Polissa_idx` (`Tipus_Polissa_ID` ASC) VISIBLE,
  INDEX `fk_Polissa_Client1_idx` (`Client_DNI` ASC) VISIBLE,
  INDEX `fk_Polissa_Venedor1_idx` (`Venedor_DNI` ASC) VISIBLE,
  CONSTRAINT `fk_Polissa_Tipus_Polissa`
    FOREIGN KEY (`Tipus_Polissa_ID`)
    REFERENCES `mydb`.`Tipus_Polissa` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Polissa_Client1`
    FOREIGN KEY (`Client_DNI`)
    REFERENCES `mydb`.`Client` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Polissa_Venedor1`
    FOREIGN KEY (`Venedor_DNI`)
    REFERENCES `mydb`.`Venedor` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
