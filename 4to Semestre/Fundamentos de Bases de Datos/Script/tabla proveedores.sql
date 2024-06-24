create schema proveedores;
use proveedores;

create table proveedor(
id_proveedor int primary key, 
nombre varchar(15),
categoria int,
ciudad varchar(20)
);

insert into proveedor (id_proveedor, nombre, categoria, ciudad) values (01, 'Arteli',15, 'Madero'),
                                                                       (02, 'HomeDepot',10, 'Altamira'),
                                                                       (03, 'Maron',12, 'Tampico'),
                                                                       (04, 'Walmart',16, 'Tampico'),
                                                                       (05, 'Chedraui',16, 'Xicotencatl'),
                                                                       (06,'Soriana',16,'Altamira'),
                                                                       (07,'Ceramic',22,'Valles'),
                                                                       (08,'MN',10,'Pueblo Viejo'),
                                                                       (09,'Oxxo',9,'Tampico');
                                                                       
create table articulo(
id_articulo int primary key, 
descripcion varchar(30),
precio int
);                                                                       
                                                               
insert into articulo (id_articulo, descripcion, precio) values (11, 'Escritorio', 800),
															   (12, 'Aceite', 50),
															   (13, 'Cuaderno', 25),
                                                               (14, 'Catsup', 45),
															   (15, 'Cereal', 70),
															   (16, 'Lapices', 20),
                                                               (17, 'Colchon', 1600),
															   (18, 'Coca-Cola 600ml', 18),
															   (19, 'Almohada', 100),
                                                               (20,'Sabana', 100);
                                                               
create table cliente(
id_cliente int primary key,
nombre varchar(25),
ciudad varchar(20)
);    

insert into cliente (id_cliente, nombre, ciudad) values (01, 'Peter', 'Tampico'),
                                                        (02, 'Miles', 'Madero'),
                                                        (03, 'Barry', 'Altamira'),
                                                        (04, 'Jay', 'Valles'),
                                                        (05, 'Clark', 'Madero'),
                                                        (06, 'Bruce', 'Tampico'),
                                                        (07, 'Jhonny', 'Madero'),
                                                        (08, 'Albert', 'Altamira'),
                                                        (09, 'Chris', 'Valles'),
                                                        (10, 'Leon', 'Madero'),
                                                        (11, 'Scott', 'Tampico'),
                                                        (12, 'Goku', 'Madero'),
                                                        (13, 'Vegeta', 'Altamira'),
                                                        (14, 'Gohan', 'Valles'),
                                                        (15, 'Sara', 'Madero'),
                                                        (16, 'Lara', 'Tampico'),
                                                        (17, 'Iris', 'Madero'),
                                                        (18, 'Paty', 'Altamira'),
                                                        (19, 'Sus', 'Valles'),
                                                        (20, 'Elizabeth', 'Madero');
             
 create table pedido (
 id_pedido int primary key, 
 id_prov int,
 id_artic int, 
 id_client int, 
 cantidad int, 
 precio_total int,
 foreign key (id_prov) references proveedor (id_proveedor),
 foreign key (id_artic) references articulo (id_articulo),
 foreign key (id_client) references cliente (id_cliente)
 );
 
 insert into pedido (id_pedido, id_prov, id_artic, id_client, cantidad, precio_total) values (1021, 01, 11, 01, 1, 800),
																							 (1022, 01, 12, 03, 2, 100),
																							 (1023, 02, 13, 05, 8, 200),
																							 (1024, 03, 14, 07, 3, 135),
																							 (1025, 04, 15, 09, 2, 140),
																							 (1026, 05, 16, 011, 3, 60),
																							 (1027, 06, 17, 013, 5, 8000),
																							 (1028, 06, 18, 015, 2, 36),
																							 (1029, 07, 19, 017, 1, 100),
																							 (1030, 08, 20, 019, 2, 200),
																							 (1031, 09, 20, 02, 1, 100),
																							 (1032, 09, 19, 04, 2, 200),
																							 (1033, 02, 18, 06, 8, 144),
																							 (1034, 03, 17, 08, 3, 4800),
																							 (1035, 04, 16, 010, 2, 40),
																							 (1036, 05, 15, 012, 3, 210),
																							 (1037, 07, 14, 014, 5, 225),
																							 (1038, 08, 13, 016, 2, 50),
																							 (1039, 02, 12, 018, 1, 50),
																							 (1040, 01, 11, 020, 2, 1600),
																							 (1041, 04, 11, 01, 1, 800),
																							 (1042, 03, 12, 02, 2, 100),
																							 (1043, 02, 13, 020, 8, 200),
																							 (1044, 01, 14, 019, 3, 135),
																							 (1045, 09, 15, 03, 2, 140),
																							 (1046, 08, 16, 04, 3, 60),
																							 (1047, 07, 17, 018, 5, 8000),
																							 (1048, 06, 18, 017, 2, 36),
																							 (1049, 05, 19, 05, 1, 100),
																							 (1050, 04, 20, 06, 2, 200),
																							 (1051, 03, 20, 016, 1, 100),
																							 (1052, 01, 19, 015, 2, 200),
																							 (1053, 02, 18, 07, 8, 144),
																							 (1054, 02, 17, 08, 3, 4800),
																							 (1055, 03, 16, 014, 2, 40),
																							 (1056, 04, 15, 013, 3, 210),
																							 (1057, 09, 14, 09, 5, 225),
																							 (1058, 07, 13, 010, 2, 50),
																							 (1059, 07, 12, 012, 1, 50),
																							 (1060, 05, 11, 011, 2, 1600);


                                                                                                         
