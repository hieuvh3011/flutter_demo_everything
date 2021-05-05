import 'dart:convert';

class AppResponse {
  int status;
  String message;
  Map<String, dynamic> data;

  AppResponse({
    this.status = -1,
    this.message = "",
    this.data,
  });

  AppResponse.fromJson(Map<String, dynamic> jsonObject)
      : status = jsonObject['status'],
        message = jsonObject['message'],
        data = jsonObject['data'];

  @override
  String toString() {
    // TODO: implement toString
    return "AppResponse: status = $status, message = $message, data = $data";
  }
}
