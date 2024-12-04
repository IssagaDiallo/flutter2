// lib/main.dart

import 'package:flutter/material.dart';
import 'task_list.dart'; // Assurez-vous d'importer task_list.dart

void main() {
  runApp(TaskManagementApp());
}

class TaskManagementApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestion des Tâches',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TaskListPage(),  // Utilisation de la page TaskListPage
    );
  }
}
