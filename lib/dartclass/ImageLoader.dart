import 'package:flutter/material.dart';
import 'package:petfitproject/dartclass/ImageFromGalleryEx.dart';

enum ImageSourceType { gallery, camera }

class ImageLoader extends StatelessWidget {
  const ImageLoader({Key? key}) : super(key: key);

  void _handleURLButtonPress(BuildContext context, var type) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ImageFromGalleryEx(type)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Pet Image "),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MaterialButton(
            color: Colors.blue,
            child: const Text(
              "Pick Image from Gallery",
              style:
                  TextStyle(color: Colors.white70, fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              _handleURLButtonPress(context, ImageSourceType.gallery);
            },
          ),
          MaterialButton(
            color: Colors.blue,
            child: const Text(
              "Pick Image from Camera",
              style:
                  TextStyle(color: Colors.white70, fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              _handleURLButtonPress(context, ImageSourceType.camera);
            },
          ),
        ],
      ),
    );
  }
}
