import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:local_auth/local_auth.dart';

import 'package:mockito/mockito.dart';
import 'package:sil_app_wrapper/models/enums/enums.dart';
import 'package:sil_app_wrapper/sil_app_wrapper.dart';

class MockDeviceCapabilities extends Mock implements DeviceCapabilities {}

class MockLocalAuth extends Mock implements LocalAuthentication {}

class MockCameraWrapper extends Mock implements CameraWrapper {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('should test silAppWrapper', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
        home: SILAppWrapper(
      appName: '',
      graphQLClient: null,
      httpClient: null,
      child: Container(),
      context: <AppContext>[AppContext.AppProd],
    )));
    Finder silAppWrapperKey = find.byKey(Key('sil_app_wrapper'));
    expect(silAppWrapperKey, findsOneWidget);
  });

  testWidgets('should test silAppWrapperBase null check',
      (WidgetTester tester) async {
    expect(() async {
      await tester.pumpWidget(MaterialApp(
        home: SILAppWrapper(
          appName: '',
          graphQLClient: null,
          httpClient: null,
          child: Container(),
          context: null,
        ),
      ));
    }, throwsAssertionError);
  });

  test('should return device capabilities as future', () {
    final MockDeviceCapabilities device = MockDeviceCapabilities();
    LocalAuthentication localAuthentication;
    when(device.checkBiometrics(localAuthentication)).thenAnswer((_) =>
        Future<List<BiometricType>>.value(
            <BiometricType>[BiometricType.face, BiometricType.fingerprint]));

    expect(device.checkBiometrics(localAuthentication),
        isA<Future<List<BiometricType>>>());
    expect(
        device.checkBiometrics(localAuthentication),
        completion(
            <BiometricType>[BiometricType.face, BiometricType.fingerprint]));
  });

  test('should call local auth when getting biometrics', () {
    final DeviceCapabilities device = DeviceCapabilities();
    final MockLocalAuth localAuth = MockLocalAuth();
    when(localAuth.getAvailableBiometrics()).thenAnswer((_) =>
        Future<List<BiometricType>>.value(
            <BiometricType>[BiometricType.face, BiometricType.fingerprint]));

    expect(
        device.checkBiometrics(localAuth), isA<Future<List<BiometricType>>>());
    verify(device.checkBiometrics(localAuth)).called(1);
    expect(
        device.checkBiometrics(localAuth),
        completion(
            <BiometricType>[BiometricType.face, BiometricType.fingerprint]));
  });

  test('should check if cameras are available', () {
    final DeviceCapabilities device = DeviceCapabilities();
    final MockCameraWrapper cams = MockCameraWrapper();
    when(cams.cameras).thenAnswer((_) => Future<List<CameraDescription>>.value(
        <CameraDescription>[CameraDescription()]));
    expect(device.checkCameras(cams), isA<Future<bool>>());
    expect(device.checkCameras(cams), completion(true));
  });

  test('should return null if cameras are not available', () {
    final DeviceCapabilities device = DeviceCapabilities();
    final MockCameraWrapper cams = MockCameraWrapper();
    when(cams.cameras).thenAnswer(
        (_) => Future<List<CameraDescription>>.value(<CameraDescription>[]));
    expect(device.getCameras(cams), completion(null));
  });

  test('should return cameras if camera(s) is/are not available', () {
    final DeviceCapabilities device = DeviceCapabilities();
    final MockCameraWrapper cams = MockCameraWrapper();
    when(cams.cameras).thenAnswer((_) => Future<List<CameraDescription>>.value(
        <CameraDescription>[CameraDescription()]));
    expect(device.getCameras(cams), completion(<dynamic>[CameraDescription()]));
  });

  test('camera wrapper should fail', () {
    CameraWrapper wrap = CameraWrapper();
    expect(() => wrap.cameras, throwsException);
  });

  group('silAppWrapperBase', () {
    testWidgets(
        'should check for silAppWrapperBase on widget tree and test for valid deviceCapabilities and screenType on method call',
        (WidgetTester tester) async {
      DeviceCapabilities deviceCapabilities;
      DeviceScreenType screenType;

      await tester.pumpWidget(MaterialApp(
        home: SILAppWrapperBase(
          appName: '',
          graphQLClient: null,
          httpClient: null,
          child: Builder(builder: (BuildContext context) {
            deviceCapabilities =
                SILAppWrapperBase.of(context).deviceCapabilities;
            screenType =
                SILAppWrapperBase.of(context).deviceScreenType(context);
            return Container();
          }),
          context: <AppContext>[AppContext.AppProd],
        ),
      ));

      expect(find.byType(SILAppWrapperBase), findsOneWidget);
      expect(deviceCapabilities, isA<DeviceCapabilities>());
      expect(screenType, isA<DeviceScreenType>());
    });

    testWidgets('should check that silAppWrapperBase notifies dependants',
        (WidgetTester tester) async {
      final List<SILAppWrapperBase> log = <SILAppWrapperBase>[];

      final Builder builder = Builder(builder: (BuildContext context) {
        log.add(
            context.dependOnInheritedWidgetOfExactType<SILAppWrapperBase>());
        return Container();
      });

      final SILAppWrapperBase first = SILAppWrapperBase(
        appName: '',
        graphQLClient: null,
        httpClient: null,
        child: builder,
        context: <AppContext>[AppContext.AppProd],
      );
      await tester.pumpWidget(first);

      final SILAppWrapperBase second = SILAppWrapperBase(
        appName: '',
        graphQLClient: null,
        httpClient: null,
        child: builder,
        context: <AppContext>[AppContext.AppProd],
        shouldNotify: false,
      );
      await tester.pumpWidget(second);

      expect(log, equals(<SILAppWrapperBase>[first]));

      final SILAppWrapperBase third = SILAppWrapperBase(
        appName: '',
        graphQLClient: null,
        httpClient: null,
        child: builder,
        context: <AppContext>[AppContext.AppProd],
        shouldNotify: true,
      );
      await tester.pumpWidget(third);

      expect(log, equals(<SILAppWrapperBase>[first, third]));
    });

    testWidgets('should test silAppWrapperBase null check',
        (WidgetTester tester) async {
      expect(() async {
        await tester.pumpWidget(MaterialApp(
          home: SILAppWrapperBase(
            appName: '',
            graphQLClient: null,
            httpClient: null,
            child: Container(),
            context: null,
          ),
        ));
      }, throwsAssertionError);
    });
  });
}
