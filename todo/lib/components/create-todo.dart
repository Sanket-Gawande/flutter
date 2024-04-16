import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class CreateTodo extends StatelessWidget {
  Function(String) onCreate;
  CreateTodo({super.key, required this.onCreate});
  TextEditingController todo = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        contentPadding: EdgeInsets.zero,
        content: Container(
          height: 200,
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(color: Color.fromRGBO(40, 42, 58, 1)),
          child: Column(
            children: [
              TextField(
                style: const TextStyle(color: Colors.white),
                controller: todo,
                cursorColor: Colors.white,
                decoration: const InputDecoration(
                  hintText: "Add task..",
                  hintStyle: TextStyle(color: Colors.white60),
                  border: OutlineInputBorder(),
                ),
              ),
              const Spacer(
                flex: 1,
              ),
              MaterialButton(
                  minWidth: 250,
                  padding: const EdgeInsets.only(top: 15, bottom: 15),
                  color: Colors.deepPurple,
                  onPressed: () => onCreate(todo.text),
                  child: const Text(
                    'Add',
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          ),
        ));
  }
}
