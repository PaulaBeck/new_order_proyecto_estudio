/*	BASE DE DATOS I - 2024
	PROYECTO DE ESTUDIO - NEW ORDER
	COMISION 2 - GRUPO 3
	Tema 4: Optimización de consultas a través de índices
--*/

USE DB_NEW_ORDER;	-- Ubicarse en la BD a trabajar

----------------------------------------------------------------------
-- 1) Carga masiva de datos (1 millón de registros)
----------------------------------------------------------------------

-- Creacion de una nueva tabla venta (ventas 1) -> tabla sin indice
CREATE TABLE Ventas1 (
    id_venta INT IDENTITY(1,1),		-- Clave primaria cuyo valor se incrementa automáticamente desde 1 en adelante 
    fecha_venta DATE,				-- Columna donde se almacenará la fecha de cada venta
    total_venta DECIMAL(10, 2),		-- Columna donde se almacenará el monto total de cada venta, en formato de hasta 10 digitos con 2 decimales despues de la coma
	CONSTRAINT PK_Ventas1 PRIMARY KEY (id_venta)
);

-- Creacion de una nueva tabla venta (ventas 2) -> tabla con indice
CREATE TABLE Ventas2 (
    id_venta INT IDENTITY(1,1),		-- Clave primaria cuyo valor se incrementa automáticamente desde 1 en adelante 
    fecha_venta DATE,				-- Columna donde se almacenará la fecha de cada venta
    total_venta DECIMAL(10, 2),		-- Columna donde se almacenará el monto total de cada venta, en formato de hasta 10 digitos con 2 decimales despues de la coma
	CONSTRAINT PK_Ventas2 PRIMARY KEY (id_venta)
);

-- Carga masiva de datos -> tiempo de ejecucion: 1:03

-- A) Variables a utilizar
DECLARE @FechaFin DATETIME = '2024-12-31'; -- Fecha final deseada  
DECLARE @FechaInicio DATETIME = DATEADD(DAY, -365, @FechaFin); -- Fecha de inicio deseada (1 año antes)  
DECLARE @NumRegistros INT = 1000000; -- Número de registros a insertar (1 millon)

-- B) Tabla temporal para almacenar registros a insertar  
CREATE TABLE #TempVentas (fecha_venta DATETIME, total_venta DECIMAL(10, 2));  

-- C) Generar registros aleatorios utilizando bucle while
DECLARE @i INT = 1;  
WHILE @i <= @NumRegistros  
BEGIN  
    -- Generar una fecha aleatoria entre la fecha de inicio y la fecha final  
    DECLARE @RandomDays INT = FLOOR(RAND() * DATEDIFF(DAY, @FechaInicio, @FechaFin));  
    DECLARE @FechaVenta DATETIME = DATEADD(DAY, @RandomDays, @FechaInicio);  
    
    -- Generar un monto de venta aleatorio  
    DECLARE @TotalVenta DECIMAL(10, 2) = ROUND(RAND() * 20000, 2);  
    
    -- Insertar en la tabla temporal  
    INSERT INTO #TempVentas (fecha_venta, total_venta) VALUES (@FechaVenta, @TotalVenta);  
    
    SET @i = @i + 1;  
END;  

-- D) Insertar los datos de la tabla temporal a las tablas finales
INSERT INTO Ventas1 (fecha_venta, total_venta)  
SELECT fecha_venta, total_venta FROM #TempVentas; 

INSERT INTO Ventas2 (fecha_venta, total_venta)  
SELECT fecha_venta, total_venta FROM #TempVentas;  

-- E) Limpiar la tabla temporal  
DROP TABLE #TempVentas;  

----------------------------------------------------------------------
-- 2) Búsqueda sin índice y registro del plan de ejecución
----------------------------------------------------------------------

-- Consulta sobre la columna 'fecha' con el periodo de ventas de 1 mes (enero-febrero 2024)
SET STATISTICS TIME ON;
SET STATISTICS IO ON;

SELECT *
FROM Ventas1
WHERE fecha_venta BETWEEN '2024-01-01' AND '2024-02-01'
ORDER BY fecha_venta ASC;

