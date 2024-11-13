**Tema 3: Optimización de consultas a través de índices**:

**Objetivos de Aprendizaje:**

  - Conocer los tipos de índices y sus aplicaciones.
  - Evaluar el impacto de los índices en el rendimiento de las consultas.

**Criterios de Evaluación:**
  - Medición correcta de los tiempos de respuesta antes y después de aplicar índices.
  - Documentación detallada de los planes de ejecución de las consultas.
  - Evaluación de la mejora en el rendimiento.

**Tareas:**
1) Realizar una carga masiva de por lo menos un millón de registro sobre alguna tabla que contenga un campo fecha (sin índice). Hacerlo con un script para poder automatizarlo.
2) Realizar una búsqueda por periodo y registrar el plan de ejecución utilizado por el motor y los tiempos de respuesta.
3) Definir un índice agrupado sobre la columna fecha y repetir la consulta anterior. Registrar el plan de ejecución utilizado por el motor y los tiempos de respuesta.
4) Borrar el índice creado.
5) Definir otro índice agrupado sobre la columna fecha pero que además incluya las columnas seleccionadas y repetir la consulta anterior. Registrar el plan de ejecución utilizado por el motor y los tiempos de respuesta.
6) Expresar las conclusiones en base a las pruebas realizadas.

**Resolucion:**
1) Carga masiva de datos (1 millón de registros):

Se implemento el uso de tabla temporal para el tratamiento y calculos de las fechas, el uso de una tabla a modo de ejemplo siguiendo el modelo del proyecto de estudio, variables locales y bucle while para hacer la insercion de los datos en dos tablas distintas para que una posea indices (ventas2) mientras que la otra no (ventas1)

2) Búsqueda sin índice y registro del plan de ejecución:

Primeramente, se deben habilitar las sentencias:

 - SET STATISTICS TIME ON: Muestra el tiempo que toma ejecutar cada consulta. El servidor devuelve información sobre el tiempo total de CPU y el tiempo total de ejecución (en milisegundos).

 - SET STATISTICS IO ON: Muestra estadísticas sobre las operaciones de E/S realizadas por las consultas. El servidor proporciona información sobre el número de lecturas lógicas y físicas, así como el número de lecturas de índices y de tablas.

Luego, se realiza la consulta sobre la columna 'fecha' con el periodo de ventas de 1 mes (enero-febrero 2024).

Se finaliza la consulta deshabiliando las operaciones de tiempo y E/S, se verifica el plan de ejecucion y se registran los siguientes resultados.

	2) Resultados de la revision del plan de ejecución y el tiempo de respuesta

	Tiempo de rta:
		Registros devueltos: 87.455
		Table 'Ventas1'. Scan count 1, logical reads 3109, physical reads 0, page server reads 0, read-ahead reads 0, page server read-ahead reads 0, lob 			logical reads 0, lob physical reads 0, lob page server reads 0, lob read-ahead reads 0, lob page server read-ahead reads 0.
		SQL Server Execution Times: CPU time = 140 ms,  elapsed time = 1718 ms.

3) Definir un índice agrupado sobre la columna fecha y repetir la consulta anterior.

Observamos que al querer crear un nuevo indice agrupado ocurre un error, ya que la tabla "Ventas2" ya posee un indice agrupado y en SQL Server solo puede existir un índice agrupado por tabla. Al tener la restriccion CONSTRAINT para establecer a "id_venta" como clave primaria, se genera un índice agrupado a partir de ese campo.

Para crear el indice agrupado que incluya la columna "fecha_venta" debemos eliminar el indice actual (definido por la restriccion) y crear uno (manualmente)

Error:
 ![tema3_img_error_3](https://github.com/PaulaBeck/new_order_proyecto_estudio/blob/master/script/Tema03_Optimizacion_de_consultas_a_traves_de_indices/tema3_img_error_3.jpg)

3.A) Eliminar índice agrupado actual (clave primaria).  
3.B) Crear un índice agrupado sobre la columna 'fecha_venta'.  
3.C) Crear un índice no agrupado sobre la columna 'id_venta'

