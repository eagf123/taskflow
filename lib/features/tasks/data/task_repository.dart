import '../domain/task.dart';

abstract class TaskRepository {
  Future<List<Task>> getTasks();

  void save(Task task);

  // POST: Crear una tarea.
  Future<Task> createTask(String title, String description, String priority);

  // PATCH: Actualizar una tarea.
  Future<void> updateTask(Task task);

  // DELETE: Eliminar una tarea.
  Future<void> deleteTask(int id);
}
