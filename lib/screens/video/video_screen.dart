import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

enum IconState {
  show,
  hide,
}

class VideoScreen extends StatefulWidget {
  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  String _motTrieuLike = 'lib/res/videos/mot_trieu_like.mp4';
  String _tanka = 'lib/res/videos/tanka.mp4';
  String _fakeNetworkLink =
      'http://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4';
  VideoPlayerController _videoController;
  IconState _iconState = IconState.show;
  int _currentVideoPlaying = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _videoController = VideoPlayerController.asset(_motTrieuLike)
      ..initialize().then((_) {
        _videoController.play();
        _hideIconsAfter5();
        setState(() {});
      }).catchError((onError) {
        print('onError while initialize Video Screen: ' + onError.toString());
        debugPrintStack();
      })..addListener(() {
        setState(() {
          _currentVideoPlaying = _videoController.value.position.inSeconds;
        });
      });
  }

  _hideIconsAfter5() {
    Future.delayed(Duration(seconds: 5), () {
      setState(() {
        _iconState = IconState.hide;
      });
    });
  }

  _showIcons() {
    setState(() {
      _iconState = IconState.show;
    });
  }

  _onPressPlayButton() {
    setState(() {
      _videoController.value.isPlaying
          ? _videoController.pause()
          : _videoController.play();
    });
    _hideIconsAfter5();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _videoController.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
    ]);
    print("_videoController = ${_videoController.value}");
    return OrientationBuilder(builder: (context, orientation) {
      if (orientation == Orientation.portrait) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Video Screen"),
          ),
          body: _videoController.value.initialized
              ? Container(
                  alignment: Alignment.topCenter,
                  child: _buildVideo(context, orientation),
                )
              : Container(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.lightBlue,
                  ),
                ),
        );
      }
      return _buildViewLandscape(context, orientation);
    });
  }

  Widget _buildVideo(BuildContext context, Orientation orientation) {
    double videoWidth = MediaQuery.of(context).size.width;
    double videoHeight = videoWidth * 9 / 16;
    if (orientation == Orientation.landscape) {
      videoHeight = MediaQuery.of(context).size.height;
    }
    return Column(
      children: [
        Stack(
          children: [
            GestureDetector(
              onTap: () {
                _showIcons();
                _hideIconsAfter5();
              },
              child: Container(
                width: videoWidth,
                height: videoHeight,
                child: VideoPlayer(
                  _videoController,
                ),
              ),
            ),
            _iconState == IconState.show
                ? AnimatedOpacity(
                    opacity: _iconState == IconState.show ? 1.0 : 0.0,
                    duration: Duration(seconds: 1),
                    child: Container(
                      width: videoWidth,
                      height: videoHeight,
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: () {
                          _onPressPlayButton();
                        },
                        child: Icon(
                          _videoController.value.isPlaying
                              ? Icons.pause
                              : Icons.play_arrow,
                          color: Colors.white,
                          size: 50.0,
                        ),
                      ),
                    ),
                  )
                : Container(),
            _iconState == IconState.show
                ? Positioned(
                    bottom: 10,
                    right: 10,
                    child: GestureDetector(
                      child: Icon(
                        Icons.aspect_ratio_outlined,
                        color: Colors.white,
                        size: 20.0,
                      ),
                    ),
                  )
                : Container(),
            _iconState == IconState.show
                ? Positioned(
                    bottom: 10,
                    right: 10,
                    left: 0,
                    child: Slider(
                      value: double.parse(_currentVideoPlaying.toString()),
                      min: 0,
                      max: 100,
                      onChanged: (double value) {
                        setState(() {
                          _currentVideoPlaying = int.parse(value.toString());
                        });
                      },
                    ),
                  )
                : Container()
          ],
        ),
      ],
    );
  }

  _buildViewLandscape(BuildContext context, Orientation orientation) {

    return _buildVideo(context, orientation);
  }
}
