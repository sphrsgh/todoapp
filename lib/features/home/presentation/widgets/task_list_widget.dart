import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/main.dart';
import 'package:todoapp/features/todo/domain/entity/todo_entity.dart';
import 'package:todoapp/features/home/presentation/widgets/task_item_widget.dart';

class TaskListWidget extends StatelessWidget {
  const TaskListWidget({
    super.key,
    required this.items,
    required this.themeData,
  });

  final List<ToDoEntity> items;
  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(
        top: 16.0,
        bottom: 100.0,
        left: 16.0,
        right: 16.0,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final ToDoEntity task = items[index];
        return TaskItem(
          task: task,
        );
      },
    );
  }
}
