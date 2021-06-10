import 'package:camera/camera.dart';
import 'package:local_auth/local_auth.dart';
import 'package:app_wrapper/sil_app_wrapper.dart';

class DeviceLocalAuthentication extends LocalAuthentication {}

mixin DeviceCapability {
  Future<List<BiometricType>> checkBiometrics<T extends LocalAuthentication>(
      T localAuthentication);
  Future<bool> checkCameras<T extends ICamera>(T wrapper);
  Future<List<CameraDescription>> getCameras<T extends ICamera>(T wrapper);
}

abstract class IDeviceCapabilities with DeviceCapability {
  @override
  Future<List<BiometricType>> checkBiometrics<T extends LocalAuthentication>(
      T localAuthentication) async {
    final List<BiometricType> availableBiometrics =
        await localAuthentication.getAvailableBiometrics();
    return availableBiometrics;
  }

// check if cameras are available in the device. if no cameras
// are available then the microphone is not available and vice versa
  @override
  Future<bool> checkCameras<T extends ICamera>(T wrapper) async {
    final List<CameraDescription> cameras =
        await wrapper.cameras(availableCameras);
    if (cameras.isNotEmpty) {
      return true;
    }
    return false;
  }

  @override
  Future<List<CameraDescription>> getCameras<T extends ICamera>(
      T wrapper) async {
    return wrapper.cameras(availableCameras);
  }
}

class DeviceCapabilities extends IDeviceCapabilities {
  factory DeviceCapabilities() {
    return _singleton;
  }

  DeviceCapabilities._internal();

  @override
  Future<List<BiometricType>>
      checkBiometrics<DeviceLocalAuthentication extends LocalAuthentication>(
          DeviceLocalAuthentication localAuthentication) async {
    return super
        .checkBiometrics<DeviceLocalAuthentication>(localAuthentication);
  }

  static final DeviceCapabilities _singleton = DeviceCapabilities._internal();
}
