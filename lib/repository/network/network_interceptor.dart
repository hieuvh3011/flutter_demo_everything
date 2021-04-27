import 'package:dio/dio.dart';

class NetworkInterceptor extends Interceptor {
  @override
  Future onRequest(RequestOptions options) {
    Map<String, dynamic> requestOptions = {
      "data": options.data,
      "url": options.path,
      "queryParams": options.queryParameters,
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
    print('onError = ${err.toString()}');
    return super.onError(err);
  }
}
