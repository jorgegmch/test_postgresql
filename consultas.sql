-- vehículos, clientes y ventas, historial de servicios, proveedores de piezas, empleados y departamentos

-- vehiculos (id_vehiculo, marca, modelo, año, precio, estado(nuevo/usado)

-- clientes (id_cliente, identificacion_cliente, nombre_cliente, fecha_registro, historial_transacciones)

-- empleados (id_empleado, identificacion_empleado, nombre_empleado, fecha_ingreso, sueldo_empleado, cargo_empleado)

-- ventas (id_venta, empleado_venta, comision_venta)

-- proveedores (id_proveedor, identificacion_proveedor, fecha_registro,  )

-- servicios (id_servicio, mantenimiento, reparacion)






--clientes potenciales () 


insert into "inventario_vehiculos" values (id)

-- proveedores (id_proveedor, identificacion_proveedor, fecha_registro,  )

insert into inventario_vehiculos (id_vehiculo, marca, ) values ('')

insert into empleados (id_empleado, identificacion_empleado, nombre_empleado, fecha_ingreso, sueldo_empleado, cargo_empleado) 
values ( )

insert into empleados (id_empleado, identificacion_empleado, nombre_empleado, fecha_ingreso, sueldo_empleado, cargo_empleado) 
values ( )

-- Listar Vehículos Disponibles: Obtener una lista de todos los vehículos disponibles para la venta, 
-- incluyendo detalles como marca, modelo, y precio.


select marca, modelo, precio 
from inventario_vehiculos
where stock_vehiculo >= 1;


-- Clientes con Compras Recientes: Mostrar los clientes que han realizado compras recientemente, 
-- junto con la información de los vehículos adquiridos.

select id_venta, nombre_cliente
from cliente c
join venta v on  c.id = v.id
group by id_venta;


-- Historial de Servicios por Vehículo: Obtener el historial completo de servicios realizados 
-- para un vehículo específico, incluyendo detalles sobre los empleados involucrados y las fechas de servicio.

select tipo, id_empleado_fk, fecha_servicio, vehiculo
from dep_servicios ds
join vehiculos v on ds.id = v.id
where vehiculo = 'Spark GT'
group by tipo;


--Proveedores de Piezas Utilizados: Listar los proveedores de piezas que han suministrado componentes utilizados 
-- en los servicios de mantenimiento.

select nombre_proveedor, insumo
from  proveedor p
join dp_venta  dv on p.id = dv.id
group by nombre_proveedor;

-- Rendimiento del Personal de Ventas: Calcular las comisiones generadas por cada empleado del departamento de ventas 
-- en un período específico.

select sum(valor_comision_dp_venta), nombre_empleado
from dp_venta dvp
join empleado e on dvp.id = e.id
where date(fecha_venta) between '2026-03-10' and '2026-04-10';

-- Servicios Realizados por un Empleado: Identificar todos los servicios de mantenimiento realizados por un empleado específico,
-- incluyendo detalles sobre los vehículos atendidos.

select tipo_servicio, nombre_empleado
from 
where 



-- Clientes Potenciales y Vehículos de Interés: Mostrar información sobre los clientes potenciales y los vehículos de su interés, 
-- proporcionando pistas valiosas para estrategias de marketing.


select * from cliente_potencial;


-- Empleados del Departamento de Servicio: Listar todos los empleados que pertenecen 
-- al departamento de servicio, junto con sus horarios de trabajo.


select nombre_empleado, horario_trabajo
from  empleados
where departamento = 'servicio';

-- Vehículos Vendidos en un Rango de Precios: Encontrar los vehículos vendidos en un rango de 
-- precios específico, proporcionando datos útiles para análisis de ventas.


select id_ventas, vehiculo, precio
from ventas v
join inventario_vehiculos iv on v.id = iv.id;
group by id_ventas
having precio between 45000000 and 78000000;


-- Clientes con Múltiples Compras: Identificar a aquellos clientes que han realizado más de una compra 
-- en el concesionario, destacando la lealtad del cliente.

select cantidad, nombre_cliente
from venta v
join cliente c on v.id = c.id
where cantidad > 1;
group by cantidad;




























