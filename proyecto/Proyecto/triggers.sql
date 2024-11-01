-- Active: 1725388423808@@127.0.0.1@3306@mantenimientoequipo
/*
    1. Trigger que cuando el estado de un mantenimiento se actualice a terminado se actualice la incidencia 
    relacionada con el estado terminado, la fecha de cierre automatica y el 
    tecnico asignado vuelva a estar disponible.
*/
DELIMITER $$
CREATE TRIGGER mantenimientoFinalizado
AFTER UPDATE ON mantenimiento
FOR EACH ROW
BEGIN
    DECLARE inci INT;
    DECLARE tec VARCHAR(5);
    SET tec = (SELECT tecnicoAsignado
               FROM incidencia
               WHERE noIncidencia = OLD.incidencia);
    SET inci = (SELECT incidencia
                FROM mantenimiento
                WHERE noMantenimiento = OLD.noMantenimiento);
    IF NEW.estado = 'TER'
    THEN
        UPDATE incidencia
        SET estado = 'TER',
        fechaCierre = CURRENT_DATE
        WHERE noIncidencia = inci;
        UPDATE tecnico
        SET disponibilidad = 'DIS'
        WHERE noTecnico = tec;
    END IF;
END$$
/*
    2. Fecha mantenimiento si viene de incidencia
    Es la fecha en la cual se pretende realizar el mantenimiento, en 
    caso de que el mantenimiento venga de una incidencia se asigna la fecha 
    de la incidencia y el equipo.
*/
CREATE TRIGGER inicilizarMantenimientoIncidencia
BEFORE INSERT ON mantenimiento
FOR EACH ROW
BEGIN
    DECLARE eq VARCHAR(10);
    DECLARE fechaIncidencia DATE;
    SET fechaIncidencia = (SELECT fechaInicio
                           FROM incidencia
                           WHERE noIncidencia = NEW.incidencia);
    SET eq = (SELECT equipo
              FROM incidencia
              WHERE noIncidencia = NEW.incidencia);
        IF NEW.incidencia IS NOT NULL THEN
        SET NEW.fechaProgramada = fechaIncidencia;
        SET NEW.equipo = eq;
        SET NEW.estado = 'EPR';
        SET NEW.costo = 0;
    ELSE
        SET NEW.estado = 'EPR';
        SET NEW.costo = 0;
    END IF;
END$$
/*
    3. Costo de materiales usados por reparacion
    Es el costo total de los materiales usados para el reparacion.
    Actualiza los materiales de la tabla materiales

*/
CREATE TRIGGER reparacionMateriales
AFTER INSERT ON materialesReparacion
FOR EACH ROW
BEGIN
    UPDATE reparacion
    SET costo = costo + NEW.importe
    WHERE noReparacion = NEW.reparacion;
    UPDATE materiales
    SET stock = stock - NEW.cantidad
    WHERE codigoMaterial = NEW.material;
END$$
/*
    4. Costo de materiales usados por mantenimiento
    Es el costo total de los materiales usados 
    para el mantenimiento.
    Actualiza los materiales de la tabla materiales
*/
CREATE TRIGGER mantenimientoMateriales
AFTER INSERT ON materialesMantenimiento
FOR EACH ROW
BEGIN
    UPDATE mantenimiento
    SET costo = costo + NEW.importe
    WHERE noMantenimiento = NEW.mantenimiento;
    UPDATE materiales
    SET stock = stock - NEW.cantidad
    WHERE codigoMaterial = NEW.material;
END$$
/*
    5 y 6. Verificar stock de materiales antes de permitir una insercion,
    verificacion del estado
    --Mantenimiento
    --Reparacion
*/
CREATE TRIGGER verificacionMaterialMantenimiento
BEFORE INSERT ON materialesMantenimiento
FOR EACH ROW
BEGIN
    DECLARE estadoM VARCHAR(3);
    DECLARE cantDisponible INT;
    DECLARE msg VARCHAR(100);
    SET estadoM = (SELECT estado
                   FROM mantenimiento
                   WHERE noMantenimiento = NEW.mantenimiento);
    IF(estadoM <> 'EPR')
    THEN
        SET msg = 'El mantenimiento ingresado ya fue terminado, no se pueden realizar más cambios';
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = msg;
    ELSE
        SET cantDisponible = (SELECT stock
                              FROM materiales
                              WHERE codigoMaterial = NEW.material);
        IF(cantDisponible < NEW.cantidad)
        THEN
            SET msg = CONCAT('No hay suficiente cantidad del material ',NEW.material,', realice una solicitud de material');
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = msg;
        ELSE
            SET NEW.importe = (SELECT precio
                               FROM materiales
                               WHERE codigoMaterial = NEW.material) * NEW.cantidad;
        END IF;
    END IF;
