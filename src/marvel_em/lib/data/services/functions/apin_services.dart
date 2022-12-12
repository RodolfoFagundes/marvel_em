import 'package:dio/dio.dart';

class ApiServices {
  static Future<Response<dynamic>> get(String url) async =>
      await Dio().get(url);
}
