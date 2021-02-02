import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class TakePictureScreen extends StatefulWidget {
  const TakePictureScreen({Key key}) : super(key: key);
  @override
  _TakePictureScreenState createState() => _TakePictureScreenState();
}

class _TakePictureScreenState extends State<TakePictureScreen> {
  CameraController _controller;
  Future<void> _initControllerFuture;
  bool _isCameraReady = false;
  CameraDescription _camera;

  Future<void> _initCamera() async {
    final cameras = await availableCameras();
    _camera = cameras.first;
    _controller = CameraController(_camera, ResolutionPreset.medium);
    _initControllerFuture = _controller.initialize();
    if (!mounted) {
      return;
    }
    setState(() {
      _isCameraReady = true;
    });
  }

  @override
  void initState() {
    super.initState();
    _initCamera();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final deviceRatio = size.width / size.height;
    return Scaffold(
      body: FutureBuilder(
        future: _initControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              _isCameraReady) {
            return Transform.scale(
              scale: _controller.value.aspectRatio / deviceRatio,
              child: Center(
                child: AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: CameraPreview(_controller), //cameraPreview
                ),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.camera_alt),
        onPressed: () async {
          try {
            await _initControllerFuture;
            final path = join(
              // Store the picture in the temp directory.
              // Find the temp directory using the `path_provider` plugin.
              (await getTemporaryDirectory()).path,
              '${DateTime.now()}.png',
            );

            // Attempt to take a picture and log where it's been saved.
            await _controller.takePicture();
            // If the picture was taken, display it on a new screen.
          } catch (e) {
            // If an error occurs, log the error to the console.
            print('taking picture exception = ' + e.toString());
            debugPrintStack();
          }
        },
      ),
    );
  }
}
