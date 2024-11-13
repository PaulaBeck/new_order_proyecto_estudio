--================Creacion de tablas de sucursal y ciudad============================================
CREATE TABLE Sucursal
(
  id_sucursal INT IDENTITY NOT NULL,
  calle VARCHAR(100) NOT NULL,
  telefono VARCHAR(15) NOT NULL,
  nro_calle INT NOT NULL,
  activo BIT CONSTRAINT DF_Sucursal_activo DEFAULT 1 NOT NULL,
  id_ciudad INT NOT NULL,
  CONSTRAINT PK_Sucursal PRIMARY KEY (id_sucursal),
  CONSTRAINT FK_Sucursal_Ciudad FOREIGN KEY (id_ciudad) REFERENCES Ciudad(id_ciudad)
);

CREATE TABLE Sucursal2
(
  id_sucursal INT IDENTITY NOT NULL,
  calle VARCHAR(100) NOT NULL,
  telefono VARCHAR(15) NOT NULL,
  nro_calle INT NOT NULL,
  activo BIT CONSTRAINT DF_Sucursal_activo2 DEFAULT 1 NOT NULL,
  id_ciudad INT NOT NULL,
  CONSTRAINT PK_Sucursal2 PRIMARY KEY (id_sucursal),
  CONSTRAINT FK_Sucursal_Ciudad2 FOREIGN KEY (id_ciudad) REFERENCES Ciudad_JSON(id_ciudad)
);

--====CREACION DE TABLA CON UNA COLUMNA JSON=====
CREATE TABLE Ciudad_JSON
(
    id_ciudad INT IDENTITY PRIMARY KEY, -- Mantiene el identificador primario/ al ser PRIMARY KEY no puede ser null
    datos_ciudad NVARCHAR(MAX) NOT NULL -- Almacena los datos en formato JSON
);
--CONSIDERACIONES:
--*En SQL Server no existe un tipo de dato específico para JSON, pero se puede almacenar datos JSON en columnas de tipo NVARCHAR(MAX)

CREATE TABLE Ciudad
(
  id_ciudad INT IDENTITY NOT NULL,
  nombre VARCHAR(100) NOT NULL,
  cod_postal VARCHAR(10) NOT NULL,
  CONSTRAINT PK_Ciudad PRIMARY KEY (id_ciudad)
);

--*****************************CARGA DE REGISTROS*******************************

