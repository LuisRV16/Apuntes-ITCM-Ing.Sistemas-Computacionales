create schema empresa;
use empresa;

create table centros(
numce int primary key,
nomce varchar(25) not null,
dirce varchar(25)
-- Regla N°2:
-- activo boolean not null default true
-- primary key (numce,nomce)
);

create table departamentos(
numde int primary key,
numcentro int,
direc int,
tidir varchar(15),
presu decimal(3,1), -- check(presu>5000),
depde int,
nomde varchar(20),
-- Regla N°1:
-- activo boolean not null default true,
foreign key (numcentro) references centros (numce),
constraint FK_recursiva foreign key (depde) references departamentos (numde)
);

create table empleados(
numem int primary key not null,
extel int,
fecna date,
fecim date,
salar int,
comis int,
numhi int,
nomem varchar(10),
numde int,
-- Regla N°1:
-- asignado boolean not null default true,
foreign key (numde) references departamentos (numde)
-- Alteración 2:
-- constraint CK_comis_zero check (comis = 0 or comis is null)
);

-- Regla N°1:
-- UPDATE departamentos SET activo = false WHERE numde = 1;
-- UPDATE empleados SET numde = NULL WHERE numde = 1;

-- Regla N°2:
-- UPDATE centros SET activo = false WHERE numce = 1;

-- Alteración 1:
-- ALTER TABLE empleados
-- CHANGE COLUMN nomem nomempleado varchar(10);


-- Reglas del negocio:
-- Regla N°1:
-- Si desaparece un departamento, los empleados asignados a este departamento no desaparecen
-- sólo se quedan en espera de una nueva asignación
-- Regla N°2:
-- Un centro no puede darse de baja, sólo pasará a un estatus inactivo
-- Alteración 1:
-- Cambia el nombre el campo "nomem" por "nomempleado"
-- Alteración 2:
-- Establece una restricción en el campo "comis" del empleado en 0 si no tiene comisiones


insert into centros (numce, nomce, dirce) values(01,'ITCM','Cd. Madero'),
												(02,'TECNM','Tampico'),
                                                (03,'Sistemas','Altamira'),
                                                (04,'ITCM_2','Altamira');
                                                
insert into departamentos (numde, numcentro, direc, tidir, presu, depde, nomde) values (02,1,3,'Madero',21.2,1,'Lab. Sistemas'),
																					   (03,2,2,'Altamira',22.3,2,'Mecanica'),
																					   (04,2,2,'Altamira',23.4,3,'Lab. Mecanica'),
																					   (05,3,1,'Tampico',24.5,4,'Quimica');
                                                                                  
                                                                                  
insert into empleados (numem, extel, fecna, fecim, salar, comis, numhi, nomem, numde) values (02,038,'2004-12-02','2023-05-26',10000,1,0,'Rodriguez',02),
                                                                                             (03,038,'2004-12-03','2023-05-27',10000,1,0,'Ramos',03),
                                                                                             (04,038,'2004-12-04','2023-05-28',10000,1,0,'Rosas',04),
                                                                                             (05,038,'2004-12-05','2023-05-29',10000,1,0,'Raul',05),
                                                                                             (06,038,'2004-12-06','2023-05-30',10000,1,0,'Raulio',02),
                                                                                             (07,038,'2004-12-07','2023-05-31',10000,1,0,'Sara',05),
                                                                                             (08,038,'2004-12-08','2023-06-01',10000,1,0,'Sosa',03),
                                                                                             (09,038,'2004-12-09','2023-06-02',10000,1,0,'Samuel',03),
                                                                                             (10,038,'2004-12-10','2023-06-02',10000,1,0,'Soraida',01);
																			
                                                                            
select nomem as Empleado, numde as Numero_De_Departamento from empleados;

-- (select * from departamentos as depa right join departamentos as depto on depa.numde = depto.depde);

select depa.nomde as Departamento_Central, depto.nomde as Departamento from departamentos as depa join departamentos as depto on depa.numde = depto.depde;
-- select depa.nomde as Departamento_Central, depto.nomde as Departamento from departamentos as depa right join departamentos as depto on depa.numde = depto.depde;



