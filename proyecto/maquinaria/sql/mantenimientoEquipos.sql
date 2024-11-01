-- SQLBook: Code
-- Active: 1729180487890@@127.0.0.1@3306@phpmyadmin
CREATE DATABASE mantenimientoEquipo;

create table area(
    clave varchar(4) PRIMARY KEY,
    nombre varchar(50) not null,
    ubicacion varchar(200) not null,
    descripcion varchar(100)
);
create table equipo(
numeroSerie varchar(10) PRIMARY KEY,
    nombre varchar(50) not null,
    fechaCompra date not null,
    tiempoInactivo decimal(10, 2),
    tiempoOperativo decimal(10, 2),
    funcionalidad decimal(5, 2) AS ((tiempoOperativo / (tiempoOperativo + tiempoInactivo)) * 100) STORED,
    precioCompra decimal(10, 2),
    costo decimal(10, 2),
    modelo varchar(3),
    marca varchar(3),
    estadoEquipo varchar(4),
    area varchar(4),
    foreign key (modelo) references modelo(codigoModelo),
    foreign key (marca) references marca(codigoMarca),
    foreign key (estadoEquipo) references estadoEquipo(codigo),
    foreign key (area) references area(clave)
);
create table estadoEquipo(
    codigo varchar(4) PRIMARY KEY,
    descripcion varchar(35) not null
);
create table tipoEquipo(
    codigoTE varchar(4) PRIMARY KEY,
    nombre varchar (30) not null,
    descripcion varchar(80) not null
);
create table marca(
    codigoMarca varchar(3) PRIMARY KEY,
    nombre varchar(50) not null 
);
create table modelo(
    codigoModelo varchar(3) primary key,
    nombre varchar(30) not null,
    vidaUtilEstimada decimal(2,2) not null,
    marca VARCHAR(3),
    Foreign Key (marca) REFERENCES marca(codigoMarca),
    tipoEquipo VARCHAR(4),
    Foreign Key (tipoEquipo) REFERENCES tipoEquipo(codigoTE)
);
CREATE table incidencia(
    noIncidencia INT PRIMARY KEY AUTO_INCREMENT,
    descripcion VARCHAR(500) NOT NULL,
    fechaInicio DATE DEFAULT CURRENT_TIMESTAMP,
    fechaCierre DATE,
    prioridad VARCHAR(3),
    Foreign Key (prioridad) REFERENCES prioridad(codigo),
    equipo VARCHAR(10),
    Foreign Key (equipo) REFERENCES equipo(numeroSerie),
    tecnicoAsignado VARCHAR(5),
    Foreign Key (tecnicoAsignado) REFERENCES tecnico(noTecnico),
    estado VARCHAR(3),
    Foreign Key (estado) REFERENCES estadoIncidencia(codigo)
);
create table prioridad(
    codigo varchar(3) PRIMARY KEY,
    descripcion varchar(10) not null
);
CREATE TABLE estadoIncidencia(
    codigo varchar(3) PRIMARY KEY,
    decripcion varchar(20) not null
);
CREATE TABLE mantenimiento(
    noMantenimiento INT PRIMARY KEY AUTO_INCREMENT,
    fechaProgramada DATETIME,
    descripcion VARCHAR(500) NOT NULL,
    costo DECIMAL(5, 2),
    tipoMantenimiento VARCHAR(3),
    Foreign Key (tipoMantenimiento) REFERENCES tipoMantenimiento(codMante),
    estado VARCHAR(3),
    Foreign Key (estado) REFERENCES estadoMantenimiento(codigo),
    incidencia INT,
    Foreign Key (incidencia) REFERENCES incidencia(noIncidencia)
);
CREATE TABLE tipoMantenimiento(
    codMante VARCHAR(3) PRIMARY KEY,
    descripcion VARCHAR(15) NOT NULL UNIQUE
);
CREATE TABLE estadoMantenimiento(
    codigo VARCHAR(3) PRIMARY KEY,
    descripcion VARCHAR(10) NOT NULL
);
CREATE TABLE reparacion(
    noRepar INT PRIMARY KEY AUTO_INCREMENT,
    horaInicio TIMESTAMP NOT NULL,
    horaFinal DATETIME NOT NULL,
    tiempoInactivo DECIMAL(5, 2),
    descripcion TEXT,
    costo DECIMAL(5, 2),
    mantenimiento INT,
    Foreign Key (mantenimiento) REFERENCES mantenimiento(noMantenimiento)
);
create table materiales(
    codigoMaterial VARCHAR(5) PRIMARY KEY,
    nombre varchar(60) not null,
    stock INT,
    precio INT NOT NULL
);
create table materialesReparacion(
    material VARCHAR(5),
    reparacion INT,
    cantidad INT NOT NULL,
    importe DECIMAL(5, 2) NOT NULL,
    Foreign Key (material) REFERENCES materiales(codigoMaterial),
    Foreign Key (reparacion) REFERENCES reparacion(noReparacion)
);
create table materialesMantenimiento(
    mantenimiento INT,
    material VARCHAR(5),
    cantidad INT NOT NULL,
    importe DECIMAL(5, 2) NOT NULL
    Foreign Key (mantenimiento) REFERENCES mantenimiento(noMantenimiento),
    Foreign Key (material) REFERENCES materiales(codigoMaterial)
);
create table solicitudMateriales(
    noSolicitud INT PRIMARY KEY AUTO_INCREMENT,
    fechaSolicitud DATE DEFAULT CURRENT_TIMESTAMP,
    fechaEntrega DATE,
    costoTotal DECIMAL(5, 2),
    estado VARCHAR(3),
    Foreign Key (estado) REFERENCES estadoSolicitud(codigo),
    gerente VARCHAR(5),
    Foreign Key (gerente) REFERENCES gerente(noGerente),
    equipo VARCHAR(10),
    Foreign Key (equipo) REFERENCES equipo(numeroSerie)
);
create table estadoSolicitud(
    codigo VARCHAR(3) PRIMARY KEY,
    descripcion VARCHAR(10) NOT NULL
);
create table materialSolicitud(
    material VARCHAR(5),
    solicitud INT,
    cantidad INT NOT NULL,
    importe DECIMAL(5, 2),
    Foreign Key (material) REFERENCES materiales(codigoMaterial),
    Foreign Key (solicitud) REFERENCES solicitudMateriales(noSolicitud)
);
CREATE TABLE empleado(
    noEmpleado INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(35) NOT NULL,
    apellidoP VARCHAR(20) NOT NULL,
    apellidoM VARCHAR(20) NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(50),
    noTelefono VARCHAR(10),
    tipoEmpleado VARCHAR(3),
    Foreign Key (tipoEmpleado) REFERENCES tipoEmpleado(codigo)
);
ALTER TABLE empleado AUTO_INCREMENT = 100;

