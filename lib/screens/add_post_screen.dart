import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  _AddPostScreenState createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  File? _pickedImage;
  String _userText = '';

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

    // TODO: 게시물 정보를 저장하고, 필요한 처리를 수행하는 코드 추가

    // 이전 화면으로 돌아가기
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Post'),
      ),
      body: Center(
        // 게시물 추가 화면의 UI 구성
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _pickedImage == null
                ? const Text('No Image Selected') // 이미지가 선택되지 않은 경우
                : Image.file(
                    // 이미지가 선택된 경우
                    _pickedImage!,
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
            ElevatedButton(
              onPressed: _pickImage,
              child: const Text('Select Image'),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                onChanged: _updateUserText,
                maxLines: 5,
                decoration: const InputDecoration(
                  hintText: 'Write your post here...',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: _postButtonPressed,
              child: const Text('Post'),
            ),
          ],
        ),
      ),
    );
  }
}
