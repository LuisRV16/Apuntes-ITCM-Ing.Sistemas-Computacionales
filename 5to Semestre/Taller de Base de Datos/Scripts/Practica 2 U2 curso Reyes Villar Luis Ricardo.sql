-- *** SCRIPT PARA CREAR Y CARGAR LAS TABLAS DEL CURSO DE SQL 
-- *** DEPARTAMENTOS, EMPLEADOS, CLIENTES, PRODUCTOS Y PEDIDOS 
-- ######################## SELECCION DE LA BASE DE DATOS ####################### 
DROP DATABASE IF EXISTS CURSO; 
CREATE DATABASE CURSO; 
USE CURSO; 
-- ######################## BORRADO DE TABLAS ####################### 
-- POR SI YA EXISTEN Y SE QUIEREN VOLVER A CREAR ################## 
-- SI NO EXISTEN SE PRODUCIRAN UNOS ERRORES QUE NO DEBEN SER TENIDOS EN CUENTA ######## 
DROP TABLE IF EXISTS PEDIDOS; 
DROP TABLE IF EXISTS PRODUCTOS; 
DROP TABLE IF EXISTS CLIENTES; 
DROP TABLE IF EXISTS EMPLEADOS; 
DROP TABLE IF EXISTS DEPARTAMENTOS; 
#' ######################## CREACION DE TABLAS ####################### 
#' ## TABLA DEPARTAMENTOS 
CREATE TABLE DEPARTAMENTOS 
( 
  DEP_NO 		INT, 
  DNOMBRE 		VARCHAR(14), 
  LOCALIDAD 		VARCHAR(10), 
CONSTRAINT PK_DEPARTAMENTOS_DEP_NO PRIMARY KEY (DEP_NO)) 
ENGINE = INNODB; 

#' ## TABLA EMPLEADOS 
CREATE TABLE EMPLEADOS 
( EMP_NO 		INT, 
  APELLIDO 		VARCHAR(8), 
  OFICIO 		VARCHAR(10), 
  DIRECTOR 		INT, 
  FECHA_ALTA 		DATE, 
  SALARIO 		FLOAT(6,2), 
  COMISION 		FLOAT(6,2), 
  DEP_NO 		INT, 
CONSTRAINT PK_EMPLEADOS_EMP_NO PRIMARY KEY (EMP_NO), 
CONSTRAINT FK_EMP_DIRECTOR FOREIGN KEY (DIRECTOR) REFERENCES EMPLEADOS(EMP_NO), 
CONSTRAINT FK_EMP_DEP_NO FOREIGN KEY (DEP_NO) REFERENCES DEPARTAMENTOS(DEP_NO) 
)ENGINE = INNODB; 

#' ## TABLA CLIENTES 
CREATE TABLE CLIENTES 
(CLIENTE_NO		INT, 
 NOMBRE 		VARCHAR(25), 
 LOCALIDAD         	VARCHAR(14), 
 VENDEDOR_NO       	INT, 
 DEBE			FLOAT(9,2), 
 HABER			FLOAT(9,2), 
 LIMITE_CREDITO    	FLOAT(9,2), 
CONSTRAINT PK_CLIENTE_NO PRIMARY KEY(CLIENTE_NO), 
CONSTRAINT FK_CLI_EMP_NO FOREIGN KEY (VENDEDOR_NO) 
 REFERENCES EMPLEADOS(EMP_NO) ON DELETE CASCADE 
)ENGINE = INNODB; 

#' ## TABLA PRODUCTOS 
CREATE TABLE PRODUCTOS 
(PRODUCTO_NO  		INT, 
 DESCRIPCION  		VARCHAR(30), 
 PRECIO_ACTUAL 		FLOAT(8,2), 
 STOCK_DISPONIBLE	INT, 
CONSTRAINT PK_PRODUCTO_NO PRIMARY KEY (PRODUCTO_NO)  
)ENGINE = INNODB; 

