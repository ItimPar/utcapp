
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Images extends StatefulWidget {
  const Images({Key? key}) : super(key: key);

  @override
  State<Images> createState() => _ImagesState();
}

class _ImagesState extends State<Images> {
  var file;

  Future<void> openCamera() async {
    var picker = ImagePicker();
    var photo = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      file = File(photo!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Images'),
      ),
      body: Center(
        child: file == null ? Text('not photo') : Image.file(file),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          openCamera();
        },
        child: Icon(Icons.camera),
        backgroundColor: Colors.deepOrangeAccent,
      ),
    );
  }
}
