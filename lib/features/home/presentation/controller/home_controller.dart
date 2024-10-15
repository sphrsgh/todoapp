import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:todoapp/core/remote/api_service.dart';
import 'package:todoapp/features/home/data/enum/enum.dart';
import 'package:todoapp/features/home/domain/repository/home_repo.dart';
import 'package:todoapp/features/home/domain/usecases/home_usecases.dart';
import 'package:todoapp/features/home/data/entity/todo_entity.dart';

class HomeController extends GetxController {
  late HomeRepo repo;

  List<TodoEntity> _tasks = [];
  List<TodoEntity> _tasksBackup = [];

  List<TodoEntity> get tasks => _tasks;

  @override
  void onInit() async {
    repo = HomeRepoImp(
      apiService: ApiService(),
    );
    await loadTasks();
    super.onInit();
  }

  Future<void> loadTasks() async {
    List<dynamic> result = await repo.getAllTasks();

    _tasks = [];
    for (var element in result) {
      _tasks.add(TodoEntity.fromJson(element));
      _tasksBackup = _tasks;
    }
    update();
  }

  Future<bool> updateTask(int id, bool completed) async {
    dio.Response<dynamic> res = await repo.updateTask(id, completed);
    if (res.statusCode == 200) {
      _tasks.firstWhere((element) => element.id == id).isCompleted = completed;
      _tasksBackup.firstWhere((element) => element.id == id).isCompleted =
          completed;
      update();
      return true;
    } else {
      return false;
    }
  }

  Future<bool> deleteTask(int id) async {
    dio.Response res = await repo.deleteTask(id);
    if (res.statusCode == 200) {
      _tasks.removeWhere((element) => element.id == id);
      _tasksBackup.removeWhere((element) => element.id == id);
      update();
      return true;
    } else {
      return false;
    }
  }

  void changeFilter(TasksFilter filter) async {
    _tasks = _tasksBackup;
    switch (filter) {
      case TasksFilter.all:
        _tasks = _tasks;
        break;
      case TasksFilter.completed:
        _tasks =
            _tasks.where((element) => element.isCompleted == true).toList();
        break;
      case TasksFilter.incompleted:
        _tasks =
            _tasks.where((element) => element.isCompleted == false).toList();
        break;
    }
    update();
  }
}
