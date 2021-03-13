import 'package:camera_platform_interface/src/types/camera_description.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:local_auth/local_auth.dart';
import 'package:sil_app_wrapper/camera_wrapper.dart';
import 'package:sil_app_wrapper/device_capabilities.dart';

import 'mocks.dart';

void main() {
  group('Device capabilities', () {
    test('should create valid instance of DeviceCapabilities', () async {
      final DeviceCapabilities device = DeviceCapabilities();
      expect(device, isA<DeviceCapabilities>());
    });

    test('should create valid instance of CameraWrapper ', () async {
      final CameraWrapper device = CameraWrapper();
      expect(device, isA<CameraWrapper>());
    });

    test('should get cameras from CameraWrapper ', () async {
      final CameraWrapper device = CameraWrapper();
      expect(device, isA<CameraWrapper>());
      final List<CameraDescription> cams = await device.cameras(fakeCameras);
      expect(cams.length, equals(1));
    });

    test('should return device capabilities as future', () async {
      final MockDeviceCapabilities device = MockDeviceCapabilities();
      final MockDeviceLocalAuthentication localAuthentication =
          MockDeviceLocalAuthentication();
      final Future<List<BiometricType>> bioMetrics = device
          .checkBiometrics<MockDeviceLocalAuthentication>(localAuthentication);

      expect(bioMetrics, isA<Future<List<BiometricType>>>());
    });

    test(
        'should return device capabilities as future from DeviceCapabilities class',
        () async {
      final MockDeviceLocalAuthentication localAuthentication =
          MockDeviceLocalAuthentication();

      final DeviceCapabilities device = DeviceCapabilities();

      final Future<List<BiometricType>> bioMetrics = device
          .checkBiometrics<MockDeviceLocalAuthentication>(localAuthentication);

      expect(bioMetrics, isA<Future<List<BiometricType>>>());
    });

    test('should return device cameras', () async {
      final MockDeviceCapabilities device = MockDeviceCapabilities();
      final MockCameraWrapper camsWrap = MockCameraWrapper();
      final bool hasCam =
          await device.checkCameras<MockCameraWrapper>(camsWrap);

      expect(hasCam, isA<bool>());
      expect(hasCam, equals(true));

      final List<CameraDescription> cams =
          await device.getCameras<MockCameraWrapper>(camsWrap);

      expect(cams.length, equals(1));
    });
  });
}
