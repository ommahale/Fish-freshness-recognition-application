import 'dart:io';
// import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';

class Classifier {
  //Using http

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
      Response data = await http.Response.fromStream(res);
      print(data.body);
      return {'label': 'connected'};
    } catch (e) {
      return {'error': e, 'label': '$e'};
    }
  }

  //Using dio

//   Future<Map> getData(File image) async {
//     try {
//       Dio dio = Dio();
//       var formData = FormData();
//       formData.files
//           .add(MapEntry('image', await MultipartFile.fromFile(image.path)));
//       var respose = await dio.post('http://127.0.0.1:8000', data: image);
//       print(respose.data.toString());
//       return respose.data;
//     } catch (e) {
//       return {'label': '$e'};
//     }
//   }
}
