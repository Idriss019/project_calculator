import 'package:flutter/material.dart';
import 'package:project_calculator/providers/theme_provider.dart';
import 'package:project_calculator/screens/sum_to_column/sum_to_column.dart';
import 'package:provider/provider.dart';

class TopPanel extends StatefulWidget {
  const TopPanel({super.key});

  @override
  State<TopPanel> createState() => _TopPanelState();
}

class _TopPanelState extends State<TopPanel> {
  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeDayProvider>();
    return Container(
        margin: const EdgeInsets.only(right: 10, left: 10, bottom: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  theme.setThemeDay(theme.themeDay);
                },
                icon: theme.themeDay == false
                    ? const Icon(Icons.wb_sunny_outlined)
                    : const Icon(Icons.mode_night_outlined)),
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                          builder: (BuildContext context) => SumToColumn(),
                      )
                  );
                },
                icon: const Icon(Icons.table_rows_outlined))
          ],
        ));
  }
}