INSERT INTO Sucursal (calle, telefono, nro_calle, activo, id_ciudad)
VALUES
('Avenida Siempre Viva', '123-456-789', 742, 1, 1),
('Calle Falsa', '987-654-321', 123, 1, 2),          
('Boulevard Principal', '555-555-555', 456, 1, 3),
('P. Sherman Calle Wallaby 42, Sidney', '889-445-966', 698, 0, 3),
('Av.siempre viva', '659-879-544', 123, 1, 4),
('Calle Los Álamos', '110-222-333', 10, 1, 5),
('Avenida Belgrano', '445-667-899', 345, 1, 6),
('Boulevard Rivadavia', '333-444-555', 78, 1, 7),
('Calle San Martín', '111-222-333', 42, 0, 8),
('Pasaje del Sol', '909-808-707', 57, 1, 9),
('Avenida Córdoba', '101-202-303', 12, 1, 10),
('Calle Primera Junta', '323-454-565', 85, 0, 11),
('Avenida Mitre', '343-545-656', 67, 1, 12),
('Boulevard Los Pinos', '505-606-707', 109, 1, 13),
('Calle El Sauce', '676-787-898', 98, 0, 14),
('Avenida San Juan', '808-909-010', 30, 1, 15),
('Pasaje Los Cedros', '191-292-393', 72, 1, 16),
('Calle Montevideo', '393-484-575', 19, 1, 17),
('Avenida Roca', '575-676-787', 128, 0, 18),
('Boulevard Colón', '676-767-878', 50, 1, 19),
('Calle Las Heras', '757-868-979', 38, 1, 20),
('Avenida Santa Fe', '878-989-090', 13, 0, 21),
('Calle Ituzaingó', '505-606-777', 122, 1, 22),
('Avenida Lavalle', '777-888-999', 14, 0, 23),
('Boulevard Urquiza', '909-101-202', 85, 1, 24),
('Calle de la Estrella', '101-202-303', 5, 1, 25),
('Avenida Mendoza', '444-555-666', 39, 1, 26),
('Pasaje Independencia', '555-666-777', 103, 0, 27),
('Calle La Esperanza', '111-223-344', 73, 1, 28),
('Boulevard Central', '232-434-545', 49, 1, 29),
('Avenida de la Paz', '676-767-898', 88, 0, 30),
('Calle Peatonal', '808-909-101', 100, 1, 31),
('Avenida General Paz', '505-606-717', 64, 1, 32),
('Calle Córdoba Norte', '171-282-393', 25, 1, 33),
('Avenida del Libertador', '454-545-656', 99, 0, 34),
('Calle Bella Vista', '333-444-555', 43, 1, 35),
('Boulevard Norte', '565-676-787', 89, 1, 36),
('Calle El Progreso', '787-898-999', 74, 0, 37),
('Pasaje San Lorenzo', '232-454-565', 16, 1, 38),
('Avenida Italia', '676-898-989', 91, 1, 39),
('Boulevard de las Flores', '123-234-345', 8, 0, 40),
('Calle Aristóbulo del Valle', '303-404-505', 36, 1, 41),
('Avenida Rivadavia Este', '505-505-505', 12, 1, 42),
('Pasaje Estrella Norte', '232-343-454', 27, 1, 43),
('Calle Palma Sola', '565-676-787', 52, 1, 44),
('Boulevard del Norte', '101-101-101', 88, 1, 45),
('Avenida General Artigas', '202-303-404', 95, 0, 46),
('Calle Mercedes Norte', '909-000-000', 47, 1, 47),
('Boulevard Sud', '656-757-858', 78, 1, 48),
('Avenida Sudamérica', '101-343-454', 112, 0, 49),
('Calle Sarmiento', '232-343-455', 16, 1, 50),
('Pasaje Granaderos', '101-222-333', 77, 1, 51),
('Calle Río Negro', '898-909-010', 54, 1, 52),
('Boulevard Uruguayo', '909-222-232', 11, 1, 53),
('Avenida Corrientes Norte', '555-777-888', 120, 0, 54),
('Calle Libertad', '878-909-101', 2, 1, 55),
('Boulevard Patagonia', '212-313-414', 82, 1, 56),
('Calle Santa Clara', '676-787-898', 53, 1, 57),
('Avenida Florencio Varela', '101-202-303', 100, 0, 58),
('Calle Paso de la Patria', '323-434-545', 71, 1, 59),
('Boulevard del Puerto', '999-888-777', 29, 1, 60),
('Pasaje Sur', '676-676-676', 36, 1, 61),
('Calle Sol Oeste', '333-222-111', 82, 1, 62),
('Avenida Colonia Norte', '676-767-878', 10, 0, 63),
('Boulevard de la Independencia', '111-000-123', 101, 1, 64),
('Pasaje Carlos Gardel', '333-444-777', 78, 1, 65),
('Avenida Los Laureles', '121-212-323', 58, 1, 66),
('Calle del Río', '676-454-656', 80, 0, 67),
('Boulevard Los Andes', '101-101-101', 42, 1, 68),
('Calle Mar del Plata', '909-111-222', 9, 1, 69),
('Pasaje Los Patos', '171-282-393', 59, 1, 70),
('Avenida Entre Ríos', '123-343-454', 85, 0, 71),
('Boulevard La Plata', '333-343-454', 20, 1, 72),
('Calle Independencia Norte', '676-676-676', 56, 1, 73),
('Avenida del Sol', '909-222-333', 1, 0, 74),
('Pasaje Mitre', '898-898-898', 17, 1, 75),
('Calle San Martín Sur', '212-343-454', 100, 1, 76)

