import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/features/task/domain/entity/task_entity.dart';
import 'package:todoapp/features/task/presentation/controller/task_controller.dart';

class TaskScreen extends GetView<TaskController> {
  TaskScreen({super.key});

  final TaskEntity toDo = TaskEntity(
    name: '',
    isCompleted: false,
  );

  final TextEditingController _controller = TextEditingController();

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
                minLines: 5,
                maxLines: 5,
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
