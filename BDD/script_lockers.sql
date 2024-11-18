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
  PRIMARY KEY (`idCarrera`),
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
INSERT INTO `lockersBD`.`carrera` VALUES ('50', 'Ingenieria en Informatica', '2', '6');

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
  `pisoEscuela_idEscuela` INT NULL,
  PRIMARY KEY (`idPiso`),
  INDEX `fk_piso_edificio_edificio_instituto1_idx` (`edificio_instituto_idEdificioInstituto` ASC) VISIBLE,
  INDEX `fk_piso_edificio_escuela2_idx` (`pisoEscuela_idEscuela` ASC) VISIBLE,
  CONSTRAINT `fk_piso_edificio_edificio_instituto1`
    FOREIGN KEY (`edificio_instituto_idEdificioInstituto`)
    REFERENCES `lockersBD`.`edificio_instituto` (`idEdificioInstituto`),
	CONSTRAINT `fk_piso_edificio_escuela2`
    FOREIGN KEY (`pisoEscuela_idEscuela`)
    REFERENCES `lockersbd`.`escuela` (`idEscuela`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)

ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

ALTER TABLE `lockersBD`.`piso_edificio` 
ADD UNIQUE (`idPiso`);

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

CREATE TABLE IF NOT EXISTS `locker` (
    `idLocker` int NOT NULL AUTO_INCREMENT,
    `numeroLocker` int NOT NULL,
    `piso_edificio_idPiso` int NOT NULL,
    `estado_locker_idEstadoLocker` int NOT NULL,
    `secretKey` varchar(45) NOT NULL,
    PRIMARY KEY (`idLocker`),
    KEY `fk_locker_piso_edificio1_idx` (`piso_edificio_idPiso`),
    KEY `fk_locker_estado_locker1_idx` (
        `estado_locker_idEstadoLocker`
    ),
    CONSTRAINT `fk_locker_estado_locker1` FOREIGN KEY (
        `estado_locker_idEstadoLocker`
    ) REFERENCES `estado_locker` (`idEstadoLocker`),
    CONSTRAINT `fk_locker_piso_edificio1` FOREIGN KEY (`piso_edificio_idPiso`) REFERENCES `piso_edificio` (`idPiso`)
) ENGINE = InnoDB AUTO_INCREMENT = 40 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci


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
  `contrasenAlumno` varchar(45) NOT NULL,
  `anioIngresoAlumno` YEAR NOT NULL,
  `jornada_idJornada` INT NOT NULL,
  `carrera_idCarrera` INT NOT NULL,
  PRIMARY KEY (`runAlumno`),
  INDEX `fk_alumno_jornada1_idx` (`jornada_idJornada` ASC) VISIBLE,
  INDEX `fk_alumno_carrera1_idx` (`carrera_idCarrera` ASC) VISIBLE,
  CONSTRAINT `fk_alumno_jornada1`
    FOREIGN KEY (`jornada_idJornada`)
    REFERENCES `lockersBD`.`jornada` (`idJornada`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_alumno_carrera1`
    FOREIGN KEY (`carrera_idCarrera`)
    REFERENCES `lockersBD`.`carrera` (`idCarrera`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    )
ENGINE = InnoDB;



INSERT INTO `lockersBD`.`alumno` (`runAlumno`, `dvRunAlumno`, `emailAlumno`, `pNombreAlumno`, `apPaternoAlumno`, `apMaternoAlumno`, `contrasenAlumno`, `anioIngresoAlumno`, `jornada_idJornada`, `carrera_idCarrera`)  VALUES ('21300379', '8', 'hec.lopez@duocuc.cl', 'Héctor', 'López', 'González','aaaaaaaa', 2023, 1, 50);

INSERT INTO `lockersbd`.`alumno` (`runAlumno`, `dvRunAlumno`, `emailAlumno`, `pNombreAlumno`, `apPaternoAlumno`, `apMaternoAlumno`, `contrasenAlumno`, `anioIngresoAlumno`, `jornada_idJornada`, `carrera_idCarrera`) VALUES ('22222222', '2', 'test@test.cl', 'test', 'test', 'test', 'test', 2022, '2', '2');


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
  PRIMARY KEY (`runAdministrador`),
  INDEX `fk_administrador_code_offline1_idx` (`code_offline_idCodeOffline` ASC) VISIBLE,
  CONSTRAINT `fk_administrador_code_offline1`
    FOREIGN KEY (`code_offline_idCodeOffline`)
    REFERENCES `lockersBD`.`code_offline` (`idCodeOffline`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



INSERT INTO `lockersbd`.`administrador` (`runAdministrador`, `dvRunAdministrador`, `pNombreAdministrador`, `apPaternoAdmin`, `code_offline_idCodeOffline`) VALUES ('11111111', '1', 'admin', 'admin', '1');
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


CREATE TABLE IF NOT EXISTS `lockersbd`.`reserva_alumno` (
  `idReservaAlumno` INT NOT NULL AUTO_INCREMENT,
  `fecha_inicio` DATE NOT NULL,
  `fecha_fin` DATE NOT NULL,
  `locker_idLocker` INT NOT NULL,
  `alumno_runAlumno` INT NOT NULL,
  `estadoReserva_idEstadoReserva` INT NOT NULL,
  `reserva_idReserva` INT NOT NULL,
  PRIMARY KEY (`idReservaAlumno`),
  INDEX `fk_reserva_alumno_estadoReserva1_idx` (`estadoReserva_idEstadoReserva` ASC) VISIBLE,
  INDEX `fk_reserva_alumno_locker1_idx` (`locker_idLocker` ASC) VISIBLE,
  INDEX `fk_reserva_alumno_reserva1_idx` (`reserva_idReserva` ASC) VISIBLE,
  INDEX `fk_reserva_alumno_runAlumno1_idx` (`alumno_runAlumno` ASC) VISIBLE,
  CONSTRAINT `fk_reserva_alumno_estadoReserva1`
    FOREIGN KEY (`estadoReserva_idEstadoReserva`)
    REFERENCES `lockersbd`.`estadoreserva` (`idEstadoReserva`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_reserva_alumno_locker1`
    FOREIGN KEY (`locker_idLocker`)
    REFERENCES `lockersbd`.`locker` (`idLocker`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_reserva_alumno_reserva1`
    FOREIGN KEY (`reserva_idReserva`)
    REFERENCES `lockersbd`.`reserva` (`idReserva`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_reserva_alumno_runAlumno1`
    FOREIGN KEY (`alumno_runAlumno`)
    REFERENCES `lockersbd`.`alumno` (`runAlumno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


INSERT INTO `lockersbd`.`reserva` (`idReserva`, `codigoQr`) VALUES ('1', '651df51fdhc1b6fg');



-- -----------------------------------------------------
-- Trigger `lockersbd`.`reserva_alumno_AFTER_INSERT`
-- -----------------------------------------------------

DROP TRIGGER IF EXISTS `lockersbd`.`reserva_alumno_AFTER_INSERT`;

DELIMITER $$
USE `lockersbd`$$
CREATE DEFINER = CURRENT_USER TRIGGER `lockersbd`.`reserva_alumno_AFTER_INSERT` AFTER INSERT ON `reserva_alumno` FOR EACH ROW
BEGIN
	DECLARE
	v_idLocker int(3);
    
	SELECT locker_idLocker
    INTO v_idLocker
    FROM lockersbd.reserva_alumno
    WHERE idReservaAlumno = NEW.idReservaAlumno;
    
	UPDATE locker SET estado_locker_idEstadoLocker = 2 WHERE idLocker =  v_idLocker;
END$$
DELIMITER ;
 
 
-- -----------------------------------------------------
-- TABLE `lockersbd`.`cancelacion_reserva`
-- -----------------------------------------------------

CREATE TABLE `lockersbd`.`cancelacion_reserva` (
  `idCancelacion_reserva` INT NOT NULL AUTO_INCREMENT,
  `administrador_runAdministrador` INT NOT NULL,
  `reserva_alumno_idReservaAlumno` INT NOT NULL,
  `observacion` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`idCancelacion_reserva`),
  INDEX `fk_administrador_runAdministrador1_idx` (`administrador_runAdministrador` ASC) VISIBLE,
  CONSTRAINT `fk_administrador_runAdministrador1`
    FOREIGN KEY (`administrador_runAdministrador`)
    REFERENCES `lockersbd`.`administrador` (`runAdministrador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_reserva_alumno_idReservaAlumno1`
    FOREIGN KEY (`reserva_alumno_idReservaAlumno`)
    REFERENCES `lockersbd`.`reserva_alumno` (`idReservaAlumno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- -----------------------------------------------------
-- TRIGGER `lockersbd`.`cancelacion_reserva_AFTER_INSERT`
-- -----------------------------------------------------

DROP TRIGGER IF EXISTS `lockersbd`.`cancelacion_reserva_AFTER_INSERT`;

DELIMITER $$
USE `lockersbd`$$
CREATE DEFINER = CURRENT_USER TRIGGER `lockersbd`.`cancelacion_reserva_AFTER_INSERT` AFTER INSERT ON `cancelacion_reserva` FOR EACH ROW
BEGIN
	DECLARE
	v_idLocker int;
    
	SELECT locker_idLocker
    INTO v_idLocker
    FROM lockersbd.reserva_alumno
    WHERE idReservaAlumno = NEW.reserva_alumno_idReservaAlumno;


	UPDATE locker SET estado_locker_idEstadoLocker = 1 WHERE idLocker = v_idLocker;
END$$
DELIMITER ;

-- -----------------------------------------------------
-- PROCEDURE p_crearLocker
-- -----------------------------------------------------

DELIMITER //
CREATE PROCEDURE p_crearLocker(IN cantLockers INT, IN idPiso INT)
BEGIN
	DECLARE i INT DEFAULT 1;
    WHILE i <= cantlockers DO
    
		INSERT INTO `lockersbd`.`locker` (`numeroLocker`, `piso_edificio_idPiso`, `estado_locker_idEstadoLocker`)
		VALUES ( i, idPiso, '1');
		SET i = i+1;
        
	END WHILE;
END //
DELIMITER ;

-- -----------------------------------------------------
-- PROCEDURE truncarLocker
-- -----------------------------------------------------

DELIMITER //
CREATE PROCEDURE truncarLocker()
BEGIN
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE locker;
SET FOREIGN_KEY_CHECKS = 1;

END //
DELIMITER ;



-- -----------------------------------------------------
-- PROCEDURE p_crearPiso
-- -----------------------------------------------------
USE `lockersbd`;
DROP procedure IF EXISTS `p_crearPiso`;

DELIMITER $$
USE `lockersbd`$$
CREATE PROCEDURE `p_crearPiso` (IN cantPisos INT, IN idEdificio INT)
BEGIN
	DECLARE i INT DEFAULT 1;
    WHILE i <= cantPisos DO
		INSERT INTO `lockersbd`.`piso_edificio` (`idPiso`, `pisoCol`, `edificio_instituto_idEdificioInstituto`, `pisoEscuela_idEscuela`)
        VALUES (default, cantPisos , idEdificio, null);
		SET i = i+1;
	END WHILE;
    SIGNAL SQLSTATE '01000' SET MESSAGE_TEXT = 'El procedimiento p_crearPiso se ejecutó sin problemas.';
END$$

DELIMITER ;



USE `lockersbd`;
DROP procedure IF EXISTS `p_venceReserva`;

USE `lockersbd`;
DROP procedure IF EXISTS `lockersbd`.`p_venceReserva`;
;

DELIMITER $$
USE `lockersbd`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_venceReserva`()
BEGIN
  DECLARE done INT DEFAULT 0;
  DECLARE lockerId INT;
  DECLARE currentTime DATETIME;
	DECLARE cur_recorrerLocker CURSOR FOR 
        SELECT idLocker 
        FROM locker;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    SET currentTime = NOW();
    OPEN cur_recorrerLocker;
    l_recorrido: LOOP
        FETCH cur_recorrerLocker INTO lockerId;
        
        IF done THEN
            LEAVE l_recorrido;
        END IF;
        IF EXISTS (
            SELECT 1 
            FROM reserva_alumno
            WHERE locker_idLocker = lockerId
            AND estadoReserva_idEstadoReserva = 1
            AND fecha_fin < currentTime
            LIMIT 1) THEN
            
            UPDATE locker
            SET estado_locker_idEstadoLocker = 1
            WHERE idLocker = lockerId;

            UPDATE reserva_alumno 
            SET estadoReserva_idEstadoReserva = 2
            WHERE locker_idLocker = lockerId 
            AND estadoReserva_idEstadoReserva = 1
            AND fecha_fin < currentTime;
        END IF;
    END LOOP;
    
    CLOSE cur_recorrerLocker;
    END$$

DELIMITER ;
;

USE `lockersbd`;
DROP procedure IF EXISTS `p_claveLockers`;

USE `lockersbd`;
DROP procedure IF EXISTS `lockersbd`.`p_claveLockers`;
;




USE `lockersbd`;
DROP procedure IF EXISTS `p_claveLockers`;

USE `lockersbd`;
DROP procedure IF EXISTS `lockersbd`.`p_claveLockers`;
;

DELIMITER $$
USE `lockersbd`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_claveLockers`()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE nueva_clave VARCHAR(45);
    DECLARE lockerId INT;
    DECLARE cur_recorrerLocker CURSOR FOR 
    SELECT idLocker 
    FROM locker;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
	OPEN cur_recorrerLocker;
    l_recorrido: LOOP
        FETCH cur_recorrerLocker INTO lockerId;
        
        IF done THEN
            LEAVE l_recorrido;
        END IF;
        IF EXISTS (
            SELECT 1 
            FROM locker
            WHERE idLocker = lockerId
            LIMIT 1) THEN

            SET nueva_clave = TO_BASE64(SUBSTRING(CONCAT(MD5(RAND()), MD5(RAND())), 1, 32));
            UPDATE `lockersbd`.`locker` SET `secretKey` = nueva_clave WHERE (`idLocker` = lockerId);


        END IF;
    END LOOP;
    CLOSE cur_recorrerLocker;
END$$

DELIMITER ;
;


CREATE TABLE `lockersbd`.`registro_lockers` (
  `idRegistro` INT NOT NULL AUTO_INCREMENT,
  `idLocker` INT NOT NULL,
  `RunAlumno` INT(8) NOT NULL,
  `fechaIngreso` DATE NOT NULL,
  `horaIngreso` TIME NOT NULL,
  PRIMARY KEY (`idRegistro`),
  INDEX `fk_alumno_runAlumno_idx` (`RunAlumno` ASC) VISIBLE,
  INDEX `fk_locker_idLocker _idx` (`idLocker` ASC) VISIBLE,
  CONSTRAINT `fk_alumno_runAlumno`
    FOREIGN KEY (`RunAlumno`)
    REFERENCES `lockersbd`.`alumno` (`runAlumno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_locker_idLocker `
    FOREIGN KEY (`idLocker`)
    REFERENCES `lockersbd`.`locker` (`idLocker`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);






SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
