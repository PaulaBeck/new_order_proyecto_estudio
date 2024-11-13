----------------------------------------------------
-- Tema: Procedimientos y funciones almacenadas() --
----------------------------------------------------

--Tema: Procedimientos y funciones almacenadas

--Objetivos de Aprendizaje:

--	_Comprender la diferencia entre procedimientos y funciones almacenadas.
--	_Aplicar procedimientos y funciones en la implementación de operaciones CRUD.

--Criterios de Evaluación:

--	_Correcta implementación y funcionamiento de los procedimientos y funciones.
--	_Documentación clara y precisa de cada paso y concepto.
--	_Efectividad en la manipulación de datos usando las funciones y procedimientos.

--Tareas: 

--	_Realizar al menos tres procedimientos almacenados que permitan: Insertar, Modificar y borrar registros de alguna de las tablas del proyecto.
--	_Insertar un lote de datos en las tablas mencionadas (guardar el script) con sentencias insert y otro lote invocando a los procedimientos creados. 
--	_Realizar  update y delete sobre  algunos de los registros insertados  en esas tablas invocando a los procedimientos. 
--	_Desarrollar al menos tres funciones almacenadas. Por ej: calcular la edad, 
--	Comparar la eficiencia de las operaciones directas versus el uso de procedimientos y funciones.


----------------- PROCEDIMIENTOS -------------------

-- Procedimiento para ALTA de Producto
CREATE PROCEDURE insertarProducto
(
   @nombre VARCHAR(100),
   @descripcion VARCHAR(200),
   @precio FLOAT,
   @stock INT,
   @stock_minimo INT,
   @imagen VARCHAR(200),
   @id_categoria INT
)
AS
BEGIN
   INSERT INTO Producto (nombre, descripcion, precio, stock, stock_minimo, imagen, id_categoria)
   VALUES (@nombre, @descripcion, @precio, @stock, @stock_minimo, @imagen, @id_categoria);
END;


-- Procedimiento para MODIFICACION de Producto
CREATE PROCEDURE modificarProducto
(
   @id_producto INT,
   @nombre VARCHAR(100),
   @descripcion VARCHAR(200),
   @precio FLOAT,
   @stock INT,
   @stock_minimo INT,
   @imagen VARCHAR(200),
   @id_categoria INT
)
AS
BEGIN
   UPDATE Producto
   SET nombre = @nombre, 
       descripcion = @descripcion, 
       precio = @precio, 
       stock = @stock, 
       stock_minimo = @stock_minimo, 
       imagen = @imagen, 
       id_categoria = @id_categoria
   WHERE id_producto = @id_producto;
END;


-- Procedimiento para BAJA de Producto
CREATE PROCEDURE borrarProducto
(
   @id_producto INT
)
AS
BEGIN
   DELETE FROM Producto WHERE id_producto = @id_producto;
END;

-- Procedimiento para BAJA LOGICA de Producto
CREATE PROCEDURE bajaLogicaProducto
(
   @id_producto INT
)
AS
BEGIN
   -- Verificar si el producto existe
   IF EXISTS (SELECT 1 FROM Producto WHERE id_producto = @id_producto)
   BEGIN
       -- Realizar la baja lógica, poniendo activo en 0
       UPDATE Producto
       SET activo = 0
       WHERE id_producto = @id_producto;
       
       PRINT 'Producto desactivado correctamente.';
   END
   ELSE
   BEGIN
       PRINT 'Producto no encontrado.';
   END
END;

-- Procedimiento para ALTA LOGICA de Producto
CREATE PROCEDURE altaLogicaProducto
(
   @id_producto INT
)
AS
BEGIN
   -- Verificar si el producto existe
   IF EXISTS (SELECT 1 FROM Producto WHERE id_producto = @id_producto)
   BEGIN
       -- Realizar la alta lógica, poniendo activo en 1
       UPDATE Producto
       SET activo = 1
       WHERE id_producto = @id_producto;
       
       PRINT 'Producto activado correctamente.';
   END
   ELSE
   BEGIN
       PRINT 'Producto no encontrado.';
   END
END;


----------------- FUNCIONES -------------------

