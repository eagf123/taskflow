# TaskFlow

Aplicación móvil desarrollada con Flutter para gestionar tareas, consultar información desde una API REST y realizar operaciones de creación, actualización y eliminación.

## Descripción del proyecto

TaskFlow permite visualizar tareas, consultar sus detalles, crear nuevas actividades, editar títulos y eliminar tareas mediante solicitudes HTTP.

El proyecto utiliza una arquitectura basada en Repository y ViewModel, separando la lógica de negocio, el acceso a datos y la interfaz de usuario.

## Tecnologías utilizadas

- Flutter
- Dart
- Android Studio
- Visual Studio Code
- Dio
- Provider
- GoRouter
- JSONPlaceholder
- Git y GitHub

## Arquitectura del proyecto

```text
lib/
├── main.dart
├── app/
│   └── taskflow_app.dart
├── core/
│   └── app_theme.dart
└── features/
    └── tasks/
        ├── data/
        │   ├── local_task_repository.dart
        │   ├── task_repository.dart
        │   ├── task_api_service.dart
        │   └── remote_task_repository.dart
        ├── domain/
        │   └── task.dart
        └── presentation/
            ├── tasks_view_model.dart
            ├── task_list_screen.dart
            ├── task_detail_screen.dart
            └── task_form_screen.dart
```

## Funcionalidades implementadas

### Sesiones anteriores

- Pantalla de bienvenida de TaskFlow.
- Modelo de datos Task.
- Listado de tareas.
- Repositorio local.
- Navegación mediante GoRouter.
- Pantalla de detalle de tareas.
- Conexión con API REST.
- Consulta de tareas mediante GET.
- Manejo de estados de carga y errores.
- Formulario para registrar nuevas tareas.
- Validación del título, descripción y prioridad.

### Sesión 10: Enviar cambios con POST, PATCH y DELETE

Se implementaron las tres operaciones HTTP para gestionar las tareas.

**1. POST – Crear tareas**

- Permite registrar nuevas tareas desde el formulario.
- Envía el título, estado de finalización e identificador del usuario.
- Conserva localmente la descripción y prioridad.
- Agrega la tarea al listado después de recibir una respuesta correcta.
- Muestra un mensaje de confirmación mediante SnackBar.

**2. PATCH – Actualizar tareas**

- Permite editar el título de una tarea.
- Valida que el título tenga al menos tres caracteres.
- Envía los cambios a la API.
- Actualiza el listado después de recibir una respuesta correcta.
- Muestra mensajes de éxito o error.

**3. DELETE – Eliminar tareas**

- Permite eliminar tareas desde la pantalla de detalle.
- Solicita confirmación mediante un AlertDialog.
- Permite cancelar la operación.
- Envía la solicitud DELETE a la API.
- Actualiza el listado después de recibir una respuesta correcta.

## API REST utilizada

Se utiliza JSONPlaceholder como servicio de práctica.

URL base:

https://jsonplaceholder.typicode.com

Endpoints implementados:

| Método HTTP | Endpoint | Descripción |
|---|---|---|
| GET | /todos?userId=1 | Consultar tareas |
| POST | /todos | Crear una tarea |
| PATCH | /todos/{id} | Actualizar una tarea |
| DELETE | /todos/{id} | Eliminar una tarea |

## Modelo de datos

La clase Task contiene los siguientes atributos:

- id: identificador de la tarea.
- title: título de la tarea.
- description: descripción.
- priority: prioridad.
- isCompleted: estado de finalización.
- userId: identificador del usuario.

También incorpora los métodos `fromJson` y `copyWith` para convertir datos JSON y crear copias modificadas de las tareas.

## Manejo de estados

La aplicación utiliza Provider y ChangeNotifier para administrar los estados de la interfaz.

Se contemplan los siguientes estados:

- Cargando información.
- Datos disponibles.
- Lista vacía.
- Error al consultar la API.

Las operaciones de escritura esperan la respuesta HTTP antes de actualizar la lista local o mostrar un mensaje de éxito.

## Limitación de JSONPlaceholder

JSONPlaceholder simula las operaciones POST, PATCH y DELETE.

Las respuestas permiten practicar la comunicación HTTP, pero los cambios no se guardan permanentemente en el servidor.

Por esta razón, después de reiniciar la aplicación o volver a consultar la API, pueden reaparecer los datos originales.

## Instalación y ejecución

Clonar el repositorio:

```bash
git clone https://github.com/eagf123/taskflow.git
```

Entrar en la carpeta:

```bash
cd taskflow
```

Instalar dependencias:

```bash
flutter pub get
```

Analizar el proyecto:

```bash
flutter analyze
```

Ejecutar la aplicación:

```bash
flutter run
```

## Comprobación de funcionamiento

Para verificar las funcionalidades implementadas:

1. Abrir la aplicación TaskFlow.
2. Consultar el listado de tareas.
3. Crear una nueva tarea.
4. Comprobar que aparece en el listado.
5. Abrir el detalle de una tarea.
6. Editar el título.
7. Comprobar la actualización.
8. Intentar eliminar una tarea.
9. Comprobar el diálogo de confirmación.
10. Confirmar la eliminación y verificar que desaparece del listado.

## Formateo y análisis

Antes de subir los cambios, ejecutar:

```bash
dart format lib
flutter pub get
flutter analyze
```

## Control de versiones

Repositorio GitHub:

https://github.com/eagf123/taskflow

Comandos para guardar y subir los cambios:

```bash
git status
git add README.md lib test pubspec.yaml pubspec.lock
git commit -m "feat: completar CRUD de tareas