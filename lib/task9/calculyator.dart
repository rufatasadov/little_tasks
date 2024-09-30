import 'package:flutter/material.dart';
import 'package:little_tasks_app/my_consts.dart';

class CalculyatorScreen extends StatefulWidget {
  const CalculyatorScreen({super.key});

  @override
  State<CalculyatorScreen> createState() => _CalculyatorScreenState();
}

class _CalculyatorScreenState extends State<CalculyatorScreen> {
  final TextEditingController _textControllerNumber1 = TextEditingController();
  final TextEditingController _textControllerNumber2 = TextEditingController();

  String _resultText = '';
  CalcOperator? _currentOP;

  void calculatePress() {
    int firstNum = int.parse(_textControllerNumber1.text);
    int secondNum = int.parse(_textControllerNumber2.text);
    calculateMethod2(firstNum, secondNum, _currentOP);
  }

  void calculate(int a, int b, CalcOperator? op) {
    if (op == null) return;

    final res = switch (op) {
      CalcOperator.add => a + b,
      CalcOperator.minus => a - b,
      CalcOperator.divide => a / b,
      CalcOperator.multiply => a * b,
    };

    _resultText = res.toString();

    setState(() {});
  }

  void calculateMethod2(int a, int b, CalcOperator? op) {
    double? res;
    if (op == null) return;
    switch (op) {
      case CalcOperator.add:
        res = (a + b).toDouble();
      case CalcOperator.minus:
        res = (a - b).toDouble();
      case CalcOperator.divide:
        res = (a / b).toDouble();
      case CalcOperator.multiply:
        res = (a * b).toDouble();

      default:
        null;
    }

    _resultText = res.toString();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(MyConsts.calculatorTitle),
      ),
      body: Padding(
        padding: MyConsts.mainPadding,
        child: Column(
          children: [
            TextField(
              controller: _textControllerNumber1,
            ),
            TextField(
              controller: _textControllerNumber2,
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                ...[
                  CalcOperator.add,
                  CalcOperator.minus,
                  CalcOperator.multiply,
                  CalcOperator.divide,
                ].map((op) {
                  return ElevatedButton(
                      onPressed: () {
                        _currentOP = op;
                        calculatePress();
                      },
                      child: Text(op.name));
                }),
              ],
            ),
            Card(
              child: Text(
                _resultText,
                style: MyConsts.styleResult,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum CalcOperator {
  add,
  minus,
  divide,
  multiply,
}