INSERT INTO Sucursal2 (calle, telefono, nro_calle, activo, id_ciudad)
VALUES
('Avenida Siempre Viva', '123-456-789', 742, 1, 1),
('Calle Falsa', '987-654-321', 123, 1, 2),          
('Boulevard Principal', '555-555-555', 456, 1, 3),
('P. Sherman Calle Wallaby 42, Sidney', '889-445-966', 698, 0, 3),
('Av.siempre viva', '659-879-544', 123, 1, 4),
('Calle Los Álamos', '110-222-333', 10, 1, 5),
('Avenida Belgrano', '445-667-899', 345, 1, 6),
('Boulevard Rivadavia', '333-444-555', 78, 1, 7),
('Calle San Martín', '111-222-333', 42, 0, 8),
('Pasaje del Sol', '909-808-707', 57, 1, 9),
('Avenida Córdoba', '101-202-303', 12, 1, 10),
('Calle Primera Junta', '323-454-565', 85, 0, 11),
('Avenida Mitre', '343-545-656', 67, 1, 12),
('Boulevard Los Pinos', '505-606-707', 109, 1, 13),
('Calle El Sauce', '676-787-898', 98, 0, 14),
('Avenida San Juan', '808-909-010', 30, 1, 15),
('Pasaje Los Cedros', '191-292-393', 72, 1, 16),
('Calle Montevideo', '393-484-575', 19, 1, 17),
('Avenida Roca', '575-676-787', 128, 0, 18),
('Boulevard Colón', '676-767-878', 50, 1, 19),
('Calle Las Heras', '757-868-979', 38, 1, 20),
('Avenida Santa Fe', '878-989-090', 13, 0, 21),
('Calle Ituzaingó', '505-606-777', 122, 1, 22),
('Avenida Lavalle', '777-888-999', 14, 0, 23),
('Boulevard Urquiza', '909-101-202', 85, 1, 24),
('Calle de la Estrella', '101-202-303', 5, 1, 25),
('Avenida Mendoza', '444-555-666', 39, 1, 26),
('Pasaje Independencia', '555-666-777', 103, 0, 27),
('Calle La Esperanza', '111-223-344', 73, 1, 28),
('Boulevard Central', '232-434-545', 49, 1, 29),
('Avenida de la Paz', '676-767-898', 88, 0, 30),
('Calle Peatonal', '808-909-101', 100, 1, 31),
('Avenida General Paz', '505-606-717', 64, 1, 32),
('Calle Córdoba Norte', '171-282-393', 25, 1, 33),
('Avenida del Libertador', '454-545-656', 99, 0, 34),
('Calle Bella Vista', '333-444-555', 43, 1, 35),
('Boulevard Norte', '565-676-787', 89, 1, 36),
('Calle El Progreso', '787-898-999', 74, 0, 37),
('Pasaje San Lorenzo', '232-454-565', 16, 1, 38),
('Avenida Italia', '676-898-989', 91, 1, 39),
('Boulevard de las Flores', '123-234-345', 8, 0, 40),
('Calle Aristóbulo del Valle', '303-404-505', 36, 1, 41),
('Avenida Rivadavia Este', '505-505-505', 12, 1, 42),
('Pasaje Estrella Norte', '232-343-454', 27, 1, 43),
('Calle Palma Sola', '565-676-787', 52, 1, 44),
('Boulevard del Norte', '101-101-101', 88, 1, 45),
('Avenida General Artigas', '202-303-404', 95, 0, 46),
('Calle Mercedes Norte', '909-000-000', 47, 1, 47),
('Boulevard Sud', '656-757-858', 78, 1, 48),
('Avenida Sudamérica', '101-343-454', 112, 0, 49),
('Calle Sarmiento', '232-343-455', 16, 1, 50),
('Pasaje Granaderos', '101-222-333', 77, 1, 51),
('Calle Río Negro', '898-909-010', 54, 1, 52),
('Boulevard Uruguayo', '909-222-232', 11, 1, 53),
('Avenida Corrientes Norte', '555-777-888', 120, 0, 54),
('Calle Libertad', '878-909-101', 2, 1, 55),
('Boulevard Patagonia', '212-313-414', 82, 1, 56),
('Calle Santa Clara', '676-787-898', 53, 1, 57),
('Avenida Florencio Varela', '101-202-303', 100, 0, 58),
('Calle Paso de la Patria', '323-434-545', 71, 1, 59),
('Boulevard del Puerto', '999-888-777', 29, 1, 60),
('Pasaje Sur', '676-676-676', 36, 1, 61),
('Calle Sol Oeste', '333-222-111', 82, 1, 62),
('Avenida Colonia Norte', '676-767-878', 10, 0, 63),
('Boulevard de la Independencia', '111-000-123', 101, 1, 64),
('Pasaje Carlos Gardel', '333-444-777', 78, 1, 65),
('Avenida Los Laureles', '121-212-323', 58, 1, 66),
('Calle del Río', '676-454-656', 80, 0, 67),
('Boulevard Los Andes', '101-101-101', 42, 1, 68),
('Calle Mar del Plata', '909-111-222', 9, 1, 69),
('Pasaje Los Patos', '171-282-393', 59, 1, 70),
('Avenida Entre Ríos', '123-343-454', 85, 0, 71),
('Boulevard La Plata', '333-343-454', 20, 1, 72),
('Calle Independencia Norte', '676-676-676', 56, 1, 73),
('Avenida del Sol', '909-222-333', 1, 0, 74),
('Pasaje Mitre', '898-898-898', 17, 1, 75),
('Calle San Martín Sur', '212-343-454', 100, 1, 76)

