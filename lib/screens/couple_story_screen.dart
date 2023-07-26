import 'package:flutter/material.dart';

class CoupleStory extends StatelessWidget {
  const CoupleStory({Key? key, this.isSecretBoard = false}) : super(key: key);

  final bool isSecretBoard;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title:
            const Text('Couple Story', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: IconButton(
              icon: const Icon(Icons.close), // X 아이콘
              iconSize: 25,
              onPressed: () {
                Navigator.pop(context); // 현재 화면을 닫고 이전 화면으로 돌아간다.
              },
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: const Center(
        child: Text(
          'Your Couple Story Content Goes Here',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
