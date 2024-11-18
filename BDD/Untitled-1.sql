SELECT * FROM lockersbd.piso_edificio;

SELECT DISTINCT pisoCol FROM lockersbd.piso_edificio;

SELECT COUNT(*) FROM piso_edificio;


SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'lockersbd';

SELECT DISTINCT letraEdificio FROM edificio_instituto

SELECT COUNT(*) FROM reserva_alumno WHERE alumno_runAlumno = 21300379 AND LAST_VALUE(fecha_fin) = 


SELECT * FROM reserva_alumno WHERE alumno_runAlumno = 21300379 AND MAX(fecha_fin) = DATE('2024-10-22')

DELIMITER $$

CREATE PROCEDURE p_venceReserva()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE lockerId INT;
    DECLARE currentTime DATETIME;
    
    -- Obtener el tiempo actual
    SET currentTime = NOW();
    -- Declarar el cursor para recorrer todos los lockers
    DECLARE cur_recorrerLocker CURSOR FOR 
        SELECT idLocker 
        FROM lockers;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
    
    OPEN cur_recorrerLocker;
    
    l_recorrido: LOOP
        FETCH cur_recorrerLocker INTO lockerId;
        
        IF done THEN
            LEAVE l_recorrido;
        END IF;
        
        -- Verificar si la reserva más reciente del locker ha vencido
        IF EXISTS (
            SELECT 1 
            FROM reserva_alumno
            WHERE locker_idLocker = lockerId
            AND estadoReserva_idEstadoReserva = 1
            AND fecha_fin < currentTime
            LIMIT 1
        ) THEN
            -- Actualizar el estado del locker a disponible
            UPDATE locker
            SET estado_locker_idEstadoLocker = 1
            WHERE idLocker = lockerId;
            
            -- Actualizar el estado de la reserva a expirada
            UPDATE reserva_alumno 
            SET estadoReserva_idEstadoReserva = 2
            WHERE locker_id = lockerId 
            AND estadoReserva_idEstadoReserva = 1
            AND fecha_fin < currentTime;
        END IF;
    END LOOP;
    
    CLOSE cur_recorrerLocker;
END$$

DELIMITER ;
 call `p_claveLockers`

 SELECT secretKey , locker_idLocker, alumno_runAlumno, numeroLocker FROM reserva_alumno ra
INNER JOIN locker l ON ra.locker_idLocker = l.idLocker
WHERE
estadoReserva_idEstadoReserva = 1 AND
alumno_runAlumno = 21300379 