import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:show_off/model/user.dart';
import 'package:show_off/repository/database/local_database.dart';
import 'package:show_off/repository/network/network.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  @observable
  int page = 0;

  @observable
  int limit = 10;

  @observable
  ObservableList<User> listUsers;

  LocalDatabase localDatabase = LocalDatabase();

  @action
  Future<List<User>> getListUser([BuildContext context]) async {
    List<User> result = List<User>();
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
    return result;
  }

  @action
  Future<void> saveListUserToLocalDatabase(List<User> listUsers) async {
    if (await localDatabase.isTableUserEmpty()){
      await localDatabase.insertListUser(listUsers);
    }
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
