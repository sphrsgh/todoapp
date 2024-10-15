class TodoEntity {
  int? id;
  String name;
  bool isCompleted;

  TodoEntity({
    this.id,
    required this.name,
    required this.isCompleted,
  });

  static TodoEntity fromJson(Map<String, dynamic> element) {
    return TodoEntity(
      id: element['id'],
      name: element['todo'],
      isCompleted: element['completed'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'todo': name,
      'completed': isCompleted,
    };
  }
}
