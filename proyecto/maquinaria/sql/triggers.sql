-- Active: 1725388423808@@127.0.0.1@3306@almacen3e
/*
    1. Fecha de cierre de la tabla Incidencias
    Es la fecha en la cual la incidencia queda resuelta, se actualiza 
    automáticamente cuando se cambia el estado de la incidencia a terminada.
*/
DELIMITER $$
CREATE TRIGGER fechaCierreIncidencia
AFTER UPDATE ON incidencia
FOR EACH ROW
BEGIN
    IF (NEW.estado = 'TER')
    THEN
        UPDATE incidencia
        SET fechaCierre = CURRENT_DATE
        WHERE noIncidencia = OLD.noIncidencia
    END IF;
END$$
/*
    2. Fecha mantenimiento si viene de incidencia
    Es la fecha en la cual se pretende realizar el mantenimiento, en 
    caso de que el mantenimiento venga de una incidencia se asigna la fecha 
    de la incidencia.
*/
CREATE TRIGGER fechaMantenimientoIncidencia
BEFORE INSERT ON mantenimiento
FOR EACH ROW
BEGIN
    DECLARE fechaIncidencia DATE;
    SET fechaIncidencia (SELECT fechaInicio
                         FROM incidencia
                         WHERE noIncidencia = NEW.incidencia);
    IF(NEW.incidencia <> 0 AND NEW.incidencia <> NULL)
    THEN
        SET NEW.fechaProgramada = fechaIncidencia;
    END IF;
END$$
/*
    3. Calcular el importe de los materiales usados en una reparacion
    Es el precio que costaron los materiales utilizados en la reparación.
*/
CREATE TRIGGER importeMaterialesReparacion
BEFORE INSERT ON materialesReparacion
FOR EACH ROW
BEGIN
    SET NEW.importe = (SELECT precio
                       FROM materiales
                       WHERE codigoMaterial = NEW.material) * NEW.cantidad;
END$$