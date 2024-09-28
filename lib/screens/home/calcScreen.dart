import 'package:flutter/material.dart';
import 'package:project_calculator/providers/calc_screen_provider.dart';
import 'package:provider/provider.dart';
import 'home.dart';

/// Экран калькулятора
class CalcScreen extends StatefulWidget {
  const CalcScreen({super.key});

  @override
  State<CalcScreen> createState() => _CalcScreenState();
}

class _CalcScreenState extends State<CalcScreen> {
  @override
  Widget build(BuildContext context) {

    final screenProvider = context.watch<ScreenProvider>();

    return Container(
      margin: const EdgeInsets.only(right: 25),

      /// Размещение элементов в пространстве
      child: Container(
        width: double.infinity,
        child: Align(
          alignment: Alignment.bottomRight,
          child: FittedBox(
            child: Text(
              screenProvider.screenValue,
              style: const TextStyle(
                color: colorText,
                fontSize: 72,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
