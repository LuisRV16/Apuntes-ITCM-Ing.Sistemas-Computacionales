CREATE SCHEMA banco;

USE banco;

CREATE TABLE sucursal(
	numero_sucursal INT PRIMARY KEY,
    direccion VARCHAR(50) NOT NULL,
    telefono INT NOT NULL
);

CREATE TABLE clientes(
	dni VARCHAR(20) PRIMARY KEY,
    nombre VARCHAR(40) NOT NULL,
    direccion VARCHAR(50) NOT NULL,
    telefono INT NOT NULL
);

CREATE TABLE cuentas(
	numero_cuenta INT PRIMARY KEY,
    dni_cliente VARCHAR(20) NOT NULL,
    balance INT NOT NULL,
    fecha DATE NOT NULL,
    tipo VARCHAR(15) NOT NULL,
    num_suc INT NOT NULL,
    FOREIGN KEY (num_suc) REFERENCES sucursal(numero_sucursal),
    FOREIGN KEY (dni_cliente) REFERENCES clientes(dni)
);

CREATE TABLE prestamos(
	numero_prestamos INT PRIMARY KEY,
    dni_cliente VARCHAR(20) NOT NULL,
    tipo VARCHAR(15) NOT NULL,
    cantidad INT NOT NULL,
    num_suc INT NOT NULL,
    FOREIGN KEY(num_suc) REFERENCES sucursal(numero_sucursal),
    FOREIGN KEY(dni_cliente) REFERENCES clientes(dni)
);

CREATE TABLE opera(
	fecha DATE NOT NULL,
    num_cuenta INT NOT NULL,
    dni_cliente VARCHAR(20) NOT NULL,
    tipo VARCHAR(15) NOT NULL,
    cantidad INT NOT NULL,
    PRIMARY KEY (fecha, num_cuenta),
    FOREIGN KEY (num_cuenta) REFERENCES cuentas(numero_cuenta),
    FOREIGN KEY (dni_cliente) REFERENCES clientes(dni)
);