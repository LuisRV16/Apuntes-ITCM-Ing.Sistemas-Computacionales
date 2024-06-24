create schema ventas_2;

use ventas_2;

create table cliente(
	id_cliente int primary key,
    nombre varchar(50) not null,
    direccion varchar(100) not null,
    telefono varchar(30) not null,
    ciudad varchar(20) not null
);

create table producto(
	id_producto int primary key,
    descripcion varchar(50) not null,
    precio float not null
);

create table venta(
	id_venta int primary key,
    cantidad int not null,
    id_cliente int not null,
    id_producto int not null,
    foreign key (id_producto) references producto(id_producto),
    foreign key (id_cliente) references cliente(id_cliente)
);

INSERT INTO CLIENTE VALUES(123,'Simon Bolivar', 'Kra11#9-56', '7702291', 'Cali'); 
INSERT INTO CLIENTE VALUES(456,'Mark Zuckerberg', 'Cll 21#95-52', '+57-315291', 'Medellin'); 
INSERT INTO CLIENTE VALUES(789,'Drew Barrymore', 'Kra52#65-05', '3125359456', 'Cali'); 
INSERT INTO CLIENTE VALUES(741,'Larry Page', 'Cll 05#52-95', '7872296', 'Tunja');
INSERT INTO CLIENTE VALUES(147,'Tom Delonge', 'Cll 52#65-56', '7992293', 'Medellin'); 
INSERT INTO CLIENTE VALUES(852,'Simon Bolivar', 'Kra 21#65-52', '982295', 'Bogota'); 
INSERT INTO CLIENTE VALUES(258,'Mark Hoppus', 'Cll 11#95-9', '8952294', 'Bogota'); 
INSERT INTO CLIENTE VALUES(963,'Britney Spears', 'Cll 05#52-56', '7705295', 'Tunja'); 
INSERT INTO CLIENTE VALUES(369,'John Forbes Nash', 'Kra 21#05-56', '776622966', 'Cali'); 
INSERT INTO CLIENTE VALUES(159,'Tom Delonge', 'Kra05#65-05', '6702293','Medellin'); 
INSERT INTO CLIENTE VALUES(753,'Sergey Brin', 'Cll 11#65-11', '9702299', 'Medellin'); 
INSERT INTO CLIENTE VALUES(153,'Emma Watson', 'Kra 9#9-95', '31569638', 'Tunja'); 
INSERT INTO PRODUCTO VALUES(1,'Coca-Cola 2L',2400); 
INSERT INTO PRODUCTO VALUES(2,'Doritos',1000); 
INSERT INTO PRODUCTO VALUES(3,'Salchicha',3600); 
INSERT INTO PRODUCTO VALUES(4,'Pan',500); 
INSERT INTO PRODUCTO VALUES(5,'Queso',1000); 
INSERT INTO PRODUCTO VALUES(6,'Sandia',8000); 
INSERT INTO PRODUCTO VALUES(7,'Leche 1L',4563); 
INSERT INTO PRODUCTO VALUES(8,'Atun',1800); 
INSERT INTO PRODUCTO VALUES(9,'Pescado',7856); 
INSERT INTO PRODUCTO VALUES(10,'Cicla Estatica',1800); 
INSERT INTO PRODUCTO VALUES(11,'Camiseta',12000); 
INSERT INTO PRODUCTO VALUES(12,'Blue-Jean',7800); 
INSERT INTO PRODUCTO VALUES(13,'Papaya',1400); 
INSERT INTO PRODUCTO VALUES(14,'Agua en Bolsa',1800); 
INSERT INTO PRODUCTO VALUES(15,'Red Bull',1200); 
INSERT INTO VENTA VALUES(1,5,123,1); 
INSERT INTO VENTA VALUES(2,6,123,2); 
INSERT INTO VENTA VALUES(3,7,123,3); 
INSERT INTO VENTA VALUES(4,8,123,4); 
INSERT INTO VENTA VALUES(5,2,456,5); 
INSERT INTO VENTA VALUES(6,4,741,6); 
INSERT INTO VENTA VALUES(7,5,456,7); 
INSERT INTO VENTA VALUES(8,600,741,8); 
INSERT INTO VENTA VALUES(9,69,852,9); 
INSERT INTO VENTA VALUES(10,15,789,10); 
INSERT INTO VENTA VALUES(11,11,456,5); 
INSERT INTO VENTA VALUES(12,22,789,6); 
INSERT INTO VENTA VALUES(13,11,753,7); 
INSERT INTO VENTA VALUES(14,10,963,12); 
INSERT INTO VENTA VALUES(15,65,963,11); 
INSERT INTO VENTA VALUES(16,12,852,10); 
INSERT INTO VENTA VALUES(17,65,741,9); 
INSERT INTO VENTA VALUES(18,78,147,8); 
INSERT INTO VENTA VALUES(19,92,258,9); 
INSERT INTO VENTA VALUES(20,12,258,6); 
INSERT INTO VENTA VALUES(21,32,147,3); 
INSERT INTO VENTA VALUES(22,3,789,1); 
INSERT INTO VENTA VALUES(23,45,456,2); 
INSERT INTO VENTA VALUES(24,5,123,3); 
INSERT INTO VENTA VALUES(25,5,789,4); 
INSERT INTO VENTA VALUES(26,6,456,1); 
INSERT INTO VENTA VALUES(27,4,123,2); 
INSERT INTO VENTA VALUES(28,7,789,12); 
INSERT INTO VENTA VALUES(29,8,258,13); 
INSERT INTO VENTA VALUES(30,9,852,14); 
INSERT INTO VENTA VALUES(31,9,753,15); 
INSERT INTO VENTA VALUES(32,6,753,10); 
INSERT INTO VENTA VALUES(33,7,159,9); 
INSERT INTO VENTA VALUES(34,8,963,10); 
INSERT INTO VENTA VALUES(35,9,369,8); 
INSERT INTO VENTA VALUES(36,15,369,7); 
INSERT INTO VENTA VALUES(37,5,123,5); 
INSERT INTO VENTA VALUES(38,6,123,6); 
INSERT INTO VENTA VALUES(39,7,123,7); 
INSERT INTO VENTA VALUES(40,8,123,8); 
INSERT INTO VENTA VALUES(41,5,123,9); 
INSERT INTO VENTA VALUES(42,6,123,10); 
INSERT INTO VENTA VALUES(43,7,123,11);