-- FUNCION para calcular descuento sobre un producto:
CREATE FUNCTION calcularDescuento (@id_producto INT, @porcentaje FLOAT)
RETURNS FLOAT
AS
BEGIN
    DECLARE @precio FLOAT;
    -- Obtener el precio del producto
    SELECT @precio = precio FROM Producto WHERE id_producto = @id_producto;
    
    -- Retornar el precio con descuento
    RETURN @precio - (@precio * @porcentaje / 100);
END;


-- FUNCION para verificar si el stock está por debajo del mínimo:
CREATE FUNCTION esStockBajo (@id_producto INT)
RETURNS BIT
AS
BEGIN
    DECLARE @stock INT, @stock_minimo INT;
    -- Obtener los valores de stock y stock_minimo
    SELECT @stock = stock, @stock_minimo = stock_minimo FROM Producto WHERE id_producto = @id_producto;
    
    -- Comparar stock con stock_minimo
    IF @stock < @stock_minimo
        RETURN 1;
    RETURN 0;
END;


-- FUNCION para verificar si un producto está activo:
CREATE FUNCTION esProductoActivo (@id_producto INT)
RETURNS VARCHAR(10)
AS
BEGIN
    DECLARE @activo BIT;
    -- Obtener el estado activo del producto
    SELECT @activo = activo FROM Producto WHERE id_producto = @id_producto;
    
    -- Retornar si es activo o inactivo
    IF @activo = 1
        RETURN 'Activo';
    RETURN 'Inactivo';
END;


-- FUNCION para obtener la categoría de un producto por su ID:
CREATE FUNCTION obtenerCategoriaProducto (@id_producto INT)
RETURNS VARCHAR(100)
AS
BEGIN
    DECLARE @id_categoria INT;
    DECLARE @nombre_categoria VARCHAR(100);
    
    -- Obtener id_categoria del producto
    SELECT @id_categoria = id_categoria FROM Producto WHERE id_producto = @id_producto;
    
    -- Obtener el nombre de la categoría
    SELECT @nombre_categoria = nombre FROM Categoria WHERE id_categoria = @id_categoria;
    
    RETURN @nombre_categoria;
END;


-- FUNCION para calcular el total de productos activos en la base de datos:
CREATE FUNCTION contarProductosActivos ()
RETURNS INT
AS
BEGIN
    DECLARE @total INT;
    SELECT @total = COUNT(*) FROM Producto WHERE activo = 1;
    RETURN @total;
END;


-------------------
-- LOTE DE DATOS --
-------------------

INSERT INTO Categoria (nombre) VALUES 
('Electrónica'),
('Cocina'),
('Baño'),
('Juguetes'),
('Herramientas'),
('Decoración');