--Insert de la tabla de Ciudad_JSON
INSERT INTO Ciudad_JSON (datos_ciudad)
VALUES
('{"nombre": "Buenos Aires", "cod_postal": "1000"}'),
('{"nombre": "Córdoba", "cod_postal": "5000"}'),
('{"nombre": "Rosario", "cod_postal": "2000"}'),
('{"nombre": "Mendoza", "cod_postal": "5500"}'),
('{"nombre": "La Plata", "cod_postal": "1900"}'),
('{"nombre": "San Miguel de Tucumán", "cod_postal": "4000"}'),
('{"nombre": "Mar del Plata", "cod_postal": "7600"}'),
('{"nombre": "Salta", "cod_postal": "4400"}'),
('{"nombre": "Santa Fe", "cod_postal": "3000"}'),
('{"nombre": "San Juan", "cod_postal": "5400"}'),
('{"nombre": "Resistencia", "cod_postal": "3500"}'),
('{"nombre": "Neuquén", "cod_postal": "8300"}'),
('{"nombre": "Posadas", "cod_postal": "3300"}'),
('{"nombre": "San Luis", "cod_postal": "5700"}'),
('{"nombre": "Paraná", "cod_postal": "3100"}'),
('{"nombre": "Bahía Blanca", "cod_postal": "8000"}'),
('{"nombre": "Santiago del Estero", "cod_postal": "4200"}'),
('{"nombre": "Corrientes", "cod_postal": "3400"}'),
('{"nombre": "Comodoro Rivadavia", "cod_postal": "9000"}'),
('{"nombre": "San Salvador de Jujuy", "cod_postal": "4600"}'),
('{"nombre": "Trelew", "cod_postal": "9100"}'),
('{"nombre": "Rawson", "cod_postal": "9103"}'),
('{"nombre": "Viedma", "cod_postal": "8500"}'),
('{"nombre": "Río Gallegos", "cod_postal": "9400"}'),
('{"nombre": "Ushuaia", "cod_postal": "9410"}'),
('{"nombre": "Villa Mercedes", "cod_postal": "5730"}'),
('{"nombre": "Tandil", "cod_postal": "7000"}'),
('{"nombre": "San Rafael", "cod_postal": "5600"}'),
('{"nombre": "Concordia", "cod_postal": "3200"}'),
('{"nombre": "Formosa", "cod_postal": "3600"}'),
('{"nombre": "La Rioja", "cod_postal": "5300"}'),
('{"nombre": "Gualeguaychú", "cod_postal": "2820"}'),
('{"nombre": "Bariloche", "cod_postal": "8400"}'),
('{"nombre": "Zapala", "cod_postal": "8340"}'),
('{"nombre": "Catamarca", "cod_postal": "4700"}'),
('{"nombre": "San Fernando del Valle de Catamarca", "cod_postal": null}'),
('{"nombre": "Venado Tuerto", "cod_postal": "2600"}'),
('{"nombre": "General Roca", "cod_postal": "8332"}'),
('{"nombre": "Villa María", "cod_postal": "5900"}'),
('{"nombre": "Olavarría", "cod_postal": "7400"}'),
('{"nombre": "Pergamino", "cod_postal": "2700"}'),
('{"nombre": "San Nicolás de los Arroyos", "cod_postal": "2900"}'),
('{"nombre": "Luján", "cod_postal": "6700"}'),
('{"nombre": "Campana", "cod_postal": "2804"}'),
('{"nombre": "Chivilcoy", "cod_postal": "6620"}'),
('{"nombre": "Junín", "cod_postal": "6000"}'),
('{"nombre": "Mercedes", "cod_postal": "6600"}'),
('{"nombre": "Tigre", "cod_postal": "1648"}'),
('{"nombre": "Zárate", "cod_postal": "2800"}'),
('{"nombre": "Villa Gesell", "cod_postal": "7165"}'),
('{"nombre": "Pinamar", "cod_postal": "7167"}'),
('{"nombre": "Necochea", "cod_postal": "7630"}'),
('{"nombre": "Miramar", "cod_postal": "7607"}'),
('{"nombre": "Villa Carlos Paz", "cod_postal": "5152"}'),
('{"nombre": "Alta Gracia", "cod_postal": "5186"}'),
('{"nombre": "Río Cuarto", "cod_postal": "5800"}'),
('{"nombre": "Jesús María", "cod_postal": "5220"}'),
('{"nombre": "Villa Dolores", "cod_postal": "5870"}'),
('{"nombre": "Carlos Pellegrini", "cod_postal": "2440"}'),
('{"nombre": "Rafaela", "cod_postal": "2300"}'),
('{"nombre": "Reconquista", "cod_postal": "3560"}'),
('{"nombre": "Cañada de Gómez", "cod_postal": "2500"}'),
('{"nombre": "Villa Constitución", "cod_postal": "2919"}'),
('{"nombre": "Las Parejas", "cod_postal": "2505"}'),
('{"nombre": "Firmat", "cod_postal": "2630"}'),
('{"nombre": "San Justo", "cod_postal": "3040"}'),
('{"nombre": "Río Tercero", "cod_postal": "5850"}'),
('{"nombre": "Arroyito", "cod_postal": "2434"}'),
('{"nombre": "Villa Allende", "cod_postal": "5105"}'),
('{"nombre": "La Falda", "cod_postal": "5172"}'),
('{"nombre": "Cosquín", "cod_postal": "5166"}'),
('{"nombre": "Capilla del Monte", "cod_postal": "5184"}'),
('{"nombre": "Villa General Belgrano", "cod_postal": "5194"}'),
('{"nombre": "Santa Rosa de Calamuchita", "cod_postal": "5196"}'),
('{"nombre": "Embalse", "cod_postal": "5856"}'),
('{"nombre": "Alta Italia", "cod_postal": "6201"}'),
('{"nombre": "General Pico", "cod_postal": "6360"}'),
('{"nombre": "Santa Rosa", "cod_postal": "6300"}'),
('{"nombre": "Toay", "cod_postal": "6303"}'),
('{"nombre": "General Acha", "cod_postal": "8200"}'),
('{"nombre": "25 de Mayo", "cod_postal": "8301"}'),
('{"nombre": "Victorica", "cod_postal": "6319"}'),
('{"nombre": "Casilda", "cod_postal": "2170"}'),
('{"nombre": "Coronel Suárez", "cod_postal": "7540"}'),
('{"nombre": "Pehuajó", "cod_postal": "6450"}'),
('{"nombre": "Carlos Casares", "cod_postal": "6530"}'),
('{"nombre": "9 de Julio", "cod_postal": "6500"}'),
('{"nombre": "Chacabuco", "cod_postal": "6740"}'),
('{"nombre": "Bragado", "cod_postal": "6640"}'),
('{"nombre": "Saladillo", "cod_postal": "7260"}'),
('{"nombre": "Chascomús", "cod_postal": "7130"}');

