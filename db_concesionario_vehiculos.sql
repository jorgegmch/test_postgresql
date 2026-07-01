create schema concesionario_vehiculos;

-- Inventario Vehiculos (id_vehiculo, marca, modelo, año, precio, estado(nuevo/usado))

create type estado_vehiculo as enum (
	'nuevo',
	'usado'
);

create table if not exists inventario_vehiculos (
	id_vehiculo serial primary key,
	marca varchar(100) not null,
	modelo varchar(100) not null,
	año int not null,
	precio numeric(10,2) not null,
	stock_vehiculo int not null,
	estado estado_vehiculo
);

-- clientes (id_cliente, identificación_cliente, nombre_cliente, fecha_registro, historial_trasacciones(intermedia))

create type estado_cliente as enum (
	'potencial'
	'no potencial'
	'cliente activo'
);

create table if not exists clientes (
	id_cliente serial primary key,
	identificacion_cliente varchar(20) unique not null,
	nombre_cliente varchar(50) not null,
	fecha_registro timestamp default current_timestamp,
	estado estado_cliente
);

-- cliente potencial (id_seguimiento, id_cliente_fk, fecha_seguimiento, comentario, proximo_contacto, resultado)

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

-- empleados (id_empleado, identificacion_empleado, nombre_empleado, fecha_ingreso, sueldo_empleado, cargo_empleado)

create type dep_empleado as enum (
	'departamento de ventas'
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

-- Departamento de ventas (id_empleado_fk, ventas_generadas_fk, comisiones, fecha)

create table if not exists dep_venta (
	id_dep_ventas serial primary key,
	id_empleado_fk int not null,
	ventas_generadas_fk int not null,
	comisiones numeric(10,2),
	fecha timestamp default current_timestamp,
	foreign key(id_empleado_fk) references empleados(id_empleado)
);

-- proveedores (id_proveedor, identificacion_proveedor, fecha_registro, insumo)

create table if not exists proveedores (
	id_proveedor serial primary key,
	identificacion_proveedor varchar(50) unique not null,
	fecha_registro timestamp default current_timestamp,
	insumo varchar(100) not null
);


-- ventas (id_venta, empleado_venta, comision_venta)

create table if not exists ventas (
	id_ventas serial primary key,
	empleado_venta_fk int not null,
	vehiculo_fk int not null,
	cantidad int not null,
	sub_total_venta numeric(10,2) not null,
	comision_venta numeric(10,2) not null,
	foreign key(empleado_venta_fk) references empleados(id_empleado),
	foreign key(vehiculo_fk) references inventario_vehiculos(id_vehiculo)
);

-- Historial transacciones

create table if not exists historial_transaccion (
	id_cliente_fk int not null,
	id_venta_fk int not null,
	fecha_transaccion timestamp default current_timestamp,
	total_transaccion numeric(10,2),
	primary key(id_cliente_fk, id_venta_fk),
	foreign key(id_cliente_fk) references clientes(id_cliente),
	foreign key(id_venta_fk) references ventas(id_ventas)
);

-- Departamento de servicios

create type tipo_servicio as enum (
	'mantenimiento',
	'reparación'
);

create table if not exists dep_servicios (
	id_dep_servicios serial primary key,
	id_empleado_fk int not null,
	fecha_servicio timestamp default current_timestamp,
	tipo tipo_servicio,
	foreign key(id_empleado_fk) references empleados(id_empleado)
);

-- Historial Servicios (id_servicio, fecha_servicio, tipo_servicio(mantenimiento/reparación) - Tabla intermedia, va con vehiculos

create table if not exists historial_servicios (
	id_vehiculo_fk int not null,
	id_dep_servicios_fk int not null,
	proveedor_fk int not null,
	fecha_servicios timestamp default current_timestamp,
	primary key(id_vehiculo_fk, id_dep_servicios_fk),
	foreign key(id_vehiculo_fk) references inventario_vehiculos(id_vehiculo),
	foreign key(id_dep_servicios_fk) references dep_servicios(id_dep_servicios),
	foreign key(proveedor_fk) references proveedores(id_proveedor)
);

