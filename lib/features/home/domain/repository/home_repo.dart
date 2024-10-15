import 'package:dio/dio.dart';
import 'package:todoapp/features/home/data/enum/enum.dart';
import 'package:todoapp/features/home/data/entity/todo_entity.dart';

abstract class HomeRepo {
  Future<List<dynamic>> getAllTasks();

  Future<Response<dynamic>> updateTask(int id, bool completed);

  Future<Response<dynamic>> deleteTask(int id);

  List<TodoEntity> setTasksFilter(List<TodoEntity> tasks, TasksFilter filter);
}
