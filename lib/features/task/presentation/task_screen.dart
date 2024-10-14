import 'package:flutter/material.dart';
import 'package:todoapp/features/task/domain/entity/task_entity.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  final TaskEntity toDo = TaskEntity(
    name: '',
    isCompleted: false,
  );
  late final TextEditingController _controller = TextEditingController();

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
                minLines: 7,
                maxLines: 7,
                decoration: InputDecoration(
                  label: Text(
                    'Enter ToDo...',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  alignLabelWithHint: true,
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
