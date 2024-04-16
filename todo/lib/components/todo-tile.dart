import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  final String task;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  void Function(BuildContext) deleteTask;
  final String? date;

  TodoTile(
      {super.key,
      required this.task,
      required this.taskCompleted,
      this.date,
      required this.onChanged,
      required this.deleteTask});
  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.only(top: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: const Color.fromRGBO(40, 42, 58, 1),
        ),
        child: Slidable(
          startActionPane: ActionPane(motion: const StretchMotion(), children: [
            SlidableAction(
              onPressed: (completed) => onChanged!(!taskCompleted),
              icon: Icons.check_circle,
              backgroundColor: Colors.green,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8), bottomLeft: Radius.circular(8)),
            )
          ]),
          endActionPane: ActionPane(motion: const StretchMotion(), children: [
            SlidableAction(
                onPressed: deleteTask,
                icon: Icons.delete,
                backgroundColor: Colors.red.shade300,
                borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(8),
                    topRight: Radius.circular(8)))
          ]),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Checkbox(
                  value: taskCompleted,
                  onChanged: onChanged,
                  checkColor: Colors.white,
                ),
                GestureDetector(
                    onTap: () => onChanged!(!taskCompleted),
                    child: Text(task,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            decorationColor: Colors.white,
                            decoration: taskCompleted
                                ? TextDecoration.lineThrough
                                : TextDecoration.none))),
                Expanded(
                    child: Text(
                  date!,
                  textAlign: TextAlign.right,
                  style: const TextStyle(color: Colors.white54, fontSize: 12),
                ))
              ],
            ),
          ),
        ),
      );
}
