import 'package:flutter/material.dart';
import 'package:theme/util/theme.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeData theme = lightMode;

  void toggleTheme() {
    if (theme == lightMode) {
      theme = darkMode;
    } else {
      theme = lightMode;
    }
    notifyListeners();
  }
}
