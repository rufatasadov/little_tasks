import 'package:flutter/material.dart';
import 'package:little_tasks_app/task1/chech_average_screen.dart';
import 'package:little_tasks_app/task10/multiplication_table_screen.dart';
import 'package:little_tasks_app/task2/check_average_with_name_screen.dart';
import 'package:little_tasks_app/task3/check_average_with_name_result_screen.dart';
import 'package:little_tasks_app/task4/some_functions_screen.dart';
import 'package:little_tasks_app/task7/mini_login_screen.dart';
import 'package:little_tasks_app/task8/user_role_screen.dart';
import 'package:little_tasks_app/task9/calculyator.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final List<Map<String, dynamic>> _pageList = [
    {'name': 'task1', 'page': const CheckAvegareScreen()},
    {'name': 'task2', 'page': const CheckAvegareWithNameScreen()},
    {'name': 'task3', 'page': const CheckAvegareWithNameResultScreen()},
    {'name': 'task4-5-6', 'page': const SomeFunctionsScreen()},
    {'name': 'task7 - mini login', 'page': const MiniLoginScreen()},
    {'name': 'task8 - user roles', 'page': const UserRoleScreen()},
    {'name': 'task9 - calculyator', 'page': const CalculyatorScreen()},
    {'name': 'task10 - show Table', 'page': const VurmaCedveliScreen()}
  ];

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        navigatorKey: navigatorKey,
        home: Scaffold(
          appBar: AppBar(),
          body: Center(
            child: Column(
              children: [
                ..._pageList.map((page) => ElevatedButton(
                    onPressed: () {
                      navigatorKey.currentState?.push(MaterialPageRoute(
                          builder: (context) => page['page']));
                    },
                    child: Text(page['name'])))
              ],
            ),
          ),
        ));
  }
}
