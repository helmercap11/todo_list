
import 'package:flutter/material.dart';
import 'package:todo_list/models/task.dart';

class TaskDialog extends StatefulWidget {
  final Task task;

  // Construtor para receber uma tarefa quando precisar edita-la
  TaskDialog({this.task})

  @override
  _TaskDialogState createState() => _TaskDialogState();
}

class _TaskDialogState extends State<TaskDialog> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  Task _currentTask = Task();

  @override
  void initState() {
    super.initState();

    // Verifica se foi enviado alguma tarefa para edição
    // Caso queira editar, copia-se essa tarefa

    if(widget.task != null) {
      _currentTask = Task.fromMap(widget.task.toMap());
    }

    _titleController.text = _currentTask.title;
    _descriptionController.text = _currentTask.description;
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.clear();
    _descriptionController.clear();
  }
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        widget.task == null ? 'Nova Tarefa' : 'Editar tarefas'
      ),  
    );
  }
}