DROP DATABASE IF EXISTS curso_natacion;

create schema curso_natacion;

use curso_natacion;

create table grupo(
	cod_gru varchar(5) primary key,
    capacidad int not null,
    nivel varchar(10) not null
);

create table monitor(
	numero int primary key auto_increment,
    nombre varchar(50) not null,
    formacion varchar(30) not null
);

create table monitor_grupo(
	cod_gru varchar(5) not null,
    num_monitor int not null,
    limite int not null,
    primary key(cod_gru, num_monitor),
    constraint fk_codigo_grupo foreign key (cod_gru) references grupo(cod_gru),
    constraint fk_numero_monitor foreign key (num_monitor) references monitor(numero)
);

create table escuincle(
	codigo int primary key,
    nombre varchar(30) not null,
    edad int not null,
    cod_gru varchar(5),
    num_monitor int,
    constraint fk_cod_grupo foreign key(cod_gru) references grupo(cod_gru),
    constraint fk_n_monitor foreign key(num_monitor) references monitor(numero)
);

insert into grupo values('G1', 10, 'inicial'),
						('G2', 15, 'medio'),
                        ('G3',15,'alto');
                        
insert into monitor (nombre, formacion) values('Alfonso Peris', 'Monitor-T1'),
						  ('María Llopis', 'Monitor-T2'),
                          ('Juan Cruz', 'Monitor-T1'),
                          ('Pedro Rius', 'Socorrista');
                          
insert into monitor_grupo values ('G1', 1, 4),
								 ('G1', 2, 6),
                                 ('G2', 3, 7),
                                 ('G2', 4, 4),
                                 ('G3', 3, 7);
                                 
insert into escuincle values (1111, 'Juan', 7, 'G1', null),
							 (2222, 'Luisa', 8, 'G1', null),
                             (3333, 'Pedro', 8, 'G2', null),
                             (4444, 'María', 8, 'G2', 3),
                             (5555, 'Luis', 10, 'G3', 3);

-- ///////////// Consultas /////////////

-- 1. Mostrar el nombre del monitor, grupo y nivel a los que esta asignado cada monitor
/*Nombre del Monitor   Grupo    Nivel 

Alfonso Peris         G1 

María Llopis          G2 

Juan Cruz             G2  

Juan Cruz             G3 

Pedro Rius            G2 */

select nombre, cod_gru, nivel from monitor join monitor_grupo on numero = num_monitor natural join grupo;

-- 2. Mostrar cuantos niños tiene cada grupo 
select count(codigo) as Cantidad_niños, cod_gru as grupo from escuincle natural join grupo group by cod_gru;
-- 3. Mostrar la capacidad total de los grupos, subgrupos y cupos disponibles de cada grupo.
select cod_gru, capacidad, sum(limite) limites_subgrupos, (capacidad - sum(limite)) cupos_disponibles
from grupo natural join monitor_grupo
group by cod_gru;

select mg.cod_gru, mg.limite, tr.capacidad, tr.limites_subgrupos, tr.cupos_disponibles 
from monitor_grupo as mg natural join (select cod_gru, capacidad, sum(limite) limites_subgrupos, (capacidad - sum(limite)) cupos_disponibles
from grupo natural join monitor_grupo
group by cod_gru) as tr;

-- 4. Asignar a los niños Juan=Alfonso, Luisa=María y Pedro=Juan el número correspondiente de su monitor asignado. 
update escuincle set num_monitor = (select numero from monitor where nombre = 'Alfonso Peris') 
where codigo = (select codigo from grupo where nombre = 'Juan');
update escuincle set num_monitor = (select numero from monitor where nombre = 'María Llopis') 
where codigo = (select codigo from grupo where nombre = 'Luisa');
update escuincle set num_monitor = (select numero from monitor where nombre = 'Juan Cruz') 
where codigo = (select codigo from grupo where nombre = 'Pedro');
-- 5. Mostrar la edad promedio de los niños total y por grupo. 
select avg(edad) edad_promedio, cod_gru from grupo natural left join escuincle group by cod_gru;
-- 6. Informar la cantidad de grupos que tiene asignado cada monitor, mostrando el nombre del monitor, la cantidad y ordenado de menor a mayor. 
select nombre, count(cod_gru) as cantidad_grupos from monitor join monitor_grupo on numero = num_monitor
group by numero order by cantidad_grupos asc;
-- 7. Realizar un informe detallado de Nombre del niño, edad, nivel y nombre del monitor asignado y grupo. 
select n.nombre nombre_niño, edad, nivel, monitor.nombre nombre_monitor, cod_gru from escuincle as n
natural join grupo join monitor on num_monitor = numero;
-- 8. Informe de cuantos monitores tienen formación Monitor T1. 
select count(*) as cantidad_monitores, formacion from monitor where formacion = 'Monitor-T1' group by formacion;
-- 9. Dar de alta a tres niños, uno por nivel (asignar monitor socorrista).
insert into escuincle values 
(6666, 'Goten', 10, (select cod_gru from grupo where nivel = 'inicial'), (select numero from monitor where formacion = 'Socorrista')),
(7777, 'Trunks', 11, (select cod_gru from grupo where nivel = 'medio'), (select numero from monitor where formacion = 'Socorrista')),
(8888, 'Pan', 4, (select cod_gru from grupo where nivel = 'alto'), (select numero from monitor where formacion = 'Socorrista'));
-- 10. El socorrista cambio de formación a T1.
update monitor set formacion = 'Monitor-T1' where numero = 4;