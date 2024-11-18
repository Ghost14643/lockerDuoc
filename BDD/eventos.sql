
-- evento para que diariamente se revise el vencimiento de las reservas de los lockers activos,
-- finalizando aquellos que hallan vencido.
CREATE EVENT e_revisionReserva
ON SCHEDULE EVERY 1 DAY
DO CALL p_venceReserva();

-- Evento que reinicia las claves de todos los locker de manera semanal

CREATE EVENT e_reinicioEncriptado
ON SCHEDULE EVERY 1 WEEK
DO CALL lockersbd.p_claveLockers();

