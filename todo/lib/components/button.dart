import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class IncButton extends StatefulWidget {
  const IncButton({super.key});

  @override
  State<IncButton> createState() => _IncButtonState();
}

class _IncButtonState extends State<IncButton> {
  int count = 0;

  void onTap() {
    setState(() {
      count++;
    });
  }

  TextEditingController nameController = TextEditingController();
  String message = '';

  void onGreet() {
    setState(() {
      message = 'Hello there, ${nameController.text}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(children: [
        TextField(
          controller: nameController,
          decoration: const InputDecoration(border: OutlineInputBorder()),
        ),
        ElevatedButton(onPressed: onGreet, child: const Text('Greet')),
        Text(message)
      ]),
    );
    // return ElevatedButton(
    //     onPressed: onTap,
    //     child: Text(
    //       '$count',
    //       style: const TextStyle(
    //         fontSize: 24,
    //         fontWeight: FontWeight.bold,
    //       ),
    //     ));
  }
}
