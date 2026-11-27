import '../domain/task.dart';
import 'task_repository.dart';

class LocalTaskRepository implements TaskRepository {
  final List<Task> _tasks = [
    const Task(
      id: 1,
      title: 'Configurar entorno de desarrollo',
      description: 'Instalar Flutter y configurar las herramientas necesarias.',
      priority: 'Alta',
      isCompleted: true,
      userId: 1,
    ),
    const Task(
      id: 2,
      title: 'Diseñar pantalla de bienvenida',
      description: 'Crear una interfaz atractiva para la aplicación TaskFlow.',
      priority: 'Alta',
      isCompleted: true,
      userId: 1,
    ),
    const Task(
      id: 3,
      title: 'Crear componente TaskCard',
      description: 'Diseñar tarjetas reutilizables para mostrar las tareas.',
      priority: 'Media',
      isCompleted: false,
      userId: 1,
    ),
    const Task(
      id: 4,
      title: 'Implementar listado de tareas',
      description: 'Mostrar las actividades utilizando ListView.builder.',
      priority: 'Alta',
      isCompleted: false,
      userId: 1,
    ),
    const Task(
      id: 5,
      title: 'Ejecutar control de calidad',
      description: 'Validar el proyecto utilizando flutter analyze.',
      priority: 'Baja',
      isCompleted: false,
      userId: 1,
    ),
  ];

  @override
  Future<List<Task>> getTasks() async {
    return List.unmodifiable(_tasks);
  }

  @override
  void save(Task task) {
    final index = _tasks.indexWhere((item) => item.id == task.id);

    if (index == -1) return;

    _tasks[index] = task;
  }

  // POST: Crear una tarea local.
  @override
  Future<Task> createTask(
    String title,
    String description,
    String priority,
  ) async {
    final nextId = _tasks.isEmpty
        ? 1
        : _tasks.map((task) => task.id).reduce((a, b) => a > b ? a : b) + 1;

    final task = Task(
      id: nextId,
      title: title,
      description: description,
      priority: priority,
      isCompleted: false,
      userId: 1,
    );

    _tasks.add(task);

    return task;
  }

  // PATCH: Actualizar una tarea local.
  @override
  Future<void> updateTask(Task task) async {
    save(task);
  }

  // DELETE: Eliminar una tarea local.
  @override
  Future<void> deleteTask(int id) async {
    _tasks.removeWhere((task) => task.id == id);
  }
}
