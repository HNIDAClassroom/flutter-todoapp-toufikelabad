// tasks.dart
import 'package:flutter/material.dart';
import 'package:projet/auth_gate.dart';
import 'package:projet/firestore.dart';
import 'package:projet/task.dart';
import 'package:projet/tasks_list.dart';
import 'package:projet/new_task.dart';

class Tasks extends StatefulWidget {
  const Tasks({Key? key}) : super(key: key);

  @override
  State<Tasks> createState() => TasksState();
}

class TasksState extends State<Tasks> {
  final FirestoreService firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('toDoList App'),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Navigation vers la page d'authentification
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const AuthVerify(),
              ),
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _openAddTaskOverlay,
          ),
        ],
      ),
      body: Center(
        child: TasksList(),
      ),
    );
  }

  void _openAddTaskOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => NewTask(onAddTask: addTask),
    );
  }

  void addTask(Task task) {
    setState(() {
      firestoreService.addTask(task);
      Navigator.pop(context);
    });
  }
}
