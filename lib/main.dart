import 'package:flutter/material.dart';

void main() {
  runApp(const TaskFlowApp());
}

class TaskFlowApp extends StatelessWidget {
  const TaskFlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TaskFlow',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF003399)),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF003399),
          foregroundColor: Colors.white,
        ),
      ),
      home: const WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  // Variables de la aplicación
  int pendingTasks = 26;
  static const int dailyGoal = 5;
  int completedTasks = 0;

  final String studentName = 'Eduardo García Flores';

  final String courseName = 'Desarrollo de aplicaciones móviles';

  final String motivationalMessage =
      '¡Organiza tus tareas, alcanza tus metas y conviértete en un gran líder!';

  // Completar una tarea
  void _completeTask() {
    if (pendingTasks == 0) {
      return;
    }

    setState(() {
      pendingTasks--;

      if (completedTasks < dailyGoal) {
        completedTasks++;
      }
    });
  }

  // Agregar una tarea
  void _addTask() {
    setState(() {
      pendingTasks++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final statusMessage = pendingTasks == 0
        ? '¡Excelente! No tienes tareas pendientes.'
        : 'Aún tienes tareas por organizar.';

    return Scaffold(
      appBar: AppBar(
        title: const Text('TaskFlow'),
        centerTitle: true,
        leading: const Icon(Icons.sports_soccer),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),

              // Saludo de bienvenida
              Text(
                '¡Bienvenido, $studentName!',
                style: Theme.of(context).textTheme.headlineMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 12),

              // Estado de las tareas
              Text(statusMessage, style: const TextStyle(fontSize: 16)),

              const SizedBox(height: 28),

              // Tarjeta de información
              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.pending_actions,
                            color: Color(0xFF003399),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              'Tareas pendientes: $pendingTasks',
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 18),

                      Row(
                        children: [
                          const Icon(
                            Icons.check_circle_outline,
                            color: Colors.green,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              'Completadas hoy: $completedTasks de $dailyGoal',
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Botones de acciones
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  ElevatedButton.icon(
                    onPressed: _addTask,
                    icon: const Icon(Icons.add),
                    label: const Text('Agregar tarea'),
                  ),

                  OutlinedButton.icon(
                    onPressed: pendingTasks == 0 ? null : _completeTask,
                    icon: const Icon(Icons.done),
                    label: const Text('Completar una tarea'),
                  ),
                ],
              ),

              const SizedBox(height: 32),

              // Mensaje motivacional
              Center(
                child: Text(
                  motivationalMessage,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 16,
                  ),
                ),
              ),

              const SizedBox(height: 25),

              // Nombre de la asignatura
              Center(
                child: Text(
                  courseName,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFF003399),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
