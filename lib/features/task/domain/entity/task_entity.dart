class TaskEntity {
  int? id;
  String name;
  bool isCompleted;

  TaskEntity({
    this.id,
    required this.name,
    required this.isCompleted,
  });
}
