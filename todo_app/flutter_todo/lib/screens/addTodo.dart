import 'package:flutter/material.dart';
import 'package:flutter_todo/api/api.dart';
import 'package:provider/provider.dart';
import '../models/todo.dart';

class AddTodoScreen extends StatefulWidget {
  @override
  _AddTodoScreenState createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  final todoTitleController = TextEditingController();
  final todoDescriptionController = TextEditingController();

  void onAdd() {
    final String textVal = todoTitleController.text;
    final String desVal = todoDescriptionController.text;

    if (textVal.isNotEmpty && desVal.isNotEmpty) {
      final Todo todo = Todo(
        title: textVal,
        description: desVal,
      );
      Provider.of<TodoProvider>(context, listen: false).addTodo(todo);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Todo')),
      body: ListView(
        children: [
          Container(
            child: Column(
              children: [
                TextField(
                  controller: todoTitleController,
                ),
                TextField(
                  controller: todoDescriptionController,
                ),
                RaisedButton(
                    child: Text('Add'),
                    onPressed: () {
                      onAdd();
                      Navigator.of(context).pop();
                    })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
