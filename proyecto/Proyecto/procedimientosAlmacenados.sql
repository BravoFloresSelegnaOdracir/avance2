-- SQLBook: Code
DELIMITER $$
/*
    1. Insertar datos a la tabla Incidencias
*/
CREATE PROCEDURE insertarIncidencias(
    IN descri VARCHAR(500),
    IN problema VARCHAR(3),
    IN pri VARCHAR(3),
    IN equ VARCHAR(10)
)
BEGIN
    INSERT INTO incidencia(descripcion, principalProblema, prioridad, equipo)
    VALUES
        (descri, problema, pri, equ);
END$$
CALL insertarIncidencias("Ruido anómalo en el motor principal.", "MEC", "ALT", "EF7890GH12");
/*
    2. Insertar datos a la tabla de Mantenimiento
*/
CREATE PROCEDURE insertarMantenimiento(
    IN descri VARCHAR(500),
    IN tipo VARCHAR(3),
    IN incide INT
)
BEGIN
    INSERT INTO mantenimiento(descripcion, tipoMantenimiento, incidencia)
    VALUES
        (descri, tipo, incide);
END$$
CALL insertarMantenimiento("Mantenimiento correctivo de motor", "COR", 2);
/*
    3. Finalizar un mantenimiento
*/
CREATE PROCEDURE finalizarMantenimiento(
    IN mante INT,
    IN tiempoInc DECIMAL(10, 2),
    IN est VARCHAR(3)
)
BEGIN
    UPDATE mantenimiento
    SET tiempoInactivo = tiempoInc,
        estado = est
    WHERE noMantenimiento = mante;
END$$
CALL finalizarMantenimiento(2, 2.6, 'TER');
/*
    4. Insertar datos a la tabla reparación
*/
DROP PROCEDURE insertarReparacion;
CREATE PROCEDURE insertarReparacion(
    IN hInicio TIMESTAMP,
    IN hFinal DATETIME,
    IN descr TEXT,
    IN mant INT
)
BEGIN
    DECLARE tInactivo DECIMAL(5, 2);
    SET tInactivo = TIMESTAMPDIFF(HOUR, hInicio, hFinal);

    INSERT INTO reparacion(horaInicio, horaFinal, tiempoInactivo, descripcion, mantenimiento)
    VALUES (hInicio, hFinal, tInactivo, descr, mant);
END$$
CALL insertarReparacion('2024-10-24 08:00:00', '2024-10-24 12:00:00', 'Cambio de los filtros', 3);
/*
    5. Insertar datos a la tabla reporteEquipo
*/
CREATE PROCEDURE insertarReporte(
    IN rep TEXT,
    IN eq VARCHAR(10),
    IN tipo VARCHAR(4),
    IN ger VARCHAR(5)
)
BEGIN
    INSERT INTO reporteequipo(reporte, equipo, tipoReporte, gerente)
    VALUES (rep, eq, tipo, ger);
END$$
CALL insertarReporte ('Revisión de mantenimiento completo.', 'MANT', 'G001');
/*
    6. Insertar datos a la tabla de equipo
*/
CREATE PROCEDURE insertarEquipo(
    IN nSerie VARCHAR(10),
    IN nom VARCHAR(50),
    IN fechaC DATE,
    IN precioC DECIMAL(10, 2),
    IN mode VARCHAR(3),
    IN mar VARCHAR(4),
    IN estadoE VARCHAR(4),
    IN ar VARCHAR(4)
)
BEGIN
    INSERT INTO equipo(numeroSerie, nombre, fechaCompra, precioCompra, modelo, marca, estadoEquipo, area)
    VALUES (nSerie, nom, fechaC, precioC, mode, mar, estadoE, ar);
END$$
/*
    7. Búsqueda de las áres en las que se puede encontrar un equipo
*/
CREATE PROCEDURE verMarcas()
BEGIN
    SELECT * FROM marca;
END$$
CALL verMarcas();
/*
    8. Búsqueda de las marcas que puede tener un equipo
*/
/*CREATE PROCEDURE verMarcas
/*
    9. Búsqueda de los modelos de una marca específica
*/
/*CREATE PROCEDURE verModeloXMarca
/*
    10. Seleccionar un empleado en base a su número de empleado y contraseña
*/
CREATE PROCEDURE datosInicioSesion(
    IN pas VARCHAR(255),
    IN numE INT,
    OUT nom VARCHAR(70),
    OUT tipo VARCHAR(3)
)
BEGIN
    DECLARE msg VARCHAR(100);
    IF EXISTS (
        SELECT 1
        FROM empleado
        WHERE noEmpleado = numE AND password = SHA2(pas, 256)  -- Verificación con hash
    ) THEN
        SET tipo = (SELECT tipoEmpleado
                    FROM empleado
                    WHERE noEmpleado = numE);
        SET nom = (SELECT CONCAT(nombre, ' ', apellidoP, ' ', apellidoM)
                   FROM empleado
                   WHERE noEmpleado = numE);
        SET msg = CONCAT('Welcome ', nom);
    ELSE
        SET msg = "Employee number or password incorrect, check login information";
    END IF;    
    SELECT msg AS mensaje;
END$$

CALL datosInicioSesion('tatwd.AZA456', 100, @nom, @tipo);
UPDATE empleado
SET password = SHA2('tatwd.AZA456', 256)
WHERE noEmpleado = 100;

/*
    11. Insertar datos a la tabla empleados
*/
CREATE PROCEDURE insertarEmpleado(
    IN nom VARCHAR(35),
    IN apeP VARCHAR(20),
    IN apeM VARCHAR(20),
    IN fo VARCHAR(128),
    IN pas VARCHAR(255),
    IN em VARCHAR(50),
    IN noTe VARCHAR(10),
    IN tiEm VARCHAR(3)
)
BEGIN
    INSERT INTO empleado (nombre, apellidoP, apellidoM, foto, password, email, noTelefono, tipoEmpleado) 
    VALUES (nom, apeP, apeM, fo, pas, em, noTe, tiEm);
END$$