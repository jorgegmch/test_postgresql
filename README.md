# Examen PostgreSQL - Concesionario de Vehículos 🚗

Este repositorio contiene la solución al examen práctico de bases de datos relacionales, diseñado para mejorar la gestión de información en un concesionario de vehículos. El proyecto aborda la estructuración, almacenamiento y consulta de datos críticos como el inventario, ventas, clientes, servicios de taller, empleados y proveedores.

## 📋 Descripción del Proyecto

El sistema de base de datos fue modelado y normalizado para evitar redundancias y garantizar la integridad referencial. Permite al concesionario:
* Gestionar un **inventario** detallado de vehículos (nuevos y usados).
* Registrar el ciclo de vida de **clientes**, incluyendo el seguimiento a clientes potenciales.
* Administrar el **departamento de ventas** y calcular comisiones por empleado.
* Llevar un **historial de servicios** de mantenimiento y reparación, asociando las piezas suministradas por los proveedores.

## 📂 Estructura del Repositorio

Cumpliendo con los requerimientos de la evaluación, el repositorio contiene los siguientes archivos:

* 📄 `diagrama_ER.png` / `diagrama_ER.md`: Contiene el Diagrama Entidad-Relación (lógico y físico) reflejando el proceso de normalización.
* 📄 `estructura_y_datos.sql`: Script DDL para la creación del esquema y las tablas con sus respectivas restricciones (Primary Keys, Foreign Keys, Enums). Incluye también el código DML con las inserciones de datos de prueba.
* 📄 `consultas.sql`: Script con la resolución de los 10 requerimientos de extracción de datos planteados en el examen (uso de JOINs, funciones de agregación y filtros).
* 📄 `README.md`: Documentación principal del proyecto.

## 🛠 Tecnologías Utilizadas

* **Motor de Base de Datos:** PostgreSQL
* **Lenguaje:** SQL (DDL, DML, DQL)
* **Herramientas de Modelado:** Mermaid / Diagramado ER
* **Entorno de Desarrollo sugerido:** DBeaver / pgAdmin

## 🚀 Instrucciones de Ejecución

Para desplegar esta base de datos en un entorno local, sigue estos pasos:

1. Clona este repositorio en tu máquina local:
   ```bash
   git clone [https://github.com/TuUsuario/Examen_PostgreSQL_Apellido1Nombre1.git](https://github.com/TuUsuario/Examen_PostgreSQL_Apellido1Nombre1.git)
