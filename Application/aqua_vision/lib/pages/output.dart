import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DisplayOut extends StatelessWidget {
  const DisplayOut({super.key});

  @override
  Widget build(BuildContext context) {
    var data = ModalRoute.of(context)!.settings.arguments as Set;
    File _image = data.first;
    String _label = data.last['label'];
    print(_image.runtimeType);
    print(_label);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 640,
              height: 480,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.grey,
                image: DecorationImage(image: FileImage(_image)),
                border: Border.all(width: 8, color: Colors.black12),
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 300,
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.greenAccent[400],
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Text(
                  '$_label',
                  style: TextStyle(
                      color: Colors.white, letterSpacing: 2, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
