--====CREACION DE TABLA CON UNA COLUMNA JSON=====
CREATE TABLE Ciudad
(
    id_ciudad INT IDENTITY PRIMARY KEY, -- Mantiene el identificador primario
    datos_ciudad NVARCHAR(MAX) NOT NULL -- Almacena los datos en formato JSON
);
--CONSIDERACIONES:
--*En SQL Server no existe un tipo de dato específico para JSON, pero se puede almacenar datos JSON en columnas de tipo NVARCHAR(MAX)

--=================================================
--================FUNCIONES CRUD===================
--=================================================

--==================INSERTAR DATOS=================
INSERT INTO Ciudad (datos_ciudad)
VALUES
('{"nombre": "Corrientes", "cod_postal": "3400"}'),
('{"nombre": "Córdoba", "cod_postal": "5000"}');

INSERT INTO Ciudad (datos_ciudad)
VALUES
('{"nombre": "Chaco", "null": "3500"}'), 
('{"nombre": "Formosa", "cod_postal": "3600"}');

INSERT INTO Ciudad (datos_ciudad)
VALUES
('{"nombre": "Córdoba", "cod_postal": null}'),
('{"nombre": "Santa Cruz", "cod_postal": "9400"}');

--en INSERT las clave-Valor pueden ser nulos, ya sea la clave o el valor, o ambos

--consulta de la tabla
SELECT * FROM Ciudad;

--CONSIDERACIONES:
-- JSON se vale del concepto "Clave-Valor", donde para cada clave existente existe un valor asociado
-- Un conjunto de claves y valores conforman un objeto que en JSON se representa mediante la apertura y cierre de llaver{}
--Cada valor insertado es un documento JSON en forma de cadena NVARCHAR
--(esto es importante para asegurarte de que se almacenen caracteres correctamente si tienes acentos o caracteres especiales).

--==================ELIMINAR DATOS======================
-- Elimina un registro de la tabla Ciudad basado en el id_ciudad
DELETE FROM Ciudad
WHERE id_ciudad = 4; --> elimina segun el ID

--=================ACTUALIZAR DATOS===================== 
--============Actualizar valores del objeto=============
UPDATE Ciudad
SET datos_ciudad = N'{"nombre": "Buenos Aires", "cod_postal": "1000"}'
WHERE id_ciudad = 1; -- Cambia el valor según el ID que deseas actualizar

--============Actualizar un valor del Objeto==============
-- Actualiza solo el código postal en los datos JSON de un registro específico
UPDATE Ciudad
SET datos_ciudad = JSON_MODIFY(datos_ciudad, '$.cod_postal', '3400')
WHERE id_ciudad = 3; -- Cambia el valor según el ID que deseas actualizar

--==========Actualizar un objeto añadiendo una nueva Clave-Valor==========
UPDATE Ciudad
SET datos_ciudad = JSON_MODIFY(datos_ciudad, '$.region', 'Norte') --> modifico agregando otra Clave-Valor a el objeto con id_ciudad 2
WHERE id_ciudad = 2;

--CONSIDERACIONES
--JSON_MODIFY: se usa para modificar valores dentro de un campo que almacena datos en formato JSON.
--Permite actualizar, agregar o eliminar propiedades dentro del valor JSON existente.


--========CONSULTAS======================
-- Consultar el nombre de las ciudades desde el campo JSON
SELECT 
	id_ciudad AS ID,--> se selecciona como una columna normal de sql server
    JSON_VALUE(datos_ciudad, '$.nombre') AS Nombre,--> debo acceder al objeto, al atributo al cual quiero acceder 
    JSON_VALUE(datos_ciudad, '$.cod_postal') AS 'Código Postal'--> debo acceder al objeto, al atributo al cual quiero acceder
--	JSON_VALUE(datos_ciudad, '$.region') AS 'Código Postal'--> ya que agregue un nuevo Clave-Valor en el objeto 2, habra un nuevo alemento 
FROM Ciudad;

SELECT * FROM Ciudad;

--JSON_VALUE() extrae valores escalares/valores individuales

--======INSERT TABLA SUCURSAL=======
INSERT INTO Sucursal (calle, telefono, nro_calle, activo, id_ciudad)
VALUES
('Avenida Siempre Viva', '123-456-789', 742, 1, 1), 
('Calle Falsa', '987-654-321', 123, 1, 2),          
('Boulevard Principal', '555-555-555', 456, 1, 3); 

SELECT * FROM Sucursal

--****SUBCONSULTAS UTILIZANDO ALGUN TIPO DE JOIN****

--FORMA INCORRECTA DE TRAER UN DATO CON JOIN DE UNA TABLA CON FORMATO JSON
SELECT s.*, c.datos_ciudad
FROM Sucursal s
INNER JOIN Ciudad c ON s.id_ciudad = c.id_ciudad
WHERE c.id_ciudad = 1;

--FORMA CORRECTA DE TRAER UN DATO CON JOIN DE UNA TABLA CON FORMATO JSON
SELECT s.*, JSON_VALUE(c.datos_ciudad, '$.nombre') AS Nombre, JSON_VALUE(c.datos_ciudad, '$.cod_postal') AS Nombre
FROM Sucursal s
INNER JOIN Ciudad c ON s.id_ciudad = c.id_ciudad
WHERE c.id_ciudad = 1;

