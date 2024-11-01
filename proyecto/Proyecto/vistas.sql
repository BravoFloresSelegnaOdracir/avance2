/*
    1. Equipos por área
*/
CREATE VIEW equiposPorArea AS
SELECT a.clave AS claveArea,
a.nombre AS nombreArea,
a.descripcion AS descripcionArea,
e.numeroSerie AS NumeroSerieEquipo,
e.nombre AS nombreEquipo,
e.fechaCompra AS fechaCompraEquipo,
e.tiempoInactivo AS tiempoInactivoEquipo,
e.tiempoOperativo AS tiempoOperativoEquipo,
e.funcionalidad AS funcionalidadEquipo,
e.precioCompra AS precioAdquidoEquipo,
e.costo AS costoActualEquipo,
mo.nombre AS modeloEquipo,
ma.nombre AS marcaEquipo,
ee.descripcion AS estadoEquipo
FROM area AS a
INNER JOIN equipo AS e ON e.area = a.clave
INNER JOIN modelo AS mo ON e.modelo = mo.codigoModelo
INNER JOIN marca AS ma ON e.marca = ma.codigoMarca
INNER JOIN estadoEquipo AS ee ON e.estadoEquipo = ee.codigo;
SELECT nombreArea, nombreEquipo
FROM equiposPorArea
WHERE claveArea="MONT";
/*
    2. Modelos por Marca
*/
CREATE VIEW vw_marcaModelo AS
SELECT ma.codigoMarca AS codMarca,
ma.nombre AS Marca,
mode.codigoModelo AS codModelo,
mode.nombre AS modelo,
mode.vidaUtilEstimada AS vidaUtil,
te.nombre AS tipoEquipo
FROM marca AS ma
INNER JOIN modelo AS mode ON mode.marca = ma.codigoMarca
INNER JOIN tipoequipo AS te ON mode.tipoEquipo = te.codigoTE;
SELECT *
FROM vw_marcamodelo
WHERE codMarca="ABB";