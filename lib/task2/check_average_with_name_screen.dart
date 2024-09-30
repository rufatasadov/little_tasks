import 'package:flutter/material.dart';
import 'package:little_tasks_app/my_consts.dart';
import 'package:little_tasks_app/widgets/exam_result_block.dart';

class CheckAvegareWithNameScreen extends StatefulWidget {
  const CheckAvegareWithNameScreen({super.key});

  @override
  State<CheckAvegareWithNameScreen> createState() =>
      _CheckAvegareWithNameScreenState();
}

class _CheckAvegareWithNameScreenState
    extends State<CheckAvegareWithNameScreen> {
  List<int> _points = [];
  int _averagePoint = 0;
  String _studentName = '';
  String _resultText = '';
  final int maxPointCount = 4;

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
    _textControllerName.clear();

    _points = [];
    _averagePoint = 0;
    _resultText = '';
    _studentName = '';
    setState(() {});
  }

  void getResult() {
    getAveragePoint(0);
    _studentName = _textControllerName.text;
    _resultText = 'Ad Soyad : $_studentName  \n';

    for (var e in _points) {
      _resultText += 'Netice $e \n';
    }
    _resultText += '______________ \n';
    _resultText += 'Ortalama: $_averagePoint';
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

  final TextEditingController _textControllerName = TextEditingController();
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
            getCalculateButton(),
            getClearButton(),
          ],
        ),
      ),
    );
  }

  ElevatedButton getCalculateButton() {
    return ElevatedButton(
      onPressed: _points.length == maxPointCount ? getResult : null,
      child: const Text(MyConsts.calculateButtonText),
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
        child: Column(
      children: [
        Text(
          _resultText,
          style: MyConsts.styleResult,
        ),
      ],
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
    return Column(
      children: [
        TextField(
          controller: _textControllerName,
          style: MyConsts.styleTextField,
          keyboardType: TextInputType.text,
          decoration:
              const InputDecoration(hintText: MyConsts.studentNameHintText),
        ),
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
