import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int count = 1;
  void increment() {
    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Center(
              child: Text(count.toString().padLeft(2, '0'),
                  style: const TextStyle(fontSize: 40, color: Colors.teal))),
          ElevatedButton(
            onPressed: increment,
            child: const Text('Add one'),
          )
        ],
      ),
    );
  }
}
