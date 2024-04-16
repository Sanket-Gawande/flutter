import 'package:cart/pages/cart.dart';
import 'package:cart/pages/home.dart';
import 'package:cart/pages/onboarding.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(fontFamily: "Roboto"),
    routes: {
      '/shop': (context) => Home(),
      '/cart': (context) => Cart(),
      '/onboarding': (context) => Onboarding()
    },
    home: const CartApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class CartApp extends StatelessWidget {
  const CartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: const Onboarding(),
    );
  }
}
