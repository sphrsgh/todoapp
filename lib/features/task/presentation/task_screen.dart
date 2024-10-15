import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/features/task/presentation/controller/task_controller.dart';
import 'package:todoapp/features/task/presentation/widgets/my_radio_choice_widget.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Create New Task',
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
              GetBuilder(
                init: TaskController(),
                builder: (controller) => TextField(
                  controller: controller.todoCrtl,
                  minLines: 5,
                  maxLines: 5,
                  decoration: InputDecoration(
                    label: Text(
                      'Enter Todo...',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    alignLabelWithHint: true,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              GetBuilder(
                init: TaskController(),
                builder: (controller) => MyRadioChoiceWidget(
                  onTapCompleted: () => controller.completed = true,
                  onTapIncompleted: () => controller.completed = false,
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: GetBuilder(
          init: TaskController(),
          builder: (controller) => FloatingActionButton.extended(
            heroTag: 'newToDoHeroTag',
            onPressed: () async {
              bool res = await controller.addTask();
              if (context.mounted) {
                if (res) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Task Added'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Something went wrong'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                }
              }
              Get.back();
            },
            label: const Text('Save'),
            icon: const Icon(Icons.save),
          ),
        ),
      ),
    );
  }
}
