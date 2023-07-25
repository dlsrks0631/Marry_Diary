import 'package:flutter/material.dart';
import 'add_post_screen.dart'; // AddPostScreen 위젯을 불러옴

// 게시물 목록을 보여주는 ReviewBoardScreen 위젯
class ReviewBoardScreen extends StatelessWidget {
  final bool isSecretBoard; // isSecretBoard 변수 추가

  const ReviewBoardScreen({required this.isSecretBoard, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Review Board'),
      ),
      body: const Center(
        // 게시물 목록을 보여주는 UI
        child: Text('Your Review Board Content'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 게시물 추가 화면으로 이동하는 코드 작성
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddPostScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
      // 자유 게시판 바로가기 버튼
      persistentFooterButtons: [
        ElevatedButton(
          onPressed: () {
            // 자유 게시판으로 이동하는 코드 작성
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      const ReviewBoard(isSecretBoard: false)),
            );
          },
          child: const Text('자유 게시판 바로가기'),
        ),
      ],
    );
  }
}

// 커플 둘만 접근할 수 있는 비밀 게시판과 모든 사람이 볼 수 있는 자유 게시판을 표시하는 위젯
class ReviewBoard extends StatelessWidget {
  final bool isSecretBoard; // isSecretBoard 변수 추가

  const ReviewBoard({required this.isSecretBoard, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isSecretBoard ? '비밀 게시판' : '자유 게시판'),
      ),
      body: Center(
        child: Text(isSecretBoard ? '비밀 게시판 내용' : '자유 게시판 내용'),
      ),
    );
  }
}
