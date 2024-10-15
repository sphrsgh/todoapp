import 'package:flutter/material.dart';
import 'package:todoapp/main.dart';

class MyCheckBox extends StatelessWidget {
  final bool isCompleted;
  final GestureTapCallback onTap;

  const MyCheckBox({super.key, required this.isCompleted, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        width: 24.0,
        height: 24.0,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
          border: !isCompleted
              ? Border.all(color: secondaryTextColor, width: 2.0)
              : null,
          color: isCompleted ? Theme.of(context).colorScheme.primary : null,
        ),
        child: isCompleted
            ? Icon(
                Icons.check,
                size: 18.0,
                color: Theme.of(context).colorScheme.surface,
              )
            : null,
      ),
    );
  }
}
