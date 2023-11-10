// firestore.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'task.dart';

class FirestoreService {
  final CollectionReference tasks =
      FirebaseFirestore.instance.collection('tasks');

  Future<void> addTask(Task task) {
    return tasks.add({
      'taskTitle': task.title.toString(),
      'taskDesc': task.description.toString(),
      'taskCategory': task.category.toString().split(
          '.')[1], // Utilisez split pour obtenir le nom réel de l'énumération
      'taskDate': task.date.toIso8601String(),
    });
  }

  Stream<QuerySnapshot> getTasks() {
    return tasks.snapshots();
  }

  Future<void> updateTaskCompletion(String taskId, bool isCompleted) {
    return tasks.doc(taskId).update({
      'isCompleted': isCompleted,
    });
  }

  Future<void> deleteTask(String taskId) {
    return tasks.doc(taskId).delete();
  }
}
