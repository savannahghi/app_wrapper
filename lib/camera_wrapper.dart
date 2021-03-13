import 'package:camera/camera.dart';

abstract class ICamera {
  Future<List<CameraDescription>> cameras(
      Future<List<CameraDescription>> Function() fetchCameras) async {
    final List<CameraDescription> cameras = await fetchCameras();
    return cameras;
  }
}

class CameraWrapper extends ICamera {
  factory CameraWrapper() {
    return _singleton;
  }

  CameraWrapper._internal();

  static final CameraWrapper _singleton = CameraWrapper._internal();
}
