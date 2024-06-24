create schema mascotas;

use mascotas;

create table mascota(
	id int primary key,
    nombre varchar(15) not null,
    especie varchar(1) not null,
    sexo varchar(1) not null,
    ubicacion varchar(10) not null,
    estado varchar(1) not null
);

insert into mascota values (120, "Fermin", 'G', 'M', "ubi1", 'A'),
						   (110, "Luna", 'G', 'H', "ubi1", 'A'),
                           (130, "Jacinto", 'G', 'M', "ubi3", 'B'),
                           (150, "Misha", 'P', 'H', "ubi2", 'A'),
                           (140, "Aker", 'P', 'M', "ubi2", 'A'),
                           (170, "Simon", 'G', 'M', "ubi3", 'B'),
                           (190, "Rupe", 'P', 'M', "ubi2", 'A'),
                           (100, "Teo", 'G', 'M', "ubi1", 'A'),
                           (200, "Milka", 'P', 'H', "ubi2", 'A'),
                           (180, "Mopa", 'P', 'H', "ubi2", 'B');
                           
-- Preguntas: 
-- 1. ¿Cuántos gatos de cada sexo hay en total actualmente en el centro?
select sexo, count(sexo) cantidad from mascota where especie like 'G' group by sexo;

-- 2. ¿Cuántos ejemplares contiene actualmente cada jaula o ubicación?
select ubicacion, count(*) Cantidad from mascota group by ubicacion;

-- 3. ¿cuantos ejemplares de cada especie, y dentro de cada especie de cada sexo, hay actualmente en el centro?
select especie, sexo, count(*) Cantidad from mascota group by especie, sexo;

-- 4. ¿Qué ubicaciones del centro de mascotas tienen más de dos ejemplares?
select ubicacion from mascota group by ubicacion having count(*) > 2;

-- 5. ¿Qué ubicaciones del centro de mascotas tienen tan solo un ejemplar?
select ubicacion from mascota group by ubicacion having count(*) = 1;

-- 6. Mostrar las ubicaciones del centro de mascotas que tienen entre 2 a 5 ejemplares.
select ubicacion from mascota group by ubicacion having count(*) between 2 and 5;

 /*7.Lista de los perros que han pasado por el centro, de modo que primero aparezcan las bajas, y al final las altas, o 
 perros que siguen en el centro. Además queremos que en segundo término la lista este ordenada por nombre.*/
select * from mascota order by estado desc, nombre asc;

/*8. Obtenga el número actual de ejemplares de cada ubicación del centro de mascotas,
que tengan dos o más ejemplares ordenado de mayor a menor por número de ejemplares y en segundo termino por ubicación.*/
select ubicacion, count(*) Cantidad from mascota group by ubicacion having Cantidad >= 2 order by Cantidad desc, ubicacion;