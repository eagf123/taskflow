
# TaskFlow

Aplicación móvil desarrollada con Flutter para organizar actividades académicas, administrar tareas y controlar su estado de cumplimiento.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

---

## Alcance de TaskFlow

### Descripción del proyecto

**Problema:** Los estudiantes necesitan organizar sus actividades académicas y conocer cuáles están pendientes y cuáles han sido completadas.

**Usuario objetivo:** Estudiantes universitarios que necesitan planificar sus actividades, trabajos y entregas semanales.

**Objetivo:** Desarrollar una aplicación móvil que permita organizar y consultar tareas académicas.

### Historias de usuario y criterios de aceptación

1. Como estudiante, quiero listar mis tareas para ver qué debo hacer.

   **Criterio:** La lista muestra título, prioridad y estado de cada tarea.

2. Como estudiante, quiero abrir una tarea para leer su descripción.

   **Criterio:** Al tocar una tarjeta aparece el detalle de la tarea elegida.

3. Como estudiante, quiero crear una tarea para registrar un pendiente.

   **Criterio:** El formulario guarda una tarea válida y la lista la muestra.

4. Como estudiante, quiero editar una tarea para corregir sus datos.

   **Criterio:** Los cambios guardados aparecen en lista y detalle.

5. Como estudiante, quiero eliminar una tarea terminada para limpiar la lista.

   **Criterio:** Después de confirmar, la tarea desaparece de la lista.

### Modelo de datos

Task:
- id: entero único.
- title: texto con el nombre de la tarea.
- description: texto con la descripción.
- priority: Alta, Media o Baja.
- isCompleted: verdadero o falso.
- userId: entero que identifica al usuario de prueba.

### Datos de prueba

1. Configurar entorno de desarrollo.
2. Diseñar pantalla de bienvenida.
3. Crear componente TaskCard.
4. Implementar listado de tareas.
5. Ejecutar control de calidad.

Todas las tareas están asociadas al usuario de prueba con identificador 1.

### Pantallas previstas

**Lista:**
- Mostrar tarjetas de tareas.
- Visualizar título, prioridad y estado.
- Mostrar total de tareas, completadas y pendientes.
- Permitir seleccionar una tarea.
- Incorporar una acción para crear tareas.

**Detalle:**
- Mostrar información completa de la tarea.
- Mostrar identificador y usuario asociado.
- Permitir regresar al listado.
- Incorporar futuras acciones para editar o eliminar.

**Formulario:**
- Campo para título.
- Campo para descripción.
- Selector de prioridad.
- Validación de datos.

### Requisitos no funcionales

- La navegación debe tener textos comprensibles.
- La interfaz debe ser sencilla y fácil de utilizar.
- La aplicación debe funcionar en dispositivos Android.
- Un ID inexistente debe mostrar un mensaje en vez de cerrar la aplicación.
- El código debe estar organizado y utilizar componentes reutilizables.

### Contrato de API que necesitaremos

| Método | Endpoint | Operación |
|---|---|---|
| GET | /tasks | Listar tareas |
| GET | /tasks/:id | Consultar detalle |
| POST | /tasks | Crear tarea |
| PATCH | /tasks/:id | Modificar tarea |
| DELETE | /tasks/:id | Eliminar tarea |

**Nota:** Estos endpoints son requisitos para una futura API. Actualmente TaskFlow utiliza datos locales de prueba y todavía no está conectado a un servidor.

### Tecnologías utilizadas

- Flutter.
- Dart.
- Material Design 3.
- Visual Studio Code.
- Navigator.
- Git y GitHub.

### Estado actual del proyecto

- [x] Modelo Task.
- [x] Cinco tareas de prueba.
- [x] Componente TaskCard.
- [x] Listado con ListView.builder.
- [x] Navegación entre lista y detalle.
- [x] Identificación de usuario mediante userId.
- [ ] Crear tareas.
- [ ] Editar tareas.
- [ ] Eliminar tareas.
- [ ] Conectar con una API.
