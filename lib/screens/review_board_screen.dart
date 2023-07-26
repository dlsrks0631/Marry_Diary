import 'package:flutter/material.dart';
import 'add_post_screen.dart';

class ReviewBoardScreen extends StatefulWidget {
  final bool isSecretBoard;

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
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
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
        onPressed: () {
          // 게시물 추가 화면으로 이동
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddPostScreen(),
            ),
          ).then((postInfo) {
            // AddPostScreen에서 게시물 추가를 완료한 후, 이전 화면으로 돌아올 때 실행될 콜백 함수
            if (postInfo != null) {
              // 게시물 정보가 전달된 경우
              _addPost(postInfo); // 게시물 추가
            }
          });
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
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
          final String imagePath = post['imagePath'];
          final String text = post['text'];

          return Card(
            margin: const EdgeInsets.all(30.0),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image on the left side with rounded corners and spacing
                  if (imagePath.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(right: 30.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.network(
                          imagePath,
                          width: 200, // Reduce image size to 100
                          height: 200, // Reduce image size to 100
                          fit:
                              BoxFit.fitWidth, // Adjust image size to fit width
                        ),
                      ),
                    ),
                  // Text on the right side
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: Text(
                        text,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
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
