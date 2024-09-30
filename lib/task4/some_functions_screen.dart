import 'package:flutter/material.dart';

import 'package:little_tasks_app/my_consts.dart';
import 'package:little_tasks_app/widgets/exam_result_block.dart';

class SomeFunctionsScreen extends StatefulWidget {
  const SomeFunctionsScreen({super.key});

  @override
  State<SomeFunctionsScreen> createState() => _SomeFunctionsScreenState();
}

class _SomeFunctionsScreenState extends State<SomeFunctionsScreen> {
  List<int> _points = [];
  String _resultText = '';
  final int maxPointCount = 1;

  void addPoint(int? value) {
    if (value == null) return;

    if (_points.length < maxPointCount) {
      _points.add(value);
    } else {}
  }

  void onPressAddButton() {
    addPoint(int.tryParse(_textControllerPoint.text));
    _textControllerPoint.clear();
    setState(() {});
  }

  void resetData() {
    _textControllerPoint.clear();
    _points = [];
    _resultText = '';
    setState(() {});
  }

  void getResult(TaskType task) {
    _resultText = switch (task) {
      TaskType.factorial => _resultText = getFactorial(_points[0]).toString(),
      TaskType.downLoop => _resultText = getDownLoop(_points[0]).toString(),
      TaskType.oddSum => _resultText = getOddSum(0, 100).toString(),
    };
    setState(() {});
  }

  String getDownLoop(int value) {
    String res = '';
    int i = value;
    while (i > 0) {
      res += '$i,';
      i--;
    }
    return res;
  }

  int getFactorial(int value) {
    int res = 1;
    int i = 0;
    while (i <= value) {
      i++;
      res = res * i;
    }
    return res;
  }

  int getOddSum(int low, int high) {
    int res = 0;

    while (low <= high) {
      if (low % 2 != 0) {
        res = res + low;
      }
      low++;
    }
    return res;
  }

  final TextEditingController _textControllerPoint = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          MyConsts.task2AppText,
          maxLines: 3,
        ),
      ),
      body: Padding(
        padding: MyConsts.mainPadding,
        child: Column(
          children: [
            getInputPointLine(),
            getDataView(),
            getResultLine(),
            getCalculateButton(TaskType.factorial),
            getCalculateButton(TaskType.downLoop),
            getCalculateButton(TaskType.oddSum),
            getClearButton(),
          ],
        ),
      ),
    );
  }

  ElevatedButton getCalculateButton(TaskType task) {
    return ElevatedButton(
      onPressed: _points.length == maxPointCount
          ? () {
              getResult(task);
            }
          : null,
      child: Text(task.name),
    );
  }

  ElevatedButton getClearButton() {
    return ElevatedButton(
      onPressed: resetData,
      child: const Text(MyConsts.clearButtonText),
    );
  }

  Widget getResultLine() {
    return ExamResultBlock(
        child: Wrap(children: [
      Text(
        _resultText,
        style: MyConsts.styleResult,
        overflow: TextOverflow.ellipsis,
        maxLines: 10,
        softWrap: false,
      ),
    ])).widget;
  }

  Widget getDataView() {
    return Expanded(
      child: ListView.builder(
          itemCount: _points.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('Nəticə : ${_points[index].toString()}'),
            );
          }),
    );
  }

  Widget getInputPointLine() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: TextField(
                controller: _textControllerPoint,
                style: MyConsts.styleTextField,
                keyboardType: TextInputType.number,
                decoration:
                    const InputDecoration(hintText: MyConsts.pointHintText),
              ),
            ),
            ElevatedButton(
              onPressed:
                  _points.length < maxPointCount ? onPressAddButton : null,
              child: const Text(MyConsts.addButtonText),
            ),
          ],
        ),
      ],
    );
  }
}

enum TaskType { factorial, downLoop, oddSum }
