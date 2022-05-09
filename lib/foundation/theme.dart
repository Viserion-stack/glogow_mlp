import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyAppTheme {
  static ThemeData myThemes(bool isDark, BuildContext context) {
    return ThemeData(
      primaryColor: isDark ? Colors.black : Colors.white,
      iconTheme: isDark
          ? IconThemeData(color: Colors.purple.shade200, opacity: 0.8)
          : const IconThemeData(color: Colors.red, opacity: 0.8),
      brightness: isDark ? Brightness.dark : Brightness.light,
      appBarTheme: AppBarTheme(
          backgroundColor:
              isDark ? const Color(0xFF181818) : Colors.deepPurple),
      colorScheme: isDark
          ? const ColorScheme.dark(onSecondary: Colors.white)
          : const ColorScheme.light(onSecondary: Colors.white),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.deepPurpleAccent),
      scaffoldBackgroundColor: isDark ? Colors.grey.shade900 : Colors.white,
    );
  }
}

class ThemeNotifier with ChangeNotifier {
  late bool _isDark;
  bool get isDark => _isDark;
  ThemeNotifier() {
    _isDark = false;
    _loadFromPrefs();
    notifyListeners();
  }

  toogleTheme(bool value) {
    _isDark = value;
    notifyListeners();
    _saveToPrefs();
  }

  _loadFromPrefs() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _isDark = preferences.getBool('theme') ?? false;
    notifyListeners();
    return _isDark;
  }

  _saveToPrefs() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool('theme', _isDark);
  }
}
