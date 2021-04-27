import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:show_off/model/user.dart';
import 'package:show_off/screens/home/item_user.dart';
import 'package:show_off/stores/home_store/home_store.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeStore _homeStore;
  var listUsers;

  @override
  Widget build(BuildContext context) {
    _homeStore = Provider.of<HomeStore>(context);
    // listUsers = _homeStore.getListUser(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<User>>(
        future: listUsers,
        builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
          Widget children;
          if (!snapshot.hasData) {
            children = Center(
              child: CircularProgressIndicator(),
            );
          } else {
            children = Container(
              // child: RefreshIndicator(
              //   onRefresh: () {
              //     return Future.delayed(Duration(seconds: 2));
              //   },
                // child: ListView.builder(
                //   itemCount: snapshot?.data?.length,
                //   itemBuilder: (BuildContext context, int index) {
                //     int id = snapshot?.data[index]?.id;
                //     String name = snapshot?.data[index]?.name;
                //     String avatarUrl = snapshot?.data[index]?.avatarUrl;
                //     String address = snapshot?.data[index]?.address;
                //     return ItemUser(id, name, avatarUrl, address, () {});
                //   },
                // ),
              // ),
            );
          }
          return children;
        },
      ),
    );
  }
}
