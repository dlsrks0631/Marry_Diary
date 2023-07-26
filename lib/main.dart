import 'package:flutter/material.dart';
import 'screens/home_screen.dart'; // HomeScreen을 불러옴

final ThemeData customTheme = ThemeData(
  fontFamily: 'Roboto',
  colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple)
      .copyWith(secondary: Colors.pink), // 원하는 폰트를 선택하십시오.
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marryiary',
      theme: customTheme,
      home: const HomeScreen(), // 앱의 첫 화면을 HomeScreen으로 지정
    );
  }
}
