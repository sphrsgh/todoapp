import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:todoapp/core/remote/api_service.dart';
import 'package:todoapp/features/home/data/entity/todo_entity.dart';
import 'package:todoapp/features/home/presentation/controller/home_controller.dart';
import 'package:todoapp/features/task/domain/entity/task_entity.dart';
import 'package:todoapp/features/task/domain/repository/task_repo.dart';
import 'package:todoapp/features/task/domain/usecases/task_usecases.dart';

class TaskController extends GetxController {
  late TaskRepo repo;
  late TextEditingController todoCrtl;
  bool completed = false;

  @override
  void onInit() {
    repo = TaskRepoImp(
      apiService: ApiService(),
    );
    todoCrtl = TextEditingController();
    super.onInit();
  }

  Future<bool> addTask() async {
    TaskEntity newTask = TaskEntity(
      todo: todoCrtl.text,
      completed: completed,
      userId: 100,
    );
    dio.Response<dynamic> res = await repo.createTask(newTask);
    if (res.statusCode == 201) {
      final homeController = Get.find<HomeController>();
      homeController.tasks.add(TodoEntity.fromJson(res.data));
      homeController.update();
      update();
      return true;
    } else {
      return false;
    }
  }
}
