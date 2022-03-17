import 'package:app_wrapper/app_wrapper.dart';
import 'package:camera/camera.dart';
import 'package:local_auth/local_auth.dart';

class MockDeviceCapabilities extends IDeviceCapabilities {}

class MockDeviceLocalAuthentication extends LocalAuthentication {
  @override
  Future<List<BiometricType>> getAvailableBiometrics() {
    return Future<List<BiometricType>>.value(
        <BiometricType>[BiometricType.face, BiometricType.fingerprint]);
  }
}

class MockCameraWrapper extends ICamera {
  @override
  Future<List<CameraDescription>> cameras(
      Future<List<CameraDescription>> Function() fakeCameras) async {
    final List<CameraDescription> cameras = <CameraDescription>[
      CameraDescription(
          name: 'camBack',
          lensDirection: CameraLensDirection.back,
          sensorOrientation: 90),
    ];
    return cameras;
  }
}

Future<List<CameraDescription>> fakeCameras() {
  final List<CameraDescription> cameras = <CameraDescription>[
    CameraDescription(
        name: 'camBack',
        lensDirection: CameraLensDirection.back,
        sensorOrientation: 90),
  ];
  return Future<List<CameraDescription>>.value(cameras);
}
