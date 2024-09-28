import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/svg.dart';
import '../../button_function.dart';
import '../../providers/calc_screen_provider.dart';
import '../../providers/history_screen_provider.dart';
import 'home.dart';

class CalcButton extends StatelessWidget {
  const CalcButton({
    super.key,
    required this.myHeight,
    required this.myButtonSize,
    required this.screenWidth,
  });

  final double myHeight;
  final double myButtonSize;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    final screenProvider = context.watch<ScreenProvider>();
    final historyValue = context.watch<HistoryScreenProvider>();
    // String number =
    //     screenProvider.screenValue != '0' ? screenProvider.screenValue : '';


    return SizedBox(
      height: myHeight,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ///row1
                    // SymbolButton(
                    //     buttonSize: myButtonSize,
                    //     buttonColor: colorSymbolToColumn,
                    //     svgSize: 35,
                    //     svgLink: 'AC',
                    //     func: screenProvider.clearNumber,
                    //     value: ''),
                    GestureDetector(
                      onLongPress: () {
                        screenProvider.clearNumber('AC');
                        historyValue.clearHistoryValue();
                      },
                      onTap: () => screenProvider.clearSymbol('AC'),
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(myButtonSize),
                          color: colorSymbolToColumn,
                        ),
                        width: myButtonSize,
                        height: myButtonSize,
                        child: SvgPicture.asset(
                          'assets/img/AC.svg',
                          height: 35,
                          width: 35,
                        ),
                      ),
                    ),

                    ///row2
                    // SymbolButton(
                    //   buttonSize: myButtonSize,
                    //   buttonColor: colorSymbolToColumn,
                    //   svgSize: 40,
                    //   svgLink: 'plusminus',
                    //   func: screenProvider.addValue,
                    //   value: 'sqrt($number',
                    GestureDetector(
                      onLongPress: () => screenProvider.addValue('√'),
                      onTap: () {
                        screenProvider.addValue('^');
                      },
                      child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(myButtonSize),
                            color: colorSymbolToColumn,
                          ),
                          width: myButtonSize,
                          height: myButtonSize,
                          child:
                            SvgPicture.asset(
                            'assets/img/square_root.svg',
                            color: colorText,
                            height: 60,
                            width: 60,
                          )),
                    ),

                    ///row3
                    SymbolButton(
                        buttonSize: myButtonSize,
                        buttonColor: colorSymbolToColumn,
                        svgSize: 40,
                        svgLink: 'percent',
                        func: screenProvider.addValue,
                        value: '%'

                        ),

                    ///row4
                    SymbolButton(
                        buttonSize: myButtonSize,
                        buttonColor: colorSymbolToRow,
                        svgSize: 35,
                        svgLink: 'divide',
                        func: screenProvider.addValue,
                        value: '÷'),

                  ],
                ),
              ],
            ),
            // column2
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ///row1
                    NumberButton(
                      number: '7',
                      buttonSize: myButtonSize,
                    ),

                    ///row2
                    NumberButton(
                      number: '8',
                      buttonSize: myButtonSize,
                    ),

                    ///row3
                    NumberButton(
                      number: '9',
                      buttonSize: myButtonSize,
                    ),


                    ///row4
                    SymbolButton(
                        buttonSize: myButtonSize,
                        buttonColor: colorSymbolToRow,
                        svgSize: 35,
                        svgLink: 'x',
                        func: screenProvider.addValue,
                        value: '×'),

                  ],
                ),
              ],
            ),
            // column3
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ///row1
                    NumberButton(
                      number: '4',
                      buttonSize: myButtonSize,
                    ),


                    ///row2
                    NumberButton(
                      number: '5',
                      buttonSize: myButtonSize,
                    ),


                    ///row3
                    NumberButton(
                      number: '6',
                      buttonSize: myButtonSize,
                    ),


                    ///row4
                    SymbolButton(
                        buttonSize: myButtonSize,
                        buttonColor: colorSymbolToRow,
                        svgSize: 8,
                        svgLink: 'minus',
                        func: screenProvider.addValue,
                        value: '-'),

                  ],
                ),
              ],
            ),
            // column4
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ///row1
                    NumberButton(
                      number: '1',
                      buttonSize: myButtonSize,
                    ),


                    ///row2
                    NumberButton(
                      number: '2',
                      buttonSize: myButtonSize,
                    ),


                    ///row3
                    NumberButton(
                      number: '3',
                      buttonSize: myButtonSize,
                    ),


                    ///row4
                    SymbolButton(
                        buttonSize: myButtonSize,
                        buttonColor: colorSymbolToRow,
                        svgSize: 30,
                        svgLink: 'plus',
                        func: screenProvider.addValue,
                        value: '+'),

                  ],
                ),
              ],
            ),
            // column5
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ///row2
                    NumberButton.width(
                      number: '0',
                      buttonWidth: myButtonSize * 2 +
                          ((screenWidth - (myButtonSize * 4)) / 4),
                      buttonSize: myButtonSize,
                      alignment: Alignment.bottomLeft,
                      marginTextToLeft: 28,
                    ),


                    ///row3
                    NumberButton(
                      number: '.',
                      buttonSize: myButtonSize,
                    ),


                    ///row4
                    // SymbolButton(
                    //     buttonSize: myButtonSize,
                    //     buttonColor: colorSymbolToRow,
                    //     svgSize: 20,
                    //     svgLink: 'equals',
                    //     func: screenProvider.result,
                    //     value: screenProvider.screenValue),

                    GestureDetector(
                      onTap: () {
                        historyValue
                            .addHistoryValue(screenProvider.screenValue);
                        screenProvider.result(screenProvider.screenValue);
                        historyValue.addHistoryValue(
                            ' = ${screenProvider.screenValue}\n');
                      },
                      child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(myButtonSize),
                            color: colorSymbolToRow,
                          ),
                          width: myButtonSize,
                          height: myButtonSize,
                          child: SvgPicture.asset(
                            'assets/img/equals.svg',
                            height: 20,
                            width: 20,
                          )),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
