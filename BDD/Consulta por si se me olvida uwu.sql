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
        ;
        
 SELECT idLocker, numeroLocker, pe.pisoCol, l.piso_edificio_idPiso, ei.letraEdificio , estado_locker_idEstadoLocker
    FROM locker l 
    INNER JOIN piso_edificio pe ON l.piso_edificio_idPiso = pe.idPiso
    INNER JOIN edificio_instituto ei ON pe.edificio_instituto_idEdificioInstituto = ei.idEdificioInstituto
    WHERE 1=1
;

SELECT idLocker , estado_locker_idEstadoLocker, pe.pisoEscuela_idEscuela
                        FROM locker l 
                        INNER JOIN piso_edificio pe on l.piso_edificio_idPiso = pe.idPiso
                        WHERE 1=1 AND 
                        l.numeroLocker  AND piso_edificio_idPiso  AND pe.edificio_instituto_idEdificioInstituto 
                        ;


call p_crearLocker()
;

SELECT piso_edificio_idPiso FROM locker WHERE idLocker ;

SELECT pisoEscuela_idEscuela FROM piso_edificio pe INNER JOIN locker l  ON l.piso_edificio_idPiso = pe.idPiso WHERE idLocker %s