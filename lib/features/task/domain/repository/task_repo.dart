import 'package:dio/dio.dart';
import 'package:todoapp/features/task/domain/entity/task_entity.dart';

abstract class TaskRepo {
  Future<Response<dynamic>> createTask(TaskEntity task);
}
