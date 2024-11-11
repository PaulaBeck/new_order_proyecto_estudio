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
