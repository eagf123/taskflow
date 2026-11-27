import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../domain/task.dart';

class TaskApiService {
  static const int userId = 1;

  TaskApiService()
    : _dio = Dio(
        BaseOptions(
          baseUrl: 'https://jsonplaceholder.typicode.com',
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
        ),
      );

  final Dio _dio;

  // GET: Obtener todas las tareas.
  Future<List<Task>> getTasks() async {
    final response = await _dio.get<List<dynamic>>(
      '/todos',
      queryParameters: {'userId': userId},
    );

    debugPrint('GET /todos?userId=$userId → HTTP ${response.statusCode}');

    final rows = response.data;

    if (rows == null) {
      throw const FormatException('La respuesta no contiene una lista.');
    }

    return rows.map((row) {
      final json = Map<String, dynamic>.from(row as Map);
      return Task.fromJson(json);
    }).toList();
  }

  // POST: Crear una tarea.
  Future<Task> createTask(String title) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/todos',
      data: {'title': title, 'completed': false, 'userId': userId},
    );

    debugPrint('POST /todos → HTTP ${response.statusCode}');

    final json = response.data;

    if (json == null) {
      throw const FormatException('Respuesta vacía.');
    }

    return Task.fromJson(json);
  }

  // PATCH: Actualizar una tarea.
  Future<void> updateTask(Task task) async {
    final response = await _dio.patch(
      '/todos/${task.id}',
      data: {'title': task.title, 'completed': task.isCompleted},
    );

    debugPrint('PATCH /todos/${task.id} → HTTP ${response.statusCode}');
  }

  // DELETE: Eliminar una tarea.
  Future<void> deleteTask(int id) async {
    final response = await _dio.delete('/todos/$id');

    debugPrint('DELETE /todos/$id → HTTP ${response.statusCode}');
  }
}
