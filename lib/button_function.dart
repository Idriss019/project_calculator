import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'providers/calc_screen_provider.dart';
import 'screens/home/home.dart';

const double numberFontSize = 58;

/// Кнопка нумерации
class NumberButton extends StatelessWidget {
  final String number;
  final double buttonSize;
  final double buttonWidth;
  final Alignment alignment;
  final double marginTextToLeft;

  const NumberButton({
    super.key,
    required this.number,
    required this.buttonSize,
    this.alignment = Alignment.center,
    this.marginTextToLeft = 0,
  }) : buttonWidth = buttonSize;

  const NumberButton.width({
    super.key,
    required this.number,
    required this.buttonSize,
    required this.buttonWidth,
    this.alignment = Alignment.center,
    this.marginTextToLeft = 0,
  });

  @override
  Widget build(BuildContext context) {
    final screenProvider = context.read<ScreenProvider>();

    return GestureDetector(
      onTap: () {
        screenProvider.addValue(number);

      },
      child: Container(
        alignment: alignment,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(buttonSize),
          color: colorNumber,
        ),
        width: buttonWidth,
        height: buttonSize,
        child: Container(
          margin: EdgeInsets.only(left: marginTextToLeft),
          child: Text(number,
              style: const TextStyle(
                color: colorText,
                fontSize: numberFontSize,
              )),
        ),
      ),
    );
  }
}

/// Кнопка символов
class SymbolButton extends StatelessWidget {
  const SymbolButton({
    super.key,
    required this.buttonSize,
    required this.buttonColor,
    required this.svgSize,
    required this.svgLink,
    required this.func,
    required this.value,
  });
  final Color buttonColor;
  final double buttonSize;
  final double svgSize;
  final String svgLink;
  final Function func;
  final String value;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        func(value);
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(buttonSize),
          color: buttonColor,
        ),
        width: buttonSize,
        height: buttonSize,
        child: SvgPicture.asset(
          'assets/img/$svgLink.svg',
          height: svgSize,
          width: svgSize,
        ),
      ),
    );
  }
}
