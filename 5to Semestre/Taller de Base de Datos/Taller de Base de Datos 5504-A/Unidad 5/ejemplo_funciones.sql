create database practica_1;   -- crear una base de datos

use practica_1;   -- poner en uso la base de datos

create table dept
(
   deptno int    primary key auto_increment,    -- LLave primaria a nivel de campo 
   dname  varchar(14) not null unique,
   loc    varchar(13) not null,
   index(dname)    -- a  nivel de tabla
   
);

create table emp
(
  empno   int  primary key , -- Llave primaria a nivel de campo
  ename   varchar(50) not null,
  job     varchar(30) not null default "Docente",
  mgr     int,
  hiredate date,   -- campo tipo fecha 
  sal     decimal(7,2) not null check (sal > 1000),
  comm    decimal(7,2), 
  sexo    enum ('M','H'),
  departamento int,
  foreign key (mgr) references emp(empno),   -- Llave foránea  cíclica
  foreign key (departamento) references dept(deptno)  -- Llave foránea 
  
);


delimiter //
create procedure alta_dept ( Nombre varchar (14), localidad varchar(13), out mensaje varchar (30))
Begin

 DECLARE EXIT HANDLER FOR SQLEXCEPTION
 BEGIN
 SHOW ERRORS LIMIT 1;
 ROLLBACK;
 END; 
 
 DECLARE EXIT HANDLER FOR SQLWARNING
 BEGIN
 SHOW WARNINGS LIMIT 1;
 ROLLBACK;
 END;

START TRANSACTION;

   
   if exists (select * from dept where dname like Nombre) then
         set mensaje="El registro ya existe";
   else
         insert into dept (dname,loc) values (Nombre,localidad);
         set mensaje = "Alta exitosa";
 end if; 
 

commit;
end//

delimiter ; 


drop procedure alta_dept;

call alta_dept("Cortez", "Madero",@mensaje);

select @mensaje;









-- FUNCIONES
delimiter //
create function buscar (departamento int) returns varchar (13) DETERMINISTIC
begin
 declare nombre varchar (13);
 select dname into @nombre from dept where deptno = departamento;
 
return @nombre;
end// 
delimiter ;


select buscar (2);
