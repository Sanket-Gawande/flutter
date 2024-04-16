import 'package:flutter/material.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        centerTitle: true,
        title: const Text('Setting', style: TextStyle(color: Colors.white)),
      ),
      body: const Center(
        child: Text("Setting"),
      ),
    );
  }
}
