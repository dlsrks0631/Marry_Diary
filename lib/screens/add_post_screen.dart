import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  _AddPostScreenState createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  File? _pickedImage;
  String _userText = '';
  double _rating = 0;

  // 사진 선택을 위한 메서드
  Future<void> _pickImage() async {
    final pickedImageFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedImageFile != null) {
      setState(() {
        _pickedImage = File(pickedImageFile.path);
      });
    }
  }

  // 글 작성 폼을 업데이트하는 메서드
  void _updateUserText(String text) {
    setState(() {
      _userText = text;
    });
  }

  // 게시 버튼을 눌렀을 때 호출되는 메서드
  void _postButtonPressed() {
    if (_pickedImage == null || _userText.isEmpty) {
      // 이미지 또는 텍스트가 비어있는 경우 게시 처리하지 않음
      return;
    }

    // TODO: 게시물 정보를 저장하는 코드 추가 (예시로 더미 데이터 사용)
    final postInfo = {
      'imagePath': _pickedImage!.path,
      'text': _userText,
    };

    // 이전 화면으로 돌아가면서 게시물 정보 전달
    Navigator.pop(context, postInfo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Post'),
        backgroundColor: Colors.black,
        toolbarTextStyle: Theme.of(context)
            .textTheme
            .copyWith(
              titleLarge: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            )
            .bodyMedium,
        titleTextStyle: Theme.of(context)
            .textTheme
            .copyWith(
              titleLarge: const TextStyle(
                color: Colors.white, // App bar title text color (black)
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            )
            .titleLarge,
      ),
      body: Container(
        color: const Color(0xFFFFFFFF), // Background color (#ffffff)
        child: Center(
          // 게시물 추가 화면의 UI 구성
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Add condition to display Container only when there is an image selected
              if (_pickedImage != null)
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(color: Colors.black, width: 2),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.network(
                      _pickedImage!.path,
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _pickImage,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  textStyle: const TextStyle(
                      color: Colors.red), // Button text color (black)
                ),
                child: const Text('Select Image'),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  onChanged: _updateUserText,
                  maxLines: 5,
                  style: const TextStyle(
                      color: Colors.black, fontSize: 16), // Text style
                  decoration: InputDecoration(
                    hintText: 'Write your post here...',
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12), // Padding inside the TextField
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10), // Rounded border
                      borderSide:
                          const BorderSide(color: Colors.black), // Border color
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          color: Colors
                              .black), // Border color when the TextField is focused
                    ),
                    filled: true,
                    fillColor:
                        Colors.white, // Background color of the TextField
                  ),
                ),
              ),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                  ),
                  const Icon(
                    Icons.add_location,
                    color: Colors.black, // Icon color (blue)
                    size: 30, // Icon size
                  ),
                  const SizedBox(
                      width: 8), // Add some spacing between the icon and text
                  TextButton(
                    onPressed: () {
                      // 위치 추가 버튼 시 실행할 동작
                      print("위치 생성");
                    },
                    child: const Text(
                      "위치 추가",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black, // Text color (blue)
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                  ),
                  const Icon(
                    Icons.tag,
                    color: Colors.black, // Icon color (blue)
                    size: 30, // Icon size
                  ),
                  const SizedBox(width: 8.0),
                  TextButton(
                    onPressed: () {
                      print("태그 생성");
                    },
                    child: const Text(
                      "태그 추가",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black, // Text color (blue)
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              // 별점 입력 부분 추가
              RatingBar.builder(
                initialRating: _rating,
                minRating: 0,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.favorite, // Use heart-shaped icon here
                  color: Colors
                      .yellow, // You can change the heart color as desired
                ),
                onRatingUpdate: (rating) {
                  setState(() {
                    _rating = rating;
                  });
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _postButtonPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.black, // Button background color (black)
                  textStyle: const TextStyle(
                      color: Colors.white), // Button text color (white)
                ),
                child: const Text('Post'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
