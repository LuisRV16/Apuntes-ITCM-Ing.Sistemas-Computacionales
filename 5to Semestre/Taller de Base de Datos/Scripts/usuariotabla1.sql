use usuarios_empleados;

select * from usuarios_empleados.empleado;

insert into empleado values(1, 'Elizabeth', 'Cortez', 'Razo', '1234', '2023-10-30', 100, 1);
insert into empleado values(2, 'Carlos', 'Moreno', 'Razo', '1789', '2023-10-30', 100, 1);
insert into empleado values(3, 'Luis', 'Reyes', 'Villar', '1239', '2023-10-30', 100, 1);
insert into empleado values(4, 'Luis', 'Ricardo', 'Villar', '1539', '2023-10-30', 100, 1);
insert into empleado values(7, 'Lui', 'Ricard', 'Villr', '1499', '2023-10-30', 100, 1);
insert into empleado values(8, 'Luisasio', 'Ricardarsio', 'Villarasio', '1199', '2023-10-30', 100, 1);

select @@autocommit;

set autocommit = 0;

commit;
rollback;