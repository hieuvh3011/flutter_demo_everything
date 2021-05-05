import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Network {
  Network();
  static const String MOCK_API_URL = 'https://5f84114b6b97440016f4ef99.mockapi.io/api/v1/users';

  static Future fetchingMockData([int page, int limit]) async {
    var response;
    if (page == null && limit == null) {
      response = await http.get(MOCK_API_URL);
    } else {
      Map<String, dynamic> params = {
        'page': page, 'limit': limit
      };
      response = await http.get(MOCK_API_URL, headers: params);
    }
    if (response.statusCode != 200) {
      print('response error = ' + response.body);
    }
    print('response = ' + response.body);
    return response.body;
  }
}
