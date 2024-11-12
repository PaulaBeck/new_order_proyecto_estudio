# Proyecto de Estudio
    
# Presentación Proyecto "NEW ORDER"

**Asignatura**: Bases de Datos I (FaCENA-UNNE)

**Integrantes**:
 - Beck, Ana Paula
 - Ramos, Milagros
 - Sotelo, Fabio
 - Titonel, Lucas

**Año**: 2024

## CAPÍTULO I: INTRODUCCIÓN

a)	**Tema** 

Automatización de Gestión de Ventas e Inventario en Empresas.

b)	**Definición o planteamiento del Problema**

En muchas tiendas dedicadas a la venta de productos, la gestión de ventas, el control de inventarios, etc. la forma de operar (o de trabajar) suelen ser procesos manuales lentos y propensos a errores. Este tipo de gestión no automatizada puede llevar a problemas como pérdida de oportunidades de venta, desorganización en el manejo de productos, y falta de información precisa y oportuna para la toma de decisiones.

La ausencia de un sistema de gestión centralizado para el manejo de ventas, inventario y clientes genera ineficiencias y errores en el proceso de ventas. Sin una herramienta adecuada, los empleados pierden tiempo en tareas repetitivas, como el registro manual de ventas, la actualización de inventario y la elaboración de reportes, lo cual afecta la productividad general de la empresa. Además, la falta de visibilidad en tiempo real del inventario y de las actividades de ventas dificulta la toma de decisiones estratégicas y puede resultar en una falta o exceso de stock.

La reiterada tarea de registro manual de ventas o de stock de productos por parte del personal puede llevar a cabo errores como datos duplicados, datos incompletos o similar, perdiendo tiempo en buscar el registro o comparando con otros. 

Por otro lado, la falta de integración entre las áreas de ventas, inventario y atención al cliente impide que la información fluya de manera eficiente. Esta fragmentación dificulta la generación de reportes consolidados y retrasa la respuesta a solicitudes del cliente, afectando la calidad del servicio y la capacidad de la empresa para adaptarse rápidamente a cambios en la demanda del mercado.

c)	**Objetivo del Trabajo Práctico**

Uno de los objetivos principales de este trabajo práctico es proporcionar una solución a lo mencionado anteriormente, mediante un sistema de gestión automatizado. 
Además, se incorporan temas de investigación como el análisis de datos, la gestión de permisos a nivel de usuarios en la base de datos y la optimización de consultas, entre otros.

i)	**Preguntas Generales**  
  - ¿Cómo podemos optimizar la gestión de ventas, inventarios y clientes en una empresa de ventas?

ii)	**Preguntas Específicas**  
- ¿Cómo podemos lograr buscar una factura de venta de forma eficiente?  
- ¿Cómo optimizo la carga de stock?  
- ¿Cómo controlo la existencia de un cliente en la Base de Datos?  
- ¿Cómo realizo una venta de forma eficiente?  
- ¿Cómo doy de alta/baja un cliente?  
- ¿Cómo controlo el stock de un producto?  

iii)	**Objetivos Generales**  
  - Dar solución a la problemática de falta de automatización de gestión de venta/Inventario/cliente de una empresa. 

iv)	**Objetivos Específicos**  
  - Solucionar el cargado manual del inventario.  
  - Acortar el tiempo de tareas de búsqueda.  
  - Optimizar la búsqueda de factura de venta.
  - Obtener informes o reportes de las ventas y/o productos.

d)	**Descripción del Sistema**  
El sistema de gestión de ventas está diseñado para tiendas físicas de artículos de bazar y poli rubro en la provincia de Corrientes, con sucursales tanto en la capital como en el interior.  
Está orientado a registrar y administrar de forma manual las ventas, clientes, productos y otros datos correspondientes al comercio en cuestión.  

El sistema cuenta con módulos específicos asignados según el perfil del personal de la empresa, destacando los roles de gerente, vendedor y administrador del sistema.  
Cada perfil tiene acceso a funcionalidades clave que mejoran su gestión. Los vendedores se encargan de la administración de clientes, la gestión de productos y el procesamiento de ventas. El gerente general tiene acceso a la gestión del personal, clientes, productos e informes. Por su parte, el administrador se encarga del respaldo y la seguridad de los datos, gestionando el backup del sistema.

e)	**Alcance**  
Debemos mencionar que, en el análisis de los datos, el alcance será limitado, es decir que no se trabajará con el sistema completo sino con una parte de él, haciendo énfasis al procesamiento y administración de ventas que reúnen información acerca de qué vendedor realizó la venta, a qué cliente en particular, qué producto/s fueron vendidos y cuál fue la manera que se realizó el pago, entre otros.  
No se tendrá en cuenta la conexión con proveedores o alguna asociación que provea los productos de la tienda.

