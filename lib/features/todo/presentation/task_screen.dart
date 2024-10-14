import 'package:flutter/material.dart';
import 'package:todoapp/features/todo/domain/entity/todo_entity.dart';

class TaskScreenView extends StatefulWidget {
  const TaskScreenView({super.key, required this.toDo});
  final ToDoEntity toDo;

  @override
  State<TaskScreenView> createState() => _TaskScreenViewState();
}

class _TaskScreenViewState extends State<TaskScreenView> {
  late final TextEditingController _controller =
      TextEditingController(text: widget.toDo.name);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(
            'Edit Task',
            style: Theme.of(context).textTheme.headlineSmall!.apply(
                  fontSizeFactor: .75,
                ),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  label: Text(
                    'Enter ToDo . . . ',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          heroTag: 'newToDoHeroTag',
          onPressed: () {
            Navigator.pop(context);
          },
          label: const Text('Save'),
          icon: const Icon(Icons.save),
        ),
      ),
    );
  }
}
