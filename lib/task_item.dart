// task_item.dart
import 'package:flutter/material.dart';
import 'package:projet/task.dart';
import 'firestore.dart';

class TaskItem extends StatelessWidget {
  TaskItem(this.task, {super.key});
  final Task task;

  final FirestoreService firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Checkbox(
                  value: task.isCompleted,
                  onChanged: (bool? value) async {
                    // Mettez à jour la propriété isCompleted localement
                    task.isCompleted = value ?? false;

                    // Mettez à jour la base de données
                    await firestoreService.updateTaskCompletion(
                      task.id,
                      task.isCompleted,
                    );
                  },
                ),
                const SizedBox(width: 10),
                const Icon(Icons.task),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        task.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          decoration: task.isCompleted
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        task.description,
                        style: TextStyle(
                          decoration: task.isCompleted
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    // Afficher une boîte de dialogue de confirmation avant de supprimer la tâche
                    _showDeleteConfirmationDialog(context, task.id);
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Date:  ${task.date}',
                  textAlign: TextAlign.right,
                ),
                SizedBox(width: 10),
                Text(
                  'Category: ${task.category.name}',
                  textAlign: TextAlign.right,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Méthode pour afficher la boîte de dialogue de confirmation et supprimer la tâche si confirmé
  Future<void> _showDeleteConfirmationDialog(
      BuildContext context, String taskId) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmation'),
          content:
              const Text('Êtes-vous sûr de vouloir supprimer cette tâche ?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fermer la boîte de dialogue
              },
              child: const Text('Annuler'),
            ),
            TextButton(
              onPressed: () async {
                // Supprimer la tâche de la base de données
                await firestoreService.deleteTask(task.id);

                // Mettre à jour l'interface en supprimant la tâche de la liste locale
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('Tâche supprimée avec succès.'),
                  ),
                );

                Navigator.of(context).pop(); // Fermer la boîte de dialogue
              },
              child: const Text('Supprimer'),
            ),
          ],
        );
      },
    );
  }
}