#' ## TABLA PEDIDOS 
CREATE TABLE PEDIDOS 
(PEDIDO_NO         	INT, 
 PRODUCTO_NO		INT, 
 CLIENTE_NO 		INT, 
 UNIDADES 	        INT, 
 FECHA_PEDIDO      	DATE, 
CONSTRAINT PK_PEDIDO_NO PRIMARY KEY (PEDIDO_NO), 
CONSTRAINT FK_PEDIDOS_PRODUCTO_NO FOREIGN KEY (PRODUCTO_NO) 
REFERENCES PRODUCTOS(PRODUCTO_NO) ON DELETE CASCADE, 
CONSTRAINT FK_PEDIDOS_CLIENTE_NO FOREIGN KEY (CLIENTE_NO) 
REFERENCES CLIENTES(CLIENTE_NO) ON DELETE CASCADE  
)ENGINE = INNODB; 

#' ##################### INTRODUCCIÓN DE DATOS ###################### 
#' ## DEPARTAMENTOS 
INSERT INTO DEPARTAMENTOS VALUES(10, 'CONTABILIDAD', 'BARCELONA'); 
INSERT INTO DEPARTAMENTOS VALUES(20, 'INVESTIGACION', 'VALENCIA'); 
INSERT INTO DEPARTAMENTOS VALUES(30, 'VENTAS',        'MADRID');  
INSERT INTO DEPARTAMENTOS VALUES(40, 'PRODUCCION',    'SEVILLA'); 

#' ## EMPLEADOS 
INSERT INTO EMPLEADOS VALUES (7839,'REY',     'PRESIDENTE',NULL,'1981-11-17',6000,   NULL, 10); 
INSERT INTO EMPLEADOS VALUES (7698,'GARRIDO', 'DIRECTOR',  7839,'1981-05-01',3850.12,NULL, 30); 
INSERT INTO EMPLEADOS VALUES (7782,'MARTINEZ','DIRECTOR',  7839,'1981-06-09',2450,   NULL, 10); 
INSERT INTO EMPLEADOS VALUES(7499,'ALONSO',   'VENDEDOR',  7698,'1981-02-23',1400,   400,30); 
INSERT INTO EMPLEADOS VALUES (7521,'LOPEZ',   'EMPLEADO',  7782,'1981-05-08',1350.50,NULL,10);       
INSERT INTO EMPLEADOS VALUES (7654,'MARTIN',  'VENDEDOR',  7698,'1981-09-28',1500,   1600, 30); 
INSERT INTO EMPLEADOS VALUES (7844,'CALVO',   'VENDEDOR',  7698,'1981-09-08',1800,   0,    30); 
INSERT INTO EMPLEADOS VALUES (7876,'GIL',     'ANALISTA',  7782,'1982-05-06',3350,   NULL, 20); 
INSERT INTO EMPLEADOS VALUES (7900,'JIMENEZ', 'EMPLEADO',  7782,'1983-03-24',1400,   NULL, 20);	 
INSERT INTO EMPLEADOS VALUES (7901,'Cortez', 'VENDEDOR',  7782,'1983-03-24',1400,   NULL, 20); 

#' ## CLIENTES 
INSERT INTO CLIENTES VALUES (101, 'DISTRIBUCIONES GOMEZ', 'MADRID', 7499, 0,0,5000); 
INSERT INTO CLIENTES VALUES (102, 'LOGITRONICA S.L', 'BARCELONA', 7654,0,0,5000); 
INSERT INTO CLIENTES VALUES (103, 'INDUSTRIAS LACTEAS S.A.', 'LAS ROZAS', 7844,0,0, 10000); 
INSERT INTO CLIENTES VALUES (104, 'TALLERES ESTESO S.A.', 'SEVILLA', 7654, 0, 0, 5000); 
INSERT INTO CLIENTES VALUES (105, 'EDICIONES SANZ', 'BARCELONA', 7499, 0,0,5000); 
INSERT INTO CLIENTES VALUES (106, 'SIGNOLOGIC S.A.', 'MADRID', 7654,0,0,5000); 
INSERT INTO CLIENTES VALUES (107, 'MARTIN Y ASOCIADOS S.L.', 'ARAVACA' , 7844,0,0, 10000); 
INSERT INTO CLIENTES VALUES (108, 'MANUFACTURAS ALI S.A.', 'SEVILLA', 7654, 0, 0, 5000); 

