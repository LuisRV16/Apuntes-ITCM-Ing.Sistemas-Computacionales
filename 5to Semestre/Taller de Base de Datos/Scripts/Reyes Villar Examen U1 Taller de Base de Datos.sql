create schema ministerio_de_salud;

use ministerio_de_salud;

create table hospital(
	codigo int primary key,
    nombre varchar(20) not null unique, -- lo tenia sin unique
    direccion varchar(50) not null unique, -- lo tenia sin unique
    telefono int not null unique, -- lo tenia sin unique
    cantidad_camas int not null
);

create table sala(
	codigo int not null,
    codigo_hospital int not null,
    nombre varchar(20) not null,
    cantidad_camas int not null,
    primary key(codigo, codigo_hospital),
    foreign key(codigo_hospital) references hospital(codigo)
);

create table medico(
	cedula varchar(20) not null unique,
    codigo_hospital int not null,
    nombre varchar(40) not null,
    especialidad varchar(30) not null,
    primary key(cedula, codigo_hospital),
    foreign key(codigo_hospital) references hospital(codigo) on delete restrict on update cascade
);

create table laboratorio(
	codigo int primary key,
    nombre varchar(20) not null,
    direccion varchar(50) not null unique, -- lo tenia sin unique
    telefono int not null unique -- lo tenia sin unique
);

create table servicio(
	codigo_hospital int not null,
    codigo_laboratorio int not null,
    descripcion varchar(50) not null,
    fecha_realizacion date not null,
    primary key(codigo_hospital, codigo_laboratorio, fecha_realizacion), -- lo tenia sin la fecha
    foreign key(codigo_hospital) references hospital(codigo),
    foreign key(codigo_laboratorio) references laboratorio(codigo)
);

create table paciente(
	cedula_id varchar(20) primary key,
    numero_registro int not null,
    numero_cama int, -- no se pone restriccion not null
    codigo_sala int not null,
    codigo_hospital int not null,
    nombre varchar(20) not null,
    direccion varchar(50) not null,
    fecha_nacimiento date not null,
    sexo enum('M', 'F') not null,
    foreign key(codigo_sala, codigo_hospital) references sala(codigo, codigo_hospital)
);

create table diagnostico(
	codigo int primary key,
    cedula_paciente varchar(20) not null,
    tipo varchar(10) not null,
    complicaciones varchar(30),
    fecha date not null,
    foreign key(cedula_paciente) references paciente(cedula_id)
);

create table atencion(
	cedula_paciente varchar(20) not null,
    cedula_medico varchar(20) not null,
    fecha date not null,
    primary key(cedula_paciente, cedula_medico, fecha), -- lo tenia sin fecha de atencion
    foreign key(cedula_paciente) references paciente(cedula_id),
    foreign key(cedula_medico) references medico(cedula)
);

-- 3 hospitales 3 salas por hospital, 10 camas por sala, 4 laboratorios dados de alta, 5 medicos por hospital, 8 pacientes de 1 a 2 diagnosticos

select * from hospital;

-- INSERT INTO

insert into hospital values(102, "Bene", "Av. Hidalgo 1364 CP. 89366", 8339475937, 10),
						   (103, 'Cemain', 'Av. Hidalgo 7402 CP. 88365', 8331083302, 10),
                           (104, 'Angeles' 'Av. Hidalgo 7294 CP. 87566', 8330287492, 10);
                          
select * from sala;

insert into sala values (28, 102, 'pediatrica', 10),
						(29, 102, 'internamiento', 10),
                        (30, 102, 'triage', 10),
                        (28, 103, 'obstetricia', 10),
                        (29, 103, 'rehabilitacion', 10),
                        (30, 103, 'medicina general', 10),
                        (28, 104, 'urgencia', 10),
                        (29, 104, 'sala de parto', 10),
                        (30, 104, 'jeriatria', 10);

select * from medico;

insert into medico (cedula, nombre, codigo_hospital, especialidad) values
('K83HG83KD930GN37FK30', 'Gerardo Vainilla Ramos Perez', 102, 'otorrinolaringologo');

insert into medico values ('J295KD05HS75KV83L839F', 102, 'Ramon Aguilar Aguilera', 'oftalmologo');

insert into medico (cedula, nombre, codigo_hospital, especialidad) values
('KQIEDPÑSJR930GNVKS18GM', 'Luis Aparico Olmos Rodrigue', 102, 'pediatra'),
('KDIMERUVKDMUIRMJKDKL99', 'Mario Bros Gerrero Fernandez', 102 , ''),
(),
(),
(),

