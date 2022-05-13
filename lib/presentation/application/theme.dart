import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyAppTheme {
  static ThemeData myThemes(bool isDark, BuildContext context) {
    return isDark
        ? ThemeData.dark()
        : ThemeData(
            primaryColor: Colors.white,
            appBarTheme: AppBarTheme(
                color: Colors.white,
                toolbarTextStyle: Theme.of(context)
                    .textTheme
                    .apply(
                      bodyColor: Colors.black,
                      displayColor: Colors.black,
                    )
                    .bodyText2,
                titleTextStyle: Theme.of(context)
                    .textTheme
                    .apply(
                      bodyColor: Colors.black,
                      displayColor: Colors.black,
                    )
                    .headline6,
                iconTheme: IconThemeData(
                  color: Colors.black,
                )),
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
