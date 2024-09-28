import 'package:flutter/material.dart';
import 'home.dart';

/// линия под экраном
class LineScreen extends StatelessWidget {
  const LineScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1,
      width: double.infinity,
      child: Container(color: colorText),
    );
  }
}