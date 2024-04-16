import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black87,
          title: const Text('About', style: TextStyle(color: Colors.white)),
        ),
        body: Expanded(
          child: Container(
            width: double.maxFinite,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text("About Page"),
                  TextButton(
                      onPressed: () {
                        context.push('/setting');
                      },
                      child: const Text("Go to settings"))
                ]),
          ),
        ));
  }
}
