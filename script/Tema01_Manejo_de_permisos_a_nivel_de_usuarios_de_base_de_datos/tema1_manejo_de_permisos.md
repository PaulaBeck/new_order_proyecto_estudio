Trabajo Práctico: Manejo de Permisos a Nivel de Usuarios en Base de Datos:
En este trabajo práctico, se desarrollaron configuraciones de permisos en la base de datos DB_NEW_ORDER, diseñados para gestionar productos, ventas, clientes, empleados y sucursales de una tienda. Se enfocó en la asignación de permisos a usuarios individuales y roles, asegurando que el acceso a los datos sea seguro y controlado. Las siguientes actividades fueron realizadas para este fin:


1. Creación de Usuarios con Permisos Diferenciados
En una base de datos, los permisos de usuario se asignan para limitar o acciones que permitirán como lectura (SELECT), inserción (INSERT), actualización (UPDATE) o eliminación (DELETE). Estos permisos permiten que los administradores controlen el acceso a datos críticos, impidiendo modificaciones no autorizadas.

Implementación : Se crearon dos usuarios con niveles de acceso diferenciados:

-Usuario con Permiso de Administrador (UsuarioAdmin) : Este usuario fue asignado al rol db_owner, que proporciona acceso completo a la base de datos. Así, puede realizar todas las operaciones sobre las tablas sin restricciones.

-Usuario con Permiso de Solo Lectura (UsuarioLectura) : Este usuario solo tiene permisos de lectura sobre la tabla Producto. Puede realizar consultas (SELECT) en Producto, pero no tiene capacidad para modificar o eliminar datos.

Prueba : Se verificó el acceso de cada usuario. Mientras que UsuarioAdmin podía insertar y leer datos sin restricciones, UsuarioLectura sólo pudo realizar consultas en la tabla Producto, sin permisos para realizar inserciones o modificaciones directas.

2. Asignación de Permisos de Ejecución de Procedimientos Almacenados
Los procedimientos almacenados permiten encapsular lógicas específicas (como inserciones o actualizaciones) y ejecutarlas mediante permisos controlados, lo que aporta flexibilidad y seguridad en el acceso. Asignar permisos de ejecución sobre procedimientos almacenados permite a los usuarios realizar operaciones indirectas sin acceso directo a las tablas.

Implementación : Se creó el procedimiento almacenado insertarProducto para insertar productos en la base de datos. A UsuarioLectura se le otorgó permiso de ejecución sobre este procedimiento, permitiéndole insertar datos en Producto indirectamente, sin acceso directo a la tabla.

Prueba :

-UsuarioLectura intentó insertar datos Producto directamente y recibió un error, ya que solo tiene permisos de lectura sobre la tabla.

-Al usar insertarProducto, pudo insertar datos en Producto gracias al permiso de ejecución, asegurando una inserción controlada.


3. Creación de Roles para Simplificar la Gestión de Permisos
Los roles en bases de datos permiten agrupar permisos y asignarlos a Múltiples usuarios de forma más eficiente, simplificando la administración. Un rol puede contener permisos específicos que se aplican a todos los usuarios asignados a él, permitiendo un control más sencillo y estructurado.

Implementación : Se creó el rol RolSoloLectura, que otorga permisos de lectura en la tabla Producto. Se crearon dos usuarios adicionales:

-UsuarioRol1 , asignado al rol RolSoloLectura, tiene permisos para realizar consultas Productopero no puede modificar ni insertar datos.

-UsuarioRol2 no tiene ningún rol asignado, por lo que no tiene permisos de acceso a Producto.

Prueba :

-UsuarioRol1 pudo consultar datos en Productogracias a su asignación al rol RolSoloLectura.

-UsuarioRol2 , al no tener permisos de lectura, no pudo acceder a Productoy recibió un error al intentar realizar consultas.

Conclusión
La gestión de permisos en la base de datos DB_NEW_ORDER proporciona un entorno seguro y organizado al:

-Proteger los Datos : Limita el acceso solo a usuarios autorizados, minimizando el riesgo de manipulaciones no autorizadas.

-Facilitar la Administración con Roles : La creación de roles simplifica la asignación y control de permisos en grupos de usuarios, permitiendo una administración más estructurada y eficiente.

-Aumentar la Flexibilidad mediante Procedimientos Almacenados : Permite a los usuarios realizar acciones controladas (como inserciones indirectas) mediante permisos de ejecución en procedimientos específicos, sin otorgar acceso directo a las tablas.
Este esquema de permisos es fundamental para asegurar que cada usuario acceda solo a las funcionalidades y datos necesarios, maximizando la seguridad y la eficacia en el manejo de la información dentro del sistema.


