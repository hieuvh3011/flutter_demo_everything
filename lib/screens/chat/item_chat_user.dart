import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:show_off/model/chat_user.dart';
import 'package:show_off/screens/home/item_user.dart';

class ItemChatUser extends StatelessWidget {
  final ChatUser item;
  final Function onPressed;

  ItemChatUser({
    @required this.item,
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      margin: EdgeInsets.symmetric(
        vertical: 10.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          10.0,
        ),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.grey[200]),
          overlayColor: MaterialStateProperty.all<Color>(Colors.grey[300]),
        ),
        child: Expanded(
          child: Row(
            children: [
              SizedBox(
                width: 10.0,
              ),
              Container(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 40,
                  height: 40,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: CachedNetworkImage(
                      imageUrl: item.avatarUrl,
                      placeholder: (context, url) => Image.asset(
                        placeholderImageUrl,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        flex: 3,
                        child: Text(
                          item.fullName,
                          style: TextStyle(color: Colors.black54),
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        child: Text(
                          item.email,
                          style:
                              TextStyle(fontSize: 12.0, color: Colors.black54),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
