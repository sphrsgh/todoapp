import 'package:flutter/material.dart';
import 'package:todoapp/features/todo/domain/entity/todo_entity.dart';
import 'package:todoapp/features/todo/presentation/task_screen.dart';
import 'package:todoapp/features/home/presentation/widgets/my_check_box_widget.dart';

class TaskItem extends StatefulWidget {
  const TaskItem({
    super.key,
    required this.task,
  });

  final ToDoEntity task;

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
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TaskScreenView(toDo: widget.task),
              ));
        },
        child: Container(
          height: 74.0,
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 13.0),
          margin: const EdgeInsets.only(top: 8.0),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onPrimary,
            borderRadius: const BorderRadius.all(
              Radius.circular(8.0),
            ),
            border: const Border(
              right: BorderSide(
                width: 8.0,
                color: Color(0xFF3BE1F1),
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
