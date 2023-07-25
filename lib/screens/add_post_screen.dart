import 'package:flutter/material.dart';
import 'package:multiple_images_picker/multiple_images_picker.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  _AddPostScreenState createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  List<Asset> _pickedImages = [];
  String _userText = '';

  // 사진 선택을 위한 메서드
  Future<void> _pickImages() async {
    List<Asset> pickedImages = [];
    try {
      pickedImages = await MultipleImagesPicker.pickImages(
        maxImages: 5, // 최대 선택 가능한 이미지 수 (여기서는 최대 5개)
        enableCamera: true, // 카메라 사용 여부
      );
    } on Exception catch (e) {
      // 에러 처리
      print('Error while picking images: $e');
    }

    if (!mounted) return;

    setState(() {
      _pickedImages = pickedImages;
    });
  }

  // 글 작성 폼을 업데이트하는 메서드
  void _updateUserText(String text) {
    setState(() {
      _userText = text;
    });
  }

  void _postButtonPressed() {
    if (_pickedImages.isEmpty || _userText.isEmpty) {
      // 이미지 또는 텍스트가 비어있는 경우 게시 처리하지 않음
      return;
    }

    final postInfo = {
      'images': _pickedImages,
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
      ),
      body: Center(
        // 게시물 추가 화면의 UI 구성
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 이미지 또는 'No Images Selected' 텍스트를 표시합니다.
              _pickedImages.isEmpty
                  ? const Text('No Images Selected')
                  : Column(
                      children: [
                        for (var asset in _pickedImages)
                          AssetThumb(
                            asset: asset,
                            width: 200,
                            height: 200,
                          ),
                      ],
                    ),
              ElevatedButton(
                onPressed: _pickImages,
                child: const Text('Select Images'),
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
      ),
    );
  }
}
