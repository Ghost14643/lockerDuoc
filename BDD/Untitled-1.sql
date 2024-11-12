SELECT * FROM lockersbd.piso_edificio;

SELECT DISTINCT pisoCol FROM lockersbd.piso_edificio;

SELECT COUNT(*) FROM piso_edificio;


SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'lockersbd';

SELECT DISTINCT letraEdificio FROM edificio_instituto

SELECT COUNT(*) FROM reserva_alumno WHERE alumno_runAlumno = 21300379 AND LAST_VALUE(fecha_fin) = 


SELECT * FROM reserva_alumno WHERE alumno_runAlumno = 21300379 AND MAX(fecha_fin) = DATE('2024-10-22')