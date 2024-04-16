import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  bool? eligible;
  String message = '';

  void checkEligibility(int age) {
    if (age >= 18) {
      eligible = true;
      message = 'Congrats, You are eligible';
    } else {
      eligible = false;
      message = 'You are not eligible';
    }
    notifyListeners();
  }
}