## CAPITULO II: MARCO CONCEPTUAL O REFERENCIAL

**TEMA 1: "Manejo de permisos a nivel de usuarios de base de datos"** 

**TEMA 2: "Procedimientos y funciones almacenadas"** 

Procedimientos Almacenados  
Los procedimientos almacenados son conjuntos de instrucciones SQL que se almacenan en la base de datos y que pueden ser ejecutados como una unidad. Estos procedimientos permiten realizar operaciones complejas, incluyendo consultas, manipulaciones de datos y operaciones condicionales. Los procedimientos almacenados pueden aceptar parámetros de entrada y salida, ejecutar sentencias SQL de manera más eficiente y, por lo general, mejoran la seguridad al permitir el control del acceso a los datos y la lógica encapsulada.

Funciones Almacenadas  
Las funciones almacenadas son similares a los procedimientos, pero su principal diferencia es que siempre devuelven un valor (o un conjunto de valores) como resultado. Las funciones almacenadas suelen ser utilizadas para realizar cálculos o transformaciones y pueden ser invocadas desde una consulta SQL, como parte de una cláusula SELECT, WHERE u otra. A diferencia de los procedimientos, las funciones tienen restricciones más estrictas sobre lo que pueden hacer dentro de su ejecución (por ejemplo, no pueden modificar directamente los datos de la tabla).

**TEMA 3: "Optimización de consultas a través de índices"**  

**Índices en bases de datos:**

Los índices son estructuras que optimizan el rendimiento de las consultas en bases de datos.  
Su propósito es acelerar el tiempo de recuperación de información y mejorar el procesamiento de las consultas en tablas o vistas, permitiendo obtener los datos solicitados de manera rápida, sin la necesidad de explorar toda la tabla.

**Tipos de índices y usos:**  
Existen diversos tipos de índices, cada uno diseñado para cumplir funciones específicas.
  - Índice único: mantienen la integridad referencial y previenen la existencia de datos duplicados.
  - índice espacial: utilizados para manejar información geométrica.
  - índice hash: almacenan tablas en memoria que garantizan un consumo de espacio de memoria constante.
  - Índice filtrado: aplican filtros para seleccionar subconjuntos de datos. 

**Indices en SQL SERVER:**
 ![tema3_img_comparacion_indices1](https://github.com/PaulaBeck/new_order_proyecto_estudio/blob/master/script/Tema03_Optimizacion_de_consultas_a_traves_de_indices/tema3_img_comparacion_indices1.jpg)
 ![tema3_img_comparacion_indices2](https://github.com/PaulaBeck/new_order_proyecto_estudio/blob/master/script/Tema03_Optimizacion_de_consultas_a_traves_de_indices/tema3_img_comparacion_indices2.jpg)

En la parte práctica de este tema, nos centraremos en crear y analizar el comportamiento de los tiempos de respuesta y el rendimiento de los índices agrupados e índices no agrupados.  
Las actividades y resolucion de las mismas se encuentran dentro de la carpeta "Tema 3" de este repositorio

**TEMA 4: "Manejo de tipos de datos JSON"** 



## CAPÍTULO III: METODOLOGÍA SEGUIDA 

 **a) Cómo se realizó el Trabajo Práctico**  
El trabajo se desarrolló de manera grupal, utilizando herramientas colaborativas que facilitaron el trabajo remoto. GitHub fue empleado para la gestión del código y control de versiones, permitiendo la integración y seguimiento de los aportes de cada miembro. Además, se utilizó Google Drive para el almacenamiento y organización de documentos, lo que garantizó un flujo de trabajo eficiente y accesible para todo el grupo.

 **b) Herramientas (Instrumentos y procedimientos)**
Para el desarrollo del sistema de gestión de ventas, se emplearon diversas herramientas tanto para el diseño como para la gestión de la base de datos y la documentación del proyecto.  
Entre ellas:  
  - ERD Plus: Utilizado para la creación del modelo entidad-relación, facilitando el diseño de la estructura de la base de datos.
  - DRAW.IO: Herramienta empleada para la creación de diagramas de flujo, casos de uso y otros diagramas visuales del sistema.
  - SQL Server: Base de datos utilizada para almacenar y gestionar la información del sistema.
  - Diagrama Entidad-Relación (DER): Representó visualmente la estructura y relaciones entre las entidades del sistema.
  - Diagrama de Modelo Relacional: Representó visualmente a modo de tablas los campos y tipo de datos de cada tabla
  - Diccionario de Datos: Documentó los campos, tipos de datos y relaciones de la base de datos, proporcionando una guía clara para su implementación.

