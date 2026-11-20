# TaskFlow – Aplicación de gestión de tareas

## 1. Descripción del proyecto

TaskFlow es una aplicación móvil desarrollada con Flutter que permite visualizar, consultar y administrar tareas mediante una API REST. El proyecto utiliza una arquitectura MVVM para separar la lógica de presentación, los datos y el modelo de dominio.

En esta sesión se implementó el consumo de una API REST utilizando Dio para obtener tareas desde un servidor externo.

## 2. Objetivos

- Consumir información desde una API REST.
- Implementar peticiones HTTP utilizando Dio.
- Aplicar la arquitectura MVVM.
- Gestionar estados de carga y errores.
- Mostrar una lista de tareas obtenidas desde internet.
- Implementar navegación hacia el detalle de cada tarea.

## 3. Tecnologías utilizadas

- Flutter.
- Dart.
- Dio: cliente HTTP para consumir la API.
- Provider: gestión de estados.
- GoRouter: navegación entre pantallas.
- JSONPlaceholder: servicio de API REST.
- Android Studio / Visual Studio Code.

## 4. API REST utilizada

Se utilizó JSONPlaceholder como fuente de datos de prueba.

**URL del servicio:**

https://jsonplaceholder.typicode.com/todos?userId=1

**Método HTTP:** GET.

La API devuelve 20 tareas correspondientes al usuario con ID 1.

Los datos recibidos incluyen:

- userId: identificador del usuario.
- id: identificador de la tarea.
- title: título de la tarea.
- completed: estado de finalización.

Los campos de descripción y prioridad se completan con valores predeterminados porque no están incluidos en esta API.

## 5. Arquitectura del proyecto

El proyecto utiliza el patrón arquitectónico MVVM:

- Model: representa los datos de las tareas mediante la clase Task.
- View: presenta la información en las pantallas de listado y detalle.
- ViewModel: administra el estado, la carga de tareas y las acciones del usuario.
- Repository: abstrae el origen de los datos.
- API Service: realiza las peticiones HTTP al servidor.

## 6. Estructura de carpetas

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
        │   ├── remote_task_repository.dart
        │   ├── task_api_service.dart
        │   └── task_repository.dart
        ├── domain/
        │   └── task.dart
        └── presentation/
            ├── task_detail_screen.dart
            ├── task_list_screen.dart
            └── tasks_view_model.dart
```

## 7. Funcionalidades implementadas

1. Consulta de tareas desde una API REST.
2. Visualización de las tareas recibidas.
3. Indicador de carga durante la petición.
4. Manejo de errores de conexión.
5. Botón para reintentar la carga.
6. Navegación desde el listado hacia el detalle.
7. Visualización de los datos de cada tarea.
8. Cambio del estado de una tarea entre completada y pendiente.

**Nota:** Los cambios de estado se mantienen en memoria durante la ejecución de la aplicación. JSONPlaceholder no almacena las modificaciones realizadas por esta aplicación.

## 8. Configuración y ejecución

### Requisitos

- Flutter instalado.
- Dart instalado.
- Android Studio o Visual Studio Code.
- Dispositivo Android o emulador.

### Instalar dependencias

```bash
flutter pub get
```

### Analizar el proyecto

```bash
flutter analyze
```

### Ejecutar la aplicación

```bash
flutter run
```

## 9. Permiso de conexión a internet

Para permitir que la aplicación realice peticiones HTTP, se agregó el siguiente permiso en `android/app/src/main/AndroidManifest.xml`, antes de la etiqueta `<application>`:

```xml
<uses-permission android:name="android.permission.INTERNET" />
```

## 10. Pruebas realizadas

Se realizaron las siguientes comprobaciones:

- Instalación de dependencias mediante `flutter pub get`.
- Formateo del código con `dart format`.
- Análisis estático mediante `flutter analyze`.
- Compilación e instalación en un dispositivo Android Infinix X6531.
- Consulta de la API REST.
- Verificación de respuesta HTTP 200.
- Comprobación de la navegación entre listado y detalle.

**Resultado de la conexión:**

```text
GET /todos?userId=1 → HTTP 200
```

La API respondió correctamente y la aplicación pudo conectarse al servicio remoto.

## 11. Conclusión

Durante el desarrollo de esta sesión se implementó el consumo de una API REST en Flutter utilizando Dio. Se integró la obtención de tareas con la arquitectura MVVM y Provider, permitiendo administrar los estados de carga, error y visualización de información.

También se implementó la navegación entre el listado de tareas y sus detalles mediante GoRouter.

Esta práctica permitió comprender cómo conectar una aplicación móvil con servicios web externos y organizar el código mediante una arquitectura escalable y mantenible.

## 12. Autor

**Proyecto:** TaskFlow  
**Desarrollador:** Eduardo García Flores  
**Asignatura:** Desarrollo de aplicaciones móviles  
**Repositorio:** https://github.com/eagf123/taskflow
