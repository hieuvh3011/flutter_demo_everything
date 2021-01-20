import 'package:flutter/material.dart';
import 'package:show_off/screens/tab/screen1.dart';
import 'package:show_off/screens/tab/screen2.dart';

class TabContainer extends StatefulWidget {
  @override
  _TabContainerState createState() => _TabContainerState();
}

class _TabContainerState extends State<TabContainer>
    with TickerProviderStateMixin {
  int _tabIndex = 0;
  AnimationController _animationController;
  Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(1.5, 0.0),
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.elasticIn,
    ));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
  }

  void _goToTab(int index) {
    if (index != 0 && index != 1) {
      return;
    }
    if (_tabIndex != index) {
      setState(() {
        _tabIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[400],
        title: Text('Tab Container Screen'),
      ),
      body: WillPopScope(
        onWillPop: () async {
          if (Navigator.of(context).userGestureInProgress)
            return false;
          else
            return true;
        },
        child: Container(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              _buildTopBar(context),
              _buildContent(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return Container(
      height: 60.0,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 1,
            child: RawMaterialButton(
              onPressed: () {
                _goToTab(0);
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: _tabIndex == 0
                      ? Border(
                          bottom: BorderSide(width: 2, color: Colors.orange),
                        )
                      : null,
                ),
                child: Text(
                  'Screen 1',
                  style: _tabIndex == 0
                      ? TextStyle(fontSize: 16, color: Colors.orange)
                      : TextStyle(fontSize: 14),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: RawMaterialButton(
              onPressed: () {
                _goToTab(1);
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: _tabIndex == 1
                      ? Border(
                          bottom: BorderSide(width: 2, color: Colors.orange),
                        )
                      : null,
                ),
                child: Text(
                  'Screen 2',
                  style: _tabIndex == 1
                      ? TextStyle(fontSize: 16, color: Colors.orange)
                      : TextStyle(fontSize: 14),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildContent(context) {
    if (_tabIndex == 1) {
      return Expanded(
        child: Screen2(
          runToOtherTab: () {
            _goToTab(0);
          },
        ),
      );
    }
    return Expanded(
      child: Screen1(
        runToOtherTab: () {
          _goToTab(1);
        },
      ),
    );
  }
}
