import 'package:hive/hive.dart';

class TodoDB {
  List todos = [];
  final _todoBox = Hive.box('todo');

  void loadTodos() {
    todos = _todoBox.get('todo_data') ?? [];
  }

  void update() {
    _todoBox.put('todo_data', todos);
  }
}
