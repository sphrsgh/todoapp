import 'package:dio/dio.dart';
import 'package:todoapp/core/remote/api_service.dart';
import 'package:todoapp/features/home/data/enum/enum.dart';
import 'package:todoapp/features/home/domain/repository/home_repo.dart';
import 'package:todoapp/features/home/data/entity/todo_entity.dart';

class HomeRepoImp extends HomeRepo {
  late ApiService apiService;

  HomeRepoImp({
    required this.apiService,
  });

  @override
  Future<List<dynamic>> getAllTasks() {
    return apiService.getAllTasks();
  }

  @override
  Future<Response<dynamic>> updateTask(int id, bool completed) {
    return apiService.updateTask(id, completed);
  }

  @override
  Future<Response<dynamic>> deleteTask(int id) {
    return apiService.deleteTask(id);
  }

  @override
  List<TodoEntity> setTasksFilter(List<TodoEntity> tasks, TasksFilter filter) {
    switch (filter) {
      case TasksFilter.all:
        return tasks;
      case TasksFilter.completed:
        return tasks.where((task) => task.isCompleted).toList();
      case TasksFilter.incompleted:
        return tasks.where((task) => !task.isCompleted).toList();
    }
  }
}
