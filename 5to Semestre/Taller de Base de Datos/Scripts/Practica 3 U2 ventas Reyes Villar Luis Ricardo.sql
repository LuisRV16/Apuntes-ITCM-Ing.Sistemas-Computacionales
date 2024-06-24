DROP DATABASE IF EXISTS ventas;
CREATE DATABASE ventas CHARACTER SET utf8mb4;
USE ventas;

CREATE TABLE cliente (
 id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 nombre VARCHAR(100) NOT NULL,
 apellido1 VARCHAR(100) NOT NULL,
 apellido2 VARCHAR(100),
 ciudad VARCHAR(100),
 categoría INT UNSIGNED
);

CREATE TABLE comercial (
 id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 nombre VARCHAR(100) NOT NULL,
 apellido1 VARCHAR(100) NOT NULL,
 apellido2 VARCHAR(100),
 comisión FLOAT
);

CREATE TABLE pedido (
 id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 total DOUBLE NOT NULL,
 fecha DATE,
 id_cliente INT UNSIGNED NOT NULL,
 id_comercial INT UNSIGNED NOT NULL,
 FOREIGN KEY (id_cliente) REFERENCES cliente(id),
 FOREIGN KEY (id_comercial) REFERENCES comercial(id)
);

INSERT INTO cliente VALUES(1, 'Aarón', 'Rivero', 'Gómez', 'Almería', 100);
INSERT INTO cliente VALUES(2, 'Adela', 'Salas', 'Díaz', 'Granada', 200);
INSERT INTO cliente VALUES(3, 'Adolfo', 'Rubio', 'Flores', 'Sevilla', NULL);
INSERT INTO cliente VALUES(4, 'Adrián', 'Suárez', NULL, 'Jaén', 300);
INSERT INTO cliente VALUES(5, 'Marcos', 'Loyola', 'Méndez', 'Almería', 200);
INSERT INTO cliente VALUES(6, 'María', 'Santana', 'Moreno', 'Cádiz', 100);
INSERT INTO cliente VALUES(7, 'Pilar', 'Ruiz', NULL, 'Sevilla', 300);
INSERT INTO cliente VALUES(8, 'Pepe', 'Ruiz', 'Santana', 'Huelva', 200);
INSERT INTO cliente VALUES(9, 'Guillermo', 'López', 'Gómez', 'Granada', 225);
INSERT INTO cliente VALUES(10, 'Daniel', 'Santana', 'Loyola', 'Sevilla', 125);

INSERT INTO comercial VALUES(1, 'Daniel', 'Sáez', 'Vega', 0.15);
INSERT INTO comercial VALUES(2, 'Juan', 'Gómez', 'López', 0.13);
INSERT INTO comercial VALUES(3, 'Diego','Flores', 'Salas', 0.11);
INSERT INTO comercial VALUES(4, 'Marta','Herrera', 'Gil', 0.14);
INSERT INTO comercial VALUES(5, 'Antonio','Carretero', 'Ortega', 0.12);
INSERT INTO comercial VALUES(6, 'Manuel','Domínguez', 'Hernández', 0.13);
INSERT INTO comercial VALUES(7, 'Antonio','Vega', 'Hernández', 0.11);
INSERT INTO comercial VALUES(8, 'Alfredo','Ruiz', 'Flores', 0.05);

INSERT INTO pedido VALUES(1, 150.5, '2017-10-05', 5, 2);
INSERT INTO pedido VALUES(2, 270.65, '2016-09-10', 1, 5);
INSERT INTO pedido VALUES(3, 65.26, '2017-10-05', 2, 1);
INSERT INTO pedido VALUES(4, 110.5, '2016-08-17', 8, 3);
INSERT INTO pedido VALUES(5, 948.5, '2017-09-10', 5, 2);
INSERT INTO pedido VALUES(6, 2400.6, '2016-07-27', 7, 1);
INSERT INTO pedido VALUES(7, 5760, '2015-09-10', 2, 1);
INSERT INTO pedido VALUES(8, 1983.43, '2017-10-10', 4, 6);
INSERT INTO pedido VALUES(9, 2480.4, '2016-10-10', 8, 3);
INSERT INTO pedido VALUES(10, 250.45, '2015-06-27', 8, 2);
INSERT INTO pedido VALUES(11, 75.29, '2016-08-17', 3, 7);
INSERT INTO pedido VALUES(12, 3045.6, '2017-04-25', 2, 1);
INSERT INTO pedido VALUES(13, 545.75, '2019-01-25', 6, 1);
INSERT INTO pedido VALUES(14, 145.82, '2017-02-02', 6, 1);
INSERT INTO pedido VALUES(15, 370.85, '2019-03-11', 1, 5);
INSERT INTO pedido VALUES(16, 2389.23, '2019-03-11', 1, 5);


