import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/history_screen_provider.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({
    super.key,
  });

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    final historyProvider = context.watch<HistoryScreenProvider>();
    return Expanded(
        child: SingleChildScrollView(
          reverse: true,
      child: Container(
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            historyProvider.historyValue,
            style: const TextStyle(fontSize: 20,
            color: Color.fromRGBO(255, 255, 255, 0.6)),
            
            //  overflow: TextOverflow.visible,
          ),
        ),
      ),
    ));
  }
}
