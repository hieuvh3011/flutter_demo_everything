import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:show_off/route/app_route.dart';
import 'package:show_off/stores/counter_store/counter_store.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void goToDetails() {
    Navigator.of(context).pushNamed(AppRoute.DETAILS_SCREEN);
  }

  void goToZoom() {
    Navigator.of(context).pushNamed(AppRoute.ZOOM_SCREEN);
  }

  void goToCamera() {
    Navigator.of(context).pushNamed(AppRoute.TAKE_PICTURE_SCREEN);
  }

  void goToMap() {
    Navigator.of(context).pushNamed(AppRoute.MAP_SCREEN);
  }

  @override
  Widget build(BuildContext context) {
    print('rebuild setting_screen');
    // CounterStore _counterStore = Provider.of<CounterStore>(context);
    return Consumer<CounterStore>(
      builder: (context, _counterStore, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Setting Screen"),
          ),
          body: Container(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    '${_counterStore.counter}',
                    style: TextStyle(fontSize: 20.0, color: Colors.black87),
                  ),
                  GestureDetector(
                    onTap: () {
                      goToDetails();
                    },
                    child: Container(
                      width: 150,
                      height: 150,
                      child: Hero(
                        tag: 'image_of_crush',
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(200 / 2),
                          child: Image(
                            fit: BoxFit.cover,
                            image: AssetImage('lib/res/images/crush.jpg'),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      goToZoom();
                    },
                    child: Container(
                      width: 150,
                      height: 150,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(200 / 2),
                        child: Image(
                          fit: BoxFit.cover,
                          image: AssetImage('lib/res/images/min.jpg'),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    width: 150,
                    height: 50,
                    child: RaisedButton(
                      onPressed: () {
                        goToCamera();
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      color: Colors.lightBlue,
                      child: Text(
                        "Go to camera",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    width: 150,
                    height: 50,
                    child: RaisedButton(
                      onPressed: () {
                        goToMap();
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      color: Colors.lightBlue,
                      child: Text(
                        "Go to map",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
