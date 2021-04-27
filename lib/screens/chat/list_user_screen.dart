import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:show_off/route/app_route.dart';
import 'package:show_off/stores/login_store/login_store.dart';

class ListUserScreen extends StatefulWidget {
  @override
  _ListUserScreenState createState() => _ListUserScreenState();
}

class _ListUserScreenState extends State<ListUserScreen> {
  void _goToSearchScreen(BuildContext context) {
    Navigator.of(context).pushNamed(AppRoute.SEARCH_SCREEN);
  }

  LoginStore _loginStore;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _loginStore = Provider.of<LoginStore>(context);

    return Scaffold(
      body: Observer(builder: (_) {
        print('list user = ${_loginStore?.currentUser?.contactList}');
        return Container();
      }),
      floatingActionButton: SizedBox(
        width: 100,
        height: 100,
        child: Center(
          child: Material(
            color: Colors.blue,
            shape: const CircleBorder(),
            clipBehavior: Clip.antiAlias,
            elevation: 4.0,
            child: InkWell(
              onTap: () {
                _goToSearchScreen(context);
              },
              child: Container(
                padding: const EdgeInsets.all(15.0),
                child: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
