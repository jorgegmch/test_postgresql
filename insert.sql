-- Inventario vehiculos

insert into inventario_vehiculos (marca, modelo, anio, precio, stock_vehiculo, estado) values
('Toyota', 'Corolla', 2024, 85000000.00, 3, 'nuevo'),
('Chevrolet', 'Spark GT', 2019, 35000000.00, 1, 'usado'),
('Mazda', 'CX-5', 2024, 120000000.00, 2, 'nuevo'),
('Kia', 'Picanto', 2021, 45000000.00, 4, 'usado'),
('Ford', 'Ranger', 2023, 160000000.00, 2, 'nuevo'),
('Renault', 'Kwid', 2022, 42000000.00, 5, 'usado');

-- Clientes

insert into clientes (identificacion_cliente, nombre_cliente, estado) values 
('1098765432', 'Carlos Martinez', 'cliente activo'),
('1098765433', 'Ana Gomez', 'potencial'),
('1098765434', 'Luis Rodriguez', 'cliente activo'),
('1098765435', 'Maria Fernanda Lopez', 'cliente activo'),
('1098765436', 'Diego Ramirez', 'no potencial');

-- Empleados

insert into empleados (identificacion_empleado, nombre_empleado, sueldo_empleado, horario, rol_empleado, departamento) values
('11223344', 'Jorge Vendedor', 1500000.00, '8am - 5pm', 'Asesor Comercial', 'departamento de ventas'),
('11223355', 'Sara Ventas', 1600000.00, '9am - 6pm', 'Asesor Comercial Senior', 'departamento de ventas'),
('55667788', 'Mario Mecanico', 1800000.00, '7am - 4pm', 'Jefe de Taller', 'departamento de servicios'),
('55667799', 'Pedro Repuestos', 1400000.00, '7am - 4pm', 'Técnico de Mantenimiento', 'departamento de servicios');

--Proveedores

insert into proveedores (identificacion_proveedor, nombre_proveedor, insumo) values
('NIT-9001', 'Frenos y Partes S.A.', 'Pastillas de Freno'),
('NIT-9002', 'Llantas Colombia', 'Neumáticos'),
('NIT-9003', 'Lubricantes Premium', 'Aceite de Motor 5W-30'),
('NIT-9004', 'Filtros AutoClean', 'Filtros de Aire y Aceite');

-- Clientes potenciales

insert into cliente_potencial (id_cliente_fk, vh_interes_fk, comentario, proximo_contacto, resultado) values 
(2, 3, 'Cotizó la Mazda CX-5, espera aprobación de crédito con el banco.', '2026-07-15 10:00:00', 'En seguimiento'),
(5, 5, 'Preguntó por la Ford Ranger pero se le salió del presupuesto.', null, 'Descartado');

-- Ventas

insert into ventas (id_cliente_fk, empleado_venta_fk, vehiculo_fk, cantidad, sub_total_venta, comision_venta) values
(1, 1, 1, 1, 85000000.00, 850000.00), 
(3, 1, 2, 1, 35000000.00, 350000.00), 
(4, 2, 4, 1, 45000000.00, 450000.00), 
(1, 2, 6, 1, 42000000.00, 420000.00);

-- Historial de servicios

insert into servicios (id_vehiculo_fk, id_empleado_fk, tipo, detalles) values 
(2, 3, 'mantenimiento', 'Cambio de aceite general y revisión de niveles.'),
(1, 4, 'reparacion', 'Cambio de pastillas de freno delanteras.'),
(4, 3, 'mantenimiento', 'Alineación, balanceo y rotación de neumáticos.');

-- Piezas

insert into piezas_servicio (id_servicio_fk, id_proveedor_fk, cantidad) values 
(1, 3, 1),
(1, 4, 2),
(2, 1, 1),
(3, 2, 4);
