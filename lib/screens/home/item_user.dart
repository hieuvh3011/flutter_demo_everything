import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:show_off/model/user.dart';

Map<String, dynamic> fakeItem = {
  "id": '1',
  "name": "Ayla Hudson",
  "avatar_url":
      "https://s3.amazonaws.com/uifaces/faces/twitter/terpimost/128.jpg",
  "address": "Suite 234"
};

String placeholderImageUrl = 'lib/res/images/unnamed.png';

class ItemUser extends StatelessWidget {
  final int id;
  final String name;
  final String avatarUrl;
  final String address;
  final Function onPress;

  ItemUser(this.id, this.name, this.avatarUrl, this.address, this.onPress);

  final double itemHeight = 65.0;

  // final User _user = User.fromJson(fakeItem);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      key: Key('item $id'),
      onPressed: onPress,
      color: Colors.white,
      child: Container(
        alignment: Alignment.center,
        height: itemHeight + 20,
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.blueGrey, width: 0.6),
          ),
        ),
        child: Row(
          children: [
            Container(
              width: itemHeight,
              height: itemHeight,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(itemHeight / 2),
                child: CachedNetworkImage(
                  imageUrl: avatarUrl,
                  placeholder: (context, url) =>
                      Image.asset(placeholderImageUrl),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 10.0),
                child: Column(children: [
                  Expanded(
                    child: Container(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        this.name,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    flex: 3,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 0.6,
                    decoration: BoxDecoration(color: Colors.black45),
                  ),
                  Expanded(
                    child: Container(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        this.address,
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                    flex: 2,
                  ),
                ]),
              ),
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
