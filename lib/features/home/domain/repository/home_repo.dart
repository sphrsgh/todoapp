import 'package:dio/dio.dart';
import 'package:todoapp/features/home/data/enum/enum.dart';
import 'package:todoapp/features/task/domain/entity/task_entity.dart';

abstract class HomeRepo {
  Future<List<Map<String, dynamic>>> getAllTasks();

  Future<Response<dynamic>> updateTask(int id, bool completed);

  Future<Response<dynamic>> deleteTask(int id);

  List<TaskEntity> setTasksFilter(List<TaskEntity> tasks, TasksFilter filter);
}
