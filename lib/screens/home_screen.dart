import 'package:flutter/material.dart';
import 'review_board.dart'; 

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Marry Diary'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.forum),
            label: '자유 게시판',
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            // 홈으로 이동하는 코드 작성
            // 여기에 홈으로 이동하는 코드를 작성하
          } else if (index == 1) {
            // 자유 게시판으로 이동하는 코드 작성
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      const ReviewBoardScreen(isSecretBoard: false)),
            );
          }
        },
      ),
    );
  }
}