ALTER TABLE comercial change comisión comision FLOAT;
ALTER TABLE cliente change categoría categoria INT UNSIGNED;

-- Consultas sobre una tabla
/*1.  Devuelve un listado con todos los pedidos que se han realizado. Los pedidos deben estar ordenados por la fecha de realización,
mostrando en primer lugar los pedidos más recientes.*/
select * from pedido order by fecha desc;
-- 2.  Devuelve todos los datos de los dos pedidos de mayor valor.
select * from pedido order by total desc limit 2;
/*3.  Devuelve un listado con los identificadores de los clientes que han realizado algún pedido.
Tenga en cuenta que no debe mostrar identificadores que estén repetidos.*/
select distinct id from pedido;
-- 4.  Devuelve un listado de todos los pedidos que se realizaron durante el año 2017, cuya cantidad total sea superior a 500€.
select * from pedido where fecha like '2017%' and total > 500;
-- 5.  Devuelve un listado con el nombre y los apellidos de los comerciales que tienen una comisión entre 0.05 y 0.11.
select nombre, apellido1, apellido2 from comercial where comision between 0.05 and 0.11;
-- 6.  Devuelve el valor de la comisión de mayor valor que existe en la tabla comercial.
select max(comision) as 'Comisión de mayor valor' from comercial;
/*7.  Devuelve el identificador, nombre y primer apellido de aquellos clientes cuyo segundo apellido no es NULL.
El listado deberá estar ordenado alfabéticamente por apellidos y nombre.*/
select id, nombre, apellido1 from cliente where apellido2 is not null order by apellido1, apellido2, nombre asc;
/*8.  Devuelve un listado de los nombres de los clientes que empiezan por A y terminan por n y también los nombres que empiezan por P.
El listado deberá estar ordenado alfabéticamente.*/
select * from cliente;
select nombre from cliente where nombre like 'A%n' or nombre like 'P%';
-- 9.  Devuelve un listado de los nombres de los clientes que no empiezan por A. El listado deberá estar ordenado alfabéticamente.
select nombre from cliente where nombre not like 'A%' order by nombre asc;
/*10. Devuelve un listado con los nombres de los comerciales que terminan por el u o.
Tenga en cuenta que se deberán eliminar los nombres repetidos.*/
select distinct nombre from comercial where nombre like '%el' or nombre like '%o';

-- 1.3.4 Consultas multitabla (Composición interna)
-- Resuelva todas las consultas utilizando la sintaxis de SQL1 y SQL2.

/*1.  Devuelve un listado con el identificador, nombre y los apellidos de todos los clientes que han realizado algún pedido.
El listado debe estar ordenado alfabéticamente y se deben eliminar los elementos repetidos.*/
select distinct cl.id, cl.nombre, cl.apellido1, cl.apellido2 from cliente as cl join pedido as pd on cl.id = pd.id_cliente
order by cl.apellido1, cl.apellido2, cl.nombre asc;
/*2.  Devuelve un listado que muestre todos los pedidos que ha realizado cada cliente.
El resultado debe mostrar todos los datos de los pedidos y del cliente.
listado debe mostrar los datos de los clientes ordenados alfabéticamente.*/
select pd.id id_pedido, pd.total 'total del pedido', pd.fecha fecha_pedido, pd.id_comercial, pd.id_cliente, cl.nombre nombre_cliente,
cl.apellido1 apellido1_cliente, cl.apellido2 apellido2_cliente, cl.ciudad ciudad_cliente, cl.categoria categoria_cliente
from cliente as cl join pedido as pd on cl.id = pd.id_cliente order by cl.apellido1, cl.apellido2, cl.nombre asc;
/*3.  Devuelve un listado que muestre todos los pedidos en los que ha participado un comercial.
El resultado debe mostrar todos los datos de los pedidos y de los comerciales.
El listado debe mostrar los datos de los comerciales ordenados alfabéticamente.*/
select pd.*, com.nombre nombre_comercial, com.apellido1 apellido1_comercial, com.apellido2 apellido2_comercial,
com.comision comision_comercial from comercial as com join pedido as pd on com.id = pd.id_comercial
order by com.apellido1, com.apellido2, com.nombre asc;
/*4.  Devuelve un listado que muestre todos los clientes, con todos los pedidos que han realizado y
con los datos de los comerciales asociados a cada pedido.*/
select cl.*, pd.*, com.nombre nombre_comercial, com.apellido1 apellido1_comercial, com.apellido2 apellido2_comercial,
com.comision comision_comercial from cliente as cl join pedido as pd on cl.id = pd.id_cliente join comercial as com
on pd.id_comercial = com.id;
-- 5.  Devuelve un listado de todos los clientes que realizaron un pedido durante el año 2017, cuya cantidad esté entre 300 € y 1000 €.
select cl.* from cliente as cl join pedido as pd on cl.id = pd.id_cliente where pd.fecha like '2017%' and total between 300 and 1000;
-- 6.  Devuelve el nombre y los apellidos de todos los comerciales que ha participado en algún pedido realizado por María Santana Moreno.
select distinct com.nombre nombre_comercial, com.apellido1 apellido1_comercial, com.apellido2 apellido2_comercial from
cliente as cl join pedido as pd on cl.id = pd.id_cliente join comercial as com
on pd.id_comercial = com.id where cl.nombre like 'María' and cl.apellido1 like 'Santana' and cl.apellido2 like 'Moreno';
-- 7.  Devuelve el nombre de todos los clientes que han realizado algún pedido con el comercial Daniel Sáez Vega.
select distinct cl.nombre nombre_cliente, cl.apellido1 apellido1_cliente, cl.apellido2 apellido2_cliente from
cliente as cl join pedido as pd on cl.id = pd.id_cliente join comercial as com
on pd.id_comercial = com.id where com.nombre like 'Daniel' and com.apellido1 like 'Saéz' and com.apellido2 like 'Vega';
-- 1.3.5 Consultas multitabla (Composición externa)
-- Resuelva todas las consultas utilizando las cláusulas LEFT JOIN y RIGHT JOIN.

