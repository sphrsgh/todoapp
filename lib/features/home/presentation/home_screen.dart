import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:todoapp/features/todo/domain/entity/todo_entity.dart';
import 'package:todoapp/features/home/presentation/widgets/empty_state_widget.dart';
import 'package:todoapp/features/todo/presentation/task_screen.dart';
import 'package:todoapp/features/home/presentation/widgets/task_list_widget.dart';

class HomeScreenView extends StatelessWidget {
  HomeScreenView({super.key});

  final ValueNotifier<String> seachKeywordNotifier = ValueNotifier('');

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ExpandableFabState> expandableFabKey =
        GlobalKey<ExpandableFabState>();

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
          flexibleSpace: Container(
            height: 132.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.primaryContainer,
                ],
              ),
            ),
          ),
          title: Text(
            'ToDo App',
            style: Theme.of(context).textTheme.headlineSmall!.apply(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSizeFactor: .8,
                ),
          ),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            TaskListWidget(items: const [], themeData: Theme.of(context)),
            Positioned(
              right: 15.0,
              bottom: 15.0,
              child: FloatingActionButton.extended(
                heroTag: 'newToDoHeroTag',
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TaskScreenView(
                                toDo: ToDoEntity(
                              name: '',
                              isCompleted: false,
                            )))),
                label: const Text('New ToDo'),
                icon: const Icon(Icons.add),
              ),
            ),
          ],
        ),
        floatingActionButtonLocation: ExpandableFab.location,
        floatingActionButton: ExpandableFab(
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
        ),
      ),
    );
  }
}