Indices:  
 ![tema3_img_indices_3](https://github.com/PaulaBeck/new_order_proyecto_estudio/blob/master/script/Tema03_Optimizacion_de_consultas_a_traves_de_indices/tema3_img_indices_3.jpg)

3.D) Repeticion de la consulta

	3) Resultados de la revision del plan de ejecución y el tiempo de respuesta

	Tiempo de rta:
		Registros devueltos: 87.455
		Table 'Ventas2'. Scan count 1, logical reads 361, physical reads 0, page server reads 0, read-ahead reads 0, page server read-ahead reads 0, lob logical reads 0, lob physical reads 0, lob page server reads 0, lob read-ahead reads 0, lob page server read-ahead reads 0.
		SQL Server Execution Times: CPU time = 15 ms,  elapsed time = 567 ms.

4) Borrar el índice creado

Para este paso utilizamos la sentencia "DROP INDEX" indicando el nombre que le dimos al indice y accediendo a la tabla que queremos borrarlo, en este caso, "ventas2".

5)  Definir otro índice agrupado sobre la columna fecha pero que además incluya las columnas seleccionadas y repetir la consulta anterior. Registrar el plan de ejecución utilizado por el motor y los tiempos de respuesta.

5.A) Crear un índice no agrupado que incluya todas las columnas de la tabla (id_venta y total_venta)  
5.B) Repeticion de la consulta

	5) Resultados de la revision del plan de ejecución y el tiempo de respuesta
	
	Tiempo de rta:
		Registros devueltos: 87.455
		Table 'Ventas2'. Scan count 1, logical reads 329, physical reads 0, page server reads 0, read-ahead reads 0, page server read-ahead reads 0, lob logical reads 0, lob physical reads 0, lob page server reads 0, lob read-ahead reads 0, lob page server read-ahead reads 0.
		SQL Server Execution Times: CPU time = 47 ms,  elapsed time = 506 ms.

5.C) Comparacion de tiempos de rta y plan de ejecucion entre tablas (venta1, sin indice) y (ventas2, con indice no agrupado)
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

Plan de Ejecucion:
 ![tema3_img_ejecucion_2](https://github.com/PaulaBeck/new_order_proyecto_estudio/blob/master/script/Tema03_Optimizacion_de_consultas_a_traves_de_indices/tema3_img_ejecucion_5.jpg)

6) Expresar las conclusiones en base a las pruebas realizadas.

  - Conclusiones Generales:
	La implementación de índices, tanto agrupados como no agrupados, 
	ha demostrado ser una estrategia efectiva para mejorar el rendimiento de las consultas en 
	bases de datos con grandes volúmenes de datos. Las pruebas indican que la reducción 
	en el tiempo de ejecución y en las lecturas lógicas es considerable, lo que resulta en 
	una mejora en la eficiencia general del sistema. Por lo tanto, se recomienda el uso adecuado 
	de índices en el diseño de bases de datos para optimizar el acceso a los datos y mejorar 
	la experiencia del usuario en aplicaciones que dependen de consultas rápidas.

  - Conclusiones Específicas:
	1) Consulta Sin Índice: 
		El plan de ejecución revela que se está realizando un escaneo completo de la tabla,
		lo que implica la lectura de todos los registros. Este enfoque conlleva un alto costo
		en términos de rendimiento, resultando en un mayor tiempo de respuesta y un uso elevado
		de operaciones de entrada/salida (E/S).

	2) Consulta Con Índice Agrupado en una columna:
		El tiempo de respuesta mejora debido a la búsqueda indexada. 
		El plan de ejecución mostrará un escaneo de índice en lugar de un escaneo de tabla, 
		lo que reduce el número de páginas leídas y mejora el rendimiento.

	3) Establecer Índice No Agrupado:
		Se restableció el índice no agrupado en la columna "id_venta" como clave primaria. 
		Esta combinación de un índice agrupado en "fecha_venta" y un índice no agrupado en 
		"id_venta" maximiza el rendimiento, permitiendo consultas rápidas y eficientes tanto por rango 
		de fechas como por identificadores únicos.

	4) Consulta Con Índice No Agrupado con columnas incluidas:
		Este indice incluye ademas de la fecha de la venta, su id y monto total de la venta.
		Es una alternativa eficiente para consultas específicas 
		que no requieren un orden físico en los datos, 
		mejorando el tiempo de respuesta y su eficiencia al reducir la necesidad 
		de acceder a la tabla completa.
