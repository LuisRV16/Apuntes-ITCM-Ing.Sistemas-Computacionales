CREATE SCHEMA asuntos;

USE asuntos;

CREATE TABLE cliente(
	dni VARCHAR(20) PRIMARY KEY,
    nombre VARCHAR(40) NOT NULL,
    direccion VARCHAR(50) NOT NULL
);

CREATE TABLE procurador(
	dni VARCHAR(20) PRIMARY KEY,
    nombre VARCHAR(40) NOT NULL,
    direccion VARCHAR(50) NOT NULL
);

CREATE TABLE asunto(
	numExp INT PRIMARY KEY,
    dniCli VARCHAR(20) NOT NULL,
    fechaIni DATE NOT NULL,
    fechaFin DATE,
    estado VARCHAR(20) NOT NULL,
    FOREIGN KEY (dniCli) REFERENCES cliente(dni)
);

CREATE TABLE asuntoProc(
	numExp INT NOT NULL,
    dniProc VARCHAR(20) NOT NULL,
    PRIMARY KEY (numExp, dniProc),
    FOREIGN KEY (numExp) REFERENCES asunto(numExp) ON
    DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (dniProc) REFERENCES procurador(dni)
);