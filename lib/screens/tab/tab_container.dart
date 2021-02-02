import 'package:flutter/material.dart';
import 'package:show_off/screens/tab/screen1.dart';
import 'package:show_off/screens/tab/screen2.dart';

class TabContainer extends StatefulWidget {
  @override
  _TabContainerState createState() => _TabContainerState();
}

class _TabContainerState extends State<TabContainer> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.black54,
          ),
          title: Text(
            'Tab Container Screen',
            style: TextStyle(color: Colors.black54),
          ),
          bottom: TabBar(
            indicatorColor: Colors.orange,
            labelColor: Colors.orange,
            unselectedLabelColor: Colors.black54,
            tabs: [
              Tab(
                text: "Screen 1",
              ),
              Tab(
                text: "Screen 2",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Screen1(),
            Screen2(),
          ],
        ),
      ),
    );
  }
}
