import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TaskDraft {
  const TaskDraft(this.title, this.description, this.priority);

  final String title;
  final String description;
  final String priority;
}

class TaskFormScreen extends StatefulWidget {
  const TaskFormScreen({super.key});

  @override
  State<TaskFormScreen> createState() => _TaskFormScreenState();
}

class _TaskFormScreenState extends State<TaskFormScreen> {
  final _formKey = GlobalKey<FormState>();

  final _title = TextEditingController();
  final _description = TextEditingController();

  String _priority = 'Media';

  @override
  void dispose() {
    _title.dispose();
    _description.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final draft = TaskDraft(
      _title.text.trim(),
      _description.text.trim(),
      _priority,
    );

    context.pop(draft);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nueva tarea'), centerTitle: true),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Text(
              'Crear nueva tarea',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            const Text(
              'Completa los siguientes campos para preparar tu tarea.',
            ),

            const SizedBox(height: 24),

            // Campo de título
            TextFormField(
              controller: _title,
              decoration: const InputDecoration(
                labelText: 'Título',
                hintText: 'Ejemplo: Estudiar Flutter',
                prefixIcon: Icon(Icons.title),
                border: OutlineInputBorder(),
              ),
              textCapitalization: TextCapitalization.sentences,
              validator: (value) {
                final title = value?.trim() ?? '';

                if (title.isEmpty) {
                  return 'Escribe un título.';
                }

                if (title.length < 3) {
                  return 'Usa al menos 3 caracteres.';
                }

                return null;
              },
            ),

            const SizedBox(height: 20),

            // Campo de descripción
            TextFormField(
              controller: _description,
              decoration: const InputDecoration(
                labelText: 'Descripción',
                hintText: 'Describe los detalles de tu tarea',
                prefixIcon: Icon(Icons.description),
                border: OutlineInputBorder(),
                alignLabelWithHint: true,
              ),
              textCapitalization: TextCapitalization.sentences,
              maxLines: 3,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Escribe una descripción.';
                }

                return null;
              },
            ),

            const SizedBox(height: 20),

            // Selector de prioridad
            DropdownButtonFormField<String>(
              initialValue: _priority,
              decoration: const InputDecoration(
                labelText: 'Prioridad',
                prefixIcon: Icon(Icons.flag),
                border: OutlineInputBorder(),
              ),
              items: ['Alta', 'Media', 'Baja']
                  .map(
                    (value) => DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    ),
                  )
                  .toList(),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Selecciona una prioridad.';
                }

                return null;
              },
              onChanged: (value) {
                setState(() {
                  _priority = value ?? 'Media';
                });
              },
            ),

            const SizedBox(height: 30),

            // Botón guardar
            SizedBox(
              width: double.infinity,
              height: 50,
              child: FilledButton.icon(
                onPressed: _submit,
                icon: const Icon(Icons.save),
                label: const Text('Guardar tarea'),
              ),
            ),

            const SizedBox(height: 12),

            // Botón cancelar
            SizedBox(
              width: double.infinity,
              height: 48,
              child: OutlinedButton.icon(
                onPressed: () {
                  context.pop();
                },
                icon: const Icon(Icons.arrow_back),
                label: const Text('Cancelar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
