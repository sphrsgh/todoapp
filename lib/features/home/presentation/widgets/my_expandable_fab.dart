import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';

class MyExpandableFAB extends StatelessWidget {
  const MyExpandableFAB({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ExpandableFabState> expandableFabKey =
        GlobalKey<ExpandableFabState>();

    return ExpandableFab(
      key: expandableFabKey,
      type: ExpandableFabType.up,
      pos: ExpandableFabPos.left,
      openButtonBuilder: RotateFloatingActionButtonBuilder(
        child: const Icon(Icons.filter_list_alt),
        fabSize: ExpandableFabSize.regular,
      ),
      closeButtonBuilder: FloatingActionButtonBuilder(
        builder: (context, onPressed, progress) {
          return FloatingActionButton(
            onPressed: () {
              final state = expandableFabKey.currentState;
              if (state != null) {
                state.toggle();
              }
            },
            child: const Text('All'),
          );
        },
        size: 56.0,
      ),
      children: [
        FloatingActionButton.extended(
          heroTag: null,
          icon: const Icon(Icons.done),
          label: const Text('Completed'),
          onPressed: () {
            final state = expandableFabKey.currentState;
            if (state != null) {
              state.toggle();
            }
          },
        ),
        FloatingActionButton.extended(
          heroTag: null,
          icon: const Icon(Icons.close),
          label: const Text('Incompleted'),
          onPressed: () {
            final state = expandableFabKey.currentState;
            if (state != null) {
              state.toggle();
            }
          },
        ),
      ],
    );
  }
}
