import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:local_auth/local_auth.dart';

import 'package:mockito/mockito.dart';
import 'package:sil_app_wrapper/sil_app_wrapper.dart' as wrapper;

class MockDeviceCapabilities extends Mock
    implements wrapper.DeviceCapabilities {}

class MockLocalAuth extends Mock implements LocalAuthentication {}

class MockCameraWrapper extends Mock implements wrapper.CameraWrapper {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('should test silAppWrapper', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
        home: wrapper.SILAppWrapper(
      appName: '',
      graphQLClient: '',
      httpClient: '',
      child: Container(),
      context: <wrapper.AppContext>[wrapper.AppContext.AppProd],
    )));
    Finder silAppWrapperKey = find.byKey(Key('sil_app_wrapper'));
    expect(silAppWrapperKey, findsOneWidget);
  });

  testWidgets('should test silAppWrapperBase null check',
      (WidgetTester tester) async {
    expect(() async {
      await tester.pumpWidget(MaterialApp(
        home: wrapper.SILAppWrapper(
          appName: '',
          graphQLClient: '',
          httpClient: '',
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
    final wrapper.DeviceCapabilities device = wrapper.DeviceCapabilities();
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

  test('should check if camaras are available', () {
    final wrapper.DeviceCapabilities device = wrapper.DeviceCapabilities();
    final MockCameraWrapper cams = MockCameraWrapper();
    when(cams.cameras).thenAnswer((_) => Future<List<CameraDescription>>.value(
        <CameraDescription>[CameraDescription()]));
    expect(device.checkCameras(cams), isA<Future<bool>>());
    expect(device.checkCameras(cams), completion(true));
  });

  test('should return null if camaras are not available', () {
    final wrapper.DeviceCapabilities device = wrapper.DeviceCapabilities();
    final MockCameraWrapper cams = MockCameraWrapper();
    when(cams.cameras).thenAnswer(
        (_) => Future<List<CameraDescription>>.value(<CameraDescription>[]));
    expect(device.getCameras(cams), completion(null));
  });

  test('should return camaras if camera(s) is/are noavailable', () {
    final wrapper.DeviceCapabilities device = wrapper.DeviceCapabilities();
    final MockCameraWrapper cams = MockCameraWrapper();
    when(cams.cameras).thenAnswer((_) => Future<List<CameraDescription>>.value(
        <CameraDescription>[CameraDescription()]));
    expect(device.getCameras(cams), completion(<dynamic>[CameraDescription()]));
  });

  test('camera wrapper should fail', () {
    wrapper.CameraWrapper wrap = wrapper.CameraWrapper();
    expect(() => wrap.cameras, throwsException);
  });

  group('silAppWrapperBase', () {
    testWidgets(
        'should check for silAppWrapperBase on widget tree and test for valid deviceCapabilities and screenType on method call',
        (WidgetTester tester) async {
      wrapper.DeviceCapabilities deviceCapabillities;
      wrapper.DeviceScreenType screenType;

      await tester.pumpWidget(MaterialApp(
        home: wrapper.SILAppWrapperBase(
          appName: '',
          graphQLClient: '',
          httpClient: '',
          child: Builder(builder: (BuildContext context) {
            deviceCapabillities =
                wrapper.SILAppWrapperBase.of(context).deviceCapabilities;
            screenType =
                wrapper.SILAppWrapperBase.of(context).deviceScreenType(context);
            return Container();
          }),
          context: <wrapper.AppContext>[wrapper.AppContext.AppProd],
        ),
      ));

      expect(find.byType(wrapper.SILAppWrapperBase), findsOneWidget);
      expect(deviceCapabillities, isA<wrapper.DeviceCapabilities>());
      expect(screenType, isA<wrapper.DeviceScreenType>());
    });

    testWidgets('should check that silAppWrapperBase notifies dependants',
        (WidgetTester tester) async {
      final List<wrapper.SILAppWrapperBase> log = <wrapper.SILAppWrapperBase>[];

      final Builder builder = Builder(builder: (BuildContext context) {
        log.add(context
            .dependOnInheritedWidgetOfExactType<wrapper.SILAppWrapperBase>());
        return Container();
      });

      final wrapper.SILAppWrapperBase first = wrapper.SILAppWrapperBase(
        appName: '',
        graphQLClient: '',
        httpClient: '',
        child: builder,
        context: <wrapper.AppContext>[wrapper.AppContext.AppProd],
      );
      await tester.pumpWidget(first);

      final wrapper.SILAppWrapperBase second = wrapper.SILAppWrapperBase(
        appName: '',
        graphQLClient: '',
        httpClient: '',
        child: builder,
        context: <wrapper.AppContext>[wrapper.AppContext.AppProd],
        shouldNotify: false,
      );
      await tester.pumpWidget(second);

      expect(log, equals(<wrapper.SILAppWrapperBase>[first]));

      final wrapper.SILAppWrapperBase third = wrapper.SILAppWrapperBase(
        appName: '',
        graphQLClient: '',
        httpClient: '',
        child: builder,
        context: <wrapper.AppContext>[wrapper.AppContext.AppProd],
        shouldNotify: true,
      );
      await tester.pumpWidget(third);

      expect(log, equals(<wrapper.SILAppWrapperBase>[first, third]));
    });

    testWidgets('should test silAppWrapperBase null check',
        (WidgetTester tester) async {
      expect(() async {
        await tester.pumpWidget(MaterialApp(
          home: wrapper.SILAppWrapperBase(
            appName: '',
            graphQLClient: '',
            httpClient: '',
            child: Container(),
            context: null,
          ),
        ));
      }, throwsAssertionError);
    });
  });
}
