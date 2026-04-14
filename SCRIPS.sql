-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Nurse
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Nurse
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Nurse` DEFAULT CHARACTER SET utf8 ;
USE `Nurse` ;

-- -----------------------------------------------------
-- Table `Nurse`.`Roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Nurse`.`Roles` (
  `idRoles` INT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idRoles`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Nurse`.`Usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Nurse`.`Usuarios` (
  `idUsuarios` INT NOT NULL AUTO_INCREMENT,
  `nombres` VARCHAR(45) NOT NULL,
  `apellidos` VARCHAR(45) NOT NULL,
  `identificacion` VARCHAR(45) NOT NULL,
  `telefono` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  `correo` VARCHAR(45) NOT NULL,
  `clave` VARCHAR(45) NOT NULL,
  `Roles_idRoles` INT NOT NULL,
  PRIMARY KEY (`idUsuarios`),
  UNIQUE INDEX `identificacion_UNIQUE` (`identificacion` ) ,
  UNIQUE INDEX `correo_UNIQUE` (`correo` ) ,
  INDEX `fk_Usuarios_Roles1_idx` (`Roles_idRoles` ) ,
  CONSTRAINT `fk_Usuarios_Roles1`
    FOREIGN KEY (`Roles_idRoles`)
    REFERENCES `Nurse`.`Roles` (`idRoles`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Nurse`.`Enfermeras`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Nurse`.`Enfermeras` (
  `idenfermeras` INT NOT NULL AUTO_INCREMENT,
  `rethus` VARCHAR(50) NOT NULL,
  `Usuarios_idUsuarios` INT NOT NULL,
  PRIMARY KEY (`idenfermeras`),
  INDEX `fk_enfermeras_Usuarios_idx` (`Usuarios_idUsuarios` ) ,
  CONSTRAINT `fk_enfermeras_Usuarios`
    FOREIGN KEY (`Usuarios_idUsuarios`)
    REFERENCES `Nurse`.`Usuarios` (`idUsuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Nurse`.`Paciente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Nurse`.`Paciente` (
  `idPaciente` INT NOT NULL AUTO_INCREMENT,
  `fecha_nacimiento` DATE NOT NULL,
  `diagnostico` LONGTEXT NOT NULL,
  `Usuarios_idUsuarios` INT NOT NULL,
  PRIMARY KEY (`idPaciente`),
  INDEX `fk_Paciente_Usuarios1_idx` (`Usuarios_idUsuarios` ) ,
  CONSTRAINT `fk_Paciente_Usuarios1`
    FOREIGN KEY (`Usuarios_idUsuarios`)
    REFERENCES `Nurse`.`Usuarios` (`idUsuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Nurse`.`Horarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Nurse`.`Horarios` (
  `idHorarios` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATE NOT NULL,
  `hora_inicial` TIME NOT NULL,
  `hora_final` TIME NOT NULL,
  PRIMARY KEY (`idHorarios`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Nurse`.`Atencion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Nurse`.`Atencion` (
  `idAtencion` INT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(45) NOT NULL,
  `enfermeras_idenfermeras` INT NOT NULL,
  `Paciente_idPaciente` INT NOT NULL,
  `Horarios_idHorarios` INT NOT NULL,
  PRIMARY KEY (`idAtencion`),
  INDEX `fk_Atencion_enfermeras1_idx` (`enfermeras_idenfermeras` ) ,
  INDEX `fk_Atencion_Paciente1_idx` (`Paciente_idPaciente` ) ,
  INDEX `fk_Atencion_Horarios1_idx` (`Horarios_idHorarios` ) ,
  UNIQUE INDEX `enfermeras_idenfermeras_UNIQUE` (`enfermeras_idenfermeras` ) ,
  UNIQUE INDEX `Horarios_idHorarios_UNIQUE` (`Horarios_idHorarios` ) ,
  CONSTRAINT `fk_Atencion_enfermeras1`
    FOREIGN KEY (`enfermeras_idenfermeras`)
    REFERENCES `Nurse`.`Enfermeras` (`idenfermeras`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Atencion_Paciente1`
    FOREIGN KEY (`Paciente_idPaciente`)
    REFERENCES `Nurse`.`Paciente` (`idPaciente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Atencion_Horarios1`
    FOREIGN KEY (`Horarios_idHorarios`)
    REFERENCES `Nurse`.`Horarios` (`idHorarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Nurse`.`Notificacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Nurse`.`Notificacion` (
  `idNotificacion` INT NOT NULL,
  `Informacion` VARCHAR(45) NOT NULL,
  `Atencion_idAtencion` INT NOT NULL,
  PRIMARY KEY (`idNotificacion`),
  INDEX `fk_Notificacion_Atencion1_idx` (`Atencion_idAtencion` ) ,
  CONSTRAINT `fk_Notificacion_Atencion1`
    FOREIGN KEY (`Atencion_idAtencion`)
    REFERENCES `Nurse`.`Atencion` (`idAtencion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Nurse`.`Medicamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Nurse`.`Medicamento` (
  `idMedicamento` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idMedicamento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Nurse`.`Tratamiento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Nurse`.`Tratamiento` (
  `idTratamiento` INT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(45) NOT NULL,
  `Paciente_idPaciente` INT NOT NULL,
  `Medicamento_idMedicamento` INT NOT NULL,
  PRIMARY KEY (`idTratamiento`),
  INDEX `fk_Tratamiento_Paciente1_idx` (`Paciente_idPaciente` ) ,
  INDEX `fk_Tratamiento_Medicamento1_idx` (`Medicamento_idMedicamento` ) ,
  CONSTRAINT `fk_Tratamiento_Paciente1`
    FOREIGN KEY (`Paciente_idPaciente`)
    REFERENCES `Nurse`.`Paciente` (`idPaciente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tratamiento_Medicamento1`
    FOREIGN KEY (`Medicamento_idMedicamento`)
    REFERENCES `Nurse`.`Medicamento` (`idMedicamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
