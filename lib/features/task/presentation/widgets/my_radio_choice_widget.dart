import 'package:flutter/material.dart';

class MyRadioChoiceWidget extends StatefulWidget {
  const MyRadioChoiceWidget({
    super.key,
    required this.onTapCompleted,
    required this.onTapIncompleted,
  });

  final Function onTapCompleted;
  final Function onTapIncompleted;

  @override
  State<MyRadioChoiceWidget> createState() => _MyRadioChoiceWidgetState();
}

class _MyRadioChoiceWidgetState extends State<MyRadioChoiceWidget> {
  bool completed = false;

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      children: [
        Flexible(
          flex: 1,
          child: InkWell(
            onTap: () {
              setState(() => completed = false);
              widget.onTapIncompleted();
            },
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            child: Container(
              width: double.maxFinite,
              height: 48.0,
              padding: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1.0,
                  color: Colors.red,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                color: !completed ? Colors.red : Colors.transparent,
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.close,
                      color: !completed ? Colors.white : Colors.red,
                    ),
                    Text(
                      'Incompleted',
                      style: TextStyle(
                        color: !completed ? Colors.white : Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 10.0,
        ),
        Flexible(
          flex: 1,
          child: InkWell(
            onTap: () {
              setState(() => completed = true);
              widget.onTapCompleted();
            },
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            child: Container(
              width: double.maxFinite,
              height: 48.0,
              padding: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1.0,
                  color: Colors.green,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                color: completed ? Colors.green : Colors.transparent,
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.done,
                      color: completed ? Colors.white : Colors.green,
                    ),
                    Text(
                      'Completed',
                      style: TextStyle(
                        color: completed ? Colors.white : Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
