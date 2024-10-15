import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/features/home/presentation/controller/home_controller.dart';
import 'package:todoapp/features/home/data/entity/todo_entity.dart';
import 'package:todoapp/features/home/presentation/widgets/task_item_widget.dart';

class TaskListWidget extends GetView<HomeController> {
  const TaskListWidget({
    super.key,
    required this.items,
  });

  final List<TodoEntity> items;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return Center(
        child: CircularProgressIndicator(
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
      );
    } else {
      return ListView.builder(
        padding: const EdgeInsets.only(
          top: 16.0,
          bottom: 100.0,
          left: 16.0,
          right: 16.0,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final TodoEntity task = items[index];
          return TaskItem(
            task: task,
          );
        },
      );
    }
  }
}
