import 'package:flutter/material.dart';

class ExamResultBlock {
  final Widget child;

  ExamResultBlock({required this.child});

  Widget get widget => Card(
        child: child,
      );
}
