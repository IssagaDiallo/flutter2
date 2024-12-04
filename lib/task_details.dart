// lib/task_details.dart

import 'package:flutter/material.dart';

class TaskDetailsPage extends StatelessWidget {
  final Map<String, String> task;

  TaskDetailsPage({required this.task});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Détails de la Tâche'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Titre: ${task['title']}', style: TextStyle(fontSize: 20)),
            SizedBox(height: 8),
            Text('Description: ${task['description']}', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
