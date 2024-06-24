create database TiendaInformatica; 



use TiendaInformatica; 

 

create table FABRICANTES( 

codigo int auto_increment, 

nombre varchar(100), 

constraint pk_codigoF primary key(codigo) 

); 

 

create table ARTICULOS( 

codigo int  auto_increment, 

nombre varchar(100), 

precio int, 

fabricante int, 

constraint pk_codigoA primary key(codigo), 

constraint fk_fab foreign key(fabricante) references FABRICANTES(codigo) on delete cascade 

); 

 

select * from fabricantes; 

 

INSERT INTO FABRICANTES (nombre) VALUES( 'GRUPO ABEDSI'); 

INSERT INTO FABRICANTES (nombre) VALUES ('DISTRIBUIDORA TALA'); 

INSERT INTO FABRICANTES (nombre) VALUES	('SESICO'); 

INSERT INTO FABRICANTES (nombre) VALUES	('ITCM'); 

INSERT INTO FABRICANTES VALUES( 5, 'Grupo Toner Service'); 

INSERT INTO FABRICANTES VALUES(6, 'Grupo FEMSA');

INSERT INTO FABRICANTES VALUES(7, 'MTZ');

INSERT INTO FABRICANTES VALUES(8, 'ITCM');

INSERT INTO FABRICANTES VALUES( 9, 'ITA');

INSERT INTO FABRICANTES (nombre) VALUES('HOLA');

delete from fabricantes where codigo = 7 or codigo = 9;


select * from fabricantes; 


INSERT INTO ARTICULOS VALUES( 1, 'Teclado',100,3); 

INSERT INTO ARTICULOS VALUES( 2, 'Disco Duro 300 Gb',500,5); 

INSERT INTO ARTICULOS VALUES( 3, 'Mouse',80,3); 

INSERT INTO ARTICULOS VALUES( 4, 'Memoria USB',140,4); 

INSERT INTO ARTICULOS VALUES( 5, 'Memoria RAM',290,1); 

INSERT INTO ARTICULOS VALUES( 6, 'Disco duro extraíble',650,5); 

INSERT INTO ARTICULOS VALUES( 7, 'DVD ROM',450,2);

INSERT INTO ARTICULOS VALUES( 8, 'Memoria USB',270,1);

INSERT INTO ARTICULOS VALUES(9,'CD ROM', 200,2);

INSERT INTO ARTICULOS VALUES(10,'Tarjeta de red', 180,3);

select * from articulos;