import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePicker extends StatefulWidget {
  const ImagePicker({super.key});

  @override
  State<ImagePicker> createState() => _ImagePickerState();
}

class _ImagePickerState extends State<ImagePicker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.cyan[800],
            onPressed: () {},
            child: Icon(Icons.add_photo_alternate_sharp),
            heroTag: 'her1',
          ),
          SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            backgroundColor: Colors.cyan[800],
            onPressed: () {},
            child: Icon(Icons.camera_outlined),
            heroTag: 'her2',
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Aqua Vision'),
        backgroundColor: Colors.cyan[800],
      ),
    );
  }
}
