class ToDoModel {
  int _id = -1;
  String _name = "";
  bool _isCompleted = false;

  // run in terminal: dart run build_runner build
  // or: dart run build_runner watch

  int get id => _id;
  String get name => _name;
  bool get isCompleted => _isCompleted;

  set id(int value) {
    _id = value;
  }

  set name(String value) {
    _name = value;
  }

  set isCompleted(bool value) {
    _isCompleted = value;
  }

  setTask(String name, bool isCompleted) {
    _name = name;
    _isCompleted = isCompleted;
  }
}
