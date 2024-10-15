class TaskEntity {
  int userId;
  String todo;
  bool completed;

  TaskEntity({
    required this.userId,
    required this.todo,
    required this.completed,
  });

  static TaskEntity fromJson(Map<String, dynamic> element) {
    return TaskEntity(
      userId: element['id'],
      todo: element['todo'],
      completed: element['completed'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'todo': todo,
      'completed': completed,
    };
  }
}