--Insert de la tabla de Ciudad
INSERT INTO Ciudad (nombre, cod_postal)
VALUES
('Buenos Aires', '1000'),
('Córdoba', '5000'),
('Rosario', '2000'),
('Mendoza', '5500'),
('La Plata', '1900'),
('San Miguel de Tucumán', '4000'),
('Mar del Plata', '7600'),
('Salta', '4400'),
('Santa Fe', '3000'),
('San Juan', '5400'),
('Resistencia', '3500'),
('Neuquén', '8300'),
('Posadas', '3300'),
('San Luis', '5700'),
('Paraná', '3100'),
('Bahía Blanca', '8000'),
('Santiago del Estero', '4200'),
('Corrientes', '3400'),
('Comodoro Rivadavia', '9000'),
('San Salvador de Jujuy', '4600'),
('Trelew', '9100'),
('Rawson', '9103'),
('Viedma', '8500'),
('Río Gallegos', '9400'),
('Ushuaia', '9410'),
('Villa Mercedes', '5730'),
('Tandil', '7000'),
('San Rafael', '5600'),
('Concordia', '3200'),
('Formosa', '3600'),
('La Rioja', '5300'),
('Gualeguaychú', '2820'),
('Bariloche', '8400'),
('Zapala', '8340'),
('Catamarca', '4700'),
('San Fernando del Valle de Catamarca', NULL),
('Venado Tuerto', '2600'),
('General Roca', '8332'),
('Villa María', '5900'),
('Olavarría', '7400'),
('Pergamino', '2700'),
('San Nicolás de los Arroyos', '2900'),
('Luján', '6700'),
('Campana', '2804'),
('Chivilcoy', '6620'),
('Junín', '6000'),
('Mercedes', '6600'),
('Tigre', '1648'),
('Zárate', '2800'),
('Villa Gesell', '7165'),
('Pinamar', '7167'),
('Necochea', '7630'),
('Miramar', '7607'),
('Villa Carlos Paz', '5152'),
('Alta Gracia', '5186'),
('Río Cuarto', '5800'),
('Jesús María', '5220'),
('Villa Dolores', '5870'),
('Carlos Pellegrini', '2440'),
('Rafaela', '2300'),
('Reconquista', '3560'),
('Cañada de Gómez', '2500'),
('Villa Constitución', '2919'),
('Las Parejas', '2505'),
('Firmat', '2630'),
('San Justo', '3040'),
('Río Tercero', '5850'),
('Arroyito', '2434'),
('Villa Allende', '5105'),
('La Falda', '5172'),
('Cosquín', '5166'),
('Capilla del Monte', '5184'),
('Villa General Belgrano', '5194'),
('Santa Rosa de Calamuchita', '5196'),
('Embalse', '5856'),
('Alta Italia', '6201'),
('General Pico', '6360'),
('Santa Rosa', '6300'),
('Toay', '6303'),
('General Acha', '8200'),
('25 de Mayo', '8301'),
('Victorica', '6319'),
('Casilda', '2170'),
('Coronel Suárez', '7540'),
('Pehuajó', '6450'),
('Carlos Casares', '6530'),
('9 de Julio', '6500'),
('Chacabuco', '6740'),
('Bragado', '6640'),
('Saladillo', '7260'),
('Chascomús', '7130');

