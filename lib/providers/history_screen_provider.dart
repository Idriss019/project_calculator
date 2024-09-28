import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoryScreenProvider extends ChangeNotifier {
  String historyValue = '';

  HistoryScreenProvider() {
    getHistoryValue();
  }
  
  Future<void> addHistoryValue(String value) async {
    final prefs = await SharedPreferences.getInstance();
    historyValue += value;
    notifyListeners();
    prefs.setString('historyValue', historyValue);
  }



  /* Очистка истории */
  Future<void> clearHistoryValue() async {
    final prefs = await SharedPreferences.getInstance();
    historyValue = '';
    notifyListeners();
    prefs.setString('historyValue', historyValue);
  }


  /* Загрузка данных */
  Future<void> getHistoryValue() async {
    final prefs = await SharedPreferences.getInstance();

    if (prefs.containsKey('historyValue')) {
      historyValue = prefs.getString('historyValue') ?? '0';
      notifyListeners();
    }
  }
}
