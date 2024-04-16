// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/pages/about.dart';
import 'package:todo/pages/counter.dart';
import 'package:todo/pages/home.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('todo');
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.amber,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    home: const MyApp(),
    routes: {
      'home': (context) => Todo(),
      'about': (context) => About(),
      'count': (context) => Counter(),
    },
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Todo();
  }
}
