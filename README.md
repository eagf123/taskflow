
# TaskFlow

Aplicación móvil desarrollada con Flutter para gestionar y visualizar tareas mediante una API REST.

## Información del proyecto

- **Proyecto:** TaskFlow
- **Actividad:** CODELAB 09
- **Semana:** 5
- **Tema:** Crear un formulario de tareas
- **Tecnología:** Flutter y Dart
- **Navegación:** GoRouter
- **Gestión de estado:** Provider
- **Conexión:** API REST mediante Dio

## Objetivo

Implementar un formulario para preparar nuevas tareas, validando el título, la descripción y la prioridad antes de devolver los datos a la pantalla principal.

## Funcionalidades implementadas

### 1. Listado de tareas

- Visualización de tareas obtenidas desde una API REST.
- Indicador de carga.
- Mensaje de error y opción para reintentar.
- Actualización de tareas mediante el botón de refrescar.
- Actualización mediante RefreshIndicator.

### 2. Detalle de tareas

- Navegación al detalle mediante el identificador de cada tarea.
- Visualización de la información correspondiente a la tarea seleccionada.

### 3. Formulario de nuevas tareas

Se creó la pantalla `TaskFormScreen` para preparar nuevas tareas.

Características:

- Campo de título.
- Campo de descripción.
- Selector de prioridad.
- Botón Guardar tarea.
- Botón Cancelar.
- Validación de campos.

### 4. Validaciones del formulario

| Campo | Validación |
|---|---|
| Título | Obligatorio |
| Título | Mínimo 3 caracteres |
| Descripción | Obligatoria |
| Prioridad | Selección de Alta, Media o Baja |

### 5. Controladores y estado

Se implementaron:

- `GlobalKey<FormState>` para validar el formulario.
- `TextEditingController` para controlar el título y la descripción.
- `dispose()` para liberar los controladores.
- `StatefulWidget` para administrar la prioridad seleccionada.
- `TaskDraft` para representar temporalmente los datos del formulario.

### 6. Navegación

Se utiliza GoRouter con las siguientes rutas:

| Ruta | Pantalla |
|---|---|
| `/` | Listado de tareas |
| `/task/:id` | Detalle de una tarea |
| `/new` | Formulario de nueva tarea |

Al guardar un formulario válido, se utiliza `context.pop(draft)` para devolver los datos a la pantalla anterior.

La pantalla principal muestra el mensaje:

`Formulario válido: nombre de la tarea`

**Nota:** El formulario todavía no envía información a la API REST. La integración mediante POST corresponde a la siguiente sesión.

## Estructura del proyecto

```text
lib/
├── app/
│   └── taskflow_app.dart
├── core/
│   └── app_theme.dart
├── features/
│   └── tasks/
│       ├── data/
│       │   ├── local_task_repository.dart
│       │   ├── remote_task_repository.dart
│       │   ├── task_api_service.dart
│       │   └── task_repository.dart
│       ├── domain/
│       │   └── task.dart
│       └── presentation/
│           ├── task_detail_screen.dart
│           ├── task_form_screen.dart
│           ├── task_list_screen.dart
│           └── tasks_view_model.dart
└── main.dart
```

## Dependencias principales

- Flutter
- Provider
- GoRouter
- Dio

## Instalación y ejecución

Clonar el repositorio:

```bash
git clone https://github.com/eagf123/taskflow.git
```

Ingresar al proyecto:

```bash
cd taskflow
```

Instalar dependencias:

```bash
flutter pub get
```

Verificar el código:

```bash
flutter analyze
```

Ejecutar la aplicación:

```bash
flutter run
```

## Pruebas del CODELAB 09

Comprobar los siguientes casos:

1. Abrir el listado de tareas.
2. Presionar el botón Nueva tarea.
3. Intentar guardar el formulario vacío.
4. Comprobar la validación del título.
5. Ingresar un título de dos caracteres.
6. Comprobar la validación de la descripción.
7. Seleccionar una prioridad.
8. Completar todos los campos y guardar.
9. Verificar el mensaje de retorno del borrador.
10. Comprobar que el detalle de las tareas continúa funcionando.

## Próxima actividad

En la siguiente sesión se conectará el formulario con la API REST mediante una petición POST para registrar nuevas tareas en el servidor.

## Autor

Eduardo García Flores
