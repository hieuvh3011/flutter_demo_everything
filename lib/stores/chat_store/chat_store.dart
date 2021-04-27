
import 'package:show_off/model/message.dart';
import 'package:show_off/model/user.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
class ChatStore{
  List<Message> messages = [];
  List<User> friendList = [];

  IO.Socket socket = IO.io('https://chat-app-mongo.herokuapp.com');

}