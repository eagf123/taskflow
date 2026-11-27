import 'package:flutter/foundation.dart';

import '../data/task_repository.dart';
import '../domain/task.dart';

class TasksViewModel extends ChangeNotifier {
  TasksViewModel(this._repository);

  final TaskRepository _repository;

  List<Task> _tasks = [];

  bool isLoading = false;
  String? errorMessage;

  List<Task> get tasks => List.unmodifiable(_tasks);

  bool get isEmpty => !isLoading && errorMessage == null && _tasks.isEmpty;

  // GET: Cargar tareas.
  Future<void> loadTasks() async {
    if (isLoading) return;

    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      _tasks = await _repository.getTasks();
    } catch (error) {
      _tasks = [];
      errorMessage = 'No se pudieron cargar las tareas.';
      debugPrint('Error al cargar tareas: $error');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // Buscar una tarea por su identificador.
  Task? findTask(int? id) {
    if (id == null) return null;

    for (final task in _tasks) {
      if (task.id == id) {
        return task;
      }
    }

    return null;
  }

  // Cambiar el estado de una tarea.
  void toggleCompleted(int id) {
    final current = findTask(id);

    if (current == null) return;

    final updated = current.copyWith(isCompleted: !current.isCompleted);

    _repository.save(updated);

    _tasks = [
      for (final task in _tasks)
        if (task.id == id) updated else task,
    ];

    notifyListeners();
  }

  // POST: Crear una tarea.
  Future<void> createTask(
    String title,
    String description,
    String priority,
  ) async {
    final created = await _repository.createTask(title, description, priority);

    _tasks = [..._tasks, created];

    notifyListeners();
  }

  // PATCH: Actualizar una tarea.
  Future<void> updateTask(Task task) async {
    await _repository.updateTask(task);

    _tasks = [
      for (final item in _tasks)
        if (item.id == task.id) task else item,
    ];

    notifyListeners();
  }

  // DELETE: Eliminar una tarea.
  Future<void> deleteTask(int id) async {
    await _repository.deleteTask(id);

    _tasks = _tasks.where((task) => task.id != id).toList();

    notifyListeners();
  }
}
