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

SELECT 
    l.idLocker AS idLocker,
    l.numeroLocker AS numeroLocker,
    pe.pisoCol AS pisoCol,
    ei.letraEdificio AS letraEdificio,
    l.estado_locker_idEstadoLocker AS estado_locker_idEstadoLocker,
    CASE
        WHEN MAX(estado_locker_idEstadoLocker) = 2 THEN MAX(ra.alumno_runAlumno)
        ELSE NULL
    END AS alumno_runAlumno
FROM
    locker l
JOIN 
    piso_edificio pe ON l.piso_edificio_idPiso = pe.idPiso
JOIN 
    edificio_instituto ei ON pe.edificio_instituto_idEdificioInstituto = ei.idEdificioInstituto
LEFT JOIN 
    reserva_alumno ra ON ra.locker_idLocker = l.idLocker
GROUP BY 
    l.idLocker, l.numeroLocker, pe.pisoCol, ei.letraEdificio, l.estado_locker_idEstadoLocker;
