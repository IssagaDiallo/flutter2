// lib/task_form.dart

import 'package:flutter/material.dart';

class TaskFormPage extends StatefulWidget {
  @override
  _TaskFormPageState createState() => _TaskFormPageState();
}

class _TaskFormPageState extends State<TaskFormPage> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, String> _taskData = {
    'title': '',
    'description': '',
    'startDate': '',
    'endDate': '',
  };

  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Créer une tâche"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Titre
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Titre',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent),
                  ),
                ),
                onSaved: (value) {
                  _taskData['title'] = value!;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer un titre';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              // Description
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent),
                  ),
                ),
                onSaved: (value) {
                  _taskData['description'] = value!;
                },
              ),
              SizedBox(height: 10),
              // Date de début
              TextFormField(
                controller: _startDateController,
                decoration: InputDecoration(
                  labelText: 'Date de début',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent),
                  ),
                ),
                onSaved: (value) {
                  _taskData['startDate'] = _startDateController.text;
                },
              ),
              SizedBox(height: 10),
              // Date de fin
              TextFormField(
                controller: _endDateController,
                decoration: InputDecoration(
                  labelText: 'Date de fin',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent),
                  ),
                ),
                onSaved: (value) {
                  _taskData['endDate'] = _endDateController.text;
                },
              ),
              SizedBox(height: 20),
              // Bouton de sauvegarde
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    Navigator.pop(context, _taskData);
                  }
                },
                child: Text("Sauvegarder la tâche"),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
