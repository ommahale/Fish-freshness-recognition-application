import 'package:aqua_vision/pages/image_picker.dart';
import 'package:aqua_vision/pages/output.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Future.delayed(const Duration(seconds: 1));
  FlutterNativeSplash.remove();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.dark(),
    initialRoute: '/image',
    routes: {
      '/image': (context) => const ImageDisplay(),
      '/output': (context) => const DisplayOut()
    },
  ));
}

//This will be the home page
