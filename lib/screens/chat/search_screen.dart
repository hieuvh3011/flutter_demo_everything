import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:show_off/model/user.dart';
import 'package:show_off/screens/home/item_user.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<User> result = [];
  String email;
  TextEditingController _searchController;
  // FireStoreIntegration _fireStoreIntegration;

  @override
  void initState() {
    super.initState();
    setState(() {
      email = "email";
    });
    _searchController = TextEditingController();
    // _fireStoreIntegration = FireStoreIntegration();
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  void _onPressSearch() async {
    String searchString = _searchController.value.text;
    // _fireStoreIntegration.getUserByEmail(searchString).then();
    await FirebaseFirestore.instance
        .collection('user')
        .where("email", isEqualTo: searchString)
        .get()
        .then((value) => {
              value.docs.map((e) => {print("e = $e")})
            })
        .catchError((error) => {print("error _onPressSearch = $error")});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Searching"),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          child: Column(
            children: [
              _buildSearchTextBox(context),
              _buildResultSearch(context, email)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchTextBox(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      alignment: Alignment.center,
      width: width,
      decoration: BoxDecoration(
        border: Border.all(
          width: 0.6,
          color: Colors.black54,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: GestureDetector(
              onTap: () {
                _onPressSearch();
              },
              child: Icon(
                Icons.search,
                color: Colors.black54,
              ),
            ),
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "search by user email",
                border: InputBorder.none,
                hintStyle: TextStyle(color: Colors.grey[400]),
              ),
              keyboardType: TextInputType.emailAddress,
              controller: _searchController,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildResultSearch(BuildContext context, String email) {
    // if (result.toString() == [].toString()) {
    //   return _buildResultEmpty(context, email);
    // }
    return Expanded(
      child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: ListView(
            children: [_buildItemResult(context)],
          )),
    );
  }

  // Widget _buildResultEmpty(BuildContext context, String email) {
  //   return Expanded(
  //     child: Container(
  //       alignment: Alignment.center,
  //       child: Text("Cannot find any result with $email"),
  //     ),
  //   );
  // }

  Widget _buildItemResult(BuildContext context) {
    User item = User(
        id: 1,
        name: "Vu Huy Hieu",
        avatarUrl: "",
        email: "hieu.vh301195@gmail.com");
    return Container(
      height: 50.0,
      margin: EdgeInsets.symmetric(
        vertical: 10.0,
      ),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(
          10.0,
        ),
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
                      child: Text(item.name),
                    ),
                    Flexible(
                      flex: 2,
                      child: Text(
                        item.email,
                        style: TextStyle(
                          fontSize: 12.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
