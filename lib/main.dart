import 'package:flutter/material.dart';

void main() {
  runApp(const TaskFlowApp());
}

// 1. Modelo de tarea
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

// 2. Lista de tareas
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
    description: 'Implementar widgets con estado y Eduardo Garcia',
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

// 3. Tarjeta de tarea
class TaskCard extends StatelessWidget {
  final Task task;

  const TaskCard({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        onTap: () {
          Navigator.pushNamed(context, '/task/${task.id}');
        },
        leading: Icon(
          task.isCompleted ? Icons.check_circle : Icons.radio_button_unchecked,
          color: task.isCompleted ? Colors.green : Colors.grey,
        ),
        title: Text(
          task.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text('${task.priority} · ${task.description}'),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}

// 4. Pantalla de listado
class TaskListScreen extends StatelessWidget {
  const TaskListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis tareas - TaskFlow'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
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

// 5. Pantalla de detalle
class TaskDetailScreen extends StatelessWidget {
  final Task task;

  const TaskDetailScreen({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name ?? '';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalle de la tarea'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.assignment, size: 65, color: Colors.indigo),
            const SizedBox(height: 20),

            Text(
              task.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            Text('ID: ${task.id}', style: const TextStyle(fontSize: 18)),

            const SizedBox(height: 12),

            Text(
              'Descripción: ${task.description}',
              style: const TextStyle(fontSize: 17),
            ),

            const SizedBox(height: 12),

            Text(
              'Prioridad: ${task.priority}',
              style: const TextStyle(fontSize: 17),
            ),

            const SizedBox(height: 12),

            Text(
              'Estado: ${task.isCompleted ? "Completada" : "Pendiente"}',
              style: const TextStyle(fontSize: 17),
            ),

            const SizedBox(height: 20),

            const Text(
              'Ruta actual:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            Text(currentRoute),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
                label: const Text('Volver al listado'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.all(15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 6. Aplicación principal y configuración de rutas
class TaskFlowApp extends StatelessWidget {
  const TaskFlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TaskFlow',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == '/') {
          return MaterialPageRoute(
            settings: settings,
            builder: (context) => const TaskListScreen(),
          );
        }

        if (settings.name!.startsWith('/task/')) {
          final idText = settings.name!.split('/').last;
          final id = int.tryParse(idText);

          Task? selectedTask;

          for (final task in demoTasks) {
            if (task.id == id) {
              selectedTask = task;
              break;
            }
          }

          if (selectedTask != null) {
            return MaterialPageRoute(
              settings: settings,
              builder: (context) => TaskDetailScreen(task: selectedTask!),
            );
          }
        }

        return MaterialPageRoute(
          builder: (context) =>
              const Scaffold(body: Center(child: Text('Tarea no encontrada'))),
        );
      },
    );
  }
}
