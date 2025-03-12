CREATE DATABASE biblioteca_bd;

USE biblioteca_bd;

CREATE TABLE biblioteca (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50),
    telefono VARCHAR(20),
    email VARCHAR(80)
);

CREATE TABLE empleados (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_biblioteca INT,
    nombre VARCHAR(50),
    documento VARCHAR(20),
    telefono VARCHAR(20),
    email VARCHAR(80),
    FOREIGN KEY (id_biblioteca) REFERENCES biblioteca(id)
);

CREATE TABLE inventario (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_biblioteca INT,
    descripcion TEXT,
    cantidad_libros INT,
    FOREIGN KEY (id_biblioteca) REFERENCES biblioteca(id)
);

CREATE TABLE gestionInventario (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_inventario INT,
    descripcion TEXT,
    FOREIGN KEY (id_inventario) REFERENCES inventario(id)
);

CREATE TABLE tipoTransaccion (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_empleado INT,
    tipo VARCHAR(50),
    descripcion TEXT,
    FOREIGN KEY (id_empleado) REFERENCES empleados(id)
);

CREATE TABLE miembros (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50),
    documento VARCHAR(20),
    telefono VARCHAR(20),
    email VARCHAR(80)
);

CREATE TABLE transacciones (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_miembro INT,
    nombre VARCHAR(50),
    descripcion TEXT,
    libros VARCHAR(80),
    cantidad INT,
    FOREIGN KEY (id_miembro) REFERENCES miembros(id)
);

CREATE TABLE detalleTransaccion (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_transacciones INT,
    id_tipotransaccion INT,
    id_gestioninventario INT,
    nombre VARCHAR(50),
    descripcion TEXT,
    libros VARCHAR(80),
    cantidad INT,
    FOREIGN KEY (id_transacciones) REFERENCES transacciones(id),
    FOREIGN KEY (id_tipotransaccion) REFERENCES tipoTransaccion(id),
    FOREIGN KEY (id_gestioninventario) REFERENCES gestionInventario(id)
);

CREATE TABLE libros (
    isbn VARCHAR(20) PRIMARY KEY,
    id_inventario INT,
    titulo VARCHAR(50),
    genero VARCHAR(20),
    disponibilidad BOOLEAN,
    cantidad INT,
    descripcion TEXT,
    FOREIGN KEY (id_inventario) REFERENCES inventario(id)
);

CREATE TABLE ediciones (
    id INT PRIMARY KEY AUTO_INCREMENT,
    isbn_libro  VARCHAR(20),
    titulo VARCHAR(50),
    genero VARCHAR(20),
    disponibilidad BOOLEAN,
    cantidad INT,
    descripcion TEXT,
    FOREIGN KEY (id_inventario) REFERENCES inventario(id)
);