/*	Resultados de la revision del plan de ejecución y el tiempo de respuesta
	Registros devueltos: 87.455
	Table 'Ventas1'. Scan count 1, logical reads 3109
	SQL Server Execution Times: CPU time = 140 ms,  elapsed time = 1718 ms.
*/

SET STATISTICS TIME OFF;
SET STATISTICS IO OFF;

----------------------------------------------------------------------
-- 3) Definir un índice agrupado sobre la columna fecha y
--    repetir la consulta anterior.
----------------------------------------------------------------------

-- 3.A) Eliminar índice agrupado actual (clave primaria)
ALTER TABLE Ventas2 DROP CONSTRAINT PK_Ventas2;

-- 3.B) Crear un índice agrupado sobre la columna 'fecha_venta'
CREATE CLUSTERED INDEX IDX_Ventas2_Fecha ON Ventas2(fecha_venta);

-- 3.C) Crear un índice no agrupado sobre la columna 'id_venta'
ALTER TABLE Ventas2 ADD CONSTRAINT PK_Ventas2 PRIMARY KEY NONCLUSTERED (id_venta);

-- 3.D) Repeticion de la consulta
SET STATISTICS TIME ON;
SET STATISTICS IO ON;

SELECT *
FROM Ventas2
WHERE fecha_venta BETWEEN '2024-01-01' AND '2024-02-01'
ORDER BY fecha_venta ASC;

/*	Resultados de la revision del plan de ejecución y el tiempo de respuesta
	Registros devueltos: 87.455
	Table 'Ventas2'. Scan count 1, logical reads 361
	SQL Server Execution Times: CPU time = 15 ms,  elapsed time = 567 ms.
*/

SET STATISTICS TIME OFF;
SET STATISTICS IO OFF;

----------------------------------------------------------------------
-- 4) Borrar el índice creado
----------------------------------------------------------------------
DROP INDEX IDX_Ventas2_Fecha ON Ventas2;

----------------------------------------------------------------------------------------------
-- 5) Definir otro índice agrupado sobre la columna fecha,
--    pero que además incluya las columnas seleccionadas y repetir la consulta anterior
----------------------------------------------------------------------------------------------

-- 5.A) Crear un índice no agrupado que incluya todas las columnas de la tabla
--		(id_venta y total_venta)
CREATE NONCLUSTERED INDEX IDX_Ventas2_Fecha_Monto 
ON Ventas2(fecha_venta) INCLUDE (id_venta, total_venta);

-- 5.B) Repeticion de la consulta
SET STATISTICS TIME ON;
SET STATISTICS IO ON;

SELECT *
FROM Ventas2
WHERE fecha_venta BETWEEN '2024-01-01' AND '2024-02-01'
ORDER BY fecha_venta ASC;

/*	Resultados de la revision del plan de ejecución y el tiempo de respuesta
	Registros devueltos: 87.455
	Table 'Ventas2'. Scan count 1, logical reads 329
	SQL Server Execution Times: CPU time = 47 ms,  elapsed time = 506 ms.
*/

SET STATISTICS TIME OFF;
SET STATISTICS IO OFF;

-- 5.C) Comparacion de tiempos de rta y plan de ejecucion entre tablas (venta1, sin indice) y (ventas2, con indice no agrupado)
SELECT *
FROM Ventas1
WHERE fecha_venta BETWEEN '2024-01-01' AND '2024-02-01'
ORDER BY fecha_venta ASC;

/*	Resultados de la revision del plan de ejecución y el tiempo de respuesta
	Registros devueltos: 87.455
	Table 'Ventas1'. Scan count 1, logical reads 3109
	SQL Server Execution Times: CPU time = 219 ms,  elapsed time = 934 ms.
*/

SELECT *
FROM Ventas2
WHERE fecha_venta BETWEEN '2024-01-01' AND '2024-02-01'
ORDER BY fecha_venta ASC;

/*	Resultados de la revision del plan de ejecución y el tiempo de respuesta
	Registros devueltos: 87.455
	Table 'Ventas2'. Scan count 1, logical reads 329
	SQL Server Execution Times: CPU time = 0 ms,  elapsed time = 884 ms.
*/
