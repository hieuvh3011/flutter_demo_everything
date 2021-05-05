import 'dart:async';

import 'package:flutter/material.dart';
import 'package:show_off/model/app_response_data_list.dart';
import 'package:show_off/model/chat_user.dart';
import 'package:show_off/model/message.dart';
import 'package:show_off/repository/network/network_dio.dart';
import 'package:show_off/repository/network/network_url.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatStore extends ChangeNotifier {
  List<Message> messages = [];
  List<ChatUser> friendList = [];
  DioNetwork _dioNetwork = DioNetwork.getInstance();
  IO.Socket socket = IO.io('https://chat-app-mongo.herokuapp.com');

  var friendListStream = Stream.value([]);

  Future<List<ChatUser>> getFriendList() async {
    List<ChatUser> result = [];
    var rawResponse = await _dioNetwork.callGetApi(NetworkUrl.userUrl);
    AppResponseDataList response =
        AppResponseDataList.fromJson(rawResponse?.data) ?? new AppResponseDataList();
    var rawList = response?.data;
    rawList.forEach((e) {
      ChatUser user = ChatUser.fromJson(e);
      result.add(user);
    });
    print('getFriendList result = $result');
    return result;
  }
}
