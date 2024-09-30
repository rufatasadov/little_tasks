import 'package:flutter/material.dart';
import 'package:little_tasks_app/my_consts.dart';

class UserRoleScreen extends StatefulWidget {
  const UserRoleScreen({super.key});

  @override
  State<UserRoleScreen> createState() => _UserRoleScreenState();
}

class _UserRoleScreenState extends State<UserRoleScreen> {
  final TextEditingController _textControllerUserName = TextEditingController();

  String _resultText = '';

  void checkRole() {
    final enteredRole = _textControllerUserName.text;
    // switch exp method
    _resultText = switch (enteredRole) {
      'AA' => 'Admin selahiyyetine sahibsiniz',
      'MM' => 'Moderator selahiyyetine sahibsiniz',
      'MH' => 'Muhasib selahiyyetine sahibsiniz',
      'UU' => 'Standart Istifadeci selahiyyetine sahibsiniz',
      '' => 'empty role name',
      _ => 'Daxil edilen selahiyyet dogru deyil'
    };

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(MyConsts.userRolesTitle),
      ),
      body: Padding(
        padding: MyConsts.mainPadding,
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(hintText: 'role short name'),
              controller: _textControllerUserName,
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: checkRole, child: const Text(MyConsts.checkRole)),
            Card(
              child: Text(_resultText),
            ),
          ],
        ),
      ),
    );
  }
}
