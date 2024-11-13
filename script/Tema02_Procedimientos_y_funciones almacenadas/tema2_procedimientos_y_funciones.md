**Tema: Procedimientos y funciones almacenadas**

**Objetivos de Aprendizaje**  
Comprender la diferencia entre procedimientos y funciones almacenadas.  
Aplicar procedimientos y funciones en la implementación de operaciones CRUD (Crear, Actualizar, Eliminar).

**Resumen de la Actividad Realizada**  
En este trabajo, se desarrollaron procedimientos y funciones almacenadas para un sistema de gestión de ventas e inventario orientado a un polirrubro. 
El objetivo fue aplicar y comparar el uso de procedimientos almacenados en operaciones CRUD y funciones para cálculos o verificaciones específicas. 
Se realizaron las siguientes actividades:

1. Creación de Procedimientos Almacenados  

Se implementaron procedimientos almacenados para realizar las operaciones CRUD sobre la tabla Producto:  
- Procedimiento para la inserción de un producto (insertarProducto): Permite agregar nuevos productos especificando parámetros como nombre, descripción, precio, stock, entre otros.  
- Procedimiento para la modificación de un producto (modificarProducto): Permite actualizar los datos de un producto existente.  
- Procedimiento para la eliminación de un producto (borrarProducto): Permite eliminar un producto de la base de datos.
- Procedimientos para alta y baja lógica de productos (altaLogicaProducto y bajaLogicaProducto): Habilitan o deshabilitan productos mediante la actualización del campo activo.

2. Inserción de Datos mediante Procedimientos  

Se realizaron inserciones de productos tanto con sentencias INSERT directas como mediante la ejecución de procedimientos almacenados.  
Se incluyeron 25 registros con cada método para comparar su eficiencia.

3. Creación de Funciones Almacenadas  

Se desarrollaron funciones almacenadas para realizar cálculos y verificaciones específicas sobre la tabla Producto:
- calcularDescuento: Calcula un descuento sobre el precio de un producto dado un porcentaje.
- esStockBajo: Verifica si el stock de un producto está por debajo del mínimo.
- esProductoActivo: Indica si un producto está activo o inactivo.
- obtenerCategoriaProducto: Devuelve el nombre de la categoría a la que pertenece un producto.
- contarProductosActivos: Calcula el total de productos activos en la base de datos.

4. Comparación de Eficiencia

- Se comparó la eficiencia de las operaciones directas sobre las tablas versus el uso de procedimientos y funciones.
- Los procedimientos proporcionan mayor seguridad y encapsulamiento de lógica, facilitando operaciones complejas y reutilización del código.
- Se observó un ligero aumento en el tiempo de ejecución para inserciones mediante procedimientos debido al procesamiento adicional, pero este fue compensado por la mejora en la consistencia y mantenimiento.
