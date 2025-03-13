CREATE DATABASE biblioteca_bd;

USE biblioteca_bd;

CREATE TABLE biblioteca (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    telefono VARCHAR(20),
    email VARCHAR(80)
);

CREATE TABLE empleados (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_biblioteca INT NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    documento VARCHAR(20),
    telefono VARCHAR(20),
    email VARCHAR(80),
    FOREIGN KEY (id_biblioteca) REFERENCES biblioteca(id)
);

CREATE TABLE inventario (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_biblioteca INT NOT NULL,
    descripcion TEXT,
    FOREIGN KEY (id_biblioteca) REFERENCES biblioteca(id)
);

CREATE TABLE gestionInventario (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_inventario INT NOT NULL,
    descripcion TEXT,
    FOREIGN KEY (id_inventario) REFERENCES inventario(id)
);

CREATE TABLE tipoTransaccion (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_empleado INT NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    descripcion TEXT,
    FOREIGN KEY (id_empleado) REFERENCES empleados(id)
);

CREATE TABLE miembros (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    documento VARCHAR(20),
    telefono VARCHAR(20),
    email VARCHAR(80)
);

CREATE TABLE transacciones (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_miembro INT NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    descripcion TEXT,
    FOREIGN KEY (id_miembro) REFERENCES miembros(id)
);

CREATE TABLE detalleTransaccion (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_transacciones INT NOT NULL,
    id_tipotransaccion INT NOT NULL,
    id_gestioninventario INT NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    descripcion TEXT,
    libros VARCHAR(80),
    cantidad INT,
    FOREIGN KEY (id_transacciones) REFERENCES transacciones(id),
    FOREIGN KEY (id_tipotransaccion) REFERENCES tipoTransaccion(id),
    FOREIGN KEY (id_gestioninventario) REFERENCES gestionInventario(id)
);

CREATE TABLE libros (
    isbn VARCHAR(20) PRIMARY KEY,
    id_inventario INT NOT NULL,
    titulo VARCHAR(50) NOT NULL,
    genero VARCHAR(20) NOT NULL,
    cantidad INT NOT NULL,
    descripcion TEXT,
    FOREIGN KEY (id_inventario) REFERENCES inventario(id)
);

CREATE TABLE editorial (
    id INT PRIMARY KEY AUTO_INCREMENT, 
    nombre VARCHAR(50) NOT NULL,
    telefono VARCHAR(20),
    email VARCHAR(80)
);

CREATE TABLE ediciones (
    id INT PRIMARY KEY AUTO_INCREMENT,
    isbn_libro  VARCHAR(20) NOT NULL,
    id_editorial INT NOT NULL,
    fecha DATE,
    descripcion TEXT,
    FOREIGN KEY (isbn_libro) REFERENCES libros(isbn),
    FOREIGN KEY (id_editorial) REFERENCES editorial(id)
);

CREATE TABLE autores (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_editorial INT NOT NULL, 
    nombre VARCHAR(50) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    email VARCHAR(80) NOT NULL,
    FOREIGN KEY (id_editorial) REFERENCES editorial(id)
);

CREATE TABLE libroAutor (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_autores INT NOT NULL,
    isbn_libro VARCHAR(20) NOT NULL,
    FOREIGN KEY (isbn_libro) REFERENCES libros(isbn),
    FOREIGN KEY (id_autores) REFERENCES autores(id)
);

