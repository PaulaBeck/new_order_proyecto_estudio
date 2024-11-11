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
1) Crear una nueva tabla  con una columna JSON
   para esto definimos una tabla Ciudad, declarando el atributo id_ciudad como INT IDENTITY PRIMARY KEY, y el atributo datos_ciudad el cual sera del tipo NVARCHAR(MAX) NOT NUL, (el cual almacenara datos en formato JSON).

CONSIDERACIONES:
En SQL Server no existe un tipo de dato específico para JSON, pero se puede almacenar datos JSON en columnas de tipo NVARCHAR(MAX)

2) Agregar un conjunto de datos no estructurados en formato JSON, y realizar operaciones de actualización, agregación y borrado de datos.   
Para Insertar un vuevo registro en la tabla ciudad creada anteriormente, se hara lo siguiente

INSERT INTO Ciudad (datos_ciudad)
VALUES
('{"nombre": "Corrientes", "cod_postal": "3400"}'),
('{"nombre": "Córdoba", "cod_postal": "5000"}');

Donde: 
 - INSERT INTO Ciudad (datos_ciudad) sera el objeto que agregaremos a la columna datos_ciudad
 - ('{}') las llaves indica que un nuevo objeto
	 - "nombre" sera el nombre del atributo
 	 - "corrientes" sera el valor de ese atributo

 CONSIDERACIONES: JSON se vale de una CLAVE-VALOR,  la cual la "CLAVE" es el nombre del atributo y "VALOR" sera el valor indicado que tendra este atributo 

**Operaciones Actualizacion, Agregación y borrado de datos**

 - Borrar un registro 
DELETE FROM Ciudad
WHERE id_ciudad = 4;

usamos *DELETE FROM* para relacionar la tabla de la cual eliminaremos el registro
se elimina un registro de la tabla ciudad mediante el id_ciudad
