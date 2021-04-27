import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:show_off/repository/network/network_interceptor.dart';

class DioNetwork {
  String url;
  Map<String, dynamic> params;
  static Dio dio;
  static DioNetwork _instance;

  static DioNetwork getInstance() {
    if (_instance == null) {
      _instance = new DioNetwork();
      initDio();
    }
    return _instance;
  }

  static void initDio() {
    var options = BaseOptions(
      baseUrl: 'https://chat-app-mongo.herokuapp.com/',
      connectTimeout: 30000,
      receiveTimeout: 10000,
      contentType: 'application/x-www-form-urlencoded',
    );
    dio = new Dio(options);
    NetworkInterceptor _interceptor = NetworkInterceptor();
    dio.interceptors.add(_interceptor);
  }

  callApi(String url, Map<String, dynamic> params, String method) async {
    if (dio == null) {
      initDio();
    }

    if (method == 'GET') {
      return await dio.get(url, queryParameters: params);
    }
    return await dio.request(url,
        data: params, options: Options(method: method));
  }

  callGetApi(String url, Map<String, dynamic> params) async {
    return await callApi(url, params, 'GET');
  }

  callPostApi(String url, Map<String, dynamic> params) async {
    if (dio == null) {
      initDio();
    }
    return await dio.post(url, data: params);
  }

  callPutApi(String url, Map<String, dynamic> params) async {
    return await callApi(url, params, 'PUT');
  }

  callDeleteApi(String url, Map<String, dynamic> params) async {
    return await callApi(url, params, 'DELETE');
  }
}
