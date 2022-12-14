import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';

class Classifier {
  Future<dynamic> getData(File image, String filename) async {
    try {
      Map<String, String> header = {'Content-type': 'multipart/form-data'};
      var request = http.MultipartRequest(
          'POST', Uri.parse('http://localhost:8000/upload'));
      request.files.add(http.MultipartFile(
        'image',
        image.readAsBytes().asStream(),
        image.lengthSync(),
        filename: filename,
        contentType: MediaType('image', 'jpeg'),
      ));
      request.headers.addAll(header);
      StreamedResponse res = await request.send();
      print(http.Response.fromStream(res));
      Map<dynamic, dynamic> output =
          jsonDecode(http.Response.fromStream(res).toString());
      return output;
    } catch (e) {
      return {'error': e, 'label': 'Unable to connect'};
    }
  }
}
