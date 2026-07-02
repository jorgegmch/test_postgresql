-- 1. Listar Vehículos Disponibles: Obtener una lista de todos los vehículos disponibles para la venta, 
-- incluyendo detalles como marca, modelo, y precio.

select marca, modelo, anio, precio, estado
from inventario_vehiculos
where stock_vehiculo > 0;

-- 2. Clientes con Compras Recientes: Mostrar los clientes que han realizado compras recientemente, 
-- junto con la información de los vehículos adquiridos.

select c.nombre_cliente, v.fecha_venta, iv.marca, iv.modelo, v.sub_total_venta
from ventas v
join clientes c on v.id_cliente_fk = c.id_cliente
join inventario_vehiculos iv on v.vehiculo_fk = iv.id_vehiculo
order by v.fecha_venta desc;

-- 3. Historial de Servicios por Vehículo: Obtener el historial completo de servicios realizados 
-- para un vehículo específico, incluyendo detalles sobre los empleados involucrados y las fechas de servicio.

select s.fecha_servicio, e.nombre_empleado, s.tipo, s.detalles
from servicios s
join empleados e ON s.id_empleado_fk = e.id_empleado
where s.id_vehiculo_fk = 2; 

-- 4. Proveedores de Piezas Utilizados: Listar los proveedores de piezas que han suministrado componentes utilizados 
-- en los servicios de mantenimiento.

select distinct p.nombre_proveedor, p.insumo
from piezas_servicio ps
join proveedores p on ps.id_proveedor_fk = p.id_proveedor;

-- 5. Rendimiento del Personal de Ventas: Calcular las comisiones generadas por cada empleado del departamento de ventas 
-- en un período específico.

select e.nombre_empleado, sum(v.comision_venta) as total_comisiones, count(v.id_ventas) as autos_vendidos
from ventas v
join empleados e on v.empleado_venta_fk = e.id_empleado
group by e.nombre_empleado;

-- 6. Servicios Realizados por un Empleado: Identificar todos los servicios de mantenimiento realizados por un empleado específico,
-- incluyendo detalles sobre los vehículos atendidos.

select s.fecha_servicio, iv.marca, iv.modelo, s.tipo, s.detalles
from servicios s
join inventario_vehiculos iv on s.id_vehiculo_fk = iv.id_vehiculo
where s.id_empleado_fk = 2;

-- 7. Clientes Potenciales y Vehículos de Interés: Mostrar información sobre los clientes potenciales y los vehículos de su interés, 
-- proporcionando pistas valiosas para estrategias de marketing.

select c.nombre_cliente, c.identificacion_cliente, iv.marca as vehiculo_interes, iv.modelo, cp.comentario
from cliente_potencial cp
join clientes c on cp.id_cliente_fk = c.id_cliente
join inventario_vehiculos iv on cp.vh_interes_fk = iv.id_vehiculo;

-- 8. Empleados del Departamento de Servicio: Listar todos los empleados que pertenecen 
-- al departamento de servicio, junto con sus horarios de trabajo.

select nombre_empleado, rol_empleado, horario
from empleados
where departamento = 'departamento de servicios';

-- 9. Vehículos Vendidos en un Rango de Precios: Encontrar los vehículos vendidos en un rango de 
-- precios específico, proporcionando datos útiles para análisis de ventas.

select v.id_ventas, iv.marca, iv.modelo, v.sub_total_venta, v.fecha_venta
from ventas v
join inventario_vehiculos iv on v.vehiculo_fk = iv.id_vehiculo
where v.sub_total_venta between 30000000 and 90000000;


-- 10. Clientes con Múltiples Compras: Identificar a aquellos clientes que han realizado más de una compra 
-- en el concesionario, destacando la lealtad del cliente.

select c.nombre_cliente, count(v.id_ventas) as cantidad_compras
from ventas v
join clientes c on v.id_cliente_fk = c.id_cliente
group by c.id_cliente, c.nombre_cliente
having count(v.id_ventas) > 1;

