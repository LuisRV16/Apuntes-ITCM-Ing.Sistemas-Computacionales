create schema personal;

use personal;

create table departamento(
	clave int primary key,
	nombre varchar(30) unique not null,
	presupuesto int not null
);

create table empleados(
	clave varchar(8) primary key,
	nombre varchar(30) not null,
	apellidos varchar(30) not null,
	clave_depto int,
	constraint c_depto foreign key (clave_depto) references departamento(clave)
);

insert into departamento values(1, 'Personal', 80000),
							   (2, 'Almacén', 70000),
                               (3, 'Contabilidad', 60000),
                               (4, 'Manufactura', 50000),
                               (5, 'Empaque', 30000);
                               
insert into empleados values('EMP01', 'Armando', 'López', 2),
							('EMP02', 'Tatiana', 'Vargas', 1),
                            ('EMP03', 'Laura', 'Iturria', 3),
                            ('EMP04', 'Juan', 'Pérez', 4),
                            ('EMP05', 'Iván', 'López', 4),
                            ('EMP06', 'Margarita', 'Hernández', 1),
                            ('EMP07', 'Jesús', 'Pérez', 3),
                            ('EMP08', 'Tonatiuh', 'Flores', 2),
                            ('EMP09', 'Juan', 'López', 4),
                            ('EMP10', 'José', 'Hernández', 5);
                            
-- a)   Obtener los nombres y apellidos de los empleados
select nombre, apellidos from empleados;
-- b)   Obtener los apellidos de los empleados sin repeticiones
select distinct apellidos from empleados;
-- c)   Obtener todos los datos de los empleados que se apellidan ‘López’
select * from empleados where apellidos like 'López';
-- d)   Obtener todos los datos de los empleados que se apellidan ‘López’ y los que se apellidan ‘Pérez’
select * from empleados where apellidos like 'López' or apellidos like 'Pérez';
-- e)   Obtener el nombre y la clave de empleado de los trabajadores que trabajan en el departamento 4
select nombre, clave from empleados where clave_depto = 4;
-- f)    Obtener todos los datos de los empleados que trabajan para el departamento 1 o 3 ordenados alfabéticamente por nombre
select * from empleados where clave_depto = 1 or clave_depto = 3 order by nombre asc;
-- g)   Obtener el nombre y apellidos de los empleados cuyo apellido comienza con ‘H’
select nombre, apellidos from empleados where apellidos like 'H%';
-- h)   Obtener los datos de los departamentos cuyo presupuesto esta entre $ 50,000 y $ 70,000
select * from departamento where presupuesto between 50000 and 70000;
-- i)    Obtener  la  clave  de  empleado,  nombres  y  apellidos  de  los  empleados  que  trabajen  en  el departamento de contabilidad
select empleados.clave, empleados.nombre, empleados.apellidos from empleados join departamento on clave_depto = departamento.clave
where departamento.nombre like 'Contabilidad';
-- j)    Obtener el nombre y apellidos así como el nombre del departamento de cada uno de los empleados que laboran en la empresa
select empleados.nombre, empleados.apellidos, departamento.nombre as nombre_depto from empleados join departamento
on clave_depto = departamento.clave;
-- 5.   Genera las siguientes vistas:
-- a)   Una  vista  denominada  Personal,  con  todos  los  datos  de  los  empleados  del  departamento  de Personal.
select empleados.* from empleados join departamento on clave_depto = departamento.clave
where departamento.nombre like 'Personal';
-- b)   Una vista denominada Pérez, con todos los empleados apellidados Pérez.
select * from empleados where apellidos like 'Pérez';
-- c)   Una vista denominada Grandes_presupuestos, con los departamentos que tienen, al menos, 50000€ de presupuesto.
select * from departamento where presupuesto >= 50000;