SELECT idLocker, numeroLocker, piso_edificio_idPiso, estado_locker_idEstadoLocker FROM locker WHERE 1=1
AND piso_edificio_idPiso<=10 AND piso_edificio_idPiso>=6;

SELECT idLocker, numeroLocker, piso_edificio_idPiso, estado_locker_idEstadoLocker FROM locker WHERE 1=1
AND piso_edificio_idPiso>=11 AND piso_edificio_idPiso<=15;

SELECT idLocker, numeroLocker, piso_edificio_idPiso, estado_locker_idEstadoLocker FROM locker WHERE 1=1
AND estado_locker_idEstadoLocker =2;


SELECT idLocker, numeroLocker, piso_edificio_idPiso, estado_locker_idEstadoLocker, pe.pisoCol FROM locker l INNER JOIN piso_edificio pe ON l.piso_edificio_idPiso = pe.idPiso
where 1=1 
-- and pe.idPiso = 2
;
SELECT l.idLocker, numeroLocker, pe.pisoCol , piso_edificio_idPiso ,estado_locker_idEstadoLocker,
                        ra.alumno_runAlumno,
                        ra.fecha_inicio,
                        ra.fecha_fin
                        FROM locker l
                        INNER JOIN piso_edificio pe ON l.piso_edificio_idPiso = pe.idPiso
                        LEFT JOIN reserva_alumno ra ON l.idLocker = ra.locker_idLocker
                        ;
                        
    SELECT idLocker, numeroLocker, pe.pisoCol, l.piso_edificio_idPiso, estado_locker_idEstadoLocker
    FROM locker l 
    INNER JOIN piso_edificio pe ON l.piso_edificio_idPiso = pe.idPiso 
    ;
    
    SELECT 
    l.idLocker, 
    l.numeroLocker, 
    pe.pisoCol, 
    l.piso_edificio_idPiso, 
    l.estado_locker_idEstadoLocker, 
    ra.alumno_runAlumno AS rutEstudiante, 
    ra.fecha_inicio AS fechaInicio, 
    ra.fecha_fin AS fechaFin
FROM locker l
INNER JOIN piso_edificio pe ON l.piso_edificio_idPiso = pe.idPiso
LEFT JOIN reserva_alumno ra ON l.idLocker = ra.locker_idLocker;


        SELECT r.fecha_inicio, r.fecha_fin, a.pNombreAlumno, a.apPaternoAlumno, a.runAlumno
        FROM reserva_alumno r
        INNER JOIN alumno a ON r.alumno_runAlumno = a.runAlumno
        WHERE r.locker_idLocker = 2 AND r.estadoReserva_idEstadoReserva = 1
