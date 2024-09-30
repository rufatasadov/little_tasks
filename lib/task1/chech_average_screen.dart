import 'package:flutter/material.dart';
import 'package:little_tasks_app/my_consts.dart';
import 'package:little_tasks_app/widgets/exam_result_block.dart';

class CheckAvegareScreen extends StatefulWidget {
  const CheckAvegareScreen({super.key});

  @override
  State<CheckAvegareScreen> createState() => _CheckAvegareScreenState();
}

class _CheckAvegareScreenState extends State<CheckAvegareScreen> {
  List<int> _points = [];
  int _averagePoint = 0;
  String _resultText = '';
  final int maxPointCount = 3;

  void addPoint(int? value) {
    if (value == null) return;

    if (_points.length < maxPointCount) {
      _points.add(value);
    } else {}
  }

  void onPressAddButton() {
    addPoint(int.tryParse(_textController.text));
    _textController.clear();
    setState(() {});
  }

  void resetData() {
    _textController.clear();

    _points = [];
    _averagePoint = 0;
    _resultText = '';
    setState(() {});
  }

  void getResult() {
    const checkValue = 45;
    final isPass = getAveragePoint(checkValue);
    _resultText = isPass ? 'Yes' : 'No';
    getAveragePoint(0);

    for (var e in _points) {
      _resultText += 'Netice $e \n';
    }
    _resultText += '______________ \n';
    _resultText +=
        'Ortalama: $_averagePoint, passed : ${isPass ? 'Yes' : 'No'} ';
  }

  bool getAveragePoint(int checkValue) {
    int sum = 0;
    for (var e in _points) {
      sum += e;
    }

    _averagePoint = _points.isEmpty ? 0 : sum ~/ (_points.length);

    setState(() {});
    return _averagePoint >= checkValue;
  }

  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          MyConsts.task1AppText,
        ),
      ),
      body: Padding(
        padding: MyConsts.mainPadding,
        child: Column(
          children: [
            getInputPointLine(),
            getDataView(),
            getResultLine(),
            ElevatedButton(
              onPressed: _points.length == maxPointCount ? getResult : null,
              child: const Text(MyConsts.calculateButtonText),
            ),
            getFooterLine(),
          ],
        ),
      ),
    );
  }

  ElevatedButton getFooterLine() {
    return ElevatedButton(
      onPressed: resetData,
      child: const Text(MyConsts.clearButtonText),
    );
  }

  Widget getResultLine() {
    return ExamResultBlock(
        child: Text(
      _resultText,
      style: MyConsts.styleResult,
    )).widget;
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: TextField(
            controller: _textController,
            style: MyConsts.styleResult,
            keyboardType: TextInputType.number,
          ),
        ),
        ElevatedButton(
          onPressed: _points.length < maxPointCount ? onPressAddButton : null,
          child: const Text(MyConsts.addButtonText),
        ),
      ],
    );
  }
}
