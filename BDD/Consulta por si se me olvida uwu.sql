SELECT idLocker, numeroLocker, piso_edificio_idPiso, estado_locker_idEstadoLocker FROM locker WHERE 1=1
AND piso_edificio_idPiso<=10 AND piso_edificio_idPiso>=6;

SELECT idLocker, numeroLocker, piso_edificio_idPiso, estado_locker_idEstadoLocker FROM locker WHERE 1=1
AND piso_edificio_idPiso>=11 AND piso_edificio_idPiso<=15;

SELECT idLocker, numeroLocker, piso_edificio_idPiso, estado_locker_idEstadoLocker FROM locker WHERE 1=1
AND estado_locker_idEstadoLocker =2

SELECT idLocker, numeroLocker, piso_edificio_idPiso, estado_locker_idEstadoLocker, pe.pisoCol FROM locker l INNER JOIN piso_edificio pe ON l.piso_edificio_idPiso = pe.idPiso
