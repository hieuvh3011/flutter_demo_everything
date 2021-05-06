import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:show_off/model/chat_user.dart';
import 'package:show_off/route/app_route.dart';
import 'package:show_off/screens/chat/item_chat_user.dart';
import 'package:show_off/stores/chat_store/chat_store.dart';

class ListUserScreen extends StatefulWidget {
  @override
  _ListUserScreenState createState() => _ListUserScreenState();
}

class _ListUserScreenState extends State<ListUserScreen>
    with AutomaticKeepAliveClientMixin<ListUserScreen> {
  Future<List<ChatUser>> friendList;

  void _goToSearchScreen(BuildContext context) {
    Navigator.of(context).pushNamed(AppRoute.SEARCH_SCREEN);
  }

  @override
  void initState() {
    super.initState();
    // friendList = _chatStore.get;
  }

  onPressItemChat(ChatUser item) {
    print('item selected = ${item.toString()}');
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Consumer<ChatStore>(
      builder: (context, _chatStore, child) {
        friendList = _chatStore?.getFriendList();
        return Scaffold(
          body: FutureBuilder<List<ChatUser>>(
            future: friendList,
            builder:
                (BuildContext context, AsyncSnapshot<List<ChatUser>> snapshot) {
              print('snapshot = $snapshot');
              Widget children;
              if (!snapshot.hasData) {
                children = Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                children = Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                  child: RefreshIndicator(
                    onRefresh: () {
                      return _chatStore?.getFriendList();
                    },
                    child: ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          ChatUser item = snapshot.data[index];
                          return ItemChatUser(
                            item: item,
                            onPressed: () {
                              onPressItemChat(item);
                            },
                          );
                        }),
                  ),
                );
              }
              return children;
            },
          ),
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
      },
    );
  }

  @override
  void updateKeepAlive() {
  }

  @override
  bool get wantKeepAlive => true;
}