/*Tema: Manejo de tipos de datos JSON.*
	_Crear una nueva tabla  con una columna JSON
	_Agregar un conjunto de datos no estructurados en formato JSON, y realizar operaciones de actualización, agregación y borrado de datos.
	_Realizar operaciones de consultas.
	_Aproximaciones a la optimización de consultas para estas estructuras
	_Expresar sus conclusiones.
*/

--============================================================
--================FUNCIONES CRUD===================
--=================================================

--==================INSERTAR DATOS Ciudad_JSON=================
INSERT INTO Ciudad_JSON (datos_ciudad)
VALUES
--('{"nombre": "Jujuy", "cod_postal": "7599"}'),
--('{"nombre": "Jujuy", "cod_postal": null}');
('Corrientes{"nombre" : "Mercedes", "cod_postal" : "3400"}'),
('Catamarca{"nombre" : "Mercedes", "cod_postal" : "3400"}');

--consulta de la tabla
SELECT * FROM Ciudad;
SELECT * FROM Ciudad_JSON;

--CONSIDERACIONES:
-- JSON se vale del concepto "Clave-Valor", donde para cada clave existente existe un valor asociado
-- Un conjunto de claves y valores conforman un objeto que en JSON se representa mediante la apertura y cierre de llaver{}
--Estás insertando datos en la columna datos_ciudad de la tabla Ciudad.
--Cada valor insertado es un documento JSON en forma de cadena NVARCHAR
--(esto es importante para asegurarte de que se almacenen caracteres correctamente si tienes acentos o caracteres especiales).

