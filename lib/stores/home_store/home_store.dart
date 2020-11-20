import 'dart:convert';

import 'package:flutter/cupertino.dart';
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
  Future<List<User>> getListUser() async {
    List<User> result = List<User>();
    try{
      if (await localDatabase.isTableUserEmpty()){
        var response = await Network.fetchData();
        Iterable list = json.decode(response);
        result = list.map((model) => User.fromJson(model)).toList();
        await localDatabase.insertListUser(result);
      }else{
        result = await localDatabase.getListUser();
      }
    }catch(exception){
      print('getListUser exception = '+exception.toString());
      debugPrintStack();
    }
    return result;
  }

  @action
  Future<void> saveListUserToLocalDatabase(List<User> listUsers) async {
    if (await localDatabase.isTableUserEmpty()){
      await localDatabase.insertListUser(listUsers);
    }
  }
}
