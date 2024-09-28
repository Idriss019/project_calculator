import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project_calculator/providers/history_screen_provider.dart';
import 'package:project_calculator/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import 'hive/data_sum_to_column.dart';
import 'providers/calc_screen_provider.dart';
import 'providers/database_provider.dart';
// import 'providers/sum_to_column_provider.dart';
import 'screens/home/home.dart';

// цвет циферблата rgb(109, 109, 109);
// цвет символов в строку rgb(174, 174, 174);
// цвет символов столбик rgb(255, 184, 0);
// цвет  самих символов rgb(255, 255, 255);
// цвет задней панели rgb(28, 28, 28);

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(CalcDataHive());
  /* Фиксирование экрана в вертикальном режиме */
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const ProjectCalculator());
  });
}

class ProjectCalculator extends StatelessWidget {
  const ProjectCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeDayProvider()),
        ChangeNotifierProvider(create: (context) => ScreenProvider()),
        ChangeNotifierProvider(create: (context) => HistoryScreenProvider()),
        // ChangeNotifierProvider(
        //     create: (context) => SumToColumnScreenProvider()),
        ChangeNotifierProvider(create: (context) => DatabaseProvider()),
        // ChangeNotifierProxyProvider<ScreenProvider, HistoryScreenProvider>(
        //     create: (context) => HistoryScreenProvider(),
        //     update: (_, model, function)
        //         // =>
        //         //     HistoryScreenProvider(model.screenValue),                    DatabaseProvider
        //         {
        //       function?.addhistoryValue('${model.screenValue}');
        //       return function!;
        //     }),
      ],
      child: const MaterialApp(
        /// Удаляет ленту с угла
        debugShowCheckedModeBanner: false,

        home: const HomeScreen(),
      ),
    );
  }
}
