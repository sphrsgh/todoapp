import 'package:flutter/material.dart';
import 'package:todoapp/features/task/domain/entity/task_entity.dart';
import 'package:todoapp/features/task/presentation/task_screen.dart';
import 'package:todoapp/features/home/presentation/widgets/my_check_box_widget.dart';

class TaskItem extends StatefulWidget {
  const TaskItem({
    super.key,
    required this.task,
  });

  final TaskEntity task;

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(widget.task),
      onDismissed: (direction) {
        // widget.task.delete();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Task Deleted'),
            duration: Duration(seconds: 1),
          ),
        );
      },
      child: InkWell(
        splashFactory: NoSplash.splashFactory,
        child: Container(
          height: 74.0,
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 13.0),
          margin: const EdgeInsets.only(top: 8.0),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onPrimary,
            borderRadius: const BorderRadius.all(
              Radius.circular(8.0),
            ),
            border: Border(
              right: BorderSide(
                width: 8.0,
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
            ),
          ),
          child: Row(
            children: [
              MyCheckBox(
                onTap: () {
                  setState(() {
                    widget.task.isCompleted = !widget.task.isCompleted;
                  });
                },
                isCompleted: widget.task.isCompleted,
              ),
              const SizedBox(
                width: 16.0,
              ),
              Expanded(
                child: Text(
                  widget.task.name,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 18.0,
                    decoration: widget.task.isCompleted
                        ? TextDecoration.lineThrough
                        : null,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
