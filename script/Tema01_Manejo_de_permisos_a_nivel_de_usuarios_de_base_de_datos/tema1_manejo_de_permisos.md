Trabajo Práctico: Manejo de Permisos a Nivel de Usuarios en Base de Datos
Tema: Permisos y Roles de Usuario en Bases de Datos
Objetivos de aprendizaje
-Entender la asignación de permisos a nivel de usuarios y roles en una base de datos.
-Aplicar permisos de lectura, escritura y ejecución en un entorno seguro y controlado.
-Implementar casos prácticos de asignación de permisos a usuarios específicos y verificar el control de acceso en operaciones de lectura y escritura.

Resumen de la Actividad Realizada
En este trabajo práctico, se desarrollaron configuraciones de permisos en la base de datos DB_NEW_ORDER, diseñados para gestionar productos, ventas, clientes, empleados y sucursales de una tienda. Se enfocó en la asignación de permisos a usuarios individuales y roles, asegurando que el acceso a los datos sea seguro y controlado. Las siguientes actividades fueron realizadas para este fin:

1. Creación de Usuarios con Permisos Diferenciados
Para demostrar el manejo de permisos, se crearon dos usuarios con diferentes niveles de acceso:
-Usuario con permiso de Administrador ( UsuarioAdmin) : Se le otorgó acceso completo a la base de datos a través del rol db_owner, permitiéndole realizar todas las operaciones sobre las tablas.
-Usuario con permiso de Solo Lectura ( UsuarioLectura) : Este usuario solo puede leer los datos de la tabla Producto, sin capacidad de modificar o eliminar datos.
Se verificó el acceso de cada usuario mediante pruebas de inserción y consulta en la tabla Producto. Mientras UsuarioAdmin puede insertar y leer datos sin restricciones, UsuarioLectura sólo puede realizar consultas ( SELECT) en Producto, y no puede insertar ni modificar información.

2. Asignación de Permisos de Ejecución de Procedimientos Almacenados
Además de la manipulación directa de tablas, se configuran permisos para la ejecución de procedimientos almacenados:
-Se implementó un procedimiento almacenado llamado insertarProducto para insertar productos en la base de datos.
-Se otorgó al UsuarioLectura permiso de ejecución sobre insertarProducto, permitiéndole realizar inserciones indirectamente, sin acceso directo a la tabla.

Se realizaron pruebas donde UsuarioLectura intentaron insertar datos Producto tanto directamente como a través del procedimiento almacenado. Los resultados mostraron que:
-UsuarioLectura no puede realizar un INSERT directo en Producto, ya que solo tiene permiso de lectura.
-UsuarioLectura puede ejecutar insertarProducto si se le concede el permiso de ejecución, logrando insertar datos en la tabla de forma controlada.

3. Creación de Roles para Simplificar la Gestión de Permisos
Para facilitar la administración de permisos, se creó un rol de solo lectura:
-RolRolSoloLectura : Permite únicamente realizar consultas en la tabla Producto.
-Dos usuarios adicionales fueron creados, UsuarioRol1y UsuarioRol2.
A UsuarioRol1se le asignó el rol RolSoloLectura, mientras que UsuarioRol2 quedó sin rol asignado.

Se realizaron pruebas para evaluar el comportamiento de ambos usuarios:
-UsuarioRol1Puede consultar datos en la tabla Producto gracias al rol RolSoloLectura, pero no puede modificar ni insertar información.
-UsuarioRol2, al no tener permisos de lectura, no puede acceder a Productoy recibe un error al intentar realizar consultas.

Conclusión
El manejo de permisos en la base de datos DB_NEW_ORDER proporciona un entorno seguro y organizado. La correcta asignación de permisos y roles garantiza:
-Seguridad de los datos al limitar el acceso solo a usuarios autorizados.
-Facilidad de administración mediante el uso de roles para grupos de usuarios.
-Flexibilidad en las tareas permitiendo acciones controladas mediante procedimientos almacenados.
Este esquema de permisos permite gestionar de forma efectiva la seguridad de los datos, asegurando que los usuarios accedan únicamente a las funcionalidades y datos necesarios para su rol.

