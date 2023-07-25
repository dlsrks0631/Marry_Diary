import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // 로그인 처리를 수행하고 홈 화면으로 이동하는 코드를 여기에 작성
          },
          child: const Text('Login'),
        ),
      ),
    );
  }
}