END$$
CREATE TRIGGER verificacionMaterialReparacion
BEFORE INSERT ON materialesReparacion
FOR EACH ROW
BEGIN
    DECLARE cantDisponible INT;
    DECLARE msg VARCHAR(100);
    SET cantDisponible = (SELECT stock
                          FROM materiales
                          WHERE codigoMaterial = NEW.material);
        IF(cantDisponible < NEW.cantidad)
        THEN
            SET msg = CONCAT('No hay suficiente cantidad del material ',NEW.material,', realice una solicitud de material');
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = msg;
        ELSE
            SET NEW.importe = (SELECT precio
                               FROM materiales
                               WHERE codigoMaterial = NEW.material) * NEW.cantidad;
        END IF;
    END IF;
END$$
/*
    7. Asignacion automatica del estado
    --solicitud de materiales
*/
CREATE TRIGGER estadoSolicitud
BEFORE INSERT ON solicitudMateriales
FOR EACH ROW
BEGIN
    SET NEW.estado = 'ENP';
    SET NEW.costoTotal = 0;
END$$
/*
    8. Calculo del costo total por los materiales que se esta solicitando
*/
CREATE TRIGGER costoTotalSolicitud
AFTER INSERT ON materialSolicitud
FOR EACH ROW
BEGIN
    UPDATE solicitudmateriales
    SET costoTotal = costoTotal + NEW.importe
    WHERE noSolicitud = NEW.solicitud;
END$$
/*
    9. Calculo del importe del material que se esta solicitando
*/
CREATE TRIGGER costoMaterialSolicitud
BEFORE INSERT ON materialSolicitud
FOR EACH ROW
BEGIN
    SET NEW.importe = (SELECT precio
                       FROM materiales
                       WHERE codigoMaterial = NEW.material) * NEW.cantidad;
END$$

/*
    10. Asignar automaticamente al técnico
*/
CREATE TRIGGER asignarTecnico
BEFORE INSERT ON incidencia
FOR EACH ROW
BEGIN
    DECLARE tecnicoA VARCHAR(5);
    SET tecnicoA = (SELECT noTecnico
                    FROM tecnico
                    WHERE especialidad = NEW.principalProblema
                        AND disponibilidad = 'DIS'
                    ORDER BY noIncidenciasA ASC
                    LIMIT 1);
    SET NEW.tecnicoAsignado = tecnicoA;

    UPDATE tecnico
    SET noIncidenciasA = noIncidenciasA + 1,
    disponibilidad = 'ASI'
    WHERE noTecnico = tecnicoA;
END$$
/*
    11. Actulizar los costos del equipo
    --Reparacion
    --Mantenimiento
*/
CREATE TRIGGER actualizarCostosR
AFTER UPDATE ON reparacion
FOR EACH ROW
BEGIN
    DECLARE eq VARCHAR(10);
    SET eq = (SELECT i.equipo
              FROM incidencia AS i
              INNER JOIN mantenimiento AS m ON m.incidencia = i.noIncidencia
              INNER JOIN reparacion AS r ON r.mantenimiento = m.noMantenimiento
              WHERE r.noRepar = OLD.noRepar);
    IF NEW.horaFinal IS NOT NULL THEN
        UPDATE equipo
        SET costo = costo + NEW.costo
        WHERE numeroSerie = eq;
    END IF;
END$$
CREATE TRIGGER actualizarCostosM
AFTER UPDATE ON mantenimiento
FOR EACH ROW
BEGIN
    DECLARE eq VARCHAR(10);
    SET eq = (SELECT i.equipo
              FROM incidencia AS i
              INNER JOIN mantenimiento AS m ON m.incidencia = i.noIncidencia
              WHERE m.noMantenimiento = OLD.noMantenimiento);    
    IF (NEW.estado = 'TER') THEN
        UPDATE equipo
        SET costo = costo + NEW.costo
        WHERE numeroSerie = eq;
    END IF;
END$$
/*
    12. Actualizar el porcentaje de funcionabilidad
    --reparacion
    --mantenimiento
*/
CREATE TRIGGER actualizarTiempoInactivoR
AFTER INSERT ON reparacion
FOR EACH ROW
BEGIN
    UPDATE equipo
    SET tiempoInactivo = tiempoInactivo + NEW.tiempoInactivo
    WHERE numeroSerie = (SELECT equipo 
                         FROM mantenimiento 
                         WHERE noMantenimiento = NEW.mantenimiento);
END$$ 
CREATE TRIGGER actualizarTiempoInactivoM
AFTER INSERT ON mantenimiento
FOR EACH ROW
BEGIN
    UPDATE equipo
    SET tiempoInactivo = tiempoInactivo + NEW.tiempoInactivo
    WHERE numeroSerie = (SELECT equipo 
                         FROM incidencia 
                         WHERE noIncidencia = NEW.incidencia);
END$$

