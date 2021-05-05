import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:show_off/model/app_response.dart';

class NetworkInterceptor extends Interceptor {
  @override
  Future onRequest(RequestOptions options) {
    Map<String, dynamic> requestOptions = {
      "data": options.data,
      "url": options.path,
      "queryParams": options.queryParameters,
      "headers": options.headers
    };
    print('onRequest = ${requestOptions.toString()}');
    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) {
    print('onResponse = ${response.toString()}');
    return super.onResponse(response);
  }

  @override
  Future onError(DioError err) {
    // AppResponse appResponse = AppResponse.fromJson(err?.response ?? {});
    print('onError = ${err?.response}');
    Response response = err?.response ?? new Response();
    if (response?.statusCode == 403){
      print("onError response = ${response?.data['message']}");
    }
    debugPrintStack();
    AppResponse appResponse = new AppResponse();
    appResponse.message = response?.statusMessage;

    return super.onError(err);
  }
}
