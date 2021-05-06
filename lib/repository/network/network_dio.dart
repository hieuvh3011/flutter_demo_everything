import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:show_off/repository/network/network_interceptor.dart';

class DioNetwork {
  String url;
  Map<String, dynamic> params;
  static Dio dio;
  static DioNetwork _instance;

  static getInstance() {
    if (_instance == null) {
      initDio();
      _instance = new DioNetwork();
    }
    return _instance;
  }

  static initDio() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String accessToken = preferences.getString('access_token') ?? "";
    var options = BaseOptions(
      baseUrl: 'https://chat-app-mongo.herokuapp.com/',
      connectTimeout: 30000,
      receiveTimeout: 10000,
      contentType: 'application/x-www-form-urlencoded',
      headers: {
        "accept": "*/*",
        "Authorization": "Bearer $accessToken",
      },
    );
    dio = new Dio(options);
    NetworkInterceptor _interceptor = NetworkInterceptor();
    dio.interceptors.add(_interceptor);
  }

  callApi(String url, Map<String, dynamic> params, String method) async {
    await initDio();

    if (method == 'GET') {
      return await dio.get(url, queryParameters: params);
    }
    return await dio.request(url,
        data: params, options: Options(method: method));
  }

  callGetApi(String url, [Map<String, dynamic> params]) async {
    return await callApi(url, params, 'GET');
  }

  callPostApi(String url, Map<String, dynamic> params) async {
    await initDio();
    return await dio.post(url, data: params);
  }

  callPutApi(String url, Map<String, dynamic> params) async {
    return await callApi(url, params, 'PUT');
  }

  callDeleteApi(String url, Map<String, dynamic> params) async {
    return await callApi(url, params, 'DELETE');
  }

  handleTokenExpired() async {}
}
