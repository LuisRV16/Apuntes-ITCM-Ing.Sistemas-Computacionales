CREATE SCHEMA pubs;

USE pubs;

CREATE TABLE empleados(
	dni VARCHAR(20) PRIMARY KEY,
    nombre VARCHAR(40) NOT NULL,
    domicilio VARCHAR(50)
);

CREATE TABLE localidad(
	cod INT PRIMARY KEY,
    nombre VARCHAR(40) NOT NULL
);

CREATE TABLE pub(
	cod VARCHAR(10) PRIMARY KEY,
    nombre VARCHAR(40) NOT NULL,
    licencia_fiscal VARCHAR(30) NOT NULL,
    domicilio VARCHAR(50),
    fecha_apertura DATE NOT NULL,
    horario ENUM('HOR1', 'HOR2', 'HOR3') NOT NULL,
    cod_localidad INT,
    FOREIGN KEY(cod_localidad) REFERENCES localidad(cod)
);

CREATE TABLE titular(
	dni VARCHAR(20) PRIMARY KEY,
    nombre VARCHAR(40) NOT NULL,
    domicilio VARCHAR(50),
    cod_pub VARCHAR(10),
    FOREIGN KEY (cod_pub) REFERENCES pub(cod)
);

CREATE TABLE existencias(
	cod VARCHAR(10) PRIMARY KEY,
    nombre VARCHAR(40) NOT NULL,
    cantidad FLOAT NOT NULL,
    precio FLOAT NOT NULL CHECK (precio > 0),
    cod_pub VARCHAR(10),
    FOREIGN KEY (cod_pub) REFERENCES pub(cod)
);

CREATE TABLE pub_empleado(
	cod_pub VARCHAR(10) NOT NULL,
    dni_empleado VARCHAR(10) NOT NULL,
    funcion ENUM('CAMARERO', 'SEGURIDAD', 'LIMPIEZA') NOT NULL,
    PRIMARY KEY (cod_pub, dni_empleado, funcion),
    FOREIGN KEY (cod_pub) REFERENCES pub(cod),
    FOREIGN KEY (dni_empleado) REFERENCES empleados(dni)
);