import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:get/get.dart';
import 'package:todoapp/features/home/presentation/controller/home_controller.dart';
import 'package:todoapp/features/home/presentation/widgets/my_expandable_fab.dart';
import 'package:todoapp/features/task/presentation/task_screen.dart';
import 'package:todoapp/features/home/presentation/widgets/task_list_widget.dart';

class HomeScreen extends GetView<HomeController> {
  HomeScreen({super.key});

  final ValueNotifier<String> seachKeywordNotifier = ValueNotifier('');

  @override
  Widget build(BuildContext context) {
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
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TaskScreen())),
                label: const Text('New ToDo'),
                icon: const Icon(Icons.add),
              ),
            ),
          ],
        ),
        floatingActionButtonLocation: ExpandableFab.location,
        floatingActionButton: const MyExpandableFAB(),
      ),
    );
  }
}
