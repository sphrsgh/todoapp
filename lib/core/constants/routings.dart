import 'package:get/get.dart';
import 'package:todoapp/features/home/presentation/binding/home_binding.dart';
import 'package:todoapp/features/home/presentation/home_screen.dart';
import 'package:todoapp/features/task/presentation/binding/task_binding.dart';
import 'package:todoapp/features/task/presentation/task_screen.dart';

class Routings {
  static final Routings _singleton = Routings._internal();
  factory Routings() => _singleton;
  Routings._internal();

  final home = '/home';
  final task = '/task';

  List<GetPage> get pages => [
        GetPage(
          name: home,
          page: () => HomeScreen(),
          binding: HomeBinding(),
        ),
        GetPage(
          name: task,
          page: () => TaskScreen(),
          binding: TaskBinding(),
        ),
      ];
}
