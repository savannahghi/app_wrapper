import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sil_app_wrapper/generic_fetch_function.dart';

import 'package:sil_app_wrapper/sil_app_wrapper.dart' as wrapper;

// Different expected Responses from SimpleCall
Map<String, dynamic> successfulResponse = <String, dynamic>{
  'statusCode': '200',
};
Map<String, dynamic> errorResponse = <String, dynamic>{
  'error': 'error occured',
};
Map<String, dynamic> timeoutResponse = <String, dynamic>{
  'statusCode': 408,
};

// Events that can be emitted by the genericFetchFunction
Map<String, dynamic> loadingEvent = <String, dynamic>{
  'loading': true,
};
Map<String, dynamic> errorEvent = <String, dynamic>{
  'error': errorResponse['error'],
};
Map<String, dynamic> timeOutEvent = <String, dynamic>{
  'error': 'timeout',
};

Future<Map<String, dynamic>> mockSuccessfulSimpleCallType({
  dynamic graphClient,
  dynamic querystring,
  dynamic variables,
  BuildContext context,
}) async =>
    await successfulResponse;

Future<Map<String, dynamic>> mockSimpleCallErrorType({
  dynamic graphClient,
  dynamic querystring,
  dynamic variables,
  BuildContext context,
}) async {
  return await errorResponse;
}

Future<Map<String, dynamic>> mockSimpleCallTimeOut({
  dynamic graphClient,
  dynamic querystring,
  dynamic variables,
  BuildContext context,
}) async {
  return await timeoutResponse;
}

void mockTraceLogType({
  dynamic client,
  dynamic query,
  dynamic data,
  dynamic response,
  String title,
  String description,
  BuildContext context,
}) {}

void main() {
  group('genericFetchFunction Tests', () {
    testWidgets('stream emissions without timeouts and errors if successful',
        (WidgetTester tester) async {
      StreamController<dynamic> controller = StreamController<dynamic>();

      await tester.pumpWidget(MaterialApp(
        home: wrapper.SILAppWrapper(
          context: <wrapper.AppContext>[wrapper.AppContext.AppProd],
          appName: '',
          graphQLClient: '',
          httpClient: '',
          child: Builder(builder: (BuildContext context) {
            genericFetchFunction(
              streamController: controller,
              context: context,
              queryString: '',
              variables: <String, dynamic>{},
              logTitle: '',
              traceLogFunc: mockTraceLogType,
              simpleCallFunc: mockSuccessfulSimpleCallType,
            );
            return Container();
          }),
        ),
      ));

      expect(
          controller.stream,
          emitsInOrder(<Map<String, dynamic>>[
            <String, dynamic>{'loading': true},
            successfulResponse,
          ]));

      await tester.pumpAndSettle();
    });

    testWidgets('stream should emit error event when there is an error',
        (WidgetTester tester) async {
      StreamController<dynamic> controller = StreamController<dynamic>();

      await tester.pumpWidget(
        MaterialApp(
          home: wrapper.SILAppWrapper(
            context: <wrapper.AppContext>[wrapper.AppContext.AppProd],
            appName: '',
            graphQLClient: '',
            httpClient: '',
            child: Builder(
              builder: (BuildContext context) {
                return RawMaterialButton(
                  onPressed: () {
                    genericFetchFunction(
                      streamController: controller,
                      context: context,
                      queryString: '',
                      variables: <String, dynamic>{},
                      logTitle: '',
                      traceLogFunc: mockTraceLogType,
                      simpleCallFunc: mockSimpleCallErrorType,
                    );
                  },
                );
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byType(RawMaterialButton));

      await expectLater(
        await controller.stream.last.asStream(),
        emitsError(errorEvent),
      );

      await tester.pumpAndSettle();
    });

    testWidgets('stream should emit timeout event when there is a timeout',
        (WidgetTester tester) async {
      StreamController<dynamic> controller = StreamController<dynamic>();

      await tester.pumpWidget(
        MaterialApp(
          home: wrapper.SILAppWrapper(
            context: <wrapper.AppContext>[wrapper.AppContext.AppProd],
            appName: '',
            graphQLClient: '',
            httpClient: '',
            child: Builder(
              builder: (BuildContext context) {
                return RawMaterialButton(
                  onPressed: () {
                    genericFetchFunction(
                      streamController: controller,
                      context: context,
                      queryString: '',
                      variables: null,
                      logTitle: '',
                      traceLogFunc: mockTraceLogType,
                      simpleCallFunc: mockSimpleCallTimeOut,
                    );
                  },
                );
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byType(RawMaterialButton));

      await tester.pumpAndSettle();

      await expectLater(
        await controller.stream.last.asStream(),
        emitsError(timeOutEvent),
      );

      await tester.pumpAndSettle();
    });
  });
}
