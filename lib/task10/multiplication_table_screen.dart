import 'package:flutter/material.dart';
import 'package:little_tasks_app/my_consts.dart';

class VurmaCedveliScreen extends StatefulWidget {
  const VurmaCedveliScreen({super.key});

  @override
  State<VurmaCedveliScreen> createState() => _VurmaCedveliScreenState();
}

class _VurmaCedveliScreenState extends State<VurmaCedveliScreen> {
  String _resultText = '';

  void calculate() {
    _resultText = '';
    for (int x = 1; x <= 9; x++) {
      for (int y = 1; y <= 9; y++) {
        _resultText += '${x}x$y=${x * y} ';
      }
      _resultText += '\n';
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(MyConsts.showTable),
      ),
      body: Padding(
        padding: MyConsts.mainPadding,
        child: Column(
          children: [
            ElevatedButton(
                onPressed: calculate, child: const Text(MyConsts.showTable)),
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
