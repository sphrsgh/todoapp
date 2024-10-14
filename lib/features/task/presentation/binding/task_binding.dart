import 'package:get/get.dart';
import 'package:todoapp/features/task/presentation/controller/task_controller.dart';

class TaskBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TaskController());
  }
}