CREATE TABLE tipoEmpleado(
    codigo VARCHAR(3) PRIMARY KEY,
    descripcion VARCHAR(10) NOT NULL
);
CREATE TABLE gerente(
    noGerente VARCHAR(5) PRIMARY KEY,
    nombre VARCHAR(35) NOT NULL,
    apellidoPat VARCHAR(20) NOT NULL,
    apellidoMat VARCHAR(20) not NULL,
    noEmpleado INT,
    Foreign Key (noEmpleado) REFERENCES empleado(noEmpleado)
);
CREATE Table reporteEquipo(
    numeroReporte INT PRIMARY KEY AUTO_INCREMENT,
    reporte TEXT NOT NULL,
    fecha DATE DEFAULT CURRENT_TIMESTAMP,
    tipoReporte VARCHAR(4),
    Foreign Key (tipoReporte) REFERENCES tipoReporte(codigo),
    gerente VARCHAR(5),
    Foreign Key (gerente) REFERENCES gerente(noGerente)
);
CREATE TABLE tipoReporte(
    codigo VARCHAR(4) PRIMARY KEY,
    descripcion VARCHAR(20) NOT NULL
);
CREATE Table tecnico(
    noTecnico VARCHAR(5) PRIMARY KEY,
    noIncidenciasA INT,
    disponibilidad VARCHAR(3),
    especialidad VARCHAR(3),
    noEmpleado INT,
    turnoLaboral VARCHAR(3),
    Foreign Key (disponibilidad) REFERENCES disponibilidad(codigo),
    Foreign Key (especialidad) REFERENCES especialidad(codigo),
    Foreign Key (noEmpleado) REFERENCES empleado(noEmpleado),
    Foreign Key (turnoLaboral) REFERENCES turnoLaboral(claveTurno)
);
CREATE TABLE especialidad(
    codigo VARCHAR(3) PRIMARY KEY,
    descripcion VARCHAR(50) not NULL
);
CREATE TABLE turnoLaboral(
    claveTurno VARCHAR(3) PRIMARY KEY,
    nombre VARCHAR(25) NOT NULL,
    horaInicio INT NOT NULL,
    horaFin INT NOT NULL
);
CREATE TABLE disponibilidad(
    codigo VARCHAR(3) PRIMARY KEY,
    descripcion VARCHAR(15) NOT NULL
);

CREATE TABLE notificacionIncidencia(
    numero int PRIMARY KEY,
    numTecnico VARCHAR(5),
    numIncidencia int,
    
);

