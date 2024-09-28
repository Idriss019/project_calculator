import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:project_calculator/hive/data_sum_to_column.dart';

class DatabaseProvider extends ChangeNotifier {
  late Box<CalcData> box;
  int resultList = 0;


  /* Открыть базу */
  Future<void> openCalcDataBox() async {
    box = await Hive.openBox<CalcData>('calcData');
  }

  /* Сохранить данные */
  Future<void> saveCalc(int key, double number) async {
    box.put(key, CalcData(number));
  }

  /* Обновить данные */
  Future<void> updateCalc(int index, double number) async {

    box.putAt(index, CalcData(number));
  }

  /* Удаление данных */
  Future<void> deleteCalc(key) async {
    box.delete(key);
  }

  /* Удаление всех данных */
  Future<void> deleteAllCalc() async {
    box.clear();
  }


  /* Результат данных */
  dynamic resultData() {
    Future<void> resultBox() async {
      box = await Hive.openBox<CalcData>('calcData');
    }

    resultBox();
    double result = 0;
    for (var i in box.values) {
      result += i.number;
    }
    if (result % 1 != 0) {
      return result;
    } else {
      return result.toInt();
    }
  }

  @override
  void dispose() {
    box.close();
    super.dispose();
  }
}
