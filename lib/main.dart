import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/taskflow_app.dart';
import 'features/tasks/data/remote_task_repository.dart';
import 'features/tasks/data/task_api_service.dart';
import 'features/tasks/presentation/tasks_view_model.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final apiService = TaskApiService();
  final repository = RemoteTaskRepository(apiService);

  runApp(
    ChangeNotifierProvider(
      create: (context) {
        final viewModel = TasksViewModel(repository);
        viewModel.loadTasks();
        return viewModel;
      },
      child: const TaskFlowApp(),
    ),
  );
}
