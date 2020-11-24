import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Network {
  Network();
  static String url = 'https://5f84114b6b97440016f4ef99.mockapi.io/api/v1/users';

  static Future fetchData([int page, int limit]) async {
    var response;
    if (page == null && limit == null) {
      response = await http.get(url);
    } else {
      Map<String, dynamic> params = {
        'page': page, 'limit': limit
      };
      response = await http.get(url, headers: params);
    }
    if (response.statusCode != 200) {
      print('response error = ' + response.body);
    }
    print('response = ' + response.body);
    return response.body;
  }
}