#' ## PRODUCTOS 
INSERT INTO PRODUCTOS VALUES(10,'MESA DESPACHO MOD. GAVIOTA', 550, 50); 
INSERT INTO PRODUCTOS VALUES (20, 'SILLA DIRECTOR MOD. BUFALO', 670, 25); 
INSERT INTO PRODUCTOS VALUES (30, 'ARMARIO NOGAL DOS PUERTAS', 460, 20); 
INSERT INTO PRODUCTOS VALUES (40, 'MESA MODELO UNIÓN',340, 15); 
INSERT INTO PRODUCTOS VALUES (50, 'ARCHIVADOR CEREZO',1050, 20); 
INSERT INTO PRODUCTOS VALUES (60, 'CAJA SEGURIDAD MOD B222', 280, 15); 
INSERT INTO PRODUCTOS VALUES (70, 'DESTRUCTORA DE PAPEL A3',450, 25); 
INSERT INTO PRODUCTOS VALUES (80, 'MODULO ORDENADOR MOD. ERGOS', 550, 25); 

update productos set stock_disponible = 45 where producto_no = 10; 
#' ## PEDIDOS 

INSERT INTO PEDIDOS VALUES(1000, 20, 103, 3, '1999-10-06'); 
INSERT INTO PEDIDOS VALUES(1001, 50, 106, 2, '1999-10-06'); 
INSERT INTO PEDIDOS VALUES(1002, 10, 101, 4, '1999-10-07'); 
INSERT INTO PEDIDOS VALUES(1003, 20, 105, 4, '1999-10-16'); 
INSERT INTO PEDIDOS VALUES(1004, 40, 106, 8, '1999-10-20'); 
INSERT INTO PEDIDOS VALUES(1005, 30, 105, 2, '1999-10-20'); 
INSERT INTO PEDIDOS VALUES(1006, 70, 103, 3, '1999-11-03'); 
INSERT INTO PEDIDOS VALUES(1007, 50, 101, 2, '1999-11-06'); 
INSERT INTO PEDIDOS VALUES(1008, 10, 106, 6, '1999-11-16'); 
INSERT INTO PEDIDOS VALUES(1009, 20, 105, 2, '1999-11-26'); 
INSERT INTO PEDIDOS VALUES(1010, 40, 102, 3, '1999-12-08'); 
INSERT INTO PEDIDOS VALUES(1011, 30, 106, 2, '1999-12-15'); 
INSERT INTO PEDIDOS VALUES(1012, 10, 105, 3, '1999-12-06'); 
INSERT INTO PEDIDOS VALUES(1013, 30, 106, 2, '1999-12-06'); 
INSERT INTO PEDIDOS VALUES(1014, 20, 101, 4, '2000-01-07'); 
INSERT INTO PEDIDOS VALUES(1015, 70, 105, 4, '2000-01-16'); 
INSERT INTO PEDIDOS VALUES(1017, 20, 105, 6, '2000-01-20'); 

-- consultas multitabla 
-- a) Producto cartesiano 
/* aplicando el producto cartesiano a dos tablas se obtiene una tabla con las columnas  
de la primera tabla unidas a las columnas de la segunda tabla, y las filas de la tabla  
resultante son todas las posibles concatenaciones de filas de la primera tabla con filas de la segunda tabla 
sintaxis  
Select * from tabla1, tabla2; 
ejemplo: */ 
select * from departamentos,empleados; 

