// new_task.dart
import 'package:flutter/material.dart';
import 'package:projet/task.dart';

class NewTask extends StatefulWidget {
  const NewTask({super.key, required this.onAddTask});

  final void Function(Task task) onAddTask;

  @override
  State<NewTask> createState() {
    return _NewTaskState();
  }
}

class _NewTaskState extends State<NewTask> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  Category _selectedCategory = Category.personal;
  DateTime _selectedDate = DateTime.now();

  void _submitTaskData() {
    if (_titleController.text.trim().isEmpty) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Erreur'),
          content: const Text(
              'Merci de saisir le titre de la tâche à ajouter dans la liste'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('Okay'),
            ),
          ],
        ),
      );
      return;
    }

    widget.onAddTask(Task(
      title: _titleController.text,
      description: _descriptionController.text,
      date: _selectedDate,
      category: _selectedCategory,
    ));

    // Reset controllers and selected date after adding the task
    _titleController.clear();
    _descriptionController.clear();
    _selectedDate = DateTime.now();
    _selectedCategory = Category.personal;
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: _titleController,
            maxLength: 50,
            decoration: InputDecoration(
              labelText: 'Title',
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: _descriptionController,
            maxLength: 150,
            decoration: InputDecoration(
              labelText: 'Description',
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Text('Select Date:'),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () => _selectDate(context),
                child: Text('Select Date'),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Text('Select Category:'),
              SizedBox(width: 10),
              DropdownButton<Category>(
                value: _selectedCategory,
                items: Category.values.map((Category category) {
                  return DropdownMenuItem<Category>(
                    value: category,
                    child: Text(category.toString().split('.')[1]),
                  );
                }).toList(),
                onChanged: (Category? newValue) {
                  if (newValue != null) {
                    setState(() {
                      _selectedCategory = newValue;
                    });
                  }
                },
              ),
            ],
          ),
          SizedBox(height: 60),
          ElevatedButton(
            onPressed: _submitTaskData,
            child: const Text('Enregistrer'),
          ),
        ],
      ),
    );
  }
}