--==================ELIMINAR DATOS======================
-- Elimina un registro de la tabla Ciudad basado en el id_ciudad
DELETE FROM Ciudad
WHERE id_ciudad = 4; --> elimina segun el ID


--========================AGREGAR DATOS======================
SELECT 
    id_ciudad,
    nombre,
    cod_postal
FROM 
    Ciudad
FOR JSON AUTO;

--FOR JSON AUTO convierte el resultado de la consulta en un formato JSON automáticamente, generando un objeto para cada fila

--***********************************
SELECT 
    'Lista de Ciudades' AS Ciudades,
    (
        SELECT 
            id_ciudad, 
            nombre, 
            cod_postal
        FROM 
            Ciudad
        FOR JSON PATH
    ) AS ListaCiudades
FOR JSON PATH, WITHOUT_ARRAY_WRAPPER;

--FOR JSON PATH personalizar resultado, controlando la estructura de los objetos.

--La agregación con JSON es útil para generar respuestas estructuradas que combinen datos de diferentes tablas, ofrecer una 
--salida más adecuada para la web y API, y simplificar la manipulación de datos complejos que deben ser consumidos por sistemas o servicios externos.

--=================ACTUALIZAR DATOS===================== 
--============Actualizar valores del objeto=============
UPDATE Ciudad_JSON
SET datos_ciudad = '{"nombre": "Buenos Aires", "cod_postal": "1200"}'
WHERE id_ciudad = 1; -- Cambia el valor según el ID que deseas actualizar

--============Actualizar un valor del Objeto==============
-- Actualiza solo el código postal en los datos JSON de un registro específico
UPDATE Ciudad_JSON
SET datos_ciudad = JSON_MODIFY(datos_ciudad, '$.nombre', 'buenos aires')
WHERE id_ciudad = 1; -- Cambia el valor según el ID que deseas actualizar

--==========Actualizar un objeto añadiendo otra Clave-Valor==========
UPDATE Ciudad_JSON
SET datos_ciudad = JSON_MODIFY(datos_ciudad, '$.region', 'Norte')
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
	--JSON_VALUE(datos_ciudad, '$.region') AS 'Region'--> ya que agregue un nuevo Clave-Valor en el objeto 2, habra un nuevo alemento 
FROM Ciudad_JSON;

SELECT * FROM Ciudad_JSON;

--JSON_VALUE() extrae valores escalares/valores individuales

TRUNCATE TABLE Sucursal


SELECT COUNT(*) FROM Sucursal --> 77 registros
SELECT COUNT(*) FROM Sucursal2 --> 77 registros
SELECT COUNT(*) FROM Ciudad --> 91 registros
SELECT COUNT(*) FROM Ciudad_JSON --> 91 registros


--===Constrain de valores null
ALTER TABLE Ciudad_JSON
ADD CONSTRAINT CN_cod_postal_not_null CHECK (
    JSON_VALUE(datos_ciudad, '$.cod_postal') IS NOT NULL
);

--*****************SUBCONSULTAS **********************

--FORMA INCORRECTA DE TRAER UN DATO CON JOIN DE UNA TABLA CON FORMATO JSON
SELECT s.*, c.datos_ciudad
FROM Sucursal s
INNER JOIN Ciudad c ON s.id_ciudad = c.id_ciudad
WHERE c.id_ciudad = 1;


