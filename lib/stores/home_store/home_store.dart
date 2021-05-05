import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:show_off/model/user.dart';
import 'package:show_off/repository/database/local_database.dart';
import 'package:show_off/repository/network/network.dart';

class HomeStore extends ChangeNotifier{
  int page = 0;

  int limit = 10;

  List<User> listUsers;

  LocalDatabase localDatabase = LocalDatabase();

  Future<List<User>> getListUser([BuildContext context]) async {
    List<User> result = [];
    try{
      if (await localDatabase.isTableUserEmpty()){
        var response = await Network.fetchingMockData();
        Iterable list = json.decode(response);
        result = list.map((model) => User.fromJson(model)).toList();
        await localDatabase.insertListUser(result);
      }else{
        result = await localDatabase.getListUser();
      }
    }catch(exception){
      // print('getListUser exception = '+exception.toString());
      // debugPrintStack();
      // _showDialogError(context, exception.toString());
    }
    // notifyListeners();
    return result;
  }

  Future<void> saveListUserToLocalDatabase(List<User> listUsers) async {
    if (await localDatabase.isTableUserEmpty()){
      await localDatabase.insertListUser(listUsers);
    }
    notifyListeners();
  }

  Future<void> _showDialogError(BuildContext context, String error) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(error),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}