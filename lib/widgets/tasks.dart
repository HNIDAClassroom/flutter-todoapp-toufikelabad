import 'package:flutter/material.dart';
import 'package:tp3/models/task.dart';
import 'package:tp3/widgets/tasks_list.dart';

class Tasks extends StatefulWidget {
  const Tasks({super.key});

  @override
  State<StatefulWidget> createState() {
    return TasksState();
  }
}

class TasksState extends State<Tasks> {
  final List<Task> _registeredTasks = [
    Task(
      title: 'Apprendre Flutter',
      description: 'Suivre le cours pour apprendre de nouvelles compétences',
      date: DateTime.now(),
      category: Category.work,
    ),
    Task(
      title: 'Faire les courses',
      description: 'Acheter des provisions pour la semaine',
      date: DateTime.now().subtract(Duration(days: 1)),
      category: Category.shopping,
    ),
    Task(
      title: 'Rediger un CR',
      description: '',
      date: DateTime.now().subtract(Duration(days: 2)),
      category: Category.personal,
    ),
    // Add more tasks with descriptions as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('toDoList App'),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Ink(
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.grey),
                  child: const Icon(Icons.add))),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(child: TasksList(tasks: _registeredTasks)),
          ],
        ),
      ),
    );
  }
}
