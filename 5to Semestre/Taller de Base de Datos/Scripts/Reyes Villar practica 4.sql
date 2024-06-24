create schema busisness;

use busisness;

create table compradores(
	cif_comprador varchar(11) primary key,
    nombre_social varchar(30) unique,
    domicilio_social varchar(30),
    localidad varchar(30),
    c_postal varchar(5),
    telefono varchar(9) not null
);

create table articulos(
	referencia_articulo varchar(12) primary key,
    descripcion_articulo varchar(30),
    precio_unidad decimal(6,2),
    iva int check(iva >= 5 and iva <= 25),
    existencias_actuales int default 0
);

create table facturas(
	factura_no int primary key,
    fecha_factura date default (1/1/2005),
    cif_cliente varchar(11)
);

create table lineas_facturas(
	factura_no int,
    referencia_articulo varchar(12),
    unidades int,
    primary key (factura_no, referencia_articulo),
    constraint FK_LINEAS_FACTURAS foreign key (factura_no) references facturas(factura_no) on delete cascade,
    constraint FK_LINEAS_ARTICULOS foreign key (referencia_articulo) references articulos(referencia_articulo) on delete cascade
);

ALTER TABLE facturas ADD cod_oficina int;

ALTER TABLE facturas add constraint FK_FACTURA_COMPRADORES foreign key (cif_cliente) references compradores(cif_comprador); 

alter table compradores change c_postal codigo_postal varchar(5);

alter table facturas modify cod_oficina int check(cod_oficina between 1 and 1000);

alter table compradores modify codigo_postal varchar(10) not null;
alter table compradores modify codigo_postal varchar(5);
alter table compradores drop codigo_postal;
alter table compradores add codigo_postal varchar(5);