create table provee (
id_prov_in int, 
id_artic_in int,
primary key (id_prov_in, id_artic_in),
foreign key (id_prov_in) references proveedor(id_proveedor),
foreign key (id_artic_in) references articulo(id_articulo)
);             

insert into provee (id_prov_in, id_artic_in) values (01, 11),
												    (01, 12),
													(02, 13),
													(02, 14),
													(03, 15),
													(03, 16),
													(04, 17),
													(04, 18),
													(05, 19),
													(05, 20),
                                                    (06, 11),
												    (06, 12),
													(07, 13),
													(07, 14),
													(08, 15),
													(08, 16),
													(09, 17),
													(09, 18),
													(01, 13),
													(01, 20);
                                                    
                                                    
-- 1. Hallar el código de los proveedores que proveen el artículo 17.
select id_prov_in from provee where id_artic_in = 17;

-- 2. Hallar los clientes que solicitan artículos provistos por el proveedor 01.
select id_client from pedido where id_prov = 01;

-- 3. Hallar los clientes que solicitan algún artículo provisto por proveedores con categoría mayor que 14.
select c.id_cliente, c.nombre from cliente as c join pedido as p on c.id_cliente = p.id_client
join proveedor as pr on p.id_prov = pr.id_proveedor join provee as pv on pr.id_proveedor = pv.id_prov_in
join articulo as a on pv.id_artic_in = a.id_articulo where pr.categoria > 14;

-- 4. Hallar los pedidos realizados por clientes de la ciudad de Madero.
select * from pedido join cliente on id_cliente = id_client join proveedor on id_proveedor = id_prov
where cliente.ciudad = 'Madero';

-- 5. Hallar los pedidos en los que un cliente de Rosario solicita artículos producidos en la ciudad de Mendoza.
-- No es posible realizar esta consulta debido a que por indicaciones del docente
-- se eliminó el campo ciudad de la tabla articulo.

--  6. Hallar los pedidos en los que el cliente 13 solicita artículos no pedidos por el cliente 20.
select id_pedido from pedido  where id_client = 13 and id_artic not in (select id_pedido from pedido where id_client = 20);

-- 7. Hallar los pares de ciudades (ciudad1, ciudad2), tales que un proveedor de la Madero provee artículos pedidos por clientes de la Tampico.
select distinct p1.ciudad as ciudad1, c.ciudad as ciudad2 from proveedor p1 join provee pr on p1.id_proveedor = pr.id_prov_in
join articulo a on pr.id_artic_in = a.id_articulo join pedido pe on pr.id_artic_in = pe.id_artic
join cliente c on pe.id_client = c.id_cliente where p1.ciudad <> c.ciudad;

-- 8. Hallar el nombre de los proveedores cuya categoría sea mayor que la de todos los proveedores que proveen el artículo Cuaderno.
select pr.nombre from proveedor as pr where pr.categoria > (
    select pr2.categoria from proveedor as pr2 join provee as pv on pr2.id_proveedor = pv.id_prov_in join articulo as a on pv.id_artic_in = a.id_articulo
    where a.descripcion = 'Escritorio' order by pr2.categoria desc limit 1
);

-- 9. Hallar los proveedores que proveen el artículo más caro que haya sido comprado alguna vez por un cliente de la ciudad de Altamira.
select p.id_proveedor, p.nombre from proveedor p 
join provee pr on p.id_proveedor = pr.id_prov_in 
join articulo a on pr.id_artic_in = a.id_articulo
join pedido pe on pr.id_artic_in = pe.id_artic 
join cliente c on pe.id_client = c.id_cliente
where a.precio = (
    select MAX(precio) from articulo where id_articulo in 
    (select id_artic from pedido where id_cliente in (
            select id_cliente from cliente where ciudad = 'Altamira'
        )
    )
);

-- 10. Hallar los clientes que han pedido 2 o más artículos distintos.
select c.id_cliente, c.nombre, c.ciudad from cliente c inner join pedido p on c.id_cliente = p.id_client group by c.id_cliente, c.nombre, c.ciudad
having count(distinct p.id_artic) >= 2;

-- 11. Hallar los proveedores que no tienen ningún pedido en los que el cliente es de la ciudad de Corrientes y el artículo es producido en San Juan.
-- No es posible realizar esta consulta debido a que por indicaciones del docente
-- se eliminó el campo ciudad de la tabla articulo.

-- 12. Hallar la cantidad de artículos diferentes que son provistos por cada uno de los proveedores de la base de datos.
select pr.id_proveedor, pr.nombre,
count(distinct pv.id_artic_in) as cantidad_articulos from
proveedor as pr join provee as
pv on pr.id_proveedor = pv.id_prov_in
group by pr.id_proveedor, pr.nombre;
