import 'package:flutter/material.dart';
import 'package:little_tasks_app/my_consts.dart';

class MiniLoginScreen extends StatefulWidget {
  const MiniLoginScreen({super.key});

  @override
  State<MiniLoginScreen> createState() => _MiniLoginScreenState();
}

class _MiniLoginScreenState extends State<MiniLoginScreen> {
  final username = 'admin';
  final password = '123456';

  final TextEditingController _textControllerUserName = TextEditingController();
  final TextEditingController _textControllerPassword = TextEditingController();

  String _resultText = '';

  void login() {
    final isLoginSuccess = _textControllerUserName.text == username &&
        _textControllerPassword.text == password;

    // switch exp method
    _resultText = switch (isLoginSuccess) {
      true => MyConsts.loginSuccess,
      false => MyConsts.loginFailed,
    };

// ternary op method
    _resultText = isLoginSuccess ? MyConsts.loginSuccess : MyConsts.loginFailed;

// if-else method
    if (isLoginSuccess) {
      _resultText = MyConsts.loginSuccess;
    } else {
      _resultText = MyConsts.loginFailed;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(MyConsts.miniLoginTitle),
      ),
      body: Padding(
        padding: MyConsts.mainPadding,
        child: Column(
          children: [
            TextField(
              decoration:
                  const InputDecoration(hintText: MyConsts.usernameHintText),
              controller: _textControllerUserName,
            ),
            TextField(
              decoration:
                  const InputDecoration(hintText: MyConsts.passwordHintText),
              controller: _textControllerPassword,
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: login, child: const Text(MyConsts.logintext)),
            Card(
              child: Text(_resultText),
            ),
          ],
        ),
      ),
    );
  }
}
