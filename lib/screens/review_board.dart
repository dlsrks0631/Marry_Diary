import 'package:flutter/material.dart';
import 'add_post_screen.dart';

class ReviewBoardScreen extends StatefulWidget {
  final bool isSecretBoard; // isSecretBoard 변수 추가

  const ReviewBoardScreen({required this.isSecretBoard, Key? key})
      : super(key: key);

  @override
  _ReviewBoardScreenState createState() => _ReviewBoardScreenState();
}

class _ReviewBoardScreenState extends State<ReviewBoardScreen> {
  final List<Map<String, dynamic>> _posts = []; // 게시물을 담을 리스트

  // 게시물 추가 메서드
  void _addPost(Map<String, dynamic> postInfo) {
    setState(() {
      _posts.add(postInfo);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Review'),
        backgroundColor: Colors.white,
        titleTextStyle: const TextStyle(
            color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
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
      body: ReviewBoard(isSecretBoard: widget.isSecretBoard, posts: _posts),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Add async keyword
          // 게시물 추가 화면으로 이동
          final postInfo = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddPostScreen(),
            ),
          );

          // AddPostScreen에서 게시물 추가를 완료한 후, 이전 화면으로 돌아올 때 실행될 콜백 함수
          if (postInfo != null) {
            // 게시물 정보가 전달된 경우
            _addPost(postInfo); // 게시물 추가
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class ReviewBoard extends StatelessWidget {
  final bool isSecretBoard;
  final List<Map<String, dynamic>> posts; // 게시물 리스트

  const ReviewBoard({
    required this.isSecretBoard,
    required this.posts,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
          final String imagePath = post['imagePath'];
          final String text = post['text'];

          return Card(
            margin: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  imagePath.isEmpty
                      ? const SizedBox() // 이미지가 없는 경우 아무것도 표시하지 않음
                      : Image.network(
                          // 이미지가 있는 경우
                          imagePath,
                          width: 200,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                  const SizedBox(height: 10),
                  Text(
                    text,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
