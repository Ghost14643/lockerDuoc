SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema lockersBD
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `lockersBD` ;

-- -----------------------------------------------------
-- Schema lockersBD
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `lockersBD` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `lockersBD` ;

-- -----------------------------------------------------
-- Table `lockersBD`.`tipo_carrera`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lockersBD`.`tipo_carrera` ;

CREATE TABLE IF NOT EXISTS `lockersBD`.`tipo_carrera` (
  `idTipoCarrera` INT NOT NULL AUTO_INCREMENT,
  `descTipoCarrera` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`idTipoCarrera`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

INSERT INTO `lockersBD`.`tipo_carrera` (`idTipoCarrera`, `descTipoCarrera`) VALUES (DEFAULT, 'Técnico');
INSERT INTO `lockersBD`.`tipo_carrera` (`idTipoCarrera`, `descTipoCarrera`) VALUES (DEFAULT, 'Profesional');

-- -----------------------------------------------------
-- Table `lockersBD`.`escuela`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lockersBD`.`escuela` ;

CREATE TABLE IF NOT EXISTS `lockersBD`.`escuela` (
  `idEscuela` INT NOT NULL AUTO_INCREMENT,
  `nombreEscuela` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEscuela`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

INSERT INTO `lockersBD`.`escuela` (`idEscuela`, `nombreEscuela`) VALUES (DEFAULT, 'Administración y Negocios');
INSERT INTO `lockersBD`.`escuela` (`idEscuela`, `nombreEscuela`) VALUES (DEFAULT, 'Comunicación');
INSERT INTO `lockersBD`.`escuela` (`idEscuela`, `nombreEscuela`) VALUES (DEFAULT, 'Construcción');
INSERT INTO `lockersBD`.`escuela` (`idEscuela`, `nombreEscuela`) VALUES (DEFAULT, 'Diseño');
INSERT INTO `lockersBD`.`escuela` (`idEscuela`, `nombreEscuela`) VALUES (DEFAULT, 'Gastronomía');
INSERT INTO `lockersBD`.`escuela` (`idEscuela`, `nombreEscuela`) VALUES (DEFAULT, 'Informática y Telecomunicaciones');
INSERT INTO `lockersBD`.`escuela` (`idEscuela`, `nombreEscuela`) VALUES (DEFAULT, 'Ingeniería y Recursos Naturales');
INSERT INTO `lockersBD`.`escuela` (`idEscuela`, `nombreEscuela`) VALUES (DEFAULT, 'Salud');
INSERT INTO `lockersBD`.`escuela` (`idEscuela`, `nombreEscuela`) VALUES (DEFAULT, 'Turismo y Hospitalidad');

-- -----------------------------------------------------
-- Table `lockersBD`.`carrera`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lockersBD`.`carrera` ;

CREATE TABLE IF NOT EXISTS `lockersBD`.`carrera` (
  `idCarrera` INT NOT NULL AUTO_INCREMENT,
  `nombreCarrera` VARCHAR(100) NOT NULL,
  `tipo_carrera_idTipoCarrera` INT NOT NULL,
  `escuela_idEscuela` INT NOT NULL,
  PRIMARY KEY (`idCarrera`, `tipo_carrera_idTipoCarrera`, `escuela_idEscuela`),
  INDEX `fk_carrera_tipo_carrera_idx` (`tipo_carrera_idTipoCarrera` ASC) VISIBLE,
  INDEX `fk_carrera_escuela1_idx` (`escuela_idEscuela` ASC) VISIBLE,
  CONSTRAINT `fk_carrera_tipo_carrera`
    FOREIGN KEY (`tipo_carrera_idTipoCarrera`)
    REFERENCES `lockersBD`.`tipo_carrera` (`idTipoCarrera`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_carrera_escuela1`
    FOREIGN KEY (`escuela_idEscuela`)
    REFERENCES `lockersBD`.`escuela` (`idEscuela`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

INSERT INTO `lockersBD`.`carrera` VALUES (DEFAULT, 'Administración de Empresas', '1', '1');
INSERT INTO `lockersBD`.`carrera` VALUES (DEFAULT, 'Analista Programador', '1', '6');
INSERT INTO `lockersBD`.`carrera` VALUES (DEFAULT, 'Analista Programador Computacional', '1', '6');
INSERT INTO `lockersBD`.`carrera` VALUES (DEFAULT, 'Técnico en Comercio Exterior', '1', '1');
INSERT INTO `lockersBD`.`carrera` VALUES (DEFAULT, 'Contabilidad General Mención Legislación Tributaria', '1', '1');
INSERT INTO `lockersBD`.`carrera` VALUES (DEFAULT, 'Contabilidad Tributaria', '1', '1');
INSERT INTO `lockersBD`.`carrera` VALUES (DEFAULT, 'Técnico en Control y Monitoreo Remoto de Procesos Mineros', '1', '7');
INSERT INTO `lockersBD`.`carrera` VALUES (DEFAULT, 'Desarrollo de Aplicaciones', '1', '6');
INSERT INTO `lockersBD`.`carrera` VALUES (DEFAULT, 'Desarrollo y Diseño Web', '1', '4');
INSERT INTO `lockersBD`.`carrera` VALUES (DEFAULT, 'Dibujo y Modelamiento Arquitectónico y Estructural', '1', '3');
INSERT INTO `lockersBD`.`carrera` VALUES (DEFAULT, 'Gastronomía', '1', '5');
INSERT INTO `lockersBD`.`carrera` VALUES (DEFAULT, 'Ilustración', '1', '4');
INSERT INTO `lockersBD`.`carrera` VALUES (DEFAULT, 'Preparador Físico', '1', '8');
INSERT INTO `lockersBD`.`carrera` VALUES (DEFAULT, 'Restauración de Bienes Patrimoniales', '1', '3');
INSERT INTO `lockersBD`.`carrera` VALUES (DEFAULT, 'Técnico en Administración', '1', '1');
INSERT INTO `lockersBD`.`carrera` VALUES (DEFAULT, 'Técnico Agrícola', '1', '7');
INSERT INTO `lockersBD`.`carrera` VALUES (DEFAULT, 'Técnico Audiovisual', '1', '1');
INSERT INTO `lockersBD`.`carrera` VALUES (DEFAULT, 'Técnico en Calidad de Alimentos', '1', '7');
INSERT INTO `lockersBD`.`carrera` VALUES (DEFAULT, 'Técnico en Construcción', '1', '3');
INSERT INTO `lockersBD`.`carrera` VALUES (DEFAULT, 'Técnico en Electricidad y Automatización Industrial', '1', '7');
INSERT INTO `lockersBD`.`carrera` VALUES (DEFAULT, 'Técnico en Mecánica Automotriz y Autotrónica', '1', '7');
INSERT INTO `lockersBD`.`carrera` VALUES (DEFAULT, 'Técnico en Operación y Supervisión de Procesos Mineros', '1', '7');
INSERT INTO `lockersBD`.`carrera` VALUES (DEFAULT, 'Técnico en Prevención de Riesgos Laborales', '1', '3');
INSERT INTO `lockersBD`.`carrera` VALUES (DEFAULT, 'Técnico en Turismo y Hospitalidad', '1', '9');
INSERT INTO `lockersBD`.`carrera` VALUES (DEFAULT, 'Ingenieria en Informatica', '2', '6');

-- -----------------------------------------------------
-- Table `lockersBD`.`code_offline`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lockersBD`.`code_offline` ;

CREATE TABLE IF NOT EXISTS `lockersBD`.`code_offline` (
  `idCodeOffline` INT NOT NULL AUTO_INCREMENT,
  `contraseñaOffline` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idCodeOffline`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

INSERT INTO `lockersBD`.`code_offline` (`idCodeOffline`, `contraseñaOffline`) VALUES (DEFAULT, 'K1fCxu95KUE9LBfE2pG0ZMR3GKVacjcUnpCANE4XnnwdAMsfJzC4YfdWuYqYo6c891rlaV5B9eISvo5Nqs1ZCstOxc5jifEch4sd');
INSERT INTO `lockersBD`.`code_offline` (`idCodeOffline`, `contraseñaOffline`) VALUES (DEFAULT, 'cR2BpSlqaAiJAXw6X4JFnWuupHY6INaTF4xKwbvC5XxSmoeWIGQn0uGMsqLOK9oVYoAJMKFlZOwpTWTntZho25uDdBpX6VE6Ymot');

-- -----------------------------------------------------
-- Table `lockersBD`.`edificio_instituto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lockersBD`.`edificio_instituto` ;

CREATE TABLE IF NOT EXISTS `lockersBD`.`edificio_instituto` (
  `idEdificioInstituto` INT NOT NULL AUTO_INCREMENT,
  `letraEdificio` VARCHAR(1) NOT NULL,
  PRIMARY KEY (`idEdificioInstituto`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

INSERT INTO `lockersBD`.`edificio_instituto` (`idEdificioInstituto`, `letraEdificio`) VALUES (DEFAULT, 'Y');
INSERT INTO `lockersBD`.`edificio_instituto` (`idEdificioInstituto`, `letraEdificio`) VALUES (DEFAULT, 'W');
INSERT INTO `lockersBD`.`edificio_instituto` (`idEdificioInstituto`, `letraEdificio`) VALUES (DEFAULT, 'Z');

-- -----------------------------------------------------
-- Table `lockersBD`.`estado_locker`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lockersBD`.`estado_locker` ;

CREATE TABLE IF NOT EXISTS `lockersBD`.`estado_locker` (
  `idEstadoLocker` INT NOT NULL AUTO_INCREMENT,
  `nombreEstadoLocker` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idEstadoLocker`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

INSERT INTO `lockersBD`.`estado_locker` (`idEstadoLocker`, `nombreEstadoLocker`) VALUES (DEFAULT, 'Disponible');
INSERT INTO `lockersBD`.`estado_locker` (`idEstadoLocker`, `nombreEstadoLocker`) VALUES (DEFAULT, 'Ocupado');
INSERT INTO `lockersBD`.`estado_locker` (`idEstadoLocker`, `nombreEstadoLocker`) VALUES (DEFAULT, 'Con Problema');

-- -----------------------------------------------------
-- Table `lockersBD`.`jornada`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lockersBD`.`jornada` ;

CREATE TABLE IF NOT EXISTS `lockersBD`.`jornada` (
  `idJornada` INT NOT NULL AUTO_INCREMENT,
  `nombreJornada` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idJornada`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

INSERT INTO `lockersBD`.`jornada` (`idJornada`, `nombreJornada`) VALUES (DEFAULT, 'Diurno');
INSERT INTO `lockersBD`.`jornada` (`idJornada`, `nombreJornada`) VALUES (DEFAULT, 'Vespertino');
INSERT INTO `lockersBD`.`jornada` (`idJornada`, `nombreJornada`) VALUES (DEFAULT, 'Híbrido');

-- -----------------------------------------------------
-- Table `lockersBD`.`piso_edificio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lockersBD`.`piso_edificio` ;

CREATE TABLE IF NOT EXISTS `lockersBD`.`piso_edificio` (
  `idPiso` INT NOT NULL AUTO_INCREMENT,
  `pisoCol` INT NOT NULL,
  `edificio_instituto_idEdificioInstituto` INT NOT NULL,
  PRIMARY KEY (`idPiso`, `edificio_instituto_idEdificioInstituto`),
  INDEX `fk_piso_edificio_edificio_instituto1_idx` (`edificio_instituto_idEdificioInstituto` ASC) VISIBLE,
  CONSTRAINT `fk_piso_edificio_edificio_instituto1`
    FOREIGN KEY (`edificio_instituto_idEdificioInstituto`)
    REFERENCES `lockersBD`.`edificio_instituto` (`idEdificioInstituto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

INSERT INTO `lockersBD`.`piso_edificio` (`idPiso`, `pisoCol`, `edificio_instituto_idEdificioInstituto`) VALUES (DEFAULT, 1, 1);
INSERT INTO `lockersBD`.`piso_edificio` (`idPiso`, `pisoCol`, `edificio_instituto_idEdificioInstituto`) VALUES (DEFAULT, '2', '1');
INSERT INTO `lockersBD`.`piso_edificio` (`idPiso`, `pisoCol`, `edificio_instituto_idEdificioInstituto`) VALUES (DEFAULT, '3', '1');
INSERT INTO `lockersBD`.`piso_edificio` (`idPiso`, `pisoCol`, `edificio_instituto_idEdificioInstituto`) VALUES (DEFAULT, '4', '1');
INSERT INTO `lockersBD`.`piso_edificio` (`idPiso`, `pisoCol`, `edificio_instituto_idEdificioInstituto`) VALUES (DEFAULT, '5', '1');
INSERT INTO `lockersBD`.`piso_edificio` (`idPiso`, `pisoCol`, `edificio_instituto_idEdificioInstituto`) VALUES (DEFAULT, '2', '2');
INSERT INTO `lockersBD`.`piso_edificio` (`idPiso`, `pisoCol`, `edificio_instituto_idEdificioInstituto`) VALUES (DEFAULT, '3', '2');
INSERT INTO `lockersBD`.`piso_edificio` (`idPiso`, `pisoCol`, `edificio_instituto_idEdificioInstituto`) VALUES (DEFAULT, '4', '2');
INSERT INTO `lockersBD`.`piso_edificio` (`idPiso`, `pisoCol`, `edificio_instituto_idEdificioInstituto`) VALUES (DEFAULT, '5', '2');
INSERT INTO `lockersBD`.`piso_edificio` (`idPiso`, `pisoCol`, `edificio_instituto_idEdificioInstituto`) VALUES (DEFAULT, '6', '2');
INSERT INTO `lockersBD`.`piso_edificio` (`idPiso`, `pisoCol`, `edificio_instituto_idEdificioInstituto`) VALUES (DEFAULT, '1', '3');
INSERT INTO `lockersBD`.`piso_edificio` (`idPiso`, `pisoCol`, `edificio_instituto_idEdificioInstituto`) VALUES (DEFAULT, '2', '3');
INSERT INTO `lockersBD`.`piso_edificio` (`idPiso`, `pisoCol`, `edificio_instituto_idEdificioInstituto`) VALUES (DEFAULT, '3', '3');
INSERT INTO `lockersBD`.`piso_edificio` (`idPiso`, `pisoCol`, `edificio_instituto_idEdificioInstituto`) VALUES (DEFAULT, '4', '3');

-- -----------------------------------------------------
-- Table `lockersBD`.`locker`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lockersBD`.`locker` ;

CREATE TABLE IF NOT EXISTS `lockersBD`.`locker` (
  `idLocker` INT NOT NULL AUTO_INCREMENT,
  `numeroLocker` INT NOT NULL,
  `piso_edificio_idPiso` INT NOT NULL,
  `estado_locker_idEstadoLocker` INT NOT NULL,
  PRIMARY KEY (`idLocker`, `piso_edificio_idPiso`, `estado_locker_idEstadoLocker`),
  INDEX `fk_locker_piso_edificio1_idx` (`piso_edificio_idPiso` ASC) VISIBLE,
  INDEX `fk_locker_estado_locker1_idx` (`estado_locker_idEstadoLocker` ASC) VISIBLE,
  CONSTRAINT `fk_locker_piso_edificio1`
    FOREIGN KEY (`piso_edificio_idPiso`)
    REFERENCES `lockersBD`.`piso_edificio` (`idPiso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_locker_estado_locker1`
    FOREIGN KEY (`estado_locker_idEstadoLocker`)
    REFERENCES `lockersBD`.`estado_locker` (`idEstadoLocker`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

INSERT INTO `lockersBD`.`locker` VALUES (DEFAULT, '1', '2', '1');
INSERT INTO `lockersBD`.`locker` VALUES (DEFAULT, '2', '2', '1');
INSERT INTO `lockersBD`.`locker` VALUES (DEFAULT, '3', '2', '1');
INSERT INTO `lockersBD`.`locker` VALUES (DEFAULT, '4', '2', '1');
INSERT INTO `lockersBD`.`locker` VALUES (DEFAULT, '5', '2', '1');
INSERT INTO `lockersBD`.`locker` VALUES (DEFAULT, '6', '2', '1');
INSERT INTO `lockersBD`.`locker` VALUES (DEFAULT, '7', '2', '1');
INSERT INTO `lockersBD`.`locker` VALUES (DEFAULT, '8', '2', '1');
INSERT INTO `lockersBD`.`locker` VALUES (DEFAULT, '9', '2', '1');
INSERT INTO `lockersBD`.`locker` VALUES (DEFAULT, '10', '2', '1');
INSERT INTO `lockersBD`.`locker` VALUES (DEFAULT, '11', '2', '1');
INSERT INTO `lockersBD`.`locker` VALUES (DEFAULT, '12', '2', '1');
INSERT INTO `lockersBD`.`locker` VALUES (DEFAULT, '13', '2', '1');
INSERT INTO `lockersBD`.`locker` VALUES (DEFAULT, '14', '2', '1');
INSERT INTO `lockersBD`.`locker` VALUES (DEFAULT, '15', '2', '1');
INSERT INTO `lockersBD`.`locker` VALUES (DEFAULT, '16', '2', '1');
INSERT INTO `lockersBD`.`locker` VALUES (DEFAULT, '17', '2', '1');
INSERT INTO `lockersBD`.`locker` VALUES (DEFAULT, '18', '2', '1');
INSERT INTO `lockersBD`.`locker` VALUES (DEFAULT, '19', '2', '1');
INSERT INTO `lockersBD`.`locker` VALUES (DEFAULT, '20', '2', '1');
INSERT INTO `lockersBD`.`locker` VALUES (DEFAULT, '21', '2', '1');
INSERT INTO `lockersBD`.`locker` VALUES (DEFAULT, '22', '2', '1');
INSERT INTO `lockersBD`.`locker` VALUES (DEFAULT, '23', '2', '1');
INSERT INTO `lockersBD`.`locker` VALUES (DEFAULT, '24', '2', '1');
INSERT INTO `lockersBD`.`locker` VALUES (DEFAULT, '25', '2', '1');
INSERT INTO `lockersBD`.`locker` VALUES (DEFAULT, '26', '2', '1');
INSERT INTO `lockersBD`.`locker` VALUES (DEFAULT, '27', '2', '1');
INSERT INTO `lockersBD`.`locker` VALUES (DEFAULT, '28', '2', '1');
INSERT INTO `lockersBD`.`locker` VALUES (DEFAULT, '29', '2', '1');
INSERT INTO `lockersBD`.`locker` VALUES (DEFAULT, '30', '2', '1');
INSERT INTO `lockersBD`.`locker` VALUES (DEFAULT, '31', '2', '1');
INSERT INTO `lockersBD`.`locker` VALUES (DEFAULT, '32', '2', '1');
INSERT INTO `lockersBD`.`locker` VALUES (DEFAULT, '33', '2', '1');
INSERT INTO `lockersBD`.`locker` VALUES (DEFAULT, '34', '2', '1');
INSERT INTO `lockersBD`.`locker` VALUES (DEFAULT, '35', '2', '1');
INSERT INTO `lockersBD`.`locker` VALUES (DEFAULT, '36', '2', '1');
INSERT INTO `lockersBD`.`locker` VALUES (DEFAULT, '37', '2', '1');
INSERT INTO `lockersBD`.`locker` VALUES (DEFAULT, '38', '2', '1');
INSERT INTO `lockersBD`.`locker` VALUES (DEFAULT, '39', '2', '1');
INSERT INTO `lockersBD`.`locker` VALUES (DEFAULT, '40', '2', '1');
INSERT INTO `lockersBD`.`locker` VALUES (DEFAULT, '41', '2', '1');
INSERT INTO `lockersBD`.`locker` VALUES (DEFAULT, '42', '2', '1');
INSERT INTO `lockersBD`.`locker` VALUES (DEFAULT, '43', '2', '1');
INSERT INTO `lockersBD`.`locker` VALUES (DEFAULT, '44', '2', '1');
INSERT INTO `lockersBD`.`locker` VALUES (DEFAULT, '45', '2', '1');
INSERT INTO `lockersBD`.`locker` VALUES (DEFAULT, '46', '2', '1');
INSERT INTO `lockersBD`.`locker` VALUES (DEFAULT, '47', '2', '1');
INSERT INTO `lockersBD`.`locker` VALUES (DEFAULT, '48', '2', '1');
INSERT INTO `lockersBD`.`locker` VALUES (DEFAULT, '49', '2', '1');
INSERT INTO `lockersBD`.`locker` VALUES (DEFAULT, '50', '2', '1');

-- -----------------------------------------------------
-- Table `lockersBD`.`reserva`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lockersBD`.`reserva` ;

CREATE TABLE IF NOT EXISTS `lockersBD`.`reserva` (
  `idReserva` INT NOT NULL AUTO_INCREMENT,
  `codigoQr` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`idReserva`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lockersBD`.`alumno`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lockersBD`.`alumno` ;

CREATE TABLE IF NOT EXISTS `lockersBD`.`alumno` (
  `runAlumno` INT NOT NULL,
  `dvRunAlumno` CHAR NOT NULL,
  `emailAlumno` VARCHAR(60) NOT NULL,
  `pNombreAlumno` VARCHAR(45) NOT NULL,
  `apPaternoAlumno` VARCHAR(45) NOT NULL,
  `apMaternoAlumno` VARCHAR(45) NOT NULL,
  `anioIngresoAlumno` YEAR NOT NULL,
  `jornada_idJornada` INT NOT NULL,
  `carrera_idCarrera` INT NOT NULL,
  `carrera_tipo_carrera_idTipoCarrera` INT NOT NULL,
  `carrera_escuela_idEscuela` INT NOT NULL,
  PRIMARY KEY (`runAlumno`, `jornada_idJornada`, `carrera_idCarrera`, `carrera_tipo_carrera_idTipoCarrera`, `carrera_escuela_idEscuela`),
  INDEX `fk_alumno_jornada1_idx` (`jornada_idJornada` ASC) VISIBLE,
  INDEX `fk_alumno_carrera1_idx` (`carrera_idCarrera` ASC, `carrera_tipo_carrera_idTipoCarrera` ASC, `carrera_escuela_idEscuela` ASC) VISIBLE,
  CONSTRAINT `fk_alumno_jornada1`
    FOREIGN KEY (`jornada_idJornada`)
    REFERENCES `lockersBD`.`jornada` (`idJornada`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_alumno_carrera1`
    FOREIGN KEY (`carrera_idCarrera` , `carrera_tipo_carrera_idTipoCarrera` , `carrera_escuela_idEscuela`)
    REFERENCES `lockersBD`.`carrera` (`idCarrera` , `tipo_carrera_idTipoCarrera` , `escuela_idEscuela`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO `lockersBD`.`alumno` VALUES ('21300379', '8', 'hec.lopez@duocuc.cl', 'Héctor', 'López', 'González', 2023, 1, 1, 1, 1);

-- -----------------------------------------------------
-- Table `lockersBD`.`administrador`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lockersBD`.`administrador` ;

CREATE TABLE IF NOT EXISTS `lockersBD`.`administrador` (
  `runAdministrador` INT NOT NULL,
  `dvRunAdministrador` CHAR NOT NULL,
  `pNombreAdministrador` VARCHAR(45) NOT NULL,
  `apPaternoAdmin` VARCHAR(45) NOT NULL,
  `code_offline_idCodeOffline` INT NOT NULL,
  PRIMARY KEY (`runAdministrador`, `code_offline_idCodeOffline`),
  INDEX `fk_administrador_code_offline1_idx` (`code_offline_idCodeOffline` ASC) VISIBLE,
  CONSTRAINT `fk_administrador_code_offline1`
    FOREIGN KEY (`code_offline_idCodeOffline`)
    REFERENCES `lockersBD`.`code_offline` (`idCodeOffline`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO `lockersBD`.`administrador` VALUES ('22032622', '8', 'het0c', 'admin', 1);

-- -----------------------------------------------------
-- Table `lockersBD`.`estadoReserva`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lockersBD`.`estadoReserva` ;

CREATE TABLE IF NOT EXISTS `lockersBD`.`estadoReserva` (
  `idEstadoReserva` INT NOT NULL AUTO_INCREMENT,
  `descEstadoReserva` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`idEstadoReserva`))
ENGINE = InnoDB;

INSERT INTO `lockersBD`.`estadoReserva` VALUES (DEFAULT, 'Activo');
INSERT INTO `lockersBD`.`estadoReserva` VALUES (DEFAULT, 'Finalizado');
INSERT INTO `lockersBD`.`estadoReserva` VALUES (DEFAULT, 'Cancelado');

-- -----------------------------------------------------
-- Table `lockersBD`.`reserva_alumno`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lockersBD`.`reserva_alumno` ;

CREATE TABLE IF NOT EXISTS `lockersBD`.`reserva_alumno` (
  `idReservaAlumno` INT NOT NULL AUTO_INCREMENT,
  `fecha_inicio` DATE NOT NULL,
  `fecha_fin` DATE NOT NULL,
  `locker_idLocker` INT NOT NULL,
  `locker_piso_edificio_idPiso` INT NOT NULL,
  `locker_estado_locker_idEstadoLocker` INT NOT NULL,
  `alumno_runAlumno` INT NOT NULL,
  `alumno_jornada_idJornada` INT NOT NULL,
  `alumno_carrera_idCarrera` INT NOT NULL,
  `alumno_carrera_tipo_carrera_idTipoCarrera` INT NOT NULL,
  `alumno_carrera_escuela_idEscuela` INT NOT NULL,
  `estadoReserva_idEstadoReserva` INT NOT NULL,
  `reserva_idReserva` INT NOT NULL,
  PRIMARY KEY (`idReservaAlumno`),
  UNIQUE INDEX `idx_unq_reserva_alumno` (`alumno_runAlumno`, `fecha_inicio`, `fecha_fin`),
  INDEX `fk_reserva_alumno_locker1_idx` (`locker_idLocker` ASC, `locker_piso_edificio_idPiso` ASC, `locker_estado_locker_idEstadoLocker` ASC) INVISIBLE,
  INDEX `fk_reserva_alumno_alumno1_idx` (`alumno_runAlumno` ASC, `alumno_jornada_idJornada` ASC, `alumno_carrera_idCarrera` ASC, `alumno_carrera_tipo_carrera_idTipoCarrera` ASC, `alumno_carrera_escuela_idEscuela` ASC) VISIBLE,
  INDEX `fk_reserva_alumno_estadoReserva1_idx` (`estadoReserva_idEstadoReserva` ASC) INVISIBLE,
  INDEX `fk_reserva_alumno_reserva1_idx` (`reserva_idReserva` ASC) VISIBLE,
  CONSTRAINT `fk_reserva_alumno_locker1`
    FOREIGN KEY (`locker_idLocker` , `locker_piso_edificio_idPiso` , `locker_estado_locker_idEstadoLocker`)
    REFERENCES `lockersBD`.`locker` (`idLocker` , `piso_edificio_idPiso` , `estado_locker_idEstadoLocker`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_reserva_alumno_alumno1`
    FOREIGN KEY (`alumno_runAlumno` , `alumno_jornada_idJornada` , `alumno_carrera_idCarrera` , `alumno_carrera_tipo_carrera_idTipoCarrera` , `alumno_carrera_escuela_idEscuela`)
    REFERENCES `lockersBD`.`alumno` (`runAlumno` , `jornada_idJornada` , `carrera_idCarrera` , `carrera_tipo_carrera_idTipoCarrera` , `carrera_escuela_idEscuela`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_reserva_alumno_estadoReserva1`
    FOREIGN KEY (`estadoReserva_idEstadoReserva`)
    REFERENCES `lockersBD`.`estadoReserva` (`idEstadoReserva`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_reserva_alumno_reserva1`
    FOREIGN KEY (`reserva_idReserva`)
    REFERENCES `lockersBD`.`reserva` (`idReserva`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;