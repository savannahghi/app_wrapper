import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sil_app_wrapper/device_capabilities.dart';

import 'package:sil_app_wrapper/models/enums/enums.dart';
import 'package:sil_app_wrapper/sil_app_wrapper.dart';
import 'package:sil_app_wrapper/sil_app_wrapper_base.dart';
import 'package:sil_graphql_client/graph_client.dart';

import 'mocks.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  final SILGraphQlClient graphClient =
      SILGraphQlClient(token: 'token', url: 'url');

  final List<AppContext> appContexts = <AppContext>[AppContext.AppTest];

  testWidgets('should test silAppWrapper', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
        home: SILAppWrapper(
      appName: 'test',
      graphQLClient: graphClient,
      appContexts: appContexts,
      child: Container(),
    )));

    final Finder silAppWrapperKey = find.byKey(const Key('sil_app_wrapper'));
    expect(silAppWrapperKey, findsOneWidget);
  });

  group('silAppWrapperBase', () {
    testWidgets(
        'should check for silAppWrapperBase on widget tree and test for valid deviceCapabilities and screenType on method call',
        (WidgetTester tester) async {
      late IDeviceCapabilities deviceCapabilities;
      late DeviceScreenType screenType;

      await tester.pumpWidget(MaterialApp(
        home: SILAppWrapperBase(
          appName: 'test',
          graphQLClient: graphClient,
          appContexts: appContexts,
          deviceCapabilities: MockDeviceCapabilities(),
          child: Builder(builder: (BuildContext context) {
            deviceCapabilities =
                SILAppWrapperBase.of(context)!.deviceCapabilities;
            screenType =
                SILAppWrapperBase.of(context)!.deviceScreenType(context);
            return Container();
          }),
        ),
      ));

      expect(find.byType(SILAppWrapperBase), findsOneWidget);
      expect(deviceCapabilities, isA<IDeviceCapabilities>());
      expect(screenType, isA<DeviceScreenType>());
    });

    testWidgets('should check that silAppWrapperBase notifies dependants',
        (WidgetTester tester) async {
      final List<SILAppWrapperBase> log = <SILAppWrapperBase>[];

      final Builder builder = Builder(builder: (BuildContext context) {
        log.add(
            context.dependOnInheritedWidgetOfExactType<SILAppWrapperBase>()!);
        return Container();
      });

      final SILAppWrapperBase first = SILAppWrapperBase(
        appName: 'test',
        graphQLClient: graphClient,
        appContexts: appContexts,
        shouldNotify: false,
        deviceCapabilities: MockDeviceCapabilities(),
        child: builder,
      );
      await tester.pumpWidget(first);

      final SILAppWrapperBase second = SILAppWrapperBase(
        appName: 'test',
        graphQLClient: graphClient,
        appContexts: appContexts,
        shouldNotify: false,
        deviceCapabilities: MockDeviceCapabilities(),
        child: builder,
      );
      await tester.pumpWidget(second);

      expect(log, equals(<SILAppWrapperBase>[first]));

      final SILAppWrapperBase third = SILAppWrapperBase(
        appName: 'test',
        graphQLClient: graphClient,
        appContexts: appContexts,
        deviceCapabilities: MockDeviceCapabilities(),
        child: builder,
      );
      await tester.pumpWidget(third);

      expect(log, equals(<SILAppWrapperBase>[first, third]));
    });
  });
}
