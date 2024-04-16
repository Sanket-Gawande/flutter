import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo/components/create-todo.dart';
import 'package:todo/components/todo-tile.dart';
import 'package:todo/data/hive.dart';

class Todo extends StatefulWidget {
  const Todo({super.key});

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  final _todo_ = Hive.box('todo');
  TodoDB db = TodoDB();

  void onChanges(value, index) {
    setState(() {
      db.todos[index][1] = value;
    });
    db.update();
  }

  void onCreate(String task) {
    if (task.isEmpty) return;
    setState(() {
      db.todos.add([task, false, DateTime.now().toString().substring(0, 16)]);
    });
    db.update();
    Navigator.pop(context);
  }

  void createTask() {
    showDialog(
        context: context, builder: (context) => CreateTodo(onCreate: onCreate));
  }

  void onDelete(int index) {
    setState(() {
      db.todos.removeAt(index);
    });
    db.update();
  }

  @override
  void initState() {
    super.initState();
    db.loadTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: createTask,
          enableFeedback: true,
          child: Icon(Icons.add),
          backgroundColor: const Color.fromRGBO(40, 42, 58, 1),
          foregroundColor: Colors.white,
        ),
        backgroundColor: const Color.fromRGBO(64, 66, 88, 1),
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: const Color.fromRGBO(40, 42, 58, 1),
          title: const Text('To Do'),
          centerTitle: true,
        ),
        drawer: const Drawer(
            backgroundColor: Color.fromRGBO(71, 78, 104, 1),
            child: Center(
                child: Text(
              'Hi!!!',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ))),
        body: db.todos.length > 0
            ? Padding(
                padding: const EdgeInsets.only(
                    top: 0, bottom: 10, right: 10, left: 10),
                child: ListView.builder(
                    itemCount: db.todos.length,
                    itemBuilder: (context, index) => TodoTile(
                        task: db.todos[index][0],
                        taskCompleted: db.todos[index][1],
                        date: db.todos[index][2],
                        deleteTask: (ctx) => onDelete(index),
                        onChanged: (value) => onChanges(value, index))))
            : Container(
                alignment: Alignment.center,
                child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(children: [
                      Image.asset(
                        'assets/planet.png',
                        height: 200,
                        width: 200,
                      ),
                      const Text(
                        'NO  T A S K S',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white30,
                            fontWeight: FontWeight.w500),
                      ),
                    ]))));
  }
}
