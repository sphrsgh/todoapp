import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/features/home/presentation/controller/home_controller.dart';
import 'package:todoapp/features/home/data/entity/todo_entity.dart';
import 'package:todoapp/features/home/presentation/widgets/my_check_box_widget.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({
    super.key,
    required this.task,
  });

  final TodoEntity task;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75.0,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 13.0),
      margin: const EdgeInsets.only(top: 8.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
        borderRadius: const BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: Row(
        children: [
          GetBuilder(
            init: HomeController(),
            builder: (controller) => MyCheckBox(
              onTap: () async {
                bool res =
                    await controller.updateTask(task.id!, !task.isCompleted);
                if (context.mounted) {
                  if (res) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Task Updated'),
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
              },
              isCompleted: task.isCompleted,
            ),
          ),
          const SizedBox(
            width: 16.0,
          ),
          Expanded(
            child: Text(
              task.name,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 18.0,
                decoration:
                    task.isCompleted ? TextDecoration.lineThrough : null,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),
          GetBuilder(
            init: HomeController(),
            builder: (controller) => IconButton(
              onPressed: () async {
                bool res = await controller.deleteTask(task.id!);
                if (context.mounted) {
                  if (res) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Task Deleted'),
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
              },
              icon: const Icon(Icons.delete_rounded, color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}
