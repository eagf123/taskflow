import 'package:flutter/material.dart';

void main() {
  runApp(const TaskFlowApp());
}

// 1. MODELO DE TAREA
class Task {
  final int id;
  final String title;
  final String description;
  final String priority;
  final bool isCompleted;
  final int userId;

  const Task({
    required this.id,
    required this.title,
    required this.description,
    required this.priority,
    required this.isCompleted,
    required this.userId,
  });
}

// 2. LISTA DE TAREAS
const List<Task> demoTasks = [
  Task(
    id: 1,
    title: 'Configurar entorno de desarrollo',
    description: 'Instalar Flutter y configurar las herramientas necesarias.',
    priority: 'Alta',
    isCompleted: true,
    userId: 1,
  ),
  Task(
    id: 2,
    title: 'Diseñar pantalla de bienvenida',
    description: 'Crear una interfaz atractiva para la aplicación TaskFlow.',
    priority: 'Alta',
    isCompleted: true,
    userId: 1,
  ),
  Task(
    id: 3,
    title: 'Crear componente TaskCard',
    description: 'Diseñar tarjetas reutilizables para mostrar las tareas.',
    priority: 'Media',
    isCompleted: false,
    userId: 1,
  ),
  Task(
    id: 4,
    title: 'Implementar listado de tareas',
    description: 'Mostrar las actividades utilizando ListView.builder.',
    priority: 'Alta',
    isCompleted: false,
    userId: 1,
  ),
  Task(
    id: 5,
    title: 'Ejecutar control de calidad',
    description: 'Validar el proyecto utilizando flutter analyze.',
    priority: 'Baja',
    isCompleted: false,
    userId: 1,
  ),
];

// 3. BUSCAR TAREA POR ID
Task? findTask(int? id) {
  for (final task in demoTasks) {
    if (task.id == id) {
      return task;
    }
  }
  return null;
}

// 4. TARJETA DE TAREA
class TaskCard extends StatelessWidget {
  final Task task;

  const TaskCard({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        onTap: () {
          Navigator.pushNamed(context, '/task/${task.id}');
        },
        leading: Icon(
          task.isCompleted ? Icons.check_circle : Icons.radio_button_unchecked,
          color: task.isCompleted ? Colors.green : Colors.orange,
          size: 30,
        ),
        title: Text(
          task.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Text('Prioridad: ${task.priority}\n${task.description}'),
        ),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}

// 5. PANTALLA DE LISTADO
class TaskListScreen extends StatelessWidget {
  const TaskListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final completed = demoTasks.where((task) => task.isCompleted).length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('TaskFlow - Mis tareas'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '¡Hola! Bienvenido a TaskFlow',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              'Organiza tus actividades y alcanza tus metas.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 18),
            Card(
              color: Colors.indigo.shade50,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          '${demoTasks.length}',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.indigo,
                          ),
                        ),
                        const Text('Total'),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          '$completed',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                        const Text('Completadas'),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          '${demoTasks.length - completed}',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange,
                          ),
                        ),
                        const Text('Pendientes'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Mis actividades',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: demoTasks.length,
                itemBuilder: (context, index) {
                  final task = demoTasks[index];
                  return TaskCard(task: task);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 6. PANTALLA DE DETALLE
class TaskDetailScreen extends StatelessWidget {
  final Task? task;

  const TaskDetailScreen({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name ?? '';

    final selected = task;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalle de tarea'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: selected == null
            ? const Center(child: Text('No se encontró esta tarea.'))
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Icon(
                      Icons.assignment,
                      size: 75,
                      color: Colors.indigo,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    selected.title,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 20),
                  Text('ID: ${selected.id}'),
                  const SizedBox(height: 12),
                  Text('Descripción: ${selected.description}'),
                  const SizedBox(height: 12),
                  Text('Prioridad: ${selected.priority}'),
                  const SizedBox(height: 12),
                  Text(
                    selected.isCompleted
                        ? 'Estado: Completada'
                        : 'Estado: Pendiente',
                  ),
                  const SizedBox(height: 12),
                  Text('Usuario: ${selected.userId}'),
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

// 7. APLICACIÓN PRINCIPAL Y CONFIGURACIÓN DE RUTAS
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

        if (settings.name?.startsWith('/task/') ?? false) {
          final idText = settings.name!.split('/').last;
          final id = int.tryParse(idText);

          return MaterialPageRoute(
            settings: settings,
            builder: (context) {
              return TaskDetailScreen(task: findTask(id));
            },
          );
        }

        return MaterialPageRoute(
          builder: (context) =>
              const Scaffold(body: Center(child: Text('Página no encontrada'))),
        );
      },
    );
  }
}
