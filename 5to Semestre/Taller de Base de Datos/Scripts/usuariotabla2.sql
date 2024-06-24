use usuarios_empleados;

select * from usuarios_empleados.empleado;

insert into empleado values(5, 'Luiso', 'Ricardoa', 'Villaro', '1139', '2023-10-30', 100, 1);
insert into empleado values(6, 'Karina', 'Rocio', 'Reyes', '1939', '2023-10-30', 100, 1);
insert into empleado values(9, 'Luisonio', 'Ricardonio', 'Villaronio', '1399', '2023-10-30', 100, 1);

select @@autocommit;

set autocommit = 0;

commit;
rollback;