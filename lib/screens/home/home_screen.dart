import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:show_off/apis/network.dart';
import 'package:show_off/model/user.dart';
import 'package:show_off/screens/home/item_user.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> userList = List<User>();

  getData() {
    Network.fetchData().then((response) {
      setState(() {
        Iterable list = json.decode(response);
        userList = list.map((model) => User.fromJson(model)).toList();
        print(userList.length);
      });
    }).catchError((onError) {
      print('getData error = ' + onError.toString());
      _showDialogError(onError.toString());
    });
  }

  Future<void> _showDialogError(String error) async {
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

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        centerTitle: true,
      ),
      body: userList.isNotEmpty
          ? Container(
              child: RefreshIndicator(
                onRefresh: () {
                  return Future.delayed(Duration(seconds: 2), getData());
                },
                child: ListView.builder(
                    itemCount: userList?.length,
                    itemBuilder: (BuildContext context, int index) {
                      String id = userList[index]?.id;
                      String name = userList[index]?.name;
                      String avatarUrl = userList[index]?.avatarUrl;
                      String address = userList[index]?.address;
                      return ItemUser(id, name, avatarUrl, address, () {});
                    }),
              ))
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
