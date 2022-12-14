import 'dart:html';

import 'package:http/http.dart' as http;

class Classifier {
  File? image;
  late Map output;

  Classifier({this.image});
  Future<void> getData() async {
    try {
      var request = http.MultipartRequest(
          'POST', Uri.parse('http://localhost:8000/upload'));
    } catch (e) {
      output = {'error': e, 'label': 'Unable to connect'};
    }
  }
}