/*1.  Devuelve un listado con todos los clientes junto con los datos de los pedidos que han realizado.
Este listado también debe incluir los clientes que no han realizado ningún pedido.
El listado debe estar ordenado alfabéticamente por el primer apellido, segundo apellido y nombre de los clientes.*/
select cl.id, cl.nombre, cl.apellido1, cl.apellido2, cl.ciudad, cl.categoria, pd.id id_pedido, pd.total, pd.fecha fecha_pedido,
pd.id_cliente, pd.id_comercial from cliente as cl left join pedido as pd on cl.id = pd.id_cliente
order by cl.apellido1, cl.apellido2, cl.nombre asc;
/*2.  Devuelve un listado con todos los comerciales junto con los datos de los pedidos que han realizado.
Este listado también debe incluir los comerciales que no han realizado ningún pedido.
El listado debe estar ordenado alfabéticamente por el primer apellido, segundo apellido y nombre de los comerciales.*/
select * from pedido as pd right join comercial as com on pd.id_comercial = com.id order by com.apellido1, com.apellido2, com.nombre asc;
-- 3.  Devuelve un listado que solamente muestre los clientes que no han realizado ningún pedido.
select cl.id id_cliente, cl.nombre, cl.apellido1, cl.apellido2, cl.ciudad, cl.categoria
from cliente as cl left join pedido as pd on cl.id = pd.id_cliente where pd.id is null
order by cl.apellido1, cl.apellido2, cl.nombre asc;
-- 4.  Devuelve un listado que solamente muestre los comerciales que no han realizado ningún pedido.
select com.* from pedido as pd right join comercial as com on pd.id_comercial = com.id where pd.id is null;
/*5.  Devuelve un listado con los clientes que no han realizado ningún pedido y de los comerciales que no han participado en ningún pedido.
Ordene el listado alfabéticamente por los apellidos y el nombre.
En en listado deberá diferenciar de algún modo los clientes y los comerciales.*/
select cl.id id_cliente, cl.nombre nombre_cliente, cl.apellido1 apellido1_cliente, cl.apellido2 apellido2_cliente, cl.ciudad, cl.categoria,
com.id id_comercial, com.nombre nombre_comercial, com.apellido1 apellido1_comercial, com.apellido2 apellido2_comercial, com.comision
from (cliente as cl left join pedido as pd on cl.id = pd.id_cliente) cross join
(pedido as pdd right join comercial as com on pdd.id_comercial = com.id) where pd.id is null and pdd.id is null
order by cl.apellido1, cl.apellido2, cl.nombre, com.apellido1, com.apellido2, com.nombre limit 1, 2; -- :(
-- 6.  ¿Se podrían realizar las consultas anteriores con NATURAL LEFT JOIN o NATURAL RIGHT JOIN? Justifique su respuesta.
/*Respuesta:
  No, dado que los nombres de las tablas coincidentes causarian redundancia o mostrarian valores incorrectos, originando
  error en las consultas o resultados no requeridos*/
  
-- 1.3.6 Consultas resumen

-- 1.  Calcula la cantidad total que suman todos los pedidos que aparecen en la tabla pedido.
select sum(total) as Cantidad_total from pedido;
-- 2.  Calcula la cantidad media de todos los pedidos que aparecen en la tabla pedido.
select avg(total) as Cantidad_media from pedido;
-- 3.  Calcula el número total de comerciales distintos que aparecen en la tabla pedido.
select count(distinct id_comercial) as Num_total_comerciales from pedido;
-- 4.  Calcula el número total de clientes que aparecen en la tabla cliente.
select count(*) as Numero_clientes from cliente;
-- 5.  Calcula cuál es la mayor cantidad que aparece en la tabla pedido.
select max(total) as Mayor_cantidad from pedido;
-- 6.  Calcula cuál es la menor cantidad que aparece en la tabla pedido.
select min(total) as Mayor_cantidad from pedido;
-- 7.  Calcula cuál es el valor máximo de categoría para cada una de las ciudades que aparece en la tabla cliente.
select max(categoria) as Maximo_categoria, ciudad from cliente group by ciudad;
/*8.  Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno de los clientes.
Es decir, el mismo cliente puede haber realizado varios pedidos de diferentes cantidades el mismo día.
Se pide que se calcule cuál es el pedido de máximo valor para cada uno de los días en los que un cliente ha realizado un pedido.
Muestra el identificador del cliente, nombre, apellidos, la fecha y el valor de la cantidad.*/
select cl.id, cl.nombre, cl.apellido1, cl.apellido2, pd.fecha, max(total) as Maximo_valor from cliente as cl join pedido as pd
on cl.id = pd.id_cliente group by cl.id, pd.fecha order by fecha;
/*9.  Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno de los clientes,
teniendo en cuenta que sólo queremos mostrar aquellos pedidos que superen la cantidad de 2000 €.*/
select cl.id, cl.nombre, cl.apellido1, cl.apellido2, pd.fecha, max(total) as Maximo_valor from cliente as cl join pedido as pd
on cl.id = pd.id_cliente where total > 2000 group by cl.id, pd.fecha order by fecha;
/*10. Calcula el máximo valor de los pedidos realizados para cada uno de los comerciales durante la fecha 2016-08-17.
Muestra el identificador del comercial, nombre, apellidos y total.*/
select com.id, com.nombre, com.apellido1, com.apellido2, max(total) from pedido as pd join comercial as com on pd.id_comercial = com.id
where pd.fecha = '2016-08-17' group by com.id, pd.fecha;
/*11. Devuelve un listado con el identificador de cliente, nombre y apellidos y el número total de pedidos que ha realizado cada uno de
los clientes. Tenga en cuenta que pueden existir clientes que no han realizado ningún pedido. Estos clientes también deben aparecer
en el listado indicando que el número de pedidos realizados es 0.*/
select cl.id, cl.nombre, cl.apellido1, cl.apellido2, count(pd.id) as total_pedidos from cliente as cl left join pedido as pd
on cl.id = pd.id_cliente group by cl.id;
/*12. Devuelve un listado con el identificador de cliente, nombre y apellidos y el número total de pedidos que ha realizado cada uno de
 los clientes durante el año 2017.*/
 select cl.id, cl.nombre, cl.apellido1, cl.apellido2, count(pd.id) as total_pedidos from cliente as cl join pedido as pd
 on cl.id = pd.id_cliente  where pd.fecha like '2017%' group by cl.id;
/*13. Devuelve un listado que muestre el identificador de cliente, nombre, primer apellido y el valor de la máxima cantidad del pedido
realizado por cada uno de los clientes. El resultado debe mostrar aquellos clientes que no han realizado ningún pedido indicando que la
máxima cantidad de sus pedidos realizados es 0. Puede hacer uso de la función IFNULL.*/
select * from cliente as cl left join pedido as pd
on cl.id = pd.id_cliente order by fecha;
select cl.id, cl.nombre, cl.apellido1, ifnull(max(pd.total), 0) as Maximo_total_pedido from cliente as cl left join pedido as pd
on cl.id = pd.id_cliente group by cl.id, pd.fecha;
-- 14. Devuelve cuál ha sido el pedido de máximo valor que se ha realizado cada año.
select year(fecha) as Anio, max(total) as 'Máximo valor' from pedido group by Anio order by Anio;
-- 15. Devuelve el número total de pedidos que se han realizado cada año.
select year(fecha) as Anio, count(*) as Total_pedidos from pedido group by Anio order by Anio;