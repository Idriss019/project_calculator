import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeDayProvider extends ChangeNotifier {
  bool themeDay = false;

  ThemeDayProvider() {
    getTheme();
  }

  void setThemeDay(bool iconDay) {
    if (iconDay == true && themeDay == true) {
      themeDay = false;
      saveTheme(false);
    } else if (iconDay == false && themeDay == false) {
      themeDay = true;
      saveTheme(true);
    }
    notifyListeners();
  }

  Future<void> saveTheme(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('themeDay', value);
  }

  Future<void> getTheme() async {
    final prefs = await SharedPreferences.getInstance();

    if (prefs.containsKey('themeDay')) {
      themeDay = prefs.getBool('themeDay') ?? false;
      notifyListeners();
    }
  }
}
