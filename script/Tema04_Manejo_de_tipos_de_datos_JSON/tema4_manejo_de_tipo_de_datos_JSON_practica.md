*Tema: Manejo de tipos de datos JSON.*

Objetivos de Aprendizaje:

	_Conocer el manejo de tipos de datos JSON en bases de datos relacionales.
	_Implementar operaciones CRUD sobre datos almacenados en formato JSON.

Criterios de Evaluación:

	_Implementación correcta de operaciones con datos JSON.
	_Evaluación de la eficiencia en consultas y manipulaciones de datos JSON.
	_Documentación clara y conclusiones derivadas de las pruebas.

Tareas: 

	_Crear una nueva tabla  con una columna JSON
	_Agregar un conjunto de datos no estructurados en formato JSON, y realizar operaciones de actualización, agregación y borrado de datos.
	_Realizar operaciones de consultas.
	_Aproximaciones a la optimización de consultas para estas estructuras
	_Expresar sus conclusiones.

Resolución
1. Crear una nueva tabla con una columna JSON
Explicación:
Primero, creamos una tabla llamada Ciudad_JSON con una columna que almacena datos en formato JSON. Para ello, se utiliza el tipo de dato NVARCHAR(MAX), ya que SQL Server no tiene un tipo de dato específico para JSON (pero podemos almacenar cadenas JSON dentro de una columna NVARCHAR(MAX)).
La estructura de la tabla sería la siguiente:

CREATE TABLE Ciudad_JSON
(
    id_ciudad INT IDENTITY PRIMARY KEY,  -- Identificador único de la ciudad
    datos_ciudad NVARCHAR(MAX) NOT NULL  -- Columna para almacenar datos en formato JSON
);
 - id_ciudad es un campo autoincrementable que actúa como la clave primaria de la tabla.
 - datos_ciudad es la columna en la que almacenamos la información de cada ciudad en formato JSON.
   
3. Agregar un conjunto de datos no estructurados en formato JSON
Explicación:
Ahora vamos a insertar un conjunto de datos JSON en la tabla Ciudad_JSON. Como ejemplo, insertamos una ciudad llamada "Jujuy" con su código postal.
El JSON es una cadena que puede incluir varios pares de clave-valor y objetos anidados. Para insertar datos, utilizamos el comando INSERT INTO.

INSERT INTO Ciudad_JSON (datos_ciudad)
VALUES
('{"nombre": "Jujuy", "cod_postal": "4590"}');
Consideraciones sobre el JSON:
 - En este caso, el JSON tiene dos claves: nombre (que representa el nombre de la ciudad) y cod_postal (que es el código postal de la ciudad).
 - Si algún campo tiene un valor NULL, como en el caso de los códigos postales opcionales, podríamos representarlo como null dentro del JSON, como se muestra en algunos ejemplos anteriores.
 - 
4. Operaciones de actualización, agregación y borrado de datos
Explicación:
3.1. Actualización de datos JSON
Para actualizar datos dentro de una columna JSON, utilizamos la función JSON_MODIFY. Esta función nos permite modificar valores dentro del objeto JSON almacenado.
Ejemplo de actualización de un campo en el JSON, como el código postal de una ciudad:

UPDATE Ciudad_JSON
SET datos_ciudad = JSON_MODIFY(datos_ciudad, '$.cod_postal', '4700')
WHERE id_ciudad = 1;  -- Especificamos el id_ciudad correspondiente
 - En este caso, estamos modificando el valor de la clave cod_postal para la ciudad con id_ciudad = 1. La función JSON_MODIFY nos permite cambiar un valor dentro del objeto JSON sin necesidad de deshacer el objeto entero.
   
3.2. Agregar una nueva clave-valor al JSON
Si quisiéramos agregar un nuevo atributo al objeto JSON, como por ejemplo la región de la ciudad, utilizamos JSON_MODIFY también:

UPDATE Ciudad_JSON
SET datos_ciudad = JSON_MODIFY(datos_ciudad, '$.region', 'Norte')
WHERE id_ciudad = 1;
Aquí estamos agregando una nueva clave region con el valor 'Norte' al JSON almacenado.

3.3. Borrado de datos JSON
Para eliminar una clave del objeto JSON, utilizamos JSON_MODIFY y asignamos el valor null a esa clave.
Por ejemplo, si quisiéramos eliminar la clave cod_postal de la ciudad, haríamos lo siguiente:

