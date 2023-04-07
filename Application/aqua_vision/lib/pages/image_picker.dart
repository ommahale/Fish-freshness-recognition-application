import 'dart:io';

import 'package:aqua_vision/API/api_post.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageDisplay extends StatefulWidget {
  const ImageDisplay({super.key});

  @override
  State<ImageDisplay> createState() => _ImageDisplayState();
}

class _ImageDisplayState extends State<ImageDisplay> {
  File? imageFile;
  late Map output;
  bool isimage = false;
  Future<void> getImage({required ImageSource source}) async {
    final file = await ImagePicker().pickImage(source: source);
    if (file?.path != null) {
      final Classifier c = Classifier();
      setState(() {
        imageFile = File(file!.path);
        isimage = true;
      });
      output = await c.getData(imageFile!, imageFile!.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fish Freshness Detector"),
        centerTitle: true,
        backgroundColor: Colors.cyan[700],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12.0, 90, 12, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (imageFile != null)
                  Container(
                    width: 640,
                    height: 480,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      image: DecorationImage(image: FileImage(imageFile!)),
                      border: Border.all(width: 8, color: Colors.black12),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  )
                else
                  Container(
                    width: 640,
                    height: 480,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      border: Border.all(width: 8, color: Colors.black12),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: const Text(
                      'Please select/capture the image',
                      style: TextStyle(fontSize: 26),
                    ),
                  ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                          onPressed: () => getImage(source: ImageSource.camera),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.cyan[700],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Text('Capture Image',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white)),
                          )),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: ElevatedButton(
                          onPressed: () =>
                              getImage(source: ImageSource.gallery),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.cyan[700],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Text('Select Image',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white)),
                          )),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                if (isimage)
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/output',
                            arguments: {'file': imageFile, 'output': output});
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Show result',
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(Icons.arrow_circle_right)
                        ],
                      ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
