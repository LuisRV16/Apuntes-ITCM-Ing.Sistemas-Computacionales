CREATE SCHEMA diagnostico;

USE diagnostico;

CREATE TABLE obra(
	id INT PRIMARY KEY,
    anno DATE NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    tipo ENUM('CD', 'libro', 'pelicula'),
    nCanciones INT,
    nPaginas INT,
    duracion INT
);

CREATE TABLE copias(
	nCopia INT,
    idObra INT,
    deteriorado VARCHAR(20),
    comentario VARCHAR(50),
    PRIMARY KEY (idObra, nCopia),
    FOREIGN KEY (idObra) REFERENCES obra(id)
);

CREATE TABLE socios(
	codSocio INT PRIMARY KEY,
    apellidos VARCHAR(30),
    nombre VARCHAR(30),
    direccion VARCHAR(50)
);

CREATE TABLE prestamos(
	id INT PRIMARY KEY,
    nCopia INT,
    idObra INT,
    codSocio INT,
    fecha_prestamo DATE NOT NULL,
    fecha_devolucion DATE,
    fecha_tope DATE NOT NULL,
    FOREIGN KEY (idObra, nCopia) REFERENCES copias (idObra, nCopia),
    FOREIGN KEY (codSocio) REFERENCES socios (codSocio)
);

CREATE TABLE autores(
	id INT PRIMARY KEY,
    nombre VARCHAR(50),
    pais VARCHAR(30)
);

CREATE TABLE crear(
	idObra INT,
    idAutores INT,
    PRIMARY KEY (idObra, idAutores),
    FOREIGN KEY (idObra) REFERENCES obra(id),
    FOREIGN KEY (idAutores) REFERENCES autores(id)
);