-- 1. Id de los clientes de Cali.
select id_cliente from cliente where ciudad = 'Cali';

-- 2. Id y la descripción de los productos que cuesten menos de $1500 pesos.
select id_producto, descripcion from producto where precio < 1500;

-- 3. Id y nombre de los clientes, cantidad vendida y la descripción del producto, en las ventas en las cuales se vendieron más de
 --   10 unidades.
select id_cliente, nombre, cantidad, descripcion from cliente natural join venta natural join producto where cantidad > 10;

-- 4. Id y nombre de los clientes que no aparecen en la tabla de ventas (Clientes que no han comprado productos).
select id_cliente, nombre from cliente natural left join venta where id_venta is null;

-- 5. Id y nombre de los clientes que han comprado todos los productos de la empresa.
select id_cliente, nombre from cliente natural join venta group by id_cliente
having count(distinct id_producto) = (select count(id_producto) from producto);
    
-- 6. Id, nombre de cada cliente y la suma total (suma de cantidad) de los productos que ha comprado.
select id_cliente, nombre, sum(cantidad) suma_cantidad from cliente natural left join venta group by id_cliente;

-- 7. Id de los productos que no han sido comprados por clientes de Tunja.
select id_producto from producto where id_producto not in(
	select id_producto from cliente natural join venta where ciudad like 'Tunja'
);

-- 8. Id de los productos que se han vendido a clientes de Medellín y que también se han vendido a clientes de Bogotá.
select distinct id_producto from cliente natural join venta where ciudad like 'Medellín' or ciudad like 'Bogotá';

-- 9. Nombre de las ciudades en las que se han vendido todos los productos.
select distinct ciudad from cliente natural join venta group by id_producto, ciudad;