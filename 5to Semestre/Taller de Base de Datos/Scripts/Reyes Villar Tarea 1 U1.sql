CREATE SCHEMA gestion_de_ventas;

USE gestion_de_ventas;

CREATE TABLE espectadores(
	dniCliente VARCHAR(20) PRIMARY KEY,
    nombre VARCHAR(40) NOT NULL,
    direccion VARCHAR(50),
    telefono INT NOT NULL,
    ciudad VARCHAR(25),
    nTarjeta VARCHAR(16) NOT NULL CHECK(
		LENGTH(nTarjeta) = 16 AND nTarjeta REGEXP '^[0-9]+$'
	)
    -- El check verifica que el numero de tarjeta sea forzosamente de 16 dígitos y que los digitos introducidos sean numericos
);

CREATE TABLE recintos(
	cod INT PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL,
    direccion VARCHAR(50) NOT NULL,
    ciudad VARCHAR(20) NOT NULL,
    telefono INT NOT NULL,
    horario ENUM ('1','2','3')
);

CREATE TABLE espectaculos(
	cod INT PRIMARY KEY,
    nombre VARCHAR(20),
    tipo ENUM ('1', '2', '3') NOT NULL,
    fechaInicial DATE NOT NULL,
    fechaFinal DATE NOT NULL,
    interprete VARCHAR(20),
    codRecinto INT NOT NULL,
    FOREIGN KEY (codRecinto) REFERENCES recintos(cod) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE preciosEspectaculos(
	codEspectaculos INT NOT NULL,
    codRecintos INT NOT NULL,
    zona VARCHAR(20) NOT NULL,
    precio FLOAT NOT NULL,
    PRIMARY KEY (codEspectaculos, codRecintos, zona),
    FOREIGN KEY (codEspectaculos) REFERENCES espectaculos(cod) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (codRecintos) REFERENCES recintos(cod) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE zonasRecintos(
	codRecinto INT NOT NULL,
    zona VARCHAR(20) NOT NULL,
    capacidad INT NOT NULL,
    PRIMARY KEY (codRecinto, zona),
    FOREIGN KEY (codRecinto) REFERENCES recintos(cod) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE asientos(
	codRecinto INT NOT NULL,
    zona VARCHAR(20) NOT NULL,
    fila VARCHAR(10) NOT NULL,
    numero INT NOT NULL,
    PRIMARY KEY (codRecinto, zona, fila, numero),
    FOREIGN KEY (codRecinto, zona) REFERENCES zonasRecintos(codRecinto, zona) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE representaciones(
	codEspectaculo INT NOT NULL,
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    PRIMARY KEY (codEspectaculo, fecha, hora),
    FOREIGN KEY (codEspectaculo) REFERENCES espectaculos(cod) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE entradas(
	codEspectaculo INT NOT NULL,
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    codRecinto INT NOT NULL,
    fila VARCHAR(10) NOT NULL,
    numero INT NOT NULL,
    zona VARCHAR(20) NOT NULL,
    dniCliente VARCHAR(20) NOT NULL,
    PRIMARY KEY (codEspectaculo, codRecinto, zona, dniCliente, fila, numero, fecha, hora),
    FOREIGN KEY (codEspectaculo) REFERENCES espectaculos(cod) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (codRecinto, zona) REFERENCES zonasRecintos(codRecinto, zona) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (dniCliente) REFERENCES espectadores(dniCliente) ON DELETE RESTRICT ON UPDATE CASCADE
);

-- drop schema gestion_de_ventas;