// tasks_list.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'task.dart';
import 'firestore.dart';
import 'task_item.dart';

class TasksList extends StatelessWidget {
  final FirestoreService firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: firestoreService.getTasks(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final taskLists = snapshot.data!.docs;
          List<Task> taskItems = [];

          for (int index = 0; index < taskLists.length; index++) {
            DocumentSnapshot document = taskLists[index];
            Map<String, dynamic> data = document.data() as Map<String, dynamic>;
            String title = data['taskTitle'];
            String description = data['taskDesc'];
            DateTime date = DateTime.parse(data['taskDate']);
            String categoryString = data['taskCategory'];
            Category category;

            switch (categoryString) {
              case 'personal':
                category = Category.personal;
                break;
              case 'work':
                category = Category.work;
                break;
              case 'shopping':
                category = Category.shopping;
                break;
              default:
                category = Category.others;
            }

            Task task = Task(
              title: title,
              description: description,
              date: date,
              category: category,
            );

            taskItems.add(task);
          }

          return ListView.builder(
            itemCount: taskItems.length,
            itemBuilder: (ctx, index) {
              return TaskItem(taskItems[index]);
            },
          );
        }
      },
    );
  }
}
