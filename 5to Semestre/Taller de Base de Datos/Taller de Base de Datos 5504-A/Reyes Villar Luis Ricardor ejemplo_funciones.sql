create database practica_1;   -- crear una base de datos

use practica_1;   -- poner en uso la base de datos

create table dept
(
   deptno int    primary key auto_increment,    -- LLave primaria a nivel de campo 
   dname  varchar(14) not null unique,
   loc    varchar(13) not null,
   index(dname)    -- a  nivel de tabla
   
);

insert into dept (dname, loc) values ('Sistemas', 'Altamira'),
									 ('Mecanica', 'Tampico'),
                                     ('Geociencias', 'Madero'),
                                     ('Quimica', 'Madero'),
                                     ('Electrica', 'Madero'),
                                     ('Materiales', 'Altamira'),
                                     ('Industrial_2', 'Madero'),
                                     ('Geociencias_1', 'Madero'),
                                     ('Quimica_1', 'Madero'),
                                     ('Electrica_1', 'Madero');
;

create table emp
(
  empno   int  primary key auto_increment , -- Llave primaria a nivel de campo
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

call alta_emp('Luis', 'Jefe', null, '2000-01-01', 3030.00, 'H', 'Sistemas', @mensaje);
call alta_emp('Carlos', 'Docente', 'Luis', '2000-04-04', 2030.00, 'H', 'Sistemas', @mensaje);
call alta_emp('Fernanda', 'Docente', 'Luis', '0200-04-04', 2030.00, 'M', 'Sistemas', @mensaje);
call alta_emp('Karla', 'Jefe', null, '2000-01-01', 3030.00, 'M', 'Geociencias', @mensaje);
call alta_emp('Sofia', 'Docente', 'Karla', '2000-06-06', 2030.00, 'M', 'Geociencias', @mensaje);
call alta_emp('Mario', 'Docente', 'Karla', '2000-06-06', 2030.00, 'H', 'Geociencias', @mensaje);
call alta_emp('Mario', 'Docente', 'Karla', '2000-06-06', 2030.00, 'H', 'Geociencias', @mensaje);
call alta_emp('Luigi', 'Docente', null, '2000-06-06', 2030.00, 'H', null, @mensaje);
call alta_emp('Luigi', 'Docente', 'Karla', '2000-06-06', 2030.00, 'H', null, @mensaje);

select * from emp;


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

select * from dept;

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


select buscar (3);

select * from emp;

select buscarIdDepto(null);

-- Función para buscar el id del departamento dado el nombre del mismo
delimiter //
create function buscarIdDepto (nombreDepto varchar(14)) returns int deterministic
begin

    declare id int;
    select deptno into id from dept where dname = nombreDepto;
 
	return id;
end// 
delimiter ;

-- Función para buscar el Id de algun empleado que haya sido asignado como jefe dado el nombre del jefe
delimiter //
create function buscarIdJefe (nombreJefe varchar(50)) returns int deterministic
begin

    declare id int;
    select empno into id from emp where ename = nombreJefe;
 
	return id;
end// 
delimiter ;

-- Procedimiento para dar de alta un nuevo empleado
delimiter //
create procedure alta_emp(nombre varchar(50), trabajo varchar(13), nombreJefe varchar(50), fecha date, salario decimal(7,2), sexo varchar(1),
						  nombreDepto varchar(14), out mensaje varchar(100))
begin

	declare idJefe int;
    declare idDepto int;

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
    
		set idJefe = buscarIdJefe(nombreJefe);
        set idDepto = buscarIdDepto(nombreDepto);
    
		if (nombreJefe is not null and idJefe is null or nombreDepto is not null and idDepto is null) then
			set mensaje = 'El jefe o departamento que se esta tratando de asignar no existe';
		else
			insert into emp (ename, job, mgr, hiredate, sal, comm, sexo, departamento) values
				(nombre, trabajo, idJefe, fecha, salario, null , sexo, idDepto);
			set mensaje = 'El empleado ha sido dado de alta!';
		end if;

	commit;
    
end//

delimiter ;

-- Procedimiento para obtener la informacion de un empleado
delimiter //
create procedure info_emp(inout nombre varchar(50), out puesto varchar(30), out jefe varchar(50), out salario decimal (7,2), out depto varchar(14))
begin

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
        
        if exists(select * from emp where ename = nombre) then
			select emp.job, e.ename, emp.sal, dname
            into puesto, jefe, salario, depto
            from emp left join dept on departamento = deptno
            left join emp e on emp.mgr = e.empno where emp.ename = nombre;
            
            if jefe is null and depto is null then
				set jefe = 'Sin jefe asignado';
                set depto = 'Sin depto asig';
			elseif jefe is null then
				set jefe = 'Sin jefe asignado';
			elseif depto is null then
				set depto = 'Sin depto asig';
			end if;
		else
			set puesto = null;
            set jefe = null;
            set salario = null;
            set depto = null;
        end if;
        
	commit;
    
end//

delimiter ;

set @nombre = 'Luigi';
call info_emp(@nombre, @puesto, @jefe, @salario, @depto);
select @nombre Nombre_empleado, @puesto Puesto, @jefe Jefe, @salario Salario, @depto Departamento;

set @contrasena = 'contrasena';

/*dar de alta empleado, buscar empleado, recibe como parametro
el nombre del empleado salida es nombre,puesto,jefe,salario,nombre del departamento al cual pertenece*/