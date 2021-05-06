class AppResponseDataList {
  int status;
  String message;
  List<dynamic> data;

  AppResponseDataList({
    this.status = -1,
    this.message = "",
    this.data,
  });

  AppResponseDataList.fromJson(Map<String, dynamic> jsonObject)
      : status = jsonObject['status'],
        message = jsonObject['message'],
        data = jsonObject['data'];

  @override
  String toString() {
    return "AppResponseDataList: status = $status, message = $message, data = $data";
  }
}
