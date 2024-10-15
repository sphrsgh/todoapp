import 'package:dio/dio.dart';
import 'package:todoapp/features/task/domain/entity/task_entity.dart';

class ApiService {
  final String _domain = 'https://dummyjson.com';
  final Dio _dio = Dio();

  Future<List<dynamic>> getAllTasks() async {
    try {
      final response = await _dio.get('$_domain/todos');
      return response.data['todos'];
    } catch (e) {
      print(e);
      return [
        {
          "id": 1,
          "todo": e.toString(),
          "completed": false,
          "userId": -1,
        },
      ];
    }
  }

  Future<Response<dynamic>> createTask(TaskEntity task) async {
    final response = await _dio.post(
      'https://dummyjson.com/todos/add',
      data: {
        'todo': task.todo,
        'completed': task.completed,
        'userId': task.userId,
      },
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
