import 'package:dio/src/response.dart';
import 'package:todoapp/core/remote/api_service.dart';
import 'package:todoapp/features/task/domain/entity/task_entity.dart';
import 'package:todoapp/features/task/domain/repository/task_repo.dart';

class TaskRepoImp extends TaskRepo {
  late ApiService apiService;

  TaskRepoImp({required this.apiService});

  @override
  Future<Response> createTask(TaskEntity task) {
    return apiService.createTask(task);
  }
}
