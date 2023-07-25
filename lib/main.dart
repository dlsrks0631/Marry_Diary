import 'package:flutter/material.dart';
import 'screens/home_screen.dart'; // HomeScreen을 불러옴

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marryiary',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: const HomeScreen(), // 앱의 첫 화면을 HomeScreen으로 지정
    );
  }
}