## CAPÍTULO IV: DESARROLLO DEL TEMA / PRESENTACIÓN DE RESULTADOS 
En este capítulo, se presentará de forma detallada, los datos e información que se fueron recopilando para comprender, analizar el caso de estudio y conseguir los resultados esperados.  

Se emplearon diversas herramientas para lograr el diseño y la gestión de la información de la base de datos. Algunas de estas herramientas nos permitieron representar gráficamente las entidades, tablas y las relaciones entre las mismas, identificando de manera clara y fácilmente los datos, su estructura y comportamiento.

**a) Diagrama de Modelo Relacional**

Un Diagrama de Modelo Relacional también conocido como Diagrama Entidad-Relación (ER), es una representación gráfica que muestra cómo interactúan las entidades dentro de una base de datos. Este tipo de diagrama ayuda a visualizar las relaciones entre diferentes elementos clave.  

La siguiente imagen representa el Modelo Relacional del sistema de gestión de ventas.

![diagrama_relacional](https://github.com/PaulaBeck/new_order_proyecto_estudio/blob/master/doc/Modelo_Relacional_New_Order.png)

**b) Diccionario de Datos**

Es una herramienta fundamental en la administración de datos que proporciona una representación estructurada de los elementos de datos, sus tipos, relaciones y metadatos asociados. En ella, se almacena información detallada sobre cada elemento de datos, como nombres de variables, tipos de datos, formatos, longitudes y descripciones.

Acceso al documento [PDF](doc/DiccionarioDeDatos_NewOrder.pdf) del diccionario de datos.

## CAPÍTULO V: CONCLUSIONES  

**TEMA 2: "Procedimientos y funciones almacenadas"** 

La implementación de procedimientos y funciones almacenadas en bases de datos es una estrategia ampliamente utilizada para encapsular lógica de negocio directamente en el servidor, aportando múltiples beneficios que optimizan el rendimiento, la seguridad y la modularidad de las aplicaciones. Estas herramientas son valiosas cuando se busca reducir el tráfico de red, simplificar la ejecución de operaciones repetitivas o realizar tareas complejas de forma más eficiente, lo que a menudo lleva a un desarrollo más ágil y menos propenso a errores al centralizar la lógica crítica en un solo punto de control.  

Sin embargo, su uso también conlleva desafíos que deben ser evaluados cuidadosamente. La dependencia de la base de datos específica puede limitar la portabilidad de la solución, y la dificultad para depurar o mantener el código almacenado puede complicar la gestión de proyectos con equipos grandes o distribuidos. Además, para aplicaciones distribuidas o arquitecturas basadas en microservicios, centralizar la lógica puede convertirse en un obstáculo para la escalabilidad.

En conclusión, el uso de procedimientos y funciones almacenadas debe implementarse con atención, buscando maximizar sus ventajas cuando la lógica en el servidor sea crítica, pero sin comprometer la flexibilidad, el mantenimiento o la capacidad de evolución del sistema. La decisión debe alinearse con las necesidades específicas del proyecto, el entorno de despliegue y los objetivos de rendimiento y seguridad, asegurando un equilibrio adecuado entre simplicidad, control y eficiencia.

**Tema 3: Optimización de consultas a través de índices**

La implementación de índices, tanto agrupados como no agrupados, ha demostrado ser una estrategia efectiva para mejorar el rendimiento de las consultas en bases de datos con grandes volúmenes de datos.  

Las pruebas indican que la reducción en el tiempo de ejecución y en las lecturas lógicas es considerable, lo que resulta en una mejora en la eficiencia general del sistema. Por lo tanto, se recomienda el uso adecuado de índices en el diseño de bases de datos para optimizar el acceso a los datos y mejorar la experiencia del usuario en aplicaciones que dependen de consultas rápidas.

## BIBLIOGRAFÍA DE CONSULTA

 1. List item
 2. List item

 3. Tema 03 - Índices:  
  - Índices, tipos, usos, diseño óptimo de agrupados y no agrupados (link general)  
https://www.sqlshack.com/es/indices-del-sql-server-serie-introductoria/

 - Tipos de indices:  
https://learn.microsoft.com/es-es/sql/relational-databases/indexes/indexes?view=sql-server-ver16  
https://www.sqlshack.com/es/uso-de-diferentes-tipos-de-indices-sql-server/

 - Índices agrupados y no agrupados:  
https://www.sqlshack.com/es/diseno-efectivo-de-indices-agrupados-sql-server/  
https://www.sqlshack.com/es/diseno-efectivo-de-indices-no-agrupados-sql-server/

 4. List item
 5. List item
