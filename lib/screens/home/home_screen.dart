import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:show_off/repository/network/network.dart';
import 'package:show_off/model/user.dart';
import 'package:show_off/screens/home/item_user.dart';
import 'package:show_off/stores/home_store/home_store.dart';

class HomeScreen extends StatefulWidget {
  // Future<void> _showDialogError(String error) async {
  //   return showDialog<void>(
  //     context: context,
  //     barrierDismissible: false, // user must tap button!
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text('Error'),
  //         content: SingleChildScrollView(
  //           child: ListBody(
  //             children: <Widget>[
  //               Text(error),
  //             ],
  //           ),
  //         ),
  //         actions: <Widget>[
  //           TextButton(
  //             child: Text('OK'),
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    HomeStore _homeStore = Provider.of<HomeStore>(context);
    var listUsers = _homeStore.getListUser();
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<User>>(
        future: listUsers,
        builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot){
          Widget children;
          if (!snapshot.hasData){
            children = Center(
              child: CircularProgressIndicator(),
            );
          }else{
            children = Container(
              child: RefreshIndicator(
                onRefresh: () {
                  return Future.delayed(Duration(seconds: 2));
                },
                child: ListView.builder(
                  itemCount: snapshot?.data?.length,
                  itemBuilder: (BuildContext context, int index) {
                    int id = snapshot?.data[index]?.id;
                    String name = snapshot?.data[index]?.name;
                    String avatarUrl = snapshot?.data[index]?.avatarUrl;
                    String address = snapshot?.data[index]?.address;
                    return ItemUser(id, name, avatarUrl, address, () {});
                  },
                ),
              ),
            );
          }
          return children;
        },
      )
    );
  }
}
