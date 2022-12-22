import 'dart:ui';

import 'package:aqua_vision/pages/imagePicker.dart';
import 'package:aqua_vision/pages/output.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primaryColor: Colors.cyan[700]),
    home: const MyApp(),
    routes: {
      '/home': (context) => const MyApp(),
      '/image': (context) => ImageDisplay(),
      '/output': (context) => DisplayOut()
    },
  ));
}

//This will be the home page
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/bg.png'), fit: BoxFit.cover)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('assets/fish.png'),
                height: 180,
              ),
              SizedBox(
                height: 50,
                width: 190,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.cyan[900])),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/image');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Test My Fish',
                        style: TextStyle(fontSize: 25),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.arrow_circle_right)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
