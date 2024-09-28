import 'package:flutter/material.dart';

import '../top_panel.dart';
import 'calcButton.dart';
import 'calcScreen.dart';
import 'historyScreen.dart';
import 'lineScreen.dart';

const colorNumber = const Color.fromRGBO(109, 109, 109, 1);
const colorSymbolToColumn = const Color.fromRGBO(174, 174, 174, 1);
const colorSymbolToRow = const Color.fromRGBO(255, 184, 0, 1);
const colorText = Color.fromRGBO(255, 255, 255, 1);
const colorBackground = const Color.fromRGBO(28, 28, 28, 1);


/* Домашняя страница */
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    /// 20% of screen Height
    // final cardHeight = screenHeight * 0.26;

    const double myButtonSize = 88;
    final myHeight =
        (myButtonSize * 5 + (((screenWidth - (myButtonSize * 4)) / 4) * 5));
    // const paddingButton = 0.5;
    // print('screenWidth $screenWidth');
    // print('cardHeight $cardHeight');
    // print(screenHeight - cardHeight);
    // print((myButtonSize * 5 + (((screenWidth - (myButtonSize * 4)) / 4) * 5)));

    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const TopPanel(),
          const HistoryScreen(),
          const CalcScreen(),

          /// Линия
          const LineScreen(),
          /// Клавиатура
          CalcButton(
              myHeight: myHeight,
              myButtonSize: myButtonSize,
              screenWidth: screenWidth)
        ],
      )),
      backgroundColor: const Color.fromRGBO(28, 28, 28, 1),
    );
  }
}
