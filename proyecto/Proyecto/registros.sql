-- Active: 1725388423808@@127.0.0.1@3306@mantenimientoequipo
INSERT INTO area(clave, nombre, ubicacion, descripcion) VALUES
('ESTP', 'Estampado', 'Edificio A, Piso 1, Sector 3', 'Moldeado de piezas metálicas para la carrocería.'),
('CARR', 'Carrocería', 'Edificio B, Piso 2, Sector 5', 'Ensamblaje de las partes de la carrocería del vehículo.'),
('PINT', 'Pintura', 'Edificio C, Piso 3, Sector 2', 'Aplicación de pintura protectora y decorativa.'),
('MONT', 'Montaje', 'Edificio D, Piso 3, Sector 1', 'Instalación de motor, transmisión y otros componentes.'),
('PLMT', 'Planta de Motores', 'Edificio E, Piso 1, Sector 2', 'Fabricación y ensamblaje de motores.'),
('TRNS', 'Transmisión', 'Edificio F, Piso 3, Sector 5', 'Ensamblaje de sistemas de transmisión.'),
('CHAS', 'Chasis', 'Edificio G, Piso 1, Sector 4', 'Montaje de la estructura base del vehículo.');
INSERT INTO estadoEquipo (codigo, descripcion) VALUES
('ACTV', 'El equipo está en funcionamiento.'),
('INAC', 'El equipo está fuera de operación por incidente.'),
('BAJA', 'El equipo ha sido retirado de la maquiladora.');
INSERT INTO tipoModelo (codigoTE, nombre, descripcion) VALUES
('PRSE', 'Prensa hidráulica', 'Equipo utilizado para moldear y ensamblar componentes metálicos.'),
('SLDW', 'Soldadora automática', 'Máquina que realiza soldaduras precisas en piezas de metal.'),
('PNTM', 'Máquina de pintura', 'Dispositivo que aplica pintura a las carrocerías de vehículos.'),
('CNCN', 'Máquina CNC', 'Equipo de control numérico computarizado utilizado para corte y fresado.'),
('ASMB', 'Línea de ensamblaje', 'Sistema automatizado para ensamblar diferentes partes del vehículo.'),
('WRBT', 'Robot de soldadura', 'Brazo robótico que realiza soldaduras automatizadas en diversas áreas.'),
('FRNM', 'Máquina de frenado', 'Equipo que verifica y ajusta los sistemas de frenos en vehículos.'),
('CLTP', 'Plataforma elevadora', 'Máquina usada para levantar y mover grandes piezas o vehículos dentro de la planta.'),
('ENGT', 'Probador de motores', 'Equipo utilizado para evaluar el rendimiento de los motores fabricados.'),
('DRPT', 'Banco de pruebas de transmisión', 'Equipo utilizado para probar el rendimiento y calidad de las transmisiones.'),
('STML', 'Sistema de moldeo de plásticos', 'Máquina que crea partes plásticas para el interior y exterior del vehículo.'),
('BTRY', 'Probador de baterías', 'Dispositivo para verificar la capacidad y el estado de las baterías del vehículo.'),
('RGWH', 'Robot de montaje de ruedas', 'Sistema robótico encargado de montar y ajustar las ruedas en el vehículo.'),
('PHLT', 'Plataforma de control de calidad', 'Equipo utilizado para verificar la alineación y la calidad del ensamblaje.'),
('LSRM', 'Máquina de corte láser', 'Utilizada para cortar piezas metálicas con gran precisión mediante láser.'),
('CHRG', 'Cargador de vehículos eléctricos', 'Dispositivo para cargar vehículos eléctricos durante las pruebas de calidad.');
INSERT INTO marca (codigoMarca, nombre) VALUES
('CAT', 'Caterpillar'),
('FAN', 'Fanuc'),
('ABB', 'ABB Robotics'),
('KOM', 'Komatsu'),
('HAA', 'Haas Automation'),
('YAS', 'Yaskawa Electric'),
('KUK', 'KUKA Robotics');
INSERT INTO modelo (codigoModelo, nombre, vidaUtilEstimada, marca, tipo) VALUES
('PR1', 'Prensa', 15, 'CAT', 'PRSE'), -- Prensa hidráulica
('RBT', 'Robot', 10, 'FAN', 'WRBT'), -- Robot de soldadura
('CNT', 'Centrado', 12, 'ABB', 'CNCN'), -- Máquina CNC
('HRN', 'Herramienta de Radio', 8, 'KOM', 'CNCN'), -- Máquina CNC
('CNC', 'Control Numérico', 10, 'HAA', 'CNCN'), -- Máquina CNC
('TRN', 'Torno', 15, 'YAS', 'CNCN'), -- Máquina CNC
('INJ', 'Inyector', 12, 'KUK', 'STML'), -- Sistema de moldeo de plásticos
('CPR', 'Compresora', 10, 'CAT', 'CLTP'), -- Plataforma elevadora
('PLS', 'Planchadora', 14, 'ABB', 'STML'), -- Sistema de moldeo de plásticos
('TLD', 'Taladro', 10, 'CAT', 'CNCN'), -- Máquina CNC
('LAS', 'Láser', 8, 'HAA', 'LSRM'), -- Máquina de corte láser
('EHV', 'Elevador Hidráulico', 15, 'KOM', 'CLTP'), -- Plataforma elevadora
('SLD', 'Soldadora', 12, 'CAT', 'SLDW'), -- Soldadora automática
('BAL', 'Balanceadora', 9, 'YAS', 'FRNM'); -- Máquina de frenado
INSERT INTO prioridad (codigo, descripcion) VALUES
('ALT', 'alta'),
('MED', 'media'),
('BAJ', 'baja');
INSERT INTO estadoIncidencia (codigo, descripcion) VALUES
('EPR', 'en proceso'),
('TER', 'terminado');
INSERT INTO tipoMantenimiento (codMante, descripcion) VALUES
('COR', 'correctivo'),
('PRE', 'preventivo');
INSERT INTO estadoMantenimiento (codigo, descripcion) VALUES
('EPR', 'en proceso'),
('TER', 'terminado');
INSERT INTO materiales (codigoMaterial, nombre, stock, precio) VALUES
('MAT01', 'Tornillo de acero inoxidable', 500, 1.5),
('MAT02', 'Cable de alimentación de 5m', 300, 15.75),
('MAT03', 'Filtro de aire', 150, 12),
('MAT04', 'Aceite lubricante', 200, 8.5),
('MAT05', 'Junta de goma resistente', 100, 3.2),
('MAT06', 'Soldadura de estaño', 250, 5),
('MAT07', 'Correa de transmisión industrial', 75, 20),
('MAT08', 'Filtro de agua de alta presión', 60, 22.5),
('MAT09', 'Cinta aislante profesional', 400, 2.5),
('MAT10', 'Fusible de 10A', 350, 0.75);
INSERT INTO estadoSolicitud (codigo, descripcion) VALUES
('ENP', 'en proceso'),
('APR', 'aprobado'),
('DEN', 'denegado');
INSERT INTO tipoEmpleado (codigo, descripcion) VALUES
('GER', 'Gerente'),
('TEC', 'Técnico'),
('OPE', 'Operador'),
('DBA', 'Dado de baja');
INSERT INTO tipoReporte (codigo, descripcion) VALUES
('MANT', 'mantenimiento'),
('REPR', 'reparacion'),
('INCI', 'incidencia'),
('GNRL', 'general');
INSERT INTO especialidad (codigo, descripcion) VALUES
('MEC', 'Mecanica'),
('ELE', 'Electrica'),
('MTO', 'Mantenimiento');
INSERT INTO turnoLaboral (claveTurno, nombre, horaInicio, horaFin) VALUES
('MAT', 'matutino', 6, 14),
('VES', 'vespertino', 22, 6),
('MIX', 'mixto', 12, 20);
INSERT INTO disponibilidad (codigo, descripcion) VALUES
('DIS', 'disponible'),
('ASI', 'asignado');
INSERT INTO empleado (noEmpleado, nombre, apellidoP, apellidoM, email, noTelefono, tipoEmpleado) VALUES
(100, 'Juan', 'Pérez', 'Gómez', 'juan.perez@outlook.com', '5551234567', 'OPE'),
(101, 'María', 'López', 'Fernández', 'maria.lopez@outlook.com', '5552345678', 'TEC'),
(102, 'Carlos', 'García', 'Hernández', 'carlos.garcia@outlook.com', '5553456789', 'GER'),
(103, 'Ana', 'Torres', 'Martínez', 'ana.torres@outlook.com', '5554567890', 'OPE'),
(104, 'Luis', 'Sánchez', 'Reyes', 'luis.sanchez@outlook.com', '5555678901', 'TEC'),
(105, 'Elena', 'Romero', 'Ruiz', 'elena.romero@outlook.com', '5556789012', 'GER'),
(106, 'Sergio', 'Jiménez', 'Díaz', 'sergio.jimenez@outlook.com', '5557890123', 'OPE'),
(107, 'Patricia', 'Castro', 'Salazar', 'patricia.castro@outlook.com', '5558901234', 'TEC'),
(108, 'Roberto', 'Mendoza', 'Vega', 'roberto.mendoza@outlook.com', '5559012345', 'GER'),
(109, 'Gabriela', 'Rojas', 'Morales', 'gabriela.rojas@outlook.com', '5550123456', 'OPE'),
(110, 'David', 'Paredes', 'León', 'david.paredes@outlook.com', '5551234568', 'TEC'),
(111, 'Sofía', 'Muñoz', 'Ortiz', 'sofia.munoz@outlook.com', '5552345679', 'GER'),
(112, 'Miguel', 'Cordero', 'Guzmán', 'miguel.cordero@outlook.com', '5553456780', 'OPE'),
(113, 'Teresa', 'Serrano', 'Morales', 'teresa.serrano@outlook.com', '5554567891', 'TEC'),
(114, 'Fernando', 'Nunez', 'Castro', 'fernando.nunez@outlook.com', '5555678902', 'GER');
INSERT INTO gerente (noGerente, nombre, apellidoPat, apellidoMat, noEmpleado) VALUES
('G001', 'Carlos', 'García', 'Hernández', 102),
('G002', 'Elena', 'Romero', 'Ruiz', 105),
('G003', 'Roberto', 'Mendoza', 'Vega', 108),
('G004', 'Sofía', 'Muñoz', 'Ortiz', 111),
('G005', 'Fernando', 'Nunez', 'Castro', 114);
INSERT INTO tecnico (noTecnico, noIncidenciasA, disponibilidad, especialidad, noEmpleado, turnoLaboral) VALUES
('T001', 5, 'DIS', 'MEC', 101, 'MAT'),
('T002', 3, 'DIS', 'ELE', 104, 'VES'),
('T003', 8, 'DIS', 'MTO', 107, 'MIX'),
('T004', 6, 'DIS', 'ELE', 110, 'MAT'),
('T005', 4, 'DIS', 'MEC', 113, 'VES');
INSERT INTO equipo (numeroSerie, nombre, fechaCompra, tiempoInactivo, tiempoOperativo, funcionalidad, precioCompra, costo, modelo, marca, estadoEquipo, area) VALUES
('AB1234CD56', 'Prensa Hidráulica', '2020-03-15', 120.5, 5800, NULL, 150000.00, NULL, 'PR1', 'YAS', 'ACTV', 'ESTP'),
('EF7890GH12', 'Robot Soldador', '2019-07-10', 75, 4000, NULL, 85000.00, NULL, 'RBT', 'FAN', 'ACTV', 'CARR'),
('IJ3456KL78', 'Cinta Transportadora', '2018-11-05', 45, 7600, NULL, 30000.00, NULL, 'CNT', 'KOM', 'ACTV', 'MONT'),
('MN9012OP34', 'Horno de Pintura', '2021-01-20', 160, 6400, NULL, 120000.00, NULL, 'HRN', 'ABB', 'ACTV', 'PINT'),
('QR5678ST90', 'Robot Ensamblador', '2022-08-08', 50, 3200, NULL, 100000.00, NULL, 'RBT', 'KUK', 'ACTV', 'ESTP'),
('UV1234WX56', 'Fresadora CNC', '2017-06-12', 200, 8500, NULL, 75000.00, NULL, 'CNC', 'HAA', 'ACTV', 'CHAS'),
('YZ7890AB12', 'Torno Automático', '2018-09-22', 100, 8900, NULL, 50000.00, NULL, 'TRN', 'YAS', 'ACTV', 'PLMT'),
('CD3456EF78', 'Máquina de Inyección', '2020-04-18', 140, 6700, NULL, 130000.00, NULL, 'INJ', 'HAA', 'ACTV', 'TRNS'),
('GH9012IJ34', 'Compresor de Aire', '2019-05-30', 50, 4500, NULL, 25000.00, NULL, 'CPR', 'ABB', 'ACTV', 'CHAS'),
('KL5678MN90', 'Pulidora de Suelos', '2021-12-01', 20, 500, NULL, 5500.00, NULL, 'PLS', 'KOM', 'ACTV', 'PINT'),
('OP1234QR56', 'Taladro Industrial', '2017-02-14', 300, 9500, NULL, 45000.00, NULL, 'TLD', 'CAT', 'ACTV', 'CARR'),
('ST7890UV12', 'Robot de Pintura', '2019-03-25', 150, 7200, NULL, 110000.00, NULL, 'RBT', 'ABB', 'ACTV', 'PINT'),
('WX3456YZ78', 'Máquina de Corte Láser', '2022-05-14', 10, 2000, NULL, 95000.00, NULL, 'LAS', 'CAT', 'ACTV', 'ESTP'),
('AB9012CD34', 'Elevador Hidráulico', '2016-10-05', 500, 15000, NULL, 15000.00, NULL, 'EHV', 'KUK', 'ACTV', 'CARR'),
('EF5678GH90', 'Máquina de Soldadura', '2020-06-22', 130, 5100, NULL, 95000.00, NULL, 'SLD', 'YAS', 'ACTV', 'CARR'),
('IJ1234KL56', 'Máquina de Balanceo', '2018-08-30', 100, 7800, NULL, 80000.00, NULL, 'BAL', 'HAA', 'ACTV', 'CHAS');