-- ALTA normal
INSERT INTO Producto (nombre, descripcion, precio, stock, stock_minimo, imagen, id_categoria)
VALUES 
('Laptop Gamer', 'Laptop de alto rendimiento para gaming', 1500.00, 10, 2, 'laptop_gamer.jpg', 1),
('Tablet Pro', 'Tablet con pantalla de alta resolución y gran capacidad', 300.00, 25, 5, 'tablet_pro.jpg', 1),
('Microondas Digital', 'Microondas con pantalla táctil y múltiples funciones', 120.00, 15, 3, 'microondas.jpg', 2),
('Juguete Educativo', 'Juego didáctico para niños', 40.00, 100, 20, 'juguete_educativo.jpg', 4),
('Termo Acero Inoxidable', 'Termo resistente al desgaste', 25.00, 50, 10, 'termo.jpg', 2),
('Auriculares Bluetooth', 'Auriculares inalámbricos de alta calidad', 80.00, 30, 5, 'auriculares.jpg', 1),
('Plancha de Ropa', 'Plancha a vapor con sistema antical', 35.00, 20, 5, 'plancha.jpg', 2),
('Set de Ollas', 'Juego de ollas antiadherentes', 90.00, 15, 3, 'ollas.jpg', 2),
('Reproductor MP3', 'Reproductor compacto y portátil', 50.00, 60, 10, 'mp3.jpg', 1),
('Peluche Gigante', 'Peluche de gran tamaño y suavidad', 25.00, 40, 5, 'peluche.jpg', 4),
('Cámara de Seguridad', 'Cámara IP con visión nocturna', 110.00, 10, 2, 'camara_seguridad.jpg', 1),
('Batidora Manual', 'Batidora con múltiples velocidades', 20.00, 35, 8, 'batidora.jpg', 2),
('Teléfono Inalámbrico', 'Teléfono fijo inalámbrico con pantalla digital', 45.00, 12, 4, 'telefono.jpg', 1),
('Taza Personalizada', 'Taza de cerámica con diseño único', 10.00, 80, 10, 'taza.jpg', 2),
('Lámpara LED', 'Lámpara de alta eficiencia energética', 15.00, 70, 15, 'lampara.jpg', 1),
('Cuchillos Profesionales', 'Set de cuchillos de chef', 75.00, 25, 4, 'cuchillos.jpg', 2),
('Robot de Cocina', 'Electrodoméstico multifunción', 200.00, 8, 2, 'robot_cocina.jpg', 2),
('Juego de Cubiertos', 'Cubiertos de acero inoxidable', 20.00, 50, 8, 'cubiertos.jpg', 2),
('Consola Retro', 'Consola con juegos clásicos', 130.00, 15, 3, 'consola.jpg', 1),
('Bolso Deportivo', 'Bolso amplio y resistente', 30.00, 40, 6, 'bolso.jpg', 3),
('Calculadora Científica', 'Calculadora de múltiples funciones', 25.00, 50, 8, 'calculadora.jpg', 1),
('Bicicleta Infantil', 'Bicicleta con ruedas de entrenamiento', 150.00, 20, 5, 'bicicleta.jpg', 4),
('Estufa Eléctrica', 'Estufa de bajo consumo', 45.00, 25, 5, 'estufa.jpg', 2),
('Reloj Deportivo', 'Reloj con medición de actividad física', 35.00, 30, 10, 'reloj.jpg', 1),
('Teclado Mecánico', 'Teclado gamer de alto rendimiento', 75.00, 20, 4, 'teclado.jpg', 1);


-- EJECUCION DE LOS PROCEDIMIENTOS

-- ALTA a traves del procedimiento
EXEC insertarProducto 'Monitor 4K', 'Monitor de alta resolución con 4K UHD', 300.00, 15, 3, 'monitor_4k.jpg', 1;
EXEC insertarProducto 'Cafetera Espresso', 'Cafetera automática de última generación', 150.00, 25, 4, 'cafetera.jpg', 2;
EXEC insertarProducto 'Zapatillas Running', 'Calzado deportivo de alto rendimiento', 80.00, 50, 10, 'zapatillas.jpg', 3;
EXEC insertarProducto 'Juego de Sartenes', 'Sartenes con recubrimiento antiadherente', 50.00, 30, 5, 'sartenes.jpg', 2;
EXEC insertarProducto 'Parlante Bluetooth', 'Parlante portátil con sonido estéreo', 60.00, 40, 10, 'parlante.jpg', 1;
EXEC insertarProducto 'Impresora Multifunción', 'Impresora con función de escaneo y copia', 120.00, 10, 2, 'impresora.jpg', 1;
EXEC insertarProducto 'Cámara Reflex', 'Cámara fotográfica de lentes intercambiables', 450.00, 5, 1, 'camara_reflex.jpg', 1;
EXEC insertarProducto 'Tenedor y Cuchara XXL', 'Set de cubiertos grandes para asado', 35.00, 40, 8, 'cubiertos_xxl.jpg', 2;
EXEC insertarProducto 'Termómetro Digital', 'Termómetro infrarrojo para adultos y niños', 20.00, 60, 15, 'termometro.jpg', 2;
EXEC insertarProducto 'Almohada Viscoelástica', 'Almohada ergonómica y adaptable', 25.00, 30, 5, 'almohada.jpg', 4;
EXEC insertarProducto 'Mochila Escolar', 'Mochila con múltiples compartimientos', 40.00, 50, 10, 'mochila.jpg', 3;
EXEC insertarProducto 'Grill Eléctrico', 'Parrilla portátil para interiores', 70.00, 20, 5, 'grill.jpg', 2;
EXEC insertarProducto 'Cargador Rápido', 'Cargador para dispositivos móviles', 15.00, 80, 20, 'cargador.jpg', 1;
EXEC insertarProducto 'Toalla de Playa', 'Toalla grande y absorbente', 20.00, 35, 5, 'toalla.jpg', 4;
EXEC insertarProducto 'Sillón Reclinable', 'Sillón ergonómico y cómodo', 200.00, 5, 1, 'sillon.jpg', 4;
EXEC insertarProducto 'Estuche para Gafas', 'Estuche rígido y protector', 10.00, 100, 25, 'estuche_gafas.jpg', 4;
EXEC insertarProducto 'Set de Herramientas', 'Herramientas para el hogar y el auto', 85.00, 15, 3, 'herramientas.jpg', 2;
EXEC insertarProducto 'Tarjeta de Memoria', 'Memoria microSD con gran capacidad', 25.00, 70, 15, 'tarjeta_sd.jpg', 1;
EXEC insertarProducto 'Linterna LED', 'Linterna recargable de larga duración', 30.00, 60, 10, 'linterna.jpg', 1;
EXEC insertarProducto 'Kit de Limpieza', 'Kit completo para limpieza del hogar', 45.00, 40, 10, 'kit_limpieza.jpg', 2;
EXEC insertarProducto 'Gafas de Sol', 'Gafas polarizadas para exteriores', 35.00, 50, 12, 'gafas.jpg', 3;
EXEC insertarProducto 'Balón de Fútbol', 'Balón profesional de alta resistencia', 50.00, 20, 5, 'balon.jpg', 4;
EXEC insertarProducto 'Mesa de Camping', 'Mesa plegable y ligera', 75.00, 10, 2, 'mesa.jpg', 4;
EXEC insertarProducto 'Cuchillo Santoku', 'Cuchillo japonés multiuso', 45.00, 25, 5, 'cuchillo_santoku.jpg', 2;
EXEC insertarProducto 'Botella Reutilizable', 'Botella de acero inoxidable', 20.00, 30, 8, 'botella.jpg', 4;


