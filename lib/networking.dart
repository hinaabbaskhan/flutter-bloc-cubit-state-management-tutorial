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

  Future<dynamic> postData() async {}
}