-- Producto cartesiano con condición. Ejemplo seleccionar los empleados que estan en el departamento de contabilidad 

select * from departamentos,empleados where (Select dep_no from departamentos where dnombre like "Contabilidad") = empleados.dep_no; -- esto no es correct 
select * from departamentos,empleados where (Select dep_no from departamentos where dnombre like "Contabilidad") = empleados.dep_no and departamentos.dep_no = empleados.dep_no; -- esto es correcto 

 -- describe por que la segunda es la respuesta correcta.... 

/* b join La instrucción SQL JOIN se utiliza para combinar dos o más tablas, tomando un campo común de las dos. 
sintaxis: 
select * from tabla1 join tabla2 on tabla1.campo_comun = tabla2.campo_comun; en este caso el nombre de los campos en común no se llaman igual 
select * from tabla1 join tabla2 using(campo_comun); en este caso se usa cuando el campo en comun se llama igual  */ 
-- ejemplo la tabla departamentos y empleados tienen en común el campo dep_no 
select * from departamentos join empleados; 
-- o
select * from departamentos join empleados using (dep_no); 
-- en la tabla clientes y la tabla empleados tiene en comun el campo vendedor_no y emp_no, donde vendedor_no en la tabla clientes es 
-- el número de empleado que atendio a cliente. En este caso los nombres de los campos en común tiene nombre diferente 
select * from clientes join empleados on clientes.vendedor_no = empleados.emp_no; -- solo es valida está sintaxis para este tipo de casos

select * from productos;
select * from clientes;
select * from empleados;
select * from pedidos;

-- 1. Mostrar los productos con mas de 10 productos por existencia [descripcion del producto, stock del producto]
select descripcion, stock_disponible from productos where stock_disponible > 10;

-- 2. Extraer la cantidad mas alta de productos [descripcion del producto, cantidad mas alta]
/*select descripcion, stock_disponible from productos where stock_disponible = (
	select max(stock_disponible) from productos
);*/

select max(stock_disponible) from productos;

-- 3. Mostrar la cantidad mas baja de productos [descripcion del producto, cantidad mas baja]
/*select descripcion, stock_disponible from productos where stock_disponible = (
	select min(stock_disponible) from productos
);*/

select min(stock_disponible) from productos;

-- 4. Mostrar los clientes que viven en Madrid [Nombre del cliente, localidad]
select nombre, localidad from clientes where localidad like 'MADRID';

-- 5. Mostrar los empleados que tiene asignado un director [nombre del empleado, nombre del director]
select emp.apellido as Nombre_Empleado, dir.apellido as Nombre_Director 
from empleados as emp join empleados as dir
on dir.emp_no = emp.director 
where emp.director is not null order by dir.apellido;

-- 6. Agrupar los empleados por director, cuantos y que director [cantidad y nombre de director]
select res.Cantidad, dir.apellido as Nombre_Director
from empleados as dir join (select count(*) as Cantidad, director from empleados where director is not null group by director) as res
on dir.emp_no = res.director;

select count(empleados.emp_no) as Empleados, dir.apellido as Apellido
from empleados join empleados dir on empleados.director = dir.emp_no group by dir.emp_no;

-- 7. Mostrar los pedidos agrupados por fecha [fecha tal, cantidad]
select fecha_pedido as 'Fecha del Pedido', count(*) as Cantidad from pedidos group by fecha_pedido;

-- 8. Listar los pedidos con más de 5 productos [numero del pedido, cantidad del pedido]
select pedido_no as 'Numero del pedido', unidades as 'Cantidad del pedido' from pedidos where unidades > 5;

-- 9. Obtener el promedio de los precios de los productos
select avg(precio_actual) as Promedio_Precios from productos;

-- 10. Obtener la suma total de cada pedido de la misma fecha
select count(*) as Suma_total, fecha_pedido from pedidos group by fecha_pedido;

