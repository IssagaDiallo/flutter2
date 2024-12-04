// lib/task_list.dart

import 'package:flutter/material.dart';
import 'task_form.dart';

class TaskListPage extends StatefulWidget {
  @override
  _TaskListPageState createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  // Liste des tâches
  List<Map<String, String>> _tasks = [];

  // Ajouter une tâche à la liste
  void _addTask(Map<String, String> taskData) {
    setState(() {
      _tasks.add(taskData);
    });
  }

  // Fonction pour naviguer vers la page de création de tâche
  void _navigateToTaskForm() async {
    final taskData = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TaskFormPage()),
    );

    if (taskData != null) {
      _addTask(taskData); // Ajouter la tâche si elle a été remplie et envoyée
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des Tâches'),
        backgroundColor: Colors.blueAccent,
      ),
      body: _tasks.isEmpty
          ? Center(
              child: Text(
                'Aucune tâche ajoutée pour l\'instant.',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blueAccent),
                textAlign: TextAlign.center,
              ),
            )
          : Center(
              child: Container(
                width: 600, // Largeur de la liste des tâches
                child: ListView.builder(
                  itemCount: _tasks.length,
                  itemBuilder: (context, index) {
                    final task = _tasks[index];
                    return Card(
                      margin: EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        leading: Icon(Icons.account_circle, size: 40, color: Colors.blueAccent),
                        title: Text(task['title'] ?? 'Pas de titre'),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(task['description'] ?? 'Pas de description'),
                            SizedBox(height: 5),
                            Text('Début: ${task['startDate'] ?? 'Aucune date'}'),
                            Text('Fin: ${task['endDate'] ?? 'Aucune date'}'),
                          ],
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.add, color: Colors.blueAccent),
                          onPressed: () {
                            _navigateToTaskForm();
                          },
                        ),
                        onTap: () {
                          // Affiche les détails de la tâche
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text(task['title']!),
                                content: Text('Description: ${task['description']}\nDébut: ${task['startDate']}\nFin: ${task['endDate']}'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Fermer'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToTaskForm,
        child: Icon(Icons.add),
        backgroundColor: Colors.blueAccent,
      ),
    );
  }
}
