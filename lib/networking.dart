import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper {
  final String url;
  NetworkHelper(this.url);

  Future<dynamic> getData() async {
    try {
      http.Response response = await http.get(Uri.parse(url));
      //Response has statusCode and body
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return data;
      } else {
        print('API request failed');
        throw Exception('API request failed');
      }
    } catch (e) {
      print('API request failed');
      throw Exception(e);
    }
  }

  Future<dynamic> postData({Map<String, dynamic>? body}) async {
    try {
      final http.Response response = await http.post(
        Uri.parse(url),
        body: body,
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        print('API request failed');
        throw Exception('API request failed');
      }
    } catch (e) {
      print('API request failed');
      throw Exception(e);
    }
  }
}
