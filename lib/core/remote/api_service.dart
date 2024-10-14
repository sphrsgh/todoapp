import 'package:dio/dio.dart';
import 'package:todoapp/features/task/domain/entity/task_entity.dart';

class ApiService {
  final String _domain = 'https://dummyjson.com/';
  final Dio _dio = Dio();

  Future<List<Map<String, dynamic>>> getAllTasks() async {
    final response = await _dio.get('$_domain/todos');
    print(response.data['todos']);
    return response.data['todos'];
  }

  Future<Response<dynamic>> createTask(TaskEntity task) async {
    Response response = await _dio.post(
      '$_domain/add',
      data: {
        'todo': task.name,
        'completed': task.isCompleted,
        'userId': 100,
      },
      options: Options(
        headers: {'Content-Type': 'application/json'},
      ),
    );

    return response;
  }

  Future<Response<dynamic>> updateTask(int id, bool completed) async {
    Response response = await _dio.put(
      '$_domain/todos/$id',
      data: {
        'completed': completed,
      },
    );
    return response;
  }

  Future<Response<dynamic>> deleteTask(int id) async {
    final response = await _dio.delete('$_domain/todos/$id');
    return response;
  }
}