-- MODIFICACION a traves del procedimiento
EXEC modificarProducto 1, 'Laptop Gamer Nueva', 'Laptop de alto rendimiento para gaming', 1600.00, 10, 2, 'laptop_gamer.jpg', 1;
EXEC modificarProducto 2, 'Tablet Pro Nueva', 'Tablet con pantalla de alta resolución y gran capacidad', 350.00, 25, 5, 'tablet_pro.jpg', 1;

-- BAJA a traves del procedimiento
EXEC borrarProducto 3;

-- BAJA LOGICA a traves del procedimientoÇ
EXEC bajaLogicaProducto 2; -- Donde 2 es el ID del producto que quieres desactivar

EXEC altaLogicaProducto 2; -- Donde 2 es el ID del producto que quieres activar


-- Listados
SELECT * FROM Categoria;
SELECT * FROM Producto;

-- Para listar los procedimientos creados
SELECT * FROM sys.procedures;

-- Para listar las funciones creadas
SELECT name, type_desc 
FROM sys.objects 
WHERE type IN ('FN', 'TF', 'IF');

-- EJECUCION DE LAS FUNCIONES

-- Aplicar un 10% de descuento al producto con id_producto = 1
SELECT precio,dbo.calcularDescuento(1, 10) AS PrecioConDescuento FROM Producto WHERE id_producto = 1;

-- Verificar si el stock del producto con id_producto = 1 es bajo
SELECT dbo.esStockBajo(1) AS EsStockBajo; -- Resultado = 0
SELECT dbo.esStockBajo(2) AS EsStockBajo; -- Resultado = 1

-- Verificar si el producto con id_producto = 1 está activo
SELECT dbo.esProductoActivo(1) AS EstadoProducto;

-- Obtener la categoría del producto con id_producto = 1
SELECT dbo.obtenerCategoriaProducto(1) AS CategoriaProducto;

-- Obtener el total de productos activos
SELECT dbo.contarProductosActivos() AS CantidadProductos; -- Resultado esperado = 3 // Resultado obtenido = 3

-- LA FUNCION SE PUEDE UTILIZAR DENTRO DE UN SELECT, EL PROCEDIMIENTO NO
-- El objetivo de crear procedimientos de ABM, es regular a traves de permisos, las interacciones de los usuarios de la DB para evitar fatalidades por error.
