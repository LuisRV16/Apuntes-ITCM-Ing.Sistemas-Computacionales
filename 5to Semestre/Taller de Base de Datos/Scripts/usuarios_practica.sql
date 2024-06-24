create schema usuarios_empleados;

use usuarios_empleados;

create table Departamento 
(
codigo int,
nombre varchar(20) unique,
descripcion varchar(100),
constraint pk_departamento primary key(codigo)
);

insert into departamento values (1, 'departamento 1', 'hola');

create table Empleado 
(
Codigo int (5),
Nombre varchar (20) not null,
Apellido1 varchar (20) not null,
Apellido2 varchar (20) not null,
Dni varchar (9) unique,
Fecha date,
Salario float (7,2) not null check(Salario > 0),
departamento int,
foreign key (departamento) references Departamento(codigo) ON delete set null,
constraint PK_Codigo primary key (Codigo)
);

-- Tablas del sistema

use mysql;

select *  from mysql.user;
SELECT * FROM mysql.db;
show grants for 'usertabla'@'localhost';

-- Crear usuarios


-- Nivel

-- 1. GLOBAL
create user 'global'@'localhost' identified by 'global';
grant update,select on *.* to 'global'@'localhost';
-- revoke insert on *.* from 'global'@'localhost';
   
-- 2. Base de Datos
-- drop user 'dasedatos'@'localhost';

create user 'basedatos'@'localhost' identified by 'basedatos';
grant select,insert,update on usuarios_empleados.* to 'basedatos'@'localhost';
drop user 'BD'@'localhost';
-- rename user 'dasedatos'@'localhost' to 'BD'@'localhost';

-- Cambiar contraseña
ALTER USER 'BD'@'localhost' IDENTIFIED BY 'datos';

-- 3. Tabla
create user 'usertabla'@'localhost' identified by 'usertabla';
grant select, update, insert on usuarios_empleados.Empleado to 'usertabla'@'localhost';
-- grant select,update on usuarios_empleados.departamento to 'usertabla'@'localhost';

create user 'usertabla2'@'localhost' identified by 'usertabla2';
grant insert, select, update on usuarios_empleados.Empleado to 'usertabla2'@'localhost';

create user 'usuariotabla'@'localhost' identified by 'usuariotabla';
grant select, update, insert on usuarios_empleados.Empleado to 'usuariotabla'@'localhost';
alter user 'usuariotabla'@'localhost' identified by 'user';

grant select, update, insert on usuarios_empleados.Departamento to 'usuariotabla'@'localhost';
revoke select, update, insert on usuarios_empleados.Departamento from 'usuariotabla'@'localhost';

create user 'usuariotabla2'@'localhost' identified by 'usuariotabla2';
grant select, update, insert on usuarios_empleados.Empleado to 'usuariotabla2'@'localhost';
alter user 'usuariotabla2'@'localhost' identified by 'user';



revoke update on cientificos.cientifico  from 'usertabla'@'localhost';

-- 4. Columna 
create user 'usercolumna'@'localhost' identified by 'usertabla';
grant select(nombre,apellido1,apellido2), update(fecha) on usuarios_empleados.empleado to 'usercolumna'@'localhost';

-- 5. Usuario para que otorga acciones (select, update, insert, etc....)

create user 'userpriv'@'localhost' identified by 'userpriv';
GRANT  select,update,insert  on  *.*  to 'userpriv'@'localhost' WITH GRANT OPTION;
-- revoke all privileges, grant option from 'userpriv'@'localhost';

flush privileges;

/*Modificar nombre usuario
rename user nombre_viejo to nombre_nuevo

Modificar contraseña
ALTER USER 'BD'@'localhost' IDENTIFIED BY 'datos';


GRANT ON privilegios TO 'usuario'@'host_de_conexion' IDENTIFIED BY 'password' WITH GRANT OPTION;
*/

select @@autocommit; -- para visualizar el estado de la variable "autocommit"
-- 1 significa que cualquier insert, delete y commit se verá reflejado en la base de datos

set autocommit = 0; -- si se quiere deshabilitar las transacciones se ingresa 0 en el estado de la variable

rollback; -- Se deshacen todas las lineas de codigos anteriores si ocurre algun error

commit; -- se utiliza para indicar que hubo una transaccion con exito

start transaction; -- las lineas de codigo que continua todas las lineas de codigo siguiente las identifica como una transaccion


-- 

