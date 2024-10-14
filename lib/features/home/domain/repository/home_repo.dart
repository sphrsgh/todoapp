import 'package:dio/dio.dart';

abstract class HomeRepo {
  Future<List<Map<String, dynamic>>> getAllTasks();

  Future<Response<dynamic>> updateTask(int id, bool completed);

  Future<Response<dynamic>> deleteTask(int id);
}
