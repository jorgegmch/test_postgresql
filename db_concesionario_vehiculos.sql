create schema if not exists concesionario_vehiculos;
set search_path to concesionario_vehiculos;

-- Tabla inventario vehiculos

create type estado_vehiculo as enum (
	'nuevo',
	'usado'
);

create table if not exists inventario_vehiculos (
	id_vehiculo serial primary key,
	marca varchar(100) not null,
	modelo varchar(100) not null,
	anio int not null,
	precio numeric(12,2) not null,
	stock_vehiculo int not null,
	estado estado_vehiculo
);

-- Tabla clientes

create type estado_cliente as enum (
	'potencial',
	'no potencial',
	'cliente activo'
);

create table if not exists clientes (
	id_cliente serial primary key,
	identificacion_cliente varchar(20) unique not null,
	nombre_cliente varchar(50) not null,
	fecha_registro timestamp default current_timestamp,
	estado estado_cliente
);

-- Tabla empleados

create type dep_empleado as enum (
	'departamento de ventas',
	'departamento de servicios'
);

create table if not exists empleados (
	id_empleado serial primary key,
	identificacion_empleado varchar(20) unique not null,
	nombre_empleado varchar(50) not null,
	fecha_ingreso timestamp default current_timestamp,
	sueldo_empleado numeric(10,2) not null,
	horario varchar(50),
	rol_empleado varchar(50) not null,
	departamento dep_empleado
);

-- Tabla proveedores

create table if not exists proveedores (
	id_proveedor serial primary key,
	identificacion_proveedor varchar(50) unique not null,
	nombre_proveedor varchar(100) not null,
	fecha_registro timestamp default current_timestamp,
	insumo varchar(100) not null
);

-- Tabla cliente potencial

create table if not exists cliente_potencial (
	id_seguimiento serial primary key,
	id_cliente_fk int not null,
	vh_interes_fk int not null,
	fecha_seguimiento timestamp default current_timestamp,
	comentario text,
	proximo_contacto timestamp,
	resultado varchar(100) not null,
	foreign key (vh_interes_fk) references inventario_vehiculos(id_vehiculo),
	foreign key (id_cliente_fk) references clientes(id_cliente)
);

-- Tabla ventas

create table if not exists ventas (
	id_ventas serial primary key,
	id_cliente_fk int not null,
	empleado_venta_fk int not null,
	vehiculo_fk int not null,
	fecha_venta timestamp default current_timestamp,
	cantidad int not null,
	sub_total_venta numeric(12,2) not null,
	comision_venta numeric(10,2) not null,
	foreign key(id_cliente_fk) references clientes(id_cliente),
	foreign key(empleado_venta_fk) references empleados(id_empleado),
	foreign key(vehiculo_fk) references inventario_vehiculos(id_vehiculo)
);

-- Tabla historial de servicios

create type tipo_servicio as enum (
	'mantenimiento',
	'reparacion' 
);

create table if not exists servicios (
	id_servicio serial primary key,
	id_vehiculo_fk int not null,
	id_empleado_fk int not null,
	fecha_servicio timestamp default current_timestamp,
	tipo tipo_servicio,
	detalles text,
	foreign key(id_vehiculo_fk) references inventario_vehiculos(id_vehiculo),
	foreign key(id_empleado_fk) references empleados(id_empleado)
);

-- Tabla piezas

create table if not exists piezas_servicio (
	id_servicio_fk int not null,
	id_proveedor_fk int not null,
	cantidad int not null,
	primary key(id_servicio_fk, id_proveedor_fk),
	foreign key(id_servicio_fk) references servicios(id_servicio),
	foreign key(id_proveedor_fk) references proveedores(id_proveedor)
);
