CREATE SCHEMA empresaTarea2;

USE empresaTarea2;

CREATE TABLE empleados(
	dni VARCHAR(20) PRIMARY KEY,
    nombre VARCHAR(10) NOT NULL,
    apellido1 VARCHAR(15) NOT NULL,
    apellido2 VARCHAR(15),
    direccion1 VARCHAR(25) NOT NULL,
    direccion2 VARCHAR(20),
    ciudad VARCHAR(20) NOT NULL,
    provincia VARCHAR(20) NOT NULL,
    codPostal VARCHAR(5) NOT NULL,
    sexo ENUM('H','M') NOT NULL,
    fechaNac DATE NOT NULL
);

CREATE TABLE departamentos(
	cod INT PRIMARY KEY,
    nombre VARCHAR(30) NOT NULL UNIQUE,
    dptoPadre INT,
    presupuesto INT NOT NULL,
    presActual INT,
    FOREIGN KEY (dptoPadre) REFERENCES departamentos(cod)
);

CREATE TABLE universidades(
	cod INT PRIMARY KEY,
    nombre VARCHAR(25) NOT NULL,
    ciudad VARCHAR(20),
    municipio VARCHAR(2),
    codPostal VARCHAR(5)
);

CREATE TABLE trabajos(
	cod INT PRIMARY KEY,
    nombreTrabajo INT NOT NULL UNIQUE,
    salarioMin INT NOT NULL,
    salarioMax INT NOT NULL
);

CREATE TABLE estudios(
	dniEmpleado VARCHAR(20) NOT NULL,
    universidad INT NOT NULL,
    año YEAR,
    grado VARCHAR(3),
    especialidad VARCHAR(20),
    PRIMARY KEY (dniEmpleado, universidad),
    FOREIGN KEY (dniEmpleado) REFERENCES empleados(dni),
    FOREIGN KEY (universidad) REFERENCES universidades(cod)
);

CREATE TABLE historialLaboral(
	dniEmpleado VARCHAR(20) NOT NULL,
    codTrabajo INT NOT NULL,
    fechaInicio DATE NOT NULL,
    fechaFin DATE,
    codDpto INT,
    dniSupervisor VARCHAR(20),
    PRIMARY KEY (dniEmpleado, fechaInicio),
    FOREIGN KEY (dniEmpleado) REFERENCES empleados(dni),
    FOREIGN KEY (codTrabajo) REFERENCES trabajos(cod),
    FOREIGN KEY (codDpto) REFERENCES departamentos(cod),
    FOREIGN KEY (dniSupervisor) REFERENCES empleados(dni)
);

CREATE TABLE historialSalarial(
	dniEmpleado VARCHAR(20) NOT NULL,
    salario FLOAT NOT NULL,
    fechaComienzo DATE NOT NULL,
    fechaFinal DATE,
    PRIMARY KEY(dniEmpleado, fechaComienzo),
    FOREIGN KEY (dniEmpleado) REFERENCES empleados(dni)
);

-- drop schema empresaTarea2;