UPDATE Ciudad_JSON
SET datos_ciudad = JSON_MODIFY(datos_ciudad, '$.cod_postal', NULL)
WHERE id_ciudad = 1;
En este caso, estamos eliminando el campo cod_postal del objeto JSON de la ciudad con id_ciudad = 1.

5. Operaciones de consultas
Explicación:
Una de las operaciones más comunes es consultar datos almacenados en formato JSON. Para acceder a los valores de un objeto JSON en SQL Server, utilizamos la función JSON_VALUE, que extrae un valor escalar de un JSON.
Consulta para obtener el nombre y el código postal de las ciudades:

SELECT 
    id_ciudad, 
    JSON_VALUE(datos_ciudad, '$.nombre') AS Nombre,
    JSON_VALUE(datos_ciudad, '$.cod_postal') AS 'Código Postal'
FROM Ciudad_JSON;
 - JSON_VALUE es una función que extrae valores escalares (como cadenas o números) desde el JSON. En este caso, extraemos los valores de las claves nombre y cod_postal.
Consulta para filtrar ciudades con código postal nulo:
Si queremos consultar las ciudades que no tienen código postal, podemos hacerlo de la siguiente manera:

SELECT 
    id_ciudad, 
    JSON_VALUE(datos_ciudad, '$.nombre') AS Nombre,
    JSON_VALUE(datos_ciudad, '$.cod_postal') AS 'Código Postal'
FROM Ciudad_JSON
WHERE JSON_VALUE(datos_ciudad, '$.cod_postal') IS NULL;

 - En este caso, la función JSON_VALUE se utiliza para verificar si el valor del campo cod_postal es NULL.
   
7. Aproximaciones a la optimización de consultas para estas estructuras
Explicación:
El manejo de datos en formato JSON puede tener un impacto en el rendimiento de las consultas debido a que estamos trabajando con datos no estructurados dentro de una columna de tipo NVARCHAR(MAX). Para mejorar el rendimiento de las consultas que involucran datos JSON, consideremos las siguientes aproximaciones:

 - Uso de índices: En SQL Server, no podemos indexar directamente los datos dentro de una columna JSON, pero podemos crear índices en las columnas normales, como id_ciudad, para acelerar las búsquedas.
Ejemplo de índice en la columna id_ciudad:

CREATE INDEX idx_Ciudad_JSON_id_ciudad ON Ciudad_JSON(id_ciudad);
 - Optimización en la extracción de datos JSON: En consultas complejas que involucran múltiples valores JSON, utilizar funciones como OPENJSON podría ser útil, ya que nos permite tratar el JSON como una tabla relacional, lo que facilita la manipulación y optimización de los datos.
Ejemplo de consulta usando OPENJSON para analizar el JSON:

SELECT *
FROM OPENJSON((SELECT datos_ciudad FROM Ciudad_JSON WHERE id_ciudad = 1))
WITH (nombre NVARCHAR(100), cod_postal NVARCHAR(10));

8. Conclusiones
El uso de datos en formato JSON dentro de bases de datos relacionales como SQL Server ofrece una flexibilidad significativa, especialmente cuando se manejan datos semi-estructurados o con una estructura variable. Algunas de las conclusiones clave de trabajar con JSON en SQL Server son:
 - Ventajas:
  - Flexibilidad: Podemos almacenar información estructurada de manera flexible y agregar nuevos campos sin afectar el diseño de la base de datos.
  - Facilidad de integración: El formato JSON es ampliamente utilizado para la integración con aplicaciones web y servicios API.
 - Desventajas:
  - Desempeño: Consultas complejas que involucran grandes cantidades de datos JSON pueden tener un impacto en el rendimiento debido a la falta de índices eficientes sobre el contenido del JSON.
  - Complejidad en consultas: El uso de funciones como JSON_VALUE y JSON_MODIFY agrega complejidad a las consultas, y puede ser más difícil de optimizar.
En general, el manejo de JSON en SQL Server es útil cuando se requiere almacenar datos flexibles o semi-estructurados, pero debe considerarse cuidadosamente en términos de rendimiento y optimización, especialmente a medida que crece la cantidad de datos.