--CONSULTA DE TODAS LAS SUCURSALES CON SU CIUDAD Y COD.POSTAL QUE CORRESPONDAN AL ID:CIUDAD = 1
SELECT s.*, JSON_VALUE(c.datos_ciudad, '$.nombre') AS Nombre, JSON_VALUE(c.datos_ciudad, '$.cod_postal') AS 'Código Postal'
FROM Sucursal2 s
INNER JOIN Ciudad_JSON c ON s.id_ciudad = c.id_ciudad
WHERE c.id_ciudad = 3;

SELECT s.*,c.nombre AS Nombre, c.cod_postal AS 'Código Postal'
FROM Sucursal s
INNER JOIN Ciudad c ON s.id_ciudad = c.id_ciudad
WHERE c.id_ciudad = 3;

--=======busca las ciudades de Santa cruz
SELECT s.*
FROM Sucursal2 s
INNER JOIN Ciudad_JSON c ON s.id_ciudad = c.id_ciudad
WHERE JSON_VALUE(c.datos_ciudad, '$.nombre') = 'Santa Cruz';

SELECT s.*,c.nombre AS Nombre, c.cod_postal AS Nombre
FROM Sucursal s
INNER JOIN Ciudad c ON s.id_ciudad = c.id_ciudad
WHERE c.nombre = 'Santa Cruz';

--======busca los codigos postales que sean nulos 
SELECT s.*,JSON_VALUE(c.datos_ciudad, '$.nombre') AS Nombre, JSON_VALUE(c.datos_ciudad, '$.cod_postal') AS 'Código Postal'
FROM Sucursal2 s
INNER JOIN Ciudad_JSON c ON s.id_ciudad = c.id_ciudad
WHERE JSON_VALUE(c.datos_ciudad, '$.cod_postal') is null;

SELECT s.*,c.nombre AS Nombre, c.cod_postal AS 'Código Postal'
FROM Sucursal s
INNER JOIN Ciudad c ON s.id_ciudad = c.id_ciudad
WHERE c.cod_postal is null;

--=========buscar una ciudad la cual su nombre empiece con 'Ca' 
SELECT JSON_VALUE(c.datos_ciudad, '$.nombre') AS Nombre, JSON_VALUE(c.datos_ciudad, '$.cod_postal') AS 'Código Postal',s.*
FROM Sucursal2 s
INNER JOIN Ciudad_JSON c ON s.id_ciudad = c.id_ciudad
WHERE JSON_VALUE(c.datos_ciudad, '$.nombre') LIKE 'Ca%'; --> 5 registros

SELECT c.nombre AS Nombre, c.cod_postal AS 'Código Postal',s.*
FROM Sucursal s
INNER JOIN Ciudad c ON s.id_ciudad = c.id_ciudad
WHERE c.nombre like 'Ca%'; --> 5 registros

--=========buscar una ciudad la cual su nombre empiece con 'C' 
SELECT JSON_VALUE(c.datos_ciudad, '$.nombre') AS Nombre, JSON_VALUE(c.datos_ciudad, '$.cod_postal') AS 'Código Postal',s.*
FROM Sucursal2 s
INNER JOIN Ciudad_JSON c ON s.id_ciudad = c.id_ciudad
WHERE JSON_VALUE(c.datos_ciudad, '$.nombre') LIKE 'C%'; --> 5 registros

SELECT c.nombre AS Nombre, c.cod_postal AS 'Código Postal',s.*
FROM Sucursal s
INNER JOIN Ciudad c ON s.id_ciudad = c.id_ciudad
WHERE c.nombre like 'C%'; --> registros

--=========buscar una ciudad la cual su nombre empiece con 'C' 
SELECT JSON_VALUE(c.datos_ciudad, '$.nombre') AS Nombre, JSON_VALUE(c.datos_ciudad, '$.cod_postal') AS 'Código Postal',s.*
FROM Sucursal2 s
INNER JOIN Ciudad_JSON c ON s.id_ciudad = c.id_ciudad
WHERE JSON_VALUE(c.datos_ciudad, '$.cod_postal') LIKE '%00'; --> 5 registros

SELECT c.nombre AS Nombre, c.cod_postal AS 'Código Postal',s.*
FROM Sucursal s
INNER JOIN Ciudad c ON s.id_ciudad = c.id_ciudad
WHERE c.cod_postal like '%00'; --> registros
