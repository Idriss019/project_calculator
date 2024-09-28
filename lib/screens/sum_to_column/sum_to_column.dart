import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project_calculator/providers/database_provider.dart';
import 'package:provider/provider.dart';

class SumToColumn extends StatefulWidget {
  const SumToColumn({super.key});

  @override
  State<SumToColumn> createState() => SumToColumnState();
}

class SumToColumnState extends State<SumToColumn> {
  int counter = 0;
  void sumSetState() => setState(() {});
  @override
  Widget build(BuildContext context) {
    final boxData = context.watch<DatabaseProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Суммирование в столбик"),
      ),
      body: FutureBuilder(
        future: context.read<DatabaseProvider>().openCalcDataBox(),
        builder: (context, snapshot) {
          final box = context.watch<DatabaseProvider>().box;
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CupertinoActivityIndicator());
          }
          return ValueListenableBuilder(
              valueListenable: box.listenable(),
              builder: (context, __, ___) {
                return Column(children: [
                  Expanded(
                    child: ListView.builder(
                      /* количество итерации */
                      itemCount: box.length + 1,
                      itemBuilder: (BuildContext context, int index) {
                        return ColumnSum(counter: index);
                      },
                    ),
                  ),

                  /* Панель результата */
                  Row(
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Text('= ${boxData.resultData()}',
                              style: const TextStyle(
                                fontSize: 56,
                              )),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            boxData.deleteAllCalc();
                            setState(() {});
                          },
                          icon: const Icon(Icons.restart_alt))
                    ],
                  )
                ]);
              });
        },
      ),
    );
    // );
  }
}

// ignore: must_be_immutable
class ColumnSum extends StatefulWidget {
  int counter;
  ColumnSum({super.key, required this.counter}) {
    counter++;
  }

  @override
  State<ColumnSum> createState() => _ColumnSumState();
}

class _ColumnSumState extends State<ColumnSum> {
  final controller = TextEditingController();

  bool createList = false;
  @override
  void initState() {
    super.initState();
    final boxq = context.read<DatabaseProvider>().box;

    controller.text = (boxq.get(widget.counter)?.number ?? '').toString();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        controller: controller,
        /* ONCHANGED  */
        onChanged: (value) {
          if (value == '') {
            context.read<DatabaseProvider>().deleteCalc(widget.counter);
          } else if (value != '') {
            context
                .read<DatabaseProvider>()
                .saveCalc(widget.counter, double.parse(value));
          }
        },
        autofocus: widget.counter == 1 ? true : false,

        textAlign: TextAlign.right,
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          prefixText: '  ${widget.counter}.         +',
        ),
      ),
    );
  }
}
