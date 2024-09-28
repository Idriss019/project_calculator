import 'package:flutter/material.dart';
import 'package:function_tree/function_tree.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenProvider extends ChangeNotifier {
  String screenValue = '0';
  bool newNumber = true;

  ScreenProvider() {
    getScreenValue();
  }

  /* Добавление символа */
  Future<void> addValue(value) async {
    final prefs = await SharedPreferences.getInstance();

    if (screenValue != '0' && newNumber == false) {
      screenValue += value;
      notifyListeners();
      prefs.setString('screenValue', screenValue);
    } else {
      screenValue = value;
      newNumber = false;
      notifyListeners();
      prefs.setString('screenValue', screenValue);
    }
  }

  String result(value) {
    Map decoderSymbol = {'√': 'sqrt(', '÷': '/', '×': '*'};

    // String decoderString = value.replaceAll('√', 'sqrt(');

    String decoderFuntion(str) {
      String newStr = str;
      for (var e in decoderSymbol.entries) {
        newStr = newStr.replaceAll(e.key, e.value);
      }
      return newStr;
    }

    String decoderValue = decoderFuntion(value);
    if (decoderValue.contains("%")) {
      if (decoderValue.contains("+")) {
        List<String> listValue = decoderValue.split("+");
        int numberFirst = int.parse(listValue[0]);
        int numberPercent =
            int.parse(listValue[1].substring(0, listValue[1].length - 1));
        screenValue =
            (numberFirst + (numberFirst * numberPercent / 100)).toString();
      } else if (decoderValue.contains("-")) {
        List<String> listValue = decoderValue.split("-");
        int numberFirst = int.parse(listValue[0]);
        int numberPercent =
            int.parse(listValue[1].substring(0, listValue[1].length - 1));
        screenValue =
            (numberFirst - (numberFirst * numberPercent / 100)).toString();
      } else if (decoderValue.contains("*")) {
        List<String> listValue = decoderValue.split("*");
        int numberFirst = int.parse(listValue[0]);
        int numberPercent =
            int.parse(listValue[1].substring(0, listValue[1].length - 1));
        screenValue = (numberFirst * (numberPercent / 100)).toString();
      } else if (decoderValue.contains("/")) {
        List<String> listValue = decoderValue.split("/");
        int numberFirst = int.parse(listValue[0]);
        int numberPercent =
            int.parse(listValue[1].substring(0, listValue[1].length - 1));
        screenValue = (numberFirst / (numberPercent / 100)).toString();
      }
    } else {
      if (decoderValue.length > 5 && decoderValue.substring(0, 4) == 'sqrt') {
        decoderValue += ')';
      }
      String result = ('$decoderValue'.interpret()).toString();

      if (result.substring(result.length - 2) == '.0') {
        screenValue = result.substring(0, result.length - 2);
      } else {
        screenValue = result;
      }
    }
    notifyListeners();
    
    Future<void> saveDate(String value) async {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('screenValue', value);
    }

    saveDate(screenValue);
    // newNumber = true;
    return screenValue;

  }

  /* Полное обнуление */
  Future<void> clearNumber(value) async {
    final prefs = await SharedPreferences.getInstance();
    screenValue = '0';
    notifyListeners();
    prefs.setString('screenValue', screenValue);
  }

  /* Удаление одного символа */
  Future<void> clearSymbol(value) async {
    final prefs = await SharedPreferences.getInstance();
    if (screenValue.length > 1 && screenValue != '0') {
      screenValue = screenValue.substring(0, screenValue.length - 1);
      notifyListeners();
      prefs.setString('screenValue', screenValue);
    } else {
      prefs.setString('screenValue', screenValue);
      screenValue = '0';
      notifyListeners();
      prefs.setString('screenValue', screenValue);
    }
  }

  /* Загрузка данных */
  Future<void> getScreenValue() async {
    final prefs = await SharedPreferences.getInstance();

    if (prefs.containsKey('screenValue')) {
      screenValue = prefs.getString('screenValue') ?? '0';
      notifyListeners();
    }
  }
}
