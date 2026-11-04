import 'package:flutter/material.dart';

void main() {
  runApp(const TaskFlowApp());
}

// 1. Clase modelo de Task
class Task {
  final int id;
  final String title;
  final String description;
  final String priority;
  final bool isCompleted;

  const Task({
    required this.id,
    required this.title,
    required this.description,
    required this.priority,
    required this.isCompleted,
  });
}

// 2. Lista de tareas auténticas del proyecto
final List<Task> demoTasks = [
  const Task(
    id: 1,
    title: 'Configurar entorno de desarrollo',
    description: 'Instalar Flutter y dependencias en VS Code',
    priority: 'Alta',
    isCompleted: true,
  ),
  const Task(
    id: 2,
    title: 'Diseñar la pantalla Welcome',
    description: 'Implementar widgets con estado y nombre del estudiante',
    priority: 'Alta',
    isCompleted: true,
  ),
  const Task(
    id: 3,
    title: 'Crear componente TaskCard',
    description: 'Extraer ListTile con subtítulo y prioridad',
    priority: 'Media',
    isCompleted: false,
  ),
  const Task(
    id: 4,
    title: 'Implementar ListView.builder',
    description: 'Mostrar la lista de tareas a demanda',
    priority: 'Alta',
    isCompleted: false,
  ),
  const Task(
    id: 5,
    title: 'Ejecutar control de calidad',
    description: 'Validar análisis estático con flutter analyze',
    priority: 'Baja',
    isCompleted: false,
  ),
];

// 3. Widget TaskCard extraído
class TaskCard extends StatelessWidget {
  const TaskCard({super.key, required this.task});

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(
          task.isCompleted ? Icons.check_circle : Icons.radio_button_unchecked,
          color: task.isCompleted ? Colors.green : null,
        ),
        title: Text(task.title),
        subtitle: Text('${task.priority} · ${task.description}'),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}

// 4. Pantalla TaskListScreen con ListView.builder
class TaskListScreen extends StatelessWidget {
  const TaskListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis tareas - TaskFlow'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: demoTasks.length,
        itemBuilder: (context, index) {
          final task = demoTasks[index];
          return TaskCard(task: task);
        },
      ),
    );
  }
}

class TaskFlowApp extends StatelessWidget {
  const TaskFlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TaskFlow',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
        ),
        useMaterial3: true,
      ),
      home: const TaskListScreen(),
    );
  }
}