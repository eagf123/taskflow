# TaskFlow – Gestión de Tareas

## Descripción del proyecto

TaskFlow es una aplicación móvil desarrollada con Flutter que permite consultar y visualizar tareas mediante una API REST. La aplicación utiliza una arquitectura organizada en Service, Repository, ViewModel y View para separar las responsabilidades y facilitar el mantenimiento del código.

En esta sesión se implementaron los estados de carga, éxito, vacío y error, además de la funcionalidad para reintentar una consulta cuando ocurre un problema de conexión.

## Tecnologías utilizadas

- Flutter
- Dart
- Dio
- Provider
- ChangeNotifier
- GoRouter
- API REST

## Arquitectura del proyecto

El proyecto utiliza la siguiente estructura:

```text
lib/
├── features/
│   └── tasks/
│       ├── data/
│       │   ├── task_api_service.dart
│       │   └── task_repository.dart
│       ├── domain/
│       │   └── task.dart
│       └── presentation/
│           ├── tasks_view_model.dart
│           └── task_list_screen.dart
```

### Responsabilidades

- **Service:** realiza las solicitudes HTTP mediante Dio.
- **Repository:** administra el acceso a los datos.
- **ViewModel:** controla los estados y la lógica de las tareas.
- **View:** muestra la información y permite interactuar con el usuario.

## Funcionalidades implementadas – Sesión 8

Se implementaron cuatro estados principales:

### 1. Estado de carga

Mientras se realiza la petición al servidor, se muestra un indicador circular mediante `CircularProgressIndicator`.

### 2. Estado de éxito

Cuando la API responde correctamente y contiene tareas, se muestra una lista de tarjetas con:

- Título de la tarea.
- Prioridad.
- Estado de completada.
- Acceso al detalle de cada tarea.

### 3. Estado vacío

Cuando la API responde correctamente, pero no existen tareas, se muestra el mensaje:

"Todavía no hay tareas para mostrar."

También se incorpora el botón **Actualizar** para realizar una nueva consulta.

### 4. Estado de error

Cuando ocurre un problema de conexión o falla la solicitud, se muestra el mensaje:

"No se pudieron cargar las tareas."

Se incorpora el botón **Reintentar**, que permite volver a consultar la API sin reiniciar la aplicación.

## Actualización de tareas

Se implementaron dos formas de actualizar la información:

- Botón de actualización ubicado en la barra superior.
- Gesto de deslizar hacia abajo mediante `RefreshIndicator`.

La función `loadTasks()` permite realizar nuevamente la consulta al servidor.

## Gestión de estados

En `tasks_view_model.dart` se utilizan:

- `isLoading`: indica si se están cargando las tareas.
- `errorMessage`: almacena el mensaje de error.
- `isEmpty`: identifica si la respuesta contiene una lista vacía.
- `notifyListeners()`: notifica los cambios a la interfaz.
- `try`, `catch` y `finally`: controlan la operación asíncrona.

En `task_list_screen.dart` se utilizan:

- `context.watch`: observa los cambios del ViewModel.
- `context.read`: ejecuta acciones sin crear una escucha adicional.

## Pruebas realizadas

Se contemplan las siguientes pruebas para verificar el funcionamiento:

| Prueba | Procedimiento | Resultado esperado |
|---|---|---|
| Éxito | Conectar a internet y abrir TaskFlow. | Mostrar las tareas recibidas. |
| Carga | Observar la consulta al servidor. | Mostrar el indicador circular. |
| Vacío | Cambiar temporalmente `userId` a `9999`. | Mostrar el mensaje de lista vacía. |
| Error | Desactivar internet y actualizar. | Mostrar el mensaje de error. |
| Reintento | Reactivar internet y pulsar Reintentar. | Recuperar las tareas sin reiniciar la aplicación. |

**Importante:** después de realizar la prueba de lista vacía, se debe restaurar el valor original de `userId`.

## Instalación y ejecución

Para ejecutar el proyecto, abrir una terminal en la carpeta raíz y utilizar los siguientes comandos:

```bash
flutter pub get
```

Para formatear el código:

```bash
dart format lib
```

Para comprobar posibles errores:

```bash
flutter analyze
```

Para ejecutar la aplicación:

```bash
flutter run
```

## Evidencias de la sesión 8

Se deben incluir capturas de pantalla que demuestren:

1. Lista de tareas cargada correctamente.
2. Indicador de carga.
3. Mensaje cuando no existen tareas.
4. Mensaje de error cuando no hay conexión.
5. Recuperación de las tareas utilizando el botón Reintentar.

## Conclusión

En la sesión 8 se mejoró la aplicación TaskFlow mediante la implementación de estados asíncronos para controlar las solicitudes a la API REST.

La aplicación ahora diferencia entre carga, éxito, vacío y error, permitiendo al usuario actualizar la información y recuperar una consulta fallida mediante el botón Reintentar, sin necesidad de reiniciar la aplicación.

Se conserva la navegación al detalle de las tareas y la organización de la arquitectura implementada en las sesiones anteriores.

---

**Proyecto:** TaskFlow  
**Sesión:** 8 – Mostrar carga, datos, vacío y error  
**Tecnología:** Flutter y Dart